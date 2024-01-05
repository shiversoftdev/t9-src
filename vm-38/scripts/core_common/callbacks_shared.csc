#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\activecamo_shared.csc;

#namespace callbacks_shared;

/*
	Name: function_550ae217
	Namespace: callbacks_shared
	Checksum: 0x4C2EC9CF
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_550ae217()
{
	level notify(49872149);
}

#namespace callback;

/*
	Name: callback
	Namespace: callback
	Checksum: 0x22A6CF6F
	Offset: 0x128
	Size: 0x12E
	Parameters: 3
	Flags: Linked
*/
function callback(event, localclientnum, params)
{
	if(isdefined(level._callbacks) && isdefined(level._callbacks[event]))
	{
		for(i = 0; i < level._callbacks[event].size; i++)
		{
			callback = level._callbacks[event][i][0];
			obj = level._callbacks[event][i][1];
			if(!isdefined(callback))
			{
				continue;
			}
			if(isdefined(obj))
			{
				if(isdefined(params))
				{
					obj thread [[callback]](localclientnum, self, params);
				}
				else
				{
					obj thread [[callback]](localclientnum, self);
				}
				continue;
			}
			if(isdefined(params))
			{
				self thread [[callback]](localclientnum, params);
				continue;
			}
			self thread [[callback]](localclientnum);
		}
	}
}

/*
	Name: entity_callback
	Namespace: callback
	Checksum: 0xD669A8B6
	Offset: 0x260
	Size: 0x11E
	Parameters: 3
	Flags: Linked
*/
function entity_callback(event, localclientnum, params)
{
	if(isdefined(self._callbacks) && isdefined(self._callbacks[event]))
	{
		for(i = 0; i < self._callbacks[event].size; i++)
		{
			callback = self._callbacks[event][i][0];
			obj = self._callbacks[event][i][1];
			if(!isdefined(callback))
			{
				continue;
			}
			if(isdefined(obj))
			{
				if(isdefined(params))
				{
					obj thread [[callback]](localclientnum, self, params);
				}
				else
				{
					obj thread [[callback]](localclientnum, self);
				}
				continue;
			}
			if(isdefined(params))
			{
				self thread [[callback]](localclientnum, params);
				continue;
			}
			self thread [[callback]](localclientnum);
		}
	}
}

/*
	Name: add_callback
	Namespace: callback
	Checksum: 0x56D2E098
	Offset: 0x388
	Size: 0x17C
	Parameters: 3
	Flags: Linked
*/
function add_callback(event, func, obj)
{
	/#
		assert(isdefined(event), "");
	#/
	if(!isdefined(level._callbacks) || !isdefined(level._callbacks[event]))
	{
		level._callbacks[event] = [];
	}
	foreach(callback in level._callbacks[event])
	{
		if(callback[0] == func)
		{
			if(!isdefined(obj) || callback[1] == obj)
			{
				return;
			}
		}
	}
	array::add(level._callbacks[event], array(func, obj), 0);
	if(isdefined(obj))
	{
		obj thread remove_callback_on_death(event, func);
	}
}

/*
	Name: add_entity_callback
	Namespace: callback
	Checksum: 0xED090A8B
	Offset: 0x510
	Size: 0x154
	Parameters: 3
	Flags: Linked
*/
function add_entity_callback(event, func, obj)
{
	/#
		assert(isdefined(event), "");
	#/
	if(!isdefined(self._callbacks) || !isdefined(self._callbacks[event]))
	{
		self._callbacks[event] = [];
	}
	foreach(callback in self._callbacks[event])
	{
		if(callback[0] == func)
		{
			if(!isdefined(obj) || callback[1] == obj)
			{
				return;
			}
		}
	}
	array::add(self._callbacks[event], array(func, obj), 0);
}

/*
	Name: remove_callback_on_death
	Namespace: callback
	Checksum: 0xD70E8B51
	Offset: 0x670
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function remove_callback_on_death(event, func)
{
	self waittill(#"death");
	remove_callback(event, func, self);
}

/*
	Name: function_52ac9652
	Namespace: callback
	Checksum: 0xCDEBC8E9
	Offset: 0x6C0
	Size: 0x124
	Parameters: 3
	Flags: Linked
*/
function function_52ac9652(event, func, obj)
{
	/#
		assert(isdefined(event), "");
	#/
	if(!isdefined(self._callbacks) || !isdefined(self._callbacks[event]))
	{
		return;
	}
	foreach(func_group in self._callbacks[event])
	{
		if(func_group[0] == func)
		{
			if(func_group[1] === obj)
			{
				arrayremoveindex(self._callbacks[event], index, 0);
				break;
			}
		}
	}
}

/*
	Name: remove_callback
	Namespace: callback
	Checksum: 0x3C3391E0
	Offset: 0x7F0
	Size: 0x12C
	Parameters: 3
	Flags: Linked
*/
function remove_callback(event, func, obj)
{
	/#
		assert(isdefined(event), "");
	#/
	/#
		assert(isdefined(level._callbacks[event]), "");
	#/
	foreach(func_group in level._callbacks[event])
	{
		if(func_group[0] == func)
		{
			if(func_group[1] === obj)
			{
				arrayremoveindex(level._callbacks[event], index, 0);
				break;
			}
		}
	}
}

