#using script_309ce7f5a9a023de;
#using script_644007a8c3885fc;

#namespace namespace_794c7965;

/*
	Name: __init__
	Namespace: namespace_794c7965
	Checksum: 0x6B8F2D71
	Offset: 0x140
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	function_e420bad2();
}

/*
	Name: function_e420bad2
	Namespace: namespace_794c7965
	Checksum: 0x8A5018B4
	Offset: 0x160
	Size: 0x57C
	Parameters: 0
	Flags: None
*/
function function_e420bad2()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	var_edfbccd0 = &item_world_fixup::function_e70fa91c;
	if(is_true(getgametypesetting(#"wzweaponstest")))
	{
		str_list = #"weapons_test";
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"world_base_event_parent", str_list + "_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"equipment_list_low", str_list + "_equipment_list_good");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"equipment_list_med", str_list + "_equipment_list_good");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"equipment_list_good", str_list + "_equipment_list_good");
		namespace_1c7b37c6::item_replacer(var_edfbccd0, #"supply_stash_parent", str_list + "_supply_stash_parent");
		namespace_1c7b37c6::item_replacer(var_edfbccd0, #"supply_stash_parent_dlc1", str_list + "_supply_stash_parent");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_30dcaca16025cb02", str_list + "_guns_gold");
		namespace_1c7b37c6::item_replacer(var_74257310, #"health_item_medium", #"health_item_squad");
		namespace_1c7b37c6::item_replacer(var_74257310, #"health_item_large", #"health_item_squad");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_zombie_dlc1", str_list + "_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_pistols_dlc1", str_list + "_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_shotguns_dlc1", str_list + "_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_smgs_dlc1", str_list + "_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_ars_dlc1", str_list + "_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_trs_dlc1", str_list + "_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_lmgs_dlc1", str_list + "_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_gold_parent", str_list + "_guns_gold");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_gold_parent_dlc1", str_list + "_guns_gold");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot1_dlc1", str_list + "_supply_stash_slot1");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot2_dlc1", str_list + "_supply_stash_slot2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot3_dlc1", str_list + "_supply_stash_slot3");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot4_dlc1", str_list + "_supply_stash_slot4");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot5_dlc1", str_list + "_supply_stash_slot5");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot1", str_list + "_supply_stash_slot1");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot2", str_list + "_supply_stash_slot2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot3", str_list + "_supply_stash_slot3");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot4", str_list + "_supply_stash_slot4");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot5", str_list + "_supply_stash_slot5");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_operator_mod_weapons", str_list + "_guns_operator");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_gold_guns", str_list + "_guns_gold");
	}
}

