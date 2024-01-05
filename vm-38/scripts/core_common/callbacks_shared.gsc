#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\simple_hostmigration.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace callbacks_shared;

/*
	Name: function_f26dc36d
	Namespace: callbacks_shared
	Checksum: 0x7923296E
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f26dc36d()
{
	level notify(-767137062);
}

#namespace callback;

/*
	Name: callback
	Namespace: callback
	Checksum: 0xBB2C3C42
	Offset: 0x128
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function callback(event, params)
{
	mpl_heatwave_fx(level, event, params);
	if(self != level)
	{
		mpl_heatwave_fx(self, event, params);
	}
}

/*
	Name: function_bea20a96
	Namespace: callback
	Checksum: 0x84711F73
	Offset: 0x190
	Size: 0xB8
	Parameters: 2
	Flags: None
*/
function function_bea20a96(event, params)
{
	ais = getaiarray();
	foreach(ai in ais)
	{
		ai mpl_heatwave_fx(ai, event, params);
	}
}

/*
	Name: function_daed27e8
	Namespace: callback
	Checksum: 0xFDEBBB73
	Offset: 0x250
	Size: 0xD8
	Parameters: 2
	Flags: Linked
*/
function function_daed27e8(event, params)
{
	players = getplayers();
	foreach(player in players)
	{
		player mpl_heatwave_fx(level, event, params);
		player mpl_heatwave_fx(player, event, params);
	}
}

/*
	Name: mpl_heatwave_fx
	Namespace: callback
	Checksum: 0x71B33772
	Offset: 0x330
	Size: 0x1DC
	Parameters: 3
	Flags: Linked, Private
*/
function private mpl_heatwave_fx(ent, event, params)
{
	callbacks = ent._callbacks[event];
	if(isdefined(callbacks))
	{
		for(i = 0; i < callbacks.size; i++)
		{
			var_3680f05b = callbacks[i];
			if(!isarray(var_3680f05b))
			{
				continue;
			}
			callback = var_3680f05b[0];
			/#
				/#
					assert(isfunctionptr(callback), "" + "");
				#/
			#/
			if(!isfunctionptr(callback))
			{
				return;
			}
			obj = var_3680f05b[1];
			var_47e0b77b = var_3680f05b[2];
			if(!isdefined(var_47e0b77b))
			{
				var_47e0b77b = [];
			}
			if(isdefined(obj))
			{
				if(isdefined(params))
				{
					util::function_cf55c866(obj, callback, self, params, var_47e0b77b);
				}
				else
				{
					util::function_50f54b6f(obj, callback, self, var_47e0b77b);
				}
				continue;
			}
			if(isdefined(params))
			{
				util::function_50f54b6f(self, callback, params, var_47e0b77b);
				continue;
			}
			util::single_thread_argarray(self, callback, var_47e0b77b);
		}
		arrayremovevalue(callbacks, 0, 0);
	}
}

/*
	Name: add_callback
	Namespace: callback
	Checksum: 0x50A45169
	Offset: 0x518
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function add_callback(event, func, obj, a_params)
{
	function_2b653c00(level, event, func, obj, a_params);
}

/*
	Name: function_d8abfc3d
	Namespace: callback
	Checksum: 0xBF6E62CF
	Offset: 0x568
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function function_d8abfc3d(event, func, obj, a_params)
{
	function_2b653c00(self, event, func, obj, a_params);
}

/*
	Name: function_2b653c00
	Namespace: callback
	Checksum: 0x1C4AF64E
	Offset: 0x5B8
	Size: 0x204
	Parameters: 5
	Flags: Linked, Private
*/
function private function_2b653c00(ent, event, func, obj, a_params)
{
	if(!isdefined(ent))
	{
		return;
	}
	/#
		/#
			assert(isfunctionptr(func), "" + "");
		#/
	#/
	if(!isfunctionptr(func))
	{
		return;
	}
	/#
		assert(isdefined(event), "");
	#/
	if(!(isdefined(ent._callbacks) && isdefined(ent._callbacks[event])))
	{
		ent._callbacks[event] = [];
	}
	foreach(callback in ent._callbacks[event])
	{
		if(isarray(callback) && callback[0] == func)
		{
			if(!isdefined(obj) || callback[1] == obj)
			{
				return;
			}
		}
	}
	array::add(ent._callbacks[event], array(func, obj, a_params), 0);
	if(isdefined(obj))
	{
		obj thread remove_callback_on_death(event, func);
	}
}

/*
	Name: function_862146b3
	Namespace: callback
	Checksum: 0x70B4CD73
	Offset: 0x7C8
	Size: 0x3C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_862146b3(event, func)
{
	return string(event) + string(func);
}

/*
	Name: remove_callback_on_death
	Namespace: callback
	Checksum: 0xF5C32F19
	Offset: 0x810
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function remove_callback_on_death(event, func)
{
	self notify(function_862146b3(event, func));
	self endon(function_862146b3(event, func));
	self waittill(#"death", #"remove_callbacks");
	remove_callback(event, func, self);
}

/*
	Name: remove_callback
	Namespace: callback
	Checksum: 0xEC210888
	Offset: 0x8A0
	Size: 0x3C
	Parameters: 3
	Flags: Linked
*/
function remove_callback(event, func, obj)
{
	function_3f5f097e(level, event, func, obj);
}

/*
	Name: function_52ac9652
	Namespace: callback
	Checksum: 0x38938B0B
	Offset: 0x8E8
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function function_52ac9652(event, func, obj, instant)
{
	function_3f5f097e(self, event, func, obj, instant);
}

/*
	Name: function_3f5f097e
	Namespace: callback
	Checksum: 0x3FD65005
	Offset: 0x938
	Size: 0x1C2
	Parameters: 5
	Flags: Linked, Private
*/
function private function_3f5f097e(ent, event, func, obj, instant)
{
	if(!isdefined(ent._callbacks))
	{
		return;
	}
	/#
		assert(isdefined(event), "");
	#/
	if(func === "all")
	{
		ent._callbacks[event] = [];
		return;
	}
	if(!isdefined(ent._callbacks[event]))
	{
		return;
	}
	if(is_true(instant))
	{
		arrayremovevalue(ent._callbacks[event], 0, 0);
		return;
	}
	foreach(func_group in ent._callbacks[event])
	{
		if(isarray(func_group) && func_group[0] == func)
		{
			if(func_group[1] === obj)
			{
				if(isdefined(obj))
				{
					obj notify(function_862146b3(event, func));
				}
				ent._callbacks[event][index] = 0;
				break;
			}
		}
	}
}

