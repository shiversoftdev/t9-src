#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using script_35598499769dbb3d;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_556e19065f09f8a2;
#using scripts\zm_common\zm.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using script_24c32478acf44108;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_b376a999;

/*
	Name: __init__system__
	Namespace: namespace_b376a999
	Checksum: 0x911831B1
	Offset: 0x2A8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_36cdf1547e49b57a", &function_70a657d8, &function_8ac3bea9, undefined, "zm_weapons");
}

/*
	Name: function_70a657d8
	Namespace: namespace_b376a999
	Checksum: 0x391D2E2B
	Offset: 0x300
	Size: 0xBB0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connect(&on_player_connect);
	callback::on_ai_damage(&function_33fb41f6);
	callback::on_ai_killed(&function_d72b9d03);
	level.var_1a4cc228[#"hash_5214ebcccbd95a36"] = [6:#"hash_c71860858c9efd0", 5:#"hash_3b3eb000bcfc5389", 4:#"hash_5c0877f0bdec3739", 3:#"hash_2de8c613f642c492", 2:#"hash_161f9bdf4e9e092f", 1:#"hash_725982139f7312b6", 0:#"hash_6137ec0a60179183"];
	level.var_1a4cc228[#"hash_bc5dffd7824c28f"] = level.var_1a4cc228[#"hash_5214ebcccbd95a36"];
	level.var_1a4cc228[#"hash_78215fa79f5557dc"] = [0:#"hash_4814b7b3c67568e3"];
	level.var_1a4cc228[#"hash_12a17ab3df5889eb"] = level.var_1a4cc228[#"hash_78215fa79f5557dc"];
	level.var_1a4cc228[#"spawner_zm_steiner_split_radiation_bomb"] = [0:#"hash_614e3d7d0b75a944"];
	level.var_1a4cc228[#"spawner_zm_steiner_split_radiation_blast"] = [0:#"hash_53c08317d48a0e49"];
	level.var_1a4cc228[#"hash_19ef16d1ba01a5"] = [0:#"hash_4729aed4cfa43476"];
	level.var_652bc5ed = getweapon(#"hash_3fa91d1674123e09");
	weaponobjects::function_e6400478(#"hash_3fa91d1674123e09", &function_d48a01a5, 1);
	level.var_810eda2b = getweapon(#"hash_655d944e437c3d5b");
	zm::function_84d343d(#"hash_655d944e437c3d5b", &function_ca6c6727);
	zm_weapons::function_90953640(level.var_810eda2b, 3, float(function_60d95f53()) / 1000);
	level.var_fb37bf51 = getweapon(#"hash_6e0b27b854e591a3");
	weaponobjects::function_e6400478(#"hash_6e0b27b854e591a3", &function_47c38bc8, 1);
	zombie_utility::add_zombie_gib_weapon_callback(#"hash_6e0b27b854e591a3", &function_7a7d85a4, &function_7a7d85a4);
	callback::add_weapon_fired(level.var_fb37bf51, &function_c8adf16f);
	zm_weapons::function_90953640(level.var_fb37bf51, 5, float(function_60d95f53()) / 1000);
	level.var_12b450dc = getweapon(#"hash_72796957033e2e4a");
	weaponobjects::function_e6400478(#"hash_72796957033e2e4a", &function_3c39516d, 1);
	zm::function_84d343d(level.var_12b450dc.name, &function_fd195372);
	callback::add_weapon_fired(level.var_12b450dc, &function_d6ae76f5);
	clientfield::register("actor", "" + #"hash_77e641a4db48ad0f", 1, 2, "int");
	clientfield::register("allplayers", "" + #"hash_492f4817c4296ddf", 1, 1, "counter");
	clientfield::register("allplayers", "" + #"hash_89386ef1bb99cdf", 1, 2, "int");
	clientfield::register("actor", "" + #"hash_380d2d329a41c90e", 1, 1, "int");
	clientfield::register("allplayers", "" + #"hash_392d4dd36fe37ce7", 1, 1, "counter");
	clientfield::register("actor", "" + #"hash_7e9eb1c31cf618f0", 1, 1, "int");
	clientfield::register("allplayers", "" + #"hash_40635c43f5d87929", 1, 3, "int");
	clientfield::register("actor", "" + #"hash_306339376ad218f0", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_4061bf5adf6ebd2", 1, 3, "int");
	clientfield::register("allplayers", "" + #"hash_7c865b5dcfbe46c0", 1, 1, "int");
	clientfield::register("missile", "" + #"hash_685e6cfaf658518e", 1, 1, "int");
	level.var_e0be56c0 = getweapon(#"hash_5dd5741f21fd680d");
	function_efcce3c1();
	callback::add_weapon_fired(level.var_e0be56c0, &function_5a9a8abc);
	clientfield::register("allplayers", "" + #"hash_2eb1021a0e4110d1", 1, 2, "int");
	namespace_9ff9f642::register_slowdown(#"hash_659e542bc102c218", 0.8, 0.5);
	namespace_9ff9f642::register_slowdown(#"hash_e5fddce96190022", 1, 0);
	namespace_9ff9f642::register_slowdown(#"hash_37ca44613f9ed8bc", 1, 0);
	namespace_9ff9f642::register_slowdown(#"hash_1262748e23d5dff8", 1, 0);
	namespace_9ff9f642::register_slowdown(#"hash_a40f7d48ac714db", 1, 0);
	namespace_9ff9f642::register_slowdown(#"hash_40ca16d063cdb34f", 0.5, 5);
	clientfield::register("actor", "" + #"hash_6dca42b5563953ef", 1, 1, "int");
	clientfield::register("actor", "" + #"hash_2a7b72235f0b387e", 1, 1, "int");
	clientfield::register("actor", "" + #"hash_1709a7bbfac5e1e0", 1, 1, "int");
	clientfield::register("actor", "" + #"hash_3a35110e6ccc5486", 1, 1, "int");
	clientfield::register("actor", "" + #"hash_48257c0dba76b140", 1, 1, "int");
	clientfield::register("actor", "" + #"hash_97d03a2a0786ba6", 1, 2, "int");
	clientfield::register("allplayers", "" + #"hash_3c92af57fde1f8f7", 1, 4, "int");
	level.var_58e6238 = &function_caac60f2;
	level.var_f975b6ae = &function_301812b0;
	level.var_2f81d430 = &function_a93a6096;
	level.var_9ea358cc = 0;
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_b376a999
	Checksum: 0x93734062
	Offset: 0xEB8
	Size: 0x4B4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
	zm_weapons::function_8389c033(#"hash_3fa91d1674123e09", #"hash_3fa91d1674123e09");
	zm_weapons::function_8389c033(#"hash_3fa91d1674123e09", #"hash_72796957033e2e4a");
	zm_weapons::function_8389c033(#"hash_3fa91d1674123e09", #"hash_6e0b27b854e591a3");
	zm_weapons::function_8389c033(#"hash_3fa91d1674123e09", #"hash_5dd5741f21fd680d");
	zm_weapons::function_8389c033(#"hash_3fa91d1674123e09", #"hash_655d944e437c3d5b");
	zm_weapons::function_8389c033(#"hash_72796957033e2e4a", #"hash_3fa91d1674123e09");
	zm_weapons::function_8389c033(#"hash_72796957033e2e4a", #"hash_72796957033e2e4a");
	zm_weapons::function_8389c033(#"hash_72796957033e2e4a", #"hash_6e0b27b854e591a3");
	zm_weapons::function_8389c033(#"hash_72796957033e2e4a", #"hash_5dd5741f21fd680d");
	zm_weapons::function_8389c033(#"hash_72796957033e2e4a", #"hash_655d944e437c3d5b");
	zm_weapons::function_8389c033(#"hash_6e0b27b854e591a3", #"hash_3fa91d1674123e09");
	zm_weapons::function_8389c033(#"hash_6e0b27b854e591a3", #"hash_72796957033e2e4a");
	zm_weapons::function_8389c033(#"hash_6e0b27b854e591a3", #"hash_6e0b27b854e591a3");
	zm_weapons::function_8389c033(#"hash_6e0b27b854e591a3", #"hash_5dd5741f21fd680d");
	zm_weapons::function_8389c033(#"hash_6e0b27b854e591a3", #"hash_655d944e437c3d5b");
	zm_weapons::function_8389c033(#"hash_5dd5741f21fd680d", #"hash_3fa91d1674123e09");
	zm_weapons::function_8389c033(#"hash_5dd5741f21fd680d", #"hash_72796957033e2e4a");
	zm_weapons::function_8389c033(#"hash_5dd5741f21fd680d", #"hash_6e0b27b854e591a3");
	zm_weapons::function_8389c033(#"hash_5dd5741f21fd680d", #"hash_5dd5741f21fd680d");
	zm_weapons::function_8389c033(#"hash_5dd5741f21fd680d", #"hash_655d944e437c3d5b");
	zm_weapons::function_8389c033(#"hash_655d944e437c3d5b", #"hash_3fa91d1674123e09");
	zm_weapons::function_8389c033(#"hash_655d944e437c3d5b", #"hash_72796957033e2e4a");
	zm_weapons::function_8389c033(#"hash_655d944e437c3d5b", #"hash_6e0b27b854e591a3");
	zm_weapons::function_8389c033(#"hash_655d944e437c3d5b", #"hash_5dd5741f21fd680d");
	zm_weapons::function_8389c033(#"hash_655d944e437c3d5b", #"hash_655d944e437c3d5b");
}

/*
	Name: function_1475944a
	Namespace: namespace_b376a999
	Checksum: 0xDBBCA206
	Offset: 0x1378
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1475944a()
{
	level.var_9ea358cc++;
	self waittill(#"death");
	level.var_9ea358cc--;
}

/*
	Name: on_player_connect
	Namespace: namespace_b376a999
	Checksum: 0x90A896A8
	Offset: 0x13B0
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_connect()
{
	self thread watch_weapon_changes();
	self thread function_18fbdeee();
}

/*
	Name: function_18fbdeee
	Namespace: namespace_b376a999
	Checksum: 0x7652523E
	Offset: 0x13F0
	Size: 0x208
	Parameters: 0
	Flags: Linked
*/
function function_18fbdeee()
{
	self endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"hash_3abc816f9601bdd3");
		weapon = waitresult.weapon;
		if(!function_5fef4201(weapon) || self isfiring())
		{
			continue;
		}
		max_ammo = self getweaponammoclipsize(weapon);
		cur_ammo = self getweaponammoclip(weapon);
		if(cur_ammo < max_ammo && !isdefined(self.crystal))
		{
			self val::reset(#"hash_1b614432d036c713", "allow_ads");
			self val::set(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire", 1);
			self function_a0a2d8ee(1);
			self thread function_f0c18475(weapon);
			self thread function_427f113c(weapon);
			self thread function_4f7dc212();
		}
		else if(!is_true(self.var_508be317))
		{
			self playsound(#"hash_6a39443b1d6cbd15");
			self.var_508be317 = 1;
			self thread function_6e1aa0a9();
		}
	}
}

/*
	Name: function_6e1aa0a9
	Namespace: namespace_b376a999
	Checksum: 0xFD32DF93
	Offset: 0x1600
	Size: 0x8A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6e1aa0a9()
{
	self notify("5c07e6e5237ae2ce");
	self endon("5c07e6e5237ae2ce");
	self endon(#"disconnect");
	while(self throwbuttonpressed() && function_5fef4201(self getcurrentweapon()))
	{
		waitframe(1);
	}
	if(isdefined(self))
	{
		self.var_508be317 = undefined;
	}
}

/*
	Name: watch_weapon_changes
	Namespace: namespace_b376a999
	Checksum: 0x36C5E410
	Offset: 0x1698
	Size: 0x21A
	Parameters: 0
	Flags: Linked
*/
function watch_weapon_changes()
{
	self endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_change");
		weapon = waitresult.weapon;
		if(function_5fef4201(weapon))
		{
			if(function_f1c015e1(weapon))
			{
				if(!isdefined(self.var_343d2604))
				{
					self.var_343d2604 = 0;
				}
			}
			else if(function_f17bb85a(weapon))
			{
				if(!isdefined(self.var_8e1667b6))
				{
					self.var_8e1667b6 = 0;
				}
			}
			function_96db9f3(weapon, 0);
			self val::set(#"hash_1b614432d036c713", "allow_ads", 0);
		}
		else
		{
			self val::reset(#"hash_1b614432d036c713", "allow_ads");
			self val::reset(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire");
		}
		if(function_c988c217(weapon))
		{
			self.var_3f74bd46 = 0;
			self.var_c627b034 = 1;
		}
		if(function_f1c015e1(waitresult.last_weapon))
		{
			self function_53e5275c(9);
			self.var_343d2604 = 0;
		}
		if(function_f17bb85a(waitresult.last_weapon))
		{
			self function_de1f133e(2);
			self.var_8e1667b6 = 0;
		}
	}
}

/*
	Name: function_7a7d85a4
	Namespace: namespace_b376a999
	Checksum: 0xA3C6840C
	Offset: 0x18C0
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function function_7a7d85a4(damage_percent)
{
	return false;
}

/*
	Name: function_5fef4201
	Namespace: namespace_b376a999
	Checksum: 0xBD99AADE
	Offset: 0x18D8
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_5fef4201(weapon)
{
	if(isdefined(weapon))
	{
		w_root = zm_weapons::function_386dacbc(weapon);
		switch(w_root.name)
		{
			case "hash_3fa91d1674123e09":
			case "hash_5dd5741f21fd680d":
			case "hash_655d944e437c3d5b":
			case "hash_6e0b27b854e591a3":
			case "hash_72796957033e2e4a":
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_a93a6096
	Namespace: namespace_b376a999
	Checksum: 0x26F0F2C
	Offset: 0x1988
	Size: 0x108
	Parameters: 1
	Flags: Linked
*/
function function_a93a6096(player)
{
	var_57b1ae9e = player getweaponslist();
	foreach(player_weapon in var_57b1ae9e)
	{
		switch(player_weapon.name)
		{
			case "hash_3fa91d1674123e09":
			case "hash_5dd5741f21fd680d":
			case "hash_655d944e437c3d5b":
			case "hash_6e0b27b854e591a3":
			case "hash_72796957033e2e4a":
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_7c292369
	Namespace: namespace_b376a999
	Checksum: 0x2A6A77F5
	Offset: 0x1A98
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_7c292369(weapon)
{
	return isdefined(weapon) && zm_weapons::function_386dacbc(weapon) == level.var_652bc5ed;
}

/*
	Name: function_c988c217
	Namespace: namespace_b376a999
	Checksum: 0x606C9707
	Offset: 0x1AD8
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_c988c217(weapon)
{
	return isdefined(weapon) && zm_weapons::function_386dacbc(weapon) == level.var_e0be56c0;
}

/*
	Name: function_f1c015e1
	Namespace: namespace_b376a999
	Checksum: 0xEB735702
	Offset: 0x1B18
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_f1c015e1(weapon)
{
	return isdefined(weapon) && zm_weapons::function_386dacbc(weapon) == level.var_fb37bf51;
}

/*
	Name: function_8fbb3409
	Namespace: namespace_b376a999
	Checksum: 0xAF2753CB
	Offset: 0x1B58
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_8fbb3409(weapon)
{
	return isdefined(weapon) && zm_weapons::function_386dacbc(weapon) == level.var_810eda2b;
}

/*
	Name: function_f17bb85a
	Namespace: namespace_b376a999
	Checksum: 0xE5D4060E
	Offset: 0x1B98
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_f17bb85a(weapon)
{
	return isdefined(weapon) && zm_weapons::function_386dacbc(weapon) == level.var_12b450dc;
}

/*
	Name: function_760c0d2d
	Namespace: namespace_b376a999
	Checksum: 0xAB65A1B8
	Offset: 0x1BD8
	Size: 0x46
	Parameters: 2
	Flags: Linked
*/
function function_760c0d2d(weapon, means_of_death)
{
	return function_5fef4201(weapon) && isdefined(means_of_death) && means_of_death == "MOD_DOT";
}

/*
	Name: function_51986fd2
	Namespace: namespace_b376a999
	Checksum: 0x173DB08F
	Offset: 0x1C28
	Size: 0x11A
	Parameters: 2
	Flags: Linked
*/
function function_51986fd2(weapon, means_of_death)
{
	if(means_of_death == "MOD_DOT")
	{
		return #"hash_659e542bc102c218";
	}
	w_root = zm_weapons::function_386dacbc(weapon);
	switch(w_root.name)
	{
		case "hash_3fa91d1674123e09":
		{
			return #"hash_e5fddce96190022";
		}
		case "hash_655d944e437c3d5b":
		{
			return #"hash_40ca16d063cdb34f";
		}
		case "hash_5dd5741f21fd680d":
		{
			return #"hash_1262748e23d5dff8";
		}
		case "hash_6e0b27b854e591a3":
		{
			return #"hash_37ca44613f9ed8bc";
		}
		case "hash_72796957033e2e4a":
		{
			return #"hash_a40f7d48ac714db";
		}
	}
	return #"";
}

/*
	Name: function_3f1cb8ec
	Namespace: namespace_b376a999
	Checksum: 0xACED05F3
	Offset: 0x1D50
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function function_3f1cb8ec(weapon, means_of_death)
{
	if(means_of_death == "MOD_DOT")
	{
		return 0.5;
	}
	w_root = zm_weapons::function_386dacbc(weapon);
	switch(w_root.name)
	{
		case "hash_3fa91d1674123e09":
		{
			return 0;
		}
		case "hash_655d944e437c3d5b":
		{
			return 5;
		}
		case "hash_5dd5741f21fd680d":
		{
			return 0;
		}
		case "hash_6e0b27b854e591a3":
		{
			return 0;
		}
		case "hash_72796957033e2e4a":
		{
			return 0;
		}
	}
	return 0;
}

/*
	Name: function_33fb41f6
	Namespace: namespace_b376a999
	Checksum: 0xC85B3DDE
	Offset: 0x1E40
	Size: 0x22E
	Parameters: 1
	Flags: Linked
*/
function function_33fb41f6(params)
{
	player = params.eattacker;
	if(!isplayer(player) || params.idamage == 0)
	{
		return;
	}
	if(!isalive(self))
	{
		return;
	}
	if(function_5fef4201(params.weapon))
	{
		function_4adc16f(params);
		if(function_760c0d2d(params.weapon, params.smeansofdeath) && isdefined(self.var_6f84b820))
		{
			switch(self.var_6f84b820)
			{
				case "normal":
				{
					var_ab6fadb1 = 0;
					break;
				}
				case "special":
				{
					var_ab6fadb1 = 0;
					break;
				}
				case "elite":
				{
					var_ab6fadb1 = 0;
					break;
				}
				case "boss":
				{
					var_ab6fadb1 = 0;
					break;
				}
				default:
				{
					var_ab6fadb1 = 0;
				}
			}
			player function_96db9f3(params.weapon, var_ab6fadb1);
		}
		else if(function_8fbb3409(params.weapon))
		{
			if(!isdefined(self.var_423a9ef2))
			{
				self callback::callback(#"hash_7f690ab86160d4f6");
				self clientfield::set("" + #"hash_48257c0dba76b140", 1);
				self thread function_71c72692();
			}
			self.var_423a9ef2 = gettime();
		}
	}
}

/*
	Name: function_71c72692
	Namespace: namespace_b376a999
	Checksum: 0x23F9E360
	Offset: 0x2078
	Size: 0xB6
	Parameters: 0
	Flags: Linked
*/
function function_71c72692()
{
	self endon(#"death");
	var_e6d88abc = float(5) / 2;
	while(true)
	{
		wait(var_e6d88abc);
		if(gettime() - self.var_423a9ef2 > int(var_e6d88abc * 1000))
		{
			self clientfield::set("" + #"hash_48257c0dba76b140", 0);
			self.var_423a9ef2 = undefined;
			break;
		}
	}
}

/*
	Name: function_4adc16f
	Namespace: namespace_b376a999
	Checksum: 0xEA433026
	Offset: 0x2138
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_4adc16f(params)
{
	var_bdbde2d2 = function_51986fd2(params.weapon, params.smeansofdeath);
	var_11c67a51 = function_3f1cb8ec(params.weapon, params.smeansofdeath);
	if(var_bdbde2d2 == #"" || var_11c67a51 == 0)
	{
		return;
	}
	if(var_bdbde2d2 == #"hash_659e542bc102c218" && isdefined(self.archetype) && self.archetype != #"hash_7c0d83ac1e845ac2")
	{
		return;
	}
	self thread namespace_9ff9f642::slowdown(var_bdbde2d2);
	if(isdefined(self.var_b077b73d))
	{
		self thread [[self.var_b077b73d]](var_11c67a51);
	}
}

/*
	Name: function_d72b9d03
	Namespace: namespace_b376a999
	Checksum: 0x44062386
	Offset: 0x2250
	Size: 0x36C
	Parameters: 1
	Flags: Linked
*/
function function_d72b9d03(params)
{
	if(params.smeansofdeath == "MOD_MELEE")
	{
		return;
	}
	if(function_760c0d2d(params.weapon, params.smeansofdeath))
	{
		self.var_270befd2 = 1;
		player = params.eattacker;
		if(self function_ac1ff86e())
		{
			self thread function_7e071045(player);
			self thread function_5a2447b1(1.2);
		}
		if(!isplayer(player) || !isalive(player))
		{
			return;
		}
		if(isdefined(self.var_6f84b820))
		{
			switch(self.var_6f84b820)
			{
				case "normal":
				{
					var_ab6fadb1 = 3;
					break;
				}
				case "special":
				{
					var_ab6fadb1 = 10;
					break;
				}
				case "elite":
				{
					var_ab6fadb1 = 20;
					break;
				}
				case "boss":
				{
					var_ab6fadb1 = 500;
					break;
				}
				default:
				{
					var_ab6fadb1 = 0;
				}
			}
			player function_96db9f3(params.weapon, var_ab6fadb1);
		}
	}
	else
	{
		if(function_7c292369(params.weapon))
		{
			self.var_ebd66e27 = 1;
			self function_f2262f33(params);
			if(self function_ac1ff86e())
			{
				self clientfield::set("" + #"hash_77e641a4db48ad0f", 2);
				self thread function_5a2447b1(2.2);
			}
		}
		else
		{
			if(function_8fbb3409(params.weapon))
			{
				self thread function_fb58c072(params);
			}
			else
			{
				if(function_f1c015e1(params.weapon))
				{
					self thread function_c9ccbd54();
				}
				else if(function_f17bb85a(params.weapon))
				{
					if(self function_ac1ff86e())
					{
						self clientfield::set("" + #"hash_77e641a4db48ad0f", 1);
						self thread function_5a2447b1(1.2);
					}
				}
			}
		}
	}
}

/*
	Name: function_5a2447b1
	Namespace: namespace_b376a999
	Checksum: 0xECCCCC69
	Offset: 0x25C8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_5a2447b1(time)
{
	result = undefined;
	result = self waittilltimeout(time, #"actor_corpse", #"death");
	waittillframeend();
	if(isdefined(result.corpse))
	{
		result.corpse delete();
	}
	else if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_ac1ff86e
	Namespace: namespace_b376a999
	Checksum: 0xB30CF6F7
	Offset: 0x2668
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_ac1ff86e()
{
	if(!isdefined(level.var_1a4cc228[self.aitype]))
	{
		return false;
	}
	entitynum = self getentitynumber();
	a_characters = level.var_1a4cc228[self.aitype];
	self setmodel(a_characters[entitynum % a_characters.size]);
	if(isdefined(self.gib_state))
	{
		gibserverutils::function_96bedd91(self);
	}
	return true;
}

/*
	Name: function_13da7675
	Namespace: namespace_b376a999
	Checksum: 0x4BDC6991
	Offset: 0x2710
	Size: 0x366
	Parameters: 0
	Flags: Linked
*/
function function_13da7675()
{
	targets = [];
	view_pos = self getweaponmuzzlepoint();
	forward_view_angles = self getweaponforwarddir();
	a_targets = getentitiesinradius(view_pos, 400, 15);
	if(!isdefined(a_targets))
	{
		return;
	}
	a_targets = arraysortclosest(a_targets, view_pos);
	end_pos = view_pos + vectorscale(forward_view_angles, 400);
	/#
		if(2 == getdvarint(#"hash_528e35e5faa6eb75", 0))
		{
			near_circle_pos = view_pos + vectorscale(forward_view_angles, 2);
			line(near_circle_pos, end_pos, (0, 0, 1), 1, 0, 100);
			sphericalcone(view_pos, view_pos + (forward_view_angles * 400), 30, 20, (1, 0, 0), 0.5, 0, 100);
		}
	#/
	foreach(ai in a_targets)
	{
		target = spawnstruct();
		if(!isdefined(ai) || ai getteam() !== level.zombie_team || !isalive(ai))
		{
			continue;
		}
		test_origin = ai getcentroid();
		test_range_squared = distancesquared(view_pos, test_origin);
		var_a931ea0a = 160000;
		if(test_range_squared > var_a931ea0a)
		{
			/#
				ai function_77d36cb8("", (1, 0, 0));
			#/
			break;
		}
		if(function_bd61e5e5(ai, view_pos, forward_view_angles))
		{
			target.ai = ai;
			target.distance = distance2d(view_pos, test_origin);
			if(!isdefined(targets))
			{
				targets = [];
			}
			else if(!isarray(targets))
			{
				targets = array(targets);
			}
			targets[targets.size] = target;
		}
		if(targets.size >= 2)
		{
			break;
		}
	}
	return targets;
}

/*
	Name: function_427f113c
	Namespace: namespace_b376a999
	Checksum: 0x969BDBA7
	Offset: 0x2A80
	Size: 0x3B4
	Parameters: 1
	Flags: Linked
*/
function function_427f113c(weapon)
{
	self notify(#"hash_3271846e2b85db1c");
	self endon(#"death", #"hash_3271846e2b85db1c");
	while(self throwbuttonpressed())
	{
		view_pos = self getweaponmuzzlepoint();
		forward_view_angles = self getweaponforwarddir();
		var_6a77cda0 = getentarray("trigger_damage", "classname");
		arrayremovevalue(var_6a77cda0, undefined);
		if(!var_6a77cda0.size)
		{
			return;
		}
		var_6a77cda0 = arraysortclosest(var_6a77cda0, view_pos, undefined, undefined, 400);
		var_df3c0672 = [];
		foreach(trigger in var_6a77cda0)
		{
			if(function_bd61e5e5(trigger, view_pos, forward_view_angles))
			{
				var_1c3abda3 = distance2d(trigger.origin, view_pos);
				trigger notify(#"damage", {#hash_98e101b0:1, #amount:function_a712364b(var_1c3abda3, trigger), #weapon:weapon, #attacker:self});
				if(isdefined(trigger.var_22cea3da))
				{
					if(!isdefined(var_df3c0672))
					{
						var_df3c0672 = [];
					}
					else if(!isarray(var_df3c0672))
					{
						var_df3c0672 = array(var_df3c0672);
					}
					if(!isinarray(var_df3c0672, trigger))
					{
						var_df3c0672[var_df3c0672.size] = trigger;
					}
				}
			}
		}
		foreach(trigger in var_df3c0672)
		{
			/#
				function_64cd8a8f("" + trigger getentitynumber());
			#/
			if(!isdefined(trigger.var_42859232))
			{
				trigger.var_42859232 = [];
			}
			if(!isdefined(trigger.var_42859232[self getentitynumber()]))
			{
				trigger.var_42859232[self getentitynumber()] = gettime();
				self thread function_c8f96d23(trigger);
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_c8f96d23
	Namespace: namespace_b376a999
	Checksum: 0xED35A3F6
	Offset: 0x2E40
	Size: 0x23C
	Parameters: 1
	Flags: Linked
*/
function function_c8f96d23(trigger)
{
	self endon(#"death");
	trigger endon(#"death");
	if(isdefined(trigger.var_37d2c8f6))
	{
		trigger [[trigger.var_37d2c8f6]](self, trigger.var_42859232[self getentitynumber()]);
	}
	while(true)
	{
		view_pos = self getweaponmuzzlepoint();
		forward_view_angles = self getweaponforwarddir();
		if(!isdefined(trigger) || !isdefined(trigger.var_22cea3da))
		{
			break;
		}
		if(distance(trigger.origin, view_pos) > 400 || !function_bd61e5e5(trigger, view_pos, forward_view_angles) || !self throwbuttonpressed() || !function_5fef4201(self getcurrentweapon()))
		{
			break;
		}
		/#
			function_64cd8a8f(((gettime() - trigger.var_42859232[self getentitynumber()]) + "") + trigger getentitynumber());
		#/
		trigger [[trigger.var_22cea3da]](self, gettime() - trigger.var_42859232[self getentitynumber()]);
		waitframe(1);
	}
	if(isdefined(trigger.var_4ffc53f))
	{
		trigger [[trigger.var_4ffc53f]](self);
	}
	trigger.var_42859232[self getentitynumber()] = undefined;
}

/*
	Name: function_bd61e5e5
	Namespace: namespace_b376a999
	Checksum: 0x7F967FCB
	Offset: 0x3088
	Size: 0x10C
	Parameters: 3
	Flags: Linked
*/
function function_bd61e5e5(target, view_pos, forward_view_angles)
{
	test_origin = target getcentroid();
	normal = vectornormalize(test_origin - view_pos);
	dot = vectordot(forward_view_angles, normal);
	if(0 > dot)
	{
		/#
			target function_77d36cb8("", (1, 0, 0));
		#/
		return false;
	}
	if(0 == target damageconetrace(view_pos, self, forward_view_angles, 30))
	{
		/#
			target function_77d36cb8("", (1, 0, 0));
		#/
		return false;
	}
	return true;
}

/*
	Name: function_a712364b
	Namespace: namespace_b376a999
	Checksum: 0xB6CECD49
	Offset: 0x31A0
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function function_a712364b(distance, victim)
{
	full_damage = 200;
	if(isdefined(victim.var_6f84b820))
	{
		switch(victim.var_6f84b820)
		{
			case "normal":
			{
				var_db379d0e = 0.13;
				break;
			}
			case "special":
			{
				var_db379d0e = 0.05;
				break;
			}
			case "elite":
			{
				var_db379d0e = 0.02;
				break;
			}
			case "boss":
			{
				var_db379d0e = 0.01;
				break;
			}
			default:
			{
				var_db379d0e = undefined;
			}
		}
		if(isdefined(var_db379d0e))
		{
			full_damage = max(full_damage, int(victim.maxhealth * var_db379d0e));
		}
	}
	var_75fe9465 = full_damage * 0.5;
	if(distance > 250)
	{
		return int(var_75fe9465 + ((full_damage - var_75fe9465) * (400 - distance) / 150));
	}
	return full_damage;
}

/*
	Name: function_e2ac951d
	Namespace: namespace_b376a999
	Checksum: 0x191DE6A1
	Offset: 0x3330
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_e2ac951d()
{
	self.var_7ddf110e = [];
	self waittill(#"death", #"hash_30694ebb96507aa4", #"disconnect");
	foreach(ai in self.var_7ddf110e)
	{
		ai function_da9c3239(self);
	}
}

/*
	Name: function_6dd73f34
	Namespace: namespace_b376a999
	Checksum: 0xB582847D
	Offset: 0x3400
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_6dd73f34(player)
{
	if(!isdefined(self.var_335a665c))
	{
		self.var_335a665c = [];
	}
	if(self.var_335a665c.size == 0)
	{
		self thread function_13acb37c();
	}
	array::add(self.var_335a665c, player, 0);
}

/*
	Name: function_da9c3239
	Namespace: namespace_b376a999
	Checksum: 0xD2E53F70
	Offset: 0x3478
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function function_da9c3239(player)
{
	if(!isdefined(self.var_335a665c))
	{
		return;
	}
	arrayremovevalue(self.var_335a665c, player);
	if(self.var_335a665c.size == 0)
	{
		self notify(#"hash_384ffc276b7de7");
	}
}

/*
	Name: function_13acb37c
	Namespace: namespace_b376a999
	Checksum: 0xFD299588
	Offset: 0x34D8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_13acb37c()
{
	self clientfield::set("" + #"hash_7e9eb1c31cf618f0", 1);
	self waittill(#"death", #"hash_384ffc276b7de7");
	self.var_335a665c = [];
	self clientfield::set("" + #"hash_7e9eb1c31cf618f0", 0);
}

/*
	Name: function_f0c18475
	Namespace: namespace_b376a999
	Checksum: 0xCA26E3FB
	Offset: 0x3578
	Size: 0x4EE
	Parameters: 1
	Flags: Linked
*/
function function_f0c18475(weapon)
{
	self notify(#"hash_30694ebb96507aa4");
	self endon(#"death", #"hash_30694ebb96507aa4");
	self function_42402593(1);
	self thread function_e2ac951d();
	if(isdefined(self.var_172600a6))
	{
		var_6a6a3262 = self.var_172600a6 + 333;
		current_time = gettime();
		if(var_6a6a3262 > current_time)
		{
			wait((var_6a6a3262 - current_time) / 1000);
		}
	}
	current_weapon = self getcurrentweapon();
	while(self throwbuttonpressed() && function_5fef4201(current_weapon) && self getweaponammoclip(current_weapon) < self getweaponammoclipsize(current_weapon))
	{
		targets = self function_13da7675();
		count = 0;
		var_a11964c = [];
		foreach(target in targets)
		{
			if(isalive(target.ai))
			{
				target.ai function_6dd73f34(self);
				var_a11964c[var_a11964c.size] = target.ai;
				damage_location = (target.ai.origin + ((vectornormalize(self.origin - target.ai.origin)) * 10)) + vectorscale((0, 0, 1), 60);
				target.ai dodamage(function_a712364b(target.distance, target.ai), damage_location, self, undefined, "none", "MOD_DOT", 0, weapon);
				target.ai thread function_6dbf1bb3(self, 2);
				count = count + 1;
			}
		}
		foreach(ai in self.var_7ddf110e)
		{
			if(!isinarray(var_a11964c, ai))
			{
				ai function_da9c3239(self);
			}
		}
		self function_42402593(math::clamp(1 + count, 1, 7));
		self.var_7ddf110e = var_a11964c;
		self.var_172600a6 = gettime();
		wait(0.333);
		current_weapon = self getcurrentweapon();
	}
	self val::reset(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire");
	if(function_5fef4201(self getcurrentweapon()))
	{
		self val::set(#"hash_1b614432d036c713", "allow_ads", 0);
	}
	self function_a0a2d8ee(0);
	self function_42402593(0);
	self notify(#"hash_30694ebb96507aa4");
}

/*
	Name: function_4f7dc212
	Namespace: namespace_b376a999
	Checksum: 0x6FA4B4A8
	Offset: 0x3A70
	Size: 0x106
	Parameters: 0
	Flags: Linked
*/
function function_4f7dc212()
{
	self endon(#"death", #"hash_30694ebb96507aa4", #"hash_3271846e2b85db1c");
	level endon(#"end_game");
	self waittill(#"weapon_switch_started");
	self val::reset(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire");
	self val::reset(#"hash_1b614432d036c713", "allow_ads");
	self function_a0a2d8ee(0);
	self function_42402593(0);
	self notify(#"hash_30694ebb96507aa4");
	self notify(#"hash_3271846e2b85db1c");
}

/*
	Name: function_7e071045
	Namespace: namespace_b376a999
	Checksum: 0x120D7271
	Offset: 0x3B80
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function function_7e071045(player)
{
	player endon(#"death", #"weapon_switch_started");
	self.skip_death_notetracks = 1;
	self.nodeathragdoll = 1;
	self.var_49fdad6a = 1;
	self clientfield::set("" + #"hash_77e641a4db48ad0f", 1);
	waittime = 0.5;
	self clientfield::set("" + #"hash_306339376ad218f0", 1);
	while(waittime > 0 && isdefined(self))
	{
		if(!mayspawnentity())
		{
			break;
		}
		self thread function_6dbf1bb3(player);
		if(randomint(10) > 5)
		{
			self thread function_6dbf1bb3(player);
		}
		waittime = waittime - 0.05;
		wait(0.05);
	}
	wait(0.5);
	if(isplayer(player))
	{
		player clientfield::increment("" + #"hash_392d4dd36fe37ce7");
	}
}

/*
	Name: function_6dbf1bb3
	Namespace: namespace_b376a999
	Checksum: 0xCAA95A09
	Offset: 0x3D38
	Size: 0x224
	Parameters: 3
	Flags: Linked
*/
function function_6dbf1bb3(player, var_77c89bbd, start_pos)
{
	if(!isdefined(var_77c89bbd))
	{
		var_77c89bbd = 1;
	}
	if(!isdefined(start_pos))
	{
		start_pos = undefined;
	}
	level endon(#"end_game");
	if(!isdefined(start_pos))
	{
		var_c848a436 = array("j_elbow_le", "j_elbow_ri", "j_shoulder_le", "j_shoulder_ri", "j_spine4", "j_head");
		if(self.archetype == #"zombie_dog")
		{
			var_c848a436 = array("j_spine2", "j_spine3", "j_spine4", "j_neck", "j_head");
		}
		tag = array::random(var_c848a436);
		start_pos = self gettagorigin(tag);
		if(!isdefined(start_pos))
		{
			return;
		}
	}
	var_d58aca35 = spawn("script_model", start_pos);
	var_d58aca35 setmodel(#"tag_origin");
	var_d58aca35 linkto(player);
	var_d58aca35 clientfield::set("" + #"hash_4061bf5adf6ebd2", var_77c89bbd);
	wait(2);
	var_d58aca35 clientfield::set("" + #"hash_4061bf5adf6ebd2", 0);
	wait(0.5);
	var_d58aca35 delete();
}

/*
	Name: function_96db9f3
	Namespace: namespace_b376a999
	Checksum: 0x95354E03
	Offset: 0x3F68
	Size: 0x230
	Parameters: 2
	Flags: Linked
*/
function function_96db9f3(weapon, delta)
{
	var_ac1c1bdc = self getweaponammoclip(weapon) + delta;
	max_ammo = self getweaponammoclipsize(weapon);
	if(var_ac1c1bdc < 0)
	{
		var_ac1c1bdc = 0;
	}
	else if(var_ac1c1bdc > max_ammo)
	{
		var_ac1c1bdc = max_ammo;
	}
	if(var_ac1c1bdc >= max_ammo)
	{
		self val::set(#"hash_1b614432d036c713", "allow_ads", 0);
		self val::reset(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire");
		self notify(#"hash_30694ebb96507aa4");
		self notify(#"hash_3271846e2b85db1c");
		self function_a0a2d8ee(0);
		self function_42402593(0);
	}
	self setweaponammoclip(weapon, var_ac1c1bdc);
	if(function_f1c015e1(weapon))
	{
		var_f6cb1ce6 = int((var_ac1c1bdc / max_ammo) * 8);
		if(self.var_343d2604 !== var_f6cb1ce6)
		{
			self.var_343d2604 = var_f6cb1ce6;
			self function_53e5275c(var_f6cb1ce6);
		}
	}
	else if(function_f17bb85a(weapon))
	{
		var_8e1667b6 = (var_ac1c1bdc > 0 ? 1 : 0);
		if(self.var_8e1667b6 !== var_8e1667b6)
		{
			self.var_8e1667b6 = var_8e1667b6;
			self function_de1f133e(var_8e1667b6);
		}
	}
	return var_ac1c1bdc;
}

/*
	Name: function_a0a2d8ee
	Namespace: namespace_b376a999
	Checksum: 0x358E465F
	Offset: 0x41A0
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_a0a2d8ee(turnon)
{
	if(turnon)
	{
		self clientfield::set("" + #"hash_7c865b5dcfbe46c0", 1);
	}
	else
	{
		self clientfield::set("" + #"hash_7c865b5dcfbe46c0", 0);
	}
}

/*
	Name: function_42402593
	Namespace: namespace_b376a999
	Checksum: 0x7151524C
	Offset: 0x4220
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_42402593(value)
{
	self clientfield::set("" + #"hash_40635c43f5d87929", value);
}

/*
	Name: function_d48a01a5
	Namespace: namespace_b376a999
	Checksum: 0x74E58777
	Offset: 0x4260
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_d48a01a5(watcher)
{
	watcher.onspawn = &function_cdb97cd1;
}

/*
	Name: function_cdb97cd1
	Namespace: namespace_b376a999
	Checksum: 0x3AE4B384
	Offset: 0x4290
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_cdb97cd1(watcher, player)
{
	self clientfield::set("" + #"hash_685e6cfaf658518e", 1);
	self thread function_8811e4ff(player);
}

/*
	Name: function_8811e4ff
	Namespace: namespace_b376a999
	Checksum: 0x6F362A27
	Offset: 0x42F8
	Size: 0x36C
	Parameters: 1
	Flags: Linked
*/
function function_8811e4ff(owner)
{
	self endon(#"death");
	ai_damaged = [];
	var_ef1d7300 = [];
	while(true)
	{
		var_98c4a170 = 0;
		a_targets = getentitiesinradius(self.origin, 150, 15);
		foreach(ai in a_targets)
		{
			if(!isalive(ai) || ai getteam() !== level.zombie_team || isinarray(ai_damaged, ai))
			{
				continue;
			}
			ai dodamage(15000, self.origin, owner, undefined, undefined, "MOD_PROJECTILE", 0, level.var_652bc5ed);
			if(!isdefined(ai_damaged))
			{
				ai_damaged = [];
			}
			else if(!isarray(ai_damaged))
			{
				ai_damaged = array(ai_damaged);
			}
			ai_damaged[ai_damaged.size] = ai;
			var_98c4a170++;
			if(var_98c4a170 >= 3)
			{
				break;
			}
		}
		var_6a77cda0 = getentarray("trigger_damage", "classname");
		arrayremovevalue(var_6a77cda0, undefined);
		var_6a77cda0 = arraysortclosest(var_6a77cda0, self.origin, undefined, undefined, 80);
		foreach(trigger in var_6a77cda0)
		{
			if(isinarray(var_ef1d7300, trigger))
			{
				continue;
			}
			trigger notify(#"damage", {#weapon:level.var_652bc5ed, #attacker:owner});
			if(!isdefined(var_ef1d7300))
			{
				var_ef1d7300 = [];
			}
			else if(!isarray(var_ef1d7300))
			{
				var_ef1d7300 = array(var_ef1d7300);
			}
			var_ef1d7300[var_ef1d7300.size] = trigger;
		}
		wait(0.1);
	}
}

/*
	Name: function_f2262f33
	Namespace: namespace_b376a999
	Checksum: 0x42A26867
	Offset: 0x4670
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function function_f2262f33(params)
{
	if(params.smeansofdeath !== "MOD_PROJECTILE")
	{
		return false;
	}
	if(!isactor(self))
	{
		return false;
	}
	if(level.var_9ea358cc >= 8)
	{
		return false;
	}
	if(self.health <= params.idamage)
	{
		v_z_offset = (0, 0, randomfloatrange(0.6, 1)) * randomintrange(150, 300);
		v_launch = (vectornormalize(params.vdir) * randomintrange(100, 175)) + v_z_offset;
		self startragdoll(1);
		zm_utility::function_ffc279(v_launch, params.eattacker, self.health, level.var_652bc5ed);
		self thread function_1475944a();
	}
}

/*
	Name: function_ca6c6727
	Namespace: namespace_b376a999
	Checksum: 0x8D3E020C
	Offset: 0x47D8
	Size: 0x92
	Parameters: 13
	Flags: Linked
*/
function function_ca6c6727(einflictor, eattacker, idamage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(!isalive(self))
	{
		return 0;
	}
	return surfacetype;
}

/*
	Name: function_21b7e322
	Namespace: namespace_b376a999
	Checksum: 0xD7A00DFA
	Offset: 0x4878
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_21b7e322()
{
	self zombie_eye_glow::function_95cae3e3();
}

/*
	Name: function_fb58c072
	Namespace: namespace_b376a999
	Checksum: 0x2A27E6E0
	Offset: 0x48A0
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_fb58c072(params)
{
	if(self.archetype === #"zombie_dog")
	{
		self function_21b7e322();
		return;
	}
	self.freezegun_death = 1;
	self.skip_death_notetracks = 1;
	self.nodeathragdoll = 1;
	self.var_39184114 = params;
}

/*
	Name: function_caac60f2
	Namespace: namespace_b376a999
	Checksum: 0xC7CA4529
	Offset: 0x4918
	Size: 0x274
	Parameters: 0
	Flags: Linked
*/
function function_caac60f2()
{
	if(is_true(self.var_49fdad6a))
	{
		return;
	}
	self.var_5fe6212f = 1;
	if(!getdvarint(#"splitscreen_playercount", 1) > 2)
	{
		self thread function_4942e7b9();
		self thread function_f94aa073();
	}
	shatter_trigger = spawn("trigger_damage", self.origin, 0, 15, 72);
	flag = function_27f2ef17(shatter_trigger);
	function_4e3bb793(shatter_trigger, flag & (~512));
	shatter_trigger.var_af6e27ba = 0;
	shatter_trigger enablelinkto();
	shatter_trigger linkto(self);
	shatter_trigger thread function_e31780b1();
	shatter_trigger thread function_ff9195ba();
	spawnflags = (512 | 1) | (512 | 2) | (512 | 4) | 16;
	crumple_trigger = spawn("trigger_radius", self.origin, spawnflags, 15, 72);
	crumple_trigger enablelinkto();
	crumple_trigger linkto(self);
	crumple_trigger thread function_e31780b1();
	self.shatter_trigger = shatter_trigger;
	self.crumple_trigger = crumple_trigger;
	self thread function_ee76afdc(self.var_39184114, shatter_trigger, crumple_trigger);
	self thread function_2e74e3c2(self.var_39184114, shatter_trigger, crumple_trigger);
}

/*
	Name: function_ff9195ba
	Namespace: namespace_b376a999
	Checksum: 0x1E957B18
	Offset: 0x4B98
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function function_ff9195ba()
{
	level endon(#"end_game");
	self endon(#"death");
	wait(0.25);
	self.var_9591a331 = 1;
}

/*
	Name: function_301812b0
	Namespace: namespace_b376a999
	Checksum: 0x2306A35A
	Offset: 0x4BE8
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_301812b0()
{
	if(is_true(self.var_49fdad6a))
	{
		return;
	}
	if(is_true(self.var_da9b93fa))
	{
		return;
	}
	if(isdefined(self.shatter_trigger) && isdefined(self.crumple_trigger))
	{
		self function_1a915299(self.var_39184114, self.shatter_trigger, self.crumple_trigger);
	}
	else if(isdefined(self))
	{
		if(!getdvarint(#"splitscreen_playercount", 1) > 2)
		{
			self function_97bcf56f();
			self function_8af9f027();
		}
		self startragdoll();
	}
}

/*
	Name: function_e31780b1
	Namespace: namespace_b376a999
	Checksum: 0x40A5D60D
	Offset: 0x4CF8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_e31780b1()
{
	level endon(#"end_game");
	self endon(#"death");
	wait(10);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_ee76afdc
	Namespace: namespace_b376a999
	Checksum: 0xFE0D8F84
	Offset: 0x4D58
	Size: 0x1A8
	Parameters: 3
	Flags: Linked
*/
function function_ee76afdc(params, shatter_trigger, crumple_trigger)
{
	shatter_trigger endon(#"death", #"hash_4b43502d3b6d5a0");
	self endon(#"death");
	wait(0.1);
	orig_attacker = params.eattacker;
	while(true)
	{
		s_notify = undefined;
		s_notify = shatter_trigger waittill(#"damage");
		if(!is_true(shatter_trigger.var_9591a331) && function_8fbb3409(s_notify.weapon) && !is_true(s_notify.var_98e101b0))
		{
			continue;
		}
		if(isdefined(s_notify.amount))
		{
			shatter_trigger.var_af6e27ba = shatter_trigger.var_af6e27ba + s_notify.amount;
			if(shatter_trigger.var_af6e27ba >= 100)
			{
				if(!is_true(s_notify.var_98e101b0))
				{
					self thread function_1a915299(params, shatter_trigger, crumple_trigger);
				}
				else
				{
					self thread function_b439fd9b(params, shatter_trigger, crumple_trigger);
				}
			}
		}
	}
}

/*
	Name: function_2e74e3c2
	Namespace: namespace_b376a999
	Checksum: 0xDB106833
	Offset: 0x4F08
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function function_2e74e3c2(params, shatter_trigger, crumple_trigger)
{
	crumple_trigger endon(#"death", #"hash_4b43502d3b6d5a0");
	self endon(#"death");
	wait(0.75);
	crumple_trigger waittill(#"trigger");
	self thread function_1a915299(params, shatter_trigger, crumple_trigger);
}

/*
	Name: function_1a915299
	Namespace: namespace_b376a999
	Checksum: 0x5BFFDA74
	Offset: 0x4FA0
	Size: 0xB4
	Parameters: 3
	Flags: Linked
*/
function function_1a915299(params, shatter_trigger, crumple_trigger)
{
	/#
		self function_77d36cb8("");
	#/
	self thread function_60a1b1de(shatter_trigger, crumple_trigger);
	self zombie_eye_glow::function_95cae3e3();
	self function_ae87eaf();
	self function_7a835127();
	self thread function_5a2447b1(1);
}

/*
	Name: function_b439fd9b
	Namespace: namespace_b376a999
	Checksum: 0x52266550
	Offset: 0x5060
	Size: 0xCC
	Parameters: 3
	Flags: Linked
*/
function function_b439fd9b(params, shatter_trigger, crumple_trigger)
{
	/#
		self function_77d36cb8("");
	#/
	self thread function_60a1b1de(shatter_trigger, crumple_trigger);
	self thread function_88d1f10d(params);
	self zombie_eye_glow::function_95cae3e3();
	self function_2a7980e();
	self function_7a835127();
	self thread function_5a2447b1(1);
}

/*
	Name: function_7a835127
	Namespace: namespace_b376a999
	Checksum: 0x74AA961
	Offset: 0x5138
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_7a835127()
{
	if(is_true(self.no_gib))
	{
		return;
	}
	if(!gibserverutils::isgibbed(self, 128))
	{
		gibserverutils::gibrightleg(self, 0);
	}
	if(!gibserverutils::isgibbed(self, 256))
	{
		gibserverutils::gibleftleg(self, 0);
	}
	if(!gibserverutils::isgibbed(self, 16))
	{
		gibserverutils::gibrightarm(self, 0);
	}
	if(!gibserverutils::isgibbed(self, 32))
	{
		gibserverutils::gibleftarm(self, 0);
	}
}

/*
	Name: function_88d1f10d
	Namespace: namespace_b376a999
	Checksum: 0xF7B6703B
	Offset: 0x5228
	Size: 0x260
	Parameters: 1
	Flags: Linked
*/
function function_88d1f10d(params)
{
	level endon(#"end_game");
	centroid = self getcentroid();
	a_targets = getentitiesinradius(centroid, 64, 15);
	foreach(ai in a_targets)
	{
		if(!isdefined(ai) || (ai.archetype !== #"zombie" && ai.archetype !== #"zombie_dog" && ai.archetype !== #"nova_crawler") || ai getteam() !== level.zombie_team)
		{
			continue;
			continue;
		}
		n_damage = 10000;
		if(isentity(ai) && isalive(ai))
		{
			if(isdefined(ai.maxhealth) && ai.maxhealth > 10000)
			{
				n_damage = ai.maxhealth;
			}
			ai dodamage(n_damage, ai.origin, params.eattacker, undefined, undefined, "MOD_EXPLOSIVE", 0, undefined);
			continue;
		}
		if(isdefined(ai.shatter_trigger))
		{
			ai.shatter_trigger dodamage(10000, ai.origin, params.eattacker, undefined, undefined, "MOD_EXPLOSIVE");
		}
	}
}

/*
	Name: function_60a1b1de
	Namespace: namespace_b376a999
	Checksum: 0xC3207061
	Offset: 0x5490
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_60a1b1de(shatter_trigger, crumple_trigger)
{
	self endon(#"death");
	self.var_da9b93fa = 1;
	self notify(#"hash_4b43502d3b6d5a0");
	shatter_trigger notify(#"hash_4b43502d3b6d5a0");
	crumple_trigger notify(#"hash_4b43502d3b6d5a0");
	wait(1);
	if(isdefined(shatter_trigger))
	{
		shatter_trigger delete();
	}
	if(isdefined(crumple_trigger))
	{
		crumple_trigger delete();
	}
}

/*
	Name: function_4942e7b9
	Namespace: namespace_b376a999
	Checksum: 0x3DF0308D
	Offset: 0x5550
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_4942e7b9()
{
	self clientfield::set("" + #"hash_3a35110e6ccc5486", 1);
}

/*
	Name: function_97bcf56f
	Namespace: namespace_b376a999
	Checksum: 0xB6017423
	Offset: 0x5590
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_97bcf56f()
{
	self clientfield::set("" + #"hash_3a35110e6ccc5486", 0);
}

/*
	Name: function_f94aa073
	Namespace: namespace_b376a999
	Checksum: 0x13836D3
	Offset: 0x55C8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_f94aa073()
{
	self clientfield::set("" + #"hash_1709a7bbfac5e1e0", 1);
}

/*
	Name: function_8af9f027
	Namespace: namespace_b376a999
	Checksum: 0x40884ADE
	Offset: 0x5608
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_8af9f027()
{
	self clientfield::set("" + #"hash_1709a7bbfac5e1e0", 0);
}

/*
	Name: function_ae87eaf
	Namespace: namespace_b376a999
	Checksum: 0x7E1AC4EC
	Offset: 0x5640
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_ae87eaf()
{
	self clientfield::set("" + #"hash_6dca42b5563953ef", 1);
}

/*
	Name: function_2a7980e
	Namespace: namespace_b376a999
	Checksum: 0xFC3E24DD
	Offset: 0x5680
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_2a7980e()
{
	self clientfield::set("" + #"hash_2a7b72235f0b387e", 1);
}

/*
	Name: function_47c38bc8
	Namespace: namespace_b376a999
	Checksum: 0xD25D44A
	Offset: 0x56C0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_47c38bc8(watcher)
{
	watcher.onspawn = &function_4af61eed;
}

/*
	Name: function_4af61eed
	Namespace: namespace_b376a999
	Checksum: 0x2FB506CB
	Offset: 0x56F0
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_4af61eed(watcher, player)
{
	player endon(#"death");
	level endon(#"end_game");
	self thread function_6793b4dc(player);
}

/*
	Name: function_6793b4dc
	Namespace: namespace_b376a999
	Checksum: 0xB7AE7587
	Offset: 0x5758
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_6793b4dc(owner)
{
	self endon(#"hash_3d4b5f79f21a96b0");
	self thread function_3bf9052d();
	waitresult = undefined;
	waitresult = self waittill(#"projectile_impact_explode", #"explode");
	if(waitresult._notify == "projectile_impact_explode")
	{
		function_302616d5(owner, waitresult.position, waitresult.normal);
	}
}

/*
	Name: function_3bf9052d
	Namespace: namespace_b376a999
	Checksum: 0x2A1029F2
	Offset: 0x5810
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_3bf9052d()
{
	self waittill(#"death");
	waittillframeend();
	self notify(#"hash_3d4b5f79f21a96b0");
}

/*
	Name: function_302616d5
	Namespace: namespace_b376a999
	Checksum: 0xEBC9660D
	Offset: 0x5848
	Size: 0x10C
	Parameters: 3
	Flags: Linked
*/
function function_302616d5(owner, position, normal)
{
	dir_up = (0, 0, 1);
	ent = spawntimedfx(getweapon(#"hash_43f15ab903e2e35"), position, dir_up, int(10));
	if(isdefined(owner))
	{
		ent setteam(owner.team);
		if(isplayer(owner))
		{
			ent setowner(owner);
		}
	}
	thread function_f9ebf407(owner, position, normal, 70, int(gettime() + 10000));
}

/*
	Name: function_f9ebf407
	Namespace: namespace_b376a999
	Checksum: 0xE28A4211
	Offset: 0x5960
	Size: 0x1F6
	Parameters: 5
	Flags: Linked
*/
function function_f9ebf407(owner, position, normal, radius, damageendtime)
{
	level endon(#"end_game");
	radius = 10;
	while(gettime() < damageendtime)
	{
		all_targets = getentitiesinradius(normal, radius, 15);
		foreach(target in all_targets)
		{
			if(isalive(target) && target getteam() == level.zombie_team)
			{
				target dodamage(1500, target.origin, position, self, "none", "MOD_UNKNOWN", 0, getweapon(#"hash_6e0b27b854e591a3"));
				if(1500 < target.health && !is_true(target.var_65ebe4ec))
				{
					target.var_65ebe4ec = 1;
					target thread function_48c9861b(gettime());
				}
			}
		}
		wait(0.33);
		radius = radius + 5;
		if(radius > 70)
		{
			radius = 70;
		}
	}
}

/*
	Name: function_48c9861b
	Namespace: namespace_b376a999
	Checksum: 0xA370DFAB
	Offset: 0x5B60
	Size: 0xCE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_48c9861b(var_66284057)
{
	level endon(#"end_game");
	self.var_ca98503 = var_66284057 + 0.4;
	function_74be4c3e(1);
	time_now = gettime();
	while(time_now < self.var_ca98503)
	{
		wait(self.var_ca98503 - time_now);
		if(!isdefined(self))
		{
			return;
		}
		time_now = gettime();
	}
	if(isalive(self))
	{
		function_41ac088f();
		self.var_65ebe4ec = 0;
	}
}

/*
	Name: function_c9ccbd54
	Namespace: namespace_b376a999
	Checksum: 0x71662E96
	Offset: 0x5C38
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_c9ccbd54()
{
	level endon(#"end_game");
	if(self function_ac1ff86e())
	{
		self clientfield::set("" + #"hash_77e641a4db48ad0f", 3);
		self thread function_5a2447b1(2);
	}
	else
	{
		function_74be4c3e(2);
		result = undefined;
		result = self waittill(#"actor_corpse");
		if(isdefined(result.corpse))
		{
			result.corpse function_74be4c3e(2);
			wait(15);
			if(isdefined(result.corpse))
			{
				result.corpse thread util::delayed_delete(0.5);
			}
		}
	}
}

/*
	Name: function_c8adf16f
	Namespace: namespace_b376a999
	Checksum: 0x4AED1775
	Offset: 0x5D60
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_c8adf16f(weapon)
{
	self.var_343d2604--;
	if(self.var_343d2604 < 0)
	{
		self.var_343d2604 = 0;
	}
	else if(self.var_343d2604 > 8)
	{
		self.var_343d2604 = 8;
	}
	function_53e5275c(self.var_343d2604);
}

/*
	Name: function_74be4c3e
	Namespace: namespace_b376a999
	Checksum: 0x87BBB7B0
	Offset: 0x5DD0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_74be4c3e(stage)
{
	if(isactor(self) || isactorcorpse(self))
	{
		self clientfield::set("" + #"hash_97d03a2a0786ba6", stage);
	}
}

/*
	Name: function_41ac088f
	Namespace: namespace_b376a999
	Checksum: 0xD41B00B3
	Offset: 0x5E48
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_41ac088f()
{
	if(isactor(self) || isactorcorpse(self))
	{
		self clientfield::set("" + #"hash_97d03a2a0786ba6", 0);
	}
}

/*
	Name: function_53e5275c
	Namespace: namespace_b376a999
	Checksum: 0xA4B4EA7E
	Offset: 0x5EB8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_53e5275c(ammo_count)
{
	self clientfield::set("" + #"hash_3c92af57fde1f8f7", ammo_count);
}

/*
	Name: function_3c39516d
	Namespace: namespace_b376a999
	Checksum: 0x2D2FE4CA
	Offset: 0x5EF8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_3c39516d(watcher)
{
	watcher.onspawn = &function_83869cdb;
}

/*
	Name: function_d6ae76f5
	Namespace: namespace_b376a999
	Checksum: 0x3D282E2D
	Offset: 0x5F28
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_d6ae76f5(weapon)
{
	if(self getweaponammoclip(weapon) === 0 && self.var_8e1667b6 !== 0)
	{
		self.var_8e1667b6 = 0;
		self function_de1f133e(0);
	}
}

/*
	Name: function_83869cdb
	Namespace: namespace_b376a999
	Checksum: 0xB633E17C
	Offset: 0x5F90
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_83869cdb(watcher, player)
{
	self thread function_615ff5e9(player);
}

/*
	Name: function_615ff5e9
	Namespace: namespace_b376a999
	Checksum: 0x335F2EA7
	Offset: 0x5FC8
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function function_615ff5e9(owner)
{
	self endon(#"death");
	while(true)
	{
		var_6a77cda0 = getentarray("trigger_damage", "classname");
		arrayremovevalue(var_6a77cda0, undefined);
		var_6a77cda0 = arraysortclosest(var_6a77cda0, self.origin, undefined, undefined, 100);
		foreach(trigger in var_6a77cda0)
		{
			if(self istouching(trigger, vectorscale((1, 1, 1), 10)))
			{
				trigger notify(#"damage", {#weapon:level.var_12b450dc, #attacker:owner});
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_fd195372
	Namespace: namespace_b376a999
	Checksum: 0x266E6DCB
	Offset: 0x6148
	Size: 0x1B8
	Parameters: 13
	Flags: Linked
*/
function function_fd195372(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(isdefined(shitloc) && surfacetype != "MOD_DOT" && surfacetype != "MOD_MELEE")
	{
		if(!isdefined(shitloc.var_4bc2bb56))
		{
			shitloc.var_4bc2bb56 = 150000;
		}
		boneindex = min(self.health, shitloc.var_4bc2bb56);
		boneindex = min(boneindex, 50000);
		shitloc.var_4bc2bb56 = shitloc.var_4bc2bb56 - boneindex;
		if(isplayer(psoffsettime))
		{
			psoffsettime clientfield::increment("" + #"hash_492f4817c4296ddf");
		}
		if(shitloc.var_4bc2bb56 == 0)
		{
			shitloc deletedelay();
		}
		self clientfield::set("" + #"hash_380d2d329a41c90e", 1);
	}
	return boneindex;
}

/*
	Name: function_de1f133e
	Namespace: namespace_b376a999
	Checksum: 0xF694161A
	Offset: 0x6308
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_de1f133e(var_bb674ab4)
{
	self clientfield::set("" + #"hash_89386ef1bb99cdf", var_bb674ab4);
}

/*
	Name: function_efcce3c1
	Namespace: namespace_b376a999
	Checksum: 0xBE057944
	Offset: 0x6348
	Size: 0x172
	Parameters: 0
	Flags: Linked
*/
function function_efcce3c1()
{
	level.var_284e25d2 = [];
	level.var_284e25d2[1] = spawnstruct();
	level.var_284e25d2[1].damage = 1000;
	level.var_284e25d2[1].var_dfd1c927 = 1;
	level.var_284e25d2[1].var_4a0c6d55 = 1000;
	level.var_284e25d2[2] = spawnstruct();
	level.var_284e25d2[2].damage = 3000;
	level.var_284e25d2[2].var_dfd1c927 = 1;
	level.var_284e25d2[2].var_4a0c6d55 = 2000;
	level.var_284e25d2[3] = spawnstruct();
	level.var_284e25d2[3].damage = 7500;
	level.var_284e25d2[3].var_dfd1c927 = 2;
	level.var_284e25d2[3].var_4a0c6d55 = undefined;
}

/*
	Name: function_5a9a8abc
	Namespace: namespace_b376a999
	Checksum: 0xB45F5621
	Offset: 0x64C8
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function function_5a9a8abc(weapon)
{
	if(!is_true(self.var_3f74bd46))
	{
		self.var_3f74bd46 = 1;
		self.var_7c223de7 = gettime();
		self.var_9cb64422 = 0;
		self.var_c627b034 = 1;
		self clientfield::set("" + #"hash_2eb1021a0e4110d1", self.var_c627b034);
		thread function_4a074bb5(weapon);
		thread function_a8733e49(weapon);
	}
	else
	{
		time_now = gettime();
		self.var_9cb64422 = self.var_9cb64422 + (time_now - self.var_7c223de7);
		self.var_7c223de7 = time_now;
		if(isdefined(level.var_284e25d2[self.var_c627b034].var_4a0c6d55) && self.var_9cb64422 > level.var_284e25d2[self.var_c627b034].var_4a0c6d55)
		{
			self.var_c627b034 = self.var_c627b034 + 1;
			self clientfield::set("" + #"hash_2eb1021a0e4110d1", self.var_c627b034);
		}
	}
	self function_96db9f3(self getcurrentweapon(), level.var_284e25d2[self.var_c627b034].var_dfd1c927 * -1);
}

/*
	Name: get_closest_tag
	Namespace: namespace_b376a999
	Checksum: 0x2A1FAC76
	Offset: 0x6698
	Size: 0x1BA
	Parameters: 1
	Flags: Linked, Private
*/
function private get_closest_tag(v_pos)
{
	if(!isdefined(level.gib_tags))
	{
		zombie_utility::init_gib_tags();
	}
	tag_closest = undefined;
	var_9aabd9de = arraycopy(level.gib_tags);
	if(!isdefined(var_9aabd9de))
	{
		var_9aabd9de = [];
	}
	else if(!isarray(var_9aabd9de))
	{
		var_9aabd9de = array(var_9aabd9de);
	}
	if(!isinarray(var_9aabd9de, "j_head"))
	{
		var_9aabd9de[var_9aabd9de.size] = "j_head";
	}
	for(i = 0; i < var_9aabd9de.size; i++)
	{
		if(!isdefined(tag_closest))
		{
			tag_closest = var_9aabd9de[i];
			continue;
		}
		var_abe265db = self gettagorigin(var_9aabd9de[i]);
		var_2cd7818f = self gettagorigin(tag_closest);
		if(!isdefined(var_abe265db) || !isdefined(var_2cd7818f))
		{
			continue;
		}
		if(distancesquared(v_pos, var_abe265db) < distancesquared(v_pos, var_2cd7818f))
		{
			tag_closest = var_9aabd9de[i];
		}
	}
	return tolower(tag_closest);
}

/*
	Name: function_3a84d307
	Namespace: namespace_b376a999
	Checksum: 0xC30B4CC4
	Offset: 0x6860
	Size: 0x134
	Parameters: 3
	Flags: Linked
*/
function function_3a84d307(e_target, v_target_pos, weapon)
{
	if(e_target.archetype === #"zombie")
	{
		str_hitloc = "torso_lower";
		str_tag = e_target get_closest_tag(v_target_pos);
		if(str_tag === "j_head")
		{
			str_hitloc = "head";
		}
	}
	else
	{
		str_hitloc = "head";
	}
	n_damage = 0;
	if(isdefined(level.var_284e25d2[self.var_c627b034].damage))
	{
		n_damage = int(level.var_284e25d2[self.var_c627b034].damage);
	}
	if(isalive(e_target))
	{
		e_target dodamage(n_damage, v_target_pos, self, undefined, str_hitloc, "MOD_UNKNOWN", 0, weapon);
	}
}

/*
	Name: function_4a074bb5
	Namespace: namespace_b376a999
	Checksum: 0xB7E10AF9
	Offset: 0x69A0
	Size: 0x298
	Parameters: 1
	Flags: Linked
*/
function function_4a074bb5(weapon)
{
	self endon(#"death", #"stop_damage");
	while(true)
	{
		v_position = self getplayercamerapos();
		v_forward = anglestoforward(self getplayerangles());
		a_trace = beamtrace(v_position, v_position + (v_forward * 1000), 1, self);
		var_1c218ece = a_trace[#"position"];
		if(isdefined(a_trace[#"entity"]))
		{
			e_last_target = a_trace[#"entity"];
			if(isdefined(e_last_target.var_6f84b820) && e_last_target.team !== #"allies")
			{
				self thread function_3a84d307(e_last_target, var_1c218ece, weapon);
			}
			triggers = getentarray("trigger_damage", "classname");
			arrayremovevalue(triggers, undefined);
			triggers = arraysortclosest(triggers, self.origin, undefined, undefined, 1000);
			foreach(trigger in triggers)
			{
				if(istouching(var_1c218ece, trigger))
				{
					trigger notify(#"damage", {#weapon:level.var_e0be56c0, #attacker:self});
				}
			}
		}
		e_last_target = undefined;
		wait(0.1);
	}
}

/*
	Name: function_a8733e49
	Namespace: namespace_b376a999
	Checksum: 0xBAD511A6
	Offset: 0x6C40
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_a8733e49(weapon)
{
	self endoncallback(&function_1f8640bc, #"death", #"weapon_change");
	level endon(#"end_game");
	while(zm_utility::is_player_valid(self) && self isfiring() && self getweaponammoclip(weapon) > (level.var_284e25d2[self.var_c627b034].var_dfd1c927 + 3) && !self ismeleeing() && !self isswitchingweapons())
	{
		waitframe(1);
	}
	function_1f8640bc();
}

/*
	Name: function_1f8640bc
	Namespace: namespace_b376a999
	Checksum: 0x762E485E
	Offset: 0x6D50
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function function_1f8640bc(s_notify)
{
	self.var_3f74bd46 = undefined;
	self.var_c627b034 = 1;
	self clientfield::set("" + #"hash_2eb1021a0e4110d1", 0);
	self notify(#"stop_damage");
}

/*
	Name: function_77d36cb8
	Namespace: namespace_b376a999
	Checksum: 0xC993785B
	Offset: 0x6DB8
	Size: 0x8C
	Parameters: 2
	Flags: None
*/
function function_77d36cb8(msg, color)
{
	/#
		if(!isdefined(color))
		{
			color = (1, 1, 1);
		}
		if(!getdvarint(#"hash_528e35e5faa6eb75", 0))
		{
			return;
		}
		print3d(self.origin + vectorscale((0, 0, 1), 60), msg, color, 1, 1, 40);
	#/
}

/*
	Name: function_64cd8a8f
	Namespace: namespace_b376a999
	Checksum: 0x8663BD06
	Offset: 0x6E50
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_64cd8a8f(string)
{
	/#
		if(!getdvarint(#"hash_528e35e5faa6eb75", 0))
		{
			return;
		}
		println(string);
	#/
}

