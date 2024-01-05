#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_net;

/*
	Name: network_choke_init
	Namespace: zm_net
	Checksum: 0xC87E1994
	Offset: 0x70
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function network_choke_init(id, max)
{
	if(!isdefined(level.zombie_network_choke_ids_max))
	{
		level.zombie_network_choke_ids_max = [];
		level.zombie_network_choke_ids_count = [];
	}
	level.zombie_network_choke_ids_max[id] = max;
	level.zombie_network_choke_ids_count[id] = 0;
	level thread network_choke_thread(id);
}

/*
	Name: network_choke_thread
	Namespace: zm_net
	Checksum: 0x2FA6E5E2
	Offset: 0xF0
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function network_choke_thread(id)
{
	while(true)
	{
		util::wait_network_frame();
		util::wait_network_frame();
		level.zombie_network_choke_ids_count[id] = 0;
	}
}

/*
	Name: network_choke_safe
	Namespace: zm_net
	Checksum: 0x676B398A
	Offset: 0x140
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function network_choke_safe(id)
{
	return level.zombie_network_choke_ids_count[id] < level.zombie_network_choke_ids_max[id];
}

/*
	Name: network_choke_action
	Namespace: zm_net
	Checksum: 0x9F3E253E
	Offset: 0x178
	Size: 0xF0
	Parameters: 5
	Flags: Linked
*/
function network_choke_action(id, choke_action, arg1, arg2, arg3)
{
	/#
		assert(isdefined(level.zombie_network_choke_ids_max[id]), ("" + id) + "");
	#/
	while(!network_choke_safe(id))
	{
		waitframe(1);
	}
	level.zombie_network_choke_ids_count[id]++;
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
	Name: network_entity_valid
	Namespace: zm_net
	Checksum: 0x87CD2334
	Offset: 0x270
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function network_entity_valid(entity)
{
	if(!isdefined(entity))
	{
		return false;
	}
	return true;
}

/*
	Name: network_safe_init
	Namespace: zm_net
	Checksum: 0x4E1F9911
	Offset: 0x298
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function network_safe_init(id, max)
{
	if(!isdefined(level.zombie_network_choke_ids_max) || !isdefined(level.zombie_network_choke_ids_max[id]))
	{
		network_choke_init(id, max);
	}
	/#
		assert(max == level.zombie_network_choke_ids_max[id]);
	#/
}

/*
	Name: _network_safe_spawn
	Namespace: zm_net
	Checksum: 0x9D11B9EA
	Offset: 0x320
	Size: 0x2A
	Parameters: 2
	Flags: Linked
*/
function _network_safe_spawn(classname, origin)
{
	return spawn(classname, origin);
}

/*
	Name: network_safe_spawn
	Namespace: zm_net
	Checksum: 0xAC524B63
	Offset: 0x358
	Size: 0x62
	Parameters: 4
	Flags: Linked
*/
function network_safe_spawn(id, max, classname, origin)
{
	network_safe_init(id, max);
	return network_choke_action(id, &_network_safe_spawn, classname, origin);
}

/*
	Name: _network_safe_play_fx_on_tag
	Namespace: zm_net
	Checksum: 0x428FB429
	Offset: 0x3C8
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function _network_safe_play_fx_on_tag(fx, entity, tag)
{
	if(network_entity_valid(entity))
	{
		playfxontag(fx, entity, tag);
	}
}

/*
	Name: network_safe_play_fx_on_tag
	Namespace: zm_net
	Checksum: 0x781ED56A
	Offset: 0x420
	Size: 0x6C
	Parameters: 5
	Flags: Linked
*/
function network_safe_play_fx_on_tag(id, max, fx, entity, tag)
{
	network_safe_init(id, max);
	network_choke_action(id, &_network_safe_play_fx_on_tag, fx, entity, tag);
}