/*
	Name: on_finalize_initialization
	Namespace: callback
	Checksum: 0x1293ACB5
	Offset: 0xB08
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_finalize_initialization(func, obj)
{
	add_callback(#"on_finalize_initialization", func, obj);
}

/*
	Name: on_connect
	Namespace: callback
	Checksum: 0xA373F00D
	Offset: 0xB50
	Size: 0x44
	Parameters: 3
	Flags: Linked, Variadic
*/
function on_connect(func, obj, ...)
{
	add_callback(#"on_player_connect", func, obj, vararg);
}

/*
	Name: remove_on_connect
	Namespace: callback
	Checksum: 0x715C77A1
	Offset: 0xBA0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_connect(func, obj)
{
	remove_callback(#"on_player_connect", func, obj);
}

/*
	Name: on_connecting
	Namespace: callback
	Checksum: 0x8BEC9DB5
	Offset: 0xBE8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_connecting(func, obj)
{
	add_callback(#"on_player_connecting", func, obj);
}

/*
	Name: remove_on_connecting
	Namespace: callback
	Checksum: 0x6B90D8C4
	Offset: 0xC30
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_connecting(func, obj)
{
	remove_callback(#"on_player_connecting", func, obj);
}

/*
	Name: on_disconnect
	Namespace: callback
	Checksum: 0xBAA8E174
	Offset: 0xC78
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_disconnect(func, obj)
{
	add_callback(#"on_player_disconnect", func, obj);
}

/*
	Name: remove_on_disconnect
	Namespace: callback
	Checksum: 0xDCE42B9D
	Offset: 0xCC0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_disconnect(func, obj)
{
	remove_callback(#"on_player_disconnect", func, obj);
}

/*
	Name: on_spawned
	Namespace: callback
	Checksum: 0xAF5CE166
	Offset: 0xD08
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
	Checksum: 0x2767016A
	Offset: 0xD50
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_spawned(func, obj)
{
	remove_callback(#"on_player_spawned", func, obj);
}

/*
	Name: function_acaac19b
	Namespace: callback
	Checksum: 0x8D5B31D
	Offset: 0xD98
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_acaac19b(func, obj)
{
	add_callback(#"hash_3e52a013a2eb0f16", func, obj);
}

/*
	Name: function_2d538029
	Namespace: callback
	Checksum: 0x65C5A698
	Offset: 0xDE0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_2d538029(func, obj)
{
	remove_callback(#"hash_3e52a013a2eb0f16", func, obj);
}

/*
	Name: remove_on_revived
	Namespace: callback
	Checksum: 0x8E07ED90
	Offset: 0xE28
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_revived(func, obj)
{
	remove_callback(#"on_player_revived", func, obj);
}

/*
	Name: on_deleted
	Namespace: callback
	Checksum: 0x88C980D9
	Offset: 0xE70
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_deleted(func, obj)
{
	add_callback(#"on_entity_deleted", func, obj);
}

/*
	Name: remove_on_deleted
	Namespace: callback
	Checksum: 0x9D9B741E
	Offset: 0xEB8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_deleted(func, obj)
{
	remove_callback(#"on_entity_deleted", func, obj);
}

/*
	Name: on_loadout
	Namespace: callback
	Checksum: 0x3160AFE6
	Offset: 0xF00
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_loadout(func, obj)
{
	add_callback(#"on_loadout", func, obj);
}

/*
	Name: remove_on_loadout
	Namespace: callback
	Checksum: 0x72C982F1
	Offset: 0xF48
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_loadout(func, obj)
{
	remove_callback(#"on_loadout", func, obj);
}

/*
	Name: on_player_damage
	Namespace: callback
	Checksum: 0x4E9C81F
	Offset: 0xF90
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_player_damage(func, obj)
{
	add_callback(#"on_player_damage", func, obj);
}

/*
	Name: remove_on_player_damage
	Namespace: callback
	Checksum: 0xD413EA88
	Offset: 0xFD8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_player_damage(func, obj)
{
	remove_callback(#"on_player_damage", func, obj);
}

/*
	Name: on_start_gametype
	Namespace: callback
	Checksum: 0xBC932100
	Offset: 0x1020
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
	Checksum: 0x22282E91
	Offset: 0x1068
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_end_game(func, obj)
{
	add_callback(#"on_end_game", func, obj);
}

/*
	Name: function_14dae612
	Namespace: callback
	Checksum: 0x4387CC52
	Offset: 0x10B0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_14dae612(func, obj)
{
	add_callback(#"hash_1b5be9017cd4b5fa", func, obj);
}

/*
	Name: on_game_playing
	Namespace: callback
	Checksum: 0xD7600CB2
	Offset: 0x10F8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_game_playing(func, obj)
{
	add_callback(#"on_game_playing", func, obj);
}

/*
	Name: function_359493ba
	Namespace: callback
	Checksum: 0x6738CFA7
	Offset: 0x1140
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_359493ba(func, obj)
{
	add_callback(#"hash_7177603f5415549b", func, obj);
}

/*
	Name: on_joined_team
	Namespace: callback
	Checksum: 0xAE2DE6A1
	Offset: 0x1188
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_joined_team(func, obj)
{
	add_callback(#"joined_team", func, obj);
}

/*
	Name: on_joined_spectate
	Namespace: callback
	Checksum: 0x35057B7E
	Offset: 0x11D0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_joined_spectate(func, obj)
{
	add_callback(#"on_joined_spectator", func, obj);
}

/*
	Name: on_player_killed
	Namespace: callback
	Checksum: 0x6B2EADD6
	Offset: 0x1218
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_player_killed(func, obj)
{
	add_callback(#"on_player_killed", func, obj);
}

/*
	Name: function_c046382d
	Namespace: callback
	Checksum: 0x4794BED7
	Offset: 0x1260
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_c046382d(func, obj)
{
	add_callback(#"hash_2fea1d218f4c6a1f", func, obj);
}

/*
	Name: on_player_corpse
	Namespace: callback
	Checksum: 0xDE3C52C3
	Offset: 0x12A8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_player_corpse(func, obj)
{
	add_callback(#"on_player_corpse", func, obj);
}

/*
	Name: remove_on_player_killed
	Namespace: callback
	Checksum: 0xC57F1C02
	Offset: 0x12F0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_player_killed(func, obj)
{
	remove_callback(#"on_player_killed", func, obj);
}

/*
	Name: function_489cbdb4
	Namespace: callback
	Checksum: 0x2C93A29F
	Offset: 0x1338
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_489cbdb4(func, obj)
{
	remove_callback(#"hash_2fea1d218f4c6a1f", func, obj);
}

/*
	Name: function_80270643
	Namespace: callback
	Checksum: 0x38334900
	Offset: 0x1380
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_80270643(func, obj)
{
	add_callback(#"on_team_eliminated", func, obj);
}

/*
	Name: function_c53a8ab8
	Namespace: callback
	Checksum: 0x55842BA6
	Offset: 0x13C8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_c53a8ab8(func, obj)
{
	remove_callback(#"on_team_eliminated", func, obj);
}

/*
	Name: on_ai_killed
	Namespace: callback
	Checksum: 0xA576B280
	Offset: 0x1410
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_ai_killed(func, obj)
{
	add_callback(#"on_ai_killed", func, obj);
}

/*
	Name: remove_on_ai_killed
	Namespace: callback
	Checksum: 0x672540CA
	Offset: 0x1458
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_ai_killed(func, obj)
{
	remove_callback(#"on_ai_killed", func, obj);
}

/*
	Name: on_actor_killed
	Namespace: callback
	Checksum: 0x4B2E66CA
	Offset: 0x14A0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_actor_killed(func, obj)
{
	add_callback(#"on_actor_killed", func, obj);
}

/*
	Name: remove_on_actor_killed
	Namespace: callback
	Checksum: 0x56699A44
	Offset: 0x14E8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_actor_killed(func, obj)
{
	remove_callback(#"on_actor_killed", func, obj);
}

/*
	Name: function_30c3f95d
	Namespace: callback
	Checksum: 0xDD9BD2F8
	Offset: 0x1530
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_30c3f95d(func, obj)
{
	function_d8abfc3d(#"hash_3d6ccbbe0e628b2d", func, obj);
}

/*
	Name: function_95ba5345
	Namespace: callback
	Checksum: 0xF4A4523D
	Offset: 0x1578
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_95ba5345(func, obj)
{
	function_52ac9652(#"hash_3d6ccbbe0e628b2d", func, obj);
}

/*
	Name: on_vehicle_spawned
	Namespace: callback
	Checksum: 0x7A8CA01F
	Offset: 0x15C0
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
	Checksum: 0x733943E8
	Offset: 0x1608
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_vehicle_spawned(func, obj)
{
	remove_callback(#"on_vehicle_spawned", func, obj);
}

/*
	Name: on_vehicle_killed
	Namespace: callback
	Checksum: 0x5975AF9F
	Offset: 0x1650
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_vehicle_killed(func, obj)
{
	add_callback(#"on_vehicle_killed", func, obj);
}

/*
	Name: on_vehicle_collision
	Namespace: callback
	Checksum: 0xF4FC29E3
	Offset: 0x1698
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_vehicle_collision(func, obj)
{
	function_d8abfc3d(#"veh_collision", func, obj);
}

/*
	Name: remove_on_vehicle_killed
	Namespace: callback
	Checksum: 0x3B13867
	Offset: 0x16E0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_vehicle_killed(func, obj)
{
	remove_callback(#"on_vehicle_killed", func, obj);
}

/*
	Name: on_ai_damage
	Namespace: callback
	Checksum: 0x3C4847C6
	Offset: 0x1728
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_ai_damage(func, obj)
{
	add_callback(#"on_ai_damage", func, obj);
}

/*
	Name: remove_on_ai_damage
	Namespace: callback
	Checksum: 0x5CBC4D89
	Offset: 0x1770
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_ai_damage(func, obj)
{
	remove_callback(#"on_ai_damage", func, obj);
}

/*
	Name: on_ai_spawned
	Namespace: callback
	Checksum: 0x4EEFE325
	Offset: 0x17B8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_ai_spawned(func, obj)
{
	add_callback(#"on_ai_spawned", func, obj);
}

/*
	Name: remove_on_ai_spawned
	Namespace: callback
	Checksum: 0x2828E6AB
	Offset: 0x1800
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_ai_spawned(func, obj)
{
	remove_callback(#"on_ai_spawned", func, obj);
}

/*
	Name: function_f642faf2
	Namespace: callback
	Checksum: 0xFF25EDB8
	Offset: 0x1848
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_f642faf2(func, obj)
{
	add_callback(#"hash_7d2e38b28c894e5a", func, obj);
}

/*
	Name: function_c1017156
	Namespace: callback
	Checksum: 0x4FBE8A11
	Offset: 0x1890
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_c1017156(func, obj)
{
	remove_callback(#"hash_7d2e38b28c894e5a", func, obj);
}

/*
	Name: on_actor_damage
	Namespace: callback
	Checksum: 0xBAB7392E
	Offset: 0x18D8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_actor_damage(func, obj)
{
	add_callback(#"on_actor_damage", func, obj);
}

/*
	Name: remove_on_actor_damage
	Namespace: callback
	Checksum: 0x86962FE
	Offset: 0x1920
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_actor_damage(func, obj)
{
	remove_callback(#"on_actor_damage", func, obj);
}

/*
	Name: function_9d78f548
	Namespace: callback
	Checksum: 0x54580C28
	Offset: 0x1968
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_9d78f548(func, obj)
{
	add_callback(#"hash_2e68909d4e4ed889", func, obj);
}

/*
	Name: function_f125b93a
	Namespace: callback
	Checksum: 0xB36451F2
	Offset: 0x19B0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_f125b93a(func, obj)
{
	remove_callback(#"hash_2e68909d4e4ed889", func, obj);
}

/*
	Name: on_vehicle_damage
	Namespace: callback
	Checksum: 0xEEA33625
	Offset: 0x19F8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_vehicle_damage(func, obj)
{
	add_callback(#"on_vehicle_damage", func, obj);
}

/*
	Name: remove_on_vehicle_damage
	Namespace: callback
	Checksum: 0x5CDEB6CA
	Offset: 0x1A40
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_vehicle_damage(func, obj)
{
	remove_callback(#"on_vehicle_damage", func, obj);
}

/*
	Name: on_downed
	Namespace: callback
	Checksum: 0x87B72E03
	Offset: 0x1A88
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_downed(func, obj)
{
	add_callback(#"on_player_downed", func, obj);
}

/*
	Name: remove_on_downed
	Namespace: callback
	Checksum: 0x8DCE2BA1
	Offset: 0x1AD0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_downed(func, obj)
{
	remove_callback(#"on_player_downed", func, obj);
}

/*
	Name: on_laststand
	Namespace: callback
	Checksum: 0x76E9904
	Offset: 0x1B18
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
	Checksum: 0xBDE0D673
	Offset: 0x1B60
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_laststand(func, obj)
{
	remove_callback(#"on_player_laststand", func, obj);
}

/*
	Name: function_716834ed
	Namespace: callback
	Checksum: 0x54840CCF
	Offset: 0x1BA8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_716834ed(func, obj)
{
	add_callback(#"entering_last_stand", func, obj);
}

/*
	Name: function_d5b3e529
	Namespace: callback
	Checksum: 0x42A3E9F0
	Offset: 0x1BF0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_d5b3e529(func, obj)
{
	remove_callback(#"entering_last_stand", func, obj);
}

/*
	Name: on_bleedout
	Namespace: callback
	Checksum: 0xB4333095
	Offset: 0x1C38
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_bleedout(func, obj)
{
	add_callback(#"on_player_bleedout", func, obj);
}

/*
	Name: on_revived
	Namespace: callback
	Checksum: 0x337BE9CE
	Offset: 0x1C80
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_revived(func, obj)
{
	add_callback(#"on_player_revived", func, obj);
}

/*
	Name: on_mission_failed
	Namespace: callback
	Checksum: 0x3050AFD8
	Offset: 0x1CC8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_mission_failed(func, obj)
{
	add_callback(#"on_mission_failed", func, obj);
}

/*
	Name: on_challenge_complete
	Namespace: callback
	Checksum: 0xBE6B7E57
	Offset: 0x1D10
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_challenge_complete(func, obj)
{
	add_callback(#"on_challenge_complete", func, obj);
}

/*
	Name: on_weapon_change
	Namespace: callback
	Checksum: 0xADAC3656
	Offset: 0x1D58
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_weapon_change(func, obj)
{
	add_callback(#"weapon_change", func, obj);
}

/*
	Name: remove_on_weapon_change
	Namespace: callback
	Checksum: 0x5FB9490F
	Offset: 0x1DA0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_weapon_change(func, obj)
{
	remove_callback(#"weapon_change", func, obj);
}

/*
	Name: on_weapon_fired
	Namespace: callback
	Checksum: 0xD3D55340
	Offset: 0x1DE8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_weapon_fired(func, obj)
{
	add_callback(#"weapon_fired", func, obj);
}

/*
	Name: remove_on_weapon_fired
	Namespace: callback
	Checksum: 0xF9513EBB
	Offset: 0x1E30
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_weapon_fired(func, obj)
{
	remove_callback(#"weapon_fired", func, obj);
}

/*
	Name: on_grenade_fired
	Namespace: callback
	Checksum: 0x376F4F16
	Offset: 0x1E78
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_grenade_fired(func, obj)
{
	add_callback(#"grenade_fired", func, obj);
}

/*
	Name: remove_on_grenade_fired
	Namespace: callback
	Checksum: 0x8A3BE653
	Offset: 0x1EC0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_grenade_fired(func, obj)
{
	remove_callback(#"grenade_fired", func, obj);
}

/*
	Name: on_offhand_fire
	Namespace: callback
	Checksum: 0xC0090BDB
	Offset: 0x1F08
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_offhand_fire(func, obj)
{
	add_callback(#"offhand_fire", func, obj);
}

/*
	Name: remove_on_offhand_fire
	Namespace: callback
	Checksum: 0xA5D3CB7B
	Offset: 0x1F50
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_offhand_fire(func, obj)
{
	remove_callback(#"offhand_fire", func, obj);
}

/*
	Name: function_4b7977fe
	Namespace: callback
	Checksum: 0x4CB29F44
	Offset: 0x1F98
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_4b7977fe(func, obj)
{
	add_callback(#"hash_198a389d6b65f68d", func, obj);
}

/*
	Name: function_61583a71
	Namespace: callback
	Checksum: 0x13F4E542
	Offset: 0x1FE0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_61583a71(func, obj)
{
	remove_callback(#"hash_198a389d6b65f68d", func, obj);
}

/*
	Name: on_detonate
	Namespace: callback
	Checksum: 0xAA8DB02C
	Offset: 0x2028
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_detonate(func, obj)
{
	function_d8abfc3d(#"detonate", func, obj);
}

/*
	Name: remove_on_detonate
	Namespace: callback
	Checksum: 0xAF40E4F5
	Offset: 0x2070
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_detonate(func, obj)
{
	function_52ac9652(#"detonate", func, obj);
}

/*
	Name: on_double_tap_detonate
	Namespace: callback
	Checksum: 0xEE9425BF
	Offset: 0x20B8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_double_tap_detonate(func, obj)
{
	function_d8abfc3d(#"doubletap_detonate", func, obj);
}

/*
	Name: remove_on_double_tap_detonate
	Namespace: callback
	Checksum: 0x77BDE741
	Offset: 0x2100
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_double_tap_detonate(func, obj)
{
	function_52ac9652(#"doubletap_detonate", func, obj);
}

/*
	Name: on_death
	Namespace: callback
	Checksum: 0xFB622D16
	Offset: 0x2148
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_death(func, obj)
{
	function_d8abfc3d(#"death", func, obj);
}

/*
	Name: remove_on_death
	Namespace: callback
	Checksum: 0xB7B610DE
	Offset: 0x2190
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_death(func, obj)
{
	function_52ac9652(#"death", func, obj);
}

/*
	Name: function_27d9ab8
	Namespace: callback
	Checksum: 0xB2E7BD4D
	Offset: 0x21D8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_27d9ab8(func, obj)
{
	add_callback(#"hash_1e4a4ca774f4ce22", func, obj);
}

/*
	Name: on_trigger
	Namespace: callback
	Checksum: 0x92B6AE87
	Offset: 0x2220
	Size: 0x44
	Parameters: 3
	Flags: Linked, Variadic
*/
function on_trigger(func, obj, ...)
{
	function_d8abfc3d(#"on_trigger", func, obj, vararg);
}

/*
	Name: remove_on_trigger
	Namespace: callback
	Checksum: 0x4179BAC9
	Offset: 0x2270
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_trigger(func, obj)
{
	function_52ac9652(#"on_trigger", func, obj);
}

/*
	Name: on_trigger_once
	Namespace: callback
	Checksum: 0xAA299405
	Offset: 0x22B8
	Size: 0x44
	Parameters: 3
	Flags: Linked, Variadic
*/
function on_trigger_once(func, obj, ...)
{
	function_d8abfc3d(#"on_trigger_once", func, obj, vararg);
}

/*
	Name: remove_on_trigger_once
	Namespace: callback
	Checksum: 0x5D58B728
	Offset: 0x2308
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_trigger_once(func, obj)
{
	function_52ac9652(#"on_trigger_once", func, obj);
}

/*
	Name: function_33f0ddd3
	Namespace: callback
	Checksum: 0x8BBC5960
	Offset: 0x2350
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_33f0ddd3(func, obj)
{
	add_callback(#"hash_39bf72fd97e248a0", func, obj);
}

/*
	Name: function_824d206
	Namespace: callback
	Checksum: 0x6A36FA4D
	Offset: 0x2398
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_824d206(func, obj)
{
	remove_callback(#"hash_39bf72fd97e248a0", func, obj);
}

/*
	Name: on_boast
	Namespace: callback
	Checksum: 0x29ACD30A
	Offset: 0x23E0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_boast(func, obj)
{
	add_callback(#"on_boast", func, obj);
}

/*
	Name: remove_on_boast
	Namespace: callback
	Checksum: 0x92DBBE4D
	Offset: 0x2428
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_boast(func, obj)
{
	remove_callback(#"on_boast", func, obj);
}

/*
	Name: function_5753ac6e
	Namespace: callback
	Checksum: 0x1B3DAD15
	Offset: 0x2470
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_5753ac6e(func, obj)
{
	add_callback(#"hash_4a9c56bba76da754", func, obj);
}

/*
	Name: function_16046baa
	Namespace: callback
	Checksum: 0x2520E5C9
	Offset: 0x24B8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_16046baa(func, obj)
{
	remove_callback(#"hash_4a9c56bba76da754", func, obj);
}

/*
	Name: function_94eab4fb
	Namespace: callback
	Checksum: 0x385CD8FC
	Offset: 0x2500
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_94eab4fb(func, obj)
{
	add_callback(#"hash_435b494b9418c561", func, obj);
}

/*
	Name: on_menu_response
	Namespace: callback
	Checksum: 0x132B50FB
	Offset: 0x2548
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_menu_response(func, obj)
{
	add_callback(#"menu_response", func, obj);
}

/*
	Name: function_96bbd5dc
	Namespace: callback
	Checksum: 0x80F19EA9
	Offset: 0x2590
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_96bbd5dc(func, obj)
{
	remove_callback(#"menu_response", func, obj);
}

/*
	Name: on_item_pickup
	Namespace: callback
	Checksum: 0xD4B28245
	Offset: 0x25D8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_item_pickup(func, obj)
{
	add_callback(#"on_item_pickup", func, obj);
}

/*
	Name: on_item_drop
	Namespace: callback
	Checksum: 0x89709D86
	Offset: 0x2620
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_item_drop(func, obj)
{
	add_callback(#"on_drop_item", func, obj);
}

/*
	Name: on_drop_inventory
	Namespace: callback
	Checksum: 0x2583F5E0
	Offset: 0x2668
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_drop_inventory(func, obj)
{
	add_callback(#"on_drop_inventory", func, obj);
}

/*
	Name: on_item_use
	Namespace: callback
	Checksum: 0x5D89A0E8
	Offset: 0x26B0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_item_use(func, obj)
{
	add_callback(#"on_item_use", func, obj);
}

/*
	Name: on_stash_open
	Namespace: callback
	Checksum: 0xCBC9A822
	Offset: 0x26F8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_stash_open(func, obj)
{
	add_callback(#"on_stash_open", func, obj);
}

/*
	Name: on_character_unlock
	Namespace: callback
	Checksum: 0x4255A500
	Offset: 0x2740
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_character_unlock(func, obj)
{
	add_callback(#"on_character_unlock", func, obj);
}

/*
	Name: on_contract_complete
	Namespace: callback
	Checksum: 0x2D7E01BE
	Offset: 0x2788
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_contract_complete(func, obj)
{
	add_callback(#"contract_complete", func, obj);
}

/*
	Name: function_6700e8b5
	Namespace: callback
	Checksum: 0x69049A3D
	Offset: 0x27D0
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_6700e8b5(func, obj)
{
	if(self == level)
	{
		add_callback(#"hash_4428d68b23082312", func, obj);
	}
	else
	{
		function_d8abfc3d(#"hash_4428d68b23082312", func, obj);
	}
}

/*
	Name: function_900862de
	Namespace: callback
	Checksum: 0x21DDD5C9
	Offset: 0x2848
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_900862de(func, obj)
{
	if(self == level)
	{
		add_callback(#"hash_4b4c187e584b34ac", func, obj);
	}
	else
	{
		function_d8abfc3d(#"hash_4b4c187e584b34ac", func, obj);
	}
}

/*
	Name: function_be4cb7fe
	Namespace: callback
	Checksum: 0x1D6BDA9A
	Offset: 0x28C0
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_be4cb7fe(func, obj)
{
	if(self == level)
	{
		add_callback(#"hash_255b4626805810f5", func, obj);
	}
	else
	{
		function_d8abfc3d(#"hash_255b4626805810f5", func, obj);
	}
}

/*
	Name: function_532a4f74
	Namespace: callback
	Checksum: 0xC02A97F7
	Offset: 0x2938
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_532a4f74(func, obj)
{
	add_callback(#"hash_78ee75fdad31407d", func, obj);
}

/*
	Name: function_c16ce2bc
	Namespace: callback
	Checksum: 0x777BCE91
	Offset: 0x2980
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_c16ce2bc(func, obj)
{
	add_callback(#"hash_52c6deac4a362083", func, obj);
}

/*
	Name: function_e5340d32
	Namespace: callback
	Checksum: 0xC00F5D2E
	Offset: 0x29C8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_e5340d32(func, obj)
{
	add_callback(#"hash_3b6ebf3a7ab5c795", func, obj);
}

/*
	Name: function_d4f0a93d
	Namespace: callback
	Checksum: 0xCF30B257
	Offset: 0x2A10
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_d4f0a93d(func, obj)
{
	remove_callback(#"hash_3b6ebf3a7ab5c795", func, obj);
}

/*
	Name: function_dd017b2e
	Namespace: callback
	Checksum: 0xB737DF5A
	Offset: 0x2A58
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_dd017b2e(func, obj)
{
	add_callback(#"player_callout", func, obj);
}

/*
	Name: codecallback_preinitialization
	Namespace: callback
	Checksum: 0x34F718DF
	Offset: 0x2AA0
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event codecallback_preinitialization(eventstruct)
{
	system::run_pre_systems();
	flag::set(#"hash_2e89d1cf2db1b05c");
}

/*
	Name: function_4123368a
	Namespace: callback
	Checksum: 0xDBF322A9
	Offset: 0x2AE8
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_4123368a(eventstruct)
{
	flag::set(#"levelinit");
}

/*
	Name: function_12c01a61
	Namespace: callback
	Checksum: 0x41BC10E8
	Offset: 0x2B20
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event function_12c01a61(eventstruct)
{
	system::run_post_systems();
	flag::set(#"hash_7f97be5e7f7a16d1");
}

/*
	Name: codecallback_finalizeinitialization
	Namespace: callback
	Checksum: 0xE5CA768F
	Offset: 0x2B68
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event codecallback_finalizeinitialization(eventstruct)
{
	system::function_b1553822();
	flag::set(#"hash_4f4b65226250fc99");
	callback(#"on_finalize_initialization");
}

/*
	Name: add_weapon_damage
	Namespace: callback
	Checksum: 0xB6D2C2D3
	Offset: 0x2BD0
	Size: 0x40
	Parameters: 2
	Flags: None
*/
function add_weapon_damage(weapontype, callback)
{
	if(!isdefined(level.weapon_damage_callback_array))
	{
		level.weapon_damage_callback_array = [];
	}
	level.weapon_damage_callback_array[weapontype] = callback;
}

/*
	Name: callback_weapon_damage
	Namespace: callback
	Checksum: 0xF61D04E5
	Offset: 0x2C18
	Size: 0xCA
	Parameters: 5
	Flags: None
*/
function callback_weapon_damage(eattacker, einflictor, weapon, meansofdeath, damage)
{
	if(isdefined(level.weapon_damage_callback_array))
	{
		if(isdefined(level.weapon_damage_callback_array[weapon]))
		{
			self thread [[level.weapon_damage_callback_array[weapon]]](eattacker, einflictor, weapon, meansofdeath, damage);
			return true;
		}
		if(isdefined(level.weapon_damage_callback_array[weapon.rootweapon]))
		{
			self thread [[level.weapon_damage_callback_array[weapon.rootweapon]]](eattacker, einflictor, weapon, meansofdeath, damage);
			return true;
		}
	}
	return false;
}

/*
	Name: add_weapon_fired
	Namespace: callback
	Checksum: 0x681D2E1F
	Offset: 0x2CF0
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function add_weapon_fired(weapon, callback)
{
	if(!isdefined(level.var_129c2069))
	{
		level.var_129c2069 = [];
	}
	level.var_129c2069[weapon] = callback;
}

/*
	Name: callback_weapon_fired
	Namespace: callback
	Checksum: 0x3EA00AB8
	Offset: 0x2D38
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function callback_weapon_fired(weapon)
{
	if(isdefined(weapon) && isdefined(level.var_129c2069))
	{
		if(isdefined(level.var_129c2069[weapon]))
		{
			self thread [[level.var_129c2069[weapon]]](weapon);
			return true;
		}
		if(isdefined(level.var_129c2069[weapon.rootweapon]))
		{
			self thread [[level.var_129c2069[weapon.rootweapon]]](weapon);
			return true;
		}
	}
	return false;
}

/*
	Name: codecallback_startgametype
	Namespace: callback
	Checksum: 0x5C6C9F1B
	Offset: 0x2DE8
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event codecallback_startgametype(eventstruct)
{
	if(!isdefined(level.gametypestarted) || !level.gametypestarted)
	{
		if(isdefined(level.callbackstartgametype))
		{
			[[level.callbackstartgametype]]();
		}
		level.gametypestarted = 1;
	}
}

/*
	Name: codecallback_playerconnect
	Namespace: callback
	Checksum: 0x2B8FE22E
	Offset: 0x2E50
	Size: 0x30
	Parameters: 1
	Flags: Event
*/
event codecallback_playerconnect(eventstruct)
{
	self endon(#"disconnect");
	[[level.callbackplayerconnect]]();
}

/*
	Name: codecallback_playerdisconnect
	Namespace: callback
	Checksum: 0x41425C94
	Offset: 0x2E88
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event codecallback_playerdisconnect(eventstruct)
{
	self.player_disconnected = 1;
	self notify(#"disconnect");
	level notify(#"disconnect", self);
	self notify(#"death");
	[[level.callbackplayerdisconnect]]();
	callback(#"on_player_disconnect");
}

/*
	Name: codecallback_migration_setupgametype
	Namespace: callback
	Checksum: 0xDE26EEF0
	Offset: 0x2F28
	Size: 0x34
	Parameters: 0
	Flags: Event
*/
event codecallback_migration_setupgametype()
{
	/#
		println("");
	#/
	simple_hostmigration::migration_setupgametype();
}

/*
	Name: codecallback_hostmigration
	Namespace: callback
	Checksum: 0xB535A76F
	Offset: 0x2F68
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event codecallback_hostmigration(eventstruct)
{
	/#
		println("");
	#/
	[[level.callbackhostmigration]]();
}

/*
	Name: codecallback_hostmigrationsave
	Namespace: callback
	Checksum: 0x63AB6DD2
	Offset: 0x2FB0
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event codecallback_hostmigrationsave(eventstruct)
{
	/#
		println("");
	#/
	[[level.callbackhostmigrationsave]]();
}

/*
	Name: codecallback_prehostmigrationsave
	Namespace: callback
	Checksum: 0xC4ABF76C
	Offset: 0x2FF8
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event codecallback_prehostmigrationsave(eventstruct)
{
	/#
		println("");
	#/
	[[level.callbackprehostmigrationsave]]();
}

/*
	Name: codecallback_playermigrated
	Namespace: callback
	Checksum: 0x529309A
	Offset: 0x3040
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event codecallback_playermigrated(eventstruct)
{
	/#
		println("");
	#/
	[[level.callbackplayermigrated]]();
}

/*
	Name: codecallback_playerdamage
	Namespace: callback
	Checksum: 0xE51B33DF
	Offset: 0x3088
	Size: 0xA0
	Parameters: 1
	Flags: Event
*/
event codecallback_playerdamage(eventstruct)
{
	self endon(#"disconnect");
	[[level.callbackplayerdamage]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.flags, eventstruct.mod, eventstruct.weapon, eventstruct.var_fd90b0bb, eventstruct.position, eventstruct.direction, eventstruct.hit_location, eventstruct.damage_origin, eventstruct.time_offset, eventstruct.bone_index, eventstruct.normal);
}

/*
	Name: codecallback_playerkilled
	Namespace: callback
	Checksum: 0x48FE3C75
	Offset: 0x3130
	Size: 0x80
	Parameters: 1
	Flags: Event
*/
event codecallback_playerkilled(eventstruct)
{
	self endon(#"disconnect");
	[[level.callbackplayerkilled]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.mod, eventstruct.weapon, eventstruct.var_fd90b0bb, eventstruct.direction, eventstruct.hit_location, eventstruct.time_offset, eventstruct.death_anim_duration);
}

/*
	Name: function_73e8e3f9
	Namespace: callback
	Checksum: 0x99A825C8
	Offset: 0x31B8
	Size: 0x68
	Parameters: 1
	Flags: Event
*/
event function_73e8e3f9(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_3a9881cb))
	{
		[[level.var_3a9881cb]](eventstruct.attacker, eventstruct.effect_name, eventstruct.var_894859a2, eventstruct.var_ab5b905e, eventstruct.weapon);
	}
}

/*
	Name: function_323548ba
	Namespace: callback
	Checksum: 0x2F7E3F5C
	Offset: 0x3228
	Size: 0x38
	Parameters: 1
	Flags: Event
*/
event function_323548ba(eventstruct)
{
	self endon(#"disconnect");
	[[level.callbackplayershielddamageblocked]](eventstruct.damage);
}

/*
	Name: codecallback_playerlaststand
	Namespace: callback
	Checksum: 0x4AB5526F
	Offset: 0x3268
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event codecallback_playerlaststand(eventstruct)
{
	self endon(#"disconnect");
	self stopanimscripted();
	[[level.callbackplayerlaststand]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.mod, eventstruct.weapon, eventstruct.var_fd90b0bb, eventstruct.direction, eventstruct.hit_location, eventstruct.time_offset, eventstruct.delay);
}

/*
	Name: function_46c0443b
	Namespace: callback
	Checksum: 0x82E2959E
	Offset: 0x3308
	Size: 0x38
	Parameters: 1
	Flags: Event
*/
event function_46c0443b(eventstruct)
{
	self endon(#"disconnect");
	[[level.var_69959686]](eventstruct.weapon);
}

/*
	Name: function_9e4c68e2
	Namespace: callback
	Checksum: 0x613EDA6E
	Offset: 0x3348
	Size: 0x48
	Parameters: 1
	Flags: Event
*/
event function_9e4c68e2(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_bb1ea3f1))
	{
		[[level.var_bb1ea3f1]](eventstruct.weapon);
	}
}

/*
	Name: function_2f677e9d
	Namespace: callback
	Checksum: 0x5586AFE2
	Offset: 0x3398
	Size: 0x48
	Parameters: 1
	Flags: Event
*/
event function_2f677e9d(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_2f64d35))
	{
		[[level.var_2f64d35]](eventstruct.weapon);
	}
}

/*
	Name: function_cf68d893
	Namespace: callback
	Checksum: 0x196A5363
	Offset: 0x33E8
	Size: 0x48
	Parameters: 1
	Flags: Event
*/
event function_cf68d893(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_523faa05))
	{
		[[level.var_523faa05]](eventstruct.weapon);
	}
}

