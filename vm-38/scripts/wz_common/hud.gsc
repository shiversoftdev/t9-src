#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\wz_common\util.gsc;

#namespace hud;

/*
	Name: function_d5e80cb0
	Namespace: hud
	Checksum: 0x26907F3F
	Offset: 0x3D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d5e80cb0()
{
	level notify(892291822);
}

/*
	Name: function_9b9cecdf
	Namespace: hud
	Checksum: 0x55F78118
	Offset: 0x3F8
	Size: 0x3F4
	Parameters: 0
	Flags: None
*/
function function_9b9cecdf()
{
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionPassengerCount", 1, 7, "int");
	clientfield::function_a8bbc967("hudItems.alivePlayerCount", 1, 7, "int", 0);
	clientfield::function_a8bbc967("hudItems.alivePlayerCountEnemy", 1, 7, "int", 0);
	clientfield::function_a8bbc967("hudItems.aliveTeammateCount", 1, 7, "int", 1);
	clientfield::function_a8bbc967("hudItems.spectatorsCount", 1, 7, "int", 1);
	clientfield::function_a8bbc967("hudItems.playerKills", 1, 7, "int", 0);
	clientfield::function_a8bbc967("hudItems.playerCleanUps", 1, 7, "int", 0);
	clientfield::function_a8bbc967("presence.modeparam", 1, 7, "int", 1);
	clientfield::function_a8bbc967("hudItems.hasBackpack", 1, 1, "int", 0);
	clientfield::function_a8bbc967("hudItems.armorType", 1, 2, "int", 0);
	clientfield::function_a8bbc967("hudItems.streamerLoadFraction", 1, 5, "float", 1);
	clientfield::function_a8bbc967("hudItems.wzLoadFinished", 1, 1, "int", 1);
	clientfield::function_a8bbc967("hudItems.showReinsertionPassengerCount", 1, 1, "int", 0);
	clientfield::function_a8bbc967("hudItems.playerLivesRemaining", 7000, 4, "int");
	clientfield::function_a8bbc967("hudItems.playerCanRedeploy", 7000, 1, "int");
	clientfield::register("toplayer", "realtime_multiplay", 1, 1, "int");
	clientfield::function_5b7d846d("hudItems.warzone.collapse", 7000, 21, "int");
	clientfield::function_5b7d846d("hudItems.warzone.waveRespawnTimer", 7000, 21, "int");
	clientfield::function_5b7d846d("hudItems.warzone.collapseIndex", 1, 3, "int");
	clientfield::function_5b7d846d("hudItems.warzone.collapseCount", 1, 3, "int");
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionIndex", 1, 3, "int");
	clientfield::function_a8bbc967("hudItems.skydiveAltimeterVisible", 1, 1, "int");
	clientfield::function_5b7d846d("hudItems.skydiveAltimeterHeight", 1, 16, "int");
	clientfield::function_5b7d846d("hudItems.skydiveAltimeterSeaHeight", 1, 16, "int");
}

/*
	Name: function_2f66bc37
	Namespace: hud
	Checksum: 0x51D9F7F6
	Offset: 0x7F8
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
	Checksum: 0x8ECBE858
	Offset: 0x8F0
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
	Checksum: 0x8BCF19CE
	Offset: 0x988
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
	Checksum: 0x30DDC328
	Offset: 0x9A8
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
	Checksum: 0x811EFC92
	Offset: 0x9F8
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
		var_7102d43a = getplayers(player.team);
		foreach(member in var_7102d43a)
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
	Checksum: 0x3E7951DE
	Offset: 0xC28
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
	Checksum: 0x7C3085F1
	Offset: 0xC70
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
	Checksum: 0x639D6318
	Offset: 0xCB8
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
	Checksum: 0x5871CE85
	Offset: 0xCD0
	Size: 0xC
	Parameters: 1
	Flags: Event
*/
event function_87b05fa3(eventstruct)
{
}

