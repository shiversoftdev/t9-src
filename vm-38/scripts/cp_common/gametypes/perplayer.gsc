#using scripts\core_common\struct.gsc;

#namespace perplayer;

/*
	Name: function_67ca5699
	Namespace: perplayer
	Checksum: 0x8F62A2D5
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_67ca5699()
{
	level notify(1006060055);
}

/*
	Name: init
	Namespace: perplayer
	Checksum: 0x32392816
	Offset: 0x88
	Size: 0x94
	Parameters: 3
	Flags: None
*/
function init(id, playerbegincallback, playerendcallback)
{
	handler = spawnstruct();
	handler.id = id;
	handler.playerbegincallback = playerbegincallback;
	handler.playerendcallback = playerendcallback;
	handler.enabled = 0;
	handler.players = [];
	thread onplayerconnect(handler);
	level.handlerglobalflagval = 0;
	return handler;
}

/*
	Name: enable
	Namespace: perplayer
	Checksum: 0x166B89F0
	Offset: 0x128
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function enable(handler)
{
	if(handler.enabled)
	{
		return;
	}
	handler.enabled = 1;
	level.handlerglobalflagval++;
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		players[i].handlerflagval = level.handlerglobalflagval;
	}
	players = handler.players;
	for(i = 0; i < players.size; i++)
	{
		if(players[i].handlerflagval != level.handlerglobalflagval)
		{
			continue;
		}
		if(players[i].handlers[handler.id].ready)
		{
			players[i] handleplayer(handler);
		}
	}
}

/*
	Name: disable
	Namespace: perplayer
	Checksum: 0x46E3644C
	Offset: 0x238
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function disable(handler)
{
	if(!handler.enabled)
	{
		return;
	}
	handler.enabled = 0;
	level.handlerglobalflagval++;
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		players[i].handlerflagval = level.handlerglobalflagval;
	}
	players = handler.players;
	for(i = 0; i < players.size; i++)
	{
		if(players[i].handlerflagval != level.handlerglobalflagval)
		{
			continue;
		}
		if(players[i].handlers[handler.id].ready)
		{
			players[i] unhandleplayer(handler, 0, 0);
		}
	}
}

/*
	Name: onplayerconnect
	Namespace: perplayer
	Checksum: 0xC7AD3C7D
	Offset: 0x350
	Size: 0x168
	Parameters: 1
	Flags: None
*/
function onplayerconnect(handler)
{
	for(;;)
	{
		waitresult = undefined;
		waitresult = level waittill(#"connecting");
		player = waitresult.player;
		if(!isdefined(player.handlers))
		{
			player.handlers = [];
		}
		player.handlers[handler.id] = spawnstruct();
		player.handlers[handler.id].ready = 0;
		player.handlers[handler.id].handled = 0;
		player.handlerflagval = -1;
		handler.players[handler.players.size] = player;
		player thread onplayerdisconnect(handler);
		player thread onplayerspawned(handler);
		player thread onjoinedteam(handler);
		player thread onjoinedspectators(handler);
		player thread onplayerkilled(handler);
	}
}

/*
	Name: onplayerdisconnect
	Namespace: perplayer
	Checksum: 0xFED18D84
	Offset: 0x4C0
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function onplayerdisconnect(handler)
{
	self waittill(#"disconnect");
	newplayers = [];
	for(i = 0; i < handler.players.size; i++)
	{
		if(handler.players[i] != self)
		{
			newplayers[newplayers.size] = handler.players[i];
		}
	}
	handler.players = newplayers;
	self thread unhandleplayer(handler, 1, 1);
}

/*
	Name: onjoinedteam
	Namespace: perplayer
	Checksum: 0xD89D11EF
	Offset: 0x580
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function onjoinedteam(handler)
{
	self endon(#"disconnect");
	for(;;)
	{
		self waittill(#"joined_team");
		self thread unhandleplayer(handler, 1, 0);
	}
}

/*
	Name: onjoinedspectators
	Namespace: perplayer
	Checksum: 0xFE1F552D
	Offset: 0x5E0
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function onjoinedspectators(handler)
{
	self endon(#"disconnect");
	for(;;)
	{
		self waittill(#"joined_spectators");
		self thread unhandleplayer(handler, 1, 0);
	}
}

/*
	Name: onplayerspawned
	Namespace: perplayer
	Checksum: 0xE9D7E97
	Offset: 0x640
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function onplayerspawned(handler)
{
	self endon(#"disconnect");
	for(;;)
	{
		self waittill(#"spawned_player");
		self thread handleplayer(handler);
	}
}

/*
	Name: onplayerkilled
	Namespace: perplayer
	Checksum: 0x58301DB5
	Offset: 0x698
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function onplayerkilled(handler)
{
	self endon(#"disconnect");
	for(;;)
	{
		self waittill(#"killed_player");
		self thread unhandleplayer(handler, 1, 0);
	}
}

/*
	Name: handleplayer
	Namespace: perplayer
	Checksum: 0x8A4638ED
	Offset: 0x6F8
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function handleplayer(handler)
{
	self.handlers[handler.id].ready = 1;
	if(!handler.enabled)
	{
		return;
	}
	if(self.handlers[handler.id].handled)
	{
		return;
	}
	self.handlers[handler.id].handled = 1;
	self thread [[handler.playerbegincallback]]();
}

/*
	Name: unhandleplayer
	Namespace: perplayer
	Checksum: 0xA6E86E13
	Offset: 0x790
	Size: 0xA8
	Parameters: 3
	Flags: None
*/
function unhandleplayer(handler, unsetready, disconnected)
{
	if(!disconnected && unsetready)
	{
		self.handlers[handler.id].ready = 0;
	}
	if(!self.handlers[handler.id].handled)
	{
		return;
	}
	if(!disconnected)
	{
		self.handlers[handler.id].handled = 0;
	}
	self thread [[handler.playerendcallback]](disconnected);
}

