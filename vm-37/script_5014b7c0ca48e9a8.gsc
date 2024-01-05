#using script_54f593f5beb1464a;
#using script_2a30ac7aa0ee8988;

#namespace namespace_e27c7374;

/*
	Name: function_88ff61e0
	Namespace: namespace_e27c7374
	Checksum: 0xF901AD72
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_88ff61e0()
{
	thread function_45a212c0();
}

/*
	Name: function_9d16c83
	Namespace: namespace_e27c7374
	Checksum: 0xD767D211
	Offset: 0xE0
	Size: 0x64
	Parameters: 2
	Flags: Private
*/
function private function_9d16c83(var_705ed3b9, item_name)
{
	if(!is_true(getgametypesetting(var_705ed3b9)))
	{
		namespace_1c7b37c6::item_remover(&item_world_fixup::remove_item, item_name);
	}
}

/*
	Name: function_45a212c0
	Namespace: namespace_e27c7374
	Checksum: 0x4F5A8669
	Offset: 0x150
	Size: 0x5B4
	Parameters: 0
	Flags: None
*/
function function_45a212c0()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	maxteamplayers = (isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1);
	var_77c6811d = 1;
	if(var_77c6811d)
	{
		while(!function_82a4c7da() && var_77c6811d)
		{
			waitframe(1);
			function_205a8326("game mode is invalid.");
		}
	}
	else if(!function_82a4c7da())
	{
		function_205a8326("game mode is invalid. Warning... being ignored!");
	}
	function_9d16c83(#"hash_2a36e8fb9a5428", #"hash_b8b2580ac5556e1");
	function_9d16c83(#"hash_4e22aa47e19259c0", #"hash_583f1687cefbd3f3");
	function_9d16c83(#"hash_61b5f6d8ac7d7a19", #"armor_pouch_item_t9");
	function_9d16c83(#"hash_30ff0bec6c65ec06", #"hash_fb37841b0d2d7e7");
	function_9d16c83(#"hash_13e19a5373c4f4e7", #"hash_6a7de03254c6a4d5");
	function_9d16c83(#"hash_557259356784fdd7", #"hash_6fa05dcae5ac1c4b");
	function_9d16c83(#"hash_38c8b1792c0d250a", #"hash_6739b1e55d16500");
	function_9d16c83(#"hash_12a74d91c8b0d742", #"hash_6eb09ea5da35e18f");
	function_9d16c83(#"hash_e73a7c07468431a", #"hash_3cef4b4ca5fd8984");
	function_9d16c83(#"hash_4d0da8ca56b9422c", #"hash_257e121804c12624");
	function_9d16c83(#"hash_7d9da9c9c1f3d293", #"hash_5987d17c5829e656");
	function_9d16c83(#"hash_421b5f8cbf87ff4d", #"hash_78406ffa639f4bf");
	function_9d16c83(#"hash_8da9676b8f347c3", #"hash_59372818d5a4b00");
	function_9d16c83(#"hash_4801a96e69d82a91", #"hash_48c54ff5d128d347");
	function_9d16c83(#"hash_23549b4406d700e4", #"hash_348085cf61f674ad");
	function_9d16c83(#"hash_680849fd1b676cfb", #"hash_52ee32e14c642494");
	function_9d16c83(#"hash_b8c05f2c978058", #"hash_24f5473ce475912e");
	function_9d16c83(#"hash_7b9a6ba194492507", #"hash_569b6056354984ee");
	function_9d16c83(#"hash_550b9e9e19eabf76", #"hash_11b95062385cd071");
	function_9d16c83(#"hash_78f80d4486f80e36", #"hash_bedd703cad46c40");
	function_9d16c83(#"hash_4a1459147fde288a", #"hash_4980f99d633760cf");
	function_9d16c83(#"hash_54cfe5e7905e4b20", #"hash_5f50a43f7034eefa");
	function_9d16c83(#"hash_4a530732c9cd1e9d", #"hash_2640bc24c6eb39bd");
	function_9d16c83(#"hash_41b88c5d0b67b1cb", #"hash_654445f6cc7a7e1c");
}

/*
	Name: function_205a8326
	Namespace: namespace_e27c7374
	Checksum: 0xD736D5E8
	Offset: 0x710
	Size: 0x74
	Parameters: 2
	Flags: Private
*/
function private function_205a8326(msg, var_9fb99f62)
{
	/#
		if(isdefined(var_9fb99f62))
		{
			println((("" + msg) + "") + var_9fb99f62);
		}
		else
		{
			println("" + msg);
		}
	#/
}

