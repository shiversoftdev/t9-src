#using script_72d4466ce2e2cc7b;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace util;

/*
	Name: __init__system__
	Namespace: util
	Checksum: 0x72262E9F
	Offset: 0x158
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"util_shared", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: util
	Checksum: 0x62FB0BF2
	Offset: 0x1A0
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	function_73fab74d();
	register_clientfields();
	namespace_1e38a8f6::init();
}

/*
	Name: register_clientfields
	Namespace: util
	Checksum: 0xBBB18CB9
	Offset: 0x1E0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("world", "cf_team_mapping", 1, 1, "int", &cf_team_mapping, 0, 0);
	clientfield::register("world", "preload_frontend", 1, 1, "int", &preload_frontend, 0, 0);
}

/*
	Name: empty
	Namespace: util
	Checksum: 0x338FC4DE
	Offset: 0x280
	Size: 0x2C
	Parameters: 5
	Flags: None
*/
function empty(a, b, c, d, e)
{
}

/*
	Name: waitforallclients
	Namespace: util
	Checksum: 0x737D83E7
	Offset: 0x2B8
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function waitforallclients()
{
	localclient = 0;
	if(!isdefined(level.localplayers))
	{
		while(!isdefined(level.localplayers))
		{
			waitframe(1);
		}
	}
	while(level.localplayers.size <= 0)
	{
		waitframe(1);
	}
	while(localclient < level.localplayers.size)
	{
		waitforclient(localclient);
		localclient++;
	}
}

/*
	Name: function_89a98f85
	Namespace: util
	Checksum: 0x20C8ECB8
	Offset: 0x348
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_89a98f85()
{
	num = getdvarint(#"splitscreen_playercount", 0);
	if(num < 1)
	{
		num = getactivelocalclients();
	}
	for(localclient = 0; localclient < num; localclient++)
	{
		waitforclient(localclient);
	}
}

/*
	Name: waitforclient
	Namespace: util
	Checksum: 0x1D6F5194
	Offset: 0x3D8
	Size: 0x30
	Parameters: 1
	Flags: Linked
*/
function waitforclient(client)
{
	while(!clienthassnapshot(client))
	{
		waitframe(1);
	}
}

/*
	Name: function_35840de8
	Namespace: util
	Checksum: 0x6561A270
	Offset: 0x410
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_35840de8(seconds)
{
	if(isdefined(seconds) && float(seconds) > 0)
	{
		wait(float(seconds));
	}
}

/*
	Name: get_dvar_float_default
	Namespace: util
	Checksum: 0xF6D1A4C1
	Offset: 0x468
	Size: 0x62
	Parameters: 2
	Flags: None
*/
function get_dvar_float_default(str_dvar, default_val)
{
	value = getdvarstring(str_dvar);
	return (value != "" ? float(value) : default_val);
}

/*
	Name: get_dvar_int_default
	Namespace: util
	Checksum: 0x80763965
	Offset: 0x4D8
	Size: 0x62
	Parameters: 2
	Flags: None
*/
function get_dvar_int_default(str_dvar, default_val)
{
	value = getdvarstring(str_dvar);
	return (value != "" ? int(value) : default_val);
}

/*
	Name: spawn_model
	Namespace: util
	Checksum: 0x7CDECA0A
	Offset: 0x548
	Size: 0x9E
	Parameters: 4
	Flags: Linked
*/
function spawn_model(n_client, str_model, origin, angles)
{
	if(!isdefined(origin))
	{
		origin = (0, 0, 0);
	}
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	model = spawn(n_client, origin, "script_model");
	if(isdefined(model))
	{
		model setmodel(str_model);
		model.angles = angles;
	}
	return model;
}

/*
	Name: spawn_anim_model
	Namespace: util
	Checksum: 0xDCF48D6F
	Offset: 0x5F0
	Size: 0x86
	Parameters: 4
	Flags: Linked
*/
function spawn_anim_model(n_client, model_name, origin, angles)
{
	model = spawn_model(n_client, model_name, origin, angles);
	if(isdefined(model))
	{
		model useanimtree("generic");
		model.animtree = "generic";
	}
	return model;
}

/*
	Name: waittill_string
	Namespace: util
	Checksum: 0x6E39F952
	Offset: 0x680
	Size: 0x80
	Parameters: 2
	Flags: None
*/
function waittill_string(msg, ent)
{
	if(msg != "death")
	{
		self endon(#"death");
	}
	ent endon(#"die");
	self waittill(msg);
	ent notify(#"returned", {#msg:msg});
}

/*
	Name: waittill_multiple
	Namespace: util
	Checksum: 0x6D99C488
	Offset: 0x708
	Size: 0x9C
	Parameters: 1
	Flags: Variadic
*/
function waittill_multiple(...)
{
	s_tracker = spawnstruct();
	s_tracker._wait_count = 0;
	for(i = 0; i < vararg.size; i++)
	{
		self thread _waitlogic(s_tracker, vararg[i]);
	}
	if(s_tracker._wait_count > 0)
	{
		s_tracker waittill(#"waitlogic_finished");
	}
}

/*
	Name: waittill_multiple_ents
	Namespace: util
	Checksum: 0xF1562BCF
	Offset: 0x7B0
	Size: 0x1A4
	Parameters: 1
	Flags: Variadic
*/
function waittill_multiple_ents(...)
{
	a_ents = [];
	a_notifies = [];
	for(i = 0; i < vararg.size; i++)
	{
		if(i % 2)
		{
			if(!isdefined(a_notifies))
			{
				a_notifies = [];
			}
			else if(!isarray(a_notifies))
			{
				a_notifies = array(a_notifies);
			}
			a_notifies[a_notifies.size] = vararg[i];
			continue;
		}
		if(!isdefined(a_ents))
		{
			a_ents = [];
		}
		else if(!isarray(a_ents))
		{
			a_ents = array(a_ents);
		}
		a_ents[a_ents.size] = vararg[i];
	}
	s_tracker = spawnstruct();
	s_tracker._wait_count = 0;
	for(i = 0; i < a_ents.size; i++)
	{
		ent = a_ents[i];
		if(isdefined(ent))
		{
			ent thread _waitlogic(s_tracker, a_notifies[i]);
		}
	}
	if(s_tracker._wait_count > 0)
	{
		s_tracker waittill(#"waitlogic_finished");
	}
}

/*
	Name: _waitlogic
	Namespace: util
	Checksum: 0xE5FCF390
	Offset: 0x960
	Size: 0xB0
	Parameters: 2
	Flags: Linked
*/
function _waitlogic(s_tracker, notifies)
{
	s_tracker._wait_count++;
	if(!isdefined(notifies))
	{
		notifies = [];
	}
	else if(!isarray(notifies))
	{
		notifies = array(notifies);
	}
	notifies[notifies.size] = "death";
	self waittill(notifies);
	s_tracker._wait_count--;
	if(s_tracker._wait_count == 0)
	{
		s_tracker notify(#"waitlogic_finished");
	}
}

/*
	Name: waittill_any_ents
	Namespace: util
	Checksum: 0x9EBABFB2
	Offset: 0xA18
	Size: 0x14A
	Parameters: 14
	Flags: Linked
*/
function waittill_any_ents(ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7)
{
	/#
		assert(isdefined(ent1));
	#/
	/#
		assert(isdefined(string1));
	#/
	if(isdefined(ent2) && isdefined(string2))
	{
		ent2 endon(string2);
	}
	if(isdefined(ent3) && isdefined(string3))
	{
		ent3 endon(string3);
	}
	if(isdefined(ent4) && isdefined(string4))
	{
		ent4 endon(string4);
	}
	if(isdefined(ent5) && isdefined(string5))
	{
		ent5 endon(string5);
	}
	if(isdefined(ent6) && isdefined(string6))
	{
		ent6 endon(string6);
	}
	if(isdefined(ent7) && isdefined(string7))
	{
		ent7 endon(string7);
	}
	ent1 waittill(string1);
}

/*
	Name: function_e532f5da
	Namespace: util
	Checksum: 0xBCC9584F
	Offset: 0xB70
	Size: 0x11A
	Parameters: 11
	Flags: None
*/
function function_e532f5da(n_timeout, ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5)
{
	/#
		assert(isdefined(n_timeout));
	#/
	/#
		assert(isdefined(ent1));
	#/
	/#
		assert(isdefined(string1));
	#/
	if(isdefined(ent2) && isdefined(string2))
	{
		ent2 endon(string2);
	}
	if(isdefined(ent3) && isdefined(string3))
	{
		ent3 endon(string3);
	}
	if(isdefined(ent4) && isdefined(string4))
	{
		ent4 endon(string4);
	}
	if(isdefined(ent5) && isdefined(string5))
	{
		ent5 endon(string5);
	}
	ent1 waittilltimeout(n_timeout, string1);
}

/*
	Name: waittill_any_ents_two
	Namespace: util
	Checksum: 0x9498C30F
	Offset: 0xC98
	Size: 0x78
	Parameters: 4
	Flags: None
*/
function waittill_any_ents_two(ent1, string1, ent2, string2)
{
	/#
		assert(isdefined(ent1));
	#/
	/#
		assert(isdefined(string1));
	#/
	if(isdefined(ent2) && isdefined(string2))
	{
		ent2 endon(string2);
	}
	ent1 waittill(string1);
}

/*
	Name: single_func
	Namespace: util
	Checksum: 0xECDE77D
	Offset: 0xD18
	Size: 0x32
	Parameters: 3
	Flags: Linked, Variadic
*/
function single_func(entity, func, ...)
{
	return _single_func(entity, func, vararg);
}

/*
	Name: single_func_argarray
	Namespace: util
	Checksum: 0x244888B2
	Offset: 0xD58
	Size: 0x32
	Parameters: 3
	Flags: Linked
*/
function single_func_argarray(entity, func, a_vars)
{
	return _single_func(entity, func, a_vars);
}

/*
	Name: _single_func
	Namespace: util
	Checksum: 0x9259B0F
	Offset: 0xD98
	Size: 0x48A
	Parameters: 3
	Flags: Linked
*/
function _single_func(entity, func, a_vars)
{
	_clean_up_arg_array(a_vars);
	switch(a_vars.size)
	{
		case 8:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
			}
			break;
		}
		case 7:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
			}
			break;
		}
		case 6:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
			}
			break;
		}
		case 5:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
			}
			break;
		}
		case 4:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
			}
			break;
		}
		case 3:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2]);
			}
			break;
		}
		case 2:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1]);
			}
			break;
		}
		case 1:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0]);
			}
			else
			{
				return [[func]](a_vars[0]);
			}
			break;
		}
		case 0:
		{
			if(isdefined(entity))
			{
				return entity [[func]]();
			}
			else
			{
				return [[func]]();
			}
			break;
		}
		default:
		{
			/#
				assertmsg("");
			#/
		}
	}
}

