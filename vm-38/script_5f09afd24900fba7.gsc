#using script_309ce7f5a9a023de;
#using script_644007a8c3885fc;

#namespace namespace_52be2c78;

/*
	Name: function_67bfbd5a
	Namespace: namespace_52be2c78
	Checksum: 0x2B430047
	Offset: 0x160
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_67bfbd5a()
{
	level notify(80291820);
}

/*
	Name: __init__
	Namespace: namespace_52be2c78
	Checksum: 0x61AD282F
	Offset: 0x180
	Size: 0x18C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	gametype = function_be90acca(getdvarstring(#"g_gametype"));
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
		case "hash_2a8c6a2ad775902a":
		{
			function_574dc51f();
			break;
		}
		case "fireteam_koth":
		{
			function_1ed4cf79();
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
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_55e3c88dadb84048", #"hash_2ddee7c1e1c21dd6");
	function_d5eb555d();
	function_f05c9e0a();
}

/*
	Name: function_cbbf16a4
	Namespace: namespace_52be2c78
	Checksum: 0x91B81294
	Offset: 0x318
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
	Namespace: namespace_52be2c78
	Checksum: 0x73F0EE71
	Offset: 0x338
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_e5d1b704()
{
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_203198a6940492f9", #"hash_358b850466bc7d5e");
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_152385d9b98f0818", #"hash_358b850466bc7d5e");
	function_c379f040();
}

/*
	Name: function_574dc51f
	Namespace: namespace_52be2c78
	Checksum: 0xAA8C133C
	Offset: 0x3D8
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_574dc51f()
{
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_74c5644c939b5395", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_203198a6940492f9", #"hash_20fe5ea7eec81707");
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_152385d9b98f0818", #"hash_20fe5ea7eec81707");
	function_c379f040();
}

/*
	Name: function_1ed4cf79
	Namespace: namespace_52be2c78
	Checksum: 0x29EE8B1E
	Offset: 0x4B8
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_1ed4cf79()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	var_edfbccd0 = &item_world_fixup::function_e70fa91c;
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_203198a6940492f9", #"hash_59ceff804ad2c7b8");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_152385d9b98f0818", #"hash_59ceff804ad2c7b8");
	function_c379f040();
}

/*
	Name: function_bcd11f83
	Namespace: namespace_52be2c78
	Checksum: 0xBA1977E0
	Offset: 0x598
	Size: 0x184
	Parameters: 0
	Flags: Linked
*/
function function_bcd11f83()
{
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_203198a6940492f9", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_152385d9b98f0818", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_74c5644c939b5395", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_4d756ccd3f484c1f", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_4221ae2046a283be", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_10521493269714cb", #"hash_2ddee7c1e1c21dd6");
}

/*
	Name: function_d5eb555d
	Namespace: namespace_52be2c78
	Checksum: 0x80F724D1
	Offset: 0x728
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_d5eb555d()
{
}

/*
	Name: function_f05c9e0a
	Namespace: namespace_52be2c78
	Checksum: 0xF624047
	Offset: 0x738
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function function_f05c9e0a()
{
	function_8341771e(function_91b29d2a("location_items_dacha"), 5000, #"hash_67492346597ba3f2");
	function_8341771e(function_91b29d2a("location_items_bathhouse"), 6000, #"hash_49fe7c02fa7110b2");
	function_8341771e(function_91b29d2a("location_items_richhouse"), 7000, #"hash_611c237e8680eddb");
	function_8341771e(function_91b29d2a("location_items_islands"), 6000, #"hash_64c2073e77d0bb83");
	function_8341771e(function_91b29d2a("location_items_sanatorium"), 9000, #"hash_59e1a2689fd7c290");
	function_8341771e(function_91b29d2a("location_items_rentals"), 6000, #"hash_4b757b29cc4c3712");
	function_8341771e(function_91b29d2a("location_items_monument"), 9000, #"hash_5ceed4cd33f4824a");
	function_8341771e(function_91b29d2a("location_items_restaurants"), 5000, #"hash_1cec1fe807ac83f5");
}

/*
	Name: function_8341771e
	Namespace: namespace_52be2c78
	Checksum: 0x1E9F69DF
	Offset: 0x908
	Size: 0x19C
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
			if(distance2dsquared(location.origin, var_64b8ecb8.origin) <= (radius * radius))
			{
				var_d196e508 = var_64b8ecb8.origin;
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
	Namespace: namespace_52be2c78
	Checksum: 0x80F724D1
	Offset: 0xAB0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_c379f040()
{
}

