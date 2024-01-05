#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\killstreaks\remote_weapons.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using script_4721de209091b1a6;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace qrdrone;

/*
	Name: init_shared
	Namespace: qrdrone
	Checksum: 0x5FB75E9C
	Offset: 0x3C0
	Size: 0x58C
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	if(!isdefined(level.qrdrone_shared))
	{
		level.qrdrone_shared = {};
		remote_weapons::init_shared();
		airsupport::init_shared();
		level.qrdrone_vehicle = "qrdrone_mp";
		params = getscriptbundle("killstreak_tank_robot");
		level.ai_tank_stun_fx = params.var_9e0f2ad3;
		level.qrdrone_dialog[#"launch"][0] = #"ac130_plt_yeahcleared";
		level.qrdrone_dialog[#"launch"][1] = #"ac130_plt_rollinin";
		level.qrdrone_dialog[#"launch"][2] = #"ac130_plt_scanrange";
		level.qrdrone_dialog[#"out_of_range"][0] = #"ac130_plt_cleanup";
		level.qrdrone_dialog[#"out_of_range"][1] = #"ac130_plt_targetreset";
		level.qrdrone_dialog[#"track"][0] = #"ac130_fco_moreenemy";
		level.qrdrone_dialog[#"track"][1] = #"ac130_fco_getthatguy";
		level.qrdrone_dialog[#"track"][2] = #"ac130_fco_guymovin";
		level.qrdrone_dialog[#"track"][3] = #"ac130_fco_getperson";
		level.qrdrone_dialog[#"track"][4] = #"ac130_fco_guyrunnin";
		level.qrdrone_dialog[#"track"][5] = #"ac130_fco_gotarunner";
		level.qrdrone_dialog[#"track"][6] = #"ac130_fco_backonthose";
		level.qrdrone_dialog[#"track"][7] = #"ac130_fco_gonnagethim";
		level.qrdrone_dialog[#"track"][8] = #"ac130_fco_personnelthere";
		level.qrdrone_dialog[#"track"][9] = #"ac130_fco_rightthere";
		level.qrdrone_dialog[#"track"][10] = #"ac130_fco_tracking";
		level.qrdrone_dialog[#"tag"][0] = #"ac130_fco_nice";
		level.qrdrone_dialog[#"tag"][1] = #"ac130_fco_yougothim";
		level.qrdrone_dialog[#"tag"][2] = #"ac130_fco_yougothim2";
		level.qrdrone_dialog[#"tag"][3] = #"ac130_fco_okyougothim";
		level.qrdrone_dialog[#"assist"][0] = #"ac130_fco_goodkill";
		level.qrdrone_dialog[#"assist"][1] = #"ac130_fco_thatsahit";
		level.qrdrone_dialog[#"assist"][2] = #"ac130_fco_directhit";
		level.qrdrone_dialog[#"assist"][3] = #"ac130_fco_rightontarget";
		level.qrdrone_lastdialogtime = 0;
		level.qrdrone_nodeployzones = getentarray("no_vehicles", "targetname");
		/#
			function_5ac4dc99("", 60);
		#/
		clientfield::register("vehicle", "qrdrone_state", 1, 3, "int");
		clientfield::register("vehicle", "qrdrone_timeout", 1, 1, "int");
		clientfield::register("vehicle", "qrdrone_countdown", 1, 1, "int");
		clientfield::register("vehicle", "qrdrone_out_of_range", 1, 1, "int");
		level.qrdroneonblowup = &qrdrone_blowup;
		level.qrdroneondamage = &qrdrone_damagewatcher;
	}
}

/*
	Name: tryuseqrdrone
	Namespace: qrdrone
	Checksum: 0xFB5A7AFC
	Offset: 0x958
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function tryuseqrdrone(lifeid)
{
	if(self util::isusingremote() || isdefined(level.nukeincoming))
	{
		return 0;
	}
	if(!self isonground())
	{
		self iprintlnbold(#"hash_7602a0cff466eccd");
		return 0;
	}
	streakname = "TODO";
	result = self givecarryqrdrone(lifeid, streakname);
	self.iscarrying = 0;
	return result;
}

/*
	Name: givecarryqrdrone
	Namespace: qrdrone
	Checksum: 0x22B482BD
	Offset: 0xA18
	Size: 0x104
	Parameters: 2
	Flags: None
*/
function givecarryqrdrone(lifeid, streakname)
{
	carryqrdrone = createcarryqrdrone(streakname, self);
	self setcarryingqrdrone(carryqrdrone);
	if(isalive(self) && isdefined(carryqrdrone))
	{
		origin = carryqrdrone.origin;
		angles = self.angles;
		carryqrdrone.soundent delete();
		carryqrdrone delete();
		result = self startqrdrone(lifeid, streakname, origin, angles);
	}
	else
	{
		result = 0;
	}
	return result;
}

