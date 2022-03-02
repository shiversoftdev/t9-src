#using script_2c5daa95f8fec03c;
#using script_3f9e0dc8454d98e1;
#using script_41fe08c37d53a635;
#using script_62caa307a394c18c;
#using script_7e59d7bba853fe4b;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_8652b0d1;

/*
	Name: function_85e602e4
	Namespace: namespace_8652b0d1
	Checksum: 0xF1026ACC
	Offset: 0x318
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_85e602e4()
{
	level notify(1724733573);
}

/*
	Name: function_4e14a881
	Namespace: namespace_8652b0d1
	Checksum: 0xAADC7E77
	Offset: 0x338
	Size: 0x304
	Parameters: 0
	Flags: Linked
*/
function function_4e14a881()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_2537d92585f4fce2")))
	{
		level.var_1f737c8b = 1;
	}
	aat::register("ammomod_shatterblast", 0.33, 0, 25, 3, 1, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", undefined, #"explosive", undefined, #"hash_72956c8c7153f157");
	aat::register("ammomod_shatterblast_1", 0.33, 0, 25, 3, 1, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", undefined, #"explosive", undefined, #"hash_72956c8c7153f157");
	aat::register("ammomod_shatterblast_2", 0.33, 0, 25, 3, 1, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", undefined, #"explosive", undefined, #"hash_72956c8c7153f157");
	aat::register("ammomod_shatterblast_3", 0.33, 0, 25, 3, 1, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", undefined, #"explosive", undefined, #"hash_72956c8c7153f157");
	aat::register("ammomod_shatterblast_4", 0.33, 0, 25, 3, 1, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", undefined, #"explosive", undefined, #"hash_72956c8c7153f157");
	aat::register("ammomod_shatterblast_5", 0.33, 0, 25, 3, 1, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", undefined, #"explosive", undefined, #"hash_72956c8c7153f157");
	clientfield::register("toplayer", "ammomod_shatterblast_proc", 6000, 1, "counter");
}

/*
	Name: function_93e5316a
	Namespace: namespace_8652b0d1
	Checksum: 0xD7DFFBCE
	Offset: 0x648
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_93e5316a(aat_name)
{
	switch(aat_name)
	{
		case "hash_a182150036cabd3":
		default:
		{
			return 0;
			break;
		}
		case "hash_150508b33f9c83ef":
		{
			return 1;
			break;
		}
		case "hash_150509b33f9c85a2":
		{
			return 2;
			break;
		}
		case "hash_15050ab33f9c8755":
		{
			return 3;
			break;
		}
		case "hash_150503b33f9c7b70":
		{
			return 4;
			break;
		}
		case "hash_150504b33f9c7d23":
		{
			return 5;
			break;
		}
	}
	return 0;
}

/*
	Name: result
	Namespace: namespace_8652b0d1
	Checksum: 0xE8DBB26B
	Offset: 0x720
	Size: 0x1DC
	Parameters: 8
	Flags: Linked
*/
function result(death, attacker, mod, weapon, var_fd90b0bb, vpoint, shitloc, boneindex)
{
	if(!isdefined(shitloc))
	{
		shitloc = self.origin;
	}
	if(is_true(level.var_1f737c8b))
	{
		return;
	}
	if(!isactor(self) && !isvehicle(self))
	{
		return;
	}
	if(!isplayer(var_fd90b0bb))
	{
		return;
	}
	if(self.var_18bdc30 === #"boss")
	{
		return;
	}
	aat_name = var_fd90b0bb aat::getaatonweapon(vpoint, 1);
	tier = function_93e5316a(aat_name);
	var_fd90b0bb clientfield::increment_to_player("ammomod_shatterblast_proc", 1);
	playfx("zm_weapons/fx9_aat_bul_impact_explosive", shitloc);
	var_fd90b0bb zm_utility::function_5d356609(aat_name, tier);
	self function_ddd30474(var_fd90b0bb, vpoint, shitloc, boneindex, tier);
	if(tier >= 5 && function_9465e5f8(var_fd90b0bb))
	{
		level thread function_eb81be7e(var_fd90b0bb, vpoint, boneindex, shitloc);
	}
}

/*
	Name: function_2f3ba0ef
	Namespace: namespace_8652b0d1
	Checksum: 0xEBAAFF96
	Offset: 0x908
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function function_2f3ba0ef(center)
{
	angle = randomint(360);
	x_pos = center[0] + (64 * cos(angle));
	y_pos = center[1] + (64 * sin(angle));
	var_636e904a = center[2] + (randomintrange(64 * -1, 64));
	var_f84680ae = (x_pos, y_pos, var_636e904a);
	return var_f84680ae;
}

/*
	Name: function_eb81be7e
	Namespace: namespace_8652b0d1
	Checksum: 0xD69D575B
	Offset: 0xA00
	Size: 0x322
	Parameters: 4
	Flags: Linked
*/
function function_eb81be7e(attacker, weapon, shitloc, vpoint)
{
	level endon(#"game_ended");
	if(isplayer(attacker))
	{
		attacker.aat_cooldown_start[#"hash_79b39f3766407263"] = float(gettime()) / 1000;
	}
	attacker endon(#"disconnected");
	var_624e473c = function_2f3ba0ef(vpoint);
	var_6f76e171 = function_2f3ba0ef(vpoint);
	var_623746f2 = function_2f3ba0ef(vpoint);
	var_ae78e48a = spawn("script_model", vpoint);
	var_3c3a800f = spawn("script_model", vpoint);
	var_5309adad = spawn("script_model", vpoint);
	var_ae78e48a setmodel("tag_origin");
	var_3c3a800f setmodel("tag_origin");
	var_5309adad setmodel("tag_origin");
	playfxontag("zm_weapons/fx9_aat_shatterblast_lvl5_aoe_trail", var_ae78e48a, "tag_origin");
	playfxontag("zm_weapons/fx9_aat_shatterblast_lvl5_aoe_trail", var_3c3a800f, "tag_origin");
	playfxontag("zm_weapons/fx9_aat_shatterblast_lvl5_aoe_trail", var_5309adad, "tag_origin");
	time1 = randomfloatrange(0.4, 0.7);
	time2 = randomfloatrange(0.4, 0.7);
	time3 = randomfloatrange(0.4, 0.7);
	var_ae78e48a thread function_a97aaed0(attacker, weapon, shitloc, var_624e473c);
	wait(time1);
	var_3c3a800f thread function_a97aaed0(attacker, weapon, shitloc, var_6f76e171);
	wait(time2);
	var_5309adad thread function_a97aaed0(attacker, weapon, shitloc, var_623746f2);
	wait(time3);
}

/*
	Name: function_a97aaed0
	Namespace: namespace_8652b0d1
	Checksum: 0x9A6B5DAE
	Offset: 0xD30
	Size: 0xB4
	Parameters: 4
	Flags: Linked
*/
function function_a97aaed0(attacker, weapon, shitloc, point)
{
	self endon(#"death");
	self moveto(point, 0.2);
	self waittill(#"movedone");
	level thread function_aa443b97(attacker, weapon, shitloc, point, 5, 1);
	self deletedelay();
}

/*
	Name: function_945cac2d
	Namespace: namespace_8652b0d1
	Checksum: 0x78857530
	Offset: 0xDF0
	Size: 0x17C
	Parameters: 4
	Flags: Linked
*/
function function_945cac2d(damage, attacker, weapon, shitloc)
{
	self namespace_42457a0::function_601fabe9(#"explosive", damage, self.origin, attacker, undefined, "none", "MOD_AAT", 0, weapon);
	var_84ed9a13 = namespace_81245006::function_3131f5dd(self, shitloc, 1);
	if(isdefined(var_84ed9a13) && is_true(var_84ed9a13.var_b98c4585))
	{
		if(namespace_81245006::function_f29756fe(var_84ed9a13) == 1 && var_84ed9a13.type == #"armor" && var_84ed9a13.health > 0)
		{
			namespace_81245006::function_ef87b7e8(var_84ed9a13, var_84ed9a13.health);
		}
		if(namespace_81245006::function_f29756fe(var_84ed9a13) === 3 && isdefined(var_84ed9a13.var_f371ebb0))
		{
			destructserverutils::function_8475c53a(self, var_84ed9a13.var_f371ebb0);
		}
	}
}

/*
	Name: function_aa443b97
	Namespace: namespace_8652b0d1
	Checksum: 0x36C0168E
	Offset: 0xF78
	Size: 0x3E0
	Parameters: 6
	Flags: Linked
*/
function function_aa443b97(attacker, weapon, shitloc, vpoint, tier, extra)
{
	if(!isdefined(extra))
	{
		extra = 0;
	}
	playrumbleonposition("grenade_rumble", vpoint);
	range = 64;
	if(!extra)
	{
		if(tier >= 4)
		{
			playfx("zm_weapons/fx9_aat_shatterblast_lvl4_exp", vpoint);
			range = 128;
		}
		else
		{
			playfx("zm_weapons/fx9_aat_shatterblast_lvl1_exp", vpoint);
		}
	}
	else
	{
		playfx("zm_weapons/fx9_aat_shatterblast_lvl5_aoe_exp_single", vpoint);
	}
	a_potential_targets = getentitiesinradius(vpoint, range, 15);
	foreach(zombie in a_potential_targets)
	{
		if(!isalive(zombie))
		{
			continue;
		}
		damage = 100;
		if(zm_utility::is_survival())
		{
			damage = zm_equipment::function_739fbb72(damage);
		}
		else
		{
			damage = zm_equipment::function_379f6b5d(damage);
		}
		if(damage >= zombie.health)
		{
			zombie.var_531d35d4 = 1;
		}
		if(tier >= 2)
		{
			if(zombie.var_6f84b820 === #"normal")
			{
				namespace_81245006::function_76e239dc(zombie, weapon);
			}
		}
		zombie namespace_42457a0::function_601fabe9(#"explosive", damage, zombie.origin, weapon, undefined, "none", "MOD_AAT", 0, shitloc);
		if(isalive(zombie))
		{
			if(tier >= 3)
			{
				if(zombie.var_6f84b820 === #"normal")
				{
					zombie zombie_utility::setup_zombie_knockdown(vpoint);
				}
			}
		}
		else
		{
			v_curr_zombie_origin = zombie getcentroid();
			n_random_x = randomfloatrange(-3, 3);
			n_random_y = randomfloatrange(-3, 3);
			zombie startragdoll(1);
			zombie launchragdoll(60 * (vectornormalize((v_curr_zombie_origin - vpoint) + (n_random_x, n_random_y, 10))), "torso_lower");
		}
		util::wait_network_frame();
	}
}

/*
	Name: function_ddd30474
	Namespace: namespace_8652b0d1
	Checksum: 0xF4F21271
	Offset: 0x1360
	Size: 0x144
	Parameters: 5
	Flags: Linked
*/
function function_ddd30474(attacker, weapon, vpoint, shitloc, tier)
{
	playrumbleonposition("grenade_rumble", vpoint);
	if(tier >= 1)
	{
		level thread function_aa443b97(attacker, weapon, shitloc, vpoint, tier);
	}
	else
	{
		playfx("zm_weapons/fx9_aat_shatterblast_lvl0_exp", vpoint);
	}
	if(isalive(self))
	{
		damage = 100;
		if(zm_utility::is_survival())
		{
			damage = zm_equipment::function_739fbb72(damage);
		}
		else
		{
			damage = zm_equipment::function_379f6b5d(damage);
		}
		if(damage >= self.health)
		{
			self.var_531d35d4 = 1;
		}
		self function_945cac2d(damage, attacker, weapon, shitloc);
	}
}

/*
	Name: function_9465e5f8
	Namespace: namespace_8652b0d1
	Checksum: 0xF2986E02
	Offset: 0x14B0
	Size: 0xC2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9465e5f8(attacker)
{
	n_current_time = float(gettime()) / 1000;
	if(isplayer(attacker))
	{
		if(!isdefined(attacker.aat_cooldown_start[#"hash_79b39f3766407263"]))
		{
			return true;
		}
		if(isdefined(attacker.aat_cooldown_start[#"hash_79b39f3766407263"]) && n_current_time >= (attacker.aat_cooldown_start[#"hash_79b39f3766407263"] + 30))
		{
			return true;
		}
	}
	return false;
}

