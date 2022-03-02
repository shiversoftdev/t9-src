#using script_1940fc077a028a81;
#using script_2c5daa95f8fec03c;
#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using script_35598499769dbb3d;
#using script_35b5ff21c2a0960f;
#using script_3751b21462a54a7d;
#using script_3819e7a1427df6d2;
#using script_3a88f428c6d8ef90;
#using script_3aa0f32b70d4f7cb;
#using script_3f9e0dc8454d98e1;
#using script_41fe08c37d53a635;
#using script_4d85e8de54b02198;
#using script_57f7003580bb15e0;
#using script_6809bf766eba194a;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_98decc78;

/*
	Name: function_8232c56d
	Namespace: namespace_98decc78
	Checksum: 0x8AE2E66B
	Offset: 0x320
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8232c56d()
{
	level notify(1786356668);
}

/*
	Name: function_89f2df9
	Namespace: namespace_98decc78
	Checksum: 0x91D1FCCD
	Offset: 0x340
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5cb28995c23c44a", &function_70a657d8, &main, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_98decc78
	Checksum: 0x141E28E2
	Offset: 0x398
	Size: 0x35C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	gametype = util::function_5df4294();
	if(gametype == #"zsurvival")
	{
		level.var_9ee73630 = [];
		level.var_9ee73630[#"walk"] = [];
		level.var_9ee73630[#"run"] = [];
		level.var_9ee73630[#"sprint"] = [];
		level.var_9ee73630[#"super_sprint"] = [];
		level.var_9ee73630[#"walk"][#"down"] = 14;
		level.var_9ee73630[#"walk"][#"up"] = 16;
		level.var_9ee73630[#"run"][#"down"] = 13;
		level.var_9ee73630[#"run"][#"up"] = 12;
		level.var_9ee73630[#"sprint"][#"down"] = 9;
		level.var_9ee73630[#"sprint"][#"up"] = 8;
		level.var_9ee73630[#"super_sprint"][#"down"] = 1;
		level.var_9ee73630[#"super_sprint"][#"up"] = 1;
		level.var_9ee73630[#"super_super_sprint"][#"down"] = 8;
		level.var_9ee73630[#"super_super_sprint"][#"up"] = 8;
		spawner::add_archetype_spawn_function(#"zombie", &function_42151b1b);
		spawner::add_archetype_spawn_function(#"zombie", &function_1bc8ecf1);
		spawner::function_89a2cd87(#"zombie", &function_95d1bec9);
	}
	clientfield::register("toplayer", "" + #"hash_3a86c740229275b7", 1, 3, "counter");
	function_74e6d564();
}

/*
	Name: main
	Namespace: namespace_98decc78
	Checksum: 0x135CCD8B
	Offset: 0x700
	Size: 0x1B0
	Parameters: 0
	Flags: Linked, Private
*/
function private main()
{
	level.var_847ab632 = &namespace_85745671::function_847ab632;
	if((isdefined(getgametypesetting(#"hash_4ac1f31d592e3f3d")) ? getgametypesetting(#"hash_4ac1f31d592e3f3d") : 0))
	{
		callback::add_callback(#"hash_70eeb7d813f149b2", &namespace_85745671::function_cf065988);
		callback::add_callback(#"hash_15858698313c5f32", &namespace_85745671::function_b0503d98);
		turretweapon = getweapon(#"hash_36a6454f13b54f18");
		if(isdefined(turretweapon))
		{
			turretweapon = turretweapon.rootweapon;
		}
		if(isdefined(turretweapon) && !isinarray(level.var_7fc48a1a, turretweapon))
		{
			level.var_7fc48a1a[level.var_7fc48a1a.size] = turretweapon;
		}
		if(isdefined(level.var_5101157d) && !isinarray(level.var_7fc48a1a, level.var_5101157d.var_8d86ade8))
		{
			level.var_7fc48a1a[level.var_7fc48a1a.size] = level.var_5101157d.var_8d86ade8;
		}
	}
}

/*
	Name: function_74e6d564
	Namespace: namespace_98decc78
	Checksum: 0x979D6836
	Offset: 0x8B8
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function function_74e6d564()
{
	/#
		assert(isscriptfunctionptr(&function_197fdaee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2e71bc334e0009ba", &function_197fdaee);
	/#
		assert(isscriptfunctionptr(&function_20a45305));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_37d4dfdcc2dcf48b", &function_20a45305);
	/#
		assert(isscriptfunctionptr(&function_c142ffd7));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_40014132d9127d48", &function_c142ffd7);
	animationstatenetwork::registernotetrackhandlerfunction("show_projectile", &function_a7d522bd);
	animationstatenetwork::registernotetrackhandlerfunction("fire_projectile", &function_f45f4725);
}

/*
	Name: function_42151b1b
	Namespace: namespace_98decc78
	Checksum: 0x53DFC08D
	Offset: 0xA50
	Size: 0x284
	Parameters: 0
	Flags: Linked, Private
*/
function private function_42151b1b()
{
	self.ai.var_870d0893 = 1;
	self callback::function_d8abfc3d(#"on_ai_damage", &zombie_gib_on_damage);
	self callback::function_d8abfc3d(#"hash_11aa32ad6d527054", &namespace_85745671::function_b8eb5dea);
	self callback::function_d8abfc3d(#"hash_3bb51ce51020d0eb", &namespace_85745671::function_16e2f075);
	self callback::function_d8abfc3d(#"on_ai_killed", &function_bf21203e);
	aiutility::addaioverridedamagecallback(self, &function_853cd0f0);
	self.ai.var_a5dabb8b = 1;
	self.var_65e57a10 = 1;
	self.ignorepathenemyfightdist = 1;
	self.var_1c0eb62a = 180;
	self.var_737e8510 = 64;
	self.var_b8c61fc5 = 1;
	self.var_20e07206 = 1;
	self.var_16dd87ad = 0.1;
	self.var_90d0c0ff = "anim_spawn_from_ground";
	self.clamptonavmesh = 1;
	self.var_958e7ee4 = 10;
	self.var_eb3258b = 15;
	self.completed_emerging_into_playable_area = 1;
	self.zombie_think_done = 1;
	self.var_28621cf4 = "j_neck";
	self.var_e5365d8a = vectorscale((0, 0, 1), 6);
	self.var_cbc65493 = 0.25;
	self setavoidancemask("avoid actor");
	self namespace_85745671::function_9758722("walk");
	self thread namespace_85745671::function_6c308e81();
	self callback::function_d8abfc3d(#"hash_10ab46b52df7967a", &namespace_85745671::function_5cb3181e);
	self thread zombie_utility::hide_pop();
}

/*
	Name: function_1bc8ecf1
	Namespace: namespace_98decc78
	Checksum: 0x3309781F
	Offset: 0xCE0
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_1bc8ecf1()
{
	self.var_b3c613a7 = [4:1, 3:1, 2:1, 1:1, 0:1];
	self.var_414bc881 = 1;
}

/*
	Name: function_95d1bec9
	Namespace: namespace_98decc78
	Checksum: 0x5AA0E986
	Offset: 0xD48
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_95d1bec9()
{
	self.var_48915943 = 1;
	function_fb4a1aa3(self);
	self thread awareness::function_fa6e010d();
}

/*
	Name: function_bf21203e
	Namespace: namespace_98decc78
	Checksum: 0xF1CEA0C6
	Offset: 0xD90
	Size: 0xB0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bf21203e(params)
{
	if(params.smeansofdeath === "MOD_CRUSH")
	{
		self globallogic_vehicle::function_621234f9(params.eattacker, params.einflictor);
	}
	if(isvehicle(params.einflictor) && params.smeansofdeath === "MOD_CRUSH")
	{
		namespace_81245006::function_76e239dc(self, undefined);
	}
	if(!isplayer(params.eattacker))
	{
		return;
	}
}

/*
	Name: function_853cd0f0
	Namespace: namespace_98decc78
	Checksum: 0xEE662481
	Offset: 0xE48
	Size: 0x4AC
	Parameters: 14
	Flags: Linked, Private
*/
function private function_853cd0f0(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, damagefromunderneath, modelindex, partname)
{
	self.var_67f98db0 = 0;
	if(isactor(vpoint) && vpoint.team == self.team)
	{
		return 0;
	}
	if(isdefined(damagefromunderneath) && psoffsettime !== "MOD_DOT")
	{
		var_9a429025 = function_f74d2943(damagefromunderneath, 7);
		if(isdefined(var_9a429025))
		{
			status_effect::status_effect_apply(var_9a429025, damagefromunderneath, var_fd90b0bb);
		}
	}
	var_3b037158 = isdefined(damagefromunderneath) && isarray(level.var_7fc48a1a) && isinarray(level.var_7fc48a1a, damagefromunderneath);
	if(var_3b037158 && isdefined(var_fd90b0bb))
	{
		if(!isdefined(self.attackable) && isdefined(var_fd90b0bb.var_b79a8ac7))
		{
			if(var_fd90b0bb namespace_85745671::get_attackable_slot(self))
			{
				self.attackable = var_fd90b0bb;
			}
		}
		if(isdefined(var_fd90b0bb.var_d83d7db3))
		{
			if(isdefined(self.var_1b3acc36) && gettime() < self.var_1b3acc36)
			{
				return 0;
			}
			self.var_1b3acc36 = gettime() + var_fd90b0bb.var_d83d7db3;
		}
		vdir = (isdefined(var_fd90b0bb.var_ba721a2c) ? var_fd90b0bb.var_ba721a2c : vdir);
	}
	if(!isdefined(self.enemy_override) && !isdefined(self.favoriteenemy) && isdefined(vpoint) && isplayer(vpoint))
	{
		if(isdefined(psoffsettime) && (psoffsettime == "MOD_MELEE" || psoffsettime == "MOD_MELEE_WEAPON_BUTT") || (isdefined(damagefromunderneath) && damagefromunderneath.statname === #"hatchet"))
		{
			n_radius = 128;
		}
		else
		{
			n_radius = 512;
		}
		awareness::function_e732359c(1, self.origin, n_radius, self, {#position:vpoint.origin});
	}
	if(var_fd90b0bb.classname === "script_vehicle" && psoffsettime == "MOD_CRUSH" && isdefined(self.var_5ace757d))
	{
		foreach(bundle in self.var_5ace757d)
		{
			foreach(hitloc in bundle.hitlocs)
			{
				modelindex = hitloc;
				if(isdefined(self.var_318a0ac8))
				{
					self [[self.var_318a0ac8]](var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, damagefromunderneath, undefined, undefined, modelindex, partname);
				}
			}
		}
	}
	/#
		if(is_true(level.var_85a39c96))
		{
			vdir = self.health + 1;
		}
	#/
	return vdir;
}

/*
	Name: zombie_gib_on_damage
	Namespace: namespace_98decc78
	Checksum: 0x530B5B11
	Offset: 0x1300
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private zombie_gib_on_damage(params)
{
	zombie_utility::zombie_gib(params.idamage, params.eattacker, params.vdir, params.vpoint, params.smeansofdeath, undefined, undefined, undefined, params.weapon);
}

/*
	Name: function_197fdaee
	Namespace: namespace_98decc78
	Checksum: 0xB9723AD1
	Offset: 0x1360
	Size: 0xC6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_197fdaee(entity)
{
	if(entity asmgetstatus() != "asm_status_complete" && (isdefined(entity.var_376ab36f) && isdefined(entity.var_1087b4ab)) && entity isattached(entity.var_376ab36f, entity.var_1087b4ab))
	{
		entity detach(entity.var_376ab36f, entity.var_1087b4ab);
		entity.var_1087b4ab = undefined;
		entity.var_376ab36f = undefined;
	}
	entity.var_205ab08b = undefined;
}

/*
	Name: function_20a45305
	Namespace: namespace_98decc78
	Checksum: 0xDBD7A0C8
	Offset: 0x1430
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_20a45305(entity)
{
	entity.var_205ab08b = 1;
}

/*
	Name: function_c142ffd7
	Namespace: namespace_98decc78
	Checksum: 0xAD28B4A
	Offset: 0x1458
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c142ffd7(entity)
{
	entity.var_205ab08b = 1;
}

/*
	Name: function_a7d522bd
	Namespace: namespace_98decc78
	Checksum: 0xF77BF0C8
	Offset: 0x1480
	Size: 0x19C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a7d522bd(entity)
{
	model = array::random(array("c_t9_gore_chunk_03", "c_t9_gore_chunk_03_a", "c_t9_gore_chunk_03_b", "c_t9_gore_chunk_03_c", "c_t9_gore_chunk_03_d"));
	entity.var_376ab36f = model;
	entity.var_1087b4ab = "tag_weapon_left";
	if(!entity haspart(entity.var_1087b4ab))
	{
		entity.var_1087b4ab = "j_indexbase_le";
	}
	if(gibserverutils::isgibbed(self, 32) || is_true(entity.missinglegs))
	{
		entity.var_1087b4ab = "tag_weapon_right";
		if(!entity haspart(entity.var_1087b4ab))
		{
			entity.var_1087b4ab = "j_indexbase_ri";
		}
	}
	if(entity isattached(entity.var_376ab36f, entity.var_1087b4ab))
	{
		entity detach(entity.var_376ab36f, entity.var_1087b4ab);
	}
	entity attach(entity.var_376ab36f, entity.var_1087b4ab);
}

/*
	Name: function_be5f206
	Namespace: namespace_98decc78
	Checksum: 0xE2A2DFC2
	Offset: 0x1628
	Size: 0x18C
	Parameters: 3
	Flags: Linked
*/
function function_be5f206(start_pos, target_pos, var_22041b45)
{
	if(!isplayer(self) || !self isinvehicle())
	{
		return undefined;
	}
	vehicle = self getvehicleoccupied();
	velocity = vehicle getvelocity();
	var_8a263da1 = vectornormalize(velocity);
	var_1e74aaf8 = length(velocity);
	var_e42cca13 = var_1e74aaf8;
	velocity = var_8a263da1 * var_e42cca13;
	if(velocity !== (0, 0, 0))
	{
		predicted_pos = target_pos + (velocity * var_22041b45);
		to_target = predicted_pos - start_pos;
		time = length((to_target[0], to_target[1], 0)) / 700;
		time = min(time, var_22041b45);
		predicted_pos = target_pos + (velocity * time);
		return predicted_pos;
	}
}

/*
	Name: function_f45f4725
	Namespace: namespace_98decc78
	Checksum: 0x7B03F23F
	Offset: 0x17C0
	Size: 0x3AA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f45f4725(entity)
{
	if(isdefined(entity.var_376ab36f))
	{
		entity detach(entity.var_376ab36f, entity.var_1087b4ab);
	}
	if(namespace_85745671::is_player_valid(entity.enemy) && entity haspart(entity.var_1087b4ab) && entity.enemy haspart("j_spine4"))
	{
		start_pos = entity gettagorigin(entity.var_1087b4ab);
		target_pos = entity.enemy gettagorigin("j_spine4");
		to_target = target_pos - start_pos;
		time = length((to_target[0], to_target[1], 0)) / 700;
		var_64b12059 = entity.enemy function_be5f206(start_pos, target_pos, time);
		if(isdefined(var_64b12059))
		{
			/#
				if(getdvarint(#"hash_1e6f0ddc05647984", 0))
				{
					recordline(target_pos, var_64b12059, (1, 0, 0));
					debugstar(var_64b12059, 100, (0, 0, 1));
				}
			#/
			if(var_64b12059 !== start_pos)
			{
				to_target = var_64b12059 - start_pos;
				time = length((to_target[0], to_target[1], 0)) / 700;
			}
		}
		var_813d38fa = ((0.5 * getdvarfloat(#"bg_lowgravity", 400)) * sqr(time) + to_target[2]) / time;
		to_target = vectornormalize((to_target[0], to_target[1], 0));
		grenade = entity magicgrenademanual(start_pos, (to_target[0] * 700, to_target[1] * 700, var_813d38fa), 6);
		grenade.angles = entity gettagangles(entity.var_1087b4ab);
		grenade thread function_6f78caa9();
		if(isdefined(entity.var_376ab36f))
		{
			grenade setmodel(entity.var_376ab36f);
		}
		entity.var_735e0049 = grenade;
		entity.var_42ecd9f3 = gettime() + (int(1.5 * 1000));
	}
	entity.var_376ab36f = undefined;
	entity.var_1087b4ab = undefined;
	entity.var_8c4d3e5d = undefined;
}

/*
	Name: function_6f78caa9
	Namespace: namespace_98decc78
	Checksum: 0x4E547BBF
	Offset: 0x1B78
	Size: 0x32C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6f78caa9()
{
	if(isdefined(self.owner))
	{
		attacker = self.owner;
		start_pos = self.owner.origin;
	}
	waitresult = undefined;
	waitresult = self waittilltimeout(5, #"projectile_impact_player", #"death");
	if(waitresult._notify == #"projectile_impact_player" && isdefined(waitresult.player))
	{
		player = waitresult.player;
		player playsound(#"hash_7531b73b4b99b19d");
		player dodamage(self.weapon.var_2d276877[0], start_pos, attacker, self);
		var_622f0175 = player.origin - self.origin;
		var_f1ff3ca1 = vectornormalize((var_622f0175[0], var_622f0175[1], 0));
		player_forward = anglestoforward(player.angles);
		var_d885fce5 = vectornormalize((player_forward[0], player_forward[1], 0));
		player_right = anglestoright(player.angles);
		var_f39d8ba7 = vectornormalize((player_right[0], player_right[1], 0));
		dot = vectordot(var_f1ff3ca1, var_d885fce5);
		if(dot >= 0.5)
		{
			direction = 1;
		}
		else
		{
			if(dot < 0.5 && dot > -0.5)
			{
				dot = vectordot(var_f1ff3ca1, var_f39d8ba7);
				if(dot > 0)
				{
					direction = 3;
				}
				else
				{
					direction = 4;
				}
			}
			else
			{
				direction = 2;
			}
		}
		player clientfield::increment_to_player((isdefined(attacker.var_22492afd) ? attacker.var_22492afd : "" + #"hash_3a86c740229275b7"), direction);
	}
	if(isdefined(self))
	{
		else
		{
		}
		self deletedelay();
	}
}

/*
	Name: function_fb4a1aa3
	Namespace: namespace_98decc78
	Checksum: 0x6F16D909
	Offset: 0x1EB0
	Size: 0x1D2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fb4a1aa3(entity)
{
	if(is_true(entity.ai.var_870d0893))
	{
		entity.var_f9a12c59 = 1;
		entity.var_ed35eeb2 = 1;
		entity callback::function_d8abfc3d(#"on_ai_damage", &awareness::function_5f511313);
		awareness::function_dad6ba0e(entity, #"wander", &function_962ec972, &awareness::function_4ebe4a6d, &awareness::function_b264a0bc, undefined, &awareness::function_555d960b);
		awareness::function_dad6ba0e(entity, #"investigate", &function_18cf0569, &awareness::function_9eefc327, &function_60856c6d, undefined, &awareness::function_a360dd00);
		awareness::function_dad6ba0e(entity, #"chase", &function_88586098, &function_e85f22b3, &function_5b3d00f3, &awareness::function_5c40e824, &function_1ae9512e);
		awareness::set_state(entity, #"wander");
	}
	else
	{
		entity.var_f9a12c59 = 0;
	}
}

/*
	Name: function_962ec972
	Namespace: namespace_98decc78
	Checksum: 0x42BFB20D
	Offset: 0x2090
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_962ec972(entity)
{
	entity.fovcosine = 0.5;
	entity.maxsightdistsqrd = sqr(900);
	entity namespace_85745671::function_9758722("walk");
	entity.var_1267fdea = 0;
	awareness::function_9c9d96b5(entity);
}

/*
	Name: function_18cf0569
	Namespace: namespace_98decc78
	Checksum: 0x303FA155
	Offset: 0x2110
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_18cf0569(entity)
{
	self.fovcosine = 0;
	self.maxsightdistsqrd = sqr(1100);
	self.var_1267fdea = 0;
	entity namespace_85745671::function_9758722("run");
	awareness::function_b41f0471(entity);
}

/*
	Name: function_60856c6d
	Namespace: namespace_98decc78
	Checksum: 0x98B0403B
	Offset: 0x2198
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_60856c6d(entity)
{
	awareness::function_34162a25(entity);
}

/*
	Name: function_88586098
	Namespace: namespace_98decc78
	Checksum: 0xAF947301
	Offset: 0x21C8
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_88586098(entity)
{
	self.fovcosine = 0;
	self.maxsightdistsqrd = sqr(3000);
	self.var_1267fdea = 0;
	if(isdefined(self.aat_turned))
	{
	}
	else
	{
		if(isdefined(self.var_9602c8b2))
		{
			[[self.var_9602c8b2]]();
		}
		else
		{
			if(isdefined(level.var_9602c8b2))
			{
				[[level.var_9602c8b2]]();
			}
			else
			{
				n_random = randomint(100);
				if(n_random < 33)
				{
					entity namespace_85745671::function_9758722("sprint");
				}
				else
				{
					entity namespace_85745671::function_9758722("super_sprint");
				}
			}
		}
	}
	awareness::function_978025e4(entity);
}

/*
	Name: function_e85f22b3
	Namespace: namespace_98decc78
	Checksum: 0x673124F2
	Offset: 0x22F0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_e85f22b3(entity)
{
	if(isdefined(entity.enemy) && distancesquared(entity.enemy.origin, entity.origin) < entity.maxsightdistsqrd)
	{
		zm_behavior::function_483766be(entity);
	}
	awareness::function_39da6c3c(entity);
}

/*
	Name: function_5b3d00f3
	Namespace: namespace_98decc78
	Checksum: 0x5D2131CD
	Offset: 0x2378
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_5b3d00f3(entity)
{
	self.var_6ca50f69 = undefined;
	awareness::function_b9f81e8b(entity);
}

/*
	Name: function_1ae9512e
	Namespace: namespace_98decc78
	Checksum: 0x639864A7
	Offset: 0x23B0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_1ae9512e(entity)
{
	if(is_true(entity.var_1fa24724))
	{
		/#
			record3dtext("", entity.origin, (1, 0.5, 0), "", entity);
		#/
	}
}

