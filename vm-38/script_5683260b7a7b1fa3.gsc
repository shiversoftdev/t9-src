#using script_193d6fcd3b319d05;
#using script_34e9dd62fc371077;
#using scripts\zm_common\aats\zm_aat.gsc;
#using script_1029986e2bc8ca8e;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_340a2e805e35f7a2;
#using scripts\core_common\item_inventory.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_e6fea84d;

/*
	Name: function_e5472082
	Namespace: namespace_e6fea84d
	Checksum: 0x14BEFA34
	Offset: 0x248
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e5472082()
{
	level notify(-803579585);
}

/*
	Name: __init__system__
	Namespace: namespace_e6fea84d
	Checksum: 0xB3C0B833
	Offset: 0x268
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_1aecd78b7244ff81", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e6fea84d
	Checksum: 0x80F724D1
	Offset: 0x2B0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_c090ac9c
	Namespace: namespace_e6fea84d
	Checksum: 0xA5D5CEB1
	Offset: 0x2C0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_c090ac9c()
{
	level flag::wait_till("rounds_started");
}

/*
	Name: function_8df2fc68
	Namespace: namespace_e6fea84d
	Checksum: 0x11E53B3E
	Offset: 0x2F0
	Size: 0xE2
	Parameters: 1
	Flags: Private
*/
function private function_8df2fc68(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_21b5fc9db9accec7":
			{
				level thread function_4e9f972a(1);
				break;
			}
			case "hash_35aacbfc1cc6d1b0":
			{
				level thread function_4e9f972a(3);
				break;
			}
			case "hash_25a40277684d32ee":
			{
				level thread function_4e9f972a(6);
				break;
			}
			case "hash_26a37be826de2ef6":
			{
				level thread function_4e9f972a(10);
				break;
			}
		}
	#/
}

