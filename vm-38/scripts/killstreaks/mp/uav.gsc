#using scripts\mp_common\util.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreak_hacking.gsc;
#using script_4721de209091b1a6;
#using scripts\killstreaks\killstreak_detect.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace uav;

/*
	Name: function_24b9244a
	Namespace: uav
	Checksum: 0x87BC0880
	Offset: 0x258
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_24b9244a()
{
	level notify(2129849461);
}

/*
	Name: __init__system__
	Namespace: uav
	Checksum: 0x5A752267
	Offset: 0x278
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"uav", &function_70a657d8, undefined, &function_1c601b99, #"killstreaks");
}

/*
	Name: function_6fe2ffad
	Namespace: uav
	Checksum: 0xBED76C8F
	Offset: 0x2D8
	Size: 0x2A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6fe2ffad()
{
	if(sessionmodeiswarzonegame())
	{
		return "killstreak_uav_wz";
	}
	return "killstreak_uav";
}

/*
	Name: function_70a657d8
	Namespace: uav
	Checksum: 0x3B73ED16
	Offset: 0x310
	Size: 0x234
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.activeuavs = [];
	level.activeplayeruavs = [];
	level.spawneduavs = [];
	level.var_baadd01f = &function_1b3ab65e;
	if(tweakables::gettweakablevalue("killstreak", "allowradar"))
	{
		killstreaks::register_killstreak(function_6fe2ffad(), &activateuav);
	}
	level thread uavtracker();
	callback::on_connect(&onplayerconnect);
	callback::on_spawned(&onplayerspawned);
	callback::on_joined_team(&onplayerjoinedteam);
	callback::add_callback(#"hash_7c6da2f2c9ef947a", &fx_flesh_hit_neck_fatal);
	var_742e7b3d = getweapon("uav");
	globallogic_score::function_5a241bd8(var_742e7b3d, &function_9ee62e18);
	globallogic_score::function_c1e9b86b(var_742e7b3d, &function_2472a08e);
	setmatchflag("radar_allies", 0);
	setmatchflag("radar_axis", 0);
	airsupport::init_shared();
	clientfield::register("scriptmover", "uav", 1, 1, "int");
	clientfield::register("scriptmover", "uav_fx", 1, 1, "int");
}

/*
	Name: function_1c601b99
	Namespace: uav
	Checksum: 0x914E6A35
	Offset: 0x550
	Size: 0xA6
	Parameters: 0
	Flags: Linked
*/
function function_1c601b99()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon(#"uav"), &function_bff5c062);
	}
	if(0)
	{
		level.var_b59e7114 = killstreaks::function_f3875fb0(level.var_49dafe2a, (isdefined(level.var_eb2556e1) ? level.var_eb2556e1 : 5000), 60, -1, 1);
	}
}

