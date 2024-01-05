#using scripts\wz_common\util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace hud;

/*
	Name: function_9b9cecdf
	Namespace: hud
	Checksum: 0x7FFEC539
	Offset: 0x3D8
	Size: 0x3F4
	Parameters: 0
	Flags: None
*/
function function_9b9cecdf()
{
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionPassengerCount", 1, 7, "int");
	clientfield::register_clientuimodel("hudItems.alivePlayerCount", 1, 7, "int", 0);
	clientfield::register_clientuimodel("hudItems.alivePlayerCountEnemy", 1, 7, "int", 0);
	clientfield::register_clientuimodel("hudItems.aliveTeammateCount", 1, 7, "int", 1);
	clientfield::register_clientuimodel("hudItems.spectatorsCount", 1, 7, "int", 1);
	clientfield::register_clientuimodel("hudItems.playerKills", 1, 7, "int", 0);
	clientfield::register_clientuimodel("hudItems.playerCleanUps", 1, 7, "int", 0);
	clientfield::register_clientuimodel("presence.modeparam", 1, 7, "int", 1);
	clientfield::register_clientuimodel("hudItems.hasBackpack", 1, 1, "int", 0);
	clientfield::register_clientuimodel("hudItems.armorType", 1, 2, "int", 0);
	clientfield::register_clientuimodel("hudItems.streamerLoadFraction", 1, 5, "float", 1);
	clientfield::register_clientuimodel("hudItems.wzLoadFinished", 1, 1, "int", 1);
	clientfield::register_clientuimodel("hudItems.showReinsertionPassengerCount", 1, 1, "int", 0);
	clientfield::register_clientuimodel("hudItems.playerLivesRemaining", 15000, 3, "int");
	clientfield::register_clientuimodel("hudItems.playerCanRedeploy", 15000, 1, "int");
	clientfield::register("toplayer", "realtime_multiplay", 1, 1, "int");
	clientfield::function_5b7d846d("hudItems.warzone.collapse", 11000, 21, "int");
	clientfield::function_5b7d846d("hudItems.warzone.waveRespawnTimer", 15000, 21, "int");
	clientfield::function_5b7d846d("hudItems.warzone.collapseIndex", 1, 3, "int");
	clientfield::function_5b7d846d("hudItems.warzone.collapseCount", 1, 3, "int");
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionIndex", 1, 3, "int");
	clientfield::register_clientuimodel("hudItems.skydiveAltimeterVisible", 1, 1, "int");
	clientfield::function_5b7d846d("hudItems.skydiveAltimeterHeight", 1, 16, "int");
	clientfield::function_5b7d846d("hudItems.skydiveAltimeterSeaHeight", 1, 16, "int");
}

/*
	Name: function_2f66bc37
	Namespace: hud
	Checksum: 0x7D7DAF48
	Offset: 0x7D8
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function function_2f66bc37()
{
	/#
		assert(isplayer(self));
	#/
	actionslot3 = (getdvarint(#"hash_449fa75f87a4b5b4", 0) > 0 ? "ping_callouts" : "flourish_callouts");
	self setactionslot(3, actionslot3);
	actionslot4 = (getdvarint(#"hash_23270ec9008cb656", 0) > 0 ? "sprays_boasts" : "scorestreak_wheel");
	self setactionslot(4, actionslot4);
}

/*
	Name: function_cb4b48d5
	Namespace: hud
	Checksum: 0x6C181BE5
	Offset: 0x8D0
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_cb4b48d5(var_80427091)
{
	if(!isdefined(var_80427091))
	{
		var_80427091 = 1;
	}
	/#
		assert(isplayer(self));
	#/
	if(var_80427091)
	{
		self setactionslot(3, "");
	}
	self setactionslot(4, "");
}

/*
	Name: function_22df4165
	Namespace: hud
	Checksum: 0x8446CF03
	Offset: 0x968
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_22df4165()
{
	level.var_22df4165 = 1;
}

/*
	Name: function_5db32126
	Namespace: hud
	Checksum: 0x31CBA6F7
	Offset: 0x988
	Size: 0x48
	Parameters: 0
	Flags: None
*/
function function_5db32126()
{
	while(true)
	{
		waitframe(1);
		if(is_true(level.var_22df4165))
		{
			function_e91890a7();
		}
	}
}

/*
	Name: function_e91890a7
	Namespace: hud
	Checksum: 0xC457597
	Offset: 0x9D8
	Size: 0x222
	Parameters: 0
	Flags: None
*/
function function_e91890a7()
{
	if(!is_true(level.var_22df4165))
	{
		return;
	}
	util::waittillslowprocessallowed();
	player_counts = util::function_de15dc32();
	players = getplayers();
	foreach(player in players)
	{
		var_dcf52474 = player_counts.alive;
		player clientfield::set_player_uimodel("presence.modeparam", var_dcf52474);
		player clientfield::set_player_uimodel("hudItems.alivePlayerCount", var_dcf52474);
		var_31cc0ff8 = 0;
		teammembers = getplayers(player.team);
		foreach(member in teammembers)
		{
			if(isalive(member) && member != player)
			{
				var_31cc0ff8++;
			}
		}
		player clientfield::set_player_uimodel("hudItems.aliveTeammateCount", var_31cc0ff8);
	}
	level.var_22df4165 = undefined;
}

/*
	Name: function_de916514
	Namespace: hud
	Checksum: 0x8209473E
	Offset: 0xC08
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event function_de916514(eventstruct)
{
	if(isplayer(self))
	{
		self function_cb4b48d5(0);
	}
}

/*
	Name: function_feb0a2aa
	Namespace: hud
	Checksum: 0xD7D27CE3
	Offset: 0xC50
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event function_feb0a2aa(eventstruct)
{
	if(isplayer(self))
	{
		self function_2f66bc37();
	}
}

/*
	Name: function_5019e563
	Namespace: hud
	Checksum: 0x3B9C934B
	Offset: 0xC98
	Size: 0xC
	Parameters: 1
	Flags: Event
*/
event function_5019e563(eventstruct)
{
}

/*
	Name: function_87b05fa3
	Namespace: hud
	Checksum: 0xCD04BD50
	Offset: 0xCB0
	Size: 0xC
	Parameters: 1
	Flags: Event
*/
event function_87b05fa3(eventstruct)
{
}

