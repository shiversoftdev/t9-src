#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_player.gsc;
#using script_7bdcff4f92f3d220;
#using script_61828ad9e71c6616;
#using scripts\core_common\flag_shared.gsc;
#using script_4108035fe400ce67;
#using script_72d96920f15049b8;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace chopper_gunner;

/*
	Name: function_b5f64519
	Namespace: chopper_gunner
	Checksum: 0xC919AF92
	Offset: 0x1A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b5f64519()
{
	level notify(1069867418);
}

/*
	Name: __init__system__
	Namespace: chopper_gunner
	Checksum: 0x735B9946
	Offset: 0x1C0
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"chopper_gunner", &function_70a657d8, undefined, &function_3675de8b, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: chopper_gunner
	Checksum: 0x1AC8B633
	Offset: 0x220
	Size: 0x15E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "" + #"hash_164696e86d29988d", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_dae8b06d746fac5", 8000, 1, "int");
	level.var_2d4792e7 = &function_5160bb1e;
	level.var_80f71aee = &function_425e60e5;
	level.var_399dc69a = &function_6c2b8199;
	level.var_fcad39fb = int(30 * 1000);
	namespace_e8c18978::function_70a657d8("killstreak_chopper_gunner" + "_zm");
	zm_player::register_player_damage_callback(&function_728f72a5);
	callback::on_ai_killed(&on_ai_killed);
}

/*
	Name: function_3675de8b
	Namespace: chopper_gunner
	Checksum: 0xF92A0667
	Offset: 0x388
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3675de8b()
{
	killstreaks::function_7b6102ed("chopper_gunner");
	killstreaks::function_353a9ccd("chopper_gunner", &function_e08f14b3);
	killstreaks::function_39c0c22a("chopper_gunner", &function_7948e616);
	killstreaks::function_7b6102ed("inventory_chopper_gunner");
	killstreaks::function_353a9ccd("inventory_chopper_gunner", &function_e08f14b3);
	killstreaks::function_39c0c22a("inventory_chopper_gunner", &function_7948e616);
	namespace_e8c18978::function_3675de8b();
}

/*
	Name: on_ai_killed
	Namespace: chopper_gunner
	Checksum: 0xD007B8F0
	Offset: 0x478
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function on_ai_killed(params)
{
	if(isdefined(level.chopper_gunner) && level.chopper_gunner.owner === params.eattacker && params.weapon === getweapon(#"hash_1734871fef9c0549"))
	{
		level.chopper_gunner endon(#"killed", #"death");
		params.eattacker endon(#"gunner_left");
		level.chopper_gunner namespace_e8c18978::function_631f02c5();
	}
}

/*
	Name: function_7948e616
	Namespace: chopper_gunner
	Checksum: 0x5AF3266D
	Offset: 0x550
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_7948e616()
{
	if(function_e08f14b3())
	{
		self.var_baf4657c = 1;
		self killstreakrules::function_65739e7b("chopper_gunner");
		return false;
	}
	if(is_true(level.chopper_gunner.shuttingdown))
	{
		return false;
	}
	return true;
}

/*
	Name: function_e08f14b3
	Namespace: chopper_gunner
	Checksum: 0x5415E356
	Offset: 0x5C8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_e08f14b3()
{
	if(isdefined(level.chopper_gunner))
	{
		return true;
	}
	return false;
}

/*
	Name: function_5160bb1e
	Namespace: chopper_gunner
	Checksum: 0x77856011
	Offset: 0x5F0
	Size: 0x280
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5160bb1e(killstreaktype)
{
	player = self;
	player endon(#"disconnect");
	level endon(#"end_game");
	/#
		assert(!isdefined(level.chopper_gunner));
	#/
	if(!player killstreakrules::function_71e94a3b())
	{
		player.var_baf4657c = 1;
		player killstreakrules::function_65739e7b("chopper_gunner");
		return;
	}
	player.var_1bee6f4b = 1;
	if(zm_utility::function_c200446c() && isdefined(level.deathcircle))
	{
		player clientfield::increment("deathcircleopacityflag");
	}
	player thread function_48170f5e();
	if(zm_utility::is_survival() && !level flag::get(#"objective_locked"))
	{
		level.var_d5ad2e35 = 1;
		player.var_7cadce77 = player function_e6d10d94();
	}
	else
	{
		level.var_d5ad2e35 = undefined;
		player.var_7cadce77 = player function_e6d10d94();
	}
	player thread watch_for_laststand();
	if(!player isonground())
	{
		var_d6940e18 = 0;
	}
	else
	{
		var_d6940e18 = namespace_e8c18978::function_5160bb1e(killstreaktype);
	}
	if(var_d6940e18)
	{
		player.var_b23648ce = gettime();
		if(isbot(player))
		{
			player thread function_25d9a09f(level.chopper_gunner);
		}
	}
	else
	{
		player notify(#"hash_44a9bac1e035f9a3");
		player val::reset(#"chopper_gunner", "ignoreme");
	}
	return var_d6940e18;
}

/*
	Name: function_425e60e5
	Namespace: chopper_gunner
	Checksum: 0x54056B70
	Offset: 0x878
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_425e60e5()
{
	self clientfield::set_to_player("" + #"hash_dae8b06d746fac5", 1);
}

/*
	Name: function_6c2b8199
	Namespace: chopper_gunner
	Checksum: 0xE4CCB98B
	Offset: 0x8B8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_6c2b8199()
{
	self clientfield::set_to_player("" + #"hash_dae8b06d746fac5", 0);
}

/*
	Name: function_e6d10d94
	Namespace: chopper_gunner
	Checksum: 0x257D9D94
	Offset: 0x8F0
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_e6d10d94()
{
	if(isdefined(level.var_97e461d4))
	{
		return level.var_97e461d4;
	}
	if(isarray(level.var_b3e433ae))
	{
		foreach(volume_name in level.var_b3e433ae)
		{
			var_7aad75a5 = getent(volume_name, "targetname");
			if(isdefined(var_7aad75a5))
			{
				if(istouching(self.origin, var_7aad75a5))
				{
					return volume_name;
				}
			}
		}
	}
	if(isdefined(level.var_fd959dcf))
	{
		return level.var_fd959dcf;
	}
}

/*
	Name: function_24fbd61e
	Namespace: chopper_gunner
	Checksum: 0x74812840
	Offset: 0xA18
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_24fbd61e()
{
	if(is_true(self.var_1bee6f4b))
	{
		if(isdefined(self.var_b23648ce))
		{
			time = gettime();
			time = (float(time - self.var_b23648ce)) / 1000;
			if(time <= 5)
			{
				self thread function_bfba820f();
			}
		}
		namespace_e8c18978::function_cf58dcdd(self, 1);
	}
}

/*
	Name: function_bfba820f
	Namespace: chopper_gunner
	Checksum: 0x720C57E5
	Offset: 0xAC8
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_bfba820f()
{
	self endon(#"death");
	var_1120bf0 = self.inventory.items[17];
	count = 0;
	while(var_1120bf0.var_bd027dd9 != 32767 || count > 300)
	{
		var_1120bf0 = self.inventory.items[17];
		count++;
		waitframe(1);
	}
	if(var_1120bf0.var_bd027dd9 == 32767)
	{
		itempoint = function_4ba8fde(#"hash_541f29266c6b7df8");
		if(isdefined(itempoint))
		{
			item_world::function_de2018e3(itempoint, self, 17);
		}
	}
}

/*
	Name: function_48170f5e
	Namespace: chopper_gunner
	Checksum: 0xB6D8C7E0
	Offset: 0xBC8
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function function_48170f5e()
{
	level endon(#"end_game");
	self endon(#"disconnect", #"hash_44a9bac1e035f9a3");
	self waittill(#"using_remote");
	waitresult = undefined;
	waitresult = self waittilltimeout(0, #"gunner_left");
	if(waitresult._notify != "timeout")
	{
		return;
	}
	self val::set(#"chopper_gunner", "ignoreme", 1);
	self val::set(#"chopper_gunner", "takedamage", 0);
	self waittill(#"gunner_left");
	wait(2);
	if(isplayer(self))
	{
		self.var_1bee6f4b = undefined;
		self val::reset(#"chopper_gunner", "ignoreme");
		self val::reset(#"chopper_gunner", "takedamage");
	}
}

/*
	Name: watch_for_laststand
	Namespace: chopper_gunner
	Checksum: 0x3EBBE669
	Offset: 0xD50
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function watch_for_laststand()
{
	level endon(#"end_game");
	self endon(#"disconnect", #"gunner_left");
	if(!is_true(self.laststand))
	{
		self waittill(#"player_downed");
	}
	if(isplayer(self))
	{
		self.var_1bee6f4b = undefined;
		self val::reset(#"chopper_gunner", "ignoreme");
		self val::reset(#"chopper_gunner", "takedamage");
	}
	var_961b6686 = level.chopper_gunner;
	if(isdefined(var_961b6686))
	{
		var_961b6686 notify(#"hash_623a20b6b2608171");
	}
	level thread namespace_e8c18978::function_cf58dcdd(self, 1);
}

/*
	Name: function_25d9a09f
	Namespace: chopper_gunner
	Checksum: 0xA879A6C
	Offset: 0xE88
	Size: 0x294
	Parameters: 1
	Flags: Linked
*/
function function_25d9a09f(vehicle)
{
	vehicle endon(#"hash_6668be249f2eab45");
	self endon(#"disconnect");
	waitframe(1);
	while(self isremotecontrolling())
	{
		enemies = getaiteamarray(level.zombie_team);
		enemies = array::randomize(enemies);
		foreach(var_607bb54c in enemies)
		{
			if(isalive(var_607bb54c))
			{
				enemy = var_607bb54c;
				break;
			}
		}
		if(isdefined(enemy))
		{
			vectorfromenemy = vectornormalize((vehicle.origin - enemy.origin[0], vehicle.origin - enemy.origin[1], 0));
			vehicle turretsettarget(0, enemy);
			vehicle waittilltimeout(1, #"turret_on_target");
			vehicle vehicle_ai::fire_for_time(2 + randomfloat(0.8), 0, enemy);
			vehicle vehicle_ai::fire_for_rounds(1, 1, enemy);
			vehicle turretcleartarget(0);
			vehicle turretsettargetangles(0, vectorscale((1, 0, 0), 15));
			if(isdefined(enemy))
			{
				wait(2 + randomfloat(0.5));
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_728f72a5
	Namespace: chopper_gunner
	Checksum: 0xF1857839
	Offset: 0x1128
	Size: 0x92
	Parameters: 10
	Flags: Linked, Private
*/
function private function_728f72a5(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(shitloc === self && psoffsettime == getweapon(#"hash_1734871fef9c0549"))
	{
		return 0;
	}
	return -1;
}

