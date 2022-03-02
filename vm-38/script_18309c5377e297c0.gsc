#using script_2255a7ad3edc838f;
#using script_4108035fe400ce67;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\rat_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\laststand.gsc;

#namespace namespace_85f53e47;

/*
	Name: function_9963759d
	Namespace: namespace_85f53e47
	Checksum: 0xBA42675B
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9963759d()
{
	level notify(1011489751);
}

#namespace rat;

/*
	Name: function_89f2df9
	Namespace: rat
	Checksum: 0xBE2563F8
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	/#
		system::register(#"hash_4669bb9e206b09e4", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: rat
	Checksum: 0xAAE7AABF
	Offset: 0x108
	Size: 0x1B4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		init();
		level.rat.common.gethostplayer = &util::gethostplayer;
		level.rat.deathcount = 0;
		addratscriptcmd("", &function_70f41194);
		addratscriptcmd("", &function_31980089);
		addratscriptcmd("", &function_1251949b);
		addratscriptcmd("", &function_684893c8);
		addratscriptcmd("", &function_7eabbc02);
		addratscriptcmd("", &function_d50abf44);
		addratscriptcmd("", &function_89684f6a);
		addratscriptcmd("", &function_4bf92a0d);
		setdvar(#"rat_death_count", 0);
	#/
}

/*
	Name: function_d50abf44
	Namespace: rat
	Checksum: 0xDA153F0
	Offset: 0x2C8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_d50abf44(params)
{
	/#
		return level.players.size;
	#/
}

/*
	Name: function_7eabbc02
	Namespace: rat
	Checksum: 0x47957B81
	Offset: 0x2F0
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_7eabbc02(params)
{
	/#
		remaining = 0;
		host = [[level.rat.common.gethostplayer]]();
		hostteam = host.team;
		if(isdefined(params.remaining))
		{
			remaining = int(params.remaining);
		}
		if(isdefined(level.players))
		{
			for(i = 0; i < level.players.size; i++)
			{
				if(level.players.size <= remaining)
				{
					break;
				}
				if(!isdefined(level.players[i].bot) || level.players[i].team == hostteam || level.players[i].team == "")
				{
					continue;
				}
				bot::remove_bot(level.players[i]);
			}
		}
	#/
}

/*
	Name: function_684893c8
	Namespace: rat
	Checksum: 0x27E48D35
	Offset: 0x458
	Size: 0xBA
	Parameters: 1
	Flags: None
*/
function function_684893c8(params)
{
	/#
		count = 0;
		if(isdefined(level.players))
		{
			foreach(player in level.players)
			{
				if(player laststand::player_is_in_laststand())
				{
					count++;
				}
			}
		}
		return count;
	#/
}

/*
	Name: function_1251949b
	Namespace: rat
	Checksum: 0x170F4733
	Offset: 0x520
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_1251949b(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		return player laststand::player_is_in_laststand();
	#/
}

/*
	Name: function_70f41194
	Namespace: rat
	Checksum: 0x2FD98149
	Offset: 0x578
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_70f41194(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		return player.inventory.var_c212de25;
	#/
}

/*
	Name: function_31980089
	Namespace: rat
	Checksum: 0x1197BD70
	Offset: 0x5D0
	Size: 0x238
	Parameters: 1
	Flags: None
*/
function function_31980089(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		numitems = 1000;
		distance = 1000;
		name = "";
		if(isdefined(params.var_1d978d3))
		{
			numitems = int(params.var_1d978d3);
		}
		if(isdefined(params.distance))
		{
			distance = int(params.distance);
		}
		if(isdefined(params.name))
		{
			name = params.name;
		}
		items = item_world::function_2e3efdda(player.origin, undefined, numitems, distance);
		foreach(item in items)
		{
			if(item.var_a6762160.name == "")
			{
				continue;
			}
			if(isdefined(params.handler))
			{
				if(params.handler != item.var_a6762160.handler && params.handler != "")
				{
					continue;
				}
			}
			if(name == "" || item.var_a6762160.name == name)
			{
				function_55e20e75(params._id, item.origin);
			}
		}
	#/
}

/*
	Name: function_89684f6a
	Namespace: rat
	Checksum: 0xE47C85A
	Offset: 0x810
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_89684f6a(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		return player.inventory.items[5].var_bd027dd9 != 32767;
	#/
}

/*
	Name: function_4bf92a0d
	Namespace: rat
	Checksum: 0xA5F75CF5
	Offset: 0x878
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_4bf92a0d(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		return player isonground();
	#/
}

