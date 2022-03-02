#using script_18f0d22c75b141a7;
#using script_1cc417743d7c262d;
#using script_256b8879317373de;
#using script_29ed825598140ca0;
#using script_2c49ae69cd8ce30c;
#using script_335d0650ed05d36d;
#using script_3fda550bc6e1089a;
#using script_47fb62300ac0bd60;
#using script_57c900a7e39234be;
#using script_68d2ee1489345a1d;
#using script_788472602edbe3b9;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\mp_common\draft.gsc;
#using scripts\mp_common\gametypes\gametype.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\laststand.gsc;
#using scripts\mp_common\perks.gsc;
#using scripts\mp_common\util.gsc;

#namespace vip;

/*
	Name: main
	Namespace: vip
	Checksum: 0x2F6382B
	Offset: 0x5D0
	Size: 0x5AC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	globallogic::init();
	util::registerscorelimit(0, 500);
	level.var_f5a73a96 = 1;
	level.var_60507c71 = 1;
	level.takelivesondeath = 1;
	level.var_4348a050 = 1;
	level.endgameonscorelimit = 0;
	level.scoreroundwinbased = 1;
	level.var_e7b05b51 = 0;
	level.var_bc4f0fc1 = 1;
	level.laststandhealth = getgametypesetting(#"laststandhealth");
	level.laststandtimer = getgametypesetting(#"laststandtimer");
	level.var_c2eba59b = getgametypesetting(#"capturetime");
	level.timepauseswheninzone = getgametypesetting(#"timepauseswheninzone");
	level.decayprogress = (isdefined(getgametypesetting(#"decayprogress")) ? getgametypesetting(#"decayprogress") : 0);
	level.autodecaytime = (isdefined(getgametypesetting(#"autodecaytime")) ? getgametypesetting(#"autodecaytime") : undefined);
	level.var_34f3236a = int((200 * (isdefined(getgametypesetting(#"hash_c9f2bb603f195b5")) ? getgametypesetting(#"hash_c9f2bb603f195b5") : 1)) + 0.5);
	level.var_43c00bc2 = int((150 * (isdefined(getgametypesetting(#"hash_2f20d4c9b96c51a2")) ? getgametypesetting(#"hash_2f20d4c9b96c51a2") : 1)) + 0.5);
	level.onstartgametype = &onstartgametype;
	level.onspawnplayer = &onspawnplayer;
	level.var_f6d301b = &function_f6d301b;
	level.onroundswitch = &onroundswitch;
	level.ondeadevent = &ondeadevent;
	level.ononeleftevent = &ononeleftevent;
	level.ontimelimit = &globallogic::function_61e80d63;
	level.var_f7b64ada = &function_f7b64ada;
	level.can_revive = &canrevive;
	level.var_1a0c2b72 = &function_1a0c2b72;
	level.onplayerdamage = &onplayerdamage;
	player::function_cf3aa03d(&onplayerkilled);
	callback::on_connect(&onconnect);
	callback::on_disconnect(&ondisconnect);
	callback::on_spawned(&function_590c4630);
	callback::function_98a0917d(&function_98a0917d);
	spawning::addsupportedspawnpointtype("vip");
	namespace_674e6435::function_367cfa1b(&function_95002a59);
	namespace_674e6435::function_eb8c0e47(&function_114f1da7);
	level.var_34842a14 = 1;
	level.var_ce802423 = 1;
	clientfield::function_5b7d846d("hudItems.war.attackingTeam", 1, 2, "int");
	clientfield::register("allplayers", "vip_keyline", 1, 1, "int");
	clientfield::register("toplayer", "vip_ascend_postfx", 1, 1, "int");
	/#
		function_2085db3b();
	#/
}

/*
	Name: onstartgametype
	Namespace: vip
	Checksum: 0x9E153242
	Offset: 0xB88
	Size: 0x1B4
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	level.alwaysusestartspawns = 1;
	level.var_351a1439 = [];
	foreach(team, _ in level.teams)
	{
		level.var_a236b703[team] = 1;
		level.var_61952d8b[team] = 1;
	}
	level thread function_8cac4c76();
	level thread set_ui_team();
	if(level.scoreroundwinbased)
	{
		[[level._setteamscore]](#"allies", game.stat[#"roundswon"][#"allies"]);
		[[level._setteamscore]](#"axis", game.stat[#"roundswon"][#"axis"]);
	}
	function_5bc7928d();
	namespace_674e6435::function_414115a0(level.laststandtimer, level.laststandhealth);
}

/*
	Name: function_98a0917d
	Namespace: vip
	Checksum: 0x48587BF5
	Offset: 0xD48
	Size: 0x138
	Parameters: 0
	Flags: None
*/
function function_98a0917d()
{
	function_83eb584e();
	if(!isdefined(level.vip))
	{
		function_36f8016e(game.defenders, 6);
		return;
	}
	level.var_576e41c3 = function_9c92aa49();
	thread globallogic_audio::function_6fbfba95("vip_low", 3);
	if(1)
	{
		foreach(var_8e875f24 in level.var_576e41c3)
		{
			if(isdefined(var_8e875f24.var_6728673))
			{
				var_8e875f24 thread function_3bdfa078();
				continue;
			}
			var_8e875f24 thread function_106733b6();
		}
	}
}

/*
	Name: function_36f8016e
	Namespace: vip
	Checksum: 0x169EB86
	Offset: 0xE88
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function function_36f8016e(winning_team, var_c1e98979)
{
	function_f86e4f6e();
	round::function_d1e740f6(winning_team);
	thread globallogic::function_a3e3bd39(winning_team, var_c1e98979);
}

/*
	Name: function_f6d301b
	Namespace: vip
	Checksum: 0x7C90D8D
	Offset: 0xEE8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_f6d301b(var_c1e98979)
{
	if(isdefined(level.vip))
	{
		level.vip clientfield::set("vip_keyline", 0);
	}
}

/*
	Name: onroundswitch
	Namespace: vip
	Checksum: 0x80EDD7E5
	Offset: 0xF30
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function onroundswitch()
{
	var_35ee5a5a = level.vip;
	if(isdefined(var_35ee5a5a))
	{
		var_35ee5a5a function_3e035a80();
		var_35ee5a5a function_ba08018d();
		var_35ee5a5a.var_6b4e7428 = 0;
		var_35ee5a5a draft::select_character(var_35ee5a5a.pers[#"hash_629f4666af73d943"], 1);
		var_35ee5a5a.var_e8c7d324 = undefined;
		if(1)
		{
			var_35ee5a5a function_44d63ecd(1, 0);
		}
	}
	gametype::on_round_switch();
}

/*
	Name: onspawnplayer
	Namespace: vip
	Checksum: 0x12891EF2
	Offset: 0x1010
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function onspawnplayer(predictedspawn)
{
	spawning::onspawnplayer(predictedspawn);
}

/*
	Name: function_590c4630
	Namespace: vip
	Checksum: 0xF13195DC
	Offset: 0x1040
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function function_590c4630()
{
	var_59fb30b2 = self.pers[#"hash_629f4666af73d943"];
	current_role = self getspecialistindex();
	if(!isdefined(var_59fb30b2) || current_role != level.var_a9bb8bf)
	{
		self.pers[#"hash_629f4666af73d943"] = current_role;
		self.var_89eab96d = 1;
	}
}

/*
	Name: onconnect
	Namespace: vip
	Checksum: 0x6220B1C3
	Offset: 0x10E0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function onconnect()
{
	if(!isdefined(self.pers[#"hash_5d729fc6e71ec2fc"]))
	{
		self.pers[#"hash_5d729fc6e71ec2fc"] = 0;
	}
}

/*
	Name: ondisconnect
	Namespace: vip
	Checksum: 0x7046C030
	Offset: 0x1128
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function ondisconnect()
{
	if(level.gameended)
	{
		return;
	}
	if(isdefined(level.vip) && level.vip == self)
	{
		/#
			assert(self.team == game.attackers);
		#/
		function_36f8016e(game.defenders, 11);
	}
	else
	{
		numplayers = countplayers(self.team);
		if(numplayers <= 1)
		{
			if(self.team == game.defenders)
			{
				function_36f8016e(game.attackers, 6);
			}
		}
	}
}

/*
	Name: onplayerdamage
	Namespace: vip
	Checksum: 0x3EC63A18
	Offset: 0x1220
	Size: 0x1AC
	Parameters: 10
	Flags: None
*/
function onplayerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(self === level.vip && isdefined(psoffsettime) && isplayer(psoffsettime) && psoffsettime != self && psoffsettime.team != self.team)
	{
		playerid = psoffsettime getentitynumber();
		level.var_351a1439[playerid] = gettime();
		if(function_8c4b101f(self.team).size > 1 && level.var_e30cf18f < gettime())
		{
			thread globallogic_audio::function_b4319f8e("vipAttackersVIPUnderFireTeam", self.team, self, "vipAttackersVIPUnderFireTeam");
			self thread globallogic_audio::leader_dialog_on_player("vipAttackersVIPUnderFireVIP", "vipAttackersVIPUnderFireVIP");
			level.var_e30cf18f = gettime() + 5000;
			if(self.laststand === 1)
			{
				level.var_e30cf18f = level.var_e30cf18f + 30000;
			}
		}
	}
}

