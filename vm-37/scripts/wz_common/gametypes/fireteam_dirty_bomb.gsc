#using script_4ba46a0f73534383;
#using script_4e6bcfa8856b2a96;
#using scripts\wz_common\wz_rat.gsc;
#using script_b9a55edd207e4ca;
#using script_46192c58ea066d7f;
#using script_167b322dbacbc3f5;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\laststand.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\util_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using script_335d0650ed05d36d;
#using scripts\core_common\scoreevents_shared.gsc;
#using script_1f41849126bfc83d;
#using script_26187575f84f8d07;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using script_471b31bd963b388e;
#using script_4108035fe400ce67;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace fireteam_dirty_bomb;

/*
	Name: __init__system__
	Namespace: fireteam_dirty_bomb
	Checksum: 0x8EA177B1
	Offset: 0x678
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_16dead24d6def3d5", &function_62730899, undefined, undefined, #"territory");
}

/*
	Name: main
	Namespace: fireteam_dirty_bomb
	Checksum: 0x2AEB4FAD
	Offset: 0x6C8
	Size: 0xEBC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	if(!namespace_681edb36::function_23dd41e7())
	{
		return;
	}
	setdvar(#"scr_maxinventory_scorestreaks", 1);
	level.var_e2636f91 = 0;
	namespace_2938acdc::init();
	namespace_234f0efc::init();
	spawning::addsupportedspawnpointtype("tdm");
	level.onstartgametype = &onstartgametype;
	callback::on_spawned(&onplayerspawned);
	callback::on_player_killed(&on_player_killed);
	level callback::add_callback(#"hash_259e3bcba73a2f14", &function_c0e544cc);
	laststand_mp::function_367cfa1b(&function_95002a59);
	player::function_3c5cc656(&function_610d3790);
	clientfield::register("toplayer", "using_bomb", 1, 2, "int");
	clientfield::register_clientuimodel("hudItems.uraniumCarryCount", 1, 4, "int");
	clientfield::register_clientuimodel("hudItems.uraniumMaxCarry", 1, 4, "int");
	clientfield::register_clientuimodel("hudItems.uraniumFullCarry", 1, 1, "int");
	clientfield::register_clientuimodel("hudItems.radiationVestHealth", 1, 5, "float");
	clientfield::register("toplayer", "ftdb_inZone", 1, 1, "int");
	clientfield::register("allplayers", "carryingUranium", 1, 1, "int");
	clientfield::register("scriptmover", "bombsound", 1, 1, "int");
	clientfield::register("scriptmover", "zoneNearOOB", 1, 1, "int");
	clientfield::function_5b7d846d("hud_items_dirty_bomb.bomb_respawn_disabled", 1, 1, "int");
	laststand_mp::function_eb8c0e47(&function_114f1da7);
	level.var_574cc797 = &function_588a586d;
	level.can_revive = &canrevive;
	level.var_64731636 = dirtybomb_usebar::register();
	level.var_b7821ed9 = &function_b7821ed9;
	level.var_82b353bf = &function_82b353bf;
	level.var_34842a14 = 1;
	level.var_ce802423 = 1;
	level.var_38743886 = &function_d7cf81e;
	level.var_2064692e = (isdefined(getgametypesetting(#"hash_2c23b61a946618e5", 0)) ? getgametypesetting(#"hash_2c23b61a946618e5", 0) : 0);
	level.var_96cdb906 = (isdefined(getgametypesetting(#"hash_78b20ae470a01292")) ? getgametypesetting(#"hash_78b20ae470a01292") : 0);
	level.var_73871ea9 = (isdefined(getgametypesetting(#"hash_5e81c41c0b8501db")) ? getgametypesetting(#"hash_5e81c41c0b8501db") : 0);
	level.var_12ff620b = (isdefined(getgametypesetting(#"hash_5427188d61d31f49")) ? getgametypesetting(#"hash_5427188d61d31f49") : 0);
	level.var_26c7635a = (isdefined(getgametypesetting(#"hash_2eae1dd81a5d55d6")) ? getgametypesetting(#"hash_2eae1dd81a5d55d6") : 0);
	level.var_5a7ddc70 = (isdefined(getgametypesetting(#"hash_6b7a67833a5d1ece")) ? getgametypesetting(#"hash_6b7a67833a5d1ece") : 0);
	level.var_3990ce92 = (isdefined(getgametypesetting(#"hash_3ca893637b9e53ce")) ? getgametypesetting(#"hash_3ca893637b9e53ce") : 0);
	level.var_932f538d = (isdefined(getgametypesetting(#"hash_2298689819f46c81")) ? getgametypesetting(#"hash_2298689819f46c81") : 0);
	level.var_e39b6425 = (isdefined(getgametypesetting(#"hash_5e96d382e9e9c267")) ? getgametypesetting(#"hash_5e96d382e9e9c267") : 0);
	level.var_4e3c4685 = (isdefined(getgametypesetting(#"hash_2115537cc1f85d3c")) ? getgametypesetting(#"hash_2115537cc1f85d3c") : 0);
	level.var_b06a1891 = (isdefined(getgametypesetting(#"hash_448f94b2a3abdbb9")) ? getgametypesetting(#"hash_448f94b2a3abdbb9") : 0);
	level.var_f4a1440c = (isdefined(getgametypesetting(#"hash_f9fc752cf48653")) ? getgametypesetting(#"hash_f9fc752cf48653") : 0);
	level.var_46f2c796 = (isdefined(getgametypesetting(#"hash_982be25d9d36fcb")) ? getgametypesetting(#"hash_982be25d9d36fcb") : 0);
	level.var_451f847f = (isdefined(getgametypesetting(#"hash_26632e4a6a693312")) ? getgametypesetting(#"hash_26632e4a6a693312") : 0);
	level.var_d86d5820 = (isdefined(getgametypesetting(#"hash_78f99a9c357836ba")) ? getgametypesetting(#"hash_78f99a9c357836ba") : 0);
	level.var_60693fca = (isdefined(getgametypesetting(#"hash_37aefeabeef0ec6c")) ? getgametypesetting(#"hash_37aefeabeef0ec6c") : 0) * 100;
	level.var_60e3f99c = 99999;
	level.var_77720414 = (isdefined(getgametypesetting(#"hash_2778e754fc66aac")) ? getgametypesetting(#"hash_2778e754fc66aac") : 0);
	level.var_e65e9422 = (isdefined(getgametypesetting(#"hash_540ba194e715168b")) ? getgametypesetting(#"hash_540ba194e715168b") : 0);
	level.var_5f31e806 = (isdefined(getgametypesetting(#"hash_3c99ef02f267efaf")) ? getgametypesetting(#"hash_3c99ef02f267efaf") : 1);
	level.var_c836026 = (isdefined(getgametypesetting(#"hash_3c7edd02f2510961")) ? getgametypesetting(#"hash_3c7edd02f2510961") : 5);
	level.var_3a9e7236 = is_true(getgametypesetting(#"hash_301e41804f45eb50"));
	level.var_696298a2 = getweapon(#"hash_46cc133cf4065ae0");
	level.var_b9f31e66 = (isdefined(getgametypesetting(#"hash_3eeecb0a77c21db1")) ? getgametypesetting(#"hash_3eeecb0a77c21db1") : 100);
	level.var_8c05a764 = (isdefined(getgametypesetting(#"hash_2e824e2ee213574d")) ? getgametypesetting(#"hash_2e824e2ee213574d") : 10);
	level.var_89a6bd00 = (isdefined(getgametypesetting(#"hash_7b5af9a43263b4a9")) ? getgametypesetting(#"hash_7b5af9a43263b4a9") : 15);
	level.var_65a0fe4d = (isdefined(getgametypesetting(#"hash_7b3feba4324cd527")) ? getgametypesetting(#"hash_7b3feba4324cd527") : 30);
	namespace_b77e8eb1::init(&function_277ec378, &function_334e317);
	namespace_681edb36::function_dd83b835();
	level thread function_afa7ee8d();
	item_world::function_861f348d(#"hash_75a7db904ba5faed", &function_18f58ab2);
	level.var_d539e0dd = &function_3f63e44f;
	level.var_c3a003ad = &function_ce3288cf;
	level.var_2f418a15 = [];
	level.var_910f361c = [];
	level.var_d8fd137b = [];
	level.var_d8fd137b[0] = #"hash_2854f6c09dd9a316";
	level.var_d8fd137b[1] = #"hash_2854f5c09dd9a163";
	level.var_d8fd137b[2] = #"hash_2854f4c09dd99fb0";
	level.var_d8fd137b[3] = #"hash_2854fbc09dd9ab95";
	level.var_d8fd137b[4] = #"hash_2854fac09dd9a9e2";
	/#
		if(getdvarint(#"hash_74074ce39d0658e7", 0))
		{
			level.var_12ff620b = 0;
			level.var_26c7635a = 3;
			level.var_3990ce92 = 1;
			level.var_932f538d = 1;
			level.var_e39b6425 = 3;
			level.var_b06a1891 = 5;
			level.var_f4a1440c = 5;
			level.var_46f2c796 = 3;
			level.var_7108bd31 = 15;
			level.var_c0839e43 = 1;
			level.var_de7aa071 = 5;
		}
	#/
}

/*
	Name: function_d7cf81e
	Namespace: fireteam_dirty_bomb
	Checksum: 0xB5299815
	Offset: 0x1590
	Size: 0x2DC
	Parameters: 2
	Flags: Private
*/
function private function_d7cf81e(targetplayer, &points)
{
	if(level.var_2f418a15.size <= 0)
	{
		return points;
	}
	if(points.size <= 0)
	{
		return points;
	}
	var_dcb6be80 = sqr(level.var_60693fca);
	var_f0c5590a = sqr(level.var_60693fca + 7500);
	var_3e6f2c1b = [];
	validpoints = [];
	var_4f2a097f = 0;
	var_f74183d3 = points[0];
	foreach(bomb in level.var_2f418a15)
	{
		if(bomb.state !== 5)
		{
			continue;
		}
		if(distance2dsquared(targetplayer.origin, bomb.origin) > var_f0c5590a)
		{
			continue;
		}
		var_3e6f2c1b[var_3e6f2c1b.size] = bomb.origin;
	}
	if(var_3e6f2c1b.size <= 0)
	{
		return points;
	}
	for(index = 0; index < points.size; index++)
	{
		point = points[index];
		foreach(bomborigin in var_3e6f2c1b)
		{
			var_b334ce28 = distance2dsquared(point, bomborigin);
			if(var_b334ce28 > var_4f2a097f)
			{
				var_4f2a097f = var_b334ce28;
				var_f74183d3 = point;
			}
			if(var_b334ce28 > var_dcb6be80)
			{
				validpoints[validpoints.size] = point;
			}
		}
	}
	if(validpoints.size <= 0)
	{
		/#
			assert(isvec(var_f74183d3));
		#/
		validpoints[validpoints.size] = var_f74183d3;
	}
	return validpoints;
}

/*
	Name: function_114f1da7
	Namespace: fireteam_dirty_bomb
	Checksum: 0x2DE9AF3B
	Offset: 0x1878
	Size: 0x46
	Parameters: 2
	Flags: Private
*/
function private function_114f1da7(revivee, reviver)
{
	if(isplayer(reviver))
	{
		reviver.var_c83d0859 = undefined;
		reviver.var_1eaa0d81 = undefined;
	}
}

/*
	Name: function_ce3288cf
	Namespace: fireteam_dirty_bomb
	Checksum: 0x5BB6333F
	Offset: 0x18C8
	Size: 0x148
	Parameters: 1
	Flags: Private
*/
function private function_ce3288cf(damage)
{
	if(!isplayer(self))
	{
		return damage;
	}
	if(self.var_1181c08b <= 0)
	{
		return damage;
	}
	var_babbb09b = 0;
	var_e67d2721 = damage - self.var_dba54111;
	if(var_e67d2721 < 0)
	{
		var_e67d2721 = 0;
	}
	self.var_1181c08b = self.var_1181c08b - var_e67d2721;
	if(self.var_1181c08b < 0)
	{
		var_babbb09b = self.var_1181c08b;
	}
	self.var_1181c08b = max(self.var_1181c08b, 0);
	if(self.var_1181c08b == 0)
	{
		self.var_dba54111 = 0;
		self.var_4a1cb171 = 0;
	}
	var_db01f8df = (self.var_4a1cb171 <= 0 ? 0 : self.var_1181c08b / self.var_4a1cb171);
	self clientfield::set_player_uimodel("hudItems.radiationVestHealth", var_db01f8df);
	return var_babbb09b;
}

/*
	Name: function_ec3e7325
	Namespace: fireteam_dirty_bomb
	Checksum: 0xA50D453E
	Offset: 0x1A18
	Size: 0x52
	Parameters: 1
	Flags: Private
*/
function private function_ec3e7325(player)
{
	/#
		assert(isplayer(player));
	#/
	return player clientfield::get_player_uimodel("hudItems.uraniumMaxCarry");
}

/*
	Name: function_cc2c46fd
	Namespace: fireteam_dirty_bomb
	Checksum: 0xA9B7D228
	Offset: 0x1A78
	Size: 0x58
	Parameters: 1
	Flags: Private
*/
function private function_cc2c46fd(player)
{
	/#
		assert(isplayer(player));
	#/
	return player clientfield::get_player_uimodel("hudItems.uraniumMaxCarry") == 10;
}

