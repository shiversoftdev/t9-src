#using script_6e3c826b1814cab6;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace serversettings;

/*
	Name: function_da8d999b
	Namespace: serversettings
	Checksum: 0x96138BAE
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_da8d999b()
{
	level notify(1255477968);
}

/*
	Name: function_89f2df9
	Namespace: serversettings
	Checksum: 0x8E03E5B
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"serversettings", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: serversettings
	Checksum: 0x397AF101
	Offset: 0xF8
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&main);
}

/*
	Name: main
	Namespace: serversettings
	Checksum: 0xA224EDD2
	Offset: 0x128
	Size: 0x47E
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level.hostname = getdvarstring(#"sv_hostname");
	if(level.hostname == "")
	{
		level.hostname = "CoDHost";
	}
	setdvar(#"sv_hostname", level.hostname);
	setdvar(#"ui_hostname", level.hostname);
	level.motd = getdvarstring(#"scr_motd");
	if(level.motd == "")
	{
		level.motd = "";
	}
	setdvar(#"scr_motd", level.motd);
	setdvar(#"ui_motd", level.motd);
	level.allowvote = getdvarint(#"g_allowvote", 1);
	setdvar(#"g_allowvote", level.allowvote);
	setdvar(#"ui_allowvote", level.allowvote);
	level.allow_teamchange = 0;
	if(sessionmodeisprivate() || !sessionmodeisonlinegame())
	{
		level.allow_teamchange = 1;
	}
	setdvar(#"ui_allow_teamchange", level.allow_teamchange);
	level.friendlyfire = getgametypesetting(#"hash_3f8f02e8109b6e93");
	if(!isdefined(level.friendlyfire))
	{
		level.friendlyfire = 0;
	}
	setdvar(#"ui_friendlyfire", level.friendlyfire);
	if(!isdefined(getdvar(#"scr_mapsize")))
	{
		setdvar(#"scr_mapsize", 64);
	}
	else
	{
		if(getdvarfloat(#"scr_mapsize", 0) >= 64)
		{
			setdvar(#"scr_mapsize", 64);
		}
		else
		{
			if(getdvarfloat(#"scr_mapsize", 0) >= 32)
			{
				setdvar(#"scr_mapsize", 32);
			}
			else
			{
				if(getdvarfloat(#"scr_mapsize", 0) >= 16)
				{
					setdvar(#"scr_mapsize", 16);
				}
				else
				{
					setdvar(#"scr_mapsize", 8);
				}
			}
		}
	}
	for(;;)
	{
		updateserversettings();
		wait(5);
	}
}

/*
	Name: updateserversettings
	Namespace: serversettings
	Checksum: 0x8A6CD98E
	Offset: 0x5B0
	Size: 0x204
	Parameters: 0
	Flags: Linked
*/
function updateserversettings()
{
	sv_hostname = getdvarstring(#"sv_hostname");
	if(level.hostname != sv_hostname)
	{
		level.hostname = sv_hostname;
		setdvar(#"ui_hostname", level.hostname);
	}
	scr_motd = getdvarstring(#"scr_motd");
	if(level.motd != scr_motd)
	{
		level.motd = scr_motd;
		setdvar(#"ui_motd", level.motd);
	}
	g_allowvote = getdvarstring(#"g_allowvote");
	if(level.allowvote != g_allowvote)
	{
		level.allowvote = g_allowvote;
		setdvar(#"ui_allowvote", level.allowvote);
	}
	scr_friendlyfire = getgametypesetting(#"hash_3f8f02e8109b6e93");
	if(!isdefined(scr_friendlyfire))
	{
		scr_friendlyfire = 0;
	}
	if(level.friendlyfire != scr_friendlyfire)
	{
		level.friendlyfire = scr_friendlyfire;
		namespace_59ff1d6c::function_928be07c();
		setdvar(#"ui_friendlyfire", level.friendlyfire);
	}
}

