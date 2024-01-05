#using scripts\core_common\system_shared.gsc;
#using script_c8d806d2487b617;
#using script_152c3f4ffef9e588;

#namespace namespace_81546b33;

/*
	Name: __init__system__
	Namespace: namespace_81546b33
	Checksum: 0x945DCD84
	Offset: 0x78
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	/#
		system::register(#"hash_7b2d0df8fb9099a8", &function_70a657d8, undefined, undefined, #"radiation");
	#/
}

/*
	Name: function_70a657d8
	Namespace: namespace_81546b33
	Checksum: 0x8AD5241E
	Offset: 0xD0
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		if(!namespace_956bd4dd::function_ab99e60c())
		{
			return;
		}
		level thread _setup_devgui();
		level thread function_aa32646f();
	#/
}

/*
	Name: _setup_devgui
	Namespace: namespace_81546b33
	Checksum: 0x4654B1F9
	Offset: 0x128
	Size: 0x20C
	Parameters: 0
	Flags: Private
*/
function private _setup_devgui()
{
	/#
		while(!canadddebugcommand())
		{
			waitframe(1);
		}
		path = "";
		cmd = "";
		adddebugcommand(((("" + path) + "") + cmd) + "");
		adddebugcommand(((("" + path) + "") + cmd) + "");
		adddebugcommand(((("" + path) + "") + cmd) + "");
		adddebugcommand(((("" + path) + "") + cmd) + "");
		adddebugcommand(((("" + path) + "") + cmd) + "");
		path = "";
		adddebugcommand(("" + path) + "");
		adddebugcommand(("" + path) + "");
		adddebugcommand(("" + path) + "");
		adddebugcommand(("" + path) + "");
	#/
}

/*
	Name: function_aa32646f
	Namespace: namespace_81546b33
	Checksum: 0x529D1DF1
	Offset: 0x340
	Size: 0x1DE
	Parameters: 0
	Flags: Private
*/
function private function_aa32646f()
{
	/#
		while(true)
		{
			player = level.players[0];
			if(getdvarint(#"hash_60cd17873710c764", 0) != 0)
			{
				if(isplayer(player))
				{
					radiation::function_2f76803d(player, getdvarint(#"hash_60cd17873710c764", 0));
				}
				setdvar(#"hash_60cd17873710c764", 0);
			}
			if(getdvarstring(#"hash_efed3201a74da29", "") != "")
			{
				if(isplayer(player))
				{
					sickness = hash(getdvarstring(#"hash_efed3201a74da29", ""));
					radiationlevel = radiation::function_c9c6dda1(player);
					if(isdefined(level.radiation.levels[radiationlevel].sickness[sickness]))
					{
						radiation::function_e2336716(player, radiationlevel, sickness);
					}
				}
				setdvar(#"hash_efed3201a74da29", "");
			}
			waitframe(1);
		}
	#/
}

