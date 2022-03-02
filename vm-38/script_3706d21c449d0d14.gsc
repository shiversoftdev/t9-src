#using script_32399001bdb550da;
#using script_47fb62300ac0bd60;
#using script_5f2ba47ebe695e43;
#using script_62d87b28984d3246;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace gamedifficulty;

/*
	Name: function_1a891b4e
	Namespace: gamedifficulty
	Checksum: 0x40DF887
	Offset: 0x218
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1a891b4e()
{
	level notify(54497718);
}

/*
	Name: init
	Namespace: gamedifficulty
	Checksum: 0xC41EBBDC
	Offset: 0x238
	Size: 0x2C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	level.gameskill = 1;
	level.var_3426461d = &get_player_xp_difficulty_multiplier;
}

/*
	Name: setskill
	Namespace: gamedifficulty
	Checksum: 0xC9584A2C
	Offset: 0x270
	Size: 0xEC
	Parameters: 2
	Flags: Linked
*/
function setskill(reset, skill_override)
{
	if(!isdefined(level.script))
	{
		level.script = util::function_53bbf9d2();
	}
	if(!is_true(reset))
	{
		if(is_true(level.b_gameskillset))
		{
			return;
		}
		/#
			thread playerhealthdebug();
		#/
		level.b_gameskillset = 1;
	}
	level thread update_skill_level(skill_override);
	level.auto_adjust_threatbias = 1;
	set_difficulty_from_locked_settings();
	level function_4ba867b();
}

/*
	Name: apply_difficulty_var_with_func
	Namespace: gamedifficulty
	Checksum: 0x137431EC
	Offset: 0x368
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function apply_difficulty_var_with_func(difficulty_func)
{
	level.playerhealth_regularregendelay = get_player_health_regular_regen_delay();
	if(level.auto_adjust_threatbias)
	{
		thread apply_threat_bias_to_all_players(difficulty_func);
	}
	level.longregentime = get_long_regen_time();
	level.animation.misstimeconstant = get_miss_time_constant();
	level.animation.misstimedistancefactor = get_miss_time_distance_factor();
}

/*
	Name: apply_threat_bias_to_all_players
	Namespace: gamedifficulty
	Checksum: 0xD03713DC
	Offset: 0x410
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function apply_threat_bias_to_all_players(difficulty_func)
{
	level flag::wait_till("all_players_connected");
	players = level.players;
	for(i = 0; i < players.size; i++)
	{
		players[i].threatbias = int(get_player_threat_bias());
	}
}

/*
	Name: set_difficulty_from_locked_settings
	Namespace: gamedifficulty
	Checksum: 0x89DD1CA1
	Offset: 0x4B0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function set_difficulty_from_locked_settings()
{
	apply_difficulty_var_with_func(&get_locked_difficulty_val);
}

/*
	Name: get_locked_difficulty_val
	Namespace: gamedifficulty
	Checksum: 0x21A39797
	Offset: 0x4E0
	Size: 0x2E
	Parameters: 2
	Flags: Linked
*/
function get_locked_difficulty_val(msg, ignored)
{
	return level.difficultysettings[ignored][level.currentdifficulty];
}

