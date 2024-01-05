#using script_309ce7f5a9a023de;
#using script_644007a8c3885fc;

#namespace namespace_d16db92;

/*
	Name: __init__
	Namespace: namespace_d16db92
	Checksum: 0xA1FE0EB5
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	function_b01adb59();
}

/*
	Name: function_b01adb59
	Namespace: namespace_d16db92
	Checksum: 0x2DD86F03
	Offset: 0x90
	Size: 0x524
	Parameters: 0
	Flags: None
*/
function function_b01adb59()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	if(is_true(getgametypesetting(#"hash_3083d02ea0f5761c")))
	{
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"equipment_list_good", #"hash_3a8a0438d42ca57d");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"health_list_good", #"health_list_good_nothing");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"gear_list_good", #"gear_list_good_nothing");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_launchers_dlc1", #"guns_launchers_dlc1_limit_world_high_value");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"equipment_list_zombie", #"equipment_list_zombie_no_acid");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"guns_gold_parent_dlc1", #"guns_gold_parent_dlc1_limit_world_high_value");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_5d3928f724e1cadf", #"ammo_stash_parent_dlc1_limit_world_high_value");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_parent_dlc1", #"supply_stash_parent_dlc1_limit_world_high_value");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot1_dlc1", #"supply_stash_slot1_dlc1_limit_high_world_value");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot2_dlc1", #"supply_stash_slot2_dlc1_limit_world_high_value");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot3_dlc1", #"supply_stash_slot3_dlc1_limit_world_high_value");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"supply_stash_slot4_dlc1", #"supply_stash_slot4_dlc1_with_conc");
	}
	if(is_true(getgametypesetting(#"wzenablehotpursuit")))
	{
		namespace_1c7b37c6::item_remover(var_87d0eef8, #"perk_item_outlander");
		namespace_1c7b37c6::item_remover(var_87d0eef8, #"recon_car_wz_item");
	}
	if(is_true(getgametypesetting(#"wzenablebountyhuntervehicles")) && !is_true(getgametypesetting(#"wztestallvehicles")))
	{
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_atv", #"open_skyscraper_vehicles_atv_police");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_12cd1dd2b05b0b78", #"hash_17040e317630b65b");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_cargo_truck", #"open_skyscraper_vehicles_suv_police");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_heli", #"open_skyscraper_vehicles_heli_police");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_18134e61b5fb4bd0", #"hash_5c41d8b4c675c63");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_77502a4dc5ec85e8", #"hash_409deedc029d1655");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_pbr", #"open_skyscraper_vehicles_pbr_police");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_3b1a45effd27050", #"hash_409deedc029d1655");
	}
}