/*
	Name: onplayerkilled
	Namespace: vip
	Checksum: 0x8C907921
	Offset: 0x13D8
	Size: 0x464
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(isdefined(self) && isdefined(psoffsettime) && isplayer(psoffsettime) && psoffsettime != self && psoffsettime.team != self.team && !psoffsettime namespace_674e6435::is_cheating())
	{
		var_ff9338bb = (level.playercount[self.team] * level.numlives) - level.deaths[self.team];
		if(var_ff9338bb === 0)
		{
			psoffsettime stats::function_dad108fa(#"hash_f7fc3ff160a3ac5", 1);
		}
		if(self === level.vip)
		{
			scoreevents::processscoreevent(#"hash_4865adbd99d59a08", psoffsettime, self, deathanimduration);
			psoffsettime stats::function_cc215323(#"hash_8bdbd052bdb213", 1);
			psoffsettime.pers[#"objectives"]++;
			psoffsettime.objectives = psoffsettime.pers[#"objectives"];
			psoffsettime globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
			psoffsettime.pers[#"objectiveekia"]++;
			psoffsettime.objectiveekia = psoffsettime.pers[#"objectiveekia"];
		}
		else
		{
			scoreevents::processscoreevent(#"eliminated_enemy", psoffsettime, self, deathanimduration);
			id = self getentitynumber();
			var_fc3bc855 = level.var_351a1439[id];
			if(isdefined(var_fc3bc855) && isdefined(level.vip) && isalive(level.vip) && psoffsettime != level.vip && psoffsettime.team === level.vip.team)
			{
				elapsedtime = gettime() - var_fc3bc855;
				if(elapsedtime < int(5 * 1000))
				{
					scoreevents::processscoreevent(#"hash_d188ac13cbd4780", psoffsettime, self);
				}
			}
		}
	}
	if(isdefined(level.vip) && level.vip == self)
	{
		/#
			assert(self.team == game.attackers);
		#/
		if(game.stat[#"teamscores"][game.defenders] != (level.roundwinlimit - 1))
		{
			thread globallogic_audio::function_b4319f8e("vipAttackersVIPKilled", self.team, self, "vipAttackersVIPKilled");
			thread globallogic_audio::leader_dialog("vipDefendersKilledVIP", util::getotherteam(self.team), "vipDefendersKilledVIP");
		}
		function_36f8016e(game.defenders, 11);
	}
}

/*
	Name: ondeadevent
	Namespace: vip
	Checksum: 0xAB5C7449
	Offset: 0x1848
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function ondeadevent(team)
{
	if(team == game.defenders)
	{
		function_36f8016e(game.attackers, 6);
	}
}

/*
	Name: function_31d859f2
	Namespace: vip
	Checksum: 0xB65A045C
	Offset: 0x1890
	Size: 0x18E
	Parameters: 0
	Flags: Private
*/
function private function_31d859f2()
{
	if(isdefined(level.var_f559e810))
	{
		return level.var_f559e810;
	}
	if(!isdefined(game.var_88f04ad4))
	{
		var_83387087 = struct::get_array("vip_exfil_site", "targetname");
		if(var_83387087.size == 0)
		{
			var_83387087[0] = {};
			var_83387087[0].origin = level.mapcenter;
			var_83387087[0].angles = (0, 0, 0);
		}
		game.var_88f04ad4 = array::randomize(var_83387087);
	}
	var_b181c82d = [];
	index = (int(game.roundsplayed / 2)) % game.var_88f04ad4.size;
	var_417bd4fd = game.var_88f04ad4[index];
	var_b181c82d[var_b181c82d.size] = var_417bd4fd;
	while(isdefined(var_417bd4fd.target))
	{
		target = struct::get(var_417bd4fd.target);
		var_b181c82d[var_b181c82d.size] = target;
		var_417bd4fd = target;
	}
	level.var_f559e810 = var_b181c82d;
	return level.var_f559e810;
}