/*
	Name: playerhealthdebug
	Namespace: gamedifficulty
	Checksum: 0x1EFF0CC
	Offset: 0x518
	Size: 0xD0
	Parameters: 0
	Flags: None
*/
function playerhealthdebug()
{
	/#
		waittillframeend();
		while(true)
		{
			while(true)
			{
				if(getdvarint(#"scr_health_debug", 0))
				{
					break;
				}
				wait(0.5);
			}
			thread printhealthdebug();
			while(true)
			{
				if(!getdvarint(#"scr_health_debug", 0))
				{
					break;
				}
				wait(0.5);
			}
			level notify(#"stop_printing_grenade_timers");
			destroyhealthdebug();
		}
	#/
}

/*
	Name: printhealthdebug
	Namespace: gamedifficulty
	Checksum: 0x2BC11A27
	Offset: 0x5F0
	Size: 0x616
	Parameters: 0
	Flags: None
*/
function printhealthdebug()
{
	/#
		level notify(#"stop_printing_health_bars");
		level endon(#"stop_printing_health_bars");
		y = 40;
		level.healthbarhudelems = [];
		level.healthbarkeys[0] = "";
		level.healthbarkeys[1] = "";
		level.healthbarkeys[2] = "";
		if(!isdefined(level.playerinvultimeend))
		{
			level.playerinvultimeend = 0;
		}
		if(!isdefined(level.var_30235742))
		{
			level.var_30235742 = 0;
		}
		for(i = 0; i < level.healthbarkeys.size; i++)
		{
			key = level.healthbarkeys[i];
			textelem = newdebughudelem();
			textelem.x = 150;
			textelem.y = y;
			textelem.alignx = "";
			textelem.aligny = "";
			textelem.horzalign = "";
			textelem.vertalign = "";
			textelem settext(key);
			bgbar = newdebughudelem();
			bgbar.x = 150 + 79;
			bgbar.y = y + 1;
			bgbar.z = 1;
			bgbar.alignx = "";
			bgbar.aligny = "";
			bgbar.horzalign = "";
			bgbar.vertalign = "";
			bgbar.maxwidth = 3;
			bgbar setshader(#"white", bgbar.maxwidth, 10);
			bgbar.color = vectorscale((1, 1, 1), 0.5);
			bar = newdebughudelem();
			bar.x = 150 + 80;
			bar.y = y + 2;
			bar.alignx = "";
			bar.aligny = "";
			bar.horzalign = "";
			bar.vertalign = "";
			bar setshader(#"black", 1, 8);
			bar.sort = 1;
			textelem.bar = bar;
			textelem.bgbar = bgbar;
			textelem.key = key;
			y = y + 10;
			level.healthbarhudelems[key] = textelem;
		}
		level flag::wait_till("");
		while(true)
		{
			waitframe(1);
			players = level.players;
			for(i = 0; i < level.healthbarkeys.size && players.size > 0; i++)
			{
				key = level.healthbarkeys[i];
				player = players[0];
				width = 0;
				if(i == 0)
				{
					width = (player.health / player.maxhealth) * 300;
					level.healthbarhudelems[key] settext((level.healthbarkeys[0] + "") + player.health);
				}
				else
				{
					if(i == 1)
					{
						width = ((level.playerinvultimeend - gettime()) / 1000) * 40;
					}
					else if(i == 2)
					{
						width = ((level.var_30235742 - gettime()) / 1000) * 40;
					}
				}
				width = int(max(width, 1));
				width = int(min(width, 300));
				bar = level.healthbarhudelems[key].bar;
				bar setshader(#"black", width, 8);
				bgbar = level.healthbarhudelems[key].bgbar;
				if(width + 2 > bgbar.maxwidth)
				{
					bgbar.maxwidth = width + 2;
					bgbar setshader(#"white", bgbar.maxwidth, 10);
					bgbar.color = vectorscale((1, 1, 1), 0.5);
				}
			}
		}
	#/
}

/*
	Name: destroyhealthdebug
	Namespace: gamedifficulty
	Checksum: 0x150E5655
	Offset: 0xC10
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function destroyhealthdebug()
{
	/#
		level notify(#"stop_printing_health_bars");
		if(!isdefined(level.healthbarhudelems))
		{
			return;
		}
		for(i = 0; i < level.healthbarkeys.size; i++)
		{
			level.healthbarhudelems[level.healthbarkeys[i]].bgbar destroy();
			level.healthbarhudelems[level.healthbarkeys[i]].bar destroy();
			level.healthbarhudelems[level.healthbarkeys[i]] destroy();
		}
	#/
}

/*
	Name: playerhurtcheck
	Namespace: gamedifficulty
	Checksum: 0xD054ADE2
	Offset: 0xD08
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function playerhurtcheck()
{
	self notify("54802cc95ae5ac77");
	self endon("54802cc95ae5ac77");
	self endon(#"death");
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(isdefined(waitresult.attacker) && isplayer(waitresult.attacker) && !is_true(isbot(waitresult.attacker)))
		{
			continue;
		}
		self.damagepoint = waitresult.position;
		self.damageattacker = waitresult.attacker;
		if(isdefined(waitresult.mod) && waitresult.mod == "MOD_BURNED")
		{
			self setburn(0.5);
			self playsound(#"chr_burn");
		}
		level notify(#"hit_again");
	}
}

/*
	Name: function_2339ca92
	Namespace: gamedifficulty
	Checksum: 0xE5976924
	Offset: 0xE68
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function function_2339ca92()
{
	player_death_invulnerability_time = get_player_death_invulnerable_time();
	if(player_death_invulnerability_time > 0)
	{
		self thread playerinvul(player_death_invulnerability_time);
	}
	/#
		level.playerinvultimeend = gettime() + (player_death_invulnerability_time * 1000);
	#/
}

/*
	Name: playerinvul
	Namespace: gamedifficulty
	Checksum: 0x42620DDA
	Offset: 0xEC8
	Size: 0x294
	Parameters: 1
	Flags: Linked, Private
*/
function private playerinvul(timer)
{
	self endon(#"death", #"disconnect");
	if(self flag::get("player_is_invulnerable"))
	{
		return;
	}
	self flag::set("player_is_invulnerable");
	level notify(#"player_becoming_invulnerable");
	var_ae0703af = self getnoncheckpointdata("DeathsDoorWarnings");
	var_5273c86b = self getnoncheckpointdata("DeathsDoorWarningTime");
	if((isdefined(var_ae0703af) ? var_ae0703af : 0) > 0 && getrealtime() >= (isdefined(var_5273c86b) ? var_5273c86b : 0) && !self flag::get("no_deaths_door_warning") && !isgodmode(self))
	{
		self setnoncheckpointdata("DeathsDoorWarnings", var_ae0703af - 1);
		self setnoncheckpointdata("DeathsDoorWarningTime", getrealtime() + 60000);
		self thread namespace_aa1fe617::create(#"hash_1b8a733f0d461a2c", [2:"no_deaths_door_warning", 1:#"healing", 0:#"hash_2b62b2990144ebf6"], 1, [1:"in_igc", 0:"death"]);
	}
	self thread monitor_player_death_invulnerability_eligibility();
	if(timer > 0)
	{
		function_fef4c10f(timer, 1);
	}
	self flag::clear("player_is_invulnerable");
}

/*
	Name: function_fef4c10f
	Namespace: gamedifficulty
	Checksum: 0x424CD420
	Offset: 0x1168
	Size: 0xF4
	Parameters: 2
	Flags: Linked
*/
function function_fef4c10f(timer, var_19c9196)
{
	if(!isdefined(var_19c9196))
	{
		var_19c9196 = 0;
	}
	if(var_19c9196)
	{
		self notify(#"hash_61ab322c075ab540");
	}
	else if(self flag::get("player_zero_attacker_accuracy"))
	{
		return;
	}
	self endon(#"hash_61ab322c075ab540", #"death");
	if(!isdefined(self.oldattackeraccuracy))
	{
		self.oldattackeraccuracy = self.attackeraccuracy;
	}
	else
	{
		/#
			assert(self.attackeraccuracy == 0, "");
		#/
	}
	self function_f5c273fc();
	wait(timer);
	self function_b9d6a17c();
}

/*
	Name: function_f5c273fc
	Namespace: gamedifficulty
	Checksum: 0x4805159A
	Offset: 0x1268
	Size: 0x2E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f5c273fc()
{
	self flag::set("player_zero_attacker_accuracy");
	self.attackeraccuracy = 0;
}

/*
	Name: function_b9d6a17c
	Namespace: gamedifficulty
	Checksum: 0x518B507E
	Offset: 0x12A0
	Size: 0x8A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b9d6a17c()
{
	self flag::clear("player_zero_attacker_accuracy");
	/#
		assert(isdefined(self.oldattackeraccuracy), "");
	#/
	/#
		assert(self.oldattackeraccuracy != 0, "");
	#/
	self.attackeraccuracy = self.oldattackeraccuracy;
	self.oldattackeraccuracy = undefined;
}

/*
	Name: monitor_player_death_invulnerability_eligibility
	Namespace: gamedifficulty
	Checksum: 0x1FCA54A6
	Offset: 0x1338
	Size: 0xBE
	Parameters: 0
	Flags: Linked, Private
*/
function private monitor_player_death_invulnerability_eligibility()
{
	self endon(#"death");
	self.eligible_for_death_invulnerability = 0;
	/#
		assert(self flag::get(""));
	#/
	self flag::wait_till_clear("player_is_invulnerable");
	cooldowntime = function_81e40993();
	/#
		level.var_30235742 = gettime() + (cooldowntime * 1000);
	#/
	wait(cooldowntime);
	self.eligible_for_death_invulnerability = 1;
}

/*
	Name: update_skill_level
	Namespace: gamedifficulty
	Checksum: 0xAC83D590
	Offset: 0x1400
	Size: 0x658
	Parameters: 1
	Flags: Linked
*/
function update_skill_level(skill_override)
{
	level notify(#"update_skill_from_profile");
	level endon(#"update_skill_from_profile");
	transient = savegame::get_mission_data(#"transient");
	if(!isdefined(transient.gameskilllowest))
	{
		transient.gameskilllowest = 9999;
	}
	if(!isdefined(transient.gameskillhighest))
	{
		transient.gameskillhighest = 0;
	}
	n_last_gameskill = -1;
	while(!isdefined(skill_override))
	{
		level.gameskill = getlocalprofileint("g_gameskill");
		/#
			var_89694459 = getdvarstring(#"hash_3617a5f5fe554488", "");
			switch(tolower(var_89694459))
			{
				case "recruit":
				{
					level.gameskill = 0;
					break;
				}
				case "regular":
				{
					level.gameskill = 1;
					break;
				}
				case "hardened":
				{
					level.gameskill = 2;
					break;
				}
				case "veteran":
				{
					level.gameskill = 3;
					break;
				}
				case "realistic":
				{
					level.gameskill = 4;
					break;
				}
			}
		#/
		if(level.gameskill != n_last_gameskill)
		{
			if(!isdefined(level.gameskill))
			{
				level.gameskill = 1;
			}
			switch(level.gameskill)
			{
				case 0:
				{
					setdvar(#"currentdifficulty", "recruit");
					level.currentdifficulty = "recruit";
					break;
				}
				case 1:
				{
					setdvar(#"currentdifficulty", "regular");
					level.currentdifficulty = "regular";
					break;
				}
				case 2:
				{
					setdvar(#"currentdifficulty", "hardened");
					level.currentdifficulty = "hardened";
					break;
				}
				case 3:
				{
					setdvar(#"currentdifficulty", "veteran");
					level.currentdifficulty = "veteran";
					break;
				}
				case 4:
				{
					setdvar(#"currentdifficulty", "realistic");
					level.currentdifficulty = "realistic";
					break;
				}
			}
			/#
				println("" + level.gameskill);
			#/
			setdvar(#"saved_gameskill", level.gameskill);
			setlocalprofilevar("g_gameskill", level.gameskill);
			if(level.gameskill < transient.gameskilllowest)
			{
				transient.gameskilllowest = level.gameskill;
			}
			if(level.gameskill > transient.gameskillhighest)
			{
				transient.gameskillhighest = level.gameskill;
			}
			level flag::wait_till("all_players_connected");
			foreach(player in getplayers())
			{
				player clientfield::set_player_uimodel("hudItems.serverDifficulty", level.gameskill);
				player stats::set_stat(#"currentdifficulty", level.gameskill);
				uploadstats(player);
				var_ae0703af = player getnoncheckpointdata("DeathsDoorWarnings");
				if(!isdefined(var_ae0703af) || n_last_gameskill == -1)
				{
					player setnoncheckpointdata("DeathsDoorWarnings", 4 - level.gameskill);
					continue;
				}
				player setnoncheckpointdata("DeathsDoorWarnings", int(max(0, (4 - level.gameskill) - ((4 - n_last_gameskill) - var_ae0703af))));
			}
			n_last_gameskill = level.gameskill;
		}
		wait(1);
	}
}

/*
	Name: setdiffstructarrays
	Namespace: gamedifficulty
	Checksum: 0xB1281BE0
	Offset: 0x1A60
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function setdiffstructarrays()
{
	if(!isdefined(level.s_game_difficulty))
	{
		level.s_game_difficulty = [];
		level.s_game_difficulty[0] = getscriptbundle(#"gamedifficulty_recruit");
		level.s_game_difficulty[1] = getscriptbundle(#"gamedifficulty_regular");
		level.s_game_difficulty[2] = getscriptbundle(#"gamedifficulty_hardened");
		level.s_game_difficulty[3] = getscriptbundle(#"gamedifficulty_veteran");
		level.s_game_difficulty[4] = getscriptbundle(#"gamedifficulty_realistic");
	}
}

/*
	Name: get_player_threat_bias
	Namespace: gamedifficulty
	Checksum: 0xA63E9D91
	Offset: 0x1B78
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_player_threat_bias()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].threatbias;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_player_xp_difficulty_multiplier
	Namespace: gamedifficulty
	Checksum: 0xCB4CFF13
	Offset: 0x1BD0
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function get_player_xp_difficulty_multiplier(event)
{
	setdiffstructarrays();
	diff_xp_mult = level.s_game_difficulty[level.gameskill].difficulty_xp_multiplier;
	if(isdefined(diff_xp_mult))
	{
		return diff_xp_mult;
	}
	return 1;
}

/*
	Name: get_health_overlay_cutoff
	Namespace: gamedifficulty
	Checksum: 0xB183318A
	Offset: 0x1C38
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function get_health_overlay_cutoff()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].healthoverlaycutoff;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_enemy_pain_chance
	Namespace: gamedifficulty
	Checksum: 0x8873C6CE
	Offset: 0x1C90
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function get_enemy_pain_chance()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].enemypainchance;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_player_death_invulnerable_time
	Namespace: gamedifficulty
	Checksum: 0x9D399788
	Offset: 0x1CF8
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_player_death_invulnerable_time()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].player_deathinvulnerabletime;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: function_81e40993
	Namespace: gamedifficulty
	Checksum: 0xAB8C33D0
	Offset: 0x1D50
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_81e40993()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].var_40865ff8;
	return true;
}

/*
	Name: get_base_enemy_accuracy
	Namespace: gamedifficulty
	Checksum: 0x6E360F6
	Offset: 0x1DA8
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function get_base_enemy_accuracy()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].base_enemy_accuracy;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_player_difficulty_health
	Namespace: gamedifficulty
	Checksum: 0x8D969AF4
	Offset: 0x1E00
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function get_player_difficulty_health()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].playerdifficultyhealth;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 100;
}

/*
	Name: get_miss_time_constant
	Namespace: gamedifficulty
	Checksum: 0x520109D9
	Offset: 0x1E60
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_miss_time_constant()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].misstimeconstant;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_miss_time_reset_delay
	Namespace: gamedifficulty
	Checksum: 0x8AFA7DAE
	Offset: 0x1EB8
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function get_miss_time_reset_delay()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].misstimeresetdelay;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_miss_time_distance_factor
	Namespace: gamedifficulty
	Checksum: 0xB8C1FD15
	Offset: 0x1F10
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_miss_time_distance_factor()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].misstimedistancefactor;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_dog_health
	Namespace: gamedifficulty
	Checksum: 0x9E52F5C6
	Offset: 0x1F68
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function get_dog_health()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].dog_health;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_dog_press_time
	Namespace: gamedifficulty
	Checksum: 0xDCEF65E0
	Offset: 0x1FC0
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function get_dog_press_time()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].dog_presstime;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_dog_hits_before_kill
	Namespace: gamedifficulty
	Checksum: 0x9775EAF8
	Offset: 0x2018
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function get_dog_hits_before_kill()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].dog_hits_before_kill;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_long_regen_time
	Namespace: gamedifficulty
	Checksum: 0xCB82A727
	Offset: 0x2070
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_long_regen_time()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].longregentime;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_player_health_regular_regen_delay
	Namespace: gamedifficulty
	Checksum: 0xC33C432C
	Offset: 0x20C8
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_player_health_regular_regen_delay()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].playerhealth_regularregendelay;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: get_worthy_damage_ratio
	Namespace: gamedifficulty
	Checksum: 0xA5FC9D77
	Offset: 0x2120
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_worthy_damage_ratio()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].worthydamageratio;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 0;
}

/*
	Name: function_b5b7d60e
	Namespace: gamedifficulty
	Checksum: 0x67CC3DDE
	Offset: 0x2178
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function function_b5b7d60e()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].var_b768020b;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 2;
}

/*
	Name: function_5151f9d0
	Namespace: gamedifficulty
	Checksum: 0xFD88C8EC
	Offset: 0x21D8
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function function_5151f9d0()
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].var_5657206f;
	if(isdefined(diff_struct_value))
	{
		return diff_struct_value;
	}
	return 4.5;
}

/*
	Name: function_52f56aea
	Namespace: gamedifficulty
	Checksum: 0x2EAB4A73
	Offset: 0x2238
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_52f56aea(var_d020b056)
{
	setdiffstructarrays();
	diff_struct_value = level.s_game_difficulty[level.gameskill].var_bb4e24d2;
	if(isdefined(diff_struct_value))
	{
		misstime = diff_struct_value;
	}
	else
	{
		misstime = 0.3;
	}
	scalar = 1;
	if(var_d020b056 === "fullauto")
	{
		scalar = 0.5;
	}
	else if(var_d020b056 === "singleshot")
	{
		scalar = 1.5;
	}
	return misstime * scalar;
}

/*
	Name: get_general_difficulty_level
	Namespace: gamedifficulty
	Checksum: 0x55B02C02
	Offset: 0x2300
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function get_general_difficulty_level()
{
	value = (level.gameskill + level.players.size) - 1;
	if(value < 0)
	{
		value = 0;
	}
	return value;
}

/*
	Name: player_eligible_for_death_invulnerability
	Namespace: gamedifficulty
	Checksum: 0x8544593D
	Offset: 0x2348
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function player_eligible_for_death_invulnerability()
{
	player = self;
	if(get_player_death_invulnerable_time() == 0)
	{
		return 0;
	}
	return is_true(self.eligible_for_death_invulnerability);
}

/*
	Name: adjust_melee_damage
	Namespace: gamedifficulty
	Checksum: 0x220E8AD9
	Offset: 0x2398
	Size: 0xE8
	Parameters: 7
	Flags: Linked
*/
function adjust_melee_damage(player, eattacker, einflictor, idamage, weapon, shitloc, smeansofdamage)
{
	if(smeansofdamage == "MOD_MELEE" || smeansofdamage == "MOD_MELEE_WEAPON_BUTT" && isentity(weapon) && !isplayer(weapon))
	{
		if(isactor(weapon))
		{
			var_c86b4d97 = int(get_player_difficulty_health() * 0.8);
			return var_c86b4d97;
		}
	}
	return shitloc;
}

/*
	Name: function_23dcd1f6
	Namespace: gamedifficulty
	Checksum: 0xB978CAA9
	Offset: 0x2488
	Size: 0xE2
	Parameters: 7
	Flags: Linked
*/
function function_23dcd1f6(player, eattacker, einflictor, idamage, weapon, shitloc, smeansofdamage)
{
	var_68bc2059 = float(get_player_difficulty_health());
	/#
		assert(var_68bc2059 > 0);
	#/
	var_86342214 = float(100) / var_68bc2059;
	return max(smeansofdamage * var_86342214, min(1, smeansofdamage));
}

/*
	Name: function_4ba867b
	Namespace: gamedifficulty
	Checksum: 0x10F99EB9
	Offset: 0x2578
	Size: 0x284
	Parameters: 0
	Flags: Linked
*/
function function_4ba867b()
{
	setdiffstructarrays();
	var_938ce325 = level.s_game_difficulty[level.gameskill].player_laststandbleedouttime;
	var_4cfdf1fc = level.s_game_difficulty[level.gameskill].var_949c9924;
	var_22e7a516 = level.s_game_difficulty[level.gameskill].var_fe22f9a7;
	var_33682ca0 = level.s_game_difficulty[level.gameskill].var_58500288;
	var_fd9d63a8 = level.s_game_difficulty[level.gameskill].var_e03c2f91;
	var_dd639ef7 = level.s_game_difficulty[level.gameskill].var_1bc10f3a;
	var_8c4f976a = level.s_game_difficulty[level.gameskill].var_c5c20d41;
	var_88dcf868 = level.s_game_difficulty[level.gameskill].var_4ca741c2;
	var_8f59489c = level.s_game_difficulty[level.gameskill].var_e3e8d3a1;
	var_880dfe56 = level.s_game_difficulty[level.gameskill].var_7b55ea2b;
	setdvar(#"player_laststandbleedouttime", var_938ce325);
	setdvar(#"hash_7036719f41a78d54", var_4cfdf1fc);
	setdvar(#"hash_1038d42009d25460", var_22e7a516);
	setdvar(#"hash_6e3f1e26256fe0b5", var_33682ca0);
	setdvar(#"hash_3a7c5052ef581676", var_fd9d63a8);
	level.var_a4107aed = var_fd9d63a8;
	level.var_cf393bff = var_dd639ef7;
	level.var_a164210a = var_8c4f976a;
	level.var_a6a26da0 = var_88dcf868;
	level.var_1cac200a = var_8f59489c;
	level.var_22895486 = var_880dfe56;
}

