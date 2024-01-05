#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_f172695e;

/*
	Name: init
	Namespace: namespace_f172695e
	Checksum: 0x7CE4C207
	Offset: 0xF8
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
	Checksum: 0x881E4301
	Offset: 0x198
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
	Checksum: 0x8D1C3DF8
	Offset: 0x270
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
	Checksum: 0x71AF3639
	Offset: 0x458
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
	Checksum: 0x38880544
	Offset: 0x4A0
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
	Checksum: 0x11E79957
	Offset: 0x5F8
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
	Checksum: 0xE797A8DA
	Offset: 0x648
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
	Checksum: 0x37D622B7
	Offset: 0x720
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
	Checksum: 0x93F0B54A
	Offset: 0x788
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
	Checksum: 0x7DF339C8
	Offset: 0x860
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
	Checksum: 0x3CDD1CE0
	Offset: 0x9A0
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

