#using scripts\abilities\ability_util.gsc;
#using scripts\mp_common\perks.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\callbacks.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\overtime.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_defaults.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\gametype.gsc;
#using script_1435f3c9fc699e04;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\spawning_shared.gsc;
#using script_335d0650ed05d36d;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace gunfight;

/*
	Name: function_6afffeab
	Namespace: gunfight
	Checksum: 0x5FDD5F95
	Offset: 0x480
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6afffeab()
{
	level notify(-1966852946);
}

/*
	Name: main
	Namespace: gunfight
	Checksum: 0xF44A36DD
	Offset: 0x4A0
	Size: 0x528
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	globallogic::init();
	level.usingextratime = 0;
	level.extratime = getgametypesetting(#"extratime");
	level.var_4348a050 = 1;
	level.capturetime = getgametypesetting(#"capturetime");
	level.var_5ecd2f9f = getgametypesetting(#"hash_702ed0bd575e9bc5");
	level.var_a8194845 = getgametypesetting(#"hash_7816829666b7c099");
	level.var_60507c71 = 1;
	level.takelivesondeath = 1;
	level.var_f5a73a96 = 1;
	level.var_e7b05b51 = 0;
	level.onstartgametype = &onstartgametype;
	level.givecustomloadout = &givecustomloadout;
	level.onendround = &onendround;
	level.ononeleftevent = &ononeleftevent;
	level.ondeadevent = &ondeadevent;
	level.ontimelimit = &ontimelimit;
	level.gettimelimit = &gettimelimit;
	level.var_a8b23f5a = 1;
	level.var_3a701785 = 1;
	level.var_a4947666 = &function_dd683ab8;
	level.var_6561b05c = &function_21471f74;
	level.var_70cd9e95 = 1;
	level.var_1cc83170 = 10;
	level.var_537d4629 = 5;
	level.var_807b9ff6 = -1;
	clientfield::register("world", "activeTrigger", 1, 1, "int");
	clientfield::register("scriptmover", "scriptid", 1, 1, "int");
	clientfield::register("allplayers", "gunfight_pregame_rob", 9000, 1, "int");
	callback::on_game_playing(&function_5a3c682d);
	callback::on_connect(&onconnect);
	callback::on_spawned(&onspawned);
	callback::function_c11071a8(&function_86513cd0);
	player::function_cf3aa03d(&onplayerkilled);
	callback::on_disconnect(&ondisconnect);
	spawning::addsupportedspawnpointtype("tdm");
	spawning::function_32b97d1b(&spawning::function_90dee50d);
	spawning::function_adbbb58a(&spawning::function_c24e290c);
	if(!isdefined(game.var_96a8ff4a))
	{
		var_c9c35e60 = (isdefined(getgametypesetting(#"hash_3b05ecbff72f1065")) ? getgametypesetting(#"hash_3b05ecbff72f1065") : 0);
		var_92d79c8a = getscriptbundle("gunfightloadoutlist");
		var_fc96f513 = (isdefined(var_92d79c8a.var_d6f55369[var_c9c35e60].loadout) ? var_92d79c8a.var_d6f55369[var_c9c35e60].loadout : "mp_gunfight_loadout_default");
		var_cbf8cb48 = getscriptbundle(var_fc96f513);
		/#
			assert(isdefined(var_cbf8cb48));
		#/
		game.var_96a8ff4a = array::randomize(var_cbf8cb48.defaultloadouts);
		game.var_b6beb735 = 0;
	}
}

/*
	Name: onstartgametype
	Namespace: gunfight
	Checksum: 0xECA82867
	Offset: 0x9D0
	Size: 0x1BC
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	level.graceperiod = 3;
	if(level.var_a8194845 === 1)
	{
		foreach(team, _ in level.teams)
		{
			setteamspyplane(team, 1);
		}
	}
	if(!setupzones())
	{
		return;
	}
	if(!util::isfirstround())
	{
		music::setmusicstate("gunfight_roundstart");
	}
	function_8cac4c76();
	foreach(team, _ in level.teams)
	{
		level.var_a236b703[team] = 1;
		level.var_61952d8b[team] = 1;
	}
	luinotifyevent(#"round_start");
	/#
		self thread function_a481300e();
	#/
}

/*
	Name: function_8cac4c76
	Namespace: gunfight
	Checksum: 0x6B3DED3E
	Offset: 0xB98
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
	Name: function_5a3c682d
	Namespace: gunfight
	Checksum: 0xB10262DB
	Offset: 0xBE8
	Size: 0x1B8
	Parameters: 0
	Flags: None
*/
function function_5a3c682d()
{
	level.var_7928392e = 1;
	if(util::isfirstround())
	{
		music::setmusicstate("gunfight_firstspawn");
	}
	foreach(zone in level.zones)
	{
		if(isdefined(zone.gameobject) && isdefined(zone.gameobject.objectiveid))
		{
			zone.gameobject gameobjects::set_visible(#"hash_161f03feaadc9b8f");
			zone.gameobject gameobjects::set_model_visibility(0, 1);
		}
	}
	foreach(player in getplayers())
	{
		player clientfield::set("gunfight_pregame_rob", 0);
	}
}

/*
	Name: givecustomloadout
	Namespace: gunfight
	Checksum: 0xD24ECB5B
	Offset: 0xDA8
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function givecustomloadout()
{
	function_c3f7c761(game.var_96a8ff4a[game.var_b6beb735]);
	self thread function_1f551f49();
}

/*
	Name: function_86513cd0
	Namespace: gunfight
	Checksum: 0xC89252A2
	Offset: 0xDF8
	Size: 0xA8
	Parameters: 0
	Flags: None
*/
function function_86513cd0()
{
	foreach(player in level.players)
	{
		if(player.team == #"spectator")
		{
			player function_1f551f49();
		}
	}
}

/*
	Name: function_1f551f49
	Namespace: gunfight
	Checksum: 0x3E723656
	Offset: 0xEA8
	Size: 0x2D4
	Parameters: 0
	Flags: Private
*/
function private function_1f551f49()
{
	self endon(#"disconnect");
	var_838bcdf8 = (isdefined(game.var_96a8ff4a[game.var_b6beb735].primary) ? getitemindexfromref(game.var_96a8ff4a[game.var_b6beb735].primary) : -1);
	var_91a71f65 = (isdefined(game.var_96a8ff4a[game.var_b6beb735].secondary) ? getitemindexfromref(game.var_96a8ff4a[game.var_b6beb735].secondary) : -1);
	var_26b5c8ef = (isdefined(game.var_96a8ff4a[game.var_b6beb735].var_26b5c8ef) ? game.var_96a8ff4a[game.var_b6beb735].var_26b5c8ef : -1);
	var_4c0d0c4b = (isdefined(game.var_96a8ff4a[game.var_b6beb735].var_4c0d0c4b) ? game.var_96a8ff4a[game.var_b6beb735].var_4c0d0c4b : -1);
	var_fe58c446 = (isdefined(game.var_96a8ff4a[game.var_b6beb735].secondarygrenade) ? getitemindexfromref(game.var_96a8ff4a[game.var_b6beb735].secondarygrenade) : -1);
	var_312d49ec = (isdefined(game.var_96a8ff4a[game.var_b6beb735].primarygrenade) ? getitemindexfromref(game.var_96a8ff4a[game.var_b6beb735].primarygrenade) : -1);
	while(util::isfirstround() && !level flag::get(#"hash_321357f5b78401ef") || (isdefined(self) && self clientfield::get_player_uimodel("closeLoadingMovie") == 0))
	{
		wait(0.1);
	}
	if(isdefined(self))
	{
		self luinotifyevent(#"hash_76e8cddd9789122c", 6, var_838bcdf8, var_26b5c8ef + 1, var_91a71f65, var_4c0d0c4b + 1, var_fe58c446, var_312d49ec);
	}
}

/*
	Name: onconnect
	Namespace: gunfight
	Checksum: 0x22E3B123
	Offset: 0x1188
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function onconnect()
{
	if(util::isfirstround())
	{
		if(game.state != #"playing")
		{
			music::setmusicstate("gunfight_preloop", self);
		}
	}
	self function_770b76d3();
}

/*
	Name: onspawned
	Namespace: gunfight
	Checksum: 0xB05BF344
	Offset: 0x11F8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function onspawned()
{
	if(game.state == #"pregame")
	{
		self clientfield::set("gunfight_pregame_rob", 1);
	}
	else
	{
		self clientfield::set("gunfight_pregame_rob", 0);
	}
}

/*
	Name: function_dd683ab8
	Namespace: gunfight
	Checksum: 0x9B2E3F05
	Offset: 0x1268
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_dd683ab8(outcome)
{
	music::setmusicstate("matchend_win_02");
}

/*
	Name: function_21471f74
	Namespace: gunfight
	Checksum: 0xD29A9159
	Offset: 0x1298
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_21471f74()
{
	music::setmusicstate("gunfight_roundend");
}

/*
	Name: function_c3f7c761
	Namespace: gunfight
	Checksum: 0xDAC4D962
	Offset: 0x12C0
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_c3f7c761(loadout)
{
	self takeallweapons();
	self clearperks();
	self function_e6f9e3cd();
	self giveweapons(loadout);
	self loadout::function_6573eeeb();
	self setperk(#"specialty_sprint");
	self setperk(#"specialty_slide");
	self setperk(#"specialty_sprintreload");
	self setperk(#"specialty_sprintheal");
}

/*
	Name: ondeadevent
	Namespace: gunfight
	Checksum: 0x63B008EF
	Offset: 0x13D0
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function ondeadevent(team)
{
	if(team == game.attackers)
	{
		globallogic::function_a3e3bd39(game.defenders, 6);
	}
	else
	{
		globallogic::function_a3e3bd39(game.attackers, 6);
	}
}

/*
	Name: onendround
	Namespace: gunfight
	Checksum: 0xA76CEC89
	Offset: 0x1438
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function onendround(var_c1e98979)
{
	globallogic_score::function_9779ac61();
	if(isdefined(level.var_5ecd2f9f) && level.var_5ecd2f9f !== 0 && ((util::getroundsplayed() + 1) % level.var_5ecd2f9f) == 0)
	{
		game.var_b6beb735++;
		if(game.var_b6beb735 >= game.var_96a8ff4a.size)
		{
			game.var_b6beb735 = 0;
		}
		gametype::on_round_switch();
	}
}

/*
	Name: onplayerkilled
	Namespace: gunfight
	Checksum: 0x64048A15
	Offset: 0x14F8
	Size: 0x64
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	function_8f5272b2(self);
}

/*
	Name: ondisconnect
	Namespace: gunfight
	Checksum: 0xEF9CD77
	Offset: 0x1568
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function ondisconnect()
{
	if(game.state === #"playing" && isalive(self))
	{
		function_8f5272b2(self);
	}
}

/*
	Name: function_8f5272b2
	Namespace: gunfight
	Checksum: 0x6BAF4D3F
	Offset: 0x15C0
	Size: 0xA4
	Parameters: 1
	Flags: Private
*/
function private function_8f5272b2(player)
{
	if(isdefined(player.team))
	{
		globallogic_audio::play_2d_on_team(#"hash_7f0c9c0ec4410623", player.team);
		otherteam = util::getotherteam(player.team);
		if(isdefined(otherteam) && otherteam != player.team)
		{
			globallogic_audio::play_2d_on_team(#"hash_14b3ab2971ce1112", otherteam);
		}
	}
}

/*
	Name: ononeleftevent
	Namespace: gunfight
	Checksum: 0x29243F80
	Offset: 0x1670
	Size: 0x164
	Parameters: 1
	Flags: None
*/
function ononeleftevent(team)
{
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
	player = players[i];
	player thread globallogic_audio::leader_dialog_on_player("roundEncourageLastPlayer", "roundEncourageLastPlayer");
}

/*
	Name: function_d98e2783
	Namespace: gunfight
	Checksum: 0x3E1BB759
	Offset: 0x17E0
	Size: 0x212
	Parameters: 2
	Flags: None
*/
function function_d98e2783(loadout, loadoutslot)
{
	if(!isdefined(loadout))
	{
		return;
	}
	if(loadoutslot === "primary")
	{
		loadoutweapon = loadout.primary;
		var_b805cfb3 = (isdefined(loadout.var_26b5c8ef) ? loadout.var_26b5c8ef : 0);
		var_42c0a434 = loadout.primaryattachments;
	}
	else if(loadoutslot === "secondary")
	{
		loadoutweapon = loadout.secondary;
		var_b805cfb3 = (isdefined(loadout.var_4c0d0c4b) ? loadout.var_4c0d0c4b : 0);
		var_42c0a434 = loadout.secondaryattachments;
	}
	if(isdefined(loadoutweapon))
	{
		if(!isdefined(var_b805cfb3))
		{
			var_b805cfb3 = 0;
		}
		if(isdefined(var_b805cfb3) && var_b805cfb3 > -1)
		{
			var_b805cfb3++;
			var_c4af33 = function_f62a996b(loadoutweapon, var_b805cfb3);
			weapon = var_c4af33.weapon;
			var_e91aba42 = var_c4af33.var_fd90b0bb;
		}
		else
		{
			weaponattachments = function_8fdeea14(var_42c0a434);
			if(array::contains(weaponattachments, #"dw"))
			{
				loadoutweapon = loadoutweapon + "_dw";
				arrayremovevalue(weaponattachments, #"dw");
			}
			weapon = getweapon(loadoutweapon, weaponattachments);
		}
	}
	weapon_struct = {};
	weapon_struct.weapon = weapon;
	weapon_struct.var_f879230e = var_e91aba42;
	return weapon_struct;
}

/*
	Name: function_770b76d3
	Namespace: gunfight
	Checksum: 0x790E4D90
	Offset: 0x1A00
	Size: 0x224
	Parameters: 0
	Flags: None
*/
function function_770b76d3()
{
	if(!isdefined(self))
	{
		return;
	}
	var_f20ec141 = game.var_b6beb735;
	if(var_f20ec141 >= game.var_96a8ff4a.size)
	{
		var_f20ec141 = 0;
	}
	var_dd56024a = game.var_96a8ff4a[var_f20ec141];
	var_cd85bd40 = var_f20ec141 + 1;
	if(var_cd85bd40 >= game.var_96a8ff4a.size)
	{
		var_cd85bd40 = 0;
	}
	var_4db9b692 = game.var_96a8ff4a[var_cd85bd40];
	var_4add027b = function_d98e2783(var_dd56024a, "primary");
	if(isdefined(var_4add027b.weapon))
	{
		self giveweapon(var_4add027b.weapon, undefined, var_4add027b.var_f879230e);
	}
	var_7aa66b2b = function_d98e2783(var_dd56024a, "secondary");
	if(isdefined(var_7aa66b2b.weapon))
	{
		self giveweapon(var_7aa66b2b.weapon, undefined, var_7aa66b2b.var_f879230e);
	}
	var_9d60c468 = function_d98e2783(var_4db9b692, "primary");
	if(isdefined(var_9d60c468.weapon))
	{
		self giveweapon(var_9d60c468.weapon, undefined, var_9d60c468.var_f879230e);
	}
	var_41083d50 = function_d98e2783(var_4db9b692, "secondary");
	if(isdefined(var_41083d50.weapon))
	{
		self giveweapon(var_41083d50.weapon, undefined, var_41083d50.var_f879230e);
	}
}

/*
	Name: giveweapons
	Namespace: gunfight
	Checksum: 0x5AAEE4EA
	Offset: 0x1C30
	Size: 0x75C
	Parameters: 1
	Flags: None
*/
function giveweapons(loadout)
{
	self function_87195570(loadout.talents, loadout.var_1c89585f, loadout.var_285151c1);
	var_4add027b = function_d98e2783(loadout, "primary");
	primaryweapon = var_4add027b.weapon;
	var_df9e1af5 = var_4add027b.var_f879230e;
	if(isdefined(primaryweapon))
	{
		self.lastnonkillstreakweapon = primaryweapon;
		self giveweapon(primaryweapon, undefined, var_df9e1af5);
		self givestartammo(primaryweapon);
		self switchtoweapon(primaryweapon, 1);
		self loadout::function_442539("primary", primaryweapon);
	}
	else
	{
		nullprimary = getweapon(#"bare_hands");
		self giveweapon(nullprimary);
		self setweaponammoclip(nullprimary, 0);
		self loadout::function_442539("primary", nullprimary);
	}
	var_7aa66b2b = function_d98e2783(loadout, "secondary");
	secondaryweapon = var_7aa66b2b.weapon;
	var_48d617f1 = var_7aa66b2b.var_f879230e;
	if(isdefined(secondaryweapon))
	{
		self giveweapon(secondaryweapon, undefined, var_48d617f1);
		self givestartammo(secondaryweapon);
		self loadout::function_442539("secondary", secondaryweapon);
		if(!isdefined(primaryweapon))
		{
			self switchtoweapon(secondaryweapon, 1);
		}
	}
	else
	{
		nullsecondary = getweapon(#"bare_hands");
		self giveweapon(nullsecondary);
		self setweaponammoclip(nullsecondary, 0);
		self loadout::function_442539("secondary", nullsecondary);
	}
	firstround = util::isfirstround();
	primarygrenade = loadout.primarygrenade;
	if(isdefined(primarygrenade))
	{
		var_8e797a67 = getweapon(primarygrenade);
		self giveweapon(var_8e797a67);
		var_4e6e2c39 = var_8e797a67.clipsize;
		if(loadout.var_1c89585f === 1)
		{
			var_4e6e2c39++;
		}
		self setweaponammoclip(var_8e797a67, var_4e6e2c39);
		self loadout::function_442539("primarygrenade", var_8e797a67);
		self ability_util::gadget_reset(var_8e797a67, 1, 1, firstround, 0);
		if(var_8e797a67.gadget_type == 0)
		{
			self giveweapon(level.var_34d27b26);
			self setweaponammoclip(level.var_34d27b26, 0);
		}
	}
	else
	{
		self giveweapon(level.var_34d27b26);
		self loadout::function_442539("primarygrenade", level.var_34d27b26);
	}
	secondarygrenade = loadout.secondarygrenade;
	if(isdefined(secondarygrenade))
	{
		var_a66b455e = getweapon(secondarygrenade);
		self giveweapon(var_a66b455e);
		var_7173f066 = var_a66b455e.clipsize;
		if(loadout.var_285151c1 === 1)
		{
			var_7173f066++;
		}
		self setweaponammoclip(var_a66b455e, var_7173f066);
		self loadout::function_442539("secondarygrenade", var_a66b455e);
		if(var_a66b455e.gadget_type != 0)
		{
			if(var_a66b455e.gadget_type == 23)
			{
				self ability_util::function_36a15b60(var_a66b455e);
			}
			else
			{
				self ability_util::gadget_reset(var_a66b455e, 1, 1, firstround, 0);
			}
		}
	}
	else
	{
		self giveweapon(level.var_6388e216);
		self loadout::function_442539("secondarygrenade", level.var_6388e216);
	}
	specialgrenade = loadout.specialgrenade;
	if(isdefined(specialgrenade))
	{
		var_8b0bfce9 = getweapon(specialgrenade);
		self giveweapon(var_8b0bfce9);
		self loadout::function_442539("specialgrenade", var_8b0bfce9);
		self ability_util::gadget_reset(var_8b0bfce9, 1, 1, firstround, 0);
		if(var_8b0bfce9.gadget_type == 0)
		{
			self giveweapon(level.var_43a51921);
			self setweaponammoclip(level.var_43a51921, 0);
		}
	}
	else
	{
		var_ad731691 = getweapon(#"null_offhand_secondary");
		self giveweapon(var_ad731691);
		self loadout::function_442539("specialgrenade", var_ad731691);
	}
	self val::set(#"hash_63c98741ae5048e3", "disable_weapon_pickup", 1);
}

/*
	Name: function_87195570
	Namespace: gunfight
	Checksum: 0x5AAC390E
	Offset: 0x2398
	Size: 0x24C
	Parameters: 3
	Flags: None
*/
function function_87195570(talents, var_1c89585f, var_285151c1)
{
	self function_e6f9e3cd();
	self clearperks();
	if(!isdefined(talents))
	{
		talents = [];
	}
	if(var_1c89585f === 1)
	{
		talents[talents.size] = {#talent:#"hash_7716cb3888f5dd8a"};
	}
	if(var_285151c1 === 1)
	{
		talents[talents.size] = {#talent:#"hash_2c3a32e6e2afd1f2"};
	}
	foreach(talent in talents)
	{
		if(isdefined(talent.talent) && talent.talent != #"weapon_null")
		{
			self function_b5feff95(talent.talent + level.game_mode_suffix);
		}
	}
	perks = self getloadoutperks(0);
	foreach(perk in perks)
	{
		self setperk(perk);
	}
	self thread perks::monitorgpsjammer();
}

/*
	Name: function_8fdeea14
	Namespace: gunfight
	Checksum: 0xD0BE85FB
	Offset: 0x25F0
	Size: 0xCE
	Parameters: 1
	Flags: None
*/
function function_8fdeea14(var_b3d10ae7)
{
	var_9fb603ac = [];
	if(isdefined(var_b3d10ae7))
	{
		foreach(element in var_b3d10ae7)
		{
			if(isdefined(element.attachment) && element.attachment != "weapon_null")
			{
				var_9fb603ac[var_9fb603ac.size] = element.attachment;
			}
		}
	}
	return var_9fb603ac;
}

/*
	Name: getzonearray
	Namespace: gunfight
	Checksum: 0xCE80FF85
	Offset: 0x26C8
	Size: 0x3E
	Parameters: 0
	Flags: None
*/
function getzonearray()
{
	zones = getentarray("gunfight_zone_center", "targetname");
	if(!isdefined(zones))
	{
		return undefined;
	}
	return zones;
}

/*
	Name: setupzones
	Namespace: gunfight
	Checksum: 0x7582EE8D
	Offset: 0x2710
	Size: 0x4AC
	Parameters: 0
	Flags: None
*/
function setupzones()
{
	zones = getzonearray();
	if(zones.size == 0)
	{
		return false;
	}
	trigs = getentarray("gunfight_zone_trigger", "targetname");
	/#
		assert(zones.size == trigs.size, "");
	#/
	for(i = 0; i < zones.size; i++)
	{
		errored = 0;
		zone = zones[i];
		zone.trig = undefined;
		for(j = 0; j < trigs.size; j++)
		{
			if(zone istouching(trigs[j]))
			{
				if(isdefined(zone.trig))
				{
					globallogic_utils::add_map_error(("Zone at " + zone.origin) + " is touching more than one \"zonetrigger\" trigger");
					errored = 1;
					break;
				}
				zone.trig = trigs[j];
				zone.var_b76aa8 = j;
				zone.trig trigger::add_flags(16);
				break;
			}
		}
		if(!isdefined(zone.trig))
		{
			if(!errored)
			{
				globallogic_utils::add_map_error(("Zone at " + zone.origin) + " is not inside any \"zonetrigger\" trigger");
				continue;
			}
		}
		/#
			assert(!errored);
		#/
		zone.trigorigin = zone.trig.origin;
		zone.objectiveanchor = spawn("script_model", zone.origin);
		visuals = [];
		visuals = getentarray("gunfight_flag_neutral", "targetname");
		othervisuals = getentarray(zone.target, "targetname");
		for(j = 0; j < othervisuals.size; j++)
		{
			visuals[visuals.size] = othervisuals[j];
			othervisuals[j] clientfield::set("scriptid", 1);
			othervisuals[j] notsolid();
		}
		zone.gameobject = gameobjects::create_use_object(#"neutral", zone.trig, visuals, (0, 0, 0), #"hash_56c11247a60bfd3c");
		zone.gameobject gameobjects::allow_use(#"hash_161f03feaadc9b8f");
		zone.gameobject gameobjects::set_model_visibility(0, 1);
		function_18fbab10(zone.gameobject.objectiveid, #"hash_5ccb65c83273cdc9");
		if(util::isfirstround())
		{
			zone.gameobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
		}
		else
		{
			zone.gameobject gameobjects::set_visible(#"hash_161f03feaadc9b8f");
		}
		zone.trig.useobj = zone.gameobject;
		setbombtimer("A", 0);
		setmatchflag("bomb_timer_a", 0);
	}
	if(globallogic_utils::print_map_errors())
	{
		return false;
	}
	level.zones = zones;
	return true;
}

/*
	Name: ontimelimit
	Namespace: gunfight
	Checksum: 0x2812AC82
	Offset: 0x2BC8
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function ontimelimit()
{
	if(level.var_d3335770 !== 1)
	{
		level.var_d3335770 = 1;
		thread overtime();
	}
	else
	{
		function_c4915ac();
	}
}

/*
	Name: overtime
	Namespace: gunfight
	Checksum: 0xD2B11FE2
	Offset: 0x2C28
	Size: 0x424
	Parameters: 0
	Flags: None
*/
function overtime()
{
	if(level.var_a8194845 === 2)
	{
		foreach(team, _ in level.teams)
		{
			setteamspyplane(team, 1);
		}
	}
	level.var_1cc83170 = -1;
	level.var_537d4629 = level.extratime + 1;
	level.var_807b9ff6 = -1;
	zone = level.zones[0];
	if(zone.gameobject gameobjects::function_339d0e91() > 0)
	{
		pause_time();
	}
	setgameendtime(gettime() + (int(level.extratime * 1000)));
	thread globallogic::timelimitclock();
	level.usingextratime = 1;
	level thread globallogic::updategametypedvars();
	playsoundatposition(#"hash_6a5f99378f4a93c1", (0, 0, 0));
	music::setmusicstate("gunfight_time_extended");
	if(!isdefined(zone))
	{
		function_c4915ac();
		return;
	}
	zone.gameobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
	zone.gameobject gameobjects::set_use_time(level.capturetime);
	zone.gameobject gameobjects::set_use_text(#"hash_467145983994c6c2");
	zone.gameobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	zone.gameobject gameobjects::set_model_visibility(1, 1);
	zone.gameobject gameobjects::must_maintain_claim(0);
	zone.gameobject gameobjects::can_contest_claim(1);
	zone.gameobject gameobjects::set_onbeginuse_event(&onbeginuse);
	zone.gameobject gameobjects::function_6362d6ea(&onuseupdate);
	zone.gameobject gameobjects::set_onuse_event(&onzonecapture);
	zone.gameobject gameobjects::set_onenduse_event(&onenduse);
	level clientfield::set("activeTrigger", 1);
	zone function_844322c9();
	globallogic_audio::leader_dialog("gnfOvertime", undefined, "gamemode_objective");
	luinotifyevent(#"hash_12fdd5eec28f50ae");
	util::function_a3f7de13(29, #"none");
}

/*
	Name: function_844322c9
	Namespace: gunfight
	Checksum: 0x94C52AA2
	Offset: 0x3058
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_844322c9()
{
	setmatchflag("bomb_timer_a", 1);
	setbombtimer("A", gettime() + (int(level.extratime * 1000)));
}

/*
	Name: onuseupdate
	Namespace: gunfight
	Checksum: 0x6BCF0F15
	Offset: 0x30C8
	Size: 0x9C
	Parameters: 3
	Flags: None
*/
function onuseupdate(team, progress, change)
{
	var_2349519b = math::clamp(progress, 0, 1);
	objective_setprogress(self.objectiveid, var_2349519b);
	if(change > 0)
	{
		self gameobjects::set_flags((team == "allies" ? 1 : 2));
	}
}

/*
	Name: onzonecapture
	Namespace: gunfight
	Checksum: 0x96F57CAA
	Offset: 0x3170
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function onzonecapture(sentient)
{
	self notify(#"zone_captured");
	foreach(player in getplayers())
	{
		player playlocalsound(#"hash_6234f3332aa1bfe4");
	}
	if(isplayer(sentient))
	{
		team = sentient.team;
	}
	else if(isdefined(sentient.owner))
	{
		team = sentient.owner.team;
	}
	endround(team, 11);
}

/*
	Name: onbeginuse
	Namespace: gunfight
	Checksum: 0x14B15382
	Offset: 0x32A0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function onbeginuse(player)
{
	pause_time();
}

/*
	Name: onenduse
	Namespace: gunfight
	Checksum: 0x88DDDC14
	Offset: 0x32C8
	Size: 0x88
	Parameters: 3
	Flags: None
*/
function onenduse(team, sentient, success)
{
	if(!isdefined(sentient))
	{
		return;
	}
	player = sentient;
	if(!isplayer(player))
	{
		player = sentient.owner;
	}
	if(!success)
	{
		resume_time();
	}
	player notify(#"event_ended");
}

/*
	Name: function_c4915ac
	Namespace: gunfight
	Checksum: 0xB3180B4B
	Offset: 0x3358
	Size: 0x27C
	Parameters: 0
	Flags: None
*/
function function_c4915ac()
{
	var_3a22d07b = 0;
	var_f6718d9a = 0;
	foreach(player in getplayers(#"allies"))
	{
		var_3a22d07b = var_3a22d07b + player.health;
	}
	foreach(player in getplayers(#"axis"))
	{
		var_f6718d9a = var_f6718d9a + player.health;
	}
	if(var_3a22d07b > var_f6718d9a)
	{
		endround(#"allies", 1);
	}
	else
	{
		if(var_3a22d07b < var_f6718d9a)
		{
			endround(#"axis", 1);
		}
		else
		{
			if(level.var_3778003e === 1)
			{
				globallogic_score::giveteamscoreforobjective(#"allies", 1);
				globallogic_score::giveteamscoreforobjective(#"axis", 1);
				game.stat[#"roundswon"][#"allies"]++;
				game.stat[#"roundswon"][#"axis"]++;
			}
			thread globallogic::end_round(2);
		}
	}
}

/*
	Name: gettimelimit
	Namespace: gunfight
	Checksum: 0x1F37B9CB
	Offset: 0x35E0
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function gettimelimit()
{
	timelimit = getgametypesetting(#"timelimit") / 60;
	if(timelimit < level.timelimitmin)
	{
		timelimit = level.timelimitmin;
	}
	else if(timelimit > level.timelimitmax)
	{
		timelimit = level.timelimitmax;
	}
	if(level.usingextratime)
	{
		extratime = (level.extratime + (float(function_60d95f53()) / 1000)) / 60;
		return timelimit + extratime;
	}
	return timelimit;
}

/*
	Name: endround
	Namespace: gunfight
	Checksum: 0xC6CA8384
	Offset: 0x36C0
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function endround(winning_team, var_c1e98979)
{
	if(!isdefined(winning_team))
	{
		return;
	}
	round::set_winner(winning_team);
	setbombtimer("A", 0);
	setmatchflag("bomb_timer_a", 0);
	level clientfield::set("activeTrigger", 0);
	thread globallogic::function_a3e3bd39(winning_team, var_c1e98979);
}

/*
	Name: pause_time
	Namespace: gunfight
	Checksum: 0xCB374F9C
	Offset: 0x3768
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function pause_time()
{
	if(!is_true(level.timerpaused))
	{
		globallogic_utils::pausetimer();
		level.timerpaused = 1;
	}
}

/*
	Name: resume_time
	Namespace: gunfight
	Checksum: 0x8ACEE74E
	Offset: 0x37B8
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function resume_time()
{
	if(is_true(level.timerpaused))
	{
		globallogic_utils::resumetimer();
		level.timerpaused = 0;
	}
}

/*
	Name: function_4d70ac20
	Namespace: gunfight
	Checksum: 0x8BED78EA
	Offset: 0x3800
	Size: 0xEA
	Parameters: 1
	Flags: None
*/
function function_4d70ac20(loadout)
{
	/#
		primary = self loadout::function_18a77b37("");
		secondary = self loadout::function_18a77b37("");
		if(primary.name != loadout.primary || secondary.name != loadout.secondary)
		{
			return false;
		}
		if(!self hasperk(#"specialty_sprint") || !self hasperk(#"specialty_slide"))
		{
			return false;
		}
		return true;
	#/
}

/*
	Name: function_a481300e
	Namespace: gunfight
	Checksum: 0x37F9CEE5
	Offset: 0x38F8
	Size: 0x17E
	Parameters: 0
	Flags: None
*/
function function_a481300e()
{
	/#
		self endon(#"game_ended");
		dur = 0.5;
		while(true)
		{
			var_3a22d07b = 0;
			var_f6718d9a = 0;
			foreach(player in getplayers(#"allies"))
			{
				var_3a22d07b = var_3a22d07b + player.health;
			}
			foreach(player in getplayers(#"axis"))
			{
				var_f6718d9a = var_f6718d9a + player.health;
			}
			wait(dur);
		}
	#/
}

