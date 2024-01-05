#using scripts\core_common\popups_shared.gsc;
#using script_45fdb6cec5580007;
#using scripts\core_common\system_shared.gsc;
#using script_3dfd071e58d0071f;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace ping;

/*
	Name: function_1a57ab2d
	Namespace: ping
	Checksum: 0x1FD0B1C2
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1a57ab2d()
{
	level notify(1443074063);
}

/*
	Name: __init__system__
	Namespace: ping
	Checksum: 0x1ADA08CD
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"ping", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: ping
	Checksum: 0xA788CC98
	Offset: 0x100
	Size: 0x244
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	setdvar(#"hash_1d7aa0dce875f0eb", 1);
	if(!getdvarint(#"hash_449fa75f87a4b5b4", 0))
	{
		return;
	}
	level.ping = {#durations:[12:15, 11:15, 10:-1, 9:25, 8:25, 7:15, 6:15, 5:30, 4:20, 3:15, 2:10, 1:10, 0:10], #pings:[], #count:0, #players:[]};
	/#
		assert(level.ping.durations.size == 13);
	#/
	callback::function_94eab4fb(&function_94eab4fb);
	callback::on_disconnect(&on_disconnect);
	callback::on_joined_team(&on_joined_team);
	callback::on_spawned(&on_player_spawn);
	callback::on_death(&function_d58bf295);
	callback::on_end_game(&on_end_game);
	callback::function_dd017b2e(&function_dd017b2e);
	level thread update();
}

/*
	Name: function_dd017b2e
	Namespace: ping
	Checksum: 0x92EBF9A8
	Offset: 0x350
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_dd017b2e(params)
{
	dialogkey = params.var_91cd890c;
	if(params.var_fb597e32 === 1)
	{
		self battlechatter::play_dialog(dialogkey, 2);
	}
	else
	{
		self battlechatter::play_dialog(dialogkey, 1);
	}
	self function_b56144ae(self function_9c9adcf1(), 17, 0, (0, 0, 0), undefined, undefined, params.title);
}

/*
	Name: function_77d2f4f5
	Namespace: ping
	Checksum: 0x5C046A03
	Offset: 0x410
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_77d2f4f5()
{
	return level.ping.players[self getentitynumber()];
}

/*
	Name: function_76fbd527
	Namespace: ping
	Checksum: 0xF65CB2A9
	Offset: 0x448
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_76fbd527()
{
	level.ping.players[self getentitynumber()] = [];
}

/*
	Name: function_9c9adcf1
	Namespace: ping
	Checksum: 0xDC9775E2
	Offset: 0x480
	Size: 0xC2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9c9adcf1()
{
	pingplayers = undefined;
	if(squads::function_a9758423() && isdefined(self.squad))
	{
		pingplayers = function_c65231e2(self.squad);
	}
	else if(isdefined(self.team))
	{
		pingplayers = getfriendlyplayers(self.team);
	}
	if(!isdefined(pingplayers))
	{
		pingplayers = [];
	}
	else if(!isarray(pingplayers))
	{
		pingplayers = array(pingplayers);
	}
	return pingplayers;
}

/*
	Name: function_68ee7643
	Namespace: ping
	Checksum: 0xAEF9B8A3
	Offset: 0x550
	Size: 0x14C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_68ee7643()
{
	pings = self function_77d2f4f5();
	entnum = self getentitynumber();
	if(isdefined(pings))
	{
		foreach(ping in level.ping.pings)
		{
			if(entnum == ping.playerentnum)
			{
				function_aa50d3e4(ping);
			}
		}
		self function_b56144ae(self function_9c9adcf1(), 15, 1, (0, 0, 0));
		level.ping.players[self getentitynumber()] = undefined;
	}
}

/*
	Name: clear_all_pings
	Namespace: ping
	Checksum: 0xF8317069
	Offset: 0x6A8
	Size: 0xF0
	Parameters: 0
	Flags: Linked, Private
*/
function private clear_all_pings()
{
	foreach(ping in level.ping.pings)
	{
		ping.player function_b56144ae(ping.player function_9c9adcf1(), ping.eventtype, 1, ping.location, ping.param, ping.id);
		function_aa50d3e4(ping);
	}
}

