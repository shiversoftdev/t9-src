#using script_3dc93ca9902a9cda;
#using scripts\cp_common\util.gsc;
#using scripts\cp_common\skipto.gsc;
#using script_32399001bdb550da;
#using scripts\cp_common\gametypes\globallogic_utils.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\gametypes\globallogic_spawn.gsc;
#using scripts\cp_common\gametypes\globallogic.gsc;
#using script_3706d21c449d0d14;
#using scripts\cp_common\bb.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace coop;

/*
	Name: function_7a65206c
	Namespace: coop
	Checksum: 0x52D7C5F7
	Offset: 0x3D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7a65206c()
{
	level notify(-1598058281);
}

/*
	Name: main
	Namespace: coop
	Checksum: 0xF92559C1
	Offset: 0x3F0
	Size: 0x4E4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("playercorpse", "hide_body", 1, 1, "int");
	clientfield::register("toplayer", "killcam_menu", 1, 1, "int");
	globallogic::init();
	level.gametype = util::get_game_type();
	level.var_837aa533 = hash(level.gametype);
	if(isdefined(level.gametype))
	{
		level.var_12323003 = function_16495154(level.var_837aa533);
		level.basegametype = function_be90acca(level.var_837aa533);
	}
	util::registerroundswitch(0, 9);
	util::registertimelimit(0, 0);
	util::registerscorelimit(0, 0);
	util::registerroundlimit(0, 10);
	util::registerroundwinlimit(0, 0);
	util::registernumlives(0, 100);
	globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
	spawner::add_global_spawn_function(#"axis", &function_e89f60e2);
	level.scoreroundwinbased = getgametypesetting(#"cumulativeroundscores") == 0;
	level.teamscoreperkill = getgametypesetting(#"teamscoreperkill");
	level.teamscoreperdeath = getgametypesetting(#"teamscoreperdeath");
	level.teamscoreperheadshot = getgametypesetting(#"teamscoreperheadshot");
	level.teambased = 1;
	level.overrideteamscore = 1;
	level.onstartgametype = &onstartgametype;
	level.onspawnplayer = &onspawnplayer;
	level.onspawnplayerunified = undefined;
	level.onplayerkilled = &onplayerkilled;
	level.var_c3a79d20 = 1;
	level.takelivesondeath = 0;
	level.livesdonotreset = 1;
	level.ondeadevent = undefined;
	level.var_31c6ebd4 = &function_31c6ebd4;
	callback::on_bleedout(&onplayerbleedout);
	callback::on_mission_failed(&on_mission_failed);
	level.var_84a50edd = &spawnedasspectator;
	level thread function_7f1305bc();
	level.endgameonscorelimit = 0;
	level.endgameontimelimit = 0;
	level.var_e23fea8c = &function_ddc47ed1;
	level.ontimelimit = &globallogic::blank;
	level.onscorelimit = &globallogic::blank;
	gameobjects::register_allowed_gameobject(level.gametype);
	game.dialog[#"gametype"] = "coop_start";
	game.dialog[#"gametype_hardcore"] = "hccoop_start";
	game.dialog[#"offense_obj"] = "generic_boost";
	game.dialog[#"defense_obj"] = "generic_boost";
	setdvar(#"force_no_cac", 1);
}

/*
	Name: on_mission_failed
	Namespace: coop
	Checksum: 0xAD4AF714
	Offset: 0x8E0
	Size: 0xC0
	Parameters: 0
	Flags: Linked
*/
function on_mission_failed()
{
	level thread function_34459363(level.missionfailed_reason, level.missionfailed_hint);
	foreach(player in getplayers())
	{
		bb::logplayermapnotification("mission_fail", player);
	}
}

