#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace music_shared;

/*
	Name: function_d8547de
	Namespace: music_shared
	Checksum: 0xB4BBF60C
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d8547de()
{
	level notify(2079234307);
}

#namespace music;

/*
	Name: function_89f2df9
	Namespace: music
	Checksum: 0x4A701397
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"music", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: music
	Checksum: 0x73041D1F
	Offset: 0x128
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.musicstate = "";
	util::registerclientsys("musicCmd");
	if(sessionmodeiscampaigngame())
	{
		callback::on_spawned(&on_player_spawned);
	}
}

/*
	Name: setmusicstate
	Namespace: music
	Checksum: 0xFBD9BDA
	Offset: 0x190
	Size: 0x3C
	Parameters: 3
	Flags: Linked
*/
function setmusicstate(state, player, delay)
{
	level thread function_d6f7c644(state, player, delay);
}

/*
	Name: function_d6f7c644
	Namespace: music
	Checksum: 0xF4434A1B
	Offset: 0x1D8
	Size: 0xA4
	Parameters: 3
	Flags: Linked
*/
function function_d6f7c644(state, player, delay)
{
	if(isdefined(level.musicstate))
	{
		if(isdefined(delay))
		{
			wait(delay);
		}
		if(isdefined(player))
		{
			util::setclientsysstate("musicCmd", state, player);
			return;
		}
		if(level.musicstate != state)
		{
			util::setclientsysstate("musicCmd", state);
		}
	}
	level.musicstate = state;
}

/*
	Name: setmusicstatebyteam
	Namespace: music
	Checksum: 0x32C24349
	Offset: 0x288
	Size: 0xC0
	Parameters: 2
	Flags: Linked
*/
function setmusicstatebyteam(state, str_teamname)
{
	foreach(player in level.players)
	{
		if(isdefined(player.team) && player.team == str_teamname)
		{
			setmusicstate(state, player);
		}
	}
}

/*
	Name: on_player_spawned
	Namespace: music
	Checksum: 0xB9B394B1
	Offset: 0x350
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(isdefined(level.musicstate))
	{
		if(issubstr(level.musicstate, "_igc") || issubstr(level.musicstate, "igc_"))
		{
			return;
		}
		if(isdefined(self))
		{
		}
	}
}

/*
	Name: function_cbeeecf
	Namespace: music
	Checksum: 0x64ECDC4A
	Offset: 0x3C0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_cbeeecf()
{
	if(isdefined(self))
	{
		setmusicstate("none", self);
	}
}

/*
	Name: playstinger
	Namespace: music
	Checksum: 0x90E11088
	Offset: 0x3F0
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function playstinger(str_alias, n_delay)
{
	level thread function_2b18b6d6((#"mus_" + str_alias) + "_intro", n_delay);
}

/*
	Name: function_2af5f0ec
	Namespace: music
	Checksum: 0x3335A243
	Offset: 0x440
	Size: 0x12C
	Parameters: 3
	Flags: None
*/
function function_2af5f0ec(str_alias, var_e08a84d6, n_delay)
{
	if(isdefined(var_e08a84d6))
	{
		level thread function_2b18b6d6(((#"mus_" + str_alias) + "_loop_") + var_e08a84d6, n_delay);
	}
	else
	{
		var_d49193ec = ("mus_" + str_alias) + "_loop_";
		n_max = 0;
		for(i = 0; i < 9; i++)
		{
			if(!soundexists(var_d49193ec + i))
			{
				n_max = i;
			}
		}
		if(n_max > 0)
		{
			level thread function_2b18b6d6(((#"mus_" + str_alias) + "_loop_") + randomintrange(0, n_max), n_delay);
		}
	}
}

/*
	Name: function_2b18b6d6
	Namespace: music
	Checksum: 0x1EB1C3C6
	Offset: 0x578
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_2b18b6d6(str_alias, n_delay)
{
	if(isdefined(n_delay))
	{
		wait(n_delay);
	}
	playsoundatposition(str_alias, (0, 0, 0));
}