/*
	Name: on_player_spawn
	Namespace: ping
	Checksum: 0x4F310082
	Offset: 0x7A0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function on_player_spawn()
{
	pings = self function_77d2f4f5();
	if(!isdefined(pings))
	{
		self function_76fbd527();
	}
}

/*
	Name: on_joined_team
	Namespace: ping
	Checksum: 0x6E4182B8
	Offset: 0x7F0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function on_joined_team(params)
{
	self function_68ee7643();
	self function_76fbd527();
}

/*
	Name: on_disconnect
	Namespace: ping
	Checksum: 0x4110C521
	Offset: 0x838
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_disconnect()
{
	self function_68ee7643();
}

/*
	Name: on_end_game
	Namespace: ping
	Checksum: 0xEFBEBB5F
	Offset: 0x860
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function on_end_game()
{
	clear_all_pings();
}

/*
	Name: function_d58bf295
	Namespace: ping
	Checksum: 0x200FDAEE
	Offset: 0x880
	Size: 0x1C8
	Parameters: 1
	Flags: Linked
*/
function function_d58bf295(params)
{
	entnum = (isentity(self) ? self getentitynumber() : -1);
	foreach(ping in level.ping.pings)
	{
		if(ping.eventtype != 2 && ping.eventtype != 3 && ping.eventtype != 10)
		{
			continue;
		}
		if(ping.param != entnum)
		{
			continue;
		}
		if(!isdefined(ping.player) || !isplayer(ping.player))
		{
			continue;
		}
		ping.player function_b56144ae(ping.player function_9c9adcf1(), ping.eventtype, 1, ping.location, ping.param, ping.id);
		function_aa50d3e4(ping);
	}
}

/*
	Name: function_9455917d
	Namespace: ping
	Checksum: 0xB9B7E5C4
	Offset: 0xA50
	Size: 0x1B8
	Parameters: 1
	Flags: Linked
*/
function function_9455917d(entity)
{
	if(!isdefined(level.ping.pings))
	{
		return;
	}
	entnum = (isentity(entity) ? entity getentitynumber() : -1);
	foreach(ping in level.ping.pings)
	{
		if(ping.eventtype != 2 && ping.eventtype != 3 && ping.eventtype != 10 && ping.eventtype != 8)
		{
			continue;
		}
		if(ping.param != entnum)
		{
			continue;
		}
		ping.player function_b56144ae(ping.player function_9c9adcf1(), ping.eventtype, 1, ping.location, ping.param, ping.id);
		function_aa50d3e4(ping);
	}
}

/*
	Name: function_c5f0d88f
	Namespace: ping
	Checksum: 0x8978A295
	Offset: 0xC10
	Size: 0x32E
	Parameters: 4
	Flags: Linked, Private
*/
function private function_c5f0d88f(player, eventtype, location, param)
{
	pool = function_5947d757(eventtype);
	ping = spawnstruct();
	ping.player = player;
	ping.playerentnum = player getentitynumber();
	ping.eventtype = eventtype;
	ping.var_a1e081ad = pool;
	ping.location = location;
	ping.param = param;
	/#
		assert(isdefined(level.ping.durations[eventtype]));
	#/
	if(level.ping.durations[eventtype] >= 0)
	{
		ping.expiration = gettime() + (int(level.ping.durations[eventtype] * 1000));
	}
	ping.id = level.ping.count;
	var_6e071234 = player function_77d2f4f5();
	/#
		assert(isdefined(var_6e071234));
	#/
	if(isdefined(var_6e071234[pool]) && var_6e071234[pool].size >= function_44806bba(eventtype))
	{
		function_aa50d3e4(var_6e071234[pool][0]);
	}
	/#
		assert(!isdefined(level.ping.pings[ping.id]));
	#/
	if(isdefined(level.ping.pings[ping.id]))
	{
		function_aa50d3e4(level.ping.pings[ping.id]);
	}
	level.ping.pings[ping.id] = ping;
	level.ping.count++;
	if(level.ping.count >= 16384)
	{
		level.ping.count = 0;
	}
	if(!isdefined(var_6e071234[pool]))
	{
		var_6e071234[pool] = [];
	}
	else if(!isarray(var_6e071234[pool]))
	{
		var_6e071234[pool] = array(var_6e071234[pool]);
	}
	var_6e071234[pool][var_6e071234[pool].size] = ping;
	return ping;
}