/*
	Name: function_e89f60e2
	Namespace: coop
	Checksum: 0xC8EDDF61
	Offset: 0x9A8
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_e89f60e2()
{
	self influencers::create_influencer_generic("enemy_spawn", self.origin, #"allies");
	self influencers::create_influencer_generic("enemy", self, #"allies", 1);
}

/*
	Name: function_45b62760
	Namespace: coop
	Checksum: 0x1A54CD10
	Offset: 0xA18
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_45b62760()
{
	self matchrecordplayerspawned();
	var_8535acc1 = skipto::function_a002f769();
	if(var_8535acc1 >= 0)
	{
		self matchrecordsetcheckpointstat(var_8535acc1, "checkpoint_restores", 1);
	}
	primaryweapon = (isdefined(self.primaryweapon) ? self.primaryweapon : level.weaponnone);
	secondaryweapon = (isdefined(self.secondaryweapon) ? self.secondaryweapon : level.weaponnone);
	grenadetypeprimary = (isdefined(self.grenadetypeprimary) ? self.grenadetypeprimary : level.weaponnone);
	grenadetypesecondary = (isdefined(self.grenadetypesecondary) ? self.grenadetypesecondary : level.weaponnone);
	self.killstreak = [];
	for(i = 0; i < 3; i++)
	{
		if(level.loadoutkillstreaksenabled && isdefined(self.killstreak[i]) && isdefined(level.killstreakindices[self.killstreak[i]]))
		{
			killstreaks[i] = level.killstreakindices[self.killstreak[i]];
			continue;
		}
		killstreaks[i] = 0;
	}
	self recordloadoutperksandkillstreaks(primaryweapon, secondaryweapon, grenadetypeprimary, grenadetypesecondary, killstreaks[0], killstreaks[1], killstreaks[2]);
}

/*
	Name: function_7f1305bc
	Namespace: coop
	Checksum: 0x3DA3AF35
	Offset: 0xC18
	Size: 0x4D8
	Parameters: 0
	Flags: Linked
*/
function function_7f1305bc()
{
	while(true)
	{
		level waittill(#"save_restore");
		player = getplayers()[0];
		level thread lui::screen_fade(0, 1, 1, "black");
		globallogic_ui::function_cdbb5c49(1, 1);
		player function_a7af3a2a();
		util::cleanupactorcorpses();
		matchrecorderincrementheaderstat("checkpointRestoreCount", 1);
		foreach(player in level.players)
		{
			player closemenu(game.menu[#"menu_start_menu"]);
			if(player flag::get(#"mobile_armory_in_use"))
			{
				player notify(#"menuresponse", {#intpayload:0, #response:"cancel", #menu:"mobile_armory_loadout"});
			}
			player closemenu(game.menu[#"menu_changeclass"]);
			player closemenu(game.menu[#"menu_changeclass_offline"]);
			if(player.sessionstate == "spectator")
			{
				if(!isdefined(player.curclass))
				{
					player thread globallogic_ui::beginclasschoice();
				}
				else
				{
					player thread globallogic_spawn::waitandspawnclient();
				}
			}
			player thread val::set_for_time(3, "checkpoint_restore", "takedamage", 0);
			if(!is_true(world.var_b86bf11e))
			{
				world.var_b86bf11e = 1;
			}
			player function_45b62760();
		}
		player endon(#"death");
		player val::set(#"hash_342acf3710210ee2", "show_crosshair", 0);
		player val::set(#"hash_342acf3710210ee2", "freezecontrols", 1);
		player val::set(#"hash_342acf3710210ee2", "takedamage", 0);
		player val::set(#"hash_342acf3710210ee2", "allowdeath", 0);
		player val::set(#"hash_342acf3710210ee2", "pre_load_ghost", 1);
		player function_a7af3a2a();
		level util::delay(0.05, undefined, &lui::screen_fade, 0.25, 0, 1, "black", 1);
		player util::function_8b0c9d28(undefined, 5);
		wait(0.4);
		level flag::wait_till(#"gameplay_started");
		player val::reset_all(#"hash_342acf3710210ee2");
		globallogic_ui::function_cdbb5c49(0);
	}
}

/*
	Name: onstartgametype
	Namespace: coop
	Checksum: 0x5EB0128F
	Offset: 0x10F8
	Size: 0x300
	Parameters: 0
	Flags: Linked
*/
function onstartgametype()
{
	setclientnamemode("auto_change");
	if(!isdefined(game.switchedsides))
	{
		game.switchedsides = 0;
	}
	if(game.switchedsides)
	{
		oldattackers = game.attackers;
		olddefenders = game.defenders;
		game.attackers = olddefenders;
		game.defenders = oldattackers;
	}
	level.displayroundendtext = 0;
	influencers::create_map_placed_influencers();
	level.spawnmins = (0, 0, 0);
	level.spawnmaxs = (0, 0, 0);
	foreach(team in level.playerteams)
	{
		util::setobjectivetext(team, #"hash_6d9d9822a460249b");
		util::setobjectivehinttext(team, #"hash_6800331814c69e15");
		util::setobjectivescoretext(team, #"hash_6d9d9822a460249b");
	}
	level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
	setmapcenter(level.mapcenter);
	spawnpoint = spawning::get_random_intermission_point();
	setdemointermissionpoint(spawnpoint.origin, spawnpoint.angles);
	level thread respawn_spectators_on_objective_change();
	function_ddc47ed1();
	level flag::wait_till("first_player_spawned");
	foreach(player in level.players)
	{
		bb::logobjectivestatuschange("_level", player, "start");
	}
}

/*
	Name: function_ddc47ed1
	Namespace: coop
	Checksum: 0xA42938BF
	Offset: 0x1400
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_ddc47ed1()
{
	skipto::update_spawn_points(1);
}

/*
	Name: spawnplayer_internal
	Namespace: coop
	Checksum: 0x71294539
	Offset: 0x1428
	Size: 0x5E
	Parameters: 0
	Flags: Linked, Private
*/
function private spawnplayer_internal()
{
	spawns = skipto::filter_player_spawnpoints(level.var_cd012e52);
	self spawn(spawns[0].origin, spawns[0].angles);
	self.lastspawntime = gettime();
}

/*
	Name: onspawnplayer
	Namespace: coop
	Checksum: 0xC75CA8E1
	Offset: 0x1490
	Size: 0x76
	Parameters: 2
	Flags: Linked
*/
function onspawnplayer(predictedspawn, question)
{
	pixbeginevent();
	self.usingobj = undefined;
	self spawnplayer_internal();
	self thread function_bb5fae75();
	self.eligible_for_death_invulnerability = 1;
	self thread gamedifficulty::playerhurtcheck();
	pixendevent();
}

/*
	Name: onscoreclosemusic
	Namespace: coop
	Checksum: 0x55CE7F59
	Offset: 0x1510
	Size: 0x18E
	Parameters: 0
	Flags: None
*/
function onscoreclosemusic()
{
	teamscores = [];
	while(!level.gameended)
	{
		scorelimit = level.scorelimit;
		scorethreshold = scorelimit * 0.1;
		scorethresholdstart = abs(scorelimit - scorethreshold);
		scorelimitcheck = scorelimit - 10;
		topscore = 0;
		runnerupscore = 0;
		foreach(_ in level.teams)
		{
			score = [[level._getteamscore]](team);
			if(score > topscore)
			{
				runnerupscore = topscore;
				topscore = score;
				continue;
			}
			if(score > runnerupscore)
			{
				runnerupscore = score;
			}
		}
		scoredif = topscore - runnerupscore;
		if(scoredif <= scorethreshold && scorethresholdstart <= topscore)
		{
			return;
		}
		wait(1);
	}
}

/*
	Name: onplayerkilled
	Namespace: coop
	Checksum: 0xCC0B1AC7
	Offset: 0x16A8
	Size: 0x38C
	Parameters: 9
	Flags: Linked
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	self closemenu(game.menu[#"menu_changeclass"]);
	primaries = self getweaponslistprimaries();
	if(isdefined(primaries))
	{
		foreach(primary_weapon in primaries)
		{
			if(primary_weapon !== self.secondaryloadoutweapon)
			{
				self._current_weapon = primary_weapon;
				break;
			}
		}
	}
	self player::take_weapons();
	self savegame::set_player_data("saved_weapon", self._current_weapon.rootweapon.name);
	self savegame::set_player_data("saved_weapon_attachments", util::function_2146bd83(self._current_weapon));
	self savegame::set_player_data("saved_weapondata", self._weapons);
	self._weapons = undefined;
	self.gun_removed = undefined;
	if(isdefined(level.var_5be43b2d))
	{
		return;
	}
	level.dead_player = self;
	if(isdefined(level.missionfailed_reason))
	{
		fail_reason = level.missionfailed_reason;
	}
	if(level.players.size == 1)
	{
		if(!self util::function_a1d6293())
		{
			self playsoundtoplayer(#"hash_7dcd120ea369ea68", self);
		}
		if(is_true(level.var_6cc58e4b))
		{
			self.var_e36aebf2 = 1;
			if(is_true(level.var_41cd8311) && is_true(self.var_30a1aeee))
			{
				self thread function_ffac0e3();
			}
			self waittilltimeout(5, #"hash_eb0317ca3976bf9");
		}
		level thread function_34459363(fail_reason, level.missionfailed_hint);
	}
	else if(level.gameskill >= 2)
	{
		playsoundatposition(#"hash_7dcd120ea369ea68", (0, 0, 0));
		level thread function_34459363(fail_reason, level.missionfailed_hint);
	}
}

/*
	Name: function_34459363
	Namespace: coop
	Checksum: 0xF5F3798A
	Offset: 0x1A40
	Size: 0x814
	Parameters: 2
	Flags: Linked
*/
function function_34459363(var_e9724d01, var_d2b863b2)
{
	level.var_5be43b2d = 1;
	setslowmotion(1);
	level flag::set(#"mission_failed");
	if(!isdefined(var_e9724d01))
	{
		var_e9724d01 = #"";
	}
	if(!isdefined(var_d2b863b2))
	{
		var_d2b863b2 = #"";
	}
	foreach(player in level.players)
	{
		player thread util::hide_hint_text(0);
		player val::set(#"hash_12e8539788b7d534", "show_hud", 0);
		bb::logobjectivestatuschange(level.skipto_point, player, "restart");
		player val::set(#"hash_5677fd1c5f50cf38", "freezecontrols");
		player.var_c071a13e = 1;
		if(!isdefined(level.var_59f4be9a))
		{
			level thread lui::screen_fade(0, 0.001, 0.001, "black", 0);
			waitframe(1);
		}
		player.var_c341be0e = player openluimenu("CPMissionFailed");
		player setluimenudata(player.var_c341be0e, #"hash_6437862a5ea9ee0d", var_e9724d01);
		globallogic_ui::function_9ed5232e("hudItems.cpMissionFailedEntry.MissionFailHint", var_d2b863b2, 0, 1);
		globallogic_ui::function_9ed5232e("hudItems.cpMissionFailedEntry.MissionFailReason", var_e9724d01, 0, 1);
		if(isalive(player))
		{
			snd::play("uin_cp_failure");
		}
		player setluimenudata(player.var_c341be0e, #"hash_76be1320dd574b24", var_d2b863b2);
	}
	var_effac39e = 1.25;
	if(isdefined(level.dead_player))
	{
		if(is_true(level.var_41cd8311))
		{
			foreach(player in level.players)
			{
				if(is_true(player.var_8fc85657))
				{
					level.dead_player waittill(#"end_killcam", #"hash_769655bf42475c20");
					if(isdefined(level.dead_player.var_55180cd8))
					{
						var_effac39e = level.dead_player.var_55180cd8;
					}
				}
			}
		}
		if(level.dead_player util::function_a1d6293())
		{
			wait(0.7);
		}
		else
		{
			level thread lui::screen_fade(var_effac39e, 1, 0, "black", 0);
			wait(var_effac39e);
		}
		screen_faded = 1;
		if(is_true(level.var_41cd8311))
		{
			foreach(player in level.players)
			{
				if(is_true(player.var_8fc85657))
				{
					player clientfield::set_to_player("killcam_menu", 0);
				}
			}
		}
	}
	if(!isdefined(screen_faded))
	{
		level thread lui::screen_fade(var_effac39e, 1, 0, "black", 0);
		wait(var_effac39e);
	}
	if(var_e9724d01 != #"" || var_d2b863b2 != #"")
	{
		wait(2.6);
	}
	if(is_true(level.gameended))
	{
		wait(1000);
	}
	foreach(player in level.players)
	{
		player notify(#"hash_4bd20f5c626eb3f0");
		player cameraactivate(0);
		player val::reset(#"hash_5677fd1c5f50cf38", "freezecontrols");
	}
	if(isdefined(level.heroes))
	{
		foreach(hero in level.heroes)
		{
			util::unmake_hero(key);
		}
	}
	player = level.dead_player;
	if(!isdefined(player))
	{
		player = level.players[0];
	}
	player util::function_e05fc3fb(0);
	globallogic_ui::function_760546ce();
	globallogic_ui::function_cdbb5c49(1, 1);
	if(isdefined(player.var_c341be0e))
	{
		player setluimenudata(player.var_c341be0e, #"hash_6437862a5ea9ee0d", #"");
		player setluimenudata(player.var_c341be0e, #"hash_76be1320dd574b24", #"");
		player closemenu("CPMissionFailed");
	}
	checkpointrestart();
}

/*
	Name: function_ffac0e3
	Namespace: coop
	Checksum: 0xED37AF7D
	Offset: 0x2260
	Size: 0xFE
	Parameters: 0
	Flags: Linked
*/
function function_ffac0e3()
{
	self endon(#"disconnect", #"hash_4bd20f5c626eb3f0");
	level endon(#"game_ended");
	self clientfield::set_to_player("killcam_menu", 1);
	/#
		printtoprightln("", (1, 0, 1));
	#/
	while(self usebuttonpressed())
	{
		waitframe(1);
	}
	while(!self usebuttonpressed())
	{
		waitframe(1);
	}
	self.var_8fc85657 = 1;
	self clientfield::set_to_player("killcam_menu", 0);
	self notify(#"hash_149b5fe3276ace1c");
}

/*
	Name: function_c5eb768b
	Namespace: coop
	Checksum: 0x336211B9
	Offset: 0x2368
	Size: 0x186
	Parameters: 0
	Flags: None
*/
function function_c5eb768b()
{
	/#
		if(!isdefined(self.var_ca00be20))
		{
			self.var_ca00be20 = newdebughudelem(self);
			self.var_ca00be20.archived = 0;
			self.var_ca00be20.x = 0;
			self.var_ca00be20.alignx = "";
			self.var_ca00be20.aligny = "";
			self.var_ca00be20.horzalign = "";
			self.var_ca00be20.vertalign = "";
			self.var_ca00be20.sort = 1;
			self.var_ca00be20.font = "";
		}
		if(self issplitscreen())
		{
			self.var_ca00be20.y = -100;
			self.var_ca00be20.fontscale = 1;
		}
		else
		{
			self.var_ca00be20.y = -180;
			self.var_ca00be20.fontscale = 1.5;
		}
		self.var_ca00be20 settext(#"hash_335a164eda0d56ff");
		self.var_ca00be20.alpha = 1;
	#/
}

/*
	Name: function_31c6ebd4
	Namespace: coop
	Checksum: 0x9029A204
	Offset: 0x24F8
	Size: 0xE6
	Parameters: 0
	Flags: Linked
*/
function function_31c6ebd4()
{
	self endon(#"disconnect", #"hash_4bd20f5c626eb3f0", #"end_respawn");
	level endon(#"game_ended");
	/#
		self function_c5eb768b();
		printtoprightln("", (1, 0, 1));
	#/
	while(self usebuttonpressed())
	{
		waitframe(1);
	}
	while(!self usebuttonpressed())
	{
		waitframe(1);
	}
	self.var_8fc85657 = 1;
	self.var_ca00be20.alpha = 0;
}

/*
	Name: onplayerbleedout
	Namespace: coop
	Checksum: 0x2285E303
	Offset: 0x25E8
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function onplayerbleedout()
{
	if(!is_true(level.var_ba2a141))
	{
		foreach(player in level.players)
		{
			if(player != self && player.sessionstate != "dead" && player.sessionstate != "spectator")
			{
				return;
			}
		}
	}
	if(!is_true(level.level_ending))
	{
		level thread function_34459363();
	}
	level.level_ending = 1;
	/#
		if(!is_true(level.level_ending))
		{
			errormsg("");
		}
	#/
}

/*
	Name: wait_to_spawn
	Namespace: coop
	Checksum: 0x1891C3E7
	Offset: 0x2738
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function wait_to_spawn()
{
	self notify(#"hash_6baa8d54b54f762e");
	self endon(#"hash_6baa8d54b54f762e");
	if(is_true(level.inprematchperiod) || !isdefined(self.var_56e5037e))
	{
		self.var_56e5037e = 1;
		return true;
	}
	hud_message::setlowermessage(game.strings[#"waiting_to_spawn"], 15);
	level waittilltimeout(15, #"objective_changed");
	return true;
}

/*
	Name: respawn_spectators_on_objective_change
	Namespace: coop
	Checksum: 0x51C0D754
	Offset: 0x2800
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function respawn_spectators_on_objective_change()
{
	level flag::wait_till("all_players_spawned");
	while(true)
	{
		level waittill(#"objective_changed");
		foreach(player in level.players)
		{
			if(player.sessionstate == "spectator" && globallogic_utils::isvalidclass(player.curclass))
			{
				player globallogic_spawn::waitandspawnclient();
			}
		}
	}
}

/*
	Name: spawnedasspectator
	Namespace: coop
	Checksum: 0x127F3FA1
	Offset: 0x2910
	Size: 0x18
	Parameters: 0
	Flags: Linked
*/
function spawnedasspectator()
{
	if(!isdefined(self.var_56e5037e))
	{
		return true;
	}
	return false;
}

/*
	Name: function_fd5dfc25
	Namespace: coop
	Checksum: 0x2C99CD30
	Offset: 0x2930
	Size: 0x2A2
	Parameters: 0
	Flags: None
*/
function function_fd5dfc25()
{
	self endon(#"death", #"disconnect");
	if(is_true(self.currentweapon.isheavyweapon))
	{
		return;
	}
	a_weaponlist = self getweaponslist();
	var_4fd19a76 = [];
	foreach(weapon in a_weaponlist)
	{
		if(is_true(weapon.isheavyweapon))
		{
			if(!isdefined(var_4fd19a76))
			{
				var_4fd19a76 = [];
			}
			else if(!isarray(var_4fd19a76))
			{
				var_4fd19a76 = array(var_4fd19a76);
			}
			var_4fd19a76[var_4fd19a76.size] = weapon;
		}
	}
	var_43dfbfaf = var_4fd19a76[0];
	if(isdefined(var_43dfbfaf))
	{
		if(self getweaponammoclip(var_43dfbfaf) + self getweaponammostock(var_43dfbfaf) > 0)
		{
			if(isdefined(self.var_444b2634))
			{
				if(gettime() - self.var_444b2634 > 90000)
				{
					switch(var_43dfbfaf.rootweapon.name)
					{
						case "launcher_standard":
						{
							if(self.var_83f25fdb < 5)
							{
								self util::show_hint_text(#"hash_3d4165067dc18a6b");
							}
							break;
						}
						case "spike_launcher":
						{
							if(self.var_83f25fdb < 10)
							{
								self util::show_hint_text(#"hash_9b1201effcb0c57");
							}
							break;
						}
						case "micromissile_launcher":
						{
							if(self.var_83f25fdb < 10)
							{
								self util::show_hint_text(#"hash_50d6975fce35fa60");
							}
							break;
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_bb5fae75
	Namespace: coop
	Checksum: 0x1F88D87B
	Offset: 0x2BE0
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function function_bb5fae75()
{
	self notify(#"hash_1d6b9f8f1e2663d9");
	self endon(#"death", #"hash_1d6b9f8f1e2663d9");
	var_543d6995 = 0;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_change");
		if(isdefined(waitresult.weapon))
		{
			if(is_true(waitresult.weapon.isheavyweapon))
			{
				if(!isdefined(self.var_83f25fdb))
				{
					self.var_83f25fdb = 0;
				}
				self thread function_b296ed1c();
				var_543d6995 = 1;
			}
			else
			{
				if(var_543d6995)
				{
					self.var_444b2634 = gettime();
				}
				self notify(#"hash_6afb6967ed216cca");
				var_543d6995 = 0;
			}
		}
	}
}

/*
	Name: function_b296ed1c
	Namespace: coop
	Checksum: 0x31E0BCF9
	Offset: 0x2CF8
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_b296ed1c()
{
	self endon(#"death", #"hash_6afb6967ed216cca");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_fired");
		if(is_true(waitresult.weapon.isheavyweapon))
		{
			self.var_83f25fdb++;
		}
	}
}

