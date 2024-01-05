#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace serversettings;

/*
	Name: __init__system__
	Namespace: serversettings
	Checksum: 0xAAAA14D
	Offset: 0xB0
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
	Checksum: 0xBC7DA6DD
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init();
	callback::on_start_gametype(&on_start_gametype);
}

/*
	Name: init
	Namespace: serversettings
	Checksum: 0x126AFA15
	Offset: 0x138
	Size: 0x36C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.hostname = getdvarstring(#"sv_hostname");
	if(level.hostname == "")
	{
		level.hostname = "CoDHost";
	}
	setdvar(#"sv_hostname", level.hostname);
	level.allowvote = getdvarint(#"g_allowvote", 1);
	setdvar(#"g_allowvote", level.allowvote);
	level.allow_teamchange = 0;
	allowingameteamchange = getgametypesetting(#"allowingameteamchange");
	if(sessionmodeisprivate() || !sessionmodeisonlinegame() && is_true(allowingameteamchange))
	{
		level.allow_teamchange = 1;
	}
	level.friendlyfire = getgametypesetting(#"friendlyfiretype");
	level.var_a65e8e93 = level.friendlyfire;
	level.var_78d89cdd = getgametypesetting(#"roundstartfriendlyfiretype");
	level.var_6aec2d48 = getgametypesetting(#"hash_5d5f4ee35c9977c7");
	level.var_fe3ff9c1 = getgametypesetting(#"hash_68e3f54e05f57d85");
	level.var_3297fce5 = getgametypesetting(#"hash_51e989796c38cd87");
	level.var_ca1c5097 = getgametypesetting(#"hash_5c918cbf75e16116");
	level.var_2c3d094b = getgametypesetting(#"hash_ecf2124e9108fc4");
	mapsize = getdvarfloat(#"scr_mapsize", 64);
	if(mapsize >= 64)
	{
		mapsize = 64;
	}
	else
	{
		if(mapsize >= 32)
		{
			mapsize = 32;
		}
		else
		{
			if(mapsize >= 16)
			{
				mapsize = 16;
			}
			else
			{
				mapsize = 8;
			}
		}
	}
	setdvar(#"scr_mapsize", mapsize);
	level.mapsize = mapsize;
}

/*
	Name: on_start_gametype
	Namespace: serversettings
	Checksum: 0xBFFD8DDF
	Offset: 0x4B0
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function on_start_gametype()
{
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
	Checksum: 0x5172BCDD
	Offset: 0x518
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function update()
{
	sv_hostname = getdvarstring(#"sv_hostname");
	if(level.hostname != sv_hostname)
	{
		level.hostname = sv_hostname;
		setdvar(#"ui_hostname", level.hostname);
	}
	g_allowvote = getdvarstring(#"g_allowvote");
	if(level.allowvote != g_allowvote)
	{
		level.allowvote = g_allowvote;
		setdvar(#"ui_allowvote", level.allowvote);
	}
	scr_friendlyfire = getgametypesetting(#"friendlyfiretype");
	if(level.var_40eaa459 === 1)
	{
		scr_friendlyfire = getgametypesetting(#"roundstartfriendlyfiretype");
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
	Checksum: 0xA74FA989
	Offset: 0x6C8
	Size: 0x234
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x1517F608
	Offset: 0x908
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
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

