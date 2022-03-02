#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_24c32478acf44108;
#using script_3f9e0dc8454d98e1;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_6fc19861;

/*
	Name: function_92bf3fd3
	Namespace: namespace_6fc19861
	Checksum: 0x78E04667
	Offset: 0x260
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_92bf3fd3()
{
	level notify(1583989439);
}

/*
	Name: function_89f2df9
	Namespace: namespace_6fc19861
	Checksum: 0xE85F1F9E
	Offset: 0x280
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4c62174ea005e84e", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_6fc19861
	Checksum: 0x1D916AF4
	Offset: 0x2D8
	Size: 0x88C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_e23957a9 = getweapon(#"hash_69461751fa492ea4");
	level.var_948e5165 = getweapon(#"hash_18696150427f2efb");
	level.var_dfc68c44 = getweapon(#"hash_5382c3fae4273fed");
	level.var_3e316c1b = getweapon(#"hash_7eab88123b09e2c");
	level.var_386befd7 = 22500;
	level.var_b8885484 = 750 / 20;
	callback::function_f77ced93(&function_16139ef4);
	callback::on_ai_killed(&function_e339e720);
	callback::on_ai_damage(&function_709843c2);
	callback::function_10a4dd0a(&function_10a4dd0a);
	callback::function_7897dfe6(&function_7897dfe6);
	callback::on_connect(&on_player_connect);
	if(!isdefined(level.var_91f71aa))
	{
		level.var_91f71aa = [];
	}
	else if(!isarray(level.var_91f71aa))
	{
		level.var_91f71aa = array(level.var_91f71aa);
	}
	level.var_91f71aa[#"hash_7ee7b21a68b25ce6"] = &function_d243e3bc;
	level.var_91f71aa[#"hash_481a7553aa1b07b2"] = &function_6492d995;
	if(!isdefined(level.var_6e197241))
	{
		level.var_6e197241 = [];
	}
	else if(!isarray(level.var_6e197241))
	{
		level.var_6e197241 = array(level.var_6e197241);
	}
	level.var_6e197241[#"hash_69461751fa492ea4"] = 1;
	level.var_6e197241[#"hash_5382c3fae4273fed"] = 1;
	if(!isdefined(level.var_299abeff))
	{
		level.var_299abeff = [];
	}
	else if(!isarray(level.var_299abeff))
	{
		level.var_299abeff = array(level.var_299abeff);
	}
	level.var_299abeff[#"hash_69461751fa492ea4"] = &function_5a35d482;
	level.var_299abeff[#"hash_5382c3fae4273fed"] = &function_5a35d482;
	level.var_299abeff[#"hash_18696150427f2efb"] = &function_5a35d482;
	level.var_299abeff[#"hash_7eab88123b09e2c"] = &function_5a35d482;
	if(!isdefined(level.var_3216bc47))
	{
		level.var_3216bc47 = [];
	}
	else if(!isarray(level.var_3216bc47))
	{
		level.var_3216bc47 = array(level.var_3216bc47);
	}
	level.var_3216bc47[#"hash_69461751fa492ea4"] = &function_f53bdacf;
	level.var_3216bc47[#"hash_5382c3fae4273fed"] = &function_f53bdacf;
	level.var_3216bc47[#"hash_18696150427f2efb"] = &function_f53bdacf;
	level.var_3216bc47[#"hash_7eab88123b09e2c"] = &function_f53bdacf;
	zm_weapons::function_90953640(level.var_e23957a9, 5, float(function_60d95f53()) / 1000);
	zm_weapons::function_90953640(level.var_948e5165, 5, float(function_60d95f53()) / 1000);
	zm_weapons::function_90953640(level.var_dfc68c44, 5, float(function_60d95f53()) / 1000);
	zm_weapons::function_90953640(level.var_3e316c1b, 5, float(function_60d95f53()) / 1000);
	clientfield::register("actor", "" + #"hash_d1d4ed99da50a4b", 28000, 1, "int");
	clientfield::register("actor", "" + #"hash_4189b622ab06c2d5", 28000, 1, "counter");
	clientfield::register("actor", "" + #"hash_5c2324e6d994b886", 28000, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_403f172f69819024", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_2b223a333ab436cd", 28000, 1, "int");
	clientfield::register("allplayers", "" + #"hash_5d6139b1ce0e7c82", 28000, 2, "int");
	clientfield::register("toplayer", "" + #"hash_13f32f06b0e858dd", 28000, 3, "int");
	namespace_9ff9f642::register_slowdown(#"hash_4d4e7225b8223af5", 0.75, 10);
	zm::function_84d343d(#"hash_18696150427f2efb", &function_adc762ac);
	zm::function_84d343d(#"hash_7eab88123b09e2c", &function_adc762ac);
	level.var_59505a17 = &function_565c848a;
	/#
		level thread function_e711fec1();
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_6fc19861
	Checksum: 0x7DE599D1
	Offset: 0xB70
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_8ac3bea9()
{
	zm_weapons::function_8389c033(#"hash_69461751fa492ea4", #"hash_69461751fa492ea4");
}

/*
	Name: on_player_connect
	Namespace: namespace_6fc19861
	Checksum: 0x757BC802
	Offset: 0xBB0
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private on_player_connect()
{
	self thread player_watch_max_ammo();
}

/*
	Name: player_watch_max_ammo
	Namespace: namespace_6fc19861
	Checksum: 0x11A3BF78
	Offset: 0xBD8
	Size: 0xA0
	Parameters: 0
	Flags: Private
*/
function private player_watch_max_ammo()
{
	self notify("5db0465ad2a70ea");
	self endon("5db0465ad2a70ea");
	self endon(#"death");
	while(true)
	{
		self waittill(#"zmb_max_ammo");
		waitframe(1);
		if(isdefined(self.var_c926b4fc))
		{
			self.var_c926b4fc = 5;
			self clientfield::set_to_player("" + #"hash_13f32f06b0e858dd", self.var_c926b4fc + 1);
		}
	}
}

/*
	Name: function_5a35d482
	Namespace: namespace_6fc19861
	Checksum: 0xB272BC3A
	Offset: 0xC80
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function function_5a35d482(weapon)
{
	if(self.var_c926b4fc === 5)
	{
		var_94459b80 = 1;
	}
	else
	{
		var_94459b80 = 0;
	}
	if(weapon.name === #"hash_69461751fa492ea4" || weapon.name === #"hash_5382c3fae4273fed")
	{
		var_dd403630 = weapon.altweapon;
	}
	else
	{
		var_dd403630 = weapon;
	}
	maxammo = var_dd403630.maxammo;
	var_53b14ebf = var_dd403630.clipsize;
	currentammostock = self getweaponammostock(var_dd403630);
	currentclipammo = self getweaponammoclip(var_dd403630);
	if(currentammostock < maxammo || currentclipammo < var_53b14ebf)
	{
		var_769cba68 = 0;
	}
	else
	{
		var_769cba68 = 1;
	}
	return var_94459b80 && var_769cba68;
}

/*
	Name: function_f53bdacf
	Namespace: namespace_6fc19861
	Checksum: 0xABFD7ACC
	Offset: 0xDC8
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_f53bdacf(weapon)
{
	if(weapon.name === #"hash_69461751fa492ea4" || weapon.name === #"hash_5382c3fae4273fed")
	{
		var_dd403630 = weapon.altweapon;
	}
	else
	{
		var_dd403630 = weapon;
	}
	self setweaponammoclip(var_dd403630, var_dd403630.clipsize);
	self setweaponammostock(var_dd403630, var_dd403630.maxammo);
	self.var_c926b4fc = 5;
	self clientfield::set_to_player("" + #"hash_13f32f06b0e858dd", self.var_c926b4fc + 1);
}

/*
	Name: function_16139ef4
	Namespace: namespace_6fc19861
	Checksum: 0x6EA26077
	Offset: 0xEC0
	Size: 0x2BC
	Parameters: 1
	Flags: None
*/
function function_16139ef4(params)
{
	var_d30a4554 = function_58d581b6(params.weapon);
	var_4f3bcf2b = function_58d581b6(params.last_weapon);
	if(var_d30a4554)
	{
		if(!var_4f3bcf2b)
		{
			self setactionslot(1, "altmode");
		}
		if(function_565c848a(params.weapon))
		{
			self thread function_db4bf625(params.weapon);
			self thread function_219565f5(params.weapon);
			self clientfield::set("" + #"hash_5d6139b1ce0e7c82", 1);
			if(!is_true(self.var_7fe71a4d))
			{
				self thread zm_equipment::show_hint_text(#"hash_43c861740b7191e5", 10);
				self.var_7fe71a4d = 1;
			}
		}
		else
		{
			self clientfield::set("" + #"hash_5d6139b1ce0e7c82", 2);
			if(!is_true(self.var_cbab3c85))
			{
				self thread zm_equipment::show_hint_text(#"hash_5f1191a53e87c640", 10);
				self.var_cbab3c85 = 1;
			}
		}
		if(!isdefined(self.var_c926b4fc))
		{
			self.var_c926b4fc = 5;
		}
		self clientfield::set_to_player("" + #"hash_13f32f06b0e858dd", self.var_c926b4fc + 1);
	}
	else if(!function_58d581b6(params.weapon) && function_58d581b6(params.last_weapon))
	{
		self setactionslot(1, "");
		self clientfield::set("" + #"hash_5d6139b1ce0e7c82", 0);
	}
}

/*
	Name: function_58d581b6
	Namespace: namespace_6fc19861
	Checksum: 0x4B164CAF
	Offset: 0x1188
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_58d581b6(weapon)
{
	return function_565c848a(weapon) || function_1b662278(weapon);
}

/*
	Name: function_565c848a
	Namespace: namespace_6fc19861
	Checksum: 0x2300F1A4
	Offset: 0x11D0
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_565c848a(weapon)
{
	if(isdefined(weapon))
	{
		var_1236db9d = zm_weapons::function_386dacbc(weapon).name;
		switch(var_1236db9d)
		{
			case "hash_5382c3fae4273fed":
			case "hash_69461751fa492ea4":
			{
				return true;
			}
			default:
			{
				return false;
			}
		}
	}
	return false;
}

/*
	Name: function_1b662278
	Namespace: namespace_6fc19861
	Checksum: 0xEC96AD4
	Offset: 0x1268
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_1b662278(weapon)
{
	if(isdefined(weapon))
	{
		var_1236db9d = zm_weapons::function_386dacbc(weapon).name;
		switch(var_1236db9d)
		{
			case "hash_7eab88123b09e2c":
			case "hash_18696150427f2efb":
			{
				return true;
			}
			default:
			{
				return false;
			}
		}
	}
	return false;
}

/*
	Name: function_e339e720
	Namespace: namespace_6fc19861
	Checksum: 0x1CADA3B1
	Offset: 0x1300
	Size: 0x29A
	Parameters: 1
	Flags: None
*/
function function_e339e720(s_params)
{
	if(isplayer(s_params.eattacker))
	{
		player = s_params.eattacker;
		if(function_565c848a(s_params.weapon) && s_params.smeansofdeath === "MOD_MELEE")
		{
			player.armor = player.armor + 10;
			player playsound(#"hash_4b89009623a94842");
			self zombie_utility::gib_random_parts();
			if(isdefined(self.var_fecf7735))
			{
				self zm_utility::function_ffc279(self.var_fecf7735 * 150, player, self.health, s_params.weapon);
			}
			if(!isdefined(player.var_f7e829c0))
			{
				player.var_f7e829c0 = 0;
			}
			if(!isdefined(player.var_2501c648))
			{
				player.var_2501c648 = 0;
			}
			switch(self.var_6f84b820)
			{
				case "normal":
				{
					var_161794b5 = 2 + player.var_2501c648;
					break;
				}
				case "special":
				{
					var_161794b5 = 10 + player.var_2501c648;
					break;
				}
				case "elite":
				{
					var_161794b5 = 25 + player.var_2501c648;
					break;
				}
				default:
				{
					var_161794b5 = 0;
				}
			}
			if(math::cointoss(var_161794b5))
			{
				player.var_f7e829c0 = 0;
				player.var_2501c648 = 0;
				var_d4d3b41a = function_4ba8fde(#"hash_481a7553aa1b07b2");
				self thread item_drop::drop_item(0, undefined, 1, 0, var_d4d3b41a.id, self.origin);
			}
			else
			{
				player.var_f7e829c0++;
				if(player.var_f7e829c0 >= 20)
				{
					player.var_2501c648 = player.var_2501c648 + 5;
				}
			}
		}
	}
}

/*
	Name: function_68ec4aa2
	Namespace: namespace_6fc19861
	Checksum: 0xBB7FA8E2
	Offset: 0x15A8
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function function_68ec4aa2()
{
	targets = getaispeciesarray(level.zombie_team, "all");
	return targets;
}

/*
	Name: function_7862c208
	Namespace: namespace_6fc19861
	Checksum: 0xB59EFF4C
	Offset: 0x15E8
	Size: 0x172
	Parameters: 0
	Flags: None
*/
function function_7862c208()
{
	if(isdefined(level.var_60a2b62c))
	{
		var_13ef9467 = [];
		foreach(var_b1af7735 in level.var_60a2b62c)
		{
			bundle = (isdefined(var_b1af7735.bundle) ? var_b1af7735.bundle : zm_utility::function_b42da08a(var_b1af7735));
			state = function_ffdbe8c2(var_b1af7735);
			if(is_true(var_b1af7735.var_c14aa186[state].ignoredamage))
			{
				continue;
				continue;
			}
			if(!isdefined(var_13ef9467))
			{
				var_13ef9467 = [];
			}
			else if(!isarray(var_13ef9467))
			{
				var_13ef9467 = array(var_13ef9467);
			}
			var_13ef9467[var_13ef9467.size] = var_b1af7735;
		}
		return var_13ef9467;
	}
	return [];
}

/*
	Name: function_6c14b72a
	Namespace: namespace_6fc19861
	Checksum: 0xC5653024
	Offset: 0x1768
	Size: 0x112
	Parameters: 0
	Flags: None
*/
function function_6c14b72a()
{
	if(isdefined(level.var_99018b7a))
	{
		var_13ef9467 = [];
		foreach(var_5d028bf5 in level.var_99018b7a)
		{
			if(!isdefined(var_5d028bf5.health) || var_5d028bf5.health <= 0)
			{
				continue;
				continue;
			}
			if(!isdefined(var_13ef9467))
			{
				var_13ef9467 = [];
			}
			else if(!isarray(var_13ef9467))
			{
				var_13ef9467 = array(var_13ef9467);
			}
			var_13ef9467[var_13ef9467.size] = var_5d028bf5;
		}
		return var_13ef9467;
	}
	return [];
}

/*
	Name: function_db4bf625
	Namespace: namespace_6fc19861
	Checksum: 0xFA74FF92
	Offset: 0x1888
	Size: 0x88
	Parameters: 1
	Flags: Private
*/
function private function_db4bf625(weapon)
{
	self endon(#"death");
	var_17b7891d = "7bd8bdfda99d045d" + "axe_right_melee_attack_think";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		self waittill(#"weapon_melee_power");
		self function_1ca5af86(weapon);
	}
}

/*
	Name: function_1ca5af86
	Namespace: namespace_6fc19861
	Checksum: 0x11EF906A
	Offset: 0x1918
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_1ca5af86(weapon)
{
	self endon(#"weapon_change", #"death");
	waitframe(5);
	self thread function_f3eae4ba(1, weapon);
	waitframe(10);
	self thread function_f3eae4ba(2, weapon);
}

/*
	Name: function_1fa698a6
	Namespace: namespace_6fc19861
	Checksum: 0x40B5973E
	Offset: 0x1998
	Size: 0x138
	Parameters: 6
	Flags: None
*/
function function_1fa698a6(target, view_pos, forward_view_angles, var_ccb70dad, target_pos, var_3270c905)
{
	dist_sq = distancesquared(view_pos, target_pos);
	if(dist_sq > level.var_386befd7)
	{
		return false;
	}
	v_normal = vectornormalize(target_pos - self.origin);
	dot = vectordot(var_ccb70dad, v_normal);
	if(is_true(var_3270c905))
	{
		if(dot <= 0 && dist_sq > 1600)
		{
			return false;
		}
		if(0 == target damageconetrace(view_pos, self, forward_view_angles))
		{
			return false;
		}
	}
	else if(dot <= 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_f3eae4ba
	Namespace: namespace_6fc19861
	Checksum: 0x9CBAEDF
	Offset: 0x1AD8
	Size: 0x4A8
	Parameters: 2
	Flags: None
*/
function function_f3eae4ba(swing_dir, weapon)
{
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	axe_damage = 5000 * self function_e5469f27(weapon, 1);
	view_pos = self geteye();
	forward_view_angles = anglestoforward(self getplayerangles());
	if(forward_view_angles[2] < -0.7)
	{
		var_ccb70dad = (forward_view_angles[0], forward_view_angles[1], -0.25);
	}
	else
	{
		var_ccb70dad = forward_view_angles;
	}
	var_1da354d3 = level function_68ec4aa2();
	var_be07f1d4 = 0;
	foreach(target in var_1da354d3)
	{
		if(!isalive(target))
		{
			continue;
		}
		test_origin = target getcentroid();
		if(!function_1fa698a6(target, view_pos, forward_view_angles, var_ccb70dad, test_origin, 1))
		{
			continue;
		}
		n_random_x = randomfloatrange(-3, 3);
		n_random_y = randomfloatrange(-3, 3);
		var_61906722 = randomfloatrange(25, 45);
		v_ragdoll = vectornormalize((target.origin - self.origin) + (n_random_x, n_random_y, var_61906722));
		self thread function_b9b06e2(target, weapon, swing_dir, v_ragdoll, axe_damage);
		var_be07f1d4++;
		if(var_be07f1d4 >= 4)
		{
			break;
		}
	}
	var_c6da7c23 = level function_7862c208();
	foreach(target in var_c6da7c23)
	{
		test_origin = target.origin;
		if(!function_1fa698a6(target, view_pos, forward_view_angles, var_ccb70dad, test_origin, 0))
		{
			continue;
		}
		target dodamage(target.health, self.origin, self, self, undefined, "MOD_MELEE");
	}
	var_330d827b = level function_6c14b72a();
	foreach(target in var_330d827b)
	{
		test_origin = target.origin;
		if(!function_1fa698a6(target, view_pos, forward_view_angles, var_ccb70dad, test_origin, 0))
		{
			continue;
		}
		target dodamage(target.health, self.origin, self, self, undefined, "MOD_MELEE");
	}
}

/*
	Name: function_b9b06e2
	Namespace: namespace_6fc19861
	Checksum: 0xEB299927
	Offset: 0x1F88
	Size: 0x12A
	Parameters: 5
	Flags: None
*/
function function_b9b06e2(e_target, weapon, swing_dir, v_to_target, n_damage)
{
	if(!isdefined(swing_dir))
	{
		swing_dir = level.weaponnone;
	}
	if(!isalive(weapon))
	{
		return;
	}
	if(!isdefined(weapon.var_6f84b820))
	{
		return;
	}
	damage_location = (weapon.origin + ((vectornormalize(self.origin - weapon.origin)) * 10)) + vectorscale((0, 0, 1), 60);
	weapon dodamage(n_damage, damage_location, self, self, "none", "MOD_MELEE", 0, swing_dir);
	self playsound(#"hash_4b89009623a94842");
	if(isactor(weapon))
	{
		weapon.var_fecf7735 = v_to_target;
	}
}

/*
	Name: function_219565f5
	Namespace: namespace_6fc19861
	Checksum: 0x9F60A542
	Offset: 0x20C0
	Size: 0x168
	Parameters: 1
	Flags: Private
*/
function private function_219565f5(weapon)
{
	self endon(#"death");
	var_17b7891d = "ee911055e03280b" + "axe_left_throw_attack_think";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		self waittill(#"weapon_melee_power_left");
		var_9040b50d = self gettagorigin("tag_weapon_right");
		waitframe(5);
		self thread function_f3eae4ba(1, weapon);
		if(isdefined(self.var_c926b4fc) && self.var_c926b4fc > 0)
		{
			self.var_c926b4fc--;
			self clientfield::set_to_player("" + #"hash_13f32f06b0e858dd", self.var_c926b4fc + 1);
			self.var_92188e6b = 1;
			self thread function_2d708b10();
			self axe_throw_start(weapon, var_9040b50d);
		}
		else
		{
			/#
				iprintlnbold("");
			#/
		}
	}
}

/*
	Name: function_2d708b10
	Namespace: namespace_6fc19861
	Checksum: 0xBA6705B
	Offset: 0x2230
	Size: 0x8E
	Parameters: 0
	Flags: Private
*/
function private function_2d708b10()
{
	self notify("54c759e72c090257");
	self endon("54c759e72c090257");
	self endon(#"disconnect");
	while(self throwbuttonpressed() && function_565c848a(self getcurrentweapon()))
	{
		waitframe(1);
	}
	if(isdefined(self))
	{
		self.var_92188e6b = 0;
	}
}

/*
	Name: axe_throw_start
	Namespace: namespace_6fc19861
	Checksum: 0xEFA6330F
	Offset: 0x22C8
	Size: 0x7BE
	Parameters: 2
	Flags: Private
*/
function private axe_throw_start(weapon, start_origin)
{
	self endon(#"death", #"hash_58f73de1835337f5");
	waitframe(1);
	var_d97e2ed7 = 0;
	var_deb20ded = self function_e5469f27(weapon, 1);
	if(var_deb20ded > 1)
	{
		var_d97e2ed7 = 1;
	}
	var_55b935c = 5000 * var_deb20ded;
	var_fca97989 = 5000 * var_deb20ded;
	if(!isdefined(start_origin))
	{
		start_origin = self.origin;
	}
	if(!isdefined(self.var_c5165568))
	{
		var_c5165568 = util::spawn_model("tag_origin", start_origin);
		self.var_c5165568 = var_c5165568;
	}
	else
	{
		var_c5165568 = self.var_c5165568;
	}
	if(!isdefined(var_c5165568))
	{
		return;
	}
	self playsound(#"hash_4aac6b6f82b638fc");
	var_c5165568.origin = start_origin;
	var_c5165568 setmodel("tag_origin");
	var_c5165568 show();
	if(var_d97e2ed7)
	{
		var_c5165568 clientfield::set("" + #"hash_2b223a333ab436cd", 1);
	}
	else
	{
		var_c5165568 clientfield::set("" + #"hash_403f172f69819024", 1);
	}
	self.var_9996fc0f = 1;
	start_position = self getplayercamerapos();
	forward_direction = self getweaponforwarddir();
	end_position = start_position + (forward_direction * 750);
	var_87916932 = bullettrace(start_position, end_position, 0, self);
	if(var_87916932[#"fraction"] < 1)
	{
		end_position = var_87916932[#"position"];
	}
	var_2b94b479 = 1 * var_87916932[#"fraction"];
	var_c5165568.last_origin = var_c5165568.origin;
	var_c5165568.last_hit_target = self;
	var_c5165568.var_cc327795 = self;
	var_c5165568 moveto(end_position, var_2b94b479);
	var_48ce5c7e = gettime();
	var_11a5ceb4 = 0;
	while(var_11a5ceb4 < var_2b94b479)
	{
		waitframe(1);
		if(!isdefined(var_c5165568))
		{
			return;
		}
		var_11a5ceb4 = var_11a5ceb4 + (float(function_60d95f53()) / 1000);
		var_525a6081 = self function_28a475cb(var_c5165568.last_origin, var_c5165568.origin, 50, weapon, var_55b935c, var_d97e2ed7);
		if(var_525a6081 && is_true(self.var_92188e6b))
		{
			break;
		}
		var_c5165568.last_origin = var_c5165568.origin;
	}
	if(is_true(self.var_92188e6b) && isdefined(var_c5165568))
	{
		var_c5165568 moveto(var_c5165568.origin, float(function_60d95f53()) / 1000);
		var_2f1545ed = gettime();
		var_946e6de7 = 0;
		while(var_946e6de7 < 10 && is_true(self.var_92188e6b) && isdefined(var_c5165568))
		{
			wait(0.2);
			self function_28a475cb(var_c5165568.origin, var_c5165568.origin, 50, weapon, var_fca97989, var_d97e2ed7);
			var_946e6de7 = var_946e6de7 + 0.2;
		}
	}
	var_c5165568 playsound(#"hash_24b690e088ad3b0b");
	var_f1395f3a = 0;
	var_15e3f0ba = self gettagorigin("tag_weapon_left");
	if(!isdefined(var_15e3f0ba))
	{
		var_15e3f0ba = self.origin;
	}
	var_160a0478 = distance(var_15e3f0ba, var_c5165568.origin);
	var_505936b8 = 1 * (var_160a0478 / 750);
	while(var_f1395f3a < var_505936b8 - 0.05)
	{
		waitframe(1);
		if(!isdefined(var_c5165568))
		{
			return;
		}
		var_f1395f3a = var_f1395f3a + (float(function_60d95f53()) / 1000);
		var_173eb60b = self gettagorigin("tag_weapon_left");
		if(!isdefined(var_173eb60b))
		{
			var_173eb60b = self.origin;
		}
		travel_time = var_505936b8 - var_f1395f3a;
		if(travel_time < 0.01)
		{
			travel_time = 0.01;
		}
		var_c5165568 moveto(var_173eb60b, travel_time);
		self function_28a475cb(var_c5165568.last_origin, var_c5165568.origin, 50, weapon, var_55b935c, var_d97e2ed7);
		var_c5165568.last_origin = var_c5165568.origin;
	}
	if(isdefined(var_c5165568))
	{
		if(var_d97e2ed7)
		{
			var_c5165568 clientfield::set("" + #"hash_2b223a333ab436cd", 0);
		}
		else
		{
			var_c5165568 clientfield::set("" + #"hash_403f172f69819024", 0);
		}
	}
	self playsound(#"hash_41056c71c18559be");
	waitframe(1);
	if(isdefined(var_c5165568))
	{
		var_c5165568 hide();
	}
	self.var_9996fc0f = 0;
	self notify(#"hash_58f73de1835337f5");
}

/*
	Name: function_c3a6cbeb
	Namespace: namespace_6fc19861
	Checksum: 0x9FD5B5F5
	Offset: 0x2A90
	Size: 0xBE
	Parameters: 0
	Flags: None
*/
function function_c3a6cbeb()
{
	start = self getplayercamerapos();
	forward = self getweaponforwarddir();
	end = start + (forward * 750);
	trace = bullettrace(start, end, 1, self);
	if(trace[#"fraction"] < 1)
	{
		end = trace[#"position"];
	}
	return end;
}

/*
	Name: function_28a475cb
	Namespace: namespace_6fc19861
	Checksum: 0x509AB7D2
	Offset: 0x2B58
	Size: 0x244
	Parameters: 6
	Flags: None
*/
function function_28a475cb(start_pos, end_pos, var_e7b59cda, var_50ebbc23, var_55b935c, var_d97e2ed7)
{
	var_d29cf4fc = self function_9a843b5a(start_pos, end_pos, var_e7b59cda);
	if(var_d29cf4fc.size > 0)
	{
		foreach(target in var_d29cf4fc)
		{
			target dodamage(target.health, end_pos, self, undefined, undefined, "MOD_MELEE", 0, var_50ebbc23);
		}
	}
	var_7d6d627e = self function_f8986ee9(start_pos, end_pos, var_e7b59cda);
	if(var_7d6d627e.size > 0)
	{
		foreach(target in var_7d6d627e)
		{
			target dodamage(var_55b935c, end_pos, self, undefined, undefined, "MOD_RIFLE_BULLET", 0, var_50ebbc23);
			if(var_d97e2ed7)
			{
				target clientfield::increment("" + #"hash_5c2324e6d994b886", 1);
				continue;
			}
			target clientfield::increment("" + #"hash_4189b622ab06c2d5", 1);
		}
		return true;
	}
	return false;
}

/*
	Name: function_9a843b5a
	Namespace: namespace_6fc19861
	Checksum: 0x40B70FD9
	Offset: 0x2DA8
	Size: 0x19A
	Parameters: 3
	Flags: None
*/
function function_9a843b5a(start_pos, end_pos, var_e7b59cda)
{
	var_dcce477a = level function_7862c208();
	var_f8233fc9 = [];
	var_1be6243c = [];
	var_f8233fc9 = function_24e9dbc2(end_pos, var_dcce477a, var_e7b59cda);
	if(start_pos != end_pos)
	{
		var_1be6243c = function_24e9dbc2((start_pos + end_pos) / 2, var_dcce477a, var_e7b59cda);
	}
	var_1a0e87c7 = arraycombine(var_f8233fc9, var_1be6243c, 0, 0);
	var_9b088cac = level function_6c14b72a();
	var_4cfabda9 = [];
	var_f5e620b6 = [];
	var_4cfabda9 = function_24e9dbc2(end_pos, var_9b088cac, var_e7b59cda);
	if(start_pos != end_pos)
	{
		var_f5e620b6 = function_24e9dbc2((start_pos + end_pos) / 2, var_9b088cac, var_e7b59cda);
	}
	var_1da833ff = arraycombine(var_4cfabda9, var_f5e620b6, 0, 0);
	return arraycombine(var_1a0e87c7, var_1da833ff, 0, 0);
}

/*
	Name: function_f8986ee9
	Namespace: namespace_6fc19861
	Checksum: 0x64051C2E
	Offset: 0x2F50
	Size: 0xC2
	Parameters: 3
	Flags: None
*/
function function_f8986ee9(start_pos, end_pos, var_e7b59cda)
{
	targets = level function_68ec4aa2();
	var_9fae0643 = [];
	var_5ca1dd70 = [];
	var_9fae0643 = function_24e9dbc2(end_pos, targets, var_e7b59cda);
	if(start_pos != end_pos)
	{
		var_5ca1dd70 = function_24e9dbc2((start_pos + end_pos) / 2, targets, var_e7b59cda);
	}
	return arraycombine(var_9fae0643, var_5ca1dd70, 0, 0);
}

/*
	Name: function_24e9dbc2
	Namespace: namespace_6fc19861
	Checksum: 0x6C7C56E0
	Offset: 0x3020
	Size: 0xCA
	Parameters: 3
	Flags: None
*/
function function_24e9dbc2(position, array, var_e7b59cda)
{
	var_7914206d = position - vectorscale((0, 0, 1), 50);
	ground_trace = groundtrace(position, var_7914206d, 0, self);
	if(ground_trace[#"fraction"] > 0.01 && ground_trace[#"fraction"] < 1)
	{
		var_7914206d = ground_trace[#"position"];
	}
	return array::get_all_closest(var_7914206d, array, undefined, undefined, var_e7b59cda);
}

/*
	Name: function_709843c2
	Namespace: namespace_6fc19861
	Checksum: 0xEC32EB6
	Offset: 0x30F8
	Size: 0x1C4
	Parameters: 1
	Flags: None
*/
function function_709843c2(params)
{
	if(!is_true(self.var_6f84b820 === #"normal"))
	{
		return;
	}
	var_43cad97a = params.idamage > self.health;
	if(is_true(self.var_687de2a9))
	{
		self.var_d7b66cd8 = self.var_d7b66cd8 + params.idamage;
		if(self.var_d7b66cd8 >= 3000 || params.smeansofdeath === "MOD_MELEE")
		{
			if(!is_true(self.var_3af9cf02))
			{
				self.var_494ecedd = 1;
			}
			else
			{
				self notify(#"hash_6dffe1fcde89233f");
			}
		}
		if(is_true(var_43cad97a))
		{
			self.health = params.idamage + 1;
		}
	}
	else if(function_1b662278(params.weapon))
	{
		var_7656a4ec = self function_d1534cde(params);
		if(is_true(var_7656a4ec))
		{
			if(is_true(var_43cad97a))
			{
				self.health = params.idamage + 1;
			}
			self thread function_f81a3f00(params);
		}
	}
}

/*
	Name: function_d1534cde
	Namespace: namespace_6fc19861
	Checksum: 0x89C011F5
	Offset: 0x32C8
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_d1534cde(params)
{
	return params.smeansofdeath !== "MOD_EXPLOSIVE" && params.smeansofdeath !== "MOD_MELEE" && math::cointoss(2);
}

/*
	Name: function_f81a3f00
	Namespace: namespace_6fc19861
	Checksum: 0xCD24F84
	Offset: 0x3328
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_f81a3f00(params)
{
	self.var_687de2a9 = 1;
	self clientfield::set("" + #"hash_d1d4ed99da50a4b", 1);
	self.var_d7b66cd8 = 0;
	self.var_3af9cf02 = 0;
	self thread function_f0be6705();
	self thread function_ed0d6200(params.eattacker, params.weapon);
	self thread namespace_9ff9f642::slowdown(#"hash_4d4e7225b8223af5");
}

/*
	Name: function_f0be6705
	Namespace: namespace_6fc19861
	Checksum: 0x7EA62500
	Offset: 0x33E8
	Size: 0x76
	Parameters: 0
	Flags: None
*/
function function_f0be6705()
{
	self notify("2c334da074e53dcc");
	self endon("2c334da074e53dcc");
	self endon(#"death");
	wait(1);
	if(!isdefined(self))
	{
		return;
	}
	self.var_3af9cf02 = 1;
	if(is_true(self.var_494ecedd))
	{
		self notify(#"hash_6dffe1fcde89233f");
	}
}

/*
	Name: function_ed0d6200
	Namespace: namespace_6fc19861
	Checksum: 0xD758DEF5
	Offset: 0x3468
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function function_ed0d6200(attacker, weapon)
{
	self notify("230e3f826d9e7b68");
	self endon("230e3f826d9e7b68");
	self endon(#"death");
	self waittilltimeout(6, #"hash_6dffe1fcde89233f");
	if(!zm_utility::is_magic_bullet_shield_enabled(self))
	{
		self.var_4169c3be = 1;
		self clientfield::set("" + #"hash_d1d4ed99da50a4b", 0);
		self thread function_b9e23a1e(attacker, weapon);
	}
}

/*
	Name: function_b9e23a1e
	Namespace: namespace_6fc19861
	Checksum: 0x6EF33EB5
	Offset: 0x3530
	Size: 0x25C
	Parameters: 2
	Flags: None
*/
function function_b9e23a1e(attacker, weapon)
{
	self endon(#"death");
	centroid = self getcentroid();
	a_targets = getentitiesinradius(centroid, 256, 15);
	foreach(ai in a_targets)
	{
		if(!isdefined(ai) || ai getteam() !== level.zombie_team)
		{
			continue;
			continue;
		}
		if(isentity(ai) && isalive(ai))
		{
			n_damage = zm_equipment::function_379f6b5d(200, getweapon(#"eq_sticky_grenade"), ai.var_6f84b820, ai.maxhealth);
			ai dodamage(n_damage, ai.origin, attacker, undefined, undefined, "MOD_EXPLOSIVE", 0, level.var_948e5165);
		}
	}
	wait(0.5);
	if(isdefined(self))
	{
		var_47c940c2 = function_4ba8fde(#"hash_7ee7b21a68b25ce6");
		item_drop::drop_item(0, undefined, 1, 0, var_47c940c2.id, self.origin);
		self kill(self.origin, attacker, undefined, weapon, undefined, 1);
	}
}

/*
	Name: function_adc762ac
	Namespace: namespace_6fc19861
	Checksum: 0x3C27A08F
	Offset: 0x3798
	Size: 0xEC
	Parameters: 13
	Flags: None
*/
function function_adc762ac(einflictor, eattacker, idamage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(!isalive(self))
	{
		return 0;
	}
	var_d3c8f6cd = 1;
	if(isplayer(shitloc) && boneindex !== "MOD_EXPLOSIVE")
	{
		var_d3c8f6cd = shitloc function_e5469f27(surfacetype, 0);
	}
	return psoffsettime * var_d3c8f6cd;
}

/*
	Name: function_d243e3bc
	Namespace: namespace_6fc19861
	Checksum: 0xF7063E65
	Offset: 0x3890
	Size: 0x56
	Parameters: 1
	Flags: None
*/
function function_d243e3bc(item)
{
	if(isdefined(self function_49fa2899()) && isdefined(self.var_c926b4fc) && self.var_c926b4fc < 5)
	{
		return true;
	}
	return false;
}

/*
	Name: function_6492d995
	Namespace: namespace_6fc19861
	Checksum: 0xC68C60DC
	Offset: 0x38F0
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_6492d995(item)
{
	var_3c4fcfcf = self function_49fa2899();
	if(!isdefined(var_3c4fcfcf))
	{
		return 0;
	}
	var_2f399b51 = var_3c4fcfcf.altweapon.maxammo;
	currentstockammo = self getweaponammostock(var_3c4fcfcf.altweapon);
	return currentstockammo < var_2f399b51;
}

/*
	Name: function_49fa2899
	Namespace: namespace_6fc19861
	Checksum: 0x314C7EF1
	Offset: 0x3980
	Size: 0x162
	Parameters: 0
	Flags: None
*/
function function_49fa2899()
{
	var_b84949d0 = undefined;
	var_cb5aea38 = [2:((((17 + 1) + 8) + 1) + 8) + 1, 1:((17 + 1) + 8) + 1, 0:17 + 1];
	foreach(slot in var_cb5aea38)
	{
		var_9ccb901d = self namespace_b376ff3f::function_2e711614(slot);
		if(!isdefined(var_9ccb901d))
		{
			continue;
		}
		var_291c422e = self namespace_a0d533d1::function_2b83d3ff(var_9ccb901d);
		if(function_58d581b6(var_291c422e))
		{
			var_b84949d0 = var_291c422e;
			break;
		}
	}
	return var_b84949d0;
}

/*
	Name: function_10a4dd0a
	Namespace: namespace_6fc19861
	Checksum: 0x96715D4F
	Offset: 0x3AF0
	Size: 0x24C
	Parameters: 1
	Flags: None
*/
function function_10a4dd0a(params)
{
	item = params.item;
	if(isplayer(self))
	{
		if(isdefined(item.var_a6762160.weapon) && function_58d581b6(item.var_a6762160.weapon))
		{
			self.var_c926b4fc = (isdefined(item.var_c926b4fc) ? item.var_c926b4fc : 5);
		}
		else
		{
			if(item.var_a6762160.name === #"hash_7ee7b21a68b25ce6")
			{
				self.var_c926b4fc++;
				if(self.var_c926b4fc > 5)
				{
					self.var_c926b4fc = 5;
				}
				self clientfield::set_to_player("" + #"hash_13f32f06b0e858dd", self.var_c926b4fc + 1);
				/#
					iprintlnbold("" + self.var_c926b4fc);
				#/
			}
			else if(item.var_a6762160.name === #"hash_481a7553aa1b07b2")
			{
				var_3c4fcfcf = self function_49fa2899();
				if(!isdefined(var_3c4fcfcf))
				{
					return;
				}
				var_2f399b51 = var_3c4fcfcf.altweapon.maxammo;
				currentstockammo = self getweaponammostock(var_3c4fcfcf.altweapon);
				totalammo = currentstockammo + 70;
				if(totalammo > var_2f399b51)
				{
					totalammo = var_2f399b51;
				}
				self setweaponammostock(var_3c4fcfcf.altweapon, totalammo);
				/#
					iprintlnbold("" + totalammo);
				#/
			}
		}
	}
}

/*
	Name: function_7897dfe6
	Namespace: namespace_6fc19861
	Checksum: 0xE47A905B
	Offset: 0x3D48
	Size: 0x8E
	Parameters: 1
	Flags: None
*/
function function_7897dfe6(params)
{
	item = params.item;
	if(isplayer(self) && isdefined(item.var_a6762160.weapon) && function_58d581b6(item.var_a6762160.weapon))
	{
		item.var_c926b4fc = self.var_c926b4fc;
		self.var_c926b4fc = undefined;
	}
}

/*
	Name: function_e5469f27
	Namespace: namespace_6fc19861
	Checksum: 0x714C3314
	Offset: 0x3DE0
	Size: 0x14E
	Parameters: 2
	Flags: None
*/
function function_e5469f27(weapon, var_131779dd)
{
	var_55687712 = self namespace_b376ff3f::function_230ceec4(weapon);
	if(isdefined(var_55687712.var_a8bccf69))
	{
		if(is_true(var_131779dd))
		{
			switch(var_55687712.var_a8bccf69)
			{
				case 1:
				{
					return 2;
				}
				case 2:
				{
					return 4;
				}
				case 3:
				{
					return 6;
				}
				default:
				{
					return 1;
				}
			}
		}
		else
		{
			switch(var_55687712.var_a8bccf69)
			{
				case 1:
				{
					return 1;
				}
				case 2:
				{
					return 1.75;
				}
				case 3:
				{
					return 2.5;
				}
				default:
				{
					return 1;
				}
			}
		}
	}
	return 1;
}

/*
	Name: function_e711fec1
	Namespace: namespace_6fc19861
	Checksum: 0x2E496CD5
	Offset: 0x3F38
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_e711fec1()
{
	/#
		level_name = util::function_53bbf9d2();
		if(level_name === "")
		{
			util::function_345e5b9a("");
			util::function_345e5b9a("");
			util::function_345e5b9a("");
			zm_devgui::add_custom_devgui_callback(&cmd);
		}
	#/
}

/*
	Name: cmd
	Namespace: namespace_6fc19861
	Checksum: 0xB1179967
	Offset: 0x3FE8
	Size: 0xCA
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_4fd39fa505917bb8":
			{
				function_4e036cff(#"hash_481a7553aa1b07b2");
				break;
			}
			case "hash_3282d077fe3c9d0c":
			{
				function_4e036cff(#"hash_7ee7b21a68b25ce6");
				break;
			}
			case "hash_2bbefdbbe0dcca8":
			{
				function_c1fdd154();
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

/*
	Name: function_4e036cff
	Namespace: namespace_6fc19861
	Checksum: 0xC5C67717
	Offset: 0x40C0
	Size: 0x156
	Parameters: 1
	Flags: None
*/
function function_4e036cff(item_name)
{
	/#
		player = getplayers()[0];
		direction = player getplayerangles();
		direction_vec = anglestoforward(direction);
		eye = player getplayercamerapos();
		scale = 8000;
		direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
		trace = bullettrace(eye, eye + direction_vec, 0, undefined);
		drop_item = function_4ba8fde(item_name);
		item = item_drop::drop_item(0, undefined, 1, 0, drop_item.id, trace[#"position"]);
	#/
}

/*
	Name: function_c1fdd154
	Namespace: namespace_6fc19861
	Checksum: 0xB28EF10B
	Offset: 0x4220
	Size: 0xA6
	Parameters: 1
	Flags: None
*/
function function_c1fdd154(item_name)
{
	/#
		players = getplayers();
		foreach(player in players)
		{
			player.var_c926b4fc = 5;
		}
	#/
}

