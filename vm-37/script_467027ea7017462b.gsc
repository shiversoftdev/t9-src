#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_items;

/*
	Name: function_89f2df9
	Namespace: zm_items
	Checksum: 0x6656949F
	Offset: 0xF8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_items", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_items
	Checksum: 0xDE862BF7
	Offset: 0x150
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_ddfee332))
	{
		level.var_ddfee332 = 0;
	}
	if(!isdefined(level.item_list))
	{
		level.item_list = [];
	}
	if(!isdefined(level.var_223728ac))
	{
		level.var_223728ac = [];
	}
	if(!isdefined(level.var_b376ff3f))
	{
		level.var_b376ff3f = [];
	}
	if(!isdefined(level.var_91d6d592))
	{
		level.var_91d6d592 = [];
	}
	clientfield::register("item", "highlight_item", 1, 2, "int");
	callback::on_spawned(&player_on_spawned);
}

/*
	Name: function_8ac3bea9
	Namespace: zm_items
	Checksum: 0xD080D0D
	Offset: 0x240
	Size: 0x3A0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	a_items = getitemarray();
	foreach(item in a_items)
	{
		var_9c95ad05 = item.item;
		if(isdefined(var_9c95ad05) && is_true(var_9c95ad05.var_52a84c7a))
		{
			tname = var_9c95ad05;
			if(!isdefined(level.var_223728ac[tname]))
			{
				level.var_223728ac[tname] = [];
			}
			if(!isdefined(level.var_223728ac[tname]))
			{
				level.var_223728ac[tname] = [];
			}
			else if(!isarray(level.var_223728ac[tname]))
			{
				level.var_223728ac[tname] = array(level.var_223728ac[tname]);
			}
			level.var_223728ac[tname][level.var_223728ac[tname].size] = item;
			if(!isdefined(level.item_list))
			{
				level.item_list = [];
			}
			else if(!isarray(level.item_list))
			{
				level.item_list = array(level.item_list);
			}
			if(!isinarray(level.item_list, var_9c95ad05))
			{
				level.item_list[level.item_list.size] = var_9c95ad05;
			}
		}
	}
	foreach(a_items in level.var_223728ac)
	{
		var_b38ebe37 = a_items[0].item.var_ec2cbce2;
		if(isdefined(level.var_fd2e6f70))
		{
			a_items = [[level.var_fd2e6f70]](a_items);
		}
		else
		{
			a_items = array::randomize(a_items);
		}
		var_7a1b3d24 = 0;
		/#
			var_7a1b3d24 = getdvarint(#"hash_7f8707c59bcda3cb", 0);
		#/
		if(var_7a1b3d24 === 0)
		{
			if(a_items.size > var_b38ebe37)
			{
				for(i = var_b38ebe37; i < a_items.size; i++)
				{
					a_items[i] delete();
				}
			}
		}
	}
	level thread function_307756a0();
	/#
	#/
}

/*
	Name: player_on_spawned
	Namespace: zm_items
	Checksum: 0x74B01F6C
	Offset: 0x5E8
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function player_on_spawned()
{
	if(!isdefined(self.var_b376ff3f))
	{
		self.var_b376ff3f = [];
	}
	if(!isdefined(self.var_d4144834))
	{
		self.var_d4144834 = [];
	}
}

/*
	Name: function_4d230236
	Namespace: zm_items
	Checksum: 0x793FD482
	Offset: 0x628
	Size: 0xF2
	Parameters: 2
	Flags: Linked
*/
function function_4d230236(var_9c95ad05, fn_callback)
{
	if(!isdefined(level.var_91d6d592))
	{
		level.var_91d6d592 = [];
	}
	if(!isdefined(level.var_91d6d592[var_9c95ad05]))
	{
		level.var_91d6d592[var_9c95ad05] = [];
	}
	if(!isdefined(level.var_91d6d592[var_9c95ad05]))
	{
		level.var_91d6d592[var_9c95ad05] = [];
	}
	else if(!isarray(level.var_91d6d592[var_9c95ad05]))
	{
		level.var_91d6d592[var_9c95ad05] = array(level.var_91d6d592[var_9c95ad05]);
	}
	level.var_91d6d592[var_9c95ad05][level.var_91d6d592[var_9c95ad05].size] = fn_callback;
}

/*
	Name: function_307756a0
	Namespace: zm_items
	Checksum: 0x8475EDEC
	Offset: 0x728
	Size: 0x68
	Parameters: 0
	Flags: Linked, Private
*/
function private function_307756a0()
{
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"player_bled_out");
		player = waitresult.player;
		player thread function_b64c32cf(player);
	}
}

/*
	Name: function_b64c32cf
	Namespace: zm_items
	Checksum: 0xED527452
	Offset: 0x798
	Size: 0x108
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b64c32cf(player)
{
	foreach(item in level.item_list)
	{
		if(item.var_337fc1cf && is_true(player.var_b376ff3f[item]))
		{
			if(item.var_9fffdcee)
			{
				/#
					assertmsg(("" + item.name) + "");
				#/
				continue;
			}
			function_ab3bb6bf(player, item);
		}
	}
}

/*
	Name: player_has
	Namespace: zm_items
	Checksum: 0x97C8D89F
	Offset: 0x8A8
	Size: 0xF2
	Parameters: 2
	Flags: Linked
*/
function player_has(player, var_9c95ad05)
{
	if(!is_true(var_9c95ad05.var_52a84c7a) && isdefined(player))
	{
		if(var_9c95ad05.var_9fffdcee)
		{
			/#
				assertmsg(("" + var_9c95ad05.name) + "");
			#/
		}
		else
		{
			return player hasweapon(var_9c95ad05);
		}
	}
	if(var_9c95ad05.var_9fffdcee)
	{
		holder = level;
	}
	else
	{
		holder = player;
	}
	if(!isdefined(holder.var_b376ff3f))
	{
		holder.var_b376ff3f = [];
	}
	return is_true(holder.var_b376ff3f[var_9c95ad05]);
}

