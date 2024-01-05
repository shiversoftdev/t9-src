#using script_4ce5d94e8c797350;
#using script_63d1562b37284458;
#using scripts\core_common\scene_shared.gsc;
#using script_5b4706e8af2ca31b;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\compass.gsc;
#using script_d9b5c8b1ad38ef5;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace namespace_f22a3322;

/*
	Name: function_5d507edb
	Namespace: namespace_f22a3322
	Checksum: 0x6CFE05DD
	Offset: 0xDD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5d507edb()
{
	level notify(-1717840667);
}

/*
	Name: init
	Namespace: namespace_f22a3322
	Checksum: 0x427EEDAE
	Offset: 0xDF0
	Size: 0x4FC
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	callback::on_spawned(&function_44b1279a);
	level.var_65c43c31 = [13:"zone_board_office", 12:"zone_board_room", 11:"zone_service_tunnels", 10:"zone_bunker_entrance", 9:"zone_pa_room_02", 8:"zone_pa_room_01", 7:"zone_board_room_02", 6:"zone_board_room_01", 5:"zone_service_tunnels_03", 4:"zone_service_tunnels_02", 3:"zone_service_tunnels_01", 2:"zone_bunker_entrance_03", 1:"zone_bunker_entrance_02", 0:"zone_bunker_entrance_01"];
	level.var_707f916f = [11:"zone_observation", 10:"zone_service_tunnels_03", 9:"zone_bunker_entrance_01", 8:"zone_video_store_roof", 7:"zone_anytown_usa_backlot", 6:"zone_main_street_bridge", 5:"zone_high_tide_bar_roof", 4:"zone_xxx_club_roof", 3:"zone_main_street_backlot", 2:"zone_helipads_portal_room", 1:"zone_helipads_3", 0:"zone_helipads"];
	level.var_dc2ca204 = [4:"zone_helipads_portal_room", 3:"zone_helipads_4", 2:"zone_helipads_3", 1:"zone_helipads_2", 0:"zone_helipads"];
	level.var_6097ff89 = [13:"zone_high_tide_bar_roof", 12:"zone_high_tide_bar", 11:"zone_pizza_parlor", 10:"zone_donuts", 9:"zone_pizza_kitchen", 8:"zone_xxx_club_roof", 7:"zone_xxx_club", 6:"zone_diner", 5:"zone_deck_bar", 4:"zone_main_street_bridge", 3:"zone_main_street_02", 2:"zone_main_street_01", 1:"zone_main_street", 0:"zone_main_street_backlot"];
	level.var_2f941a56 = [16:"zone_anytown_usa_rooftops", 15:"zone_concessions", 14:"zone_cinema", 13:"zone_tv_repair", 12:"zone_video_store_roof", 11:"zone_video_store_2f", 10:"zone_video_store", 9:"zone_arcade", 8:"zone_anytown_usa_west_2", 7:"zone_anytown_usa_west", 6:"zone_drinks_bar_roof", 5:"zone_drinks_bar", 4:"zone_burger_town_roof", 3:"zone_burger_town", 2:"zone_anytown_usa_east_2", 1:"zone_anytown_usa_east", 0:"zone_anytown_usa_backlot"];
	level.var_359fd531 = level.var_65c43c31;
	level.var_6eacc74a = arraycombine(level.var_6097ff89, level.var_2f941a56);
	level.var_c9350d57 = [0:"zone_observation"];
	level.var_aa3b88c5 = &function_27028b8e;
	level.var_27028b8e = &function_27028b8e;
	level.var_662dc783 = &function_6e486b1;
}

/*
	Name: zone_init
	Namespace: namespace_f22a3322
	Checksum: 0x4D315645
	Offset: 0x12F8
	Size: 0x302C
	Parameters: 0
	Flags: None
*/
function zone_init()
{
	level flag::set("always_on");
	zm_zonemgr::zone_init("zone_helipads");
	zm_zonemgr::zone_init("zone_main_street_backlot");
	zm_zonemgr::zone_init("zone_anytown_usa_west");
	zm_zonemgr::zone_init("zone_bunker_entrance_01");
	zm_zonemgr::zone_init("zone_observation");
	zm_zonemgr::zone_init("zone_facility_shell_rooftop");
	zm_zonemgr::zone_init("zone_ndu_room");
	zm_zonemgr::zone_init("zone_intermission");
	if(zm_utility::is_ee_enabled())
	{
		zm_zonemgr::zone_init("zone_pizza_kitchen");
		zm_zonemgr::enable_zone("zone_pizza_kitchen");
	}
	zm_zonemgr::enable_zone("zone_helipads");
	zm_zonemgr::enable_zone("zone_facility_shell_rooftop");
	zm_zonemgr::enable_zone("zone_ndu_room");
	zm_zonemgr::add_adjacent_zone("zone_helipads", "zone_helipads_2", "always_on", 0);
	zm_zonemgr::add_adjacent_zone("zone_helipads", "zone_helipads_3", "always_on", 0);
	zm_zonemgr::add_adjacent_zone("zone_helipads", "zone_helipads_4", "always_on", 0);
	zm_zonemgr::add_adjacent_zone("zone_helipads_2", "zone_helipads_3", "always_on", 0);
	zm_zonemgr::add_adjacent_zone("zone_helipads_2", "zone_helipads_4", "always_on", 0);
	zm_zonemgr::add_adjacent_zone("zone_helipads_3", "zone_helipads_4", "always_on", 0);
	zm_zonemgr::add_adjacent_zone("zone_helipads_3", "zone_helipads_portal_room", "connect_helipad_to_portal", 0);
	zm_zonemgr::add_adjacent_zone("zone_main_street_backlot", "zone_main_street_01", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_main_street_backlot", "zone_deck_bar", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_main_street_backlot", "zone_donuts", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_main_street_01", "zone_donuts", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_main_street_01", "zone_deck_bar", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_main_street_01", "zone_diner", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_main_street_01", "zone_pizza_parlor", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_main_street_01", "zone_main_street_02", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_main_street_01", "zone_xxx_club", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_main_street_01", "zone_high_tide_bar", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_donuts", "zone_main_street_backlot", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_donuts", "zone_main_street_01", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_donuts", "zone_deck_bar", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_donuts", "zone_pizza_parlor", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_donuts", "zone_diner", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_deck_bar", "zone_main_street_backlot", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_deck_bar", "zone_main_street_01", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_deck_bar", "zone_donuts", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_deck_bar", "zone_pizza_parlor", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_deck_bar", "zone_diner", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_main_street_02", "zone_main_street_01", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_main_street_02", "zone_donuts", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_main_street_02", "zone_deck_bar", "connect_backlot_to_mainstreet");
	zm_zonemgr::add_adjacent_zone("zone_main_street_02", "zone_xxx_club", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_main_street_02", "zone_high_tide_bar", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_main_street_02", "zone_main_street_03", "main_street_tunnel_open");
	zm_zonemgr::add_adjacent_zone("zone_main_street_02", "zone_main_street_bridge", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_pizza_kitchen", "zone_pizza_parlor", "kitchen_door_open");
	zm_zonemgr::add_adjacent_zone("zone_pizza_parlor", "zone_pizza_kitchen", "kitchen_door_open");
	zm_zonemgr::add_adjacent_zone("zone_pizza_parlor", "zone_main_street_01", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_pizza_parlor", "zone_donuts", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_pizza_parlor", "zone_deck_bar", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_pizza_parlor", "zone_high_tide_bar", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_pizza_parlor", "zone_high_tide_bar_roof", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_high_tide_bar", "zone_pizza_parlor", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_high_tide_bar", "zone_main_street_01", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_high_tide_bar", "zone_main_street_02", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_high_tide_bar", "zone_xxx_club", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_high_tide_bar", "zone_high_tide_bar_roof", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_high_tide_bar_roof", "zone_pizza_parlor", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_high_tide_bar_roof", "zone_main_street_02", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_high_tide_bar_roof", "zone_high_tide_bar", "connect_pizza_parlor");
	zm_zonemgr::add_adjacent_zone("zone_high_tide_bar_roof", "zone_xxx_club", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_high_tide_bar_roof", "zone_xxx_club_roof", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_high_tide_bar_roof", "zone_main_street_bridge", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_diner", "zone_donuts", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_diner", "zone_deck_bar", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_diner", "zone_main_street_01", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_diner", "zone_main_street_02", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_diner", "zone_xxx_club", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_diner", "zone_xxx_club_roof", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club", "zone_main_street_01", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club", "zone_main_street_02", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club", "zone_diner", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club", "zone_xxx_club_roof", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club", "zone_high_tide_bar", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club_roof", "zone_main_street_01", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club_roof", "zone_main_street_02", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club_roof", "zone_diner", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club_roof", "zone_xxx_club", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club_roof", "zone_deck_bar", "connect_diner");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club_roof", "zone_high_tide_bar_roof", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_xxx_club_roof", "zone_main_street_bridge", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_main_street_bridge", "zone_high_tide_bar", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_main_street_bridge", "zone_high_tide_bar_roof", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_main_street_bridge", "zone_xxx_club", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_main_street_bridge", "zone_xxx_club_roof", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_main_street_bridge", "zone_main_street_02", "connect_xxx_club_to_high_tide_bar");
	zm_zonemgr::add_adjacent_zone("zone_main_street_03", "zone_main_street_04", "main_street_tunnel_open");
	zm_zonemgr::add_adjacent_zone("zone_main_street_03", "zone_main_street_02", "main_street_tunnel_open");
	zm_zonemgr::add_adjacent_zone("zone_main_street_04", "zone_main_street_03", "main_street_tunnel_open");
	zm_zonemgr::add_adjacent_zone("zone_main_street_04", "zone_main_street_tunnel", "main_street_tunnel_open");
	zm_zonemgr::add_adjacent_zone("zone_main_street_tunnel", "zone_main_street_04", "main_street_tunnel_open");
	zm_zonemgr::add_adjacent_zone("zone_main_street_tunnel", "zone_main_street_tunnel_02", "main_street_tunnel_open");
	zm_zonemgr::add_adjacent_zone("zone_main_street_tunnel_02", "zone_main_street_tunnel", "main_street_tunnel_open");
	level thread function_5077fd82();
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_backlot", "zone_anytown_usa_east", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_backlot", "zone_burger_town", "connect_burger_town");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east", "zone_anytown_usa_backlot", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east", "zone_anytown_usa_east_2", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east", "zone_burger_town", "connect_burger_town");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east", "zone_drinks_bar", "connect_drinks_bar");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east", "zone_tv_repair", "connect_tv_repair");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east", "zone_concessions", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east", "zone_drinks_bar_roof", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east_2", "zone_anytown_usa_east", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east_2", "zone_burger_town", "connect_burger_town");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east_2", "zone_drinks_bar", "connect_drinks_bar");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east_2", "zone_tv_repair", "connect_tv_repair");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east_2", "zone_concessions", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_east_2", "zone_drinks_bar_roof", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_burger_town", "zone_anytown_usa_backlot", "connect_burger_town");
	zm_zonemgr::add_adjacent_zone("zone_burger_town", "zone_anytown_usa_east", "connect_burger_town");
	zm_zonemgr::add_adjacent_zone("zone_burger_town", "zone_anytown_usa_east_2", "connect_burger_town");
	zm_zonemgr::add_adjacent_zone("zone_burger_town", "zone_drinks_bar", "connect_burger_to_drinks");
	zm_zonemgr::add_adjacent_zone("zone_burger_town", "zone_tv_repair", "connect_burger_to_tv");
	zm_zonemgr::add_adjacent_zone("zone_burger_town", "zone_concessions", "connect_burger_to_concessions");
	zm_zonemgr::add_adjacent_zone("zone_drinks_bar", "zone_anytown_usa_east", "connect_drinks_bar");
	zm_zonemgr::add_adjacent_zone("zone_drinks_bar", "zone_anytown_usa_east_2", "connect_drinks_bar");
	zm_zonemgr::add_adjacent_zone("zone_drinks_bar", "zone_tv_repair", "connect_drinks_to_tv");
	zm_zonemgr::add_adjacent_zone("zone_drinks_bar", "zone_concessions", "connect_drinks_to_concessions");
	zm_zonemgr::add_adjacent_zone("zone_drinks_bar", "zone_burger_town", "connect_burger_to_drinks");
	zm_zonemgr::add_adjacent_zone("zone_drinks_bar", "zone_drinks_bar_roof", "connect_drinks_bar");
	zm_zonemgr::add_adjacent_zone("zone_tv_repair", "zone_anytown_usa_east", "connect_tv_repair");
	zm_zonemgr::add_adjacent_zone("zone_tv_repair", "zone_anytown_usa_east_2", "connect_tv_repair");
	zm_zonemgr::add_adjacent_zone("zone_tv_repair", "zone_drinks_bar", "connect_drinks_to_tv");
	zm_zonemgr::add_adjacent_zone("zone_tv_repair", "zone_cinema", "connect_tv_to_cinema_concessions");
	zm_zonemgr::add_adjacent_zone("zone_tv_repair", "zone_concessions", "connect_tv_to_cinema_concessions");
	zm_zonemgr::add_adjacent_zone("zone_tv_repair", "zone_burger_town", "connect_burger_to_tv");
	zm_zonemgr::add_adjacent_zone("zone_tv_repair", "zone_anytown_usa_west", "connect_tv_repair");
	zm_zonemgr::add_adjacent_zone("zone_tv_repair", "zone_anytown_usa_west_2", "connect_tv_repair");
	zm_zonemgr::add_adjacent_zone("zone_tv_repair", "zone_video_store", "connect_tv_to_video_arcade");
	zm_zonemgr::add_adjacent_zone("zone_tv_repair", "zone_arcade", "connect_tv_to_video_arcade");
	zm_zonemgr::add_adjacent_zone("zone_concessions", "zone_anytown_usa_east", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_concessions", "zone_anytown_usa_east_2", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_concessions", "zone_burger_town", "connect_burger_to_concessions");
	zm_zonemgr::add_adjacent_zone("zone_concessions", "zone_drinks_bar", "connect_drinks_to_concessions");
	zm_zonemgr::add_adjacent_zone("zone_concessions", "zone_cinema", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_concessions", "zone_anytown_usa_west", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_cinema", "zone_anytown_usa_east_2", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_cinema", "zone_concessions", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_cinema", "zone_burger_town", "connect_burger_to_concessions");
	zm_zonemgr::add_adjacent_zone("zone_cinema", "zone_anytown_usa_west", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_cinema", "zone_anytown_usa_west_2", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_cinema", "zone_tv_repair", "connect_tv_to_cinema_concessions");
	zm_zonemgr::add_adjacent_zone("zone_cinema", "zone_video_store", "connect_cinema_to_video_arcade");
	zm_zonemgr::add_adjacent_zone("zone_cinema", "zone_arcade", "connect_cinema_to_video_arcade");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west", "zone_cinema", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west", "zone_anytown_usa_west_2", "connect_anytown_usa_west_zones");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west", "zone_tv_repair", "connect_tv_repair");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west", "zone_video_store", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west", "zone_arcade", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west", "zone_video_store_roof", "connect_anytown_usa_west_zones");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west_2", "zone_cinema", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west_2", "zone_anytown_usa_west", "connect_anytown_usa_west_zones");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west_2", "zone_tv_repair", "connect_tv_repair");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west_2", "zone_video_store", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west_2", "zone_video_store_2f", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_west_2", "zone_arcade", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_arcade", "zone_video_store", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_arcade", "zone_video_store_2f", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_arcade", "zone_video_store_roof", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_arcade", "zone_anytown_usa_west", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_arcade", "zone_anytown_usa_west_2", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store", "zone_arcade", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store", "zone_anytown_usa_west", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store", "zone_anytown_usa_west_2", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store", "zone_video_store_roof", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store", "zone_video_store_2f", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store_2f", "zone_arcade", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store_2f", "zone_anytown_usa_west", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store_2f", "zone_anytown_usa_west_2", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store_2f", "zone_video_store_roof", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store_2f", "zone_video_store", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store_roof", "zone_arcade", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store_roof", "zone_cinema", "connect_cinema");
	zm_zonemgr::add_adjacent_zone("zone_video_store_roof", "zone_anytown_usa_west", "connect_anytown_usa_west_zones");
	zm_zonemgr::add_adjacent_zone("zone_video_store_roof", "zone_anytown_usa_west_2", "connect_anytown_usa_west_zones");
	zm_zonemgr::add_adjacent_zone("zone_video_store_roof", "zone_video_store_2f", "connect_video_store");
	zm_zonemgr::add_adjacent_zone("zone_video_store_roof", "zone_anytown_usa_rooftops", "connect_anytown_usa_rooftops");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_rooftops", "zone_video_store_roof", "connect_anytown_usa_rooftops");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_rooftops", "zone_anytown_usa_west_2", "connect_anytown_usa_rooftops");
	zm_zonemgr::add_adjacent_zone("zone_anytown_usa_rooftops", "zone_drinks_bar_roof", "connect_anytown_usa_rooftops");
	zm_zonemgr::add_adjacent_zone("zone_drinks_bar_roof", "zone_anytown_usa_rooftops", "connect_anytown_usa_rooftops");
	zm_zonemgr::add_adjacent_zone("zone_drinks_bar_roof", "zone_burger_town_roof", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_drinks_bar_roof", "zone_anytown_usa_east", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_drinks_bar_roof", "zone_anytown_usa_east_2", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_drinks_bar_roof", "zone_drinks_bar", "connect_drinks_bar");
	zm_zonemgr::add_adjacent_zone("zone_burger_town_roof", "zone_anytown_usa_rooftops", "connect_anytown_usa_rooftops");
	zm_zonemgr::add_adjacent_zone("zone_burger_town_roof", "zone_drinks_bar_roof", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_burger_town_roof", "zone_anytown_usa_east", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_burger_town_roof", "zone_anytown_usa_east_2", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_adjacent_zone("zone_burger_town_roof", "zone_drinks_bar", "connect_drinks_bar");
	zm_zonemgr::add_zone_flags("connect_cinema", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_zone_flags("connect_tv_repair", "connect_anytown_usa_east_zones");
	zm_zonemgr::add_zone_flags("connect_anytown_usa_rooftops", "connect_anytown_usa_east_zones");
	level thread function_e20c4fba();
	level thread function_a7b4cb9e();
	level thread function_2803d91d();
	level thread function_e41728ee();
	level thread function_da725fc1();
	level thread function_68e1cb94();
	level thread function_158bd6c6();
	level thread function_dde97037();
	zm_zonemgr::add_adjacent_zone("zone_bunker_entrance_01", "zone_bunker_entrance_02", "connect_bunker_entrance_zones");
	zm_zonemgr::add_adjacent_zone("zone_bunker_entrance_01", "zone_bunker_entrance_03", "connect_bunker_entrance_zones");
	zm_zonemgr::add_adjacent_zone("zone_bunker_entrance_02", "zone_bunker_entrance_01", "connect_bunker_entrance_zones");
	zm_zonemgr::add_adjacent_zone("zone_bunker_entrance_02", "zone_bunker_entrance_03", "connect_bunker_entrance_zones");
	zm_zonemgr::add_adjacent_zone("zone_bunker_entrance_02", "zone_board_room_01", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_bunker_entrance_03", "zone_bunker_entrance_01", "connect_bunker_entrance_zones");
	zm_zonemgr::add_adjacent_zone("zone_bunker_entrance_03", "zone_bunker_entrance_02", "connect_bunker_entrance_zones");
	zm_zonemgr::add_adjacent_zone("zone_bunker_entrance_03", "zone_board_room_01", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_bunker_entrance_03", "zone_service_tunnels_01", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_bunker_entrance_03", "zone_service_tunnels_02", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_bunker_entrance_03", "zone_pa_room_01", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_01", "zone_bunker_entrance_02", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_01", "zone_bunker_entrance_03", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_01", "zone_service_tunnels_02", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_01", "zone_pa_room_01", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_01", "zone_pa_room_02", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_02", "zone_bunker_entrance_03", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_02", "zone_service_tunnels_01", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_02", "zone_service_tunnels_03", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_02", "zone_pa_room_01", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_02", "zone_pa_room_02", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_02", "zone_board_room_02", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_03", "zone_service_tunnels_01", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_03", "zone_service_tunnels_02", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_03", "zone_pa_room_01", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_03", "zone_pa_room_02", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_service_tunnels_03", "zone_board_room_02", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_pa_room_01", "zone_pa_room_02", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_pa_room_01", "zone_service_tunnels_01", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_pa_room_01", "zone_service_tunnels_02", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_pa_room_01", "zone_service_tunnels_03", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_pa_room_02", "zone_pa_room_01", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_pa_room_02", "zone_service_tunnels_01", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_pa_room_02", "zone_service_tunnels_02", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_pa_room_02", "zone_service_tunnels_03", "connect_service_tunnels");
	zm_zonemgr::add_adjacent_zone("zone_board_room_01", "zone_bunker_entrance_01", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_board_room_01", "zone_bunker_entrance_02", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_board_room_01", "zone_bunker_entrance_03", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_board_room_01", "zone_board_room_02", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_board_room_01", "zone_service_tunnels_02", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_board_room_02", "zone_bunker_entrance_02", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_board_room_02", "zone_service_tunnels_02", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_board_room_02", "zone_service_tunnels_03", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_board_room_02", "zone_board_room_01", "connect_board_room");
	zm_zonemgr::add_adjacent_zone("zone_town_square_01", "zone_town_square_02", #"hash_2145c074d359b87d", 0);
	zm_zonemgr::add_adjacent_zone("zone_town_square_01", "zone_town_square_03", #"hash_2145c074d359b87d", 0);
	zm_zonemgr::add_adjacent_zone("zone_town_square_01", "zone_town_square_04", #"hash_2145c074d359b87d", 0);
	zm_zonemgr::add_adjacent_zone("zone_town_square_02", "zone_town_square_03", #"hash_2145c074d359b87d", 0);
	zm_zonemgr::add_adjacent_zone("zone_town_square_02", "zone_town_square_04", #"hash_2145c074d359b87d", 0);
	zm_zonemgr::add_adjacent_zone("zone_town_square_03", "zone_town_square_04", #"hash_2145c074d359b87d", 0);
	level clientfield::set("" + #"hash_2a35f1483d5f5467", 1);
	level clientfield::set("" + #"hash_deec7a5e441c482", 1);
	level thread function_49779a9c();
	level.ascendstarts = struct::get_array("zm_ascend_begin", "script_noteworthy");
	if(isdefined(level.ascendstarts))
	{
		array::thread_all(level.ascendstarts, &function_8aecc4f0);
	}
	array::thread_all(struct::get_array("zipline_start_zm", "script_noteworthy"), &function_4fc2e560);
	array::thread_all(struct::get_array("zipline_power_gate"), &function_169ac2dd);
	namespace_f0b43eb5::create_challenge(#"hash_24ddbd878df00902", 90, "zone_video_store_roof", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_video_store_roof", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::create_challenge(#"hash_39c9629b7028ed5d", 90, "zone_cinema", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_cinema", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::create_challenge(#"hash_33b83c4a38a3bdca", 90, "zone_arcade", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_arcade", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::create_challenge(#"hash_10eb3850b26d48c", 90, "zone_burger_town", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_burger_town", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::create_challenge(#"hash_402b667a503d4ccb", 90, "zone_video_store", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_video_store", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::create_challenge(#"hash_39e9787c0de0daf1", 90, "zone_anytown_usa_backlot", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_anytown_usa_backlot", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::create_challenge(#"hash_453a742eed680932", 90, "zone_xxx_club_roof", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_xxx_club_roof", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::create_challenge(#"hash_30c036366e17895", 90, "zone_pizza_parlor", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_pizza_parlor", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	s_challenge = namespace_f0b43eb5::create_challenge(#"hash_2c457fb4d5c4a3b9", 90, "zone_dark_aether_lab_upper", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_dark_aether_lab_upper", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	s_challenge.var_4e0096cd = #"hash_19f7784bc90ba3c5";
	s_challenge = namespace_f0b43eb5::create_challenge(#"hash_6cda1bb2296c5334", 90, "zone_dark_aether_lab_lower", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_dark_aether_lab_lower", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	s_challenge.var_4e0096cd = #"hash_366946412ba7b470";
	namespace_f0b43eb5::create_challenge(#"hash_6f2d55d2d3f4d404", 90, "zone_video_store_2f", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_video_store_2f", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::create_challenge(#"hash_173296fcc26f103", 90, "zone_tv_repair", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_tv_repair", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::create_challenge(#"hash_7912ea609d3670e4", 90, "zone_concessions", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_concessions", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	s_challenge = namespace_f0b43eb5::create_challenge(#"hash_1e33eea8d4400452", 90, "zone_drinks_bar", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_drinks_bar", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	s_challenge.var_4e0096cd = #"hash_32100fac4ac8b387";
	namespace_f0b43eb5::create_challenge(#"hash_748d52da3b04b32", 90, "zone_anytown_usa_rooftops", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_anytown_usa_rooftops", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::create_challenge(#"hash_3359139601088551", 90, "zone_drinks_bar_roof", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_drinks_bar_roof", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::create_challenge(#"hash_14d4a43db0399d79", 90, "zone_high_tide_bar_roof", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_high_tide_bar_roof", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::create_challenge(#"hash_3f393a7be6cf192", 90, "zone_xxx_club", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_xxx_club", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::create_challenge(#"hash_5bf8e83a711797f4", 90, "zone_main_street_bridge", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_main_street_bridge", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::create_challenge(#"hash_3182b997bb45c5b", 90, "zone_bunker_entrance_03", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_bunker_entrance_03", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::create_challenge(#"hash_580e3a81d3b46e59", 90, "zone_board_room_01", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_board_room_01", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
}

/*
	Name: function_b9ad8870
	Namespace: namespace_f22a3322
	Checksum: 0x5EE86E18
	Offset: 0x4330
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function function_b9ad8870()
{
	/#
		flag::wait_till("");
		while(true)
		{
			wait(2);
		}
	#/
}

/*
	Name: function_990a7f89
	Namespace: namespace_f22a3322
	Checksum: 0x7E248B2
	Offset: 0x4370
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_990a7f89()
{
	zm_zonemgr::enable_zone("zone_main_street_backlot");
}

/*
	Name: function_4f804075
	Namespace: namespace_f22a3322
	Checksum: 0xB670F628
	Offset: 0x4398
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_4f804075()
{
	zm_zonemgr::enable_zone("zone_anytown_usa_west");
	level flag::set("connect_anytown_usa_west_zones");
}

/*
	Name: function_5c0aa258
	Namespace: namespace_f22a3322
	Checksum: 0xF3B7DBCB
	Offset: 0x43E0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_5c0aa258()
{
	zm_zonemgr::enable_zone("zone_bunker_entrance_01");
	level flag::set("connect_bunker_entrance_zones");
}

/*
	Name: function_904e469e
	Namespace: namespace_f22a3322
	Checksum: 0x5EDE3236
	Offset: 0x4428
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_904e469e()
{
	zm_zonemgr::enable_zone("zone_observation");
	level flag::set(#"hash_79bb6bfeda6a5c");
}

/*
	Name: function_2d12df62
	Namespace: namespace_f22a3322
	Checksum: 0xD708C887
	Offset: 0x4470
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_2d12df62()
{
	zm_zonemgr::enable_zone("zone_town_square_01");
}

/*
	Name: function_5077fd82
	Namespace: namespace_f22a3322
	Checksum: 0x3B0F3F5
	Offset: 0x4498
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_5077fd82()
{
	level endon(#"end_game");
	flag::wait_till_all(array("connect_pizza_parlor", "connect_diner"));
	flag::set("connect_xxx_club_to_high_tide_bar");
}

/*
	Name: function_e20c4fba
	Namespace: namespace_f22a3322
	Checksum: 0x1B448E26
	Offset: 0x4508
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_e20c4fba()
{
	level endon(#"end_game");
	flag::wait_till_all(array("connect_burger_town", "connect_drinks_bar"));
	flag::set("connect_burger_to_drinks");
}

/*
	Name: function_a7b4cb9e
	Namespace: namespace_f22a3322
	Checksum: 0x2B3E55FD
	Offset: 0x4578
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_a7b4cb9e()
{
	level endon(#"end_game");
	flag::wait_till_all(array("connect_burger_town", "connect_tv_repair"));
	flag::set("connect_burger_to_tv");
}

/*
	Name: function_2803d91d
	Namespace: namespace_f22a3322
	Checksum: 0xC798C2BC
	Offset: 0x45E8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_2803d91d()
{
	level endon(#"end_game");
	flag::wait_till_all(array("connect_burger_town", "connect_cinema"));
	flag::set("connect_burger_to_concessions");
}

/*
	Name: function_e41728ee
	Namespace: namespace_f22a3322
	Checksum: 0xC50BC7CA
	Offset: 0x4658
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_e41728ee()
{
	level endon(#"end_game");
	flag::wait_till_all(array("connect_drinks_bar", "connect_tv_repair"));
	flag::set("connect_drinks_to_tv");
}

/*
	Name: function_da725fc1
	Namespace: namespace_f22a3322
	Checksum: 0x59F03FD0
	Offset: 0x46C8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_da725fc1()
{
	level endon(#"end_game");
	flag::wait_till_all(array("connect_drinks_bar", "connect_cinema"));
	flag::set("connect_drinks_to_concessions");
}

/*
	Name: function_68e1cb94
	Namespace: namespace_f22a3322
	Checksum: 0xB88DE63
	Offset: 0x4738
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_68e1cb94()
{
	level endon(#"end_game");
	flag::wait_till_all(array("connect_cinema", "connect_video_store"));
	flag::set("connect_cinema_to_video_arcade");
}

/*
	Name: function_158bd6c6
	Namespace: namespace_f22a3322
	Checksum: 0x960F1FCF
	Offset: 0x47A8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_158bd6c6()
{
	level endon(#"end_game");
	flag::wait_till_all(array("connect_tv_repair", "connect_video_store"));
	flag::set("connect_tv_to_video_arcade");
}

/*
	Name: function_dde97037
	Namespace: namespace_f22a3322
	Checksum: 0x7AE97349
	Offset: 0x4818
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_dde97037()
{
	level endon(#"end_game");
	flag::wait_till_all(array("connect_tv_repair", "connect_cinema"));
	flag::set("connect_tv_to_cinema_concessions");
}

/*
	Name: function_44b1279a
	Namespace: namespace_f22a3322
	Checksum: 0x5D0B005A
	Offset: 0x4888
	Size: 0x4D0
	Parameters: 0
	Flags: None
*/
function function_44b1279a()
{
	self notify("15aa0240692b4ff");
	self endon("15aa0240692b4ff");
	self endon(#"disconnect", #"death");
	self setupminimap("", "amerika");
	self clientfield::set_to_player("" + #"hash_464e0cd19b3b8c12", 0);
	self clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 4);
	self.var_9767e0af = 0;
	util::wait_network_frame();
	while(true)
	{
		if(!isplayer(self))
		{
			return;
		}
		if(!clientfield::function_ec6130f9("" + #"hash_464e0cd19b3b8c12"))
		{
			waitframe(1);
			continue;
		}
		is_player_in_zone = self zm_zonemgr::is_player_in_zone(level.var_65c43c31, 0);
		var_c2858d41 = self clientfield::get_to_player("" + #"hash_464e0cd19b3b8c12");
		if(is_player_in_zone && var_c2858d41 == 0)
		{
			self setupminimap("", "tunnel");
			self clientfield::set_to_player("" + #"hash_464e0cd19b3b8c12", 1);
		}
		else if(!is_player_in_zone && var_c2858d41 == 1)
		{
			self setupminimap("", "amerika");
			self clientfield::set_to_player("" + #"hash_464e0cd19b3b8c12", 0);
		}
		var_6444ee1f = self zm_zonemgr::is_player_in_zone(level.var_6eacc74a, 0);
		var_52764a82 = self zm_zonemgr::is_player_in_zone(level.var_359fd531, 0);
		var_710b2d6e = self clientfield::get_to_player("" + #"hash_4be33f9c734f0cb9");
		if(var_6444ee1f || var_52764a82)
		{
			if(var_6444ee1f && var_710b2d6e != 0)
			{
				self clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 0);
			}
			else if(var_52764a82 && var_710b2d6e != 1)
			{
				self clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 1);
			}
		}
		else if(var_710b2d6e != 4)
		{
			self clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 4);
		}
		var_8a071a7 = self zm_zonemgr::is_player_in_zone("zone_observation", 0);
		if(var_8a071a7 && !is_true(self.var_9767e0af))
		{
			self.var_9767e0af = 1;
			util::setclientsysstate("tritonCmd", "disable", self);
		}
		else if(!var_8a071a7 && is_true(self.var_9767e0af))
		{
			self.var_9767e0af = 0;
			util::setclientsysstate("tritonCmd", "enable", self);
		}
		s_waitresult = undefined;
		s_waitresult = self waittill(#"zone_change");
	}
}

/*
	Name: setupminimap
	Namespace: namespace_f22a3322
	Checksum: 0x228DBDCD
	Offset: 0x4D60
	Size: 0x2A4
	Parameters: 2
	Flags: None
*/
function setupminimap(material, area_name)
{
	corners = territory::get_ent_array("minimap_corner", "targetname");
	var_32af51c9 = [];
	var_aa9f20e7 = [];
	foreach(corner in corners)
	{
		if(corner.script_noteworthy === "tunnel")
		{
			if(!isdefined(var_32af51c9))
			{
				var_32af51c9 = [];
			}
			else if(!isarray(var_32af51c9))
			{
				var_32af51c9 = array(var_32af51c9);
			}
			var_32af51c9[var_32af51c9.size] = corner;
			continue;
		}
		if(!isdefined(var_aa9f20e7))
		{
			var_aa9f20e7 = [];
		}
		else if(!isarray(var_aa9f20e7))
		{
			var_aa9f20e7 = array(var_aa9f20e7);
		}
		var_aa9f20e7[var_aa9f20e7.size] = corner;
	}
	/#
		assert(var_32af51c9.size == 2 && var_aa9f20e7.size == 2, "");
	#/
	if(area_name == "tunnel")
	{
		self compass::function_d6cba2e9(material, var_32af51c9[0].origin[0], var_32af51c9[0].origin[1], var_32af51c9[1].origin[0], var_32af51c9[1].origin[1]);
	}
	if(area_name == "amerika")
	{
		self compass::function_d6cba2e9(material, var_aa9f20e7[0].origin[0], var_aa9f20e7[0].origin[1], var_aa9f20e7[1].origin[0], var_aa9f20e7[1].origin[1]);
	}
}

/*
	Name: function_27028b8e
	Namespace: namespace_f22a3322
	Checksum: 0xEE897CD1
	Offset: 0x5010
	Size: 0x5AE
	Parameters: 1
	Flags: None
*/
function function_27028b8e(str_zone)
{
	if(!isdefined(str_zone))
	{
		return undefined;
	}
	if(isarray(str_zone))
	{
		str_zone = str_zone[0];
	}
	switch(str_zone)
	{
		case "zone_anytown_usa_backlot":
		{
			var_601fee0 = #"hash_13d56fe3ab409e5";
			break;
		}
		case "zone_anytown_usa_east":
		{
			var_601fee0 = #"hash_184b38d3bddc3620";
			break;
		}
		case "zone_drinks_bar_roof":
		{
			var_601fee0 = #"hash_7cc77ccbc8b3f62a";
			break;
		}
		case "zone_anytown_usa_rooftops":
		{
			var_601fee0 = #"hash_6dc19a704897a7a3";
			break;
		}
		case "zone_anytown_usa_west":
		{
			var_601fee0 = #"hash_261ebc5ca63b1d5a";
			break;
		}
		case "zone_arcade":
		{
			var_601fee0 = #"hash_4f1016f8fb60b23e";
			break;
		}
		case "zone_board_room_01":
		{
			var_601fee0 = #"hash_54f3ecaca280008c";
			break;
		}
		case "zone_board_room_02":
		{
			var_601fee0 = #"hash_b204e33898248cf";
			break;
		}
		case "zone_bunker_entrance_03":
		case "zone_bunker_entrance_02":
		case "zone_bunker_entrance_01":
		{
			var_601fee0 = #"hash_47d4a8c4751828ea";
			break;
		}
		case "zone_burger_town":
		{
			var_601fee0 = #"hash_5a9a6d8fdf9e5f58";
			break;
		}
		case "zone_cinema":
		{
			var_601fee0 = #"hash_579d50ea19f0fe9";
			break;
		}
		case "zone_concessions":
		{
			var_601fee0 = #"hash_5a38dd3025ad247f";
			break;
		}
		case "zone_diner":
		{
			var_601fee0 = #"hash_3b6bb42366cfd4aa";
			break;
		}
		case "zone_drinks_bar":
		{
			var_601fee0 = #"hash_547cca8e6424b8f3";
			break;
		}
		case "zone_helipads_portal_room":
		case "zone_helipads_4":
		case "zone_helipads_3":
		case "zone_helipads_2":
		case "zone_helipads":
		{
			var_601fee0 = #"hash_3c025d87182e7e3c";
			break;
		}
		case "zone_high_tide_bar":
		{
			var_601fee0 = #"hash_19e0e208ab46aaf5";
			break;
		}
		case "zone_main_street_02":
		case "zone_main_street_01":
		{
			var_601fee0 = #"hash_37cb3084f1ed10a7";
			break;
		}
		case "zone_main_street_backlot":
		{
			var_601fee0 = #"hash_5b061064f7d4ef36";
			break;
		}
		case "zone_observation":
		{
			var_601fee0 = #"hash_342e6dc1966544a8";
			break;
		}
		case "zone_pizza_parlor":
		{
			var_601fee0 = #"hash_7ce2860b6f3b7061";
			break;
		}
		case "zone_service_tunnels_01":
		case "zone_service_tunnels_02":
		case "zone_service_tunnels_03":
		{
			var_601fee0 = #"hash_72ac36585c1de4c1";
			break;
		}
		case "zone_town_square_01":
		{
			var_601fee0 = #"hash_18ff37374dac36f4";
			break;
		}
		case "zone_tv_repair":
		{
			var_601fee0 = #"hash_229d0feeecd8c374";
			break;
		}
		case "zone_video_store":
		{
			var_601fee0 = #"hash_7115e7d86a5f7a57";
			break;
		}
		case "zone_xxx_club":
		{
			var_601fee0 = #"hash_64e9623136c6d327";
			break;
		}
		case "zone_high_tide_bar_roof":
		{
			var_601fee0 = #"hash_59a9723a6effa74c";
			break;
		}
		case "zone_main_street_bridge":
		{
			var_601fee0 = #"hash_2789b3302c124ddd";
			break;
		}
		case "zone_video_store_roof":
		{
			var_601fee0 = #"hash_22403c671894486";
			break;
		}
		case "zone_video_store_2f":
		{
			var_601fee0 = #"hash_ac2ef2906462ba8";
			break;
		}
		case "zone_xxx_club_roof":
		{
			var_601fee0 = #"hash_3399f0fdbae86fc9";
			break;
		}
		default:
		{
			var_601fee0 = undefined;
			break;
		}
	}
	return var_601fee0;
}

/*
	Name: function_8aecc4f0
	Namespace: namespace_f22a3322
	Checksum: 0xFB106FF9
	Offset: 0x55C8
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_8aecc4f0()
{
	if(isdefined(self.script_flag))
	{
		level flag::wait_till(self.script_flag);
	}
	rappel::function_731b9325(self, 1);
}

/*
	Name: function_4fc2e560
	Namespace: namespace_f22a3322
	Checksum: 0xB616AB7C
	Offset: 0x5618
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_4fc2e560()
{
	level flag::wait_till("power_on1");
	wait(1);
	zipline_player::function_2a1bd467(self);
}

/*
	Name: function_169ac2dd
	Namespace: namespace_f22a3322
	Checksum: 0x10F6543F
	Offset: 0x5660
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_169ac2dd()
{
	scene::add_scene_func(#"p9_fxanim_zm_platinum_zipline_bundle", &function_f63d1381, "init");
	self thread scene::init("p9_fxanim_zm_platinum_zipline_bundle");
	self.var_e1455171 = zm_utility::function_4a4cf79a(#"hash_255e6c8cbb3d4503", self.origin);
	level flag::wait_till("power_on1");
	scene::remove_scene_func(#"p9_fxanim_zm_platinum_zipline_bundle", &function_f63d1381, "init");
	scene::add_scene_func(#"p9_fxanim_zm_platinum_zipline_bundle", &function_88c5fdab, "play");
	self thread scene::play("p9_fxanim_zm_platinum_zipline_bundle");
	if(isdefined(self.var_e1455171))
	{
		zm_utility::function_bc5a54a8(self.var_e1455171);
	}
}

/*
	Name: function_49779a9c
	Namespace: namespace_f22a3322
	Checksum: 0xE7BE3A4B
	Offset: 0x57C8
	Size: 0x14C
	Parameters: 0
	Flags: None
*/
function function_49779a9c()
{
	scene::add_scene_func(#"p9_fxanim_zm_platinum_rappel_bundle", &function_8d8f7e79, "init");
	level thread scene::init("p9_fxanim_zm_platinum_rappel_bundle");
	level flag::wait_till("connect_backlot_to_mainstreet");
	t_door = getent("connect_backlot_to_mainstreet", "script_flag");
	t_door notify(#"hash_57b465b557811eb7");
	scene::remove_scene_func(#"p9_fxanim_zm_platinum_rappel_bundle", &function_8d8f7e79, "init");
	scene::add_scene_func(#"p9_fxanim_zm_platinum_rappel_bundle", &function_2a1cfabb, "play");
	level thread scene::play("p9_fxanim_zm_platinum_rappel_bundle");
}

/*
	Name: function_8d8f7e79
	Namespace: namespace_f22a3322
	Checksum: 0xD90C18B6
	Offset: 0x5920
	Size: 0x6A
	Parameters: 1
	Flags: Private
*/
function private function_8d8f7e79(a_ents)
{
	e_door = a_ents[#"zipline_door"];
	e_door function_619a5c20();
	e_door.var_72910c52 = zm_utility::function_4a4cf79a(#"hash_1b7c3d825c8b5c1a", e_door.origin);
}

/*
	Name: function_2a1cfabb
	Namespace: namespace_f22a3322
	Checksum: 0x43CC4E96
	Offset: 0x5998
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private function_2a1cfabb(a_ents)
{
	e_door = a_ents[#"zipline_door"];
	e_door function_23a29590();
	if(isdefined(e_door.var_72910c52))
	{
		zm_utility::function_bc5a54a8(e_door.var_72910c52);
	}
}

/*
	Name: function_f63d1381
	Namespace: namespace_f22a3322
	Checksum: 0x5267B2FD
	Offset: 0x5A08
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private function_f63d1381(a_ents)
{
	e_door = a_ents[#"zipline_door"];
	e_door function_619a5c20();
}

/*
	Name: function_88c5fdab
	Namespace: namespace_f22a3322
	Checksum: 0x1C5615DF
	Offset: 0x5A50
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private function_88c5fdab(a_ents)
{
	e_door = a_ents[#"zipline_door"];
	e_door function_23a29590();
}

/*
	Name: function_6e486b1
	Namespace: namespace_f22a3322
	Checksum: 0x2BC07D6B
	Offset: 0x5A98
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_6e486b1(var_d3413870)
{
	b_interference = self zm_zonemgr::is_player_in_zone(level.var_65c43c31);
	b_interference = b_interference | self zm_zonemgr::is_player_in_zone("zone_observation");
	return b_interference;
}

