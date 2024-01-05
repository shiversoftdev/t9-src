#using scripts\mp_common\util.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\helicopter_shared.gsc;
#using scripts\killstreaks\killstreak_hacking.gsc;
#using script_4721de209091b1a6;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace recon_plane;

/*
	Name: __init__system__
	Namespace: recon_plane
	Checksum: 0xC626EF28
	Offset: 0x268
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"recon_plane", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: recon_plane
	Checksum: 0x4EA0DD9F
	Offset: 0x2B8
	Size: 0x33C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(level.teambased)
	{
		foreach(team, _ in level.teams)
		{
			level.var_eb10c6a7[team] = 0;
		}
	}
	else
	{
		level.var_eb10c6a7 = [];
	}
	level.var_42ce45d5 = [];
	level.var_efb43e1 = &function_4dc67281;
	bundlename = "killstreak_recon_plane";
	if(sessionmodeiswarzonegame())
	{
		bundlename = bundlename + "_wz";
	}
	if(tweakables::gettweakablevalue("killstreak", "allowradardirection"))
	{
		killstreaks::register_killstreak(bundlename, &function_732dcb56);
	}
	callback::on_connect(&onplayerconnect);
	callback::on_spawned(&onplayerspawned);
	var_251f8a28 = getweapon("recon_plane");
	globallogic_score::function_c1e9b86b(var_251f8a28, &function_c131324d);
	globallogic_score::function_5a241bd8(var_251f8a28, &function_ed29480b);
	globallogic_score::function_78aac1c6(var_251f8a28, #"hash_15da16b6b9032af");
	globallogic_score::function_31bde79e(var_251f8a28, #"hash_d9fe863a1e9e4d8");
	globallogic_score::function_b498acdc(var_251f8a28, #"kill_detected_stunned_blinded");
	globallogic_score::function_affa83aa(var_251f8a28, #"hash_4808274db2565c0d");
	callback::add_callback(#"hash_7c6da2f2c9ef947a", &fx_flesh_hit_neck_fatal);
	clientfield::register("scriptmover", "recon_plane", 1, 1, "int");
	clientfield::register("scriptmover", "recon_plane_reveal", 1, 1, "int");
	clientfield::register("scriptmover", "recon_plane_damage_fx", 1, 2, "int");
	level thread function_bde85071();
}

/*
	Name: onplayerconnect
	Namespace: recon_plane
	Checksum: 0x74A9D831
	Offset: 0x600
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function onplayerconnect()
{
	self.entnum = self getentitynumber();
	if(!level.teambased)
	{
		level.var_eb10c6a7[self.entnum] = 0;
	}
	level.var_42ce45d5[self.entnum] = 0;
}

/*
	Name: onplayerspawned
	Namespace: recon_plane
	Checksum: 0x586C4225
	Offset: 0x660
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function onplayerspawned(local_client_num)
{
	if(!level.teambased)
	{
		function_65f48f1a(self);
	}
}

/*
	Name: function_769ed4e8
	Namespace: recon_plane
	Checksum: 0x8D7ACDA8
	Offset: 0x698
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function function_769ed4e8(ent)
{
	if(!(isdefined(ent.origin) && isdefined(self.var_23cd2a2f.origin)))
	{
		return 0;
	}
	bundle = killstreaks::get_script_bundle("recon_plane");
	var_b2231ba3 = sqr((isdefined(bundle.var_e77ca4a1) ? bundle.var_e77ca4a1 : 0) / 2);
	return distance2dsquared(ent.origin, self.var_23cd2a2f.origin) <= var_b2231ba3;
}

/*
	Name: function_e7ed088a
	Namespace: recon_plane
	Checksum: 0xD67B7C1C
	Offset: 0x768
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function function_e7ed088a()
{
	return isdefined(level.var_42ce45d5[self.entnum]) && level.var_42ce45d5[self.entnum] > 0;
}

/*
	Name: function_ed29480b
	Namespace: recon_plane
	Checksum: 0x6A52A0D0
	Offset: 0x7A8
	Size: 0x164
	Parameters: 5
	Flags: None
*/
function function_ed29480b(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	if(attackerweapon util::isenemyplayer(meansofdeath) && attackerweapon function_e7ed088a() && (!isdefined(level.var_3d960463) || (isdefined(level.var_3d960463) && !attackerweapon [[level.var_3d960463]]())))
	{
		arrayremovevalue(level.var_d952ba86, undefined);
		foreach(var_257b2daf in level.var_d952ba86)
		{
			if(attackerweapon === var_257b2daf.owner && var_257b2daf function_769ed4e8(meansofdeath))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_4dc67281
	Namespace: recon_plane
	Checksum: 0xADB6F896
	Offset: 0x918
	Size: 0xDA
	Parameters: 0
	Flags: None
*/
function function_4dc67281()
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
		if(isdefined(level.var_eb10c6a7[team]) && level.var_eb10c6a7[team] > 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_c131324d
	Namespace: recon_plane
	Checksum: 0xC05850AE
	Offset: 0xA00
	Size: 0x4C
	Parameters: 5
	Flags: None
*/
function function_c131324d(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	meansofdeath contracts::increment_contract(#"hash_3ff1fe889b516cc3");
}

/*
	Name: fx_flesh_hit_neck_fatal
	Namespace: recon_plane
	Checksum: 0x1297BBC
	Offset: 0xA58
	Size: 0x224
	Parameters: 1
	Flags: None
*/
function fx_flesh_hit_neck_fatal(params)
{
	if(!isdefined(level.var_3d960463) || (isdefined(level.var_3d960463) && !params.attacker [[level.var_3d960463]]()))
	{
		foreach(player in params.players)
		{
			if(player function_e7ed088a())
			{
				arrayremovevalue(level.var_d952ba86, undefined);
				foreach(var_257b2daf in level.var_d952ba86)
				{
					if(player === var_257b2daf.owner && var_257b2daf function_769ed4e8(self))
					{
						scoregiven = scoreevents::processscoreevent(#"hash_2bca2bdbbd783d4e", player, undefined, undefined);
						if(isdefined(scoregiven))
						{
							player stats::function_8fb23f94("recon_plane", #"assists", 1);
							player stats::function_b04e7184("recon_plane", #"hash_54b8c7eda311cba4");
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_732dcb56
	Namespace: recon_plane
	Checksum: 0xC73B138A
	Offset: 0xC88
	Size: 0x720
	Parameters: 1
	Flags: None
*/
function function_732dcb56(killstreaktype)
{
	if(self killstreakrules::iskillstreakallowed("recon_plane", self.team) == 0)
	{
		return false;
	}
	killstreak_id = self killstreakrules::killstreakstart("recon_plane", self.team);
	if(killstreak_id == -1)
	{
		return false;
	}
	bundle = killstreaks::get_script_bundle("recon_plane");
	adjustedpath = function_98e60435(self.origin, bundle);
	startposition = adjustedpath[#"startposition"];
	endposition = adjustedpath[#"endposition"];
	angles = adjustedpath[#"angles"];
	recon_plane = spawn("script_model", startposition);
	if(!isdefined(level.var_d952ba86))
	{
		level.var_d952ba86 = [];
	}
	else if(!isarray(level.var_d952ba86))
	{
		level.var_d952ba86 = array(level.var_d952ba86);
	}
	level.var_d952ba86[level.var_d952ba86.size] = recon_plane;
	var_e4467d10 = spawn("script_model", self.origin);
	var_e4467d10 setmodel(#"tag_origin");
	var_e4467d10 setteam(self.team);
	var_e4467d10 clientfield::set("recon_plane_reveal", 1);
	recon_plane.var_23cd2a2f = var_e4467d10;
	weapon = getweapon("recon_plane");
	recon_plane setmodel(bundle.var_c6eab8b5);
	recon_plane setenemymodel(bundle.var_aa0b97e1);
	recon_plane setforcenocull();
	recon_plane.killstreak_id = killstreak_id;
	recon_plane.owner = self;
	recon_plane.ownerentnum = self getentitynumber();
	recon_plane.team = self.team;
	recon_plane setteam(self.team);
	recon_plane setowner(self);
	recon_plane killstreaks::configure_team(killstreaktype, killstreak_id, self, undefined, undefined, &configureteampost);
	recon_plane killstreak_hacking::enable_hacking("recon_plane", &hackedprefunction, undefined);
	recon_plane.targetname = "recon_plane";
	recon_plane.leaving = 0;
	recon_plane util::make_sentient();
	recon_plane.var_c31213a5 = 1;
	recon_plane thread killstreaks::function_2b6aa9e8("recon_plane", &function_e55922df, &onlowhealth);
	recon_plane thread function_f724cfe4(100000);
	recon_plane thread killstreaks::waittillemp(&function_b16d07ad);
	recon_plane.killstreakdamagemodifier = &killstreakdamagemodifier;
	if(isdefined(bundle.var_6dfc61a2) && bundle.var_6dfc61a2 > 0)
	{
		recon_plane.extra_low_health = bundle.var_6dfc61a2;
		recon_plane.extra_low_health_callback = &onextralowhealth;
	}
	recon_plane.numflares = 1;
	recon_plane helicopter::create_flare_ent(vectorscale((0, 0, -1), 25));
	recon_plane.rocketdamage = (recon_plane.maxhealth / 3) + 1;
	recon_plane moveto(endposition, 40000 * 0.002);
	recon_plane.angles = angles;
	target_set(recon_plane);
	recon_plane clientfield::set("enemyvehicle", 1);
	recon_plane clientfield::set("recon_plane", 1);
	recon_plane killstreaks::function_a781e8d2();
	recon_plane thread killstreaks::waitfortimeout("recon_plane", 40000, &ontimeout, "death", "crashing");
	recon_plane thread killstreaks::waitfortimecheck(40000 / 2, &ontimecheck, "death", "crashing");
	recon_plane thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(bundle, "death", undefined, 1);
	self namespace_f9b02f80::play_killstreak_start_dialog("recon_plane", self.team, killstreak_id);
	recon_plane namespace_f9b02f80::play_pilot_dialog_on_owner("arrive", "recon_plane", killstreak_id);
	recon_plane thread killstreaks::player_killstreak_threat_tracking("recon_plane", 0.9848077);
	self stats::function_e24eec31(getweapon("recon_plane"), #"used", 1);
	recon_plane thread killstreaks::function_5a7ecb6b();
	return true;
}

/*
	Name: function_98e60435
	Namespace: recon_plane
	Checksum: 0x2F8EEE56
	Offset: 0x13B0
	Size: 0x56C
	Parameters: 2
	Flags: None
*/
function function_98e60435(var_d44b8c3e, bundle)
{
	travelangle = randomfloatrange((isdefined(level.var_84f1b20f) ? level.var_84f1b20f : 90), (isdefined(level.var_26837e34) ? level.var_26837e34 : 180));
	startangles = (0, travelangle, 0);
	startforward = anglestoforward(startangles);
	if(sessionmodeiswarzonegame())
	{
		travelradius = 25000;
		zoffset = var_d44b8c3e[2] + 9500;
	}
	else
	{
		travelradius = airsupport::getmaxmapwidth() * 1.5;
		zoffset = killstreaks::function_43f4782d() + 9500;
	}
	if(sessionmodeiswarzonegame())
	{
		var_51cabd75 = 180 / 30;
		var_ddd8ddab = (travelradius * 2) / (3 - 1);
		var_c8e01926 = undefined;
		var_37db735d = [];
		var_51c6fb78 = 0;
		forward = startforward;
		angles = startangles;
		while(var_51c6fb78 < var_51cabd75)
		{
			var_59a518e1 = [];
			for(i = 0; i < 3; i++)
			{
				position = var_d44b8c3e + (vectorscale(forward, -1 * travelradius + (var_ddd8ddab * i)));
				if(i == 0)
				{
					var_90aa61b = position;
				}
				var_b0490eb9 = getheliheightlockheight(position);
				if(var_b0490eb9 != position[2])
				{
					var_59a518e1[var_59a518e1.size] = var_b0490eb9;
				}
			}
			if(var_59a518e1.size)
			{
				var_59a518e1 = array::sort_by_value(var_59a518e1, 1);
				maxheight = var_59a518e1[var_59a518e1.size - 1];
				var_35637e22 = maxheight - var_59a518e1[0];
				trace = groundtrace((var_d44b8c3e[0], var_d44b8c3e[1], maxheight), var_d44b8c3e - vectorscale((0, 0, 1), 5000), 0, undefined);
				groundheight = trace[#"position"][2];
				var_6b1fb8d9 = groundheight + ((maxheight - groundheight) * bundle.var_ff73e08c);
				endposition = var_90aa61b + (vectorscale(forward, travelradius * 2));
				if(var_35637e22 < 2000)
				{
					adjustedpath[#"startposition"] = (var_90aa61b[0], var_90aa61b[1], var_6b1fb8d9);
					adjustedpath[#"endposition"] = (endposition[0], endposition[1], var_6b1fb8d9);
					adjustedpath[#"angles"] = angles;
					return adjustedpath;
				}
				if(!isdefined(var_c8e01926) || var_35637e22 < var_c8e01926)
				{
					var_c8e01926 = var_35637e22;
					var_af2fe365[#"startposition"] = (var_90aa61b[0], var_90aa61b[1], var_6b1fb8d9);
					var_af2fe365[#"endposition"] = (endposition[0], endposition[1], var_6b1fb8d9);
					var_af2fe365[#"angles"] = angles;
				}
			}
			angles = angles + vectorscale((0, 1, 0), 30);
			forward = anglestoforward(angles);
			var_51c6fb78++;
			waitframe(1);
		}
		if(isdefined(var_af2fe365))
		{
			return var_af2fe365;
		}
	}
	adjustedpath[#"startposition"] = (var_d44b8c3e + (vectorscale(startforward, -1 * travelradius))) + (0, 0, zoffset);
	adjustedpath[#"endposition"] = (var_d44b8c3e + vectorscale(startforward, travelradius)) + (0, 0, zoffset);
	adjustedpath[#"angles"] = startangles;
	return adjustedpath;
}

/*
	Name: function_f724cfe4
	Namespace: recon_plane
	Checksum: 0xE4A47071
	Offset: 0x1928
	Size: 0x1E
	Parameters: 1
	Flags: None
*/
function function_f724cfe4(health)
{
	waitframe(1);
	self.health = health;
}

/*
	Name: hackedprefunction
	Namespace: recon_plane
	Checksum: 0xBC59A65F
	Offset: 0x1950
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function hackedprefunction(hacker)
{
	recon_plane = self;
	recon_plane function_cf33d294();
}

/*
	Name: configureteampost
	Namespace: recon_plane
	Checksum: 0x2E285FF5
	Offset: 0x1988
	Size: 0xB4
	Parameters: 2
	Flags: None
*/
function configureteampost(owner, ishacked)
{
	recon_plane = self;
	recon_plane thread teams::waituntilteamchangesingleton(ishacked, "ReconPlane_watch_team_change_" + recon_plane getentitynumber(), &onteamchange, self.entnum, "delete", "death", "leaving");
	recon_plane setvisibletoall();
	recon_plane function_e6689aef();
}

/*
	Name: onlowhealth
	Namespace: recon_plane
	Checksum: 0x6E56CBA0
	Offset: 0x1A48
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function onlowhealth(attacker, weapon)
{
	bundle = killstreaks::get_script_bundle("recon_plane");
	if(isdefined(bundle.fxlowhealth))
	{
		self clientfield::set("recon_plane_damage_fx", 1);
	}
}

/*
	Name: onextralowhealth
	Namespace: recon_plane
	Checksum: 0x82211EFA
	Offset: 0x1AB8
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function onextralowhealth(attacker, weapon)
{
	bundle = killstreaks::get_script_bundle("recon_plane");
	if(isdefined(bundle.var_277154f7))
	{
		self clientfield::set("recon_plane_damage_fx", 2);
	}
}

/*
	Name: onteamchange
	Namespace: recon_plane
	Checksum: 0xFA15CF69
	Offset: 0x1B28
	Size: 0x24
	Parameters: 2
	Flags: None
*/
function onteamchange(entnum, event)
{
	function_e55922df();
}

/*
	Name: ontimeout
	Namespace: recon_plane
	Checksum: 0x1A0E353C
	Offset: 0x1B58
	Size: 0x18C
	Parameters: 0
	Flags: None
*/
function ontimeout()
{
	self namespace_f9b02f80::function_d2219b7d("recon_plane");
	self.leaving = 1;
	self function_171f5ed8();
	self clientfield::set("recon_plane", 0);
	airsupport::leave(10);
	/#
		assert(10 > 3);
	#/
	self util::delay(10 - 3, undefined, &killstreaks::function_3696d106);
	wait(10 - 1);
	self killstreaks::function_90e951f2();
	waitframe(1);
	if(isdefined(self))
	{
		if(isdefined(self.var_23cd2a2f))
		{
			self.var_23cd2a2f clientfield::set("recon_plane_reveal", 0);
			self.var_23cd2a2f delete();
		}
		wait(1);
		if(isdefined(self))
		{
			arrayremovevalue(level.var_d952ba86, self);
			self delete();
		}
	}
}

/*
	Name: ontimecheck
	Namespace: recon_plane
	Checksum: 0x554AC70C
	Offset: 0x1CF0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function ontimecheck()
{
	self namespace_f9b02f80::play_pilot_dialog_on_owner("timecheck", "recon_plane", self.killstreak_id);
}

/*
	Name: function_b16d07ad
	Namespace: recon_plane
	Checksum: 0xD3BED6A4
	Offset: 0x1D30
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function function_b16d07ad(attacker, arg)
{
	function_e55922df(arg, getweapon(#"emp"));
}

/*
	Name: function_e55922df
	Namespace: recon_plane
	Checksum: 0x578B6D88
	Offset: 0x1D80
	Size: 0x2E6
	Parameters: 2
	Flags: None
*/
function function_e55922df(attacker, weapon)
{
	attacker = self [[level.figure_out_attacker]](attacker);
	if(isdefined(attacker) && (!isdefined(self.owner) || self.owner util::isenemyplayer(attacker)))
	{
		attacker battlechatter::function_eebf94f6("recon_plane");
		challenges::destroyedaircraft(attacker, weapon, 0, self);
		self killstreaks::function_73566ec7(attacker, weapon, self.owner);
		attacker challenges::addflyswatterstat(weapon, self);
		luinotifyevent(#"player_callout", 2, #"hash_18fd62979f21a7de", attacker.entnum);
	}
	if(self.leaving !== 1)
	{
		self namespace_f9b02f80::play_destroyed_dialog_on_owner("recon_plane", self.killstreak_id);
		if(isdefined(attacker))
		{
			attacker notify(#"destroyedaircraft");
		}
	}
	self notify(#"crashing");
	params = killstreaks::get_script_bundle("recon_plane");
	if(isdefined(params.ksexplosionfx))
	{
		playfxontag(params.ksexplosionfx, self, "tag_origin");
	}
	self killstreaks::function_7d265bd3();
	self killstreaks::function_90e951f2();
	if(target_istarget(self))
	{
		target_remove(self);
	}
	if(!self.leaving)
	{
		self function_171f5ed8();
	}
	self clientfield::set("recon_plane", 0);
	if(isdefined(self.var_23cd2a2f))
	{
		self.var_23cd2a2f clientfield::set("recon_plane_reveal", 0);
		self.var_23cd2a2f delete();
	}
	arrayremovevalue(level.var_d952ba86, self);
	self deletedelay();
}

/*
	Name: function_e6689aef
	Namespace: recon_plane
	Checksum: 0x443EDA63
	Offset: 0x2070
	Size: 0x68
	Parameters: 0
	Flags: None
*/
function function_e6689aef()
{
	if(level.teambased)
	{
		level.var_eb10c6a7[self.team]++;
	}
	else
	{
		level.var_eb10c6a7[self.ownerentnum]++;
	}
	level.var_42ce45d5[self.ownerentnum]++;
	level notify(#"hash_25b529a667fde073");
}

/*
	Name: function_171f5ed8
	Namespace: recon_plane
	Checksum: 0x4452E123
	Offset: 0x20E0
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_171f5ed8()
{
	self function_cf33d294();
	killstreakrules::killstreakstop(self.killstreaktype, self.originalteam, self.killstreak_id);
}

/*
	Name: function_cf33d294
	Namespace: recon_plane
	Checksum: 0x460E90C9
	Offset: 0x2130
	Size: 0x168
	Parameters: 0
	Flags: None
*/
function function_cf33d294()
{
	if(level.teambased)
	{
		level.var_eb10c6a7[self.team]--;
		/#
			assert(level.var_eb10c6a7[self.team] >= 0);
		#/
		if(level.var_eb10c6a7[self.team] < 0)
		{
			level.var_eb10c6a7[self.team] = 0;
		}
	}
	else if(isdefined(self.ownerentnum))
	{
		level.var_eb10c6a7[self.ownerentnum]--;
		/#
			assert(level.var_eb10c6a7[self.ownerentnum] >= 0);
		#/
		if(level.var_eb10c6a7[self.ownerentnum] < 0)
		{
			level.var_eb10c6a7[self.ownerentnum] = 0;
		}
	}
	/#
		assert(isdefined(self.ownerentnum));
	#/
	level.var_42ce45d5[self.ownerentnum]--;
	/#
		assert(level.var_42ce45d5[self.ownerentnum] >= 0);
	#/
	level notify(#"hash_25b529a667fde073");
}

/*
	Name: function_bde85071
	Namespace: recon_plane
	Checksum: 0x31A2E6A7
	Offset: 0x22A0
	Size: 0x1B0
	Parameters: 0
	Flags: None
*/
function function_bde85071()
{
	level endon(#"game_ended");
	while(true)
	{
		level waittill(#"hash_25b529a667fde073");
		if(level.teambased)
		{
			foreach(team, _ in level.teams)
			{
				var_eb10c6a7 = level.var_eb10c6a7[team];
				var_a06a125 = var_eb10c6a7 + (isdefined(level.activeuavs[team]) ? level.activeuavs[team] : 0);
				function_e72ac8f4(team, var_eb10c6a7 > 0);
				util::set_team_radar(team, var_a06a125 > 0);
			}
		}
		else
		{
			for(i = 0; i < level.players.size; i++)
			{
				function_65f48f1a(level.players[i]);
			}
		}
	}
}

/*
	Name: function_65f48f1a
	Namespace: recon_plane
	Checksum: 0x33C285B8
	Offset: 0x2458
	Size: 0xE6
	Parameters: 1
	Flags: None
*/
function function_65f48f1a(player)
{
	if(!isdefined(player.entnum))
	{
		player.entnum = player getentitynumber();
	}
	var_eb10c6a7 = level.var_eb10c6a7[player.entnum];
	var_a06a125 = var_eb10c6a7 + (isdefined(level.activeuavs[player.team]) ? level.activeuavs[player.team] : 0);
	player setclientuivisibilityflag("radar_client", var_a06a125 > 0);
	player.var_83266838 = var_eb10c6a7 > 0;
}

/*
	Name: killstreakdamagemodifier
	Namespace: recon_plane
	Checksum: 0xD52814DC
	Offset: 0x2548
	Size: 0x7C
	Parameters: 12
	Flags: None
*/
function killstreakdamagemodifier(damage, attacker, direction, point, smeansofdeath, tagname, modelname, partname, weapon, flags, inflictor, chargelevel)
{
	if(chargelevel == "MOD_PROJECTILE_SPLASH")
	{
		return 0;
	}
	return inflictor;
}

