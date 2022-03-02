#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_94c51214;

/*
	Name: main
	Namespace: namespace_94c51214
	Checksum: 0x930763D2
	Offset: 0x1F8
	Size: 0x154
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	callback::on_spawned(&on_player_spawned);
	callback::function_acaac19b(&on_player_spawned);
	level thread function_b02d88a3();
	level thread function_a6101b7();
	level thread function_21acba11();
	load::main();
	function_c6c7166a();
	compass::setupminimap("");
	spawncollision("collision_clip_wall_64x64x10", "collider", (-729, 643, -36), (0, 340, -90));
	trigger = spawn("trigger_radius_out_of_bounds", (-735, 1592, -50), 0, 200, 200);
	trigger thread oob::run_oob_trigger();
}

/*
	Name: on_player_spawned
	Namespace: namespace_94c51214
	Checksum: 0xBAB03488
	Offset: 0x358
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	player = self;
	if(getdvarint(#"hash_269852f320baca83", 0))
	{
		player util::set_lighting_state(1);
	}
}

/*
	Name: function_c6c7166a
	Namespace: namespace_94c51214
	Checksum: 0x7A9FDD9F
	Offset: 0x3B8
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_c6c7166a()
{
	if(util::function_5df4294() !== "dropkick" && getdvarint(#"hash_774f95460ca50d49", 1) && !getdvarint(#"hash_269852f320baca83", 0))
	{
		level.end_game_video = hash("MP_NUKETOWN6_ENDGAME_MOVIE");
		level.var_48ea0e8c = 8;
	}
}

/*
	Name: function_b02d88a3
	Namespace: namespace_94c51214
	Checksum: 0xAF613A04
	Offset: 0x468
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_b02d88a3()
{
	var_76bdb3ae = strtok("dom dom10v10 war war12v12 sd control dropkick vip sd_hc dom_hc control_hc", " ");
	gametype = util::function_5df4294();
	if(!isinarray(var_76bdb3ae, gametype))
	{
		hidemiscmodels("dom_bounds");
		array::delete_all(getentarray("dom_bounds", "targetname"));
		return;
	}
	array::run_all(getentarray("dom_bounds", "targetname"), &disconnectpaths, undefined, 0);
}

/*
	Name: function_a6101b7
	Namespace: namespace_94c51214
	Checksum: 0x7AA33466
	Offset: 0x568
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_a6101b7()
{
	if(getdvarint(#"hash_269852f320baca83", 0))
	{
		level flag::wait_till("first_player_spawned");
		util::set_lighting_state(1);
		exploder::exploder("fxexp_holiday");
		if(util::function_5df4294() === #"zonslaught")
		{
			hidemiscmodels("nt6_xmas_props_no_zm");
			array::delete_all(getentarray("nt6_xmas_props_no_zm", "targetname"));
		}
		return;
	}
	hidemiscmodels("nt6_xmas_props");
	hidemiscmodels("nt6_xmas_props_no_zm");
	array::delete_all(getentarray("nt6_xmas_props", "targetname"));
	array::delete_all(getentarray("nt6_xmas_props_no_zm", "targetname"));
}

/*
	Name: function_21acba11
	Namespace: namespace_94c51214
	Checksum: 0xBDC4E923
	Offset: 0x6E8
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_21acba11()
{
	if(util::function_5df4294() !== #"zonslaught" && util::function_5df4294() !== #"hash_321225a5ce1eb35")
	{
		hidemiscmodels("nt6_onslaught_props");
		array::delete_all(getentarray("nt6_onslaught_props", "targetname"));
	}
}