/*
	Name: function_d7eb3672
	Namespace: callback
	Checksum: 0x5607F295
	Offset: 0x3438
	Size: 0x48
	Parameters: 1
	Flags: Event
*/
event function_d7eb3672(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_a28be0a5))
	{
		[[level.var_a28be0a5]](eventstruct.weapon);
	}
}

/*
	Name: function_7dba9a1
	Namespace: callback
	Checksum: 0x24855C3C
	Offset: 0x3488
	Size: 0x48
	Parameters: 1
	Flags: Event
*/
event function_7dba9a1(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_bd0b5fc1))
	{
		[[level.var_bd0b5fc1]](eventstruct.weapon);
	}
}

/*
	Name: function_3b159f77
	Namespace: callback
	Checksum: 0x942F5C7D
	Offset: 0x34D8
	Size: 0x74
	Parameters: 1
	Flags: Event
*/
event function_3b159f77(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_4268159))
	{
		[[level.var_4268159]](eventstruct.gestureindex, eventstruct.animlength);
	}
	callback(#"on_boast", eventstruct);
}

/*
	Name: function_e35aeddd
	Namespace: callback
	Checksum: 0x1C152561
	Offset: 0x3558
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_e35aeddd(eventstruct)
{
	self endon(#"disconnect");
	callback(#"hash_4a9c56bba76da754");
}

/*
	Name: function_336afb8e
	Namespace: callback
	Checksum: 0xA2D4C413
	Offset: 0x35A8
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_336afb8e(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_7bd720f6))
	{
		[[level.var_7bd720f6]](eventstruct);
	}
}

/*
	Name: function_6806b4f
	Namespace: callback
	Checksum: 0xCA9A7754
	Offset: 0x35F8
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_6806b4f(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_42b43ce2))
	{
		[[level.var_42b43ce2]](eventstruct);
	}
}

/*
	Name: function_1855d09f
	Namespace: callback
	Checksum: 0xF211AC6C
	Offset: 0x3648
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_1855d09f(eventstruct)
{
	self endon(#"disconnect");
	callback(#"hash_78ee75fdad31407d");
}

/*
	Name: function_e51b8b9d
	Namespace: callback
	Checksum: 0x78A2709C
	Offset: 0x3698
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_e51b8b9d(eventstruct)
{
	self endon(#"disconnect");
	callback(#"hash_52c6deac4a362083");
}

/*
	Name: function_2e3100e0
	Namespace: callback
	Checksum: 0xFC6FE188
	Offset: 0x36E8
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_2e3100e0(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_e74639aa))
	{
		[[level.var_e74639aa]](eventstruct);
	}
}

/*
	Name: function_e1b7e658
	Namespace: callback
	Checksum: 0x11DE7646
	Offset: 0x3738
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_e1b7e658(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_7f80c5a6))
	{
		[[level.var_7f80c5a6]](eventstruct);
	}
}

/*
	Name: codecallback_playerjump
	Namespace: callback
	Checksum: 0xA3FC75A6
	Offset: 0x3788
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event codecallback_playerjump(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_6c3038dc))
	{
		[[level.var_6c3038dc]](eventstruct);
	}
}

/*
	Name: function_40b29944
	Namespace: callback
	Checksum: 0x6476F8E0
	Offset: 0x37D8
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_40b29944(eventstruct)
{
	self endon(#"disconnect");
	if(isdefined(level.var_4c9e52d1))
	{
		[[level.var_4c9e52d1]](eventstruct);
	}
}

/*
	Name: codecallback_playermelee
	Namespace: callback
	Checksum: 0x571EDDE9
	Offset: 0x3828
	Size: 0x70
	Parameters: 1
	Flags: Event
*/
event codecallback_playermelee(eventstruct)
{
	self endon(#"disconnect");
	[[level.callbackplayermelee]](eventstruct.attacker, eventstruct.amount, eventstruct.weapon, eventstruct.position, eventstruct.direction, eventstruct.bone_index, eventstruct.is_shieldhit, eventstruct.is_frombehind);
}

/*
	Name: codecallback_actorspawned
	Namespace: callback
	Checksum: 0x5F735075
	Offset: 0x38A0
	Size: 0x28
	Parameters: 1
	Flags: Event
*/
event codecallback_actorspawned(eventstruct)
{
	self [[level.callbackactorspawned]](eventstruct.entity);
}

/*
	Name: function_2f02dc73
	Namespace: callback
	Checksum: 0x80D57B18
	Offset: 0x38D0
	Size: 0x38
	Parameters: 1
	Flags: Event
*/
event function_2f02dc73(eventstruct)
{
	if(isdefined(level.var_a79419ed))
	{
		self [[level.var_a79419ed]](eventstruct.entity);
	}
}

/*
	Name: function_40ef094
	Namespace: callback
	Checksum: 0xA4FE14F
	Offset: 0x3910
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_40ef094(eventstruct)
{
	self callback(#"hash_7d2e38b28c894e5a");
}

/*
	Name: codecallback_actordamage
	Namespace: callback
	Checksum: 0x580C1766
	Offset: 0x3948
	Size: 0x9C
	Parameters: 1
	Flags: Event
*/
event codecallback_actordamage(eventstruct)
{
	[[level.callbackactordamage]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.flags, eventstruct.mod, eventstruct.weapon, eventstruct.var_fd90b0bb, eventstruct.position, eventstruct.direction, eventstruct.hit_location, eventstruct.damage_origin, eventstruct.time_offset, eventstruct.bone_index, eventstruct.model_index, eventstruct.surface_type, eventstruct.normal);
}

/*
	Name: codecallback_actorkilled
	Namespace: callback
	Checksum: 0x27D1B010
	Offset: 0x39F0
	Size: 0x64
	Parameters: 1
	Flags: Event
*/
event codecallback_actorkilled(eventstruct)
{
	[[level.callbackactorkilled]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.mod, eventstruct.weapon, eventstruct.var_fd90b0bb, eventstruct.direction, eventstruct.hit_location, eventstruct.time_offset);
}

/*
	Name: codecallback_actorcloned
	Namespace: callback
	Checksum: 0xBCAB9BA
	Offset: 0x3A60
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event codecallback_actorcloned(eventstruct)
{
	[[level.callbackactorcloned]](eventstruct.clone);
}

/*
	Name: function_df3c93ef
	Namespace: callback
	Checksum: 0x13AF260C
	Offset: 0x3A90
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_df3c93ef(eventstruct)
{
	self callback(#"hash_3d6ccbbe0e628b2d", eventstruct);
}

/*
	Name: function_5b0a9275
	Namespace: callback
	Checksum: 0x1C801507
	Offset: 0x3AC8
	Size: 0xA4
	Parameters: 1
	Flags: Event
*/
event function_5b0a9275(eventstruct)
{
	[[level.var_6788bf11]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.flags, eventstruct.mod, eventstruct.weapon, eventstruct.var_fd90b0bb, eventstruct.position, eventstruct.direction, eventstruct.hit_location, eventstruct.damage_origin, eventstruct.time_offset, eventstruct.bone_index, eventstruct.model_index, eventstruct.part_name, eventstruct.surface_type, eventstruct.normal);
}

/*
	Name: codecallback_vehiclespawned
	Namespace: callback
	Checksum: 0xE4350A15
	Offset: 0x3B78
	Size: 0x34
	Parameters: 1
	Flags: Event
*/
event codecallback_vehiclespawned(eventstruct)
{
	if(isdefined(level.callbackvehiclespawned))
	{
		[[level.callbackvehiclespawned]](eventstruct.spawner);
	}
}

/*
	Name: codecallback_vehiclekilled
	Namespace: callback
	Checksum: 0x97DC34D
	Offset: 0x3BB8
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event codecallback_vehiclekilled(eventstruct)
{
	[[level.callbackvehiclekilled]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.mod, eventstruct.weapon, eventstruct.direction, eventstruct.hit_location, eventstruct.time_offset);
}

/*
	Name: codecallback_vehicledamage
	Namespace: callback
	Checksum: 0xA9E41760
	Offset: 0x3C20
	Size: 0x9C
	Parameters: 1
	Flags: Event
*/
event codecallback_vehicledamage(eventstruct)
{
	[[level.callbackvehicledamage]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.flags, eventstruct.mod, eventstruct.weapon, eventstruct.var_fd90b0bb, eventstruct.position, eventstruct.direction, eventstruct.hit_location, eventstruct.damage_origin, eventstruct.time_offset, eventstruct.damage_from_underneath, eventstruct.model_index, eventstruct.part_name, eventstruct.normal);
}

/*
	Name: codecallback_vehicleradiusdamage
	Namespace: callback
	Checksum: 0xD9CA3091
	Offset: 0x3CC8
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event codecallback_vehicleradiusdamage(eventstruct)
{
	if(isdefined(level.callbackvehicleradiusdamage))
	{
		[[level.callbackvehicleradiusdamage]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.inner_damage, eventstruct.outer_damage, eventstruct.flags, eventstruct.mod, eventstruct.weapon, eventstruct.position, eventstruct.outer_radius, eventstruct.cone_angle, eventstruct.cone_direction, eventstruct.time_offset);
	}
}

/*
	Name: function_87cf247e
	Namespace: callback
	Checksum: 0x442FA6A5
	Offset: 0x3D68
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_87cf247e(eventstruct)
{
	self callback(#"hash_435b494b9418c561", eventstruct);
}

/*
	Name: finishcustomtraversallistener
	Namespace: callback
	Checksum: 0x6391A2C3
	Offset: 0x3DA0
	Size: 0xAE
	Parameters: 0
	Flags: Linked
*/
function finishcustomtraversallistener()
{
	self endon(#"death");
	self waittillmatch({#notetrack:"end"}, #"custom_traversal_anim_finished");
	self finishtraversal();
	self unlink();
	self.usegoalanimweight = 0;
	self.blockingpain = 0;
	self.customtraverseendnode = undefined;
	self.customtraversestartnode = undefined;
	self notify(#"custom_traversal_cleanup");
}

/*
	Name: killedcustomtraversallistener
	Namespace: callback
	Checksum: 0x1F1F353D
	Offset: 0x3E58
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function killedcustomtraversallistener()
{
	self endon(#"custom_traversal_cleanup");
	self waittill(#"death");
	if(isdefined(self))
	{
		self finishtraversal();
		self stopanimscripted();
		self unlink();
	}
}

/*
	Name: codecallback_playcustomtraversal
	Namespace: callback
	Checksum: 0x3172B497
	Offset: 0x3ED8
	Size: 0x184
	Parameters: 1
	Flags: Event
*/
event codecallback_playcustomtraversal(eventstruct)
{
	entity = eventstruct.entity;
	endparent = eventstruct.end_entity;
	entity.blockingpain = 1;
	entity.usegoalanimweight = 1;
	entity.customtraverseendnode = entity.traverseendnode;
	entity.customtraversestartnode = entity.traversestartnode;
	entity animmode("noclip", 0);
	entity orientmode("face angle", eventstruct.direction[1]);
	if(isdefined(endparent))
	{
		offset = entity.origin - endparent.origin;
		entity linkto(endparent, "", offset);
	}
	entity animscripted("custom_traversal_anim_finished", eventstruct.location, eventstruct.direction, eventstruct.animation, eventstruct.anim_mode, undefined, eventstruct.playback_speed, eventstruct.goal_time, eventstruct.lerp_time);
	entity thread finishcustomtraversallistener();
	entity thread killedcustomtraversallistener();
}

/*
	Name: codecallback_faceeventnotify
	Namespace: callback
	Checksum: 0x6EA9F137
	Offset: 0x4068
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function codecallback_faceeventnotify(notify_msg, ent)
{
	if(isdefined(ent) && isdefined(ent.do_face_anims) && ent.do_face_anims)
	{
		if(isdefined(level.face_event_handler) && isdefined(level.face_event_handler.events[notify_msg]))
		{
			ent sendfaceevent(level.face_event_handler.events[notify_msg]);
		}
	}
}

/*
	Name: codecallback_menuresponse
	Namespace: callback
	Checksum: 0x2375441
	Offset: 0x4110
	Size: 0xA0
	Parameters: 1
	Flags: Event
*/
event codecallback_menuresponse(eventstruct)
{
	if(!isdefined(level.menuresponsequeue))
	{
		level.menuresponsequeue = [];
		level thread menu_response_queue_pump();
	}
	index = level.menuresponsequeue.size;
	level.menuresponsequeue[index] = {#eventstruct:eventstruct, #ent:self};
	level notify(#"menuresponse_queue");
}

/*
	Name: menu_response_queue_pump
	Namespace: callback
	Checksum: 0x48B95AC8
	Offset: 0x41B8
	Size: 0xF8
	Parameters: 0
	Flags: Linked
*/
function menu_response_queue_pump()
{
	while(true)
	{
		level waittill(#"menuresponse_queue");
		do
		{
			if(isdefined(level.menuresponsequeue[0].ent))
			{
				level.menuresponsequeue[0].ent notify(#"menuresponse", level.menuresponsequeue[0].eventstruct);
				level.menuresponsequeue[0].ent callback(#"menu_response", level.menuresponsequeue[0].eventstruct);
			}
			arrayremoveindex(level.menuresponsequeue, 0, 0);
			waitframe(1);
		}
		while(level.menuresponsequeue.size > 0);
	}
}

/*
	Name: codecallback_callserverscript
	Namespace: callback
	Checksum: 0xE21492F4
	Offset: 0x42B8
	Size: 0xC2
	Parameters: 1
	Flags: Event
*/
event codecallback_callserverscript(eventstruct)
{
	if(!isdefined(level._animnotifyfuncs))
	{
		return;
	}
	if(isdefined(level._animnotifyfuncs[eventstruct.label]))
	{
		if(isdefined(eventstruct.param3) && eventstruct.param3 != "")
		{
			eventstruct.entity [[level._animnotifyfuncs[eventstruct.label]]](eventstruct.param, eventstruct.param3);
		}
		else
		{
			eventstruct.entity [[level._animnotifyfuncs[eventstruct.label]]](eventstruct.param);
		}
	}
}

/*
	Name: codecallback_callserverscriptonlevel
	Namespace: callback
	Checksum: 0x5899E48E
	Offset: 0x4388
	Size: 0xBA
	Parameters: 1
	Flags: Event
*/
event codecallback_callserverscriptonlevel(eventstruct)
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
	Checksum: 0x2144C19
	Offset: 0x4450
	Size: 0x104
	Parameters: 1
	Flags: Event
*/
event function_2073f6dc(eventstruct)
{
	origin = self.origin;
	magnitude = float(eventstruct.magnitude);
	innerradius = float(eventstruct.innerradius);
	outerradius = int(eventstruct.outerradius);
	innerdamage = (isdefined(self.var_f501d778) ? self.var_f501d778 : 50);
	outerdamage = (isdefined(self.var_e14c1b5c) ? self.var_e14c1b5c : 25);
	physicsexplosionsphere(origin, outerradius, innerradius, magnitude, outerdamage, innerdamage);
}

/*
	Name: function_52d32e5b
	Namespace: callback
	Checksum: 0x39FB8186
	Offset: 0x4560
	Size: 0x264
	Parameters: 1
	Flags: Event
*/
event function_52d32e5b(eventstruct)
{
	actor = self;
	player = arraygetclosest(actor.origin, function_a1ef346b());
	if(!isactor(actor))
	{
		return;
	}
	if(is_true(eventstruct.enable) && isdefined(player))
	{
		switch(eventstruct.type)
		{
			case "hash_d85822f3fe3ff26":
			{
				actor lookatentity(player, 0, 0, 0, eventstruct.blend, eventstruct.weight);
				break;
			}
			case "hash_23fc6c9a6565775f":
			{
				actor lookatentity(player, 0, 0, 1, eventstruct.blend, eventstruct.weight);
				break;
			}
			case "head":
			{
				actor lookatentity(player, 1, 0, 1, eventstruct.blend, eventstruct.weight);
				break;
			}
			case "eyes":
			{
				actor lookatentity(player, 1, 1, 0, eventstruct.blend, eventstruct.weight);
				break;
			}
			case "aim":
			{
				actor aimatentityik(player, eventstruct.blend, eventstruct.weight);
				break;
			}
			case "hash_3da13f2589a059c6":
			default:
			{
				actor lookatentity(player, 1, 0, 0, eventstruct.blend, eventstruct.weight);
				break;
			}
		}
	}
	else
	{
		actor lookatentity();
	}
}

/*
	Name: function_81d4b0fe
	Namespace: callback
	Checksum: 0xE33D249E
	Offset: 0x47D0
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event function_81d4b0fe(eventstruct)
{
	player = self;
	if(!isplayer(player))
	{
		player = getplayers()[0];
	}
	if(isdefined(player))
	{
		player setviewclamp(eventstruct.minyaw, eventstruct.maxyaw, eventstruct.minpitch, eventstruct.maxpitch, 0, 0, eventstruct.blend);
	}
}

/*
	Name: codecallback_launchsidemission
	Namespace: callback
	Checksum: 0xFC504CFA
	Offset: 0x4870
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event codecallback_launchsidemission(eventstruct)
{
	switchmap_preload(eventstruct.name, eventstruct.game_type);
	luinotifyevent(#"open_side_mission_countdown", 1, eventstruct.list_index);
	wait(10);
	luinotifyevent(#"close_side_mission_countdown");
	switchmap_switch();
}

/*
	Name: codecallback_fadeblackscreen
	Namespace: callback
	Checksum: 0x13442541
	Offset: 0x4910
	Size: 0x74
	Parameters: 1
	Flags: Event
*/
event codecallback_fadeblackscreen(eventstruct)
{
	if(isplayer(self) && !isbot(self))
	{
		self thread hud::fade_to_black_for_x_sec(0, eventstruct.duration, eventstruct.blend, eventstruct.blend);
	}
}

/*
	Name: function_4b5ab05f
	Namespace: callback
	Checksum: 0xEF8EAFC8
	Offset: 0x4990
	Size: 0x74
	Parameters: 1
	Flags: Event
*/
event function_4b5ab05f(eventstruct)
{
	if(isplayer(self) && !isbot(self))
	{
		self thread hud::fade_to_black_for_x_sec(0, eventstruct.duration, eventstruct.blend_out, eventstruct.blend_in);
	}
}

/*
	Name: abort_level
	Namespace: callback
	Checksum: 0xC30C32B1
	Offset: 0x4A10
	Size: 0x224
	Parameters: 0
	Flags: Linked
*/
function abort_level()
{
	/#
		println("");
		println("");
		println("");
	#/
	level.callbackstartgametype = &callback_void;
	level.callbackplayerconnect = &callback_void;
	level.callbackplayerdisconnect = &callback_void;
	level.callbackplayerdamage = &callback_void;
	level.callbackplayerkilled = &callback_void;
	level.var_3a9881cb = &callback_void;
	level.callbackplayerlaststand = &callback_void;
	level.var_4268159 = &callback_void;
	level.var_69959686 = &callback_void;
	level.callbackplayermelee = &callback_void;
	level.callbackactordamage = &callback_void;
	level.callbackactorkilled = &callback_void;
	level.var_6788bf11 = &callback_void;
	level.callbackvehicledamage = &callback_void;
	level.callbackvehiclekilled = &callback_void;
	level.callbackactorspawned = &callback_void;
	if(isdefined(level._gametype_default))
	{
		setdvar(#"g_gametype", level._gametype_default);
	}
	exitlevel(0);
}

/*
	Name: codecallback_glasssmash
	Namespace: callback
	Checksum: 0x1BCB2303
	Offset: 0x4C40
	Size: 0x58
	Parameters: 1
	Flags: Event
*/
event codecallback_glasssmash(eventstruct)
{
	level notify(#"glass_smash", {#direction:eventstruct.direction, #position:eventstruct.position});
}

/*
	Name: function_5019e563
	Namespace: callback
	Checksum: 0xA172CEBF
	Offset: 0x4CA0
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_5019e563(eventstruct)
{
	self callback(#"freefall", eventstruct);
}

/*
	Name: function_87b05fa3
	Namespace: callback
	Checksum: 0xDBCD1EAB
	Offset: 0x4CD8
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_87b05fa3(eventstruct)
{
	self callback(#"parachute", eventstruct);
}

/*
	Name: function_5bc68fd9
	Namespace: callback
	Checksum: 0xE715895C
	Offset: 0x4D10
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_5bc68fd9(eventstruct)
{
	self callback(#"hash_5d462019157fdedc", eventstruct);
}

/*
	Name: function_250a9740
	Namespace: callback
	Checksum: 0xFC7CFBA4
	Offset: 0x4D48
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_250a9740(eventstruct)
{
	self callback(#"hash_171443902e2a22ee", eventstruct);
}

/*
	Name: function_e337eb32
	Namespace: callback
	Checksum: 0xE8DB986F
	Offset: 0x4D80
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_e337eb32(eventstruct)
{
	self callback(#"swimming", {#swimming:1});
}

/*
	Name: function_e142d2b2
	Namespace: callback
	Checksum: 0x55004C0F
	Offset: 0x4DD0
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_e142d2b2(eventstruct)
{
	self callback(#"swimming", {#swimming:0});
}

/*
	Name: codecallback_underwater
	Namespace: callback
	Checksum: 0x9868A5C8
	Offset: 0x4E20
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event codecallback_underwater(eventstruct)
{
	self callback(#"underwater", eventstruct);
}

/*
	Name: function_8877d89
	Namespace: callback
	Checksum: 0x6D017743
	Offset: 0x4E58
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_8877d89(eventstruct)
{
	self callback(#"hash_42aa89b2a0951308", eventstruct);
}

/*
	Name: function_c91ebb30
	Namespace: callback
	Checksum: 0x98821DCB
	Offset: 0x4E90
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_c91ebb30(eventstruct)
{
	self callback(#"player_callout", eventstruct);
}

/*
	Name: function_930ce3c3
	Namespace: callback
	Checksum: 0xF0A9AD0D
	Offset: 0x4EC8
	Size: 0x34
	Parameters: 1
	Flags: Event
*/
event function_930ce3c3(eventstruct)
{
	/#
		self callback(#"debug_movement", eventstruct);
	#/
}

/*
	Name: function_d736b8a9
	Namespace: callback
	Checksum: 0xB378C057
	Offset: 0x4F08
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_d736b8a9(eventstruct)
{
	self callback(#"hash_3b6ebf3a7ab5c795", eventstruct);
}

/*
	Name: function_7d45bff
	Namespace: callback
	Checksum: 0x25FA6378
	Offset: 0x4F40
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event function_7d45bff(eventstruct)
{
	self endon(#"death");
	level flag::wait_till("system_postinit_complete");
	self callback(#"hash_1e4a4ca774f4ce22");
}

/*
	Name: codecallback_trigger
	Namespace: callback
	Checksum: 0x7151F541
	Offset: 0x4FA8
	Size: 0xCC
	Parameters: 2
	Flags: Linked, Event
*/
event codecallback_trigger(eventstruct, look_trigger)
{
	if(!isdefined(look_trigger))
	{
		look_trigger = 0;
	}
	self endon(#"death");
	if(look_trigger || !self trigger::is_look_trigger())
	{
		self util::script_delay();
		self callback(#"on_trigger", eventstruct);
		self callback(#"on_trigger_once", eventstruct);
		self remove_on_trigger_once("all");
	}
}

/*
	Name: codecallback_entitydeleted
	Namespace: callback
	Checksum: 0x7E75440D
	Offset: 0x5080
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event codecallback_entitydeleted(eventstruct)
{
	self callback(#"on_entity_deleted");
}

/*
	Name: codecallback_botentereduseredge
	Namespace: callback
	Checksum: 0xAAABD785
	Offset: 0x50B8
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event codecallback_botentereduseredge(eventstruct)
{
	self callback(#"hash_767bb029d2dcda7c", eventstruct);
}

/*
	Name: function_d658381b
	Namespace: callback
	Checksum: 0x2FD5B191
	Offset: 0x50F0
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_d658381b(eventstruct)
{
	self callback(#"hash_6efb8cec1ca372dc");
}

/*
	Name: function_2ff20679
	Namespace: callback
	Checksum: 0x35A060DC
	Offset: 0x5128
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_2ff20679(eventstruct)
{
	self callback(#"hash_6280ac8ed281ce3c");
}

/*
	Name: function_f5026566
	Namespace: callback
	Checksum: 0x52F67523
	Offset: 0x5160
	Size: 0x88
	Parameters: 1
	Flags: Event
*/
event function_f5026566(eventstruct)
{
	if(!isdefined(level.var_abb3fd2))
	{
		return;
	}
	/#
	#/
	eventdata = {};
	eventdata.tableindex = eventstruct.tableindex;
	eventdata.event_info = eventstruct.event_info;
	self [[level.var_abb3fd2]](eventstruct.event_name, eventstruct.time, eventstruct.client, eventstruct.priority, eventdata);
}

/*
	Name: codecallback_decoration
	Namespace: callback
	Checksum: 0x9E5DF50C
	Offset: 0x51F0
	Size: 0x70
	Parameters: 1
	Flags: Event
*/
event codecallback_decoration(eventstruct)
{
	a_decorations = self getdecorations(1);
	if(!isdefined(a_decorations))
	{
		return;
	}
	level notify(#"decoration_awarded", a_decorations.size == 12);
	[[level.callbackdecorationawarded]]();
}

/*
	Name: function_a4a77d57
	Namespace: callback
	Checksum: 0x687A3062
	Offset: 0x5268
	Size: 0x30
	Parameters: 1
	Flags: Event
*/
event function_a4a77d57(eventstruct)
{
	if(isdefined(level.var_b24258))
	{
		self [[level.var_b24258]](eventstruct);
	}
}

/*
	Name: function_d5edcd9a
	Namespace: callback
	Checksum: 0x8D6C89D3
	Offset: 0x52A0
	Size: 0x30
	Parameters: 1
	Flags: Event
*/
event function_d5edcd9a(eventstruct)
{
	if(isdefined(level.var_ee39a80e))
	{
		self [[level.var_ee39a80e]](eventstruct);
	}
}

/*
	Name: function_f4449e63
	Namespace: callback
	Checksum: 0xF8868FD0
	Offset: 0x52D8
	Size: 0x4C
	Parameters: 1
	Flags: Event
*/
event function_f4449e63(eventstruct)
{
	if(isdefined(level.var_17c7288a))
	{
		[[level.var_17c7288a]](eventstruct.player, eventstruct.eventtype, eventstruct.eventdata, eventstruct.var_c5a66313);
	}
}

/*
	Name: codecallback_detonate
	Namespace: callback
	Checksum: 0xDB46DC9B
	Offset: 0x5330
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event codecallback_detonate(eventstruct)
{
	self callback(#"detonate", eventstruct);
}

/*
	Name: function_92aba4c4
	Namespace: callback
	Checksum: 0xE20455C8
	Offset: 0x5368
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_92aba4c4(eventstruct)
{
	self callback(#"doubletap_detonate", eventstruct);
}

/*
	Name: codecallback_death
	Namespace: callback
	Checksum: 0xA9494FA5
	Offset: 0x53A0
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event codecallback_death(eventstruct)
{
	self notify(#"death", eventstruct);
	self callback(#"death", eventstruct);
}

/*
	Name: callback_void
	Namespace: callback
	Checksum: 0x80F724D1
	Offset: 0x53F0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function callback_void()
{
}

