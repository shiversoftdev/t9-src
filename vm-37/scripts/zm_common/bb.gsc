#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace bb;

/*
	Name: function_89f2df9
	Namespace: bb
	Checksum: 0xDD6FD448
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"bb", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bb
	Checksum: 0x5499856C
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

/*
	Name: logdamage
	Namespace: bb
	Checksum: 0x6A80565B
	Offset: 0x120
	Size: 0x134
	Parameters: 8
	Flags: Linked
*/
function logdamage(attacker, victim, weapon, damage, damagetype, hitlocation, victimkilled, victimdowned)
{
}

/*
	Name: logaispawn
	Namespace: bb
	Checksum: 0x7D989247
	Offset: 0x830
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function logaispawn(aient, spawner)
{
}

/*
	Name: logplayerevent
	Namespace: bb
	Checksum: 0xCA8DE41B
	Offset: 0x850
	Size: 0x1D4
	Parameters: 2
	Flags: Linked
*/
function logplayerevent(player, eventname)
{
	currentweapon = "";
	beastmodeactive = 0;
	if(isdefined(player.currentweapon))
	{
		currentweapon = player.currentweapon.name;
	}
	if(isdefined(player.beastmode))
	{
		beastmodeactive = player.beastmode;
	}
	zmplayerevents = {};
	zmplayerevents.gametime = function_f8d53445();
	zmplayerevents.roundnumber = level.round_number;
	zmplayerevents.eventname = eventname;
	zmplayerevents.spawnid = getplayerspawnid(player);
	zmplayerevents.username = player.name;
	zmplayerevents.originx = player.origin[0];
	zmplayerevents.originy = player.origin[1];
	zmplayerevents.originz = player.origin[2];
	zmplayerevents.health = player.health;
	zmplayerevents.beastlives = player.beastlives;
	zmplayerevents.currentweapon = currentweapon;
	zmplayerevents.kills = player.kills;
	zmplayerevents.zone_name = player.zone_name;
	zmplayerevents.sessionstate = player.sessionstate;
	zmplayerevents.currentscore = player.score;
	zmplayerevents.totalscore = player.score_total;
	zmplayerevents.beastmodeon = beastmodeactive;
	function_92d1707f(#"hash_5bd2a2e3f75111c8", zmplayerevents);
}

/*
	Name: logpurchaseevent
	Namespace: bb
	Checksum: 0x8164905
	Offset: 0xA30
	Size: 0x1CC
	Parameters: 7
	Flags: Linked
*/
function logpurchaseevent(player, sellerent, cost, itemname, itemupgraded, itemtype, eventname)
{
	zmpurchases = {};
	zmpurchases.gametime = function_f8d53445();
	zmpurchases.roundnumber = level.round_number;
	zmpurchases.playerspawnid = getplayerspawnid(sellerent);
	zmpurchases.username = sellerent.name;
	zmpurchases.itemname = itemupgraded;
	zmpurchases.isupgraded = itemtype;
	zmpurchases.itemtype = eventname;
	zmpurchases.purchasecost = itemname;
	zmpurchases.playeroriginx = sellerent.origin[0];
	zmpurchases.playeroriginy = sellerent.origin[1];
	zmpurchases.playeroriginz = sellerent.origin[2];
	zmpurchases.selleroriginx = cost.origin[0];
	zmpurchases.selleroriginy = cost.origin[1];
	zmpurchases.selleroriginz = cost.origin[2];
	zmpurchases.playerkills = sellerent.kills;
	zmpurchases.playerhealth = sellerent.health;
	zmpurchases.playercurrentscore = sellerent.score;
	zmpurchases.playertotalscore = sellerent.score_total;
	zmpurchases.zone_name = sellerent.zone_name;
	function_92d1707f(#"hash_22cb254982ca97dc", zmpurchases);
}

/*
	Name: logpowerupevent
	Namespace: bb
	Checksum: 0x3C48A91B
	Offset: 0xC08
	Size: 0x208
	Parameters: 3
	Flags: Linked
*/
function logpowerupevent(powerup, optplayer, eventname)
{
	playerspawnid = -1;
	playername = "";
	if(isdefined(optplayer) && isplayer(optplayer))
	{
		playerspawnid = getplayerspawnid(optplayer);
		playername = optplayer.name;
	}
	zmpowerups = {};
	zmpowerups.gametime = function_f8d53445();
	zmpowerups.roundnumber = level.round_number;
	zmpowerups.powerupname = powerup.powerup_name;
	zmpowerups.powerupx = powerup.origin[0];
	zmpowerups.powerupy = powerup.origin[1];
	zmpowerups.powerupz = powerup.origin[2];
	zmpowerups.eventname = eventname;
	zmpowerups.playerspawnid = playerspawnid;
	zmpowerups.playername = playername;
	function_92d1707f(#"hash_7edbd2a2dee992e9", zmpowerups);
	foreach(player in getplayers())
	{
		logplayerevent(player, (("powerup_" + powerup.powerup_name) + "_") + eventname);
	}
}

