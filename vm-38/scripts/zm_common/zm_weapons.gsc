#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\trials\zm_trial_reset_loadout.gsc;
#using scripts\zm_common\zm_wallbuy.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_placeable_mine.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_camos.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\weapons\weapons.gsc;
#using scripts\abilities\ability_util.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_67c87580908a0a00;
#using scripts\zm_common\aats\zm_aat.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\popups_shared.gsc;
#using script_471b31bd963b388e;
#using script_4108035fe400ce67;
#using script_340a2e805e35f7a2;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\activecamo_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace zm_weapons;

/*
	Name: function_a9bc427d
	Namespace: zm_weapons
	Checksum: 0xD1FC566F
	Offset: 0x2F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a9bc427d()
{
	level notify(1176855073);
}

/*
	Name: __init__system__
	Namespace: zm_weapons
	Checksum: 0x2EA2E787
	Offset: 0x318
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_weapons", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_weapons
	Checksum: 0x55800DE8
	Offset: 0x370
	Size: 0x2EC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level flag::init("zm_weapons_table_loaded");
	level.weaponnone = getweapon(#"none");
	level.weaponnull = getweapon(#"weapon_null");
	level.var_78032351 = getweapon(#"defaultweapon");
	level.weaponbasemelee = getweapon(#"knife");
	if(!isdefined(level.zombie_weapons))
	{
		level.zombie_weapons = [];
	}
	if(!isdefined(level.zombie_weapons_upgraded))
	{
		level.zombie_weapons_upgraded = [];
	}
	if(!isdefined(level.var_69acf721))
	{
		level.var_69acf721 = [];
	}
	if(!isdefined(level.var_cb55e72e))
	{
		level.var_cb55e72e = [];
	}
	if(!isdefined(level.var_8e3edeb9))
	{
		level.var_8e3edeb9 = [];
	}
	level.limited_weapons = [];
	function_ec38915a();
	level.var_51443ce5 = &get_player_weapondata;
	level.var_bfbdc0cd = &weapondata_give;
	level.var_ee5c0b6e = &function_93cd8e76;
	level.var_6476d5c6 = [];
	level.var_60387857 = [];
	level.var_6476d5c6[1] = new class_c6c0e94();
	[[ level.var_6476d5c6[1] ]]->initialize(#"radius", 2, float(function_60d95f53()) / 1000);
	level.var_f96e7a56 = [];
	level.var_37c36b82 = &function_f4e096e4;
	callback::on_weapon_change(&on_weapon_change);
	callback::on_item_pickup(&on_item_pickup);
	function_30b08f95();
	function_cf3f5b23();
	weapons::init_shared();
	/#
		level.var_800654fc = &function_800654fc;
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: zm_weapons
	Checksum: 0xE7E9EE19
	Offset: 0x668
	Size: 0x4AC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	init();
	function_8389c033(#"ray_gun", #"ray_gun");
	function_dd02fe13(#"knife_loadout");
	function_dd02fe13(#"hash_7a910d220f3767fa");
	function_dd02fe13(#"melee_sledgehammer_t9");
	function_dd02fe13(#"hash_537b94a09bd1867f");
	function_dd02fe13(#"melee_wakizashi_t9");
	function_dd02fe13(#"hash_34a3d5e05d7acdee");
	function_dd02fe13(#"melee_etool_t9");
	function_dd02fe13(#"hash_63b33204197f67ee");
	function_dd02fe13(#"melee_machete_t9");
	function_dd02fe13(#"hash_61b3e2efa78ea114");
	function_90953640(getweapon(#"shotgun_pump_t9"), 4, float(function_60d95f53()) / 1000, 1);
	function_283a8d38(#"melee_machete_t9");
	function_283a8d38(#"hash_61b3e2efa78ea114");
	function_283a8d38(#"melee_etool_t9");
	function_283a8d38(#"hash_63b33204197f67ee");
	function_283a8d38(#"melee_sledgehammer_t9");
	function_283a8d38(#"hash_537b94a09bd1867f");
	function_283a8d38(#"melee_wakizashi_t9");
	function_283a8d38(#"hash_34a3d5e05d7acdee");
	function_283a8d38(#"ar_fasthandling_t9");
	function_283a8d38(#"hash_440f94a23acbfaaf");
	function_283a8d38(#"shotgun_fullauto_t9");
	function_283a8d38(#"hash_e28d994eb1a693");
	function_283a8d38(#"smg_fastfire_t9");
	function_283a8d38(#"hash_76e5e59b6a7d78ca");
	function_283a8d38(#"smg_accurate_t9");
	function_283a8d38(#"sniper_cannon_t9");
	function_283a8d38(#"ar_slowhandling_t9");
	function_283a8d38(#"special_crossbow_t9");
	function_283a8d38(#"hash_6cf4eebd901db42");
	function_283a8d38(#"hash_6c8d39be6c0b60d");
	function_283a8d38(#"hash_492946cdc9e4f3d4");
	function_283a8d38(#"hash_c6535e906c2c072");
}

/*
	Name: function_283a8d38
	Namespace: zm_weapons
	Checksum: 0xE7D54A41
	Offset: 0xB20
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_283a8d38(weapon_name)
{
	weapon = getweapon(weapon_name);
	if(!isdefined(level.var_cb55e72e))
	{
		level.var_cb55e72e = [];
	}
	else if(!isarray(level.var_cb55e72e))
	{
		level.var_cb55e72e = array(level.var_cb55e72e);
	}
	if(!isinarray(level.var_cb55e72e, weapon))
	{
		level.var_cb55e72e[level.var_cb55e72e.size] = weapon;
	}
}

/*
	Name: function_f4e096e4
	Namespace: zm_weapons
	Checksum: 0x14AFC4FA
	Offset: 0xBF0
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_f4e096e4(weapon)
{
	weapon = get_base_weapon(weapon);
	if(isdefined(level.var_69acf721) && isinarray(level.var_69acf721, weapon))
	{
		return true;
	}
	return false;
}

/*
	Name: function_dd02fe13
	Namespace: zm_weapons
	Checksum: 0x4353BCD3
	Offset: 0xC58
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_dd02fe13(weapon_name)
{
	weapon = getweapon(weapon_name);
	if(!isdefined(level.var_69acf721))
	{
		level.var_69acf721 = [];
	}
	else if(!isarray(level.var_69acf721))
	{
		level.var_69acf721 = array(level.var_69acf721);
	}
	if(!isinarray(level.var_69acf721, weapon))
	{
		level.var_69acf721[level.var_69acf721.size] = weapon;
	}
}

/*
	Name: function_8389c033
	Namespace: zm_weapons
	Checksum: 0xFA33C150
	Offset: 0xD28
	Size: 0x134
	Parameters: 2
	Flags: Linked
*/
function function_8389c033(weapon_name, var_b72e8856)
{
	weapon = getweapon(weapon_name);
	var_6ae93843 = getweapon(var_b72e8856);
	if(isdefined(level.zombie_weapons[weapon]))
	{
		if(!isdefined(level.zombie_weapons[weapon].var_51344511))
		{
			level.zombie_weapons[weapon].var_51344511 = [];
		}
		else if(!isarray(level.zombie_weapons[weapon].var_51344511))
		{
			level.zombie_weapons[weapon].var_51344511 = array(level.zombie_weapons[weapon].var_51344511);
		}
		level.zombie_weapons[weapon].var_51344511[level.zombie_weapons[weapon].var_51344511.size] = var_6ae93843;
	}
}

