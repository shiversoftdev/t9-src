#using script_3dc93ca9902a9cda;
#using script_35ae72be7b4fec10;

#namespace namespace_a43d1663;

/*
	Name: function_a06493b1
	Namespace: namespace_a43d1663
	Checksum: 0xF7352CCD
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a06493b1()
{
	level notify(1747054771);
}

/*
	Name: init
	Namespace: namespace_a43d1663
	Checksum: 0xD034F1F8
	Offset: 0xC0
	Size: 0x15C
	Parameters: 6
	Flags: Linked
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
	Checksum: 0x1BF2FB75
	Offset: 0x228
	Size: 0x1B4
	Parameters: 4
	Flags: Linked, Private
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
	player = getplayers()[0];
	player playsound(#"hash_1d0d39163d572a71");
}

/*
	Name: remove
	Namespace: namespace_a43d1663
	Checksum: 0x57151094
	Offset: 0x3E8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function remove()
{
	if(namespace_61e6d095::exists(#"hash_2c29a54813fff877"))
	{
		namespace_61e6d095::remove(#"hash_2c29a54813fff877");
	}
}