/*
	Name: function_bbe2694a
	Namespace: ping
	Checksum: 0x3B11E43E
	Offset: 0xF48
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function function_bbe2694a(var_bd027dd9)
{
	if(!isdefined(level.ping.pings))
	{
		return;
	}
	foreach(ping in level.ping.pings)
	{
		if(ping.var_a1e081ad == 4 && ping.param == var_bd027dd9)
		{
			if(isplayer(ping.player))
			{
				ping.player function_b56144ae(ping.player function_9c9adcf1(), ping.eventtype, 1, ping.location, ping.param, ping.id);
			}
			function_aa50d3e4(ping);
			break;
		}
	}
}

/*
	Name: function_aa50d3e4
	Namespace: ping
	Checksum: 0x68D65814
	Offset: 0x10B0
	Size: 0x16C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_aa50d3e4(ping)
{
	/#
		assert(isdefined(level.ping.pings[ping.id]));
	#/
	level.ping.pings[ping.id] = undefined;
	/#
		assert(isdefined(level.ping.players[ping.playerentnum][ping.var_a1e081ad]));
	#/
	var_2d64756e = level.ping.players[ping.playerentnum][ping.var_a1e081ad];
	if(!isdefined(var_2d64756e))
	{
		return;
	}
	index = array::find(var_2d64756e, ping);
	/#
		assert(isdefined(index));
	#/
	if(var_2d64756e.size == 1)
	{
		level.ping.players[ping.playerentnum][ping.var_a1e081ad] = undefined;
	}
	else if(isdefined(index))
	{
		array::pop(var_2d64756e, index, 0);
	}
}

/*
	Name: function_220a4754
	Namespace: ping
	Checksum: 0x503B6311
	Offset: 0x1228
	Size: 0x24
	Parameters: 2
	Flags: Linked, Private
*/
function private function_220a4754(ping, param)
{
	return ping.param === param;
}

/*
	Name: function_cff0c866
	Namespace: ping
	Checksum: 0x6857ECB8
	Offset: 0x1258
	Size: 0xF8
	Parameters: 3
	Flags: Linked, Private
*/
function private function_cff0c866(player, event_type, param)
{
	var_6e071234 = player function_77d2f4f5();
	pool = function_5947d757(event_type);
	/#
		assert(isdefined(var_6e071234));
	#/
	if(isdefined(var_6e071234[pool]))
	{
		index = array::find(var_6e071234[pool], param, &function_220a4754);
		if(isdefined(index))
		{
			ping = var_6e071234[pool][index];
			function_aa50d3e4(ping);
		}
	}
	return ping;
}

/*
	Name: function_94eab4fb
	Namespace: ping
	Checksum: 0x3668D4E
	Offset: 0x1358
	Size: 0x16C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_94eab4fb(params)
{
	player = params.player;
	eventtype = params.type;
	remove = params.remove;
	param = params.param;
	location = params.location;
	/#
		assert(isdefined(eventtype));
	#/
	if(eventtype < 13)
	{
		if(remove)
		{
			ping = function_cff0c866(player, eventtype, param);
		}
		else
		{
			ping = function_c5f0d88f(player, eventtype, location, param);
		}
		id = ping.id;
		if(isdefined(id))
		{
			player function_b56144ae(player function_9c9adcf1(), eventtype, remove, location, param, id);
		}
	}
	else
	{
		player function_b56144ae(player function_9c9adcf1(), eventtype, remove, location, param);
	}
}

/*
	Name: update
	Namespace: ping
	Checksum: 0x29111887
	Offset: 0x14D0
	Size: 0x132
	Parameters: 0
	Flags: Linked, Private
*/
function private update()
{
	while(true)
	{
		time = gettime();
		foreach(ping in level.ping.pings)
		{
			if(isdefined(ping.expiration) && ping.expiration < time)
			{
				ping.player function_b56144ae(ping.player function_9c9adcf1(), ping.eventtype, 1, ping.location, ping.param, ping.id);
				function_aa50d3e4(ping);
			}
		}
		wait(1);
	}
}

