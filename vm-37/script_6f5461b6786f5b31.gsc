#using scripts\core_common\system_shared.csc;
#using script_84f5590d2ac48f8;
#using scripts\core_common\clientfield_shared.csc;
#using script_6872cf0845191c15;
#using script_1b2f6ef7778cf920;
#using scripts\core_common\serverfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_8b9bbbb3;

/*
	Name: main
	Namespace: namespace_8b9bbbb3
	Checksum: 0x88BCC05F
	Offset: 0xD8
	Size: 0xA4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	serverfield::register("crab_behavior", 1, 1, "int");
	full_screen_movie::register();
	function_1001f0ac();
	/#
		assert(isdefined(level.var_f18a6bd6), "");
	#/
	load::main();
	util::waitforclient(0);
}

/*
	Name: function_1001f0ac
	Namespace: namespace_8b9bbbb3
	Checksum: 0x29A9ABA6
	Offset: 0x188
	Size: 0x1BC
	Parameters: 0
	Flags: None
*/
function function_1001f0ac()
{
	level.var_e45a8859 = &function_647a2b33;
	level.var_30df1fad = "zombietron";
	setsaveddvar(#"ik_enable_ai_terrain", 0);
	setsaveddvar(#"enable_global_wind", 1);
	setsaveddvar(#"wind_global_vector", "88 0 0");
	setsaveddvar(#"wind_global_low_altitude", 0);
	setsaveddvar(#"wind_global_hi_altitude", 10000);
	setsaveddvar(#"wind_global_low_strength_percent", 100);
	setsaveddvar(#"hash_7703523dd1279500", 1);
	setsaveddvar(#"hash_120a4a43c03905a4", 0);
	setsaveddvar(#"hash_5784cae91fb32baa", 0);
	setsaveddvar(#"hash_1775f5958f57b973", -0.25);
	callback::on_localclient_connect(&on_localclient_connect);
}

/*
	Name: function_647a2b33
	Namespace: namespace_8b9bbbb3
	Checksum: 0xC0B1304E
	Offset: 0x350
	Size: 0x6
	Parameters: 0
	Flags: None
*/
function function_647a2b33()
{
	return false;
}

/*
	Name: on_localclient_connect
	Namespace: namespace_8b9bbbb3
	Checksum: 0xF703E37E
	Offset: 0x360
	Size: 0x7C
	Parameters: 1
	Flags: Private
*/
function private on_localclient_connect(localclientnum)
{
	if(localclientnum == 0)
	{
		player = function_27673a7(localclientnum);
		if(!isdefined(player))
		{
			return;
		}
		var_9b83e7fd = function_f682116f(localclientnum);
		player serverfield::set("crab_behavior", !var_9b83e7fd);
	}
}

