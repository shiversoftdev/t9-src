#using scripts\core_common\flag_shared.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace ztcm;

/*
	Name: function_768a84c0
	Namespace: ztcm
	Checksum: 0xC82183A2
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_768a84c0()
{
	level notify(-560172989);
}

/*
	Name: main
	Namespace: ztcm
	Checksum: 0x4B4C7AFC
	Offset: 0xD8
	Size: 0xDC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	zm_gametype::main();
	level.onprecachegametype = &onprecachegametype;
	level.onstartgametype = &onstartgametype;
	level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
	level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
	level._round_start_func = &zm_round_logic::round_start;
	if(!level flag::exists(#"ztcm"))
	{
		level flag::init(#"ztcm", 1);
	}
}

/*
	Name: onprecachegametype
	Namespace: ztcm
	Checksum: 0x36C9DEB
	Offset: 0x1C0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
	level.canplayersuicide = &zm_gametype::canplayersuicide;
}

/*
	Name: onstartgametype
	Namespace: ztcm
	Checksum: 0xAF14538E
	Offset: 0x1E8
	Size: 0x154
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	level.spawnmins = (0, 0, 0);
	level.spawnmaxs = (0, 0, 0);
	structs = struct::get_array("player_respawn_point", "targetname");
	foreach(struct in structs)
	{
		level.spawnmins = math::expand_mins(level.spawnmins, struct.origin);
		level.spawnmaxs = math::expand_maxs(level.spawnmaxs, struct.origin);
	}
	level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
	setmapcenter(level.mapcenter);
}

