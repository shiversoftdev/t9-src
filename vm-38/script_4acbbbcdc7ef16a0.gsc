#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_c097de49;

/*
	Name: function_922b2d13
	Namespace: namespace_c097de49
	Checksum: 0x26E8383
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_922b2d13()
{
	level notify(1532265200);
}

/*
	Name: init
	Namespace: namespace_c097de49
	Checksum: 0x45091804
	Offset: 0x140
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.var_a353323e = &function_cb5a4b1a;
	level.var_ae2fe3bd = &function_613a7ccc;
	level.var_da00670e = &function_da00670e;
	level thread function_acd83a15();
	util::registerclientsys("tritonCmd");
}

/*
	Name: function_cb5a4b1a
	Namespace: namespace_c097de49
	Checksum: 0x187E9D76
	Offset: 0x1C8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_cb5a4b1a()
{
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 2);
	}
	music::setmusicstate("common_exfil");
}

/*
	Name: function_613a7ccc
	Namespace: namespace_c097de49
	Checksum: 0x78882FA1
	Offset: 0x2A0
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_613a7ccc(b_success)
{
	if(!isdefined(b_success))
	{
		b_success = 0;
	}
	if(b_success)
	{
		music::setmusicstate("common_exfil_success");
	}
	else
	{
		music::setmusicstate("common_exfil_fail");
	}
}

/*
	Name: function_acd83a15
	Namespace: namespace_c097de49
	Checksum: 0xAB98566F
	Offset: 0x308
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_acd83a15()
{
	level endon(#"game_over");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"musroundend", #"hash_350a3e373494a400");
		if(waitresult._notify === "musRoundEnd")
		{
			level thread function_e2901362();
		}
		else
		{
			level thread function_26113358();
		}
	}
}

/*
	Name: function_e840d5a5
	Namespace: namespace_c097de49
	Checksum: 0xFCAEAE9C
	Offset: 0x3B0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_e840d5a5()
{
	if(is_true(level.musicsystemoverride))
	{
		return false;
	}
	if(!isdefined(level.musicsystem))
	{
		return true;
	}
	if(!isdefined(level.musicsystem.currentplaytype))
	{
		return true;
	}
	if(level.musicsystem.currentplaytype >= 4)
	{
		return false;
	}
	return true;
}

/*
	Name: function_3c734339
	Namespace: namespace_c097de49
	Checksum: 0x4D6D559
	Offset: 0x430
	Size: 0xE0
	Parameters: 0
	Flags: None
*/
function function_3c734339()
{
	level endon(#"game_over");
	level flag::wait_till("start_zombie_round_logic");
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 0);
	}
}

/*
	Name: function_8f85d169
	Namespace: namespace_c097de49
	Checksum: 0x8C9B5E83
	Offset: 0x518
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_8f85d169(var_dbd74b22)
{
	if(!isdefined(var_dbd74b22))
	{
		var_dbd74b22 = 1;
	}
	if(var_dbd74b22)
	{
		level thread zm_audio::sndmusicsystem_stopandflush();
		level.musicsystemoverride = 1;
		level thread function_e2901362();
	}
	else
	{
		level.musicsystemoverride = 0;
		level thread function_26113358();
	}
}

/*
	Name: function_da00670e
	Namespace: namespace_c097de49
	Checksum: 0x722DCC27
	Offset: 0x5B0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_da00670e()
{
	level thread function_e2901362();
	wait(1);
	level thread function_d0f24e17();
}

/*
	Name: function_d0f24e17
	Namespace: namespace_c097de49
	Checksum: 0x91D1E14B
	Offset: 0x5F8
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_d0f24e17()
{
	level endon(#"game_over");
	if(!isdefined(level.musicsystem))
	{
		return;
	}
	if(is_true(level.musicsystemoverride))
	{
		return;
	}
	while(level.musicsystem.currentplaytype === 4)
	{
		wait(1);
	}
	level thread function_26113358();
}

/*
	Name: function_2c40648c
	Namespace: namespace_c097de49
	Checksum: 0x772A0AB2
	Offset: 0x688
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_2c40648c(b_active)
{
	if(!isdefined(b_active))
	{
		b_active = 1;
	}
	if(b_active)
	{
		level thread function_26113358();
	}
	else
	{
		level thread function_e2901362();
	}
}

/*
	Name: function_26113358
	Namespace: namespace_c097de49
	Checksum: 0x138F8A9
	Offset: 0x6E8
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_26113358()
{
	if(function_e840d5a5())
	{
		foreach(player in getplayers())
		{
			player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 3);
		}
	}
}

/*
	Name: function_e2901362
	Namespace: namespace_c097de49
	Checksum: 0xA314CD9C
	Offset: 0x7B8
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_e2901362()
{
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 2);
	}
}

