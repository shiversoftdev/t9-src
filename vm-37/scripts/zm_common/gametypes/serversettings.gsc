#using scripts\zm_common\zm_customgame.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace serversettings;

/*
	Name: __init__system__
	Namespace: serversettings
	Checksum: 0xAAAA14D
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"serversettings", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: serversettings
	Checksum: 0xCF3B4C3C
	Offset: 0xD8
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
	Checksum: 0x21A24E57
	Offset: 0x108
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
	level.friendlyfire = getgametypesetting(#"zmfriendlyfiretype");
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
	Checksum: 0x80DDD0C5
	Offset: 0x590
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
	scr_friendlyfire = getgametypesetting(#"zmfriendlyfiretype");
	if(!isdefined(scr_friendlyfire))
	{
		scr_friendlyfire = 0;
	}
	if(level.friendlyfire != scr_friendlyfire)
	{
		level.friendlyfire = scr_friendlyfire;
		zm_custom::function_928be07c();
		setdvar(#"ui_friendlyfire", level.friendlyfire);
	}
}

