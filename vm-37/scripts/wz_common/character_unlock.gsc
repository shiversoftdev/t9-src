#using script_69514c4c056c768;
#using script_54f593f5beb1464a;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock;

/*
	Name: __init__system__
	Namespace: character_unlock
	Checksum: 0x2C1A2F8A
	Offset: 0x90
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"character_unlock", &function_70a657d8, undefined, undefined, #"character_unlock_fixup");
}

/*
	Name: function_70a657d8
	Namespace: character_unlock
	Checksum: 0x9C659C29
	Offset: 0xE0
	Size: 0xFC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_b3681acb = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 1);
	callback::on_item_pickup(&function_6e8037ca);
	callback::add_callback(#"on_drop_inventory", &on_drop_inventory);
	callback::add_callback(#"on_end_game", &on_end_game);
	callback::on_disconnect(&on_player_disconnect);
}

/*
	Name: function_b3681acb
	Namespace: character_unlock
	Checksum: 0x171EED6F
	Offset: 0x1E8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_b3681acb()
{
	/#
		if(getdvar(#"hash_62fbe70d500712c1", 0) == 1)
		{
			return 1;
		}
	#/
	return level.var_b3681acb && is_true(level.onlinegame) && is_true(level.rankedmatch);
}

/*
	Name: function_d7e6fa92
	Namespace: character_unlock
	Checksum: 0xEA48EB1A
	Offset: 0x278
	Size: 0xDE
	Parameters: 1
	Flags: None
*/
function function_d7e6fa92(unlock_name)
{
	var_9ba1646c = level.var_7d8da246[unlock_name];
	/#
		/#
			assert(isdefined(var_9ba1646c), ("" + function_9e72a96(unlock_name)) + "");
		#/
	#/
	if(!isdefined(var_9ba1646c))
	{
		return false;
	}
	var_2b469a7d = var_9ba1646c.var_2b469a7d;
	if(is_true(stats::get_stat(#"characters", var_2b469a7d, #"unlocked")))
	{
		return true;
	}
	return false;
}

/*
	Name: function_f0406288
	Namespace: character_unlock
	Checksum: 0x6AF600B4
	Offset: 0x360
	Size: 0xDE
	Parameters: 1
	Flags: None
*/
function function_f0406288(unlock_name)
{
	if(!level function_b3681acb())
	{
		return false;
	}
	if(self function_d7e6fa92(unlock_name))
	{
		return false;
	}
	if(isdefined(self.var_474dff5e) && is_true(self.var_474dff5e[unlock_name]))
	{
		return true;
	}
	var_9ba1646c = level.var_7d8da246[unlock_name];
	item_name = var_9ba1646c.required_item;
	required_item = self item_inventory::function_7fe4ce88(item_name);
	if(isdefined(required_item))
	{
		return true;
	}
	return false;
}

/*
	Name: function_c70bcc7a
	Namespace: character_unlock
	Checksum: 0x64F1834B
	Offset: 0x448
	Size: 0x7A
	Parameters: 1
	Flags: None
*/
function function_c70bcc7a(unlock_name)
{
	if(!level function_b3681acb())
	{
		return false;
	}
	if(self function_d7e6fa92(unlock_name))
	{
		return false;
	}
	if(!isdefined(self.var_c53589da) || !isdefined(self.var_c53589da[unlock_name]))
	{
		return false;
	}
	return true;
}

/*
	Name: function_6e8037ca
	Namespace: character_unlock
	Checksum: 0xBB9D2E3C
	Offset: 0x4D0
	Size: 0x2DC
	Parameters: 1
	Flags: None
*/
function function_6e8037ca(params)
{
	if(!level function_b3681acb())
	{
		return;
	}
	if(level.inprematchperiod)
	{
		return;
	}
	var_a6762160 = params.item.var_a6762160;
	if(!isdefined(var_a6762160))
	{
		return;
	}
	if(!isdefined(var_a6762160.unlockableitemref))
	{
		return;
	}
	foreach(unlock_name, var_9ba1646c in level.var_7d8da246)
	{
		if(self function_d7e6fa92(unlock_name))
		{
			itembundle = getscriptbundle(var_9ba1646c.required_item);
			if(!isdefined(itembundle) || !isdefined(itembundle.unlockableitemref))
			{
				continue;
			}
			itemindex = getitemindexfromref(itembundle.unlockableitemref);
			if(itemindex == 0)
			{
				continue;
			}
			self luinotifyevent(#"character_unlock_update", 2, 1, itemindex);
			continue;
		}
		item_name = var_9ba1646c.required_item;
		if(var_a6762160.name === item_name)
		{
			if(!isdefined(self.var_c53589da))
			{
				self.var_c53589da = [];
			}
			if(!isdefined(self.var_c53589da[unlock_name]))
			{
				var_c5c8fd39 = {#hash_e7e238a4:[]};
				foreach(condition in var_9ba1646c.var_3845495)
				{
					var_c5c8fd39.var_e7e238a4[condition] = 0;
				}
				self.var_c53589da[unlock_name] = var_c5c8fd39;
			}
			break;
		}
	}
	self callback::callback(#"hash_48bcdfea6f43fecb", params.item);
}

/*
	Name: function_c8beca5e
	Namespace: character_unlock
	Checksum: 0x35EBCA5A
	Offset: 0x7B8
	Size: 0x2AC
	Parameters: 3
	Flags: None
*/
function function_c8beca5e(unlock_name, var_1d208aea, state)
{
	if(!level function_b3681acb())
	{
		return;
	}
	if(level.inprematchperiod)
	{
		return;
	}
	var_9ba1646c = level.var_7d8da246[unlock_name];
	/#
		/#
			assert(isdefined(var_9ba1646c), ("" + function_9e72a96(unlock_name)) + "");
		#/
		/#
			assert(isinarray(var_9ba1646c.var_3845495, var_1d208aea), (("" + function_9e72a96(var_1d208aea)) + "") + function_9e72a96(unlock_name));
		#/
		/#
			assert(isinarray(array(0, 1, 2), state), (("" + function_9e72a96(var_1d208aea)) + "") + function_9e72a96(unlock_name));
		#/
	#/
	if(!self function_c70bcc7a(unlock_name))
	{
		/#
			assertmsg(("" + unlock_name) + "");
		#/
		return;
	}
	current_state = self.var_c53589da[unlock_name].var_e7e238a4[var_1d208aea];
	if(current_state == 2)
	{
		return;
	}
	self.var_c53589da[unlock_name].var_e7e238a4[var_1d208aea] = state;
	self function_20b0ca2e(unlock_name);
	if(var_1d208aea != #"hash_3f07579f66b464e8")
	{
		if(!isalive(self) || is_true(level.gameended))
		{
			self function_fb689837();
		}
	}
}

/*
	Name: function_20b0ca2e
	Namespace: character_unlock
	Checksum: 0xCECA46ED
	Offset: 0xA70
	Size: 0x43A
	Parameters: 1
	Flags: None
*/
function function_20b0ca2e(unlock_name)
{
	var_9ba1646c = level.var_7d8da246[unlock_name];
	/#
		/#
			assert(isdefined(var_9ba1646c), ("" + function_9e72a96(unlock_name)) + "");
		#/
	#/
	itembundle = getscriptbundle(var_9ba1646c.required_item);
	if(!isdefined(itembundle.unlockableitemref))
	{
		return;
	}
	itemindex = getitemindexfromref(itembundle.unlockableitemref);
	if(itemindex == 0)
	{
		return;
	}
	var_93e871fc = var_9ba1646c.var_3845495;
	switch(var_9ba1646c.var_3845495.size)
	{
		case 1:
		{
			self luinotifyevent(#"character_unlock_update", var_9ba1646c.var_3845495.size + 2, 0, itemindex, self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[0]]);
			break;
		}
		case 2:
		{
			self luinotifyevent(#"character_unlock_update", var_9ba1646c.var_3845495.size + 2, 0, itemindex, self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[0]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[1]]);
			break;
		}
		case 3:
		{
			self luinotifyevent(#"character_unlock_update", var_9ba1646c.var_3845495.size + 2, 0, itemindex, self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[0]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[1]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[2]]);
			break;
		}
		case 4:
		{
			self luinotifyevent(#"character_unlock_update", var_9ba1646c.var_3845495.size + 2, 0, itemindex, self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[0]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[1]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[2]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[3]]);
			break;
		}
		case 5:
		{
			self luinotifyevent(#"character_unlock_update", var_9ba1646c.var_3845495.size + 2, 0, itemindex, self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[0]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[1]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[2]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[3]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[4]]);
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_54fc60f5
	Namespace: character_unlock
	Checksum: 0x3CEC5F11
	Offset: 0xEB8
	Size: 0xFC
	Parameters: 2
	Flags: None
*/
function function_54fc60f5(player, character)
{
	if(isdefined(player) && isplayer(player) && isdefined(character))
	{
		player_xuid = player getxuid(1);
		if(isdefined(player_xuid))
		{
			data = {#character:character, #player_xuid:int(player_xuid), #game_time:function_f8d53445()};
			function_92d1707f(#"hash_17e83c78e2a73ed1", data);
		}
	}
}

/*
	Name: function_fb689837
	Namespace: character_unlock
	Checksum: 0xAEFFD6D9
	Offset: 0xFC0
	Size: 0x288
	Parameters: 0
	Flags: None
*/
function function_fb689837()
{
	if(!isdefined(self.var_c53589da))
	{
		return;
	}
	foreach(unlock_name, var_c5c8fd39 in self.var_c53589da)
	{
		if(!self function_f0406288(unlock_name))
		{
			continue;
		}
		var_b3895a2 = 1;
		foreach(var_1d208aea, var_b7ed23ab in var_c5c8fd39.var_e7e238a4)
		{
			if(var_1d208aea != #"hash_3f07579f66b464e8" && var_b7ed23ab != 1)
			{
				var_b3895a2 = 0;
				break;
			}
		}
		if(!var_b3895a2)
		{
			continue;
		}
		self function_c8beca5e(unlock_name, #"hash_3f07579f66b464e8", 1);
		var_9ba1646c = level.var_7d8da246[unlock_name];
		if(isdefined(var_9ba1646c))
		{
			var_2b469a7d = var_9ba1646c.var_2b469a7d;
		}
		if(isdefined(var_2b469a7d))
		{
			self stats::set_stat(#"characters", var_2b469a7d, #"unlocked", 1);
			self stats::function_d40764f3(#"character_quests_completed", 1);
			function_54fc60f5(self, var_2b469a7d);
			var_ade8d0e9 = {#character:var_2b469a7d};
			self callback::callback(#"on_character_unlock", var_ade8d0e9);
		}
	}
}

/*
	Name: on_drop_inventory
	Namespace: character_unlock
	Checksum: 0xF72BF42C
	Offset: 0x1250
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function on_drop_inventory(player)
{
	if(!isplayer(player))
	{
		return;
	}
	if(!isdefined(player.var_474dff5e))
	{
		player.var_474dff5e = [];
	}
	foreach(var_9ba1646c in level.var_7d8da246)
	{
		item_name = var_9ba1646c.required_item;
		required_item = player item_inventory::function_7fe4ce88(item_name);
		if(isdefined(required_item))
		{
			player.var_474dff5e[unlock_name] = 1;
		}
	}
	if(!isalive(player))
	{
		player function_fb689837();
	}
}

/*
	Name: on_player_disconnect
	Namespace: character_unlock
	Checksum: 0xE20E249
	Offset: 0x1390
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function on_player_disconnect()
{
	if(!isplayer(self))
	{
		return;
	}
	self function_fb689837();
}

/*
	Name: on_end_game
	Namespace: character_unlock
	Checksum: 0x6D5F0765
	Offset: 0x13D0
	Size: 0xA0
	Parameters: 0
	Flags: None
*/
function on_end_game()
{
	players = getplayers();
	foreach(player in players)
	{
		player function_fb689837();
	}
}

/*
	Name: function_d2294476
	Namespace: character_unlock
	Checksum: 0x8473AA8D
	Offset: 0x1478
	Size: 0x6C
	Parameters: 3
	Flags: None
*/
function function_d2294476(var_2ab9d3bd, var_f532cd9f, var_3afaa57b)
{
	if(is_true(getgametypesetting(#"hash_17f17e92c2654659")))
	{
		var_f532cd9f = 1;
	}
	namespace_3d2704b3::function_f0297225(var_2ab9d3bd, var_f532cd9f, var_3afaa57b);
}

