#using scripts\abilities\mp\gadgets\gadget_smart_cover.gsc;
#using scripts\abilities\mp\gadgets\gadget_concertina_wire.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\spawnlogic.gsc;
#using scripts\mp_common\gametypes\spawning.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using script_1cc417743d7c262d;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\spawning_shared.gsc;
#using script_335d0650ed05d36d;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace clean;

/*
	Name: function_87d73a7
	Namespace: clean
	Checksum: 0x381E9C0C
	Offset: 0x5F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_87d73a7()
{
	level notify(-851915820);
}

/*
	Name: __init__system__
	Namespace: clean
	Checksum: 0xE5E1DEE6
	Offset: 0x618
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"clean", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: clean
	Checksum: 0x277D339
	Offset: 0x660
	Size: 0xE4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register_clientuimodel("hudItems.cleanCarryCount", 14000, 4, "int");
	clientfield::register_clientuimodel("hudItems.cleanCarryFull", 14000, 1, "int");
	clientfield::register("scriptmover", "taco_flag", 14000, 2, "int");
	clientfield::register("allplayers", "taco_carry", 14000, 1, "int");
	clientfield::register("scriptmover", "taco_waypoint", 14000, 1, "int");
}

/*
	Name: main
	Namespace: clean
	Checksum: 0xEAB27076
	Offset: 0x750
	Size: 0x30C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	setdvar(#"hash_2e65ea88ce1029dc", int(min(50, 127)));
	globallogic::init();
	level.tacos = [];
	level.teamscorepercleandeposit = getgametypesetting(#"teamscorepercleandeposit");
	level.var_2576eaeb = 0;
	level.cleandepositonlinetime = getgametypesetting(#"cleandepositonlinetime");
	level.cleandepositrotation = getgametypesetting(#"cleandepositrotation");
	level.shownextzoneobjective = getgametypesetting(#"shownextzoneobjective");
	level.var_c5e28dc5 = getgametypesetting(#"hash_5cc4c3042b7d4935");
	level.teambased = 1;
	level.onstartgametype = &onstartgametype;
	level.onspawnplayer = &onspawnplayer;
	player::function_cf3aa03d(&onplayerkilled);
	spawning::addsupportedspawnpointtype("tdm");
	level.var_b7d7d172 = getweapon(#"hash_1a8e376e04ffed9d");
	level.var_11d8b3ba = "ui/fx8_fracture_deposit_point";
	level.var_6c5ba305 = "ui/fx8_fracture_deposit_point_end";
	level.var_dfce3f1c = #"clean_deposit";
	level.var_7e9929c6 = #"hash_76315cb50906f6a9";
	level.var_f3ac1626 = #"hash_7fcd27b1d6d34d4";
	level.var_ce802423 = 1;
	if(is_true(level.var_c5e28dc5))
	{
		level.var_11d8b3ba = "ui/fx8_fracture_deposit_point_ire";
		level.var_6c5ba305 = "ui/fx8_fracture_deposit_point_end_ire";
		level.var_dfce3f1c = #"hash_6c8a4a73bc07da57";
		level.var_7e9929c6 = #"hash_44649de0c0654449";
		level.var_f3ac1626 = #"hash_334f9a386d27edb4";
	}
	callback::on_connect(&onplayerconnect);
}

/*
	Name: onstartgametype
	Namespace: clean
	Checksum: 0x6D6DFF27
	Offset: 0xA68
	Size: 0x238
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	if(is_true(level.var_c5e28dc5))
	{
		foreach(team in level.teams)
		{
			util::function_db4846b(team, 1);
		}
	}
	globallogic_score::resetteamscores();
	if(is_true(level.var_c5e28dc5))
	{
		level.var_1940f14e = spawn("script_model", (0, 0, 0));
		level.var_1940f14e setmodel("p9_pot_of_gold_pristine");
		level.var_1940f14e sethighdetail(1);
		level.var_1940f14e hide();
	}
	level function_c1780fc7();
	level thread function_fd08eb25();
	level thread function_aafe4c74();
	level thread function_c857e45f();
	/#
		level.var_8df7db3b = 0;
		level.var_8b5ef67d = 0;
		level.var_bb42ed2 = 0;
		level.var_9d4a9561 = 0;
		level.var_b8c2e6df = 0;
	#/
	waitframe(1);
	for(i = 0; i < 50; i++)
	{
		level.tacos[i] = function_f82f0bb5();
	}
}

/*
	Name: onplayerconnect
	Namespace: clean
	Checksum: 0xB98961EE
	Offset: 0xCA8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function onplayerconnect()
{
	self.pers[#"cleandeposits"] = 0;
	self.pers[#"cleandenies"] = 0;
}

/*
	Name: function_aafe4c74
	Namespace: clean
	Checksum: 0x3BC1FB39
	Offset: 0xCE8
	Size: 0x264
	Parameters: 0
	Flags: None
*/
function function_aafe4c74()
{
	level waittill(#"game_ended");
	foreach(taco in level.tacos)
	{
		if(taco clientfield::get("taco_flag") > 0)
		{
			taco clientfield::set("taco_flag", 0);
		}
	}
	foreach(deposithub in level.cleandeposithubs)
	{
		deposithub stoploopsound();
		if(isdefined(deposithub.baseeffect))
		{
			deposithub.baseeffect delete();
		}
		if(isdefined(deposithub.var_a9079d5e))
		{
			deposithub.var_a9079d5e delete();
		}
	}
	foreach(player in level.players)
	{
		player clientfield::set("taco_carry", 0);
	}
	if(isdefined(level.var_96226f2e))
	{
		objective_setstate(level.var_96226f2e, "invisible");
	}
}

/*
	Name: debug_print
	Namespace: clean
	Checksum: 0x392A3F1B
	Offset: 0xF58
	Size: 0xDE
	Parameters: 0
	Flags: None
*/
function debug_print()
{
	/#
		while(true)
		{
			iprintln("" + level.var_8df7db3b);
			iprintln("" + level.var_8b5ef67d);
			iprintln("" + level.var_bb42ed2);
			iprintln("" + level.var_9d4a9561);
			iprintln("" + level.var_b8c2e6df);
			wait(5);
		}
	#/
}

/*
	Name: onspawnplayer
	Namespace: clean
	Checksum: 0x53FF0312
	Offset: 0x1040
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function onspawnplayer(predictedspawn)
{
	if(spawning::usestartspawns() && !level.ingraceperiod)
	{
		spawning::function_7a87efaa();
	}
	self.var_916cc864 = 0;
	self.var_91be2350 = 0;
	self.var_129c990c = 0;
	self.carriedtacos = 0;
	self.var_3e52c359 = 0;
	self clientfield::set_player_uimodel("hudItems.cleanCarryCount", 0);
	spawning::onspawnplayer(predictedspawn);
}

/*
	Name: onplayerkilled
	Namespace: clean
	Checksum: 0x8E875423
	Offset: 0x1100
	Size: 0x1E4
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(isplayer(psoffsettime) && psoffsettime.team != self.team)
	{
		if(!isdefined(killstreaks::get_killstreak_for_weapon(deathanimduration)) || is_true(level.killstreaksgivegamescore))
		{
			psoffsettime globallogic_score::giveteamscoreforobjective(psoffsettime.team, level.teamscoreperkill);
		}
		if(self.carriedtacos >= 5)
		{
			scoreevents::processscoreevent(#"clean_kill_enemy_carrying_tacos", psoffsettime, self, deathanimduration);
		}
	}
	if(isdefined(psoffsettime) && isplayer(psoffsettime) && psoffsettime.team != self.team)
	{
		taco = function_b25ab1e7();
		if(isdefined(taco))
		{
			yawangle = randomint(360);
			taco function_903c4eff(self, psoffsettime, undefined, yawangle);
		}
		self thread function_bbcf6af(psoffsettime, yawangle);
	}
	self function_aea246ff();
}

/*
	Name: function_8695993b
	Namespace: clean
	Checksum: 0x75A50375
	Offset: 0x12F0
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function function_8695993b()
{
	self endon(#"death");
	level endon(#"game_ended");
	while(true)
	{
		self flag::wait_till("camo_suit_on");
		self clientfield::set("taco_carry", 0);
		self flag::wait_till_clear("camo_suit_on");
	}
}

/*
	Name: function_fccce038
	Namespace: clean
	Checksum: 0xBF41B7F9
	Offset: 0x1388
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_fccce038()
{
	if(self.carriedtacos > 0)
	{
		self clientfield::set("taco_carry", 1);
	}
	else
	{
		self clientfield::set("taco_carry", 0);
	}
}

/*
	Name: function_b25ab1e7
	Namespace: clean
	Checksum: 0x1F419BB4
	Offset: 0x13E8
	Size: 0x132
	Parameters: 0
	Flags: None
*/
function function_b25ab1e7()
{
	var_ba985a3c = undefined;
	foreach(taco in level.tacos)
	{
		if(taco.interactteam == #"hash_161f03feaadc9b8f")
		{
			return taco;
		}
		if(isdefined(taco.var_2581d0d))
		{
			continue;
		}
		if(!isdefined(var_ba985a3c) || taco.droptime < var_ba985a3c.droptime)
		{
			var_ba985a3c = taco;
		}
	}
	if(isdefined(var_ba985a3c) && var_ba985a3c.droptime != gettime())
	{
		/#
			level.var_9d4a9561++;
		#/
		var_ba985a3c registermp_multi_kill_medals_interface();
		return var_ba985a3c;
	}
	/#
		level.var_b8c2e6df++;
	#/
	return undefined;
}

/*
	Name: function_f82f0bb5
	Namespace: clean
	Checksum: 0xA1EB236D
	Offset: 0x1528
	Size: 0x128
	Parameters: 0
	Flags: None
*/
function function_f82f0bb5()
{
	visuals = [];
	trigger = spawn("trigger_radius", (0, 0, 0), 0, 40, 32);
	trigger.var_a865c2cd = 0;
	taco = gameobjects::create_use_object(#"any", trigger, visuals);
	taco notsolid();
	taco ghost();
	taco setmodel(#"tag_origin");
	taco gameobjects::set_use_time(0);
	taco.onuse = &function_95cbd646;
	taco clientfield::set("taco_waypoint", 0);
	return taco;
}

/*
	Name: function_903c4eff
	Namespace: clean
	Checksum: 0x871C0F94
	Offset: 0x1658
	Size: 0x324
	Parameters: 4
	Flags: None
*/
function function_903c4eff(victim, attacker, pos, yawangle)
{
	/#
		level.var_8df7db3b++;
		level.var_8b5ef67d = max(level.var_8b5ef67d, level.var_8df7db3b);
	#/
	if(!isdefined(yawangle))
	{
		yawangle = randomint(360);
	}
	if(!isdefined(pos))
	{
		pos = victim.origin + vectorscale((0, 0, 1), 40);
	}
	self.droptime = gettime();
	self.team = victim.team;
	self.victim = victim;
	self.victimteam = victim.team;
	self.attacker = attacker;
	self.attackerteam = attacker.team;
	self.origin = pos;
	self.trigger.origin = pos;
	self show();
	self clientfield::set("taco_flag", 1);
	self clientfield::set("taco_waypoint", 1);
	self playloopsound("mpl_fracture_core_loop");
	self dontinterpolate();
	self gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
	if(isdefined(self.var_2581d0d))
	{
		self.var_2581d0d delete();
	}
	dropangles = (-70, yawangle, 0);
	force = anglestoforward(dropangles) * randomfloatrange(getdvarfloat(#"dropmin", 220), getdvarfloat(#"dropmax", 300));
	self.var_2581d0d = victim magicmissile(level.var_b7d7d172, pos, force);
	self.var_2581d0d hide();
	self.var_2581d0d notsolid();
	self thread function_8cb72ba4();
	self thread function_9415d18b();
	self thread timeout_wait();
}

/*
	Name: function_8cb72ba4
	Namespace: clean
	Checksum: 0xDBC2D54
	Offset: 0x1988
	Size: 0x128
	Parameters: 0
	Flags: None
*/
function function_8cb72ba4()
{
	level endon(#"game_ended");
	self endon(#"reset");
	self.var_2581d0d endon(#"death", #"stationary");
	while(true)
	{
		if(!isdefined(self.var_2581d0d))
		{
			break;
		}
		if(self.var_2581d0d oob::istouchinganyoobtrigger() || self.var_2581d0d gameobjects::is_touching_any_trigger_key_value("trigger_hurt", "classname", self.trigger.origin[2], self.trigger.origin[2] + 32))
		{
			self thread registermp_multi_kill_medals_interface();
			return;
		}
		self.trigger.origin = self.var_2581d0d.origin;
		waitframe(1);
	}
}

/*
	Name: function_9415d18b
	Namespace: clean
	Checksum: 0x7C4821D
	Offset: 0x1AB8
	Size: 0xEE
	Parameters: 0
	Flags: None
*/
function function_9415d18b()
{
	level endon(#"game_ended");
	self endon(#"reset");
	self.var_2581d0d endon(#"death");
	if(!isdefined(self.var_2581d0d))
	{
		return;
	}
	self.var_2581d0d waittill(#"stationary");
	self.trigger.origin = self.var_2581d0d.origin;
	self playsound("mpl_fracture_core_drop");
	self clientfield::set("taco_flag", 2);
	self.var_2581d0d deletedelay();
	self.var_2581d0d = undefined;
}

/*
	Name: timeout_wait
	Namespace: clean
	Checksum: 0x46B25795
	Offset: 0x1BB0
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function timeout_wait()
{
	level endon(#"game_ended");
	self endon(#"reset");
	wait(60);
	/#
		level.var_bb42ed2++;
	#/
	self thread registermp_multi_kill_medals_interface();
}

/*
	Name: registermp_multi_kill_medals_interface
	Namespace: clean
	Checksum: 0x9A1F7FAD
	Offset: 0x1C18
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function registermp_multi_kill_medals_interface()
{
	/#
		level.var_8df7db3b--;
	#/
	self notify(#"reset");
	self clientfield::set("taco_flag", 0);
	self clientfield::set("taco_waypoint", 0);
	self stoploopsound();
	self.trigger.origin = vectorscale((0, 0, 1), 1000);
	self gameobjects::allow_use(#"hash_161f03feaadc9b8f");
	waittillframeend();
	if(isdefined(self.var_2581d0d))
	{
		self.var_2581d0d delete();
		self.var_2581d0d = undefined;
	}
	self ghost();
}

/*
	Name: function_c1780fc7
	Namespace: clean
	Checksum: 0x1936CD46
	Offset: 0x1D20
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function function_c1780fc7()
{
	globallogic::function_bf2901cf();
	function_b4a9e792("clean_objective_base_trig");
	function_b4a9e792("clean_objective_center_trig");
	function_b4a9e792("clean_objective_scatter_trig");
	function_998dec78();
	function_8be56c1(#"clean_deposit");
	if(isdefined(level.shownextzoneobjective) && level.shownextzoneobjective > 0)
	{
		level.var_96226f2e = gameobjects::get_next_obj_id();
		objective_add(level.var_96226f2e, "invisible", undefined, level.var_7e9929c6);
		function_18fbab10(level.var_96226f2e, level.var_f3ac1626);
	}
}

/*
	Name: function_8be56c1
	Namespace: clean
	Checksum: 0xDE32671B
	Offset: 0x1E40
	Size: 0x1D4
	Parameters: 1
	Flags: Private
*/
function private function_8be56c1(targetname)
{
	level.cleandeposithubs = [];
	structs = struct::get_array(targetname);
	foreach(struct in structs)
	{
		/#
			/#
				assert(isdefined(struct.script_index), function_9e72a96(targetname) + "");
			#/
			/#
				assert(!isdefined(level.cleandeposithubs[struct.script_index]), function_9e72a96(targetname) + "");
			#/
		#/
		level.cleandeposithubs[struct.script_index] = function_bad2b0d4(struct.origin);
	}
	/#
		for(i = 0; i < level.cleandeposithubs.size; i++)
		{
			/#
				assert(isdefined(level.cleandeposithubs[i]), (("" + function_9e72a96(targetname)) + "") + i);
			#/
		}
	#/
}

/*
	Name: function_8c1a5f77
	Namespace: clean
	Checksum: 0xB5858794
	Offset: 0x2020
	Size: 0xEC
	Parameters: 0
	Flags: Private
*/
function private function_8c1a5f77()
{
	if(!isdefined(level.cleandepositpoints))
	{
		/#
			util::error("");
		#/
		return;
	}
	level.cleandeposithubs = [];
	foreach(point in level.cleandepositpoints)
	{
		deposithub = function_bad2b0d4(point);
		level.cleandeposithubs[level.cleandeposithubs.size] = deposithub;
	}
}

/*
	Name: function_b4a9e792
	Namespace: clean
	Checksum: 0x9E8CA895
	Offset: 0x2118
	Size: 0xB8
	Parameters: 1
	Flags: None
*/
function function_b4a9e792(targetname)
{
	ents = getentarray(targetname, "targetname");
	foreach(ent in ents)
	{
		ent delete();
	}
}

/*
	Name: function_998dec78
	Namespace: clean
	Checksum: 0x671AE4AC
	Offset: 0x21D8
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_998dec78()
{
	scriptmodels = getentarray("script_model", "className");
	foreach(scriptmodel in scriptmodels)
	{
		if(scriptmodel.model === "p7_mp_flag_base")
		{
			scriptmodel delete();
		}
	}
}

/*
	Name: function_bad2b0d4
	Namespace: clean
	Checksum: 0xF1A16962
	Offset: 0x22A8
	Size: 0x1B0
	Parameters: 1
	Flags: None
*/
function function_bad2b0d4(origin)
{
	trigger = spawn("trigger_radius", origin, 0, 60, 108);
	visuals[0] = spawn("script_model", trigger.origin);
	deposithub = gameobjects::create_use_object(#"neutral", trigger, visuals, undefined, level.var_dfce3f1c);
	deposithub gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
	deposithub gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	deposithub gameobjects::set_use_time(0);
	deposithub gameobjects::disable_object();
	deposithub.onuse = &function_83e87bd5;
	deposithub.canuseobject = &function_1237ad98;
	deposithub.effectorigin = trigger.origin + vectorscale((0, 0, 1), 4);
	deposithub.influencer = influencers::create_influencer("clean_deposit_hub", deposithub.origin, 0);
	enableinfluencer(deposithub.influencer, 0);
	return deposithub;
}

/*
	Name: function_b8a3dde4
	Namespace: clean
	Checksum: 0xD57037C6
	Offset: 0x2460
	Size: 0x252
	Parameters: 0
	Flags: None
*/
function function_b8a3dde4()
{
	level endon(#"game_ended");
	self.baseeffect = spawnfx(level.var_11d8b3ba, self.effectorigin);
	self.baseeffect.team = #"none";
	triggerfx(self.baseeffect, 0.001);
	if(is_true(level.var_c5e28dc5))
	{
		var_a58771cf = anglestoforward(self.angles);
		var_352b1189 = anglestoup(self.angles);
		self.var_a9079d5e = spawnfx(#"hash_4e307a6141c3c7c4", self.origin, var_a58771cf, var_352b1189);
		triggerfx(self.var_a9079d5e, 0.001);
	}
	wait_time = level.cleandepositonlinetime;
	if(wait_time < 0)
	{
		wait_time = level.cleandepositonlinetime * 0.05;
	}
	wait(wait_time);
	if(isdefined(self.var_a9079d5e))
	{
		self.var_a9079d5e delete();
	}
	if(!isdefined(self.baseeffect))
	{
		return;
	}
	self.baseeffect delete();
	self.baseeffect = spawnfx(level.var_6c5ba305, self.effectorigin);
	self.baseeffect.team = #"none";
	triggerfx(self.baseeffect, 0.001);
	self.baseeffect = spawnfx(level.var_6c5ba305, self.effectorigin);
}

/*
	Name: function_fd08eb25
	Namespace: clean
	Checksum: 0xFF9CD986
	Offset: 0x26C0
	Size: 0x680
	Parameters: 0
	Flags: None
*/
function function_fd08eb25()
{
	level endon(#"game_ended");
	while(level.inprematchperiod)
	{
		waitframe(1);
	}
	setbombtimer("A", 0);
	setmatchflag("bomb_timer_a", 0);
	var_696c0ca5 = -1;
	var_79efdaa0 = undefined;
	while(true)
	{
		if(level.var_2576eaeb > 0)
		{
			foreach(_ in level.teams)
			{
				setmatchflag("bomb_timer_a", 1);
				setbombtimer("A", (gettime() + 1000) + (int(level.var_2576eaeb * 1000)));
				if(var_696c0ca5 >= 0)
				{
					globallogic_audio::leader_dialog("hubOffline", team);
					globallogic_audio::play_2d_on_team("mpl_hardpoint_move", team);
				}
			}
			wait(level.var_2576eaeb);
		}
		if(isdefined(level.var_96226f2e))
		{
			objective_setstate(level.var_96226f2e, "invisible");
		}
		var_e0b73154 = (isdefined(var_79efdaa0) ? var_79efdaa0 : function_e3e1cf54(var_696c0ca5));
		deposithub = level.cleandeposithubs[var_e0b73154];
		var_79efdaa0 = function_e3e1cf54(var_e0b73154);
		deposithub gameobjects::enable_object();
		deposithub gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
		smart_cover::function_18f38647(deposithub.trigger);
		concertina_wire::function_18f38647(deposithub.trigger);
		deposithub thread function_b8a3dde4();
		enableinfluencer(deposithub.influencer, 1);
		if(isdefined(level.var_1940f14e))
		{
			level.var_1940f14e.origin = deposithub.origin;
			level.var_1940f14e show();
		}
		setmatchflag("bomb_timer_a", 1);
		setbombtimer("A", (gettime() + 1000) + (int(level.cleandepositonlinetime * 1000)));
		foreach(_ in level.teams)
		{
			if(level.var_2576eaeb > 0)
			{
				globallogic_audio::leader_dialog("hubOnline", team);
			}
			else if(var_696c0ca5 >= 0)
			{
				globallogic_audio::leader_dialog("hubMoved", team);
			}
			if(var_696c0ca5 >= 0)
			{
				globallogic_audio::play_2d_on_team("mpl_hq_cap_us", team);
			}
		}
		var_696c0ca5 = var_e0b73154;
		if(isdefined(level.shownextzoneobjective) && level.shownextzoneobjective > 0 && isdefined(level.var_96226f2e))
		{
			var_4f1e9d48 = max(0, level.cleandepositonlinetime - level.shownextzoneobjective);
			wait(var_4f1e9d48);
			var_f6595e31 = level.cleandeposithubs[var_79efdaa0];
			if(isdefined(var_f6595e31.origin))
			{
				objective_setposition(level.var_96226f2e, var_f6595e31.origin);
				objective_setstate(level.var_96226f2e, "active");
			}
			var_b2667d52 = level.cleandepositonlinetime - var_4f1e9d48;
			wait(var_b2667d52);
		}
		else
		{
			wait(level.cleandepositonlinetime);
		}
		smart_cover::function_60a53911(deposithub.trigger);
		concertina_wire::function_60a53911(deposithub.trigger);
		deposithub gameobjects::disable_object();
		deposithub gameobjects::allow_use(#"hash_161f03feaadc9b8f");
		deposithub gameobjects::set_visible(#"hash_161f03feaadc9b8f");
		enableinfluencer(deposithub.influencer, 0);
		deposithub stoploopsound();
		if(isdefined(level.var_1940f14e))
		{
			level.var_1940f14e hide();
		}
		deposithub.baseeffect delete();
	}
}

/*
	Name: function_e3e1cf54
	Namespace: clean
	Checksum: 0x567C3603
	Offset: 0x2D48
	Size: 0xA2
	Parameters: 1
	Flags: None
*/
function function_e3e1cf54(var_696c0ca5)
{
	if(!isdefined(var_696c0ca5))
	{
		var_696c0ca5 = -1;
	}
	switch(level.cleandepositrotation)
	{
		case 0:
		{
			return (var_696c0ca5 + 1) % level.cleandeposithubs.size;
		}
		case 1:
		{
			return function_579aa766(var_696c0ca5, &registerexert_immolation_control);
		}
	}
	return registerexert_immolation_control(var_696c0ca5);
}

/*
	Name: function_579aa766
	Namespace: clean
	Checksum: 0x58B065CD
	Offset: 0x2DF8
	Size: 0x2E
	Parameters: 2
	Flags: None
*/
function function_579aa766(var_696c0ca5, var_c1e8a2b7)
{
	if(var_696c0ca5 < 0)
	{
		return 0;
	}
	return [[var_c1e8a2b7]](var_696c0ca5);
}

/*
	Name: registerexert_immolation_control
	Namespace: clean
	Checksum: 0x5D688471
	Offset: 0x2E30
	Size: 0x100
	Parameters: 1
	Flags: None
*/
function registerexert_immolation_control(var_696c0ca5)
{
	if(!isdefined(level.var_49aeba07))
	{
		level.var_49aeba07 = [];
	}
	if(level.var_49aeba07.size == 0)
	{
		for(i = 0; i < level.cleandeposithubs.size; i++)
		{
			if(i != var_696c0ca5)
			{
				level.var_49aeba07[level.var_49aeba07.size] = i;
			}
		}
		if(level.cleandeposithubs.size < 2)
		{
			return 0;
		}
	}
	var_8ae22528 = randomint(level.var_49aeba07.size);
	nextindex = level.var_49aeba07[var_8ae22528];
	arrayremoveindex(level.var_49aeba07, var_8ae22528);
	return nextindex;
}

/*
	Name: function_60c1a907
	Namespace: clean
	Checksum: 0x61F15E47
	Offset: 0x2F38
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function function_60c1a907(var_696c0ca5)
{
	if(var_696c0ca5 < 0)
	{
		return randomint(level.cleandeposithubs.size);
	}
	nextindex = randomint(level.cleandeposithubs.size - 1);
	if(nextindex >= var_696c0ca5)
	{
		nextindex++;
	}
	return nextindex;
}

/*
	Name: hidetimerdisplayongameend
	Namespace: clean
	Checksum: 0xE6F9AC5
	Offset: 0x2FB0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function hidetimerdisplayongameend()
{
	level waittill(#"game_ended");
	setmatchflag("bomb_timer_a", 0);
}

/*
	Name: function_c857e45f
	Namespace: clean
	Checksum: 0x5D29E85B
	Offset: 0x2FF0
	Size: 0x250
	Parameters: 0
	Flags: None
*/
function function_c857e45f()
{
	level endon(#"game_ended");
	while(true)
	{
		time = gettime();
		foreach(player in level.players)
		{
			if(isdefined(player.var_916cc864) && isdefined(player.var_91be2350) && player.var_91be2350 && (time - player.var_916cc864) > (int((((float(function_60d95f53()) / 1000) + 0.25) + 0.1) * 1000)))
			{
				enemyteam = util::getotherteam(player.team);
				if(player.var_91be2350 >= 10)
				{
					scoreevents::processscoreevent(#"clean_multi_deposit_big", player);
				}
				else if(player.var_91be2350 >= 5)
				{
					scoreevents::processscoreevent(#"clean_multi_deposit_normal", player);
				}
				player.var_91be2350 = 0;
			}
			if(isdefined(player.var_66521d81) && player.var_66521d81 < (gettime() - 1500))
			{
				if(player.var_3e52c359 >= 5)
				{
					scoreevents::processscoreevent(#"clean_multi_deny_tacos", player);
				}
				player.var_3e52c359 = 0;
				player.var_66521d81 = undefined;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_83e87bd5
	Namespace: clean
	Checksum: 0x3E0686AE
	Offset: 0x3248
	Size: 0x2FC
	Parameters: 1
	Flags: None
*/
function function_83e87bd5(player)
{
	time = gettime();
	player.var_916cc864 = time;
	if(isdefined(player.pers[#"cleandeposits"]))
	{
		player.pers[#"cleandeposits"] = player.pers[#"cleandeposits"] + 1;
		player.cleandeposits = player.pers[#"cleandeposits"];
		[[level.var_37d62931]](player, 1);
	}
	player stats::function_bb7eedf0(#"cleandeposits", 1);
	if(level.teamscorepercleandeposit > 0)
	{
		var_e5474cba = level.teamscorepercleandeposit;
		player globallogic_score::giveteamscoreforobjective(player.team, var_e5474cba);
	}
	switch(player.var_91be2350)
	{
		case 0:
		{
			player playsound("mpl_stockpile_deposit_1");
			break;
		}
		case 1:
		{
			player playsound("mpl_stockpile_deposit_2");
			break;
		}
		case 2:
		{
			player playsound("mpl_stockpile_deposit_3");
			break;
		}
		case 3:
		{
			player playsound("mpl_stockpile_deposit_4");
			break;
		}
		default:
		{
			player playsound("mpl_stockpile_deposit_5");
		}
	}
	player.var_91be2350++;
	if(is_true(level.var_c5e28dc5))
	{
		scoreevents::processscoreevent("shamrock_enemy_deposit", player);
	}
	else
	{
		scoreevents::processscoreevent("clean_enemy_deposit", player);
	}
	player.carriedtacos--;
	player clientfield::set_player_uimodel("hudItems.cleanCarryCount", player.carriedtacos);
	if(player.carriedtacos < 8)
	{
		player function_aea246ff();
	}
	player function_fccce038();
}

/*
	Name: function_1237ad98
	Namespace: clean
	Checksum: 0x98DBB925
	Offset: 0x3550
	Size: 0x88
	Parameters: 1
	Flags: None
*/
function function_1237ad98(player)
{
	if(player.carriedtacos <= 0)
	{
		objective_clearplayerusing(self.objectiveid, player);
		return 0;
	}
	if(!player.var_916cc864)
	{
		return 1;
	}
	return (player.var_916cc864 + (int(0.25 * 1000))) < gettime();
}

/*
	Name: function_95cbd646
	Namespace: clean
	Checksum: 0x8FE76200
	Offset: 0x35E0
	Size: 0x48C
	Parameters: 1
	Flags: None
*/
function function_95cbd646(player)
{
	if(self.victimteam == player.team)
	{
		player playsound("mpl_killconfirm_tags_pickup");
		if(isdefined(player.pers[#"cleandenies"]))
		{
			player.pers[#"cleandenies"] = player.pers[#"cleandenies"] + 1;
			player.cleandenies = player.pers[#"cleandenies"];
			[[level.var_37d62931]](player, 1);
		}
		player stats::function_bb7eedf0(#"cleandenies", 1);
		if(is_true(level.var_c5e28dc5))
		{
			if(self.victim === player)
			{
				scoreevents::processscoreevent("shamrock_own_collect", player);
			}
			else
			{
				scoreevents::processscoreevent("shamrock_friendly_collect", player);
			}
		}
		else
		{
			if(self.victim === player)
			{
				scoreevents::processscoreevent("clean_own_collect", player);
			}
			else
			{
				scoreevents::processscoreevent("clean_friendly_collect", player);
			}
		}
		player.var_66521d81 = gettime();
		player.var_3e52c359++;
	}
	else
	{
		if(player.carriedtacos >= 10)
		{
			time = gettime();
			if(time - player.var_129c990c > 500)
			{
				player playlocalsound("mpl_fracture_enemy_pickup_nope");
				if(!isdefined(player.var_49f1d9cc))
				{
					player.var_49f1d9cc = 0;
				}
				player clientfield::set_player_uimodel("hudItems.cleanCarryFull", player.var_49f1d9cc);
				player.var_49f1d9cc = (player.var_49f1d9cc ? 1 : 0);
			}
			player.var_129c990c = time;
			return;
		}
		player.carriedtacos++;
		player clientfield::set_player_uimodel("hudItems.cleanCarryCount", player.carriedtacos);
		player function_fccce038();
		if(player.carriedtacos < 4)
		{
			player playsound("mpl_killconfirm_tags_pickup");
		}
		else
		{
			if(player.carriedtacos < 7)
			{
				player playsound("mpl_killconfirm_tags_pickup");
			}
			else
			{
				player playsound("mpl_killconfirm_tags_pickup");
			}
		}
		if(player.carriedtacos >= 8)
		{
			player function_3fdaa652();
		}
		if(is_true(level.var_c5e28dc5))
		{
			scoreevents::processscoreevent("shamrock_enemy_collect", player);
		}
		else
		{
			scoreevents::processscoreevent("clean_enemy_collect", player);
		}
		if(self.attackerteam == player.team && isdefined(self.attacker) && self.attacker != player)
		{
			if(is_true(level.var_c5e28dc5))
			{
				scoreevents::processscoreevent("shamrock_assist_collect", self.attacker);
			}
			else
			{
				scoreevents::processscoreevent("clean_assist_collect", self.attacker);
			}
		}
	}
	self registermp_multi_kill_medals_interface();
}

/*
	Name: function_bbcf6af
	Namespace: clean
	Checksum: 0xEAAAAC91
	Offset: 0x3A78
	Size: 0x164
	Parameters: 2
	Flags: None
*/
function function_bbcf6af(attacker, yawangle)
{
	dropcount = self.carriedtacos;
	self.carriedtacos = 0;
	self clientfield::set_player_uimodel("hudItems.cleanCarryCount", self.carriedtacos);
	self function_fccce038();
	/#
		dropcount = dropcount + getdvarint(#"extratacos", 0);
	#/
	var_8a33c2ea = 360 / (dropcount + 1);
	for(i = 0; i < dropcount; i++)
	{
		taco = function_b25ab1e7();
		if(!isdefined(taco))
		{
			return;
		}
		yawangle = yawangle + var_8a33c2ea;
		randomyaw = 0.8 * var_8a33c2ea;
		randomyaw = randomfloatrange(randomyaw * -1, randomyaw);
		taco function_903c4eff(self, attacker, undefined, yawangle + randomyaw);
	}
}

/*
	Name: function_3fdaa652
	Namespace: clean
	Checksum: 0x31ED4477
	Offset: 0x3BE8
	Size: 0x82
	Parameters: 0
	Flags: None
*/
function function_3fdaa652()
{
	if(!isdefined(self.var_227573ea))
	{
		self.var_227573ea = 0;
	}
	if(is_true(level.var_2179a6bf))
	{
		return;
	}
	if(!is_true(self.var_227573ea))
	{
		self thread globallogic_audio::function_c246758e("taco_music");
		self.var_227573ea = 1;
	}
}

/*
	Name: function_aea246ff
	Namespace: clean
	Checksum: 0xAA171E54
	Offset: 0x3C78
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function function_aea246ff()
{
	if(!isdefined(self.var_227573ea))
	{
		self.var_227573ea = 0;
	}
	if(is_true(level.var_2179a6bf))
	{
		return;
	}
	if(is_true(self.var_227573ea))
	{
		self thread globallogic_audio::function_c246758e("none");
		self.var_227573ea = 0;
	}
}

