#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_badfe528;

/*
	Name: function_3753d0ad
	Namespace: namespace_badfe528
	Checksum: 0x2CB3E11D
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3753d0ad()
{
	level notify(2048056423);
}

/*
	Name: main
	Namespace: namespace_badfe528
	Checksum: 0x4B507954
	Offset: 0x138
	Size: 0x1BC
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
	setsaveddvar(#"phys_ragdoll_buoyancy", 1);
	setsaveddvar(#"hash_72106cf1ba066d66", 1);
	setsaveddvar(#"hash_4ce570a0ea61ca76", "-12246 -15508 580");
	callback::function_d46d9315(&function_d46d9315);
	callback::on_localclient_connect(&on_player_connected);
	load::main();
	util::waitforclient(0);
	function_103cfebf();
}

/*
	Name: function_103cfebf
	Namespace: namespace_badfe528
	Checksum: 0x39912144
	Offset: 0x300
	Size: 0x248
	Parameters: 0
	Flags: Linked, Private
*/
function private function_103cfebf()
{
	foreach(n_decal in findvolumedecalindexarray("hordehunt_corpses_1"))
	{
		hidevolumedecal(n_decal);
	}
	foreach(n_decal in findvolumedecalindexarray("hordehunt_corpses_2"))
	{
		hidevolumedecal(n_decal);
	}
	foreach(n_decal in findvolumedecalindexarray("hordehunt_corpses_3"))
	{
		hidevolumedecal(n_decal);
	}
	foreach(n_decal in findvolumedecalindexarray("mq4_choppercrash"))
	{
		hidevolumedecal(n_decal);
	}
}

/*
	Name: on_player_connected
	Namespace: namespace_badfe528
	Checksum: 0x18BAD886
	Offset: 0x550
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function on_player_connected(localclientnum)
{
	if(util::function_5df4294() === "zsurvival")
	{
		function_cdbcba12(localclientnum, 1, 1);
		playradiantexploder(localclientnum, "lgtexp_lightstate2");
	}
}

/*
	Name: function_d46d9315
	Namespace: namespace_badfe528
	Checksum: 0x7192229F
	Offset: 0x5C8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_d46d9315(localclientnum)
{
	waitframe(1);
	if(util::function_5df4294() === "zsurvival")
	{
		util::function_8eb5d4b0(4500, 4);
	}
	else
	{
		util::function_8eb5d4b0(700, 1.5);
	}
}