/*
	Name: on_localclient_connect
	Namespace: callback
	Checksum: 0xC7C89B28
	Offset: 0x928
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_localclient_connect(func, obj)
{
	add_callback(#"on_localclient_connect", func, obj);
}

/*
	Name: on_localclient_shutdown
	Namespace: callback
	Checksum: 0x1D7ACCC8
	Offset: 0x970
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_localclient_shutdown(func, obj)
{
	add_callback(#"on_localclient_shutdown", func, obj);
}

/*
	Name: on_finalize_initialization
	Namespace: callback
	Checksum: 0x2FDE1326
	Offset: 0x9B8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_finalize_initialization(func, obj)
{
	add_callback(#"on_finalize_initialization", func, obj);
}

/*
	Name: on_gameplay_started
	Namespace: callback
	Checksum: 0xC9246A86
	Offset: 0xA00
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_gameplay_started(func, obj)
{
	add_callback(#"on_gameplay_started", func, obj);
}

/*
	Name: on_localplayer_spawned
	Namespace: callback
	Checksum: 0x39600276
	Offset: 0xA48
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_localplayer_spawned(func, obj)
{
	add_callback(#"on_localplayer_spawned", func, obj);
}

/*
	Name: remove_on_localplayer_spawned
	Namespace: callback
	Checksum: 0x54B819B0
	Offset: 0xA90
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_localplayer_spawned(func, obj)
{
	remove_callback(#"on_localplayer_spawned", func, obj);
}

/*
	Name: on_spawned
	Namespace: callback
	Checksum: 0xCB506222
	Offset: 0xAD8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_spawned(func, obj)
{
	add_callback(#"on_player_spawned", func, obj);
}

/*
	Name: remove_on_spawned
	Namespace: callback
	Checksum: 0xD24B60BD
	Offset: 0xB20
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_spawned(func, obj)
{
	remove_callback(#"on_player_spawned", func, obj);
}

/*
	Name: on_actor_spawned
	Namespace: callback
	Checksum: 0x3CA7659D
	Offset: 0xB68
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_actor_spawned(func, obj)
{
	add_callback(#"on_actor_spawned", func, obj);
}

/*
	Name: function_ce9bb4ec
	Namespace: callback
	Checksum: 0x359E619B
	Offset: 0xBB0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_ce9bb4ec(func, obj)
{
	remove_callback(#"on_actor_spawned", func, obj);
}

/*
	Name: on_vehicle_spawned
	Namespace: callback
	Checksum: 0x7C9E1E57
	Offset: 0xBF8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_vehicle_spawned(func, obj)
{
	add_callback(#"on_vehicle_spawned", func, obj);
}

/*
	Name: remove_on_vehicle_spawned
	Namespace: callback
	Checksum: 0x5F381846
	Offset: 0xC40
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_vehicle_spawned(func, obj)
{
	remove_callback(#"on_vehicle_spawned", func, obj);
}

/*
	Name: on_laststand
	Namespace: callback
	Checksum: 0x6697F1B0
	Offset: 0xC88
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_laststand(func, obj)
{
	add_callback(#"on_player_laststand", func, obj);
}

/*
	Name: remove_on_laststand
	Namespace: callback
	Checksum: 0x6051DFEC
	Offset: 0xCD0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_laststand(func, obj)
{
	remove_callback(#"on_player_laststand", func, obj);
}

/*
	Name: on_player_corpse
	Namespace: callback
	Checksum: 0x2E5F9B53
	Offset: 0xD18
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_player_corpse(func, obj)
{
	add_callback(#"on_player_corpse", func, obj);
}

/*
	Name: function_930e5d42
	Namespace: callback
	Checksum: 0xFCF582FE
	Offset: 0xD60
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_930e5d42(func, obj)
{
	add_callback(#"hash_781399e15b138a4e", func, obj);
}

/*
	Name: on_weapon_change
	Namespace: callback
	Checksum: 0xF7FA534B
	Offset: 0xDA8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_weapon_change(func, obj)
{
	self add_entity_callback(#"weapon_change", func, obj);
}

/*
	Name: function_94eab4fb
	Namespace: callback
	Checksum: 0xBCC9B500
	Offset: 0xDF0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_94eab4fb(func, obj)
{
	self add_entity_callback(#"hash_435b494b9418c561", func, obj);
}

/*
	Name: function_78827e7f
	Namespace: callback
	Checksum: 0x4DDF0156
	Offset: 0xE38
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_78827e7f(func, obj)
{
	self add_entity_callback(#"hash_5768f5220f99ebd1", func, obj);
}

/*
	Name: function_6231c19
	Namespace: callback
	Checksum: 0x5D8E209F
	Offset: 0xE80
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_6231c19(func, obj)
{
	add_callback(#"weapon_change", func, obj);
}

/*
	Name: function_a880899e
	Namespace: callback
	Checksum: 0x629ED4A2
	Offset: 0xEC8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_a880899e(func, obj)
{
	self add_entity_callback(#"hash_42d524149523a1eb", func, obj);
}

/*
	Name: function_23694c6c
	Namespace: callback
	Checksum: 0x94CB3EC5
	Offset: 0xF10
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_23694c6c(func, obj)
{
	self add_entity_callback(#"hash_56b841ac8d1dac0b", func, obj);
}

/*
	Name: function_4531552d
	Namespace: callback
	Checksum: 0x9EA7F2DA
	Offset: 0xF58
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_4531552d(func, obj)
{
	self add_entity_callback(#"hash_28ae86e34f270362", func, obj);
}

/*
	Name: function_74f5faf8
	Namespace: callback
	Checksum: 0xB7FE9EDA
	Offset: 0xFA0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_74f5faf8(func, obj)
{
	self add_entity_callback(#"hash_eb85a61dd6639ae", func, obj);
}

/*
	Name: on_deleted
	Namespace: callback
	Checksum: 0x3110CE7E
	Offset: 0xFE8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_deleted(func, obj)
{
	add_callback(#"on_entity_deleted", func, obj);
}

/*
	Name: remove_on_deleted
	Namespace: callback
	Checksum: 0xB1CC9C1
	Offset: 0x1030
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_deleted(func, obj)
{
	remove_callback(#"on_entity_deleted", func, obj);
}

/*
	Name: on_shutdown
	Namespace: callback
	Checksum: 0xA814D4FA
	Offset: 0x1078
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_shutdown(func, obj)
{
	add_entity_callback(#"on_entity_shutdown", func, obj);
}

/*
	Name: on_start_gametype
	Namespace: callback
	Checksum: 0xB3FC8FB7
	Offset: 0x10C0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_start_gametype(func, obj)
{
	add_callback(#"on_start_gametype", func, obj);
}

/*
	Name: on_end_game
	Namespace: callback
	Checksum: 0x4DB73FCC
	Offset: 0x1108
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_end_game(func, obj)
{
	add_callback(#"on_end_game", func, obj);
}

/*
	Name: remove_on_end_game
	Namespace: callback
	Checksum: 0x17380570
	Offset: 0x1150
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_end_game(func, obj)
{
	remove_callback(#"on_end_game", func, obj);
}

/*
	Name: on_killcam_begin
	Namespace: callback
	Checksum: 0x14C81623
	Offset: 0x1198
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_killcam_begin(func, obj)
{
	add_callback(#"killcam_begin", func, obj);
}

/*
	Name: on_killcam_end
	Namespace: callback
	Checksum: 0x29F3DFCF
	Offset: 0x11E0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_killcam_end(func, obj)
{
	add_callback(#"killcam_end", func, obj);
}

/*
	Name: function_9fcd5f60
	Namespace: callback
	Checksum: 0x28A6C02C
	Offset: 0x1228
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_9fcd5f60(func, obj)
{
	add_callback(#"hash_7a8be4f48b2d1cf6", func, obj);
}

/*
	Name: function_fb65b7c2
	Namespace: callback
	Checksum: 0xA904C62C
	Offset: 0x1270
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_fb65b7c2(func, obj)
{
	add_callback(#"hash_5fc3311fa3420931", func, obj);
}

/*
	Name: on_melee
	Namespace: callback
	Checksum: 0x3C796608
	Offset: 0x12B8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_melee(func, obj)
{
	add_callback(#"melee", func, obj);
}

/*
	Name: on_trigger
	Namespace: callback
	Checksum: 0x12F6D84E
	Offset: 0x1300
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_trigger(func, obj)
{
	add_entity_callback(#"on_trigger", func, obj);
}

/*
	Name: remove_on_trigger
	Namespace: callback
	Checksum: 0xF755ADDE
	Offset: 0x1348
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_trigger(func, obj)
{
	function_52ac9652(#"on_trigger", func, obj);
}

/*
	Name: on_trigger_once
	Namespace: callback
	Checksum: 0x5EADEB8E
	Offset: 0x1390
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_trigger_once(func, obj)
{
	add_entity_callback(#"on_trigger_once", func, obj);
}

/*
	Name: remove_on_trigger_once
	Namespace: callback
	Checksum: 0xE1ABE57E
	Offset: 0x13D8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_trigger_once(func, obj)
{
	function_52ac9652(#"on_trigger_once", func, obj);
}

/*
	Name: function_2870abef
	Namespace: callback
	Checksum: 0x504FC812
	Offset: 0x1420
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_2870abef(func, obj)
{
	add_callback(#"hash_23660169f647c82b", func, obj);
}

/*
	Name: function_b27200db
	Namespace: callback
	Checksum: 0xC860D7C1
	Offset: 0x1468
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_b27200db(func, obj)
{
	add_callback(#"hash_4bc6f7eaa57c10a7", func, obj);
}

/*
	Name: function_56df655f
	Namespace: callback
	Checksum: 0xED0F27D3
	Offset: 0x14B0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_56df655f(func, obj)
{
	add_callback(#"demo_jump", func, obj);
}

/*
	Name: function_f8062bf
	Namespace: callback
	Checksum: 0xC736767B
	Offset: 0x14F8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_f8062bf(func, obj)
{
	add_callback(#"demo_player_switch", func, obj);
}

/*
	Name: function_ed112c52
	Namespace: callback
	Checksum: 0x44CD60A5
	Offset: 0x1540
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_ed112c52(func, obj)
{
	add_callback(#"player_switch", func, obj);
}

/*
	Name: codecallback_preinitialization
	Namespace: callback
	Checksum: 0x9DB08423
	Offset: 0x1588
	Size: 0x1C
	Parameters: 1
	Flags: Event
*/
event codecallback_preinitialization(eventstruct)
{
	system::run_pre_systems();
}

