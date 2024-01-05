#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace serversettings;

/*
	Name: __init__system__
	Namespace: serversettings
	Checksum: 0xAAAA14D
	Offset: 0xB8
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
	Checksum: 0xC86B77D9
	Offset: 0x100
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
}

/*
	Name: init
	Namespace: serversettings
	Checksum: 0x505B5E85
	Offset: 0x130
	Size: 0x4C6
	Parameters: 0
	Flags: None
*/
function init()
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
	level.friendlyfire = getgametypesetting(#"friendlyfiretype");
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
	level.mapsize = getdvarfloat(#"scr_mapsize", 0);
	constrain_gametype(util::get_game_type());
	constrain_map_size(level.mapsize);
	for(;;)
	{
		update();
		wait(5);
	}
}

/*
	Name: update
	Namespace: serversettings
	Checksum: 0xAE04111C
	Offset: 0x600
	Size: 0x1F4
	Parameters: 0
	Flags: None
*/
function update()
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
	scr_friendlyfire = getgametypesetting(#"friendlyfiretype");
	if(!isdefined(scr_friendlyfire))
	{
		scr_friendlyfire = level.friendlyfire;
	}
	if(level.friendlyfire != scr_friendlyfire)
	{
		level.friendlyfire = scr_friendlyfire;
		setdvar(#"ui_friendlyfire", level.friendlyfire);
	}
}

/*
	Name: constrain_gametype
	Namespace: serversettings
	Checksum: 0x5F97833
	Offset: 0x800
	Size: 0x234
	Parameters: 1
	Flags: None
*/
function constrain_gametype(gametype)
{
	entities = getentarray();
	for(i = 0; i < entities.size; i++)
	{
		entity = entities[i];
		if(gametype == "dm")
		{
			if(isdefined(entity.script_gametype_dm) && entity.script_gametype_dm != 1)
			{
				entity delete();
			}
			continue;
		}
		if(gametype == "tdm")
		{
			if(isdefined(entity.script_gametype_tdm) && entity.script_gametype_tdm != 1)
			{
				entity delete();
			}
			continue;
		}
		if(gametype == "ctf")
		{
			if(isdefined(entity.script_gametype_ctf) && entity.script_gametype_ctf != 1)
			{
				entity delete();
			}
			continue;
		}
		if(gametype == "hq")
		{
			if(isdefined(entity.script_gametype_hq) && entity.script_gametype_hq != 1)
			{
				entity delete();
			}
			continue;
		}
		if(gametype == "sd")
		{
			if(isdefined(entity.script_gametype_sd) && entity.script_gametype_sd != 1)
			{
				entity delete();
			}
			continue;
		}
		if(gametype == "koth")
		{
			if(isdefined(entity.script_gametype_koth) && entity.script_gametype_koth != 1)
			{
				entity delete();
			}
		}
	}
}

/*
	Name: constrain_map_size
	Namespace: serversettings
	Checksum: 0xE8564178
	Offset: 0xA40
	Size: 0x1B4
	Parameters: 1
	Flags: None
*/
function constrain_map_size(mapsize)
{
	entities = getentarray();
	for(i = 0; i < entities.size; i++)
	{
		entity = entities[i];
		if(int(mapsize) == 8)
		{
			if(isdefined(entity.script_mapsize_08) && entity.script_mapsize_08 != 1)
			{
				entity delete();
			}
			continue;
		}
		if(int(mapsize) == 16)
		{
			if(isdefined(entity.script_mapsize_16) && entity.script_mapsize_16 != 1)
			{
				entity delete();
			}
			continue;
		}
		if(int(mapsize) == 32)
		{
			if(isdefined(entity.script_mapsize_32) && entity.script_mapsize_32 != 1)
			{
				entity delete();
			}
			continue;
		}
		if(int(mapsize) == 64)
		{
			if(isdefined(entity.script_mapsize_64) && entity.script_mapsize_64 != 1)
			{
				entity delete();
			}
		}
	}
}

