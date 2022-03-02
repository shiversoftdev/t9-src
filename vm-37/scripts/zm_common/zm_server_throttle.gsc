#using scripts\core_common\struct.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_server_throttle;

/*
	Name: server_choke_init
	Namespace: zm_server_throttle
	Checksum: 0x9AA90D9B
	Offset: 0x70
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function server_choke_init(id, max)
{
	if(!isdefined(level.zombie_server_choke_ids_max))
	{
		level.zombie_server_choke_ids_max = [];
		level.zombie_server_choke_ids_count = [];
	}
	level.zombie_server_choke_ids_max[id] = max;
	level.zombie_server_choke_ids_count[id] = 0;
	level thread server_choke_thread(id);
}

/*
	Name: server_choke_thread
	Namespace: zm_server_throttle
	Checksum: 0x5F4C7252
	Offset: 0xF0
	Size: 0x30
	Parameters: 1
	Flags: Linked
*/
function server_choke_thread(id)
{
	while(true)
	{
		waitframe(1);
		level.zombie_server_choke_ids_count[id] = 0;
	}
}

/*
	Name: server_choke_safe
	Namespace: zm_server_throttle
	Checksum: 0x7AAE38A5
	Offset: 0x128
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function server_choke_safe(id)
{
	return level.zombie_server_choke_ids_count[id] < level.zombie_server_choke_ids_max[id];
}

/*
	Name: server_choke_action
	Namespace: zm_server_throttle
	Checksum: 0x4077F32A
	Offset: 0x160
	Size: 0xF0
	Parameters: 5
	Flags: Linked
*/
function server_choke_action(id, choke_action, arg1, arg2, arg3)
{
	/#
		assert(isdefined(level.zombie_server_choke_ids_max[id]), ("" + id) + "");
	#/
	while(!server_choke_safe(id))
	{
		waitframe(1);
	}
	level.zombie_server_choke_ids_count[id]++;
	if(!isdefined(arg1))
	{
		return [[choke_action]]();
	}
	if(!isdefined(arg2))
	{
		return [[choke_action]](arg1);
	}
	if(!isdefined(arg3))
	{
		return [[choke_action]](arg1, arg2);
	}
	return [[choke_action]](arg1, arg2, arg3);
}

/*
	Name: server_entity_valid
	Namespace: zm_server_throttle
	Checksum: 0x12F2C8B0
	Offset: 0x258
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function server_entity_valid(entity)
{
	if(!isdefined(entity))
	{
		return false;
	}
	return true;
}

/*
	Name: server_safe_init
	Namespace: zm_server_throttle
	Checksum: 0xF625F74
	Offset: 0x280
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function server_safe_init(id, max)
{
	if(!isdefined(level.zombie_server_choke_ids_max) || !isdefined(level.zombie_server_choke_ids_max[id]))
	{
		server_choke_init(id, max);
	}
	/#
		assert(max == level.zombie_server_choke_ids_max[id]);
	#/
}

/*
	Name: _server_safe_ground_trace
	Namespace: zm_server_throttle
	Checksum: 0x6FC79BA7
	Offset: 0x308
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function _server_safe_ground_trace(pos)
{
	return zm_utility::groundpos(pos);
}

/*
	Name: server_safe_ground_trace
	Namespace: zm_server_throttle
	Checksum: 0xC9755D99
	Offset: 0x338
	Size: 0x52
	Parameters: 3
	Flags: Linked
*/
function server_safe_ground_trace(id, max, origin)
{
	server_safe_init(id, max);
	return server_choke_action(id, &_server_safe_ground_trace, origin);
}

/*
	Name: _server_safe_ground_trace_ignore_water
	Namespace: zm_server_throttle
	Checksum: 0x28696090
	Offset: 0x398
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function _server_safe_ground_trace_ignore_water(pos)
{
	return zm_utility::groundpos_ignore_water(pos);
}

/*
	Name: server_safe_ground_trace_ignore_water
	Namespace: zm_server_throttle
	Checksum: 0xD63EFE65
	Offset: 0x3C8
	Size: 0x52
	Parameters: 3
	Flags: None
*/
function server_safe_ground_trace_ignore_water(id, max, origin)
{
	server_safe_init(id, max);
	return server_choke_action(id, &_server_safe_ground_trace_ignore_water, origin);
}

