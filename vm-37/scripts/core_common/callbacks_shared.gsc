#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\simple_hostmigration.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace callback;

/*
	Name: callback
	Namespace: callback
	Checksum: 0x159ACD3E
	Offset: 0x108
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
	Checksum: 0x7056560
	Offset: 0x170
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
	Checksum: 0x304129B2
	Offset: 0x230
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
	Checksum: 0xDAFA0225
	Offset: 0x310
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
	Checksum: 0x566E14D2
	Offset: 0x4F8
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
	Checksum: 0x6BFED399
	Offset: 0x548
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
	Checksum: 0x70FC3424
	Offset: 0x598
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
	Checksum: 0xF645152E
	Offset: 0x7A8
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
	Checksum: 0x53FCD8DE
	Offset: 0x7F0
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
	Checksum: 0xDBA1CB41
	Offset: 0x880
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
	Checksum: 0x42AEAC88
	Offset: 0x8C8
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
	Checksum: 0x888BBAA
	Offset: 0x918
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
	Checksum: 0x5C615C3B
	Offset: 0xAE8
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
	Checksum: 0xCB3BC3E6
	Offset: 0xB30
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
	Checksum: 0x5B4F1ED4
	Offset: 0xB80
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
	Checksum: 0xE58689BF
	Offset: 0xBC8
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
	Checksum: 0xF271BF48
	Offset: 0xC10
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
	Checksum: 0xD233BC2C
	Offset: 0xC58
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
	Checksum: 0x21CD2D7E
	Offset: 0xCA0
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
	Checksum: 0xDED315B0
	Offset: 0xCE8
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
	Checksum: 0xCB15C4D7
	Offset: 0xD30
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
	Checksum: 0xF7A977CC
	Offset: 0xD78
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
	Checksum: 0x2FEEE562
	Offset: 0xDC0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_2d538029(func, obj)
{
	remove_callback(#"hash_3e52a013a2eb0f16", func, obj);
}

/*
	Name: function_61f038c
	Namespace: callback
	Checksum: 0x4F3729DC
	Offset: 0xE08
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_61f038c(func, obj)
{
	remove_callback(#"on_player_revived", func, obj);
}

/*
	Name: on_deleted
	Namespace: callback
	Checksum: 0xFA3F95AC
	Offset: 0xE50
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
	Checksum: 0x5756D3A8
	Offset: 0xE98
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
	Checksum: 0x97E93907
	Offset: 0xEE0
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
	Checksum: 0x3375ACB0
	Offset: 0xF28
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
	Checksum: 0x253BD847
	Offset: 0xF70
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
	Checksum: 0x74D78972
	Offset: 0xFB8
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
	Checksum: 0x828574ED
	Offset: 0x1000
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
	Checksum: 0xBD3E5D27
	Offset: 0x1048
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
	Checksum: 0x6DC9FFA3
	Offset: 0x1090
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_14dae612(func, obj)
{
	add_callback(#"hash_1b5be9017cd4b5fa", func, obj);
}

/*
	Name: function_98a0917d
	Namespace: callback
	Checksum: 0x90045C4A
	Offset: 0x10D8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_98a0917d(func, obj)
{
	add_callback(#"hash_361e06db4b210e", func, obj);
}

/*
	Name: function_359493ba
	Namespace: callback
	Checksum: 0xD12FE87A
	Offset: 0x1120
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
	Checksum: 0x734135A0
	Offset: 0x1168
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
	Checksum: 0xAC20F0EF
	Offset: 0x11B0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_joined_spectate(func, obj)
{
	add_callback(#"hash_4b55701ea20843ba", func, obj);
}

/*
	Name: on_player_killed
	Namespace: callback
	Checksum: 0x8E5D4F3A
	Offset: 0x11F8
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
	Checksum: 0x8D66C5BD
	Offset: 0x1240
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
	Checksum: 0x6407D21C
	Offset: 0x1288
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
	Checksum: 0xCC9377AF
	Offset: 0x12D0
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
	Checksum: 0x98D18658
	Offset: 0x1318
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
	Checksum: 0x33969FC6
	Offset: 0x1360
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_80270643(func, obj)
{
	add_callback(#"hash_4b1a02a87458f191", func, obj);
}

/*
	Name: function_c53a8ab8
	Namespace: callback
	Checksum: 0x9C4028B0
	Offset: 0x13A8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_c53a8ab8(func, obj)
{
	remove_callback(#"hash_4b1a02a87458f191", func, obj);
}

/*
	Name: on_ai_killed
	Namespace: callback
	Checksum: 0xD555B6A4
	Offset: 0x13F0
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
	Checksum: 0x1141538C
	Offset: 0x1438
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
	Checksum: 0x1E6B2183
	Offset: 0x1480
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
	Checksum: 0x4B19CE78
	Offset: 0x14C8
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
	Checksum: 0x720FCD07
	Offset: 0x1510
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
	Checksum: 0x4281CBAD
	Offset: 0x1558
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
	Checksum: 0x46687E2C
	Offset: 0x15A0
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
	Checksum: 0xBF759272
	Offset: 0x15E8
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
	Checksum: 0x5126C181
	Offset: 0x1630
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_vehicle_killed(func, obj)
{
	add_callback(#"on_vehicle_killed", func, obj);
}

/*
	Name: function_36aab2f3
	Namespace: callback
	Checksum: 0x7FF5F071
	Offset: 0x1678
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_36aab2f3(func, obj)
{
	function_d8abfc3d(#"veh_collision", func, obj);
}

/*
	Name: remove_on_vehicle_killed
	Namespace: callback
	Checksum: 0xF9696390
	Offset: 0x16C0
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
	Checksum: 0xC869B64
	Offset: 0x1708
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
	Checksum: 0xD71CD247
	Offset: 0x1750
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
	Checksum: 0xA56AEADF
	Offset: 0x1798
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
	Checksum: 0xF1447436
	Offset: 0x17E0
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
	Checksum: 0x7B4ECDF5
	Offset: 0x1828
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
	Checksum: 0x90535C20
	Offset: 0x1870
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
	Checksum: 0x76ECE4C2
	Offset: 0x18B8
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
	Checksum: 0xA7B8A9D0
	Offset: 0x1900
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
	Checksum: 0x17315A35
	Offset: 0x1948
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
	Checksum: 0x181F2A71
	Offset: 0x1990
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
	Checksum: 0xCB1AEA28
	Offset: 0x19D8
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
	Checksum: 0xAA33643E
	Offset: 0x1A20
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function remove_on_vehicle_damage(func, obj)
{
	remove_callback(#"on_vehicle_damage", func, obj);
}

/*
	Name: function_1475a073
	Namespace: callback
	Checksum: 0x99051817
	Offset: 0x1A68
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_1475a073(func, obj)
{
	add_callback(#"hash_65626f47d6c0717c", func, obj);
}

/*
	Name: function_626c1390
	Namespace: callback
	Checksum: 0x90487387
	Offset: 0x1AB0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_626c1390(func, obj)
{
	remove_callback(#"hash_65626f47d6c0717c", func, obj);
}

/*
	Name: on_laststand
	Namespace: callback
	Checksum: 0xC0924968
	Offset: 0x1AF8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_laststand(func, obj)
{
	add_callback(#"on_player_laststand", func, obj);
}

/*
	Name: function_53888e7f
	Namespace: callback
	Checksum: 0x61E2DF54
	Offset: 0x1B40
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_53888e7f(func, obj)
{
	remove_callback(#"on_player_laststand", func, obj);
}

/*
	Name: on_bleedout
	Namespace: callback
	Checksum: 0x1D5749AE
	Offset: 0x1B88
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
	Checksum: 0x3DC45837
	Offset: 0x1BD0
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
	Checksum: 0x7499B155
	Offset: 0x1C18
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
	Checksum: 0x2BB0CB01
	Offset: 0x1C60
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_challenge_complete(func, obj)
{
	add_callback(#"on_challenge_complete", func, obj);
}

/*
	Name: function_f77ced93
	Namespace: callback
	Checksum: 0x14B48C37
	Offset: 0x1CA8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_f77ced93(func, obj)
{
	add_callback(#"weapon_change", func, obj);
}

/*
	Name: function_5a753d97
	Namespace: callback
	Checksum: 0xE92B6C0E
	Offset: 0x1CF0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_5a753d97(func, obj)
{
	remove_callback(#"weapon_change", func, obj);
}

/*
	Name: function_78ccee50
	Namespace: callback
	Checksum: 0x4FD2C9A6
	Offset: 0x1D38
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_78ccee50(func, obj)
{
	add_callback(#"weapon_fired", func, obj);
}

/*
	Name: function_deba137d
	Namespace: callback
	Checksum: 0x9FC2F406
	Offset: 0x1D80
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_deba137d(func, obj)
{
	remove_callback(#"weapon_fired", func, obj);
}

/*
	Name: function_20263b9e
	Namespace: callback
	Checksum: 0x96FAE2B0
	Offset: 0x1DC8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_20263b9e(func, obj)
{
	add_callback(#"hash_5989c4f123e1fb1a", func, obj);
}

/*
	Name: function_311bb575
	Namespace: callback
	Checksum: 0x931B990
	Offset: 0x1E10
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_311bb575(func, obj)
{
	remove_callback(#"hash_5989c4f123e1fb1a", func, obj);
}

/*
	Name: function_ce4a7c15
	Namespace: callback
	Checksum: 0x6CDF2AD
	Offset: 0x1E58
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_ce4a7c15(func, obj)
{
	add_callback(#"hash_7b6a55a9b65e3194", func, obj);
}

/*
	Name: function_229f88c7
	Namespace: callback
	Checksum: 0xBF790FEE
	Offset: 0x1EA0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_229f88c7(func, obj)
{
	remove_callback(#"hash_7b6a55a9b65e3194", func, obj);
}

/*
	Name: function_4b7977fe
	Namespace: callback
	Checksum: 0x112B0C9
	Offset: 0x1EE8
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
	Checksum: 0xE9CBAF3B
	Offset: 0x1F30
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_61583a71(func, obj)
{
	remove_callback(#"hash_198a389d6b65f68d", func, obj);
}

/*
	Name: function_e0b66c97
	Namespace: callback
	Checksum: 0x4946F6C9
	Offset: 0x1F78
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_e0b66c97(func, obj)
{
	function_d8abfc3d(#"detonate", func, obj);
}

/*
	Name: function_a96b9a74
	Namespace: callback
	Checksum: 0x6488D5BF
	Offset: 0x1FC0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_a96b9a74(func, obj)
{
	function_52ac9652(#"detonate", func, obj);
}

/*
	Name: function_d800788e
	Namespace: callback
	Checksum: 0xD9EA9CF
	Offset: 0x2008
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_d800788e(func, obj)
{
	function_d8abfc3d(#"doubletap_detonate", func, obj);
}

/*
	Name: function_da4517ea
	Namespace: callback
	Checksum: 0xD4EBBCD8
	Offset: 0x2050
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_da4517ea(func, obj)
{
	function_52ac9652(#"doubletap_detonate", func, obj);
}

/*
	Name: on_death
	Namespace: callback
	Checksum: 0xD3714474
	Offset: 0x2098
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
	Checksum: 0x94BBAF92
	Offset: 0x20E0
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
	Checksum: 0x542CFFF4
	Offset: 0x2128
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_27d9ab8(func, obj)
{
	add_callback(#"hash_1e4a4ca774f4ce22", func, obj);
}

/*
	Name: function_35a12f19
	Namespace: callback
	Checksum: 0xA9581E39
	Offset: 0x2170
	Size: 0x44
	Parameters: 3
	Flags: Linked, Variadic
*/
function function_35a12f19(func, obj, ...)
{
	function_d8abfc3d(#"hash_1bd0411eb5169b", func, obj, vararg);
}

/*
	Name: function_b74bf3e
	Namespace: callback
	Checksum: 0xD282AD0A
	Offset: 0x21C0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_b74bf3e(func, obj)
{
	function_52ac9652(#"hash_1bd0411eb5169b", func, obj);
}

/*
	Name: function_a04381e0
	Namespace: callback
	Checksum: 0x273E3220
	Offset: 0x2208
	Size: 0x44
	Parameters: 3
	Flags: Linked, Variadic
*/
function function_a04381e0(func, obj, ...)
{
	function_d8abfc3d(#"hash_46d459e3750a3345", func, obj, vararg);
}

/*
	Name: function_3507ed1f
	Namespace: callback
	Checksum: 0xD16E42CA
	Offset: 0x2258
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_3507ed1f(func, obj)
{
	function_52ac9652(#"hash_46d459e3750a3345", func, obj);
}

/*
	Name: function_33f0ddd3
	Namespace: callback
	Checksum: 0x2B91BECF
	Offset: 0x22A0
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
	Checksum: 0xBB5C080E
	Offset: 0x22E8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_824d206(func, obj)
{
	remove_callback(#"hash_39bf72fd97e248a0", func, obj);
}

/*
	Name: function_4b1aff2
	Namespace: callback
	Checksum: 0x92367FB7
	Offset: 0x2330
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_4b1aff2(func, obj)
{
	add_callback(#"hash_6c189017e0e91d02", func, obj);
}

/*
	Name: function_d935a5b6
	Namespace: callback
	Checksum: 0xB3A10666
	Offset: 0x2378
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_d935a5b6(func, obj)
{
	remove_callback(#"hash_6c189017e0e91d02", func, obj);
}

/*
	Name: function_5753ac6e
	Namespace: callback
	Checksum: 0x9236A444
	Offset: 0x23C0
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
	Checksum: 0x918B1521
	Offset: 0x2408
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
	Checksum: 0x7699584B
	Offset: 0x2450
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
	Checksum: 0x494B0636
	Offset: 0x2498
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function on_menu_response(func, obj)
{
	add_callback(#"hash_4e1a50a35ec44bcc", func, obj);
}

/*
	Name: function_96bbd5dc
	Namespace: callback
	Checksum: 0x42422A4D
	Offset: 0x24E0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_96bbd5dc(func, obj)
{
	remove_callback(#"hash_4e1a50a35ec44bcc", func, obj);
}

/*
	Name: function_10a4dd0a
	Namespace: callback
	Checksum: 0x3DBE322C
	Offset: 0x2528
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_10a4dd0a(func, obj)
{
	add_callback(#"hash_56d1805bfff3e65b", func, obj);
}

/*
	Name: function_7897dfe6
	Namespace: callback
	Checksum: 0x59321AC2
	Offset: 0x2570
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_7897dfe6(func, obj)
{
	add_callback(#"hash_4d3e34c3c8f8bb2a", func, obj);
}

/*
	Name: function_28a6c197
	Namespace: callback
	Checksum: 0x23968868
	Offset: 0x25B8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_28a6c197(func, obj)
{
	add_callback(#"hash_27e13b9438e33053", func, obj);
}

/*
	Name: function_955a779c
	Namespace: callback
	Checksum: 0xBDC881DA
	Offset: 0x2600
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_955a779c(func, obj)
{
	add_callback(#"hash_41c107b83320aba2", func, obj);
}

/*
	Name: function_c55a0479
	Namespace: callback
	Checksum: 0x8CA1AD9F
	Offset: 0x2648
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_c55a0479(func, obj)
{
	add_callback(#"hash_20eb78148e01f7c3", func, obj);
}

/*
	Name: function_ed93a653
	Namespace: callback
	Checksum: 0xF3876755
	Offset: 0x2690
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_ed93a653(func, obj)
{
	add_callback(#"hash_7fc16e58d454945", func, obj);
}

/*
	Name: function_1ae8059
	Namespace: callback
	Checksum: 0x4E117838
	Offset: 0x26D8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_1ae8059(func, obj)
{
	add_callback(#"contract_complete", func, obj);
}

/*
	Name: function_6700e8b5
	Namespace: callback
	Checksum: 0x52FCEE0B
	Offset: 0x2720
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
	Checksum: 0x7DA6C6B7
	Offset: 0x2798
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
	Checksum: 0x6DF6A415
	Offset: 0x2810
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
	Checksum: 0xC1C5BFF
	Offset: 0x2888
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
	Checksum: 0x5C7664BA
	Offset: 0x28D0
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
	Checksum: 0xA5426D79
	Offset: 0x2918
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
	Checksum: 0x99DD3666
	Offset: 0x2960
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
	Checksum: 0xF0A59D2E
	Offset: 0x29A8
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
	Checksum: 0x146F6B1F
	Offset: 0x29F0
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
	Checksum: 0xF9469297
	Offset: 0x2A38
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_4123368a(eventstruct)
{
	flag::set(#"hash_40e6df0197588a7b");
}

/*
	Name: function_12c01a61
	Namespace: callback
	Checksum: 0x40CC446B
	Offset: 0x2A70
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
	Checksum: 0x79641187
	Offset: 0x2AB8
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
	Checksum: 0x65062E1C
	Offset: 0x2B20
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
	Checksum: 0x19B086FF
	Offset: 0x2B68
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
	Name: function_34dea974
	Namespace: callback
	Checksum: 0xB0A3CAD2
	Offset: 0x2C40
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function function_34dea974(weapon, callback)
{
	if(!isdefined(level.var_129c2069))
	{
		level.var_129c2069 = [];
	}
	level.var_129c2069[weapon] = callback;
}

/*
	Name: function_f19add2
	Namespace: callback
	Checksum: 0xCE312233
	Offset: 0x2C88
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_f19add2(weapon)
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
	Checksum: 0xB2708461
	Offset: 0x2D38
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
	Checksum: 0xC9819C76
	Offset: 0x2DA0
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
	Checksum: 0xDC6E87A4
	Offset: 0x2DD8
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
	Checksum: 0x7493CD21
	Offset: 0x2E78
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
	Checksum: 0xC709D388
	Offset: 0x2EB8
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
	Checksum: 0xA30561E2
	Offset: 0x2F00
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
	Checksum: 0xF3F6EA1E
	Offset: 0x2F48
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
	Checksum: 0x50B583AB
	Offset: 0x2F90
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
	Checksum: 0x723A6714
	Offset: 0x2FD8
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
	Checksum: 0x17E0656
	Offset: 0x3080
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
	Checksum: 0x110405E
	Offset: 0x3108
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
	Checksum: 0xE3ECD940
	Offset: 0x3178
	Size: 0x38
	Parameters: 1
	Flags: Event
*/
event function_323548ba(eventstruct)
{
	self endon(#"disconnect");
	[[level.var_7509c7d8]](eventstruct.damage);
}

/*
	Name: codecallback_playerlaststand
	Namespace: callback
	Checksum: 0xCCE2E492
	Offset: 0x31B8
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
	Checksum: 0x57B9F8FB
	Offset: 0x3258
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
	Checksum: 0x52CF289C
	Offset: 0x3298
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
	Checksum: 0x4942A32B
	Offset: 0x32E8
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
	Checksum: 0xAC0122E0
	Offset: 0x3338
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
	Checksum: 0xF24DA1C7
	Offset: 0x3388
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
	Checksum: 0xAFEB394
	Offset: 0x33D8
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
	Checksum: 0x13843270
	Offset: 0x3428
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
	callback(#"hash_6c189017e0e91d02", eventstruct);
}

/*
	Name: function_e35aeddd
	Namespace: callback
	Checksum: 0x1E9DB152
	Offset: 0x34A8
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
	Checksum: 0x74B2FE23
	Offset: 0x34F8
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
	Checksum: 0x4272284D
	Offset: 0x3548
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
	Checksum: 0xD66D990F
	Offset: 0x3598
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
	Checksum: 0x3E9B2720
	Offset: 0x35E8
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
	Checksum: 0xA4836F74
	Offset: 0x3638
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
	Checksum: 0x6CA50BBF
	Offset: 0x3688
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
	Checksum: 0xB0856A66
	Offset: 0x36D8
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
	Checksum: 0xA0F824C7
	Offset: 0x3728
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
	Checksum: 0x73BD48C
	Offset: 0x3778
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
	Checksum: 0x3CB036D0
	Offset: 0x37F0
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
	Checksum: 0x364536D5
	Offset: 0x3820
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
	Checksum: 0xE59BFE36
	Offset: 0x3860
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
	Checksum: 0x65765438
	Offset: 0x3898
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
	Checksum: 0xDAAB8C0
	Offset: 0x3940
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
	Checksum: 0x7CF17A40
	Offset: 0x39B0
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
	Checksum: 0x48CA28ED
	Offset: 0x39E0
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
	Checksum: 0x739F6185
	Offset: 0x3A18
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
	Checksum: 0x8C06670C
	Offset: 0x3AC8
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
	Checksum: 0x28151947
	Offset: 0x3B08
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
	Checksum: 0xDD51ECE3
	Offset: 0x3B70
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
	Checksum: 0x77C1DBB0
	Offset: 0x3C18
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
	Checksum: 0xC721E2E1
	Offset: 0x3CB8
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
	Checksum: 0x781FDDE1
	Offset: 0x3CF0
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
	Checksum: 0x399158A3
	Offset: 0x3DA8
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
	Checksum: 0xDC4E14D1
	Offset: 0x3E28
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
	Checksum: 0x886933F2
	Offset: 0x3FB8
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
	Checksum: 0xF4EF085
	Offset: 0x4060
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
	Checksum: 0xD1930BE1
	Offset: 0x4108
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
				level.menuresponsequeue[0].ent callback(#"hash_4e1a50a35ec44bcc", level.menuresponsequeue[0].eventstruct);
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
	Checksum: 0x63258309
	Offset: 0x4208
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
	Checksum: 0xF3D33CDF
	Offset: 0x42D8
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
	Checksum: 0xF961E369
	Offset: 0x43A0
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
	var_489a8c6f = (isdefined(self.var_f501d778) ? self.var_f501d778 : 50);
	var_5143872f = (isdefined(self.var_e14c1b5c) ? self.var_e14c1b5c : 25);
	physicsexplosionsphere(origin, outerradius, innerradius, magnitude, var_5143872f, var_489a8c6f);
}

/*
	Name: function_52d32e5b
	Namespace: callback
	Checksum: 0x5B6B8A20
	Offset: 0x44B0
	Size: 0x24C
	Parameters: 1
	Flags: Event
*/
event function_52d32e5b(eventstruct)
{
	actor = self;
	player = getplayers()[0];
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
	Checksum: 0x989027D6
	Offset: 0x4708
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
	Checksum: 0xADE48CF0
	Offset: 0x47A8
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
	Checksum: 0x78C30470
	Offset: 0x4848
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
	Checksum: 0x7F70BDDC
	Offset: 0x48C8
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
	Checksum: 0xEB485A0A
	Offset: 0x4948
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
	Checksum: 0x8DD34532
	Offset: 0x4B78
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
	Checksum: 0x9F5D4733
	Offset: 0x4BD8
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
	Checksum: 0x9B031449
	Offset: 0x4C10
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
	Checksum: 0x3C1F8948
	Offset: 0x4C48
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
	Checksum: 0x6ECE6D50
	Offset: 0x4C80
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
	Checksum: 0xCC77F8B4
	Offset: 0x4CB8
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
	Checksum: 0xFD92DEA7
	Offset: 0x4D08
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_e142d2b2(eventstruct)
{
	self callback(#"swimming", {#swimming:0});
}

/*
	Name: function_df998213
	Namespace: callback
	Checksum: 0x6DFCE352
	Offset: 0x4D58
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_df998213(eventstruct)
{
	self callback(#"underwater", eventstruct);
}

/*
	Name: function_8877d89
	Namespace: callback
	Checksum: 0xA9BF619D
	Offset: 0x4D90
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
	Checksum: 0xC01F43E
	Offset: 0x4DC8
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
	Checksum: 0x3CD99D7
	Offset: 0x4E00
	Size: 0x34
	Parameters: 1
	Flags: Event
*/
event function_930ce3c3(eventstruct)
{
	/#
		self callback(#"hash_36b1b305064a7cf8", eventstruct);
	#/
}

/*
	Name: function_d736b8a9
	Namespace: callback
	Checksum: 0x1F3FBE67
	Offset: 0x4E40
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
	Checksum: 0x48984A77
	Offset: 0x4E78
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
	Name: function_6eb09118
	Namespace: callback
	Checksum: 0x57046D2C
	Offset: 0x4EE0
	Size: 0xCC
	Parameters: 2
	Flags: Linked, Event
*/
event function_6eb09118(eventstruct, look_trigger)
{
	if(!isdefined(look_trigger))
	{
		look_trigger = 0;
	}
	self endon(#"death");
	if(look_trigger || !self trigger::is_look_trigger())
	{
		self util::script_delay();
		self callback(#"hash_1bd0411eb5169b", eventstruct);
		self callback(#"hash_46d459e3750a3345", eventstruct);
		self function_3507ed1f("all");
	}
}

/*
	Name: codecallback_entitydeleted
	Namespace: callback
	Checksum: 0xB0CDE8F
	Offset: 0x4FB8
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
	Checksum: 0xDFC94222
	Offset: 0x4FF0
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
	Checksum: 0x2FAC34C8
	Offset: 0x5028
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
	Checksum: 0x40F65786
	Offset: 0x5060
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
	Checksum: 0x9582D96F
	Offset: 0x5098
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
	Checksum: 0xCBAC2154
	Offset: 0x5128
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
	Checksum: 0x6D96FA5
	Offset: 0x51A0
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
	Checksum: 0x5B7B0D0F
	Offset: 0x51D8
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
	Checksum: 0x9FBD51E4
	Offset: 0x5210
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
	Name: function_8e693523
	Namespace: callback
	Checksum: 0x62E15905
	Offset: 0x5268
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_8e693523(eventstruct)
{
	self callback(#"detonate", eventstruct);
}

/*
	Name: function_92aba4c4
	Namespace: callback
	Checksum: 0xA63DE8AC
	Offset: 0x52A0
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_92aba4c4(eventstruct)
{
	self callback(#"doubletap_detonate", eventstruct);
}

/*
	Name: function_2eb17944
	Namespace: callback
	Checksum: 0xAEACED00
	Offset: 0x52D8
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_2eb17944(eventstruct)
{
	self notify(#"death", eventstruct);
	self callback(#"death", eventstruct);
}

/*
	Name: callback_void
	Namespace: callback
	Checksum: 0x80F724D1
	Offset: 0x5328
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function callback_void()
{
}

