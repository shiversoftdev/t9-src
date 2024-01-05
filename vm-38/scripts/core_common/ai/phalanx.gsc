#using scripts\core_common\values_shared.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

class phalanx 
{
	var scattered_;
	var sentienttiers_;
	var endposition_;
	var startposition_;
	var phalanxtype_;
	var startsentientcount_;
	var currentsentientcount_;
	var breakingpoint_;

	/*
		Name: constructor
		Namespace: phalanx
		Checksum: 0x84185AA3
		Offset: 0x1880
		Size: 0x3E
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.sentienttiers_ = [];
		self.startsentientcount_ = 0;
		self.currentsentientcount_ = 0;
		self.breakingpoint_ = 0;
		self.scattered_ = 0;
	}

	/*
		Name: destructor
		Namespace: phalanx
		Checksum: 0x80F724D1
		Offset: 0x18C8
		Size: 0x4
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

	/*
		Name: _haltfire
		Namespace: phalanx
		Checksum: 0x986AE88D
		Offset: 0xF40
		Size: 0xF0
		Parameters: 1
		Flags: Linked, Private
	*/
	function private _haltfire(sentients)
	{
		/#
			assert(isarray(sentients));
		#/
		foreach(sentient in sentients)
		{
			if(isdefined(sentient) && isalive(sentient))
			{
				sentient val::set(#"halt_fire", "ignoreall", 1);
			}
		}
	}

	/*
		Name: _initializesentient
		Namespace: phalanx
		Checksum: 0x62E8A64D
		Offset: 0x1038
		Size: 0x12C
		Parameters: 1
		Flags: Linked
	*/
	function _initializesentient(sentient)
	{
		/#
			assert(isactor(sentient));
		#/
		sentient ai::set_behavior_attribute("phalanx", 1);
		if(sentient.archetype === "human")
		{
			sentient.allowpain = 0;
		}
		sentient setavoidancemask("avoid none");
		if(isdefined(sentient.archetype) && sentient.archetype == #"robot")
		{
			sentient ai::set_behavior_attribute("move_mode", "marching");
			sentient ai::set_behavior_attribute("force_cover", 1);
		}
		aiutility::addaioverridedamagecallback(sentient, &_dampenexplosivedamage, 1);
	}

	/*
		Name: _dampenexplosivedamage
		Namespace: phalanx
		Checksum: 0xCF96C158
		Offset: 0x500
		Size: 0x1A0
		Parameters: 13
		Flags: Linked, Private
	*/
	function private _dampenexplosivedamage(inflictor, attacker, damage, flags, meansofdamage, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
	{
		entity = self;
		isexplosive = isinarray(array("MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE"), boneindex);
		if(isexplosive && isdefined(hitloc) && isdefined(hitloc.weapon))
		{
			modelindex = hitloc.weapon;
			distancetoentity = distance(entity.origin, hitloc.origin);
			fractiondistance = 1;
			if(modelindex.explosionradius > 0)
			{
				fractiondistance = (modelindex.explosionradius - distancetoentity) / modelindex.explosionradius;
			}
			return int(max(offsettime * fractiondistance, 1));
		}
		return offsettime;
	}

	/*
		Name: _movephalanxtier
		Namespace: phalanx
		Checksum: 0x12B7E773
		Offset: 0x1170
		Size: 0x1F8
		Parameters: 5
		Flags: Linked, Private
	*/
	function private _movephalanxtier(sentients, phalanxtype, tier, destination, forward)
	{
		positions = _getphalanxpositions(phalanxtype, tier);
		angles = vectortoangles(forward);
		/#
			assert(sentients.size <= positions.size, "");
		#/
		foreach(index, sentient in sentients)
		{
			if(isdefined(sentient) && isalive(sentient))
			{
				/#
					assert(isvec(positions[index]), (((("" + index) + "") + tier) + "") + phalanxtype);
				#/
				orientedpos = _rotatevec(positions[index], angles[1] - 90);
				navmeshposition = getclosestpointonnavmesh(destination + orientedpos, 200);
				sentient function_a57c34b7(navmeshposition);
			}
		}
	}

	/*
		Name: _rotatevec
		Namespace: phalanx
		Checksum: 0x8DC302A3
		Offset: 0x17B0
		Size: 0x98
		Parameters: 2
		Flags: Linked, Private
	*/
	function private _rotatevec(vector, angle)
	{
		return ((vector[0] * cos(angle)) - (vector[1] * sin(angle)), (vector[0] * sin(angle)) + (vector[1] * cos(angle)), vector[2]);
	}

	/*
		Name: resumeadvance
		Namespace: phalanx
		Checksum: 0x1B8A1308
		Offset: 0x1ED0
		Size: 0x164
		Parameters: 0
		Flags: Linked
	*/
	function resumeadvance()
	{
		if(!scattered_)
		{
			_assignphalanxstance(sentienttiers_[#"phalanx_tier1"], "stand");
			wait(1);
			forward = vectornormalize(endposition_ - startposition_);
			_movephalanxtier(sentienttiers_[#"phalanx_tier1"], phalanxtype_, "phalanx_tier1", endposition_, forward);
			_movephalanxtier(sentienttiers_[#"phalanx_tier2"], phalanxtype_, "phalanx_tier2", endposition_, forward);
			_movephalanxtier(sentienttiers_[#"phalanx_tier3"], phalanxtype_, "phalanx_tier3", endposition_, forward);
			_assignphalanxstance(sentienttiers_[#"phalanx_tier1"], "crouch");
		}
	}

	/*
		Name: _createphalanxtier
		Namespace: phalanx
		Checksum: 0xF12FFF6E
		Offset: 0x2E8
		Size: 0x20E
		Parameters: 6
		Flags: Linked, Private
	*/
	function private _createphalanxtier(phalanxtype, tier, phalanxposition, forward, maxtiersize, spawner)
	{
		if(!isdefined(spawner))
		{
			spawner = undefined;
		}
		sentients = [];
		if(!isspawner(spawner))
		{
			spawner = _getphalanxspawner(tier);
		}
		positions = _getphalanxpositions(phalanxtype, tier);
		angles = vectortoangles(forward);
		foreach(position in positions)
		{
			if(index >= maxtiersize)
			{
				break;
			}
			orientedpos = _rotatevec(position, angles[1] - 90);
			navmeshposition = getclosestpointonnavmesh(phalanxposition + orientedpos, 200);
			if(!spawner.spawnflags & 64)
			{
				spawner.count++;
			}
			sentient = spawner spawner::spawn(1, "", navmeshposition, angles);
			_initializesentient(sentient);
			waitframe(1);
			sentients[sentients.size] = sentient;
		}
		return sentients;
	}

	/*
		Name: initialize
		Namespace: phalanx
		Checksum: 0x201C3CB
		Offset: 0x1B18
		Size: 0x3AC
		Parameters: 8
		Flags: Linked
	*/
	function initialize(phalanxtype, origin, destination, breakingpoint, maxtiersize, tieronespawner, tiertwospawner, tierthreespawner)
	{
		if(!isdefined(maxtiersize))
		{
			maxtiersize = 10;
		}
		if(!isdefined(tieronespawner))
		{
			tieronespawner = undefined;
		}
		if(!isdefined(tiertwospawner))
		{
			tiertwospawner = undefined;
		}
		if(!isdefined(tierthreespawner))
		{
			tierthreespawner = undefined;
		}
		/#
			assert(isstring(phalanxtype));
		#/
		/#
			assert(isint(breakingpoint));
		#/
		/#
			assert(isvec(origin));
		#/
		/#
			assert(isvec(destination));
		#/
		tierspawners = [];
		tierspawners[#"phalanx_tier1"] = tieronespawner;
		tierspawners[#"phalanx_tier2"] = tiertwospawner;
		tierspawners[#"phalanx_tier3"] = tierthreespawner;
		maxtiersize = math::clamp(maxtiersize, 1, 10);
		forward = vectornormalize(destination - origin);
		foreach(tiername in array("phalanx_tier1", "phalanx_tier2", "phalanx_tier3"))
		{
			self.sentienttiers_[tiername] = _createphalanxtier(phalanxtype, tiername, origin, forward, maxtiersize, tierspawners[tiername]);
			self.startsentientcount_ = startsentientcount_ + sentienttiers_[tiername].size;
		}
		_assignphalanxstance(sentienttiers_[#"phalanx_tier1"], "crouch");
		foreach(tier in sentienttiers_)
		{
			_movephalanxtier(sentienttiers_[name], phalanxtype, name, destination, forward);
		}
		self.breakingpoint_ = breakingpoint;
		self.startposition_ = origin;
		self.endposition_ = destination;
		self.phalanxtype_ = phalanxtype;
		self thread _updatephalanxthread(self);
	}

	/*
		Name: haltadvance
		Namespace: phalanx
		Checksum: 0xAE4A4EB
		Offset: 0x1A80
		Size: 0x90
		Parameters: 0
		Flags: Linked
	*/
	function haltadvance()
	{
		if(!scattered_)
		{
			foreach(tier in sentienttiers_)
			{
				_haltadvance(tier);
			}
		}
	}

	/*
		Name: _getphalanxpositions
		Namespace: phalanx
		Checksum: 0x7EEE00D7
		Offset: 0x6A8
		Size: 0x694
		Parameters: 2
		Flags: Linked, Private
	*/
	function private _getphalanxpositions(phalanxtype, tier)
	{
		switch(phalanxtype)
		{
			case "phanalx_wedge":
			{
				switch(tier)
				{
					case "phalanx_tier1":
					{
						return array((0, 0, 0), (-64, -48, 0), (64, -48, 0), (-128, -96, 0), (128, -96, 0));
					}
					case "phalanx_tier2":
					{
						return array((-32, -96, 0), (32, -96, 0));
					}
					case "phalanx_tier3":
					{
						return array();
					}
				}
				break;
			}
			case "phalanx_reverse_wedge":
			{
				switch(tier)
				{
					case "phalanx_tier1":
					{
						return array(vectorscale((-1, 0, 0), 32), vectorscale((1, 0, 0), 32));
					}
					case "phalanx_tier2":
					{
						return array(vectorscale((0, -1, 0), 96));
					}
					case "phalanx_tier3":
					{
						return array();
					}
				}
				break;
			}
			case "phalanx_diagonal_left":
			{
				switch(tier)
				{
					case "phalanx_tier1":
					{
						return array((0, 0, 0), (-48, -64, 0), (-96, -128, 0), (-144, -192, 0));
					}
					case "phalanx_tier2":
					{
						return array(vectorscale((1, 0, 0), 64), (16, -64, 0), (-48, -128, 0), (-112, -192, 0));
					}
					case "phalanx_tier3":
					{
						return array();
					}
				}
				break;
			}
			case "phalanx_diagonal_right":
			{
				switch(tier)
				{
					case "phalanx_tier1":
					{
						return array((0, 0, 0), (48, -64, 0), (96, -128, 0), (144, -192, 0));
					}
					case "phalanx_tier2":
					{
						return array(vectorscale((-1, 0, 0), 64), (-16, -64, 0), (48, -128, 0), (112, -192, 0));
					}
					case "phalanx_tier3":
					{
						return array();
					}
				}
				break;
			}
			case "phalanx_forward":
			{
				switch(tier)
				{
					case "phalanx_tier1":
					{
						return array((0, 0, 0), vectorscale((1, 0, 0), 64), vectorscale((1, 0, 0), 128), vectorscale((1, 0, 0), 192));
					}
					case "phalanx_tier2":
					{
						return array((-32, -64, 0), (32, -64, 0), (96, -64, 0), (160, -64, 0));
					}
					case "phalanx_tier3":
					{
						return array();
					}
				}
				break;
			}
			case "phalanx_column":
			{
				switch(tier)
				{
					case "phalanx_tier1":
					{
						return array((0, 0, 0), vectorscale((-1, 0, 0), 64), vectorscale((0, -1, 0), 64), vectorscale((-1, -1, 0), 64));
					}
					case "phalanx_tier2":
					{
						return array(vectorscale((0, -1, 0), 128), (-64, -128, 0), vectorscale((0, -1, 0), 192), (-64, -192, 0));
					}
					case "phalanx_tier3":
					{
						return array(vectorscale((1, 0, 0), 64), vectorscale((1, -1, 0), 64), (64, -128, 0), (64, -192, 0));
					}
				}
				break;
			}
			case "phalanx_column_right":
			{
				switch(tier)
				{
					case "phalanx_tier1":
					{
						return array((0, 0, 0), vectorscale((0, -1, 0), 64), vectorscale((0, -1, 0), 128), vectorscale((0, -1, 0), 192));
					}
					case "phalanx_tier2":
					{
						return array();
					}
					case "phalanx_tier3":
					{
						return array();
					}
				}
				break;
			}
			default:
			{
				/#
					assert(("" + phalanxtype) + "");
				#/
			}
		}
		/#
			assert(("" + tier) + "");
		#/
	}

	/*
		Name: _updatephalanxthread
		Namespace: phalanx
		Checksum: 0x59DD4898
		Offset: 0x1850
		Size: 0x28
		Parameters: 1
		Flags: Linked, Private
	*/
	function private _updatephalanxthread(phalanx)
	{
		while([[ phalanx ]]->_updatephalanx())
		{
			wait(1);
		}
	}

	/*
		Name: haltfire
		Namespace: phalanx
		Checksum: 0xA5E3F7BD
		Offset: 0x19F0
		Size: 0x88
		Parameters: 0
		Flags: Linked
	*/
	function haltfire()
	{
		foreach(tier in sentienttiers_)
		{
			_haltfire(tier);
		}
	}

	/*
		Name: resumefire
		Namespace: phalanx
		Checksum: 0x89EED7BA
		Offset: 0x2040
		Size: 0x7C
		Parameters: 0
		Flags: Linked
	*/
	function resumefire()
	{
		_resumefiresentients(sentienttiers_[#"phalanx_tier1"]);
		_resumefiresentients(sentienttiers_[#"phalanx_tier2"]);
		_resumefiresentients(sentienttiers_[#"phalanx_tier3"]);
	}

	/*
		Name: _getphalanxspawner
		Namespace: phalanx
		Checksum: 0xBEB69C5D
		Offset: 0xD48
		Size: 0xB2
		Parameters: 1
		Flags: Linked, Private
	*/
	function private _getphalanxspawner(tier)
	{
		spawner = getspawnerarray(tier, "targetname");
		/#
			assert(spawner.size >= 0, ("" + "") + "");
		#/
		/#
			assert(spawner.size == 1, ("" + "") + "");
		#/
		return spawner[0];
	}

	/*
		Name: _releasesentient
		Namespace: phalanx
		Checksum: 0xABEC392C
		Offset: 0x1430
		Size: 0x17C
		Parameters: 1
		Flags: Linked, Private
	*/
	function private _releasesentient(sentient)
	{
		if(isdefined(sentient) && isalive(sentient))
		{
			sentient function_d4c687c9();
			sentient pathmode("move delayed", 1, randomfloatrange(0.5, 1));
			sentient ai::set_behavior_attribute("phalanx", 0);
			waitframe(1);
			if(sentient.archetype === "human")
			{
				sentient.allowpain = 1;
			}
			sentient setavoidancemask("avoid all");
			aiutility::removeaioverridedamagecallback(sentient, &_dampenexplosivedamage);
			if(isdefined(sentient.archetype) && sentient.archetype == #"robot")
			{
				sentient ai::set_behavior_attribute("move_mode", "normal");
				sentient ai::set_behavior_attribute("force_cover", 0);
			}
		}
	}

	/*
		Name: _assignphalanxstance
		Namespace: phalanx
		Checksum: 0xFC18DCE5
		Offset: 0x1F8
		Size: 0xE8
		Parameters: 2
		Flags: Linked, Private
	*/
	function private _assignphalanxstance(sentients, stance)
	{
		/#
			assert(isarray(sentients));
		#/
		foreach(sentient in sentients)
		{
			if(isdefined(sentient) && isalive(sentient))
			{
				sentient ai::set_behavior_attribute("phalanx_force_stance", stance);
			}
		}
	}

	/*
		Name: _updatephalanx
		Namespace: phalanx
		Checksum: 0xDF57F1D0
		Offset: 0x18D8
		Size: 0x10C
		Parameters: 0
		Flags: Linked, Private
	*/
	function private _updatephalanx()
	{
		if(scattered_)
		{
			return false;
		}
		self.currentsentientcount_ = 0;
		foreach(name, tier in sentienttiers_)
		{
			self.sentienttiers_[name] = _prunedead(tier);
			self.currentsentientcount_ = currentsentientcount_ + sentienttiers_[name].size;
		}
		if(currentsentientcount_ <= (startsentientcount_ - breakingpoint_))
		{
			scatterphalanx();
			return false;
		}
		return true;
	}

	/*
		Name: _resumefire
		Namespace: phalanx
		Checksum: 0x151B6602
		Offset: 0x1688
		Size: 0x5C
		Parameters: 1
		Flags: Linked, Private
	*/
	function private _resumefire(sentient)
	{
		if(isdefined(sentient) && isalive(sentient))
		{
			sentient val::reset(#"halt_fire", "ignoreall");
		}
	}

	/*
		Name: _prunedead
		Namespace: phalanx
		Checksum: 0x6D3E736
		Offset: 0x1370
		Size: 0xB2
		Parameters: 1
		Flags: Linked, Private
	*/
	function private _prunedead(sentients)
	{
		livesentients = [];
		foreach(sentient in sentients)
		{
			if(isdefined(sentient) && isalive(sentient))
			{
				livesentients[index] = sentient;
			}
		}
		return livesentients;
	}

	/*
		Name: scatterphalanx
		Namespace: phalanx
		Checksum: 0x28B15243
		Offset: 0x20C8
		Size: 0x16C
		Parameters: 0
		Flags: Linked
	*/
	function scatterphalanx()
	{
		if(!scattered_)
		{
			self.scattered_ = 1;
			_releasesentients(sentienttiers_[#"phalanx_tier1"]);
			self.sentienttiers_[#"phalanx_tier1"] = [];
			_assignphalanxstance(sentienttiers_[#"phalanx_tier2"], "crouch");
			wait(randomfloatrange(5, 7));
			_releasesentients(sentienttiers_[#"phalanx_tier2"]);
			self.sentienttiers_[#"phalanx_tier2"] = [];
			_assignphalanxstance(sentienttiers_[#"phalanx_tier3"], "crouch");
			wait(randomfloatrange(5, 7));
			_releasesentients(sentienttiers_[#"phalanx_tier3"]);
			self.sentienttiers_[#"phalanx_tier3"] = [];
		}
	}

	/*
		Name: _releasesentients
		Namespace: phalanx
		Checksum: 0x481C50E4
		Offset: 0x15B8
		Size: 0xC8
		Parameters: 1
		Flags: Linked, Private
	*/
	function private _releasesentients(sentients)
	{
		foreach(sentient in sentients)
		{
			_resumefire(sentient);
			_releasesentient(sentient);
			wait(randomfloatrange(0.5, 5));
		}
	}

	/*
		Name: _haltadvance
		Namespace: phalanx
		Checksum: 0xC1A56656
		Offset: 0xE08
		Size: 0x130
		Parameters: 1
		Flags: Linked, Private
	*/
	function private _haltadvance(sentients)
	{
		/#
			assert(isarray(sentients));
		#/
		foreach(sentient in sentients)
		{
			if(isdefined(sentient) && isalive(sentient) && sentient haspath())
			{
				navmeshposition = getclosestpointonnavmesh(sentient.origin, 200);
				sentient function_a57c34b7(navmeshposition);
				sentient clearpath();
			}
		}
	}

	/*
		Name: _resumefiresentients
		Namespace: phalanx
		Checksum: 0x3606B9DD
		Offset: 0x16F0
		Size: 0xB8
		Parameters: 1
		Flags: Linked, Private
	*/
	function private _resumefiresentients(sentients)
	{
		/#
			assert(isarray(sentients));
		#/
		foreach(sentient in sentients)
		{
			_resumefire(sentient);
		}
	}

}

/*
	Name: function_ca3ff97c
	Namespace: phalanx
	Checksum: 0x2DABB289
	Offset: 0x1D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ca3ff97c()
{
	level notify(-1848598038);
}

