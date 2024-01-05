#using script_45ed9e2916a5d657;
#using script_5ee86fb478309acf;
#using script_38dc72b5220a1a67;
#using script_a9c40f57b84dba8;
#using script_2c5f2d4e7aa698c4;
#using script_3a97cf7fe4b3bc97;
#using script_7c1ce8053e1f767a;
#using script_35347d750c565866;
#using script_54b939ad79f46602;
#using script_78c17b0050c5f017;
#using script_3c0e0fe36a7ec024;
#using script_3dc7e0c7f9c90bdb;
#using script_311c446e3df6c3fa;
#using script_7ccd314d69366639;
#using script_d85a41a4c7247ce;
#using script_1c5cce12dd83e08;
#using script_2ae7c487149cc862;
#using script_461a5eb3081800a3;
#using script_202bf2aa3dbffa20;
#using script_41e32418d719f2dd;
#using script_4ed01237ecbd380f;
#using script_5665e7d917abc3fc;
#using script_2bdd098a8215ac9f;
#using script_71cdde87963901ec;
#using script_62c40d9a3acec9b1;
#using script_1103c28492840e5f;
#using script_37ec43096fb284a3;
#using script_60793766a26de8df;
#using script_11cc3a9267cf7ac7;
#using script_44c87b4589ee1f93;
#using script_581877678e31274c;
#using script_eff00f787d80cdf;
#using script_6243781aa5394e62;
#using script_53d55f01b3a5be93;
#using script_391889b7ff93ef7e;
#using script_2c8fd33ddb45e78b;
#using scripts\core_common\util_shared.csc;
#using script_618d6f5ff5d18933;
#using scripts\core_common\map.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace zsurvival;

/*
	Name: function_b7549842
	Namespace: zsurvival
	Checksum: 0x2F90193B
	Offset: 0x4D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b7549842()
{
	level notify(1809656581);
}

/*
	Name: main
	Namespace: zsurvival
	Checksum: 0x1F5EB29A
	Offset: 0x4F8
	Size: 0x894
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.is_survival = 1;
	level.aat_in_use = 1;
	setdvar(#"hash_557b6cbf0e3a8553", 1);
	setdvar(#"hash_11a23659adb39e95", 1);
	callback::on_localclient_connect(&on_player_connect);
	level.var_13339abf = array(#"hash_41f5516d2a39d700", #"hash_7f522bf9ee249485", #"hash_2d2ce8582fb2b98", #"hash_68767e76af3b02ad", #"hash_294b09b399adeaf6", #"hash_335dbdca3e36e2bd");
	clientfield::register_clientuimodel("hudItems.streamerLoadFraction", #"hud_items", #"hash_7e7b0475689b500c", 1, 5, "float", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.wzLoadFinished", #"hud_items", #"hash_75d3a2a658cd9396", 1, 1, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionPassengerCount", #"hash_593f03dd48d5bc1f", #"hash_4686fa61f7f123ba", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.alivePlayerCount", #"hud_items", #"hash_660e10919fc3cb96", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.alivePlayerCountEnemy", #"hud_items", #"hash_3200ae248348b38a", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.aliveTeammateCount", #"hud_items", #"hash_23a0fd1ff456959", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.spectatorsCount", #"hud_items", #"hash_2821db97459aaa4a", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.playerKills", #"hud_items", #"playerkills", 1, 9, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.playerCleanUps", #"hud_items", #"hash_cb62c942965b99d", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("presence.modeparam", #"hash_3645501c8ba141af", #"hash_7347f20e8c2800c3", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.showReinsertionPassengerCount", #"hud_items", #"hash_5f5475b776cfc0cd", 1, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.playerLivesRemaining", #"hud_items", #"hash_6dddb9a20d49665d", 1, 3, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.playerCanRedeploy", #"hud_items", #"hash_116a728dee230334", 1, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.zombiesSurvivalRespawn", #"hud_items", #"hash_130bf6c6767308c2", 1, 1, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.collapse", #"hash_593f03dd48d5bc1f", #"collapse", 1, 21, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.waveRespawnTimer", #"hash_593f03dd48d5bc1f", #"hash_14384be8ccdfdba9", 1, 21, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.collapseIndex", #"hash_593f03dd48d5bc1f", #"hash_7ac8dd213b1f8d42", 1, 3, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.collapseCount", #"hash_593f03dd48d5bc1f", #"hash_28b490c7698f159d", 1, 3, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionIndex", #"hash_593f03dd48d5bc1f", #"hash_61754d24cc2fb6c3", 1, 3, "int", undefined, 0, 0);
	clientfield::register("world", "set_objective_fog", 1, 2, "int", &function_bdd60454, 0, 0);
	clientfield::function_5b7d846d("hudItems.team1.roundsWon", #"hash_410fe12a68d6e801", [1:#"roundswon", 0:#"team1"], 1, 4, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.team2.roundsWon", #"hash_410fe12a68d6e801", [1:#"roundswon", 0:#"team2"], 1, 4, "int", undefined, 0, 0);
	namespace_4abf1500::function_88645994(#"hash_1440a8afd0539909", #"hash_3e41166877185a54");
	level.progress_bar = luielembar::register();
	setsoundcontext("ambience_swap", "zsurvival");
}

/*
	Name: on_player_connect
	Namespace: zsurvival
	Checksum: 0xC7431C3B
	Offset: 0xD98
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function on_player_connect(localclientnum)
{
}

/*
	Name: function_bdd60454
	Namespace: zsurvival
	Checksum: 0x5DF07E5E
	Offset: 0xDB0
	Size: 0x1B4
	Parameters: 7
	Flags: Linked
*/
function function_bdd60454(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump)
{
	switch(wasdemojump)
	{
		case 0:
		{
			var_92d85419 = level.var_6465f02d;
			var_312d65d1 = level.var_68f7ce2e;
			level.var_68f7ce2e = 2;
			n_time = 3;
			break;
		}
		case 1:
		{
			var_92d85419 = 1;
			var_312d65d1 = 2;
			level.var_68f7ce2e = 4;
			n_time = 10;
			break;
		}
		case 2:
		{
			var_92d85419 = 1;
			var_312d65d1 = 2;
			level.var_68f7ce2e = 8;
			n_time = 10;
			break;
		}
	}
	setpbgactivebank(fieldname, level.var_68f7ce2e);
	setexposureactivebank(fieldname, level.var_68f7ce2e);
	e_player = getlocalplayers()[fieldname];
	e_player thread function_33593a44(fieldname, var_312d65d1, level.var_68f7ce2e, n_time, var_92d85419);
}