/*
	Name: player_pick_up
	Namespace: zm_items
	Checksum: 0x3ED46A0D
	Offset: 0x9A8
	Size: 0x23C
	Parameters: 2
	Flags: Linked
*/
function player_pick_up(player, var_9c95ad05)
{
	if(var_9c95ad05.var_9fffdcee)
	{
		holder = level;
	}
	else
	{
		holder = player;
	}
	if(!isdefined(holder.var_b376ff3f))
	{
		holder.var_b376ff3f = [];
	}
	holder.var_b376ff3f[var_9c95ad05] = 1;
	if(var_9c95ad05.var_df0f9ce9)
	{
		if(isdefined(holder.var_d4144834[var_9c95ad05.var_df0f9ce9]))
		{
			player function_ab3bb6bf(holder, holder.var_d4144834[var_9c95ad05.var_df0f9ce9]);
		}
		holder.var_d4144834[var_9c95ad05.var_df0f9ce9] = var_9c95ad05;
	}
	level notify(#"hash_78451720bf647f70", {#holder:holder, #component:var_9c95ad05});
	player notify(#"hash_78451720bf647f70", {#holder:holder, #component:var_9c95ad05});
	if(isdefined(level.var_91d6d592[var_9c95ad05]))
	{
		foreach(callback in level.var_91d6d592[var_9c95ad05])
		{
			player [[callback]](holder, var_9c95ad05);
		}
	}
	if(!is_true(level.var_ddfee332) && player hasweapon(var_9c95ad05))
	{
		player takeweapon(var_9c95ad05);
	}
}

/*
	Name: player_take
	Namespace: zm_items
	Checksum: 0x1E4BADC4
	Offset: 0xBF0
	Size: 0x100
	Parameters: 2
	Flags: Linked
*/
function player_take(player, var_9c95ad05)
{
	if(!is_true(var_9c95ad05.var_52a84c7a) && isdefined(player))
	{
		if(var_9c95ad05.var_9fffdcee)
		{
			/#
				assertmsg(("" + var_9c95ad05.name) + "");
			#/
		}
		else
		{
			player zm_weapons::weapon_take(var_9c95ad05);
		}
	}
	if(var_9c95ad05.var_9fffdcee)
	{
		holder = level;
	}
	else
	{
		holder = player;
		player zm_weapons::weapon_take(var_9c95ad05);
	}
	if(!isdefined(holder.var_b376ff3f))
	{
		holder.var_b376ff3f = [];
	}
	holder.var_b376ff3f[var_9c95ad05] = 0;
}

/*
	Name: function_ab3bb6bf
	Namespace: zm_items
	Checksum: 0xC747AE79
	Offset: 0xCF8
	Size: 0x12A
	Parameters: 2
	Flags: Linked
*/
function function_ab3bb6bf(holder, var_9c95ad05)
{
	holder.var_b376ff3f[var_9c95ad05] = 0;
	if(var_9c95ad05.var_df0f9ce9)
	{
		holder.var_d4144834[var_9c95ad05.var_df0f9ce9] = undefined;
	}
	level notify(#"hash_30bc7882ac1af823", {#holder:holder, #component:var_9c95ad05});
	self notify(#"hash_30bc7882ac1af823", {#holder:holder, #component:var_9c95ad05});
	if(self hasweapon(var_9c95ad05))
	{
		self takeweapon(var_9c95ad05);
	}
	var_e9c4fe29 = spawn_item(var_9c95ad05, self.origin + vectorscale((0, 0, 1), 8), self.angles);
	return var_e9c4fe29;
}

/*
	Name: spawn_item
	Namespace: zm_items
	Checksum: 0xCC58281C
	Offset: 0xE30
	Size: 0x62
	Parameters: 4
	Flags: Linked
*/
function spawn_item(var_9c95ad05, v_origin, v_angles, var_f93e465d)
{
	if(!isdefined(var_f93e465d))
	{
		var_f93e465d = 1;
	}
	var_e9c4fe29 = spawnweapon(var_9c95ad05, v_origin, v_angles, var_f93e465d);
	return var_e9c4fe29;
}

/*
	Name: debug_items
	Namespace: zm_items
	Checksum: 0xF5607363
	Offset: 0xEA0
	Size: 0x10A
	Parameters: 0
	Flags: None
*/
function debug_items()
{
	/#
		for(;;)
		{
			a_items = getitemarray();
			foreach(item in a_items)
			{
				var_9c95ad05 = item.item;
				if(isdefined(var_9c95ad05) && is_true(var_9c95ad05.var_52a84c7a))
				{
					sphere(item.origin, 6, (0, 0, 1), 1, 0, 12, 20);
				}
			}
			wait(1);
		}
	#/
}

