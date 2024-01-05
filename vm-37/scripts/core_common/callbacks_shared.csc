#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\activecamo_shared.csc;

#namespace callback;

/*
	Name: callback
	Namespace: callback
	Checksum: 0xB4063AD
	Offset: 0x108
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
	Checksum: 0x3A22E42E
	Offset: 0x240
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
	Checksum: 0x28D23498
	Offset: 0x368
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
	Checksum: 0x3CE1E3C6
	Offset: 0x4F0
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
	Checksum: 0x4C6EE35E
	Offset: 0x650
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
	Checksum: 0xF4F9DF82
	Offset: 0x6A0
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
	Checksum: 0xEC49ACB5
	Offset: 0x7D0
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
	Checksum: 0x5A51E86B
	Offset: 0x908
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
	Checksum: 0x2F07B0F4
	Offset: 0x950
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
	Checksum: 0x5304035E
	Offset: 0x998
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
	Checksum: 0x34FB2C56
	Offset: 0x9E0
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
	Checksum: 0x8AE2FA7C
	Offset: 0xA28
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
	Checksum: 0x81C0EEC6
	Offset: 0xA70
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
	Checksum: 0x892C8249
	Offset: 0xAB8
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
	Checksum: 0x1F804BD2
	Offset: 0xB00
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
	Checksum: 0x3E0623F7
	Offset: 0xB48
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
	Checksum: 0x60F428AE
	Offset: 0xB90
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
	Checksum: 0x7C336356
	Offset: 0xBD8
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
	Checksum: 0x7450CD19
	Offset: 0xC20
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
	Checksum: 0xD5765A2D
	Offset: 0xC68
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
	Checksum: 0x805DE880
	Offset: 0xCB0
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
	Checksum: 0x190A9A7B
	Offset: 0xCF8
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
	Checksum: 0x3F768110
	Offset: 0xD40
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
	Checksum: 0x7C5152F2
	Offset: 0xD88
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
	Checksum: 0x72637449
	Offset: 0xDD0
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
	Checksum: 0x3AFD44C3
	Offset: 0xE18
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
	Checksum: 0xF0285D1E
	Offset: 0xE60
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
	Checksum: 0x42FEF37D
	Offset: 0xEA8
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
	Checksum: 0x433BB198
	Offset: 0xEF0
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
	Checksum: 0x7855E1C5
	Offset: 0xF38
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
	Checksum: 0xE8A0507B
	Offset: 0xF80
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
	Checksum: 0x68C6D91F
	Offset: 0xFC8
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
	Checksum: 0x22D8C1E5
	Offset: 0x1010
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
	Checksum: 0xC6CCC39C
	Offset: 0x1058
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
	Checksum: 0xEC0F3AD5
	Offset: 0x10A0
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
	Checksum: 0xBC0865FD
	Offset: 0x10E8
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
	Checksum: 0x575391F9
	Offset: 0x1130
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
	Checksum: 0x8FE3427B
	Offset: 0x1178
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
	Checksum: 0xC0C5F684
	Offset: 0x11C0
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
	Checksum: 0x91FA2768
	Offset: 0x1208
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
	Checksum: 0xA3DEE337
	Offset: 0x1250
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
	Checksum: 0x3B73B24F
	Offset: 0x1298
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
	Checksum: 0x3293397B
	Offset: 0x12E0
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
	Checksum: 0xA1F77141
	Offset: 0x1328
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
	Checksum: 0xE74D9065
	Offset: 0x1370
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
	Checksum: 0x51113F2A
	Offset: 0x13B8
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
	Checksum: 0x205D136A
	Offset: 0x1400
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
	Checksum: 0x38439211
	Offset: 0x1448
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
	Checksum: 0xF8A22B5F
	Offset: 0x1490
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
	Checksum: 0x417067B6
	Offset: 0x14D8
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
	Checksum: 0xCA71870
	Offset: 0x1520
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
	Checksum: 0x673A9D8
	Offset: 0x1568
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
	Checksum: 0xD001EBF6
	Offset: 0x1590
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
	Checksum: 0x80DD0A8D
	Offset: 0x15B8
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
	Checksum: 0xA9A3FBE3
	Offset: 0x1600
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
	Checksum: 0xFC6402A8
	Offset: 0x1718
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
	Checksum: 0x494FCC73
	Offset: 0x1770
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
	Checksum: 0x667CEABA
	Offset: 0x17E0
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
	Checksum: 0xBC37963F
	Offset: 0x1838
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
	Checksum: 0x286615F
	Offset: 0x18A8
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
	Checksum: 0xAFDE0369
	Offset: 0x18E0
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
	Checksum: 0x7439FDB9
	Offset: 0x1930
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
	Checksum: 0x2329058A
	Offset: 0x1948
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
	Checksum: 0xDC0913A9
	Offset: 0x19A0
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
	Checksum: 0xF7055F41
	Offset: 0x19E0
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event codecallback_playerspawned(eventstruct)
{
	if(!isdefined(level.callbackplayerspawned))
	{
		waitframe(1);
	}
	[[level.callbackplayerspawned]](eventstruct.localclientnum);
}

/*
	Name: codecallback_playerlaststand
	Namespace: callback
	Checksum: 0xE6E82B14
	Offset: 0x1A28
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
	Checksum: 0xC5E97978
	Offset: 0x1A58
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
	Checksum: 0x91ED29D3
	Offset: 0x1AB8
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
	Checksum: 0x5D8418C7
	Offset: 0x1AF8
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
	Checksum: 0xAD23CFCC
	Offset: 0x1B40
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
	Checksum: 0x612B1195
	Offset: 0x1B90
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
	Checksum: 0x57FABDCD
	Offset: 0x1BC8
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
	Checksum: 0x7B29F7CF
	Offset: 0x1C30
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
	Checksum: 0x7B768C0B
	Offset: 0x1C78
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
	Checksum: 0x2E9C9F45
	Offset: 0x1D28
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
	Checksum: 0xAAFD0F3E
	Offset: 0x1DD8
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
	Checksum: 0x118D4195
	Offset: 0x1E70
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
	Checksum: 0x363C41AE
	Offset: 0x1EE8
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
	Checksum: 0x2527405E
	Offset: 0x1F48
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
	Checksum: 0xB136BB14
	Offset: 0x1F78
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
	Checksum: 0x9DCD661
	Offset: 0x2020
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
	Checksum: 0xC662A9DE
	Offset: 0x20C0
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
	Checksum: 0x3DE7D29A
	Offset: 0x2120
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
	Checksum: 0x30A5BDF1
	Offset: 0x2188
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
	Checksum: 0x7985B088
	Offset: 0x2228
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
	Checksum: 0x67BE69FC
	Offset: 0x22C8
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
	Checksum: 0xEA79129F
	Offset: 0x2300
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
	Checksum: 0x3C99C161
	Offset: 0x2348
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
	Checksum: 0xE419A205
	Offset: 0x2430
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
	Checksum: 0xBE4AE6C1
	Offset: 0x2518
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
	Checksum: 0x7B21754E
	Offset: 0x2568
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
	Checksum: 0x2BEF9BFA
	Offset: 0x25C8
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
	Checksum: 0x35C58752
	Offset: 0x2618
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
	Checksum: 0xEA0D6464
	Offset: 0x2668
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
	Checksum: 0xF26D4600
	Offset: 0x26D0
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
	Checksum: 0x375F89C
	Offset: 0x2750
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
	Checksum: 0x89BCFF2A
	Offset: 0x27C8
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
	Checksum: 0x94ECFC96
	Offset: 0x2840
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
	Checksum: 0xD44C8052
	Offset: 0x2890
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
	Checksum: 0x7959C3E5
	Offset: 0x28F0
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
	Checksum: 0x781B2138
	Offset: 0x2960
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
	Checksum: 0x22966A78
	Offset: 0x2990
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
	Checksum: 0xB6EC38A6
	Offset: 0x2A58
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
	Checksum: 0xA9E56DC7
	Offset: 0x2B20
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
	Checksum: 0x7CC4F3D6
	Offset: 0x2C90
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
	Checksum: 0x494ACE2C
	Offset: 0x2CE0
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
	Checksum: 0x790846BB
	Offset: 0x2D48
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
	Checksum: 0xD93B9F17
	Offset: 0x2DB8
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
	Checksum: 0xCFABBE94
	Offset: 0x2EE0
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
	Checksum: 0x612CE3CF
	Offset: 0x2EF8
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
	Checksum: 0xFE5005FE
	Offset: 0x2F80
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
	Checksum: 0x4B56CBAE
	Offset: 0x3028
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
	Checksum: 0xD98B2B27
	Offset: 0x30D0
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
	Checksum: 0x61412497
	Offset: 0x3120
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
	Checksum: 0xD70D10C6
	Offset: 0x3160
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
	Checksum: 0x2C4A26C4
	Offset: 0x31C0
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
	Checksum: 0x954F633A
	Offset: 0x3200
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
	Checksum: 0x95E2B2CF
	Offset: 0x3288
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
	Checksum: 0xCD67EFB0
	Offset: 0x32C0
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
	Checksum: 0xFF9C44F7
	Offset: 0x3328
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
	Checksum: 0x3350FAE8
	Offset: 0x3390
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
	Checksum: 0xEF835E53
	Offset: 0x33F8
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
	Checksum: 0x1055C5FA
	Offset: 0x3460
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
	Checksum: 0x1463EA3A
	Offset: 0x34B0
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
	Checksum: 0x641A1711
	Offset: 0x34E8
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
	Checksum: 0x4A1ECE8E
	Offset: 0x3520
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
	Checksum: 0x30BCAE0E
	Offset: 0x3558
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
	Checksum: 0x5AD95B71
	Offset: 0x35D0
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
	Checksum: 0x737A414
	Offset: 0x3648
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
	Checksum: 0xC70EF2F9
	Offset: 0x3680
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
	Checksum: 0x36A262A6
	Offset: 0x36D8
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
	Checksum: 0x354E9C5D
	Offset: 0x3790
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
	Checksum: 0x8E2A5E32
	Offset: 0x3848
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
	Checksum: 0x1828D024
	Offset: 0x3890
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
	Checksum: 0x166069E1
	Offset: 0x38C8
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
	Checksum: 0x30B46CDB
	Offset: 0x3900
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
	Checksum: 0xA5C831DD
	Offset: 0x3938
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
	Checksum: 0xC768E264
	Offset: 0x3970
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
	Checksum: 0xCA9D76C0
	Offset: 0x39A8
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
	Checksum: 0x4927BCB2
	Offset: 0x3A90
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
	Checksum: 0xE0D0976C
	Offset: 0x3B20
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
	Checksum: 0xE4EBC6B7
	Offset: 0x3B58
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

