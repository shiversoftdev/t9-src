#using script_35ae72be7b4fec10;
#using script_3dc93ca9902a9cda;

#namespace namespace_a43d1663;

/*
	Name: init
	Namespace: namespace_a43d1663
	Checksum: 0x5EE20D6
	Offset: 0xA0
	Size: 0x15C
	Parameters: 6
	Flags: None
*/
function init(var_4bf53b01, var_76e98c1f, var_2a015e7e, var_f8f020e3, var_919728b0, var_c18a5a8b)
{
	if(!isdefined(var_4bf53b01))
	{
		var_4bf53b01 = #"";
	}
	if(!isdefined(var_76e98c1f))
	{
		var_76e98c1f = #"";
	}
	if(!isdefined(var_2a015e7e))
	{
		var_2a015e7e = 0;
	}
	if(!isdefined(var_f8f020e3))
	{
		var_f8f020e3 = 0;
	}
	if(!isdefined(var_919728b0))
	{
		var_919728b0 = 5;
	}
	if(!isdefined(var_c18a5a8b))
	{
		var_c18a5a8b = var_919728b0 + 5;
	}
	if(var_919728b0 >= (float(function_60d95f53()) / 1000))
	{
		wait(var_919728b0);
	}
	level add(var_4bf53b01, var_76e98c1f, var_2a015e7e, var_f8f020e3);
	if(var_c18a5a8b >= (float(function_60d95f53()) / 1000))
	{
		wait(var_c18a5a8b);
	}
	level remove();
}

/*
	Name: add
	Namespace: namespace_a43d1663
	Checksum: 0x4859F98E
	Offset: 0x208
	Size: 0x16C
	Parameters: 4
	Flags: Private
*/
function private add(var_4bf53b01, var_76e98c1f, var_2a015e7e, var_f8f020e3)
{
	if(namespace_61e6d095::exists(#"hash_2c29a54813fff877"))
	{
		namespace_61e6d095::remove(#"hash_2c29a54813fff877");
	}
	namespace_61e6d095::create(#"hash_2c29a54813fff877", #"hash_4782a7f29b84b022");
	namespace_61e6d095::function_d3c3e5c3(#"hash_2c29a54813fff877", [0:#"dialog_tree"]);
	namespace_61e6d095::function_9ade1d9b(#"hash_2c29a54813fff877", "text", var_4bf53b01);
	namespace_61e6d095::function_9ade1d9b(#"hash_2c29a54813fff877", "image", var_76e98c1f);
	namespace_61e6d095::function_9ade1d9b(#"hash_2c29a54813fff877", "earnedCount", var_2a015e7e);
	namespace_61e6d095::function_9ade1d9b(#"hash_2c29a54813fff877", "maxCount", var_f8f020e3);
}

/*
	Name: remove
	Namespace: namespace_a43d1663
	Checksum: 0x1B4E1B02
	Offset: 0x380
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function remove()
{
	if(namespace_61e6d095::exists(#"hash_2c29a54813fff877"))
	{
		namespace_61e6d095::remove(#"hash_2c29a54813fff877");
	}
}