/*
	Name: _clean_up_arg_array
	Namespace: util
	Checksum: 0x832B6456
	Offset: 0x1230
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function _clean_up_arg_array(&a_vars)
{
	for(i = a_vars.size - 1; i >= 0; i--)
	{
		if(a_vars[i] === undefined)
		{
			arrayremoveindex(a_vars, i, 0);
			continue;
		}
		break;
	}
}

/*
	Name: new_func
	Namespace: util
	Checksum: 0x8D167C22
	Offset: 0x12A0
	Size: 0xAE
	Parameters: 7
	Flags: None
*/
function new_func(func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	s_func = spawnstruct();
	s_func.func = func;
	s_func.arg1 = arg1;
	s_func.arg2 = arg2;
	s_func.arg3 = arg3;
	s_func.arg4 = arg4;
	s_func.arg5 = arg5;
	s_func.arg6 = arg6;
	return s_func;
}

/*
	Name: call_func
	Namespace: util
	Checksum: 0xD808CDFC
	Offset: 0x1358
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function call_func(s_func)
{
	return single_func(self, s_func.func, s_func.arg1, s_func.arg2, s_func.arg3, s_func.arg4, s_func.arg5, s_func.arg6);
}

/*
	Name: array_ent_thread
	Namespace: util
	Checksum: 0x6FCC7B0B
	Offset: 0x13C0
	Size: 0x154
	Parameters: 7
	Flags: None
*/
function array_ent_thread(entities, func, arg1, arg2, arg3, arg4, arg5)
{
	/#
		assert(isdefined(entities), "");
	#/
	/#
		assert(isdefined(func), "");
	#/
	if(isarray(entities))
	{
		if(entities.size)
		{
			foreach(entity in entities)
			{
				single_thread(self, func, entity, arg1, arg2, arg3, arg4, arg5);
			}
		}
	}
	else
	{
		single_thread(self, func, entities, arg1, arg2, arg3, arg4, arg5);
	}
}

/*
	Name: single_thread
	Namespace: util
	Checksum: 0x70BB9694
	Offset: 0x1520
	Size: 0x3C
	Parameters: 3
	Flags: Linked, Variadic
*/
function single_thread(entity, func, ...)
{
	_single_thread(entity, func, undefined, undefined, vararg);
}

/*
	Name: single_thread_argarray
	Namespace: util
	Checksum: 0x925DDC7E
	Offset: 0x1568
	Size: 0x3C
	Parameters: 3
	Flags: None
*/
function single_thread_argarray(entity, func, &a_vars)
{
	_single_thread(entity, func, undefined, undefined, a_vars);
}

/*
	Name: function_50f54b6f
	Namespace: util
	Checksum: 0x1D69E96D
	Offset: 0x15B0
	Size: 0x44
	Parameters: 4
	Flags: None
*/
function function_50f54b6f(entity, func, arg1, &a_vars)
{
	_single_thread(entity, func, arg1, undefined, a_vars);
}

/*
	Name: function_cf55c866
	Namespace: util
	Checksum: 0x48F73F9A
	Offset: 0x1600
	Size: 0x4C
	Parameters: 5
	Flags: None
*/
function function_cf55c866(entity, func, arg1, arg2, &a_vars)
{
	_single_thread(entity, func, arg1, arg2, a_vars);
}

/*
	Name: _single_thread
	Namespace: util
	Checksum: 0xCC817AC6
	Offset: 0x1658
	Size: 0x85A
	Parameters: 5
	Flags: Linked
*/
function _single_thread(entity, func, arg1, arg2, &a_vars)
{
	_clean_up_arg_array(a_vars);
	/#
		/#
			assert(isfunctionptr(func), "" + "");
		#/
	#/
	if(!isfunctionptr(func))
	{
		return;
	}
	if(isdefined(arg2))
	{
		switch(a_vars.size)
		{
			case 8:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
				break;
			}
			case 7:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
				break;
			}
			case 6:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
				break;
			}
			case 5:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
				break;
			}
			case 4:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
				break;
			}
			case 3:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2]);
				break;
			}
			case 2:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1]);
				break;
			}
			case 1:
			{
				entity thread [[func]](arg1, arg2, a_vars[0]);
				break;
			}
			case 0:
			{
				entity thread [[func]](arg1, arg2);
				break;
			}
			default:
			{
				/#
					assertmsg("");
				#/
			}
		}
	}
	else
	{
		if(isdefined(arg1))
		{
			switch(a_vars.size)
			{
				case 8:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
					break;
				}
				case 7:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
					break;
				}
				case 6:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
					break;
				}
				case 5:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
					break;
				}
				case 4:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
					break;
				}
				case 3:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2]);
					break;
				}
				case 2:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1]);
					break;
				}
				case 1:
				{
					entity thread [[func]](arg1, a_vars[0]);
					break;
				}
				case 0:
				{
					entity thread [[func]](arg1);
					break;
				}
				default:
				{
					/#
						assertmsg("");
					#/
				}
			}
		}
		else
		{
			switch(a_vars.size)
			{
				case 8:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
					break;
				}
				case 7:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
					break;
				}
				case 6:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
					break;
				}
				case 5:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
					break;
				}
				case 4:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
					break;
				}
				case 3:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2]);
					break;
				}
				case 2:
				{
					entity thread [[func]](a_vars[0], a_vars[1]);
					break;
				}
				case 1:
				{
					entity thread [[func]](a_vars[0]);
					break;
				}
				case 0:
				{
					entity thread [[func]]();
					break;
				}
				default:
				{
					/#
						assertmsg("");
					#/
				}
			}
		}
	}
}

/*
	Name: add_listen_thread
	Namespace: util
	Checksum: 0x81C39AA0
	Offset: 0x1EC0
	Size: 0x64
	Parameters: 7
	Flags: None
*/
function add_listen_thread(wait_till, func, param1, param2, param3, param4, param5)
{
	level thread add_listen_thread_internal(wait_till, func, param1, param2, param3, param4, param5);
}

/*
	Name: add_listen_thread_internal
	Namespace: util
	Checksum: 0x682486AE
	Offset: 0x1F30
	Size: 0x70
	Parameters: 7
	Flags: Linked
*/
function add_listen_thread_internal(wait_till, func, param1, param2, param3, param4, param5)
{
	for(;;)
	{
		level waittill(wait_till);
		single_thread(level, func, param1, param2, param3, param4, param5);
	}
}