/*
	Name: function_12c01a61
	Namespace: callback
	Checksum: 0x385F1C4C
	Offset: 0x15B0
	Size: 0x1C
	Parameters: 1
	Flags: Event
*/
event function_12c01a61(eventstruct)
{
	system::run_post_systems();
}

/*
	Name: codecallback_finalizeinitialization
	Namespace: callback
	Checksum: 0x35182865
	Offset: 0x15D8
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event codecallback_finalizeinitialization(eventstruct)
{
	system::function_b1553822();
	callback(#"on_finalize_initialization");
}

/*
	Name: codecallback_statechange
	Namespace: callback
	Checksum: 0xF55721DA
	Offset: 0x1620
	Size: 0x10C
	Parameters: 1
	Flags: Event
*/
event codecallback_statechange(eventstruct)
{
	if(!isdefined(level._systemstates))
	{
		level._systemstates = [];
	}
	if(!isdefined(level._systemstates[eventstruct.system]))
	{
		level._systemstates[eventstruct.system] = spawnstruct();
	}
	level._systemstates[eventstruct.system].state = eventstruct.state;
	if(isdefined(level._systemstates[eventstruct.system].callback))
	{
		[[level._systemstates[eventstruct.system].callback]](eventstruct.localclientnum, eventstruct.state);
	}
	else
	{
		/#
			println(("" + eventstruct.system) + "");
		#/
	}
}

/*
	Name: function_d736b8a9
	Namespace: callback
	Checksum: 0xF94B1842
	Offset: 0x1738
	Size: 0x50
	Parameters: 1
	Flags: Event
*/
event function_d736b8a9(eventstruct)
{
	/#
		println("");
	#/
	if(isdefined(level.var_4564d138))
	{
		level thread [[level.var_4564d138]]();
	}
}

/*
	Name: codecallback_maprestart
	Namespace: callback
	Checksum: 0x588522B7
	Offset: 0x1790
	Size: 0x64
	Parameters: 1
	Flags: Event
*/
event codecallback_maprestart(eventstruct)
{
	/#
		println("");
	#/
	if(isdefined(level.var_6bd86801))
	{
		level thread [[level.var_6bd86801]]();
	}
	level thread util::init_utility();
}

/*
	Name: function_3036fadc
	Namespace: callback
	Checksum: 0x5BB8E5D0
	Offset: 0x1800
	Size: 0x50
	Parameters: 1
	Flags: Event
*/
event function_3036fadc(eventstruct)
{
	/#
		println("");
	#/
	if(isdefined(level.var_bad05810))
	{
		level thread [[level.var_bad05810]]();
	}
}

/*
	Name: codecallback_localclientconnect
	Namespace: callback
	Checksum: 0xE6DED28D
	Offset: 0x1858
	Size: 0x64
	Parameters: 1
	Flags: Event
*/
event codecallback_localclientconnect(eventstruct)
{
	if(!isdefined(level.callbacklocalclientconnect))
	{
		waitframe(1);
	}
	/#
		println("" + eventstruct.localclientnum);
	#/
	[[level.callbacklocalclientconnect]](eventstruct.localclientnum);
}

/*
	Name: codecallback_glasssmash
	Namespace: callback
	Checksum: 0xEA1121AC
	Offset: 0x18C8
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event codecallback_glasssmash(eventstruct)
{
	/#
		println("");
	#/
}

/*
	Name: codecallback_soundsetambientstate
	Namespace: callback
	Checksum: 0xED8E0567
	Offset: 0x1900
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event codecallback_soundsetambientstate(eventstruct)
{
	audio::setcurrentambientstate(eventstruct.ambientroom, eventstruct.ambientpackage, eventstruct.roomcollider, eventstruct.packagecollider, eventstruct.is_defaultroom);
}

/*
	Name: codecallback_soundsetaiambientstate
	Namespace: callback
	Checksum: 0x984B9828
	Offset: 0x1950
	Size: 0xC
	Parameters: 1
	Flags: Event
*/
event codecallback_soundsetaiambientstate(eventstruct)
{
}

/*
	Name: function_d3771684
	Namespace: callback
	Checksum: 0x9CA8A92F
	Offset: 0x1968
	Size: 0x50
	Parameters: 1
	Flags: Event
*/
event function_d3771684(eventstruct)
{
	if(!isdefined(level.var_44e74ef4))
	{
		return;
	}
	/#
		println("");
	#/
	thread [[level.var_44e74ef4]](eventstruct);
}

