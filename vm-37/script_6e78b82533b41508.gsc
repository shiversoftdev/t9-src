#using script_54f593f5beb1464a;
#using script_2a30ac7aa0ee8988;

#namespace namespace_8adbca95;

/*
	Name: __init__
	Namespace: namespace_8adbca95
	Checksum: 0x1A137C7A
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	function_c77b33db();
}

/*
	Name: function_c77b33db
	Namespace: namespace_8adbca95
	Checksum: 0x489E4298
	Offset: 0x90
	Size: 0x9D4
	Parameters: 0
	Flags: None
*/
function function_c77b33db()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	if(is_true(getgametypesetting(#"hash_3109a8794543000f")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"ammo_type_338_item", #"ammo_type_9mm_item");
		namespace_1c7b37c6::item_replacer(var_74257310, #"ammo_type_762_item", #"ammo_type_12ga_item");
		namespace_1c7b37c6::item_replacer(var_74257310, #"ammo_type_50cal_item", #"ammo_type_9mm_item");
		namespace_1c7b37c6::item_replacer(var_74257310, #"ammo_type_556_item", #"ammo_type_45_item");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_ars_dlc1", #"closequarters_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_trs_dlc1", #"closequarters_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_lmgs_dlc1", #"closequarters_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_snipers_dlc1", #"closequarters_guns");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_gold_parent_dlc1", #"closequarters_guns_gold");
		namespace_1c7b37c6::item_replacer(var_74257310, #"warmachine_wz_item", #"launcher_standard_t8_item");
		namespace_1c7b37c6::item_replacer(var_74257310, #"flamethrower_wz_item", #"launcher_standard_t8_item");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot1_dlc1", #"supply_stash_slot1_closequarters");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot2_dlc1", #"supply_stash_slot2_closequarters");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot3_dlc1", #"supply_stash_slot3_closequarters");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot4_dlc1", #"supply_stash_slot4_closequarters");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot5_dlc1", #"supply_stash_slot5_closequarters");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_operator_mod_weapons", #"supply_stash_operator_mod_weapons_closequarters");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_gold_guns", #"closequarters_guns_gold");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"loot_locker_parent", #"loot_locker_parent_ccf");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"attachment_list_good", #"attachment_list_good_closequarters");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"attachment_list_med", #"attachment_list_med_closequarters");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"consumable_list_low", #"consumable_list_low_closequarters");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_11f313217dbe7186", #"wz_escape_wallbuy_guns_list_closequarters");
		if(is_true(getgametypesetting(#"wzenablewallbuyasylum")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::item_replacer(var_f8a4c541, #"wz_open_skyscrapers_wallbuy_guns_list_asylum", #"wz_open_skyscrapers_wallbuy_guns_list_closequarters");
		}
		if(is_true(getgametypesetting(#"wzenablewallbuydiner")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::item_replacer(var_f8a4c541, #"wz_open_skyscrapers_wallbuy_guns_list_diner", #"wz_open_skyscrapers_wallbuy_guns_list_closequarters");
		}
		if(is_true(getgametypesetting(#"wzenablewallbuycemetary")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::item_replacer(var_f8a4c541, #"wz_open_skyscrapers_wallbuy_guns_list_cemetary", #"wz_open_skyscrapers_wallbuy_guns_list_closequarters");
		}
		if(is_true(getgametypesetting(#"wzenablewallbuyfarm")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::item_replacer(var_f8a4c541, #"wz_open_skyscrapers_wallbuy_guns_list_farm", #"wz_open_skyscrapers_wallbuy_guns_list_closequarters");
		}
		if(is_true(getgametypesetting(#"wzenablewallbuynuketown")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::item_replacer(var_f8a4c541, #"wz_open_skyscrapers_wallbuy_guns_list_nuketown", #"wz_open_skyscrapers_wallbuy_guns_list_closequarters");
		}
		if(is_true(getgametypesetting(#"wzenablewallbuyboxinggym")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::item_replacer(var_f8a4c541, #"wz_open_skyscrapers_wallbuy_guns_list_boxing_gym", #"wz_open_skyscrapers_wallbuy_guns_list_closequarters");
		}
		if(is_true(getgametypesetting(#"wzenablewallbuyghosttown")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::item_replacer(var_f8a4c541, #"wz_open_skyscrapers_wallbuy_guns_list_ghosttown", #"wz_open_skyscrapers_wallbuy_guns_list_closequarters");
		}
		if(is_true(getgametypesetting(#"wzenablewallbuylighthouse")) || is_true(getgametypesetting(#"hash_232750b87390cbff")))
		{
			namespace_1c7b37c6::item_replacer(var_f8a4c541, #"wz_open_skyscrapers_wallbuy_guns_list_lighthouse", #"wz_open_skyscrapers_wallbuy_guns_list_closequarters");
		}
	}
}

