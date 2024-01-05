#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace zm_characters;

/*
	Name: __init__system__
	Namespace: zm_characters
	Checksum: 0xF925B658
	Offset: 0xF10
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_characters", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_characters
	Checksum: 0x94C1D7FB
	Offset: 0xF58
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.setupcustomcharacterexerts = &setup_personality_character_exerts;
}

/*
	Name: setup_personality_character_exerts
	Namespace: zm_characters
	Checksum: 0xC986517
	Offset: 0xF80
	Size: 0x1544
	Parameters: 0
	Flags: None
*/
function setup_personality_character_exerts()
{
	level.exert_sounds[1][#"playerbreathinsound"][0] = "vox_plr_0_exert_inhale_0";
	level.exert_sounds[1][#"playerbreathinsound"][1] = "vox_plr_0_exert_inhale_1";
	level.exert_sounds[1][#"playerbreathinsound"][2] = "vox_plr_0_exert_inhale_2";
	level.exert_sounds[2][#"playerbreathinsound"][0] = "vox_plr_1_exert_inhale_0";
	level.exert_sounds[2][#"playerbreathinsound"][1] = "vox_plr_1_exert_inhale_1";
	level.exert_sounds[2][#"playerbreathinsound"][2] = "vox_plr_1_exert_inhale_2";
	level.exert_sounds[3][#"playerbreathinsound"][0] = "vox_plr_2_exert_inhale_0";
	level.exert_sounds[3][#"playerbreathinsound"][1] = "vox_plr_2_exert_inhale_1";
	level.exert_sounds[3][#"playerbreathinsound"][2] = "vox_plr_2_exert_inhale_2";
	level.exert_sounds[4][#"playerbreathinsound"][0] = "vox_plr_3_exert_inhale_0";
	level.exert_sounds[4][#"playerbreathinsound"][1] = "vox_plr_3_exert_inhale_1";
	level.exert_sounds[4][#"playerbreathinsound"][2] = "vox_plr_3_exert_inhale_2";
	level.exert_sounds[1][#"playerbreathoutsound"][0] = "vox_plr_0_exert_exhale_0";
	level.exert_sounds[1][#"playerbreathoutsound"][1] = "vox_plr_0_exert_exhale_1";
	level.exert_sounds[1][#"playerbreathoutsound"][2] = "vox_plr_0_exert_exhale_2";
	level.exert_sounds[2][#"playerbreathoutsound"][0] = "vox_plr_1_exert_exhale_0";
	level.exert_sounds[2][#"playerbreathoutsound"][1] = "vox_plr_1_exert_exhale_1";
	level.exert_sounds[2][#"playerbreathoutsound"][2] = "vox_plr_1_exert_exhale_2";
	level.exert_sounds[3][#"playerbreathoutsound"][0] = "vox_plr_2_exert_exhale_0";
	level.exert_sounds[3][#"playerbreathoutsound"][1] = "vox_plr_2_exert_exhale_1";
	level.exert_sounds[3][#"playerbreathoutsound"][2] = "vox_plr_2_exert_exhale_2";
	level.exert_sounds[4][#"playerbreathoutsound"][0] = "vox_plr_3_exert_exhale_0";
	level.exert_sounds[4][#"playerbreathoutsound"][1] = "vox_plr_3_exert_exhale_1";
	level.exert_sounds[4][#"playerbreathoutsound"][2] = "vox_plr_3_exert_exhale_2";
	level.exert_sounds[1][#"playerbreathgaspsound"][0] = "vox_plr_0_exert_exhale_0";
	level.exert_sounds[1][#"playerbreathgaspsound"][1] = "vox_plr_0_exert_exhale_1";
	level.exert_sounds[1][#"playerbreathgaspsound"][2] = "vox_plr_0_exert_exhale_2";
	level.exert_sounds[2][#"playerbreathgaspsound"][0] = "vox_plr_1_exert_exhale_0";
	level.exert_sounds[2][#"playerbreathgaspsound"][1] = "vox_plr_1_exert_exhale_1";
	level.exert_sounds[2][#"playerbreathgaspsound"][2] = "vox_plr_1_exert_exhale_2";
	level.exert_sounds[3][#"playerbreathgaspsound"][0] = "vox_plr_2_exert_exhale_0";
	level.exert_sounds[3][#"playerbreathgaspsound"][1] = "vox_plr_2_exert_exhale_1";
	level.exert_sounds[3][#"playerbreathgaspsound"][2] = "vox_plr_2_exert_exhale_2";
	level.exert_sounds[4][#"playerbreathgaspsound"][0] = "vox_plr_3_exert_exhale_0";
	level.exert_sounds[4][#"playerbreathgaspsound"][1] = "vox_plr_3_exert_exhale_1";
	level.exert_sounds[4][#"playerbreathgaspsound"][2] = "vox_plr_3_exert_exhale_2";
	level.exert_sounds[1][#"falldamage"][0] = "vox_plr_0_exert_pain_low_0";
	level.exert_sounds[1][#"falldamage"][1] = "vox_plr_0_exert_pain_low_1";
	level.exert_sounds[1][#"falldamage"][2] = "vox_plr_0_exert_pain_low_2";
	level.exert_sounds[1][#"falldamage"][3] = "vox_plr_0_exert_pain_low_3";
	level.exert_sounds[1][#"falldamage"][4] = "vox_plr_0_exert_pain_low_4";
	level.exert_sounds[1][#"falldamage"][5] = "vox_plr_0_exert_pain_low_5";
	level.exert_sounds[1][#"falldamage"][6] = "vox_plr_0_exert_pain_low_6";
	level.exert_sounds[1][#"falldamage"][7] = "vox_plr_0_exert_pain_low_7";
	level.exert_sounds[2][#"falldamage"][0] = "vox_plr_1_exert_pain_low_0";
	level.exert_sounds[2][#"falldamage"][1] = "vox_plr_1_exert_pain_low_1";
	level.exert_sounds[2][#"falldamage"][2] = "vox_plr_1_exert_pain_low_2";
	level.exert_sounds[2][#"falldamage"][3] = "vox_plr_1_exert_pain_low_3";
	level.exert_sounds[2][#"falldamage"][4] = "vox_plr_1_exert_pain_low_4";
	level.exert_sounds[2][#"falldamage"][5] = "vox_plr_1_exert_pain_low_5";
	level.exert_sounds[2][#"falldamage"][6] = "vox_plr_1_exert_pain_low_6";
	level.exert_sounds[2][#"falldamage"][7] = "vox_plr_1_exert_pain_low_7";
	level.exert_sounds[3][#"falldamage"][0] = "vox_plr_2_exert_pain_low_0";
	level.exert_sounds[3][#"falldamage"][1] = "vox_plr_2_exert_pain_low_1";
	level.exert_sounds[3][#"falldamage"][2] = "vox_plr_2_exert_pain_low_2";
	level.exert_sounds[3][#"falldamage"][3] = "vox_plr_2_exert_pain_low_3";
	level.exert_sounds[3][#"falldamage"][4] = "vox_plr_2_exert_pain_low_4";
	level.exert_sounds[3][#"falldamage"][5] = "vox_plr_2_exert_pain_low_5";
	level.exert_sounds[3][#"falldamage"][6] = "vox_plr_2_exert_pain_low_6";
	level.exert_sounds[3][#"falldamage"][7] = "vox_plr_2_exert_pain_low_7";
	level.exert_sounds[4][#"falldamage"][0] = "vox_plr_3_exert_pain_low_0";
	level.exert_sounds[4][#"falldamage"][1] = "vox_plr_3_exert_pain_low_1";
	level.exert_sounds[4][#"falldamage"][2] = "vox_plr_3_exert_pain_low_2";
	level.exert_sounds[4][#"falldamage"][3] = "vox_plr_3_exert_pain_low_3";
	level.exert_sounds[4][#"falldamage"][4] = "vox_plr_3_exert_pain_low_4";
	level.exert_sounds[4][#"falldamage"][5] = "vox_plr_3_exert_pain_low_5";
	level.exert_sounds[4][#"falldamage"][6] = "vox_plr_3_exert_pain_low_6";
	level.exert_sounds[4][#"falldamage"][7] = "vox_plr_3_exert_pain_low_7";
	level.exert_sounds[1][#"mantlesoundplayer"][0] = "vox_plr_0_exert_grunt_0";
	level.exert_sounds[1][#"mantlesoundplayer"][1] = "vox_plr_0_exert_grunt_1";
	level.exert_sounds[1][#"mantlesoundplayer"][2] = "vox_plr_0_exert_grunt_2";
	level.exert_sounds[1][#"mantlesoundplayer"][3] = "vox_plr_0_exert_grunt_3";
	level.exert_sounds[1][#"mantlesoundplayer"][4] = "vox_plr_0_exert_grunt_4";
	level.exert_sounds[1][#"mantlesoundplayer"][5] = "vox_plr_0_exert_grunt_5";
	level.exert_sounds[1][#"mantlesoundplayer"][6] = "vox_plr_0_exert_grunt_6";
	level.exert_sounds[2][#"mantlesoundplayer"][0] = "vox_plr_1_exert_grunt_0";
	level.exert_sounds[2][#"mantlesoundplayer"][1] = "vox_plr_1_exert_grunt_1";
	level.exert_sounds[2][#"mantlesoundplayer"][2] = "vox_plr_1_exert_grunt_2";
	level.exert_sounds[2][#"mantlesoundplayer"][3] = "vox_plr_1_exert_grunt_3";
	level.exert_sounds[2][#"mantlesoundplayer"][4] = "vox_plr_1_exert_grunt_4";
	level.exert_sounds[2][#"mantlesoundplayer"][5] = "vox_plr_1_exert_grunt_5";
	level.exert_sounds[2][#"mantlesoundplayer"][6] = "vox_plr_1_exert_grunt_6";
	level.exert_sounds[3][#"mantlesoundplayer"][0] = "vox_plr_2_exert_grunt_0";
	level.exert_sounds[3][#"mantlesoundplayer"][1] = "vox_plr_2_exert_grunt_1";
	level.exert_sounds[3][#"mantlesoundplayer"][2] = "vox_plr_2_exert_grunt_2";
	level.exert_sounds[3][#"mantlesoundplayer"][3] = "vox_plr_2_exert_grunt_3";
	level.exert_sounds[3][#"mantlesoundplayer"][4] = "vox_plr_2_exert_grunt_4";
	level.exert_sounds[3][#"mantlesoundplayer"][5] = "vox_plr_2_exert_grunt_5";
	level.exert_sounds[3][#"mantlesoundplayer"][6] = "vox_plr_2_exert_grunt_6";
	level.exert_sounds[4][#"mantlesoundplayer"][0] = "vox_plr_3_exert_grunt_0";
	level.exert_sounds[4][#"mantlesoundplayer"][1] = "vox_plr_3_exert_grunt_1";
	level.exert_sounds[4][#"mantlesoundplayer"][2] = "vox_plr_3_exert_grunt_2";
	level.exert_sounds[4][#"mantlesoundplayer"][3] = "vox_plr_3_exert_grunt_3";
	level.exert_sounds[4][#"mantlesoundplayer"][4] = "vox_plr_3_exert_grunt_4";
	level.exert_sounds[4][#"mantlesoundplayer"][5] = "vox_plr_3_exert_grunt_5";
	level.exert_sounds[4][#"mantlesoundplayer"][6] = "vox_plr_3_exert_grunt_6";
	level.exert_sounds[1][#"meleeswipesoundplayer"][0] = "vox_plr_0_exert_knife_swipe_0";
	level.exert_sounds[1][#"meleeswipesoundplayer"][1] = "vox_plr_0_exert_knife_swipe_1";
	level.exert_sounds[1][#"meleeswipesoundplayer"][2] = "vox_plr_0_exert_knife_swipe_2";
	level.exert_sounds[1][#"meleeswipesoundplayer"][3] = "vox_plr_0_exert_knife_swipe_3";
	level.exert_sounds[1][#"meleeswipesoundplayer"][4] = "vox_plr_0_exert_knife_swipe_4";
	level.exert_sounds[1][#"meleeswipesoundplayer"][5] = "vox_plr_0_exert_knife_swipe_5";
	level.exert_sounds[2][#"meleeswipesoundplayer"][0] = "vox_plr_1_exert_knife_swipe_0";
	level.exert_sounds[2][#"meleeswipesoundplayer"][1] = "vox_plr_1_exert_knife_swipe_1";
	level.exert_sounds[2][#"meleeswipesoundplayer"][2] = "vox_plr_1_exert_knife_swipe_2";
	level.exert_sounds[2][#"meleeswipesoundplayer"][3] = "vox_plr_1_exert_knife_swipe_3";
	level.exert_sounds[2][#"meleeswipesoundplayer"][4] = "vox_plr_1_exert_knife_swipe_4";
	level.exert_sounds[2][#"meleeswipesoundplayer"][5] = "vox_plr_1_exert_knife_swipe_5";
	level.exert_sounds[3][#"meleeswipesoundplayer"][0] = "vox_plr_2_exert_knife_swipe_0";
	level.exert_sounds[3][#"meleeswipesoundplayer"][1] = "vox_plr_2_exert_knife_swipe_1";
	level.exert_sounds[3][#"meleeswipesoundplayer"][2] = "vox_plr_2_exert_knife_swipe_2";
	level.exert_sounds[3][#"meleeswipesoundplayer"][3] = "vox_plr_2_exert_knife_swipe_3";
	level.exert_sounds[3][#"meleeswipesoundplayer"][4] = "vox_plr_2_exert_knife_swipe_4";
	level.exert_sounds[3][#"meleeswipesoundplayer"][5] = "vox_plr_2_exert_knife_swipe_5";
	level.exert_sounds[4][#"meleeswipesoundplayer"][0] = "vox_plr_3_exert_knife_swipe_0";
	level.exert_sounds[4][#"meleeswipesoundplayer"][1] = "vox_plr_3_exert_knife_swipe_1";
	level.exert_sounds[4][#"meleeswipesoundplayer"][2] = "vox_plr_3_exert_knife_swipe_2";
	level.exert_sounds[4][#"meleeswipesoundplayer"][3] = "vox_plr_3_exert_knife_swipe_3";
	level.exert_sounds[4][#"meleeswipesoundplayer"][4] = "vox_plr_3_exert_knife_swipe_4";
	level.exert_sounds[4][#"meleeswipesoundplayer"][5] = "vox_plr_3_exert_knife_swipe_5";
	level.exert_sounds[1][#"dtplandsoundplayer"][0] = "vox_plr_0_exert_pain_medium_0";
	level.exert_sounds[1][#"dtplandsoundplayer"][1] = "vox_plr_0_exert_pain_medium_1";
	level.exert_sounds[1][#"dtplandsoundplayer"][2] = "vox_plr_0_exert_pain_medium_2";
	level.exert_sounds[1][#"dtplandsoundplayer"][3] = "vox_plr_0_exert_pain_medium_3";
	level.exert_sounds[2][#"dtplandsoundplayer"][0] = "vox_plr_1_exert_pain_medium_0";
	level.exert_sounds[2][#"dtplandsoundplayer"][1] = "vox_plr_1_exert_pain_medium_1";
	level.exert_sounds[2][#"dtplandsoundplayer"][2] = "vox_plr_1_exert_pain_medium_2";
	level.exert_sounds[2][#"dtplandsoundplayer"][3] = "vox_plr_1_exert_pain_medium_3";
	level.exert_sounds[3][#"dtplandsoundplayer"][0] = "vox_plr_2_exert_pain_medium_0";
	level.exert_sounds[3][#"dtplandsoundplayer"][1] = "vox_plr_2_exert_pain_medium_1";
	level.exert_sounds[3][#"dtplandsoundplayer"][2] = "vox_plr_2_exert_pain_medium_2";
	level.exert_sounds[3][#"dtplandsoundplayer"][3] = "vox_plr_2_exert_pain_medium_3";
	level.exert_sounds[4][#"dtplandsoundplayer"][0] = "vox_plr_3_exert_pain_medium_0";
	level.exert_sounds[4][#"dtplandsoundplayer"][1] = "vox_plr_3_exert_pain_medium_1";
	level.exert_sounds[4][#"dtplandsoundplayer"][2] = "vox_plr_3_exert_pain_medium_2";
	level.exert_sounds[4][#"dtplandsoundplayer"][3] = "vox_plr_3_exert_pain_medium_3";
}

