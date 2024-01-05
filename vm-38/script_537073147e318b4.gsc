#using script_54f593f5beb1464a;
#using script_2a30ac7aa0ee8988;

#namespace namespace_d5db95b4;

/*
	Name: function_42aaa806
	Namespace: namespace_d5db95b4
	Checksum: 0x4D4EE74D
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_42aaa806()
{
	level notify(1554420531);
}

/*
	Name: __init__
	Namespace: namespace_d5db95b4
	Checksum: 0x3309AF91
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	function_c70f8122();
}

/*
	Name: function_c70f8122
	Namespace: namespace_d5db95b4
	Checksum: 0xFAEA6F78
	Offset: 0xB0
	Size: 0x184
	Parameters: 0
	Flags: Linked
*/
function function_c70f8122()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	var_edfbccd0 = &item_world_fixup::function_e70fa91c;
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_218c23f79bec44e2", #"hash_76801accbe42542");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"zm_magicbox_scorestreak_list", #"hash_66e8775be8803156");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_63e44c0150bb5992", #"hash_2615b9246d595abb");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_45a2c2712690bd0", #"hash_577ec9e24502ddd");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_3ec8c7d720778d76", #"hash_418c1b8934168303");
	namespace_1c7b37c6::item_replacer(var_74257310, #"hash_55c0a68941dcc80b", #"hash_79d7d5e206eaf770");
}

