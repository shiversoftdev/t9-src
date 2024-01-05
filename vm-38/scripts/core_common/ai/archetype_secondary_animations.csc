#using scripts\core_common\util_shared.csc;
#using scripts\core_common\throttle_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace archetype_secondary_animations;

/*
	Name: function_ab8c4007
	Namespace: archetype_secondary_animations
	Checksum: 0xEEEE7E30
	Offset: 0x160
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ab8c4007()
{
	level notify(1000510321);
}

/*
	Name: main
	Namespace: archetype_secondary_animations
	Checksum: 0xB31A037D
	Offset: 0x180
	Size: 0xB4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	if(sessionmodeiszombiesgame() && getdvarint(#"splitscreen_playercount", 0) > 2)
	{
		return;
	}
	ai::add_ai_spawn_function(&on_entity_spawn);
	ai::function_2315ecfa(&function_b27b8716);
	util::init_dvar("ai_clientFacialCullDist", 1000, &function_718815fb);
}

/*
	Name: function_718815fb
	Namespace: archetype_secondary_animations
	Checksum: 0xEE01DAA3
	Offset: 0x240
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private function_718815fb(dvar)
{
	level.var_35b6bea5 = dvar.value;
}

/*
	Name: secondaryanimationsinit
	Namespace: archetype_secondary_animations
	Checksum: 0x90C40CF3
	Offset: 0x268
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private secondaryanimationsinit(localclientnum)
{
	if(!isdefined(level.__facialanimationslist))
	{
		buildandvalidatefacialanimationlist(localclientnum);
	}
	if(!isdefined(level.var_793d8279))
	{
		level thread function_a7db9953(localclientnum);
	}
	self._currentfacestate = "inactive";
	self.var_a5cdf0bd = 0;
	level.var_793d8279[level.var_793d8279.size] = self;
	self callback::on_shutdown(&on_entity_shutdown);
}

/*
	Name: on_entity_spawn
	Namespace: archetype_secondary_animations
	Checksum: 0x3379E1DB
	Offset: 0x328
	Size: 0x12C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_entity_spawn(localclientnum)
{
	if(self hasdobj(localclientnum))
	{
		self clearanim(#"faces", 0);
	}
	if(self function_8d8e91af())
	{
		self secondaryanimationsinit(localclientnum);
		self thread function_3673906(localclientnum);
	}
	else if(isdefined(self.archetype) && (self.archetype == #"human" || self.archetype == #"zombie" || self.archetype == #"civilian"))
	{
		self secondaryanimationsinit(localclientnum);
		self thread function_909a3089(localclientnum);
	}
}

/*
	Name: function_b27b8716
	Namespace: archetype_secondary_animations
	Checksum: 0x81942079
	Offset: 0x460
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b27b8716(localclientnum)
{
	self.archetype = #"human";
	self on_entity_spawn(localclientnum);
}

/*
	Name: on_entity_shutdown
	Namespace: archetype_secondary_animations
	Checksum: 0xFD4C0324
	Offset: 0x4A8
	Size: 0x6A
	Parameters: 1
	Flags: Linked, Private
*/
function private on_entity_shutdown(localclientnum)
{
	if(isdefined(self))
	{
		self notify(#"stopfacialthread");
		if(is_true(self.facialdeathanimstarted))
		{
			return;
		}
		self applydeathanim(localclientnum);
		if(isdefined(self))
		{
			self.facialdeathanimstarted = 1;
		}
	}
}

/*
	Name: buildandvalidatefacialanimationlist
	Namespace: archetype_secondary_animations
	Checksum: 0x1E16C20
	Offset: 0x520
	Size: 0x8C8
	Parameters: 1
	Flags: Linked
*/
function buildandvalidatefacialanimationlist(localclientnum)
{
	/#
		assert(!isdefined(level.__facialanimationslist));
	#/
	level.__facialanimationslist = [];
	level.__facialanimationslist[#"human"] = [];
	level.__facialanimationslist[#"human"][#"combat"] = array(#"ai_t8_face_hero_generic_idle_1", #"ai_t8_face_hero_generic_idle_2", #"ai_t8_face_hero_generic_idle_3");
	level.__facialanimationslist[#"human"][#"combat_aim"] = array(#"ai_t8_face_hero_aim_idle_1", #"ai_t8_face_hero_aim_idle_2", #"ai_t8_face_hero_aim_idle_3");
	level.__facialanimationslist[#"human"][#"combat_shoot"] = array(#"ai_t8_face_hero_aim_fire_1", #"ai_t8_face_hero_aim_fire_2", #"ai_t8_face_hero_aim_fire_3");
	level.__facialanimationslist[#"human"][#"death"] = array(#"hash_6475991c6b5d94bb", #"hash_64759a1c6b5d966e", #"hash_64759b1c6b5d9821", #"hash_64759c1c6b5d99d4", #"hash_64759d1c6b5d9b87");
	level.__facialanimationslist[#"human"][#"melee"] = array(#"ai_t8_face_hero_melee_1");
	level.__facialanimationslist[#"human"][#"pain"] = array(#"hash_ee9591a50acc77b", #"hash_ee95a1a50acc92e", #"hash_ee95b1a50accae1");
	level.__facialanimationslist[#"human"][#"animscripted"] = array(#"ai_t8_face_hero_generic_idle_1");
	level.__facialanimationslist[#"zombie"] = [];
	level.__facialanimationslist[#"zombie"][#"combat"] = array(#"hash_f64275707b76883");
	level.__facialanimationslist[#"zombie"][#"combat_aim"] = array(#"hash_f64275707b76883");
	level.__facialanimationslist[#"zombie"][#"combat_shoot"] = array(#"hash_f64275707b76883");
	level.__facialanimationslist[#"zombie"][#"death"] = array(#"hash_7a6d64b8e60f262d");
	level.__facialanimationslist[#"zombie"][#"melee"] = array(#"hash_3181a3ee96a8d5d", #"hash_318173ee96a8844");
	level.__facialanimationslist[#"zombie"][#"pain"] = array(#"hash_711aa10330a50fd");
	level.__facialanimationslist[#"zombie"][#"animscripted"] = array(#"hash_f64275707b76883");
	level.var_e776187e[0] = array(#"hash_3c8c7be61c0c54bf", #"hash_3c8c7ce61c0c5672");
	level.var_e776187e[1] = array(#"hash_1be71f9083c3a62b", #"hash_1be7209083c3a7de");
	level.var_e776187e[2] = array(#"hash_284df1f0899aeec2");
	level.var_e776187e[3] = array(#"hash_11dfb67db7575849");
	var_72e0db27 = [];
	foreach(value in level.__facialanimationslist[#"human"])
	{
		var_72e0db27[key] = value;
	}
	level.__facialanimationslist[#"civilian"] = var_72e0db27;
	deathanims = [];
	foreach(animation in level.__facialanimationslist[#"human"][#"death"])
	{
		array::add(deathanims, animation);
	}
	foreach(animation in level.__facialanimationslist[#"zombie"][#"death"])
	{
		array::add(deathanims, animation);
	}
	foreach(deathanim in deathanims)
	{
		/#
			assert(!isanimlooping(localclientnum, deathanim), ("" + deathanim) + "");
		#/
	}
}

/*
	Name: function_77fa627c
	Namespace: archetype_secondary_animations
	Checksum: 0x97363222
	Offset: 0xDF0
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_77fa627c()
{
	if(self function_8d8e91af())
	{
		return self getcurrentanimscriptedname();
	}
	if(isentity(self) && self isai())
	{
		return self getprimarydeltaanim();
	}
}

/*
	Name: getfacialanimoverride
	Namespace: archetype_secondary_animations
	Checksum: 0x1E90A743
	Offset: 0xE78
	Size: 0x1BA
	Parameters: 1
	Flags: Linked, Private
*/
function private getfacialanimoverride(localclientnum)
{
	if(sessionmodeiscampaigngame())
	{
		primarydeltaanim = self function_77fa627c();
		if(isdefined(primarydeltaanim))
		{
			if(self.var_47956aba !== primarydeltaanim)
			{
				self.var_47956aba = primarydeltaanim;
				self.var_c4655881 = undefined;
				notetracks = getnotetracksindelta(primarydeltaanim, 0, 1);
				foreach(notetrack in notetracks)
				{
					if(notetrack[1] == "facial_anim")
					{
						facialanim = notetrack[2];
						self.var_c4655881 = facialanim;
						/#
							facialanimlength = getanimlength(facialanim);
							primarydeltaanimlength = getanimlength(primarydeltaanim);
						#/
						return facialanim;
					}
				}
			}
			else
			{
				return self.var_c4655881;
			}
		}
	}
	return undefined;
}

/*
	Name: function_176c97f8
	Namespace: archetype_secondary_animations
	Checksum: 0x92535B29
	Offset: 0x1040
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_176c97f8(substate)
{
	if(!isdefined(substate))
	{
		return 0;
	}
	return substate == #"pain" || substate == #"inplace_pain" || substate == #"pain_intro" || substate == #"pain_outro" || substate == #"painrecovery" || substate == #"pronepain";
}

/*
	Name: function_f5dde44
	Namespace: archetype_secondary_animations
	Checksum: 0xA5BCE2D8
	Offset: 0x10F0
	Size: 0x5E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f5dde44(substate)
{
	if(!isdefined(substate))
	{
		return 0;
	}
	return substate == #"melee" || substate == #"charge_melee" || substate == #"hash_48dda7ed88efe32f";
}

/*
	Name: function_9d9508f
	Namespace: archetype_secondary_animations
	Checksum: 0xC1FECEF6
	Offset: 0x1158
	Size: 0x240
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9d9508f(localclientnum)
{
	self.var_a5cdf0bd = 0;
	self.var_74a451af = 0;
	if(!isdefined(self.archetype) || (self.archetype != #"human" && self.archetype != #"civilian"))
	{
		return;
	}
	self endon(#"death");
	self endon(#"stopfacialthread");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"hash_f88532a558ad684", #"vox");
		if(waitresult._notify == #"vox")
		{
			self.var_74a451af++;
		}
		else
		{
			if(waitresult.start)
			{
				var_8d8e91af = self function_8d8e91af();
				if(self.var_74a451af == 0 && (var_8d8e91af || !self asmisterminating(localclientnum)))
				{
					if(var_8d8e91af)
					{
						var_fe545d7d = 0;
					}
					else
					{
						var_fe545d7d = clientfield::get("lipflap_anim");
					}
					animtoplay = array::random(level.var_e776187e[var_fe545d7d]);
					self applynewfaceanim(localclientnum, animtoplay, 0);
					self.var_a5cdf0bd++;
				}
			}
			else
			{
				if(self.var_74a451af == 0)
				{
					self.var_a5cdf0bd--;
					if(self.var_a5cdf0bd <= 0)
					{
						self clearcurrentfacialanim(localclientnum);
						self.var_a5cdf0bd = 0;
					}
				}
				else
				{
					self.var_74a451af--;
				}
			}
		}
	}
}

/*
	Name: function_d474d993
	Namespace: archetype_secondary_animations
	Checksum: 0x84A20792
	Offset: 0x13A0
	Size: 0x6A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d474d993(localclientnum)
{
	if(self.var_a5cdf0bd > 0)
	{
		return false;
	}
	if(!isdefined(self.model))
	{
		return false;
	}
	if(!self hasdobj(localclientnum) || !self function_9ee2e79d())
	{
		return false;
	}
	return true;
}

/*
	Name: function_3673906
	Namespace: archetype_secondary_animations
	Checksum: 0xD2593C5B
	Offset: 0x1418
	Size: 0xE8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3673906(localclientnum)
{
	if(isdefined(level.var_e45a8859) && [[level.var_e45a8859]]() == 0)
	{
		return;
	}
	self thread function_9d9508f(localclientnum);
	self endon(#"death");
	self endon(#"stopfacialthread");
	while(true)
	{
		self waittill(#"hash_570b7fe3dfbdf155");
		animoverride = self getfacialanimoverride(localclientnum);
		if(isdefined(animoverride) && self._currentfaceanim !== animoverride)
		{
			applynewfaceanim(localclientnum, animoverride);
		}
	}
}

/*
	Name: function_909a3089
	Namespace: archetype_secondary_animations
	Checksum: 0x1A40D293
	Offset: 0x1508
	Size: 0x568
	Parameters: 1
	Flags: Linked, Private
*/
function private function_909a3089(localclientnum)
{
	if(isdefined(level.var_e45a8859) && [[level.var_e45a8859]]() == 0)
	{
		return;
	}
	self._currentfacestate = "inactive";
	self thread function_9d9508f(localclientnum);
	self endon(#"death");
	self endon(#"stopfacialthread");
	while(isdefined(self.archetype))
	{
		self waittill(#"hash_570b7fe3dfbdf155");
		if(self.archetype == #"human" && self clientfield::get("facial_dial"))
		{
			self._currentfacestate = "inactive";
			self clearcurrentfacialanim(localclientnum);
			continue;
		}
		animoverride = self getfacialanimoverride(localclientnum);
		asmstatus = self asmgetstatus(localclientnum);
		forcenewanim = 0;
		switch(asmstatus)
		{
			case "asm_status_terminated":
			{
				return;
			}
			case "asm_status_inactive":
			{
				if(isdefined(animoverride))
				{
					scriptedanim = self getprimarydeltaanim();
					if(isdefined(scriptedanim) && (!isdefined(self._scriptedanim) || self._scriptedanim != scriptedanim))
					{
						self._scriptedanim = scriptedanim;
						forcenewanim = 1;
					}
					if(isdefined(animoverride) && animoverride !== self._currentfaceanim)
					{
						forcenewanim = 1;
					}
				}
				else
				{
					if(self._currentfacestate !== "death")
					{
						self._currentfacestate = "inactive";
						self clearcurrentfacialanim(localclientnum);
					}
					continue;
				}
			}
		}
		currfacestate = self._currentfacestate;
		currentasmstate = self asmgetcurrentstate(localclientnum);
		if(self asmisterminating(localclientnum))
		{
			nextfacestate = "death";
		}
		else
		{
			if(asmstatus == "asm_status_inactive")
			{
				nextfacestate = "animscripted";
			}
			else
			{
				if(self function_cbf629f(localclientnum))
				{
					nextfacestate = "asm_internal";
				}
				else
				{
					if(function_176c97f8(currentasmstate) || self function_bc69e3d4(localclientnum))
					{
						nextfacestate = "pain";
					}
					else
					{
						if(function_f5dde44(currentasmstate))
						{
							nextfacestate = "melee";
						}
						else
						{
							if(self asmisshootlayeractive(localclientnum))
							{
								nextfacestate = "combat_shoot";
							}
							else
							{
								if(self asmisaimlayeractive(localclientnum))
								{
									nextfacestate = "combat_aim";
								}
								else
								{
									nextfacestate = "combat";
								}
							}
						}
					}
				}
			}
		}
		if(nextfacestate == "asm_internal")
		{
			if(currfacestate != "asm_internal")
			{
				clearcurrentfacialanim(localclientnum);
			}
			self._currentfacestate = nextfacestate;
		}
		else if(currfacestate == "inactive" || currfacestate != nextfacestate || forcenewanim)
		{
			/#
				assert(isdefined(level.__facialanimationslist[self.archetype][nextfacestate]));
			#/
			clearoncompletion = 0;
			animtoplay = array::random(level.__facialanimationslist[self.archetype][nextfacestate]);
			if(isdefined(animoverride))
			{
				animtoplay = animoverride;
				/#
					assert(nextfacestate != "" || !isanimlooping(localclientnum, animtoplay), ("" + animtoplay) + "");
				#/
			}
			applynewfaceanim(localclientnum, animtoplay, clearoncompletion);
			self._currentfacestate = nextfacestate;
		}
		if(self._currentfacestate == "death")
		{
			break;
		}
	}
}

/*
	Name: function_a7db9953
	Namespace: archetype_secondary_animations
	Checksum: 0x4F2D8B
	Offset: 0x1A78
	Size: 0x252
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a7db9953(localclientnum)
{
	level.var_793d8279 = [];
	waitframe(1);
	var_31e8cbcb = 10;
	if(sessionmodeiszombiesgame())
	{
		var_31e8cbcb = 1;
	}
	while(true)
	{
		arrayremovevalue(level.var_793d8279, undefined);
		var_1833656a = 0;
		var_aac955c5 = 0;
		foreach(p in level.localplayers)
		{
			if(!isdefined(p))
			{
				continue;
			}
			var_c0f4db1a = function_72d3bca6(level.var_793d8279, p.origin, level.var_793d8279.size, 0, level.var_35b6bea5);
			foreach(e in var_c0f4db1a)
			{
				if(!isdefined(e))
				{
					continue;
				}
				if(!e function_d474d993(localclientnum))
				{
					continue;
				}
				e notify(#"hash_570b7fe3dfbdf155");
				var_1833656a++;
				if(var_1833656a >= var_31e8cbcb)
				{
					waitframe(1);
					var_1833656a = 0;
					var_aac955c5++;
				}
			}
		}
		var_bcff4c16 = 15 - var_aac955c5;
		if(var_bcff4c16 <= 0)
		{
			var_bcff4c16 = 1;
		}
		waitframe(var_bcff4c16);
	}
}

/*
	Name: applynewfaceanim
	Namespace: archetype_secondary_animations
	Checksum: 0x2D33BDF5
	Offset: 0x1CD8
	Size: 0xFC
	Parameters: 3
	Flags: Linked, Private
*/
function private applynewfaceanim(localclientnum, animation, clearoncompletion)
{
	if(!isdefined(clearoncompletion))
	{
		clearoncompletion = 0;
	}
	clearcurrentfacialanim(localclientnum);
	if(isdefined(animation))
	{
		self._currentfaceanim = animation;
		if(self hasdobj(localclientnum) && self hasanimtree())
		{
			self setflaggedanimknob(#"ai_secondary_facial_anim", animation, 1, 0.1, 1);
			if(clearoncompletion)
			{
				wait(getanimlength(animation));
				clearcurrentfacialanim(localclientnum);
			}
		}
	}
}

/*
	Name: applydeathanim
	Namespace: archetype_secondary_animations
	Checksum: 0xB09D1C76
	Offset: 0x1DE0
	Size: 0x18A
	Parameters: 1
	Flags: Linked, Private
*/
function private applydeathanim(localclientnum)
{
	if(getmigrationstatus(localclientnum))
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	util::waitforclient(localclientnum);
	if(!isdefined(self))
	{
		return;
	}
	if(self._currentfacestate === "death")
	{
		return;
	}
	if(self hasdobj(localclientnum) && self hasanimtree())
	{
		if(isdefined(self) && isdefined(self.archetype) && isdefined(level.__facialanimationslist) && isdefined(level.__facialanimationslist[self.archetype]) && isdefined(level.__facialanimationslist[self.archetype][#"death"]))
		{
			animtoplay = array::random(level.__facialanimationslist[self.archetype][#"death"]);
			animoverride = self getfacialanimoverride(localclientnum);
			if(isdefined(animoverride))
			{
				animtoplay = animoverride;
			}
			applynewfaceanim(localclientnum, animtoplay);
		}
		self._currentfacestate = "death";
	}
}

/*
	Name: clearcurrentfacialanim
	Namespace: archetype_secondary_animations
	Checksum: 0xCD424839
	Offset: 0x1F78
	Size: 0x76
	Parameters: 1
	Flags: Linked, Private
*/
function private clearcurrentfacialanim(localclientnum)
{
	if(isdefined(self._currentfaceanim) && self hasdobj(localclientnum) && self hasanimtree())
	{
		self clearanim(self._currentfaceanim, 0.2);
	}
	self._currentfaceanim = undefined;
}

