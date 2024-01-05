#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace mp_nuketown6;

/*
	Name: main
	Namespace: mp_nuketown6
	Checksum: 0xCB8AB5FE
	Offset: 0x110
	Size: 0x144
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	setsaveddvar(#"enable_global_wind", 1);
	setsaveddvar(#"wind_global_vector", "88 0 0");
	setsaveddvar(#"wind_global_low_altitude", 0);
	setsaveddvar(#"wind_global_hi_altitude", 10000);
	setsaveddvar(#"wind_global_low_strength_percent", 100);
	callback::on_gameplay_started(&on_gameplay_started);
	level thread function_b02d88a3();
	level thread function_a6101b7();
	load::main();
	util::waitforclient(0);
}

/*
	Name: on_gameplay_started
	Namespace: mp_nuketown6
	Checksum: 0xF4742B9E
	Offset: 0x260
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function on_gameplay_started(localclientnum)
{
	waitframe(1);
	var_7075c004 = 500;
	var_8b7976b9 = 1.75;
	if(getdvarint(#"hash_269852f320baca83", 0))
	{
		var_7075c004 = 200;
		var_8b7976b9 = 1.85;
	}
	util::function_8eb5d4b0(var_7075c004, var_8b7976b9);
}

/*
	Name: function_b02d88a3
	Namespace: mp_nuketown6
	Checksum: 0xB19DB642
	Offset: 0x2F8
	Size: 0x108
	Parameters: 0
	Flags: Linked
*/
function function_b02d88a3()
{
	var_f7d8aaa7 = strtok("dom dom10v10 war war12v12 sd control dropkick vip sd_hc dom_hc control_hc", " ");
	gametype = util::get_game_type();
	if(!isinarray(var_f7d8aaa7, gametype))
	{
		indices = findvolumedecalindexarray("dom_bounds");
		foreach(index in indices)
		{
			hidevolumedecal(index);
		}
	}
}

/*
	Name: function_a6101b7
	Namespace: mp_nuketown6
	Checksum: 0xF172B043
	Offset: 0x408
	Size: 0x26C
	Parameters: 0
	Flags: Linked
*/
function function_a6101b7()
{
	if(!getdvarint(#"hash_269852f320baca83", 0))
	{
		indices = findvolumedecalindexarray("nt6_xmas_props");
		foreach(index in indices)
		{
			hidevolumedecal(index);
		}
	}
	else
	{
		setsoundcontext("ltm", "xmas");
		level thread scene::play(#"hash_3163c0c4a56dc10");
		level thread scene::play(#"hash_5190937d4de7a0ab");
		level thread scene::play(#"hash_758a1eb7469f93ab");
		level thread scene::play(#"hash_52fc71906d7b4506");
		level thread scene::play(#"hash_14cd021eabacb67a");
		level thread scene::play(#"hash_62e4b7afbda52d35");
		level thread scene::play(#"hash_2c7e5703f973b5c");
		level thread scene::play(#"hash_7299fe160cf1c5e4");
		level thread scene::play(#"hash_2f6dbc5909d54dea");
		level thread scene::play(#"hash_41335bc1f4e7c7d9");
		level thread scene::play(#"hash_4b954439329ad046");
		level thread scene::play(#"hash_45834b6a02ccfc14");
	}
}

