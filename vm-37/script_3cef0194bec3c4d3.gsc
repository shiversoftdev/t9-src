#using script_309ce7f5a9a023de;
#using script_644007a8c3885fc;

#namespace namespace_8ee97bc;

/*
	Name: __init__
	Namespace: namespace_8ee97bc
	Checksum: 0xA903BDD8
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	function_95ba8fb7();
}

/*
	Name: function_95ba8fb7
	Namespace: namespace_8ee97bc
	Checksum: 0xDB2563DC
	Offset: 0x90
	Size: 0x5CC
	Parameters: 0
	Flags: None
*/
function function_95ba8fb7()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	if(is_true(getgametypesetting(#"wzenableheavymetal")))
	{
		namespace_1c7b37c6::item_remover(var_87d0eef8, #"armor_item_medium");
		namespace_1c7b37c6::item_replacer(var_74257310, #"armor_item_small", #"armor_item_large");
		namespace_1c7b37c6::item_remover(var_87d0eef8, #"health_item_small");
		namespace_1c7b37c6::item_remover(var_87d0eef8, #"hash_1b975e4c6ae8b190");
		namespace_1c7b37c6::item_replacer(var_74257310, #"health_item_medium", #"health_item_large");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_5119794c0791738", #"hash_1bb3938ead724a68");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_ars_dlc1", #"heavymetal_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_launchers_dlc1", #"heavymetal_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_lmgs_dlc1", #"heavymetal_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_pistols_dlc1", #"heavymetal_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_shotguns_dlc1", #"heavymetal_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_smgs_dlc1", #"heavymetal_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_snipers_dlc1", #"heavymetal_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_trs_dlc1", #"heavymetal_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_zombie_dlc1", #"heavymetal_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_gold_parent_dlc1", #"heavymetal_guns_gold");
		namespace_1c7b37c6::item_replacer(var_74257310, #"ammo_type_12ga_item", #"ammo_type_rocket_item");
		namespace_1c7b37c6::item_replacer(var_74257310, #"ammo_type_338_item", #"ammo_type_50cal_item");
		namespace_1c7b37c6::item_replacer(var_74257310, #"ammo_type_45_item", #"ammo_type_762_item");
		namespace_1c7b37c6::item_replacer(var_74257310, #"ammo_type_9mm_item", #"ammo_type_556_item");
		namespace_1c7b37c6::item_replacer(var_74257310, #"ammo_type_rocket_item", #"ammo_type_rocket_item");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot1_dlc1", #"supply_stash_slot1_heavymetal");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot2_dlc1", #"supply_stash_slot2_heavymetal");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot3_dlc1", #"supply_stash_slot3_heavymetal");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot4_dlc1", #"supply_stash_slot4_heavymetal");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot5_dlc1", #"supply_stash_slot5_heavymetal");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_operator_mod_weapons", #"heavymetal_guns_operator");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_gold_guns", #"heavymetal_guns_gold");
	}
}

