#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\loadout_shared.gsc;
#using script_471b31bd963b388e;
#using script_4108035fe400ce67;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_1d9319e5;

/*
	Name: __init__system__
	Namespace: namespace_1d9319e5
	Checksum: 0x3B77FF36
	Offset: 0x108
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_f11f051d1c7994a", &function_70a657d8, undefined, undefined, #"item_world");
}

/*
	Name: function_70a657d8
	Namespace: namespace_1d9319e5
	Checksum: 0x1A8D9684
	Offset: 0x158
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!item_inventory::function_7d5553ac())
	{
		return;
	}
	level.var_174c7c61 = 1;
	function_116fd9a7();
}

/*
	Name: function_116fd9a7
	Namespace: namespace_1d9319e5
	Checksum: 0x25344E82
	Offset: 0x1A0
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_116fd9a7()
{
	item_world::function_861f348d(#"hash_1f0d729dc6dd1202", &function_898628ef);
	item_world::function_861f348d(#"hash_20ffbe34a3390916", &function_6598f0a0);
}

/*
	Name: function_77512b90
	Namespace: namespace_1d9319e5
	Checksum: 0x475963B6
	Offset: 0x210
	Size: 0x154
	Parameters: 2
	Flags: Linked, Private
*/
function private function_77512b90(killstreakbundle, var_e8992218)
{
	if(!isdefined(var_e8992218))
	{
		var_e8992218 = 0;
	}
	/#
		assert(isplayer(self));
	#/
	self notify(#"hash_5cd53481d07fa89c");
	self endon(#"death", #"disconnect", #"hash_5cd53481d07fa89c");
	if(isdefined(self.var_48590990))
	{
		waittime = (int(3 * 1000)) - (gettime() - self.var_48590990);
		if(waittime > 0)
		{
			wait(float(waittime) / 1000);
		}
	}
	if(var_e8992218)
	{
		wait(1);
	}
	self.var_48590990 = gettime();
	self killstreaks::add_to_notification_queue(level.killstreaks[killstreakbundle.var_d3413870].menuname, undefined, killstreakbundle.var_d3413870, undefined, 1);
}

/*
	Name: function_898628ef
	Namespace: namespace_1d9319e5
	Checksum: 0x925E0F83
	Offset: 0x370
	Size: 0x4E4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_898628ef(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	killstreakbundle = getscriptbundle(itemid.var_a6762160.killstreak);
	result = 0;
	killstreakname = undefined;
	if(isdefined(killstreakbundle) && isdefined(killstreakbundle.var_fc0c8eae) && isdefined(killstreakbundle.var_fc0c8eae.name))
	{
		killstreakname = killstreakbundle.var_fc0c8eae.name;
	}
	else if(isdefined(killstreakbundle.var_d3413870))
	{
		killstreakname = killstreakbundle.var_d3413870;
	}
	if(isdefined(killstreakname))
	{
		var_e8992218 = 0;
		weapons = itemcount getweaponslist();
		foreach(weapon in weapons)
		{
			var_16f12c31 = item_world_util::function_3531b9ba(weapon.name);
			if(!isdefined(var_16f12c31))
			{
				continue;
			}
			ammo = itemcount getweaponammostock(weapon);
			hasammo = ammo > 0;
			if(hasammo)
			{
				itempoint = function_4ba8fde(var_16f12c31);
				var_390fc2d8 = getscriptbundle(itempoint.var_a6762160.killstreak);
				if(var_390fc2d8.var_fc0c8eae.name == #"inventory_planemortar")
				{
					ammo = (isdefined(itemcount.pers[#"hash_1aaccfe69e328d6e"][3]) ? itemcount.pers[#"hash_1aaccfe69e328d6e"][3] : 3);
				}
				level thread item_drop::drop_item(0, undefined, 1, ammo, itempoint.id, itemcount.origin + (anglestoforward(itemcount.angles) * randomfloatrange(10, 30)), itemcount.angles, 2);
				var_e8992218 = 1;
			}
			itemcount takeweapon(weapon);
		}
		itemcount.pers[#"killstreaks"] = [];
		itemcount.pers[#"hash_1aaccfe69e328d6e"] = [];
		result = killstreaks::give(killstreakname, undefined, undefined, undefined, undefined);
		if(isdefined(slotid) && slotid > 0 && isdefined(killstreakbundle.var_fc0c8eae))
		{
			if(killstreakbundle.var_fc0c8eae.name == #"inventory_planemortar")
			{
				itemcount.pers[#"hash_1aaccfe69e328d6e"][3] = slotid;
				clientfield::set_player_uimodel("hudItems.planeMortarShotsRemaining", slotid);
				itemcount loadout::function_3ba6ee5d(killstreakbundle.var_fc0c8eae, 1);
				itemcount.pers[#"held_killstreak_ammo_count"][killstreakbundle.var_fc0c8eae] = 1;
			}
			else
			{
				itemcount loadout::function_3ba6ee5d(killstreakbundle.var_fc0c8eae, slotid);
				itemcount.pers[#"held_killstreak_ammo_count"][killstreakbundle.var_fc0c8eae] = slotid;
			}
		}
		itemcount thread function_77512b90(killstreakbundle, var_e8992218);
	}
	if(result)
	{
		return var_aec6fa7f - 1;
	}
	return var_aec6fa7f;
}

/*
	Name: function_6598f0a0
	Namespace: namespace_1d9319e5
	Checksum: 0xE79ACA9F
	Offset: 0x860
	Size: 0x9E
	Parameters: 7
	Flags: Linked, Private
*/
function private function_6598f0a0(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	var_6a4efe8e = var_aec6fa7f clientfield::get_player_uimodel("hud_items.selfReviveAvailable");
	if(var_6a4efe8e)
	{
		return slotid;
	}
	var_aec6fa7f clientfield::set_player_uimodel("hud_items.selfReviveAvailable", 1);
	return slotid - 1;
}

