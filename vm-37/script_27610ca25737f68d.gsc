#using script_2c5daa95f8fec03c;
#using script_35598499769dbb3d;
#using script_3f9e0dc8454d98e1;
#using script_4dc6a9b234b838e1;
#using script_72401f526ba71638;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_797fe2e7;

/*
	Name: function_89f2df9
	Namespace: namespace_797fe2e7
	Checksum: 0xBAB352AF
	Offset: 0x1D8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_607f0336b64df630", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_797fe2e7
	Checksum: 0xCB68E241
	Offset: 0x228
	Size: 0x474
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("missile", "" + #"hash_36112e7cad541b66", 1, 2, "int");
	clientfield::register("missile", "" + #"hash_2d55ead1309349bc", 1, 3, "int");
	level.var_887c77a4 = "destroyed_armor_zm";
	callback::on_ai_killed(&function_9b6145a);
	namespace_1b527536::function_36e0540e(#"energy_mine", 1, 30, "field_upgrade_energy_mine_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_4ac402a4add2a995", 2, 30, "field_upgrade_energy_mine_1_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_4ac3ffa4add2a47c", 2, 30, "field_upgrade_energy_mine_2_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_4ac400a4add2a62f", 2, 30, "field_upgrade_energy_mine_3_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_4ac3fda4add2a116", 2, 30, "field_upgrade_energy_mine_4_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_4ac3fea4add2a2c9", 2, 30, "field_upgrade_energy_mine_5_item_sr");
	namespace_1b527536::function_dbd391bf(#"energy_mine", &function_a6da15be);
	namespace_1b527536::function_dbd391bf(#"hash_4ac402a4add2a995", &function_a6da15be);
	namespace_1b527536::function_dbd391bf(#"hash_4ac3ffa4add2a47c", &function_a6da15be);
	namespace_1b527536::function_dbd391bf(#"hash_4ac400a4add2a62f", &function_a6da15be);
	namespace_1b527536::function_dbd391bf(#"hash_4ac3fda4add2a116", &function_a6da15be);
	namespace_1b527536::function_dbd391bf(#"hash_4ac3fea4add2a2c9", &function_a6da15be);
	zm_weapons::function_404c3ad5(getweapon(#"energy_mine"), &function_1ac47afc);
	zm_weapons::function_404c3ad5(getweapon(#"hash_4ac402a4add2a995"), &function_1ac47afc);
	zm_weapons::function_404c3ad5(getweapon(#"hash_4ac3ffa4add2a47c"), &function_1ac47afc);
	zm_weapons::function_404c3ad5(getweapon(#"hash_4ac400a4add2a62f"), &function_1ac47afc);
	zm_weapons::function_404c3ad5(getweapon(#"hash_4ac3fda4add2a116"), &function_a68304b6);
	zm_weapons::function_404c3ad5(getweapon(#"hash_4ac3fea4add2a2c9"), &function_a68304b6);
}

/*
	Name: function_a6da15be
	Namespace: namespace_797fe2e7
	Checksum: 0x57FD1A9F
	Offset: 0x6A8
	Size: 0x3CA
	Parameters: 1
	Flags: Linked
*/
function function_a6da15be(params)
{
	self namespace_1b527536::function_460882e2(1);
	weapon = params.weapon;
	e_mine = params.projectile;
	var_f61738a0 = 0;
	b_stun = 0;
	var_f224b687 = 1;
	var_29030410 = 1;
	var_79e920ac = 1;
	switch(weapon.name)
	{
		case "energy_mine":
		case "hash_4ac402a4add2a995":
		{
			break;
		}
		case "hash_4ac3ffa4add2a47c":
		{
			var_29030410 = 2;
			var_79e920ac = 2;
			break;
		}
		case "hash_4ac400a4add2a62f":
		{
			var_f61738a0 = 1;
			var_f224b687 = 2;
			var_29030410 = 2;
			var_79e920ac = 3;
			break;
		}
		case "hash_4ac3fda4add2a116":
		{
			var_f61738a0 = 1;
			var_f224b687 = 2;
			var_29030410 = 2;
			var_79e920ac = 3;
			break;
		}
		case "hash_4ac3fea4add2a2c9":
		{
			var_f61738a0 = 1;
			b_stun = 1;
			var_f224b687 = 3;
			var_29030410 = 3;
			var_79e920ac = 4;
			break;
		}
	}
	v_origin = e_mine.origin;
	e_mine function_1e6559d5(var_29030410);
	if(isdefined(e_mine))
	{
		e_mine function_a24e7103(self, 100);
	}
	if(isdefined(e_mine))
	{
		e_mine notify(#"hash_6aba376e9b4ede6f");
		e_mine clientfield::set("" + #"hash_36112e7cad541b66", 0);
		e_mine clientfield::set("" + #"hash_2d55ead1309349bc", var_79e920ac);
		v_origin = e_mine.origin;
	}
	wait(0.6);
	if(isdefined(e_mine))
	{
		if(isplayer(self))
		{
			e_mine detonate(self);
		}
		else
		{
			e_mine detonate();
		}
	}
	for(i = 0; i < var_f224b687; i++)
	{
		if(i >= 1)
		{
			if(isplayer(self))
			{
				e_mine = self magicgrenadeplayer(getweapon(#"hash_7e4053e6965bafa7"), v_origin, (0, 0, 0));
				e_mine detonate(self);
			}
			else
			{
				return;
			}
		}
		a_ai_targets = function_3655d156(self, weapon.explosionradius, v_origin);
		self thread function_71efd0e6(a_ai_targets, v_origin, var_f61738a0, b_stun);
		wait(1);
	}
}

/*
	Name: function_71efd0e6
	Namespace: namespace_797fe2e7
	Checksum: 0x4B430829
	Offset: 0xA80
	Size: 0x15E
	Parameters: 4
	Flags: Linked, Private
*/
function private function_71efd0e6(a_ai_targets, v_origin, var_f61738a0, b_stun)
{
	if(!isdefined(var_f61738a0))
	{
		var_f61738a0 = 0;
	}
	if(!isdefined(b_stun))
	{
		b_stun = 0;
	}
	foreach(ai in a_ai_targets)
	{
		if(!isalive(ai))
		{
			continue;
		}
		if(var_f61738a0 && ai.var_6f84b820 === #"normal")
		{
			ai zombie_utility::setup_zombie_knockdown(v_origin);
		}
		if(b_stun && ai.var_6f84b820 === #"special")
		{
			ai ai::function_62795e55();
			ai ai::stun();
		}
		waitframe(1);
	}
}

/*
	Name: function_1e6559d5
	Namespace: namespace_797fe2e7
	Checksum: 0xD1FFCFD0
	Offset: 0xBE8
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1e6559d5(var_29030410)
{
	self endon(#"death", #"hash_6aba376e9b4ede6f");
	/#
	#/
	self util::waittillnotmoving();
	wait(0.5);
	self clientfield::set("" + #"hash_36112e7cad541b66", var_29030410);
}

/*
	Name: function_a24e7103
	Namespace: namespace_797fe2e7
	Checksum: 0xBE10D3B0
	Offset: 0xC90
	Size: 0x74
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a24e7103(e_player, n_radius)
{
	self endon(#"death");
	while(true)
	{
		a_ai_targets = self function_3655d156(e_player, n_radius, self.origin);
		if(a_ai_targets.size)
		{
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_3655d156
	Namespace: namespace_797fe2e7
	Checksum: 0x32BD9596
	Offset: 0xD10
	Size: 0x8A
	Parameters: 3
	Flags: Linked, Private
*/
function private function_3655d156(e_player, n_radius, v_origin)
{
	if(isdefined(e_player))
	{
		a_ai_targets = e_player function_bdda420f(v_origin, n_radius);
	}
	else
	{
		a_ai_targets = getaiteamarray(level.zombie_team);
	}
	a_ai_targets = arraysortclosest(a_ai_targets, v_origin, undefined, 0, n_radius);
	return a_ai_targets;
}

/*
	Name: function_39aea6b8
	Namespace: namespace_797fe2e7
	Checksum: 0xCD87A46F
	Offset: 0xDA8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_39aea6b8(name)
{
	if(!isdefined(name))
	{
		return false;
	}
	switch(name)
	{
		case "energy_mine":
		case "hash_4ac3fda4add2a116":
		case "hash_4ac3fea4add2a2c9":
		case "hash_4ac3ffa4add2a47c":
		case "hash_4ac400a4add2a62f":
		case "hash_4ac402a4add2a995":
		{
			return true;
			break;
		}
	}
	return false;
}

/*
	Name: function_1ac47afc
	Namespace: namespace_797fe2e7
	Checksum: 0x7D74C4EC
	Offset: 0xE48
	Size: 0xDA
	Parameters: 15
	Flags: Linked
*/
function function_1ac47afc(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, modelindex, surfacetype, vsurfacenormal)
{
	if(isentity(surfacetype) && isplayer(vsurfacenormal) && self.var_6f84b820 === #"normal")
	{
		self.var_6d683e5a = surfacetype.origin;
	}
}

/*
	Name: function_a68304b6
	Namespace: namespace_797fe2e7
	Checksum: 0x54CF0510
	Offset: 0xF30
	Size: 0x104
	Parameters: 15
	Flags: Linked
*/
function function_a68304b6(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, modelindex, surfacetype, vsurfacenormal)
{
	if(isentity(surfacetype) && isplayer(vsurfacenormal) && self.var_6f84b820 === #"normal")
	{
		self.var_6d683e5a = surfacetype.origin;
	}
	if(isplayer(vsurfacenormal))
	{
		namespace_81245006::function_76e239dc(self, vsurfacenormal);
	}
}

/*
	Name: function_9b6145a
	Namespace: namespace_797fe2e7
	Checksum: 0x8689CD86
	Offset: 0x1040
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9b6145a(params)
{
	if(function_39aea6b8(params.weapon.name) && isplayer(params.eattacker) && self.var_6f84b820 === #"normal" && isvec(self.var_6d683e5a))
	{
		self namespace_cc411409::function_706a56ae(self.var_6d683e5a, 2);
		self thread function_3fb4ce3b();
	}
}

/*
	Name: function_3fb4ce3b
	Namespace: namespace_797fe2e7
	Checksum: 0xF49DD157
	Offset: 0x1110
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_3fb4ce3b()
{
	util::wait_network_frame();
	if(isdefined(self))
	{
		if(self.health < -300)
		{
			if(math::cointoss())
			{
				gibserverutils::annihilate(self);
			}
			else
			{
				self zombie_utility::gib_random_parts();
			}
		}
		else
		{
			self zombie_utility::gib_random_parts();
		}
	}
}

