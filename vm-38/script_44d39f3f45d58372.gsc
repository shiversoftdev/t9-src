#using script_2a30ac7aa0ee8988;
#using script_54f593f5beb1464a;

#namespace namespace_de6618fd;

/*
	Name: function_8bcecede
	Namespace: namespace_de6618fd
	Checksum: 0x4552665D
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8bcecede()
{
	level notify(1037141311);
}

/*
	Name: __init__
	Namespace: namespace_de6618fd
	Checksum: 0xA1C6261A
	Offset: 0x108
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
	Checksum: 0x8CCA98FB
	Offset: 0x200
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
	Checksum: 0x10B0F6A7
	Offset: 0x220
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
	Checksum: 0x88941827
	Offset: 0x240
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_bcd11f83()
{
	namespace_1c7b37c6::function_149cbc84(&namespace_b0722f43::function_6991057, #"hash_203198a6940492f9", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::function_149cbc84(&namespace_b0722f43::function_6991057, #"hash_288ef692cd8b7c55", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::function_149cbc84(&namespace_b0722f43::function_6991057, #"hash_d735743f6964821", #"hash_2ddee7c1e1c21dd6");
	namespace_1c7b37c6::function_149cbc84(&namespace_b0722f43::function_6991057, #"hash_41061d68aef8439e", #"hash_2ddee7c1e1c21dd6");
}

/*
	Name: function_d5eb555d
	Namespace: namespace_de6618fd
	Checksum: 0x80F724D1
	Offset: 0x350
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
	Checksum: 0x93F2CE28
	Offset: 0x360
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
	Checksum: 0x685579DF
	Offset: 0x418
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
				namespace_b0722f43::function_a997e342(var_d196e508, 16);
				if(isdefined(name))
				{
					namespace_b0722f43::function_636d607c(var_d196e508, name, var_64b8ecb8.angles);
				}
			}
		}
	}
}

/*
	Name: function_c379f040
	Namespace: namespace_de6618fd
	Checksum: 0x8909CA76
	Offset: 0x5B8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_c379f040()
{
	hidemiscmodels("magicbox_zbarrier");
}