/*
	Name: function_30dc869f
	Namespace: fireteam_dirty_bomb
	Checksum: 0x55FDBDB2
	Offset: 0x1AD8
	Size: 0x56
	Parameters: 1
	Flags: Private
*/
function private function_30dc869f(player)
{
	/#
		assert(isplayer(player));
	#/
	return player clientfield::get_player_uimodel("hudItems.radiationVestHealth") > 0;
}

/*
	Name: function_61053367
	Namespace: fireteam_dirty_bomb
	Checksum: 0x3B972015
	Offset: 0x1B38
	Size: 0x58
	Parameters: 1
	Flags: Private
*/
function private function_61053367(player)
{
	/#
		assert(isplayer(player));
	#/
	return player clientfield::get_player_uimodel("hudItems.radiationVestHealth") >= 1;
}

/*
	Name: function_523bd02
	Namespace: fireteam_dirty_bomb
	Checksum: 0xCDBC6858
	Offset: 0x1B98
	Size: 0x134
	Parameters: 1
	Flags: Private
*/
function private function_523bd02(canpickup)
{
	/#
		assert(isplayer(self));
	#/
	if(!isplayer(self))
	{
		return;
	}
	if(!isalive(self))
	{
		return;
	}
	if(canpickup)
	{
		self clientfield::set_player_uimodel("hudItems.uraniumFullCarry", 0);
		return;
	}
	if(isdefined(self.var_48c5e502) && self.var_48c5e502 > gettime())
	{
		return;
	}
	self.var_48c5e502 = gettime() + (int(4 * 1000));
	self clientfield::set_player_uimodel("hudItems.uraniumFullCarry", 1);
	wait(2);
	if(isplayer(self))
	{
		self clientfield::set_player_uimodel("hudItems.uraniumFullCarry", 0);
	}
}