/*
	Name: function_33593a44
	Namespace: zsurvival
	Checksum: 0x13D29D5
	Offset: 0xF70
	Size: 0x188
	Parameters: 5
	Flags: Linked, Private
*/
function private function_33593a44(localclientnum, var_312d65d1, var_68f7ce2e, n_time, var_92d85419)
{
	if(!isdefined(n_time))
	{
		n_time = 3;
	}
	if(!isdefined(var_92d85419))
	{
		var_92d85419 = 1;
	}
	self notify("2115ad6a496dc3ba");
	self endon("2115ad6a496dc3ba");
	n_blend = 0;
	var_8a727807 = 1;
	n_increment = 1 / (n_time / 0.016);
	if(var_312d65d1 == 2)
	{
		level.var_6465f02d = var_92d85419;
		while(n_blend < var_92d85419)
		{
			function_be93487f(localclientnum, var_312d65d1 | var_68f7ce2e, 0, var_8a727807 - n_blend, n_blend, 0);
			n_blend = n_blend + n_increment;
			waitframe(1);
		}
	}
	else if(var_312d65d1 == 4 || var_312d65d1 == 8)
	{
		while(n_blend < var_8a727807)
		{
			function_be93487f(localclientnum, var_312d65d1 | var_68f7ce2e, 0, n_blend, var_92d85419 - n_blend, 0);
			n_blend = n_blend + n_increment;
			waitframe(1);
		}
	}
}

/*
	Name: _on_localplayer_spawned
	Namespace: zsurvival
	Checksum: 0x377F5CDD
	Offset: 0x1100
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private _on_localplayer_spawned(localclientnum)
{
	if(self function_da43934d())
	{
		self thread function_13a420b1(localclientnum);
	}
}

/*
	Name: function_491c852e
	Namespace: zsurvival
	Checksum: 0xAB30716B
	Offset: 0x1148
	Size: 0x8A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_491c852e(item)
{
	switch(item)
	{
		case "trip_wire_wz_item":
		{
			return 1;
			break;
		}
		case "concertina_wire_wz_item":
		{
			return 2;
			break;
		}
		case "cymbal_monkey_wz_item":
		{
			return 3;
			break;
		}
		case "ultimate_turret_wz_item":
		{
			return 4;
			break;
		}
	}
}

/*
	Name: function_13a420b1
	Namespace: zsurvival
	Checksum: 0xE3F31624
	Offset: 0x11E0
	Size: 0x120
	Parameters: 1
	Flags: Linked, Private
*/
function private function_13a420b1(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("df0a6a0cbfe7ce6");
	self endon("df0a6a0cbfe7ce6");
	clientdata = item_world::function_a7e98a1a(localclientnum);
	var_6e77adc6 = "inventory_craft" + localclientnum;
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(var_6e77adc6);
		if(waitresult._notify === var_6e77adc6)
		{
			item = waitresult.item;
			cost = waitresult.cost;
			item = function_491c852e(item);
			function_97fedb0d(localclientnum, 13, item, cost);
		}
	}
}

