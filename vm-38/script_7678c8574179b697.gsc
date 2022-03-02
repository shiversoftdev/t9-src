#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_player.gsc;

#namespace namespace_bed17022;

/*
	Name: function_5d060761
	Namespace: namespace_bed17022
	Checksum: 0xA0187AE0
	Offset: 0x1E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5d060761()
{
	level notify(1136626237);
}

/*
	Name: function_89f2df9
	Namespace: namespace_bed17022
	Checksum: 0xC12EBE58
	Offset: 0x200
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1146f3904fdf31ff", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_bed17022
	Checksum: 0x80F724D1
	Offset: 0x258
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_bed17022
	Checksum: 0x737D9A08
	Offset: 0x268
	Size: 0x384
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	level thread function_e0cfb01("zone_service_tunnels_02_spawns", (4938.35, -2918.99, -3247.5));
	level thread function_e0cfb01("zone_service_tunnels_01_spawns", (6619.54, -2900.19, -3207));
	level thread function_e0cfb01("zone_board_room_02_spawns", (5439.51, -3917.67, -3207));
	level thread function_e0cfb01("zone_bunker_entrance_02_spawns", (6918, -4223.5, -3208));
	level thread function_6526f34b();
	zm_player::spawn_life_brush((4613, 7275.25, -242.5), 400, 500);
	zm_player::spawn_life_brush((4540.25, 2412.5, -280), 300, 500);
	zm_player::spawn_life_brush((4241.25, 7260.5, -242), 300, 500);
	zm_player::spawn_life_brush((3243.25, 7338.5, -295), 200, 500);
	zm_player::spawn_life_brush((3865.25, 7260.5, -242), 300, 500);
	zm_player::spawn_life_brush((5751.75, 5563.5, 561), 64, 128);
	spawncollision("collision_clip_wall_512x512x10", "collider", (5786, 3018, 225), (0, 0, 0));
	spawncollision("collision_clip_wall_512x512x10", "collider", (5786, 3390, 225), (0, 0, 0));
	spawncollision("collision_clip_wall_256x256x10", "collider", (2795, 6885, 16), vectorscale((0, 1, 0), 270));
	spawncollision("collision_slick_32x32x32", "collider", (4049, 7086, -126), vectorscale((0, 0, -1), 45));
	spawncollision("collision_clip_32x32x128", "collider", (2956, 7763, -290), (0, 0, 0));
	spawncollision("collision_clip_32x32x128", "collider", (2956, 7740, -290), (0, 0, 0));
	spawncollision("collision_clip_64x64x128", "collider", (4939.5, 1818.5, -185.5), (0, 0, 0));
}

/*
	Name: function_6526f34b
	Namespace: namespace_bed17022
	Checksum: 0x49748170
	Offset: 0x5F8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_6526f34b()
{
	level endon(#"game_ended");
	e_clip = spawncollision("collision_clip_wall_256x256x10", "collider", (3357, 906, 109), (0, 0, 0));
	level flag::wait_till("connect_anytown_usa_rooftops");
	if(isdefined(e_clip))
	{
		e_clip delete();
	}
}

/*
	Name: function_e0cfb01
	Namespace: namespace_bed17022
	Checksum: 0xE4B3F139
	Offset: 0x698
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function function_e0cfb01(str_zone_name, v_origin)
{
	foreach(s_loc in struct::get_array(str_zone_name))
	{
		if(s_loc.script_noteworthy === "wait_location")
		{
			s_loc.origin = v_origin;
		}
	}
}

