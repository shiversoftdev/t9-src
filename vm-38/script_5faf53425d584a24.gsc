#using script_1c65dbfc2f1c8d8f;
#using script_4108035fe400ce67;
#using script_471b31bd963b388e;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_c8382500;

/*
	Name: function_f1e644e8
	Namespace: namespace_c8382500
	Checksum: 0x2E42CAF6
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f1e644e8()
{
	level notify(943472165);
}

/*
	Name: function_89f2df9
	Namespace: namespace_c8382500
	Checksum: 0xD349229F
	Offset: 0xD0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_63f9eec221c850be", &function_70a657d8, undefined, undefined, #"item_world");
}

/*
	Name: function_70a657d8
	Namespace: namespace_c8382500
	Checksum: 0xCF51AF98
	Offset: 0x120
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_b376ff3f::function_7d5553ac())
	{
		level.var_e8af489f = &function_23b313bd;
	}
}

/*
	Name: function_a7b7d70b
	Namespace: namespace_c8382500
	Checksum: 0x7A956D69
	Offset: 0x158
	Size: 0xB4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a7b7d70b(player, var_bd027dd9)
{
	if(namespace_b376ff3f::function_7d5553ac())
	{
		return;
	}
	item = player namespace_b376ff3f::function_dfcacdc2(var_bd027dd9);
	if(isdefined(item) && isdefined(item.var_a6762160) && is_true(item.var_a6762160.consumable))
	{
		player function_b00db06(15, item.var_bd027dd9);
	}
}

/*
	Name: function_23b313bd
	Namespace: namespace_c8382500
	Checksum: 0x503400A
	Offset: 0x218
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
		if(player inlaststand() || !isdefined(player.inventory) || !player namespace_b376ff3f::function_5a0ba107(var_bd027dd9, quickequip === 1, weaponid))
		{
			function_a7b7d70b(player, var_bd027dd9);
		}
		else
		{
			var_d8138db2 = player namespace_b376ff3f::function_c48cd17f(var_bd027dd9);
			if(var_d8138db2 != 32767)
			{
				item = function_b1702735(var_d8138db2);
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
				if(isdefined(item) && player namespace_ad5a0cd6::can_pick_up(item))
				{
					success = player item_world::pickup_item(item, 1, eventtype == 12);
					if(success)
					{
						stash = namespace_ad5a0cd6::function_31f5aa51(item);
						if(isdefined(stash) && is_true(stash.var_1ed4b650))
						{
							var_97809692 = player namespace_b376ff3f::function_2e711614(10);
							if(var_97809692.var_a6762160.name == #"hash_211559ff9a516b7d")
							{
								player namespace_b376ff3f::function_6e376bb1(var_97809692.var_bd027dd9, 1);
								if(!isdefined(player.var_fbcc86d3))
								{
									player.var_fbcc86d3 = [];
								}
								player.var_fbcc86d3[item.var_a6762160.weapon.name] = 1;
							}
							var_97809692 = player namespace_b376ff3f::function_2e711614(10);
							if(!isdefined(var_97809692.var_a6762160) || var_97809692.var_a6762160.name != #"hash_211559ff9a516b7d")
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
			if(namespace_ad5a0cd6::function_2c7fc531(var_bd027dd9))
			{
				var_d8138db2 = var_bd027dd9;
				item = function_b1702735(var_d8138db2);
				/#
					assert(item.var_a6762160.itemtype == #"ammo");
				#/
				if(item.var_a6762160.itemtype == #"ammo")
				{
					var_a1ca235e = item.var_a6762160;
					var_3d1f9df4 = count;
					player namespace_b376ff3f::function_ecd1c667(var_d8138db2, count);
				}
			}
			else
			{
				if(var_bd027dd9 == 32767)
				{
					return;
				}
				var_86afeb67 = player namespace_b376ff3f::function_dfcacdc2(var_bd027dd9);
				if(!isdefined(var_86afeb67))
				{
					break;
				}
				var_104acafa = isdefined(var_86afeb67.endtime);
				if(!isdefined(count) || count === var_86afeb67.count || var_104acafa)
				{
					var_3d1f9df4 = (isdefined(count) ? count : var_86afeb67.var_a6762160.amount);
					player namespace_b376ff3f::function_418f9eb8(var_bd027dd9);
				}
				else
				{
					var_3d1f9df4 = count;
					player namespace_b376ff3f::function_cfe0e919(var_bd027dd9, count);
				}
			}
			item_world::function_1a46c8ae(player, var_a1ca235e, var_3d1f9df4, undefined, undefined);
			break;
		}
		case 6:
		{
			var_bd027dd9 = eventdata;
			var_c3f14af5 = player namespace_b376ff3f::function_777cc133();
			if(isdefined(var_c3f14af5))
			{
				player namespace_b376ff3f::function_d019bf1d(var_bd027dd9);
				var_5a2df6f9 = player namespace_b376ff3f::function_b246c573(var_bd027dd9);
				if(isdefined(var_5a2df6f9))
				{
					player namespace_b376ff3f::function_26c87da8(var_5a2df6f9, var_c3f14af5);
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
				var_bd31d7b2 = player namespace_b376ff3f::function_ec087745();
				if(var_fc7876fd == 1 && var_bd31d7b2 != 32767)
				{
					player namespace_b376ff3f::function_9d102bbd(item, var_bd31d7b2);
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
					player namespace_b376ff3f::function_fba40e6c(item);
					break;
				}
				var_641d3dc2 = item.var_a6762160.itemtype != #"attachment";
				var_a6762160 = item.var_a6762160;
				player item_world::pickup_item(item, var_641d3dc2);
				if(var_fc7876fd == 1 || var_fc7876fd == 2)
				{
					if(isdefined(var_a6762160))
					{
						var_b619c089 = player namespace_b376ff3f::function_8babc9f9(var_a6762160);
					}
					if(isdefined(var_b619c089))
					{
						switch(var_b619c089.var_a6762160.itemtype)
						{
							case "tactical":
							case "equipment":
							case "field_upgrade":
							{
								player namespace_b376ff3f::function_c8bedf1b(var_b619c089);
								break;
							}
							case "health":
							{
								player namespace_b376ff3f::function_11fc9fa9(var_b619c089);
								break;
							}
							case "hash_63c2e39c90346280":
							case "hash_63c2e49c90346433":
							case "hash_63c2e59c903465e6":
							{
								player namespace_b376ff3f::function_854cf2c3(var_b619c089);
								break;
							}
							case "scorestreak":
							{
								player namespace_b376ff3f::function_1ac37022(var_b619c089);
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
			player namespace_b376ff3f::function_9ba10b94(var_bd027dd9);
			break;
		}
		case 10:
		{
			player namespace_b376ff3f::function_e46ef859();
			break;
		}
		case 9:
		{
			player namespace_b376ff3f::function_20ecd64d();
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
			player namespace_b376ff3f::function_fa4bb600();
			break;
		}
		case 15:
		{
			player namespace_b376ff3f::function_a50547af();
			break;
		}
	}
}

