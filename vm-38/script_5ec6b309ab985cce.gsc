#using script_309ce7f5a9a023de;
#using script_644007a8c3885fc;

#namespace namespace_ed93e89a;

/*
	Name: function_9704545d
	Namespace: namespace_ed93e89a
	Checksum: 0x898D98C6
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9704545d()
{
	level notify(-497086776);
}

/*
	Name: __init__
	Namespace: namespace_ed93e89a
	Checksum: 0x46113FA8
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	function_5355973a();
}

/*
	Name: function_5355973a
	Namespace: namespace_ed93e89a
	Checksum: 0xFFCFCFC8
	Offset: 0xB0
	Size: 0x124
	Parameters: 0
	Flags: Linked
*/
function function_5355973a()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	var_edfbccd0 = &item_world_fixup::function_e70fa91c;
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_218c23f79bec44e2", #"hash_ae7cd5bcb26ed4");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_63e44c0150bb5992", #"hash_73a96a34fef07711");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_45a2c2712690bd0", #"hash_46278665675794d3");
	namespace_1c7b37c6::item_replacer(var_74257310, #"hash_79d7d5e206eaf770", #"hash_55c0a68941dcc80b");
}