/*
	Name: createcarryqrdrone
	Namespace: qrdrone
	Checksum: 0x8E3C1B76
	Offset: 0xB28
	Size: 0x248
	Parameters: 2
	Flags: None
*/
function createcarryqrdrone(streakname, owner)
{
	pos = (owner.origin + (anglestoforward(owner.angles) * 4)) + (anglestoup(owner.angles) * 50);
	carryqrdrone.turrettype = "sentry";
	carryqrdrone.origin = pos;
	carryqrdrone.angles = owner.angles;
	carryqrdrone.canbeplaced = 1;
	carryqrdrone makeunusable();
	carryqrdrone.owner = owner;
	carryqrdrone setowner(carryqrdrone.owner);
	carryqrdrone.scale = 3;
	carryqrdrone.inheliproximity = 0;
	carryqrdrone thread carryqrdrone_handleexistence();
	carryqrdrone.rangetrigger = getent("qrdrone_range", "targetname");
	if(!isdefined(carryqrdrone.rangetrigger))
	{
		carryqrdrone.maxheight = int(killstreaks::function_43f4782d());
		carryqrdrone.maxdistance = 3600;
	}
	carryqrdrone.minheight = level.mapcenter[2] - 800;
	carryqrdrone.soundent = spawn("script_origin", carryqrdrone.origin);
	carryqrdrone.soundent.angles = carryqrdrone.angles;
	carryqrdrone.soundent.origin = carryqrdrone.origin;
	carryqrdrone.soundent linkto(carryqrdrone);
	carryqrdrone.soundent playloopsound(#"recondrone_idle_high");
	return carryqrdrone;
}

/*
	Name: watchforattack
	Namespace: qrdrone
	Checksum: 0x4655E726
	Offset: 0xD78
	Size: 0x7A
	Parameters: 0
	Flags: None
*/
function watchforattack()
{
	self endon(#"death", #"disconnect", #"place_carryqrdrone", #"cancel_carryqrdrone");
	for(;;)
	{
		waitframe(1);
		if(self attackbuttonpressed())
		{
			self notify(#"place_carryqrdrone");
		}
	}
}

/*
	Name: setcarryingqrdrone
	Namespace: qrdrone
	Checksum: 0x1DD1D237
	Offset: 0xE00
	Size: 0x128
	Parameters: 1
	Flags: None
*/
function setcarryingqrdrone(carryqrdrone)
{
	self endon(#"death", #"disconnect");
	carryqrdrone thread carryqrdrone_setcarried(self);
	if(!carryqrdrone.canbeplaced)
	{
		if(self.team != #"spectator")
		{
			self iprintlnbold(#"hash_7602a0cff466eccd");
		}
		if(isdefined(carryqrdrone.soundent))
		{
			carryqrdrone.soundent delete();
		}
		carryqrdrone delete();
		return;
	}
	self.iscarrying = 0;
	carryqrdrone.carriedby = undefined;
	carryqrdrone playsound(#"sentry_gun_plant");
	carryqrdrone notify(#"placed");
}

/*
	Name: carryqrdrone_setcarried
	Namespace: qrdrone
	Checksum: 0xA4BD0CD1
	Offset: 0xF30
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function carryqrdrone_setcarried(carrier)
{
	self setcandamage(0);
	self setcontents(0);
	self.carriedby = carrier;
	carrier.iscarrying = 1;
	carrier thread updatecarryqrdroneplacement(self);
	self notify(#"carried");
}

/*
	Name: isinremotenodeploy
	Namespace: qrdrone
	Checksum: 0x9F30BC06
	Offset: 0xFB8
	Size: 0xBA
	Parameters: 0
	Flags: None
*/
function isinremotenodeploy()
{
	if(isdefined(level.qrdrone_nodeployzones) && level.qrdrone_nodeployzones.size)
	{
		foreach(zone in level.qrdrone_nodeployzones)
		{
			if(self istouching(zone))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: updatecarryqrdroneplacement
	Namespace: qrdrone
	Checksum: 0xAFBAA3C9
	Offset: 0x1080
	Size: 0x260
	Parameters: 1
	Flags: None
*/
function updatecarryqrdroneplacement(carryqrdrone)
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	carryqrdrone endon(#"placed", #"death");
	carryqrdrone.canbeplaced = 1;
	lastcanplacecarryqrdrone = -1;
	for(;;)
	{
		heightoffset = 18;
		switch(self getstance())
		{
			case "stand":
			{
				heightoffset = 40;
				break;
			}
			case "crouch":
			{
				heightoffset = 25;
				break;
			}
			case "prone":
			{
				heightoffset = 10;
				break;
			}
		}
		placement = self canplayerplacevehicle(22, 22, 50, heightoffset, 0, 0);
		carryqrdrone.origin = placement[#"origin"] + (anglestoup(self.angles) * 27);
		carryqrdrone.angles = placement[#"angles"];
		carryqrdrone.canbeplaced = self isonground() && placement[#"result"] && carryqrdrone qrdrone_in_range() && !carryqrdrone isinremotenodeploy();
		if(carryqrdrone.canbeplaced != lastcanplacecarryqrdrone)
		{
			if(carryqrdrone.canbeplaced)
			{
				if(self attackbuttonpressed())
				{
					self notify(#"place_carryqrdrone");
				}
			}
		}
		lastcanplacecarryqrdrone = carryqrdrone.canbeplaced;
		waitframe(1);
	}
}

/*
	Name: carryqrdrone_handleexistence
	Namespace: qrdrone
	Checksum: 0x6333837C
	Offset: 0x12E8
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function carryqrdrone_handleexistence()
{
	level endon(#"game_ended");
	self endon(#"death");
	self.owner endon(#"place_carryqrdrone", #"cancel_carryqrdrone");
	self.owner waittill(#"death", #"disconnect", #"joined_team", #"joined_spectators");
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: removeremoteweapon
	Namespace: qrdrone
	Checksum: 0xAFD769F1
	Offset: 0x13B0
	Size: 0x38
	Parameters: 0
	Flags: None
*/
function removeremoteweapon()
{
	level endon(#"game_ended");
	self endon(#"disconnect");
	wait(0.7);
}

/*
	Name: startqrdrone
	Namespace: qrdrone
	Checksum: 0xDE02A2A4
	Offset: 0x13F0
	Size: 0x326
	Parameters: 4
	Flags: None
*/
function startqrdrone(lifeid, streakname, origin, angles)
{
	self lockplayerforqrdronelaunch();
	self util::setusingremote(streakname);
	self val::set(#"startqrdrone", "freezecontrols");
	result = self killstreaks::init_ride_killstreak("qrdrone");
	if(result != "success" || level.gameended)
	{
		if(result != "disconnect")
		{
			self val::reset(#"startqrdrone", "freezecontrols");
			self killstreakrules::iskillstreakallowed("qrdrone", self.team);
			self notify(#"qrdrone_unlock");
			self killstreaks::clear_using_remote();
		}
		return false;
	}
	team = self.team;
	killstreak_id = self killstreakrules::killstreakstart("qrdrone", team, 0, 1);
	if(killstreak_id == -1)
	{
		self notify(#"qrdrone_unlock");
		self val::reset(#"startqrdrone", "freezecontrols");
		self killstreaks::clear_using_remote();
		return false;
	}
	self notify(#"qrdrone_unlock");
	qrdrone = createqrdrone(lifeid, self, streakname, origin, angles, killstreak_id);
	self val::reset(#"startqrdrone", "freezecontrols");
	if(isdefined(qrdrone))
	{
		self thread qrdrone_ride(lifeid, qrdrone, streakname);
		qrdrone waittill(#"end_remote");
		killstreakrules::killstreakstop("qrdrone", team, killstreak_id);
		return true;
	}
	self iprintlnbold(#"mp_too_many_vehicles");
	self killstreaks::clear_using_remote();
	killstreakrules::killstreakstop("qrdrone", team, killstreak_id);
	return false;
}

/*
	Name: lockplayerforqrdronelaunch
	Namespace: qrdrone
	Checksum: 0xBB10228D
	Offset: 0x1720
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function lockplayerforqrdronelaunch()
{
	lockspot = spawn("script_origin", self.origin);
	lockspot hide();
	self playerlinkto(lockspot);
	self thread clearplayerlockfromqrdronelaunch(lockspot);
}

/*
	Name: clearplayerlockfromqrdronelaunch
	Namespace: qrdrone
	Checksum: 0x6220FDBA
	Offset: 0x17A0
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function clearplayerlockfromqrdronelaunch(lockspot)
{
	level endon(#"game_ended");
	self waittill(#"disconnect", #"death", #"qrdrone_unlock");
	lockspot delete();
}

/*
	Name: createqrdrone
	Namespace: qrdrone
	Checksum: 0xECDB5518
	Offset: 0x1818
	Size: 0x3A8
	Parameters: 6
	Flags: None
*/
function createqrdrone(lifeid, owner, streakname, origin, angles, killstreak_id)
{
	qrdrone = spawnvehicle(level.qrdrone_vehicle, origin, angles);
	if(!isdefined(qrdrone))
	{
		return undefined;
	}
	qrdrone.lifeid = lifeid;
	qrdrone.team = owner.team;
	qrdrone setowner(owner);
	qrdrone clientfield::set("enemyvehicle", 1);
	qrdrone.health = 999999;
	qrdrone.maxhealth = 250;
	qrdrone.damagetaken = 0;
	qrdrone.destroyed = 0;
	qrdrone setcandamage(1);
	qrdrone enableaimassist();
	qrdrone.smoking = 0;
	qrdrone.inheliproximity = 0;
	qrdrone.helitype = "qrdrone";
	qrdrone.markedplayers = [];
	qrdrone.isstunned = 0;
	qrdrone setdrawinfrared(1);
	qrdrone.killcament = qrdrone.owner;
	owner weaponobjects::addweaponobjecttowatcher("qrdrone", qrdrone);
	qrdrone thread qrdrone_explode_on_notify(killstreak_id);
	qrdrone thread qrdrone_explode_on_game_end();
	qrdrone thread qrdrone_leave_on_timeout(streakname);
	qrdrone thread qrdrone_watch_distance();
	qrdrone thread qrdrone_watch_for_exit();
	qrdrone thread deleteonkillbrush(owner);
	target_set(qrdrone, (0, 0, 0));
	qrdrone.numflares = 0;
	qrdrone.flareoffset = vectorscale((0, 0, -1), 100);
	qrdrone thread heatseekingmissile::missiletarget_lockonmonitor(self, "end_remote");
	qrdrone thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(undefined, "crashing");
	qrdrone.emp_fx = spawn("script_model", self.origin);
	qrdrone.emp_fx setmodel(#"tag_origin");
	qrdrone.emp_fx linkto(self, "tag_origin", (vectorscale((0, 0, -1), 20)) + (anglestoforward(self.angles) * 6));
	qrdrone influencers::create_entity_enemy_influencer("small_vehicle", qrdrone.team);
	qrdrone influencers::create_entity_enemy_influencer("qrdrone_cylinder", qrdrone.team);
	return qrdrone;
}

/*
	Name: qrdrone_ride
	Namespace: qrdrone
	Checksum: 0x7E83E70
	Offset: 0x1BC8
	Size: 0x174
	Parameters: 3
	Flags: None
*/
function qrdrone_ride(lifeid, qrdrone, streakname)
{
	streakname.playerlinked = 1;
	self.restoreangles = self.angles;
	streakname usevehicle(self, 0);
	self util::clientnotify("qrfutz");
	self namespace_f9b02f80::play_killstreak_start_dialog("qrdrone", self.pers[#"team"]);
	self stats::function_e24eec31(getweapon(#"killstreak_qrdrone"), #"used", 1);
	self.qrdrone_ridelifeid = qrdrone;
	self.qrdrone = streakname;
	self thread qrdrone_delaylaunchdialog(streakname);
	self thread qrdrone_fireguns(streakname);
	streakname thread play_lockon_sounds(self);
	if(isdefined(level.qrdrone_vision))
	{
		self setvisionsetwaiter();
	}
}

/*
	Name: qrdrone_delaylaunchdialog
	Namespace: qrdrone
	Checksum: 0xC0EF1EAD
	Offset: 0x1D48
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function qrdrone_delaylaunchdialog(qrdrone)
{
	level endon(#"game_ended");
	self endon(#"disconnect");
	qrdrone endon(#"death", #"end_remote", #"end_launch_dialog");
	wait(3);
	self qrdrone_dialog("launch");
}

/*
	Name: qrdrone_unlink
	Namespace: qrdrone
	Checksum: 0x2F87EDB3
	Offset: 0x1DE0
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function qrdrone_unlink(qrdrone)
{
	if(isdefined(qrdrone))
	{
		qrdrone.playerlinked = 0;
		self destroyhud();
		if(isdefined(self.viewlockedentity))
		{
			self unlink();
			if(isdefined(level.gameended) && level.gameended)
			{
				self val::set(#"game_end", "freezecontrols");
			}
		}
	}
}

/*
	Name: qrdrone_endride
	Namespace: qrdrone
	Checksum: 0xA4E2A7DF
	Offset: 0x1E88
	Size: 0xAE
	Parameters: 1
	Flags: None
*/
function qrdrone_endride(qrdrone)
{
	if(isdefined(qrdrone))
	{
		qrdrone notify(#"end_remote");
		self killstreaks::clear_using_remote();
		self setplayerangles(self.restoreangles);
		if(isalive(self))
		{
			self killstreaks::switch_to_last_non_killstreak_weapon();
		}
		self thread qrdrone_freezebuffer();
	}
	self.qrdrone = undefined;
}

/*
	Name: play_lockon_sounds
	Namespace: qrdrone
	Checksum: 0x8120A81F
	Offset: 0x1F40
	Size: 0x1E0
	Parameters: 1
	Flags: None
*/
function play_lockon_sounds(player)
{
	player endon(#"disconnect");
	self endon(#"death", #"blowup", #"crashing");
	level endon(#"game_ended");
	self endon(#"end_remote");
	self.locksounds = spawn("script_model", self.origin);
	wait(0.1);
	self.locksounds linkto(self, "tag_player");
	while(true)
	{
		self waittill(#"locking on");
		while(true)
		{
			if(enemy_locking())
			{
				self.locksounds playsoundtoplayer(#"uin_alert_lockon", player);
				wait(0.125);
			}
			if(enemy_locked())
			{
				self.locksounds playsoundtoplayer(#"uin_alert_lockon", player);
				wait(0.125);
			}
			if(!enemy_locking() && !enemy_locked())
			{
				self.locksounds stopsounds();
				break;
			}
		}
	}
}

/*
	Name: enemy_locking
	Namespace: qrdrone
	Checksum: 0x1D5D1807
	Offset: 0x2128
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function enemy_locking()
{
	if(isdefined(self.locking_on) && self.locking_on)
	{
		return true;
	}
	return false;
}

/*
	Name: enemy_locked
	Namespace: qrdrone
	Checksum: 0xFFF34A86
	Offset: 0x2158
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function enemy_locked()
{
	if(isdefined(self.locked_on) && self.locked_on)
	{
		return true;
	}
	return false;
}

/*
	Name: qrdrone_freezebuffer
	Namespace: qrdrone
	Checksum: 0xC5121868
	Offset: 0x2188
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function qrdrone_freezebuffer()
{
	self endon(#"death");
	level endon(#"game_ended");
	self val::set(#"qrdrone_freezebuffer", "freezecontrols");
	wait(0.5);
	self val::reset(#"qrdrone_freezebuffer", "freezecontrols");
}

/*
	Name: qrdrone_playerexit
	Namespace: qrdrone
	Checksum: 0x589547CA
	Offset: 0x2218
	Size: 0xDA
	Parameters: 1
	Flags: None
*/
function qrdrone_playerexit(qrdrone)
{
	level endon(#"game_ended");
	self endon(#"disconnect");
	qrdrone endon(#"death", #"end_remote");
	wait(2);
	while(true)
	{
		timeused = 0;
		while(self usebuttonpressed())
		{
			timeused = timeused + 0.05;
			if(timeused > 0.75)
			{
				qrdrone thread qrdrone_leave();
				return;
			}
			waitframe(1);
		}
		waitframe(1);
	}
}

/*
	Name: touchedkillbrush
	Namespace: qrdrone
	Checksum: 0x911B2874
	Offset: 0x2300
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function touchedkillbrush()
{
	if(isdefined(self))
	{
		self clientfield::set("qrdrone_state", 3);
		watcher = self.owner weaponobjects::getweaponobjectwatcher("qrdrone");
		watcher thread weaponobjects::waitanddetonate(self, 0);
	}
}

/*
	Name: deleteonkillbrush
	Namespace: qrdrone
	Checksum: 0x134E0312
	Offset: 0x2380
	Size: 0x39C
	Parameters: 1
	Flags: None
*/
function deleteonkillbrush(player)
{
	player endon(#"disconnect");
	self endon(#"death");
	killbrushes = [];
	hurt = getentarray("trigger_hurt", "classname");
	foreach(trig in hurt)
	{
		if(trig.origin[2] <= player.origin[2] && (!isdefined(trig.script_parameters) || trig.script_parameters != "qrdrone_safe"))
		{
			killbrushes[killbrushes.size] = trig;
		}
	}
	crate_triggers = getentarray("crate_kill_trigger", "targetname");
	while(true)
	{
		for(i = 0; i < killbrushes.size; i++)
		{
			if(self istouching(killbrushes[i]))
			{
				self touchedkillbrush();
				return;
			}
		}
		foreach(trigger in crate_triggers)
		{
			if(trigger.active && self istouching(trigger))
			{
				self touchedkillbrush();
				return;
			}
		}
		if(isdefined(level.levelkillbrushes))
		{
			foreach(trigger in level.levelkillbrushes)
			{
				if(self istouching(trigger))
				{
					self touchedkillbrush();
					return;
				}
			}
		}
		if(level.script == "mp_castaway")
		{
			origin = self.origin - vectorscale((0, 0, 1), 12);
			water = getwaterheight(origin);
			if(water - origin[2] > 0)
			{
				self touchedkillbrush();
				return;
			}
		}
		wait(0.1);
	}
}

/*
	Name: qrdrone_force_destroy
	Namespace: qrdrone
	Checksum: 0xF7F63EA7
	Offset: 0x2728
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function qrdrone_force_destroy()
{
	self clientfield::set("qrdrone_state", 3);
	watcher = self.owner weaponobjects::getweaponobjectwatcher("qrdrone");
	watcher thread weaponobjects::waitanddetonate(self, 0);
}

/*
	Name: qrdrone_get_damage_effect
	Namespace: qrdrone
	Checksum: 0x3775A5AD
	Offset: 0x27A0
	Size: 0x20
	Parameters: 1
	Flags: None
*/
function qrdrone_get_damage_effect(health_pct)
{
	if(health_pct > 0.5)
	{
		return undefined;
	}
	return undefined;
}

/*
	Name: qrdrone_play_single_fx_on_tag
	Namespace: qrdrone
	Checksum: 0xAA5AA70D
	Offset: 0x27C8
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function qrdrone_play_single_fx_on_tag(effect, tag)
{
	if(isdefined(self.damage_fx_ent))
	{
		if(self.damage_fx_ent.effect == tag)
		{
			return;
		}
		self.damage_fx_ent delete();
	}
	playfxontag(tag, self, "tag_origin");
}

/*
	Name: qrdrone_update_damage_fx
	Namespace: qrdrone
	Checksum: 0x23B0C8B6
	Offset: 0x2848
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function qrdrone_update_damage_fx(health_percent)
{
	effect = qrdrone_get_damage_effect(health_percent);
	if(isdefined(effect))
	{
		qrdrone_play_single_fx_on_tag(effect, "tag_origin");
	}
	else if(isdefined(self.damage_fx_ent))
	{
		self.damage_fx_ent delete();
	}
}

/*
	Name: qrdrone_damagewatcher
	Namespace: qrdrone
	Checksum: 0x7987865B
	Offset: 0x28D0
	Size: 0x378
	Parameters: 0
	Flags: None
*/
function qrdrone_damagewatcher()
{
	self endon(#"death");
	self.maxhealth = 999999;
	self.health = self.maxhealth;
	self.maxhealth = 225;
	low_health = 0;
	damage_taken = 0;
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		attacker = waitresult.attacker;
		weapon = waitresult.weapon;
		damage = waitresult.amount;
		mod = waitresult.mod;
		dir = waitresult.direction;
		if(!isdefined(attacker) || !isplayer(attacker))
		{
			continue;
		}
		self.owner playrumbleonentity("damage_heavy");
		/#
			self.damage_debug = ((damage + "") + weapon.name) + "";
		#/
		if(mod == "MOD_RIFLE_BULLET" || mod == "MOD_PISTOL_BULLET")
		{
			if(isplayer(attacker))
			{
				if(attacker hasperk(#"specialty_armorpiercing"))
				{
					damage = damage + (int(damage * level.cac_armorpiercing_data));
				}
			}
			if(weapon.weapclass == "spread")
			{
				damage = damage * 2;
			}
		}
		if(weapon.isemp && mod == "MOD_GRENADE_SPLASH")
		{
			damage_taken = damage_taken + 225;
			damage = 0;
		}
		if(!self.isstunned)
		{
			if(weapon.isstun && (mod == "MOD_GRENADE_SPLASH" || mod == "MOD_GAS"))
			{
				self.isstunned = 1;
				self qrdrone_stun(2);
			}
		}
		self.attacker = attacker;
		self.owner sendkillstreakdamageevent(int(damage));
		damage_taken = damage_taken + damage;
		if(damage_taken >= 225)
		{
			self.owner sendkillstreakdamageevent(200);
			self qrdrone_death(attacker, weapon, dir, mod);
			return;
		}
		qrdrone_update_damage_fx(float(damage_taken) / 225);
	}
}

/*
	Name: qrdrone_stun
	Namespace: qrdrone
	Checksum: 0x6B419F55
	Offset: 0x2C50
	Size: 0xA6
	Parameters: 1
	Flags: None
*/
function qrdrone_stun(duration)
{
	self endon(#"death");
	self notify(#"stunned");
	self.owner val::set(#"qrdrone_stun", "freezecontrols");
	wait(duration);
	self.owner val::reset(#"qrdrone_stun", "freezecontrols");
	self.isstunned = 0;
}

/*
	Name: qrdrone_death
	Namespace: qrdrone
	Checksum: 0x89BC2EFA
	Offset: 0x2D00
	Size: 0x244
	Parameters: 4
	Flags: None
*/
function qrdrone_death(attacker, weapon, dir, damagetype)
{
	if(isdefined(self.damage_fx_ent))
	{
		self.damage_fx_ent delete();
	}
	if(isdefined(attacker) && isplayer(attacker) && attacker != self.owner)
	{
		level thread popups::displayteammessagetoall(#"hash_1b5291e0c76c5c6d", attacker);
		if(self.owner util::isenemyplayer(attacker))
		{
			attacker challenges::destroyedqrdrone(damagetype, weapon);
			attacker stats::function_e24eec31(weapon, #"destroyed_qrdrone", 1);
			attacker challenges::addflyswatterstat(weapon, self);
			attacker stats::function_e24eec31(weapon, #"destroyed_controlled_killstreak", 1);
		}
	}
	self thread qrdrone_crash_movement(attacker, dir);
	if(weapon.isemp)
	{
		playfxontag(level.ai_tank_stun_fx, self.emp_fx, "tag_origin");
	}
	self waittill(#"crash_done");
	if(isdefined(self.emp_fx))
	{
		self.emp_fx delete();
	}
	self clientfield::set("qrdrone_state", 3);
	watcher = self.owner weaponobjects::getweaponobjectwatcher("qrdrone");
	watcher thread weaponobjects::waitanddetonate(self, 0, attacker, weapon);
}

/*
	Name: death_fx
	Namespace: qrdrone
	Checksum: 0x1D9AA80A
	Offset: 0x2F50
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function death_fx()
{
	playfxontag(self.deathfx, self, self.deathfxtag);
	self playsound(#"veh_qrdrone_sparks");
}

/*
	Name: qrdrone_crash_movement
	Namespace: qrdrone
	Checksum: 0x3D232DE0
	Offset: 0x2FA0
	Size: 0x36E
	Parameters: 2
	Flags: None
*/
function qrdrone_crash_movement(attacker, hitdir)
{
	self endon(#"crash_done", #"death");
	self notify(#"crashing");
	self takeplayercontrol();
	self setmaxpitchroll(90, 180);
	self setphysacceleration(vectorscale((0, 0, -1), 800));
	side_dir = vectorcross(hitdir, (0, 0, 1));
	side_dir_mag = randomfloatrange(-100, 100);
	side_dir_mag = side_dir_mag + (math::sign(side_dir_mag) * 80);
	side_dir = side_dir * side_dir_mag;
	velocity = self getvelocity();
	self setvehvelocity((velocity + vectorscale((0, 0, 1), 100)) + vectornormalize(side_dir));
	ang_vel = self getangularvelocity();
	ang_vel = (ang_vel[0] * 0.3, ang_vel[1], ang_vel[2] * 0.3);
	yaw_vel = randomfloatrange(0, 210) * math::sign(ang_vel[1]);
	yaw_vel = yaw_vel + (math::sign(yaw_vel) * 180);
	ang_vel = ang_vel + (randomfloatrange(-100, 100), yaw_vel, randomfloatrange(-200, 200));
	self setangularvelocity(ang_vel);
	self.crash_accel = randomfloatrange(75, 110);
	self thread qrdrone_crash_accel();
	self thread qrdrone_collision();
	self playsound(#"veh_qrdrone_dmg_hit");
	self thread qrdrone_dmg_snd();
	wait(0.1);
	if(randomint(100) < 40)
	{
		self thread qrdrone_fire_for_time(randomfloatrange(0.7, 2));
	}
	wait(2);
	self notify(#"crash_done");
}

/*
	Name: qrdrone_dmg_snd
	Namespace: qrdrone
	Checksum: 0xF5E98367
	Offset: 0x3318
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function qrdrone_dmg_snd()
{
	dmg_ent = spawn("script_origin", self.origin);
	dmg_ent linkto(self);
	dmg_ent playloopsound(#"veh_qrdrone_dmg_loop");
	self waittill(#"crash_done", #"death");
	dmg_ent stoploopsound(0.2);
	wait(2);
	dmg_ent delete();
}

/*
	Name: qrdrone_fire_for_time
	Namespace: qrdrone
	Checksum: 0xDD2E847F
	Offset: 0x33E0
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function qrdrone_fire_for_time(totalfiretime)
{
	self endon(#"crash_done", #"change_state", #"death");
	weapon = self seatgetweapon(0);
	firetime = weapon.firetime;
	time = 0;
	firecount = 1;
	while(time < totalfiretime)
	{
		self fireweapon();
		firecount++;
		wait(firetime);
		time = time + firetime;
	}
}

/*
	Name: qrdrone_crash_accel
	Namespace: qrdrone
	Checksum: 0x81FB44EE
	Offset: 0x34B0
	Size: 0x1EE
	Parameters: 0
	Flags: None
*/
function qrdrone_crash_accel()
{
	self endon(#"crash_done", #"death");
	count = 0;
	while(true)
	{
		velocity = self getvelocity();
		self setvehvelocity(velocity + (anglestoup(self.angles) * self.crash_accel));
		self.crash_accel = self.crash_accel * 0.98;
		wait(0.1);
		count++;
		if((count % 8) == 0)
		{
			if(randomint(100) > 40)
			{
				if(velocity[2] > 150)
				{
					self.crash_accel = self.crash_accel * 0.75;
				}
				else if(velocity[2] < 40 && count < 60)
				{
					if(abs(self.angles[0]) > 30 || abs(self.angles[2]) > 30)
					{
						self.crash_accel = randomfloatrange(160, 200);
					}
					else
					{
						self.crash_accel = randomfloatrange(85, 120);
					}
				}
			}
		}
	}
}

/*
	Name: qrdrone_collision
	Namespace: qrdrone
	Checksum: 0x264160C6
	Offset: 0x36A8
	Size: 0x16A
	Parameters: 0
	Flags: None
*/
function qrdrone_collision()
{
	self endon(#"crash_done", #"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"veh_collision");
		velocity = waitresult.velocity;
		normal = waitresult.normal;
		ang_vel = self getangularvelocity() * 0.5;
		self setangularvelocity(ang_vel);
		velocity = self getvelocity();
		if(normal[2] < 0.7)
		{
			self setvehvelocity(velocity + (normal * 70));
			self playsound(#"veh_qrdrone_wall");
		}
		else
		{
			self playsound(#"veh_qrdrone_explo");
			self notify(#"crash_done");
		}
	}
}

/*
	Name: qrdrone_watch_distance
	Namespace: qrdrone
	Checksum: 0xC7B0B136
	Offset: 0x3820
	Size: 0x310
	Parameters: 2
	Flags: None
*/
function qrdrone_watch_distance(zoffset, minheightoverride)
{
	self endon(#"death");
	self clientfield::set("qrdrone_out_of_range", 1);
	waitframe(1);
	self clientfield::set("qrdrone_out_of_range", 0);
	qrdrone_height = struct::get("qrdrone_height", "targetname");
	if(isdefined(qrdrone_height))
	{
		self.maxheight = qrdrone_height.origin[2];
	}
	else
	{
		self.maxheight = int(killstreaks::function_43f4782d());
	}
	if(isdefined(zoffset))
	{
		self.maxheight = self.maxheight + zoffset;
	}
	self.maxdistance = 12800;
	self.minheight = level.mapcenter[2] - 800;
	if(isdefined(minheightoverride))
	{
		self.minheight = minheightoverride;
	}
	self.centerref = spawn("script_model", level.mapcenter);
	inrangepos = self.origin;
	self.rangecountdownactive = 0;
	while(true)
	{
		if(!self qrdrone_in_range())
		{
			staticalpha = 0;
			while(!self qrdrone_in_range())
			{
				if(!self.rangecountdownactive)
				{
					self.rangecountdownactive = 1;
					self thread qrdrone_rangecountdown();
				}
				if(isdefined(self.heliinproximity))
				{
					dist = distance(self.origin, self.heliinproximity.origin);
					staticalpha = 1 - ((dist - 150) / 150);
				}
				else
				{
					dist = distance(self.origin, inrangepos);
					staticalpha = min(0.7, dist / 200);
				}
				self.owner set_static_alpha(staticalpha, self);
				waitframe(1);
			}
			self notify(#"in_range");
			self.rangecountdownactive = 0;
			self thread qrdrone_staticfade(staticalpha);
		}
		inrangepos = self.origin;
		waitframe(1);
	}
}

/*
	Name: qrdrone_in_range
	Namespace: qrdrone
	Checksum: 0x8AFCDC48
	Offset: 0x3B38
	Size: 0x66
	Parameters: 0
	Flags: None
*/
function qrdrone_in_range()
{
	if(self.origin[2] < self.maxheight && self.origin[2] > self.minheight && !self.inheliproximity)
	{
		if(self function_4826630a())
		{
			return true;
		}
	}
	return false;
}

/*
	Name: qrdrone_staticfade
	Namespace: qrdrone
	Checksum: 0x417AC3DC
	Offset: 0x3BA8
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function qrdrone_staticfade(staticalpha)
{
	self endon(#"death");
	while(self qrdrone_in_range())
	{
		staticalpha = staticalpha - 0.05;
		if(staticalpha < 0)
		{
			self.owner set_static_alpha(staticalpha, self);
			break;
		}
		self.owner set_static_alpha(staticalpha, self);
		waitframe(1);
	}
}

/*
	Name: qrdrone_rangecountdown
	Namespace: qrdrone
	Checksum: 0x1D860427
	Offset: 0x3C50
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function qrdrone_rangecountdown()
{
	self endon(#"death", #"in_range");
	if(isdefined(self.heliinproximity))
	{
		countdown = 6.1;
	}
	else
	{
		countdown = 6.1;
	}
	hostmigration::waitlongdurationwithhostmigrationpause(countdown);
	self.owner notify(#"stop_signal_failure");
	if(isdefined(self.distance_shutdown_override))
	{
		return [[self.distance_shutdown_override]]();
	}
	self clientfield::set("qrdrone_state", 3);
	watcher = self.owner weaponobjects::getweaponobjectwatcher("qrdrone");
	watcher thread weaponobjects::waitanddetonate(self, 0);
}

/*
	Name: qrdrone_explode_on_notify
	Namespace: qrdrone
	Checksum: 0x1111AE02
	Offset: 0x3D68
	Size: 0x14C
	Parameters: 1
	Flags: None
*/
function qrdrone_explode_on_notify(killstreak_id)
{
	self endon(#"death", #"end_ride");
	self.owner waittill(#"disconnect", #"joined_team", #"joined_spectators");
	if(isdefined(self.owner))
	{
		self.owner killstreaks::clear_using_remote();
		self.owner destroyhud();
		self.owner qrdrone_endride(self);
	}
	else
	{
		killstreakrules::killstreakstop("qrdrone", self.team, killstreak_id);
	}
	self clientfield::set("qrdrone_state", 3);
	watcher = self.owner weaponobjects::getweaponobjectwatcher("qrdrone");
	watcher thread weaponobjects::waitanddetonate(self, 0);
}

/*
	Name: qrdrone_explode_on_game_end
	Namespace: qrdrone
	Checksum: 0x94385CB2
	Offset: 0x3EC0
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function qrdrone_explode_on_game_end()
{
	self endon(#"death");
	level waittill(#"game_ended");
	self clientfield::set("qrdrone_state", 3);
	watcher = self.owner weaponobjects::getweaponobjectwatcher("qrdrone");
	watcher weaponobjects::waitanddetonate(self, 0);
	self.owner qrdrone_endride(self);
}

/*
	Name: qrdrone_leave_on_timeout
	Namespace: qrdrone
	Checksum: 0xC321F9A0
	Offset: 0x3F78
	Size: 0x16C
	Parameters: 1
	Flags: None
*/
function qrdrone_leave_on_timeout(killstreakname)
{
	qrdrone = self;
	qrdrone endon(#"death");
	if(!level.vehiclestimed)
	{
		return;
	}
	qrdrone.flytime = 60;
	waittime = self.flytime - 10;
	/#
		function_5ac4dc99("", qrdrone.flytime);
		qrdrone.flytime = getdvarint(#"scr_qrdroneflytime", 0);
		waittime = self.flytime - 10;
		if(waittime < 0)
		{
			wait(qrdrone.flytime);
			self clientfield::set("", 3);
			watcher = qrdrone.owner weaponobjects::getweaponobjectwatcher("");
			watcher thread weaponobjects::waitanddetonate(qrdrone, 0);
			return;
		}
	#/
	qrdrone thread killstreaks::waitfortimeout(killstreakname, waittime, &qrdrone_leave_on_timeout_callback, "death");
}

/*
	Name: qrdrone_leave_on_timeout_callback
	Namespace: qrdrone
	Checksum: 0x2767D1D3
	Offset: 0x40F0
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function qrdrone_leave_on_timeout_callback()
{
	qrdrone = self;
	qrdrone clientfield::set("qrdrone_state", 1);
	qrdrone clientfield::set("qrdrone_countdown", 1);
	hostmigration::waitlongdurationwithhostmigrationpause(6);
	qrdrone clientfield::set("qrdrone_state", 2);
	qrdrone clientfield::set("qrdrone_timeout", 1);
	hostmigration::waitlongdurationwithhostmigrationpause(4);
	qrdrone clientfield::set("qrdrone_state", 3);
	watcher = self.owner weaponobjects::getweaponobjectwatcher("qrdrone");
	watcher thread weaponobjects::waitanddetonate(self, 0);
}

/*
	Name: qrdrone_leave
	Namespace: qrdrone
	Checksum: 0x2D61AA7B
	Offset: 0x4228
	Size: 0x8E
	Parameters: 0
	Flags: None
*/
function qrdrone_leave()
{
	level endon(#"game_ended");
	self endon(#"death");
	self notify(#"leaving");
	self.owner qrdrone_unlink(self);
	self.owner qrdrone_endride(self);
	self notify(#"death");
}

/*
	Name: qrdrone_exit_button_pressed
	Namespace: qrdrone
	Checksum: 0x99FB0AAC
	Offset: 0x42C0
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function qrdrone_exit_button_pressed()
{
	return self usebuttonpressed();
}

/*
	Name: qrdrone_watch_for_exit
	Namespace: qrdrone
	Checksum: 0x27A4472D
	Offset: 0x42E8
	Size: 0x122
	Parameters: 0
	Flags: None
*/
function qrdrone_watch_for_exit()
{
	level endon(#"game_ended");
	self endon(#"death");
	self.owner endon(#"disconnect");
	wait(1);
	while(true)
	{
		timeused = 0;
		while(self.owner qrdrone_exit_button_pressed())
		{
			timeused = timeused + 0.05;
			if(timeused > 0.25)
			{
				self clientfield::set("qrdrone_state", 3);
				watcher = self.owner weaponobjects::getweaponobjectwatcher("qrdrone");
				watcher thread weaponobjects::waitanddetonate(self, 0, self.owner);
				return;
			}
			waitframe(1);
		}
		waitframe(1);
	}
}

/*
	Name: qrdrone_cleanup
	Namespace: qrdrone
	Checksum: 0xFA723886
	Offset: 0x4418
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function qrdrone_cleanup()
{
	if(level.gameended)
	{
		return;
	}
	if(isdefined(self.owner))
	{
		if(self.playerlinked == 1)
		{
			self.owner qrdrone_unlink(self);
		}
		self.owner qrdrone_endride(self);
	}
	if(isdefined(self.scrambler))
	{
		self.scrambler delete();
	}
	if(isdefined(self) && isdefined(self.centerref))
	{
		self.centerref delete();
	}
	if(isdefined(self.damage_fx_ent))
	{
		self.damage_fx_ent delete();
	}
	if(isdefined(self.emp_fx))
	{
		self.emp_fx delete();
	}
	self delete();
}

/*
	Name: qrdrone_dialog
	Namespace: qrdrone
	Checksum: 0xB2A295A7
	Offset: 0x4548
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function qrdrone_dialog(dialoggroup)
{
	if(dialoggroup == "tag")
	{
		waittime = 1000;
	}
	else
	{
		waittime = 5000;
	}
	if(gettime() - level.qrdrone_lastdialogtime < waittime)
	{
		return;
	}
	level.qrdrone_lastdialogtime = gettime();
	randomindex = randomint(level.qrdrone_dialog[dialoggroup].size);
	soundalias = level.qrdrone_dialog[dialoggroup][randomindex];
	self playlocalsound(soundalias);
}

/*
	Name: qrdrone_watchheliproximity
	Namespace: qrdrone
	Checksum: 0xE5560EC7
	Offset: 0x4610
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function qrdrone_watchheliproximity()
{
	level endon(#"game_ended");
	self endon(#"death", #"end_remote");
	while(true)
	{
		inheliproximity = 0;
		if(!self.inheliproximity && inheliproximity)
		{
			self.inheliproximity = 1;
		}
		else if(self.inheliproximity && !inheliproximity)
		{
			self.inheliproximity = 0;
			self.heliinproximity = undefined;
		}
		waitframe(1);
	}
}

/*
	Name: qrdrone_detonatewaiter
	Namespace: qrdrone
	Checksum: 0x5ED7D9D
	Offset: 0x46D0
	Size: 0x184
	Parameters: 0
	Flags: None
*/
function qrdrone_detonatewaiter()
{
	self.owner endon(#"disconnect");
	self endon(#"death");
	while(self.owner attackbuttonpressed())
	{
		waitframe(1);
	}
	watcher = self.owner weaponobjects::getweaponobjectwatcher("qrdrone");
	while(!self.owner attackbuttonpressed())
	{
		waitframe(1);
	}
	self clientfield::set("qrdrone_state", 3);
	watcher thread weaponobjects::waitanddetonate(self, 0);
	self.owner thread hud::fade_to_black_for_x_sec(getdvarfloat(#"scr_rcbomb_fadeout_delay", 0), getdvarfloat(#"scr_rcbomb_fadeout_timein", 0), getdvarfloat(#"scr_rcbomb_fadeout_timeblack", 0), getdvarfloat(#"scr_rcbomb_fadeout_timeout", 0));
}

/*
	Name: qrdrone_fireguns
	Namespace: qrdrone
	Checksum: 0x46F46EA8
	Offset: 0x4860
	Size: 0x10E
	Parameters: 1
	Flags: None
*/
function qrdrone_fireguns(qrdrone)
{
	self endon(#"disconnect");
	qrdrone endon(#"death", #"blowup", #"crashing");
	level endon(#"game_ended");
	qrdrone endon(#"end_remote");
	wait(1);
	while(true)
	{
		if(self attackbuttonpressed())
		{
			qrdrone fireweapon();
			weapon = getweapon(#"qrdrone_turret");
			firetime = weapon.firetime;
			wait(firetime);
		}
		else
		{
			waitframe(1);
		}
	}
}

/*
	Name: qrdrone_blowup
	Namespace: qrdrone
	Checksum: 0x8470D6E2
	Offset: 0x4978
	Size: 0x334
	Parameters: 2
	Flags: None
*/
function qrdrone_blowup(attacker, weapon)
{
	self.owner endon(#"disconnect");
	self endon(#"death");
	self notify(#"blowup");
	explosionorigin = self.origin;
	explosionangles = self.angles;
	if(!isdefined(weapon))
	{
		weapon = self.owner;
	}
	origin = self.origin + vectorscale((0, 0, 1), 10);
	radius = 256;
	min_damage = 10;
	max_damage = 35;
	if(isdefined(weapon))
	{
		self radiusdamage(origin, radius, max_damage, min_damage, weapon, "MOD_EXPLOSIVE", self.weapon);
	}
	physicsexplosionsphere(origin, radius, radius, 1, max_damage, min_damage);
	function_2f95a020(origin);
	playsoundatposition(#"veh_qrdrone_explo", self.origin);
	self hide();
	if(isdefined(self.owner))
	{
		self.owner util::clientnotify("qrdrone_blowup");
		if(weapon != self.owner)
		{
			level.globalkillstreaksdestroyed++;
			weapon stats::function_e24eec31(self.weapon, #"destroyed", 1);
		}
		self.owner remote_weapons::destroyremotehud();
		self.owner val::set(#"qrdrone_blowup", "freezecontrols");
		self.owner sendkillstreakdamageevent(600);
		wait(0.75);
		self.owner thread hud::fade_to_black_for_x_sec(0, 0.25, 0.1, 0.25);
		wait(0.25);
		self.owner qrdrone_unlink(self);
		self.owner val::reset(#"qrdrone_blowup", "freezecontrols");
		if(isdefined(self.neverdelete) && self.neverdelete)
		{
			return;
		}
	}
	qrdrone_cleanup();
}

/*
	Name: function_2f95a020
	Namespace: qrdrone
	Checksum: 0x73FFBA63
	Offset: 0x4CB8
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_2f95a020(position)
{
	playrumbleonposition("grenade_rumble", position);
	earthquake(0.5, 0.5, self.origin, 512);
}

/*
	Name: setvisionsetwaiter
	Namespace: qrdrone
	Checksum: 0xA5E07E20
	Offset: 0x4D18
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function setvisionsetwaiter()
{
	self endon(#"disconnect");
	self useservervisionset(1);
	self setvisionsetforplayer(level.qrdrone_vision, 1);
	self.qrdrone waittill(#"end_remote");
	self useservervisionset(0);
}

/*
	Name: destroyhud
	Namespace: qrdrone
	Checksum: 0x3570D0C3
	Offset: 0x4DA8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function destroyhud()
{
	if(isdefined(self))
	{
		self notify(#"stop_signal_failure");
		self.flashingsignalfailure = 0;
		self clientfield::set_to_player("static_postfx", 0);
		self remote_weapons::destroyremotehud();
		self util::clientnotify("nofutz");
	}
}

/*
	Name: set_static_alpha
	Namespace: qrdrone
	Checksum: 0xD94D29AF
	Offset: 0x4E38
	Size: 0xF4
	Parameters: 2
	Flags: None
*/
function set_static_alpha(alpha, drone)
{
	if(alpha > 0)
	{
		if(!isdefined(self.flashingsignalfailure) || !self.flashingsignalfailure)
		{
			self thread flash_signal_failure(drone);
			self.flashingsignalfailure = 1;
			if(self isremotecontrolling())
			{
				self clientfield::set_to_player("static_postfx", 1);
			}
		}
	}
	else
	{
		self notify(#"stop_signal_failure");
		drone clientfield::set("qrdrone_out_of_range", 0);
		self.flashingsignalfailure = 0;
		self clientfield::set_to_player("static_postfx", 0);
	}
}

/*
	Name: flash_signal_failure
	Namespace: qrdrone
	Checksum: 0xEB876B66
	Offset: 0x4F38
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function flash_signal_failure(drone)
{
	self endon(#"stop_signal_failure");
	drone endon(#"death");
	drone clientfield::set("qrdrone_out_of_range", 1);
	i = 0;
	for(;;)
	{
		drone playsoundtoplayer(#"uin_alert_lockon", self);
		if(i < 5)
		{
			wait(0.6);
		}
		else
		{
			if(i < 6)
			{
				wait(0.5);
			}
			else
			{
				wait(0.3);
			}
		}
		i++;
	}
}