/*
	Name: function_3f63e44f
	Namespace: fireteam_dirty_bomb
	Checksum: 0x819CDE21
	Offset: 0x1CD8
	Size: 0x2F4
	Parameters: 1
	Flags: Private
*/
function private function_3f63e44f(item)
{
	/#
		assert(isdefined(item));
	#/
	/#
		assert(isdefined(item.var_a6762160));
	#/
	if(item.var_a6762160.itemtype == #"generic")
	{
		switch(item.var_a6762160.name)
		{
			case "uranium_item_t9":
			{
				var_e3483afe = self clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
				canpickup = function_ec3e7325(self) > var_e3483afe;
				self thread function_523bd02(canpickup);
				return canpickup;
				break;
			}
			case "uranium_pouch_item_t9":
			{
				return !function_cc2c46fd(self);
				break;
			}
			case "armor_pouch_item_t9":
			{
				return !namespace_234f0efc::function_d912fa6e(self);
				break;
			}
			case "hash_583f1687cefbd3f3":
			{
				return !function_61053367(self);
			}
			default:
			{
				return 0;
			}
		}
	}
	else
	{
		if(item.var_a6762160.itemtype == #"scorestreak")
		{
			if(is_true(self.selectinglocation))
			{
				return 0;
			}
			weapons = self getweaponslist();
			foreach(weapon in weapons)
			{
				var_16f12c31 = item_world_util::function_3531b9ba(weapon.name);
				if(isdefined(var_16f12c31) && self getweaponammostock(weapon) > 0)
				{
					return 0;
				}
			}
			return 1;
		}
		if(item.var_a6762160.itemtype == #"armor_shard")
		{
			return self.var_c52363ab > self.var_7d7d976a;
		}
	}
	return 0;
}

/*
	Name: function_18f58ab2
	Namespace: fireteam_dirty_bomb
	Checksum: 0x74BF4C63
	Offset: 0x1FD8
	Size: 0x150
	Parameters: 7
	Flags: Private
*/
function private function_18f58ab2(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slot)
{
	pickup = 0;
	switch(item.var_a6762160.name)
	{
		case "uranium_item_t9":
		{
			pickup = function_bf46e093(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slot);
			break;
		}
		case "uranium_pouch_item_t9":
		{
			pickup = function_fa78e80b(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slot);
			break;
		}
		case "armor_pouch_item_t9":
		{
			pickup = namespace_234f0efc::function_dd8cb464(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slot);
			break;
		}
		case "hash_583f1687cefbd3f3":
		{
			pickup = function_55205f34(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slot);
			break;
		}
	}
	return itemcount - pickup;
}

/*
	Name: function_55205f34
	Namespace: fireteam_dirty_bomb
	Checksum: 0x4F615E06
	Offset: 0x2130
	Size: 0x102
	Parameters: 7
	Flags: Private
*/
function private function_55205f34(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slot)
{
	if(function_61053367(slot))
	{
		return false;
	}
	slot clientfield::set_player_uimodel("hudItems.radiationVestHealth", 1);
	slot.var_1181c08b = (isdefined(var_aec6fa7f.var_a6762160.var_1181c08b) ? var_aec6fa7f.var_a6762160.var_1181c08b : 0);
	slot.var_4a1cb171 = slot.var_1181c08b;
	slot.var_dba54111 = (isdefined(var_aec6fa7f.var_a6762160.var_dba54111) ? var_aec6fa7f.var_a6762160.var_dba54111 : 0);
	return true;
}

/*
	Name: function_bf46e093
	Namespace: fireteam_dirty_bomb
	Checksum: 0x6D0D4CFF
	Offset: 0x2240
	Size: 0x24E
	Parameters: 7
	Flags: Private
*/
function private function_bf46e093(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slot)
{
	var_e3483afe = var_aec6fa7f clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
	pickup = int(min(function_ec3e7325(var_aec6fa7f) - var_e3483afe, slot));
	var_aec6fa7f clientfield::set_player_uimodel("hudItems.uraniumCarryCount", var_e3483afe + pickup);
	if(var_e3483afe + pickup > 0)
	{
		var_aec6fa7f clientfield::set("carryingUranium", 1);
		var_aec6fa7f function_53d7badf(1);
	}
	if(pickup > 0)
	{
		var_aec6fa7f playsound("fly_uranium_pickup");
		if(!isdefined(itemcount.var_d25a1503) || itemcount.var_d25a1503 != var_aec6fa7f.team)
		{
			scoreevents::processscoreevent(#"hash_64121166dc49f54a", var_aec6fa7f);
		}
	}
	if((var_e3483afe + pickup) >= function_ec3e7325(var_aec6fa7f) || !is_true(var_aec6fa7f.var_2faaa10))
	{
		var_aec6fa7f globallogic_audio::leader_dialog_on_player("dirtyBombUraniumMaxHold");
		var_aec6fa7f.var_2faaa10 = 1;
	}
	if(!isdefined(var_aec6fa7f.var_96c3af63))
	{
		var_aec6fa7f luinotifyevent(#"hash_6b67aa04e378d681", 1, 14);
		var_aec6fa7f.var_96c3af63 = 1;
	}
	return pickup;
}

/*
	Name: function_fa78e80b
	Namespace: fireteam_dirty_bomb
	Checksum: 0xA1551A39
	Offset: 0x2498
	Size: 0x7C
	Parameters: 7
	Flags: Private
*/
function private function_fa78e80b(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slot)
{
	if(!function_cc2c46fd(slot))
	{
		slot clientfield::set_player_uimodel("hudItems.uraniumMaxCarry", 10);
		return true;
	}
	return false;
}

/*
	Name: function_62730899
	Namespace: fireteam_dirty_bomb
	Checksum: 0x813A548F
	Offset: 0x2520
	Size: 0x74
	Parameters: 0
	Flags: Private
*/
function private function_62730899()
{
	if(level.basegametype != "fireteam_dirty_bomb")
	{
		return;
	}
	if(isdefined(level.territory) && level.territory.name != "zoo")
	{
		namespace_2938acdc::function_4212369d();
		namespace_2938acdc::function_20d09030();
	}
}

/*
	Name: onstartgametype
	Namespace: fireteam_dirty_bomb
	Checksum: 0xBC18A46A
	Offset: 0x25A0
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	if(level.var_2064692e == 2)
	{
		function_38080aeb();
		function_ceb4a5e9();
		level thread function_59d5c0b2();
	}
	else if(level.var_96cdb906 != 0)
	{
		level thread function_8e2fb040();
	}
	if(level.var_2c9f7c6b)
	{
		level thread function_d897b60a();
	}
	level thread function_65f0fe7f();
	level thread function_8249279b();
	namespace_b77e8eb1::onstartgametype();
}

/*
	Name: onplayerspawned
	Namespace: fireteam_dirty_bomb
	Checksum: 0x9D292FBD
	Offset: 0x2698
	Size: 0x13C
	Parameters: 0
	Flags: None
*/
function onplayerspawned()
{
	self function_c3f27004();
	self.var_4ad2bfd3 = 0;
	self.var_cfc4949c = 1;
	self.var_6dc4d968 = 0;
	self.var_c83d0859 = undefined;
	self.var_1eaa0d81 = undefined;
	self.pers[#"killstreaks"] = [];
	self.var_1181c08b = 0;
	self.var_dba54111 = 0;
	self.var_4a1cb171 = 0;
	self clientfield::set_player_uimodel("hudItems.uraniumCarryCount", 0);
	self clientfield::set_player_uimodel("hudItems.uraniumMaxCarry", 5);
	self clientfield::set_player_uimodel("hudItems.uraniumFullCarry", 0);
	self clientfield::set_player_uimodel("hudItems.radiationVestHealth", 0);
	self clientfield::set("carryingUranium", 0);
	self function_53d7badf(0);
}

/*
	Name: on_player_killed
	Namespace: fireteam_dirty_bomb
	Checksum: 0xE7F2BDBF
	Offset: 0x27E0
	Size: 0x3A4
	Parameters: 1
	Flags: None
*/
function on_player_killed(params)
{
	aliveplayers = function_a1cff525(self.squad);
	if(aliveplayers.size == 0)
	{
		if(params.eattacker util::isenemyplayer(self))
		{
			params.eattacker globallogic_audio::leader_dialog_on_player("dirtyBombFireteamWiped");
		}
	}
	else if(aliveplayers.size == 1)
	{
		if(!isdefined(level.var_e2384c19) && !aliveplayers[0] laststand::player_is_in_laststand())
		{
			aliveplayers[0] globallogic_audio::leader_dialog_on_player("dirtyBombFireteamWipedFriendly");
		}
	}
	if(params.eattacker util::isenemyplayer(self))
	{
		if(is_true(self.var_c83d0859))
		{
			scoreevents::processscoreevent(#"hash_b15e641945148d4", params.eattacker, self, params.weapon);
		}
		else if(is_true(self.var_1eaa0d81))
		{
			scoreevents::processscoreevent(#"hash_5d532825a2d0023", params.eattacker, self, params.weapon);
		}
		if(self clientfield::get_player_uimodel("hudItems.uraniumCarryCount") >= 5)
		{
			scoreevents::processscoreevent(#"hash_e9913b29988d98d", params.eattacker, self, params.weapon);
		}
	}
	self clientfield::set_to_player("ftdb_inZone", 0);
	self function_80d6d39b();
	self.var_9dc65a85 = 0;
	self.var_c83d0859 = undefined;
	self.var_1eaa0d81 = undefined;
	if(!getdvarint(#"hash_766c487cde5735c8", 0))
	{
		var_4c42f7cf = 0;
		var_4c42f7cf = self namespace_234f0efc::function_d5766919(var_4c42f7cf);
		var_4c42f7cf = self function_d67bd905(var_4c42f7cf + 1);
		var_4c42f7cf = self namespace_234f0efc::function_b31f892b(var_4c42f7cf + 1);
		var_4c42f7cf = self namespace_234f0efc::function_e50b5cec(var_4c42f7cf + 1);
		var_4c42f7cf = self function_15d1af86(var_4c42f7cf + 1);
		var_4c42f7cf = self namespace_234f0efc::drop_armor(var_4c42f7cf + 1);
	}
	self clientfield::set_player_uimodel("hudItems.radiationVestHealth", 0);
	if(!isdefined(level.var_e2384c19))
	{
		self.var_6dc4d968 = 1;
	}
	level function_28039abb();
}

/*
	Name: function_bf88f2fd
	Namespace: fireteam_dirty_bomb
	Checksum: 0x9DAA1F4F
	Offset: 0x2B90
	Size: 0x132
	Parameters: 2
	Flags: None
*/
function function_bf88f2fd(player1, player2)
{
	foreach(bomb in level.var_2f418a15)
	{
		if(!isdefined(bomb) || !isdefined(bomb.state) || !isdefined(bomb.trigger))
		{
			continue;
		}
		if(isdefined(player1) && distancesquared(bomb.origin, player1.origin) <= 40000)
		{
			return true;
		}
		if(isdefined(player2) && distancesquared(bomb.origin, player2.origin) <= 40000)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_610d3790
	Namespace: fireteam_dirty_bomb
	Checksum: 0x64F557F0
	Offset: 0x2CD0
	Size: 0x1AC
	Parameters: 4
	Flags: None
*/
function function_610d3790(einflictor, victim, idamage, weapon)
{
	var_d9e4d6db = is_true(weapon.var_c83d0859) || is_true(weapon.var_1eaa0d81) || is_true(self.var_c83d0859) || is_true(self.var_1eaa0d81);
	var_531e2363 = isdefined(weapon.laststandparams.var_60cb0c39) && weapon.laststandparams.var_60cb0c39;
	if(var_d9e4d6db || var_531e2363 || function_bf88f2fd(self, weapon))
	{
		if(isdefined(weapon.var_1318544a))
		{
			weapon.var_1318544a.var_60cb0c39 = 1;
		}
		self.pers[#"objectiveekia"]++;
		self.objectiveekia = self.pers[#"objectiveekia"];
		[[level.var_37d62931]](self, 1);
		self globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
	}
}

/*
	Name: function_82b353bf
	Namespace: fireteam_dirty_bomb
	Checksum: 0x5796ABD9
	Offset: 0x2E88
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function function_82b353bf(attacker)
{
	if(isdefined(attacker) && (is_true(attacker.var_c83d0859) || is_true(attacker.var_1eaa0d81)))
	{
		return true;
	}
	if(is_true(self.var_c83d0859) || is_true(self.var_1eaa0d81))
	{
		return true;
	}
	if(function_bf88f2fd(self, attacker))
	{
		return true;
	}
	return false;
}

/*
	Name: function_95002a59
	Namespace: fireteam_dirty_bomb
	Checksum: 0x5E84787A
	Offset: 0x2F48
	Size: 0xBE
	Parameters: 5
	Flags: Private
*/
function private function_95002a59(attacker, victim, inflictor, weapon, meansofdeath)
{
	if(meansofdeath == self)
	{
		return;
	}
	if(isdefined(meansofdeath))
	{
		meansofdeath.pers[#"downs"] = (isdefined(meansofdeath.pers[#"downs"]) ? meansofdeath.pers[#"downs"] : 0) + 1;
		meansofdeath.downs = meansofdeath.pers[#"downs"];
	}
}

/*
	Name: function_c3f27004
	Namespace: fireteam_dirty_bomb
	Checksum: 0x6076C13E
	Offset: 0x3010
	Size: 0xBA
	Parameters: 0
	Flags: None
*/
function function_c3f27004()
{
	if(!isdefined(level.radiation))
	{
		return;
	}
	if(level.radiation.levels.size <= 0)
	{
		return;
	}
	self.radiation = {};
	self.radiation.var_abd7d46a = level.radiation.levels[0].maxhealth;
	self.radiation.var_32adf91d = 0;
	self.radiation.sickness = [];
	self.radiation.var_393e0e31 = 0;
	self.radiation.var_f1c51b06 = 0;
	self.radiation.var_1389a65a = 0;
}

/*
	Name: function_a997e9c5
	Namespace: fireteam_dirty_bomb
	Checksum: 0x7F341525
	Offset: 0x30D8
	Size: 0x11C
	Parameters: 5
	Flags: Private
*/
function private function_a997e9c5(index, id, origin, angles, var_fd3ba46d)
{
	if(!isdefined(var_fd3ba46d))
	{
		var_fd3ba46d = 0;
	}
	self endon(#"disconnect");
	dropitem = level item_drop::drop_item(index, undefined, 1, 0, id, origin, angles, 2);
	if(var_fd3ba46d && isplayer(self) && isdefined(dropitem))
	{
		dropitem hidefromplayer(self);
		self waittill(#"death_delay_finished");
		if(isplayer(self) && isdefined(dropitem))
		{
			dropitem showtoplayer(self);
		}
	}
}

/*
	Name: function_15d1af86
	Namespace: fireteam_dirty_bomb
	Checksum: 0x32FAED3B
	Offset: 0x3200
	Size: 0x1DA
	Parameters: 1
	Flags: Private
*/
function private function_15d1af86(var_4c42f7cf)
{
	if(!isplayer(self))
	{
		/#
			assert(0);
		#/
		return;
	}
	var_e3483afe = self clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
	var_468a16f = 1;
	if(isdefined(self.laststandparams) && isdefined(self.laststandparams.attacker) && isplayer(self.laststandparams.attacker) && self.laststandparams.attacker == self)
	{
		var_468a16f = 0;
	}
	var_e3483afe = var_e3483afe + var_468a16f;
	self clientfield::set_player_uimodel("hudItems.uraniumCarryCount", 0);
	self clientfield::set("carryingUranium", 0);
	self function_53d7badf(0);
	itempoint = function_4ba8fde(#"uranium_item_t9");
	for(index = 0; index < var_e3483afe; index++)
	{
		self thread function_a997e9c5(var_4c42f7cf + index, itempoint.id, self.origin, (0, randomintrange(0, 360), 0), index == (var_e3483afe - 1));
	}
	return var_4c42f7cf + index;
}

/*
	Name: function_d67bd905
	Namespace: fireteam_dirty_bomb
	Checksum: 0x8F6B77AB
	Offset: 0x33E8
	Size: 0xFA
	Parameters: 1
	Flags: Private
*/
function private function_d67bd905(var_4c42f7cf)
{
	/#
		assert(isplayer(self));
	#/
	index = 0;
	if(function_cc2c46fd(self))
	{
		itempoint = function_4ba8fde("uranium_pouch_item_t9");
		level thread item_drop::function_7910964d(var_4c42f7cf + index, undefined, 1, 0, itempoint.id, self.origin, (0, randomintrange(0, 360), 0), 2);
		index++;
		self clientfield::set_player_uimodel("hudItems.uraniumMaxCarry", 5);
	}
	return var_4c42f7cf + index;
}

/*
	Name: playerrespawndelay
	Namespace: fireteam_dirty_bomb
	Checksum: 0xDAD6AB2A
	Offset: 0x34F0
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function playerrespawndelay()
{
	var_d34d1e15 = 0;
	if(is_true(level.waverespawndelay))
	{
		var_d34d1e15 = self globallogic_spawn::timeuntilwavespawn(level.playerrespawndelay);
	}
	else
	{
		var_d34d1e15 = level.playerrespawndelay;
	}
	if(isdefined(level.var_e2384c19) && !is_true(self.var_6dc4d968))
	{
		var_18947c8c = level.var_e2384c19 - (float(gettime()) / 1000);
		if(var_18947c8c > var_d34d1e15)
		{
			return var_18947c8c;
		}
	}
	return var_d34d1e15;
}

/*
	Name: function_d897b60a
	Namespace: fireteam_dirty_bomb
	Checksum: 0x457815F9
	Offset: 0x35C8
	Size: 0x776
	Parameters: 0
	Flags: None
*/
function function_d897b60a()
{
	level endon(#"game_ended");
	var_1a1c0d86 = 0;
	while(true)
	{
		foreach(index, player in getplayers())
		{
			if((index % 10) == var_1a1c0d86)
			{
				if(!isdefined(player.radiation))
				{
					continue;
				}
				var_56bea7c = 0;
				if(player.sessionstate != "playing" || !isalive(player))
				{
					player.radiation.var_abd7d46a = level.radiation.levels[0].maxhealth;
					var_56bea7c = player.radiation.var_32adf91d != 0;
					player.radiation.var_32adf91d = 0;
					player.radiation.var_f1c51b06 = 0;
					if(var_56bea7c)
					{
						player thread function_6ade1bbf(0);
					}
					continue;
				}
				var_cc03b04e = player clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
				var_4a68766 = player namespace_b77e8eb1::function_8e4e3bb2();
				if(var_4a68766)
				{
					player clientfield::set_to_player("ftdb_inZone", 1);
				}
				else
				{
					player clientfield::set_to_player("ftdb_inZone", 0);
				}
				var_cad9861a = 0;
				if(var_4a68766)
				{
					if(gettime() >= (player.radiation.var_f1c51b06 + level.var_a6cec0dc))
					{
						var_2f42039 = level.var_81a49fc0 * var_cc03b04e;
						var_cad9861a = level.var_ee660ce0 * (1 + var_2f42039);
						if(isdefined(level.var_c3a003ad))
						{
							var_cad9861a = player [[level.var_c3a003ad]](var_cad9861a);
						}
						player.radiation.var_abd7d46a = player.radiation.var_abd7d46a - var_cad9861a;
						while(player.radiation.var_abd7d46a < 0 && player.radiation.var_32adf91d < level.var_c43aac04)
						{
							player.radiation.var_32adf91d++;
							player.radiation.var_abd7d46a = player.radiation.var_abd7d46a + level.radiation.levels[player.radiation.var_32adf91d].maxhealth;
							var_56bea7c = 1;
						}
						if(player.radiation.var_abd7d46a < 0)
						{
							player.radiation.var_abd7d46a = 0;
						}
						if(var_56bea7c)
						{
							var_76f7b10e = 0;
							if(player.radiation.var_32adf91d == 1)
							{
								player luinotifyevent(#"hash_7adc508fd96535c9", 0);
								var_76f7b10e = 3.5;
							}
							player globallogic_audio::leader_dialog_on_player("dirtyBombRadStage" + player.radiation.var_32adf91d);
							player thread function_6ade1bbf(var_76f7b10e);
						}
						player function_3c1f8280();
						player.radiation.var_f1c51b06 = gettime();
					}
				}
				if(var_cad9861a <= 0)
				{
					if(player.radiation.var_32adf91d == 0 && player.radiation.var_abd7d46a >= level.radiation.levels[0].maxhealth)
					{
						if(is_true(player.var_cfc4949c))
						{
							player.var_cfc4949c = undefined;
							player thread function_6ade1bbf(0);
						}
						player function_3c1f8280();
						continue;
					}
					if(gettime() >= (player.radiation.var_f1c51b06 + level.var_bb0c0222))
					{
						var_4a34487 = level.var_a22f8001 * var_cc03b04e;
						var_ac8e5dcc = level.var_f569833a * (1 - var_4a34487);
						player.radiation.var_abd7d46a = player.radiation.var_abd7d46a + var_ac8e5dcc;
						while(player.radiation.var_32adf91d > 0 && player.radiation.var_abd7d46a > level.radiation.levels[player.radiation.var_32adf91d].maxhealth)
						{
							player.radiation.var_abd7d46a = player.radiation.var_abd7d46a - level.radiation.levels[player.radiation.var_32adf91d].maxhealth;
							player.radiation.var_32adf91d--;
							var_56bea7c = 1;
						}
						if(player.radiation.var_abd7d46a > level.radiation.levels[player.radiation.var_32adf91d].maxhealth)
						{
							player.radiation.var_abd7d46a = level.radiation.levels[player.radiation.var_32adf91d].maxhealth;
						}
						player function_3c1f8280();
						if(var_56bea7c)
						{
							player thread function_6ade1bbf(0);
						}
						player.radiation.var_f1c51b06 = gettime();
					}
				}
				player function_9b065f90();
			}
		}
		var_1a1c0d86 = (var_1a1c0d86 + 1) % 10;
		waitframe(1);
	}
}

/*
	Name: function_65f0fe7f
	Namespace: fireteam_dirty_bomb
	Checksum: 0x7991673C
	Offset: 0x3D48
	Size: 0x172
	Parameters: 0
	Flags: Private
*/
function private function_65f0fe7f()
{
	level endon(#"game_ended");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(!isalive(player) || player inlaststand())
			{
				continue;
			}
			var_31480f62 = player function_28655ef2() || player actionslottwobuttonpressed();
			if(!var_31480f62 || is_false(player.var_c60ad697))
			{
				player.var_c60ad697 = !var_31480f62;
				continue;
			}
			player.var_c60ad697 = 0;
			player function_f917644c();
		}
		waitframe(1);
	}
}

/*
	Name: function_8249279b
	Namespace: fireteam_dirty_bomb
	Checksum: 0xF5EC2262
	Offset: 0x3EC8
	Size: 0x34C
	Parameters: 0
	Flags: Private
*/
function private function_8249279b()
{
	level endon(#"game_ended");
	while(true)
	{
		players = getplayers();
		var_cf0783b8 = [];
		foreach(player in getplayers())
		{
			var_cf0783b8[player getentitynumber()] = player;
		}
		foreach(bomb in level.var_2f418a15)
		{
			if(!isdefined(bomb) || !isdefined(bomb.state) || !isdefined(bomb.trigger))
			{
				continue;
			}
			if(bomb.state != 4)
			{
				continue;
			}
			playersinradius = getplayers(undefined, bomb.origin, 120);
			foreach(player in playersinradius)
			{
				if(player istouching(bomb.trigger))
				{
					player val::set(#"fireteam_dirty_bomb", "disable_weapon_pickup", 1);
					var_cf0783b8[player getentitynumber()] = undefined;
				}
			}
		}
		arrayremovevalue(var_cf0783b8, undefined, 1);
		foreach(player in var_cf0783b8)
		{
			player val::set(#"fireteam_dirty_bomb", "disable_weapon_pickup", 0);
		}
		wait(0.5);
	}
}

/*
	Name: function_f917644c
	Namespace: fireteam_dirty_bomb
	Checksum: 0xD87C8D93
	Offset: 0x4220
	Size: 0x2E4
	Parameters: 0
	Flags: None
*/
function function_f917644c()
{
	var_cc03b04e = self clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
	if(var_cc03b04e == 0)
	{
		return;
	}
	itempoint = function_4ba8fde(#"uranium_item_t9");
	originoffset = vectorscale((0, 0, 1), 6);
	dropangles = self.angles + (0, randomintrange(-30, 30), 0);
	forward = anglestoforward(dropangles);
	droporigin = (self.origin + originoffset) + (forward * (randomfloatrange(10, 30) + 18));
	traceresults = physicstraceex(self.origin + originoffset, droporigin, (0, 0, 0), (0, 0, 0), self, 1);
	if(traceresults[#"fraction"] < 1)
	{
		droporigin = traceresults[#"position"] - (forward * 18);
	}
	else
	{
		droporigin = droporigin - (forward * 18);
	}
	waitframe(1);
	if(!isdefined(self))
	{
		return;
	}
	dropitem = self item_drop::drop_item(0, undefined, 1, 1, itempoint.id, droporigin, dropangles, 2);
	if(!isdefined(dropitem))
	{
		return;
	}
	dropitem item_drop::function_801fcc9e(int(2 * 1000));
	dropitem.var_d25a1503 = self.team;
	self clientfield::set_player_uimodel("hudItems.uraniumCarryCount", var_cc03b04e - 1);
	self.var_4ad2bfd3 = gettime();
	self function_58b29f4f();
	var_cc03b04e = self clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
	if(var_cc03b04e <= 0)
	{
		function_53d7badf(0);
		self clientfield::set("carryingUranium", 0);
	}
}

/*
	Name: function_9b065f90
	Namespace: fireteam_dirty_bomb
	Checksum: 0x9B3E37D4
	Offset: 0x4510
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function function_9b065f90()
{
	if(self.radiation.var_32adf91d == level.var_4fdf11d8)
	{
		if(gettime() >= (self.radiation.var_1389a65a + level.var_77a24482))
		{
			self dodamage(level.var_f87355e5, self.origin, undefined, undefined, "none", "MOD_DEATH_CIRCLE", 0, level.weaponnone);
			self.radiation.var_1389a65a = gettime();
		}
	}
}

/*
	Name: function_6ade1bbf
	Namespace: fireteam_dirty_bomb
	Checksum: 0xBE6A6EDD
	Offset: 0x45B0
	Size: 0x2DC
	Parameters: 1
	Flags: None
*/
function function_6ade1bbf(timedelay)
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	wait(timedelay);
	if(!isdefined(self.radiation.var_32adf91d))
	{
		return;
	}
	if(self.radiation.var_32adf91d == level.var_4fdf11d8)
	{
		namespace_6615ea91::function_59621e3c(self, #"dot");
	}
	if(self.radiation.var_32adf91d >= 2)
	{
		else
		{
		}
		self.heal.var_c8777194 = 1;
		self.n_regen_delay = 9;
		namespace_6615ea91::function_59621e3c(self, #"hash_53d8a06b13ec49d9");
	}
	else
	{
		self.n_regen_delay = 1;
	}
	if(self.radiation.var_32adf91d >= 1)
	{
		self function_e6f9e3cd();
		self perks::perk_reset_all();
		self function_b5feff95(#"specialty_sprint");
		self function_b5feff95(#"specialty_sprintreload");
		self function_b5feff95(#"specialty_forwardspawninteract");
		self function_b5feff95(#"specialty_slide");
		self function_b5feff95(#"specialty_sprintheal");
		self perks::perk_setperk(#"specialty_sprint");
		self perks::perk_setperk(#"specialty_sprintreload");
		self perks::perk_setperk(#"specialty_forwardspawninteract");
		self perks::perk_setperk(#"specialty_slide");
		self perks::perk_setperk(#"specialty_sprintheal");
		namespace_6615ea91::function_59621e3c(self, #"disable_perks");
	}
	else
	{
		self loadout::give_talents(0);
		self loadout::give_perks();
	}
}

/*
	Name: function_3c1f8280
	Namespace: fireteam_dirty_bomb
	Checksum: 0x5C81B143
	Offset: 0x4898
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_3c1f8280()
{
	namespace_6615ea91::function_137e7814(self, self.radiation.var_32adf91d);
	var_60ece81c = level.radiation.levels[self.radiation.var_32adf91d].maxhealth;
	var_137c430d = self.radiation.var_abd7d46a / var_60ece81c;
	namespace_6615ea91::function_835a6746(self, var_137c430d);
	namespace_6615ea91::function_36a2c924(self, 1 - var_137c430d);
}

/*
	Name: function_277ec378
	Namespace: fireteam_dirty_bomb
	Checksum: 0xD7ADF223
	Offset: 0x4958
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_277ec378(var_c18a13b5)
{
	globallogic_audio::function_61e17de0("dirtyBombRadExpand", getplayers(undefined, var_c18a13b5, 4500));
}

/*
	Name: function_334e317
	Namespace: fireteam_dirty_bomb
	Checksum: 0x3FF63A6D
	Offset: 0x49A8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_334e317(var_c18a13b5)
{
	globallogic_audio::function_61e17de0("dirtyBombRadRecede", getplayers(undefined, var_c18a13b5, 4500));
}

/*
	Name: function_8e2fb040
	Namespace: fireteam_dirty_bomb
	Checksum: 0x3420E64
	Offset: 0x49F8
	Size: 0x2B0
	Parameters: 0
	Flags: None
*/
function function_8e2fb040()
{
	level endon(#"game_ended");
	function_38080aeb();
	function_693f50f5();
	level flag::wait_till(#"insertion_begin_completed");
	while(true)
	{
		function_c5d8437d();
		if(level.var_4e3c4685 != 0)
		{
			wait(level.var_4e3c4685);
			function_a05584ae();
		}
		else
		{
			while(true)
			{
				var_d8b86297 = 0;
				for(i = 0; i < level.var_2f418a15.size; i++)
				{
					if(level.var_2f418a15[i].state != 0)
					{
						var_d8b86297 = 1;
						break;
					}
				}
				if(!var_d8b86297)
				{
					break;
				}
				waitframe(1);
			}
			if(isdefined(level.var_320e6819))
			{
				level.var_320e6819 = undefined;
			}
		}
		function_693f50f5();
		if(level.var_26c7635a != 0)
		{
			luinotifyevent(#"hash_2977456e1832eba6");
			clientfield::set_world_uimodel("hud_items_dirty_bomb.bomb_respawn_disabled", 1);
			foreach(player in level.players)
			{
				if(!isalive(player))
				{
					player notify(#"hash_33713849648e651d");
				}
			}
			if(level.var_12ff620b < level.var_26c7635a)
			{
				wait(level.var_12ff620b);
				function_1c3c84b4();
				wait(level.var_26c7635a - level.var_12ff620b);
			}
			else
			{
				wait(level.var_26c7635a);
			}
			clientfield::set_world_uimodel("hud_items_dirty_bomb.bomb_respawn_disabled", 0);
		}
	}
}

/*
	Name: function_38080aeb
	Namespace: fireteam_dirty_bomb
	Checksum: 0xBBC24627
	Offset: 0x4CB0
	Size: 0xDA
	Parameters: 0
	Flags: None
*/
function function_38080aeb()
{
	level.var_ef77c3e3 = struct::get_array("fireteam_dirty_bomb", "variantname");
	if(level.var_ef77c3e3.size == 0)
	{
		return;
	}
	function_87b2107c(level.var_ef77c3e3);
	foreach(bomb in level.var_ef77c3e3)
	{
		bomb.state = 0;
	}
}

/*
	Name: function_59d5c0b2
	Namespace: fireteam_dirty_bomb
	Checksum: 0x6D3C75C9
	Offset: 0x4D98
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_59d5c0b2()
{
	level endon(#"game_ended");
	level flag::wait_till(#"insertion_begin_completed");
	function_c5d8437d();
}

/*
	Name: function_87b2107c
	Namespace: fireteam_dirty_bomb
	Checksum: 0x9D52A3A2
	Offset: 0x4DF0
	Size: 0x12A
	Parameters: 1
	Flags: None
*/
function function_87b2107c(&structs)
{
	var_e8a4ae59 = 64;
	var_a3c01952 = 1024;
	foreach(struct in structs)
	{
		startorigin = struct.origin + (0, 0, var_e8a4ae59);
		endorigin = startorigin - (0, 0, var_a3c01952);
		trace = physicstraceex(startorigin, endorigin, vectorscale((-1, -1, -1), 0.5), vectorscale((1, 1, 1), 0.5), undefined, 1);
		struct.origin = trace[#"position"];
	}
}

/*
	Name: function_693f50f5
	Namespace: fireteam_dirty_bomb
	Checksum: 0xC3637EB5
	Offset: 0x4F28
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_693f50f5()
{
	if(level.var_2064692e == 0)
	{
		function_ceb4a5e9();
	}
	else if(level.var_2064692e == 1)
	{
		function_5757c66f();
	}
}

/*
	Name: function_ceb4a5e9
	Namespace: fireteam_dirty_bomb
	Checksum: 0xA5E9C39D
	Offset: 0x4F88
	Size: 0x244
	Parameters: 0
	Flags: None
*/
function function_ceb4a5e9()
{
	if(level.var_ef77c3e3.size < level.var_96cdb906)
	{
		level.var_ef77c3e3 = struct::get_array("fireteam_dirty_bomb", "variantname");
	}
	for(i = 0; i < level.var_96cdb906; i++)
	{
		var_f4f4fee1 = randomint(level.var_ef77c3e3.size);
		var_26bc1595 = 0;
		attempts = 0;
		do
		{
			var_26bc1595 = 0;
			foreach(bomb in level.var_2f418a15)
			{
				if(bomb == level.var_ef77c3e3[var_f4f4fee1])
				{
					var_26bc1595 = 1;
					attempts++;
					break;
				}
				if(distancesquared(bomb.origin, level.var_ef77c3e3[var_f4f4fee1].origin) < 4000000)
				{
					var_26bc1595 = 1;
					attempts++;
					break;
				}
			}
			if(var_26bc1595)
			{
				var_f4f4fee1 = randomint(level.var_ef77c3e3.size);
			}
		}
		while(var_26bc1595 && attempts < 30);
		level.var_2f418a15[level.var_2f418a15.size] = level.var_ef77c3e3[var_f4f4fee1];
		level.var_ef77c3e3[var_f4f4fee1] = level.var_ef77c3e3[level.var_ef77c3e3.size - 1];
		level.var_ef77c3e3[level.var_ef77c3e3.size - 1] = undefined;
	}
}

/*
	Name: function_5757c66f
	Namespace: fireteam_dirty_bomb
	Checksum: 0xF9D95F43
	Offset: 0x51D8
	Size: 0x1C4
	Parameters: 0
	Flags: None
*/
function function_5757c66f()
{
	if(!isdefined(level.var_d83e193a) || level.var_d83e193a.size <= 0)
	{
		function_18b08e66();
	}
	if(level.var_d83e193a.size == 0)
	{
		/#
			assertmsg("");
		#/
		function_ceb4a5e9();
		return;
	}
	var_704364cb = getarraykeys(level.var_d83e193a);
	var_34200851 = randomint(var_704364cb.size);
	var_2a0f16b1 = var_704364cb[var_34200851];
	level.var_d83e193a[var_2a0f16b1] = undefined;
	var_2e89cb0a = 0;
	foreach(bomb in level.var_ef77c3e3)
	{
		if(bomb.state != 0)
		{
			continue;
		}
		if(bomb.var_6956912d == var_2a0f16b1)
		{
			level.var_2f418a15[level.var_2f418a15.size] = bomb;
			var_2e89cb0a++;
		}
		if(var_2e89cb0a >= level.var_96cdb906)
		{
			break;
		}
	}
}

/*
	Name: function_cca53f41
	Namespace: fireteam_dirty_bomb
	Checksum: 0xA6355A6E
	Offset: 0x53A8
	Size: 0x2F2
	Parameters: 2
	Flags: None
*/
function function_cca53f41(objectiveid, objindex)
{
	if(level.var_ef77c3e3.size == 0)
	{
		level.var_ef77c3e3 = struct::get_array("fireteam_dirty_bomb", "variantname");
	}
	var_f4f4fee1 = randomint(level.var_ef77c3e3.size);
	var_26bc1595 = 0;
	attempts = 0;
	do
	{
		var_26bc1595 = 0;
		foreach(bomb in level.var_2f418a15)
		{
			if(bomb == level.var_ef77c3e3[var_f4f4fee1])
			{
				var_26bc1595 = 1;
				attempts++;
				break;
			}
			if(distancesquared(bomb.origin, level.var_ef77c3e3[var_f4f4fee1].origin) < 4000000)
			{
				var_26bc1595 = 1;
				attempts++;
				break;
			}
		}
		if(var_26bc1595)
		{
			var_f4f4fee1 = randomint(level.var_ef77c3e3.size);
		}
	}
	while(var_26bc1595 && attempts < 30);
	bomb = level.var_ef77c3e3[var_f4f4fee1];
	level.var_2f418a15[level.var_2f418a15.size] = bomb;
	level.var_ef77c3e3[var_f4f4fee1] = level.var_ef77c3e3[level.var_ef77c3e3.size - 1];
	level.var_ef77c3e3[level.var_ef77c3e3.size - 1] = undefined;
	if(isdefined(objectiveid))
	{
		objective_delete(objectiveid);
		gameobjects::release_obj_id(objectiveid);
	}
	bomb.objindex = objindex;
	bomb function_f37d284();
	bomb function_b801b00c();
	bomb function_fb51b5a4();
	objective_setgamemodeflags(bomb.objectiveid, 2);
	bomb.var_cc03b04e = 0;
	bomb.state = 2;
}

/*
	Name: function_18b08e66
	Namespace: fireteam_dirty_bomb
	Checksum: 0xE21A05D2
	Offset: 0x56A8
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_18b08e66()
{
	if(!isdefined(level.var_d83e193a))
	{
		level.var_d83e193a = [];
	}
	foreach(bomb in level.var_ef77c3e3)
	{
		if(!isdefined(level.var_d83e193a[bomb.var_6956912d]))
		{
			level.var_d83e193a[bomb.var_6956912d] = bomb.var_6956912d;
		}
	}
}

/*
	Name: function_a9d8729c
	Namespace: fireteam_dirty_bomb
	Checksum: 0xBF0B5BD8
	Offset: 0x5778
	Size: 0x110
	Parameters: 3
	Flags: None
*/
function function_a9d8729c(dialogkey, origin, radius)
{
	var_4b3fe4a6 = [];
	nearbyplayers = getplayers(undefined, origin, radius);
	foreach(player in nearbyplayers)
	{
		if(!array::contains(var_4b3fe4a6, player.team))
		{
			var_4b3fe4a6[var_4b3fe4a6.size] = player.team;
			globallogic_audio::leader_dialog(dialogkey, player.team);
		}
	}
}

/*
	Name: function_93098bd9
	Namespace: fireteam_dirty_bomb
	Checksum: 0xDB88F138
	Offset: 0x5890
	Size: 0xAC
	Parameters: 4
	Flags: None
*/
function function_93098bd9(dialogkey, team, origin, radius)
{
	if(!isdefined(dialogkey))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isdefined(team))
	{
		/#
			assert(0);
		#/
		return;
	}
	players = getplayers(team, origin, radius);
	if(players.size > 0)
	{
		globallogic_audio::function_61e17de0(dialogkey, players);
	}
}

/*
	Name: function_e43bca0f
	Namespace: fireteam_dirty_bomb
	Checksum: 0x6EBBB15A
	Offset: 0x5948
	Size: 0x100
	Parameters: 4
	Flags: None
*/
function function_e43bca0f(dialogkey, skipteam, origin, radius)
{
	if(!isdefined(dialogkey))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isdefined(skipteam))
	{
		/#
			assert(0);
		#/
		return;
	}
	foreach(_ in level.teams)
	{
		if(team != skipteam)
		{
			function_93098bd9(dialogkey, team, origin, radius);
		}
	}
}

/*
	Name: function_c5d8437d
	Namespace: fireteam_dirty_bomb
	Checksum: 0x306C67A1
	Offset: 0x5A50
	Size: 0x204
	Parameters: 0
	Flags: None
*/
function function_c5d8437d()
{
	function_cd2bee53();
	for(i = 0; i < level.var_2f418a15.size; i++)
	{
		bomb = level.var_2f418a15[i];
		if(!isdefined(bomb.state) || bomb.state == 0)
		{
			bomb.objindex = i % 5;
			bomb function_f37d284();
			bomb function_b801b00c();
		}
		else if(isdefined(bomb.state) && bomb.state != 1)
		{
			continue;
		}
		bomb function_fb51b5a4();
		objective_setgamemodeflags(bomb.objectiveid, 2);
		bomb.var_cc03b04e = 0;
		bomb.state = 2;
	}
	if(!is_true(level.var_169e6bcb))
	{
		globallogic_audio::function_61e17de0("dirtyBombOnline", getplayers());
		level.var_169e6bcb = 1;
	}
	else if(level.var_96cdb906 > 1)
	{
		globallogic_audio::function_61e17de0("dirtyBombActive" + level.var_2f418a15.size, getplayers());
		globallogic_audio::function_61e17de0("dirtyBombRespawnEnabled", getplayers());
	}
}

/*
	Name: function_1c3c84b4
	Namespace: fireteam_dirty_bomb
	Checksum: 0xB193321A
	Offset: 0x5C60
	Size: 0xEA
	Parameters: 0
	Flags: None
*/
function function_1c3c84b4()
{
	function_cd2bee53();
	for(i = 0; i < level.var_2f418a15.size; i++)
	{
		bomb = level.var_2f418a15[i];
		if(isdefined(bomb.state) && bomb.state != 0)
		{
			continue;
		}
		bomb.objindex = i % 5;
		bomb function_f37d284();
		bomb function_b801b00c();
		objective_setgamemodeflags(bomb.objectiveid, 5);
		bomb.state = 1;
	}
}

/*
	Name: function_cd2bee53
	Namespace: fireteam_dirty_bomb
	Checksum: 0xFF6609D
	Offset: 0x5D58
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_cd2bee53()
{
	if(level.var_910f361c.size == 0)
	{
		return;
	}
	foreach(objid in level.var_910f361c)
	{
		objective_delete(objid);
		gameobjects::release_obj_id(objid);
	}
	level.var_910f361c = [];
}

/*
	Name: function_f37d284
	Namespace: fireteam_dirty_bomb
	Checksum: 0x4CD6A82B
	Offset: 0x5E28
	Size: 0x144
	Parameters: 0
	Flags: Private
*/
function private function_f37d284()
{
	self.model = spawn("script_model", self.origin + (0, 0, 0));
	self.model.angles = self.angles;
	self.model setmodel("p9_wz_dirty_bomb_01");
	self.model function_619a5c20();
	self.model.killcament = spawn("script_model", self.model.origin + vectorscale((0, 0, 1), 40));
	self.model.killcament setmodel(#"tag_origin");
	self.model.killcament.angles = (0, 0, 0);
	self.model.killcament setweapon(level.weaponnone);
}

/*
	Name: function_b801b00c
	Namespace: fireteam_dirty_bomb
	Checksum: 0xE8F2EDE5
	Offset: 0x5F78
	Size: 0x84
	Parameters: 0
	Flags: Private
*/
function private function_b801b00c()
{
	self.objectiveid = gameobjects::get_next_obj_id();
	objective = level.var_d8fd137b[self.objindex];
	objective_add(self.objectiveid, "active", self.model, objective);
	function_9a8950ee(self.objectiveid, 1);
}

/*
	Name: function_fb51b5a4
	Namespace: fireteam_dirty_bomb
	Checksum: 0x28A6C7A4
	Offset: 0x6008
	Size: 0x18A
	Parameters: 0
	Flags: Private
*/
function private function_fb51b5a4()
{
	self.trigger = spawn("trigger_radius", self.origin + vectorscale((0, 0, 1), 12), 0, 120, 90, 1);
	self.trigger triggerignoreteam();
	self.trigger triggerenable(1);
	self.trigger callback::on_trigger(&function_fcc87504);
	self.trigger setinvisibletoall();
	foreach(player in getplayers())
	{
		if(player clientfield::get_player_uimodel("hudItems.uraniumCarryCount") > 0)
		{
			self.trigger setinvisibletoplayer(player, 0);
		}
	}
	self.trigger.bomb = self;
}

/*
	Name: function_fcc87504
	Namespace: fireteam_dirty_bomb
	Checksum: 0x3D499BC8
	Offset: 0x61A0
	Size: 0x2D4
	Parameters: 1
	Flags: Private
*/
function private function_fcc87504(var_7d32de2)
{
	if(is_true(level.gameended))
	{
		return;
	}
	activator = var_7d32de2.activator;
	if(is_true(activator.var_9dc65a85))
	{
		return;
	}
	bomb = self.bomb;
	if(!function_a4521a9b(activator))
	{
		return;
	}
	if(!function_ad9de896(activator, bomb))
	{
		return;
	}
	activator playloopsound(#"hash_444112674e0eba78");
	activator.var_c83d0859 = 1;
	success = activator function_99898a2d(bomb);
	while(is_true(success) && bomb.state == 2)
	{
		if(!isdefined(activator))
		{
			return;
		}
		if(!function_a4521a9b(activator))
		{
			break;
		}
		if(!function_ad9de896(activator, bomb))
		{
			break;
		}
		if(game.state != #"playing")
		{
			break;
		}
		self triggerenable(1);
		success = activator function_99898a2d(bomb);
	}
	if(!isdefined(activator))
	{
		return;
	}
	activator stoploopsound();
	if(isalive(activator) && !activator inlaststand())
	{
		activator.var_c83d0859 = undefined;
	}
	var_a5d31314 = activator clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
	if(bomb.state == 2 && var_a5d31314 <= 0)
	{
		bomb.model playsoundtoplayer(#"hash_1cc6a788d45a7d48", activator);
	}
	activator function_80d6d39b();
	activator function_a7af3a2a();
}

/*
	Name: function_99898a2d
	Namespace: fireteam_dirty_bomb
	Checksum: 0x271B7471
	Offset: 0x6480
	Size: 0x188
	Parameters: 1
	Flags: Private
*/
function private function_99898a2d(bomb)
{
	self endon(#"disconnect");
	trigger = bomb.trigger;
	success = 0;
	if(isdefined(bomb))
	{
		prevtime = gettime();
		var_e18791f4 = int(level.var_932f538d * 1000);
		var_d486b6 = 0;
		bomb thread function_704fdca0(self);
		while(self function_ce8f2021(bomb))
		{
			progress = gettime() - prevtime;
			var_d486b6 = var_d486b6 + progress;
			prevtime = gettime();
			if(var_d486b6 >= var_e18791f4)
			{
				success = 1;
				bomb thread function_3b72c4b2(self);
				break;
			}
			if(var_d486b6 > 0)
			{
				self function_9db99d2f(var_d486b6 / var_e18791f4);
			}
			waitframe(1);
		}
		if(!success)
		{
			bomb thread function_ea25bba7(self);
		}
	}
	self function_80d6d39b();
	return success;
}

/*
	Name: canrevive
	Namespace: fireteam_dirty_bomb
	Checksum: 0x25201B7B
	Offset: 0x6610
	Size: 0x34
	Parameters: 1
	Flags: Private
*/
function private canrevive(revivee)
{
	if(!isdefined(self) || !isdefined(revivee))
	{
		return 0;
	}
	return self.var_1eaa0d81 !== 1;
}

/*
	Name: function_ad9de896
	Namespace: fireteam_dirty_bomb
	Checksum: 0xEE57C222
	Offset: 0x6650
	Size: 0x11C
	Parameters: 2
	Flags: None
*/
function function_ad9de896(player, bomb)
{
	if(!isplayer(player))
	{
		/#
			assert(0);
		#/
		return false;
	}
	if(!isdefined(bomb))
	{
		/#
			assert(0);
		#/
		return false;
	}
	if(!isdefined(bomb.model))
	{
		return false;
	}
	var_14448f85 = vectorscale((0, 0, 1), 24);
	camerapos = player getplayercamerapos();
	traceresult = bullettrace(camerapos, bomb.origin + var_14448f85, 0, player, 0, 0);
	if(traceresult[#"entity"] !== bomb.model)
	{
		return false;
	}
	return true;
}

/*
	Name: function_a4521a9b
	Namespace: fireteam_dirty_bomb
	Checksum: 0x6E00C2A6
	Offset: 0x6778
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function function_a4521a9b(player)
{
	if(player isinvehicle())
	{
		return false;
	}
	var_cc03b04e = player clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
	if(var_cc03b04e > 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_ce8f2021
	Namespace: fireteam_dirty_bomb
	Checksum: 0x293960D3
	Offset: 0x67E0
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_ce8f2021(bomb)
{
	if(bomb.state != 2)
	{
		return false;
	}
	if(!isalive(self))
	{
		return false;
	}
	if(self inlaststand())
	{
		return false;
	}
	if(!isdefined(bomb.trigger))
	{
		return false;
	}
	if(!bomb.trigger istriggerenabled())
	{
		return false;
	}
	if(!self istouching(bomb.trigger))
	{
		return false;
	}
	if(game.state != #"playing")
	{
		return false;
	}
	return true;
}

/*
	Name: function_3b72c4b2
	Namespace: fireteam_dirty_bomb
	Checksum: 0xF7F7CA67
	Offset: 0x68C0
	Size: 0x494
	Parameters: 1
	Flags: None
*/
function function_3b72c4b2(player)
{
	player function_80d6d39b();
	if(game.state != #"playing")
	{
		return;
	}
	if(self.state != 2)
	{
		return;
	}
	player.var_9dc65a85 = 0;
	objective_clearplayerusing(self.objectiveid, player);
	var_cc03b04e = player clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
	if(var_cc03b04e <= 0)
	{
		return;
	}
	if(!isdefined(self.var_cc03b04e))
	{
		self.var_cc03b04e = 0;
	}
	self.var_cc03b04e++;
	objective_setprogress(self.objectiveid, self.var_cc03b04e / level.var_3990ce92);
	if(level.var_e65e9422)
	{
		player globallogic_score::giveteamscoreforobjective(player.team, level.var_e65e9422);
		function_e2d09d87(player.team);
	}
	scoreevents::processscoreevent(#"hash_405ccdd657f10e0e", player);
	player clientfield::set_player_uimodel("hudItems.uraniumCarryCount", var_cc03b04e - 1);
	[[level.var_37d62931]](player, 1);
	player.pers[#"dirty_bomb_deposits"] = (isdefined(player.pers[#"dirty_bomb_deposits"]) ? player.pers[#"dirty_bomb_deposits"] : 0) + 1;
	player.dirty_bomb_deposits = player.pers[#"dirty_bomb_deposits"];
	player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
	player stats::function_bb7eedf0(#"dirty_bomb_deposits", 1);
	if(game.state != #"playing")
	{
		return;
	}
	level function_28039abb();
	if((var_cc03b04e - 1) <= 0)
	{
		player clientfield::set("carryingUranium", 0);
		player function_53d7badf(0);
	}
	if(self.var_cc03b04e >= level.var_3990ce92)
	{
		self function_5c84cd7c();
		if(isdefined(player))
		{
			function_93098bd9("dirtyBombPrimedFriendly", player.team, self.origin, 4500);
			function_e43bca0f("dirtyBombPrimedEnemy", player.team, self.origin, 4500);
			players = getplayers(player.team);
			foreach(var_7b66d20c in players)
			{
				if(!isdefined(var_7b66d20c.var_b0a8d09c) && isalive(var_7b66d20c))
				{
					var_7b66d20c luinotifyevent(#"hash_6b67aa04e378d681", 1, 15);
					var_7b66d20c.var_b0a8d09c = 1;
				}
			}
		}
		self thread function_4b31d6ba();
	}
}

/*
	Name: function_704fdca0
	Namespace: fireteam_dirty_bomb
	Checksum: 0x923713DA
	Offset: 0x6D60
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function function_704fdca0(player)
{
	self endon(#"disconnect");
	if(self.state == 2)
	{
		player function_3bf6db8b(#"defaultstate", self.trigger);
		player clientfield::set_to_player("using_bomb", 1);
	}
	else if(self.state == 4)
	{
		self.trigger function_6e23e4cb(player);
		player function_3bf6db8b(#"detonating", self.trigger);
		player clientfield::set_to_player("using_bomb", 2);
	}
	player.var_9dc65a85 = 1;
	objective_setplayerusing(self.objectiveid, player);
}

/*
	Name: function_63909e4a
	Namespace: fireteam_dirty_bomb
	Checksum: 0x58F11B7B
	Offset: 0x6E88
	Size: 0x5A
	Parameters: 0
	Flags: Private
*/
function private function_63909e4a()
{
	if(!isplayer(self))
	{
		return;
	}
	if(isalive(self) && !self inlaststand())
	{
		self.var_1eaa0d81 = undefined;
	}
}

/*
	Name: function_ea25bba7
	Namespace: fireteam_dirty_bomb
	Checksum: 0xC95BE064
	Offset: 0x6EF0
	Size: 0x1AC
	Parameters: 1
	Flags: None
*/
function function_ea25bba7(player)
{
	if(!isplayer(player))
	{
		return;
	}
	player function_80d6d39b();
	if(self.state == 2)
	{
		player.var_c83d0859 = undefined;
	}
	else if(self.state == 4)
	{
		self.trigger function_6e23e4cb();
		player function_63909e4a();
		if(!getdvarint(#"hash_6d01658e46435b76", 0))
		{
			player enableweaponcycling();
			player enableoffhandweapons();
			player enableweaponswitchhero();
			player thread take_use_weapon(level.var_696298a2);
			if(player getcurrentweapon() === level.var_696298a2)
			{
				player killstreaks::switch_to_last_non_killstreak_weapon();
			}
		}
		else
		{
			player setlowready(0);
		}
	}
	player.var_9dc65a85 = 0;
	if(isdefined(self.objectiveid))
	{
		objective_clearplayerusing(self.objectiveid, player);
	}
}

/*
	Name: take_use_weapon
	Namespace: fireteam_dirty_bomb
	Checksum: 0x25DCD40
	Offset: 0x70A8
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function take_use_weapon(useweapon)
{
	self endon(#"use_hold", #"death", #"disconnect");
	level endon(#"game_ended");
	while(self getcurrentweapon() == useweapon && !self.throwinggrenade)
	{
		waitframe(1);
	}
	if(is_true(useweapon.var_d2751f9d))
	{
		self val::reset(#"gameobject_use", "disable_gestures");
	}
	self takeweapon(useweapon);
}

/*
	Name: function_a05584ae
	Namespace: fireteam_dirty_bomb
	Checksum: 0xF0DF02DF
	Offset: 0x7190
	Size: 0x174
	Parameters: 0
	Flags: None
*/
function function_a05584ae()
{
	var_a737309d = 0;
	for(i = 0; i < level.var_2f418a15.size; i++)
	{
		if(level.var_2f418a15[i].state == 2)
		{
			level.var_2f418a15[i] function_b43466d5();
			level.var_2f418a15[i] = level.var_2f418a15[level.var_2f418a15.size - 1];
			level.var_2f418a15[level.var_2f418a15.size - 1] = undefined;
			i--;
			var_a737309d++;
		}
	}
	if(var_a737309d == 1)
	{
		globallogic_audio::function_61e17de0("dirtyBombOffline", getplayers());
	}
	else if(var_a737309d > 1)
	{
		globallogic_audio::function_61e17de0("dirtyBombOfflineMult", getplayers());
	}
	globallogic_audio::function_61e17de0("dirtyBombRespawnDisabled", getplayers());
}

/*
	Name: function_b43466d5
	Namespace: fireteam_dirty_bomb
	Checksum: 0x3F1F014A
	Offset: 0x7310
	Size: 0x82
	Parameters: 0
	Flags: None
*/
function function_b43466d5()
{
	self.model.killcament delete();
	self.model delete();
	objective_delete(self.objectiveid);
	gameobjects::release_obj_id(self.objectiveid);
	self.var_cc03b04e = undefined;
	self.state = 0;
}

/*
	Name: function_5c84cd7c
	Namespace: fireteam_dirty_bomb
	Checksum: 0x2D12778F
	Offset: 0x73A0
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_5c84cd7c()
{
	self.state = 3;
	function_4339912c(self.objectiveid);
	self.model playsound(#"hash_2013c3b9f7d5a632");
	self.trigger delete();
}

/*
	Name: function_4b31d6ba
	Namespace: fireteam_dirty_bomb
	Checksum: 0x909E9888
	Offset: 0x7418
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_4b31d6ba()
{
	level endon(#"game_ended");
	if(level.var_e39b6425 != 0)
	{
		self.model playsound(#"hash_4835397d4779d016");
		wait(level.var_e39b6425);
		self.model stopsound(#"hash_4835397d4779d016");
		self.model playsound(#"hash_1e349183ce55d6ff");
	}
	self function_99c4c4e5();
	self thread function_dc70ca08();
}

/*
	Name: function_99c4c4e5
	Namespace: fireteam_dirty_bomb
	Checksum: 0x6E0F7E08
	Offset: 0x7508
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_99c4c4e5()
{
	self.state = 4;
	function_6da98133(self.objectiveid);
	objective_setgamemodeflags(self.objectiveid, 3);
	objective_setprogress(self.objectiveid, 0);
	self function_6a9ca122();
	self.trigger thread function_f9f4b255();
	if(level.var_2f418a15.size == 1)
	{
		self thread function_2eeb579c();
	}
}

/*
	Name: function_6a9ca122
	Namespace: fireteam_dirty_bomb
	Checksum: 0x4B2572BC
	Offset: 0x75D0
	Size: 0x1DE
	Parameters: 0
	Flags: Private
*/
function private function_6a9ca122()
{
	self.trigger = spawn("trigger_radius_use", self.origin + vectorscale((0, 0, 1), 12), 0, 120, 90, 1);
	self.trigger triggerignoreteam();
	self.trigger setcursorhint("HINT_NOICON");
	self.trigger triggerenable(1);
	self.trigger usetriggerignoreuseholdtime();
	self.trigger sethintstring("MENU/PROMPT_DIRTY_BOMB_DETONATE");
	self.trigger callback::on_trigger(&function_2f5dd98c);
	self.trigger.bomb = self;
	self.var_dac45cd5 = spawn("trigger_radius", self.origin + vectorscale((0, 0, 1), 12), 0, 120, 90, 1);
	self.var_dac45cd5 triggerignoreteam();
	self.var_dac45cd5 triggerenable(0);
	self.var_dac45cd5 callback::on_trigger(&function_43bfe93d);
	self.var_dac45cd5 setinvisibletoall();
	self.var_dac45cd5.bomb = self;
}

/*
	Name: function_2f5dd98c
	Namespace: fireteam_dirty_bomb
	Checksum: 0x2CEC457B
	Offset: 0x77B8
	Size: 0xB4
	Parameters: 1
	Flags: Private
*/
function private function_2f5dd98c(var_7d32de2)
{
	if(is_true(level.gameended))
	{
		return;
	}
	activator = var_7d32de2.activator;
	if(is_true(activator.var_9dc65a85))
	{
		return;
	}
	bomb = self.bomb;
	if(bomb.state != 4)
	{
		return;
	}
	if(isdefined(bomb.trigger.activator))
	{
		return;
	}
	activator function_84cb44bc(bomb);
}

/*
	Name: function_84cb44bc
	Namespace: fireteam_dirty_bomb
	Checksum: 0x3768B19B
	Offset: 0x7878
	Size: 0x27E
	Parameters: 1
	Flags: Private
*/
function private function_84cb44bc(bomb)
{
	self endon(#"disconnect");
	if(bomb.state == 4)
	{
		if(!getdvarint(#"hash_6d01658e46435b76", 0))
		{
			if(self isswitchingweapons())
			{
				return;
			}
			useweapon = level.var_696298a2;
			if(is_true(useweapon.var_d2751f9d))
			{
				self val::set(#"gameobject_use", "disable_gestures");
			}
			if(!self hasweapon(useweapon))
			{
				self giveweapon(useweapon);
			}
			self setweaponammostock(useweapon, 0);
			self setweaponammoclip(useweapon, 0);
			self switchtoweapon(useweapon);
			self disableweaponcycling();
			self disableoffhandweapons();
			self disableweaponswitchhero();
		}
		else
		{
			self setlowready(1);
		}
		bomb.trigger setinvisibletoall();
		bomb.trigger setvisibletoplayer(self);
		bomb.var_dac45cd5 triggerenable(1);
		bomb.var_dac45cd5 setvisibletoteam(self.team);
		bomb.var_dac45cd5 setinvisibletoplayer(self);
		self.var_1eaa0d81 = 1;
		bomb thread function_704fdca0(self);
		bomb.trigger.activator = self;
	}
}

/*
	Name: function_43bfe93d
	Namespace: fireteam_dirty_bomb
	Checksum: 0x6DBFA6CD
	Offset: 0x7B00
	Size: 0xFC
	Parameters: 1
	Flags: Private
*/
function private function_43bfe93d(var_7d32de2)
{
	if(is_true(level.gameended))
	{
		return;
	}
	activator = var_7d32de2.activator;
	if(is_true(activator.var_9dc65a85) || activator inlaststand())
	{
		return;
	}
	bomb = self.bomb;
	if(bomb.state != 4)
	{
		return;
	}
	if(!isdefined(bomb.trigger.activator) || bomb.trigger.activator.team != activator.team)
	{
		return;
	}
	activator function_f79653f(bomb);
}

/*
	Name: function_f79653f
	Namespace: fireteam_dirty_bomb
	Checksum: 0xB34E5C30
	Offset: 0x7C08
	Size: 0xA4
	Parameters: 1
	Flags: Private
*/
function private function_f79653f(bomb)
{
	self endon(#"disconnect");
	if(bomb.state == 4)
	{
		if(!isdefined(bomb.trigger.assists))
		{
			bomb.trigger.assists = [];
		}
		bomb.trigger.assists[bomb.trigger.assists.size] = self;
		bomb thread function_704fdca0(self);
	}
}

/*
	Name: function_f9f4b255
	Namespace: fireteam_dirty_bomb
	Checksum: 0xB4932DFC
	Offset: 0x7CB8
	Size: 0x624
	Parameters: 0
	Flags: Private
*/
function private function_f9f4b255()
{
	self endon(#"death");
	self.assists = [];
	prevtime = gettime();
	var_e18791f4 = int(level.var_b06a1891 * 1000);
	var_d486b6 = 0;
	var_b1c451bf = int((level.var_f4a1440c / 0.05) * 1000);
	bomb = self.bomb;
	while(isdefined(bomb) && bomb.state == 4)
	{
		if(isdefined(self.activator))
		{
			bomb.model playloopsound(#"hash_5093c3a0e7047aa", 0.5);
			var_39c4d694 = !self.activator function_8e1791eb(bomb);
			if(var_39c4d694)
			{
				bomb thread function_ea25bba7(self.activator);
				bomb.var_dac45cd5 triggerenable(0);
				bomb.var_dac45cd5 setinvisibletoall();
				bomb.trigger setvisibletoall();
				self.activator function_63909e4a();
			}
			for(i = 0; i < self.assists.size; i++)
			{
				player = self.assists[i];
				if(var_39c4d694)
				{
					bomb thread function_ea25bba7(player);
					continue;
				}
				if(!player function_75a48e71(bomb))
				{
					bomb thread function_ea25bba7(player);
					for(j = i; j < self.assists.size; j++)
					{
						if((j + 1) >= self.assists.size)
						{
							self.assists[j] = undefined;
							continue;
						}
						self.assists[j] = self.assists[j + 1];
					}
					i--;
					continue;
				}
			}
			if(var_39c4d694)
			{
				self.assists = [];
			}
			currtime = gettime();
			if(isdefined(level.var_320e6819))
			{
				var_60f07198 = ((float(currtime - level.var_320e6819)) / 1000) / level.var_d86d5820;
				var_233ab686 = (level.var_b06a1891 - level.var_f4a1440c) * var_60f07198;
				var_e18791f4 = int((level.var_b06a1891 - var_233ab686) * 1000);
			}
			deltatime = currtime - prevtime;
			progress = deltatime * (1 + self.assists.size);
			progress = min(progress, var_b1c451bf);
			var_d486b6 = var_d486b6 + progress;
			if(var_d486b6 >= var_e18791f4)
			{
				bomb thread function_5c0f763b(self.activator);
				break;
			}
			if(var_d486b6 > 0)
			{
				if(isdefined(bomb.objectiveid))
				{
					objective_setprogress(bomb.objectiveid, var_d486b6 / var_e18791f4);
				}
				self.activator function_9db99d2f(var_d486b6 / var_e18791f4);
				self.activator function_45c10c43(self.assists.size + 1);
				foreach(player in self.assists)
				{
					player function_9db99d2f(var_d486b6 / var_e18791f4);
					player function_45c10c43(self.assists.size + 1);
				}
			}
			if(var_39c4d694)
			{
				self.activator = undefined;
			}
		}
		else if(!level.var_3a9e7236)
		{
			var_d486b6 = 0;
			if(isdefined(bomb.objectiveid))
			{
				objective_setprogress(bomb.objectiveid, 0);
			}
		}
		if(!isdefined(self.activator))
		{
			bomb.model stoploopsound(0.25);
		}
		prevtime = gettime();
		wait(0.05);
	}
	if(isdefined(bomb) && isdefined(bomb.model))
	{
		bomb.model stoploopsound(0.25);
	}
}

/*
	Name: function_8e1791eb
	Namespace: fireteam_dirty_bomb
	Checksum: 0x3E2BAC2A
	Offset: 0x82E8
	Size: 0x1D6
	Parameters: 1
	Flags: None
*/
function function_8e1791eb(bomb)
{
	if(game.state != #"playing")
	{
		return false;
	}
	if(bomb.state != 4)
	{
		return false;
	}
	if(!isalive(self))
	{
		return false;
	}
	if(self inlaststand())
	{
		return false;
	}
	if(!self usebuttonpressed())
	{
		return false;
	}
	if(!isdefined(bomb.trigger))
	{
		return false;
	}
	if(!bomb.trigger istriggerenabled())
	{
		return false;
	}
	if(self isinexecutionattack() || self isinexecutionvictim())
	{
		return false;
	}
	if(!self istouching(bomb.trigger))
	{
		return false;
	}
	if(self getcurrentweapon() === level.var_8ef8b9e8)
	{
		return false;
	}
	if(!isdefined(bomb.var_fe46e837))
	{
		bomb.var_fe46e837 = [];
	}
	playerentnum = self getentitynumber();
	if(!isdefined(bomb.var_fe46e837[playerentnum]) || bomb.var_fe46e837[playerentnum] < gettime())
	{
		bomb.var_fe46e837[playerentnum] = gettime() + 1;
		if(!function_ad9de896(self, bomb))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_75a48e71
	Namespace: fireteam_dirty_bomb
	Checksum: 0x3289E1DB
	Offset: 0x84C8
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function function_75a48e71(bomb)
{
	if(bomb.state != 4)
	{
		return false;
	}
	if(!isalive(self))
	{
		return false;
	}
	if(self inlaststand())
	{
		return false;
	}
	if(!isdefined(bomb.trigger))
	{
		return false;
	}
	if(!bomb.var_dac45cd5 istriggerenabled())
	{
		return false;
	}
	if(!self istouching(bomb.var_dac45cd5))
	{
		return false;
	}
	return true;
}

/*
	Name: function_dc70ca08
	Namespace: fireteam_dirty_bomb
	Checksum: 0x706B8F4C
	Offset: 0x8588
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_dc70ca08()
{
	self endon(#"hash_51134d620e14f47b");
	level endon(#"game_ended");
	if(level.var_451f847f == 0)
	{
		return;
	}
	wait(level.var_451f847f);
	while(isdefined(self.trigger.activator))
	{
		waitframe(1);
	}
	waitframe(1);
	self function_1283ff24(undefined);
}

/*
	Name: function_2eeb579c
	Namespace: fireteam_dirty_bomb
	Checksum: 0x68C90539
	Offset: 0x8618
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function function_2eeb579c()
{
	self endon(#"hash_51134d620e14f47b");
	level endon(#"game_ended");
	if(level.var_d86d5820 == 0)
	{
		return;
	}
	level.var_320e6819 = gettime();
	if(isdefined(self.model))
	{
		self.model clientfield::set("bombsound", 1);
	}
	wait(level.var_d86d5820);
	level.var_320e6819 = undefined;
	while(isdefined(self.trigger.activator))
	{
		waitframe(1);
	}
	waitframe(1);
	self function_1283ff24(undefined);
}

/*
	Name: function_ad44b97e
	Namespace: fireteam_dirty_bomb
	Checksum: 0x2A8752C
	Offset: 0x86F0
	Size: 0x2DC
	Parameters: 1
	Flags: None
*/
function function_ad44b97e(player)
{
	var_2dd00398 = [];
	player stats::function_dad108fa(#"hash_730e8686137b90ed", 1);
	var_2dd00398[player getentitynumber()] = 1;
	if(isdefined(self.trigger.assists) && isdefined(player.team))
	{
		foreach(var_1bb634c7 in self.trigger.assists)
		{
			if(!isplayer(var_1bb634c7))
			{
				continue;
			}
			if(var_1bb634c7.team !== player.team)
			{
				continue;
			}
			if(var_2dd00398[var_1bb634c7 getentitynumber()] === 1)
			{
				continue;
			}
			player stats::function_dad108fa(#"hash_730e8686137b90ed", 1);
			var_2dd00398[var_1bb634c7 getentitynumber()] = 1;
		}
	}
	if(isdefined(player.team) && isdefined(self.origin))
	{
		var_57fa318b = getplayers(player.team, self.origin, 600);
		foreach(var_bcf15b4 in var_57fa318b)
		{
			if(!isplayer(var_bcf15b4))
			{
				continue;
			}
			if(var_2dd00398[var_bcf15b4 getentitynumber()] === 1)
			{
				continue;
			}
			var_bcf15b4 stats::function_dad108fa(#"hash_730e8686137b90ed", 1);
			var_2dd00398[var_bcf15b4 getentitynumber()] = 1;
		}
	}
}

/*
	Name: function_5c0f763b
	Namespace: fireteam_dirty_bomb
	Checksum: 0xF64187EC
	Offset: 0x89D8
	Size: 0x39C
	Parameters: 1
	Flags: None
*/
function function_5c0f763b(player)
{
	if(!isdefined(player))
	{
		return;
	}
	self notify(#"hash_51134d620e14f47b");
	level function_28039abb();
	scoreevents::processscoreevent(#"hash_179603173879ec50", player);
	player stats::function_cc215323(#"hash_75c5c00847117bfb", 1);
	if(isdefined(player.var_e2e8198f) && player.var_e2e8198f >= (gettime() - (int(3 * 1000))))
	{
		scoreevents::processscoreevent(#"hash_54db302236ce9572", player);
	}
	self function_ad44b97e(player);
	[[level.var_37d62931]](player, 1);
	player.pers[#"dirty_bomb_detonates"] = (isdefined(player.pers[#"dirty_bomb_detonates"]) ? player.pers[#"dirty_bomb_detonates"] : 0) + 1;
	player.dirty_bomb_detonates = player.pers[#"dirty_bomb_detonates"];
	player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
	player stats::function_bb7eedf0(#"dirty_bomb_detonates", 1);
	player function_80d6d39b();
	if(!getdvarint(#"hash_6d01658e46435b76", 0))
	{
		player enableweaponcycling();
		player enableoffhandweapons();
		player enableweaponswitchhero();
		player thread take_use_weapon(level.var_696298a2);
		if(player getcurrentweapon() === level.var_696298a2)
		{
			player killstreaks::switch_to_last_non_killstreak_weapon();
		}
	}
	else
	{
		player setlowready(0);
	}
	player.var_9dc65a85 = 0;
	player function_63909e4a();
	if(isdefined(self.objectiveid))
	{
		objective_clearplayerusing(self.objectiveid, player);
	}
	for(i = 0; i < self.trigger.assists.size; i++)
	{
		self thread function_ea25bba7(self.trigger.assists[i]);
	}
	self function_1283ff24(player);
}

/*
	Name: function_1a29cdb0
	Namespace: fireteam_dirty_bomb
	Checksum: 0x65EBED12
	Offset: 0x8D80
	Size: 0xF0
	Parameters: 1
	Flags: None
*/
function function_1a29cdb0(winningteam)
{
	if(!isdefined(level.var_edac6118))
	{
		level.var_edac6118 = 0;
	}
	if(!level.var_edac6118)
	{
		foreach(_ in level.teams)
		{
			if(losingteam != winningteam)
			{
				globallogic_audio::function_61e17de0("objLosing", getplayers(losingteam));
			}
		}
		level.var_edac6118 = 1;
	}
}

/*
	Name: function_e2d09d87
	Namespace: fireteam_dirty_bomb
	Checksum: 0xF5FCE9D7
	Offset: 0x8E78
	Size: 0x188
	Parameters: 1
	Flags: None
*/
function function_e2d09d87(team)
{
	if(!isdefined(level.dirtybombscore50))
	{
		level.dirtybombscore50 = [];
	}
	if(!isdefined(level.dirtybombscore75))
	{
		level.dirtybombscore75 = [];
	}
	if(!isdefined(team))
	{
		return;
	}
	scorelimit = (level.scorelimit > 0 ? level.scorelimit : 1);
	scorepercentage = getteamscore(team) / scorelimit;
	if(scorepercentage >= 0.75)
	{
		if(!isdefined(level.dirtybombscore75[team]))
		{
			globallogic_audio::function_61e17de0("dirtyBombScore75", getplayers(team));
		}
		level.dirtybombscore75[team] = 1;
		function_1a29cdb0(team);
	}
	else if(scorepercentage >= 0.5)
	{
		if(!isdefined(level.dirtybombscore50[team]))
		{
			globallogic_audio::function_61e17de0("dirtyBombScore50", getplayers(team));
		}
		level.dirtybombscore50[team] = 1;
	}
}

/*
	Name: function_28039abb
	Namespace: fireteam_dirty_bomb
	Checksum: 0x146F5BC
	Offset: 0x9008
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_28039abb(var_aaba141c)
{
	if(!isdefined(level.var_7392007f))
	{
		level.var_7392007f = "";
	}
	var_aaba141c = function_7fc57bc9();
	var_9c1ed9ea = undefined;
	if(var_aaba141c >= 0.925)
	{
		var_9c1ed9ea = "ftdb_endgame_high";
	}
	else
	{
		if(var_aaba141c >= 0.85)
		{
			var_9c1ed9ea = "ftdb_endgame_med";
		}
		else if(var_aaba141c >= 0.75)
		{
			var_9c1ed9ea = "ftdb_endgame_low";
		}
	}
	if(!isdefined(var_9c1ed9ea))
	{
		return;
	}
	if(level.var_7392007f != var_9c1ed9ea)
	{
		level thread globallogic_audio::function_6fbfba95(var_9c1ed9ea);
		level.var_7392007f = var_9c1ed9ea;
		if(!is_true(level.var_acf54eb7))
		{
			level.var_acf54eb7 = 1;
			clientfield::set("sndDeactivateSquadSpawnMusic", 1);
		}
	}
}

/*
	Name: function_7fc57bc9
	Namespace: fireteam_dirty_bomb
	Checksum: 0x2AA9A54E
	Offset: 0x9148
	Size: 0x112
	Parameters: 0
	Flags: None
*/
function function_7fc57bc9()
{
	if(!isdefined(level.teams))
	{
		return 0;
	}
	scorelimit = (level.scorelimit > 0 ? level.scorelimit : 1);
	var_ab9897d4 = [];
	foreach(team in level.teams)
	{
		array::add(var_ab9897d4, getteamscore(team) / scorelimit);
	}
	array::sort_by_value(var_ab9897d4);
	return var_ab9897d4[0];
}

/*
	Name: function_1283ff24
	Namespace: fireteam_dirty_bomb
	Checksum: 0xFD175CA2
	Offset: 0x9268
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_1283ff24(player)
{
	if(game.state != #"playing")
	{
		return;
	}
	if(isdefined(self.objectiveid))
	{
		objective_setgamemodeflags(self.objectiveid, 1);
		objective_setteam(self.objectiveid, (isdefined(player.team) ? player.team : #"hash_34db99d80fb3607f"));
		objective_setprogress(self.objectiveid, 0);
	}
	self.state = 5;
	self.trigger delete();
	self.var_dac45cd5 delete();
	if(isdefined(self.model))
	{
		self.model namespace_b77e8eb1::function_1cb7e339();
		self.model clientfield::set("bombsound", 0);
	}
	self thread function_5d6231a6(player);
}

/*
	Name: function_5d6231a6
	Namespace: fireteam_dirty_bomb
	Checksum: 0xBCCD0A2B
	Offset: 0x93C8
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_5d6231a6(player)
{
	level endon(#"game_ended");
	team = undefined;
	if(isdefined(player))
	{
		team = player.team;
		function_93098bd9("dirtyBombArmedFriendly", player.team, self.origin, 4500);
		function_e43bca0f("dirtyBombArmedEnemy", player.team, self.origin, 4500);
	}
	if(level.var_46f2c796 != 0)
	{
		self.model playloopsound(#"hash_78cdfb1438b360bf", 1);
		wait(level.var_46f2c796);
		if(isdefined(self.model))
		{
			self.model stoploopsound(0.5);
		}
	}
	self function_91c39737(player, team);
}

/*
	Name: function_91c39737
	Namespace: fireteam_dirty_bomb
	Checksum: 0x956D14D1
	Offset: 0x9508
	Size: 0x54C
	Parameters: 2
	Flags: None
*/
function function_91c39737(player, team)
{
	origin = self.origin;
	damage = level.var_60e3f99c;
	playsoundatposition("exp_dirty_bomb_explo", origin + vectorscale((0, 0, 1), 60));
	if(isdefined(player))
	{
		function_93098bd9("dirtyBombDetonatedFriendly", player.team, self.origin, 4500);
		function_e43bca0f("dirtyBombDetonatedEnemy", player.team, self.origin, 4500);
	}
	else
	{
		globallogic_audio::function_61e17de0("dirtyBombDetonatedEnemy", getplayers(undefined, self.origin, 4500));
	}
	if(level.var_77720414 && isdefined(team))
	{
		globallogic_score::giveteamscoreforobjective(team, level.var_77720414);
		function_e2d09d87(team);
	}
	entities = getdamageableentarray(origin, level.var_60693fca, 1);
	foreach(entity in entities)
	{
		if(!isalive(entity))
		{
			continue;
		}
		if(isplayer(entity))
		{
			entity.var_f5dc0dbf = 1;
			if(isdefined(player.team) && isdefined(entity.team) && entity.team == player.team)
			{
				entity dodamage(damage, origin, entity, self.model, undefined, "MOD_EXPLOSIVE");
				continue;
			}
		}
		entity.killcamkilledbyent = self.model.killcament;
		entity.killcament = self.model.killcament;
		entity dodamage(damage, origin, player, self.model, undefined, "MOD_EXPLOSIVE");
	}
	fwd = (0, 0, 1);
	right = (0, -1, 0);
	playfx("wz/fx9_dirtybomb_exp", origin, fwd, right);
	if(isentity(self.model))
	{
		self.model.killcament delete();
		self.model delete();
	}
	if(isdefined(self.objectiveid))
	{
		objectiveid = self.objectiveid;
		objective_setgamemodeflags(self.objectiveid, 4);
		level.var_910f361c[level.var_910f361c.size] = self.objectiveid;
		objective_setinvisibletoall(self.objectiveid);
		self.objectiveid = undefined;
	}
	/#
		oldsize = level.var_2f418a15.size;
	#/
	for(i = 0; i < level.var_2f418a15.size; i++)
	{
		if(level.var_2f418a15[i] == self)
		{
			level.var_2f418a15[i] = level.var_2f418a15[level.var_2f418a15.size - 1];
			level.var_2f418a15[level.var_2f418a15.size - 1] = undefined;
			break;
		}
	}
	self.state = 0;
	if(level.var_2f418a15.size == 1 && level.var_2f418a15[0].state == 4)
	{
		level.var_2f418a15[0] thread function_2eeb579c();
	}
	if(level.var_2c9f7c6b)
	{
		self namespace_b77e8eb1::function_a5caaee0();
	}
	if(level.var_2064692e == 2)
	{
		level function_cca53f41(objectiveid, self.objindex);
	}
}

/*
	Name: function_53d7badf
	Namespace: fireteam_dirty_bomb
	Checksum: 0x7922918A
	Offset: 0x9A60
	Size: 0xC8
	Parameters: 1
	Flags: Private
*/
function private function_53d7badf(visible)
{
	foreach(bomb in level.var_2f418a15)
	{
		if(!isdefined(bomb.state) || bomb.state != 2)
		{
			continue;
		}
		bomb.trigger setinvisibletoplayer(self, !visible);
	}
}

/*
	Name: function_6e23e4cb
	Namespace: fireteam_dirty_bomb
	Checksum: 0xC041DE69
	Offset: 0x9B30
	Size: 0x104
	Parameters: 1
	Flags: Private
*/
function private function_6e23e4cb(var_f87ac426)
{
	if(!isdefined(var_f87ac426))
	{
		var_f87ac426 = undefined;
	}
	if(isdefined(var_f87ac426))
	{
		self setinvisibletoall();
		foreach(player in getplayers())
		{
			if(player != var_f87ac426 && player.team == var_f87ac426.team)
			{
				self setvisibletoplayer(player);
			}
		}
	}
	else
	{
		self setvisibletoall();
	}
}

/*
	Name: function_3bf6db8b
	Namespace: fireteam_dirty_bomb
	Checksum: 0x46F4C384
	Offset: 0x9C40
	Size: 0x10A
	Parameters: 2
	Flags: Private
*/
function private function_3bf6db8b(state, usetrigger)
{
	if(!level.var_64731636 dirtybomb_usebar::is_open(self))
	{
		level.var_64731636 dirtybomb_usebar::open(self, 4);
	}
	level.var_64731636 dirtybomb_usebar::set_state(self, state);
	level.var_64731636 dirtybomb_usebar::set_progressfrac(self, 0);
	if(isarray(usetrigger.assists))
	{
		level.var_64731636 dirtybomb_usebar::set_activatorcount(self, usetrigger.assists.size + 1);
	}
	usetrigger setinvisibletoplayer(self, 1);
	self.var_814cca3f = usetrigger;
}

/*
	Name: function_80d6d39b
	Namespace: fireteam_dirty_bomb
	Checksum: 0xE2FF70C9
	Offset: 0x9D58
	Size: 0xAE
	Parameters: 0
	Flags: Private
*/
function private function_80d6d39b()
{
	if(!isplayer(self))
	{
		return;
	}
	self clientfield::set_to_player("using_bomb", 0);
	if(level.var_64731636 dirtybomb_usebar::is_open(self))
	{
		level.var_64731636 dirtybomb_usebar::close(self);
	}
	if(isdefined(self.var_814cca3f))
	{
		self.var_814cca3f setinvisibletoplayer(self, 0);
		self.var_814cca3f = undefined;
	}
}

/*
	Name: function_9db99d2f
	Namespace: fireteam_dirty_bomb
	Checksum: 0x28D08AE7
	Offset: 0x9E10
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private function_9db99d2f(frac)
{
	if(level.var_64731636 dirtybomb_usebar::is_open(self))
	{
		level.var_64731636 dirtybomb_usebar::set_progressfrac(self, frac);
	}
}

/*
	Name: function_45c10c43
	Namespace: fireteam_dirty_bomb
	Checksum: 0x17E6378A
	Offset: 0x9E68
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private function_45c10c43(count)
{
	if(level.var_64731636 dirtybomb_usebar::is_open(self))
	{
		level.var_64731636 dirtybomb_usebar::set_activatorcount(self, count);
	}
}

/*
	Name: function_afa7ee8d
	Namespace: fireteam_dirty_bomb
	Checksum: 0xD4551607
	Offset: 0x9EC0
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_afa7ee8d()
{
	level endon(#"game_ended");
	level waittill(#"item_world_reset");
	level thread function_588a586d(#"dirty_bomb_stash", level.var_b9f31e66);
}

/*
	Name: function_588a586d
	Namespace: fireteam_dirty_bomb
	Checksum: 0x5FC6B20D
	Offset: 0x9F28
	Size: 0x1A4
	Parameters: 2
	Flags: None
*/
function function_588a586d(targetname, probability)
{
	level flag::wait_till(#"item_world_reset");
	dynents = item_world::function_7a0c5d2e(probability, targetname);
	var_b0d9d129 = spawnstruct();
	var_81e77cec = [];
	var_d73eec3b = [];
	foreach(dynent in dynents)
	{
		dynent.onuse = &chest_opened;
		if(function_ffdbe8c2(dynent) == 3)
		{
			var_81e77cec[var_81e77cec.size] = dynent;
			continue;
		}
		var_d73eec3b[var_d73eec3b.size] = dynent;
	}
	var_81e77cec = array::randomize(var_81e77cec);
	var_b0d9d129.targetname = targetname;
	var_b0d9d129.var_81e77cec = var_81e77cec;
	var_b0d9d129.var_d73eec3b = var_d73eec3b;
	level thread function_361e7925(var_b0d9d129);
}

/*
	Name: function_657c0cbf
	Namespace: fireteam_dirty_bomb
	Checksum: 0x68D3D2D5
	Offset: 0xA0D8
	Size: 0x22C
	Parameters: 2
	Flags: None
*/
function function_657c0cbf(container, var_b0d9d129)
{
	level endon(#"game_ended");
	wait(level.var_8c05a764);
	item_world::function_160294c7(container);
	wait(randomintrange(level.var_89a6bd00, level.var_65a0fe4d));
	if(var_b0d9d129.var_81e77cec.size <= 0)
	{
		return;
	}
	if(isdefined(var_b0d9d129.var_81e77cec[0].var_b91441dd.var_7fb0967b))
	{
		var_b9ea4e83 = sqr(var_b0d9d129.var_81e77cec[0].var_b91441dd.var_7fb0967b);
		for(var_8017ce8 = 0; var_8017ce8 < var_b0d9d129.var_81e77cec.size; var_8017ce8++)
		{
			var_da1a8a8a = var_b0d9d129.var_81e77cec[var_8017ce8];
			var_9bf5a850 = 1;
			for(var_31371606 = 0; var_31371606 < var_b0d9d129.var_d73eec3b.size; var_31371606++)
			{
				var_f51e9342 = var_b0d9d129.var_d73eec3b[var_31371606];
				if(distancesquared(var_da1a8a8a.origin, var_f51e9342.origin) < var_b9ea4e83)
				{
					var_9bf5a850 = 0;
					break;
				}
			}
			if(var_9bf5a850)
			{
				break;
			}
			var_da1a8a8a = undefined;
		}
	}
	if(!isdefined(var_da1a8a8a))
	{
		var_da1a8a8a = var_b0d9d129.var_81e77cec[0];
	}
	arrayremoveindex(var_b0d9d129.var_81e77cec, 0, 0);
	item_world::function_8eee98dd(var_da1a8a8a);
	var_da1a8a8a.onuse = &chest_opened;
	var_b0d9d129.var_d73eec3b[var_b0d9d129.var_d73eec3b.size] = var_da1a8a8a;
}

/*
	Name: function_361e7925
	Namespace: fireteam_dirty_bomb
	Checksum: 0x1BF022AB
	Offset: 0xA310
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_361e7925(var_b0d9d129)
{
	level endon(#"game_ended");
	while(true)
	{
		container = undefined;
		container = level waittill(var_b0d9d129.targetname + "_opened");
		arrayremovevalue(var_b0d9d129.var_d73eec3b, container, 0);
		var_b0d9d129.var_81e77cec[var_b0d9d129.var_81e77cec.size] = container;
		level thread function_657c0cbf(container, var_b0d9d129);
	}
}

/*
	Name: chest_opened
	Namespace: fireteam_dirty_bomb
	Checksum: 0x48C77D59
	Offset: 0xA3C8
	Size: 0x5E
	Parameters: 3
	Flags: None
*/
function chest_opened(activator, laststate, state)
{
	if(state == 2)
	{
		level notify((isdefined(self.targetname) ? self.targetname : self.target) + "_opened", self);
	}
}

/*
	Name: function_c0e544cc
	Namespace: fireteam_dirty_bomb
	Checksum: 0xFC5D532A
	Offset: 0xA430
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_c0e544cc(params)
{
	player = params.player;
	player endon(#"death", #"disconnect");
	while(true)
	{
		if(player isonground())
		{
			break;
		}
		wait(1);
	}
	player luinotifyevent(#"hash_6b67aa04e378d681", 1, 13);
}

/*
	Name: function_b7821ed9
	Namespace: fireteam_dirty_bomb
	Checksum: 0xA3C68850
	Offset: 0xA4D8
	Size: 0x1D6
	Parameters: 1
	Flags: None
*/
function function_b7821ed9(var_b77770ba)
{
	if(isdefined(var_b77770ba) && (var_b77770ba % 2) == 0)
	{
		return;
	}
	if(!isdefined(level.var_2f418a15) || level.var_2f418a15.size <= 0)
	{
		return;
	}
	bomborigin = level.var_2f418a15[randomintrange(0, level.var_2f418a15.size)].origin;
	if(!isdefined(bomborigin))
	{
		return;
	}
	for(index = 0; index < 10; index++)
	{
		radius = randomfloatrange(0, 1);
		var_bd74a98c = sqrt(radius) * 3000;
		degree = randomintrange(0, 360);
		x = var_bd74a98c * cos(degree);
		y = var_bd74a98c * sin(degree);
		droppoint = (bomborigin[0] + x, bomborigin[1] + y, bomborigin[2]);
		if(!oob::chr_party(droppoint))
		{
			if(isdefined(function_9cc082d2(droppoint, 15000)))
			{
				return droppoint;
			}
		}
	}
}