/*
	Name: init
	Namespace: zm_weapons
	Checksum: 0x7FDFA978
	Offset: 0xE68
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(!isdefined(level.pack_a_punch_camo_index))
	{
		level.pack_a_punch_camo_index = 42;
	}
	level.primary_weapon_array = [];
	level.side_arm_array = [];
	level.grenade_array = [];
	level.inventory_array = [];
	init_weapons();
	level._zombiemode_check_firesale_loc_valid_func = &default_check_firesale_loc_valid_func;
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: zm_weapons
	Checksum: 0xAB139039
	Offset: 0xF10
	Size: 0x56
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self thread watchforgrenadeduds();
	self thread watchforgrenadelauncherduds();
	self.staticweaponsstarttime = gettime();
	if(!isdefined(self.var_f6d3c3))
	{
		self.var_f6d3c3 = [];
	}
}

/*
	Name: function_cf3f5b23
	Namespace: zm_weapons
	Checksum: 0x7DBA041F
	Offset: 0xF70
	Size: 0x380
	Parameters: 0
	Flags: Linked
*/
function function_cf3f5b23()
{
	level.var_ec04a8a4 = [];
	level.var_c1f1b29a = [];
	itemspawnlist = getscriptbundle(#"hash_780dda97a2051ca9");
	foreach(item in itemspawnlist.itemlist)
	{
		point = getscriptbundle(item.var_a6762160);
		if(isdefined(point.weapon))
		{
			parentweapon = point.weapon.name;
			if(isdefined(parentweapon) && (isdefined(item.var_3f8c08e3) && (isdefined(item.var_8261a18) && (isdefined(item.var_7b0c7fe3) && isdefined(item.var_23a1d10f)))))
			{
				level.var_ec04a8a4[parentweapon] = [#"orange":item.var_168e36e8, #"purple":item.var_23a1d10f, #"blue":item.var_7b0c7fe3, #"green":item.var_8261a18, #"white":item.var_3f8c08e3];
			}
		}
	}
	var_24435603 = getscriptbundle(#"hash_2f434070b1066fb2");
	foreach(item in var_24435603.itemlist)
	{
		point = getscriptbundle(item.var_a6762160);
		if(isdefined(point.weapon))
		{
			parentweapon = point.weapon.name;
			if(isdefined(parentweapon) && (isdefined(item.var_3f8c08e3) && (isdefined(item.var_8261a18) && (isdefined(item.var_7b0c7fe3) && isdefined(item.var_23a1d10f)))))
			{
				level.var_c1f1b29a[parentweapon] = [#"orange":item.var_168e36e8, #"purple":item.var_23a1d10f, #"blue":item.var_7b0c7fe3, #"green":item.var_8261a18, #"white":item.var_3f8c08e3];
			}
		}
	}
}

/*
	Name: function_8fdfe5e4
	Namespace: zm_weapons
	Checksum: 0x51874DF2
	Offset: 0x12F8
	Size: 0xC94
	Parameters: 7
	Flags: Linked
*/
function function_8fdfe5e4(weapon, item, var_d97184db, rarity, clipsize, var_9839b3b1, var_7fa2b50b)
{
	if(!isdefined(rarity))
	{
		rarity = #"white";
	}
	self endoncallback(&function_898c65a1, #"death");
	if(isstring(var_d97184db) || ishash(var_d97184db))
	{
		var_927c0921 = var_d97184db;
		if(weapon.weapclass === "pistol" && !is_true(weapon.isdualwield))
		{
			if(math::cointoss(15))
			{
				var_d97184db = function_c69910e2(weapon.name, rarity);
				if(!isdefined(var_d97184db))
				{
					var_d97184db = var_927c0921;
				}
			}
		}
		point = function_4ba8fde(var_d97184db);
	}
	self val::set(#"hash_55af237178580523", "disable_weapons");
	waitframe(1);
	if(isdefined(point))
	{
		if(isdefined(item.var_a8bccf69))
		{
			var_a8bccf69 = item.var_a8bccf69;
		}
		if(isdefined(item.aat))
		{
			aat_name = item.aat;
		}
		weaponoptions = item.weaponoptions;
		var_908f65ca = item.var_908f65ca;
		var_f879230e = self function_8cbd254d(weapon);
		var_c5bee8b6 = self function_ade49959(weapon);
		var_51fbc989 = getcamoindex(var_c5bee8b6);
		if(isdefined(point.var_a6762160.var_a53e9db0))
		{
			new_weapon = namespace_65181344::function_67456242(point.var_a6762160);
			if(!isdefined(new_weapon))
			{
				self val::reset(#"hash_55af237178580523", "disable_weapons");
				return;
			}
			if(isdefined(var_a8bccf69) && isdefined(level.var_c1f1b29a))
			{
				rootweapon = weapon.rootweapon;
				var_8114384d = level.var_c1f1b29a[rootweapon.name][rarity];
				if(!isdefined(var_8114384d))
				{
					self val::reset(#"hash_55af237178580523", "disable_weapons");
					return;
				}
				var_27dbfbd7 = function_4ba8fde(var_8114384d);
				if(!isdefined(var_27dbfbd7))
				{
					self val::reset(#"hash_55af237178580523", "disable_weapons");
					return;
				}
				var_f70c2a55 = item_drop::drop_item(0, var_27dbfbd7.var_a6762160.weapon, 1, var_27dbfbd7.var_a6762160.weapon.maxammo, var_27dbfbd7.id, self.origin, self.angles, 1);
				var_f70c2a55.hidetime = 1;
				var_f70c2a55 hide();
				var_f70c2a55.var_864ea466 = 1;
				drop_item = item_drop::drop_item(0, new_weapon, 1, new_weapon.maxammo, point.id, self.origin, self.angles, 1);
				drop_item.hidetime = 1;
				drop_item hide();
				drop_item.var_864ea466 = 1;
				if(isdefined(clipsize) && isdefined(var_9839b3b1))
				{
					var_f70c2a55.amount = clipsize;
					var_f70c2a55.stockammo = var_9839b3b1;
					if(isdefined(var_7fa2b50b))
					{
						var_f70c2a55.var_bce3d77a = var_7fa2b50b;
					}
				}
				if(isentity(var_f70c2a55) && isentity(drop_item) && isdefined(drop_item.var_627c698b.attachments) && !isdefined(var_f70c2a55.attachments))
				{
					attachments = drop_item.var_627c698b.attachments;
					foreach(attachment in attachments)
					{
						var_41ade915 = item_world_util::function_6a0ee21a(attachment);
						if(ishash(var_41ade915) || isstring(var_41ade915))
						{
							attachmentitem = function_4ba8fde(var_41ade915);
							if(isdefined(attachmentitem))
							{
								namespace_a0d533d1::function_8b7b98f(var_f70c2a55, attachmentitem);
							}
						}
					}
				}
				item_world::consume_item(drop_item);
				var_f70c2a55.hidetime = 0;
				dropweapon = self item_inventory::get_current_weapon();
				var_5c695210 = function_9f1cc9a9(dropweapon);
				var_9f4fdf9c = item_world_util::function_f4a8d375(var_f70c2a55.id);
				self function_7df0d6b2(var_f70c2a55, var_9f4fdf9c, weaponoptions, undefined, var_908f65ca);
				var_bd31d7b2 = item_inventory::function_ec087745();
				dropweapon = self item_inventory::function_b76f46a0(var_f70c2a55, var_bd31d7b2, 1);
				currentweapon = self item_inventory::function_6f73f57d(var_9f4fdf9c.rootweapon.name, var_5c695210);
				var_ec0c35ac = item_inventory::function_230ceec4(currentweapon);
				if(isdefined(var_f879230e) && var_f879230e > 0)
				{
					if(isweapon(currentweapon))
					{
						self function_40d6838f(currentweapon, 0);
					}
					if(isdefined(var_a8bccf69) && isweapon(currentweapon))
					{
						self item_inventory::function_d92c6b5b(currentweapon, undefined, var_a8bccf69);
					}
				}
				else
				{
					if(isdefined(var_51fbc989) && isweapon(currentweapon))
					{
						self setcamo(currentweapon, var_51fbc989);
					}
					else if(isdefined(var_a8bccf69) && isweapon(currentweapon))
					{
						self item_inventory::function_d92c6b5b(currentweapon, undefined, var_a8bccf69);
					}
				}
				if(isdefined(var_ec0c35ac))
				{
					if(isdefined(var_a8bccf69))
					{
						var_ec0c35ac.var_a8bccf69 = var_a8bccf69;
					}
					if(isdefined(aat_name))
					{
						function_37e9e0cb(var_ec0c35ac, var_ec0c35ac.var_a6762160.weapon, aat_name, 0);
					}
				}
			}
			else
			{
				drop_item = item_drop::drop_item(0, new_weapon, 1, new_weapon.maxammo, point.id, self.origin, self.angles, 1);
				drop_item.hidetime = 1;
				drop_item hide();
				drop_item.var_864ea466 = 1;
				drop_item.var_99628f67 = 1;
				if(isdefined(clipsize) && isdefined(var_9839b3b1))
				{
					drop_item.amount = clipsize;
					drop_item.stockammo = var_9839b3b1;
					if(isdefined(var_7fa2b50b))
					{
						drop_item.var_bce3d77a = var_7fa2b50b;
					}
				}
				if(isentity(drop_item) && isdefined(drop_item.var_627c698b.attachments) && !isdefined(drop_item.attachments))
				{
					attachments = drop_item.var_627c698b.attachments;
					foreach(attachment in attachments)
					{
						var_41ade915 = item_world_util::function_6a0ee21a(attachment);
						if(ishash(var_41ade915) || isstring(var_41ade915))
						{
							attachmentitem = function_4ba8fde(var_41ade915);
							if(isdefined(attachmentitem))
							{
								namespace_a0d533d1::function_8b7b98f(drop_item, attachmentitem);
							}
						}
					}
				}
				drop_item.hidetime = 0;
				dropweapon = self item_inventory::get_current_weapon();
				var_5c695210 = function_9f1cc9a9(dropweapon);
				var_9f4fdf9c = item_world_util::function_f4a8d375(drop_item.id);
				self function_7df0d6b2(drop_item, var_9f4fdf9c, weaponoptions, undefined, var_908f65ca);
				var_bd31d7b2 = item_inventory::function_ec087745();
				dropweapon = self item_inventory::function_b76f46a0(drop_item, var_bd31d7b2, 1);
				currentweapon = self item_inventory::function_6f73f57d(var_9f4fdf9c.rootweapon.name, var_5c695210);
				var_ec0c35ac = item_inventory::function_230ceec4(currentweapon);
				if(isdefined(var_f879230e) && var_f879230e > 0)
				{
					self function_40d6838f(currentweapon, 0);
				}
				if(isdefined(aat_name) && isdefined(var_ec0c35ac))
				{
					function_37e9e0cb(var_ec0c35ac, var_ec0c35ac.var_a6762160.weapon, aat_name, 0);
				}
			}
		}
		self val::reset(#"hash_55af237178580523", "disable_weapons");
		self notify(#"hash_5cd57762f792396b");
	}
	else
	{
		self val::reset(#"hash_55af237178580523", "disable_weapons");
	}
}

/*
	Name: function_d4f870ec
	Namespace: zm_weapons
	Checksum: 0x3EB24ED2
	Offset: 0x1F98
	Size: 0x11E
	Parameters: 1
	Flags: Linked
*/
function function_d4f870ec(var_9ca7fef3)
{
	switch(var_9ca7fef3)
	{
		case "resource":
		case "loadout":
		{
			rarity = #"white";
			break;
		}
		case "uncommon":
		{
			rarity = #"green";
			break;
		}
		case "rare":
		{
			rarity = #"blue";
			break;
		}
		case "epic":
		{
			rarity = #"purple";
			break;
		}
		case "legendary":
		{
			rarity = #"orange";
			break;
		}
		default:
		{
			rarity = var_9ca7fef3;
			break;
		}
	}
	return rarity;
}

/*
	Name: function_17e9ed37
	Namespace: zm_weapons
	Checksum: 0x62DB984A
	Offset: 0x20C0
	Size: 0x7B4
	Parameters: 5
	Flags: Linked
*/
function function_17e9ed37(rarity, clipsize, var_9839b3b1, var_7fa2b50b, var_7b1ab4e4)
{
	if(!isdefined(rarity))
	{
		rarity = #"white";
	}
	if(!isdefined(var_7b1ab4e4))
	{
		var_7b1ab4e4 = 0;
	}
	self endoncallback(&function_898c65a1, #"death");
	weapon = self getcurrentweapon();
	rarity = function_d4f870ec(rarity);
	self val::set(#"hash_55af237178580523", "disable_weapons");
	waitframe(1);
	if(isdefined(weapon) && isdefined(weapon.rootweapon))
	{
		item = self item_inventory::function_230ceec4(weapon);
		weaponoptions = self function_ade49959(weapon);
		var_51fbc989 = getcamoindex(weaponoptions);
		if(isdefined(item))
		{
			if(is_true(item.var_b3546c09) && rarity === #"orange")
			{
				self zm_stats::increment_challenge_stat(#"hash_4568ec6d243eafa1");
			}
			if(isdefined(item.var_a8bccf69))
			{
				var_a8bccf69 = item.var_a8bccf69;
			}
			if(isdefined(item.aat))
			{
				aat_name = item.aat;
			}
			if(is_true(item.var_b3546c09) || item.var_a6762160.rarity === #"loadout")
			{
				var_beeb02d3 = 1;
			}
			rootweapon = weapon.rootweapon;
			if(isdefined(level.var_c1f1b29a[rootweapon.name]) && isdefined(level.var_c1f1b29a[rootweapon.name][rarity]) || (isdefined(level.var_ec04a8a4[rootweapon.name]) && isdefined(level.var_ec04a8a4[rootweapon.name][rarity])))
			{
				if(isdefined(var_a8bccf69))
				{
					var_8114384d = level.var_c1f1b29a[rootweapon.name][rarity];
				}
				else
				{
					var_8114384d = level.var_ec04a8a4[rootweapon.name][rarity];
				}
				if(!isdefined(var_8114384d))
				{
					self val::reset(#"hash_55af237178580523", "disable_weapons");
					return;
				}
				point = function_4ba8fde(var_8114384d);
				if(!isdefined(point))
				{
					self val::reset(#"hash_55af237178580523", "disable_weapons");
					return;
				}
				var_bd31d7b2 = item_inventory::function_ec087745();
				point.hidetime = 0;
				dropweapon = self item_inventory::get_current_weapon();
				var_5c695210 = function_9f1cc9a9(dropweapon);
				if(isdefined(clipsize) && isdefined(var_9839b3b1))
				{
					point.amount = clipsize;
					point.stockammo = var_9839b3b1;
					if(isdefined(var_7fa2b50b))
					{
						point.var_bce3d77a = var_7fa2b50b;
					}
				}
				point.var_99628f67 = 1;
				if(is_true(var_beeb02d3))
				{
					point.var_b3546c09 = 1;
					weaponoptions = item.weaponoptions;
					var_e91aba42 = item.var_e91aba42;
					var_908f65ca = item.var_908f65ca;
					self function_7df0d6b2(point, weapon, weaponoptions, var_e91aba42, var_908f65ca);
				}
				dropweapon = item_inventory::function_9d102bbd(point, var_bd31d7b2, 1);
				currentweapon = self item_inventory::function_6f73f57d(point.var_627c698b.rootweapon.name, var_5c695210);
				if(isdefined(var_51fbc989) && isdefined(currentweapon) && isplayer(self))
				{
					self setcamo(currentweapon, var_51fbc989);
				}
				var_ec0c35ac = item_inventory::function_230ceec4(currentweapon);
				if(isdefined(var_ec0c35ac))
				{
					if(isdefined(var_a8bccf69))
					{
						var_ec0c35ac.var_a8bccf69 = var_a8bccf69;
					}
					if(isdefined(aat_name))
					{
						function_37e9e0cb(var_ec0c35ac, var_ec0c35ac.var_a6762160.weapon, aat_name, 0);
					}
					if(is_true(var_beeb02d3))
					{
						var_ec0c35ac.var_b3546c09 = 1;
					}
				}
				if(!is_true(var_7b1ab4e4))
				{
					switch(rarity)
					{
						case "white":
						{
							break;
						}
						case "green":
						{
							var_ee3c60e = #"hash_393b11eaff09fb94";
							break;
						}
						case "blue":
						{
							var_ee3c60e = #"hash_77e066ee890f14fe";
							break;
						}
						case "purple":
						{
							var_ee3c60e = #"hash_1973a95f411b3bdf";
							break;
						}
						case "orange":
						{
							var_ee3c60e = #"hash_5a8770083150213";
							break;
						}
						default:
						{
							/#
								assert(0, "");
							#/
							/#
							#/
							break;
						}
					}
					if(isdefined(var_ee3c60e))
					{
						level thread popups::displayteammessagetoteam(var_ee3c60e, self, self.team, currentweapon.displayname);
					}
				}
				self notify(#"hash_3713641b67661d30");
			}
		}
		self val::reset(#"hash_55af237178580523", "disable_weapons");
	}
	else
	{
		self val::reset(#"hash_55af237178580523", "disable_weapons");
	}
}

/*
	Name: function_30b08f95
	Namespace: zm_weapons
	Checksum: 0x2689D826
	Offset: 0x2880
	Size: 0x308
	Parameters: 0
	Flags: Linked
*/
function function_30b08f95()
{
	level.var_29d88fe5 = [];
	var_a559259f = [];
	itemspawnlist = getscriptbundle(#"hash_227d7aa66443a855");
	var_70f9bc79 = getscriptbundle(#"hash_101413c989c053b9");
	foreach(item in var_70f9bc79.itemlist)
	{
		point = getscriptbundle(item.var_a6762160);
		if(isdefined(point.weapon))
		{
			parentweapon = point.weapon.name;
			if(isdefined(parentweapon) && isdefined(item.var_3f8c08e3))
			{
				var_a559259f[parentweapon] = item.var_3f8c08e3;
			}
		}
	}
	foreach(item in itemspawnlist.itemlist)
	{
		point = getscriptbundle(item.var_a6762160);
		if(isdefined(point.weapon))
		{
			parentweapon = point.weapon.name;
			if(isdefined(parentweapon) && (isdefined(var_a559259f[parentweapon]) && (isdefined(item.var_3f8c08e3) && (isdefined(item.var_8261a18) && (isdefined(item.var_7b0c7fe3) && (isdefined(item.var_23a1d10f) && isdefined(item.var_168e36e8)))))))
			{
				level.var_29d88fe5[parentweapon] = [#"gold":item.var_168e36e8, #"orange":item.var_23a1d10f, #"purple":item.var_7b0c7fe3, #"blue":item.var_8261a18, #"green":item.var_3f8c08e3, #"white":var_a559259f[parentweapon]];
			}
		}
	}
}

/*
	Name: function_898c65a1
	Namespace: zm_weapons
	Checksum: 0x6884395A
	Offset: 0x2B90
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_898c65a1(params)
{
	self val::reset(#"hash_55af237178580523", "disable_weapons");
}

/*
	Name: function_ec38915a
	Namespace: zm_weapons
	Checksum: 0x87BA9E1F
	Offset: 0x2BD0
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function function_ec38915a()
{
	if(!isdefined(level.var_5a069e6))
	{
		level.var_5a069e6 = [];
	}
	if(!isdefined(level.var_44e0d625))
	{
		level.var_44e0d625 = [];
	}
	function_8005e7f3(getweapon(#"smg_handling_t8"), getweapon(#"smg_handling_t8_dw"));
	function_8005e7f3(getweapon(#"smg_handling_t8_upgraded"), getweapon(#"smg_handling_t8_upgraded_dw"));
	function_8005e7f3(getweapon(#"special_ballisticknife_t8_dw"), getweapon(#"special_ballisticknife_t8_dw_dw"));
	function_8005e7f3(getweapon(#"special_ballisticknife_t8_dw_upgraded"), getweapon(#"special_ballisticknife_t8_dw_upgraded_dw"));
}

/*
	Name: function_8005e7f3
	Namespace: zm_weapons
	Checksum: 0x6AEFC313
	Offset: 0x2D58
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_8005e7f3(w_base, var_ebc2aad)
{
	if(w_base != level.weaponnone && var_ebc2aad != level.weaponnone)
	{
		level.var_5a069e6[w_base] = var_ebc2aad;
		level.var_44e0d625[var_ebc2aad] = w_base;
	}
}

/*
	Name: player_gunchallengecomplete
	Namespace: zm_weapons
	Checksum: 0xE0C60DE
	Offset: 0x2DC0
	Size: 0x1D4
	Parameters: 1
	Flags: Event
*/
event player_gunchallengecomplete(s_event)
{
	if(s_event.is_lastrank)
	{
		var_8e617ca1 = 0;
		a_w_guns = get_guns();
		foreach(weapon in a_w_guns)
		{
			str_weapon = weapon.name;
			n_item_index = getbaseweaponitemindex(weapon);
			var_cc074f5b = stats::get_stat(#"hash_60e21f66eb3a1f18", str_weapon, #"xp");
			if(isdefined(var_cc074f5b))
			{
				var_6b792d1d = function_33cc663e(str_weapon);
				var_56ccc9fe = stats::get_stat(#"hash_60e21f66eb3a1f18", str_weapon, #"plevel");
				if(isdefined(var_6b792d1d) && isdefined(var_56ccc9fe))
				{
					if(var_cc074f5b >= var_6b792d1d || var_56ccc9fe >= 1)
					{
						var_8e617ca1++;
					}
				}
			}
		}
		if(var_8e617ca1 >= 25)
		{
			zm_utility::give_achievement(#"zm_trophy_gold");
		}
	}
}

/*
	Name: get_guns
	Namespace: zm_weapons
	Checksum: 0xB2E949E1
	Offset: 0x2FA0
	Size: 0x15A
	Parameters: 0
	Flags: Linked
*/
function get_guns()
{
	a_w_guns = [];
	foreach(s_weapon in level.zombie_weapons)
	{
		switch(s_weapon.weapon_classname)
		{
			case 0:
			case "equipment":
			case "shield":
			case "melee":
			{
				continue;
			}
		}
		if(is_wonder_weapon(s_weapon.weapon))
		{
			continue;
		}
		if(!isdefined(a_w_guns))
		{
			a_w_guns = [];
		}
		else if(!isarray(a_w_guns))
		{
			a_w_guns = array(a_w_guns);
		}
		a_w_guns[a_w_guns.size] = s_weapon.weapon;
	}
	return a_w_guns;
}

/*
	Name: function_14590040
	Namespace: zm_weapons
	Checksum: 0x8BD16E1D
	Offset: 0x3108
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function function_14590040(str_weapon)
{
	var_9bea1b6 = [];
	for(i = 0; i < 16; i++)
	{
		var_4a3def14 = tablelookup(#"gamedata/weapons/zm/zm_gunlevels.csv", 2, str_weapon, 0, i, 1);
		if("" == var_4a3def14)
		{
			break;
		}
		var_9bea1b6[i] = int(var_4a3def14);
	}
	return var_9bea1b6;
}

/*
	Name: function_33cc663e
	Namespace: zm_weapons
	Checksum: 0xBC2AD5D6
	Offset: 0x31C0
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_33cc663e(str_weapon)
{
	var_9bea1b6 = function_14590040(str_weapon);
	return var_9bea1b6[var_9bea1b6.size - 1];
}

/*
	Name: watchforgrenadeduds
	Namespace: zm_weapons
	Checksum: 0x9C3CA008
	Offset: 0x3208
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function watchforgrenadeduds()
{
	self endon(#"death", #"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"grenade_fire");
		grenade = waitresult.projectile;
		weapon = waitresult.weapon;
		if(!zm_equipment::is_equipment(weapon) && !zm_loadout::is_placeable_mine(weapon))
		{
			grenade thread checkgrenadefordud(weapon, 1, self);
		}
	}
}

/*
	Name: watchforgrenadelauncherduds
	Namespace: zm_weapons
	Checksum: 0xC484148C
	Offset: 0x32E0
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function watchforgrenadelauncherduds()
{
	self endon(#"death", #"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"grenade_launcher_fire");
		grenade = waitresult.projectile;
		weapon = waitresult.weapon;
		grenade thread checkgrenadefordud(weapon, 0, self);
	}
}

/*
	Name: grenade_safe_to_throw
	Namespace: zm_weapons
	Checksum: 0x907A3EF3
	Offset: 0x3388
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function grenade_safe_to_throw(player, weapon)
{
	if(isdefined(level.grenade_safe_to_throw))
	{
		return self [[level.grenade_safe_to_throw]](player, weapon);
	}
	return 1;
}

/*
	Name: grenade_safe_to_bounce
	Namespace: zm_weapons
	Checksum: 0xA5631409
	Offset: 0x33D0
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function grenade_safe_to_bounce(player, weapon)
{
	if(isdefined(level.grenade_safe_to_bounce))
	{
		return self [[level.grenade_safe_to_bounce]](player, weapon);
	}
	return 1;
}

/*
	Name: makegrenadedudanddestroy
	Namespace: zm_weapons
	Checksum: 0x56BD006F
	Offset: 0x3418
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function makegrenadedudanddestroy()
{
	self endon(#"death");
	self notify(#"grenade_dud");
	self makegrenadedud();
	wait(3);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: checkgrenadefordud
	Namespace: zm_weapons
	Checksum: 0xC708404
	Offset: 0x3488
	Size: 0x102
	Parameters: 3
	Flags: Linked
*/
function checkgrenadefordud(weapon, isthrowngrenade, player)
{
	self endon(#"death");
	player endon(#"zombify");
	if(!isdefined(self))
	{
		return;
	}
	if(!self grenade_safe_to_throw(player, isthrowngrenade))
	{
		self thread makegrenadedudanddestroy();
		return;
	}
	for(;;)
	{
		self waittilltimeout(0.25, #"grenade_bounce", #"stationary", #"death", #"zombify");
		if(!self grenade_safe_to_bounce(player, isthrowngrenade))
		{
			self thread makegrenadedudanddestroy();
			return;
		}
	}
}

/*
	Name: get_nonalternate_weapon
	Namespace: zm_weapons
	Checksum: 0x8D48211A
	Offset: 0x3598
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function get_nonalternate_weapon(weapon)
{
	if(is_true(weapon.isaltmode))
	{
		return weapon.altweapon;
	}
	return weapon;
}

/*
	Name: function_af29d744
	Namespace: zm_weapons
	Checksum: 0x26B3ED66
	Offset: 0x35D8
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_af29d744(weapon)
{
	if(isdefined(weapon))
	{
		if(weapon.isaltmode)
		{
			weapon = weapon.altweapon;
		}
		weapon = function_386dacbc(weapon);
	}
	return weapon;
}

/*
	Name: function_93cd8e76
	Namespace: zm_weapons
	Checksum: 0x28FB5A54
	Offset: 0x3630
	Size: 0x92
	Parameters: 2
	Flags: Linked
*/
function function_93cd8e76(weapon, var_1011fc73)
{
	if(!isdefined(var_1011fc73))
	{
		var_1011fc73 = 0;
	}
	if(weapon.inventorytype === "dwlefthand")
	{
		weapon = weapon.dualwieldweapon;
	}
	weapon = function_af29d744(weapon);
	if(var_1011fc73 && isdefined(level.zombie_weapons_upgraded[weapon]))
	{
		return level.zombie_weapons_upgraded[weapon];
	}
	return weapon;
}

/*
	Name: switch_from_alt_weapon
	Namespace: zm_weapons
	Checksum: 0x3BC9548
	Offset: 0x36D0
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function switch_from_alt_weapon(weapon)
{
	if(weapon.ischargeshot)
	{
		return weapon;
	}
	alt = get_nonalternate_weapon(weapon);
	if(alt != weapon)
	{
		if(!weaponhasattachment(weapon, "dualoptic"))
		{
			self switchtoweaponimmediate(alt);
			self waittilltimeout(1, #"weapon_change_complete");
		}
		return alt;
	}
	return weapon;
}

/*
	Name: give_start_weapons
	Namespace: zm_weapons
	Checksum: 0xAD689A2D
	Offset: 0x3778
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function give_start_weapons(takeallweapons, alreadyspawned)
{
	self zm_loadout::init_player_offhand_weapons();
	self zm_loadout::give_start_weapon(1);
}

/*
	Name: give_fallback_weapon
	Namespace: zm_weapons
	Checksum: 0xFF56E9D5
	Offset: 0x37C8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function give_fallback_weapon(immediate)
{
	if(!isdefined(immediate))
	{
		immediate = 0;
	}
	zm_melee_weapon::give_fallback_weapon(immediate);
}

/*
	Name: take_fallback_weapon
	Namespace: zm_weapons
	Checksum: 0xDBEAFCC2
	Offset: 0x3800
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function take_fallback_weapon()
{
	zm_melee_weapon::take_fallback_weapon();
}

/*
	Name: switch_back_primary_weapon
	Namespace: zm_weapons
	Checksum: 0x65C87704
	Offset: 0x3820
	Size: 0x244
	Parameters: 3
	Flags: Linked
*/
function switch_back_primary_weapon(oldprimary, immediate, var_6d4494f9)
{
	if(!isdefined(immediate))
	{
		immediate = 0;
	}
	if(!isdefined(var_6d4494f9))
	{
		var_6d4494f9 = 0;
	}
	if(is_true(self.laststand))
	{
		return;
	}
	if(!isdefined(oldprimary) || oldprimary == level.weaponnone || oldprimary.isflourishweapon || zm_loadout::is_melee_weapon(oldprimary) || zm_loadout::is_placeable_mine(oldprimary) || zm_loadout::is_lethal_grenade(oldprimary) || zm_loadout::is_tactical_grenade(oldprimary, !var_6d4494f9) || !self hasweapon(oldprimary))
	{
		oldprimary = undefined;
	}
	else if(oldprimary.isheroweapon || oldprimary.isgadget && (!isdefined(self.hero_power) || self.hero_power <= 0))
	{
		oldprimary = undefined;
	}
	primaryweapons = self getweaponslistprimaries();
	if(isdefined(oldprimary) && (isinarray(primaryweapons, oldprimary) || (oldprimary.isriotshield && var_6d4494f9)))
	{
		if(immediate)
		{
			self switchtoweaponimmediate(oldprimary);
		}
		else
		{
			self switchtoweapon(oldprimary);
		}
	}
	else
	{
		if(primaryweapons.size > 0)
		{
			if(immediate)
			{
				self switchtoweaponimmediate();
			}
			else
			{
				self switchtoweapon();
			}
		}
		else
		{
			give_fallback_weapon(immediate);
		}
	}
}

/*
	Name: updatelastheldweapontimingszm
	Namespace: zm_weapons
	Checksum: 0xD6A1F943
	Offset: 0x3A70
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function updatelastheldweapontimingszm(newtime)
{
	if(isdefined(self.currentweapon) && isdefined(self.currenttime))
	{
		curweapon = self.currentweapon;
		totaltime = int((newtime - self.currenttime) / 1000);
		if(totaltime > 0)
		{
			self stats::function_e24eec31(curweapon, #"timeused", totaltime);
		}
	}
}

/*
	Name: updateweapontimingszm
	Namespace: zm_weapons
	Checksum: 0xF521AFCD
	Offset: 0x3B18
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function updateweapontimingszm(newtime)
{
	if(isbot(self))
	{
		return;
	}
	updatelastheldweapontimingszm(newtime);
	if(!isdefined(self.staticweaponsstarttime))
	{
		return;
	}
	totaltime = int((newtime - self.staticweaponsstarttime) / 1000);
	if(totaltime < 0)
	{
		return;
	}
	self.staticweaponsstarttime = newtime;
}

/*
	Name: default_check_firesale_loc_valid_func
	Namespace: zm_weapons
	Checksum: 0x8239C8AE
	Offset: 0x3BB0
	Size: 0x8
	Parameters: 0
	Flags: Linked
*/
function default_check_firesale_loc_valid_func()
{
	return true;
}

/*
	Name: add_zombie_weapon
	Namespace: zm_weapons
	Checksum: 0x3FC5531A
	Offset: 0x3BC0
	Size: 0x39C
	Parameters: 13
	Flags: Linked
*/
function add_zombie_weapon(weapon_name, upgrade_name, is_ee, cost, weaponvo, weaponvoresp, ammo_cost, create_vox, weapon_class, is_wonder_weapon, tier, in_box, element)
{
	if(!isdefined(tier))
	{
		tier = 0;
	}
	weapon = getweapon(weapon_name);
	upgrade = undefined;
	if(isdefined(upgrade_name))
	{
		upgrade = getweapon(upgrade_name);
	}
	if(isdefined(level.zombie_include_weapons) && !isdefined(level.zombie_include_weapons[weapon]))
	{
		return;
	}
	struct = spawnstruct();
	if(!isdefined(level.zombie_weapons))
	{
		level.zombie_weapons = [];
	}
	if(!isdefined(level.zombie_weapons_upgraded))
	{
		level.zombie_weapons_upgraded = [];
	}
	if(isdefined(upgrade_name))
	{
		level.zombie_weapons_upgraded[upgrade] = weapon;
	}
	struct.weapon = weapon;
	struct.upgrade = upgrade;
	struct.weapon_classname = weapon_class;
	struct.hint = #"hash_60606b68e93a29c8";
	struct.cost = cost;
	struct.vox = weaponvo;
	struct.vox_response = weaponvoresp;
	struct.is_wonder_weapon = is_wonder_weapon;
	struct.tier = tier;
	struct.var_9d17fab9 = weapon_name + "_item_sr";
	struct.element = (element != #"" ? element : undefined);
	if(is_true(is_wonder_weapon))
	{
		struct.var_51344511 = [];
	}
	/#
		println("" + function_9e72a96(weapon_name));
	#/
	struct.is_in_box = level.zombie_include_weapons[weapon];
	if(!isdefined(ammo_cost) || ammo_cost == 0)
	{
		ammo_cost = zm_utility::round_up_to_ten(int(cost * 0.5));
	}
	struct.ammo_cost = ammo_cost;
	if(weapon.isemp || (isdefined(upgrade) && upgrade.isemp))
	{
		level.should_watch_for_emp = 1;
	}
	level.zombie_weapons[weapon] = struct;
	/#
		if(isdefined(level.devgui_add_weapon) && (!is_ee || getdvarint(#"zm_debug_ee", 0)))
		{
			level thread [[level.devgui_add_weapon]](weapon, upgrade, in_box, cost, weaponvo, weaponvoresp, ammo_cost);
		}
	#/
}

/*
	Name: is_weapon_included
	Namespace: zm_weapons
	Checksum: 0x91B326DB
	Offset: 0x3F68
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function is_weapon_included(weapon)
{
	if(!isdefined(level.zombie_weapons))
	{
		return 0;
	}
	weapon = get_nonalternate_weapon(weapon);
	return isdefined(level.zombie_weapons[function_386dacbc(weapon)]);
}

/*
	Name: is_weapon_or_base_included
	Namespace: zm_weapons
	Checksum: 0xB8900447
	Offset: 0x3FC8
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function is_weapon_or_base_included(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	return isdefined(level.zombie_weapons[function_386dacbc(weapon)]) || isdefined(level.zombie_weapons[get_base_weapon(weapon)]);
}

/*
	Name: include_zombie_weapon
	Namespace: zm_weapons
	Checksum: 0x57EF72D4
	Offset: 0x4038
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function include_zombie_weapon(weapon_name, in_box)
{
	if(!isdefined(level.zombie_include_weapons))
	{
		level.zombie_include_weapons = [];
	}
	if(!isdefined(in_box))
	{
		in_box = 1;
	}
	/#
		println("" + function_9e72a96(weapon_name));
	#/
	level.zombie_include_weapons[getweapon(weapon_name)] = in_box;
}

/*
	Name: init_weapons
	Namespace: zm_weapons
	Checksum: 0x443D4AAF
	Offset: 0x40D8
	Size: 0x10E
	Parameters: 0
	Flags: Linked
*/
function init_weapons()
{
	level.var_c60359dc = [];
	var_8e01336 = getdvarint(#"hash_4fdf506c770b343", 0);
	switch(var_8e01336)
	{
		default:
		{
			var_4ef031c9 = #"hash_2298893b58cc2885";
		}
	}
	load_weapon_spec_from_table(var_4ef031c9, 0);
	if(isdefined(level.var_d0ab70a2))
	{
		load_weapon_spec_from_table(level.var_d0ab70a2, 0);
	}
	level thread function_350ee41();
	level flag::set("zm_weapons_table_loaded");
	level.var_c60359dc = undefined;
}

/*
	Name: function_a2ce802c
	Namespace: zm_weapons
	Checksum: 0x99DB06BD
	Offset: 0x41F0
	Size: 0x1A0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a2ce802c(list)
{
	weapons_array = [];
	if(isdefined(level.var_ee110db8[list]))
	{
		list = level.var_ee110db8[list];
	}
	s_bundle = getscriptbundle(list);
	foreach(s_item in s_bundle.itemlist)
	{
		var_a6762160 = s_item.var_a6762160;
		if(isdefined(level.var_ee110db8[var_a6762160]))
		{
			var_a6762160 = level.var_ee110db8[var_a6762160];
		}
		else if(isdefined(level.itemreplacement[var_a6762160]))
		{
			var_a6762160 = level.itemreplacement[var_a6762160];
		}
		if(!isdefined(weapons_array))
		{
			weapons_array = [];
		}
		else if(!isarray(weapons_array))
		{
			weapons_array = array(weapons_array);
		}
		weapons_array[weapons_array.size] = var_a6762160;
	}
	level.var_4da246c[list] = arraycopy(weapons_array);
}

/*
	Name: function_350ee41
	Namespace: zm_weapons
	Checksum: 0x611C95B6
	Offset: 0x4398
	Size: 0x6C4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_350ee41()
{
	if(!isdefined(level.var_4da246c))
	{
		level.var_4da246c = [];
	}
	if(!isdefined(level.var_cc8ad9fe))
	{
		level.var_cc8ad9fe = #"hash_444f03aab8a97358";
	}
	if(!isdefined(level.var_e2f02558))
	{
		level.var_e2f02558 = #"hash_3da59405b4e82a2a";
	}
	if(!isdefined(level.var_430d4cfe))
	{
		level.var_430d4cfe = #"hash_5425ac25b38ced30";
	}
	if(!isdefined(level.var_3d802d78))
	{
		level.var_3d802d78 = #"hash_7720ff6048221332";
	}
	if(!isdefined(level.var_5793d07d))
	{
		level.var_5793d07d = #"hash_8f938325e8fb821";
	}
	if(!isdefined(level.var_5396aa34))
	{
		level.var_5396aa34 = #"hash_652a4de27fd4aebd";
	}
	if(!isdefined(level.var_887d12df))
	{
		level.var_887d12df = #"hash_85021d9442e0ab2";
	}
	if(!isdefined(level.var_5cf89c5c))
	{
		level.var_5cf89c5c = #"hash_7c4c57ff1d66ce79";
	}
	if(!isdefined(level.var_95f4d593))
	{
		level.var_95f4d593 = #"hash_173d82ffca164bc8";
	}
	function_a2ce802c(level.var_e2f02558);
	function_a2ce802c(level.var_430d4cfe);
	function_a2ce802c(level.var_3d802d78);
	function_a2ce802c(level.var_5793d07d);
	function_a2ce802c(level.var_5396aa34);
	function_a2ce802c(level.var_887d12df);
	function_a2ce802c(level.var_5cf89c5c);
	function_a2ce802c(level.var_95f4d593);
	if(!isdefined(level.var_c0c63390))
	{
		level.var_c0c63390 = [];
	}
	s_bundle = getscriptbundle(level.var_cc8ad9fe);
	totalweight = 0;
	foreach(s_item in s_bundle.itemlist)
	{
		totalweight = totalweight + s_item.minweight;
		level.var_c0c63390[s_item.var_a6762160] = totalweight;
	}
	if(!isdefined(level.var_721c22fc))
	{
		level.var_721c22fc = "zm_magicbox_named_weapons_parent";
	}
	if(isdefined(level.var_ee110db8[#"zm_magicbox_named_weapons_parent"]))
	{
		level.var_721c22fc = level.var_ee110db8[#"zm_magicbox_named_weapons_parent"];
	}
	s_bundle = getscriptbundle(level.var_721c22fc);
	foreach(s_item in s_bundle.itemlist)
	{
		var_a6762160 = s_item.var_a6762160;
		if(isdefined(level.var_ee110db8[var_a6762160]))
		{
			var_a6762160 = level.var_ee110db8[var_a6762160];
		}
		else if(isdefined(level.itemreplacement[var_a6762160]))
		{
			var_a6762160 = level.itemreplacement[var_a6762160];
		}
		if(!isdefined(level.var_597e3b64))
		{
			level.var_597e3b64 = [];
		}
		else if(!isarray(level.var_597e3b64))
		{
			level.var_597e3b64 = array(level.var_597e3b64);
		}
		level.var_597e3b64[level.var_597e3b64.size] = var_a6762160;
	}
	if(!isdefined(level.var_f063e70))
	{
		level.var_f063e70 = "zm_magicbox_scorestreak_list";
	}
	if(isdefined(level.var_ee110db8[#"zm_magicbox_scorestreak_list"]))
	{
		level.var_f063e70 = level.var_ee110db8[#"zm_magicbox_scorestreak_list"];
	}
	s_bundle = getscriptbundle(level.var_f063e70);
	foreach(s_item in s_bundle.itemlist)
	{
		var_a6762160 = s_item.var_a6762160;
		if(isdefined(level.var_ee110db8[var_a6762160]))
		{
			var_a6762160 = level.var_ee110db8[var_a6762160];
		}
		else if(isdefined(level.itemreplacement[var_a6762160]))
		{
			var_a6762160 = level.itemreplacement[var_a6762160];
		}
		if(!isdefined(level.var_e5067476))
		{
			level.var_e5067476 = [];
		}
		else if(!isarray(level.var_e5067476))
		{
			level.var_e5067476 = array(level.var_e5067476);
		}
		level.var_e5067476[level.var_e5067476.size] = var_a6762160;
	}
}

/*
	Name: add_limited_weapon
	Namespace: zm_weapons
	Checksum: 0xF5932343
	Offset: 0x4A68
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function add_limited_weapon(weapon_name, amount)
{
	if(amount == 0)
	{
		return;
	}
	level.limited_weapons[getweapon(weapon_name)] = amount;
}

/*
	Name: limited_weapon_below_quota
	Namespace: zm_weapons
	Checksum: 0x5D3B592F
	Offset: 0x4AB8
	Size: 0x480
	Parameters: 2
	Flags: Linked
*/
function limited_weapon_below_quota(weapon, ignore_player)
{
	if(isdefined(level.limited_weapons[weapon]))
	{
		pap_machines = undefined;
		if(!isdefined(pap_machines))
		{
			pap_machines = getentarray("zm_pack_a_punch", "targetname");
		}
		if(is_true(level.no_limited_weapons))
		{
			return false;
		}
		upgradedweapon = weapon;
		if(isdefined(level.zombie_weapons[weapon]) && isdefined(level.zombie_weapons[weapon].upgrade))
		{
			upgradedweapon = level.zombie_weapons[weapon].upgrade;
		}
		players = getplayers();
		count = 0;
		limit = level.limited_weapons[weapon];
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(ignore_player) && ignore_player == players[i])
			{
				continue;
			}
			if(players[i] has_weapon_or_upgrade(weapon))
			{
				count++;
				if(count >= limit)
				{
					return false;
				}
			}
		}
		foreach(machine in pap_machines)
		{
			if(!isdefined(machine))
			{
				continue;
			}
			if(!isdefined(machine.unitrigger_stub))
			{
				continue;
			}
			if(isdefined(machine.unitrigger_stub.current_weapon) && (machine.unitrigger_stub.current_weapon == weapon || machine.unitrigger_stub.current_weapon == upgradedweapon))
			{
				count++;
				if(count >= limit)
				{
					return false;
				}
			}
		}
		foreach(chest in level.chests)
		{
			if(!isdefined(chest))
			{
				continue;
			}
			if(!isdefined(chest.zbarrier))
			{
				continue;
			}
			if(isdefined(chest.zbarrier.weapon) && chest.zbarrier.weapon == weapon)
			{
				count++;
				if(count >= limit)
				{
					return false;
				}
			}
		}
		if(isdefined(level.custom_limited_weapon_checks))
		{
			foreach(check in level.custom_limited_weapon_checks)
			{
				count = count + [[check]](weapon);
			}
			if(count >= limit)
			{
				return false;
			}
		}
		if(isdefined(level.random_weapon_powerups))
		{
			for(powerupindex = 0; powerupindex < level.random_weapon_powerups.size; powerupindex++)
			{
				if(isdefined(level.random_weapon_powerups[powerupindex]) && level.random_weapon_powerups[powerupindex].base_weapon == weapon)
				{
					count++;
					if(count >= limit)
					{
						return false;
					}
				}
			}
		}
	}
	return true;
}

/*
	Name: add_custom_limited_weapon_check
	Namespace: zm_weapons
	Checksum: 0xF2B8F53
	Offset: 0x4F40
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function add_custom_limited_weapon_check(callback)
{
	if(!isdefined(level.custom_limited_weapon_checks))
	{
		level.custom_limited_weapon_checks = [];
	}
	level.custom_limited_weapon_checks[level.custom_limited_weapon_checks.size] = callback;
}

/*
	Name: add_weapon_to_content
	Namespace: zm_weapons
	Checksum: 0x753615F7
	Offset: 0x4F90
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function add_weapon_to_content(weapon_name, package)
{
	if(!isdefined(level.content_weapons))
	{
		level.content_weapons = [];
	}
	level.content_weapons[getweapon(weapon_name)] = package;
}

/*
	Name: player_can_use_content
	Namespace: zm_weapons
	Checksum: 0x22907297
	Offset: 0x4FF0
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function player_can_use_content(weapon)
{
	if(isdefined(level.content_weapons))
	{
		if(isdefined(level.content_weapons[weapon]))
		{
			return self hasdlcavailable(level.content_weapons[weapon]);
		}
	}
	return 1;
}

/*
	Name: get_weapon_hint
	Namespace: zm_weapons
	Checksum: 0x3F9CCF9D
	Offset: 0x5050
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function get_weapon_hint(weapon)
{
	/#
		/#
			assert(isdefined(level.zombie_weapons[weapon]), function_9e72a96(weapon.name) + "");
		#/
	#/
	return level.zombie_weapons[weapon].hint;
}

/*
	Name: get_weapon_cost
	Namespace: zm_weapons
	Checksum: 0xC8734879
	Offset: 0x50D0
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function get_weapon_cost(weapon)
{
	/#
		/#
			assert(isdefined(level.zombie_weapons[weapon]), function_9e72a96(weapon.name) + "");
		#/
	#/
	return level.zombie_weapons[weapon].cost;
}

/*
	Name: function_5d47055e
	Namespace: zm_weapons
	Checksum: 0xD8BE188F
	Offset: 0x5150
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function function_5d47055e(var_13f9dee7)
{
	switch(var_13f9dee7)
	{
		case "resource":
		case "none":
		case "white":
		case "loadout":
		{
			return 0;
			break;
		}
		case "green":
		case "uncommon":
		{
			return 500;
			break;
		}
		case "blue":
		case "rare":
		{
			return 1500;
			break;
		}
		case "purple":
		case "epic":
		{
			return 2500;
			break;
		}
		case "yellow":
		case "ultra":
		case "gold":
		case "orange":
		case "named":
		case "legendary":
		{
			return 3500;
			break;
		}
	}
	return 0;
}

/*
	Name: get_ammo_cost
	Namespace: zm_weapons
	Checksum: 0x2AD28FAC
	Offset: 0x52B0
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function get_ammo_cost(weapon)
{
	/#
		/#
			assert(isdefined(level.zombie_weapons[weapon]), function_9e72a96(weapon.name) + "");
		#/
	#/
	return level.zombie_weapons[weapon].ammo_cost;
}

/*
	Name: get_upgraded_ammo_cost
	Namespace: zm_weapons
	Checksum: 0x130C5F16
	Offset: 0x5330
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function get_upgraded_ammo_cost(weapon)
{
	/#
		/#
			assert(isdefined(level.zombie_weapons[weapon]), function_9e72a96(weapon.name) + "");
		#/
	#/
	if(isdefined(level.zombie_weapons[weapon].upgraded_ammo_cost))
	{
		return level.zombie_weapons[weapon].upgraded_ammo_cost;
	}
	return 4500;
}

/*
	Name: get_ammo_cost_for_weapon
	Namespace: zm_weapons
	Checksum: 0x2BC7F416
	Offset: 0x53D0
	Size: 0x13E
	Parameters: 3
	Flags: None
*/
function get_ammo_cost_for_weapon(w_current, n_base_non_wallbuy_cost, n_upgraded_non_wallbuy_cost)
{
	if(!isdefined(n_base_non_wallbuy_cost))
	{
		n_base_non_wallbuy_cost = 750;
	}
	if(!isdefined(n_upgraded_non_wallbuy_cost))
	{
		n_upgraded_non_wallbuy_cost = 5000;
	}
	w_root = function_386dacbc(w_current);
	if(is_weapon_upgraded(w_root))
	{
		w_root = get_base_weapon(w_root);
	}
	if(self has_upgrade(w_root))
	{
		if(zm_wallbuy::is_wallbuy(w_root))
		{
			n_ammo_cost = 4000;
		}
		else
		{
			n_ammo_cost = n_upgraded_non_wallbuy_cost;
		}
	}
	else
	{
		if(zm_wallbuy::is_wallbuy(w_root))
		{
			n_ammo_cost = get_ammo_cost(w_root);
			n_ammo_cost = zm_utility::halve_score(n_ammo_cost);
		}
		else
		{
			n_ammo_cost = n_base_non_wallbuy_cost;
		}
	}
	return n_ammo_cost;
}

/*
	Name: get_is_in_box
	Namespace: zm_weapons
	Checksum: 0xFD8F696B
	Offset: 0x5518
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function get_is_in_box(weapon)
{
	/#
		assert(isdefined(level.zombie_weapons[weapon]), weapon.name + "");
	#/
	return level.zombie_weapons[weapon].is_in_box;
}

/*
	Name: function_603af7a8
	Namespace: zm_weapons
	Checksum: 0x6C70C40C
	Offset: 0x5580
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_603af7a8(weapon)
{
	if(isdefined(level.zombie_weapons[weapon]))
	{
		level.zombie_weapons[weapon].is_in_box = 1;
	}
	/#
		level thread zm_devgui::function_bcc8843e(function_a16a090d(weapon), "", "");
	#/
}

/*
	Name: function_f1114209
	Namespace: zm_weapons
	Checksum: 0x3858DFBD
	Offset: 0x5600
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function function_f1114209(weapon)
{
	if(isdefined(level.zombie_weapons[weapon]))
	{
		level.zombie_weapons[weapon].is_in_box = 0;
	}
}

/*
	Name: weapon_supports_default_attachment
	Namespace: zm_weapons
	Checksum: 0x47166C17
	Offset: 0x5648
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function weapon_supports_default_attachment(weapon)
{
	weapon = get_base_weapon(weapon);
	attachment = level.zombie_weapons[weapon].default_attachment;
	return isdefined(attachment);
}

/*
	Name: default_attachment
	Namespace: zm_weapons
	Checksum: 0xC0A7B8FB
	Offset: 0x56A0
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function default_attachment(weapon)
{
	weapon = get_base_weapon(weapon);
	attachment = level.zombie_weapons[weapon].default_attachment;
	if(isdefined(attachment))
	{
		return attachment;
	}
	return "none";
}

/*
	Name: weapon_supports_attachments
	Namespace: zm_weapons
	Checksum: 0x220E951C
	Offset: 0x5708
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function weapon_supports_attachments(weapon)
{
	weapon = get_base_weapon(weapon);
	attachments = level.zombie_weapons[weapon].addon_attachments;
	return isdefined(attachments) && attachments.size > 1;
}

/*
	Name: random_attachment
	Namespace: zm_weapons
	Checksum: 0x3088803
	Offset: 0x5770
	Size: 0x142
	Parameters: 2
	Flags: None
*/
function random_attachment(weapon, exclude)
{
	lo = 0;
	if(isdefined(level.zombie_weapons[weapon].addon_attachments) && level.zombie_weapons[weapon].addon_attachments.size > 0)
	{
		attachments = level.zombie_weapons[weapon].addon_attachments;
	}
	else
	{
		attachments = weapon.supportedattachments;
		lo = 1;
	}
	minatt = lo;
	if(isdefined(exclude) && exclude != "none")
	{
		minatt = lo + 1;
	}
	if(attachments.size > minatt)
	{
		while(true)
		{
			idx = (randomint(attachments.size - lo)) + lo;
			if(!isdefined(exclude) || attachments[idx] != exclude)
			{
				return attachments[idx];
			}
		}
	}
	return "none";
}

/*
	Name: get_attachment_index
	Namespace: zm_weapons
	Checksum: 0x3B6EC189
	Offset: 0x58C0
	Size: 0x138
	Parameters: 1
	Flags: None
*/
function get_attachment_index(weapon)
{
	attachments = weapon.attachments;
	if(!attachments.size)
	{
		return -1;
	}
	weapon = get_nonalternate_weapon(weapon);
	base = function_386dacbc(weapon);
	if(attachments[0] === level.zombie_weapons[base].default_attachment)
	{
		return 0;
	}
	if(isdefined(level.zombie_weapons[base].addon_attachments))
	{
		for(i = 0; i < level.zombie_weapons[base].addon_attachments.size; i++)
		{
			if(level.zombie_weapons[base].addon_attachments[i] == attachments[0])
			{
				return i + 1;
			}
		}
	}
	/#
		println("" + weapon.name);
	#/
	return -1;
}

/*
	Name: weapon_supports_this_attachment
	Namespace: zm_weapons
	Checksum: 0x63E754D7
	Offset: 0x5A00
	Size: 0xE2
	Parameters: 2
	Flags: None
*/
function weapon_supports_this_attachment(weapon, att)
{
	weapon = get_nonalternate_weapon(weapon);
	base = function_386dacbc(weapon);
	if(att == level.zombie_weapons[base].default_attachment)
	{
		return true;
	}
	if(isdefined(level.zombie_weapons[base].addon_attachments))
	{
		for(i = 0; i < level.zombie_weapons[base].addon_attachments.size; i++)
		{
			if(level.zombie_weapons[base].addon_attachments[i] == att)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: get_base_weapon
	Namespace: zm_weapons
	Checksum: 0x4CA18EBB
	Offset: 0x5AF0
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function get_base_weapon(upgradedweapon)
{
	upgradedweapon = get_nonalternate_weapon(upgradedweapon);
	upgradedweapon = function_386dacbc(upgradedweapon);
	if(isdefined(upgradedweapon.dualwieldweapon) && is_true(upgradedweapon.var_bf0eb41))
	{
		upgradedweapon = upgradedweapon.dualwieldweapon;
	}
	if(isdefined(level.zombie_weapons_upgraded[upgradedweapon]))
	{
		return level.zombie_weapons_upgraded[upgradedweapon];
	}
	return upgradedweapon;
}

/*
	Name: get_upgrade_weapon
	Namespace: zm_weapons
	Checksum: 0xB96F865A
	Offset: 0x5B98
	Size: 0x1D2
	Parameters: 2
	Flags: Linked
*/
function get_upgrade_weapon(weapon, add_attachment)
{
	add_attachment = get_nonalternate_weapon(add_attachment);
	rootweapon = function_386dacbc(add_attachment);
	newweapon = rootweapon;
	baseweapon = get_base_weapon(add_attachment);
	if(!is_weapon_upgraded(rootweapon) && isdefined(level.zombie_weapons[rootweapon]))
	{
		newweapon = level.zombie_weapons[rootweapon].upgrade;
	}
	else if(!zm_custom::function_901b751c(#"hash_57a5c7a9dcf94d61"))
	{
		return add_attachment;
	}
	/#
		if(isdefined(self.var_8d5839f4) && isinarray(self.var_8d5839f4, add_attachment) && add_attachment.attachments.size)
		{
			newweapon = getweapon(newweapon.name, add_attachment.attachments);
			return newweapon;
		}
	#/
	if(isdefined(level.zombie_weapons[rootweapon]) && isdefined(level.zombie_weapons[rootweapon].default_attachment))
	{
		att = level.zombie_weapons[rootweapon].default_attachment;
		newweapon = getweapon(newweapon.name, att);
	}
	return newweapon;
}

/*
	Name: can_upgrade_weapon
	Namespace: zm_weapons
	Checksum: 0x479F241D
	Offset: 0x5D78
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function can_upgrade_weapon(weapon)
{
	if(weapon == level.weaponnone || weapon == level.weaponzmfists || !is_weapon_included(weapon))
	{
		return 0;
	}
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = function_386dacbc(weapon);
	if(!is_weapon_upgraded(rootweapon))
	{
		upgraded_weapon = level.zombie_weapons[rootweapon].upgrade;
		return isdefined(upgraded_weapon) && upgraded_weapon != level.weaponnone;
	}
	return 0;
}

/*
	Name: weapon_supports_aat
	Namespace: zm_weapons
	Checksum: 0x1A3471F7
	Offset: 0x5E68
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function weapon_supports_aat(weapon)
{
	if(!zm_custom::function_901b751c(#"hash_57a5c7a9dcf94d61"))
	{
		return false;
	}
	if(!isdefined(weapon))
	{
		return false;
	}
	if(weapon == level.weaponnone || weapon == level.weaponzmfists)
	{
		return false;
	}
	weapontopack = get_nonalternate_weapon(weapon);
	if(!aat::is_exempt_weapon(weapontopack))
	{
		return true;
	}
	return false;
}

/*
	Name: is_weapon_upgraded
	Namespace: zm_weapons
	Checksum: 0x243C05F1
	Offset: 0x5F18
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function is_weapon_upgraded(weapon)
{
	if(!isdefined(weapon))
	{
		return false;
	}
	if(weapon == level.weaponnone || weapon == level.weaponzmfists)
	{
		return false;
	}
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = function_386dacbc(weapon);
	if(isdefined(level.zombie_weapons_upgraded[rootweapon]))
	{
		return true;
	}
	return false;
}

/*
	Name: get_weapon_with_attachments
	Namespace: zm_weapons
	Checksum: 0xF11DE668
	Offset: 0x5FC0
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function get_weapon_with_attachments(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = function_386dacbc(weapon);
	if(self has_weapon_or_attachments(rootweapon))
	{
		/#
			if(isdefined(self.var_8d5839f4) && isinarray(self.var_8d5839f4, weapon) && weapon.attachments.size)
			{
				return weapon;
			}
		#/
		return self getbuildkitweapon(rootweapon);
	}
	return undefined;
}

/*
	Name: has_weapon_or_attachments
	Namespace: zm_weapons
	Checksum: 0x3E5979D6
	Offset: 0x6088
	Size: 0xD6
	Parameters: 1
	Flags: Linked
*/
function has_weapon_or_attachments(weapon)
{
	primaryweapon = self namespace_a0d533d1::function_2b83d3ff(self item_inventory::function_2e711614(17 + 1));
	secondaryweapon = self namespace_a0d533d1::function_2b83d3ff(self item_inventory::function_2e711614(((17 + 1) + 8) + 1));
	primaryweapon = primaryweapon.rootweapon;
	secondaryweapon = secondaryweapon.rootweapon;
	if(weapon.rootweapon === primaryweapon || weapon.rootweapon === secondaryweapon)
	{
		return true;
	}
	return false;
}

/*
	Name: function_40d216ce
	Namespace: zm_weapons
	Checksum: 0xEBFF8EB4
	Offset: 0x6168
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_40d216ce(currentweapon, weapon)
{
	if(currentweapon.rootweapon === weapon.rootweapon)
	{
		return true;
	}
	return false;
}

/*
	Name: function_386dacbc
	Namespace: zm_weapons
	Checksum: 0x50ED5A27
	Offset: 0x61A8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_386dacbc(weapon)
{
	rootweapon = weapon.rootweapon;
	if(isdefined(level.var_44e0d625[rootweapon]))
	{
		rootweapon = level.var_44e0d625[rootweapon];
	}
	return rootweapon;
}

/*
	Name: has_upgrade
	Namespace: zm_weapons
	Checksum: 0x2812BF0E
	Offset: 0x6200
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function has_upgrade(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = function_386dacbc(weapon);
	has_upgrade = 0;
	if(isdefined(level.zombie_weapons[rootweapon]) && isdefined(level.zombie_weapons[rootweapon].upgrade))
	{
		has_upgrade = self has_weapon_or_attachments(level.zombie_weapons[rootweapon].upgrade);
	}
	return has_upgrade;
}

/*
	Name: has_weapon_or_upgrade
	Namespace: zm_weapons
	Checksum: 0xF6488F68
	Offset: 0x62C0
	Size: 0x132
	Parameters: 1
	Flags: Linked
*/
function has_weapon_or_upgrade(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = function_386dacbc(weapon);
	upgradedweaponname = rootweapon;
	if(isdefined(level.zombie_weapons[rootweapon]) && isdefined(level.zombie_weapons[rootweapon].upgrade))
	{
		upgradedweaponname = level.zombie_weapons[rootweapon].upgrade;
	}
	has_weapon = 0;
	if(isdefined(level.zombie_weapons[rootweapon]))
	{
		has_weapon = self has_weapon_or_attachments(rootweapon) || self has_upgrade(rootweapon);
	}
	if(!has_weapon && zm_equipment::is_equipment(rootweapon))
	{
		has_weapon = self zm_equipment::is_active(rootweapon);
	}
	return has_weapon;
}

/*
	Name: add_shared_ammo_weapon
	Namespace: zm_weapons
	Checksum: 0x512C4503
	Offset: 0x6400
	Size: 0x2E
	Parameters: 2
	Flags: None
*/
function add_shared_ammo_weapon(weapon, base_weapon)
{
	level.zombie_weapons[weapon].shared_ammo_weapon = base_weapon;
}

/*
	Name: get_shared_ammo_weapon
	Namespace: zm_weapons
	Checksum: 0xF155372D
	Offset: 0x6438
	Size: 0x186
	Parameters: 1
	Flags: Linked
*/
function get_shared_ammo_weapon(weapon)
{
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = function_386dacbc(weapon);
	weapons = self getweaponslist(1);
	foreach(w in weapons)
	{
		w = function_386dacbc(w);
		if(!isdefined(level.zombie_weapons[w]) && isdefined(level.zombie_weapons_upgraded[w]))
		{
			w = level.zombie_weapons_upgraded[w];
		}
		if(isdefined(level.zombie_weapons[w]) && isdefined(level.zombie_weapons[w].shared_ammo_weapon) && level.zombie_weapons[w].shared_ammo_weapon == rootweapon)
		{
			return w;
		}
	}
	return undefined;
}

/*
	Name: get_player_weapon_with_same_base
	Namespace: zm_weapons
	Checksum: 0xDAEE984E
	Offset: 0x65C8
	Size: 0x132
	Parameters: 1
	Flags: Linked
*/
function get_player_weapon_with_same_base(weapon)
{
	if(isdefined(level.var_ee565b3f))
	{
		retweapon = [[level.var_ee565b3f]](weapon);
		if(isdefined(retweapon))
		{
			return retweapon;
		}
	}
	weapon = get_nonalternate_weapon(weapon);
	rootweapon = function_386dacbc(weapon);
	retweapon = self get_weapon_with_attachments(rootweapon);
	if(!isdefined(retweapon))
	{
		if(isdefined(level.zombie_weapons[rootweapon]))
		{
			if(isdefined(level.zombie_weapons[rootweapon].upgrade))
			{
				retweapon = self get_weapon_with_attachments(level.zombie_weapons[rootweapon].upgrade);
			}
		}
		else if(isdefined(level.zombie_weapons_upgraded[rootweapon]))
		{
			retweapon = self get_weapon_with_attachments(level.zombie_weapons_upgraded[rootweapon]);
		}
	}
	return retweapon;
}

/*
	Name: get_weapon_hint_ammo
	Namespace: zm_weapons
	Checksum: 0x373A5F78
	Offset: 0x6708
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function get_weapon_hint_ammo()
{
	return #"hash_60606b68e93a29c8";
}

/*
	Name: weapon_set_first_time_hint
	Namespace: zm_weapons
	Checksum: 0xCF1CE917
	Offset: 0x6728
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function weapon_set_first_time_hint(cost, ammo_cost)
{
	self sethintstring(get_weapon_hint_ammo());
}

/*
	Name: get_pack_a_punch_weapon_options
	Namespace: zm_weapons
	Checksum: 0xCE51D675
	Offset: 0x6770
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function get_pack_a_punch_weapon_options(weapon)
{
	if(!isdefined(self.pack_a_punch_weapon_options))
	{
		self.pack_a_punch_weapon_options = [];
	}
	if(!is_weapon_upgraded(weapon))
	{
		return self function_6eff28b5(0, 0, 0);
	}
	if(isdefined(self.pack_a_punch_weapon_options[weapon]))
	{
		return self.pack_a_punch_weapon_options[weapon];
	}
	camo_index = self zm_camos::function_4f727cf5(weapon);
	reticle_index = randomintrange(0, 16);
	plain_reticle_index = 16;
	use_plain = randomint(10) < 1;
	if(use_plain)
	{
		reticle_index = plain_reticle_index;
	}
	/#
		if(getdvarint(#"scr_force_reticle_index", 0) >= 0)
		{
			reticle_index = getdvarint(#"scr_force_reticle_index", 0);
		}
	#/
	self.pack_a_punch_weapon_options[weapon] = self function_6eff28b5(camo_index, reticle_index, 0);
	return self.pack_a_punch_weapon_options[weapon];
}

/*
	Name: function_17512fb3
	Namespace: zm_weapons
	Checksum: 0x4E321611
	Offset: 0x6900
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function function_17512fb3()
{
	lethal_grenade = self zm_loadout::get_player_lethal_grenade();
	if(!self hasweapon(lethal_grenade))
	{
		self giveweapon(lethal_grenade);
		self setweaponammoclip(lethal_grenade, 0);
	}
	frac = self getfractionmaxammo(lethal_grenade);
	if(frac < 0.25)
	{
		self setweaponammoclip(lethal_grenade, 2);
	}
	else
	{
		if(frac < 0.5)
		{
			self setweaponammoclip(lethal_grenade, 3);
		}
		else
		{
			self setweaponammoclip(lethal_grenade, 4);
		}
	}
}

/*
	Name: give_build_kit_weapon
	Namespace: zm_weapons
	Checksum: 0xCE4747E8
	Offset: 0x6A18
	Size: 0x52
	Parameters: 4
	Flags: Linked
*/
function give_build_kit_weapon(weapon, var_51ec4e93, var_bd5d43c6, b_switch_weapon)
{
	if(!isdefined(b_switch_weapon))
	{
		b_switch_weapon = 1;
	}
	return weapon_give(weapon, 0, b_switch_weapon, var_51ec4e93, var_bd5d43c6);
}

/*
	Name: function_98776900
	Namespace: zm_weapons
	Checksum: 0xCF623152
	Offset: 0x6A78
	Size: 0x43C
	Parameters: 4
	Flags: Linked
*/
function function_98776900(item, nosound, var_ac6e9818, var_d29fef1)
{
	if(!isdefined(nosound))
	{
		nosound = 0;
	}
	if(!isdefined(var_ac6e9818))
	{
		var_ac6e9818 = 0;
	}
	if(!isdefined(var_d29fef1))
	{
		var_d29fef1 = 0;
	}
	if(item.var_a6762160.itemtype !== #"weapon")
	{
		return;
	}
	if(!item_world_util::function_d9648161(item.var_bd027dd9))
	{
		/#
			println("" + (isdefined(item.var_a6762160.name) ? item.var_a6762160.name : ""));
		#/
		return;
	}
	if(!function_2bcaec6f(item.var_a6762160.weapon))
	{
		if(isentity(item) && var_d29fef1)
		{
			item_drop::drop_item(0, item.var_a6762160.weapon, 1, item.var_a6762160.weapon.maxammo, item.id, self.origin, self.angles, 3);
		}
		return;
	}
	if(!is_true(nosound))
	{
		self zm_utility::play_sound_on_ent("purchase");
	}
	if(isentity(item) && isdefined(item.var_627c698b.attachments) && !isdefined(item.attachments))
	{
		attachments = item.var_627c698b.attachments;
		foreach(attachment in attachments)
		{
			var_41ade915 = item_world_util::function_6a0ee21a(attachment);
			if(level.itemreplacement[var_41ade915] === #"")
			{
				continue;
			}
			if(ishash(var_41ade915) || isstring(var_41ade915))
			{
				attachmentitem = function_4ba8fde(var_41ade915);
				if(isdefined(attachmentitem))
				{
					namespace_a0d533d1::function_8b7b98f(item, attachmentitem);
				}
			}
		}
	}
	if(var_ac6e9818)
	{
		var_db0dca92 = self item_inventory::get_weapon_count();
		w_current = self getcurrentweapon();
		if(var_db0dca92 == zm_utility::get_player_weapon_limit(self))
		{
			self weapon_take(w_current);
		}
	}
	var_fa3df96 = self item_inventory::function_e66dcff5(item);
	if(isdefined(var_fa3df96))
	{
		if(!item_world_util::function_db35e94f(item.var_bd027dd9))
		{
			item.var_bd027dd9 = item_world_util::function_970b8d86(var_fa3df96);
		}
		self item_world::function_de2018e3(item, self, var_fa3df96);
	}
}

/*
	Name: function_cab9277e
	Namespace: zm_weapons
	Checksum: 0xC4039F8C
	Offset: 0x6EC0
	Size: 0x1AA
	Parameters: 0
	Flags: Linked
*/
function function_cab9277e()
{
	if(zm_utility::is_classic() || zm_utility::function_c4b020f8())
	{
		round = level.round_number;
		if(round >= 10 && round < 20)
		{
			return #"green";
		}
		if(round >= 20 && round < 25)
		{
			return #"blue";
		}
		if(round >= 25 && round < 30)
		{
			return #"purple";
		}
		if(round >= 30)
		{
			return #"orange";
		}
	}
	else if(zm_utility::is_survival())
	{
		var_173cd713 = level.var_b48509f9;
		if(var_173cd713 >= 2 && var_173cd713 < 3)
		{
			return #"blue";
		}
		if(var_173cd713 >= 3 && var_173cd713 < 4)
		{
			return #"purple";
		}
		if(var_173cd713 >= 4)
		{
			return #"orange";
		}
	}
	return #"white";
}

/*
	Name: function_7df0d6b2
	Namespace: zm_weapons
	Checksum: 0xF487863D
	Offset: 0x7078
	Size: 0x9A
	Parameters: 5
	Flags: Linked
*/
function function_7df0d6b2(item, weapon, weaponoptions, var_e91aba42, var_908f65ca)
{
	if(isdefined(weaponoptions))
	{
		item.weaponoptions = weaponoptions;
	}
	if(isdefined(var_e91aba42))
	{
		item.var_e91aba42 = var_e91aba42;
	}
	if(isdefined(var_908f65ca))
	{
		item.var_908f65ca = var_908f65ca;
	}
	if(isdefined(weaponoptions))
	{
		item.weaponoptions = self item_inventory::function_fc04b237(weapon, item.weaponoptions);
	}
}

/*
	Name: function_943eabd9
	Namespace: zm_weapons
	Checksum: 0xBE96B98C
	Offset: 0x7120
	Size: 0x2F2
	Parameters: 8
	Flags: Linked
*/
function function_943eabd9(item_struct, nosound, var_8e917f9b, var_8f608a31, var_1b46b4cb, weaponoptions, var_e91aba42, var_908f65ca)
{
	if(!isdefined(nosound))
	{
		nosound = 1;
	}
	if(!isdefined(var_8e917f9b))
	{
		var_8e917f9b = 0;
	}
	if(!isdefined(var_8f608a31))
	{
		var_8f608a31 = 0;
	}
	if(!isdefined(var_1b46b4cb))
	{
		var_1b46b4cb = undefined;
	}
	if(!isdefined(weaponoptions))
	{
		weaponoptions = undefined;
	}
	if(!isdefined(var_e91aba42))
	{
		var_e91aba42 = undefined;
	}
	if(!isdefined(var_908f65ca))
	{
		var_908f65ca = undefined;
	}
	if(isdefined(item_struct))
	{
		if(var_8e917f9b || var_8f608a31)
		{
			item_struct.var_b3546c09 = 1;
		}
		self function_7df0d6b2(item_struct, item_struct.var_a6762160.weapon, weaponoptions, var_e91aba42, var_908f65ca);
		if(isarray(var_1b46b4cb))
		{
			foreach(attachment_name in var_1b46b4cb)
			{
				var_67419ad4 = item_world_util::function_6a0ee21a(attachment_name);
				if(level.itemreplacement[var_67419ad4] === #"")
				{
					continue;
				}
				if(ishash(var_67419ad4) || isstring(var_67419ad4))
				{
					var_5b788df2 = function_4ba8fde(var_67419ad4);
					if(isdefined(var_5b788df2))
					{
						namespace_a0d533d1::function_9e9c82a6(item_struct, var_5b788df2, 1);
					}
				}
			}
		}
		if(is_true(nosound))
		{
			item_struct.var_99628f67 = 1;
		}
		var_fa3df96 = self item_inventory::function_e66dcff5(item_struct);
		if(isdefined(var_fa3df96))
		{
			if(!item_world_util::function_db35e94f(item_struct.var_bd027dd9))
			{
				item_struct.var_bd027dd9 = item_world_util::function_970b8d86(var_fa3df96);
			}
			self item_world::function_de2018e3(item_struct, self, var_fa3df96);
		}
		return item_struct.var_627c698b;
	}
	return undefined;
}

/*
	Name: weapon_give
	Namespace: zm_weapons
	Checksum: 0x842F01B2
	Offset: 0x7420
	Size: 0x6F8
	Parameters: 8
	Flags: Linked
*/
function weapon_give(weapon, nosound, b_switch_weapon, var_bc218695, var_8f608a31, var_823339c8, var_1b46b4cb, var_8e917f9b)
{
	if(!isdefined(b_switch_weapon))
	{
		b_switch_weapon = 0;
	}
	if(!isdefined(var_bc218695))
	{
		var_bc218695 = 0;
	}
	if(!isdefined(var_8f608a31))
	{
		var_8f608a31 = 0;
	}
	if(!isdefined(var_823339c8))
	{
		var_823339c8 = #"none";
	}
	if(!isdefined(var_8e917f9b))
	{
		var_8e917f9b = 0;
	}
	if(!is_true(b_switch_weapon))
	{
		self zm_utility::play_sound_on_ent("purchase");
	}
	if(isweapon(nosound))
	{
		if(!function_2bcaec6f(nosound))
		{
			return;
		}
		if(var_8f608a31)
		{
			weaponoptions = self function_6eff28b5(self.class_num, var_bc218695);
			var_e91aba42 = self function_e601ff48(self.class_num, var_bc218695);
			var_908f65ca = self function_1c228d69(self.class_num, var_bc218695);
		}
		if(is_weapon_upgraded(nosound))
		{
			if(nosound.name == #"hash_7a910d220f3767fa")
			{
				str_item = ("knife_loadout" + "_t9_upgraded") + "_item_sr";
			}
			else
			{
				str_item = nosound.name + "_item_sr";
			}
		}
		else
		{
			if(var_823339c8 != #"none" && isdefined(level.var_29d88fe5[nosound.name][var_823339c8]))
			{
				str_item = level.var_29d88fe5[nosound.name][var_823339c8];
			}
			else
			{
				if(var_8e917f9b)
				{
					rarity = function_cab9277e();
					if(rarity == #"white")
					{
						if(nosound.name == #"knife_loadout")
						{
							str_item = (nosound.name + "_t9") + "_item_sr";
						}
						else
						{
							str_item = nosound.name + "_item_sr";
						}
					}
					else
					{
						str_item = level.var_ec04a8a4[nosound.name][rarity];
					}
				}
				else
				{
					if(nosound.name == #"knife_loadout")
					{
						str_item = (nosound.name + "_t9") + "_item_sr";
					}
					else
					{
						str_item = nosound.name + "_item_sr";
					}
				}
			}
		}
	}
	if(!isdefined(str_item) || (!isstring(str_item) && !ishash(str_item)))
	{
		if(isdefined(nosound))
		{
			self giveweapon(nosound);
			self switchtoweapon(nosound);
		}
		else
		{
			/#
				assert(0, "");
			#/
			/#
			#/
		}
		return;
	}
	var_3383cd4e = function_4ba8fde(str_item);
	if(isdefined(var_3383cd4e))
	{
		if(var_8e917f9b || var_8f608a31)
		{
			var_3383cd4e.var_b3546c09 = 1;
		}
		self function_7df0d6b2(var_3383cd4e, nosound, weaponoptions, var_e91aba42, var_908f65ca);
		if(isarray(var_1b46b4cb))
		{
			foreach(attachment_name in var_1b46b4cb)
			{
				var_67419ad4 = item_world_util::function_6a0ee21a(attachment_name);
				if(level.itemreplacement[var_67419ad4] === #"")
				{
					continue;
				}
				if(ishash(var_67419ad4) || isstring(var_67419ad4))
				{
					var_5b788df2 = function_4ba8fde(var_67419ad4);
					if(isdefined(var_5b788df2))
					{
						namespace_a0d533d1::function_9e9c82a6(var_3383cd4e, var_5b788df2, 1);
					}
				}
			}
		}
		if(is_true(b_switch_weapon))
		{
			var_3383cd4e.var_99628f67 = 1;
		}
		var_fa3df96 = self item_inventory::function_e66dcff5(var_3383cd4e);
		if(isdefined(var_fa3df96))
		{
			if(!item_world_util::function_db35e94f(var_3383cd4e.var_bd027dd9))
			{
				var_3383cd4e.var_bd027dd9 = item_world_util::function_970b8d86(var_fa3df96);
			}
			self item_world::function_de2018e3(var_3383cd4e, self, var_fa3df96);
			item = self item_inventory::function_2e711614(var_fa3df96);
			if(is_true(var_3383cd4e.var_b3546c09) && item_world_util::function_db35e94f(item.var_bd027dd9))
			{
				item.var_b3546c09 = 1;
			}
		}
	}
	else
	{
		self giveweapon(nosound);
		self switchtoweapon(nosound);
	}
	return nosound;
}

/*
	Name: function_2bcaec6f
	Namespace: zm_weapons
	Checksum: 0x601C851C
	Offset: 0x7B20
	Size: 0x21A
	Parameters: 1
	Flags: Linked
*/
function function_2bcaec6f(weapon)
{
	if(!isdefined(weapon))
	{
		return;
	}
	current_weapon = self getcurrentweapon();
	current_weapon = get_base_weapon(current_weapon);
	var_3ccb716f = get_base_weapon(weapon);
	weapon1 = self namespace_a0d533d1::function_2b83d3ff(self item_inventory::function_2e711614(17 + 1));
	weapon2 = self namespace_a0d533d1::function_2b83d3ff(self item_inventory::function_2e711614(((17 + 1) + 8) + 1));
	if(!(isdefined(weapon1) && isdefined(weapon2)))
	{
		return true;
	}
	weapon1 = get_base_weapon(weapon1);
	weapon2 = get_base_weapon(weapon2);
	if(isdefined(level.zombie_weapons[var_3ccb716f]) && isdefined(level.zombie_weapons[var_3ccb716f].var_51344511))
	{
		foreach(var_6ae93843 in level.zombie_weapons[var_3ccb716f].var_51344511)
		{
			if(weapon1 == var_6ae93843 && weapon1 != current_weapon)
			{
				return false;
			}
			if(weapon2 == var_6ae93843 && weapon2 != current_weapon)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: weapon_take
	Namespace: zm_weapons
	Checksum: 0xE2D37BB4
	Offset: 0x7D48
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function weapon_take(weapon)
{
	if(!isdefined(weapon))
	{
		return;
	}
	if(self hasweapon(weapon))
	{
		var_8a83ec7a = item_inventory::function_a33744de(weapon);
		if(isdefined(var_8a83ec7a))
		{
			if(var_8a83ec7a != 32767)
			{
				var_f9f12a82 = item_inventory::drop_inventory_item(var_8a83ec7a);
				if(isentity(var_f9f12a82))
				{
					item_world::consume_item(var_f9f12a82);
				}
			}
		}
		else
		{
			self takeweapon(weapon);
		}
	}
}

/*
	Name: weapon_type_check
	Namespace: zm_weapons
	Checksum: 0x3FF1E963
	Offset: 0x7E20
	Size: 0xCA
	Parameters: 1
	Flags: None
*/
function weapon_type_check(weapon)
{
	if(!isdefined(self.entity_num))
	{
		return "crappy";
	}
	weapon = get_nonalternate_weapon(weapon);
	weapon = function_386dacbc(weapon);
	if(is_weapon_upgraded(weapon) && !self bgb::is_enabled(#"zm_bgb_wall_power"))
	{
		return "upgrade";
	}
	if(isdefined(level.zombie_weapons[weapon]))
	{
		return level.zombie_weapons[weapon].vox;
	}
	return "crappy";
}

/*
	Name: ammo_give
	Namespace: zm_weapons
	Checksum: 0xD65556A4
	Offset: 0x7EF8
	Size: 0x2A6
	Parameters: 2
	Flags: Linked
*/
function ammo_give(weapon, b_purchased)
{
	if(!isdefined(b_purchased))
	{
		b_purchased = 1;
	}
	var_cd9d17e0 = 0;
	if(!zm_loadout::is_offhand_weapon(weapon) || weapon.isriotshield)
	{
		weapon = self get_weapon_with_attachments(weapon);
		if(isdefined(weapon))
		{
			var_cb48c3c9 = weapon.maxammo;
			var_ef0714fa = weapon.startammo;
			var_98f6dae8 = self getweaponammoclip(weapon);
			n_clip_size = weapon.clipsize;
			if(var_98f6dae8 < n_clip_size)
			{
				var_cd9d17e0 = 1;
			}
			var_4052eae0 = 0;
			if(!var_cd9d17e0 && weapon.dualwieldweapon != level.weaponnone)
			{
				var_4052eae0 = self getweaponammoclip(weapon.dualwieldweapon);
				var_5916b9ab = weapon.dualwieldweapon.clipsize;
				if(var_4052eae0 < var_5916b9ab)
				{
					var_cd9d17e0 = 1;
				}
			}
			if(!var_cd9d17e0)
			{
				var_b8624c26 = self getammocount(weapon);
				if(self hasperk(#"specialty_extraammo"))
				{
					n_ammo_max = var_cb48c3c9;
				}
				else
				{
					n_ammo_max = var_ef0714fa;
				}
				if(weapon.isdualwield)
				{
					n_ammo_max = n_ammo_max * 2;
				}
				if(var_b8624c26 >= ((n_ammo_max + var_98f6dae8) + var_4052eae0))
				{
					var_cd9d17e0 = 0;
				}
				else
				{
					var_cd9d17e0 = 1;
				}
			}
		}
	}
	else if(self has_weapon_or_upgrade(weapon))
	{
		if(self getammocount(weapon) < weapon.maxammo)
		{
			var_cd9d17e0 = 1;
		}
	}
	if(var_cd9d17e0)
	{
		if(b_purchased)
		{
			self zm_utility::play_sound_on_ent("purchase");
		}
		self function_7c5dd4bd(weapon);
		return true;
	}
	if(!var_cd9d17e0)
	{
		return false;
	}
}

/*
	Name: get_default_weapondata
	Namespace: zm_weapons
	Checksum: 0xFFB10FAB
	Offset: 0x81A8
	Size: 0x1F4
	Parameters: 1
	Flags: Linked
*/
function get_default_weapondata(weapon)
{
	weapondata = [];
	weapondata[#"weapon"] = weapon;
	dw_weapon = weapon.dualwieldweapon;
	alt_weapon = weapon.altweapon;
	weaponnone = getweapon(#"none");
	if(isdefined(level.weaponnone))
	{
		weaponnone = level.weaponnone;
	}
	if(weapon != weaponnone)
	{
		weapondata[#"clip"] = weapon.clipsize;
		weapondata[#"stock"] = weapon.maxammo;
		weapondata[#"fuel"] = weapon.fuellife;
		weapondata[#"heat"] = 0;
		weapondata[#"overheat"] = 0;
	}
	if(dw_weapon != weaponnone)
	{
		weapondata[#"lh_clip"] = dw_weapon.clipsize;
	}
	else
	{
		weapondata[#"lh_clip"] = 0;
	}
	if(alt_weapon != weaponnone)
	{
		weapondata[#"alt_clip"] = alt_weapon.clipsize;
		weapondata[#"alt_stock"] = alt_weapon.maxammo;
	}
	else
	{
		weapondata[#"alt_clip"] = 0;
		weapondata[#"alt_stock"] = 0;
	}
	return weapondata;
}

/*
	Name: get_player_weapondata
	Namespace: zm_weapons
	Checksum: 0xCA18EF2D
	Offset: 0x83A8
	Size: 0x3D4
	Parameters: 1
	Flags: Linked
*/
function get_player_weapondata(weapon)
{
	weapondata = [];
	if(!isdefined(weapon))
	{
		weapon = self getcurrentweapon();
	}
	weapondata[#"weapon"] = weapon;
	if(weapondata[#"weapon"] != level.weaponnone)
	{
		weapondata[#"clip"] = self getweaponammoclip(weapon);
		weapondata[#"stock"] = self getweaponammostock(weapon);
		weapondata[#"fuel"] = self getweaponammofuel(weapon);
		weapondata[#"heat"] = self isweaponoverheating(1, weapon);
		weapondata[#"overheat"] = self isweaponoverheating(0, weapon);
		if(weapon.isgadget)
		{
			slot = self gadgetgetslot(weapon);
			weapondata[#"power"] = self gadgetpowerget(slot);
		}
		if(weapon.isriotshield)
		{
			weapondata[#"health"] = self.weaponhealth;
		}
	}
	else
	{
		weapondata[#"clip"] = 0;
		weapondata[#"stock"] = 0;
		weapondata[#"fuel"] = 0;
		weapondata[#"heat"] = 0;
		weapondata[#"overheat"] = 0;
		weapondata[#"power"] = undefined;
	}
	dw_weapon = weapon.dualwieldweapon;
	if(dw_weapon != level.weaponnone)
	{
		weapondata[#"lh_clip"] = self getweaponammoclip(dw_weapon);
	}
	else
	{
		weapondata[#"lh_clip"] = 0;
	}
	alt_weapon = weapon.altweapon;
	if(alt_weapon != level.weaponnone)
	{
		weapondata[#"alt_clip"] = self getweaponammoclip(alt_weapon);
		weapondata[#"alt_stock"] = self getweaponammostock(alt_weapon);
	}
	else
	{
		weapondata[#"alt_clip"] = 0;
		weapondata[#"alt_stock"] = 0;
	}
	if(self aat::has_aat(weapon))
	{
		weapondata[#"aat"] = self aat::getaatonweapon(weapon, 1);
	}
	weapondata[#"repacks"] = self zm_pap_util::function_83c29ddb(weapon);
	return weapondata;
}

/*
	Name: weapon_is_better
	Namespace: zm_weapons
	Checksum: 0x731FFC6B
	Offset: 0x8788
	Size: 0x6E
	Parameters: 2
	Flags: Linked
*/
function weapon_is_better(left, right)
{
	if(left != right)
	{
		left_upgraded = is_weapon_upgraded(left);
		right_upgraded = is_weapon_upgraded(right);
		if(left_upgraded)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: merge_weapons
	Namespace: zm_weapons
	Checksum: 0x99B760ED
	Offset: 0x8800
	Size: 0x5AC
	Parameters: 2
	Flags: Linked
*/
function merge_weapons(oldweapondata, newweapondata)
{
	weapondata = [];
	if(isdefined(level.var_bb2323e4))
	{
		weapondata = [[level.var_bb2323e4]](oldweapondata, newweapondata);
		if(isdefined(weapondata))
		{
			return weapondata;
		}
	}
	if(weapon_is_better(oldweapondata[#"weapon"], newweapondata[#"weapon"]))
	{
		weapondata[#"weapon"] = oldweapondata[#"weapon"];
	}
	else
	{
		weapondata[#"weapon"] = newweapondata[#"weapon"];
	}
	weapon = weapondata[#"weapon"];
	dw_weapon = weapon.dualwieldweapon;
	alt_weapon = weapon.altweapon;
	if(weapon != level.weaponnone)
	{
		weapondata[#"clip"] = newweapondata[#"clip"] + oldweapondata[#"clip"];
		weapondata[#"clip"] = int(min(weapondata[#"clip"], weapon.clipsize));
		weapondata[#"stock"] = newweapondata[#"stock"] + oldweapondata[#"stock"];
		weapondata[#"stock"] = int(min(weapondata[#"stock"], weapon.maxammo));
		weapondata[#"fuel"] = newweapondata[#"fuel"] + oldweapondata[#"fuel"];
		weapondata[#"fuel"] = int(min(weapondata[#"fuel"], weapon.fuellife));
		weapondata[#"heat"] = int(min(newweapondata[#"heat"], oldweapondata[#"heat"]));
		weapondata[#"overheat"] = int(min(newweapondata[#"overheat"], oldweapondata[#"overheat"]));
		weapondata[#"power"] = int(max((isdefined(newweapondata[#"power"]) ? newweapondata[#"power"] : 0), (isdefined(oldweapondata[#"power"]) ? oldweapondata[#"power"] : 0)));
	}
	if(dw_weapon != level.weaponnone)
	{
		weapondata[#"lh_clip"] = newweapondata[#"lh_clip"] + oldweapondata[#"lh_clip"];
		weapondata[#"lh_clip"] = int(min(weapondata[#"lh_clip"], dw_weapon.clipsize));
	}
	if(alt_weapon != level.weaponnone)
	{
		weapondata[#"alt_clip"] = newweapondata[#"alt_clip"] + oldweapondata[#"alt_clip"];
		weapondata[#"alt_clip"] = int(min(weapondata[#"alt_clip"], alt_weapon.clipsize));
		weapondata[#"alt_stock"] = newweapondata[#"alt_stock"] + oldweapondata[#"alt_stock"];
		weapondata[#"alt_stock"] = int(min(weapondata[#"alt_stock"], alt_weapon.maxammo));
	}
	return weapondata;
}

/*
	Name: weapondata_give
	Namespace: zm_weapons
	Checksum: 0x2DFBAB96
	Offset: 0x8DB8
	Size: 0x4F0
	Parameters: 1
	Flags: Linked
*/
function weapondata_give(weapondata)
{
	current = self get_player_weapon_with_same_base(weapondata[#"weapon"]);
	if(isdefined(current))
	{
		curweapondata = self get_player_weapondata(current);
		self weapon_take(current);
		weapondata = merge_weapons(curweapondata, weapondata);
	}
	weapon = weapondata[#"weapon"];
	weapon_give(weapon, 1);
	if(weapon != level.weaponnone)
	{
		if((weapondata[#"clip"] + weapondata[#"stock"]) <= weapon.clipsize)
		{
			self setweaponammoclip(weapon, weapon.clipsize);
			self setweaponammostock(weapon, 0);
		}
		else
		{
			self setweaponammoclip(weapon, weapondata[#"clip"]);
			self setweaponammostock(weapon, weapondata[#"stock"]);
		}
		if(isdefined(weapondata[#"fuel"]))
		{
			self setweaponammofuel(weapon, weapondata[#"fuel"]);
		}
		if(isdefined(weapondata[#"heat"]) && isdefined(weapondata[#"overheat"]))
		{
			self setweaponoverheating(weapondata[#"overheat"], weapondata[#"heat"], weapon);
		}
		if(weapon.isgadget && isdefined(weapondata[#"power"]))
		{
			slot = self gadgetgetslot(weapon);
			if(slot >= 0)
			{
				self gadgetpowerset(slot, weapondata[#"power"]);
			}
		}
		if(weapon.isriotshield && isdefined(weapondata[#"health"]))
		{
			self.weaponhealth = weapondata[#"health"];
		}
	}
	dw_weapon = weapon.dualwieldweapon;
	if(function_386dacbc(dw_weapon) != level.weaponnone)
	{
		if(!self hasweapon(dw_weapon))
		{
			self giveweapon(dw_weapon);
		}
		self setweaponammoclip(dw_weapon, weapondata[#"lh_clip"]);
	}
	alt_weapon = weapon.altweapon;
	if(function_386dacbc(alt_weapon) != level.weaponnone)
	{
		if(!self hasweapon(alt_weapon))
		{
			self giveweapon(alt_weapon);
		}
		self setweaponammoclip(alt_weapon, weapondata[#"alt_clip"]);
		self setweaponammostock(alt_weapon, weapondata[#"alt_stock"]);
	}
	if(isdefined(weapondata[#"aat"]))
	{
		self aat::acquire(weapon, weapondata[#"aat"]);
	}
	if(isdefined(weapondata[#"repacks"]) && weapondata[#"repacks"] > 0)
	{
		self zm_pap_util::repack_weapon(weapon, weapondata[#"repacks"]);
	}
	return weapon;
}

/*
	Name: weapondata_take
	Namespace: zm_weapons
	Checksum: 0x8F68B559
	Offset: 0x92B0
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function weapondata_take(weapondata)
{
	weapon = weapondata[#"weapon"];
	if(weapon != level.weaponnone)
	{
		if(self hasweapon(weapon))
		{
			self weapon_take(weapon);
		}
	}
	dw_weapon = weapon.dualwieldweapon;
	if(dw_weapon != level.weaponnone)
	{
		if(self hasweapon(dw_weapon))
		{
			self weapon_take(dw_weapon);
		}
	}
	alt_weapon = weapon.altweapon;
	a_alt_weapons = [];
	while(alt_weapon != level.weaponnone)
	{
		if(!isdefined(a_alt_weapons))
		{
			a_alt_weapons = [];
		}
		else if(!isarray(a_alt_weapons))
		{
			a_alt_weapons = array(a_alt_weapons);
		}
		if(!isinarray(a_alt_weapons, alt_weapon))
		{
			a_alt_weapons[a_alt_weapons.size] = alt_weapon;
		}
		if(self hasweapon(alt_weapon))
		{
			self weapon_take(alt_weapon);
		}
		alt_weapon = alt_weapon.altweapon;
		if(isinarray(a_alt_weapons, alt_weapon))
		{
			/#
				println(("" + function_9e72a96(alt_weapon.name)) + "");
			#/
			break;
		}
	}
}

/*
	Name: create_loadout
	Namespace: zm_weapons
	Checksum: 0x7C54C32D
	Offset: 0x94C0
	Size: 0x192
	Parameters: 1
	Flags: None
*/
function create_loadout(weapons)
{
	weaponnone = getweapon(#"none");
	if(isdefined(level.weaponnone))
	{
		weaponnone = level.weaponnone;
	}
	loadout = spawnstruct();
	loadout.weapons = [];
	foreach(weapon in weapons)
	{
		if(isstring(weapon))
		{
			weapon = getweapon(weapon);
		}
		if(weapon == weaponnone)
		{
			/#
				println("" + weapon.name);
			#/
		}
		loadout.weapons[weapon.name] = get_default_weapondata(weapon);
		if(!isdefined(loadout.current))
		{
			loadout.current = weapon;
		}
	}
	return loadout;
}

/*
	Name: player_get_loadout
	Namespace: zm_weapons
	Checksum: 0x199BF6B9
	Offset: 0x9660
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function player_get_loadout()
{
	loadout = spawnstruct();
	loadout.current = self getcurrentweapon();
	loadout.stowed = self getstowedweapon();
	loadout.weapons = [];
	foreach(weapon in self getweaponslist())
	{
		loadout.weapons[weapon.name] = self get_player_weapondata(weapon);
	}
	return loadout;
}

/*
	Name: player_give_loadout
	Namespace: zm_weapons
	Checksum: 0x3544984F
	Offset: 0x9770
	Size: 0x204
	Parameters: 3
	Flags: Linked
*/
function player_give_loadout(loadout, replace_existing, immediate_switch)
{
	if(!isdefined(replace_existing))
	{
		replace_existing = 1;
	}
	if(!isdefined(immediate_switch))
	{
		immediate_switch = 0;
	}
	if(replace_existing)
	{
		self takeallweapons();
	}
	foreach(weapondata in loadout.weapons)
	{
		if(!is_true(weapondata[#"weapon"].isheroweapon))
		{
			self weapondata_give(weapondata);
		}
	}
	if(self getweaponslistprimaries().size == 0)
	{
		self zm_loadout::give_start_weapon(1);
	}
	if(!zm_loadout::is_offhand_weapon(loadout.current))
	{
		if(immediate_switch)
		{
			self switchtoweaponimmediate(loadout.current);
		}
		else
		{
			self switchtoweapon(loadout.current);
		}
	}
	else
	{
		if(immediate_switch)
		{
			self switchtoweaponimmediate();
		}
		else
		{
			self switchtoweapon();
		}
	}
	if(isdefined(loadout.stowed))
	{
		self setstowedweapon(loadout.stowed);
	}
}

/*
	Name: player_take_loadout
	Namespace: zm_weapons
	Checksum: 0x834AC00F
	Offset: 0x9980
	Size: 0x98
	Parameters: 1
	Flags: None
*/
function player_take_loadout(loadout)
{
	foreach(weapondata in loadout.weapons)
	{
		self weapondata_take(weapondata);
	}
}

/*
	Name: register_zombie_weapon_callback
	Namespace: zm_weapons
	Checksum: 0x9175518E
	Offset: 0x9A20
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function register_zombie_weapon_callback(weapon, func)
{
	if(!isdefined(level.zombie_weapons_callbacks))
	{
		level.zombie_weapons_callbacks = [];
	}
	if(!isdefined(level.zombie_weapons_callbacks[weapon]))
	{
		level.zombie_weapons_callbacks[weapon] = func;
	}
}

/*
	Name: set_stowed_weapon
	Namespace: zm_weapons
	Checksum: 0xE2BAE5E9
	Offset: 0x9A80
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function set_stowed_weapon(weapon)
{
	self.weapon_stowed = weapon;
	if(!is_true(self.stowed_weapon_suppressed))
	{
		self setstowedweapon(self.weapon_stowed);
	}
}

/*
	Name: clear_stowed_weapon
	Namespace: zm_weapons
	Checksum: 0xA32DAA2E
	Offset: 0x9AE0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function clear_stowed_weapon()
{
	self notify(#"hash_70957a1035bda74b");
	self.weapon_stowed = undefined;
	self clearstowedweapon();
}

/*
	Name: suppress_stowed_weapon
	Namespace: zm_weapons
	Checksum: 0xBFA5D16F
	Offset: 0x9B20
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function suppress_stowed_weapon(onoff)
{
	self.stowed_weapon_suppressed = onoff;
	if(onoff || !isdefined(self.weapon_stowed))
	{
		self clearstowedweapon();
	}
	else
	{
		self setstowedweapon(self.weapon_stowed);
	}
}

/*
	Name: checkstringvalid
	Namespace: zm_weapons
	Checksum: 0x6F478775
	Offset: 0x9B98
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function checkstringvalid(var_f5bc27b5)
{
	if(var_f5bc27b5 != "")
	{
		return var_f5bc27b5;
	}
	return undefined;
}

/*
	Name: load_weapon_spec_from_table
	Namespace: zm_weapons
	Checksum: 0xEDCDF80E
	Offset: 0x9BC8
	Size: 0x52A
	Parameters: 2
	Flags: Linked
*/
function load_weapon_spec_from_table(table, first_row)
{
	gametype = util::get_game_type();
	index = first_row;
	row = tablelookuprow(table, index);
	while(isdefined(row))
	{
		weapon_name = checkstringvalid(row[0]);
		if(isinarray(level.var_c60359dc, weapon_name))
		{
			index++;
			row = tablelookuprow(table, index);
			continue;
		}
		if(!isdefined(level.var_c60359dc))
		{
			level.var_c60359dc = [];
		}
		else if(!isarray(level.var_c60359dc))
		{
			level.var_c60359dc = array(level.var_c60359dc);
		}
		level.var_c60359dc[level.var_c60359dc.size] = weapon_name;
		upgrade_name = checkstringvalid(row[1]);
		is_ee = row[2];
		cost = row[3];
		weaponvo = checkstringvalid(row[4]);
		weaponvoresp = checkstringvalid(row[5]);
		ammo_cost = row[6];
		create_vox = row[7];
		is_zcleansed = row[8];
		in_box = row[9];
		upgrade_in_box = row[10];
		is_limited = row[11];
		var_ddca6652 = row[17];
		limit = row[12];
		upgrade_limit = row[13];
		content_restrict = row[14];
		wallbuy_autospawn = row[15];
		weapon_class = checkstringvalid(row[16]);
		is_wonder_weapon = row[18];
		tier = row[19];
		element = row[20];
		if(is_true(wallbuy_autospawn))
		{
			if(!isdefined(level.var_8e3edeb9))
			{
				level.var_8e3edeb9 = [];
			}
			else if(!isarray(level.var_8e3edeb9))
			{
				level.var_8e3edeb9 = array(level.var_8e3edeb9);
			}
			if(!isinarray(level.var_8e3edeb9, weapon_name))
			{
				level.var_8e3edeb9[level.var_8e3edeb9.size] = weapon_name;
			}
		}
		zm_utility::include_weapon(weapon_name, in_box);
		if(isdefined(upgrade_name))
		{
			zm_utility::include_weapon(upgrade_name, upgrade_in_box);
		}
		add_zombie_weapon(weapon_name, upgrade_name, is_ee, cost, weaponvo, weaponvoresp, ammo_cost, create_vox, weapon_class, is_wonder_weapon, tier, in_box, element);
		if(is_limited)
		{
			if(isdefined(limit))
			{
				add_limited_weapon(weapon_name, limit);
			}
			if(isdefined(upgrade_limit) && isdefined(upgrade_name))
			{
				add_limited_weapon(upgrade_name, upgrade_limit);
			}
		}
		if(!var_ddca6652 && weapon_class !== "equipment")
		{
			aat::register_aat_exemption(getweapon(weapon_name));
			if(isdefined(upgrade_name))
			{
				aat::register_aat_exemption(getweapon(upgrade_name));
			}
		}
		index++;
		row = tablelookuprow(table, index);
	}
}

/*
	Name: is_wonder_weapon
	Namespace: zm_weapons
	Checksum: 0xF5EB4612
	Offset: 0xA100
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function is_wonder_weapon(w_to_check)
{
	w_base = get_base_weapon(w_to_check);
	if(isdefined(level.zombie_weapons[w_base]) && level.zombie_weapons[w_base].is_wonder_weapon)
	{
		return true;
	}
	return false;
}

/*
	Name: is_tactical_rifle
	Namespace: zm_weapons
	Checksum: 0x1D1EF5DA
	Offset: 0xA170
	Size: 0xFE
	Parameters: 1
	Flags: Linked
*/
function is_tactical_rifle(w_to_check)
{
	var_6351a511 = array(getweapon(#"tr_longburst_t9"), getweapon(#"tr_damagesemi_t9"), getweapon(#"tr_fastburst_t9"), getweapon(#"tr_powerburst_t9"), getweapon(#"tr_precisionsemi_t9"));
	w_to_check = get_base_weapon(w_to_check);
	if(isinarray(var_6351a511, w_to_check))
	{
		return true;
	}
	return false;
}

/*
	Name: is_explosive_weapon
	Namespace: zm_weapons
	Checksum: 0xF3DFB516
	Offset: 0xA278
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function is_explosive_weapon(weapon)
{
	if(weapon.explosioninnerdamage > 0 || weapon.explosionouterdamage > 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_f5a0899d
	Namespace: zm_weapons
	Checksum: 0x2635294E
	Offset: 0xA2B8
	Size: 0x96
	Parameters: 2
	Flags: Linked
*/
function function_f5a0899d(weapon, var_d921715f)
{
	if(!isdefined(var_d921715f))
	{
		var_d921715f = 1;
	}
	if(isdefined(weapon))
	{
		if(!var_d921715f && is_wonder_weapon(weapon))
		{
			return false;
		}
		var_3ba4bf7d = self getweaponslistprimaries();
		if(isinarray(var_3ba4bf7d, weapon))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_7c5dd4bd
	Namespace: zm_weapons
	Checksum: 0xB43039A
	Offset: 0xA358
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_7c5dd4bd(w_weapon)
{
	if(zm_loadout::function_2ff6913(w_weapon))
	{
		return;
	}
	if(!self hasweapon(w_weapon))
	{
		return;
	}
	self setweaponammoclip(w_weapon, w_weapon.clipsize);
	self notify(#"hash_278526d0bbdb4ce7");
	if(zm_trial_reset_loadout::is_active(1))
	{
		self function_7f7c1226(w_weapon);
		return;
	}
	if(self hasperk(#"specialty_extraammo"))
	{
		self givemaxammo(w_weapon);
	}
	else
	{
		self givestartammo(w_weapon);
	}
}

/*
	Name: function_51aa5813
	Namespace: zm_weapons
	Checksum: 0xCB58F6D9
	Offset: 0xA458
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function function_51aa5813(n_slot)
{
	if(isdefined(n_slot))
	{
		weapon = self namespace_a0d533d1::function_2b83d3ff(self item_inventory::function_2e711614(n_slot));
		if(isdefined(weapon) && self hasweapon(weapon))
		{
			if(weapon != level.weaponnone && weapon != level.weaponbasemeleeheld)
			{
				self setweaponammoclip(weapon, weapon.clipsize);
				maxammo = weapon.maxammo;
				self setweaponammostock(weapon, maxammo);
				if(is_true(weapon.isdualwield) && isdefined(weapon.dualwieldweapon) && weapon.dualwieldweapon != level.weaponnone)
				{
					self setweaponammoclip(weapon.dualwieldweapon, weapon.dualwieldweapon.clipsize);
				}
			}
		}
	}
}

/*
	Name: function_7f7c1226
	Namespace: zm_weapons
	Checksum: 0xFE7AE19F
	Offset: 0xA5B8
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7f7c1226(weapon)
{
	waittillframeend();
	if(is_true(weapon.isriotshield))
	{
		n_stock = weapon.clipsize;
	}
	else
	{
		n_stock = 0;
	}
	self setweaponammostock(weapon, n_stock);
}

/*
	Name: function_ed29dde5
	Namespace: zm_weapons
	Checksum: 0x904073E1
	Offset: 0xA628
	Size: 0x53A
	Parameters: 3
	Flags: None
*/
function function_ed29dde5(var_947d01ee, var_ccd1bc81, var_609a8d33)
{
	if(!isdefined(var_ccd1bc81))
	{
		var_ccd1bc81 = 0;
	}
	if(!isdefined(var_609a8d33))
	{
		var_609a8d33 = 0;
	}
	a_weapons = [];
	foreach(s_weapon in level.zombie_weapons)
	{
		if(s_weapon.weapon_classname === var_947d01ee)
		{
			if(var_609a8d33)
			{
				if(!isdefined(a_weapons))
				{
					a_weapons = [];
				}
				else if(!isarray(a_weapons))
				{
					a_weapons = array(a_weapons);
				}
				a_weapons[a_weapons.size] = s_weapon.weapon.name;
			}
			else
			{
				if(!isdefined(a_weapons))
				{
					a_weapons = [];
				}
				else if(!isarray(a_weapons))
				{
					a_weapons = array(a_weapons);
				}
				a_weapons[a_weapons.size] = s_weapon.weapon;
			}
			if(var_ccd1bc81)
			{
				if(var_609a8d33)
				{
					if(!isdefined(a_weapons))
					{
						a_weapons = [];
					}
					else if(!isarray(a_weapons))
					{
						a_weapons = array(a_weapons);
					}
					a_weapons[a_weapons.size] = s_weapon.upgrade.name;
				}
				else
				{
					if(!isdefined(a_weapons))
					{
						a_weapons = [];
					}
					else if(!isarray(a_weapons))
					{
						a_weapons = array(a_weapons);
					}
					a_weapons[a_weapons.size] = s_weapon.upgrade;
				}
			}
		}
		if(s_weapon.weapon_classname === "shield" && var_947d01ee != "shield")
		{
			if(s_weapon.weapon.weapclass === var_947d01ee)
			{
				if(var_609a8d33)
				{
					if(!isdefined(a_weapons))
					{
						a_weapons = [];
					}
					else if(!isarray(a_weapons))
					{
						a_weapons = array(a_weapons);
					}
					a_weapons[a_weapons.size] = s_weapon.weapon.name;
					if(s_weapon.weapon.dualwieldweapon != level.weaponnone)
					{
						if(!isdefined(a_weapons))
						{
							a_weapons = [];
						}
						else if(!isarray(a_weapons))
						{
							a_weapons = array(a_weapons);
						}
						a_weapons[a_weapons.size] = s_weapon.weapon.dualwieldweapon.name;
					}
				}
				else
				{
					if(!isdefined(a_weapons))
					{
						a_weapons = [];
					}
					else if(!isarray(a_weapons))
					{
						a_weapons = array(a_weapons);
					}
					a_weapons[a_weapons.size] = s_weapon.weapon;
					if(s_weapon.weapon.dualwieldweapon != level.weaponnone)
					{
						if(!isdefined(a_weapons))
						{
							a_weapons = [];
						}
						else if(!isarray(a_weapons))
						{
							a_weapons = array(a_weapons);
						}
						a_weapons[a_weapons.size] = s_weapon.weapon.dualwieldweapon;
					}
				}
			}
			if(s_weapon.weapon.altweapon.weapclass === var_947d01ee)
			{
				if(var_609a8d33)
				{
					if(!isdefined(a_weapons))
					{
						a_weapons = [];
					}
					else if(!isarray(a_weapons))
					{
						a_weapons = array(a_weapons);
					}
					a_weapons[a_weapons.size] = s_weapon.weapon.altweapon.name;
					continue;
				}
				if(!isdefined(a_weapons))
				{
					a_weapons = [];
				}
				else if(!isarray(a_weapons))
				{
					a_weapons = array(a_weapons);
				}
				a_weapons[a_weapons.size] = s_weapon.weapon.altweapon;
			}
		}
	}
	return a_weapons;
}

/*
	Name: on_item_pickup
	Namespace: zm_weapons
	Checksum: 0x2D526210
	Offset: 0xAB70
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function on_item_pickup(params)
{
	self endon(#"death");
	item = params.item;
	if(isplayer(self) && isdefined(item) && item.var_a6762160.itemtype == #"weapon")
	{
		weapon = namespace_a0d533d1::function_2b83d3ff(item);
		if(isdefined(item) && isdefined(weapon))
		{
			weapon = weapon.rootweapon;
			if(isdefined(item.var_a8bccf69))
			{
				inventoryitem = item_inventory::get_inventory_item(item.var_bd027dd9);
				inventoryitem.var_a8bccf69 = item.var_a8bccf69;
				self item_inventory::function_d92c6b5b(undefined, undefined, item.var_a8bccf69);
			}
			if(isdefined(item.aat))
			{
				inventoryitem = item_inventory::get_inventory_item(item.var_bd027dd9);
				self item_inventory::function_b579540e(inventoryitem, item.aat);
				self function_e1fd87b0(weapon, item.aat);
			}
			else
			{
				self function_51897592(weapon);
			}
		}
	}
}

/*
	Name: on_weapon_change
	Namespace: zm_weapons
	Checksum: 0xCF8C2D94
	Offset: 0xAD28
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function on_weapon_change(params)
{
	self endon(#"disconnect");
	weapon = params.weapon;
	if(weapon === level.weaponnone)
	{
		return;
	}
	waitframe(1);
	var_bd027dd9 = self item_inventory::function_ec087745();
	if(var_bd027dd9 != 32767)
	{
		item = self item_inventory::get_inventory_item(var_bd027dd9);
		if(isdefined(item))
		{
			if(isdefined(item.aat))
			{
				self function_e1fd87b0(weapon, item.aat);
			}
			else
			{
				self function_51897592(weapon);
			}
		}
	}
}

/*
	Name: function_89e5e7dd
	Namespace: zm_weapons
	Checksum: 0xBCF3A0CF
	Offset: 0xAE20
	Size: 0x206
	Parameters: 1
	Flags: Linked
*/
function function_89e5e7dd(var_d393ba53)
{
	switch(var_d393ba53)
	{
		case "ammomod_napalmburst":
		{
			if(!is_true(getgametypesetting(#"hash_10de3b1cea667398")))
			{
				return false;
			}
			break;
		}
		case "ammomod_cryofreeze":
		{
			if(!is_true(getgametypesetting(#"hash_54537cc749c2001d")))
			{
				return false;
			}
			break;
		}
		case "ammomod_brainrot":
		{
			if(!is_true(getgametypesetting(#"hash_7ead02dd6721f46a")))
			{
				return false;
			}
			break;
		}
		case "ammomod_deadwire":
		{
			if(!is_true(getgametypesetting(#"hash_66cad2a554f4d928")))
			{
				return false;
			}
			break;
		}
		case "ammomod_electriccherry":
		{
			if(!is_true(getgametypesetting(#"hash_87dd6c14b668b1d")))
			{
				return false;
			}
			break;
		}
		case "ammomod_shatterblast":
		{
			if(!is_true(getgametypesetting(#"hash_2537d92585f4fce2")))
			{
				return false;
			}
			break;
		}
	}
	return true;
}

/*
	Name: function_37e9e0cb
	Namespace: zm_weapons
	Checksum: 0x1B09F3DD
	Offset: 0xB030
	Size: 0x13C
	Parameters: 4
	Flags: Linked
*/
function function_37e9e0cb(item, weapon, aat_name, var_9f36d483)
{
	if(!isdefined(var_9f36d483))
	{
		var_9f36d483 = 1;
	}
	var_4f0c684c = zm_aat::function_296cde87(aat_name);
	if(function_89e5e7dd(var_4f0c684c))
	{
		self notify(#"hash_30e4242806b5da87");
		self item_inventory::function_b579540e(item, aat_name);
		self function_e1fd87b0(weapon, aat_name);
		if(is_true(var_9f36d483) && isdefined(level.aat[self.aat[weapon]].var_68a3f665))
		{
			level thread popups::displayteammessagetoteam(level.aat[self.aat[weapon]].var_68a3f665, self, self.team, weapon.displayname);
		}
	}
}

/*
	Name: function_e1fd87b0
	Namespace: zm_weapons
	Checksum: 0xF3449496
	Offset: 0xB178
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_e1fd87b0(weapon, aat_name)
{
	if(isdefined(weapon) && !aat::is_exempt_weapon(weapon) && weapon != level.weaponnone)
	{
		self aat::acquire(weapon, aat_name);
	}
}

/*
	Name: function_51897592
	Namespace: zm_weapons
	Checksum: 0x6E5665
	Offset: 0xB1F0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_51897592(weapon)
{
	if(self aat::has_aat(weapon))
	{
		self aat::remove(weapon);
	}
}

/*
	Name: function_896671d5
	Namespace: zm_weapons
	Checksum: 0xCD7CF926
	Offset: 0xB238
	Size: 0x5E
	Parameters: 2
	Flags: Linked
*/
function function_896671d5(weapon, var_a8bccf69)
{
	switch(var_a8bccf69)
	{
		case 2:
		{
			return weapon.var_40134867;
		}
		case 3:
		{
			return weapon.var_3267ad10;
		}
	}
	return 1;
}

/*
	Name: function_d85e6c3a
	Namespace: zm_weapons
	Checksum: 0x7FFB9C0D
	Offset: 0xB2A0
	Size: 0x15E
	Parameters: 1
	Flags: Linked
*/
function function_d85e6c3a(var_a6762160)
{
	var_bc61fcdc = "none";
	if(isdefined(var_a6762160.rarity))
	{
		var_bc61fcdc = var_a6762160.rarity;
	}
	switch(var_bc61fcdc)
	{
		case "uncommon":
		{
			if(isdefined(var_a6762160.weapon.var_f9a85dad))
			{
				return var_a6762160.weapon.var_f9a85dad;
			}
			break;
		}
		case "rare":
		{
			if(isdefined(var_a6762160.weapon.var_7993dd86))
			{
				return var_a6762160.weapon.var_7993dd86;
			}
			break;
		}
		case "epic":
		{
			if(isdefined(var_a6762160.weapon.var_2751b903))
			{
				return var_a6762160.weapon.var_2751b903;
			}
			break;
		}
		case "ultra":
		case "legendary":
		{
			if(isdefined(var_a6762160.weapon.var_3d17e48f))
			{
				return var_a6762160.weapon.var_3d17e48f;
			}
			break;
		}
	}
	return 1;
}

/*
	Name: function_f066796f
	Namespace: zm_weapons
	Checksum: 0xB36F82D1
	Offset: 0xB408
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function function_f066796f(weapon)
{
	if(isdefined(weapon) && isdefined(level.zombie_weapons[weapon]))
	{
		return level.zombie_weapons[weapon].element;
	}
}

/*
	Name: function_90953640
	Namespace: zm_weapons
	Checksum: 0x448667DC
	Offset: 0xB450
	Size: 0x174
	Parameters: 4
	Flags: Linked
*/
function function_90953640(weapon, var_d792c587, update_rate, per_player)
{
	if(!isdefined(var_d792c587))
	{
		var_d792c587 = 1;
	}
	if(!isdefined(update_rate))
	{
		update_rate = float(function_60d95f53()) / 1000;
	}
	if(!isdefined(per_player))
	{
		per_player = 0;
	}
	if(!isdefined(weapon) || (isdefined(weapon) && isdefined(level.var_6476d5c6[weapon])))
	{
		return;
	}
	if(per_player)
	{
		for(clientnum = 0; clientnum < 5; clientnum++)
		{
			level.var_6476d5c6[weapon][clientnum] = new class_c6c0e94();
			[[ level.var_6476d5c6[weapon][clientnum] ]]->initialize(weapon.name + clientnum, var_d792c587, update_rate);
		}
	}
	else
	{
		level.var_6476d5c6[weapon] = new class_c6c0e94();
		[[ level.var_6476d5c6[weapon] ]]->initialize(weapon.name, var_d792c587, update_rate);
	}
}

/*
	Name: function_a76ab7f7
	Namespace: zm_weapons
	Checksum: 0xE2E89556
	Offset: 0xB5D0
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_a76ab7f7(var_98a67ca5, attacker)
{
	if(isclass(level.var_6476d5c6[var_98a67ca5]))
	{
		[[ level.var_6476d5c6[var_98a67ca5] ]]->waitinqueue({});
	}
	else if(isplayer(attacker))
	{
		[[ level.var_6476d5c6[var_98a67ca5][attacker getentitynumber()] ]]->waitinqueue({});
	}
}

/*
	Name: function_8a74b35c
	Namespace: zm_weapons
	Checksum: 0xE966620D
	Offset: 0xB678
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_8a74b35c(weapon)
{
	if(!isdefined(weapon) || (isdefined(weapon) && isdefined(level.var_b6bda274[weapon])))
	{
		return;
	}
	if(!isdefined(level.var_1d1a594e))
	{
		level.var_1d1a594e = [];
	}
	level.var_b6bda274[weapon] = 1;
}

/*
	Name: function_be9d79c3
	Namespace: zm_weapons
	Checksum: 0xB443553D
	Offset: 0xB6E8
	Size: 0x20
	Parameters: 1
	Flags: Linked
*/
function function_be9d79c3(weapon)
{
	level.var_f96e7a56[weapon] = 1;
}

/*
	Name: function_404c3ad5
	Namespace: zm_weapons
	Checksum: 0x4F3E1A26
	Offset: 0xB710
	Size: 0xB2
	Parameters: 2
	Flags: Linked
*/
function function_404c3ad5(weapon, callback)
{
	if(!isdefined(level.var_60387857[weapon]))
	{
		level.var_60387857[weapon] = [];
	}
	else if(!isarray(level.var_60387857[weapon]))
	{
		level.var_60387857[weapon] = array(level.var_60387857[weapon]);
	}
	level.var_60387857[weapon][level.var_60387857[weapon].size] = callback;
}

/*
	Name: function_c69910e2
	Namespace: zm_weapons
	Checksum: 0x5D783BC4
	Offset: 0xB7D0
	Size: 0xDA
	Parameters: 2
	Flags: Linked
*/
function function_c69910e2(weapon_name, rarity)
{
	switch(weapon_name)
	{
		case "pistol_burst_t9":
		{
			item_name = level.var_29d88fe5[#"hash_58befc4946435f61"][rarity];
			return item_name;
			break;
		}
		case "pistol_revolver_t9":
		{
			item_name = level.var_29d88fe5[#"hash_1344474ed307e50e"][rarity];
			return item_name;
			break;
		}
		case "pistol_semiauto_t9":
		{
			item_name = level.var_29d88fe5[#"hash_3f4901eae349fa30"][rarity];
			return item_name;
			break;
		}
	}
}

/*
	Name: function_800654fc
	Namespace: zm_weapons
	Checksum: 0x589183EF
	Offset: 0xB8B8
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_800654fc()
{
	/#
		level endon(#"game_ended");
		setdvar(#"hash_330b694bb1fc946f", "");
		adddebugcommand(("" + function_9e72a96(#"hash_79d7d5e206eaf770")) + "");
		function_cd140ee9(#"hash_330b694bb1fc946f", &function_8610a5cc);
	#/
}

/*
	Name: function_8610a5cc
	Namespace: zm_weapons
	Checksum: 0x5000E87C
	Offset: 0xB978
	Size: 0x144
	Parameters: 1
	Flags: None
*/
function function_8610a5cc(params)
{
	/#
		self notify("");
		self endon("");
		waitframe(1);
		foreach(player in getplayers())
		{
			if(params.name === #"hash_330b694bb1fc946f")
			{
				item = function_4ba8fde(hash(params.value));
				if(isdefined(item))
				{
					player function_98776900(item);
				}
			}
		}
		setdvar(#"hash_330b694bb1fc946f", "");
	#/
}

