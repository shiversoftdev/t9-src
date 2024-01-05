#using scripts\core_common\util_shared.gsc;
#using script_54f593f5beb1464a;
#using script_2a30ac7aa0ee8988;

#namespace namespace_96ab18d4;

/*
	Name: __init__
	Namespace: namespace_96ab18d4
	Checksum: 0x871E2140
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	function_6df391ab();
}

/*
	Name: function_6df391ab
	Namespace: namespace_96ab18d4
	Checksum: 0xCDBCF637
	Offset: 0xB0
	Size: 0x20DC
	Parameters: 0
	Flags: None
*/
function function_6df391ab()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	gametype = util::get_game_type();
	var_cf96feb3 = array("groundwar_base");
	if(gametype != "groundwar_base")
	{
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_2c95c4c0bf11c2d6", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_3e3b0dd6f23187eb", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_137d6986edd174ff", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_232380d7c94ac005", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_4705ba88038abc29", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_4e11d579b21c2140", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_7e4d62317f83750d", #"hash_5f77f9db644aa7b2");
	}
	if(isinarray(var_cf96feb3, gametype))
	{
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_atv", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_12cd1dd2b05b0b78", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_cargo_truck", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_3b1a45effd27050", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_motorcycle", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_muscle_car", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_4db7961fe16edf57", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_159e4e48721d6125", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_suv", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_suv_police", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_19b0005ca3a8c6c", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_4748761d5bf2d25a", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_tank", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_zodiac", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_18fb285aa313e821", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_1fa35d6531b6441e", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_64604aee91f4fc0a", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_32decf8f5b9557fa", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_31be38307768aac2", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_heli", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_heli_police", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_18134e61b5fb4bd0", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_5c41d8b4c675c63", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_arav", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_77502a4dc5ec85e8", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_pbr", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_pbr_police", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_3529e2fc96b06b88", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_21b6e6141157e65a", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_7bbaf1bdd50f5c78", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_1bcf2ad3d97bfde", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_4efccac910b4e0bf", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_5b29f8214752981d", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_618675e83d84bca0", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_6096fa4278a2bab0", #"hash_5f77f9db644aa7b2");
		return;
	}
	if(!is_true(getgametypesetting(#"hash_322026c0342869d1")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"quad_wz_vehicle", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"quad_wz_vehicle_black", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"quad_wz_vehicle_blue", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"quad_wz_vehicle_green", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"quad_wz_vehicle_police", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"quad_wz_vehicle_red", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"quad_wz_vehicle_tan", #"");
	}
	if(!is_true(getgametypesetting(#"hash_14fd184091ff1af")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"cargo_truck_wz_vehicle", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"cargo_truck_wz_vehicle_dark", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"cargo_truck_wz_vehicle_green", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"cargo_truck_wz_vehicle_tan", #"");
	}
	if(!is_true(getgametypesetting(#"hash_2683a105198a7407")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"helicopter_light_wz_vehicle", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"helicopter_light_wz_vehicle_police", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"helicopter_light_wz_vehicle_black", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"helicopter_light_wz_vehicle_dark", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"helicopter_light_wz_vehicle_grey", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"helicopter_light_wz_vehicle_tan", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_7ca84803c4602acc", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"helicopter_attack_wz_vehicle_tan", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"helicopter_attack_wz_vehicle_grey", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"helicopter_attack_wz_vehicle_dark", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"helicopter_attack_wz_vehicle_black", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"helicopter_attack_wz_vehicle_green", #"");
	}
	if(!is_true(getgametypesetting(#"hash_290721f8deb6ef5e")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"zodiac_wz_vehicle", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"zodiac_wz_vehicle_black", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"zodiac_wz_vehicle_grey", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"zodiac_wz_vehicle_odg", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_55765d159b181598", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_2e0ae5eedfb7250a", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_276d37599f9fba37", #"");
	}
	if(!is_true(getgametypesetting(#"hash_1ebf97988141c498")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"fav_wz_vehicle", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"fav_wz_vehicle_blk", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"fav_wz_vehicle_grn", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"fav_wz_vehicle_tan", #"");
	}
	if(!is_true(getgametypesetting(#"hash_1e346fbfe02f1294")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"pbr_wz_vehicle", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"pbr_wz_vehicle_black", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"pbr_wz_vehicle_green", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"pbr_wz_vehicle_grey", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"pbr_wz_vehicle_tan", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"pbr_wz_vehicle_police", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_27d2bce5c0245346", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_446d59c13e5599ee", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_42676c3b29259308", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_565bd386573c89aa", #"");
	}
	if(!is_true(getgametypesetting(#"hash_429521a79f75a327")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"muscle_car_wz_vehicle", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"muscle_car_wz_vehicle_black", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"muscle_car_wz_vehicle_blue", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"muscle_car_wz_vehicle_green", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"muscle_car_wz_vehicle_orange", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"muscle_car_wz_vehicle_red", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"muscle_car_wz_vehicle_white", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"muscle_car_wz_vehicle_yellow", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"muscle_car_wz_vehicle_bandit_black", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"muscle_car_wz_vehicle_racing_green", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"muscle_car_wz_vehicle_phantom", #"");
	}
	if(!is_true(getgametypesetting(#"hash_3724e6bfee03ce6e")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"suv_wz_vehicle", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"suv_wz_vehicle_black", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"suv_wz_vehicle_grey", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"suv_wz_vehicle_met_grey", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"suv_wz_vehicle_white", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"suv_wz_vehicle_private_security", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"suv_police_wz_vehicle", #"");
	}
	if(!is_true(getgametypesetting(#"hash_25fa292c7fc561b8")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"tank_wz_vehicle", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"tank_wz_vehicle_black", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"tank_wz_vehicle_green", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"tank_wz_vehicle_grey", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"tank_wz_vehicle_tan", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_31156fe36f406544", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_4324f07170c9ddfc", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_4b3f80c0ae73c1e6", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_1e3f4a8e72374c40", #"");
	}
	if(!is_true(getgametypesetting(#"hash_2ebcaa6630ba8fd5")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"motorcycle_wz_vehicle", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_7dfcfdef6dfc1511", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_4b45a5a12ea8b27b", #"");
	}
	if(!is_true(getgametypesetting(#"hash_1ca94a3bd057f19f")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_2f79ccf4b9d302b0", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_16fc0e3cc6dfbe8", #"");
	}
	if(!is_true(getgametypesetting(#"hash_5c90286f1514c76")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_6023623f2157dd1c", #"");
	}
	if(!is_true(getgametypesetting(#"hash_656fd3c508d1d33e")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_5cbd5f5dc8686724", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_40b61eaa58085224", #"");
	}
	if(!is_true(getgametypesetting(#"hash_35e6177743dac957")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_214467a9a775836e", #"");
	}
	if(!is_true(getgametypesetting(#"hash_460af55ecefb11f")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_3a26a0dc9d191f93", #"");
	}
	if(!is_true(getgametypesetting(#"hash_1d708093c2664515")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_7f10eac247187a3f", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_64791d8f21efe141", #"");
	}
	if(!is_true(getgametypesetting(#"hash_497a2cbff8af4988")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_7af0d3d0f14addb6", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_10d165b17583d57a", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_6512a597ae16e88e", #"");
	}
	if(!is_true(getgametypesetting(#"hash_50776bbffc2b6c6d")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_38d4b8be4d2bc641", #"");
	}
	if(!is_true(getgametypesetting(#"hash_b87383d5497a826")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_7e52e33343aaf748", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_659e2340f3ba7410", #"");
	}
	if(!is_true(getgametypesetting(#"hash_51f7292117d41790")))
	{
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_8b682eeff336eca", #"");
		namespace_1c7b37c6::item_replacer(var_74257310, #"hash_470df87a0a017e2a", #"");
	}
	if(is_true(getgametypesetting(#"wztestallvehicles")))
	{
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_159e4e48721d6125", #"hash_420abeab1f0adba1");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_atv", #"hash_4aba76ceb9def5c8");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_cargo_truck", #"hash_e337ee5d12813");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_19b0005ca3a8c6c", #"hash_72083d9a8a873599");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_arav", #"hash_6f8362fe5cab627b");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_heli", #"hash_3ffbf9051e22a760");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_pbr", #"hash_24f73a36dd4d10e3");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"open_skyscraper_vehicles_tank", #"hash_790c3e289d5389a3");
	}
	else if(!is_true(getgametypesetting(#"wztestallvehicles")))
	{
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_3529e2fc96b06b88", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_21b6e6141157e65a", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_7bbaf1bdd50f5c78", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_1bcf2ad3d97bfde", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_4efccac910b4e0bf", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_5b29f8214752981d", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_618675e83d84bca0", #"hash_5f77f9db644aa7b2");
		namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_6096fa4278a2bab0", #"hash_5f77f9db644aa7b2");
	}
}