/*
	Name: function_9c92aa49
	Namespace: vip
	Checksum: 0x1E0ED0BA
	Offset: 0x1A28
	Size: 0xCE
	Parameters: 0
	Flags: None
*/
function function_9c92aa49()
{
	level.var_c2648a8e = 0;
	var_7ea33249 = [];
	var_b181c82d = function_31d859f2();
	for(i = 0; i < var_b181c82d.size; i++)
	{
		objectivename = (i == 1 ? #"vip_exfil_b" : #"hash_4d535c16887e2feb");
		var_8e875f24 = function_89d3faf4(var_b181c82d[i], objectivename);
		var_7ea33249[var_7ea33249.size] = var_8e875f24;
	}
	return var_7ea33249;
}

/*
	Name: function_89d3faf4
	Namespace: vip
	Checksum: 0xBD739A0
	Offset: 0x1B00
	Size: 0x3AE
	Parameters: 2
	Flags: None
*/
function function_89d3faf4(var_f4a4fc64, objectivename)
{
	origin = var_f4a4fc64.origin;
	angles = var_f4a4fc64.angles;
	triggerorigin = origin + (0, 0, 1);
	if(1)
	{
		trigger = spawn("trigger_radius_use", triggerorigin, 0, 80, 100);
		trigger setinvisibletoall();
		trigger setcursorhint("HINT_NOICON");
		trigger sethintstring(#"hash_1ed278859e55fb7b");
		trigger function_268e4500();
	}
	else
	{
		trigger = spawn("trigger_radius", triggerorigin, 0, 90, 100);
	}
	trigger triggerignoreteam();
	trigger function_682f34cf(-800);
	trigger usetriggerignoreuseholdtime();
	var_8e875f24 = gameobjects::create_use_object(game.defenders, trigger, [], (0, 0, 0), objectivename, 1);
	var_8e875f24 gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	var_8e875f24 gameobjects::allow_use(#"hash_161f03feaadc9b8f");
	var_8e875f24 gameobjects::set_use_time(level.var_c2eba59b);
	var_8e875f24 gameobjects::set_key_object(level.var_785c66f4);
	var_8e875f24 gameobjects::set_onbeginuse_event(&onbeginuse);
	var_8e875f24 gameobjects::set_onenduse_event(&onenduse);
	var_8e875f24 gameobjects::set_onuse_event(&function_bf315481);
	var_8e875f24 gameobjects::function_1b4d64d8(1);
	var_8e875f24.origin = origin;
	var_8e875f24.angles = angles;
	if(1)
	{
		var_8e875f24 function_ca777d9a();
		var_8e875f24.useweapon = getweapon(#"hash_52ea38778c7d2fb3");
		var_8e875f24.var_dddda5d8 = 1;
		var_8e875f24.dontlinkplayertotrigger = 1;
		var_8e875f24 gameobjects::function_8f776dd0(1);
		if(isdefined(var_f4a4fc64.target))
		{
			var_8e875f24.var_6728673 = getvehiclenode(var_f4a4fc64.target, "targetname");
		}
	}
	else
	{
		var_8e875f24 function_4e1f3901(origin);
	}
	var_8e875f24.decayprogress = level.decayprogress;
	var_8e875f24.autodecaytime = level.autodecaytime;
	var_8e875f24.cancontestclaim = 0;
	return var_8e875f24;
}

/*
	Name: function_f86e4f6e
	Namespace: vip
	Checksum: 0x1DB1CFEB
	Offset: 0x1EB8
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_f86e4f6e()
{
	if(isdefined(level.var_576e41c3))
	{
		foreach(var_2bf427c1 in level.var_576e41c3)
		{
			var_2bf427c1 gameobjects::set_visible(#"hash_161f03feaadc9b8f");
			var_2bf427c1 gameobjects::allow_use(#"hash_161f03feaadc9b8f");
		}
	}
}

/*
	Name: onbeginuse
	Namespace: vip
	Checksum: 0x81FF87BF
	Offset: 0x1F88
	Size: 0x3F4
	Parameters: 1
	Flags: None
*/
function onbeginuse(player)
{
	if(!isdefined(player))
	{
		return;
	}
	player.var_e6c45375 = 1;
	player setclientuivisibilityflag("weapon_hud_visible", 0);
	self.trigger sethintstring("");
	pause_time();
	if(!isdefined(level.var_a5030fa0))
	{
		level.var_a5030fa0 = spawn("script_model", player.origin);
	}
	playerangles = player getplayerangles();
	level.var_a5030fa0 dontinterpolate();
	level.var_a5030fa0.origin = player.origin;
	level.var_a5030fa0.angles = playerangles;
	player playerlinkto(level.var_a5030fa0, undefined, 0, 0, 0, 0, 0);
	player function_66f3a713();
	var_a35cd71 = min(-14, playerangles[0]);
	lookat = (isdefined(self.helicopter.rope) ? self.helicopter.rope gettagorigin("carabiner_jnt") : self.origin);
	goalyaw = vectortoyaw(lookat - player getplayercamerapos());
	var_8eef4f81 = absangleclamp180(playerangles[0] - var_a35cd71);
	var_9756b1d4 = absangleclamp180(playerangles[1] - goalyaw);
	var_f4f58cca = 0.25;
	var_bd70ec3f = 0.75;
	var_d9a208ec = math::clamp(max(var_8eef4f81, var_9756b1d4) / 180, 0, 1);
	var_7e42472f = var_f4f58cca + (var_d9a208ec * (var_bd70ec3f - var_f4f58cca));
	level.var_a5030fa0 rotateto((var_a35cd71, goalyaw, 0), var_7e42472f, var_7e42472f * 0.25, var_7e42472f * 0.25);
	thread globallogic_audio::function_6fbfba95("vip_high", 0.25);
	if(0)
	{
		thread globallogic_audio::function_b4319f8e("vipAttackersExfilStartTeam", player.team, player, "vipAttackersExfilStartTeam");
		player thread globallogic_audio::leader_dialog_on_player("vipAttackersExfilStartVIP", "vipAttackersExfilStartVIP");
		var_e7a10ea = (self.var_f23c87bd == "vip_exfil_b" ? "vipDefendersExfilStartB" : "vipDefendersExfilStartA");
		thread globallogic_audio::leader_dialog(var_e7a10ea, util::getotherteam(player.team), var_e7a10ea);
	}
}

/*
	Name: onenduse
	Namespace: vip
	Checksum: 0x932F6AAF
	Offset: 0x2388
	Size: 0x176
	Parameters: 3
	Flags: None
*/
function onenduse(team, player, success)
{
	if(isdefined(player))
	{
		player.var_e6c45375 = 0;
		player setclientuivisibilityflag("weapon_hud_visible", 1);
	}
	self.trigger sethintstring(#"hash_1ed278859e55fb7b");
	if(!success)
	{
		if(isdefined(player) && player getcurrentweapon() === self.useweapon)
		{
			if(!player isinexecutionvictim())
			{
				player resetanimations();
			}
			player takeweapon(self.useweapon);
		}
		thread globallogic_audio::function_6fbfba95("vip_mid");
		resume_time();
	}
	if(isdefined(level.var_a5030fa0))
	{
		if(isdefined(player))
		{
			player unlink();
		}
		if(success)
		{
			level.var_a5030fa0 deletedelay();
			level.var_a5030fa0 = undefined;
		}
	}
}

/*
	Name: function_bf315481
	Namespace: vip
	Checksum: 0xF35EE1FF
	Offset: 0x2508
	Size: 0x2B4
	Parameters: 1
	Flags: None
*/
function function_bf315481(player)
{
	if(!isdefined(player))
	{
		return;
	}
	if(game.state != #"playing")
	{
		return;
	}
	var_8e875f24 = self;
	scoreevents::processscoreevent(#"hash_4c886461e6f6d07", player);
	player.pers[#"objectives"]++;
	player.objectives = player.pers[#"objectives"];
	player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
	player.pers[#"captures"]++;
	player.captures = player.pers[#"captures"];
	level thread popups::displayteammessagetoall(#"hash_27440000eb57819f", player);
	team = player getteam();
	if(isdefined(team) && function_a1ef346b(team).size === 1)
	{
		otherteam = util::getotherteam(team);
		if(function_a1ef346b(otherteam).size > 0)
		{
			player stats::function_dad108fa(#"hash_55f8a59c6d7132a8", 1);
		}
	}
	thread globallogic_audio::function_b4319f8e("vipAttackersExfilCompleteTeam", player.team, player, "vipAttackersExfilCompleteTeam");
	player thread globallogic_audio::leader_dialog_on_player("vipAttackersExfilCompleteVIP", "vipAttackersExfilCompleteVIP");
	thread globallogic_audio::leader_dialog("vipDefendersExfilComplete", util::getotherteam(player.team), "vipDefendersExfilComplete");
	function_f86e4f6e();
	var_8e875f24 notify(#"hash_21fb1bf7c34422cd");
	if(0)
	{
		function_36f8016e(game.attackers, 12);
	}
}

/*
	Name: function_4e1f3901
	Namespace: vip
	Checksum: 0x2E838300
	Offset: 0x27C8
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_4e1f3901(origin)
{
	var_8e875f24 = self;
	var_8e875f24 function_97427754();
	fwd = (0, 0, 1);
	right = (0, -1, 0);
	var_8e875f24.fx = spawnfx("ui/fx_dom_marker_team_r90", origin, fwd, right);
	var_8e875f24.fx.team = #"none";
	triggerfx(var_8e875f24.fx, 0.001);
}

/*
	Name: function_97427754
	Namespace: vip
	Checksum: 0x496462DC
	Offset: 0x2888
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_97427754()
{
	var_8e875f24 = self;
	if(isdefined(var_8e875f24.fx))
	{
		var_8e875f24.fx delete();
	}
}

/*
	Name: function_ca777d9a
	Namespace: vip
	Checksum: 0xF3C5F16F
	Offset: 0x28D0
	Size: 0x164
	Parameters: 0
	Flags: Private
*/
function private function_ca777d9a()
{
	fx = spawn("script_model", self.origin);
	fx setmodel(#"wpn_t9_eqp_smoke_grenade_world");
	playfx(#"hash_6c0862bb0e561d0d", fx.origin);
	playfx(#"hash_39f9530da901280", fx.origin);
	fx playsound(#"hash_7e287e6b6da3c9cd");
	fx.sndent = spawn("script_origin", fx.origin);
	fx.sndent linkto(fx);
	fx.sndent playloopsound(#"hash_686d0823355faccd");
	self.var_13c60627 = fx;
	/#
		self thread function_78ae3a87(fx);
	#/
	/#
		self thread function_436dbdd3();
	#/
}

/*
	Name: function_dbd23466
	Namespace: vip
	Checksum: 0x2573E0DA
	Offset: 0x2A40
	Size: 0x36
	Parameters: 0
	Flags: Private
*/
function private function_dbd23466()
{
	if(isdefined(self.var_13c60627))
	{
		self.var_13c60627 notify(#"hash_2af1d6496a54489f");
		self.var_13c60627 = undefined;
	}
}

/*
	Name: function_5bc7928d
	Namespace: vip
	Checksum: 0x437C074C
	Offset: 0x2A80
	Size: 0xC6
	Parameters: 0
	Flags: Private
*/
function private function_5bc7928d()
{
	var_44dd7e5d = #"hash_1d827850f422986b";
	playerroletemplatecount = getplayerroletemplatecount(currentsessionmode());
	for(i = 0; i < playerroletemplatecount; i++)
	{
		var_3c6fd4f7 = function_b14806c6(i, currentsessionmode());
		if(var_3c6fd4f7 == var_44dd7e5d)
		{
			level.var_a9bb8bf = i;
			return;
		}
	}
	level.vip = undefined;
}

/*
	Name: function_83eb584e
	Namespace: vip
	Checksum: 0x8E866B0B
	Offset: 0x2B50
	Size: 0x4D4
	Parameters: 0
	Flags: Private
*/
function private function_83eb584e()
{
	level endon(#"game_ended");
	attempts = 0;
	while(!isdefined(level.vip) && attempts < 20)
	{
		attackingteam = game.attackers;
		var_43741520 = getplayers(attackingteam);
		var_6a44aacb = [];
		foreach(player in var_43741520)
		{
			if(player.var_89eab96d === 1)
			{
				var_6a44aacb[var_6a44aacb.size] = player;
			}
		}
		if(var_6a44aacb.size <= 0)
		{
			attempts++;
			waitframe(1);
			continue;
		}
		var_e52acd04 = 2147483647;
		foreach(player in var_6a44aacb)
		{
			if(player.pers[#"hash_5d729fc6e71ec2fc"] < var_e52acd04)
			{
				var_e52acd04 = player.pers[#"hash_5d729fc6e71ec2fc"];
			}
		}
		max_score = 0;
		foreach(player in var_6a44aacb)
		{
			if(player.pers[#"hash_5d729fc6e71ec2fc"] == var_e52acd04 && player.pers[#"score"] > max_score)
			{
				max_score = player.pers[#"score"];
			}
		}
		var_6329e8ff = [];
		foreach(player in var_6a44aacb)
		{
			if(player.pers[#"hash_5d729fc6e71ec2fc"] == var_e52acd04 && player.pers[#"score"] == max_score)
			{
				var_6329e8ff[var_6329e8ff.size] = player;
			}
		}
		var_daecd5d7 = randomintrange(0, var_6329e8ff.size);
		vip = var_6329e8ff[var_daecd5d7];
		vip.pers[#"hash_5d729fc6e71ec2fc"]++;
		vip draft::select_character(level.var_a9bb8bf, 1);
		vip.var_6b4e7428 = 1;
		vip.var_db459f8d = 1;
		vip.var_179765d7 = 1;
		vip draft::function_2427a351();
		vip setmovespeedscale(1);
		vip.var_e8c7d324 = 1;
		waitframe(1);
		if(!isdefined(vip))
		{
			attempts++;
			continue;
		}
		level.vip = vip;
		function_a5c3a276();
		function_1189df03();
		level.vip clientfield::set("vip_keyline", 1);
		level.var_e30cf18f = 0;
	}
}

/*
	Name: function_a5c3a276
	Namespace: vip
	Checksum: 0xE05760F9
	Offset: 0x3030
	Size: 0x244
	Parameters: 0
	Flags: None
*/
function function_a5c3a276()
{
	vip = level.vip;
	/#
		assert(isdefined(vip));
	#/
	vip reset_player();
	bundle = getscriptbundle("mp_vip_loadouts");
	/#
		/#
			assert(isdefined(bundle));
		#/
	#/
	loadout = bundle.defaultloadouts[0];
	primary = loadout.primary;
	var_6834562f = loadout.var_6834562f;
	secondary = loadout.secondary;
	var_90030ba7 = loadout.var_90030ba7;
	primarygrenade = loadout.primarygrenade;
	var_db7ff8ba = loadout.var_1c89585f === 1;
	secondarygrenade = loadout.secondarygrenade;
	var_7bf99497 = loadout.var_285151c1 === 1;
	specialgrenade = loadout.specialgrenade;
	talents = loadout.talents;
	scorestreak = bundle.killstreaks[0];
	vip function_3d8678e3(talents);
	vip function_95ab03ff(primary, var_6834562f, secondary, var_90030ba7, primarygrenade, var_db7ff8ba, secondarygrenade, var_7bf99497, specialgrenade);
	vip function_55acf845(scorestreak);
	vip function_a9e5d783();
	if(1)
	{
		vip function_4d534334();
	}
	vip loadout::function_6573eeeb();
}

/*
	Name: reset_player
	Namespace: vip
	Checksum: 0x3826C441
	Offset: 0x3280
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function reset_player()
{
	self takeallweapons();
	self.specialty = [];
	self notify(#"give_map");
}

/*
	Name: function_3d8678e3
	Namespace: vip
	Checksum: 0x158B944A
	Offset: 0x32C0
	Size: 0x1AC
	Parameters: 1
	Flags: None
*/
function function_3d8678e3(talents)
{
	self function_e6f9e3cd();
	self clearperks();
	foreach(talent in talents)
	{
		self function_b5feff95(talent.talent + level.game_mode_suffix);
	}
	self function_b5feff95(#"hash_25c2dcf9ec4c42e2");
	perks = self getloadoutperks(0);
	foreach(perk in perks)
	{
		self setperk(perk);
	}
	self thread perks::monitorgpsjammer();
}

/*
	Name: function_95ab03ff
	Namespace: vip
	Checksum: 0x9B1F0F18
	Offset: 0x3478
	Size: 0x75C
	Parameters: 9
	Flags: None
*/
function function_95ab03ff(primary, var_6834562f, secondary, var_90030ba7, primarygrenade, var_db7ff8ba, secondarygrenade, var_7bf99497, specialgrenade)
{
	if(isdefined(primary))
	{
		attachments = undefined;
		if(isdefined(var_6834562f))
		{
			attachments = [];
			foreach(attachment in var_6834562f)
			{
				attachments[attachments.size] = attachment.attachment;
			}
		}
		primaryweapon = getweapon(primary, attachments);
		self giveweapon(primaryweapon);
		if(0)
		{
			self givestartammo(primaryweapon);
		}
		else
		{
			self setweaponammostock(primaryweapon, 4 * self function_b7f1fd2c(primaryweapon));
		}
		self setblockweaponpickup(primaryweapon, 1);
		self switchtoweapon(primaryweapon, 1);
		self loadout::function_442539("primary", primaryweapon);
	}
	else
	{
		var_43d69af6 = getweapon(#"bare_hands");
		self giveweapon(var_43d69af6);
		self setweaponammoclip(var_43d69af6, 0);
		self setblockweaponpickup(var_43d69af6, 1);
		self loadout::function_442539("primary", var_43d69af6);
	}
	if(isdefined(secondary))
	{
		attachments = undefined;
		if(isdefined(var_90030ba7))
		{
			attachments = [];
			foreach(attachment in var_90030ba7)
			{
				attachments[attachments.size] = attachment.attachment;
			}
		}
		secondaryweapon = getweapon(secondary, attachments);
		self giveweapon(secondaryweapon);
		self givestartammo(secondaryweapon);
		self setblockweaponpickup(secondaryweapon, 1);
		self loadout::function_442539("secondary", secondaryweapon);
		if(!isdefined(primary))
		{
			self switchtoweapon(secondaryweapon, 1);
		}
	}
	else
	{
		var_b5867a38 = getweapon(#"bare_hands");
		self giveweapon(var_b5867a38);
		self setweaponammoclip(var_b5867a38, 0);
		self setblockweaponpickup(var_b5867a38, 1);
		self loadout::function_442539("secondary", var_b5867a38);
	}
	if(isdefined(primarygrenade))
	{
		var_8e797a67 = getweapon(primarygrenade);
		self giveweapon(var_8e797a67);
		self setblockweaponpickup(var_8e797a67, 1);
		var_4e6e2c39 = self function_b7f1fd2c(var_8e797a67);
		if(var_db7ff8ba)
		{
			var_4e6e2c39++;
		}
		self setweaponammoclip(var_8e797a67, var_4e6e2c39);
		self loadout::function_442539("primarygrenade", var_8e797a67);
	}
	if(isdefined(secondarygrenade))
	{
		var_a66b455e = getweapon(secondarygrenade);
		self giveweapon(var_a66b455e);
		self setblockweaponpickup(var_a66b455e, 1);
		var_7173f066 = self function_b7f1fd2c(var_a66b455e);
		if(var_7bf99497)
		{
			var_7173f066++;
		}
		self setweaponammoclip(var_a66b455e, var_7173f066);
		self loadout::function_442539("secondarygrenade", var_a66b455e);
	}
	else
	{
		var_b1336578 = getweapon(#"null_offhand_secondary");
		self giveweapon(var_b1336578);
		self setblockweaponpickup(var_b1336578, 1);
		self loadout::function_442539("secondarygrenade", var_b1336578);
	}
	if(isdefined(specialgrenade))
	{
		var_8b0bfce9 = getweapon(specialgrenade);
		self thread function_fa62642c(var_8b0bfce9, 1);
	}
	else
	{
		var_ad731691 = getweapon(#"null_offhand_secondary");
		self giveweapon(var_ad731691);
		self setblockweaponpickup(var_ad731691, 1);
		self loadout::function_442539("specialgrenade", var_ad731691);
	}
}

/*
	Name: function_fa62642c
	Namespace: vip
	Checksum: 0x888E696C
	Offset: 0x3BE0
	Size: 0x1B4
	Parameters: 2
	Flags: None
*/
function function_fa62642c(var_8b0bfce9, var_5c25da5)
{
	self.var_cefe369d = self.pers[#"fieldupgrades"][#"ammo"];
	self.var_bb8ead86 = self.pers[#"fieldupgrades"][#"hash_67e7b008344d0e5e"];
	self.var_67db95b2 = self.pers[#"fieldupgrades"][#"hash_3e6d442adf0713fc"];
	self function_1025145d();
	self giveweapon(var_8b0bfce9);
	self setblockweaponpickup(var_8b0bfce9, 1);
	self loadout::function_442539("specialgrenade", var_8b0bfce9);
	waitframe(1);
	if(game.state == #"playing" && isalive(self) && self hasweapon(var_8b0bfce9))
	{
		self.pers[#"fieldupgrades"][#"ammo"] = var_5c25da5;
		self setweaponammoclip(var_8b0bfce9, var_5c25da5);
	}
}

/*
	Name: function_1025145d
	Namespace: vip
	Checksum: 0x8E713427
	Offset: 0x3DA0
	Size: 0x8E
	Parameters: 0
	Flags: None
*/
function function_1025145d()
{
	self.pers[#"fieldupgrades"][#"ammo"] = 0;
	self.pers[#"fieldupgrades"][#"hash_67e7b008344d0e5e"] = 0;
	self.pers[#"fieldupgrades"][#"hash_3e6d442adf0713fc"] = undefined;
	self notify(#"hash_50ce27022d3b38c");
}

/*
	Name: function_ba08018d
	Namespace: vip
	Checksum: 0xF6F5F2AA
	Offset: 0x3E38
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function function_ba08018d()
{
	self.pers[#"fieldupgrades"][#"ammo"] = self.var_cefe369d;
	self.pers[#"fieldupgrades"][#"hash_67e7b008344d0e5e"] = self.var_bb8ead86;
	self.pers[#"fieldupgrades"][#"hash_3e6d442adf0713fc"] = self.var_67db95b2;
}

/*
	Name: function_a9e5d783
	Namespace: vip
	Checksum: 0x1E78E7E8
	Offset: 0x3ED8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_a9e5d783()
{
	var_6a9f86b9 = level.var_34f3236a - self.health;
	self.maxhealth = level.var_34f3236a;
	self.health = level.var_34f3236a;
	self.var_894f7879[#"vip"] = var_6a9f86b9;
	self player::function_9080887a();
}

/*
	Name: function_4d534334
	Namespace: vip
	Checksum: 0xB7B0CD1D
	Offset: 0x3F60
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_4d534334()
{
	self armor::set_armor(level.var_43c00bc2, level.var_43c00bc2, 0, 0, 1, 1, 5, 1, 1, 1);
}

/*
	Name: function_55acf845
	Namespace: vip
	Checksum: 0x7D21A9E6
	Offset: 0x3FD0
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_55acf845(scorestreak)
{
	self loadout::function_8881abec();
	if(!isdefined(scorestreak))
	{
		return;
	}
	scorestreakweapon = killstreaks::get_killstreak_weapon(scorestreak.killstreak);
	self giveweapon(scorestreakweapon);
	self setweaponammoclip(scorestreakweapon, 1);
	self function_d9b9c4c6(0, scorestreakweapon);
	var_87b53013 = scorestreak.killstreak;
	self luinotifyevent(#"killstreak_received", 3, level.killstreakindices[var_87b53013], "", 0);
	self function_8ba40d2f(#"killstreak_received", 3, level.killstreakindices[var_87b53013], "", 0);
	self function_8ba40d2f(#"hash_6a9cb800ad0ef395", 2, self.clientid, 0);
	self thread function_bfb231fc();
}

/*
	Name: function_bfb231fc
	Namespace: vip
	Checksum: 0xE1D7834B
	Offset: 0x4150
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_bfb231fc()
{
	self endon(#"death", #"disconnect");
	self waittill(#"killstreak_used");
	self function_3e035a80();
}

/*
	Name: function_3e035a80
	Namespace: vip
	Checksum: 0x17F0AF81
	Offset: 0x41A8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_3e035a80()
{
	if(!isdefined(self))
	{
		return;
	}
	self function_b181bcbd(0);
}

/*
	Name: function_1189df03
	Namespace: vip
	Checksum: 0xC68AEE94
	Offset: 0x41D8
	Size: 0x138
	Parameters: 0
	Flags: None
*/
function function_1189df03()
{
	trigger = spawn("trigger_radius_use", level.vip.origin);
	visuals = [];
	var_785c66f4 = gameobjects::create_carry_object(game.attackers, trigger, visuals, (0, 0, 0), #"hash_526a94759b3b92b2");
	var_785c66f4 gameobjects::allow_carry(#"hash_150a20fa4efc5c7a");
	var_785c66f4 gameobjects::set_visible(#"hash_150a20fa4efc5c7a");
	var_785c66f4 gameobjects::set_use_time(0);
	var_785c66f4 gameobjects::function_b03b5362(1);
	var_785c66f4.allowweapons = 1;
	var_785c66f4 gameobjects::set_picked_up(level.vip);
	var_785c66f4.var_45d1d94d = 1;
	level.var_785c66f4 = var_785c66f4;
}

/*
	Name: function_95002a59
	Namespace: vip
	Checksum: 0x71A77642
	Offset: 0x4318
	Size: 0x164
	Parameters: 5
	Flags: Private
*/
function private function_95002a59(attacker, victim, inflictor, weapon, meansofdeath)
{
	self thread function_419acee4();
	if(weapon == self)
	{
		return;
	}
	if(isdefined(weapon))
	{
		weapon.pers[#"downs"] = (isdefined(weapon.pers[#"downs"]) ? weapon.pers[#"downs"] : 0) + 1;
		weapon.downs = weapon.pers[#"downs"];
		if(isplayer(weapon) && util::function_fbce7263(weapon.team, self.team) && !weapon namespace_674e6435::is_cheating())
		{
			if(self === level.vip)
			{
				scoreevents::processscoreevent(#"hash_4b450c958dfde514", weapon, self, meansofdeath);
			}
		}
	}
}

/*
	Name: function_f7b64ada
	Namespace: vip
	Checksum: 0x337C45E8
	Offset: 0x4488
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_f7b64ada()
{
	self thread function_f7ef4642();
}

/*
	Name: function_f7ef4642
	Namespace: vip
	Checksum: 0xC491FC1E
	Offset: 0x44B0
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private function_f7ef4642()
{
	waitframe(1);
	if(isdefined(self) && isalive(self))
	{
		level thread popups::displayteammessagetoteam(#"hash_4c00723b3ca546b3", self, self.team, undefined, undefined);
	}
}

/*
	Name: canrevive
	Namespace: vip
	Checksum: 0x6212DF0C
	Offset: 0x4510
	Size: 0x18
	Parameters: 1
	Flags: Private
*/
function private canrevive(revivee)
{
	return self.var_e6c45375 !== 1;
}

/*
	Name: function_114f1da7
	Namespace: vip
	Checksum: 0xF07821F9
	Offset: 0x4530
	Size: 0xF0
	Parameters: 2
	Flags: Private
*/
function private function_114f1da7(revivee, reviver)
{
	reviver.pers[#"revives"] = (isdefined(reviver.pers[#"revives"]) ? reviver.pers[#"revives"] : 0) + 1;
	reviver.revives = reviver.pers[#"revives"];
	if(!reviver namespace_674e6435::is_cheating())
	{
		if(revivee === level.vip)
		{
			scoreevents::processscoreevent(#"hash_23a7b975b43b2594", reviver, revivee);
		}
	}
	revivee notify(#"revived");
}

/*
	Name: function_1a0c2b72
	Namespace: vip
	Checksum: 0x67859EE6
	Offset: 0x4628
	Size: 0x6C
	Parameters: 1
	Flags: Private
*/
function private function_1a0c2b72(revivedplayer)
{
	if(isdefined(self) && isalive(self) && isdefined(revivedplayer))
	{
		level thread popups::displayteammessagetoteam(#"hash_460df7841bd7ec0c", self, self.team, undefined, revivedplayer.entnum);
	}
}

/*
	Name: function_419acee4
	Namespace: vip
	Checksum: 0x10AB5127
	Offset: 0x46A0
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function function_419acee4()
{
	self endon(#"death", #"revived");
	for(;;)
	{
		if(self function_cf8de58d())
		{
			self namespace_674e6435::bleed_out();
			return;
		}
		waitframe(1);
	}
}

/*
	Name: ononeleftevent
	Namespace: vip
	Checksum: 0x4070FA6E
	Offset: 0x4708
	Size: 0x19C
	Parameters: 1
	Flags: None
*/
function ononeleftevent(team)
{
	if(!isalive(level.vip))
	{
		return;
	}
	if(!isdefined(level.warnedlastplayer))
	{
		level.warnedlastplayer = [];
	}
	if(isdefined(level.warnedlastplayer[team]))
	{
		return;
	}
	level.warnedlastplayer[team] = 1;
	players = level.players;
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == team && isdefined(player.pers[#"class"]))
		{
			if(player.sessionstate == "playing" && !player.afk)
			{
				break;
			}
		}
	}
	if(i == players.size)
	{
		return;
	}
	players[i] thread givelastattackerwarning(team);
	util::function_a3f7de13(17, player.team, player getentitynumber());
}

/*
	Name: givelastattackerwarning
	Namespace: vip
	Checksum: 0x564BDC94
	Offset: 0x48B0
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function givelastattackerwarning(team)
{
	self endon(#"death", #"disconnect");
	fullhealthtime = 0;
	interval = 0.05;
	self.lastmansd = 1;
	enemyteam = game.defenders;
	if(team == enemyteam)
	{
		enemyteam = game.attackers;
	}
	if(function_a1ef346b(enemyteam).size > 2)
	{
		self.var_66cfa07f = 1;
	}
	while(true)
	{
		if(self.health != self.maxhealth)
		{
			fullhealthtime = 0;
		}
		else
		{
			fullhealthtime = fullhealthtime + interval;
		}
		wait(interval);
		if(self.health == self.maxhealth && fullhealthtime >= 3)
		{
			break;
		}
	}
	self thread globallogic_audio::leader_dialog_on_player("roundEncourageLastPlayer", "roundEncourageLastPlayer");
	thread globallogic_audio::leader_dialog_for_other_teams("roundEncourageLastPlayerEnemy", self.team, "roundEncourageLastPlayerEnemy");
	self playlocalsound(#"mus_last_stand");
}

/*
	Name: function_8cac4c76
	Namespace: vip
	Checksum: 0x1EE636BF
	Offset: 0x4A40
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_8cac4c76()
{
	waitframe(1);
	clientfield::set_world_uimodel("hudItems.team1.noRespawnsLeft", 1);
	clientfield::set_world_uimodel("hudItems.team2.noRespawnsLeft", 1);
}

/*
	Name: set_ui_team
	Namespace: vip
	Checksum: 0xE2D7873B
	Offset: 0x4A90
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private set_ui_team()
{
	wait(0.05);
	if(game.attackers == #"allies")
	{
		clientfield::set_world_uimodel("hudItems.war.attackingTeam", 1);
	}
	else
	{
		clientfield::set_world_uimodel("hudItems.war.attackingTeam", 2);
	}
}

/*
	Name: function_106733b6
	Namespace: vip
	Checksum: 0x3A004CBD
	Offset: 0x4B00
	Size: 0x4AC
	Parameters: 0
	Flags: Private
*/
function private function_106733b6()
{
	level endon(#"game_ended");
	origin = self.origin;
	angles = self.angles;
	/#
		assert(isdefined(origin) && isdefined(angles));
	#/
	var_8e875f24 = self;
	wait(0);
	destination = getstartorigin(origin, angles, #"ai_swat_rifle_ent_litlbird_rappel_stn_vehicle2");
	destination = (destination[0], destination[1], destination[2] - 75);
	var_6aa266d6 = helicopter::getvalidrandomstartnode(destination).origin;
	helicopter = function_9bbc1c91(var_6aa266d6, vectortoangles(destination - var_6aa266d6));
	var_8e875f24.helicopter = helicopter;
	function_3eef60e4(helicopter);
	helicopter thread function_b2b03432(helicopter, destination);
	helicopter waittill(#"reached_destination");
	helicopter thread function_77192ec(helicopter, destination);
	helicopter waittill(#"hash_2dc51722de7dcdb5");
	helicopter function_5187ec98();
	helicopter thread function_5b606db8(helicopter);
	level.var_c2648a8e++;
	if(level.var_c2648a8e === level.var_576e41c3.size)
	{
		level notify(#"hash_4ca4b50f818377c4");
	}
	else
	{
		level waittill(#"hash_4ca4b50f818377c4");
	}
	if(-1)
	{
		activation_trigger = spawn("trigger_radius", var_8e875f24.origin, 0, 400, 100);
		activation_trigger setinvisibletoall();
		activation_trigger setvisibletoplayer(level.vip);
		activation_trigger waittill(#"trigger");
		thread globallogic_audio::function_b4319f8e("vipAttackersExfilStartTeam", level.vip.team, level.vip, "vipAttackersExfilStartTeam");
		level.vip thread globallogic_audio::leader_dialog_on_player("vipAttackersExfilStartVIP", "vipAttackersExfilStartVIP");
		var_e7a10ea = (self.var_f23c87bd == "vip_exfil_b" ? "vipDefendersExfilStartB" : "vipDefendersExfilStartA");
		thread globallogic_audio::leader_dialog(var_e7a10ea, util::getotherteam(level.vip.team), var_e7a10ea);
	}
	helicopter thread function_7082507b(helicopter);
	helicopter waittill(#"hash_13b3aacf002f7c8f");
	var_8e875f24.trigger setvisibletoplayer(level.vip);
	var_8e875f24 gameobjects::allow_use(#"hash_33c49a99551acae7");
	var_8e875f24 waittill(#"hash_21fb1bf7c34422cd");
	if(!isdefined(level.vip) || !isalive(level.vip))
	{
		return;
	}
	var_8e875f24 thread function_93ef48b(level.vip, helicopter);
	helicopter waittill(#"hash_371e4087fcc0efc2");
	helicopter thread function_498839(helicopter);
	function_36f8016e(game.attackers, 12);
}

/*
	Name: function_3bdfa078
	Namespace: vip
	Checksum: 0x52174F63
	Offset: 0x4FB8
	Size: 0x404
	Parameters: 0
	Flags: Private
*/
function private function_3bdfa078()
{
	level endon(#"game_ended");
	startnode = self.var_6728673;
	/#
		assert(isdefined(startnode));
	#/
	var_8e875f24 = self;
	wait(0);
	helicopter = function_9bbc1c91(startnode.origin, startnode.angles);
	var_8e875f24.helicopter = helicopter;
	function_3eef60e4(helicopter);
	/#
		helicopter thread function_c22381ff();
	#/
	/#
		helicopter thread function_f773d8e2();
	#/
	helicopter thread vehicle::get_on_and_go_path(startnode);
	helicopter waittill(#"hash_328e87d565302040");
	helicopter function_5187ec98();
	level.var_c2648a8e++;
	if(level.var_c2648a8e === level.var_576e41c3.size)
	{
		level notify(#"hash_4ca4b50f818377c4");
	}
	else
	{
		level waittill(#"hash_4ca4b50f818377c4");
	}
	if(-1)
	{
		activation_trigger = spawn("trigger_radius", var_8e875f24.origin, 0, 400, 100);
		activation_trigger setinvisibletoall();
		activation_trigger setvisibletoplayer(level.vip);
		activation_trigger waittill(#"trigger");
		thread globallogic_audio::function_b4319f8e("vipAttackersExfilStartTeam", level.vip.team, level.vip, "vipAttackersExfilStartTeam");
		level.vip thread globallogic_audio::leader_dialog_on_player("vipAttackersExfilStartVIP", "vipAttackersExfilStartVIP");
		var_e7a10ea = (self.var_f23c87bd == "vip_exfil_b" ? "vipDefendersExfilStartB" : "vipDefendersExfilStartA");
		thread globallogic_audio::leader_dialog(var_e7a10ea, util::getotherteam(level.vip.team), var_e7a10ea);
		thread globallogic_audio::function_6fbfba95("vip_mid");
	}
	helicopter thread function_7082507b(helicopter);
	helicopter waittill(#"hash_13b3aacf002f7c8f");
	var_8e875f24.trigger setvisibletoplayer(level.vip);
	var_8e875f24 gameobjects::allow_use(#"hash_33c49a99551acae7");
	var_8e875f24 waittill(#"hash_21fb1bf7c34422cd");
	if(!isdefined(level.vip) || !isalive(level.vip))
	{
		return;
	}
	var_8e875f24 thread function_93ef48b(level.vip, helicopter);
	helicopter waittill(#"hash_371e4087fcc0efc2");
	function_36f8016e(game.attackers, 12);
}

/*
	Name: function_9bbc1c91
	Namespace: vip
	Checksum: 0x2754F7A
	Offset: 0x53C8
	Size: 0x150
	Parameters: 2
	Flags: Private
*/
function private function_9bbc1c91(origin, angles)
{
	helicopter = spawnvehicle(#"hash_58cc8ce25d32031f", origin, angles, "vip_exfil_site_helicopter");
	helicopter setdrawinfrared(1);
	helicopter.soundmod = "heli";
	helicopter.takedamage = 0;
	helicopter.drivepath = 1;
	var_9a1bcc5b = 200;
	helicopter setneargoalnotifydist(var_9a1bcc5b);
	if(target_istarget(helicopter))
	{
		target_remove(helicopter);
	}
	helicopter setrotorspeed(1);
	level thread helicopter::function_eca18f00(helicopter, #"hash_7d4a23989da5398c");
	level thread function_1c85a66(helicopter);
	return helicopter;
}

/*
	Name: function_1c85a66
	Namespace: vip
	Checksum: 0xE1A4ACB5
	Offset: 0x5520
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function function_1c85a66(helicopter)
{
	helicopter endon(#"death");
	helicopter.var_2dd14343 = util::spawn_anim_model(#"hash_71aea3bbaef3e00c", helicopter.origin);
	helicopter.var_2dd14343 endon(#"death");
	if(isdefined(helicopter.var_2dd14343))
	{
		helicopter.var_2dd14343 useanimtree("all_player");
		var_88f9d3ba = spawn("script_model", helicopter.origin);
		var_88f9d3ba linkto(helicopter);
		helicopter.var_2dd14343 linkto(var_88f9d3ba);
		var_a3476af7 = helicopter gettagorigin("tag_passenger3");
		var_eb72be15 = helicopter gettagangles("tag_passenger3");
		helicopter.var_2dd14343 thread animation::play(#"hash_445ae049e19a8062", var_a3476af7, var_eb72be15, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
	}
}

/*
	Name: function_b2b03432
	Namespace: vip
	Checksum: 0xA09D69D1
	Offset: 0x56C0
	Size: 0x298
	Parameters: 2
	Flags: Private
*/
function private function_b2b03432(helicopter, destination)
{
	helicopter endon(#"death");
	var_7f4a508d = destination;
	if(is_true(level.var_e071ed64))
	{
		helicopter thread function_656691ab();
		if(!ispointinnavvolume(var_7f4a508d, "navvolume_big"))
		{
			var_a9a839e2 = getclosestpointonnavvolume(destination, "navvolume_big", 10000);
			var_7f4a508d = (var_a9a839e2[0], var_a9a839e2[1], destination[2]);
			if(isdefined(var_7f4a508d))
			{
				helicopter function_9ffc1856(var_7f4a508d, 1);
				helicopter.var_7f4a508d = var_7f4a508d;
				if(!ispointinnavvolume(var_7f4a508d, "navvolume_big"))
				{
					self waittilltimeout(10, #"hash_340ab3c2b94ff86a");
				}
			}
		}
		helicopter function_9ffc1856(var_7f4a508d, 1);
		helicopter waittill(#"near_goal");
	}
	else
	{
		helicopter thread airsupport::setgoalposition(destination, "exfil_site_heli_reached", 1);
		helicopter waittill(#"exfil_site_heli_reached");
	}
	last_distance_from_goal_squared = sqr(9999999);
	continue_waiting = 1;
	for(remaining_tries = 30; continue_waiting && remaining_tries > 0; remaining_tries--)
	{
		current_distance_from_goal_squared = distance2dsquared(helicopter.origin, destination);
		continue_waiting = current_distance_from_goal_squared < last_distance_from_goal_squared && current_distance_from_goal_squared > sqr(4);
		last_distance_from_goal_squared = current_distance_from_goal_squared;
		if(continue_waiting)
		{
			waitframe(1);
		}
	}
	helicopter notify(#"reached_destination");
}

/*
	Name: function_77192ec
	Namespace: vip
	Checksum: 0x8E7A2284
	Offset: 0x5960
	Size: 0x220
	Parameters: 2
	Flags: None
*/
function function_77192ec(helicopter, destination)
{
	helicopter endon(#"death", #"hash_362285e59eb2f9e4");
	var_f1705e15 = spawn("script_model", helicopter.origin);
	var_f1705e15.angles = helicopter.angles;
	helicopter linkto(var_f1705e15);
	helicopter.var_f1705e15 = var_f1705e15;
	movetime = 0.5;
	var_f1705e15 rotateto((0, helicopter.angles[1], 0), movetime, 0.15, 0.15);
	var_f1705e15 moveto(destination, movetime, 0, 0);
	wait(movetime);
	var_3d6ff184 = helicopter.origin;
	var_736a6d8f = 10;
	var_4cc352d9 = 71;
	forward = anglestoforward(helicopter.angles);
	forward = (forward[0], forward[1], 0);
	var_3d6ff184 = var_3d6ff184 + (forward * var_736a6d8f);
	right = anglestoright(helicopter.angles);
	right = (right[0], right[1], 0);
	var_3d6ff184 = var_3d6ff184 + (right * var_4cc352d9);
	var_f1705e15 moveto(var_3d6ff184, movetime, 0, 0.2);
	wait(movetime);
	helicopter notify(#"hash_2dc51722de7dcdb5");
}

/*
	Name: function_5b606db8
	Namespace: vip
	Checksum: 0x8F4E7B69
	Offset: 0x5B88
	Size: 0x138
	Parameters: 1
	Flags: Private
*/
function private function_5b606db8(helicopter)
{
	helicopter endon(#"death", #"hash_362285e59eb2f9e4");
	var_f1705e15 = helicopter.var_f1705e15;
	var_f1705e15 endon(#"death");
	if(!isdefined(var_f1705e15))
	{
		return;
	}
	toppos = var_f1705e15.origin;
	bottompos = var_f1705e15.origin - vectorscale((0, 0, 1), 8);
	movetime = 2;
	while(true)
	{
		var_f1705e15 moveto(bottompos, movetime, 0.15, 0.15);
		var_f1705e15 waittill(#"movedone");
		var_f1705e15 moveto(toppos, movetime, 0.15, 0.15);
		var_f1705e15 waittill(#"movedone");
	}
}

/*
	Name: function_3eef60e4
	Namespace: vip
	Checksum: 0xFDF7E711
	Offset: 0x5CC8
	Size: 0x114
	Parameters: 1
	Flags: Private
*/
function private function_3eef60e4(helicopter)
{
	/#
		assert(!isdefined(helicopter.rope));
	#/
	helicopter.rope = spawn("script_model", helicopter.origin);
	/#
		assert(isdefined(helicopter.rope));
	#/
	helicopter.rope useanimtree("generic");
	helicopter.rope setmodel(#"p9_fxanim_gp_vehicle_heli_lrg_vip_rope_mod");
	helicopter.rope notsolid();
	helicopter.rope linkto(helicopter, "tag_origin_animate");
	helicopter.rope hide();
}

/*
	Name: function_7082507b
	Namespace: vip
	Checksum: 0x5834C0BD
	Offset: 0x5DE8
	Size: 0x14C
	Parameters: 1
	Flags: Private
*/
function private function_7082507b(helicopter)
{
	/#
		assert(isdefined(helicopter.rope));
	#/
	helicopter endon(#"death", #"hash_4c9df8896f727a2e");
	helicopter.rope endon(#"death");
	helicopter.rope show();
	anim = #"hash_2216bcebd33b5779";
	if(-1)
	{
		var_2e2c7ee7 = getanimlength(anim) / 10;
	}
	else
	{
		var_2e2c7ee7 = 1;
	}
	helicopter.rope animation::play(anim, helicopter, "tag_origin_animate", var_2e2c7ee7, 0.2, 0.1, undefined, undefined, undefined, 0);
	helicopter notify(#"hash_13b3aacf002f7c8f");
	thread function_89baf3(helicopter);
}

/*
	Name: function_89baf3
	Namespace: vip
	Checksum: 0x66FE2A75
	Offset: 0x5F40
	Size: 0x88
	Parameters: 1
	Flags: Private
*/
function private function_89baf3(helicopter)
{
	/#
		assert(isdefined(helicopter.rope));
	#/
	while(true)
	{
		helicopter.rope animation::play(#"hash_79f7c6405bc5958e", helicopter, "tag_origin_animate", 1, 0.1, 0.1, undefined, undefined, undefined, 0);
	}
}

/*
	Name: function_ce44e2a8
	Namespace: vip
	Checksum: 0x7516E507
	Offset: 0x5FD0
	Size: 0xDC
	Parameters: 1
	Flags: Private
*/
function private function_ce44e2a8(helicopter)
{
	if(!isdefined(helicopter.rope))
	{
		return;
	}
	helicopter endon(#"death");
	helicopter.rope endon(#"death");
	helicopter notify(#"hash_4c9df8896f727a2e");
	var_2e2c7ee7 = 0.5;
	helicopter.rope animation::play(#"hash_3f5deb4729726f2c", helicopter, "tag_origin_animate", var_2e2c7ee7, 0.2, 0.1, undefined, undefined, undefined, 0);
	function_1d3cfe48(helicopter);
}

/*
	Name: function_1d3cfe48
	Namespace: vip
	Checksum: 0x7AA5F17C
	Offset: 0x60B8
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private function_1d3cfe48(helicopter)
{
	helicopter endon(#"death");
	if(isdefined(helicopter.rope))
	{
		helicopter.rope delete();
	}
}

/*
	Name: function_93ef48b
	Namespace: vip
	Checksum: 0xC5EA66F
	Offset: 0x6110
	Size: 0x6D8
	Parameters: 2
	Flags: None
*/
function function_93ef48b(vip, helicopter)
{
	if(!isdefined(vip) || !isalive(vip) || !isdefined(helicopter) || !isdefined(self))
	{
		return;
	}
	helicopter endon(#"death");
	vip endon(#"death", #"disconnect");
	vip setclientuivisibilityflag("hud_visible", 0);
	vip dontinterpolate();
	vip disableweaponfire();
	vip enableinvulnerability();
	vip freezecontrols(1);
	vip function_8a945c0e(0);
	vip function_8b8a321a(0);
	vip disableexecutionattack();
	vip disableexecutionvictim();
	vip.oobdisabled = 1;
	var_867f5d0 = spawn("script_model", vip.origin);
	var_867f5d0.angles = vip getplayerangles();
	var_867f5d0 dontinterpolate();
	vip playerlinkto(var_867f5d0, undefined, 0, 0, 0, 0, 0);
	var_2bf4050a = 0.6;
	var_d892ba80 = helicopter.rope gettagorigin("carabiner_jnt");
	var_de324c05 = 12;
	var_867f5d0 function_3b897a2(vip, var_d892ba80, var_de324c05, var_2bf4050a);
	waittillframeend();
	if(!isdefined(vip) || !isalive(vip) || !isdefined(var_867f5d0))
	{
		return;
	}
	helicopter thread function_ce44e2a8(helicopter);
	var_ba5977f4 = 40;
	var_a080de98 = helicopter gettagorigin("tag_enter_passenger1")[2] - var_ba5977f4;
	vip clientfield::set_to_player("vip_ascend_postfx", 1);
	var_867f5d0.angles = vip getplayerangles();
	goalyaw = helicopter.angles[1] - 90;
	var_867f5d0 thread function_d914539a(goalyaw);
	vip function_44d63ecd(0, 1.9);
	while(isdefined(var_867f5d0) && isalive(vip) && var_867f5d0.origin[2] < var_a080de98 && isdefined(helicopter.rope))
	{
		var_443bf2ea = vip gettagorigin("j_spineupper");
		var_70f8d8e1 = vip.origin - (var_443bf2ea + (var_de324c05 * anglestoforward(vip.angles)));
		var_867f5d0.origin = helicopter.rope gettagorigin("carabiner_jnt") + var_70f8d8e1;
		waitframe(1);
	}
	if(!isdefined(vip) || !isalive(vip) || !isdefined(var_867f5d0))
	{
		return;
	}
	vip unlink();
	var_867f5d0 delete();
	lerptime = 0.4;
	helicopter thread function_a34ad686();
	var_a3476af7 = helicopter gettagorigin("tag_passenger3");
	var_eb72be15 = helicopter gettagangles("tag_passenger3");
	helicopter thread function_c05c19ed();
	if(-1)
	{
		delay = math::clamp(4, 0, getanimlength(#"hash_56f45aa3dfb2cdf"));
		helicopter thread function_6f9743ac(delay);
	}
	vip startcameratween(lerptime, 0, 0);
	vip animation::play(#"hash_56f45aa3dfb2cdf", var_a3476af7, var_eb72be15, 1, 0.15, 0, lerptime, undefined, undefined, 0);
	waitframe(1);
	if(!isdefined(vip) || !isalive(vip))
	{
		return;
	}
	helicopter usevehicle(vip, 7);
	if(vip hasweapon(self.useweapon))
	{
		vip takeweapon(self.useweapon);
	}
	vip setlowready(1);
	helicopter notify(#"hash_371e4087fcc0efc2");
}

/*
	Name: function_d914539a
	Namespace: vip
	Checksum: 0xEC2467C2
	Offset: 0x67F0
	Size: 0x1AC
	Parameters: 1
	Flags: None
*/
function function_d914539a(goalyaw)
{
	self endon(#"death");
	var_ecaa456b = 1.9;
	var_9546359 = min(-75, self.angles[0]);
	var_64165cee = 0.6;
	var_44cf825 = math::clamp(var_64165cee / var_ecaa456b, 0, 1);
	var_bc4bc17d = anglelerp(self.angles[1], goalyaw, var_44cf825);
	var_fc27b3e3 = (var_9546359, var_bc4bc17d, 0);
	self rotateto(var_fc27b3e3, var_64165cee, 0.2, 0.1);
	wait(var_64165cee);
	if(!isdefined(self))
	{
		return;
	}
	var_3c4cc94a = -60;
	var_f0d8f62c = math::clamp(var_ecaa456b - var_64165cee, 0, var_ecaa456b);
	var_cbb558d8 = (var_3c4cc94a, goalyaw, 0);
	self rotateto(var_cbb558d8, var_f0d8f62c, 0, min(var_f0d8f62c, 0.5));
}

/*
	Name: function_3b897a2
	Namespace: vip
	Checksum: 0xC8D94B4
	Offset: 0x69A8
	Size: 0x156
	Parameters: 4
	Flags: None
*/
function function_3b897a2(vip, var_d892ba80, var_10890b28, movetime)
{
	self endon(#"death");
	vip endon(#"death", #"disconnect");
	endtime = gettime() + (int(movetime * 1000));
	while(isdefined(self) && isdefined(vip) && isalive(vip) && gettime() < endtime)
	{
		var_443bf2ea = vip gettagorigin("j_spineupper");
		var_70f8d8e1 = vip.origin - (var_443bf2ea + (var_10890b28 * anglestoforward(vip.angles)));
		goalpos = var_d892ba80 + var_70f8d8e1;
		self moveto(goalpos, movetime);
		waitframe(1);
	}
}

/*
	Name: function_c05c19ed
	Namespace: vip
	Checksum: 0x9F226E38
	Offset: 0x6B08
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_c05c19ed()
{
	var_2dd14343 = self.var_2dd14343;
	if(!isdefined(var_2dd14343))
	{
		return;
	}
	self endon(#"death");
	var_2dd14343 endon(#"death");
	var_2dd14343 animation::play(#"hash_18755f57707b62a4", self gettagorigin("tag_passenger3"), self gettagangles("tag_passenger3"), 1, 0.2, 0.1, undefined, undefined, undefined, 0);
	var_2dd14343 animation::play(#"hash_74a9c4a2475fa8f1", self gettagorigin("tag_passenger3"), self gettagangles("tag_passenger3"), 1, 0.2, 0.1, undefined, undefined, undefined, 0);
}

/*
	Name: function_a34ad686
	Namespace: vip
	Checksum: 0xC1DB944
	Offset: 0x6C38
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_a34ad686()
{
	self animation::play(#"hash_54933f08b311d2db", self, "tag_passenger3", 1, 0, 0, undefined, undefined, undefined, 0);
}

/*
	Name: function_6f9743ac
	Namespace: vip
	Checksum: 0x54FA7C98
	Offset: 0x6C80
	Size: 0x4E
	Parameters: 1
	Flags: None
*/
function function_6f9743ac(delay)
{
	self endon(#"death");
	level endon(#"game_ended");
	wait(delay);
	self notify(#"hash_371e4087fcc0efc2");
}

/*
	Name: function_498839
	Namespace: vip
	Checksum: 0xDFBCFF07
	Offset: 0x6CD8
	Size: 0x38E
	Parameters: 1
	Flags: None
*/
function function_498839(helicopter)
{
	helicopter notify(#"leaving");
	helicopter notify(#"hash_362285e59eb2f9e4");
	helicopter.leaving = 1;
	leavenode = helicopter::getvalidrandomleavenode(helicopter.origin);
	var_b4c35bb7 = leavenode.origin;
	heli_reset();
	helicopter vehclearlookat();
	exitangles = vectortoangles(var_b4c35bb7 - helicopter.origin);
	helicopter setgoalyaw(exitangles[1]);
	if(is_true(level.var_e071ed64))
	{
		if(!ispointinnavvolume(helicopter.origin, "navvolume_big"))
		{
			if(issentient(helicopter))
			{
				helicopter function_60d50ea4();
			}
			radius = distance(self.origin, leavenode.origin);
			var_a9a839e2 = getclosestpointonnavvolume(helicopter.origin, "navvolume_big", radius);
			if(isdefined(var_a9a839e2))
			{
				helicopter function_9ffc1856(var_a9a839e2, 0);
				while(true)
				{
					/#
						recordsphere(var_a9a839e2, 8, (0, 0, 1), "");
					#/
					var_baa92af9 = ispointinnavvolume(helicopter.origin, "navvolume_big");
					if(var_baa92af9 && !issentient(helicopter))
					{
						helicopter makesentient();
						break;
					}
					waitframe(1);
				}
			}
		}
		if(!ispointinnavvolume(leavenode.origin, "navvolume_big"))
		{
			helicopter thread function_8de67419(leavenode);
			helicopter waittill(#"hash_2bf34763927dd61b");
		}
	}
	helicopter function_9ffc1856(var_b4c35bb7, 1);
	helicopter waittilltimeout(20, #"near_goal", #"death");
	if(isdefined(helicopter))
	{
		helicopter stoploopsound(1);
		helicopter util::death_notify_wrapper();
		if(isdefined(helicopter.alarm_snd_ent))
		{
			helicopter.alarm_snd_ent stoploopsound();
			helicopter.alarm_snd_ent delete();
			helicopter.alarm_snd_ent = undefined;
		}
	}
}

/*
	Name: heli_reset
	Namespace: vip
	Checksum: 0x9CA10C46
	Offset: 0x7070
	Size: 0xB6
	Parameters: 0
	Flags: None
*/
function heli_reset()
{
	self cleartargetyaw();
	self cleargoalyaw();
	self setyawspeed(75, 45, 45);
	self setmaxpitchroll(30, 30);
	if(isdefined(self.var_f1705e15))
	{
		self unlink();
		self.var_f1705e15 delete();
		self.var_f1705e15 = undefined;
	}
}

/*
	Name: function_656691ab
	Namespace: vip
	Checksum: 0x612DA865
	Offset: 0x7130
	Size: 0xFC
	Parameters: 0
	Flags: Private
*/
function private function_656691ab()
{
	self endon(#"death");
	while(true)
	{
		var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
		if(var_baa92af9)
		{
			heli_reset();
			self makepathfinder();
			self makesentient();
			self.ignoreme = 1;
			if(isdefined(self.heligoalpos))
			{
				self function_9ffc1856(self.heligoalpos, 1);
			}
			self notify(#"hash_340ab3c2b94ff86a");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_8de67419
	Namespace: vip
	Checksum: 0x7D4F5E4D
	Offset: 0x7238
	Size: 0x166
	Parameters: 1
	Flags: Private
*/
function private function_8de67419(leavenode)
{
	self endon(#"death");
	radius = distance(self.origin, leavenode.origin);
	var_a9a839e2 = getclosestpointonnavvolume(leavenode.origin, "navvolume_big", radius);
	if(isdefined(var_a9a839e2))
	{
		self function_9ffc1856(var_a9a839e2, 0);
		while(true)
		{
			/#
				recordsphere(var_a9a839e2, 8, (0, 0, 1), "");
			#/
			var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
			if(!var_baa92af9)
			{
				self function_60d50ea4();
				self notify(#"hash_2bf34763927dd61b");
				break;
			}
			waitframe(1);
		}
	}
	else
	{
		self function_60d50ea4();
		self notify(#"hash_2bf34763927dd61b");
	}
}

/*
	Name: function_9ffc1856
	Namespace: vip
	Checksum: 0xEF7E2631
	Offset: 0x73A8
	Size: 0x114
	Parameters: 2
	Flags: None
*/
function function_9ffc1856(goalpos, stop)
{
	self.heligoalpos = goalpos;
	if(is_true(level.var_e071ed64))
	{
		if(issentient(self) && ispathfinder(self) && ispointinnavvolume(self.origin, "navvolume_big"))
		{
			self setgoal(goalpos, stop);
			self function_a57c34b7(goalpos, stop, 1);
		}
		else
		{
			self function_a57c34b7(goalpos, stop, 0);
		}
	}
	else
	{
		self setgoal(goalpos, stop);
	}
}

/*
	Name: function_5187ec98
	Namespace: vip
	Checksum: 0x7E77A203
	Offset: 0x74C8
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_5187ec98()
{
	self helicopter::create_flare_ent(vectorscale((0, 0, -1), 95));
	playfxontag(#"hash_3690812c1bb1b5d9", self.flare_ent, "tag_origin");
	self playsound(#"hash_5e070a23d3527269");
}

/*
	Name: pause_time
	Namespace: vip
	Checksum: 0xBD4735AE
	Offset: 0x7548
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function pause_time()
{
	if(level.timepauseswheninzone && !is_true(level.timerpaused))
	{
		globallogic_utils::pausetimer();
		level.timerpaused = 1;
	}
}

/*
	Name: resume_time
	Namespace: vip
	Checksum: 0x7730745A
	Offset: 0x75A8
	Size: 0x50
	Parameters: 0
	Flags: None
*/
function resume_time()
{
	if(level.timepauseswheninzone && is_true(level.timerpaused))
	{
		globallogic_utils::resumetimer();
		level.timerpaused = 0;
	}
}

/*
	Name: function_2085db3b
	Namespace: vip
	Checksum: 0xC8EF1FE6
	Offset: 0x7600
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_2085db3b()
{
	/#
		adddebugcommand("");
	#/
}

/*
	Name: function_78ae3a87
	Namespace: vip
	Checksum: 0xB31C84D4
	Offset: 0x7630
	Size: 0x150
	Parameters: 1
	Flags: None
*/
function function_78ae3a87(fx)
{
	/#
		self endon(#"death");
		while(getdvarint(#"hash_27392129ff420c70", 0))
		{
			waitframe(15);
			if(!isdefined(level.var_f5f2d350))
			{
				level.var_f5f2d350 = [];
			}
			if(!isdefined(level.var_f5f2d350))
			{
				level.var_f5f2d350 = [];
			}
			else if(!isarray(level.var_f5f2d350))
			{
				level.var_f5f2d350 = array(level.var_f5f2d350);
			}
			level.var_f5f2d350[level.var_f5f2d350.size] = fx;
			print3d(fx.origin, fx.origin, (1, 1, 0), 1, 1, 15);
			circle(fx.origin, 12, (1, 1, 0), 0, 1, 15);
		}
	#/
}

/*
	Name: function_c22381ff
	Namespace: vip
	Checksum: 0x27D67A37
	Offset: 0x7788
	Size: 0x220
	Parameters: 0
	Flags: None
*/
function function_c22381ff()
{
	/#
		self endon(#"death");
		while(getdvarint(#"hash_27392129ff420c70", 0))
		{
			waitframe(1);
			rope = self.rope;
			if(!isdefined(rope))
			{
				continue;
			}
			start = rope gettagorigin("");
			end = rope gettagorigin("");
			color = (0, 1, 0);
			trace = groundtrace(start, end + (vectorscale((0, 0, -1), 2048)), 0, self, 1, 1);
			origin = trace[#"position"];
			if(!isdefined(level.var_f5f2d350))
			{
				continue;
			}
			var_f5f2d350 = arraygetclosest(origin, level.var_f5f2d350);
			if(isdefined(var_f5f2d350) && distance2d(var_f5f2d350.origin, end) > 14)
			{
				color = (1, 0, 0);
			}
			sphere(origin, 1, (0, 1, 0), 1);
			print3d(origin + vectorscale((0, 0, 1), 24), origin, color);
			circle(origin, 80, color, 0, 1);
			line(start, end, (0, 1, 0));
		}
	#/
}

/*
	Name: function_436dbdd3
	Namespace: vip
	Checksum: 0xF63139B1
	Offset: 0x79B0
	Size: 0x238
	Parameters: 0
	Flags: None
*/
function function_436dbdd3()
{
	/#
		self endon(#"death");
		start = undefined;
		while(!isdefined(start) && getdvarint(#"hash_27392129ff420c70", 0))
		{
			waitframe(1);
			start = self.var_6728673;
		}
		next = start;
		exfil = undefined;
		end = start;
		while(isdefined(start) && isdefined(next.target) && getdvarint(#"hash_27392129ff420c70", 0))
		{
			waitframe(1);
			next = getvehiclenode(next.target, "");
			if(next.script_notify === "")
			{
				exfil = next;
			}
			if(!isdefined(next.target))
			{
				end = next;
				break;
			}
		}
		while(isdefined(start) && getdvarint(#"hash_27392129ff420c70", 0))
		{
			waitframe(15);
			sphere(start.origin, 64, (0, 1, 0), 1, 0, undefined, 15);
			sphere(end.origin, 64, (1, 1, 0), 1, 0, undefined, 15);
			line(start.origin, exfil.origin, (0, 1, 0), 1, 0, 15);
			line(exfil.origin, end.origin, (1, 1, 0), 1, 0, 15);
		}
	#/
}

/*
	Name: function_f773d8e2
	Namespace: vip
	Checksum: 0xA4D0D878
	Offset: 0x7BF0
	Size: 0xA8
	Parameters: 0
	Flags: None
*/
function function_f773d8e2()
{
	/#
		self endon(#"death");
		self.var_847cbbfe = gettime();
		self thread function_d6224950();
		while(getdvarint(#"hash_27392129ff420c70", 0))
		{
			waitframe(1);
			print3d(self.origin, float(self.var_80d36be2) / 1000, (0, 1, 0), 1, 3);
		}
	#/
}

/*
	Name: function_d6224950
	Namespace: vip
	Checksum: 0xDC3C8A04
	Offset: 0x7CA0
	Size: 0x76
	Parameters: 1
	Flags: None
*/
function function_d6224950(spawn)
{
	/#
		self endon(#"death", #"hash_328e87d565302040");
		while(getdvarint(#"hash_27392129ff420c70", 0))
		{
			waitframe(1);
			self.var_80d36be2 = gettime() - self.var_847cbbfe;
		}
	#/
}

