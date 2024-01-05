#using script_54f593f5beb1464a;
#using script_2a30ac7aa0ee8988;

#namespace namespace_9be0edfa;

/*
	Name: __init__
	Namespace: namespace_9be0edfa
	Checksum: 0x113623DE
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	function_a1302aca();
}

/*
	Name: function_a1302aca
	Namespace: namespace_9be0edfa
	Checksum: 0xC981266F
	Offset: 0x90
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_a1302aca()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	var_edfbccd0 = &item_world_fixup::function_e70fa91c;
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_218c23f79bec44e2", #"hash_76f3a790ba92b7db");
}

