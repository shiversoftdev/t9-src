#using script_164a456ce05c3483;
#using script_178024232e91b0a1;
#using script_17dcb1172e441bf6;
#using script_1b01e95a6b5270fd;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_3faf478d5b0850fe;
#using script_47851dbeea22fe66;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_79cafc73107dd980;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_a204c0f4;

/*
	Name: init
	Namespace: namespace_a204c0f4
	Checksum: 0x576E572A
	Offset: 0x738
	Size: 0x36C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_250e9486::function_252dff4d("margwa", 8, &function_e9608fd3);
	spawner::add_archetype_spawn_function(#"margwa", &archetypemargwablackboardinit);
	clientfield::register("actor", "margwa_head_left", 1, 2, "int");
	clientfield::register("actor", "margwa_head_mid", 1, 2, "int");
	clientfield::register("actor", "margwa_head_right", 1, 2, "int");
	clientfield::register("actor", "margwa_fx_in", 1, 1, "counter");
	clientfield::register("actor", "margwa_fx_out", 1, 1, "counter");
	clientfield::register("actor", "margwa_fx_spawn", 1, 1, "counter");
	clientfield::register("actor", "margwa_smash", 1, 1, "counter");
	clientfield::register("actor", "margwa_head_left_hit", 1, 1, "counter");
	clientfield::register("actor", "margwa_head_mid_hit", 1, 1, "counter");
	clientfield::register("actor", "margwa_head_right_hit", 1, 1, "counter");
	clientfield::register("actor", "margwa_head_killed", 1, 2, "int");
	clientfield::register("actor", "margwa_jaw", 1, 6, "int");
	clientfield::register("toplayer", "margwa_head_explosion", 1, 1, "counter");
	clientfield::register("scriptmover", "margwa_fx_travel", 1, 1, "int");
	clientfield::register("scriptmover", "margwa_fx_travel_tell", 1, 1, "int");
	clientfield::register("actor", "supermargwa", 1, 1, "int");
	registerbehaviorscriptfunctions();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_a204c0f4
	Checksum: 0x5C25EA53
	Offset: 0xAB0
	Size: 0x9C4
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&margwatargetservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaTargetService", &margwatargetservice);
	/#
		assert(isscriptfunctionptr(&margwashouldsmashattack));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaShouldSmashAttack", &margwashouldsmashattack);
	/#
		assert(isscriptfunctionptr(&margwashouldswipeattack));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaShouldSwipeAttack", &margwashouldswipeattack);
	/#
		assert(isscriptfunctionptr(&margwashouldshowpain));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaShouldShowPain", &margwashouldshowpain);
	/#
		assert(isscriptfunctionptr(&margwashouldreactstun));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaShouldReactStun", &margwashouldreactstun);
	/#
		assert(isscriptfunctionptr(&margwashouldspawn));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaShouldSpawn", &margwashouldspawn);
	/#
		assert(isscriptfunctionptr(&margwashouldreset));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaShouldReset", &margwashouldreset);
	/#
		assert(!isdefined(&margwareactstunaction) || isscriptfunctionptr(&margwareactstunaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("margwaReactStunAction", &margwareactstunaction, undefined, undefined);
	/#
		assert(!isdefined(&margwaswipeattackaction) || isscriptfunctionptr(&margwaswipeattackaction));
	#/
	/#
		assert(!isdefined(&margwaswipeattackactionupdate) || isscriptfunctionptr(&margwaswipeattackactionupdate));
	#/
	/#
		assert(!isdefined(&function_9f21d288) || isscriptfunctionptr(&function_9f21d288));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("margwaSwipeAttackAction", &margwaswipeattackaction, &margwaswipeattackactionupdate, &function_9f21d288);
	/#
		assert(isscriptfunctionptr(&margwaidlestart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaIdleStart", &margwaidlestart);
	/#
		assert(isscriptfunctionptr(&margwamovestart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaMoveStart", &margwamovestart);
	/#
		assert(isscriptfunctionptr(&margwatraverseactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaTraverseActionStart", &margwatraverseactionstart);
	/#
		assert(isscriptfunctionptr(&margwapainstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaPainStart", &margwapainstart);
	/#
		assert(isscriptfunctionptr(&margwapainterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaPainTerminate", &margwapainterminate);
	/#
		assert(isscriptfunctionptr(&margwareactstunstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaReactStunStart", &margwareactstunstart);
	/#
		assert(isscriptfunctionptr(&margwareactstunterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaReactStunTerminate", &margwareactstunterminate);
	/#
		assert(isscriptfunctionptr(&margwaspawnstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaSpawnStart", &margwaspawnstart);
	/#
		assert(isscriptfunctionptr(&margwasmashattackstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaSmashAttackStart", &margwasmashattackstart);
	/#
		assert(isscriptfunctionptr(&margwasmashattackterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaSmashAttackTerminate", &margwasmashattackterminate);
	/#
		assert(isscriptfunctionptr(&margwaswipeattackstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaSwipeAttackStart", &margwaswipeattackstart);
	/#
		assert(isscriptfunctionptr(&margwaswipeattackterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("margwaSwipeAttackTerminate", &margwaswipeattackterminate);
	animationstatenetwork::registernotetrackhandlerfunction("margwa_smash_attack", &margwanotetracksmashattack);
	animationstatenetwork::registernotetrackhandlerfunction("margwa_bodyfall large", &margwanotetrackbodyfall);
	animationstatenetwork::registernotetrackhandlerfunction("margwa_melee_fire", &margwanotetrackpainmelee);
}

/*
	Name: function_e9608fd3
	Namespace: namespace_a204c0f4
	Checksum: 0xFF52CCA9
	Offset: 0x1480
	Size: 0x3EC
	Parameters: 0
	Flags: Linked
*/
function function_e9608fd3()
{
	self namespace_250e9486::function_25b2c8a9();
	self namespace_250e9486::function_db744d28();
	self.health = 3 * (70000 + (getplayers().size * 40000));
	self.maxhealth = self.health;
	self collidewithactors(1);
	self function_11578581(70);
	self setavoidancemask("avoid none");
	self disableaimassist();
	self.goalradius = 60;
	self.animrate = 1.2;
	self.meleedistsq = sqr(120);
	self.var_3adc3f4a = 0;
	self.disableammodrop = 1;
	self.no_gib = 1;
	self.zombie_move_speed = "walk";
	self.var_1c8b76d3 = 1;
	self.overrideactordamage = &margwadamage;
	self.candamage = 1;
	self.headattached = 3;
	self.headopen = 0;
	if(randomint(100) > 50)
	{
		self margwainithead("c_zom_margwa_chunks_le", "j_chunk_head_bone_le");
		self margwainithead("c_zom_margwa_chunks_ri", "j_chunk_head_bone_ri");
	}
	else
	{
		self margwainithead("c_zom_margwa_chunks_ri", "j_chunk_head_bone_ri");
		self margwainithead("c_zom_margwa_chunks_le", "j_chunk_head_bone_le");
	}
	self margwainithead("c_zom_margwa_chunks_mid", "j_chunk_head_bone");
	self.headhealthmax = 600;
	self margwadisablestun();
	self.traveler = spawn("script_model", self.origin);
	self.traveler setmodel(#"tag_origin");
	self.traveler notsolid();
	self.travelertell = spawn("script_model", self.origin);
	self.travelertell setmodel(#"tag_origin");
	self.travelertell notsolid();
	self thread margwadeath();
	self.updatesight = 0;
	self.var_cccb0ad2 = 1;
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_margwa_spawn");
	self thread namespace_9fc66ac::function_ba33d23d(#"zmb_vocals_margwa_ambient", #"zmb_vocals_margwa_ambient", #"");
}

/*
	Name: archetypemargwablackboardinit
	Namespace: namespace_a204c0f4
	Checksum: 0xC34EC8B2
	Offset: 0x1878
	Size: 0x5A
	Parameters: 0
	Flags: Linked, Private
*/
function private archetypemargwablackboardinit()
{
	blackboard::createblackboardforentity(self);
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	self.___archetypeonanimscriptedcallback = &archetypemargwaonanimscriptedcallback;
}

/*
	Name: archetypemargwaonanimscriptedcallback
	Namespace: namespace_a204c0f4
	Checksum: 0x38518D2B
	Offset: 0x18E0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private archetypemargwaonanimscriptedcallback(entity)
{
	entity.__blackboard = undefined;
	entity archetypemargwablackboardinit();
}

/*
	Name: margwanotetracksmashattack
	Namespace: namespace_a204c0f4
	Checksum: 0x2D267075
	Offset: 0x1918
	Size: 0x2FC
	Parameters: 1
	Flags: Linked, Private
*/
function private margwanotetracksmashattack(entity)
{
	players = getplayers();
	foreach(player in players)
	{
		smashpos = entity.origin + vectorscale(anglestoforward(self.angles), 60);
		distsq = distancesquared(smashpos, player.origin);
		if(distsq < 20736)
		{
			if(!isgodmode(player))
			{
				if(is_true(player.hasriotshield))
				{
					damageshield = 0;
					attackdir = player.origin - self.origin;
					if(is_true(player.hasriotshieldequipped))
					{
						if(player shieldfacing(attackdir, 0.2))
						{
							damageshield = 1;
						}
					}
					else if(player shieldfacing(attackdir, 0.2, 0))
					{
						damageshield = 1;
					}
					if(damageshield)
					{
						self clientfield::increment("margwa_smash");
						shield_damage = level.weaponriotshield.weaponstarthitpoints;
						if(isdefined(player.weaponriotshield))
						{
							shield_damage = player.weaponriotshield.weaponstarthitpoints;
						}
						player [[player.player_shield_apply_damage]](shield_damage, 0);
						continue;
					}
				}
				if(isdefined(level.margwa_smash_damage_callback) && isfunctionptr(level.margwa_smash_damage_callback))
				{
					if(player [[level.margwa_smash_damage_callback]](self))
					{
						continue;
					}
				}
				self clientfield::increment("margwa_smash");
				player dodamage(166, self.origin, self);
			}
		}
	}
	if(isdefined(self.smashattackcb))
	{
		self [[self.smashattackcb]]();
	}
}

/*
	Name: margwanotetrackbodyfall
	Namespace: namespace_a204c0f4
	Checksum: 0x8D024F18
	Offset: 0x1C20
	Size: 0x58
	Parameters: 1
	Flags: Linked, Private
*/
function private margwanotetrackbodyfall(entity)
{
	if(self.archetype == #"margwa")
	{
		entity ghost();
		if(isdefined(self.bodyfallcb))
		{
			self [[self.bodyfallcb]]();
		}
	}
}

/*
	Name: margwanotetrackpainmelee
	Namespace: namespace_a204c0f4
	Checksum: 0x660CB1B4
	Offset: 0x1C80
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private margwanotetrackpainmelee(entity)
{
	entity melee();
}

/*
	Name: margwashouldsmashattack
	Namespace: namespace_a204c0f4
	Checksum: 0xE2F79F0E
	Offset: 0x1CB0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function margwashouldsmashattack(entity)
{
	if(self.zombie_move_speed != "walk")
	{
		return 0;
	}
	if(!isdefined(entity.var_bec33427))
	{
		entity.var_bec33427 = 0;
	}
	return gettime() > entity.var_bec33427;
}

/*
	Name: margwashouldswipeattack
	Namespace: namespace_a204c0f4
	Checksum: 0x9C1D2817
	Offset: 0x1D08
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function margwashouldswipeattack(entity)
{
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	distchecksq = (isdefined(entity.meleedistsq) ? entity.meleedistsq : 16384);
	if(distancesquared(entity.origin, entity.enemy.origin) > distchecksq)
	{
		return false;
	}
	if(distchecksq < 10000 && distchecksq > 10000)
	{
		if(randomint(100) > 50)
		{
			return false;
		}
	}
	yaw = abs(namespace_ec06fe4a::getyawtoenemy());
	if(yaw > 45)
	{
		entity orientmode("face point", entity.enemy.origin);
		return false;
	}
	return true;
}

/*
	Name: margwashouldshowpain
	Namespace: namespace_a204c0f4
	Checksum: 0x6B7CF19B
	Offset: 0x1E50
	Size: 0x10A
	Parameters: 1
	Flags: Linked, Private
*/
function private margwashouldshowpain(entity)
{
	if(isdefined(entity.headdestroyed))
	{
		headinfo = entity.head[entity.headdestroyed];
		switch(headinfo.cf)
		{
			case "margwa_head_left":
			{
				self setblackboardattribute("_margwa_head", "left");
				break;
			}
			case "margwa_head_mid":
			{
				self setblackboardattribute("_margwa_head", "middle");
				break;
			}
			case "margwa_head_right":
			{
				self setblackboardattribute("_margwa_head", "right");
				break;
			}
		}
		return true;
	}
	return false;
}

/*
	Name: margwashouldreactstun
	Namespace: namespace_a204c0f4
	Checksum: 0xFAE83D1D
	Offset: 0x1F68
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private margwashouldreactstun(entity)
{
	if(is_true(entity.reactstun))
	{
		return true;
	}
	return false;
}

/*
	Name: margwashouldspawn
	Namespace: namespace_a204c0f4
	Checksum: 0x7AC39682
	Offset: 0x1FA0
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private margwashouldspawn(entity)
{
	if(is_true(entity.needspawn))
	{
		return true;
	}
	return false;
}

/*
	Name: margwashouldreset
	Namespace: namespace_a204c0f4
	Checksum: 0xFB4C69B3
	Offset: 0x1FD8
	Size: 0x66
	Parameters: 1
	Flags: Linked, Private
*/
function private margwashouldreset(entity)
{
	if(isdefined(entity.headdestroyed))
	{
		return true;
	}
	if(is_true(entity.reactidgun))
	{
		return true;
	}
	if(is_true(entity.reactstun))
	{
		return true;
	}
	return false;
}

/*
	Name: margwareactstunaction
	Namespace: namespace_a204c0f4
	Checksum: 0xE03D6E98
	Offset: 0x2048
	Size: 0xE8
	Parameters: 2
	Flags: Linked, Private
*/
function private margwareactstunaction(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	stunactionast = entity astsearch(asmstatename);
	stunactionanimation = animationstatenetworkutility::searchanimationmap(entity, stunactionast[#"animation"]);
	closetime = int(getanimlength(stunactionanimation) * 1000);
	entity margwacloseallheads(closetime);
	margwareactstunstart(entity);
	return 5;
}

/*
	Name: margwaswipeattackaction
	Namespace: namespace_a204c0f4
	Checksum: 0xA579273D
	Offset: 0x2138
	Size: 0xEA
	Parameters: 2
	Flags: Linked, Private
*/
function private margwaswipeattackaction(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	if(!isdefined(entity.var_514cf595))
	{
		swipeactionast = entity astsearch(asmstatename);
		swipeactionanimation = animationstatenetworkutility::searchanimationmap(entity, swipeactionast[#"animation"]);
		entity.var_514cf595 = int(getanimlength(swipeactionanimation) * 1000);
	}
	if(!isdefined(entity.swipe_end_time))
	{
		entity.swipe_end_time = gettime() + entity.var_514cf595;
	}
	return 5;
}

/*
	Name: margwaswipeattackactionupdate
	Namespace: namespace_a204c0f4
	Checksum: 0xD99B00CD
	Offset: 0x2230
	Size: 0x40
	Parameters: 2
	Flags: Linked, Private
*/
function private margwaswipeattackactionupdate(entity, asmstatename)
{
	if(isdefined(asmstatename.swipe_end_time) && gettime() > asmstatename.swipe_end_time)
	{
		return 4;
	}
	return 5;
}

/*
	Name: function_9f21d288
	Namespace: namespace_a204c0f4
	Checksum: 0x3F2F1CB2
	Offset: 0x2278
	Size: 0x22
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9f21d288(entity, asmstatename)
{
	asmstatename.swipe_end_time = undefined;
	return 4;
}

/*
	Name: margwaidlestart
	Namespace: namespace_a204c0f4
	Checksum: 0xFE4DC6B5
	Offset: 0x22A8
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private margwaidlestart(entity)
{
	entity orientmode("face enemy");
	if(entity shouldupdatejaw())
	{
		entity clientfield::set("margwa_jaw", 1);
	}
}

/*
	Name: margwamovestart
	Namespace: namespace_a204c0f4
	Checksum: 0xAAE4C9
	Offset: 0x2318
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private margwamovestart(entity)
{
	entity orientmode("face motion");
	if(entity shouldupdatejaw())
	{
		if(entity.zombie_move_speed == "run")
		{
			entity clientfield::set("margwa_jaw", 13);
		}
		else
		{
			entity clientfield::set("margwa_jaw", 7);
		}
	}
}

/*
	Name: margwadeathaction
	Namespace: namespace_a204c0f4
	Checksum: 0xDACBF82E
	Offset: 0x23C8
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private margwadeathaction(entity)
{
}

/*
	Name: margwatraverseactionstart
	Namespace: namespace_a204c0f4
	Checksum: 0xFE537DC
	Offset: 0x23E0
	Size: 0x16A
	Parameters: 1
	Flags: Linked, Private
*/
function private margwatraverseactionstart(entity)
{
	entity setblackboardattribute("_traversal_type", entity.traversestartnode.animscript);
	if(isdefined(entity.traversestartnode.animscript))
	{
		if(entity shouldupdatejaw())
		{
			switch(entity.traversestartnode.animscript)
			{
				case "jump_down_36":
				{
					entity clientfield::set("margwa_jaw", 21);
					break;
				}
				case "jump_down_96":
				{
					entity clientfield::set("margwa_jaw", 22);
					break;
				}
				case "jump_up_36":
				{
					entity clientfield::set("margwa_jaw", 24);
					break;
				}
				case "jump_up_96":
				{
					entity clientfield::set("margwa_jaw", 25);
					break;
				}
			}
		}
	}
}

/*
	Name: margwapainstart
	Namespace: namespace_a204c0f4
	Checksum: 0x666A23C6
	Offset: 0x2558
	Size: 0x13E
	Parameters: 1
	Flags: Linked, Private
*/
function private margwapainstart(entity)
{
	entity notify(#"stop_head_update");
	if(entity shouldupdatejaw())
	{
		head = self getblackboardattribute("_margwa_head");
		switch(head)
		{
			case "left":
			{
				entity clientfield::set("margwa_jaw", 3);
				break;
			}
			case "middle":
			{
				entity clientfield::set("margwa_jaw", 4);
				break;
			}
			case "right":
			{
				entity clientfield::set("margwa_jaw", 5);
				break;
			}
		}
	}
	entity.headdestroyed = undefined;
	entity.canstun = 0;
	entity.candamage = 0;
}

/*
	Name: margwapainterminate
	Namespace: namespace_a204c0f4
	Checksum: 0xC34C5A48
	Offset: 0x26A0
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private margwapainterminate(entity)
{
	entity.headdestroyed = undefined;
	entity.canstun = 1;
	entity.candamage = 1;
	entity margwacloseallheads(5000);
	entity clearpath();
}

/*
	Name: margwareactstunstart
	Namespace: namespace_a204c0f4
	Checksum: 0x51A62C4B
	Offset: 0x2710
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private margwareactstunstart(entity)
{
	entity.reactstun = undefined;
	entity.canstun = 0;
	if(entity shouldupdatejaw())
	{
		entity clientfield::set("margwa_jaw", 6);
	}
}

/*
	Name: margwareactstunterminate
	Namespace: namespace_a204c0f4
	Checksum: 0xB6BE1C24
	Offset: 0x2770
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function margwareactstunterminate(entity)
{
	entity.canstun = 1;
}

/*
	Name: margwaspawnstart
	Namespace: namespace_a204c0f4
	Checksum: 0xA218DDE6
	Offset: 0x2798
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private margwaspawnstart(entity)
{
	entity.needspawn = 0;
}

/*
	Name: function_729da05c
	Namespace: namespace_a204c0f4
	Checksum: 0x9DF9BA7A
	Offset: 0x27B8
	Size: 0x37C
	Parameters: 0
	Flags: Linked
*/
function function_729da05c()
{
	self notify("28d981cd8e2dcd29");
	self endon("28d981cd8e2dcd29");
	self endon(#"death");
	self endon(#"hash_2b106aceb73a448d");
	self waittill(#"margwa_smash_attack");
	zombies = arraysortclosest(getaiteamarray("axis"), self.origin, undefined, 0, 150);
	var_31a419e0 = [];
	foreach(zombie in zombies)
	{
		if(is_true(zombie.basic))
		{
			if(!isdefined(var_31a419e0))
			{
				var_31a419e0 = [];
			}
			else if(!isarray(var_31a419e0))
			{
				var_31a419e0 = array(var_31a419e0);
			}
			var_31a419e0[var_31a419e0.size] = zombie;
		}
	}
	foreach(zombie in var_31a419e0)
	{
		zombie namespace_250e9486::setup_zombie_knockdown(self);
	}
	forward = anglestoforward(self.angles);
	right = anglestoright(self.angles);
	spot = self.origin + (forward * 100);
	groundpos = namespace_ec06fe4a::function_65ee50ba(spot);
	trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", groundpos, (2 | 1) | 512, 72, 60);
	if(isdefined(trigger))
	{
		trigger thread namespace_ec06fe4a::function_52afe5df(10);
		trigger thread namespace_f6712ec9::function_86555fba();
	}
	obj = namespace_ec06fe4a::function_e22ae9b3(groundpos);
	obj thread namespace_ec06fe4a::function_52afe5df(10);
	obj namespace_83eb6304::function_3ecfde67("nova_crawler_burst");
	util::wait_network_frame();
	obj thread function_66a5466d(spot, 72);
}

/*
	Name: function_66a5466d
	Namespace: namespace_a204c0f4
	Checksum: 0x35235091
	Offset: 0x2B40
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function function_66a5466d(origin, radius)
{
	self endon(#"death");
	while(true)
	{
		currentangle = randomint(360);
		var_5ccd914d = rotatepointaroundaxis((randomintrange(12, radius), 0, 0), (0, 0, 1), currentangle);
		self.origin = origin + var_5ccd914d;
		self namespace_83eb6304::function_3ecfde67("nova_crawler_burst");
		wait(0.5);
	}
}

/*
	Name: margwasmashattackstart
	Namespace: namespace_a204c0f4
	Checksum: 0x347BED0B
	Offset: 0x2C10
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private margwasmashattackstart(entity)
{
	entity.var_bec33427 = gettime() + randomintrange(3000, 10000);
	entity margwaheadsmash();
	entity thread function_729da05c();
	if(entity shouldupdatejaw())
	{
		entity clientfield::set("margwa_jaw", 14);
	}
}

/*
	Name: margwasmashattackterminate
	Namespace: namespace_a204c0f4
	Checksum: 0x4D0D1846
	Offset: 0x2CB8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function margwasmashattackterminate(entity)
{
	entity notify(#"hash_2b106aceb73a448d");
	entity margwacloseallheads();
}

/*
	Name: margwaswipeattackstart
	Namespace: namespace_a204c0f4
	Checksum: 0x5F94F9EA
	Offset: 0x2CF8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function margwaswipeattackstart(entity)
{
	if(entity shouldupdatejaw())
	{
		entity clientfield::set("margwa_jaw", 16);
	}
}

/*
	Name: margwaswipeattackterminate
	Namespace: namespace_a204c0f4
	Checksum: 0xBB771F6D
	Offset: 0x2D48
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private margwaswipeattackterminate(entity)
{
	entity margwacloseallheads();
}

/*
	Name: margwadeath
	Namespace: namespace_a204c0f4
	Checksum: 0xA4E8AE99
	Offset: 0x2D78
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private margwadeath()
{
	self waittill(#"death");
	if(isdefined(self.e_head_attacker))
	{
		self.e_head_attacker notify(#"margwa_kill");
	}
	if(isdefined(self.traveler))
	{
		self.traveler delete();
	}
	if(isdefined(self.travelertell))
	{
		self.travelertell delete();
	}
}

/*
	Name: margwaenablestun
	Namespace: namespace_a204c0f4
	Checksum: 0x1558FDE6
	Offset: 0x2E18
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function margwaenablestun()
{
	self.canstun = 1;
}

/*
	Name: margwadisablestun
	Namespace: namespace_a204c0f4
	Checksum: 0xD2CF71B
	Offset: 0x2E38
	Size: 0xE
	Parameters: 0
	Flags: Linked, Private
*/
function private margwadisablestun()
{
	self.canstun = 0;
}

/*
	Name: margwainithead
	Namespace: namespace_a204c0f4
	Checksum: 0x4BA35D22
	Offset: 0x2E50
	Size: 0x3C4
	Parameters: 2
	Flags: Linked, Private
*/
function private margwainithead(headmodel, headtag)
{
	model = headmodel;
	model_gore = undefined;
	self attach(model);
	if(!isdefined(self.head))
	{
		self.head = [];
	}
	self.head[model] = spawnstruct();
	self.head[model].model = model;
	self.head[model].tag = headtag;
	self.head[model].health = 70000 + (getplayers().size * 40000);
	self.head[model].candamage = 0;
	self.head[model].open = 1;
	self.head[model].closed = 2;
	self.head[model].smash = 3;
	switch(headmodel)
	{
		case "c_zom_margwa_chunks_le":
		{
			self.head[model].cf = "margwa_head_left";
			self.head[model].impactcf = "margwa_head_left_hit";
			self.head[model].gore = "c_zom_margwa_gore_le";
			if(isdefined(model_gore))
			{
				self.head[model].gore = model_gore;
			}
			self.head[model].killindex = 1;
			self.head_left_model = model;
			break;
		}
		case "c_zom_margwa_chunks_mid":
		{
			self.head[model].cf = "margwa_head_mid";
			self.head[model].impactcf = "margwa_head_mid_hit";
			self.head[model].gore = "c_zom_margwa_gore_mid";
			if(isdefined(model_gore))
			{
				self.head[model].gore = model_gore;
			}
			self.head[model].killindex = 2;
			self.head_mid_model = model;
			break;
		}
		case "c_zom_margwa_chunks_ri":
		{
			self.head[model].cf = "margwa_head_right";
			self.head[model].impactcf = "margwa_head_right_hit";
			self.head[model].gore = "c_zom_margwa_gore_ri";
			if(isdefined(model_gore))
			{
				self.head[model].gore = model_gore;
			}
			self.head[model].killindex = 3;
			self.head_right_model = model;
			break;
		}
	}
	self thread margwaheadupdate(self.head[model]);
}

/*
	Name: margwasetheadhealth
	Namespace: namespace_a204c0f4
	Checksum: 0x9F7AABB7
	Offset: 0x3220
	Size: 0x96
	Parameters: 1
	Flags: None
*/
function margwasetheadhealth(health)
{
	self.headhealthmax = health;
	foreach(head in self.head)
	{
		head.health = health;
	}
}

/*
	Name: margwaresetheadtime
	Namespace: namespace_a204c0f4
	Checksum: 0xAE55BF9C
	Offset: 0x32C0
	Size: 0x3C
	Parameters: 2
	Flags: Linked, Private
*/
function private margwaresetheadtime(min, max)
{
	time = gettime() + randomintrange(min, max);
	return time;
}

/*
	Name: margwaheadcanopen
	Namespace: namespace_a204c0f4
	Checksum: 0xD75B8C65
	Offset: 0x3308
	Size: 0x3E
	Parameters: 0
	Flags: Linked, Private
*/
function private margwaheadcanopen()
{
	if(self.headattached > 1)
	{
		if(self.headopen < self.headattached - 1)
		{
			return true;
		}
	}
	else
	{
		return true;
	}
	return false;
}

/*
	Name: margwaheadupdate
	Namespace: namespace_a204c0f4
	Checksum: 0x17A6E012
	Offset: 0x3350
	Size: 0x288
	Parameters: 1
	Flags: Linked, Private
*/
function private margwaheadupdate(headinfo)
{
	self endon(#"death", #"stop_head_update");
	headinfo notify(#"stop_head_update");
	headinfo endon(#"stop_head_update");
	while(true)
	{
		if(self ispaused())
		{
			util::wait_network_frame();
			continue;
		}
		if(!isdefined(headinfo.closetime))
		{
			if(self.headattached == 1)
			{
				headinfo.closetime = margwaresetheadtime(500, 1000);
			}
			else
			{
				headinfo.closetime = margwaresetheadtime(1500, 3500);
			}
		}
		if(gettime() > headinfo.closetime && self margwaheadcanopen())
		{
			self.headopen++;
			headinfo.closetime = undefined;
		}
		else
		{
			util::wait_network_frame();
			continue;
		}
		self margwaheaddamagedelay(headinfo, 1);
		self clientfield::set(headinfo.cf, headinfo.open);
		self playsoundontag("zmb_vocals_margwa_ambient", headinfo.tag);
		while(true)
		{
			if(!isdefined(headinfo.opentime))
			{
				headinfo.opentime = margwaresetheadtime(3000, 5000);
			}
			if(gettime() > headinfo.opentime)
			{
				self.headopen--;
				headinfo.opentime = undefined;
				break;
			}
			else
			{
				util::wait_network_frame();
				continue;
			}
		}
		self margwaheaddamagedelay(headinfo, 0);
		self clientfield::set(headinfo.cf, headinfo.closed);
	}
}

/*
	Name: margwaheaddamagedelay
	Namespace: namespace_a204c0f4
	Checksum: 0x22279B29
	Offset: 0x35E0
	Size: 0x3E
	Parameters: 2
	Flags: Linked, Private
*/
function private margwaheaddamagedelay(headinfo, candamage)
{
	self endon(#"death");
	wait(0.1);
	headinfo.candamage = candamage;
}

/*
	Name: margwaheadsmash
	Namespace: namespace_a204c0f4
	Checksum: 0xF31DB553
	Offset: 0x3628
	Size: 0x198
	Parameters: 0
	Flags: Linked, Private
*/
function private margwaheadsmash()
{
	self notify(#"stop_head_update");
	headalive = [];
	foreach(head in self.head)
	{
		if(head.health > 0)
		{
			headalive[headalive.size] = head;
		}
	}
	headalive = array::randomize(headalive);
	open = 0;
	foreach(head in headalive)
	{
		if(!open)
		{
			head.candamage = 1;
			self clientfield::set(head.cf, head.smash);
			open = 1;
			continue;
		}
		self margwaclosehead(head);
	}
}

/*
	Name: margwaclosehead
	Namespace: namespace_a204c0f4
	Checksum: 0x4384E094
	Offset: 0x37C8
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private margwaclosehead(headinfo)
{
	headinfo.candamage = 0;
	self clientfield::set(headinfo.cf, headinfo.closed);
}

/*
	Name: margwacloseallheads
	Namespace: namespace_a204c0f4
	Checksum: 0x870F5D5
	Offset: 0x3810
	Size: 0x110
	Parameters: 1
	Flags: Linked, Private
*/
function private margwacloseallheads(closetime)
{
	if(self ispaused())
	{
		return;
	}
	foreach(head in self.head)
	{
		if(head.health > 0)
		{
			head.closetime = undefined;
			head.opentime = undefined;
			if(isdefined(closetime))
			{
				head.closetime = gettime() + closetime;
			}
			self.headopen = 0;
			self margwaclosehead(head);
			self thread margwaheadupdate(head);
		}
	}
}

/*
	Name: margwakillhead
	Namespace: namespace_a204c0f4
	Checksum: 0x9C1B5260
	Offset: 0x3928
	Size: 0x16C
	Parameters: 2
	Flags: Linked
*/
function margwakillhead(modelhit, attacker)
{
	headinfo = self.head[modelhit];
	if(is_true(headinfo.killed))
	{
		return;
	}
	headinfo.health = 0;
	headinfo.killed = 1;
	headinfo notify(#"stop_head_update");
	if(is_true(headinfo.candamage))
	{
		self margwaclosehead(headinfo);
		self.headopen--;
	}
	self margwaupdatemovespeed();
	self clientfield::set("margwa_head_killed", headinfo.killindex);
	self detach(headinfo.model);
	self attach(headinfo.gore);
	self.headattached--;
	if(self.headattached <= 0)
	{
		self.e_head_attacker = attacker;
		return true;
	}
	self.headdestroyed = modelhit;
	return false;
}

/*
	Name: margwacandamageanyhead
	Namespace: namespace_a204c0f4
	Checksum: 0x765A5F52
	Offset: 0x3AA0
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function margwacandamageanyhead()
{
	foreach(head in self.head)
	{
		if(isdefined(head) && head.health > 0 && is_true(head.candamage))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: margwacandamagehead
	Namespace: namespace_a204c0f4
	Checksum: 0x79A6C45A
	Offset: 0x3B60
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function margwacandamagehead()
{
	if(isdefined(self) && self.health > 0 && is_true(self.candamage))
	{
		return true;
	}
	return false;
}

/*
	Name: margwadamage
	Namespace: namespace_a204c0f4
	Checksum: 0xEE2B62BA
	Offset: 0x3BA8
	Size: 0x300
	Parameters: 13
	Flags: Linked
*/
function margwadamage(inflictor, attacker, damage, dflags, mod, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(is_true(self.marked_for_death))
	{
		self namespace_ec06fe4a::function_2f4b0f9(self.health - hitloc);
		return hitloc;
	}
	headalive = [];
	foreach(head in self.head)
	{
		if(head.health > 0)
		{
			headalive[headalive.size] = head;
		}
	}
	if(headalive.size)
	{
		headclosest = headalive[0];
		headclosest.health = headclosest.health - hitloc;
		self clientfield::increment(headclosest.impactcf);
		if(headclosest.health <= 0)
		{
			if(self margwakillhead(headclosest.model, dir))
			{
				return self.health;
			}
		}
	}
	if(hitloc > self.health)
	{
		foreach(head in self.head)
		{
			self margwakillhead(head.model, dir);
		}
		self thread namespace_ec06fe4a::function_570729f0(1, dir, offsettime, boneindex);
		self.takedamage = 0;
		hitloc = self.health - 1;
	}
	var_799e18e5 = modelindex;
	var_5f32808d = 1;
	if(hitloc >= 1000)
	{
		var_5f32808d = 2;
	}
	self namespace_ec06fe4a::function_2f4b0f9(self.health, dir, var_799e18e5, hitloc, var_5f32808d);
	return hitloc;
}

/*
	Name: margwaheadhit
	Namespace: namespace_a204c0f4
	Checksum: 0xB9680932
	Offset: 0x3EB0
	Size: 0xA4
	Parameters: 2
	Flags: Private
*/
function private margwaheadhit(entity, partname)
{
	switch(partname)
	{
		case "j_chunk_head_bone_le":
		case "j_jaw_lower_1_le":
		{
			return self.head_left_model;
		}
		case "j_jaw_lower_1":
		case "j_chunk_head_bone":
		{
			return self.head_mid_model;
		}
		case "j_chunk_head_bone_ri":
		case "j_jaw_lower_1_ri":
		{
			return self.head_right_model;
		}
	}
	return undefined;
}

/*
	Name: margwaupdatemovespeed
	Namespace: namespace_a204c0f4
	Checksum: 0x7D0BD5B6
	Offset: 0x3F60
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private margwaupdatemovespeed()
{
	if(self.zombie_move_speed == "walk")
	{
		self.zombie_move_speed = "run";
		self setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
	}
	else if(self.zombie_move_speed == "run")
	{
		self.zombie_move_speed = "sprint";
		self setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
	}
}

/*
	Name: margwaforcesprint
	Namespace: namespace_a204c0f4
	Checksum: 0xA23D3BED
	Offset: 0x4000
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function margwaforcesprint()
{
	self.zombie_move_speed = "sprint";
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
}

/*
	Name: margwadestroyhead
	Namespace: namespace_a204c0f4
	Checksum: 0xF9266A83
	Offset: 0x4040
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private margwadestroyhead(modelhit)
{
}

/*
	Name: shouldupdatejaw
	Namespace: namespace_a204c0f4
	Checksum: 0x5A5A9D4
	Offset: 0x4058
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function shouldupdatejaw()
{
	if(!is_true(self.jawanimenabled))
	{
		return false;
	}
	if(self.headattached < 3)
	{
		return true;
	}
	return false;
}

/*
	Name: shieldfacing
	Namespace: namespace_a204c0f4
	Checksum: 0x8ADC54A1
	Offset: 0x40A0
	Size: 0x134
	Parameters: 3
	Flags: Linked
*/
function shieldfacing(vdir, limit, front)
{
	if(!isdefined(front))
	{
		front = 1;
	}
	orientation = self getplayerangles();
	forwardvec = anglestoforward(orientation);
	if(!front)
	{
		forwardvec = forwardvec * -1;
	}
	forwardvec2d = (forwardvec[0], forwardvec[1], 0);
	unitforwardvec2d = vectornormalize(forwardvec2d);
	tofaceevec = vdir * -1;
	tofaceevec2d = (tofaceevec[0], tofaceevec[1], 0);
	unittofaceevec2d = vectornormalize(tofaceevec2d);
	dotproduct = vectordot(unitforwardvec2d, unittofaceevec2d);
	return dotproduct > limit;
}

/*
	Name: insmashattackrange
	Namespace: namespace_a204c0f4
	Checksum: 0x6FE1F1C
	Offset: 0x41E0
	Size: 0xB4
	Parameters: 1
	Flags: Private
*/
function private insmashattackrange(enemy)
{
	smashpos = self.origin;
	heightoffset = abs(self.origin[2] - enemy.origin[2]);
	if(heightoffset > 48)
	{
		return false;
	}
	distsq = distancesquared(smashpos, enemy.origin);
	if(distsq > 2500 && distsq < 10000)
	{
		return true;
	}
	return false;
}

/*
	Name: margwatargetservice
	Namespace: namespace_a204c0f4
	Checksum: 0xA7E704BC
	Offset: 0x42A0
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private margwatargetservice(entity)
{
}

