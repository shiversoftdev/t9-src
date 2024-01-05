#using script_774302f762d76254;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\globallogic\globallogic_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;

#namespace doa;

/*
	Name: function_aeb1baea
	Namespace: doa
	Checksum: 0x9F0A86B0
	Offset: 0x170
	Size: 0x34
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_aeb1baea()
{
	level.var_f18a6bd6 = &function_5e443ed1;
	waittillframeend();
	level.var_f18a6bd6 = &function_5e443ed1;
}

/*
	Name: main
	Namespace: doa
	Checksum: 0x9A119890
	Offset: 0x1B0
	Size: 0xAC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.var_6877b1e9 = 1;
	zm_gametype::main();
	level.var_26be8a4f = 1;
	level.onspawnplayerunified = undefined;
	level.onspawnplayer = &spawning::onspawnplayer;
	level.onplayerdisconnect = &globallogic::blank;
	callback::on_spawned(&on_player_spawned);
	level thread namespace_4dae815d::init();
}

/*
	Name: function_5e443ed1
	Namespace: doa
	Checksum: 0xC47D1176
	Offset: 0x268
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_5e443ed1()
{
	level._loadstarted = 1;
	level.takelivesondeath = 0;
	level thread onallplayersready();
	level.aitriggerspawnflags = getaitriggerflags();
	level.vehicletriggerspawnflags = getvehicletriggerflags();
	level.var_82dda526 = 1;
	level.var_869c7fba = 1;
	level.teambased = 0;
	level.defaultclass = "CLASS_CUSTOM1";
	level.weaponnone = getweapon(#"none");
	level.weaponnull = getweapon(#"weapon_null");
	level.numlives = 1;
	level.custommayspawnlogic = &mayspawn;
	level.graceperiod = 1410065407;
	system::function_c11b0642();
	level flag::set(#"load_main_complete");
}

/*
	Name: mayspawn
	Namespace: doa
	Checksum: 0x2402E1CD
	Offset: 0x3D0
	Size: 0x8
	Parameters: 0
	Flags: Linked
*/
function mayspawn()
{
	return true;
}

/*
	Name: onallplayersready
	Namespace: doa
	Checksum: 0x4D924F55
	Offset: 0x3E0
	Size: 0x27C
	Parameters: 0
	Flags: Linked
*/
function onallplayersready()
{
	level endon(#"game_ended");
	while(!getnumexpectedplayers(1))
	{
		wait(0.1);
	}
	level.var_3fd55ae0 = 0;
	level.var_5c6783e9 = getnumexpectedplayers(1);
	player_count_actual = 0;
	while(player_count_actual < getnumexpectedplayers(1))
	{
		players = getplayers();
		player_count_actual = 0;
		foreach(player in players)
		{
			player.var_200b0850 = 1;
			if(player.sessionstate == "playing" || player.sessionstate == "spectator" && !isbot(player))
			{
				player_count_actual++;
			}
		}
		/#
			println((("" + getnumconnectedplayers()) + "") + getnumexpectedplayers(1));
		#/
		wait(0.1);
	}
	setinitialplayersconnected();
	level flag::set("all_players_connected");
	function_9a8ab40f();
	level util::streamer_wait();
	level flag::set("gameplay_started");
	level clientfield::set("gameplay_started", 1);
}

/*
	Name: function_d797f41f
	Namespace: doa
	Checksum: 0x788B2FCD
	Offset: 0x668
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_d797f41f(n_waittime)
{
	if(!isdefined(n_waittime))
	{
		n_waittime = 1;
	}
	wait(n_waittime);
	music::setmusicstate("none");
}

/*
	Name: function_9a8ab40f
	Namespace: doa
	Checksum: 0x33D331E8
	Offset: 0x6B0
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function function_9a8ab40f()
{
	do
	{
		wait(0.1);
		var_183929a8 = 0;
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(!player isloadingcinematicplaying())
			{
				var_183929a8++;
			}
		}
	}
	while(a_players.size > var_183929a8);
}

/*
	Name: on_player_spawned
	Namespace: doa
	Checksum: 0x27CD77CC
	Offset: 0x788
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self val::reset(#"hash_5bb0dd6b277fc20c", "freezecontrols");
	self val::reset(#"hash_5bb0dd6b277fc20c", "disablegadgets");
}

/*
	Name: default_onspawnspectator
	Namespace: doa
	Checksum: 0x31576A22
	Offset: 0x7E8
	Size: 0xDC
	Parameters: 2
	Flags: None
*/
function default_onspawnspectator(origin, angles)
{
	if(isdefined(origin) && isdefined(angles))
	{
		self spawn(origin, angles);
		return;
	}
	if(isdefined(level.doa.var_39e3fa99))
	{
		spawnpoint = [[ level.doa.var_39e3fa99 ]]->getcenter();
	}
	else
	{
		arenas = struct::get_array("arena_center", "targetname");
		spawnpoint = arenas[0];
	}
	self spawn(spawnpoint.origin, spawnpoint.angles);
}

