#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace mp_tank;

/*
	Name: main
	Namespace: mp_tank
	Checksum: 0x30158836
	Offset: 0x148
	Size: 0x1A4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("world", "" + #"hash_7de1e9f42b73bf42", 1, 1, "int");
	killstreaks::function_257a5f13("straferun", 40);
	killstreaks::function_257a5f13("helicopter_comlink", 75);
	scene::function_497689f6(#"hash_42c1547bb4eddb6f", "helicopter", "tag_probe_attach", "prb_tn_tank_heli_transport", "play");
	scene::add_scene_func(#"hash_42c1547bb4eddb6f", &function_8d9c0c2d, "init");
	scene::add_scene_func(#"hash_42c1547bb4eddb6f", &function_a4fed09f, "done");
	load::main();
	compass::setupminimap("");
	spawncollision("collision_clip_wall_512x512x10", "collider", (-1296, -3112, -5), vectorscale((1, 0, 0), 270));
}

/*
	Name: function_8d9c0c2d
	Namespace: mp_tank
	Checksum: 0xBEDC0D57
	Offset: 0x2F8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_8d9c0c2d(a_ents)
{
	level clientfield::set("" + #"hash_7de1e9f42b73bf42", 1);
}

/*
	Name: function_a4fed09f
	Namespace: mp_tank
	Checksum: 0xC1BD6AF6
	Offset: 0x348
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_a4fed09f(a_ents)
{
	level clientfield::set("" + #"hash_7de1e9f42b73bf42", 0);
}