/*
	Name: codecallback_soundplayuidecodeloop
	Namespace: callback
	Checksum: 0x31B8E55E
	Offset: 0x19C0
	Size: 0x34
	Parameters: 1
	Flags: Event
*/
event codecallback_soundplayuidecodeloop(eventstruct)
{
	self thread audio::soundplayuidecodeloop(eventstruct.decode_string, eventstruct.play_time_ms);
}

/*
	Name: codecallback_playerspawned
	Namespace: callback
	Checksum: 0xD17DA084
	Offset: 0x1A00
	Size: 0x40
	Parameters: 1
	Flags: Event
*/
event codecallback_playerspawned(eventstruct)
{
	while(!isdefined(level.callbackplayerspawned))
	{
		waitframe(1);
	}
	[[level.callbackplayerspawned]](eventstruct.localclientnum);
}

/*
	Name: codecallback_playerlaststand
	Namespace: callback
	Checksum: 0xB5392215
	Offset: 0x1A48
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event codecallback_playerlaststand(eventstruct)
{
	[[level.callbackplayerlaststand]](eventstruct.localclientnum);
}

/*
	Name: function_c1d1f779
	Namespace: callback
	Checksum: 0x700813B2
	Offset: 0x1A78
	Size: 0x54
	Parameters: 1
	Flags: Event
*/
event function_c1d1f779(eventstruct)
{
	if(!isdefined(level.var_c3e66138))
	{
		return;
	}
	/#
		println("");
	#/
	thread [[level.var_c3e66138]](eventstruct.var_428d0be2);
}

/*
	Name: function_cfcbacb1
	Namespace: callback
	Checksum: 0x7863B920
	Offset: 0x1AD8
	Size: 0x34
	Parameters: 1
	Flags: Event
*/
event function_cfcbacb1(eventstruct)
{
	if(isdefined(level.var_beec2b1))
	{
		[[level.var_beec2b1]](eventstruct.localclientnum);
	}
}

/*
	Name: function_46c0443b
	Namespace: callback
	Checksum: 0x3856FCE3
	Offset: 0x1B18
	Size: 0x40
	Parameters: 1
	Flags: Event
*/
event function_46c0443b(eventstruct)
{
	if(isdefined(level.var_c442de72))
	{
		[[level.var_c442de72]](self, eventstruct.localclientnum, eventstruct.weapon);
	}
}

/*
	Name: codecallback_gibevent
	Namespace: callback
	Checksum: 0x23CB3DA
	Offset: 0x1B60
	Size: 0x48
	Parameters: 1
	Flags: Event
*/
event codecallback_gibevent(eventstruct)
{
	if(isdefined(level._gibeventcbfunc))
	{
		self thread [[level._gibeventcbfunc]](eventstruct.localclientnum, eventstruct.type, eventstruct.locations);
	}
}

/*
	Name: codecallback_precachegametype
	Namespace: callback
	Checksum: 0xE6B613FC
	Offset: 0x1BB0
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event codecallback_precachegametype(eventstruct)
{
	if(isdefined(level.callbackprecachegametype))
	{
		[[level.callbackprecachegametype]]();
	}
}

/*
	Name: codecallback_startgametype
	Namespace: callback
	Checksum: 0x1486DE12
	Offset: 0x1BE8
	Size: 0x60
	Parameters: 1
	Flags: Event
*/
event codecallback_startgametype(eventstruct)
{
	if(isdefined(level.callbackstartgametype) && (!isdefined(level.gametypestarted) || !level.gametypestarted))
	{
		[[level.callbackstartgametype]]();
		level.gametypestarted = 1;
	}
}

/*
	Name: codecallback_entityspawned
	Namespace: callback
	Checksum: 0xB6862816
	Offset: 0x1C50
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event codecallback_entityspawned(eventstruct)
{
	if(!isdefined(level.callbackentityspawned))
	{
		waitframe(1);
	}
	[[level.callbackentityspawned]](eventstruct.localclientnum);
}

/*
	Name: function_de916514
	Namespace: callback
	Checksum: 0x30FCED7D
	Offset: 0x1C98
	Size: 0xA8
	Parameters: 1
	Flags: Event
*/
event function_de916514(eventstruct)
{
	if(isplayer(self))
	{
		if(isdefined(level.var_69b47c50))
		{
			self [[level.var_69b47c50]](eventstruct.localclientnum, eventstruct.vehicle);
		}
	}
	else if(self isvehicle())
	{
		if(isdefined(level.var_93b40f07))
		{
			self [[level.var_93b40f07]](eventstruct.localclientnum, eventstruct.player);
		}
	}
}

/*
	Name: function_feb0a2aa
	Namespace: callback
	Checksum: 0x823F1982
	Offset: 0x1D48
	Size: 0xA8
	Parameters: 1
	Flags: Event
*/
event function_feb0a2aa(eventstruct)
{
	if(isplayer(self))
	{
		if(isdefined(level.var_db2ec524))
		{
			self [[level.var_db2ec524]](eventstruct.localclientnum, eventstruct.vehicle);
		}
	}
	else if(self isvehicle())
	{
		if(isdefined(level.var_d4d60480))
		{
			self [[level.var_d4d60480]](eventstruct.localclientnum, eventstruct.player);
		}
	}
}

