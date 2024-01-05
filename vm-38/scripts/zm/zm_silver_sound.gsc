#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_f172695e;

/*
	Name: function_2a07b96f
	Namespace: namespace_f172695e
	Checksum: 0xA9414E95
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2a07b96f()
{
	level notify(2130357066);
}

/*
	Name: init
	Namespace: namespace_f172695e
	Checksum: 0x64876119
	Offset: 0x118
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.var_a353323e = &function_cb5a4b1a;
	level.var_ae2fe3bd = &function_613a7ccc;
	level.var_da00670e = &function_da00670e;
	level thread function_c1db8d1a();
	level thread function_acd83a15();
	level thread function_2cf67660();
}

/*
	Name: function_c1db8d1a
	Namespace: namespace_f172695e
	Checksum: 0x3DE974CC
	Offset: 0x1B8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_c1db8d1a()
{
	level waittill(#"hash_3537191335625c");
	var_581d3017 = getent("audio_bfm", "targetname");
	playsoundatposition(#"hash_4ec7d60ade69984c", var_581d3017.origin);
	wait(1);
	playsoundatposition(#"hash_189fe24269ad58d", var_581d3017.origin);
	wait(1);
	var_581d3017 playloopsound(#"hash_6890863e534ae68d");
}

/*
	Name: function_acd83a15
	Namespace: namespace_f172695e
	Checksum: 0x76077707
	Offset: 0x290
	Size: 0x1DC
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
			foreach(player in getplayers())
			{
				player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 2);
			}
		}
		else if(function_e840d5a5())
		{
			foreach(player in getplayers())
			{
				player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 3);
			}
		}
	}
}

/*
	Name: function_44cea26f
	Namespace: namespace_f172695e
	Checksum: 0x8F458C9B
	Offset: 0x478
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_44cea26f(str_msg, n_delay)
{
	if(!isdefined(n_delay))
	{
		n_delay = 0;
	}
	level thread function_30d9d43(str_msg, n_delay);
}

/*
	Name: function_30d9d43
	Namespace: namespace_f172695e
	Checksum: 0x646741A2
	Offset: 0x4C0
	Size: 0x14A
	Parameters: 2
	Flags: Linked
*/
function function_30d9d43(str_msg, n_delay)
{
	switch(n_delay)
	{
		case "hash_5bad1025f0cf747e":
		{
			level util::clientnotify("term1");
			level util::clientnotify("term2");
			break;
		}
		case "hash_7dbdd94b1b1e6829":
		{
			playsoundatposition(#"hash_191f00f5f707e4ca", (1616, 741, -270));
			level util::clientnotify("term1");
			break;
		}
		case "hash_7dbdd64b1b1e6310":
		{
			level util::clientnotify("term2");
			break;
		}
		default:
		{
			/#
				iprintlnbold(("" + n_delay) + "");
			#/
			break;
		}
	}
}

/*
	Name: function_2cf67660
	Namespace: namespace_f172695e
	Checksum: 0x4535EA92
	Offset: 0x618
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_2cf67660()
{
	level waittill(#"snddooropening");
	playsoundatposition(#"hash_38b699d43c500e2e", (0, 0, 0));
}

/*
	Name: function_cb5a4b1a
	Namespace: namespace_f172695e
	Checksum: 0xAC72B602
	Offset: 0x668
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
	music::setmusicstate("silver_exfil");
}

/*
	Name: function_613a7ccc
	Namespace: namespace_f172695e
	Checksum: 0x4DCCAF25
	Offset: 0x740
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
		music::setmusicstate("silver_exfil_success");
	}
	else
	{
		music::setmusicstate("silver_exfil_fail");
	}
}

/*
	Name: function_da00670e
	Namespace: namespace_f172695e
	Checksum: 0xAB02E084
	Offset: 0x7A8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_da00670e()
{
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 2);
	}
	wait(1);
	level thread function_d0f24e17();
}

/*
	Name: function_d0f24e17
	Namespace: namespace_f172695e
	Checksum: 0xFFD9FF05
	Offset: 0x880
	Size: 0x138
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
	if(function_e840d5a5())
	{
		foreach(player in getplayers())
		{
			player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 3);
		}
	}
}

/*
	Name: function_e840d5a5
	Namespace: namespace_f172695e
	Checksum: 0x2963E2ED
	Offset: 0x9C0
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

