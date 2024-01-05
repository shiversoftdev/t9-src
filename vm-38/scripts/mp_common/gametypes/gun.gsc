#using scripts\mp_common\draft.gsc;
#using scripts\abilities\ability_util.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using script_1cc417743d7c262d;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\spawning_shared.gsc;
#using script_335d0650ed05d36d;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace gun;

/*
	Name: function_c5e02cf7
	Namespace: gun
	Checksum: 0x8A3E6B4D
	Offset: 0x238
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c5e02cf7()
{
	level notify(793384616);
}

/*
	Name: main
	Namespace: gun
	Checksum: 0x521E5D9F
	Offset: 0x258
	Size: 0x21C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	globallogic::init();
	level.onstartgametype = &onstartgametype;
	level.onspawnplayer = &onspawnplayer;
	player::function_cf3aa03d(&onplayerkilled);
	level.onendgame = &onendgame;
	level.var_a962eeb6 = &function_486a8395;
	callback::on_connect(&onconnect);
	level.givecustomloadout = &givecustomloadout;
	level.setbacksperdemotion = getgametypesetting(#"setbacks");
	level.inactivitykick = 120;
	level.var_f46d16f0 = 1;
	level.var_48ca10f7 = 1;
	level.var_ce802423 = 1;
	level.var_34842a14 = 1;
	setdvar(#"hash_137c8b2b96ac6c72", 0.2);
	setdvar(#"compassradarpingfadetime", 0.75);
	spawning::addsupportedspawnpointtype("ffa");
	level.gunprogression = [];
	gunlist = getgametypesetting(#"gunselection");
	function_9ffa772e(gunlist);
	/#
		level thread init_devgui();
	#/
}

/*
	Name: onconnect
	Namespace: gun
	Checksum: 0x80F724D1
	Offset: 0x480
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function onconnect()
{
}

/*
	Name: onstartgametype
	Namespace: gun
	Checksum: 0x401010B6
	Offset: 0x490
	Size: 0x70
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	level.gungamekillscore = rank::getscoreinfovalue("kill_gun");
	util::registerscorelimit(level.gunprogression.size * level.gungamekillscore, level.gunprogression.size * level.gungamekillscore);
	level.displayroundendtext = 0;
}

/*
	Name: inactivitykick
	Namespace: gun
	Checksum: 0x4B9019C7
	Offset: 0x508
	Size: 0x184
	Parameters: 0
	Flags: None
*/
function inactivitykick()
{
	self endon(#"disconnect", #"death");
	if(sessionmodeisprivate())
	{
		return;
	}
	if(level.inactivitykick == 0)
	{
		return;
	}
	while(level.inactivitykick > self.timeplayed[#"total"])
	{
		wait(1);
	}
	if(self.pers[#"participation"] == 0 && self.time_played_moving < 1)
	{
		globallogic::gamehistoryplayerkicked();
		kick(self getentitynumber(), "GAME/DROPPEDFORINACTIVITY");
	}
	if(self.pers[#"participation"] == 0 && self.timeplayed[#"total"] > 60)
	{
		globallogic::gamehistoryplayerkicked();
		kick(self getentitynumber(), "GAME/DROPPEDFORINACTIVITY");
	}
}

/*
	Name: onspawnplayer
	Namespace: gun
	Checksum: 0x36BDB552
	Offset: 0x698
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function onspawnplayer(predictedspawn)
{
	if(!level.inprematchperiod)
	{
		spawning::function_7a87efaa();
	}
	spawning::onspawnplayer(predictedspawn);
	self thread infiniteammo();
	self thread inactivitykick();
}

/*
	Name: onplayerkilled
	Namespace: gun
	Checksum: 0x669688C2
	Offset: 0x718
	Size: 0x254
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	spawning::function_7a87efaa();
	if(psoffsettime == "MOD_SUICIDE" || psoffsettime == "MOD_TRIGGER_HURT")
	{
		self thread demoteplayer();
		return;
	}
	if(isdefined(shitloc) && isplayer(shitloc))
	{
		if(shitloc == self)
		{
			self thread demoteplayer(shitloc);
			return;
		}
		if(isdefined(shitloc.lastpromotiontime) && (shitloc.lastpromotiontime + 3000) > gettime())
		{
			scoreevents::processscoreevent(#"kill_in_3_seconds_gun", shitloc, self, deathanimduration);
		}
		if(weapons::ismeleemod(psoffsettime) || psoffsettime === "MOD_EXECUTION")
		{
			scoreevents::processscoreevent(#"humiliation_gun", shitloc, self, deathanimduration);
			if(globallogic_score::gethighestscoringplayer() === self)
			{
				scoreevents::processscoreevent(#"melee_leader_gun", shitloc, self, deathanimduration);
			}
			self thread demoteplayer(shitloc);
		}
		attackerweapon = shitloc getcurrentweapon();
		if(psoffsettime != "MOD_MELEE_WEAPON_BUTT" && (psoffsettime != "MOD_EXECUTION" || attackerweapon.type === "melee"))
		{
			shitloc thread promoteplayer(deathanimduration);
		}
	}
}

/*
	Name: onendgame
	Namespace: gun
	Checksum: 0x86E6EBEA
	Offset: 0x978
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function onendgame(var_c1e98979)
{
	player = round::function_b5f4c9d8();
	match::set_winner(player);
}

/*
	Name: function_9ffa772e
	Namespace: gun
	Checksum: 0x14659062
	Offset: 0x9C0
	Size: 0x464
	Parameters: 1
	Flags: None
*/
function function_9ffa772e(var_ad9f582e)
{
	if(!isdefined(var_ad9f582e))
	{
		var_ad9f582e = 0;
	}
	loadouts = getscriptbundle(#"hash_64fc10899d9faf46");
	if(!isdefined(loadouts))
	{
		/#
			assertmsg("");
		#/
		return;
	}
	var_4509f8e = (isdefined(loadouts.var_4509f8e) ? loadouts.var_4509f8e : []);
	if(var_4509f8e.size == 0)
	{
		/#
			assertmsg("");
		#/
		return;
	}
	if(var_ad9f582e < 7)
	{
		weaponslist = var_4509f8e[var_ad9f582e];
	}
	else
	{
		var_ad9f582e = randomint(var_4509f8e.size);
		weaponslist = var_4509f8e[var_ad9f582e];
	}
	if(!isdefined(weaponslist))
	{
		/#
			assertmsg(("" + var_ad9f582e) + "");
		#/
		return;
	}
	tiers = (isdefined(weaponslist.tiers) ? weaponslist.tiers : []);
	foreach(tier in tiers)
	{
		if(!isdefined(tier.options))
		{
			arrayremoveindex(tiers, i);
		}
	}
	if(tiers.size == 0)
	{
		/#
			assertmsg(("" + var_ad9f582e) + "");
		#/
		return;
	}
	foreach(tier in tiers)
	{
		options = (isdefined(tier.options) ? tier.options : []);
		foreach(option in options)
		{
			if(!isdefined(option.weapon))
			{
				arrayremoveindex(options, i);
			}
		}
		if(options.size == 0)
		{
			continue;
		}
		option = options[randomint(options.size)];
		if(!isdefined(option))
		{
			continue;
		}
		weapon = option.weapon;
		if(!isdefined(weapon))
		{
			continue;
		}
		attachments = (isdefined(option.attachments) ? option.attachments : "");
		var_2a456654 = (option.var_b704d026 === 1 ? option.var_2a456654 : -1);
		addguntoprogression(weapon.name, attachments, var_2a456654);
	}
	/#
		assert(level.gunprogression.size > 0, ("" + var_ad9f582e) + "");
	#/
}

/*
	Name: addguntoprogression
	Namespace: gun
	Checksum: 0x1351A56E
	Offset: 0xE30
	Size: 0x110
	Parameters: 3
	Flags: None
*/
function addguntoprogression(weaponname, var_45f60e0f, var_2a456654)
{
	if(!isdefined(var_2a456654))
	{
		var_2a456654 = 0;
	}
	if(isdefined(var_2a456654) && var_2a456654 > -1)
	{
		var_2a456654++;
		var_c4af33 = function_f62a996b(weaponname, var_2a456654);
		weapon = var_c4af33.weapon;
		var_e91aba42 = var_c4af33.var_fd90b0bb;
	}
	else
	{
		attachments = strtok(var_45f60e0f, " ");
		weapon = getweapon(weaponname, attachments);
	}
	weaponstruct = {};
	weaponstruct.weapon = weapon;
	weaponstruct.var_f879230e = var_e91aba42;
	level.gunprogression[level.gunprogression.size] = weaponstruct;
}

/*
	Name: takeoldweapon
	Namespace: gun
	Checksum: 0xE8ED6064
	Offset: 0xF48
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function takeoldweapon(oldweapon)
{
	self endon(#"death", #"disconnect");
	wait(1);
	self takeweapon(oldweapon);
}

/*
	Name: givecustomloadout
	Namespace: gun
	Checksum: 0x646911C1
	Offset: 0xFA0
	Size: 0x48C
	Parameters: 1
	Flags: None
*/
function givecustomloadout(takeoldweapon)
{
	if(!isdefined(takeoldweapon))
	{
		takeoldweapon = 0;
	}
	self loadout::init_player(!takeoldweapon);
	self function_e6f9e3cd();
	self clearperks();
	perks = self getloadoutperks(0);
	foreach(perk in perks)
	{
		self setperk(perk);
	}
	if(takeoldweapon)
	{
		oldweapon = self getcurrentweapon();
		weapons = self getweaponslist();
		foreach(weapon in weapons)
		{
			if(weapon != oldweapon)
			{
				self takeweapon(weapon);
			}
		}
		self thread takeoldweapon(oldweapon);
	}
	if(!isdefined(self.gunprogress))
	{
		self.gunprogress = 0;
	}
	currentweapon = level.gunprogression[self.gunprogress].weapon;
	var_40aa936b = level.gunprogression[self.gunprogress].var_f879230e;
	self giveweapon(currentweapon, undefined, var_40aa936b);
	self shoulddoinitialweaponraise(currentweapon, 0);
	self switchtoweapon(currentweapon);
	if(self.firstspawn !== 0)
	{
		self setspawnweapon(currentweapon);
	}
	primaryoffhand = level.var_34d27b26;
	primaryoffhandcount = 0;
	self giveweapon(primaryoffhand);
	self setweaponammostock(primaryoffhand, primaryoffhandcount);
	self switchtooffhand(primaryoffhand);
	e_whippings = 1;
	if(!e_whippings)
	{
		secondaryoffhand = getweapon(#"gadget_health_regen");
		secondaryoffhandcount = 0;
		self giveweapon(secondaryoffhand);
		self setweaponammoclip(secondaryoffhand, secondaryoffhandcount);
		self switchtooffhand(secondaryoffhand);
		loadout = self loadout::get_loadout_slot("secondarygrenade");
		loadout.weapon = secondaryoffhand;
		loadout.count = secondaryoffhandcount;
		self ability_util::function_36a15b60(secondaryoffhand);
	}
	actionslot3 = (getdvarint(#"hash_449fa75f87a4b5b4", 0) > 0 ? "ping_callouts" : "flourish_callouts");
	self setactionslot(3, actionslot3);
	self loadout::function_6573eeeb();
}

/*
	Name: promoteplayer
	Namespace: gun
	Checksum: 0xDD51875A
	Offset: 0x1438
	Size: 0x1A6
	Parameters: 1
	Flags: None
*/
function promoteplayer(weaponused)
{
	self endon(#"disconnect", #"cancel_promotion");
	level endon(#"game_ended");
	waitframe(1);
	weapon = level.gunprogression[self.gunprogress].weapon;
	if(weaponused.rootweapon == weapon.rootweapon || (isdefined(weapon.dualwieldweapon) && weapon.dualwieldweapon.rootweapon == weaponused.rootweapon))
	{
		if(self.gunprogress < level.gunprogression.size - 1)
		{
			self.gunprogress++;
			if(isalive(self))
			{
				self thread givecustomloadout(1);
				self thread function_5c23e4f5();
			}
		}
		pointstowin = self.pers[#"pointstowin"];
		if(pointstowin < level.scorelimit)
		{
			scoreevents::processscoreevent(#"kill_gun", self, undefined, weaponused);
			self globallogic_score::givepointstowin(level.gungamekillscore);
		}
		self.lastpromotiontime = gettime();
	}
}

/*
	Name: demoteplayer
	Namespace: gun
	Checksum: 0xC101F051
	Offset: 0x15E8
	Size: 0x2EC
	Parameters: 1
	Flags: None
*/
function demoteplayer(attacker)
{
	self endon(#"disconnect");
	self notify(#"cancel_promotion");
	currentgunprogress = self.gunprogress;
	for(i = 0; i < level.setbacksperdemotion; i++)
	{
		if(self.gunprogress <= 0)
		{
			break;
		}
		self globallogic_score::givepointstowin(level.gungamekillscore * -1);
		globallogic_score::_setplayerscore(self, self.score - level.gungamekillscore);
		self.gunprogress--;
		self thread function_5c23e4f5();
	}
	if(currentgunprogress != self.gunprogress && isalive(self))
	{
		self thread givecustomloadout(1);
	}
	if(isdefined(attacker))
	{
		self stats::function_bb7eedf0(#"humiliate_attacker", 1);
		attacker recordgameevent("capture");
		level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"capture", #player:attacker});
	}
	self stats::function_bb7eedf0(#"humiliate_victim", 1);
	self.pers[#"humiliated"]++;
	self.humiliated = self.pers[#"humiliated"];
	self recordgameevent("return");
	level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"return", #player:self});
	self playlocalsound(#"mpl_wager_humiliate");
	self globallogic_audio::leader_dialog_on_player("humiliated");
}

/*
	Name: infiniteammo
	Namespace: gun
	Checksum: 0xE1618B66
	Offset: 0x18E0
	Size: 0x70
	Parameters: 0
	Flags: None
*/
function infiniteammo()
{
	self endon(#"death", #"disconnect");
	while(true)
	{
		wait(0.1);
		weapon = self getcurrentweapon();
		self givemaxammo(weapon);
	}
}

/*
	Name: function_486a8395
	Namespace: gun
	Checksum: 0x662AB79E
	Offset: 0x1958
	Size: 0x116
	Parameters: 0
	Flags: None
*/
function function_486a8395()
{
	ruleweaponsleft = 3;
	/#
	#/
	minweaponsleft = level.gunprogression.size;
	foreach(player in function_a1ef346b())
	{
		if(!isdefined(player))
		{
			continue;
		}
		if(!isdefined(player.gunprogress))
		{
			continue;
		}
		weaponsleft = level.gunprogression.size - player.gunprogress;
		if(minweaponsleft > weaponsleft)
		{
			minweaponsleft = weaponsleft;
		}
		if(ruleweaponsleft >= minweaponsleft)
		{
			/#
			#/
			return false;
		}
	}
	/#
	#/
	return true;
}

/*
	Name: function_5c23e4f5
	Namespace: gun
	Checksum: 0x8B0E65BE
	Offset: 0x1A78
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_5c23e4f5()
{
	if(is_true(level.var_2179a6bf))
	{
		return;
	}
	if(self.gunprogress >= 18)
	{
		level thread globallogic_audio::set_music_global("timeout_loop");
		level.var_2179a6bf = 1;
		return;
	}
	if(self.gunprogress >= 15)
	{
		self function_130d4cfc();
	}
	else
	{
		self function_cfef3f4c();
	}
}

/*
	Name: function_130d4cfc
	Namespace: gun
	Checksum: 0xD840B8DA
	Offset: 0x1B28
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function function_130d4cfc()
{
	if(!isdefined(self.var_227573ea))
	{
		self.var_227573ea = 0;
	}
	if(!is_true(self.var_227573ea))
	{
		self thread globallogic_audio::function_c246758e("taco_music");
		self.var_227573ea = 1;
	}
}

/*
	Name: function_cfef3f4c
	Namespace: gun
	Checksum: 0xB9811EE4
	Offset: 0x1B98
	Size: 0x5E
	Parameters: 0
	Flags: None
*/
function function_cfef3f4c()
{
	if(!isdefined(self.var_227573ea))
	{
		self.var_227573ea = 0;
	}
	if(is_true(self.var_227573ea))
	{
		self thread globallogic_audio::function_c246758e("none");
		self.var_227573ea = 0;
	}
}

/*
	Name: init_devgui
	Namespace: gun
	Checksum: 0x9D0ACB8E
	Offset: 0x1C00
	Size: 0xAC
	Parameters: 0
	Flags: Private
*/
function private init_devgui()
{
	/#
		util::init_dvar(#"hash_30c63c4ab5be356f", 0, &function_9209a6f8);
		util::init_dvar(#"hash_62d3e4c605defe30", 0, &function_98c43bf8);
		util::waittill_can_add_debug_command();
		adddebugcommand("");
		adddebugcommand("");
	#/
}

/*
	Name: function_9209a6f8
	Namespace: gun
	Checksum: 0xD806B5C6
	Offset: 0x1CB8
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private function_9209a6f8(params)
{
	/#
		level notify(#"hash_a1e5a52aeb09e3c");
		if(params.value)
		{
			thread function_7b2c84d4();
		}
	#/
}

/*
	Name: function_7b2c84d4
	Namespace: gun
	Checksum: 0xF172610D
	Offset: 0x1D10
	Size: 0x28C
	Parameters: 0
	Flags: Private
*/
function private function_7b2c84d4()
{
	/#
		player = getplayers()[0];
		if(!isdefined(player))
		{
			return;
		}
		player endon(#"disconnect");
		level endon(#"game_ended");
		foreach(i, weaponstruct in level.gunprogression)
		{
			if(!isalive(player))
			{
				break;
			}
			weapon = weaponstruct.weapon;
			var_f879230e = weaponstruct.var_f879230e;
			player takeweapon(player getcurrentweapon());
			player giveweapon(weapon, undefined, var_f879230e);
			player iprintlnbold((((("" + (i + 1)) + "") + level.gunprogression.size) + "") + function_a16a090d(weapon));
			result = undefined;
			result = level waittilltimeout(3, #"hash_a1e5a52aeb09e3c");
			if(result._notify == "")
			{
				break;
			}
		}
		var_6a77fbb4 = player getcurrentweapon();
		var_b348ce28 = level.gunprogression[player.gunprogress].weapon;
		player thread givecustomloadout(var_6a77fbb4 !== var_b348ce28);
		setdvar(#"hash_30c63c4ab5be356f", 0);
	#/
}

/*
	Name: function_98c43bf8
	Namespace: gun
	Checksum: 0xEE8C23C9
	Offset: 0x1FA8
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private function_98c43bf8(params)
{
	/#
		level notify(#"hash_1cab686e68228dff");
		if(params.value)
		{
			thread function_c13efc2d();
		}
	#/
}

/*
	Name: function_c13efc2d
	Namespace: gun
	Checksum: 0x7780E954
	Offset: 0x2000
	Size: 0x1A2
	Parameters: 0
	Flags: Private
*/
function private function_c13efc2d()
{
	/#
		level endon(#"game_ended", #"hash_1cab686e68228dff");
		baseorigin = (350, 70, 0);
		var_e97558ce = vectorscale((0, 1, 0), 25);
		while(true)
		{
			debug2dtext(baseorigin, "", (0, 1, 1), 1, (0, 0, 0), 0.8);
			foreach(i, weaponstruct in level.gunprogression)
			{
				origin = baseorigin + ((i + 1) * var_e97558ce);
				string = (("" + (i + 1)) + "") + function_a16a090d(weaponstruct.weapon);
				debug2dtext(origin, string, (1, 1, 1), 1, (0, 0, 0), 0.8);
			}
			waitframe(1);
		}
	#/
}