/*
	Name: codecallback_soundnotify
	Namespace: callback
	Checksum: 0x2301DB7
	Offset: 0x1DF8
	Size: 0x8A
	Parameters: 1
	Flags: Event
*/
event codecallback_soundnotify(eventstruct)
{
	switch(eventstruct.notetrack)
	{
		case "scr_bomb_beep":
		{
			if(getgametypesetting(#"silentplant") == 0)
			{
				self playsound(eventstruct.localclientnum, #"");
			}
			break;
		}
	}
}

/*
	Name: codecallback_entityshutdown
	Namespace: callback
	Checksum: 0x2C34BEB
	Offset: 0x1E90
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event codecallback_entityshutdown(eventstruct)
{
	if(isdefined(level.callbackentityshutdown))
	{
		[[level.callbackentityshutdown]](eventstruct.localclientnum, eventstruct.entity);
	}
	eventstruct.entity entity_callback(#"on_entity_shutdown", eventstruct.localclientnum);
}

/*
	Name: codecallback_localclientshutdown
	Namespace: callback
	Checksum: 0x4FFBC8D
	Offset: 0x1F08
	Size: 0x54
	Parameters: 1
	Flags: Event
*/
event codecallback_localclientshutdown(eventstruct)
{
	level.localplayers = getlocalplayers();
	eventstruct.entity callback(#"on_localclient_shutdown", eventstruct.localclientnum);
}

/*
	Name: codecallback_localclientchanged
	Namespace: callback
	Checksum: 0x4481D21B
	Offset: 0x1F68
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event codecallback_localclientchanged(eventstruct)
{
	level.localplayers = getlocalplayers();
}

/*
	Name: codecallback_airsupport
	Namespace: callback
	Checksum: 0x96BF279B
	Offset: 0x1F98
	Size: 0xA0
	Parameters: 1
	Flags: Event
*/
event codecallback_airsupport(eventstruct)
{
	if(isdefined(level.callbackairsupport))
	{
		[[level.callbackairsupport]](eventstruct.localclientnum, eventstruct.location[0], eventstruct.location[1], eventstruct.location[2], eventstruct.type, eventstruct.yaw, eventstruct.team, eventstruct.team_faction, eventstruct.owner, eventstruct.exit_type, eventstruct.server_time, eventstruct.height);
	}
}

/*
	Name: codecallback_demojump
	Namespace: callback
	Checksum: 0xC74B4B1B
	Offset: 0x2040
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event codecallback_demojump(eventstruct)
{
	level notify(#"demo_jump", {#time:eventstruct.time});
	level notify("demo_jump" + eventstruct.localclientnum, {#time:eventstruct.time});
	level callback(#"demo_jump", eventstruct);
}

/*
	Name: codecallback_demoplayerswitch
	Namespace: callback
	Checksum: 0x60927B69
	Offset: 0x20E0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function codecallback_demoplayerswitch(localclientnum)
{
	level notify(#"demo_player_switch");
	level notify("demo_player_switch" + localclientnum);
	level callback(#"demo_player_switch");
}

/*
	Name: codecallback_playerswitch
	Namespace: callback
	Checksum: 0x3D6348CB
	Offset: 0x2140
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event codecallback_playerswitch(eventstruct)
{
	level notify(#"player_switch");
	level notify("player_switch" + eventstruct.localclientnum);
	level callback(#"player_switch", eventstruct);
}

/*
	Name: codecallback_killcambegin
	Namespace: callback
	Checksum: 0xF8FE5C64
	Offset: 0x21A8
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event codecallback_killcambegin(eventstruct)
{
	level notify(#"killcam_begin", {#time:eventstruct.time});
	level notify("killcam_begin" + eventstruct.localclientnum, {#time:eventstruct.time});
	level callback(#"killcam_begin", eventstruct);
}

/*
	Name: codecallback_killcamend
	Namespace: callback
	Checksum: 0x7E36CA11
	Offset: 0x2248
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event codecallback_killcamend(eventstruct)
{
	level notify(#"killcam_end", {#time:eventstruct.time});
	level notify("killcam_end" + eventstruct.localclientnum, {#time:eventstruct.time});
	level callback(#"killcam_end", eventstruct);
}

/*
	Name: function_d6a509f1
	Namespace: callback
	Checksum: 0xA5374C35
	Offset: 0x22E8
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_d6a509f1(eventstruct)
{
	level callback(#"hash_7a8be4f48b2d1cf6", eventstruct);
}

/*
	Name: codecallback_creatingcorpse
	Namespace: callback
	Checksum: 0x2E7B4EAB
	Offset: 0x2320
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event codecallback_creatingcorpse(eventstruct)
{
	if(isdefined(level.callbackcreatingcorpse))
	{
		[[level.callbackcreatingcorpse]](eventstruct.localclientnum, eventstruct.player);
	}
}

/*
	Name: codecallback_activateexploder
	Namespace: callback
	Checksum: 0xF8073367
	Offset: 0x2368
	Size: 0xDC
	Parameters: 1
	Flags: Event
*/
event codecallback_activateexploder(eventstruct)
{
	if(!isdefined(level._exploder_ids))
	{
		return;
	}
	exploder = undefined;
	foreach(k, v in level._exploder_ids)
	{
		if(v == eventstruct.exploder_id)
		{
			exploder = k;
			break;
		}
	}
	if(!isdefined(exploder))
	{
		return;
	}
	exploder::activate_exploder(exploder);
}

/*
	Name: codecallback_deactivateexploder
	Namespace: callback
	Checksum: 0xD5F82BAC
	Offset: 0x2450
	Size: 0xDC
	Parameters: 1
	Flags: Event
*/
event codecallback_deactivateexploder(eventstruct)
{
	if(!isdefined(level._exploder_ids))
	{
		return;
	}
	exploder = undefined;
	foreach(k, v in level._exploder_ids)
	{
		if(v == eventstruct.exploder_id)
		{
			exploder = k;
			break;
		}
	}
	if(!isdefined(exploder))
	{
		return;
	}
	exploder::stop_exploder(exploder);
}

/*
	Name: codecallback_chargeshotweaponsoundnotify
	Namespace: callback
	Checksum: 0xA72724C0
	Offset: 0x2538
	Size: 0x48
	Parameters: 1
	Flags: Event
*/
event codecallback_chargeshotweaponsoundnotify(eventstruct)
{
	if(isdefined(level.sndchargeshot_func))
	{
		self [[level.sndchargeshot_func]](eventstruct.localclientnum, eventstruct.weapon, eventstruct.chargeshotlevel);
	}
}

/*
	Name: codecallback_hostmigration
	Namespace: callback
	Checksum: 0x4910EF45
	Offset: 0x2588
	Size: 0x54
	Parameters: 1
	Flags: Event
*/
event codecallback_hostmigration(eventstruct)
{
	/#
		println("");
	#/
	if(isdefined(level.callbackhostmigration))
	{
		[[level.callbackhostmigration]](eventstruct.localclientnum);
	}
}

/*
	Name: codecallback_playaifootstep
	Namespace: callback
	Checksum: 0xFC9D4ABA
	Offset: 0x25E8
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event codecallback_playaifootstep(eventstruct)
{
	[[level.callbackplayaifootstep]](eventstruct.localclientnum, eventstruct.location, eventstruct.surface, eventstruct.notetrack, eventstruct.bone);
}

/*
	Name: codecallback_clientflag
	Namespace: callback
	Checksum: 0xC9E47A81
	Offset: 0x2638
	Size: 0x44
	Parameters: 3
	Flags: None
*/
function codecallback_clientflag(localclientnum, flag, set)
{
	if(isdefined(level.callbackclientflag))
	{
		[[level.callbackclientflag]](localclientnum, flag, set);
	}
}

/*
	Name: codecallback_clientflagasval
	Namespace: callback
	Checksum: 0xAAD2DDF3
	Offset: 0x2688
	Size: 0x5E
	Parameters: 2
	Flags: None
*/
function codecallback_clientflagasval(localclientnum, val)
{
	if(isdefined(level._client_flagasval_callbacks) && isdefined(level._client_flagasval_callbacks[self.type]))
	{
		self thread [[level._client_flagasval_callbacks[self.type]]](localclientnum, val);
	}
}

/*
	Name: function_327732bf
	Namespace: callback
	Checksum: 0x8855E867
	Offset: 0x26F0
	Size: 0x74
	Parameters: 1
	Flags: Event
*/
event function_327732bf(eventstruct)
{
	if(isdefined(level.var_dda8e1d8))
	{
		[[level.var_dda8e1d8]](eventstruct.localclientnum, eventstruct.job_index, eventstruct.extracam_index, eventstruct.session_mode, eventstruct.character_index, eventstruct.outfit_index, eventstruct.item_type, eventstruct.item_index, eventstruct.is_defaultrender);
	}
}

/*
	Name: codecallback_extracamrenderwcpaintjobicon
	Namespace: callback
	Checksum: 0xFC23276C
	Offset: 0x2770
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event codecallback_extracamrenderwcpaintjobicon(eventstruct)
{
	if(isdefined(level.extra_cam_render_wc_paintjobicon_func_callback))
	{
		[[level.extra_cam_render_wc_paintjobicon_func_callback]](eventstruct.localclientnum, eventstruct.extracam_index, eventstruct.job_index, eventstruct.weapon_options, eventstruct.weapon, eventstruct.loadout_slot, eventstruct.paintjob_slot, eventstruct.is_fileshare_preview);
	}
}

/*
	Name: codecallback_extracamrenderwcvarianticon
	Namespace: callback
	Checksum: 0x871C54C9
	Offset: 0x27E8
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event codecallback_extracamrenderwcvarianticon(eventstruct)
{
	if(isdefined(level.extra_cam_render_wc_varianticon_func_callback))
	{
		[[level.extra_cam_render_wc_varianticon_func_callback]](eventstruct.localclientnum, eventstruct.extracam_index, eventstruct.job_index, eventstruct.weapon_options, eventstruct.weapon, eventstruct.loadout_slot, eventstruct.paintjob_slot, eventstruct.is_fileshare_preview);
	}
}

/*
	Name: codecallback_collectibleschanged
	Namespace: callback
	Checksum: 0xB5B651D9
	Offset: 0x2860
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event codecallback_collectibleschanged(eventstruct)
{
	if(isdefined(level.on_collectibles_change))
	{
		[[level.on_collectibles_change]](eventstruct.clientnum, eventstruct.collectibles, eventstruct.localclientnum);
	}
}

/*
	Name: add_weapon_type
	Namespace: callback
	Checksum: 0xC25D1DD6
	Offset: 0x28B0
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function add_weapon_type(weapontype, callback)
{
	if(!isdefined(level.weapon_type_callback_array))
	{
		level.weapon_type_callback_array = [];
	}
	weapontype = getweapon(weapontype);
	level.weapon_type_callback_array[weapontype] = callback;
}

/*
	Name: spawned_weapon_type
	Namespace: callback
	Checksum: 0x2A1CA556
	Offset: 0x2910
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function spawned_weapon_type(localclientnum)
{
	weapontype = self.weapon.rootweapon;
	if(isdefined(level.weapon_type_callback_array) && isdefined(level.weapon_type_callback_array[weapontype]))
	{
		self thread [[level.weapon_type_callback_array[weapontype]]](localclientnum);
	}
}

/*
	Name: function_cbfd8fd6
	Namespace: callback
	Checksum: 0x803BB103
	Offset: 0x2980
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_cbfd8fd6(localclientnum)
{
	activecamo::function_cbfd8fd6(localclientnum);
}

/*
	Name: codecallback_callclientscript
	Namespace: callback
	Checksum: 0xE6E366D1
	Offset: 0x29B0
	Size: 0xBA
	Parameters: 1
	Flags: Event
*/
event codecallback_callclientscript(eventstruct)
{
	if(!isdefined(level._animnotifyfuncs))
	{
		return;
	}
	if(isdefined(level._animnotifyfuncs[eventstruct.label]))
	{
		if(isdefined(eventstruct.param3) && eventstruct.param3 != "")
		{
			self [[level._animnotifyfuncs[eventstruct.label]]](eventstruct.param, eventstruct.param3);
		}
		else
		{
			self [[level._animnotifyfuncs[eventstruct.label]]](eventstruct.param);
		}
	}
}

/*
	Name: codecallback_callclientscriptonlevel
	Namespace: callback
	Checksum: 0x145126AD
	Offset: 0x2A78
	Size: 0xBA
	Parameters: 1
	Flags: Event
*/
event codecallback_callclientscriptonlevel(eventstruct)
{
	if(!isdefined(level._animnotifyfuncs))
	{
		return;
	}
	if(isdefined(level._animnotifyfuncs[eventstruct.label]))
	{
		if(isdefined(eventstruct.param3) && eventstruct.param3 != "")
		{
			level [[level._animnotifyfuncs[eventstruct.label]]](eventstruct.param, eventstruct.param3);
		}
		else
		{
			level [[level._animnotifyfuncs[eventstruct.label]]](eventstruct.param);
		}
	}
}

/*
	Name: function_2073f6dc
	Namespace: callback
	Checksum: 0xA0D4C6AF
	Offset: 0x2B40
	Size: 0x164
	Parameters: 1
	Flags: Event
*/
event function_2073f6dc(eventstruct)
{
	origin = self.origin;
	magnitude = float(eventstruct.magnitude);
	innerradius = float(eventstruct.innerradius);
	outerradius = float(eventstruct.outerradius);
	innerdamage = (isdefined(self.var_f501d778) ? self.var_f501d778 : 50);
	outerdamage = (isdefined(self.var_e14c1b5c) ? self.var_e14c1b5c : 25);
	var_a62fd3ab = (isdefined(self.var_abe3f153) ? self.var_abe3f153 : 1);
	var_c1cde02b = (isdefined(self.var_bd0f9401) ? self.var_bd0f9401 : 1);
	physicsexplosionsphere(eventstruct.localclientnum, origin, outerradius, innerradius, magnitude, innerdamage, outerdamage, var_a62fd3ab, var_c1cde02b);
}

/*
	Name: codecallback_serversceneinit
	Namespace: callback
	Checksum: 0xA050D75F
	Offset: 0x2CB0
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event codecallback_serversceneinit(eventstruct)
{
	if(isdefined(level.server_scenes[eventstruct.scene_name]))
	{
		level thread scene::init(eventstruct.scene_name);
	}
}

/*
	Name: codecallback_serversceneplay
	Namespace: callback
	Checksum: 0x5FB1D816
	Offset: 0x2D00
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event codecallback_serversceneplay(eventstruct)
{
	level thread scene_black_screen();
	if(isdefined(level.server_scenes[eventstruct.scene_name]))
	{
		level thread scene::play(eventstruct.scene_name);
	}
}

/*
	Name: codecallback_serverscenestop
	Namespace: callback
	Checksum: 0x1DF5D4F1
	Offset: 0x2D68
	Size: 0x64
	Parameters: 1
	Flags: Event
*/
event codecallback_serverscenestop(eventstruct)
{
	level thread scene_black_screen();
	if(isdefined(level.server_scenes[eventstruct.scene_name]))
	{
		level thread scene::stop(eventstruct.scene_name, undefined, undefined, undefined, 1);
	}
}

/*
	Name: scene_black_screen
	Namespace: callback
	Checksum: 0xC4E4FBDA
	Offset: 0x2DD8
	Size: 0x120
	Parameters: 0
	Flags: Linked
*/
function scene_black_screen()
{
	foreach(localclientnum in function_41bfa501())
	{
		lui::screen_fade_out(localclientnum, 0);
	}
	waitframe(1);
	foreach(localclientnum in function_41bfa501())
	{
		lui::screen_fade_in(localclientnum, 0);
	}
}

/*
	Name: codecallback_gadgetvisionpulse_reveal
	Namespace: callback
	Checksum: 0x918D0E3E
	Offset: 0x2F00
	Size: 0xC
	Parameters: 1
	Flags: Event
*/
event codecallback_gadgetvisionpulse_reveal(eventstruct)
{
}

/*
	Name: fade_to_black_for_x_sec
	Namespace: callback
	Checksum: 0xD5E121A1
	Offset: 0x2F18
	Size: 0x7C
	Parameters: 6
	Flags: Linked, Private
*/
function private fade_to_black_for_x_sec(localclientnum, startwait, blackscreenwait, fadeintime, fadeouttime, var_79f400ae)
{
	wait(startwait);
	lui::screen_fade_out(localclientnum, fadeintime, var_79f400ae);
	wait(blackscreenwait);
	if(isdefined(self))
	{
		lui::screen_fade_in(localclientnum, fadeouttime, var_79f400ae);
	}
}

/*
	Name: codecallback_fadeblackscreen
	Namespace: callback
	Checksum: 0xD21ACDBF
	Offset: 0x2FA0
	Size: 0x9C
	Parameters: 1
	Flags: Event
*/
event codecallback_fadeblackscreen(eventstruct)
{
	if(isdefined(self) && isplayer(self) && !isbot(self) && self function_21c0fa55())
	{
		level thread fade_to_black_for_x_sec(eventstruct.localclientnum, 0, eventstruct.duration, eventstruct.blend, eventstruct.blend);
	}
}

/*
	Name: function_4b5ab05f
	Namespace: callback
	Checksum: 0xBD2A11B0
	Offset: 0x3048
	Size: 0x9C
	Parameters: 1
	Flags: Event
*/
event function_4b5ab05f(eventstruct)
{
	if(isdefined(self) && isplayer(self) && !isbot(self) && self function_21c0fa55())
	{
		level thread fade_to_black_for_x_sec(eventstruct.localclientnum, 0, eventstruct.duration, eventstruct.blend_out, eventstruct.blend_in);
	}
}

/*
	Name: function_5067ee2f
	Namespace: callback
	Checksum: 0x308D4ECE
	Offset: 0x30F0
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_5067ee2f(eventstruct)
{
	self animation::play_siege(eventstruct.anim_name, eventstruct.shot_name, eventstruct.rate, eventstruct.loop);
}

/*
	Name: codecallback_forcestreambundle
	Namespace: callback
	Checksum: 0xE8288B24
	Offset: 0x3140
	Size: 0x34
	Parameters: 1
	Flags: Event
*/
event codecallback_forcestreambundle(eventstruct)
{
	forcestreambundle(eventstruct.name, eventstruct.var_3c542760, eventstruct.var_a0e51075);
}

/*
	Name: function_582e112f
	Namespace: callback
	Checksum: 0x2600BE05
	Offset: 0x3180
	Size: 0x54
	Parameters: 1
	Flags: Event
*/
event function_582e112f(eventstruct)
{
	if(isdefined(level.var_45ca79e5))
	{
		[[level.var_45ca79e5]](eventstruct.localclientnum, eventstruct.eventtype, eventstruct.itemid, eventstruct.value, eventstruct.value2);
	}
}

/*
	Name: function_11988454
	Namespace: callback
	Checksum: 0x394E6C42
	Offset: 0x31E0
	Size: 0x34
	Parameters: 1
	Flags: Event
*/
event function_11988454(eventstruct)
{
	if(isdefined(level.var_a6c75fcb))
	{
		[[level.var_a6c75fcb]](eventstruct.var_85604f16);
	}
}

/*
	Name: codecallback_trigger
	Namespace: callback
	Checksum: 0x6B1FBAF6
	Offset: 0x3220
	Size: 0x7C
	Parameters: 1
	Flags: Event
*/
event codecallback_trigger(eventstruct)
{
	if(isdefined(level.var_a6c75fcb))
	{
		self callback(#"on_trigger", eventstruct);
		self callback(#"on_trigger_once", eventstruct);
		self remove_on_trigger_once("all");
	}
}

/*
	Name: codecallback_entitydeleted
	Namespace: callback
	Checksum: 0xF45D979
	Offset: 0x32A8
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event codecallback_entitydeleted(eventstruct)
{
	self callback(#"on_entity_deleted");
}

/*
	Name: function_5019e563
	Namespace: callback
	Checksum: 0xBACECAF2
	Offset: 0x32E0
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event function_5019e563(eventstruct)
{
	self callback(#"freefall", eventstruct);
	self entity_callback(#"freefall", eventstruct.localclientnum, eventstruct);
}

/*
	Name: function_87b05fa3
	Namespace: callback
	Checksum: 0x8214BEFE
	Offset: 0x3348
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event function_87b05fa3(eventstruct)
{
	self callback(#"parachute", eventstruct);
	self entity_callback(#"parachute", eventstruct.localclientnum, eventstruct);
}

/*
	Name: function_5bc68fd9
	Namespace: callback
	Checksum: 0xBA59AE44
	Offset: 0x33B0
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event function_5bc68fd9(eventstruct)
{
	self callback(#"hash_5d462019157fdedc", eventstruct);
	self entity_callback(#"hash_5d462019157fdedc", eventstruct.localclientnum, eventstruct);
}

/*
	Name: function_250a9740
	Namespace: callback
	Checksum: 0x40506E7B
	Offset: 0x3418
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event function_250a9740(eventstruct)
{
	self callback(#"hash_171443902e2a22ee", eventstruct);
	self entity_callback(#"hash_171443902e2a22ee", eventstruct.localclientnum, eventstruct);
}

/*
	Name: codecallback_death
	Namespace: callback
	Checksum: 0x99BBF00B
	Offset: 0x3480
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event codecallback_death(eventstruct)
{
	self notify(#"death", eventstruct);
	self entity_callback(#"death", eventstruct);
}

/*
	Name: codecallback_melee
	Namespace: callback
	Checksum: 0x57AF6DD8
	Offset: 0x34D0
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event codecallback_melee(eventstruct)
{
	self callback(#"melee", eventstruct);
}

/*
	Name: function_667f84de
	Namespace: callback
	Checksum: 0xF40F5785
	Offset: 0x3508
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_667f84de(eventstruct)
{
	self entity_callback(#"culled", eventstruct);
}

/*
	Name: function_255585d
	Namespace: callback
	Checksum: 0xAE5EE0FD
	Offset: 0x3540
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_255585d(eventstruct)
{
	callback(#"hash_5fc3311fa3420931", eventstruct);
}

/*
	Name: function_6846a2b7
	Namespace: callback
	Checksum: 0xCB9AE80C
	Offset: 0x3578
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event function_6846a2b7(eventstruct)
{
	if(self function_21c0fa55())
	{
		level callback(#"weapon_change", eventstruct);
	}
	self callback(#"weapon_change", eventstruct);
}

/*
	Name: function_c33f3471
	Namespace: callback
	Checksum: 0xF20555F5
	Offset: 0x35F0
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event function_c33f3471(eventstruct)
{
	if(self function_21c0fa55())
	{
		level callback(#"hash_4152cf6a61494581", eventstruct);
	}
	self callback(#"hash_4152cf6a61494581", eventstruct);
}

/*
	Name: function_ff9acfac
	Namespace: callback
	Checksum: 0x29E0E0AD
	Offset: 0x3668
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_ff9acfac(eventstruct)
{
	level callback(#"hash_2fc4cfecaed47583", eventstruct);
}

/*
	Name: function_c0a2fad1
	Namespace: callback
	Checksum: 0x3A79240F
	Offset: 0x36A0
	Size: 0x4C
	Parameters: 1
	Flags: Event
*/
event function_c0a2fad1(eventstruct)
{
	self callback(#"hash_42d524149523a1eb", eventstruct);
	self callback(#"hash_eb85a61dd6639ae", eventstruct);
}

/*
	Name: function_5ea431f0
	Namespace: callback
	Checksum: 0xB7F7497F
	Offset: 0x36F8
	Size: 0xAC
	Parameters: 1
	Flags: Event
*/
event function_5ea431f0(eventstruct)
{
	if(self function_21c0fa55())
	{
		level callback(#"hash_56b841ac8d1dac0b", eventstruct);
		level callback(#"hash_eb85a61dd6639ae", eventstruct);
	}
	self callback(#"hash_56b841ac8d1dac0b", eventstruct);
	self callback(#"hash_eb85a61dd6639ae", eventstruct);
}

/*
	Name: function_7831af89
	Namespace: callback
	Checksum: 0x85F99462
	Offset: 0x37B0
	Size: 0xAC
	Parameters: 1
	Flags: Event
*/
event function_7831af89(eventstruct)
{
	if(self function_21c0fa55())
	{
		level callback(#"hash_28ae86e34f270362", eventstruct);
		level callback(#"hash_eb85a61dd6639ae", eventstruct);
	}
	self callback(#"hash_28ae86e34f270362", eventstruct);
	self callback(#"hash_eb85a61dd6639ae", eventstruct);
}

/*
	Name: codecallback_updateactivecamo
	Namespace: callback
	Checksum: 0x966D6D39
	Offset: 0x3868
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event codecallback_updateactivecamo(eventstruct)
{
	self callback(#"updateactivecamo", eventstruct.localclientnum, eventstruct);
}

/*
	Name: function_bc70e1e4
	Namespace: callback
	Checksum: 0x2E551CB9
	Offset: 0x38B0
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_bc70e1e4(eventstruct)
{
	self callback(#"hash_6900f4ea0ff32c3e", eventstruct);
}

/*
	Name: function_87cf247e
	Namespace: callback
	Checksum: 0xEAACBB2C
	Offset: 0x38E8
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_87cf247e(eventstruct)
{
	self callback(#"hash_435b494b9418c561", eventstruct);
}

/*
	Name: function_45d8e443
	Namespace: callback
	Checksum: 0xFD8B3BEB
	Offset: 0x3920
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_45d8e443(eventstruct)
{
	self callback(#"hash_5768f5220f99ebd1", eventstruct);
}

/*
	Name: function_84c7f7d4
	Namespace: callback
	Checksum: 0xEE7D801E
	Offset: 0x3958
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_84c7f7d4(eventstruct)
{
	self callback(#"hash_23660169f647c82b", eventstruct);
}

/*
	Name: function_fcc3f82c
	Namespace: callback
	Checksum: 0xBE38AAE7
	Offset: 0x3990
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_fcc3f82c(eventstruct)
{
	self callback(#"hash_4bc6f7eaa57c10a7", eventstruct);
}

/*
	Name: function_75438dba
	Namespace: callback
	Checksum: 0x225D2D46
	Offset: 0x39C8
	Size: 0xDA
	Parameters: 1
	Flags: Event
*/
event function_75438dba(eventstruct)
{
	if(!isdefined(self) || !isplayer(self))
	{
		return;
	}
	localclientnum = eventstruct.localclientnum;
	if(!isdefined(localclientnum))
	{
		return;
	}
	if(isdefined(level.var_a979e61b))
	{
		if(self [[level.var_a979e61b]](localclientnum) === 1)
		{
			return;
		}
	}
	if(isdefined(level.var_a05cd64e))
	{
		if(self [[level.var_a05cd64e]](localclientnum) === 1)
		{
			return;
		}
	}
	if(isdefined(level.var_53854c4))
	{
		if(self [[level.var_53854c4]](localclientnum) === 1)
		{
			return;
		}
	}
}

/*
	Name: function_54972fb6
	Namespace: callback
	Checksum: 0x637507A3
	Offset: 0x3AB0
	Size: 0x82
	Parameters: 1
	Flags: Event
*/
event function_54972fb6(eventstruct)
{
	if(!isdefined(self) || !isplayer(self))
	{
		return;
	}
	localclientnum = eventstruct.localclientnum;
	if(!isdefined(localclientnum))
	{
		return;
	}
	if(isdefined(level.var_a05cd64e))
	{
		if(self [[level.var_a05cd64e]](localclientnum) === 1)
		{
			return;
		}
	}
}

/*
	Name: objective_update
	Namespace: callback
	Checksum: 0x8893B147
	Offset: 0x3B40
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event objective_update(eventstruct)
{
	self callback(#"hash_34e39ee0c9fa0092", eventstruct);
}

/*
	Name: callback_stunned
	Namespace: callback
	Checksum: 0x398B2D36
	Offset: 0x3B78
	Size: 0xBC
	Parameters: 7
	Flags: Linked
*/
function callback_stunned(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.stunned = bwastimejump;
	/#
		println("");
	#/
	if(bwastimejump)
	{
		self notify(#"stunned");
	}
	else
	{
		self notify(#"not_stunned");
	}
	if(isdefined(self.stunnedcallback))
	{
		self [[self.stunnedcallback]](fieldname, bwastimejump);
	}
}

