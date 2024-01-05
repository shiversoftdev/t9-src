#using script_309ce7f5a9a023de;
#using script_644007a8c3885fc;

#namespace namespace_de6618fd;

/*
	Name: function_6d68a138
	Namespace: namespace_de6618fd
	Checksum: 0xD3637965
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6d68a138()
{
	level notify(-1864599671);
}

/*
	Name: __init__
	Namespace: namespace_de6618fd
	Checksum: 0xE04D01EF
	Offset: 0xF0
	Size: 0xEC
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	gametype = getdvarstring(#"g_gametype");
	switch(gametype)
	{
		case "fireteam_dirty_bomb":
		{
			function_cbbf16a4();
			break;
		}
		case "hash_6463dea5fa2dbea5":
		{
			function_e5d1b704();
			break;
		}
		case "zsurvival":
		{
			function_bcd11f83();
			break;
		}
		default:
		{
		}
	}
	function_d5eb555d();
	function_f05c9e0a();
}

/*
	Name: function_cbbf16a4
	Namespace: namespace_de6618fd
	Checksum: 0xF1FE63C6
	Offset: 0x1E8
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_cbbf16a4()
{
	function_c379f040();
}

/*
	Name: function_e5d1b704
	Namespace: namespace_de6618fd
	Checksum: 0xCD61D247
	Offset: 0x208
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_e5d1b704()
{
	function_c379f040();
}

/*
	Name: function_bcd11f83
	Namespace: namespace_de6618fd
	Checksum: 0x870D89E7
	Offset: 0x228
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_bcd11f83()
{
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_203198a6940492f9", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_288ef692cd8b7c55", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_d735743f6964821", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_41061d68aef8439e", #"hash_2ddee7c1e1c21dd6");
}

/*
	Name: function_d5eb555d
	Namespace: namespace_de6618fd
	Checksum: 0x80F724D1
	Offset: 0x338
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_d5eb555d()
{
}

/*
	Name: function_f05c9e0a
	Namespace: namespace_de6618fd
	Checksum: 0xD718BD22
	Offset: 0x348
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_f05c9e0a()
{
	function_8341771e(function_91b29d2a("location_items_golova"), 7000, #"hash_5a88477bbf0736f1");
	function_8341771e(function_91b29d2a("location_items_farm"), 7000, #"hash_1c4eccf00713d9c7");
	function_8341771e(function_91b29d2a("location_items_mansion"), 9000, #"hash_d5c723294842e7c");
}

/*
	Name: function_8341771e
	Namespace: namespace_de6618fd
	Checksum: 0x49A7EC76
	Offset: 0x400
	Size: 0x194
	Parameters: 3
	Flags: Linked
*/
function function_8341771e(locations, radius, name)
{
	var_32948f8f = function_91b29d2a("dirty_bomb_stash");
	foreach(location in locations)
	{
		foreach(var_64b8ecb8 in var_32948f8f)
		{
			var_d196e508 = var_64b8ecb8.origin;
			if(distance2dsquared(location.origin, var_d196e508) <= (radius * radius))
			{
				item_world_fixup::function_a997e342(var_d196e508, 16);
				if(isdefined(name))
				{
					item_world_fixup::add_spawn_point(var_d196e508, name, var_64b8ecb8.angles);
				}
			}
		}
	}
}

/*
	Name: function_c379f040
	Namespace: namespace_de6618fd
	Checksum: 0x80F724D1
	Offset: 0x5A0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_c379f040()
{
}