/*
	Name: timeout
	Namespace: util
	Checksum: 0xE65343E5
	Offset: 0x1FA8
	Size: 0xCC
	Parameters: 8
	Flags: Linked
*/
function timeout(n_time, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	self endon(#"death");
	if(isdefined(n_time))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s delay_notify(n_time, "timeout");
	}
	single_func(self, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

/*
	Name: create_flags_and_return_tokens
	Namespace: util
	Checksum: 0x3301F490
	Offset: 0x2080
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function create_flags_and_return_tokens(flags)
{
	return strtok(flags, " ");
}

/*
	Name: delay
	Namespace: util
	Checksum: 0xB6056605
	Offset: 0x20B8
	Size: 0x74
	Parameters: 9
	Flags: Linked
*/
function delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	self thread _delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

/*
	Name: _delay
	Namespace: util
	Checksum: 0x7EEBC271
	Offset: 0x2138
	Size: 0xDC
	Parameters: 9
	Flags: Linked
*/
function _delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	self endon(#"death");
	if(isdefined(str_endon))
	{
		self endon(str_endon);
	}
	if(ishash(time_or_notify) || isstring(time_or_notify))
	{
		self waittill(time_or_notify);
	}
	else
	{
		wait(time_or_notify);
	}
	single_func(self, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

/*
	Name: delay_notify
	Namespace: util
	Checksum: 0xCFD4EC9
	Offset: 0x2220
	Size: 0x34
	Parameters: 3
	Flags: Linked
*/
function delay_notify(time_or_notify, str_notify, str_endon)
{
	self thread _delay_notify(time_or_notify, str_notify, str_endon);
}

/*
	Name: _delay_notify
	Namespace: util
	Checksum: 0xC4312B05
	Offset: 0x2260
	Size: 0x8E
	Parameters: 3
	Flags: Linked
*/
function _delay_notify(time_or_notify, str_notify, str_endon)
{
	self endon(#"death");
	if(isdefined(str_endon))
	{
		self endon(str_endon);
	}
	if(ishash(time_or_notify) || isstring(time_or_notify))
	{
		self waittill(time_or_notify);
	}
	else
	{
		wait(time_or_notify);
	}
	self notify(str_notify);
}

/*
	Name: new_timer
	Namespace: util
	Checksum: 0xD07C3A5D
	Offset: 0x22F8
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function new_timer(n_timer_length)
{
	s_timer = spawnstruct();
	s_timer.n_time_created = gettime();
	s_timer.n_length = n_timer_length;
	return s_timer;
}

/*
	Name: get_time
	Namespace: util
	Checksum: 0x122E8749
	Offset: 0x2348
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function get_time()
{
	t_now = gettime();
	return t_now - self.n_time_created;
}

/*
	Name: get_time_in_seconds
	Namespace: util
	Checksum: 0x9DD1906E
	Offset: 0x2370
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function get_time_in_seconds()
{
	return float(get_time()) / 1000;
}

/*
	Name: get_time_frac
	Namespace: util
	Checksum: 0xE0FD9D49
	Offset: 0x23B0
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function get_time_frac(n_end_time)
{
	if(!isdefined(n_end_time))
	{
		n_end_time = self.n_length;
	}
	return lerpfloat(0, 1, get_time_in_seconds() / n_end_time);
}

/*
	Name: get_time_left
	Namespace: util
	Checksum: 0xDF4D558B
	Offset: 0x2408
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function get_time_left()
{
	if(isdefined(self.n_length))
	{
		n_current_time = get_time_in_seconds();
		return max(self.n_length - n_current_time, 0);
	}
	return -1;
}

/*
	Name: is_time_left
	Namespace: util
	Checksum: 0xC69A785
	Offset: 0x2468
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function is_time_left()
{
	return get_time_left() != 0;
}

/*
	Name: timer_wait
	Namespace: util
	Checksum: 0x96E5F287
	Offset: 0x2488
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function timer_wait(n_wait)
{
	if(isdefined(self.n_length))
	{
		n_wait = min(n_wait, get_time_left());
	}
	wait(n_wait);
	n_current_time = get_time_in_seconds();
	return n_current_time;
}

/*
	Name: add_remove_list
	Namespace: util
	Checksum: 0xA7ACAE9E
	Offset: 0x24F8
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function add_remove_list(&a, on_off)
{
	if(!isdefined(a))
	{
		a = [];
	}
	if(on_off)
	{
		if(!isinarray(a, self))
		{
			arrayinsert(a, self, a.size);
		}
	}
	else
	{
		arrayremovevalue(a, self, 0);
	}
}

/*
	Name: clean_deleted
	Namespace: util
	Checksum: 0x91C92492
	Offset: 0x2588
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function clean_deleted(&array)
{
	arrayremovevalue(array, undefined);
}

/*
	Name: get_eye
	Namespace: util
	Checksum: 0x9C00FA17
	Offset: 0x25B8
	Size: 0xE2
	Parameters: 0
	Flags: None
*/
function get_eye()
{
	if(sessionmodeiscampaigngame())
	{
		if(isplayer(self))
		{
			linked_ent = self getlinkedent();
			if(isdefined(linked_ent) && getdvarint(#"cg_camerausetagcamera", 0) > 0)
			{
				camera = linked_ent gettagorigin("tag_camera");
				if(isdefined(camera))
				{
					return camera;
				}
			}
		}
	}
	pos = self geteye();
	return pos;
}

/*
	Name: spawn_player_arms
	Namespace: util
	Checksum: 0x857AA822
	Offset: 0x26A8
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function spawn_player_arms()
{
	arms = spawn(self getlocalclientnumber(), self.origin + (vectorscale((0, 0, -1), 1000)), "script_model");
	if(isdefined(level.player_viewmodel))
	{
		arms setmodel(level.player_viewmodel);
	}
	else
	{
		arms setmodel(#"c_usa_cia_masonjr_viewhands");
	}
	return arms;
}

/*
	Name: lerp_dvar
	Namespace: util
	Checksum: 0x3244FA21
	Offset: 0x2760
	Size: 0x126
	Parameters: 7
	Flags: None
*/
function lerp_dvar(str_dvar, n_start_val, n_end_val, n_lerp_time, b_saved_dvar, b_client_dvar, n_client)
{
	if(!isdefined(n_lerp_time))
	{
		n_lerp_time = getdvarfloat(n_end_val, 0);
	}
	s_timer = new_timer();
	do
	{
		n_time_delta = s_timer timer_wait(0.01666);
		n_curr_val = lerpfloat(n_lerp_time, b_saved_dvar, n_time_delta / b_client_dvar);
		if(is_true(n_client))
		{
			setsaveddvar(n_end_val, n_curr_val);
		}
		else
		{
			setdvar(n_end_val, n_curr_val);
		}
	}
	while(n_time_delta < b_client_dvar);
}

/*
	Name: is_valid_type_for_callback
	Namespace: util
	Checksum: 0x8E73C595
	Offset: 0x2890
	Size: 0xEA
	Parameters: 1
	Flags: None
*/
function is_valid_type_for_callback(type)
{
	switch(type)
	{
		case "scriptmover":
		case "na":
		case "missile":
		case "general":
		case "player":
		case "turret":
		case "actor":
		case "helicopter":
		case "trigger":
		case "vehicle":
		case "plane":
		{
			return true;
		}
		default:
		{
			return false;
		}
	}
}

/*
	Name: wait_till_not_touching
	Namespace: util
	Checksum: 0x3B3DC981
	Offset: 0x2988
	Size: 0xA8
	Parameters: 2
	Flags: None
*/
function wait_till_not_touching(e_to_check, e_to_touch)
{
	/#
		assert(isdefined(e_to_check), "");
	#/
	/#
		assert(isdefined(e_to_touch), "");
	#/
	e_to_check endon(#"death");
	e_to_touch endon(#"death");
	while(e_to_check istouching(e_to_touch))
	{
		waitframe(1);
	}
}

/*
	Name: error
	Namespace: util
	Checksum: 0x5E816492
	Offset: 0x2A38
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function error(message)
{
	/#
		println("", message);
		waitframe(1);
	#/
}

/*
	Name: register_system
	Namespace: util
	Checksum: 0xF3C5AAFC
	Offset: 0x2A78
	Size: 0xDA
	Parameters: 2
	Flags: Linked
*/
function register_system(ssysname, cbfunc)
{
	if(!isdefined(level._systemstates))
	{
		level._systemstates = [];
	}
	if(level._systemstates.size >= 32)
	{
		/#
			error("");
		#/
		return;
	}
	if(isdefined(level._systemstates[ssysname]))
	{
		/#
			error("" + ssysname);
		#/
		return;
	}
	level._systemstates[ssysname] = spawnstruct();
	level._systemstates[ssysname].callback = cbfunc;
}

/*
	Name: field_set_lighting_ent
	Namespace: util
	Checksum: 0x73661DAD
	Offset: 0x2B60
	Size: 0x48
	Parameters: 7
	Flags: Linked
*/
function field_set_lighting_ent(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.light_entity = self;
}

/*
	Name: field_use_lighting_ent
	Namespace: util
	Checksum: 0xCF32BADA
	Offset: 0x2BB0
	Size: 0x3C
	Parameters: 7
	Flags: Linked
*/
function field_use_lighting_ent(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

/*
	Name: waittill_dobj
	Namespace: util
	Checksum: 0x8F05464B
	Offset: 0x2BF8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function waittill_dobj(localclientnum)
{
	while(isdefined(self) && !self hasdobj(localclientnum))
	{
		waitframe(1);
	}
}

/*
	Name: playfxontag
	Namespace: util
	Checksum: 0xB32FFFA2
	Offset: 0x2C40
	Size: 0x6E
	Parameters: 4
	Flags: Linked
*/
function playfxontag(localclientnum, effect, entity, tagname)
{
	if(isdefined(entity) && entity hasdobj(localclientnum) && isdefined(effect))
	{
		return function_239993de(localclientnum, effect, entity, tagname);
	}
	return undefined;
}

/*
	Name: function_6d0694af
	Namespace: util
	Checksum: 0x5C52B316
	Offset: 0x2CB8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_6d0694af()
{
	while(isdefined(self) && !self function_700ca4f5())
	{
		waitframe(1);
	}
}

/*
	Name: server_wait
	Namespace: util
	Checksum: 0xFB481C72
	Offset: 0x2CF8
	Size: 0x174
	Parameters: 4
	Flags: Linked
*/
function server_wait(localclientnum, seconds, waitbetweenchecks, level_endon)
{
	if(isdefined(level_endon))
	{
		level endon(level_endon);
	}
	if(seconds != 0 && isdemoplaying())
	{
		if(!isdefined(waitbetweenchecks))
		{
			waitbetweenchecks = 0.2;
		}
		waitcompletedsuccessfully = 0;
		starttime = getservertime(0);
		lasttime = starttime;
		endtime = starttime + (int(seconds * 1000));
		while(getservertime(0) < endtime && getservertime(0) >= lasttime)
		{
			lasttime = getservertime(0);
			wait(waitbetweenchecks);
		}
		if(lasttime < getservertime(0))
		{
			waitcompletedsuccessfully = 1;
		}
	}
	else
	{
		wait(seconds);
		waitcompletedsuccessfully = 1;
	}
	return waitcompletedsuccessfully;
}

/*
	Name: get_other_team
	Namespace: util
	Checksum: 0x3F70FE04
	Offset: 0x2E78
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function get_other_team(str_team)
{
	if(str_team == #"allies")
	{
		return #"axis";
	}
	if(str_team == #"axis")
	{
		return #"allies";
	}
	return #"allies";
}

/*
	Name: function_fbce7263
	Namespace: util
	Checksum: 0xD916FA6A
	Offset: 0x2F10
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function function_fbce7263(team_a, team_b)
{
	if(team_a === team_b)
	{
		return false;
	}
	if(!isdefined(team_a) || !isdefined(team_b))
	{
		return true;
	}
	return true;
}

/*
	Name: isenemyteam
	Namespace: util
	Checksum: 0xF9F568FE
	Offset: 0x2F60
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function isenemyteam(team)
{
	return function_fbce7263(team, self.team);
}

/*
	Name: isenemyplayer
	Namespace: util
	Checksum: 0xACB12512
	Offset: 0x2F98
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function isenemyplayer(player)
{
	/#
		assert(isdefined(player));
	#/
	if(!isplayer(player))
	{
		return false;
	}
	if(player.team != #"none")
	{
		if(player.team === self.team)
		{
			return false;
		}
	}
	else if(player == self)
	{
		return false;
	}
	return true;
}

/*
	Name: function_50ed1561
	Namespace: util
	Checksum: 0xCE56922C
	Offset: 0x3038
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function function_50ed1561(localclientnum)
{
	function_89a98f85();
	if(!isdefined(self))
	{
		return false;
	}
	if(!self function_21c0fa55())
	{
		return false;
	}
	if(function_65b9eb0f(localclientnum))
	{
		return false;
	}
	if(localclientnum !== self getlocalclientnumber())
	{
		return false;
	}
	if(isdefined(level.localplayers[localclientnum]) && self getentitynumber() != level.localplayers[localclientnum] getentitynumber())
	{
		return false;
	}
	return true;
}

/*
	Name: is_player_view_linked_to_entity
	Namespace: util
	Checksum: 0xA7EED6D
	Offset: 0x3118
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function is_player_view_linked_to_entity(localclientnum)
{
	if(function_fd3d58c7(localclientnum))
	{
		return true;
	}
	if(function_e75c64a4(localclientnum))
	{
		return true;
	}
	return false;
}

/*
	Name: get_start_time
	Namespace: util
	Checksum: 0x1C10B266
	Offset: 0x3170
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function get_start_time()
{
	return getmicrosecondsraw();
}

/*
	Name: note_elapsed_time
	Namespace: util
	Checksum: 0x3FECDEA3
	Offset: 0x3190
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function note_elapsed_time(start_time, label)
{
	if(!isdefined(label))
	{
		label = "unspecified";
	}
	/#
		elapsed_time = get_elapsed_time(start_time, getmicrosecondsraw());
		if(!isdefined(start_time))
		{
			return;
		}
		elapsed_time = elapsed_time * 0.001;
		msg = ((label + "") + elapsed_time) + "";
		profileprintln(msg);
		iprintlnbold(msg);
	#/
}

/*
	Name: function_d11b3582
	Namespace: util
	Checksum: 0xAF52B0A8
	Offset: 0x3260
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_d11b3582(var_43692bd4, label)
{
	if(!isdefined(label))
	{
		label = "unspecified";
	}
	/#
		if(!isdefined(var_43692bd4))
		{
			return;
		}
		elapsed_time = var_43692bd4 * 0.001;
		msg = ((label + "") + elapsed_time) + "";
		profileprintln(msg);
		iprintlnbold(msg);
	#/
}

/*
	Name: record_elapsed_time
	Namespace: util
	Checksum: 0xBC44F2E7
	Offset: 0x3310
	Size: 0x92
	Parameters: 2
	Flags: Linked
*/
function record_elapsed_time(start_time, &elapsed_time_array)
{
	elapsed_time = get_elapsed_time(start_time, getmicrosecondsraw());
	if(!isdefined(elapsed_time_array))
	{
		elapsed_time_array = [];
	}
	else if(!isarray(elapsed_time_array))
	{
		elapsed_time_array = array(elapsed_time_array);
	}
	elapsed_time_array[elapsed_time_array.size] = elapsed_time;
}

/*
	Name: note_elapsed_times
	Namespace: util
	Checksum: 0x11D28288
	Offset: 0x33B0
	Size: 0x1B4
	Parameters: 2
	Flags: Linked
*/
function note_elapsed_times(&elapsed_time_array, label)
{
	if(!isdefined(label))
	{
		label = "unspecified";
	}
	/#
		if(!isarray(elapsed_time_array))
		{
			return;
		}
		if(elapsed_time_array.size == 0)
		{
			return;
		}
		total_elapsed_time = 0;
		smallest_elapsed_time = 2147483647;
		largest_elapsed_time = 0;
		foreach(elapsed_time in elapsed_time_array)
		{
			elapsed_time = elapsed_time * 0.001;
			total_elapsed_time = total_elapsed_time + elapsed_time;
			if(elapsed_time < smallest_elapsed_time)
			{
				smallest_elapsed_time = elapsed_time;
			}
			if(elapsed_time > largest_elapsed_time)
			{
				largest_elapsed_time = elapsed_time;
			}
		}
		average_elapsed_time = total_elapsed_time / elapsed_time_array.size;
		msg = ((((((label + "") + smallest_elapsed_time) + "") + average_elapsed_time) + "") + largest_elapsed_time) + "";
		profileprintln(msg);
		iprintlnbold(msg);
	#/
}

/*
	Name: function_53966f9c
	Namespace: util
	Checksum: 0x372C5ADD
	Offset: 0x3570
	Size: 0x144
	Parameters: 4
	Flags: None
*/
function function_53966f9c(&elapsed_time_array, label, var_5461755f, reset_count)
{
	if(!isdefined(label))
	{
		label = "unspecified";
	}
	if(!isdefined(var_5461755f))
	{
		var_5461755f = 10;
	}
	if(!isdefined(reset_count))
	{
		reset_count = 100;
	}
	/#
		if((elapsed_time_array.size % var_5461755f) == 0)
		{
			note_elapsed_times(elapsed_time_array, label);
		}
		if(elapsed_time_array.size >= reset_count)
		{
			keys = getarraykeys(elapsed_time_array);
			foreach(key in keys)
			{
				elapsed_time_array[key] = undefined;
			}
			arrayremovevalue(elapsed_time_array, undefined);
		}
	#/
}

/*
	Name: get_elapsed_time
	Namespace: util
	Checksum: 0x33A7FB57
	Offset: 0x36C0
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function get_elapsed_time(start_time, end_time)
{
	if(!isdefined(end_time))
	{
		end_time = getmicrosecondsraw();
	}
	if(!isdefined(start_time))
	{
		return undefined;
	}
	elapsed_time = end_time - start_time;
	if(elapsed_time < 0)
	{
		elapsed_time = elapsed_time + -2147483648;
	}
	return elapsed_time;
}

/*
	Name: init_utility
	Namespace: util
	Checksum: 0xD7551D4
	Offset: 0x3738
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function init_utility()
{
	level.isdemoplaying = isdemoplaying();
	level.localplayers = [];
	level.numgametypereservedobjectives = [];
	level.releasedobjectives = [];
	maxlocalclients = getmaxlocalclients();
	for(localclientnum = 0; localclientnum < maxlocalclients; localclientnum++)
	{
		level.releasedobjectives[localclientnum] = [];
		level.numgametypereservedobjectives[localclientnum] = 0;
	}
	waitforclient(0);
	level.localplayers = getlocalplayers();
}

/*
	Name: within_fov
	Namespace: util
	Checksum: 0xADFF3766
	Offset: 0x3810
	Size: 0x8C
	Parameters: 4
	Flags: Linked
*/
function within_fov(start_origin, start_angles, end_origin, fov)
{
	normal = vectornormalize(end_origin - start_origin);
	forward = anglestoforward(start_angles);
	dot = vectordot(forward, normal);
	return dot >= fov;
}

/*
	Name: is_mature
	Namespace: util
	Checksum: 0xC4D60A58
	Offset: 0x38A8
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function is_mature()
{
	return ismaturecontentenabled();
}

/*
	Name: function_fa1da5cb
	Namespace: util
	Checksum: 0x8589C68F
	Offset: 0x38C8
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function function_fa1da5cb()
{
	return isshowbloodenabled();
}

/*
	Name: function_2c435484
	Namespace: util
	Checksum: 0xC141C168
	Offset: 0x38E8
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function function_2c435484()
{
	return function_4e803413();
}

/*
	Name: is_gib_restricted_build
	Namespace: util
	Checksum: 0x4CB9B271
	Offset: 0x3908
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function is_gib_restricted_build()
{
	if(!(ismaturecontentenabled() && isshowgibsenabled()))
	{
		return true;
	}
	return false;
}

/*
	Name: function_cd6c95db
	Namespace: util
	Checksum: 0xD9BEDA47
	Offset: 0x3948
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_cd6c95db(localclientnum)
{
	return function_d6e37bb1(localclientnum);
}

/*
	Name: function_a0819fe3
	Namespace: util
	Checksum: 0xE5711503
	Offset: 0x3978
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_a0819fe3(localclientnum)
{
	return colorblindmode(localclientnum);
}

/*
	Name: function_f5b24d2d
	Namespace: util
	Checksum: 0x5C2FB69F
	Offset: 0x39A8
	Size: 0x2F4
	Parameters: 4
	Flags: None
*/
function function_f5b24d2d(localclientnum, entity, var_d0ada253, state)
{
	entity function_78233d29(var_d0ada253, "", #"hash_6ecae9ba3282976b", 0);
	teamcolor = (1, 1, 1);
	if(state == 1 || state == 4 || state == 6)
	{
		teamcolor = getteamcolor(localclientnum, #"allies", 1);
	}
	else
	{
		if(state == 2 || state == 5 || state == 7)
		{
			teamcolor = getteamcolor(localclientnum, #"axis", 1);
		}
		else if(state == 3)
		{
			teamcolor = getteamcolor(localclientnum, #"axis", 1);
			if(isdefined(teamcolor))
			{
				entity function_78233d29(var_d0ada253, "", #"hash_15e64a875216af23", teamcolor[0]);
				entity function_78233d29(var_d0ada253, "", #"hash_15e63d875216990c", teamcolor[1]);
				entity function_78233d29(var_d0ada253, "", #"hash_15e63a87521693f3", teamcolor[2]);
				entity function_78233d29(var_d0ada253, "", #"hash_6ecae9ba3282976b", 1);
			}
			teamcolor = getteamcolor(localclientnum, #"allies", 1);
		}
	}
	if(isdefined(teamcolor))
	{
		entity function_78233d29(var_d0ada253, "", #"hash_6be0f6c7665077c7", teamcolor[0]);
		entity function_78233d29(var_d0ada253, "", #"hash_6be0e1c766505418", teamcolor[1]);
		entity function_78233d29(var_d0ada253, "", #"hash_6be0e6c766505c97", teamcolor[2]);
		entity function_78233d29(var_d0ada253, "", #"hash_53eaa05730d4cddf", 1);
	}
}

/*
	Name: registersystem
	Namespace: util
	Checksum: 0xDB7ADF3A
	Offset: 0x3CA8
	Size: 0xDA
	Parameters: 2
	Flags: None
*/
function registersystem(ssysname, cbfunc)
{
	if(!isdefined(level._systemstates))
	{
		level._systemstates = [];
	}
	if(level._systemstates.size >= 32)
	{
		/#
			error("");
		#/
		return;
	}
	if(isdefined(level._systemstates[ssysname]))
	{
		/#
			error("" + ssysname);
		#/
		return;
	}
	level._systemstates[ssysname] = spawnstruct();
	level._systemstates[ssysname].callback = cbfunc;
}

/*
	Name: add_trigger_to_ent
	Namespace: util
	Checksum: 0xC46CFE79
	Offset: 0x3D90
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function add_trigger_to_ent(ent, trig)
{
	if(!isdefined(ent._triggers))
	{
		ent._triggers = [];
	}
	ent._triggers[trig getentitynumber()] = 1;
}

/*
	Name: remove_trigger_from_ent
	Namespace: util
	Checksum: 0x21D3D932
	Offset: 0x3DE8
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function remove_trigger_from_ent(ent, trig)
{
	if(!isdefined(ent._triggers))
	{
		return;
	}
	if(!isdefined(ent._triggers[trig getentitynumber()]))
	{
		return;
	}
	ent._triggers[trig getentitynumber()] = 0;
}

/*
	Name: ent_already_in_trigger
	Namespace: util
	Checksum: 0xE2332150
	Offset: 0x3E60
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function ent_already_in_trigger(trig)
{
	if(!isdefined(self._triggers))
	{
		return false;
	}
	if(!isdefined(self._triggers[trig getentitynumber()]))
	{
		return false;
	}
	if(!self._triggers[trig getentitynumber()])
	{
		return false;
	}
	return true;
}

/*
	Name: trigger_thread
	Namespace: util
	Checksum: 0xEFABC8FB
	Offset: 0x3ED8
	Size: 0xF4
	Parameters: 3
	Flags: None
*/
function trigger_thread(ent, on_enter_payload, on_exit_payload)
{
	ent endon(#"death");
	if(ent ent_already_in_trigger(self))
	{
		return;
	}
	add_trigger_to_ent(ent, self);
	if(isdefined(on_enter_payload))
	{
		[[on_enter_payload]](ent);
	}
	while(isdefined(ent) && ent istouching(self))
	{
		waitframe(1);
	}
	if(isdefined(ent) && isdefined(on_exit_payload))
	{
		[[on_exit_payload]](ent);
	}
	if(isdefined(ent))
	{
		remove_trigger_from_ent(ent, self);
	}
}

/*
	Name: local_player_trigger_thread_always_exit
	Namespace: util
	Checksum: 0x528DEF8D
	Offset: 0x3FD8
	Size: 0xEC
	Parameters: 3
	Flags: None
*/
function local_player_trigger_thread_always_exit(ent, on_enter_payload, on_exit_payload)
{
	if(ent ent_already_in_trigger(self))
	{
		return;
	}
	add_trigger_to_ent(ent, self);
	if(isdefined(on_enter_payload))
	{
		[[on_enter_payload]](ent);
	}
	while(isdefined(ent) && ent istouching(self) && ent issplitscreenhost())
	{
		waitframe(1);
	}
	if(isdefined(on_exit_payload))
	{
		[[on_exit_payload]](ent);
	}
	if(isdefined(ent))
	{
		remove_trigger_from_ent(ent, self);
	}
}

/*
	Name: local_player_entity_thread
	Namespace: util
	Checksum: 0x7AE2696F
	Offset: 0x40D0
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function local_player_entity_thread(localclientnum, entity, func, arg1, arg2, arg3, arg4)
{
	entity endon(#"death");
	entity waittill_dobj(localclientnum);
	single_thread(entity, func, localclientnum, arg1, arg2, arg3, arg4);
}

/*
	Name: local_players_entity_thread
	Namespace: util
	Checksum: 0xE0B297DC
	Offset: 0x4168
	Size: 0x94
	Parameters: 6
	Flags: None
*/
function local_players_entity_thread(entity, func, arg1, arg2, arg3, arg4)
{
	players = level.localplayers;
	for(i = 0; i < players.size; i++)
	{
		players[i] thread local_player_entity_thread(i, entity, func, arg1, arg2, arg3, arg4);
	}
}

/*
	Name: debug_line
	Namespace: util
	Checksum: 0xDA9B2D27
	Offset: 0x4208
	Size: 0xB4
	Parameters: 4
	Flags: None
*/
function debug_line(from, to, color, time)
{
	/#
		level.debug_line = getdvarint(#"scr_debug_line", 0);
		if(isdefined(level.debug_line) && level.debug_line == 1)
		{
			if(!isdefined(time))
			{
				time = 1000;
			}
			line(from, to, color, 1, 1, time);
		}
	#/
}

/*
	Name: debug_star
	Namespace: util
	Checksum: 0xCBD552EA
	Offset: 0x42C8
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function debug_star(origin, color, time)
{
	/#
		level.debug_star = getdvarint(#"scr_debug_star", 0);
		if(isdefined(level.debug_star) && level.debug_star == 1)
		{
			if(!isdefined(time))
			{
				time = 1000;
			}
			if(!isdefined(color))
			{
				color = (1, 1, 1);
			}
			debugstar(origin, time, color);
		}
	#/
}

/*
	Name: getnextobjid
	Namespace: util
	Checksum: 0x51168A6B
	Offset: 0x4380
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function getnextobjid(localclientnum)
{
	nextid = 0;
	if(!isdefined(level.releasedobjectives) || !isdefined(level.releasedobjectives[localclientnum]))
	{
		return nextid;
	}
	if(level.releasedobjectives[localclientnum].size > 0)
	{
		nextid = level.releasedobjectives[localclientnum][level.releasedobjectives[localclientnum].size - 1];
		level.releasedobjectives[localclientnum][level.releasedobjectives[localclientnum].size - 1] = undefined;
	}
	else
	{
		nextid = level.numgametypereservedobjectives[localclientnum];
		level.numgametypereservedobjectives[localclientnum]++;
	}
	/#
		if(nextid > 31)
		{
			println("");
		}
	#/
	if(nextid > 31)
	{
		nextid = 31;
	}
	return nextid;
}

/*
	Name: releaseobjid
	Namespace: util
	Checksum: 0xF51FD463
	Offset: 0x44A8
	Size: 0xA2
	Parameters: 2
	Flags: Linked
*/
function releaseobjid(localclientnum, objid)
{
	/#
		assert(objid < level.numgametypereservedobjectives[localclientnum]);
	#/
	for(i = 0; i < level.releasedobjectives[localclientnum].size; i++)
	{
		if(objid == level.releasedobjectives[localclientnum][i])
		{
			return;
		}
	}
	level.releasedobjectives[localclientnum][level.releasedobjectives[localclientnum].size] = objid;
}

/*
	Name: is_safehouse
	Namespace: util
	Checksum: 0xA17C5793
	Offset: 0x4558
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function is_safehouse(str_next_map)
{
	if(!isdefined(str_next_map))
	{
		str_next_map = get_map_name();
	}
	return false;
}

/*
	Name: button_held_think
	Namespace: util
	Checksum: 0xEEB02192
	Offset: 0x4588
	Size: 0x118
	Parameters: 1
	Flags: None
*/
function button_held_think(which_button)
{
	/#
		self endon(#"death");
		if(!isdefined(self._holding_button))
		{
			self._holding_button = [];
		}
		self._holding_button[which_button] = 0;
		time_started = 0;
		while(true)
		{
			if(self._holding_button[which_button])
			{
				if(!self [[level._button_funcs[which_button]]]())
				{
					self._holding_button[which_button] = 0;
				}
			}
			else
			{
				if(self [[level._button_funcs[which_button]]]())
				{
					if(time_started == 0)
					{
						time_started = gettime();
					}
					if(gettime() - time_started > 250)
					{
						self._holding_button[which_button] = 1;
					}
				}
				else if(time_started != 0)
				{
					time_started = 0;
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: init_button_wrappers
	Namespace: util
	Checksum: 0xA6589C5
	Offset: 0x46A8
	Size: 0x48
	Parameters: 0
	Flags: None
*/
function init_button_wrappers()
{
	/#
		if(!isdefined(level._button_funcs))
		{
			level._button_funcs[4] = &up_button_pressed;
			level._button_funcs[5] = &down_button_pressed;
		}
	#/
}

/*
	Name: up_button_held
	Namespace: util
	Checksum: 0x96AD8836
	Offset: 0x46F8
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function up_button_held()
{
	/#
		init_button_wrappers();
		if(!isdefined(self._up_button_think_threaded))
		{
			self thread button_held_think(4);
			self._up_button_think_threaded = 1;
		}
		return self._holding_button[4];
	#/
}

/*
	Name: down_button_held
	Namespace: util
	Checksum: 0x24041AEA
	Offset: 0x4768
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function down_button_held()
{
	/#
		init_button_wrappers();
		if(!isdefined(self._down_button_think_threaded))
		{
			self thread button_held_think(5);
			self._down_button_think_threaded = 1;
		}
		return self._holding_button[5];
	#/
}

/*
	Name: up_button_pressed
	Namespace: util
	Checksum: 0xA4237CE2
	Offset: 0x47D8
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function up_button_pressed()
{
	/#
		return self buttonpressed("") || self buttonpressed("");
	#/
}

/*
	Name: waittill_up_button_pressed
	Namespace: util
	Checksum: 0xE23A29BC
	Offset: 0x4828
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function waittill_up_button_pressed()
{
	/#
		while(!self up_button_pressed())
		{
			waitframe(1);
		}
	#/
}

/*
	Name: down_button_pressed
	Namespace: util
	Checksum: 0xF003F95D
	Offset: 0x4858
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function down_button_pressed()
{
	/#
		return self buttonpressed("") || self buttonpressed("");
	#/
}

/*
	Name: waittill_down_button_pressed
	Namespace: util
	Checksum: 0x5D60E45B
	Offset: 0x48A8
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function waittill_down_button_pressed()
{
	/#
		while(!self down_button_pressed())
		{
			waitframe(1);
		}
	#/
}

/*
	Name: function_4c1656d5
	Namespace: util
	Checksum: 0xE2AE4C57
	Offset: 0x48D8
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_4c1656d5()
{
	if(sessionmodeiswarzonegame())
	{
		return getdvarfloat(#"hash_4e7a02edee964bf9", 250);
	}
	return getdvarfloat(#"hash_4ec50cedeed64871", 250);
}

/*
	Name: function_16fb0a3b
	Namespace: util
	Checksum: 0x92F3B50D
	Offset: 0x4950
	Size: 0x122
	Parameters: 0
	Flags: Linked
*/
function function_16fb0a3b()
{
	if(sessionmodeiswarzonegame())
	{
		if(getdvarint(#"hash_23a1d3a9139af42b", 0) > 0)
		{
			return getdvarfloat(#"hash_608e7bb0e9517884", 250);
		}
		return getdvarfloat(#"hash_4e7a02edee964bf9", 250);
	}
	if(getdvarint(#"hash_23fac9a913e70c03", 0) > 0)
	{
		return getdvarfloat(#"hash_606c79b0e9348eb8", 250);
	}
	return getdvarfloat(#"hash_4ec50cedeed64871", 250);
}

/*
	Name: lerp_generic
	Namespace: util
	Checksum: 0x707CF482
	Offset: 0x4A80
	Size: 0x1F4
	Parameters: 4
	Flags: Linked, Variadic
*/
function lerp_generic(localclientnum, duration, callback, ...)
{
	localplayer = function_5c10bd79(localclientnum);
	if(!isdefined(localplayer))
	{
		return;
	}
	starttime = localplayer getclienttime();
	var_d183f050 = getservertime(localclientnum);
	currenttime = starttime;
	elapsedtime = 0;
	defaultargs = array(currenttime, elapsedtime, localclientnum, duration);
	args = arraycombine(defaultargs, vararg, 1, 0);
	while(elapsedtime < duration)
	{
		if(isdefined(callback))
		{
			args[0] = currenttime;
			args[1] = elapsedtime;
			_single_func(undefined, callback, args);
		}
		waitframe(1);
		localplayer = function_5c10bd79(localclientnum);
		if(!isdefined(localplayer))
		{
			return;
		}
		currenttime = localplayer getclienttime();
		var_5710f35c = getservertime(localclientnum);
		if(var_5710f35c < var_d183f050)
		{
			return;
		}
		elapsedtime = currenttime - starttime;
	}
	if(isdefined(callback))
	{
		args[0] = currenttime;
		args[1] = duration;
		_single_func(undefined, callback, args);
	}
}

/*
	Name: function_c16f65a3
	Namespace: util
	Checksum: 0x5DED24EA
	Offset: 0x4C80
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_c16f65a3(enemy_a, enemy_b)
{
	/#
		assert(enemy_a != enemy_b, "");
	#/
	level.team_enemy_mapping[enemy_a] = enemy_b;
	level.team_enemy_mapping[enemy_b] = enemy_a;
}

/*
	Name: function_73fab74d
	Namespace: util
	Checksum: 0xE7C34B50
	Offset: 0x4CE8
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_73fab74d()
{
	if(isdefined(level.var_1bbf77be))
	{
		return;
	}
	level.var_1bbf77be = 1;
	function_c16f65a3(#"allies", #"axis");
	function_c16f65a3(#"team3", #"any");
	set_team_mapping(#"allies", #"axis");
}

/*
	Name: cf_team_mapping
	Namespace: util
	Checksum: 0x5D25E55
	Offset: 0x4DA8
	Size: 0x122
	Parameters: 7
	Flags: Linked
*/
function cf_team_mapping(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 0:
		{
			set_team_mapping(#"axis", #"allies");
			break;
		}
		case 1:
		{
			set_team_mapping(#"allies", #"axis");
			break;
		}
		default:
		{
			set_team_mapping(#"allies", #"axis");
			break;
		}
	}
}

/*
	Name: preload_frontend
	Namespace: util
	Checksum: 0xCD4630BF
	Offset: 0x4ED8
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function preload_frontend(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		preloadfrontend();
	}
}

/*
	Name: set_team_mapping
	Namespace: util
	Checksum: 0x9693534D
	Offset: 0x4F40
	Size: 0x1A4
	Parameters: 2
	Flags: Linked
*/
function set_team_mapping(str_team_for_sidea, str_team_for_sideb)
{
	/#
		assert(str_team_for_sidea != str_team_for_sideb, "");
	#/
	level.team_mapping[#"sidea"] = str_team_for_sidea;
	level.team_mapping[#"sideb"] = str_team_for_sideb;
	level.team_mapping[#"attacker"] = str_team_for_sidea;
	level.team_mapping[#"defender"] = str_team_for_sideb;
	level.team_mapping[#"attackers"] = str_team_for_sidea;
	level.team_mapping[#"defenders"] = str_team_for_sideb;
	level.team_mapping[#"cia"] = #"allies";
	level.team_mapping[#"kgb"] = #"axis";
	level.team_mapping[#"teama"] = level.team_mapping[#"sidea"];
	level.team_mapping[#"teamb"] = level.team_mapping[#"sideb"];
	level.team_mapping[#"side3"] = #"team3";
}

/*
	Name: get_team_mapping
	Namespace: util
	Checksum: 0xF620206F
	Offset: 0x50F0
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function get_team_mapping(str_team)
{
	/#
		assert(isdefined(str_team));
	#/
	if(isdefined(level.team_mapping))
	{
		result = level.team_mapping[str_team];
		if(isdefined(result))
		{
			return result;
		}
	}
	return str_team;
}

/*
	Name: get_enemy_team
	Namespace: util
	Checksum: 0x3CFC6CB7
	Offset: 0x5160
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function get_enemy_team(team)
{
	team = get_team_mapping(team);
	if(!isdefined(team))
	{
		return undefined;
	}
	if(isdefined(level.team_enemy_mapping) && isdefined(level.team_enemy_mapping[team]))
	{
		return level.team_enemy_mapping[team];
	}
	return #"none";
}

/*
	Name: function_35aed314
	Namespace: util
	Checksum: 0xE84F6959
	Offset: 0x51E8
	Size: 0x132
	Parameters: 2
	Flags: None
*/
function function_35aed314(teama, teamb)
{
	teama = get_team_mapping(teama);
	teamb = get_team_mapping(teamb);
	if(!isdefined(teama) || !isdefined(teamb))
	{
		return false;
	}
	if(teama == teamb)
	{
		return false;
	}
	if(isdefined(level.team_enemy_mapping))
	{
		if(isdefined(level.team_enemy_mapping[teama]))
		{
			if(#"any" == level.team_enemy_mapping[teama])
			{
				return true;
			}
			if(teamb == level.team_enemy_mapping[teama])
			{
				return true;
			}
		}
		if(isdefined(level.team_enemy_mapping[teamb]))
		{
			if(#"any" == level.team_enemy_mapping[teamb])
			{
				return true;
			}
			if(teama == level.team_enemy_mapping[teamb])
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: is_on_side
	Namespace: util
	Checksum: 0x1B18191D
	Offset: 0x5328
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function is_on_side(str_team)
{
	return self.team === get_team_mapping(str_team);
}

/*
	Name: get_game_type
	Namespace: util
	Checksum: 0x9C66B41D
	Offset: 0x5358
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function get_game_type()
{
	return tolower(getdvarstring(#"g_gametype"));
}

/*
	Name: get_map_name
	Namespace: util
	Checksum: 0x3E916B60
	Offset: 0x5398
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function get_map_name()
{
	return tolower(getdvarstring(#"sv_mapname"));
}

/*
	Name: is_frontend_map
	Namespace: util
	Checksum: 0x464C1227
	Offset: 0x53D8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function is_frontend_map()
{
	return get_map_name() === "core_frontend";
}

/*
	Name: function_26489405
	Namespace: util
	Checksum: 0xEA6CC513
	Offset: 0x5400
	Size: 0x76
	Parameters: 0
	Flags: None
*/
function function_26489405()
{
	isnightmap = 0;
	mapname = get_map_name();
	switch(mapname)
	{
		case "mp_casino":
		{
			isnightmap = 1;
			break;
		}
		default:
		{
			break;
		}
	}
	return isnightmap;
}

/*
	Name: is_arena_lobby
	Namespace: util
	Checksum: 0x52CB04A1
	Offset: 0x5480
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function is_arena_lobby()
{
	mode = function_bea73b01();
	if(mode == 3)
	{
		return true;
	}
	return false;
}

/*
	Name: function_e387bcd
	Namespace: util
	Checksum: 0x1BEAE8BB
	Offset: 0x54C0
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function function_e387bcd()
{
	if(!isdefined(self))
	{
		return false;
	}
	if(isdefined(self.script_wait))
	{
		return true;
	}
	if(isdefined(self.script_wait_add))
	{
		return true;
	}
	if(isdefined(self.script_wait_min))
	{
		return true;
	}
	if(isdefined(self.script_wait_max))
	{
		return true;
	}
	return false;
}

/*
	Name: function_4b93f9c2
	Namespace: util
	Checksum: 0x224C612A
	Offset: 0x5528
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_4b93f9c2()
{
	result = 0;
	if(isdefined(self.script_wait))
	{
		result = result + self.script_wait;
	}
	n_min = (isdefined(self.script_wait_min) ? self.script_wait_min : 0);
	n_max = (isdefined(self.script_wait_max) ? self.script_wait_max : 0);
	if(n_max > n_min)
	{
		result = result + randomfloatrange(n_min, n_max);
	}
	else if(n_min > 0)
	{
		result = result + n_min;
	}
	return result;
}

/*
	Name: script_wait
	Namespace: util
	Checksum: 0x20F8C668
	Offset: 0x55F0
	Size: 0x15A
	Parameters: 0
	Flags: None
*/
function script_wait()
{
	n_time = gettime();
	if(isdefined(self.script_wait))
	{
		wait(self.script_wait);
		if(isdefined(self.script_wait_add))
		{
			self.script_wait = self.script_wait + self.script_wait_add;
		}
	}
	n_min = (isdefined(self.script_wait_min) ? self.script_wait_min : 0);
	n_max = (isdefined(self.script_wait_max) ? self.script_wait_max : 0);
	if(n_max > n_min)
	{
		wait(randomfloatrange(n_min, n_max));
		self.script_wait_min = self.script_wait_min + (isdefined(self.script_wait_add) ? self.script_wait_add : 0);
		self.script_wait_max = self.script_wait_max + (isdefined(self.script_wait_add) ? self.script_wait_add : 0);
	}
	else if(n_min > 0)
	{
		wait(n_min);
		self.script_wait_min = self.script_wait_min + (isdefined(self.script_wait_add) ? self.script_wait_add : 0);
	}
	return gettime() - n_time;
}

/*
	Name: lock_model
	Namespace: util
	Checksum: 0xE6AD423B
	Offset: 0x5758
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function lock_model(model)
{
	if(isdefined(model))
	{
		if(!isdefined(level.model_locks))
		{
			level.model_locks = [];
		}
		if(!isdefined(level.model_locks[model]))
		{
			level.model_locks[model] = 0;
		}
		if(level.model_locks[model] < 1)
		{
			forcestreamxmodel(model);
		}
		level.model_locks[model]++;
	}
}

/*
	Name: unlock_model
	Namespace: util
	Checksum: 0x330EBA07
	Offset: 0x57F8
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function unlock_model(model)
{
	if(!isdefined(level.model_locks))
	{
		level.model_locks = [];
	}
	if(isdefined(model) && isdefined(level.model_locks[model]))
	{
		if(level.model_locks[model] > 0)
		{
			level.model_locks[model]--;
			if(level.model_locks[model] < 1)
			{
				stopforcestreamingxmodel(model);
			}
		}
	}
}

/*
	Name: function_48e57e36
	Namespace: util
	Checksum: 0x73FE9EE2
	Offset: 0x58A0
	Size: 0x1C6
	Parameters: 1
	Flags: Linked
*/
function function_48e57e36(var_1f1d12d8)
{
	base = 1;
	decimal = 0;
	for(i = var_1f1d12d8.size - 1; i >= 0; i--)
	{
		if(var_1f1d12d8[i] >= "0" && var_1f1d12d8[i] <= "9")
		{
			decimal = decimal + (int(var_1f1d12d8[i]) * base);
			base = base * 16;
			continue;
		}
		if(var_1f1d12d8[i] >= "a" && var_1f1d12d8[i] <= "f")
		{
			if(var_1f1d12d8[i] == "a")
			{
				number = 10;
			}
			else
			{
				if(var_1f1d12d8[i] == "b")
				{
					number = 11;
				}
				else
				{
					if(var_1f1d12d8[i] == "c")
					{
						number = 12;
					}
					else
					{
						if(var_1f1d12d8[i] == "d")
						{
							number = 13;
						}
						else
						{
							if(var_1f1d12d8[i] == "e")
							{
								number = 14;
							}
							else if(var_1f1d12d8[i] == "f")
							{
								number = 15;
							}
						}
					}
				}
			}
			decimal = decimal + (number * base);
			base = base * 16;
		}
	}
	return decimal;
}

/*
	Name: add_devgui
	Namespace: util
	Checksum: 0xA7071862
	Offset: 0x5A70
	Size: 0x5C
	Parameters: 3
	Flags: None
*/
function add_devgui(localclientnum, menu_path, commands)
{
	/#
		adddebugcommand(localclientnum, ((("" + menu_path) + "") + commands) + "");
	#/
}

/*
	Name: remove_devgui
	Namespace: util
	Checksum: 0x7F3D554A
	Offset: 0x5AD8
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function remove_devgui(localclientnum, menu_path)
{
	/#
		adddebugcommand(localclientnum, ("" + menu_path) + "");
	#/
}

/*
	Name: function_b5338ccb
	Namespace: util
	Checksum: 0x6179BC58
	Offset: 0x5B28
	Size: 0x9E
	Parameters: 2
	Flags: Linked
*/
function function_b5338ccb(value, deadzone)
{
	if(!isdefined(deadzone))
	{
		deadzone = 0.2;
	}
	/#
		assert(deadzone < 1);
	#/
	if(abs(value) < deadzone)
	{
		return 0;
	}
	return (value - (deadzone * math::sign(value))) / (1 - deadzone);
}

/*
	Name: function_63320ea1
	Namespace: util
	Checksum: 0x1F5A502D
	Offset: 0x5BD0
	Size: 0xAC
	Parameters: 3
	Flags: Linked
*/
function function_63320ea1(vector, deadzone, var_edfc4672)
{
	if(!isdefined(var_edfc4672))
	{
		var_edfc4672 = 0;
	}
	if(var_edfc4672)
	{
		return (function_b5338ccb(vector[0], deadzone), function_b5338ccb(vector[1], deadzone), 0);
	}
	return vectornormalize(vector) * function_b5338ccb(length(vector), deadzone);
}

/*
	Name: function_5ff170ee
	Namespace: util
	Checksum: 0x6015701
	Offset: 0x5C88
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_5ff170ee()
{
	setdvar(#"hash_19b5d46719678445", 0);
}

/*
	Name: function_8d617b62
	Namespace: util
	Checksum: 0xB80C6238
	Offset: 0x5CB8
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function function_8d617b62(color, stops)
{
	setdvar(#"hash_19b5d46719678445", 1);
	setdvar(#"r_suncolor", color);
	setdvar(#"hash_4feb70b947048229", stops);
}

/*
	Name: function_21aef83c
	Namespace: util
	Checksum: 0x489CCC6A
	Offset: 0x5D40
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_21aef83c()
{
	setdvar(#"hash_51a850dd61ea465b", 500);
	setdvar(#"hash_6f9f3341a7820247", 0);
}

/*
	Name: function_8eb5d4b0
	Namespace: util
	Checksum: 0xE45577C8
	Offset: 0x5DA0
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function function_8eb5d4b0(var_b5b0042e, var_aba8f86c)
{
	setdvar(#"hash_51a850dd61ea465b", var_b5b0042e);
	setdvar(#"hash_6f9f3341a7820247", var_aba8f86c);
}

/*
	Name: function_3ec868ea
	Namespace: util
	Checksum: 0xC365F8EA
	Offset: 0x5E00
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_3ec868ea(localclientnum, var_7bb490d6)
{
	if(!isdefined(var_7bb490d6))
	{
		var_7bb490d6 = 1;
	}
	return function_6593be12(localclientnum, var_7bb490d6) / 100;
}

/*
	Name: function_ca4b4e19
	Namespace: util
	Checksum: 0xEBDB152D
	Offset: 0x5E50
	Size: 0x1EC
	Parameters: 3
	Flags: None
*/
function function_ca4b4e19(localclientnum, var_b5338ccb, var_7bb490d6)
{
	if(!isdefined(var_b5338ccb))
	{
		var_b5338ccb = 1;
	}
	if(!isdefined(var_7bb490d6))
	{
		var_7bb490d6 = 1;
	}
	input = [];
	if(!gamepadusedlast(localclientnum))
	{
		input[#"look"] = function_3ec868ea(localclientnum, var_7bb490d6);
		loc_00005F38:
		input[#"move"] = ((function_31480f62(localclientnum, 76) ? 1 : (function_31480f62(localclientnum, 75) ? -1 : 0)), (function_31480f62(localclientnum, 73) ? 1 : (function_31480f62(localclientnum, 74) ? -1 : 0)), 0);
	}
	else
	{
		input = self function_b8e6d95c();
		if(var_b5338ccb)
		{
			input[#"look"] = function_63320ea1(input[#"look"]);
			input[#"move"] = function_63320ea1(input[#"move"]);
		}
	}
	return input;
}

/*
	Name: function_11f127f0
	Namespace: util
	Checksum: 0x665DF9D5
	Offset: 0x6048
	Size: 0x32
	Parameters: 2
	Flags: Linked
*/
function function_11f127f0(localclientnum, var_b5338ccb)
{
	return function_3bb62fcf(localclientnum, 1, var_b5338ccb);
}

/*
	Name: function_17bf631a
	Namespace: util
	Checksum: 0x78D603E5
	Offset: 0x6088
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function function_17bf631a(localclientnum, var_b5338ccb)
{
	return function_3bb62fcf(localclientnum, 0, var_b5338ccb);
}

/*
	Name: function_3bb62fcf
	Namespace: util
	Checksum: 0x94435218
	Offset: 0x60C0
	Size: 0x16C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_3bb62fcf(localclientnum, var_89c3fd26, var_b5338ccb)
{
	if(!isdefined(var_89c3fd26))
	{
		var_89c3fd26 = 1;
	}
	if(!isdefined(var_b5338ccb))
	{
		var_b5338ccb = 1;
	}
	input = getcontrollerposition(localclientnum);
	var_2e35e6c1 = (0, 0, 0);
	if(var_89c3fd26)
	{
		var_2e35e6c1 = input[#"rightstick"];
	}
	else
	{
		var_2e35e6c1 = input[#"leftstick"];
	}
	if(var_b5338ccb)
	{
		var_2e35e6c1 = function_63320ea1(var_2e35e6c1);
	}
	magnitude = length2d(var_2e35e6c1);
	var_a5788712 = angleclamp180(vectortoangles(var_2e35e6c1)[1]);
	return {#degrees:var_a5788712, #length:magnitude, #y:var_2e35e6c1[1], #x:var_2e35e6c1[0]};
}

/*
	Name: function_57f1ac46
	Namespace: util
	Checksum: 0x3A0E3242
	Offset: 0x6238
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_57f1ac46(localclientnum)
{
	return function_491c4d64(localclientnum)[#"left"];
}

/*
	Name: function_f35576c
	Namespace: util
	Checksum: 0x92B88AF5
	Offset: 0x6270
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_f35576c(localclientnum)
{
	return function_491c4d64(localclientnum)[#"right"];
}

/*
	Name: init_dvar
	Namespace: util
	Checksum: 0x9F7609C2
	Offset: 0x62A8
	Size: 0x9A
	Parameters: 3
	Flags: Linked
*/
function init_dvar(str_dvar, default_val, func_callback)
{
	function_5ac4dc99(str_dvar, default_val);
	if(isdefined(func_callback))
	{
		function_cd140ee9(str_dvar, func_callback);
		level thread [[func_callback]]({#value:getdvar(str_dvar), #name:str_dvar});
	}
}

/*
	Name: function_6f326f49
	Namespace: util
	Checksum: 0x2B714B16
	Offset: 0x6350
	Size: 0x39E
	Parameters: 6
	Flags: Linked
*/
function function_6f326f49(hour, minute, second, day, month, year)
{
	for(;;)
	{
		setdvar(#"hash_dfcfdb3bf28da5e", (((string(hour, 2) + ":") + string(minute, 2) + ":") + string(second, 2) + " ") + string(month, 2) + ("/") + string(day, 2) + ("/") + (string(year % 100, 2)));
		wait(1);
		second = second + 1;
		if(second > 59)
		{
			second = 0;
			minute = minute + 1;
		}
		if(minute > 59)
		{
			minute = 0;
			hour = hour + 1;
		}
		if(hour > 23)
		{
			hour = 0;
			day = day + 1;
		}
		switch(month)
		{
			case 1:
			{
				var_8bf17cd8 = 31;
				break;
			}
			case 2:
			{
				if((year % 4) == 0 || ((year % 100) == 0 && (!((year % 4) == 0 && (year % 100) == 0))))
				{
					var_8bf17cd8 = 29;
				}
				else
				{
					var_8bf17cd8 = 28;
				}
				break;
			}
			case 3:
			{
				var_8bf17cd8 = 31;
				break;
			}
			case 4:
			{
				var_8bf17cd8 = 30;
				break;
			}
			case 5:
			{
				var_8bf17cd8 = 31;
				break;
			}
			case 6:
			{
				var_8bf17cd8 = 30;
				break;
			}
			case 7:
			{
				var_8bf17cd8 = 31;
				break;
			}
			case 8:
			{
				var_8bf17cd8 = 31;
				break;
			}
			case 9:
			{
				var_8bf17cd8 = 30;
				break;
			}
			case 10:
			{
				var_8bf17cd8 = 31;
				break;
			}
			case 11:
			{
				var_8bf17cd8 = 30;
				break;
			}
			case 12:
			{
				var_8bf17cd8 = 31;
				break;
			}
		}
		if(day > var_8bf17cd8)
		{
			day = 1;
			month = month + 1;
		}
		if(month > 12)
		{
			month = 1;
			year = year + 1;
		}
	}
}

/*
	Name: function_a9ea7ad4
	Namespace: util
	Checksum: 0xD1E680DE
	Offset: 0x66F8
	Size: 0x31C
	Parameters: 6
	Flags: None
*/
function function_a9ea7ad4(hour, minute, second, day, month, year)
{
	if(hour < 0)
	{
		hour = 0;
	}
	else if(hour > 23)
	{
		hour = 23;
	}
	if(minute < 0)
	{
		minute = 0;
	}
	else if(minute > 59)
	{
		minute = 59;
	}
	if(second < 0)
	{
		second = 0;
	}
	else if(second > 59)
	{
		second = 59;
	}
	if(month < 1)
	{
		month = 1;
	}
	else if(month > 12)
	{
		month = 12;
	}
	if(year < 0)
	{
		year = 0;
	}
	else if(year > 1000000)
	{
		year = 1000000;
	}
	switch(month)
	{
		case 1:
		{
			var_8bf17cd8 = 31;
			break;
		}
		case 2:
		{
			if((year % 4) == 0 || ((year % 100) == 0 && (!((year % 4) == 0 && (year % 100) == 0))))
			{
				var_8bf17cd8 = 29;
			}
			else
			{
				var_8bf17cd8 = 28;
			}
			break;
		}
		case 3:
		{
			var_8bf17cd8 = 31;
			break;
		}
		case 4:
		{
			var_8bf17cd8 = 30;
			break;
		}
		case 5:
		{
			var_8bf17cd8 = 31;
			break;
		}
		case 6:
		{
			var_8bf17cd8 = 30;
			break;
		}
		case 7:
		{
			var_8bf17cd8 = 31;
			break;
		}
		case 8:
		{
			var_8bf17cd8 = 31;
			break;
		}
		case 9:
		{
			var_8bf17cd8 = 30;
			break;
		}
		case 10:
		{
			var_8bf17cd8 = 31;
			break;
		}
		case 11:
		{
			var_8bf17cd8 = 30;
			break;
		}
		case 12:
		{
			var_8bf17cd8 = 31;
			break;
		}
	}
	if(day < 1)
	{
		day = 1;
	}
	else if(day > var_8bf17cd8)
	{
		day = var_8bf17cd8;
	}
	thread function_6f326f49(hour, minute, second, day, month, year);
}

