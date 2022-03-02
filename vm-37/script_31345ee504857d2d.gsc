#using script_178024232e91b0a1;
#using script_3aa0f32b70d4f7cb;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_9ce42227;

/*
	Name: function_89f2df9
	Namespace: namespace_9ce42227
	Checksum: 0x69ADAE6F
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7e51b62fb1d59a7b", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9ce42227
	Checksum: 0xD73C203
	Offset: 0xE0
	Size: 0x14C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	/#
		assert(isscriptfunctionptr(&function_64d25a18));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_57181cf80bd4059f", &function_64d25a18);
	/#
		assert(isscriptfunctionptr(&function_64d25a18));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_57181cf80bd4059f", &function_64d25a18);
	/#
		assert(isscriptfunctionptr(&function_b4bc7751));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6ef372b4649a577e", &function_b4bc7751);
	thread function_2f0f1b62();
}

/*
	Name: function_2f0f1b62
	Namespace: namespace_9ce42227
	Checksum: 0x179EA19A
	Offset: 0x238
	Size: 0x120
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2f0f1b62()
{
	nodes = getallnodes();
	foreach(node in nodes)
	{
		if(is_true(node.var_514e7397) && isdefined(node.target))
		{
			if(is_true(node.var_71c87324))
			{
				continue;
			}
			var_54d06303 = struct::get(node.target);
			if(isdefined(var_54d06303))
			{
				var_54d06303 scene::init();
			}
		}
	}
}

/*
	Name: function_64d25a18
	Namespace: namespace_9ce42227
	Checksum: 0x7EDCD6CC
	Offset: 0x360
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_64d25a18(entity)
{
	if(entity.archetype !== #"human")
	{
		return false;
	}
	if(!isdefined(entity.node))
	{
		return false;
	}
	if(!iscovernode(entity.node))
	{
		return false;
	}
	if(!entity isatcovernode())
	{
		return false;
	}
	if(!is_true(entity.node.var_514e7397))
	{
		return false;
	}
	if(isdefined(entity.node.var_31c05612))
	{
		return false;
	}
	return true;
}

/*
	Name: function_b4bc7751
	Namespace: namespace_9ce42227
	Checksum: 0x1D620CC9
	Offset: 0x428
	Size: 0x158
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b4bc7751(entity)
{
	/#
		assert(!is_true(entity.node.var_31c05612));
	#/
	if(isdefined(entity.node.target))
	{
		entity pathmode("move delayed", 8);
		entity.node.var_31c05612 = 1;
		var_54d06303 = struct::get(entity.node.target);
		var_54d06303 scene::play(entity);
		var_54d06303 notify(#"hash_4d2293524fe1c94c", {#hash_32684dfb:entity});
		if(isalive(entity))
		{
			entity notify(#"hash_4d2293524fe1c94c", {#hash_c17a3b30:entity.node, #hash_bad0e17c:var_54d06303});
		}
	}
}

