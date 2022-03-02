#using script_2a30ac7aa0ee8988;
#using script_54f593f5beb1464a;

#namespace namespace_ec834edc;

/*
	Name: __init__
	Namespace: namespace_ec834edc
	Checksum: 0x3C1669F3
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	function_62cd02cc();
}

/*
	Name: function_62cd02cc
	Namespace: namespace_ec834edc
	Checksum: 0x83EEDA9F
	Offset: 0xA8
	Size: 0xA7C
	Parameters: 0
	Flags: None
*/
function function_62cd02cc()
{
	var_87d0eef8 = &namespace_b0722f43::function_63bfe27;
	var_74257310 = &namespace_b0722f43::function_6da5e673;
	var_f8a4c541 = &namespace_b0722f43::function_6991057;
	var_edfbccd0 = &namespace_b0722f43::function_e70fa91c;
	var_e92b5b25 = getgametypesetting(#"hash_280809419b2cabc0");
	if(is_true(var_e92b5b25))
	{
		namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_212b01feaa916a00", #"hash_7ebaa4e1e2f5d8a2");
		namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_3bf6ed4e3a22e9f3", #"hash_3b5119f663e783b1");
		namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_1f72dec518451f8c", #"hash_3b5119f663e783b1");
		namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_182fdef2ad243e20", #"hash_3b5119f663e783b1");
		namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_46dd75a1a3f70780", #"hash_7ebaa4e1e2f5d8a2");
		if(var_e92b5b25 == 1)
		{
			str_list = #"ambush";
		}
		else
		{
			namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_157da59e7a4b1f80", #"hash_5bd1324b19fc827a");
			namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_30dcaca16025cb02", #"hash_71bfd39dd3312198");
			str_list = #"hash_5b59c601969f4bb2";
		}
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_6e8a65a99293fcaa", #"hash_604d143f1f7c7f76");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_670d02ab3b4128b2", str_list + "_guns");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_46f73ca5ddb4e276", str_list + "_guns");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_73b67150c513b4f9", str_list + "_guns");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_4a637cd4a03131b2", str_list + "_guns");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_27e22f275feb07fe", str_list + "_guns");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_5169964579e807e3", str_list + "_guns");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_3c8a483e6ebb08cb", str_list + "_guns");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_288777455d94303e", str_list + "_guns_gold");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_25fc1eba4e8349b", str_list + "_guns_gold");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_6fc60554f331d773", #"hash_14c8f136272c2cc0");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_7491ec9e64118e2c", #"hash_629cbe2478d19625");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_6a6bd69e5de63610", #"hash_6598098381e1a09");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_230efa8b15f70979", #"hash_1d4ea58da145f816");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_403ed348400ef4e7", #"hash_46049cde635b2f84");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_3f8034fc64c31ee1", #"hash_7b45beb26f4d91e");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_2d961760cac60b12", #"hash_576fbac492e4d1cb");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_353d5160ced2a576", #"hash_2ce1cb4b0fa1a2ff");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_c89114ed7149b85", #"hash_2716d5ce25496be2");
		if(is_true(getgametypesetting(#"hash_28a3a35c24fe616")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_27a77e458cb2223e", #"hash_45b5072d8475909");
		}
		if(is_true(getgametypesetting(#"hash_2f4adaa9de981357")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_7fe452ac99dcb25f", #"hash_45b5072d8475909");
		}
		if(is_true(getgametypesetting(#"hash_72baa3480316bf55")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_2572e1a193175b4d", #"hash_45b5072d8475909");
		}
		if(is_true(getgametypesetting(#"hash_30ca3c2a4473f979")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_2bb44d78cfdc661", #"hash_45b5072d8475909");
		}
		if(is_true(getgametypesetting(#"hash_26c067f1dd032ebc")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_7f50125ebbc15534", #"hash_45b5072d8475909");
		}
		if(is_true(getgametypesetting(#"hash_f04393e2e028c01")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_5d334f942754156e", #"hash_45b5072d8475909");
		}
		if(is_true(getgametypesetting(#"hash_64aba694bd70856c")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_10db7f8ca1621554", #"hash_45b5072d8475909");
		}
		if(is_true(getgametypesetting(#"hash_7fb8c0dadeac34d9")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_27d464e9703672a1", #"hash_45b5072d8475909");
		}
	}
}

