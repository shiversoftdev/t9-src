#using scripts\core_common\system_shared.gsc;
#using script_471b31bd963b388e;
#using script_4108035fe400ce67;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_c8382500;

/*
	Name: __init__system__
	Namespace: namespace_c8382500
	Checksum: 0x77AE5477
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_63f9eec221c850be", &function_70a657d8, undefined, undefined, #"item_world");
}

/*
	Name: function_70a657d8
	Namespace: namespace_c8382500
	Checksum: 0x666ED342
	Offset: 0x100
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!item_inventory::function_7d5553ac())
	{
		level.var_e8af489f = &function_23b313bd;
	}
}

/*
	Name: function_a7b7d70b
	Namespace: namespace_c8382500
	Checksum: 0x2AEEE194
	Offset: 0x138
	Size: 0xB4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a7b7d70b(player, var_bd027dd9)
{
	if(item_inventory::function_7d5553ac())
	{
		return;
	}
	item = player item_inventory::get_inventory_item(var_bd027dd9);
	if(isdefined(item) && isdefined(item.var_a6762160) && is_true(item.var_a6762160.consumable))
	{
		player function_b00db06(15, item.var_bd027dd9);
	}
}

/*
	Name: function_23b313bd
	Namespace: namespace_c8382500
	Checksum: 0xF7D14C2B
	Offset: 0x1F8
	Size: 0xC4A
	Parameters: 4
	Flags: Linked, Private
*/
function private function_23b313bd(player, eventtype, eventdata, var_c5a66313)
{
	if(is_true(level.var_ab396c31))
	{
		return;
	}
	if(!isdefined(player))
	{
		return;
	}
	switch(eventtype)
	{
		case 1:
		{
			return;
		}
		case 2:
		{
			var_c1ea9cae = is_true(eventdata);
			player.var_c1ea9cae = var_c1ea9cae;
		}
	}
	item_world::function_1b11e73c();
	if(!isdefined(player) || !isalive(player))
	{
		return;
	}
	if(eventtype == 4 || eventtype == 11)
	{
		var_bd027dd9 = eventdata;
		quickequip = var_c5a66313;
		weaponid = (eventtype == 11 ? 1 : 0);
		if(player inlaststand() || !isdefined(player.inventory) || !player item_inventory::equip_item(var_bd027dd9, quickequip === 1, weaponid))
		{
			function_a7b7d70b(player, var_bd027dd9);
		}
		else
		{
			itemid = player item_inventory::function_c48cd17f(var_bd027dd9);
			if(itemid != 32767)
			{
				item = function_b1702735(itemid);
				if(isdefined(item) && isdefined(item.var_a6762160))
				{
					item_world::function_1a46c8ae(player, undefined, undefined, item.var_a6762160, item.var_a6762160.amount);
				}
			}
		}
		return;
	}
	if(player inlaststand())
	{
		return;
	}
	if(!isdefined(player.inventory))
	{
		return;
	}
	switch(eventtype)
	{
		case 3:
		case 12:
		{
			var_bd027dd9 = eventdata;
			if(player clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2)
			{
				item = item_world::function_528ca826(var_bd027dd9);
				if(isdefined(item) && player item_world_util::can_pick_up(item))
				{
					success = player item_world::pickup_item(item, 1, eventtype == 12);
					if(success)
					{
						stash = item_world_util::function_31f5aa51(item);
						if(isdefined(stash) && is_true(stash.lootlocker))
						{
							var_97809692 = player item_inventory::function_2e711614(10);
							if(var_97809692.var_a6762160.name == #"resource_item_loot_locker_key")
							{
								player item_inventory::use_inventory_item(var_97809692.var_bd027dd9, 1);
								if(!isdefined(player.var_fbcc86d3))
								{
									player.var_fbcc86d3 = [];
								}
								player.var_fbcc86d3[item.var_a6762160.weapon.name] = 1;
							}
							var_97809692 = player item_inventory::function_2e711614(10);
							if(!isdefined(var_97809692.var_a6762160) || var_97809692.var_a6762160.name != #"resource_item_loot_locker_key")
							{
								stash.var_193b3626 = undefined;
							}
							if(!isdefined(stash.var_80b1d504))
							{
								stash.var_80b1d504 = 0;
							}
							stash.var_80b1d504 = stash.var_80b1d504 + 1;
						}
					}
				}
			}
			break;
		}
		case 5:
		{
			var_bd027dd9 = eventdata;
			count = var_c5a66313;
			var_a1ca235e = undefined;
			var_3d1f9df4 = undefined;
			if(item_world_util::function_2c7fc531(var_bd027dd9))
			{
				itemid = var_bd027dd9;
				item = function_b1702735(itemid);
				/#
					assert(item.var_a6762160.itemtype == #"ammo");
				#/
				if(item.var_a6762160.itemtype == #"ammo")
				{
					var_a1ca235e = item.var_a6762160;
					var_3d1f9df4 = count;
					player item_inventory::function_ecd1c667(itemid, count);
				}
			}
			else
			{
				if(var_bd027dd9 == 32767)
				{
					return;
				}
				inventory_item = player item_inventory::get_inventory_item(var_bd027dd9);
				if(!isdefined(inventory_item))
				{
					break;
				}
				var_104acafa = isdefined(inventory_item.endtime);
				if(!isdefined(count) || count === inventory_item.count || var_104acafa)
				{
					var_3d1f9df4 = (isdefined(count) ? count : inventory_item.var_a6762160.amount);
					player item_inventory::drop_inventory_item(var_bd027dd9);
				}
				else
				{
					var_3d1f9df4 = count;
					player item_inventory::function_cfe0e919(var_bd027dd9, count);
				}
			}
			item_world::function_1a46c8ae(player, var_a1ca235e, var_3d1f9df4, undefined, undefined);
			break;
		}
		case 6:
		{
			var_bd027dd9 = eventdata;
			var_c3f14af5 = player item_inventory::function_777cc133();
			if(isdefined(var_c3f14af5))
			{
				player item_inventory::function_d019bf1d(var_bd027dd9);
				attachmentslot = player item_inventory::function_b246c573(var_bd027dd9);
				if(isdefined(attachmentslot))
				{
					player item_inventory::function_26c87da8(attachmentslot, var_c3f14af5);
				}
			}
			break;
		}
		case 7:
		{
			var_bd027dd9 = eventdata;
			var_fc7876fd = var_c5a66313;
			item = item_world::function_528ca826(var_bd027dd9);
			if(!isdefined(item))
			{
				return;
			}
			origin = player getplayercamerapos();
			if(distance2dsquared(origin, item.origin) > sqr(128) || (abs(origin[2] - item.origin[2])) > 128)
			{
				return;
			}
			if(!isdefined(item) || !isdefined(item.var_a6762160))
			{
				return;
			}
			if(item.var_a6762160.itemtype == #"weapon")
			{
				var_bd31d7b2 = player item_inventory::function_ec087745();
				if(var_fc7876fd == 1 && var_bd31d7b2 != 32767)
				{
					player item_inventory::function_9d102bbd(item, var_bd31d7b2);
				}
				else
				{
					player item_world::pickup_item(item, 1);
				}
			}
			else
			{
				if(var_fc7876fd == 2)
				{
					player item_inventory::function_fba40e6c(item);
					break;
				}
				var_641d3dc2 = item.var_a6762160.itemtype != #"attachment";
				var_a6762160 = item.var_a6762160;
				player item_world::pickup_item(item, var_641d3dc2);
				if(var_fc7876fd == 1 || var_fc7876fd == 2)
				{
					if(isdefined(var_a6762160))
					{
						inventoryitem = player item_inventory::function_8babc9f9(var_a6762160);
					}
					if(isdefined(inventoryitem))
					{
						switch(inventoryitem.var_a6762160.itemtype)
						{
							case "tactical":
							case "equipment":
							case "field_upgrade":
							{
								player item_inventory::equip_equipment(inventoryitem);
								break;
							}
							case "health":
							{
								player item_inventory::equip_health(inventoryitem);
								break;
							}
							case "hash_63c2e39c90346280":
							case "hash_63c2e49c90346433":
							case "hash_63c2e59c903465e6":
							{
								player item_inventory::function_854cf2c3(inventoryitem);
								break;
							}
							case "scorestreak":
							{
								player item_inventory::function_1ac37022(inventoryitem);
								break;
							}
						}
					}
				}
			}
			break;
		}
		case 8:
		{
			var_bd027dd9 = eventdata;
			player item_inventory::function_9ba10b94(var_bd027dd9);
			break;
		}
		case 10:
		{
			player item_inventory::cycle_health_item();
			break;
		}
		case 9:
		{
			player item_inventory::cycle_equipment_item();
			break;
		}
		case 13:
		{
			item = eventdata;
			cost = var_c5a66313;
			if(isdefined(item) && isdefined(cost))
			{
				if(isdefined(level.var_df225c5e))
				{
					[[level.var_df225c5e]](item, cost, player);
				}
			}
		}
		case 14:
		{
			player item_inventory::function_fa4bb600();
			break;
		}
		case 15:
		{
			player item_inventory::function_a50547af();
			break;
		}
	}
}

