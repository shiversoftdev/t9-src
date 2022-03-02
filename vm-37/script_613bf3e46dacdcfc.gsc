#using script_4108035fe400ce67;
#using script_61828ad9e71c6616;
#using script_72d96920f15049b8;
#using script_7bdcff4f92f3d220;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace chopper_gunner;

/*
	Name: function_89f2df9
	Namespace: chopper_gunner
	Checksum: 0xC1BCA5DE
	Offset: 0x160
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"chopper_gunner", &function_70a657d8, undefined, &function_3675de8b, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: chopper_gunner
	Checksum: 0xBB6D4ABF
	Offset: 0x1C0
	Size: 0xEE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "" + #"hash_164696e86d29988d", 1, 1, "int");
	level.var_2d4792e7 = &function_5160bb1e;
	level.var_fcad39fb = int(30 * 1000);
	namespace_e8c18978::function_70a657d8("killstreak_chopper_gunner" + "_zm");
	zm_player::register_player_damage_callback(&function_728f72a5);
	callback::on_ai_killed(&on_ai_killed);
}

/*
	Name: function_3675de8b
	Namespace: chopper_gunner
	Checksum: 0x467AB5BE
	Offset: 0x2B8
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3675de8b()
{
	killstreaks::function_7b6102ed("chopper_gunner");
	killstreaks::function_353a9ccd("chopper_gunner", &function_e08f14b3);
	killstreaks::function_39c0c22a("chopper_gunner", &function_7948e616);
	namespace_e8c18978::function_3675de8b();
	if(zm_utility::is_survival())
	{
		level.var_d5ad2e35 = 1;
	}
}

/*
	Name: on_ai_killed
	Namespace: chopper_gunner
	Checksum: 0x8C0CC95
	Offset: 0x360
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
	Checksum: 0x5A581991
	Offset: 0x438
	Size: 0x44
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
	return true;
}

/*
	Name: function_e08f14b3
	Namespace: chopper_gunner
	Checksum: 0x761C638C
	Offset: 0x488
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
	Checksum: 0x3ACBA573
	Offset: 0x4B0
	Size: 0x1F8
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
	if(!player killstreakrules::function_34884f54())
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
	player.var_7cadce77 = player zm_zonemgr::function_e6d10d94();
	player thread watch_for_laststand();
	var_d6940e18 = namespace_e8c18978::function_5160bb1e(killstreaktype);
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
	Name: function_24fbd61e
	Namespace: chopper_gunner
	Checksum: 0x23503294
	Offset: 0x6B0
	Size: 0xA4
	Parameters: 0
	Flags: None
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
	Checksum: 0x4C518207
	Offset: 0x760
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
		var_d90e0e15 = function_4ba8fde(#"hash_541f29266c6b7df8");
		if(isdefined(var_d90e0e15))
		{
			item_world::function_de2018e3(var_d90e0e15, self, 17);
		}
	}
}

/*
	Name: function_48170f5e
	Namespace: chopper_gunner
	Checksum: 0xC159BE99
	Offset: 0x860
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
	Checksum: 0x36162503
	Offset: 0x9E8
	Size: 0xBC
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
	Checksum: 0x7E8922EE
	Offset: 0xAB0
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
	Checksum: 0x52C4EB99
	Offset: 0xD50
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