/*
	Name: function_2d9abf0f
	Namespace: namespace_e6fea84d
	Checksum: 0xC74BDE97
	Offset: 0x3E0
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_2d9abf0f()
{
	if(getdvarint(#"hash_226d79954e87df70", 0))
	{
		foreach(player in getplayers())
		{
			player zm_stats::increment_challenge_stat(#"hash_45b90af94bc28199");
		}
	}
}

/*
	Name: function_4e9f972a
	Namespace: namespace_e6fea84d
	Checksum: 0x69D192FC
	Offset: 0x4A8
	Size: 0x22C
	Parameters: 1
	Flags: None
*/
function function_4e9f972a(var_4d2ad93e)
{
	self notify("7f3ed4a910756973");
	self endon("7f3ed4a910756973");
	level flag::set(#"hash_554d70a6779336e1");
	foreach(player in getplayers())
	{
		player playlocalsound(#"hash_17c36e83d2e0bc31");
		level.onslaught_hud onslaught_hud::function_71fd1345(player, 1);
		player clientfield::set_player_uimodel("hudItems.onslaught.lottoloadouts_rarity", function_4bac897(var_4d2ad93e));
	}
	objective_manager::stop_timer();
	objective_manager::start_timer(5);
	foreach(player in getplayers())
	{
		player thread function_e3871553(var_4d2ad93e);
		player playlocalsound(#"hash_6ff6896abbcdb20e");
	}
	wait(1.5);
	level flag::clear(#"hash_554d70a6779336e1");
}

/*
	Name: function_bc1832a2
	Namespace: namespace_e6fea84d
	Checksum: 0x94474C41
	Offset: 0x6E0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_bc1832a2()
{
	level flag::set(#"hash_554d70a6779336e1");
}

/*
	Name: function_3e8a5580
	Namespace: namespace_e6fea84d
	Checksum: 0x1444476A
	Offset: 0x710
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_3e8a5580(str_notify)
{
	self val::reset(#"hash_20448189c8ad7c6f", "disable_weapons");
	self val::reset("#lotto_loadouts", "disable_offhand_weapons");
}

/*
	Name: function_e3871553
	Namespace: namespace_e6fea84d
	Checksum: 0x1D2614B2
	Offset: 0x778
	Size: 0xE6C
	Parameters: 1
	Flags: None
*/
function function_e3871553(var_4d2ad93e)
{
	self endoncallback(&function_3e8a5580, #"death");
	if(!isdefined(self.var_5f08a4b1))
	{
		self.var_5f08a4b1 = [];
	}
	var_2b930188 = (isdefined(var_4d2ad93e) ? var_4d2ad93e : level.var_9b7bd0e8);
	self val::set("#lotto_loadouts", "disable_offhand_weapons", 1);
	while(self zm_utility::is_drinking() || self laststand::player_is_in_laststand() || is_true(self.var_12d4c9e8))
	{
		waitframe(1);
	}
	self val::set(#"hash_20448189c8ad7c6f", "disable_weapons", 1);
	wait(0.25);
	foreach(weapon in self getweaponslistprimaries())
	{
		if(weapon != level.weaponbasemeleeheld)
		{
			self zm_weapons::weapon_take(weapon);
		}
	}
	var_f64582b4 = getarraykeys(level.var_ec04a8a4);
	var_daa9a51c = [];
	foreach(weapon in level.var_cb55e72e)
	{
		if(!isdefined(var_daa9a51c))
		{
			var_daa9a51c = [];
		}
		else if(!isarray(var_daa9a51c))
		{
			var_daa9a51c = array(var_daa9a51c);
		}
		if(!isinarray(var_daa9a51c, weapon.name))
		{
			var_daa9a51c[var_daa9a51c.size] = weapon.name;
		}
	}
	var_f64582b4 = array::exclude(var_f64582b4, var_daa9a51c);
	var_a9c2b895 = array::exclude(var_f64582b4, self.var_5f08a4b1);
	str_weapon_name = array::random(var_a9c2b895);
	if(!isdefined(str_weapon_name))
	{
		str_weapon_name = array::random(var_f64582b4);
	}
	if(isdefined(str_weapon_name))
	{
		if(!isdefined(self.var_5f08a4b1))
		{
			self.var_5f08a4b1 = [];
		}
		else if(!isarray(self.var_5f08a4b1))
		{
			self.var_5f08a4b1 = array(self.var_5f08a4b1);
		}
		if(!isinarray(self.var_5f08a4b1, str_weapon_name))
		{
			self.var_5f08a4b1[self.var_5f08a4b1.size] = str_weapon_name;
		}
	}
	else
	{
		/#
			assertmsg("");
		#/
		return;
	}
	switch(var_2b930188)
	{
		case 0:
		case 1:
		case 2:
		{
			str_item_name = (isdefined(level.var_29d88fe5[str_weapon_name][#"green"]) ? level.var_29d88fe5[str_weapon_name][#"green"] : level.var_ec04a8a4[str_weapon_name][#"green"]);
			n_rarity = 0;
			var_27751b99 = 0;
			break;
		}
		case 3:
		case 4:
		{
			str_item_name = (isdefined(level.var_29d88fe5[str_weapon_name][#"blue"]) ? level.var_29d88fe5[str_weapon_name][#"blue"] : level.var_ec04a8a4[str_weapon_name][#"blue"]);
			n_rarity = 1;
			var_27751b99 = 1;
			break;
		}
		case 5:
		case 6:
		case 7:
		{
			str_item_name = (isdefined(level.var_29d88fe5[str_weapon_name][#"purple"]) ? level.var_29d88fe5[str_weapon_name][#"purple"] : level.var_ec04a8a4[str_weapon_name][#"purple"]);
			n_rarity = 2;
			var_27751b99 = 2;
			var_80c3ca2 = array::random([4:"ammomod_shatterblast", 3:"ammomod_napalmburst", 2:"ammomod_deadwire", 1:"ammomod_cryofreeze", 0:"ammomod_brainrot"]);
			break;
		}
		case 8:
		default:
		{
			str_item_name = (isdefined(level.var_29d88fe5[str_weapon_name][#"orange"]) ? level.var_29d88fe5[str_weapon_name][#"orange"] : level.var_ec04a8a4[str_weapon_name][#"orange"]);
			n_rarity = 3;
			var_27751b99 = 3;
			var_80c3ca2 = array::random([4:"ammomod_shatterblast", 3:"ammomod_napalmburst", 2:"ammomod_deadwire", 1:"ammomod_cryofreeze", 0:"ammomod_brainrot"]);
			break;
		}
	}
	if(isdefined(str_item_name))
	{
		point = function_4ba8fde(str_item_name);
		if(isdefined(point.var_a6762160) && var_27751b99 > 0 && isdefined(level.var_fee1eaaf))
		{
			var_a53e9db0 = point.var_a6762160.var_a53e9db0;
			var_d0e99a2a = point.var_a6762160.var_d0e99a2a;
			var_8e212f46 = point.var_a6762160.var_8e212f46;
			var_3e805062 = point.var_a6762160.var_3e805062;
			new_item = [[level.var_fee1eaaf]](point);
			if(isdefined(new_item))
			{
				point = new_item;
				point.var_a8bccf69 = var_27751b99;
				point.var_a6762160.var_a53e9db0 = var_a53e9db0;
				point.var_a6762160.var_d0e99a2a = var_d0e99a2a;
				point.var_a6762160.var_8e212f46 = var_8e212f46;
				point.var_a6762160.var_3e805062 = var_3e805062;
			}
		}
		if(isdefined(point) && isdefined(var_80c3ca2))
		{
			point.aat = var_80c3ca2;
		}
		if(isdefined(point.var_a6762160.var_a53e9db0))
		{
			weapon = namespace_65181344::function_67456242(point.var_a6762160);
			dropitem = item_drop::drop_item(0, weapon, 1, weapon.maxammo, point.id, self.origin, self.angles);
			dropitem.hidetime = 1;
			dropitem hide();
			self zm_weapons::function_98776900(dropitem, 0, 0, 1);
		}
		else
		{
			self zm_weapons::function_98776900(point, 0, 0, 1);
		}
		if(var_27751b99 > 0)
		{
			self item_inventory::function_d92c6b5b(self.currentweapon, 0, var_27751b99, point);
			maxammo = self.currentweapon.maxammo;
			var_53b14ebf = self function_b7f1fd2c(self.currentweapon);
			self setweaponammoclip(self.currentweapon, var_53b14ebf);
			self setweaponammostock(self.currentweapon, maxammo);
			self notify(#"hash_75ec9942d2d5fd0f");
		}
	}
	if(isdefined(self.currentweapon))
	{
		weapon = zm_weapons::get_base_weapon(self.currentweapon);
		if(weapon.weapclass === "melee" || is_true(weapon.issniperweapon) || weapon.weapclass === #"pistol" && ((level.wave_number % 3) == 0 || level.wave_number >= 6) || (is_true(weapon.islauncher) && var_27751b99 == 0) || (weapon.name === #"special_crossbow_t9" && level.wave_number >= 3))
		{
			self thread zm_vo::function_8abe0568(#"game_over");
		}
	}
	wait(0.25);
	self val::reset(#"hash_20448189c8ad7c6f", "disable_weapons");
	self val::reset("#lotto_loadouts", "disable_offhand_weapons");
	if(isdefined(var_80c3ca2))
	{
		self clientfield::set_player_uimodel("hudItems.onslaught.lottoloadouts_atttype", function_525c846d(var_80c3ca2));
	}
	else
	{
		self clientfield::set_player_uimodel("hudItems.onslaught.lottoloadouts_atttype", 0);
	}
	var_bd027dd9 = item_inventory::function_ec087745();
	if(var_bd027dd9 != 32767)
	{
		var_a781b3e1 = item_inventory::get_inventory_item(var_bd027dd9);
		weapon = item_inventory::get_current_weapon();
		if(var_27751b99 > 0)
		{
			var_a781b3e1.var_a8bccf69 = var_27751b99;
		}
		var_a781b3e1.aat = var_80c3ca2;
		if(isdefined(var_a781b3e1.var_a8bccf69))
		{
			self clientfield::set_player_uimodel("pap_current", var_a781b3e1.var_a8bccf69);
		}
		else
		{
			self clientfield::set_player_uimodel("pap_current", 0);
		}
		if(!zm_weapons::is_wonder_weapon(weapon))
		{
			if(isdefined(var_a781b3e1.aat))
			{
				if(weapon.weapclass != "melee" && weapon.name != #"special_ballisticknife_t9_dw" && weapon.name != #"hash_4650af6ac5c9ce80")
				{
					self function_bf3044dc(weapon, 1);
				}
			}
			else
			{
				self function_bf3044dc(weapon, 0);
			}
		}
		util::wait_network_frame();
		self zm_aat::function_ec7953fa();
	}
	level.onslaught_hud onslaught_hud::function_71fd1345(self, 2);
	self thread function_3c487e20();
}

/*
	Name: function_4bac897
	Namespace: namespace_e6fea84d
	Checksum: 0x29DBF9D1
	Offset: 0x15F0
	Size: 0x11E
	Parameters: 1
	Flags: None
*/
function function_4bac897(var_4d2ad93e)
{
	var_2b930188 = (isdefined(var_4d2ad93e) ? var_4d2ad93e : level.var_9b7bd0e8);
	switch(var_2b930188)
	{
		case 0:
		case 1:
		case 2:
		{
			n_rarity = 0;
			break;
		}
		case 3:
		case 4:
		{
			n_rarity = 1;
			break;
		}
		case 5:
		case 6:
		case 7:
		{
			n_rarity = 2;
			break;
		}
		case 8:
		default:
		{
			n_rarity = 3;
			break;
		}
	}
	return n_rarity;
}

/*
	Name: function_525c846d
	Namespace: namespace_e6fea84d
	Checksum: 0x93A1BDBC
	Offset: 0x1718
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_525c846d(var_1d5284b1)
{
	switch(var_1d5284b1)
	{
		case "ammomod_brainrot":
		{
			return 6;
		}
		case "ammomod_cryofreeze":
		{
			return 1;
		}
		case "ammomod_deadwire":
		{
			return 4;
		}
		case "ammomod_napalmburst":
		{
			return 3;
		}
		case "ammomod_shatterblast":
		{
			return 7;
		}
	}
	return 0;
}

/*
	Name: function_3c487e20
	Namespace: namespace_e6fea84d
	Checksum: 0x336E8051
	Offset: 0x17B0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_3c487e20()
{
	self endon(#"disconnect");
	wait(2);
	level.onslaught_hud onslaught_hud::function_71fd1345(self, 0);
}

