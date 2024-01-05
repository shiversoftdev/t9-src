#using script_30c7fb449869910;
#using scripts\core_common\struct.csc;

#namespace namespace_675f60cc;

/*
	Name: function_62d08106
	Namespace: namespace_675f60cc
	Checksum: 0xF11F2DAA
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_62d08106()
{
	level notify(1741895544);
}

#namespace namespace_c501aa2e;

/*
	Name: init
	Namespace: namespace_c501aa2e
	Checksum: 0x524ABFD6
	Offset: 0x90
	Size: 0xCAC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	doa_pickups::function_c1018360(#"zombietron_beryl", 13, 1, 3, 1, undefined, 8);
	doa_pickups::function_c1018360(#"zombietron_diamond", 13, 2, 3, 1, undefined, 8);
	doa_pickups::function_c1018360(#"zombietron_ruby", 13, 3, 3, 1, undefined, 8);
	doa_pickups::function_c1018360(#"zombietron_sapphire", 13, 4, 3, 1, undefined, 8);
	doa_pickups::function_c1018360(#"hash_42741ff16c0ed21b", 13, 5, 3, 1, undefined, 8);
	doa_pickups::function_c1018360(#"hash_6c36d450c756238", 1, 1, 4, 3, (0, 0, 0), 1);
	doa_pickups::function_c1018360(#"zombietron_goldenturtle", 1, 2, 3, 1.5, (0, 0, 0), 2);
	doa_pickups::function_c1018360(#"hash_5746d78636de50ac", 1, 3, 3, 3, (-70, 80, 0), 3);
	doa_pickups::function_c1018360(#"zombietron_gold_bricks", 1, 4, 2, 3, undefined, 5);
	doa_pickups::function_c1018360(#"zombietron_gold_brick", 1, 5, 1, 3, undefined, 4);
	doa_pickups::function_c1018360(#"zombietron_silver_bricks", 1, 6, 1, 3, undefined, 7);
	doa_pickups::function_c1018360(#"zombietron_silver_brick", 1, 7, 0, 3, undefined, 6);
	doa_pickups::function_c1018360(#"wpn_t9_lmg_light_world", 6, 1, 0, 3);
	doa_pickups::function_c1018360(#"wpn_t9_shotgun_semiauto_world", 6, 2, 0, 2.5);
	doa_pickups::function_c1018360(#"wpn_t9_launcher_standard_world", 6, 3, 0, 2);
	doa_pickups::function_c1018360(#"wpn_t9_grenade_launcher_world", 6, 4, 0, 3);
	doa_pickups::function_c1018360(#"wpn_t9_zm_raygun_world", 6, 5, 0, 3);
	doa_pickups::function_c1018360(#"wpn_t7_mingun_world", 6, 6, 0, 2);
	doa_pickups::function_c1018360(#"wpn_t8_crossbow_special_world", 6, 7, 1, 2.5);
	doa_pickups::function_c1018360(#"zombietron_health_potion", 10, 0, 0, 5, (-90, 0, 70), undefined, 3);
	doa_pickups::function_c1018360(#"hash_1cd12e73082e97ef", 12, 0, 2, 5, (-90, 0, 70), undefined, 3);
	doa_pickups::function_c1018360(#"zombietron_potion_orange", 46, 0, 2, 5, (-90, 0, 70), undefined, 3);
	doa_pickups::function_c1018360(#"zombietron_ammo", 20, 0, 0, 1, undefined, undefined, 3);
	doa_pickups::function_c1018360(#"hash_583a497cd4bc1057", 22, 0, 0, 1);
	doa_pickups::function_c1018360(#"zombietron_boots", 24, 0, 0, 1, (0, 0, 0));
	doa_pickups::function_c1018360(#"zombietron_chicken", 15, 0, 0, 1);
	doa_pickups::function_c1018360(#"zombietron_firstperson", 3, 0, 0, 3, vectorscale((0, 0, -1), 80), undefined, 3);
	doa_pickups::function_c1018360(#"zombietron_monkey_bomb", 27, 0, 0, 1, vectorscale((0, 0, -1), 80));
	doa_pickups::function_c1018360(#"zombietron_tesla_ball", 29, 0, 0, 1, vectorscale((0, 0, -1), 80));
	doa_pickups::function_c1018360(#"zombietron_barrel", 17, 0, 0, 1);
	doa_pickups::function_c1018360(#"zombietron_sawblade", 19, 0, 0, 1, (0, 0, 0));
	doa_pickups::function_c1018360(#"zombietron_sprinkler", 30, 0, 1, 1);
	doa_pickups::function_c1018360(#"zombietron_clock", 25, 0, 1, 1, vectorscale((0, 0, -1), 80));
	doa_pickups::function_c1018360(#"zombietron_boxing_glove", 18, 0, 1, 1);
	doa_pickups::function_c1018360(#"zombietron_coat_of_arms", 26, 0, 1, 1, vectorscale((0, 0, -1), 80));
	doa_pickups::function_c1018360(#"zombietron_hat", 31, 0, 1, 3);
	doa_pickups::function_c1018360(#"zombietron_egg", 32, 0, 1, 1);
	doa_pickups::function_c1018360(#"zombietron_skeleton_fb", 34, 0, 1, 1, vectorscale((-1, 0, 0), 70));
	doa_pickups::function_c1018360(#"zombietron_gift_box", 11, 0, 1, 1, (0, 0, 0));
	doa_pickups::function_c1018360(#"zombietron_lantern", 42, 0, 1, 3, vectorscale((0, 0, 1), 70));
	doa_pickups::function_c1018360(#"zombietron_turret_grenade", 45, 0, 1, 1);
	doa_pickups::function_c1018360(#"zombietron_magnet", 23, 0, 2, 1, (0, 0, 0));
	doa_pickups::function_c1018360(#"zombietron_teddy_bear", 28, 0, 2, 1, vectorscale((-1, 0, -1), 80));
	doa_pickups::function_c1018360(#"zombietron_siegebot_mini", 4, 0, 2, 1, (0, 0, 0));
	doa_pickups::function_c1018360(#"zombietron_hind_scale12", 40, 0, 2, 1);
	doa_pickups::function_c1018360(#"veh_t9_mil_ru_tank_t72_base_doa", 5, 0, 2, 1);
	doa_pickups::function_c1018360(#"zombietron_nuke", 8, 0, 2, 1);
	doa_pickups::function_c1018360(#"zombietron_boost", 9, 0, 1, 1.5, (0, 0, 0));
	doa_pickups::function_c1018360(#"zombietron_umbrella", 21, 0, 2, 1, (0, 0, 0));
	doa_pickups::function_c1018360(#"zombietron_vortexmdl", 43, 0, 2, 1, (0, 0, 0));
	doa_pickups::function_c1018360(#"zombietron_arcademachine", 44, 0, 3, 1, vectorscale((0, 0, 1), 40));
	doa_pickups::function_c1018360(#"zombietron_extra_life", 16, 0, 3, 1, vectorscale((0, 0, -1), 80));
	doa_pickups::function_c1018360(#"zombietron_egg_golden", 33, 0, 3, 1);
	doa_pickups::function_c1018360(#"zombietron_skeleton_key", 14, 0, 4, 3, vectorscale((1, 0, 0), 80));
	doa_pickups::function_c1018360(#"p7_doa_powerup_skull", 36, 0, 4, 1, vectorscale((-1, 0, 0), 70));
	doa_pickups::function_c1018360(#"p7_doa_powerup_skull_red", 37, 0, 4, 1, vectorscale((-1, 0, 0), 70));
	doa_pickups::function_c1018360(#"p7_doa_powerup_skull_purple", 38, 0, 4, 1, vectorscale((-1, 0, 0), 70));
	doa_pickups::function_c1018360(#"zombietron_ladder", 39, 0, 4, 1, vectorscale((0, 0, 1), 70));
	doa_pickups::function_c1018360(#"hash_5b885d20cb399c97", 41, 0, 4, 3, (0, 0, 0));
}