/*
	Name: onplayerconnect
	Namespace: uav
	Checksum: 0x1E592115
	Offset: 0x600
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
	Name: function_bff5c062
	Namespace: uav
	Checksum: 0x21691AC8
	Offset: 0x638
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(uav, attackingplayer)
{
	uav hackedprefunction(attackingplayer);
	uav.owner = attackingplayer;
	uav killstreaks::configure_team_internal(attackingplayer, 1);
	if(isdefined(level.var_f1edf93f))
	{
		uav notify(#"hacked");
		uav notify(#"cancel_timeout");
		var_eb79e7c3 = int([[level.var_f1edf93f]]() * 1000);
		uav thread killstreaks::waitfortimeout("uav", var_eb79e7c3, &ontimeout, "delete", "death", "crashing");
	}
}

/*
	Name: function_ef80ceac
	Namespace: uav
	Checksum: 0xD491F29
	Offset: 0x750
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_ef80ceac()
{
	if(isdefined(level.activeplayeruavs[self.entnum]))
	{
		var_86510a2 = level.activeplayeruavs[self.entnum];
		if(level.forceradar == 1)
		{
			var_86510a2--;
		}
		return var_86510a2 > 0;
	}
	return 0;
}

/*
	Name: function_1b3ab65e
	Namespace: uav
	Checksum: 0xE8BD07A4
	Offset: 0x7B8
	Size: 0xB2
	Parameters: 0
	Flags: Linked
*/
function function_1b3ab65e()
{
	foreach(uav in level.spawneduavs)
	{
		if(uav.team === self.team)
		{
			continue;
		}
		if(uav function_457c378e(self))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: fx_flesh_hit_neck_fatal
	Namespace: uav
	Checksum: 0x183700A0
	Offset: 0x878
	Size: 0x25C
	Parameters: 1
	Flags: Linked
*/
function fx_flesh_hit_neck_fatal(params)
{
	if(!isdefined(level.var_3d960463) || (isdefined(level.var_3d960463) && !params.attacker [[level.var_3d960463]]()))
	{
		foreach(player in params.players)
		{
			if(player function_ef80ceac())
			{
				foreach(var_ee444909 in level.spawneduavs)
				{
					if(player === var_ee444909.owner && var_ee444909 function_457c378e(self))
					{
						scoregiven = scoreevents::processscoreevent(#"uav_assist", player, undefined, undefined);
						if(isdefined(scoregiven))
						{
							player challenges::earneduavassistscore(scoregiven);
							player stats::function_8fb23f94("uav", #"assists", 1);
							player stats::function_b04e7184("uav", #"hash_54b8c7eda311cba4");
							killstreakindex = level.killstreakindices[#"uav"];
							killstreaks::killstreak_assist(player, self, killstreakindex);
						}
					}
				}
			}
		}
	}
}

/*
	Name: hackedprefunction
	Namespace: uav
	Checksum: 0x74FD72FB
	Offset: 0xAE0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function hackedprefunction(hacker)
{
	uav = self;
	uav resetactiveuav();
}

/*
	Name: configureteampost
	Namespace: uav
	Checksum: 0x53FFCF7F
	Offset: 0xB18
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function configureteampost(owner, ishacked)
{
	uav = self;
	uav thread teams::waituntilteamchangesingleton(ishacked, "UAV_watch_team_change_" + uav getentitynumber(), &onteamchange, ishacked.entnum, "delete", "death", "leaving");
	ishacked addactiveuav();
}

/*
	Name: function_f724cfe4
	Namespace: uav
	Checksum: 0x5ED7DEA0
	Offset: 0xBC0
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_f724cfe4(health)
{
	waitframe(1);
	self.health = health;
}

/*
	Name: activateuav
	Namespace: uav
	Checksum: 0x7D633646
	Offset: 0xBE8
	Size: 0x930
	Parameters: 1
	Flags: Linked
*/
function activateuav(killstreaktype)
{
	/#
		assert(isdefined(level.players));
	#/
	if(self killstreakrules::iskillstreakallowed("uav", self.team) == 0)
	{
		return false;
	}
	killstreak_id = self killstreakrules::killstreakstart("uav", self.team);
	if(killstreak_id == -1)
	{
		return false;
	}
	attach_angle = -90;
	minflyheight = killstreaks::function_43f4782d();
	uav = spawn("script_model", self.origin + (0, 0, minflyheight + 1000));
	if(!isdefined(level.spawneduavs))
	{
		level.spawneduavs = [];
	}
	else if(!isarray(level.spawneduavs))
	{
		level.spawneduavs = array(level.spawneduavs);
	}
	level.spawneduavs[level.spawneduavs.size] = uav;
	bundle = killstreaks::get_script_bundle("uav");
	uav setmodel(bundle.var_c6eab8b5);
	uav setenemymodel(bundle.var_aa0b97e1);
	uav.weapon = getweapon("uav");
	uav setweapon(uav.weapon);
	uav function_619a5c20();
	uav setforcenocull();
	uav.targetname = "uav";
	uav util::make_sentient();
	uav killstreaks::configure_team(killstreaktype, killstreak_id, self, undefined, undefined, &configureteampost);
	uav killstreak_hacking::enable_hacking("uav", &hackedprefunction, undefined);
	uav clientfield::set("enemyvehicle", 1);
	killstreak_detect::killstreaktargetset(uav);
	uav setdrawinfrared(1);
	uav.killstreak_id = killstreak_id;
	uav.leaving = 0;
	uav.victimsoundmod = "vehicle";
	uav.var_48d842c3 = 1;
	uav thread killstreaks::function_2b6aa9e8("uav", &destroyuav, &onlowhealth);
	uav thread function_f724cfe4(100000);
	bundle = killstreaks::get_script_bundle("uav");
	uav thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(bundle, "crashing", undefined, 1);
	uav.rocketdamage = uav.maxhealth + 1;
	uav clientfield::set("uav_fx", 1);
	uav clientfield::set("scorestreakActive", 1);
	uav killstreaks::function_a781e8d2();
	if(0)
	{
		uav killstreaks::function_67d553c4(level.var_b59e7114, (isdefined(level.uav_rotation_radius) ? level.uav_rotation_radius : 4000), (isdefined(level.uav_rotation_random_offset) ? level.uav_rotation_random_offset : 1000), -1);
		uav clientfield::set("uav", 1);
	}
	else
	{
		if(sessionmodeiswarzonegame())
		{
			var_b0490eb9 = getheliheightlockheight(self.origin);
			trace = groundtrace((self.origin[0], self.origin[1], var_b0490eb9), self.origin - vectorscale((0, 0, 1), 5000), 0, uav);
			groundheight = trace[#"position"][2];
			var_5f8c899e = groundheight + ((var_b0490eb9 - groundheight) * bundle.var_ff73e08c);
			var_5f8c899e = var_5f8c899e - killstreaks::function_43f4782d();
		}
		else
		{
			var_5f8c899e = 5000;
		}
		uav.var_b59e7114 = killstreaks::function_f3875fb0(self.origin, (isdefined(level.var_eb2556e1) ? level.var_eb2556e1 : var_5f8c899e), 60, -1, 1);
		uav killstreaks::function_67d553c4(uav.var_b59e7114, (isdefined(level.uav_rotation_radius) ? level.uav_rotation_radius : 4000), (isdefined(level.uav_rotation_random_offset) ? level.uav_rotation_random_offset : 1000), -1);
		uav.var_b59e7114 clientfield::set("uav", 1);
		uav.var_b59e7114 setteam(uav.team);
	}
	uav killstreakrules::function_2e6ff61a("uav", killstreak_id, {#team:uav.team, #origin:uav.var_b59e7114.origin});
	self stats::function_e24eec31(getweapon("uav"), #"used", 1);
	uav thread killstreaks::waitfortimeout("uav", 30000, &ontimeout, "delete", "death", "crashing");
	uav thread killstreaks::waitfortimecheck(30000 / 2, &ontimecheck, "delete", "death", "crashing");
	uav thread startuavfx();
	self namespace_f9b02f80::play_killstreak_start_dialog("uav", self.team, killstreak_id);
	uav namespace_f9b02f80::play_pilot_dialog_on_owner("arrive", "uav", killstreak_id);
	uav thread killstreaks::player_killstreak_threat_tracking("uav", 0.9659258);
	uav thread killstreaks::function_5a7ecb6b();
	self stats::function_dad108fa(#"hash_1030d5aac01a491e", 1);
	self stats::function_dad108fa(#"hash_436fffdd733392ba", 1);
	self stats::function_dad108fa(#"hash_437000dd7333946d", 1);
	return true;
}

/*
	Name: onlowhealth
	Namespace: uav
	Checksum: 0x8D339BED
	Offset: 0x1520
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function onlowhealth(attacker, weapon)
{
	self.is_damaged = 1;
	params = killstreaks::get_script_bundle("uav");
	if(isdefined(params.fxlowhealth))
	{
		playfxontag(params.fxlowhealth, self, "tag_origin");
	}
	self killstreaks::function_8b4513ca();
}

/*
	Name: function_457c378e
	Namespace: uav
	Checksum: 0x52DD3D6F
	Offset: 0x15C0
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function function_457c378e(ent)
{
	if(!(isdefined(ent) && isdefined(self)))
	{
		return;
	}
	bundle = killstreaks::get_script_bundle("uav");
	var_b2231ba3 = sqr((isdefined(bundle.var_dd0e1146) ? bundle.var_dd0e1146 : 0) / 2);
	if(1 && isdefined(self.var_b59e7114))
	{
		var_59848c4e = self.var_b59e7114.origin;
	}
	else
	{
		var_59848c4e = self.origin;
	}
	return distance2dsquared(ent.origin, var_59848c4e) <= var_b2231ba3;
}

/*
	Name: onteamchange
	Namespace: uav
	Checksum: 0x11FED9DB
	Offset: 0x16B0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function onteamchange(entnum, event)
{
	destroyuav(undefined, undefined);
}

/*
	Name: destroyuav
	Namespace: uav
	Checksum: 0xC52F0B6B
	Offset: 0x16E8
	Size: 0x36C
	Parameters: 2
	Flags: Linked
*/
function destroyuav(attacker, weapon)
{
	attacker = self [[level.figure_out_attacker]](attacker);
	if(isdefined(attacker) && (!isdefined(self.owner) || self.owner util::isenemyplayer(attacker)))
	{
		attacker battlechatter::function_eebf94f6("uav");
		challenges::destroyedaircraft(attacker, weapon, 0, self);
		luinotifyevent(#"player_callout", 2, #"hash_7f902a0b5852fe90", attacker.entnum);
		attacker challenges::addflyswatterstat(weapon, self);
	}
	if(isdefined(self.var_b59e7114))
	{
		self.var_b59e7114 delete();
	}
	if(!self.leaving)
	{
		self removeactiveuav();
		self namespace_f9b02f80::play_destroyed_dialog_on_owner("uav", self.killstreak_id);
	}
	self notify(#"crashing");
	self playsound(#"exp_veh_large");
	params = killstreaks::get_script_bundle("uav");
	if(isdefined(params.ksexplosionfx))
	{
		playfxontag(params.ksexplosionfx, self, "tag_origin");
	}
	if(isdefined(params.var_bb6c29b4) && isdefined(weapon) && weapon == getweapon(#"shock_rifle"))
	{
		playfxontag(params.var_bb6c29b4, self, "tag_origin");
	}
	self killstreaks::function_7d265bd3();
	self stoploopsound();
	self setmodel(#"tag_origin");
	self setenemymodel(#"tag_origin");
	self killstreaks::function_90e951f2();
	if(target_istarget(self))
	{
		target_remove(self);
	}
	self unlink();
	wait(0.5);
	arrayremovevalue(level.spawneduavs, self);
	if(isdefined(self))
	{
		self notify(#"delete");
		self delete();
	}
}

/*
	Name: onplayerspawned
	Namespace: uav
	Checksum: 0x5E50C15A
	Offset: 0x1A60
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function onplayerspawned()
{
	self endon(#"disconnect");
	if(level.teambased == 0 || level.multiteam == 1 || level.forceradar == 1)
	{
		uavtracker();
	}
}

/*
	Name: function_9ee62e18
	Namespace: uav
	Checksum: 0x4A6405C1
	Offset: 0x1AD0
	Size: 0x144
	Parameters: 5
	Flags: Linked
*/
function function_9ee62e18(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	if(attackerweapon util::isenemyplayer(meansofdeath) && attackerweapon function_ef80ceac() && (!isdefined(level.var_3d960463) || (isdefined(level.var_3d960463) && !attackerweapon [[level.var_3d960463]]())))
	{
		foreach(var_ee444909 in level.spawneduavs)
		{
			if(attackerweapon === var_ee444909.owner && var_ee444909 function_457c378e(meansofdeath))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_781f1bf2
	Namespace: uav
	Checksum: 0x8E393F8D
	Offset: 0x1C20
	Size: 0xDA
	Parameters: 0
	Flags: Linked
*/
function function_781f1bf2()
{
	if(!isdefined(self.team))
	{
		return false;
	}
	friendlyteam = self.team;
	foreach(team in level.teams)
	{
		if(team == friendlyteam)
		{
			continue;
		}
		if(isdefined(level.activeuavs[team]) && level.activeuavs[team] > 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_2472a08e
	Namespace: uav
	Checksum: 0xFF505C2F
	Offset: 0x1D08
	Size: 0x17C
	Parameters: 1
	Flags: Linked
*/
function function_2472a08e(params)
{
	attacker = params.attacker;
	attackerweapon = params.attackerweapon;
	attacker contracts::increment_contract(#"hash_721e237b8a432eb");
	attacker contracts::increment_contract(#"hash_3ff1fe889b516cc3");
	attacker challenges::function_38ad2427(#"hash_4808274db2565c0d", 1);
	attacker stats::function_dad108fa(#"hash_15da16b6b9032af", 1);
	attacker stats::function_dad108fa(#"hash_d9fe863a1e9e4d8", 1);
	attacker stats::function_dad108fa(#"hash_7d6a0749d37a5428", 1);
	attacker stats::function_dad108fa(#"hash_26f3858ac994b858", 1);
	if(isdefined(attackerweapon) && attackerweapon != level.weaponnone)
	{
		attacker stats::function_e24eec31(attackerweapon, #"kill_detected_stunned_blinded", 1);
	}
}

/*
	Name: onplayerjoinedteam
	Namespace: uav
	Checksum: 0x600392B1
	Offset: 0x1E90
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function onplayerjoinedteam(params)
{
	hidealluavstosameteam();
}

/*
	Name: ontimeout
	Namespace: uav
	Checksum: 0xA3DFE0B8
	Offset: 0x1EB8
	Size: 0x23C
	Parameters: 0
	Flags: Linked
*/
function ontimeout()
{
	playafterburnerfx();
	if(is_true(self.is_damaged))
	{
		params = getscriptbundle(function_6fe2ffad());
		if(isdefined(params.var_3d1f54ee))
		{
			playfxontag(params.var_3d1f54ee, self, (isdefined(params.var_a559066f) ? params.var_a559066f : "tag_origin"));
		}
	}
	self namespace_f9b02f80::play_pilot_dialog_on_owner("timeout", "uav");
	self.leaving = 1;
	self clientfield::set("uav_fx", 0);
	if(isdefined(self.var_b59e7114))
	{
		self.var_b59e7114 clientfield::set("uav", 0);
		self.var_b59e7114 delete();
	}
	if(isdefined(level.var_14151f16))
	{
		[[level.var_14151f16]](self, 0);
	}
	self removeactiveuav();
	if(sessionmodeiswarzonegame())
	{
		var_384be02f = 4000;
	}
	airsupport::leave(10, var_384be02f);
	self util::delay(10 - 3, undefined, &killstreaks::function_3696d106);
	wait(10);
	self killstreaks::function_90e951f2();
	waitframe(1);
	arrayremovevalue(level.spawneduavs, self);
	self delete();
}

/*
	Name: ontimecheck
	Namespace: uav
	Checksum: 0x8CE5227A
	Offset: 0x2100
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function ontimecheck()
{
	self namespace_f9b02f80::play_pilot_dialog_on_owner("timecheck", "uav", self.killstreak_id);
}

/*
	Name: startuavfx
	Namespace: uav
	Checksum: 0xF84FDEA6
	Offset: 0x2140
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function startuavfx()
{
	self endon(#"death");
	wait(0.1);
	if(isdefined(self))
	{
		params = getscriptbundle(function_6fe2ffad());
		if(isdefined(params.var_7291f2f7))
		{
			playfxontag(params.var_7291f2f7, self, (isdefined(params.var_907ff222) ? params.var_907ff222 : "tag_origin"));
		}
	}
}

/*
	Name: playafterburnerfx
	Namespace: uav
	Checksum: 0xA3CB9A91
	Offset: 0x21F0
	Size: 0xF0
	Parameters: 0
	Flags: Linked
*/
function playafterburnerfx()
{
	self endon(#"death");
	wait(0.1);
	if(isdefined(self))
	{
		self stoploopsound();
		teams = util::function_668e9d6c(self.team);
		foreach(team in teams)
		{
			self playsoundtoteam(#"veh_kls_uav_afterburner", team);
		}
	}
}

/*
	Name: hasuav
	Namespace: uav
	Checksum: 0x69EB5088
	Offset: 0x22E8
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function hasuav(team)
{
	return isdefined(level.activeuavs[team]) && level.activeuavs[team] > 0;
}

/*
	Name: addactiveuav
	Namespace: uav
	Checksum: 0xBEAB5D39
	Offset: 0x2328
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function addactiveuav()
{
	/#
		assert(isdefined(self.team));
	#/
	if(!isdefined(level.activeuavs[self.team]))
	{
		level.activeuavs[self.team] = 0;
	}
	level.activeuavs[self.team]++;
	if(!isdefined(level.activeplayeruavs[self.entnum]))
	{
		level.activeplayeruavs[self.entnum] = 0;
	}
	level.activeplayeruavs[self.entnum]++;
	uavtracker();
}

/*
	Name: removeactiveuav
	Namespace: uav
	Checksum: 0x76E576A3
	Offset: 0x23E0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function removeactiveuav()
{
	uav = self;
	uav resetactiveuav();
	uav killstreakrules::killstreakstop(uav.killstreaktype, self.originalteam, self.killstreak_id);
}

/*
	Name: resetactiveuav
	Namespace: uav
	Checksum: 0xA91FA041
	Offset: 0x2440
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function resetactiveuav()
{
	if(!isdefined(level.activeuavs[self.team]))
	{
		return;
	}
	level.activeuavs[self.team]--;
	/#
		assert(level.activeuavs[self.team] >= 0);
	#/
	if(level.activeuavs[self.team] <= 0)
	{
		level.activeuavs[self.team] = undefined;
	}
	if(isdefined(self.owner) && isdefined(level.activeplayeruavs[self.ownerentnum]))
	{
		level.activeplayeruavs[self.ownerentnum]--;
		/#
			assert(level.activeplayeruavs[self.ownerentnum] >= 0);
		#/
		if(level.activeplayeruavs[self.ownerentnum] <= 0)
		{
			level.activeplayeruavs[self.ownerentnum] = undefined;
		}
	}
	uavtracker();
}

/*
	Name: uavtracker
	Namespace: uav
	Checksum: 0x62FBA768
	Offset: 0x2568
	Size: 0x2DA
	Parameters: 0
	Flags: Linked
*/
function uavtracker()
{
	if(level.teambased)
	{
		foreach(team, _ in level.teams)
		{
			activeuavs = (isdefined(level.activeuavs[team]) ? level.activeuavs[team] : 0);
			loc_00002668:
			var_376f7f8c = (activeuavs + (isdefined(level.activesatellites[team]) ? level.activesatellites[team] : 0)) + (isdefined(level.var_eb10c6a7[team]) ? level.var_eb10c6a7[team] : 0);
			setteamspyplane(team, int(min(activeuavs, 2)));
			util::set_team_radar(team, var_376f7f8c > 0);
		}
	}
	else
	{
		foreach(player in level.players)
		{
			activeuavs = (isdefined(level.activeuavs[player.team]) ? level.activeuavs[player.team] : 0);
			var_376f7f8c = activeuavs + (isdefined(level.activesatellites[player.team]) ? level.activesatellites[player.team] : 0);
			if(isdefined(player.entnum))
			{
				var_376f7f8c = var_376f7f8c + (isdefined(level.var_eb10c6a7[player.entnum]) ? level.var_eb10c6a7[player.entnum] : 0);
			}
			player setclientuivisibilityflag("radar_client", var_376f7f8c > 0);
			player.hasspyplane = var_376f7f8c > 0;
		}
	}
}

/*
	Name: hidealluavstosameteam
	Namespace: uav
	Checksum: 0x5C6D983
	Offset: 0x2850
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function hidealluavstosameteam()
{
	foreach(uav in level.spawneduavs)
	{
		if(isdefined(uav))
		{
			uav teams::hidetosameteam();
		}
	}
}

