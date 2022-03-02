#using script_15022fca9ab99080;
#using script_1d1a97b78f64bfd;
#using script_2c74a7b5eea1ec89;
#using script_3728b3b9606c4299;
#using script_383a3b1bb18ba876;
#using script_3fda550bc6e1089a;
#using script_4721de209091b1a6;
#using script_47fb62300ac0bd60;
#using script_4a03c204316cf33;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using script_6d9aa3cb389aa46a;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_2d34cefc;

/*
	Name: function_ff600e26
	Namespace: namespace_2d34cefc
	Checksum: 0x37DA369E
	Offset: 0x468
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ff600e26()
{
	level notify(431379235);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2d34cefc
	Checksum: 0x82CECC9
	Offset: 0x488
	Size: 0xEE
	Parameters: 1
	Flags: Linked
*/
function function_70a657d8(var_9dedc222)
{
	init_shared();
	killstreaks::function_e4ef8390(var_9dedc222, &activatemaingunner);
	killstreaks::function_94c74046("ac130");
	killcam::function_4789a39a(#"hash_17df39d53492b0bf", &function_91ba5c69);
	killcam::function_4789a39a(#"hash_7b24d0d0d2823bca", &function_91ba5c69);
	killcam::function_4789a39a(#"hash_721bd01efec90239", &function_91ba5c69);
}

/*
	Name: function_3675de8b
	Namespace: namespace_2d34cefc
	Checksum: 0xBB18EB5C
	Offset: 0x580
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function function_3675de8b()
{
	bundle = killstreaks::get_script_bundle("ac130");
	/#
		assert(isdefined(bundle));
	#/
	var_d57617dd = (isdefined(bundle.var_dff95af) ? bundle.var_dff95af : 300);
	level.var_89350618 = killstreaks::function_f3875fb0(level.var_98fe5b4a, (isdefined(level.var_b34c8ec8) ? level.var_b34c8ec8 : 9000), var_d57617dd, 1);
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon("ac130"), &function_bff5c062);
	}
}

/*
	Name: spawnac130
	Namespace: namespace_2d34cefc
	Checksum: 0xFD3D3989
	Offset: 0x688
	Size: 0xA82
	Parameters: 1
	Flags: Linked
*/
function spawnac130(killstreaktype)
{
	player = self;
	/#
		assert(!isdefined(level.ac130));
	#/
	if(is_true(player.isplanting) || is_true(player.isdefusing) || player util::isusingremote() || player iswallrunning() || player oob::isoutofbounds())
	{
		return 0;
	}
	killstreak_id = player killstreakrules::killstreakstart("ac130", player.team, undefined, 1);
	if(killstreak_id == -1)
	{
		return 0;
	}
	bundle = killstreaks::get_script_bundle("ac130");
	/#
		assert(isdefined(bundle));
	#/
	spawnpos = level.mapcenter + (5000, 5000, 8000);
	level.ac130 = spawnvehicle(bundle.ksvehicle, spawnpos, (0, 0, 0), "ac130");
	level.ac130.identifier_weapon = getweapon("ac130");
	level.ac130 killstreaks::configure_team(killstreaktype, killstreak_id, player, "helicopter");
	level.ac130 killstreak_hacking::enable_hacking("ac130", &hackedprefunction, &hackedpostfunction);
	level.ac130.killstreak_id = killstreak_id;
	level.ac130.destroyfunc = &function_a51c391f;
	level.ac130.hardpointtype = "ac130";
	level.ac130 clientfield::set("enemyvehicle", 1);
	level.ac130 vehicle::init_target_group();
	level.ac130.killstreak_timer_started = 0;
	level.ac130.allowdeath = 0;
	level.ac130 setforcenocull();
	level.ac130.playermovedrecently = 0;
	level.ac130.soundmod = "default_loud";
	level.ac130 hacker_tool::registerwithhackertool(50, 10000);
	level.ac130.usage = [];
	level.destructible_callbacks[#"turret_destroyed"] = &vtoldestructiblecallback;
	level.ac130.shuttingdown = 0;
	level.ac130.completely_shutdown = 0;
	level.ac130 thread heatseekingmissile::playlockonsoundsthread(self, #"hash_fa62d8cec85b1a0", #"hash_1683ed70beb3f2");
	level.ac130 thread helicopter::wait_for_killed();
	level.ac130.maxhealth = (isdefined(killstreak_bundles::get_max_health("ac130")) ? killstreak_bundles::get_max_health("ac130") : 5000);
	level.ac130.original_health = level.ac130.maxhealth;
	level.ac130.health = level.ac130.maxhealth;
	level.ac130.damagetaken = 0;
	level.ac130 thread helicopter::heli_health("ac130");
	level.ac130 setcandamage(1);
	target_set(level.ac130, vectorscale((0, 0, -1), 100));
	target_setallowhighsteering(level.ac130, 1);
	level.ac130.numflares = 1;
	level.ac130.fx_flare = bundle.var_22ab738b;
	level.ac130 helicopter::create_flare_ent(vectorscale((0, 0, -1), 25));
	level.ac130 thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(bundle, "death");
	level.ac130.is_still_valid_target_for_stinger_override = &function_c2bfa7e1;
	level.ac130 thread namespace_231aa29a::function_d4896942(bundle, "ac130", "ac130_shutdown");
	level.ac130 thread namespace_231aa29a::function_31f9c728(bundle, "ac130", "exp_incoming_missile", "uin_ac130_alarm_missile_incoming", "ac130_shutdown");
	level.ac130 setrotorspeed(1);
	level.ac130 util::function_c596f193();
	level.ac130.maxvisibledist = 16384;
	level.ac130 function_53d3b37a(bundle);
	level.ac130.totalrockethits = 0;
	level.ac130.turretrockethits = 0;
	level.ac130.overridevehicledamage = &function_dea7ec6a;
	level.ac130.hackedhealthupdatecallback = &function_7cdff810;
	level.ac130.detonateviaemp = &helicoptedetonateviaemp;
	player thread namespace_f9b02f80::play_killstreak_start_dialog("ac130", player.team, killstreak_id);
	level.ac130 namespace_f9b02f80::play_pilot_dialog_on_owner("arrive", "ac130", killstreak_id);
	level.ac130 thread killstreaks::player_killstreak_threat_tracking("ac130", 0.9848077);
	level.ac130 thread function_e187e17b();
	player stats::function_e24eec31(bundle.var_1ab696c6, #"used", 1);
	player thread waitforvtolshutdownthread(level.ac130);
	var_e47f3d4a = getdvarfloat(#"hash_29a9f2bae7599f46", -27);
	radius = (isdefined(level.var_8db9ea19) ? level.var_8db9ea19 : (isdefined(bundle.var_1f9faa0c) ? bundle.var_1f9faa0c : 12000));
	level.ac130.var_9d44b193 = bundle.var_693dc1fb;
	if(function_f99d2668())
	{
		var_b0490eb9 = getheliheightlockheight(player.origin);
		trace = groundtrace((player.origin[0], player.origin[1], var_b0490eb9), player.origin - vectorscale((0, 0, 1), 5000), 0, level.ac130);
		groundheight = trace[#"position"][2];
		var_b7d4ae34 = groundheight + ((var_b0490eb9 - groundheight) * bundle.var_ff73e08c);
		level.var_89350618.origin = (player.origin[0], player.origin[1], var_b7d4ae34);
		level.var_e2a77deb = player.origin;
	}
	if(isdefined(level.var_def002d))
	{
		level.ac130 killstreaks::function_d7123898(level.var_89350618, level.var_def002d, 1, var_e47f3d4a);
	}
	else
	{
		level.ac130 killstreaks::function_67d553c4(level.var_89350618, radius, 0, 1, var_e47f3d4a);
	}
	if(level.gameended === 1)
	{
		return 0;
	}
	result = player function_4d980695(1, killstreaktype);
	return result;
}

/*
	Name: function_4d980695
	Namespace: namespace_2d34cefc
	Checksum: 0xCF31F71F
	Offset: 0x1118
	Size: 0x430
	Parameters: 2
	Flags: Linked
*/
function function_4d980695(isowner, killstreaktype)
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	player util::setusingremote("ac130");
	player.ignoreempjammed = 1;
	result = player killstreaks::init_ride_killstreak("ac130");
	player.ignoreempjammed = 0;
	if(result != "success")
	{
		if(result != "disconnect")
		{
			player killstreaks::clear_using_remote();
			killstreakslot = player killstreaks::function_a2c375bb(killstreaktype);
			player killstreaks::function_a831f92c(killstreakslot, 0, 0);
		}
		level.ac130.failed2enter = 1;
		level.ac130 notify(#"ac130_shutdown");
		return false;
	}
	bundle = killstreaks::get_script_bundle("ac130");
	/#
		assert(isdefined(bundle));
	#/
	var_fbc8efd2 = 1;
	if(isdefined(level.var_36cf2603))
	{
		var_fbc8efd2 = level.var_36cf2603;
	}
	level.ac130 usevehicle(player, var_fbc8efd2);
	level.ac130.usage[player.entnum] = 1;
	level.ac130 thread audio::sndupdatevehiclecontext(1);
	level.ac130 thread vehicle::monitor_missiles_locked_on_to_me(player);
	level.ac130 thread function_5cdcce1e(player);
	if(level.ac130.killstreak_timer_started)
	{
		player vehicle::set_vehicle_drivable_time(level.ac130.killstreak_duration, level.ac130.killstreak_end_time);
	}
	else
	{
		duration = (isdefined(bundle.ksduration) ? bundle.ksduration : 60000);
		player vehicle::set_vehicle_drivable_time(duration, gettime() + duration);
	}
	if(!is_true(level.var_dab73f4a))
	{
		level.ac130 thread watchplayerexitrequestthread(player);
	}
	player thread watchplayerteamchangethread(level.ac130);
	player setmodellodbias((isdefined(level.mothership_lod_bias) ? level.mothership_lod_bias : 8));
	player givededicatedshadow(level.ac130);
	player clientfield::set_player_uimodel("vehicle.inAC130", 1);
	player clientfield::set_to_player("inAC130", 1);
	player killstreaks::thermal_glow(1);
	player thread function_41f0e35b(level.ac130);
	return true;
}

/*
	Name: init_shared
	Namespace: namespace_2d34cefc
	Checksum: 0xB2BF5A0C
	Offset: 0x1550
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	callback::on_connect(&onplayerconnect);
	level thread waitforgameendthread();
	level.ac130 = undefined;
	clientfield::function_a8bbc967("vehicle.selectedWeapon", 1, 2, "int", 0);
	clientfield::function_a8bbc967("vehicle.flareCount", 1, 2, "int", 0);
	clientfield::function_a8bbc967("vehicle.inAC130", 1, 1, "int", 0);
	clientfield::register("toplayer", "inAC130", 1, 1, "int");
}

/*
	Name: function_bff5c062
	Namespace: namespace_2d34cefc
	Checksum: 0x73FD226A
	Offset: 0x1650
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(var_2f03ffd6, var_dbd1a594)
{
	var_2f03ffd6 killstreaks::function_73566ec7(var_dbd1a594, getweapon(#"gadget_icepick"), var_2f03ffd6.owner);
	var_2f03ffd6.destroyscoreeventgiven = 1;
	function_8721028e(var_2f03ffd6.owner, 1);
}

/*
	Name: onplayerconnect
	Namespace: namespace_2d34cefc
	Checksum: 0x121B2135
	Offset: 0x16D8
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function onplayerconnect()
{
	if(!isdefined(self.entnum))
	{
		self.entnum = self getentitynumber();
	}
}

/*
	Name: activatemaingunner
	Namespace: namespace_2d34cefc
	Checksum: 0x5434E672
	Offset: 0x1710
	Size: 0x118
	Parameters: 1
	Flags: Linked
*/
function activatemaingunner(killstreaktype)
{
	player = self;
	attempts = 0;
	while(isdefined(level.ac130))
	{
		if(!player killstreakrules::iskillstreakallowed("ac130", player.team))
		{
			return 0;
		}
		attempts++;
		if(attempts > 50)
		{
			return 0;
		}
		wait(0.1);
	}
	player val::set(#"spawnac130", "freezecontrols");
	result = player [[level.var_f987766c]](killstreaktype);
	player val::reset(#"spawnac130", "freezecontrols");
	if(level.gameended)
	{
		return 1;
	}
	if(!isdefined(result))
	{
		return 0;
	}
	return result;
}

/*
	Name: hackedprefunction
	Namespace: namespace_2d34cefc
	Checksum: 0x17342849
	Offset: 0x1830
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function hackedprefunction(hacker)
{
	heligunner = self;
	heligunner.owner unlink();
	level.ac130 clientfield::set("vehicletransition", 0);
	heligunner.owner setmodellodbias(0);
	heligunner.owner notify(#"gunner_left");
	heligunner.owner killstreaks::clear_using_remote();
	heligunner.owner vehicle::stop_monitor_missiles_locked_on_to_me();
	heligunner makevehicleunusable();
}

/*
	Name: hackedpostfunction
	Namespace: namespace_2d34cefc
	Checksum: 0x2739546A
	Offset: 0x1910
	Size: 0x1CA
	Parameters: 1
	Flags: Linked
*/
function hackedpostfunction(hacker)
{
	heligunner = self;
	heligunner clientfield::set("enemyvehicle", 2);
	heligunner makevehicleusable();
	heligunner usevehicle(hacker, 1);
	level.ac130 clientfield::set("vehicletransition", 1);
	heligunner thread vehicle::monitor_missiles_locked_on_to_me(hacker);
	heligunner thread watchplayerexitrequestthread(hacker);
	hacker setmodellodbias((isdefined(level.mothership_lod_bias) ? level.mothership_lod_bias : 8));
	heligunner.owner givededicatedshadow(level.ac130);
	hacker thread watchplayerteamchangethread(heligunner);
	hacker killstreaks::set_killstreak_delay_killcam("ac130");
	if(heligunner.killstreak_timer_started)
	{
		heligunner.killstreak_duration = heligunner killstreak_hacking::get_hacked_timeout_duration_ms();
		heligunner.killstreak_end_time = hacker killstreak_hacking::set_vehicle_drivable_time_starting_now(heligunner);
		heligunner.killstreakendtime = int(heligunner.killstreak_end_time);
	}
	else
	{
		heligunner.killstreak_timer_start_using_hacked_time = 1;
	}
}

/*
	Name: function_e187e17b
	Namespace: namespace_2d34cefc
	Checksum: 0xBED1288D
	Offset: 0x1AE8
	Size: 0xE6
	Parameters: 0
	Flags: Linked
*/
function function_e187e17b()
{
	self endon(#"death");
	for(;;)
	{
		params = undefined;
		params = self waittill(#"gunner_weapon_fired");
		if(isdefined(params.projectiles) && isdefined(self.killstreak_id))
		{
			foreach(projectile in params.projectiles)
			{
				if(isdefined(projectile))
				{
					projectile.killstreakid = self.killstreak_id;
				}
			}
		}
	}
}

/*
	Name: function_7cdff810
	Namespace: namespace_2d34cefc
	Checksum: 0xA4E8E5A0
	Offset: 0x1BD8
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function function_7cdff810()
{
	ac130 = self;
	if(ac130.shuttingdown == 1)
	{
		return;
	}
	hackedhealth = killstreak_bundles::get_hacked_health("ac130");
	/#
		assert(isdefined(hackedhealth));
	#/
	if(ac130.health > hackedhealth)
	{
		ac130.health = hackedhealth;
	}
}

/*
	Name: waitforgameendthread
	Namespace: namespace_2d34cefc
	Checksum: 0x5F311F4C
	Offset: 0x1C68
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function waitforgameendthread()
{
	level waittill(#"game_ended");
	if(isdefined(level.ac130) && isdefined(level.ac130.owner))
	{
		function_8721028e(level.ac130.owner);
	}
}

/*
	Name: waitforvtolshutdownthread
	Namespace: namespace_2d34cefc
	Checksum: 0x6D0214B2
	Offset: 0x1CE0
	Size: 0x1B2
	Parameters: 1
	Flags: Linked
*/
function waitforvtolshutdownthread(ac130)
{
	waitresult = undefined;
	waitresult = ac130 waittill(#"ac130_shutdown");
	if(!isdefined(ac130))
	{
		return;
	}
	if(ac130.completely_shutdown !== 1)
	{
		attacker = waitresult.attacker;
		if(isdefined(attacker))
		{
			luinotifyevent(#"player_callout", 2, #"hash_20aa28bee9cfdd61", attacker.entnum);
		}
		if(target_istarget(ac130))
		{
			target_remove(ac130);
		}
		if(issentient(ac130))
		{
			ac130 function_60d50ea4();
		}
		if(isdefined(ac130.flare_ent))
		{
			ac130.flare_ent delete();
			ac130.flare_ent = undefined;
		}
		ac130 function_cc756b8d();
		function_8721028e(ac130.owner);
	}
	/#
		assert(ac130.var_957d409b === 1);
	#/
	ac130 deletedelay();
	ac130 = undefined;
}

/*
	Name: function_cc756b8d
	Namespace: namespace_2d34cefc
	Checksum: 0x58A22239
	Offset: 0x1EA0
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_cc756b8d()
{
	if(!isdefined(self))
	{
		return;
	}
	if(self.var_957d409b === 1)
	{
		return;
	}
	killstreakrules::killstreakstop(self.killstreaktype, self.originalteam, self.killstreak_id);
	self.var_957d409b = 1;
	level.ac130 = undefined;
}

/*
	Name: function_31d18ab9
	Namespace: namespace_2d34cefc
	Checksum: 0xD545459
	Offset: 0x1F10
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_31d18ab9()
{
	self endon(#"death");
	self killstreakrules::function_d9f8f32b(self.killstreaktype);
	wait((isdefined(5) ? 5 : 0));
	self function_cc756b8d();
}

/*
	Name: function_a51c391f
	Namespace: namespace_2d34cefc
	Checksum: 0x60DFE337
	Offset: 0x1F80
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function function_a51c391f()
{
	ac130 = self;
	ac130 notify(#"ac130_shutdown");
}

/*
	Name: ontimeoutcallback
	Namespace: namespace_2d34cefc
	Checksum: 0x6A9B01B1
	Offset: 0x1FB0
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function ontimeoutcallback()
{
	if(!is_true(level.var_43da6545) && isdefined(level.ac130))
	{
		level.ac130 notify(#"hash_70be1b524e0ab533");
		function_8721028e(level.ac130.owner);
	}
}

/*
	Name: ontimecheck
	Namespace: namespace_2d34cefc
	Checksum: 0xA64E894F
	Offset: 0x2028
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function ontimecheck()
{
	self namespace_f9b02f80::play_pilot_dialog_on_owner("timecheck", "ac130", self.killstreak_id);
}

/*
	Name: function_c2bfa7e1
	Namespace: namespace_2d34cefc
	Checksum: 0xB78D3DA0
	Offset: 0x2068
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_c2bfa7e1(ent, weapon)
{
	if(isdefined(weapon.var_7132bbb7))
	{
		return false;
	}
	if(weapon.leaving === 1)
	{
		return true;
	}
	if(weapon.shuttingdown === 1)
	{
		return false;
	}
	if(weapon.completely_shutdown === 1)
	{
		return false;
	}
	return true;
}

/*
	Name: watchplayerteamchangethread
	Namespace: namespace_2d34cefc
	Checksum: 0x57AB644B
	Offset: 0x20E8
	Size: 0x138
	Parameters: 1
	Flags: Linked
*/
function watchplayerteamchangethread(ac130)
{
	ac130 notify(#"mothership_team_change");
	ac130 endon(#"mothership_team_change");
	/#
		assert(isplayer(self));
	#/
	player = self;
	player endon(#"gunner_left");
	player waittill(#"joined_team", #"disconnect", #"joined_spectators");
	ownerleft = 1;
	if(isdefined(player))
	{
		ownerleft = !isdefined(ac130.ownerentnum) || ac130.ownerentnum == player.entnum;
		player thread function_8721028e(player);
	}
	if(isdefined(ac130))
	{
		if(ownerleft)
		{
			ac130 notify(#"ac130_shutdown");
		}
	}
}

/*
	Name: watchplayerexitrequestthread
	Namespace: namespace_2d34cefc
	Checksum: 0xE55FD959
	Offset: 0x2228
	Size: 0x23A
	Parameters: 1
	Flags: Linked
*/
function watchplayerexitrequestthread(player)
{
	player notify(#"watchplayerexitrequestthread_singleton");
	player endon(#"watchplayerexitrequestthread_singleton");
	/#
		assert(isplayer(player));
	#/
	ac130 = self;
	level endon(#"game_ended");
	player endon(#"disconnect", #"gunner_left");
	ac130 endon(#"death");
	var_f6263fe2 = getdvarfloat(#"hash_2ed1b7031dae0df7", 0.5);
	while(true)
	{
		timeused = 0;
		player function_7deaa2a4(timeused);
		player function_9d62ff6c();
		while(player usebuttonpressed() && player killstreaks::function_59e2c378())
		{
			timeused = timeused + (float(function_60d95f53()) / 1000);
			player function_7deaa2a4(timeused / var_f6263fe2);
			if(timeused > var_f6263fe2)
			{
				ac130 namespace_f9b02f80::play_pilot_dialog_on_owner("remoteOperatorRemoved", "ac130", ac130.killstreak_id);
				player thread function_8721028e(player, 0, 1);
				return;
			}
			waitframe(1);
		}
		waitframe(1);
	}
}

/*
	Name: cantargetplayer
	Namespace: namespace_2d34cefc
	Checksum: 0x129EDFA0
	Offset: 0x2470
	Size: 0x156
	Parameters: 2
	Flags: Linked
*/
function cantargetplayer(player, hardpointtype)
{
	if(!isalive(hardpointtype) || hardpointtype.sessionstate != "playing")
	{
		return false;
	}
	if(hardpointtype.ignoreme === 1)
	{
		return false;
	}
	if(hardpointtype isnotarget())
	{
		return false;
	}
	if(hardpointtype hasperk(#"hash_37f82f1d672c4870"))
	{
		return false;
	}
	if(!isdefined(hardpointtype.team))
	{
		return false;
	}
	if(!util::function_fbce7263(hardpointtype.team, self.team))
	{
		return false;
	}
	if(hardpointtype.team == #"spectator")
	{
		return false;
	}
	if(isdefined(hardpointtype.spawntime) && ((float(gettime() - hardpointtype.spawntime)) / 1000) <= level.heli_target_spawnprotection)
	{
		return false;
	}
	return true;
}

/*
	Name: function_7ec0bdc
	Namespace: namespace_2d34cefc
	Checksum: 0x25189149
	Offset: 0x25D0
	Size: 0x22A
	Parameters: 1
	Flags: Linked
*/
function function_7ec0bdc(owner)
{
	self endon(#"death", #"ac130_shutdown");
	owner endon(#"disconnect");
	targets = [];
	players = level.players;
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(self cantargetplayer(player))
		{
			if(isdefined(player))
			{
				targets[targets.size] = player;
			}
		}
	}
	if(targets.size == 1)
	{
		return targets[0];
	}
	if(targets.size > 1)
	{
		foreach(target in targets)
		{
			self killstreaks::update_player_threat(target);
		}
		highest = 0;
		currenttarget = undefined;
		foreach(target in targets)
		{
			if(isdefined(target.threatlevel) && target.threatlevel > highest)
			{
				highest = target.threatlevel;
				currenttarget = target;
			}
		}
		return currenttarget;
	}
	return undefined;
}

/*
	Name: function_a514a080
	Namespace: namespace_2d34cefc
	Checksum: 0xD7C567DC
	Offset: 0x2808
	Size: 0x148
	Parameters: 1
	Flags: Linked
*/
function function_a514a080(player)
{
	self endon(#"death", #"ac130_shutdown", #"hash_70be1b524e0ab533");
	player endon(#"disconnect");
	self.var_7917e5a1 = 1;
	turretindex = 1;
	while(true)
	{
		target = function_7ec0bdc(player);
		if(isalive(target))
		{
			self turretsettarget(0, target);
			weapon = self seatgetweapon(turretindex);
			self vehicle_ai::fire_for_rounds(weapon.clipsize, turretindex, target);
			turretindex++;
			if(turretindex > 3)
			{
				turretindex = 1;
				wait(2);
			}
		}
		wait(randomintrange(1, 2));
	}
}

/*
	Name: function_41f0e35b
	Namespace: namespace_2d34cefc
	Checksum: 0x4B446F9F
	Offset: 0x2958
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function function_41f0e35b(ac130)
{
	ac130 endon(#"death", #"ac130_shutdown");
	self endon(#"disconnect");
	wait(0.1);
	var_74a46de6 = ac130 function_90d45d34(0);
	view_pos = self getplayercamerapos();
	lookat_pos = level.mapcenter;
	if(isdefined(level.var_e2a77deb))
	{
		lookat_pos = level.var_e2a77deb;
	}
	self setplayerangles((vectortoangles(lookat_pos - view_pos)) - var_74a46de6);
}

/*
	Name: function_5cdcce1e
	Namespace: namespace_2d34cefc
	Checksum: 0xCBBCC7D5
	Offset: 0x2A60
	Size: 0x338
	Parameters: 1
	Flags: Linked
*/
function function_5cdcce1e(player)
{
	ac130 = self;
	ac130 endon(#"delete", #"ac130_shutdown");
	player endon(#"disconnect", #"joined_team", #"joined_spectator", #"changed_specialist");
	var_2990ddbd = -1;
	while(true)
	{
		ammo_in_clip = ac130 function_e2d89efe(1);
		player clientfield::set_player_uimodel("vehicle.rocketAmmo", ammo_in_clip);
		var_a4a44abc = ac130 function_fde0d99e(1);
		player clientfield::set_player_uimodel("vehicle.bindingCooldown0.cooldown", 1 - var_a4a44abc);
		ammo_in_clip = ac130 function_e2d89efe(2);
		player clientfield::set_player_uimodel("vehicle.ammoCount", ammo_in_clip);
		var_a4a44abc = ac130 function_fde0d99e(2);
		player clientfield::set_player_uimodel("vehicle.bindingCooldown1.cooldown", 1 - var_a4a44abc);
		ammo_in_clip = ac130 function_e2d89efe(3);
		player clientfield::set_player_uimodel("vehicle.ammo2Count", ammo_in_clip);
		var_a4a44abc = ac130 function_fde0d99e(3);
		player clientfield::set_player_uimodel("vehicle.bindingCooldown2.cooldown", 1 - var_a4a44abc);
		player clientfield::set_player_uimodel("vehicle.flareCount", ac130.numflares);
		seat_index = int(max(0, (isdefined(ac130 getoccupantseat(player)) ? ac130 getoccupantseat(player) : 0)));
		player clientfield::set_player_uimodel("vehicle.selectedWeapon", seat_index);
		if(var_2990ddbd != seat_index && isdefined(ac130.killstreak_duration) && isdefined(ac130.killstreak_end_time))
		{
			ac130 updatedrivabletimeforalloccupants(ac130.killstreak_duration, ac130.killstreak_end_time);
			var_2990ddbd = seat_index;
		}
		wait(0.1);
	}
}

/*
	Name: mainturretdestroyed
	Namespace: namespace_2d34cefc
	Checksum: 0xA0A974C7
	Offset: 0x2DA0
	Size: 0x21C
	Parameters: 3
	Flags: Linked
*/
function mainturretdestroyed(ac130, eattacker, weapon)
{
	ac130.owner iprintlnbold(#"hash_bbc64fd3a1e88d");
	if(target_istarget(ac130))
	{
		target_remove(ac130);
	}
	if(issentient(ac130))
	{
		ac130 function_60d50ea4();
	}
	ac130.shuttingdown = 1;
	eattacker = self [[level.figure_out_attacker]](eattacker);
	if(isdefined(eattacker) && (!isdefined(ac130.owner) || ac130.owner util::isenemyplayer(eattacker)))
	{
		luinotifyevent(#"player_callout", 2, #"hash_bbc64fd3a1e88d", eattacker.entnum);
		challenges::destroyedaircraft(eattacker, weapon, 1, ac130, 1);
		eattacker challenges::addflyswatterstat(weapon, ac130);
		ac130 killstreaks::function_73566ec7(eattacker, weapon, ac130.owner);
		ac130 namespace_f9b02f80::play_destroyed_dialog_on_owner("ac130", ac130.killstreak_id);
		eattacker battlechatter::function_eebf94f6("ac130");
		eattacker stats::function_e24eec31(weapon, #"hash_3f3d8a93c372c67d", 1);
	}
	ac130 thread function_46d0e4e5();
}

/*
	Name: vtoldestructiblecallback
	Namespace: namespace_2d34cefc
	Checksum: 0x2D142FCB
	Offset: 0x2FC8
	Size: 0x84
	Parameters: 6
	Flags: Linked
*/
function vtoldestructiblecallback(brokennotify, eattacker, weapon, pieceindex, dir, mod)
{
	ac130 = self;
	ac130 endon(#"delete", #"ac130_shutdown");
	mainturretdestroyed(ac130, dir, mod);
}

/*
	Name: function_8721028e
	Namespace: namespace_2d34cefc
	Checksum: 0x4732D2B1
	Offset: 0x3058
	Size: 0x3F6
	Parameters: 3
	Flags: Linked
*/
function function_8721028e(player, should_explode, var_c3b5f258)
{
	if(!isdefined(should_explode))
	{
		should_explode = 0;
	}
	if(!isdefined(var_c3b5f258))
	{
		var_c3b5f258 = 0;
	}
	if(isbot(player))
	{
		player ai::set_behavior_attribute("control", "commander");
	}
	if(!isdefined(level.ac130) || level.ac130.completely_shutdown === 1)
	{
		return;
	}
	if(!is_true(level.ac130.var_7917e5a1))
	{
		if(isdefined(player))
		{
			player vehicle::stop_monitor_missiles_locked_on_to_me();
		}
		if(isdefined(player) && isdefined(level.ac130) && isdefined(level.ac130.owner))
		{
			if(isdefined(player.usingvehicle) && player.usingvehicle)
			{
				player unlink();
				level.ac130 clientfield::set("vehicletransition", 0);
				player clientfield::set_player_uimodel("vehicle.inAC130", 0);
				player clientfield::set_to_player("inAC130", 0);
				player killstreaks::thermal_glow(0);
			}
		}
	}
	if(!var_c3b5f258)
	{
		level.ac130.shuttingdown = 1;
		level.ac130.hardpointtype = "ac130";
		level.ac130 unlink();
		planedir = anglestoforward(level.ac130.angles);
		var_15f570c1 = level.ac130.origin + vectorscale(planedir, level.ac130.var_9d44b193);
		level.ac130 thread function_31d18ab9();
		if(should_explode)
		{
			var_15f570c1 = var_15f570c1 + (vectorscale((0, 0, -1), 8000));
		}
		level.ac130 thread helicopter::heli_leave(var_15f570c1, 1);
		level.ac130 thread audio::sndupdatevehiclecontext(0);
		if(should_explode)
		{
			level.ac130 thread function_60e3edcc();
		}
	}
	if(!is_true(level.ac130.var_7917e5a1) && isdefined(player))
	{
		player setmodellodbias(0);
		player givededicatedshadow(player);
		player notify(#"gunner_left");
		player killstreaks::clear_using_remote();
	}
	if(!var_c3b5f258)
	{
		level.ac130.completely_shutdown = 1;
		level.ac130.shuttingdown = 0;
	}
	if(var_c3b5f258)
	{
		level.ac130 thread function_a514a080(player);
	}
}

/*
	Name: function_c4aa4bb2
	Namespace: namespace_2d34cefc
	Checksum: 0x46D8B71E
	Offset: 0x3458
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_c4aa4bb2()
{
	ac130 = self;
	if(isdefined(ac130) && isdefined(ac130.owner))
	{
		org = ac130 gettagorigin("tag_barrel");
		magnitude = 0.3;
		duration = 2;
		radius = 500;
		v_pos = ac130.origin;
		earthquake(magnitude, duration, org, 500);
		ac130 playsound(#"hash_5314ffef2464b607");
	}
}

/*
	Name: function_dea7ec6a
	Namespace: namespace_2d34cefc
	Checksum: 0xBED10FEA
	Offset: 0x3538
	Size: 0x724
	Parameters: 15
	Flags: Linked
*/
function function_dea7ec6a(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	ac130 = self;
	if(vpoint == "MOD_TRIGGER_HURT")
	{
		return 0;
	}
	if(ac130.shuttingdown)
	{
		return 0;
	}
	smeansofdeath = self killstreaks::ondamageperweapon("ac130", idflags, smeansofdeath, weapon, vpoint, vdir, ac130.maxhealth, undefined, ac130.maxhealth * 0.4, undefined, 0, undefined, 1, 1);
	if(smeansofdeath == 0)
	{
		return 0;
	}
	handleasrocketdamage = vpoint == "MOD_PROJECTILE" || vpoint == "MOD_EXPLOSIVE";
	if(vdir.statindex === level.weaponshotgunenergy.statindex || vdir.statindex === level.weaponpistolenergy.statindex)
	{
		handleasrocketdamage = 0;
	}
	if(handleasrocketdamage)
	{
		ac130 function_c4aa4bb2();
		ac130 playsound(#"hash_ddcd9d25e056016");
	}
	var_902cbab5 = self.health - smeansofdeath;
	if(!is_true(self.var_5b3f091f) && var_902cbab5 <= (self.maxhealth * 0.75))
	{
		self namespace_f9b02f80::play_pilot_dialog_on_owner("damaged", "ac130", self.killstreak_id);
		self.var_5b3f091f = 1;
	}
	else if(!is_true(self.var_7e6efe74) && self.health <= (self.maxhealth * 0.25))
	{
		self namespace_f9b02f80::play_pilot_dialog_on_owner("damaged1", "ac130", self.killstreak_id);
		self.var_7e6efe74 = 1;
	}
	var_a07db9e0 = self.maxhealth * 0.75;
	var_c5d67baf = self.maxhealth * 0.5;
	if(self.health > var_a07db9e0 && var_902cbab5 <= var_a07db9e0)
	{
		self thread function_d55529();
	}
	else if(self.health > var_c5d67baf && var_902cbab5 <= var_c5d67baf)
	{
		self thread function_ae354bc7();
	}
	if(self.health > 0 && var_902cbab5 <= 0 && !ac130.shuttingdown)
	{
		ac130.shuttingdown = 1;
		if(!isdefined(ac130.destroyscoreeventgiven) && isdefined(idflags) && (!isdefined(ac130.owner) || ac130.owner util::isenemyplayer(idflags)))
		{
			idflags = self [[level.figure_out_attacker]](idflags);
			luinotifyevent(#"player_callout", 2, #"hash_bbc64fd3a1e88d", idflags.entnum);
			ac130 namespace_f9b02f80::play_destroyed_dialog_on_owner("ac130", ac130.killstreak_id);
			idflags battlechatter::function_eebf94f6("ac130");
			challenges::destroyedaircraft(idflags, vdir, 1, ac130, 1);
			idflags challenges::addflyswatterstat(vdir, ac130);
			idflags stats::function_e24eec31(vdir, #"hash_3f3d8a93c372c67d", 1);
			ac130.destroyscoreeventgiven = 1;
		}
		if(isdefined(idamage) && idamage getentitytype() == 4)
		{
			bundle = killstreaks::get_script_bundle("ac130");
			if(isdefined(bundle.var_888a5ff7) && isdefined(shitloc))
			{
				var_74d40edb = idamage getvelocity();
				if(lengthsquared(var_74d40edb) > sqr(50))
				{
					var_29edfc10 = vectornormalize(var_74d40edb);
					playfx(bundle.var_888a5ff7, shitloc, var_29edfc10, undefined, undefined, self.team);
				}
			}
		}
		ac130.var_d02ddb8e = vdir;
		params = {#partname:vsurfacenormal, #modelindex:partname, #damagefromunderneath:modelindex, #psoffsettime:damagefromunderneath, #shitloc:psoffsettime, #vdir:vdamageorigin, #vpoint:shitloc, #weapon:vdir, #smeansofdeath:vpoint, #idflags:weapon, #idamage:smeansofdeath, #eattacker:idflags, #einflictor:idamage};
		self callback::callback(#"on_vehicle_damage", params);
		ac130 thread function_46d0e4e5();
		return 0;
	}
	return smeansofdeath;
}

/*
	Name: function_46d0e4e5
	Namespace: namespace_2d34cefc
	Checksum: 0xCB77A16C
	Offset: 0x3C68
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_46d0e4e5()
{
	ac130 = self;
	ac130 endon(#"death");
	if(self.leave_by_damage_initiated === 1)
	{
		return;
	}
	self.leave_by_damage_initiated = 1;
	if(target_istarget(ac130))
	{
		target_remove(ac130);
	}
	if(issentient(ac130))
	{
		ac130 function_60d50ea4();
	}
	ac130 thread remote_weapons::do_static_fx();
	ac130 waittilltimeout(0.5, #"static_fx_done");
	should_explode = 1;
	function_8721028e(ac130.owner, should_explode);
}

/*
	Name: helicoptedetonateviaemp
	Namespace: namespace_2d34cefc
	Checksum: 0x398AC9F7
	Offset: 0x3D80
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function helicoptedetonateviaemp(attacker, weapon)
{
	mainturretdestroyed(level.ac130, attacker, weapon);
}

/*
	Name: function_cd679760
	Namespace: namespace_2d34cefc
	Checksum: 0x67A95902
	Offset: 0x3DC0
	Size: 0x39A
	Parameters: 2
	Flags: None
*/
function function_cd679760(startnode, destnodes)
{
	self notify(#"flying");
	self endon(#"flying", #"crashing", #"leaving", #"death");
	bundle = killstreaks::get_script_bundle("ac130");
	/#
		assert(isdefined(bundle));
	#/
	nextnode = getent(startnode.target, "targetname");
	/#
		assert(isdefined(nextnode), "");
	#/
	self setspeed(150, 80);
	self setneargoalnotifydist(100);
	self setgoal(nextnode.origin + (0, 0, 0), 1);
	self waittill(#"near_goal");
	firstpass = 1;
	if(!self.playermovedrecently)
	{
		node = self updateareanodes(destnodes, 0);
		level.ac130.currentnode = node;
		targetnode = getent(node.target, "targetname");
		traveltonode(targetnode);
		if(isdefined(targetnode.script_airspeed) && isdefined(targetnode.script_accel))
		{
			heli_speed = targetnode.script_airspeed;
			heli_accel = targetnode.script_accel;
		}
		else
		{
			heli_speed = 150 + randomint(20);
			heli_accel = 40 + randomint(10);
		}
		self setspeed(heli_speed, heli_accel);
		self setgoal(targetnode.origin + (0, 0, 0), 1);
		self setgoalyaw(targetnode.angles[1]);
	}
	if(!isdefined(targetnode) || !isdefined(targetnode.script_delay))
	{
		self waittill(#"near_goal");
		waittime = 10 + randomint(5);
	}
	else
	{
		self waittill(#"goal");
		waittime = targetnode.script_delay;
	}
	if(firstpass)
	{
		self function_53d3b37a(bundle);
		firstpass = 0;
	}
	wait(waittime);
}

/*
	Name: function_53d3b37a
	Namespace: namespace_2d34cefc
	Checksum: 0x2B44B25A
	Offset: 0x4168
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_53d3b37a(bundle)
{
	self.killstreak_duration = (self.killstreak_timer_start_using_hacked_time === 1 ? self killstreak_hacking::get_hacked_timeout_duration_ms() : (isdefined(bundle.ksduration) ? bundle.ksduration : 60000));
	self.killstreak_end_time = gettime() + self.killstreak_duration;
	self.killstreakendtime = int(self.killstreak_end_time);
	self thread killstreaks::waitfortimeout("ac130", self.killstreak_duration, &ontimeoutcallback, "delete", "death");
	self thread killstreaks::waitfortimecheck(self.killstreak_duration / 2, &ontimecheck, "delete", "death");
	self.killstreak_timer_started = 1;
	self updatedrivabletimeforalloccupants(self.killstreak_duration, self.killstreak_end_time);
}

/*
	Name: updatedrivabletimeforalloccupants
	Namespace: namespace_2d34cefc
	Checksum: 0x9A8C011B
	Offset: 0x42B8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function updatedrivabletimeforalloccupants(duration_ms, end_time_ms)
{
	if(isdefined(self.owner))
	{
		self.owner vehicle::set_vehicle_drivable_time(duration_ms, end_time_ms);
	}
}

/*
	Name: watchlocationchangethread
	Namespace: namespace_2d34cefc
	Checksum: 0x98F8D72C
	Offset: 0x4300
	Size: 0x2E8
	Parameters: 1
	Flags: None
*/
function watchlocationchangethread(destnodes)
{
	player = self;
	player endon(#"disconnect", #"gunner_left");
	ac130 = level.ac130;
	bundle = killstreaks::get_script_bundle("ac130");
	/#
		assert(isdefined(bundle));
	#/
	ac130 endon(#"delete", #"ac130_shutdown");
	player thread setplayermovedrecentlythread();
	player.moves = 0;
	while(true)
	{
		ac130 waittill(#"goal");
		if(player.moves > 0)
		{
			waittime = randomintrange(bundle.var_efac0f7a, bundle.var_18d458d2);
			wait(float(waittime) / 1000);
		}
		player.moves++;
		node = self updateareanodes(destnodes, 1);
		ac130.currentnode = node;
		targetnode = getent(node.target, "targetname");
		player playlocalsound(#"mpl_cgunner_nav");
		ac130 traveltonode(targetnode);
		if(isdefined(targetnode.script_airspeed) && isdefined(targetnode.script_accel))
		{
			heli_speed = targetnode.script_airspeed;
			heli_accel = targetnode.script_accel;
		}
		else
		{
			heli_speed = 80 + randomint(20);
			heli_accel = 40 + randomint(10);
		}
		ac130 setspeed(heli_speed, heli_accel);
		ac130 setgoal(targetnode.origin + (0, 0, 0), 1);
		ac130 setgoalyaw(targetnode.angles[1]);
	}
}

/*
	Name: setplayermovedrecentlythread
	Namespace: namespace_2d34cefc
	Checksum: 0xA92A26A5
	Offset: 0x45F0
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function setplayermovedrecentlythread()
{
	player = self;
	player endon(#"disconnect", #"gunner_left");
	ac130 = level.ac130;
	ac130 endon(#"delete", #"ac130_shutdown");
	mymove = self.moves;
	level.ac130.playermovedrecently = 1;
	wait(100);
	if(mymove === self.moves && isdefined(level.ac130))
	{
		level.ac130.playermovedrecently = 0;
	}
}

/*
	Name: updateareanodes
	Namespace: namespace_2d34cefc
	Checksum: 0x3634FBCE
	Offset: 0x46D0
	Size: 0x416
	Parameters: 2
	Flags: Linked
*/
function updateareanodes(areanodes, forcemove)
{
	validenemies = [];
	foreach(node in areanodes)
	{
		node.validplayers = [];
		node.nodescore = 0;
	}
	foreach(player in level.players)
	{
		if(!isalive(player))
		{
			continue;
		}
		if(player.team == self.team)
		{
			continue;
		}
		foreach(node in areanodes)
		{
			if(distancesquared(player.origin, node.origin) > 1048576)
			{
				continue;
			}
			node.validplayers[node.validplayers.size] = player;
		}
	}
	bestnode = undefined;
	foreach(node in areanodes)
	{
		if(isdefined(level.ac130.currentnode) && node == level.ac130.currentnode)
		{
			continue;
		}
		helinode = getent(node.target, "targetname");
		foreach(player in node.validplayers)
		{
			node.nodescore = node.nodescore + 1;
			if(bullettracepassed(player.origin + vectorscale((0, 0, 1), 32), helinode.origin, 0, player))
			{
				node.nodescore = node.nodescore + 3;
			}
		}
		if(forcemove && distancesquared(level.ac130.origin, helinode.origin) < 40000)
		{
			node.nodescore = -1;
		}
		if(!isdefined(bestnode) || node.nodescore > bestnode.nodescore)
		{
			bestnode = node;
		}
	}
	return bestnode;
}

/*
	Name: traveltonode
	Namespace: namespace_2d34cefc
	Checksum: 0x1116EE66
	Offset: 0x4AF0
	Size: 0x28A
	Parameters: 1
	Flags: Linked
*/
function traveltonode(goalnode)
{
	originoffets = getoriginoffsets(goalnode);
	if(originoffets[#"start"] != self.origin)
	{
		if(isdefined(goalnode.script_airspeed) && isdefined(goalnode.script_accel))
		{
			heli_speed = goalnode.script_airspeed;
			heli_accel = goalnode.script_accel;
		}
		else
		{
			heli_speed = 30 + randomint(20);
			heli_accel = 15 + randomint(15);
		}
		self setspeed(heli_speed, heli_accel);
		self setgoal(originoffets[#"start"] + vectorscale((0, 0, 1), 30), 0);
		self setgoalyaw(goalnode.angles[1]);
		self waittill(#"goal");
	}
	if(originoffets[#"end"] != goalnode.origin)
	{
		if(isdefined(goalnode.script_airspeed) && isdefined(goalnode.script_accel))
		{
			heli_speed = goalnode.script_airspeed;
			heli_accel = goalnode.script_accel;
		}
		else
		{
			heli_speed = 30 + randomint(20);
			heli_accel = 15 + randomint(15);
		}
		self setspeed(heli_speed, heli_accel);
		self setgoal(originoffets[#"end"] + vectorscale((0, 0, 1), 30), 0);
		self setgoalyaw(goalnode.angles[1]);
		self waittill(#"goal");
	}
}

/*
	Name: getoriginoffsets
	Namespace: namespace_2d34cefc
	Checksum: 0xD3611875
	Offset: 0x4D88
	Size: 0x214
	Parameters: 1
	Flags: Linked
*/
function getoriginoffsets(goalnode)
{
	startorigin = self.origin;
	endorigin = goalnode.origin;
	numtraces = 0;
	maxtraces = 40;
	traceoffset = vectorscale((0, 0, -1), 196);
	traceorigin = bullettrace(startorigin + traceoffset, endorigin + traceoffset, 0, self);
	while((distancesquared(traceorigin[#"position"], endorigin + traceoffset)) > 10 && numtraces < maxtraces)
	{
		/#
			println("" + (distancesquared(traceorigin[#"position"], endorigin + traceoffset)));
		#/
		if(startorigin[2] < endorigin[2])
		{
			startorigin = startorigin + vectorscale((0, 0, 1), 128);
		}
		else
		{
			if(startorigin[2] > endorigin[2])
			{
				endorigin = endorigin + vectorscale((0, 0, 1), 128);
			}
			else
			{
				startorigin = startorigin + vectorscale((0, 0, 1), 128);
				endorigin = endorigin + vectorscale((0, 0, 1), 128);
			}
		}
		numtraces++;
		traceorigin = bullettrace(startorigin + traceoffset, endorigin + traceoffset, 0, self);
	}
	offsets = [];
	offsets[#"start"] = startorigin;
	offsets[#"end"] = endorigin;
	return offsets;
}

/*
	Name: function_631f02c5
	Namespace: namespace_2d34cefc
	Checksum: 0xDF40303D
	Offset: 0x4FA8
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_631f02c5(var_f9e67747)
{
	self endon(#"killed");
	if(var_f9e67747 == 0)
	{
		self.var_1824934b = (isdefined(self.var_1824934b) ? self.var_1824934b : 0) + 1;
	}
	else
	{
		if(var_f9e67747 == 1)
		{
			self.var_6c81f48 = (isdefined(self.var_6c81f48) ? self.var_6c81f48 : 0) + 1;
		}
		else
		{
			self.var_bcdeb5e6 = (isdefined(self.var_bcdeb5e6) ? self.var_bcdeb5e6 : 0) + 1;
		}
	}
	wait(2.5);
	if(!isdefined(self))
	{
		return;
	}
	self function_568f6426(var_f9e67747);
}

/*
	Name: function_568f6426
	Namespace: namespace_2d34cefc
	Checksum: 0xDCBCFFBB
	Offset: 0x5098
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_568f6426(var_f9e67747)
{
	if(var_f9e67747 == 0)
	{
		kills = self.var_1824934b;
		prefix = "kill";
		self.var_1824934b = 0;
	}
	else
	{
		if(var_f9e67747 == 1)
		{
			kills = self.var_6c81f48;
			prefix = "secondaryKill";
			self.var_6c81f48 = 0;
		}
		else
		{
			kills = self.var_bcdeb5e6;
			prefix = "tertiaryKill";
			self.var_bcdeb5e6 = 0;
		}
	}
	if(kills > 3)
	{
		dialogkey = prefix + "Multiple";
	}
	else if(kills > 0)
	{
		dialogkey = prefix + kills;
	}
	if(isdefined(dialogkey))
	{
		self namespace_f9b02f80::play_pilot_dialog_on_owner(dialogkey, "ac130", self.killstreak_id);
	}
}

/*
	Name: function_d55529
	Namespace: namespace_2d34cefc
	Checksum: 0xC9763547
	Offset: 0x51B8
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_d55529()
{
	self endon(#"death");
	bundle = killstreaks::get_script_bundle("ac130");
	playfxontag(bundle.var_545fa8c2, self, "tag_fx_engine3");
	self playsound(level.heli_sound[#"crash"]);
	wait(0.1);
	playfxontag(bundle.var_545fa8c2, self, "tag_fx_engine4");
}

/*
	Name: function_ae354bc7
	Namespace: namespace_2d34cefc
	Checksum: 0x2376D855
	Offset: 0x5280
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_ae354bc7()
{
	self endon(#"death");
	bundle = killstreaks::get_script_bundle("ac130");
	playfxontag(bundle.var_465c35a5, self, "tag_fx_engine1");
	self playsound(level.heli_sound[#"crash"]);
	wait(0.1);
	playfxontag(bundle.var_465c35a5, self, "tag_fx_engine6");
}

/*
	Name: function_cd29787b
	Namespace: namespace_2d34cefc
	Checksum: 0xA1B56460
	Offset: 0x5348
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_cd29787b()
{
	bundle = killstreaks::get_script_bundle("ac130");
	playfxontag(bundle.ksexplosionfx, self, "tag_body_animate");
	if(isdefined(bundle.var_bb6c29b4) && isdefined(self.var_d02ddb8e) && self.var_d02ddb8e == getweapon(#"shock_rifle"))
	{
		playfxontag(bundle.var_bb6c29b4, self, "tag_body_animate");
	}
	self playsound("exp_ac130");
}

/*
	Name: function_60e3edcc
	Namespace: namespace_2d34cefc
	Checksum: 0x6D59F2E4
	Offset: 0x5430
	Size: 0x20C
	Parameters: 0
	Flags: Linked
*/
function function_60e3edcc()
{
	plane = self;
	plane endon(#"death");
	wait(randomfloatrange(0.1, 0.2));
	if(0)
	{
		goalx = randomfloatrange(650, 700);
		goaly = randomfloatrange(650, 700);
		if(randomintrange(0, 2) > 0)
		{
			goalx = goalx * -1;
		}
		if(randomintrange(0, 2) > 0)
		{
			goaly = goaly * -1;
		}
		var_8518e93e = randomfloatrange(3, 4);
		plane setplanebarrelroll(randomfloatrange(0.08333334, 0.1111111), randomfloatrange(4, 5));
		plane_speed = plane getspeedmph();
		wait(0.7);
		plane setspeed(plane_speed * 1.5, 300);
		wait(var_8518e93e - 0.7);
	}
	plane function_cd29787b();
	wait(0.1);
	plane ghost();
	wait(0.5);
}

/*
	Name: function_8920217c
	Namespace: namespace_2d34cefc
	Checksum: 0xC7DC00D8
	Offset: 0x5648
	Size: 0x7C
	Parameters: 3
	Flags: None
*/
function function_8920217c(var_eef27eea, var_dc40d987, var_c06eaeb5)
{
	if(!isdefined(var_eef27eea))
	{
		var_eef27eea = 0;
	}
	if(!isdefined(var_dc40d987))
	{
		var_dc40d987 = 0;
	}
	if(!isdefined(var_c06eaeb5))
	{
		var_c06eaeb5 = 0;
	}
	level.var_98fe5b4a = [1:var_dc40d987, 0:var_eef27eea];
	level.var_b34c8ec8 = var_c06eaeb5;
}

/*
	Name: function_672f2acd
	Namespace: namespace_2d34cefc
	Checksum: 0x3D1B6CB9
	Offset: 0x56D0
	Size: 0xE0
	Parameters: 3
	Flags: None
*/
function function_672f2acd(var_eb87911a, var_c3c587fa, var_a382eb14)
{
	/#
		assert(isdefined(level.var_89350618));
	#/
	level.var_98fe5b4a = [1:var_eb87911a[1], 0:var_eb87911a[0]];
	level.var_b34c8ec8 = var_eb87911a[2];
	level.var_89350618.origin = var_eb87911a;
	level.var_e2a77deb = var_c3c587fa;
	if(!isdefined(level.var_e2a77deb))
	{
		level.var_e2a77deb = (var_eb87911a[0], var_eb87911a[1], 0);
	}
	level.var_def002d = var_a382eb14;
}

/*
	Name: function_91ba5c69
	Namespace: namespace_2d34cefc
	Checksum: 0x31C08907
	Offset: 0x57B8
	Size: 0x54
	Parameters: 2
	Flags: Linked, Private
*/
function private function_91ba5c69(attacker, inflictor)
{
	if(isdefined(level.ac130) && is_true(level.ac130.var_7917e5a1))
	{
		return level.ac130;
	}
}

