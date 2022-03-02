#using script_3728b3b9606c4299;
#using script_383a3b1bb18ba876;
#using script_3f9e54c7a9a7e1e2;
#using script_3fda550bc6e1089a;
#using script_4721de209091b1a6;
#using script_47fb62300ac0bd60;
#using script_4a03c204316cf33;
#using script_545a0bac37bda541;
#using script_57c900a7e39234be;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\util.gsc;

#namespace recon_plane;

/*
	Name: function_e6cdb201
	Namespace: recon_plane
	Checksum: 0x41B91E0
	Offset: 0x268
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e6cdb201()
{
	level notify(538972418);
}

/*
	Name: function_89f2df9
	Namespace: recon_plane
	Checksum: 0x62C199C0
	Offset: 0x288
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"recon_plane", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: recon_plane
	Checksum: 0xE6187043
	Offset: 0x2D8
	Size: 0x2BC
	Parameters: 0
	Flags: Linked, Private
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
	if(function_f99d2668())
	{
		bundlename = bundlename + "_wz";
	}
	if(tweakables::gettweakablevalue("killstreak", "allowradardirection"))
	{
		killstreaks::function_e4ef8390(bundlename, &function_732dcb56);
	}
	callback::on_connect(&onplayerconnect);
	callback::on_spawned(&onplayerspawned);
	var_251f8a28 = getweapon("recon_plane");
	globallogic_score::function_c1e9b86b(var_251f8a28, &function_c131324d);
	globallogic_score::function_5a241bd8(var_251f8a28, &function_ed29480b);
	callback::add_callback(#"hash_7c6da2f2c9ef947a", &fx_flesh_hit_neck_fatal);
	clientfield::register("scriptmover", "recon_plane", 1, 1, "int");
	clientfield::register("scriptmover", "recon_plane_reveal", 1, 1, "int");
	clientfield::register("scriptmover", "recon_plane_damage_fx", 1, 2, "int");
	level thread function_bde85071();
}

/*
	Name: onplayerconnect
	Namespace: recon_plane
	Checksum: 0x8E587C47
	Offset: 0x5A0
	Size: 0x54
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xE752212D
	Offset: 0x600
	Size: 0x2C
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x31D7067E
	Offset: 0x638
	Size: 0xC8
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x79737551
	Offset: 0x708
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_e7ed088a()
{
	return isdefined(level.var_42ce45d5[self.entnum]) && level.var_42ce45d5[self.entnum] > 0;
}

/*
	Name: function_ed29480b
	Namespace: recon_plane
	Checksum: 0x4A5775DB
	Offset: 0x748
	Size: 0x164
	Parameters: 5
	Flags: Linked
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
	Checksum: 0x79A62C7D
	Offset: 0x8B8
	Size: 0xDA
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x29206828
	Offset: 0x9A0
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_c131324d(params)
{
	attacker = params.attacker;
	attackerweapon = params.attackerweapon;
	attacker contracts::function_a54e2068(#"hash_3ff1fe889b516cc3");
	attacker challenges::function_38ad2427(#"hash_4808274db2565c0d", 1);
	attacker stats::function_dad108fa(#"hash_15da16b6b9032af", 1);
	attacker stats::function_dad108fa(#"hash_d9fe863a1e9e4d8", 1);
	if(isdefined(attackerweapon) && attackerweapon != level.weaponnone)
	{
		attacker stats::function_e24eec31(attackerweapon, #"kill_detected_stunned_blinded", 1);
	}
}

/*
	Name: fx_flesh_hit_neck_fatal
	Namespace: recon_plane
	Checksum: 0x9315150
	Offset: 0xAB8
	Size: 0x224
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x69C19C3C
	Offset: 0xCE8
	Size: 0x750
	Parameters: 1
	Flags: Linked
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
	recon_plane function_619a5c20();
	recon_plane setweapon(weapon);
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
	recon_plane util::function_c596f193();
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
	Checksum: 0x397C4254
	Offset: 0x1440
	Size: 0x56C
	Parameters: 2
	Flags: Linked
*/
function function_98e60435(var_d44b8c3e, bundle)
{
	travelangle = randomfloatrange((isdefined(level.var_84f1b20f) ? level.var_84f1b20f : 90), (isdefined(level.var_26837e34) ? level.var_26837e34 : 180));
	startangles = (0, travelangle, 0);
	startforward = anglestoforward(startangles);
	if(function_f99d2668())
	{
		travelradius = 25000;
		zoffset = var_d44b8c3e[2] + 9500;
	}
	else
	{
		travelradius = airsupport::getmaxmapwidth() * 1.5;
		zoffset = killstreaks::function_43f4782d() + 9500;
	}
	if(function_f99d2668())
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
	Checksum: 0xCC44567
	Offset: 0x19B8
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
	Name: hackedprefunction
	Namespace: recon_plane
	Checksum: 0xCA431ABB
	Offset: 0x19E0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function hackedprefunction(hacker)
{
	recon_plane = self;
	recon_plane function_cf33d294();
}

/*
	Name: configureteampost
	Namespace: recon_plane
	Checksum: 0x7A537B44
	Offset: 0x1A18
	Size: 0xB4
	Parameters: 2
	Flags: Linked
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
	Checksum: 0x7BE89546
	Offset: 0x1AD8
	Size: 0x64
	Parameters: 2
	Flags: Linked
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
	Checksum: 0x29717DDB
	Offset: 0x1B48
	Size: 0x64
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xF9188FB9
	Offset: 0x1BB8
	Size: 0x24
	Parameters: 2
	Flags: Linked
*/
function onteamchange(entnum, event)
{
	function_e55922df();
}

/*
	Name: ontimeout
	Namespace: recon_plane
	Checksum: 0x1CD1CA29
	Offset: 0x1BE8
	Size: 0x18C
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xB6F7C2E7
	Offset: 0x1D80
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function ontimecheck()
{
	self namespace_f9b02f80::play_pilot_dialog_on_owner("timecheck", "recon_plane", self.killstreak_id);
}

/*
	Name: function_b16d07ad
	Namespace: recon_plane
	Checksum: 0x8532FCDF
	Offset: 0x1DC0
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_b16d07ad(attacker, arg)
{
	function_e55922df(arg, getweapon(#"emp"));
}

/*
	Name: function_e55922df
	Namespace: recon_plane
	Checksum: 0x93BF8BC6
	Offset: 0x1E10
	Size: 0x2E6
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xD30F5BAE
	Offset: 0x2100
	Size: 0x68
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x6C48E150
	Offset: 0x2170
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_171f5ed8()
{
	self function_cf33d294();
	killstreakrules::killstreakstop(self.killstreaktype, self.originalteam, self.killstreak_id);
}

/*
	Name: function_cf33d294
	Namespace: recon_plane
	Checksum: 0x1C0BD36E
	Offset: 0x21C0
	Size: 0x168
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x66B3F3BE
	Offset: 0x2330
	Size: 0x1B0
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x6B08058
	Offset: 0x24E8
	Size: 0xE6
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x7C56370A
	Offset: 0x25D8
	Size: 0x7C
	Parameters: 12
	Flags: Linked
*/
function killstreakdamagemodifier(damage, attacker, direction, point, smeansofdeath, tagname, modelname, partname, weapon, flags, inflictor, chargelevel)
{
	if(chargelevel == "MOD_PROJECTILE_SPLASH")
	{
		return 0;
	}
	return inflictor;
}

