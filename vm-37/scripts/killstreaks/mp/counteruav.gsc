#using scripts\core_common\battlechatter.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using script_1cc417743d7c262d;
#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreak_hacking.gsc;
#using script_4721de209091b1a6;
#using scripts\killstreaks\killstreak_detect.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace counteruav;

/*
	Name: __init__system__
	Namespace: counteruav
	Checksum: 0x6FE2C793
	Offset: 0x278
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"counteruav", &function_70a657d8, undefined, &function_3675de8b, #"killstreaks");
}

/*
	Name: function_1f11d560
	Namespace: counteruav
	Checksum: 0x5D880760
	Offset: 0x2D8
	Size: 0x2A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1f11d560()
{
	if(sessionmodeiswarzonegame())
	{
		return "killstreak_counteruav_wz";
	}
	return "killstreak_counteruav";
}

/*
	Name: function_70a657d8
	Namespace: counteruav
	Checksum: 0x3C3D4598
	Offset: 0x310
	Size: 0x22C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.counter_uav_offsets = buildoffsetlist((0, 0, 0), 3, 450, 450);
	level.activecounteruavs = [];
	level.activeplayercounteruavs = [];
	level.counter_uav_entities = [];
	if(tweakables::gettweakablevalue("killstreak", "allowcounteruav"))
	{
		killstreaks::register_killstreak(function_1f11d560(), &activatecounteruav);
	}
	level.var_69f91847 = &function_eb065a52;
	level.var_3d960463 = &function_4148fbc9;
	level.hasindexactivecounteruav = &hasindexactivecounteruav;
	clientfield::register("scriptmover", "counteruav", 1, 1, "int");
	clientfield::register("scriptmover", "counteruav_fx", 1, 1, "int");
	callback::add_callback(#"hash_7c6da2f2c9ef947a", &fx_flesh_hit_neck_fatal);
	var_5af372c = getweapon("counteruav");
	globallogic_score::function_5a241bd8(var_5af372c, &function_c9938281);
	globallogic_score::function_31bde79e(var_5af372c, #"hash_1546fa6f8e98bd61");
	/#
		if(getdvarint(#"scr_cuav_offset_debug", 0))
		{
			level thread waitanddebugdrawoffsetlist();
		}
	#/
	airsupport::init_shared();
}

/*
	Name: function_337a8f70
	Namespace: counteruav
	Checksum: 0xC84BD192
	Offset: 0x548
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_337a8f70()
{
	return isdefined(level.activeplayercounteruavs[self.entnum]) && level.activeplayercounteruavs[self.entnum] > 0;
}

/*
	Name: function_c9938281
	Namespace: counteruav
	Checksum: 0xE75E3E18
	Offset: 0x588
	Size: 0x144
	Parameters: 5
	Flags: Linked
*/
function function_c9938281(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	if(attackerweapon util::isenemyplayer(meansofdeath) && attackerweapon function_337a8f70() && !meansofdeath hasperk("specialty_immunecounteruav"))
	{
		arrayremovevalue(level.counter_uav_entities, undefined);
		foreach(var_49ddebb in level.counter_uav_entities)
		{
			if(attackerweapon === var_49ddebb.owner && var_49ddebb function_eb065a52(meansofdeath))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: fx_flesh_hit_neck_fatal
	Namespace: counteruav
	Checksum: 0xE1DA913D
	Offset: 0x6D8
	Size: 0x25C
	Parameters: 1
	Flags: Linked
*/
function fx_flesh_hit_neck_fatal(params)
{
	if(!self hasperk("specialty_immunecounteruav"))
	{
		foreach(player in params.players)
		{
			if(player function_337a8f70())
			{
				arrayremovevalue(level.counter_uav_entities, undefined);
				foreach(var_49ddebb in level.counter_uav_entities)
				{
					if(player === var_49ddebb.owner && var_49ddebb function_eb065a52(self))
					{
						scoregiven = scoreevents::processscoreevent(#"counter_uav_assist", player, undefined, undefined);
						if(isdefined(scoregiven))
						{
							player challenges::earnedcuavassistscore(scoregiven);
							player stats::function_8fb23f94("counteruav", #"assists", 1);
							player stats::function_b04e7184("counteruav", #"hash_54b8c7eda311cba4");
							killstreakindex = level.killstreakindices[#"counteruav"];
							killstreaks::killstreak_assist(player, self, killstreakindex);
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_3675de8b
	Namespace: counteruav
	Checksum: 0xD142BAB3
	Offset: 0x940
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function function_3675de8b()
{
	if(0)
	{
		level.var_f6bf445b = killstreaks::function_f3875fb0(level.var_38c5815f, (isdefined(level.var_8ac94558) ? level.var_8ac94558 : 6000), 60, 1, 1);
	}
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon(#"counteruav"), &function_bff5c062);
	}
}

/*
	Name: function_eb065a52
	Namespace: counteruav
	Checksum: 0x2CC00CE4
	Offset: 0x9F0
	Size: 0xE0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_eb065a52(ent)
{
	if(!(isdefined(ent) && isdefined(self)))
	{
		return;
	}
	bundle = killstreaks::get_script_bundle("counteruav");
	var_e96f821a = sqr((isdefined(bundle.var_c23de6e6) ? bundle.var_c23de6e6 : 0));
	if(1 && isdefined(self.var_f6bf445b))
	{
		var_54faa045 = self.var_f6bf445b.origin;
	}
	else
	{
		var_54faa045 = self.origin;
	}
	return distance2dsquared(ent.origin, var_54faa045) <= var_e96f821a;
}

/*
	Name: function_bff5c062
	Namespace: counteruav
	Checksum: 0x8F188598
	Offset: 0xAD8
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(cuav, attackingplayer)
{
	cuav hackedprefunction(attackingplayer);
	cuav.owner = attackingplayer;
	cuav setowner(attackingplayer);
	cuav killstreaks::configure_team_internal(attackingplayer, 1);
	if(isdefined(level.var_f1edf93f))
	{
		cuav notify(#"hacked");
		cuav notify(#"cancel_timeout");
		var_eb79e7c3 = int([[level.var_f1edf93f]]() * 1000);
		cuav thread killstreaks::waitfortimeout("counteruav", 30000, &ontimeout, "delete", "death", "crashing");
	}
}

/*
	Name: assignfirstavailableoffsetindex
	Namespace: counteruav
	Checksum: 0x37CB2D6
	Offset: 0xC08
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function assignfirstavailableoffsetindex()
{
	self.cuav_offset_index = getfirstavailableoffsetindex();
	arrayremovevalue(level.counter_uav_entities, undefined);
}

/*
	Name: getfirstavailableoffsetindex
	Namespace: counteruav
	Checksum: 0x90B05CE4
	Offset: 0xC48
	Size: 0x11E
	Parameters: 0
	Flags: Linked
*/
function getfirstavailableoffsetindex()
{
	available_offsets = [];
	for(i = 0; i < level.counter_uav_offsets.size; i++)
	{
		available_offsets[i] = 1;
	}
	foreach(cuav in level.counter_uav_entities)
	{
		if(isdefined(cuav))
		{
			available_offsets[cuav.cuav_offset_index] = 0;
		}
	}
	for(i = 0; i < available_offsets.size; i++)
	{
		if(available_offsets[i])
		{
			return i;
		}
	}
	/#
		util::warning("");
	#/
	return 0;
}

/*
	Name: waitanddebugdrawoffsetlist
	Namespace: counteruav
	Checksum: 0x473CA4B2
	Offset: 0xD70
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function waitanddebugdrawoffsetlist()
{
	/#
		level endon(#"game_ended");
		wait(10);
		debugdrawoffsetlist();
	#/
}

/*
	Name: debugdrawoffsetlist
	Namespace: counteruav
	Checksum: 0x6346EF11
	Offset: 0xDB0
	Size: 0xD8
	Parameters: 0
	Flags: None
*/
function debugdrawoffsetlist()
{
	/#
		baseposition = level.counter_uav_positions[0];
		foreach(offset in level.counter_uav_offsets)
		{
			util::debug_sphere(baseposition + offset, 24, (0.95, 0.05, 0.05), 0.75, 9999999);
		}
	#/
}

/*
	Name: buildoffsetlist
	Namespace: counteruav
	Checksum: 0x5E46FA3F
	Offset: 0xE90
	Size: 0x120
	Parameters: 4
	Flags: Linked
*/
function buildoffsetlist(startoffset, depth, offset_x, offset_y)
{
	offsets = [];
	for(col = 0; col < depth; col++)
	{
		itemcount = math::pow(2, col);
		startingindex = itemcount - 1;
		for(i = 0; i < itemcount; i++)
		{
			x = offset_x * col;
			y = 0;
			if(itemcount > 1)
			{
				y = i * offset_y;
				total_y = offset_y * startingindex;
				y = y - (total_y / 2);
			}
			offsets[startingindex + i] = startoffset + (x, y, 0);
		}
	}
	return offsets;
}

/*
	Name: function_af281272
	Namespace: counteruav
	Checksum: 0x84176209
	Offset: 0xFB8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_af281272()
{
	self endon(#"delete");
	waitresult = undefined;
	waitresult = self waittill(#"death");
	if(!isdefined(self))
	{
		return;
	}
	destroycounteruav(waitresult.attacker, waitresult.weapon);
}

/*
	Name: activatecounteruav
	Namespace: counteruav
	Checksum: 0x2F4EA886
	Offset: 0x1030
	Size: 0x6C0
	Parameters: 1
	Flags: Linked
*/
function activatecounteruav(killstreaktype)
{
	if(self killstreakrules::iskillstreakallowed("counteruav", self.team) == 0)
	{
		return false;
	}
	killstreak_id = self killstreakrules::killstreakstart("counteruav", self.team);
	if(killstreak_id == -1)
	{
		return false;
	}
	bundle = getscriptbundle(function_1f11d560());
	counteruav = spawncounteruav(self, killstreak_id, bundle, killstreaktype);
	if(!isdefined(counteruav))
	{
		return false;
	}
	counteruav clientfield::set("enemyvehicle", 1);
	counteruav clientfield::set("counteruav_fx", 1);
	counteruav clientfield::set("scorestreakActive", 1);
	counteruav killstreaks::function_a781e8d2();
	counteruav.killstreak_id = killstreak_id;
	counteruav.var_48d842c3 = 1;
	counteruav thread killstreaks::waittillemp(&destroycounteruavbyemp);
	counteruav thread killstreaks::waitfortimeout("counteruav", 30000, &ontimeout, "delete", "death", "crashing");
	counteruav thread killstreaks::waitfortimecheck(30000 / 2, &ontimecheck, "delete", "death", "crashing");
	counteruav thread function_af281272();
	counteruav thread function_f724cfe4(100000);
	counteruav thread killstreaks::function_2b6aa9e8("counteruav", &destroycounteruav, &onlowhealth, undefined);
	if(0)
	{
		counteruav killstreaks::function_67d553c4(level.var_f6bf445b, (isdefined(level.uav_rotation_radius) ? level.uav_rotation_radius : 4000), (isdefined(level.uav_rotation_random_offset) ? level.uav_rotation_random_offset : 1000), 1);
		counteruav clientfield::set("counteruav", 1);
	}
	else
	{
		if(sessionmodeiswarzonegame())
		{
			var_b0490eb9 = getheliheightlockheight(self.origin);
			trace = groundtrace((self.origin[0], self.origin[1], var_b0490eb9), self.origin - vectorscale((0, 0, 1), 5000), 0, counteruav);
			groundheight = trace[#"position"][2];
			var_5f8c899e = groundheight + ((var_b0490eb9 - groundheight) * bundle.var_ff73e08c);
			var_5f8c899e = var_5f8c899e - killstreaks::function_43f4782d();
		}
		else
		{
			var_5f8c899e = 6000;
		}
		counteruav.var_f6bf445b = killstreaks::function_f3875fb0(self.origin, (isdefined(level.var_8ac94558) ? level.var_8ac94558 : var_5f8c899e), 60, 1, 1);
		counteruav killstreaks::function_67d553c4(counteruav.var_f6bf445b, (isdefined(level.uav_rotation_radius) ? level.uav_rotation_radius : 4000), (isdefined(level.uav_rotation_random_offset) ? level.uav_rotation_random_offset : 1000), 1);
		counteruav.var_f6bf445b clientfield::set("counteruav", 1);
		counteruav.var_f6bf445b setteam(counteruav.team);
	}
	counteruav killstreakrules::function_2e6ff61a("uav", killstreak_id, {#team:counteruav.team, #origin:counteruav.var_f6bf445b.origin});
	weapon = getweapon("counteruav");
	self namespace_f9b02f80::play_killstreak_start_dialog("counteruav", self.team, killstreak_id);
	counteruav namespace_f9b02f80::play_pilot_dialog_on_owner("arrive", "counteruav", killstreak_id);
	counteruav thread killstreaks::player_killstreak_threat_tracking("counteruav", 0.9659258);
	self stats::function_e24eec31(weapon, #"used", 1);
	if(isdefined(level.var_baadd01f) && self [[level.var_baadd01f]]())
	{
		scoreevents::processscoreevent(#"hash_313b3158836e5466", self, undefined, weapon);
		self stats::function_8fb23f94("counteruav", #"hash_522722579f6b3630", 1);
	}
	return true;
}

/*
	Name: function_f724cfe4
	Namespace: counteruav
	Checksum: 0xAC082DBC
	Offset: 0x16F8
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
	Namespace: counteruav
	Checksum: 0xEC5CF8AE
	Offset: 0x1720
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function hackedprefunction(hacker)
{
	cuav = self;
	cuav resetactivecounteruav();
}

/*
	Name: spawncounteruav
	Namespace: counteruav
	Checksum: 0x3DFAE969
	Offset: 0x1758
	Size: 0x2A4
	Parameters: 4
	Flags: Linked
*/
function spawncounteruav(owner, killstreak_id, bundle, killstreaktype)
{
	minflyheight = killstreaks::function_43f4782d();
	cuav = spawn("script_model", owner.origin + (0, 0, minflyheight + (isdefined(level.counter_uav_position_z_offset) ? level.counter_uav_position_z_offset : 1000)));
	cuav setmodel(bundle.var_c6eab8b5);
	cuav setenemymodel(bundle.var_aa0b97e1);
	cuav assignfirstavailableoffsetindex();
	cuav killstreaks::configure_team(killstreaktype, killstreak_id, owner, undefined, undefined, &configureteampost);
	cuav killstreak_hacking::enable_hacking("counteruav", &hackedprefunction, undefined);
	cuav.targetname = "counteruav";
	cuav util::make_sentient();
	cuav.weapon = getweapon("counteruav");
	cuav setweapon(cuav.weapon);
	cuav.victimsoundmod = "vehicle";
	cuav setforcenocull();
	killstreak_detect::killstreaktargetset(cuav);
	cuav thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(bundle, "crashing", undefined, 1);
	cuav setdrawinfrared(1);
	cuav thread killstreaks::function_5a7ecb6b();
	if(!isdefined(level.counter_uav_entities))
	{
		level.counter_uav_entities = [];
	}
	else if(!isarray(level.counter_uav_entities))
	{
		level.counter_uav_entities = array(level.counter_uav_entities);
	}
	level.counter_uav_entities[level.counter_uav_entities.size] = cuav;
	return cuav;
}

/*
	Name: configureteampost
	Namespace: counteruav
	Checksum: 0x1EB4CEDC
	Offset: 0x1A08
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function configureteampost(owner, ishacked)
{
	cuav = self;
	cuav thread teams::waituntilteamchangesingleton(ishacked, "CUAV_watch_team_change_" + cuav getentitynumber(), &onteamchange, self.entnum, "death", "leaving", "crashing");
	cuav addactivecounteruav();
}

/*
	Name: playfx
	Namespace: counteruav
	Checksum: 0x25438DD0
	Offset: 0x1AB0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function playfx(name)
{
	self endon(#"death");
	wait(0.1);
	if(isdefined(self))
	{
		playfxontag(name, self, "tag_origin");
	}
}

/*
	Name: onlowhealth
	Namespace: counteruav
	Checksum: 0x71AEB03F
	Offset: 0x1B10
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function onlowhealth(attacker, weapon)
{
	self.is_damaged = 1;
	params = killstreaks::get_script_bundle("counteruav");
	if(isdefined(params.fxlowhealth))
	{
		playfxontag(params.fxlowhealth, self, "tag_origin");
	}
	self killstreaks::function_8b4513ca();
}

/*
	Name: onteamchange
	Namespace: counteruav
	Checksum: 0xE66B245C
	Offset: 0x1BB0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function onteamchange(entnum, event)
{
	destroycounteruav(undefined, undefined);
}

/*
	Name: ontimeout
	Namespace: counteruav
	Checksum: 0x86CE354F
	Offset: 0x1BE8
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function ontimeout()
{
	self.leaving = 1;
	function_7017e1bf();
	self clientfield::set("counteruav_fx", 0);
	if(0)
	{
		self clientfield::set("counteruav", 0);
	}
	else
	{
		self.var_f6bf445b clientfield::set("counteruav", 0);
	}
	if(isdefined(level.var_14151f16))
	{
		[[level.var_14151f16]](self, 0);
	}
	self namespace_f9b02f80::play_pilot_dialog_on_owner("timeout", "counteruav", self.killstreak_id);
	self removeactivecounteruav();
	if(sessionmodeiswarzonegame())
	{
		var_384be02f = 4000;
	}
	self airsupport::leave(5, var_384be02f);
	self util::delay(5 - 2, undefined, &killstreaks::function_3696d106);
	wait(5);
	self killstreaks::function_90e951f2();
	waitframe(1);
	self delete();
}

/*
	Name: ontimecheck
	Namespace: counteruav
	Checksum: 0xEAD91CA5
	Offset: 0x1D90
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function ontimecheck()
{
	self namespace_f9b02f80::play_pilot_dialog_on_owner("timecheck", "counteruav", self.killstreak_id);
}

/*
	Name: destroycounteruavbyemp
	Namespace: counteruav
	Checksum: 0x1B55E853
	Offset: 0x1DD0
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function destroycounteruavbyemp(attacker, arg)
{
	destroycounteruav(arg, getweapon(#"emp"));
}

/*
	Name: function_7017e1bf
	Namespace: counteruav
	Checksum: 0xCB66B369
	Offset: 0x1E20
	Size: 0xF0
	Parameters: 0
	Flags: Linked
*/
function function_7017e1bf()
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
	Name: destroycounteruav
	Namespace: counteruav
	Checksum: 0x1D208986
	Offset: 0x1F18
	Size: 0x204
	Parameters: 2
	Flags: Linked
*/
function destroycounteruav(attacker, weapon)
{
	if(self.leaving !== 1)
	{
		self namespace_f9b02f80::play_destroyed_dialog_on_owner("counteruav", self.killstreak_id);
	}
	if(isdefined(self.var_f6bf445b))
	{
		self.var_f6bf445b delete();
	}
	attacker = self [[level.figure_out_attacker]](attacker);
	if(isdefined(attacker) && (!isdefined(self.owner) || self.owner util::isenemyplayer(attacker)))
	{
		attacker battlechatter::function_eebf94f6("counteruav");
		challenges::destroyedaircraft(attacker, weapon, 0, self);
		self killstreaks::function_73566ec7(attacker, weapon, self.owner);
		luinotifyevent(#"player_callout", 2, #"hash_3544b7c59fa5c59c", attacker.entnum);
		attacker challenges::addflyswatterstat(weapon, self);
		self playsound(#"exp_veh_large");
	}
	self playsound(#"evt_helicopter_midair_exp");
	self removeactivecounteruav();
	if(target_istarget(self))
	{
		target_remove(self);
	}
	self thread deletecounteruav();
}

/*
	Name: deletecounteruav
	Namespace: counteruav
	Checksum: 0x8FF67563
	Offset: 0x2128
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function deletecounteruav()
{
	self notify(#"crashing");
	params = killstreaks::get_script_bundle("counteruav");
	if(isdefined(params.ksexplosionfx))
	{
		self thread playfx(params.ksexplosionfx);
	}
	if(isdefined(params.var_bb6c29b4) && isdefined(self.var_d02ddb8e) && self.var_d02ddb8e == getweapon(#"shock_rifle"))
	{
		self thread playfx(params.var_bb6c29b4);
	}
	self killstreaks::function_90e951f2();
	self killstreaks::function_7d265bd3();
	wait(0.1);
	if(isdefined(self))
	{
		self setmodel(#"tag_origin");
		self setenemymodel(#"tag_origin");
	}
	wait(0.2);
	if(isdefined(self))
	{
		self notify(#"delete");
		self delete();
	}
}

/*
	Name: function_4148fbc9
	Namespace: counteruav
	Checksum: 0xCB099FC8
	Offset: 0x22C0
	Size: 0x11C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4148fbc9()
{
	if(isplayer(self) && self hasperk(#"specialty_immunecounteruav"))
	{
		return false;
	}
	arrayremovevalue(level.counter_uav_entities, undefined);
	foreach(var_49ddebb in level.counter_uav_entities)
	{
		if(util::function_fbce7263(var_49ddebb.team, self.team) && var_49ddebb function_eb065a52(self))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: hasindexactivecounteruav
	Namespace: counteruav
	Checksum: 0x34518685
	Offset: 0x23E8
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function hasindexactivecounteruav(team_or_entnum)
{
	return isdefined(level.activecounteruavs[team_or_entnum]) && level.activecounteruavs[team_or_entnum] > 0;
}

/*
	Name: addactivecounteruav
	Namespace: counteruav
	Checksum: 0x7401772
	Offset: 0x2428
	Size: 0x148
	Parameters: 0
	Flags: Linked
*/
function addactivecounteruav()
{
	if(!isdefined(level.activecounteruavs[self.team]))
	{
		level.activecounteruavs[self.team] = 0;
	}
	level.activecounteruavs[self.team]++;
	foreach(team, _ in level.teams)
	{
		if(!util::function_fbce7263(team, self.team))
		{
			continue;
		}
		if(killstreaks::hassatellite(team))
		{
			self.owner challenges::blockedsatellite();
		}
	}
	if(!isdefined(level.activeplayercounteruavs[self.ownerentnum]))
	{
		level.activeplayercounteruavs[self.ownerentnum] = 0;
	}
	level.activeplayercounteruavs[self.ownerentnum]++;
	level notify(#"counter_uav_updated");
}

/*
	Name: removeactivecounteruav
	Namespace: counteruav
	Checksum: 0x4A80D796
	Offset: 0x2578
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function removeactivecounteruav()
{
	cuav = self;
	if(cuav.var_f52c102f === 1)
	{
		return;
	}
	cuav resetactivecounteruav();
	cuav killstreakrules::killstreakstop(cuav.killstreaktype, self.originalteam, self.killstreak_id);
	cuav.var_f52c102f = 1;
}

/*
	Name: resetactivecounteruav
	Namespace: counteruav
	Checksum: 0x21C22AFA
	Offset: 0x2600
	Size: 0x118
	Parameters: 0
	Flags: Linked
*/
function resetactivecounteruav()
{
	if(!isdefined(level.activecounteruavs[self.team]))
	{
		return;
	}
	level.activecounteruavs[self.team]--;
	/#
		assert(level.activecounteruavs[self.team] >= 0);
	#/
	if(level.activecounteruavs[self.team] <= 0)
	{
		level.activecounteruavs[self.team] = undefined;
	}
	if(isdefined(level.activeplayercounteruavs[self.ownerentnum]))
	{
		level.activeplayercounteruavs[self.ownerentnum]--;
		/#
			assert(level.activeplayercounteruavs[self.ownerentnum] >= 0);
		#/
		if(level.activeplayercounteruavs[self.ownerentnum] <= 0)
		{
			level.activeplayercounteruavs[self.ownerentnum] = undefined;
		}
	}
	level notify(#"counter_uav_updated");
}

