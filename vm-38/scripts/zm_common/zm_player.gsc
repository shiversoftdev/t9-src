#using script_4194df57536e11ed;
#using script_3751b21462a54a7d;
#using script_5f261a5d57de5f7c;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\zm_common\bots\zm_bot.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\gametypes\globallogic_scriptmover.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\gametypes\globallogic_spawn.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\zm_common\scoreevents.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_32c8b5b0eb2854f3;
#using script_35598499769dbb3d;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\drown.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\globallogic\globallogic_vehicle.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\status_effects\status_effects.gsc;
#using script_45fdb6cec5580007;
#using script_6167e26342be354b;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_player;

/*
	Name: function_c45593a
	Namespace: zm_player
	Checksum: 0xF9F70D2D
	Offset: 0x6E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c45593a()
{
	level notify(1377278934);
}

/*
	Name: __init__system__
	Namespace: zm_player
	Checksum: 0x55C8693D
	Offset: 0x700
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_player
	Checksum: 0x9E4F8AA0
	Offset: 0x748
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_spawned(&function_34c2aeb5);
}

/*
	Name: function_34c2aeb5
	Namespace: zm_player
	Checksum: 0xCB08BAEA
	Offset: 0x778
	Size: 0xDA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_34c2aeb5()
{
	n_target = int(max(zombie_utility::function_d2dfacfd(#"player_base_health"), 1));
	self.var_66cb03ad = n_target;
	self.maxhealth = n_target;
	self setmaxhealth(n_target);
	self zm_utility::set_max_health();
	self.n_regen_delay = zombie_utility::function_d2dfacfd("player_health_regen_delay");
	self.n_regen_rate = zombie_utility::function_d2dfacfd("player_health_regen_rate");
}

/*
	Name: getallotherplayers
	Namespace: zm_player
	Checksum: 0x3A857350
	Offset: 0x860
	Size: 0xAA
	Parameters: 0
	Flags: None
*/
function getallotherplayers()
{
	aliveplayers = [];
	for(i = 0; i < level.players.size; i++)
	{
		if(!isdefined(level.players[i]))
		{
			continue;
		}
		player = level.players[i];
		if(player.sessionstate != "playing" || player == self)
		{
			continue;
		}
		aliveplayers[aliveplayers.size] = player;
	}
	return aliveplayers;
}

/*
	Name: updateplayernum
	Namespace: zm_player
	Checksum: 0xA68D4C8D
	Offset: 0x918
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function updateplayernum(player)
{
	if(!isdefined(player.playernum))
	{
		if(player.team == #"allies")
		{
			if(!isdefined(game._team1_num))
			{
				game._team1_num = 0;
			}
			player.playernum = game._team1_num;
			game._team1_num = player.playernum + 1;
		}
		else
		{
			if(!isdefined(game._team2_num))
			{
				game._team2_num = 0;
			}
			player.playernum = game._team2_num;
			game._team2_num = player.playernum + 1;
		}
	}
}

/*
	Name: getfreespawnpoint
	Namespace: zm_player
	Checksum: 0x90F9EEE2
	Offset: 0x9F0
	Size: 0x3DA
	Parameters: 2
	Flags: Linked
*/
function getfreespawnpoint(spawnpoints, player)
{
	if(!isdefined(spawnpoints))
	{
		/#
			iprintlnbold("");
		#/
		return undefined;
	}
	if(!isdefined(game.spawns_randomized))
	{
		game.spawns_randomized = 1;
		spawnpoints = array::randomize(spawnpoints);
		random_chance = randomint(100);
		if(random_chance > 50)
		{
			game.side_selection = 1;
		}
		else
		{
			game.side_selection = 2;
		}
	}
	side_selection = game.side_selection;
	if(game.switchedsides)
	{
		if(side_selection == 2)
		{
			side_selection = 1;
		}
		else if(side_selection == 1)
		{
			side_selection = 2;
		}
	}
	if(isdefined(player) && isdefined(player.team))
	{
		i = 0;
		while(isdefined(spawnpoints) && i < spawnpoints.size)
		{
			if(side_selection == 1)
			{
				if(player.team != #"allies" && (isdefined(spawnpoints[i].script_int) && spawnpoints[i].script_int == 1))
				{
					arrayremovevalue(spawnpoints, spawnpoints[i]);
					i = 0;
				}
				else
				{
					if(player.team == #"allies" && (isdefined(spawnpoints[i].script_int) && spawnpoints[i].script_int == 2))
					{
						arrayremovevalue(spawnpoints, spawnpoints[i]);
						i = 0;
					}
					else
					{
						i++;
					}
				}
			}
			else
			{
				if(player.team == #"allies" && (isdefined(spawnpoints[i].script_int) && spawnpoints[i].script_int == 1))
				{
					arrayremovevalue(spawnpoints, spawnpoints[i]);
					i = 0;
				}
				else
				{
					if(player.team != #"allies" && (isdefined(spawnpoints[i].script_int) && spawnpoints[i].script_int == 2))
					{
						arrayremovevalue(spawnpoints, spawnpoints[i]);
						i = 0;
					}
					else
					{
						i++;
					}
				}
			}
		}
	}
	updateplayernum(player);
	for(j = 0; j < spawnpoints.size; j++)
	{
		if(!isdefined(spawnpoints[j].en_num))
		{
			for(m = 0; m < spawnpoints.size; m++)
			{
				spawnpoints[m].en_num = m;
			}
		}
		if(spawnpoints[j].en_num == player.playernum)
		{
			return spawnpoints[j];
		}
	}
	return spawnpoints[0];
}

/*
	Name: player_track_ammo_count
	Namespace: zm_player
	Checksum: 0x265BE3A1
	Offset: 0xDD8
	Size: 0x382
	Parameters: 0
	Flags: Linked
*/
function player_track_ammo_count()
{
	self notify(#"stop_ammo_tracking");
	self endon(#"disconnect", #"stop_ammo_tracking");
	ammolowcount = 0;
	ammooutcount = 0;
	while(true)
	{
		wait(0.5);
		weapon = self getcurrentweapon();
		if(weapon == level.weaponnone || weapon.skiplowammovox)
		{
			continue;
		}
		if(is_true(weapon.isheroweapon))
		{
			continue;
		}
		if(weapon.type == "grenade")
		{
			continue;
		}
		ammocount = self getammocount(weapon);
		ammoclip = self getweaponammoclip(weapon);
		ammostock = self getweaponammostock(weapon);
		if(weapon.clipsize > 3)
		{
			var_6814b80a = mapfloat(1, 200, 1, 0.3, weapon.clipsize);
			var_89557197 = ceil(var_6814b80a * weapon.clipsize);
			if(isdefined(level.var_142dc1b8) && isdefined(level.var_142dc1b8[weapon.name]))
			{
				var_89557197 = level.var_142dc1b8[weapon.name];
			}
			else if(ammostock < 1)
			{
				var_89557197 = var_89557197 + 10;
			}
			if(ammocount > var_89557197 || self laststand::player_is_in_laststand())
			{
				ammooutcount = 0;
				ammolowcount = 0;
				continue;
			}
		}
		else
		{
			var_89557197 = min(5, floor((weapon.clipsize + weapon.maxammo) / 2));
			if(ammocount > var_89557197 || self laststand::player_is_in_laststand())
			{
				ammooutcount = 0;
				ammolowcount = 0;
				continue;
			}
		}
		if(ammocount > 0)
		{
			if(ammolowcount < 1)
			{
				self zm_audio::create_and_play_dialog(#"ammo", #"low");
				ammolowcount++;
			}
		}
		else if(ammooutcount < 1)
		{
			wait(0.5);
			if(self getcurrentweapon() !== weapon)
			{
				continue;
			}
			self zm_audio::create_and_play_dialog(#"ammo", #"out");
			ammooutcount++;
		}
		wait(20);
	}
}

/*
	Name: spawn_vo
	Namespace: zm_player
	Checksum: 0x4504B2C9
	Offset: 0x1168
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function spawn_vo()
{
	wait(1);
	players = getplayers();
	if(players.size > 1)
	{
		player = array::random(players);
		index = zm_utility::get_player_index(player);
		player thread spawn_vo_player(index, players.size);
	}
}

/*
	Name: spawn_vo_player
	Namespace: zm_player
	Checksum: 0xE3D179A3
	Offset: 0x1208
	Size: 0x7A
	Parameters: 2
	Flags: Linked
*/
function spawn_vo_player(index, num)
{
	sound = ((("plr_" + index) + "_vox_") + num) + "play";
	self playsoundwithnotify(sound, "sound_done");
	self waittill(#"sound_done");
}

/*
	Name: precache_models
	Namespace: zm_player
	Checksum: 0x8FB41269
	Offset: 0x1290
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function precache_models()
{
	if(isdefined(level.precachecustomcharacters))
	{
		self [[level.precachecustomcharacters]]();
	}
}

/*
	Name: callback_playerlaststand
	Namespace: zm_player
	Checksum: 0xF627EF1
	Offset: 0x12C0
	Size: 0x94
	Parameters: 10
	Flags: Linked
*/
function callback_playerlaststand(einflictor, eattacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration)
{
	self endon(#"disconnect");
	zm_laststand::playerlaststand(einflictor, eattacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration);
}

/*
	Name: breakafter
	Namespace: zm_player
	Checksum: 0xD71E92C3
	Offset: 0x1360
	Size: 0x6C
	Parameters: 3
	Flags: None
*/
function breakafter(time, damage, piece)
{
	self notify(#"breakafter");
	self endon(#"breakafter");
	wait(damage);
	self dodamage(piece, self.origin, undefined, undefined);
}

/*
	Name: function_7681dccc
	Namespace: zm_player
	Checksum: 0x3CCACE42
	Offset: 0x13D8
	Size: 0x104
	Parameters: 2
	Flags: Linked
*/
function function_7681dccc(einflictor, eattacker)
{
	if(self isinvehicle())
	{
		vehicle = self getvehicleoccupied();
		if(isdefined(vehicle) && isdefined(vehicle.overrideplayerdamage))
		{
			return vehicle.overrideplayerdamage;
		}
		if(is_true(vehicle.var_9a6644f2) && (isai(einflictor) || isai(eattacker)))
		{
			return &function_68f58ba3;
		}
	}
	if(isdefined(self.overrideplayerdamage))
	{
		return self.overrideplayerdamage;
	}
	if(isdefined(level.overrideplayerdamage))
	{
		return level.overrideplayerdamage;
	}
}

/*
	Name: function_68f58ba3
	Namespace: zm_player
	Checksum: 0x81D8C779
	Offset: 0x14E8
	Size: 0x5E
	Parameters: 11
	Flags: Linked
*/
function function_68f58ba3(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime)
{
	return false;
}

/*
	Name: callback_playerdamage
	Namespace: zm_player
	Checksum: 0xB9F73106
	Offset: 0x1550
	Size: 0x964
	Parameters: 14
	Flags: Linked
*/
function callback_playerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal)
{
	if(self getinvulnerability() || gamestate::is_game_over())
	{
		return;
	}
	eattacker = player::figure_out_attacker(eattacker);
	if(isplayer(eattacker) && !weapons::ismeleemod(smeansofdeath))
	{
		var_8f516911 = function_b576d3d(weapon, shitloc);
		idamage = idamage * var_8f516911;
	}
	idamage = function_182d09fd(eattacker, idamage);
	startedinlaststand = 0;
	if(isplayer(self))
	{
		startedinlaststand = self laststand::player_is_in_laststand();
	}
	if(isplayer(eattacker) && eattacker.sessionteam == self.sessionteam && !eattacker hasperk(#"specialty_playeriszombie") && !is_true(self.is_zombie))
	{
		idamage = self process_friendly_fire_callbacks(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex);
		if(self != eattacker && !level.friendlyfire)
		{
			/#
				println("");
			#/
			return;
		}
		if(self == eattacker && smeansofdeath != "MOD_GRENADE_SPLASH" && smeansofdeath != "MOD_GRENADE" && smeansofdeath != "MOD_EXPLOSIVE" && smeansofdeath != "MOD_PROJECTILE" && smeansofdeath != "MOD_PROJECTILE_SPLASH" && smeansofdeath != "MOD_BURNED" && smeansofdeath != "MOD_SUICIDE" && smeansofdeath != "MOD_DOT")
		{
			/#
				println("");
			#/
			return;
		}
	}
	overrideplayerdamage = function_7681dccc(einflictor, eattacker);
	if(isdefined(overrideplayerdamage))
	{
		idamage = self [[overrideplayerdamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime);
	}
	/#
		assert(isdefined(idamage), "");
	#/
	if(is_true(level.zm_bots_scale) && isbot(self) && isdefined(einflictor) && isactor(einflictor))
	{
		idamage = int(idamage / zm_bot::function_e16b5033(einflictor));
	}
	params = spawnstruct();
	params.einflictor = einflictor;
	params.eattacker = eattacker;
	params.idamage = idamage;
	params.idflags = idflags;
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	params.var_fd90b0bb = var_fd90b0bb;
	params.vpoint = vpoint;
	params.vdir = vdir;
	params.shitloc = shitloc;
	params.vdamageorigin = vdamageorigin;
	params.psoffsettime = psoffsettime;
	self callback::callback(#"on_player_damage", params);
	if(is_true(self.magic_bullet_shield))
	{
		maxhealth = self.maxhealth;
		self.health = self.health + int(idamage);
		self.maxhealth = maxhealth;
	}
	if(isdefined(level.prevent_player_damage) && !level.friendlyfire)
	{
		if(self [[level.prevent_player_damage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime))
		{
			return;
		}
	}
	idflags = idflags | level.idflags_no_knockback;
	if(idamage > 0 && shitloc == "riotshield")
	{
		shitloc = "torso_upper";
	}
	/#
		if(isdefined(eattacker))
		{
			record3dtext((((("" + idamage) + "") + self.health) + "") + eattacker getentitynumber(), self.origin, (1, 0, 0), "", self);
		}
		else
		{
			record3dtext(((("" + idamage) + "") + self.health) + "", self.origin, (1, 0, 0), "", self);
		}
	#/
	if(idamage > 0)
	{
		if(isdefined(level.var_a2d8b7eb))
		{
			zm_custom::function_db030433();
			self zm_score::player_reduce_points("points_lost_on_hit_percent", level.var_a2d8b7eb);
		}
		else if(isdefined(level.var_39e18a71))
		{
			zm_custom::function_db030433();
			self zm_score::player_reduce_points("points_lost_on_hit_value", level.var_39e18a71);
			if(zm_trial::is_trial_mode())
			{
				self playsoundtoplayer(#"hash_3109126d3731f3d2", self);
			}
		}
		if(isdefined(eattacker) && eattacker.team == level.zombie_team)
		{
			self zm_stats::increment_player_stat("hits_taken");
			self zm_stats::function_8f10788e("boas_hits_taken");
		}
	}
	idamage = int(idamage);
	self finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
	/#
		println("");
	#/
	var_ca70d16a = 0;
	if(isplayer(self))
	{
		var_ca70d16a = !startedinlaststand && self laststand::player_is_in_laststand();
	}
	bb::logdamage(eattacker, self, weapon, idamage, smeansofdeath, shitloc, self.health <= 0, var_ca70d16a);
	if(isplayer(eattacker) && idamage > 0 && !is_true(self.var_265cb589) && !is_true(level.var_dc60105c))
	{
		eattacker util::show_hit_marker(var_ca70d16a);
	}
	if(isai(params.eattacker))
	{
		scoreevents::function_46e3cf42(params.eattacker, self);
	}
}

/*
	Name: finishplayerdamagewrapper
	Namespace: zm_player
	Checksum: 0x8389DB2F
	Offset: 0x1EC0
	Size: 0xA4
	Parameters: 14
	Flags: Linked
*/
function finishplayerdamagewrapper(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal)
{
	self finishplayerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, vsurfacenormal);
}

/*
	Name: function_182d09fd
	Namespace: zm_player
	Checksum: 0x93449A9D
	Offset: 0x1F70
	Size: 0x14A
	Parameters: 2
	Flags: Linked
*/
function function_182d09fd(eattacker, idamage)
{
	if(!isdefined(eattacker))
	{
		return int(idamage);
	}
	if(eattacker.archetype === #"zombie" && isdefined(level.var_c739ead9))
	{
		idamage = idamage * level.var_c739ead9;
	}
	if(eattacker.var_6f84b820 === #"elite" && isdefined(level.var_5a59b382))
	{
		idamage = idamage * level.var_5a59b382;
	}
	if(eattacker.var_6f84b820 === #"special" && isdefined(level.var_cfbc34ae))
	{
		idamage = idamage * level.var_cfbc34ae;
	}
	if(eattacker.var_6f84b820 === #"normal" && isdefined(level.var_97850f30))
	{
		idamage = idamage * level.var_97850f30;
	}
	return int(idamage);
}

/*
	Name: function_a8846426
	Namespace: zm_player
	Checksum: 0x75D9DBC4
	Offset: 0x20C8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_a8846426(callback)
{
	if(!isdefined(level.player_friendly_fire_callbacks))
	{
		level.player_friendly_fire_callbacks = [];
	}
	arrayremovevalue(level.player_friendly_fire_callbacks, callback);
}

/*
	Name: register_player_friendly_fire_callback
	Namespace: zm_player
	Checksum: 0x9AC88554
	Offset: 0x2118
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function register_player_friendly_fire_callback(callback)
{
	if(!isdefined(level.player_friendly_fire_callbacks))
	{
		level.player_friendly_fire_callbacks = [];
	}
	if(!isdefined(level.player_friendly_fire_callbacks))
	{
		level.player_friendly_fire_callbacks = [];
	}
	else if(!isarray(level.player_friendly_fire_callbacks))
	{
		level.player_friendly_fire_callbacks = array(level.player_friendly_fire_callbacks);
	}
	level.player_friendly_fire_callbacks[level.player_friendly_fire_callbacks.size] = callback;
}

/*
	Name: process_friendly_fire_callbacks
	Namespace: zm_player
	Checksum: 0xF155B7C3
	Offset: 0x21C8
	Size: 0x108
	Parameters: 11
	Flags: Linked
*/
function process_friendly_fire_callbacks(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	if(isdefined(level.player_friendly_fire_callbacks))
	{
		foreach(callback in level.player_friendly_fire_callbacks)
		{
			idamage = self [[callback]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex);
		}
	}
	return idamage;
}

/*
	Name: onplayerconnect_clientdvars
	Namespace: zm_player
	Checksum: 0x7CAD4D3F
	Offset: 0x22D8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function onplayerconnect_clientdvars()
{
	self setclientcompass(0);
	self setclientthirdperson(0);
	self resetfov();
	self setclientthirdpersonangle(0);
	self setclientuivisibilityflag("weapon_hud_visible", 1);
	self setclientminiscoreboardhide(1);
	self setclienthudhardcore(0);
	self setclientplayerpushamount(0);
}

/*
	Name: function_8ef51109
	Namespace: zm_player
	Checksum: 0xCACE653E
	Offset: 0x23B0
	Size: 0x1F0
	Parameters: 2
	Flags: Linked
*/
function function_8ef51109(var_fb6fa3e1, var_bbbf9a69)
{
	if(!function_3799b373(var_fb6fa3e1, var_bbbf9a69) && !zm_utility::function_91403f47())
	{
		if(zm_trial::is_trial_mode())
		{
			var_57807cdc = [];
			a_e_players = getplayers();
			foreach(e_player in a_e_players)
			{
				if(var_fb6fa3e1 === e_player)
				{
					continue;
				}
				array::add(var_57807cdc, e_player, 0);
			}
			if(var_57807cdc.size > 1)
			{
				zm_trial::fail(#"hash_61d8fe81f9fe9e9c", var_57807cdc);
			}
			else
			{
				zm_trial::fail(#"hash_272fae998263208b", var_57807cdc);
			}
		}
		else
		{
			/#
				assert(getdvarint(#"hash_6d3c5317001d4fc6", 0) == 0, "");
			#/
			level notify(#"end_game", {#reason:#"all_players_dead"});
		}
	}
}

/*
	Name: function_3799b373
	Namespace: zm_player
	Checksum: 0x8BD71783
	Offset: 0x25A8
	Size: 0x25C
	Parameters: 2
	Flags: Linked
*/
function function_3799b373(var_fb6fa3e1, var_bbbf9a69)
{
	if(!isdefined(var_bbbf9a69))
	{
		var_bbbf9a69 = 0;
	}
	if(!level flag::get("start_zombie_round_logic"))
	{
		return true;
	}
	a_e_players = getplayers();
	var_7ff2e79a = 0;
	var_2af2f14d = 0;
	foreach(e_player in a_e_players)
	{
		if(!isdefined(e_player))
		{
			continue;
		}
		if(var_fb6fa3e1 === e_player)
		{
			continue;
		}
		if(is_true(e_player.is_zombie) || e_player.sessionstate === "spectator" || e_player.sessionstate === "dead")
		{
			continue;
		}
		if(var_bbbf9a69 && isbot(e_player))
		{
			if(!e_player laststand::player_is_in_laststand())
			{
				var_7ff2e79a = 1;
			}
			continue;
		}
		if(e_player laststand::player_is_in_laststand() && e_player zm_laststand::function_618fd37e() <= 0 && !e_player namespace_791d0451::function_56cedda7(#"hash_504b3df717f88c4e") && !is_true(e_player.var_5f465b1) && !is_true(e_player.var_1399a943))
		{
			var_2af2f14d = 1;
			continue;
		}
		return true;
	}
	if(var_bbbf9a69 && var_2af2f14d && var_7ff2e79a)
	{
		return true;
	}
	return false;
}

/*
	Name: onplayerspawned
	Namespace: zm_player
	Checksum: 0xB40EB9AC
	Offset: 0x2810
	Size: 0x44A
	Parameters: 0
	Flags: Linked
*/
function onplayerspawned()
{
	self notify(#"stop_onplayerspawned");
	self endon(#"stop_onplayerspawned", #"disconnect");
	for(;;)
	{
		self waittill(#"spawned_player");
		self setclientuivisibilityflag("hud_visible", 1);
		self.hits = 0;
		self recordplayerrevivezombies(self);
		/#
			if(getdvarint(#"zombie_cheat", 0) >= 1 && getdvarint(#"zombie_cheat", 0) <= 3)
			{
				self val::set(#"zombie_devgui", "", 0);
			}
		#/
		self playerknockback(0);
		self setclientthirdperson(0);
		self resetfov();
		self setclientthirdpersonangle(0);
		self cameraactivate(0);
		self.num_perks = 0;
		self.on_lander_last_stand = undefined;
		self setblur(0, 0.1);
		self.zmbdialogqueue = [];
		self.zmbdialogactive = 0;
		self.zmbdialoggroups = [];
		self.zmbdialoggroup = "";
		self.firstspawn = 0;
		self.var_67ec7eb0 = 0;
		if(is_true(level.player_out_of_playable_area_monitor))
		{
			self thread player_out_of_playable_area_monitor();
		}
		if(is_true(level.player_too_many_players_check))
		{
			level thread [[level.player_too_many_players_check_func]]();
		}
		self.var_c4890291 = [];
		if(isdefined(self.player_initialized))
		{
			if(self.player_initialized == 0)
			{
				self.player_initialized = 1;
				self setclientuivisibilityflag("weapon_hud_visible", 1);
				self setclientminiscoreboardhide(0);
				if(!isdefined(self.is_drinking))
				{
					self.is_drinking = 0;
				}
				self thread player_monitor_travel_dist();
				self thread player_monitor_time_played();
				if(getdvarint(#"hash_139191929bda93cd", 0) == 1)
				{
					self thread zm_breadcrumbs();
				}
				if(isdefined(level.custom_player_track_ammo_count))
				{
					self thread [[level.custom_player_track_ammo_count]]();
				}
				else
				{
					self thread player_track_ammo_count();
				}
				self thread zm_utility::shock_onpain();
				self thread player_grenade_watcher();
				self laststand::revive_hud_create();
				if(isdefined(level.zm_gamemodule_spawn_func))
				{
					self thread [[level.zm_gamemodule_spawn_func]]();
				}
				self thread val::set_for_time(3, #"player_spawn_protection", "ignoreme");
			}
		}
		self notify(#"perks_initialized");
	}
}

/*
	Name: spawn_life_brush
	Namespace: zm_player
	Checksum: 0xF57FF746
	Offset: 0x2C68
	Size: 0x62
	Parameters: 3
	Flags: None
*/
function spawn_life_brush(origin, radius, height)
{
	life_brush = spawn("trigger_radius", origin, 0, radius, height);
	life_brush.script_noteworthy = "life_brush";
	return life_brush;
}

/*
	Name: in_life_brush
	Namespace: zm_player
	Checksum: 0x92876D5F
	Offset: 0x2CD8
	Size: 0x8E
	Parameters: 0
	Flags: Linked
*/
function in_life_brush()
{
	life_brushes = getentarray("life_brush", "script_noteworthy");
	if(!isdefined(life_brushes) || !isdefined(self))
	{
		return false;
	}
	for(i = 0; i < life_brushes.size; i++)
	{
		if(self istouching(life_brushes[i]))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: spawn_kill_brush
	Namespace: zm_player
	Checksum: 0xF5A07908
	Offset: 0x2D70
	Size: 0x62
	Parameters: 3
	Flags: None
*/
function spawn_kill_brush(origin, radius, height)
{
	kill_brush = spawn("trigger_radius", origin, 0, radius, height);
	kill_brush.script_noteworthy = "kill_brush";
	return kill_brush;
}

/*
	Name: in_kill_brush
	Namespace: zm_player
	Checksum: 0x8E2DF514
	Offset: 0x2DE0
	Size: 0x96
	Parameters: 0
	Flags: Linked
*/
function in_kill_brush()
{
	kill_brushes = getentarray("kill_brush", "script_noteworthy");
	self.kill_brush = undefined;
	if(!isdefined(kill_brushes))
	{
		return false;
	}
	for(i = 0; i < kill_brushes.size; i++)
	{
		if(self istouching(kill_brushes[i]))
		{
			self.kill_brush = kill_brushes[i];
			return true;
		}
	}
	return false;
}

/*
	Name: in_enabled_playable_area
	Namespace: zm_player
	Checksum: 0x60498CAE
	Offset: 0x2E80
	Size: 0x2A6
	Parameters: 1
	Flags: Linked
*/
function in_enabled_playable_area(var_22a4c702)
{
	if(!isdefined(var_22a4c702))
	{
		var_22a4c702 = 500;
	}
	if(zm_utility::function_c85ebbbc())
	{
		if(!isdefined(level.playable_area))
		{
			level.playable_area = getentarray("player_volume", "script_noteworthy");
		}
		if(isdefined(level.playable_area))
		{
			var_12ed21a1 = function_72d3bca6(level.playable_area, self.origin, undefined, undefined, level.var_603981f1);
			foreach(area in var_12ed21a1)
			{
				if(zm_zonemgr::zone_is_enabled(area.targetname) && self istouching(area))
				{
					return true;
				}
			}
		}
	}
	if(zm_utility::function_21f4ac36())
	{
		if(!isdefined(level.var_a2a9b2de))
		{
			level.var_a2a9b2de = getnodearray("player_region", "script_noteworthy");
		}
		node = function_52c1730(self.origin, level.var_a2a9b2de, var_22a4c702);
		if(isdefined(node) && zm_zonemgr::zone_is_enabled(node.targetname))
		{
			return true;
		}
		queryresult = function_72ce47bb(self.origin, 0, self getpathfindingradius(), self function_6a9ae71() * 0.5, 2, 1, undefined, undefined, level.var_e046d333);
		if(queryresult.data.size > 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: get_player_out_of_playable_area_monitor_wait_time
	Namespace: zm_player
	Checksum: 0x6B02DC8C
	Offset: 0x3130
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function get_player_out_of_playable_area_monitor_wait_time()
{
	/#
		if(is_true(level.check_kill_thread_every_frame))
		{
			return 0.05;
		}
	#/
	if(self function_b01adf41())
	{
		return 1;
	}
	return 3;
}

/*
	Name: function_b01adf41
	Namespace: zm_player
	Checksum: 0xF43D1767
	Offset: 0x3188
	Size: 0x1A8
	Parameters: 0
	Flags: Linked
*/
function function_b01adf41()
{
	if(isplayer(self) && self namespace_e86ffa8::function_8923370c(2))
	{
		return true;
	}
	if(isplayer(self))
	{
		var_6e618382 = item_inventory::function_2e711614(13);
		if(var_6e618382.var_a6762160.name === #"hash_689c84ba4e75b1c8")
		{
			return true;
		}
	}
	foreach(player in function_a1ef346b())
	{
		if(isdefined(player.var_87f72f8))
		{
			switch(player.var_87f72f8)
			{
				case "hash_1fc30bedac3b39a5":
				case "hash_35d8042aa3ab475e":
				case "hash_37b9ba3f40fc1ba5":
				case "hash_4554f3c03465642f":
				case "hash_4feb54f5041d1609":
				case "hash_76ed099fde5ea820":
				{
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: player_out_of_playable_area_monitor
	Namespace: zm_player
	Checksum: 0x4421B36D
	Offset: 0x3338
	Size: 0x420
	Parameters: 0
	Flags: Linked
*/
function player_out_of_playable_area_monitor()
{
	self notify(#"stop_player_out_of_playable_area_monitor");
	self endon(#"stop_player_out_of_playable_area_monitor", #"disconnect");
	level endon(#"end_game");
	while(!isdefined(self.characterindex))
	{
		waitframe(1);
	}
	wait(0.15 * self.characterindex);
	while(true)
	{
		if(self.sessionstate == "spectator")
		{
			wait(get_player_out_of_playable_area_monitor_wait_time());
			continue;
		}
		if(is_true(self.hostmigrationcontrolsfrozen))
		{
			wait(get_player_out_of_playable_area_monitor_wait_time());
			continue;
		}
		if(self.var_f22c83f5 === 1)
		{
			wait(get_player_out_of_playable_area_monitor_wait_time());
			continue;
		}
		if(!self in_life_brush() && (self in_kill_brush() || !self in_enabled_playable_area() || (isdefined(level.player_out_of_playable_area_override) && is_true(self [[level.player_out_of_playable_area_override]]()))) && !is_true(self.var_2c27f919) && !self scene::is_igc_active())
		{
			if(!isdefined(level.player_out_of_playable_area_monitor_callback) || self [[level.player_out_of_playable_area_monitor_callback]]())
			{
				/#
					iprintlnbold("" + self.origin);
				#/
				/#
					if(is_true(level.kill_thread_test_mode))
					{
						wait(get_player_out_of_playable_area_monitor_wait_time());
						continue;
					}
					if(self isinmovemode("", "") || is_true(level.disable_kill_thread) || getdvarint(#"zombie_cheat", 0) > 0)
					{
						wait(get_player_out_of_playable_area_monitor_wait_time());
						continue;
					}
				#/
				self zm_stats::increment_map_cheat_stat("cheat_out_of_playable");
				self zm_stats::increment_client_stat("cheat_out_of_playable", 0);
				self zm_stats::increment_client_stat("cheat_total", 0);
				self playlocalsound(#"zmb_player_outofbounds");
				if(isdefined(self.maxhealth) && self.maxhealth > 0)
				{
					n_damage = (self.maxhealth / 3) + 1;
				}
				else
				{
					n_damage = 51;
				}
				if(self.health <= n_damage)
				{
					self zm_laststand::function_3d685b5f(0);
					self.var_39c78617 = 1;
				}
				self.var_dad8bef6 = 1;
				self dodamage(n_damage, self.origin);
				self.var_dad8bef6 = undefined;
			}
		}
		wait(get_player_out_of_playable_area_monitor_wait_time());
	}
}

/*
	Name: function_de3936f8
	Namespace: zm_player
	Checksum: 0x560FC944
	Offset: 0x3760
	Size: 0x2AC
	Parameters: 1
	Flags: None
*/
function function_de3936f8(var_ffb1863c)
{
	self notify(#"hash_639868d8cfc48f96");
	self endon(#"disconnect", #"hash_639868d8cfc48f96");
	self waittilltimeout(1, #"weapon_change_complete");
	if(self zm_loadout::has_powerup_weapon() || self laststand::player_is_in_laststand() || self.sessionstate == "spectator" || isdefined(self.laststandpistol))
	{
		return;
	}
	var_287a8343 = zm_utility::get_player_weapon_limit(self);
	var_3ba4bf7d = self getweaponslistprimaries();
	if(var_3ba4bf7d.size > var_287a8343)
	{
		self zm_melee_weapon::take_fallback_weapon();
		var_3ba4bf7d = self getweaponslistprimaries();
		if(var_3ba4bf7d.size > var_287a8343)
		{
			self zm_stats::increment_map_cheat_stat("cheat_too_many_weapons");
			self zm_stats::increment_client_stat("cheat_too_many_weapons", 0);
			self zm_stats::increment_client_stat("cheat_total", 0);
			self playlocalsound(level.zmb_laugh_alias);
			if(isdefined(var_ffb1863c) && self hasweapon(var_ffb1863c) && isinarray(var_3ba4bf7d, var_ffb1863c))
			{
				self takeweapon(var_ffb1863c);
			}
			else
			{
				if(isinarray(var_3ba4bf7d, self.currentweapon))
				{
					self takeweapon(self.currentweapon);
				}
				else
				{
					self takeweapon(var_3ba4bf7d[0]);
				}
			}
			wait(1);
			if(!self getweaponslistprimaries().size)
			{
				self zm_loadout::give_start_weapon(1);
			}
		}
	}
}

/*
	Name: player_monitor_travel_dist
	Namespace: zm_player
	Checksum: 0x8692B56A
	Offset: 0x3A18
	Size: 0x16E
	Parameters: 0
	Flags: Linked
*/
function player_monitor_travel_dist()
{
	self notify(#"stop_player_monitor_travel_dist");
	self endon(#"stop_player_monitor_travel_dist", #"disconnect");
	n_current_distance = 0;
	prevpos = self.origin;
	while(isdefined(self))
	{
		wait(0.1);
		if(self.var_16735873 !== 1)
		{
			n_distance = distance(self.origin, prevpos);
			self.pers[#"distance_traveled"] = self.pers[#"distance_traveled"] + n_distance;
			if(n_distance > 1 && int(self.pers[#"distance_traveled"]) > n_current_distance)
			{
				self zm_stats::function_301c4be2("boas_distanceSprinted", int(n_distance));
				n_current_distance = self.pers[#"distance_traveled"];
			}
		}
		prevpos = self.origin;
	}
}

/*
	Name: player_monitor_time_played
	Namespace: zm_player
	Checksum: 0x3123A89E
	Offset: 0x3B90
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function player_monitor_time_played()
{
	self notify(#"stop_player_monitor_time_played");
	self endon(#"stop_player_monitor_time_played", #"disconnect");
	level flag::wait_till("start_zombie_round_logic");
	for(;;)
	{
		wait(1);
		zm_stats::increment_client_stat("time_played_total");
	}
}

/*
	Name: zm_breadcrumbs
	Namespace: zm_player
	Checksum: 0x97F214AE
	Offset: 0x3C10
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function zm_breadcrumbs()
{
	self endon(#"disconnect");
	level endon(#"end_game");
	waittime = getdvarfloat(#"hash_46009edd5032b8cc", 2);
	level flag::wait_till("start_zombie_round_logic");
	while(true)
	{
		if(isalive(self))
		{
			recordbreadcrumbdataforplayer(self);
		}
		wait(waittime);
	}
}

/*
	Name: player_grenade_multiattack_bookmark_watcher
	Namespace: zm_player
	Checksum: 0x63FE94EA
	Offset: 0x3CD8
	Size: 0x35A
	Parameters: 2
	Flags: Linked
*/
function player_grenade_multiattack_bookmark_watcher(grenade, weapon)
{
	self endon(#"disconnect");
	waittillframeend();
	if(!isdefined(grenade))
	{
		return;
	}
	inflictorentnum = grenade getentitynumber();
	inflictorenttype = grenade getentitytype();
	inflictorbirthtime = 0;
	if(isdefined(grenade.birthtime))
	{
		inflictorbirthtime = grenade.birthtime;
	}
	killcam_entity_info = killcam::get_killcam_entity_info(self, grenade, weapon);
	einflictor = grenade;
	ret_val = undefined;
	ret_val = grenade waittilltimeout(15, #"explode", #"death", #"disconnect");
	if(!isdefined(self) || (isdefined(ret_val) && "timeout" == ret_val._notify))
	{
		return;
	}
	self.grenade_multiattack_count = 0;
	self.grenade_multiattack_ent = undefined;
	self.grenade_multikill_count = 0;
	waittillframeend();
	if(!isdefined(self))
	{
		return;
	}
	count = level.grenade_multiattack_bookmark_count;
	if(is_true(grenade.grenade_multiattack_bookmark_count))
	{
		count = grenade.grenade_multiattack_bookmark_count;
	}
	var_7b841aa9 = #"zm_player_grenade_multiattack";
	if(is_true(grenade.use_grenade_special_long_bookmark))
	{
		var_7b841aa9 = #"zm_player_grenade_special_long";
	}
	else if(is_true(grenade.use_grenade_special_bookmark))
	{
		var_7b841aa9 = #"zm_player_grenade_special_long";
	}
	if(count <= self.grenade_multiattack_count && isdefined(self.grenade_multiattack_ent))
	{
		deathtime = gettime();
		perks = [];
		killstreaks = [];
		demo::bookmark(var_7b841aa9, gettime(), self, undefined, 0);
		potm::bookmark(var_7b841aa9, gettime(), self, undefined, 0);
		potm::function_5523a49a(var_7b841aa9, self getentitynumber(), self getxuid(), self.grenade_multiattack_ent, killcam_entity_info, weapon, "MOD_GRENADE", deathtime, 0, 0, perks, killstreaks, self, einflictor);
	}
	if(5 <= self.grenade_multikill_count)
	{
		self zm_stats::increment_challenge_stat(#"zombie_hunter_explosion_multikill");
	}
	self.grenade_multiattack_count = 0;
	self.grenade_multikill_count = 0;
}

/*
	Name: player_grenade_watcher
	Namespace: zm_player
	Checksum: 0x42A06CE9
	Offset: 0x4040
	Size: 0x120
	Parameters: 0
	Flags: Linked
*/
function player_grenade_watcher()
{
	self notify(#"stop_player_grenade_watcher");
	self endon(#"stop_player_grenade_watcher", #"disconnect");
	self.grenade_multiattack_count = 0;
	self.grenade_multikill_count = 0;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"grenade_fire");
		grenade = waitresult.projectile;
		weapon = waitresult.weapon;
		if(isdefined(grenade) && isalive(grenade))
		{
			grenade.team = self.team;
		}
		self thread player_grenade_multiattack_bookmark_watcher(grenade, weapon);
		if(isdefined(level.grenade_watcher))
		{
			self [[level.grenade_watcher]](grenade, weapon);
		}
	}
}

/*
	Name: player_prevent_damage
	Namespace: zm_player
	Checksum: 0xAB60C41A
	Offset: 0x4168
	Size: 0x334
	Parameters: 10
	Flags: Linked
*/
function player_prevent_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(isai(vdir) && self.ignoreme && psoffsettime === "MOD_MELEE")
	{
		if(!isdefined(self.var_7342424d) || self.var_7342424d !== vdir)
		{
			return true;
		}
		var_3d9a5390 = 1;
	}
	/#
		if(isai(vdir) && self.ignoreme && !is_true(var_3d9a5390))
		{
			println((("" + function_9e72a96(vdir.archetype)) + "") + psoffsettime);
		}
		if(is_true(self.bgb_in_plain_sight_active))
		{
			str = "";
			if(isai(vdir))
			{
				str = str + function_9e72a96(vdir.archetype);
			}
			else
			{
				if(isdefined(vdir))
				{
					str = (str + "") + vdir getentitynumber();
				}
				else
				{
					str = str + "";
				}
			}
			println(str);
			println("" + (is_true(self.ignoreme) ? "" : ""));
			println("" + psoffsettime);
			println(("" + shitloc) + "");
		}
	#/
	if(!isdefined(vpoint) || !isdefined(vdir))
	{
		return false;
	}
	if(vpoint == self || vdir == self)
	{
		return false;
	}
	if(isdefined(vpoint) && isdefined(vpoint.team))
	{
		if(!is_true(vpoint.damage_own_team))
		{
			if(vpoint.team == self.team)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: player_revive_monitor
	Namespace: zm_player
	Checksum: 0xB2DA3218
	Offset: 0x44A8
	Size: 0x300
	Parameters: 0
	Flags: Linked
*/
function player_revive_monitor()
{
	self notify(#"stop_player_revive_monitor");
	self endon(#"stop_player_revive_monitor", #"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"player_revived");
		reviver = waitresult.reviver;
		self playsound(#"zmb_character_revived");
		if(is_true(level.isresetting_grief))
		{
			continue;
		}
		if(isdefined(reviver))
		{
			if(reviver != self)
			{
				if(math::cointoss())
				{
					self zm_audio::create_and_play_dialog(#"revive", #"up");
				}
				else
				{
					reviver zm_audio::create_and_play_dialog(#"revive", #"support");
				}
			}
			else
			{
				self zm_audio::create_and_play_dialog(#"revive", #"up");
			}
			points = self.score_lost_when_downed;
			if(!isdefined(points) || self == reviver || zm_custom::function_901b751c(#"hash_1fed0d9afc0b0040"))
			{
				points = 0;
			}
			else if(points > 2500)
			{
				points = 2500 + ((points - 2500) * 0.5);
			}
			/#
				println("" + points);
			#/
			reviver zm_score::player_add_points("reviver", points);
			self.score_lost_when_downed = 0;
			if(isplayer(reviver) && reviver != self)
			{
				reviver zm_stats::increment_challenge_stat(#"survivalist_revive", undefined, 1);
				reviver zm_stats::increment_challenge_stat(#"hash_79ba5b62b95a7eb6", undefined, 1);
				reviver zm_stats::function_c0c6ab19(#"revives", 1, 1);
			}
		}
	}
}

/*
	Name: spawnspectator
	Namespace: zm_player
	Checksum: 0xA81F8E68
	Offset: 0x47B0
	Size: 0x256
	Parameters: 0
	Flags: Linked
*/
function spawnspectator()
{
	self endon(#"disconnect", #"spawned_spectator");
	self notify(#"spawned");
	self notify(#"end_respawn");
	if(level.intermission)
	{
		return;
	}
	if(isdefined(level.no_spectator) && level.no_spectator)
	{
		wait(3);
		exitlevel();
	}
	self thread function_97f613de();
	self.is_zombie = 1;
	self notify(#"zombified");
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger delete();
		self.revivetrigger = undefined;
	}
	self.zombification_time = gettime();
	self stopshellshock();
	self stoprumble("damage_heavy");
	self.sessionstate = "spectator";
	self.spectatorclient = -1;
	self.maxhealth = self.health;
	self.shellshocked = 0;
	self.inwater = 0;
	self.friendlydamage = undefined;
	self.hasspawned = 1;
	self.spawntime = gettime();
	self.afk = 0;
	/#
		println("");
	#/
	self detachall();
	if(isdefined(level.custom_spectate_permissions))
	{
		self [[level.custom_spectate_permissions]]();
	}
	else
	{
		self setspectatepermissions(1);
	}
	self spawn(self.origin, self.angles);
	self notify(#"spawned_spectator");
}

/*
	Name: function_97f613de
	Namespace: zm_player
	Checksum: 0x483FACD8
	Offset: 0x4A10
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_97f613de()
{
	self endon(#"disconnect");
	self lui::screen_fade_out(0, (1, 1, 1));
	self waittilltimeout(0.5, #"spawned_spectator");
	self thread lui::screen_fade_in(0.25, (1, 1, 1));
}

/*
	Name: setspectatepermissions
	Namespace: zm_player
	Checksum: 0x973565A5
	Offset: 0x4A90
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function setspectatepermissions(ison)
{
	self allowspectateteam(#"allies", ison && self.team == #"allies");
	self allowspectateteam(#"axis", ison && self.team == #"axis");
	self allowspectateteam("freelook", 0);
	self allowspectateteam("none", 0);
}

/*
	Name: spectator_toggle_3rd_person
	Namespace: zm_player
	Checksum: 0xC5334CB9
	Offset: 0x4B68
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function spectator_toggle_3rd_person()
{
	self endon(#"disconnect", #"spawned_player");
	self set_third_person(1);
}

/*
	Name: set_third_person
	Namespace: zm_player
	Checksum: 0xEAB5F8A6
	Offset: 0x4BB8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function set_third_person(value)
{
	if(value)
	{
		self setclientthirdperson(1);
		self setclientthirdpersonangle(354);
	}
	else
	{
		self setclientthirdperson(0);
		self setclientthirdpersonangle(0);
	}
	self resetfov();
}

/*
	Name: last_stand_revive
	Namespace: zm_player
	Checksum: 0x698FE0DE
	Offset: 0x4C50
	Size: 0x154
	Parameters: 0
	Flags: None
*/
function last_stand_revive()
{
	level endon(#"between_round_over");
	players = getplayers();
	laststand_count = 0;
	foreach(player in players)
	{
		if(!zm_utility::is_player_valid(player))
		{
			laststand_count++;
		}
	}
	if(laststand_count == players.size)
	{
		for(i = 0; i < players.size; i++)
		{
			if(players[i] laststand::player_is_in_laststand() && players[i].revivetrigger.beingrevived == 0)
			{
				players[i] zm_laststand::auto_revive(players[i]);
			}
		}
	}
}

/*
	Name: spectators_respawn
	Namespace: zm_player
	Checksum: 0x628F1406
	Offset: 0x4DB0
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function spectators_respawn()
{
	level endon(#"between_round_over", #"end_game");
	if(!isdefined(zombie_utility::function_d2dfacfd(#"spectators_respawn")) || !zombie_utility::function_d2dfacfd(#"spectators_respawn"))
	{
		return;
	}
	while(true)
	{
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			e_player = players[i];
			e_player spectator_respawn_player();
		}
		if(is_true(level.var_eaa19257))
		{
			break;
		}
		wait(1);
	}
}

/*
	Name: spectator_respawn_player
	Namespace: zm_player
	Checksum: 0x76FD3BB4
	Offset: 0x4EC8
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function spectator_respawn_player()
{
	if(self.sessionstate == "spectator" && isdefined(self.spectator_respawn))
	{
		if(!isdefined(level.custom_spawnplayer))
		{
			level.custom_spawnplayer = &spectator_respawn;
		}
		self [[level.spawnplayer]]();
		if(isdefined(level.script) && level.round_number > 6 && self.score < 1500)
		{
			self.old_score = self.score;
			if(isdefined(level.spectator_respawn_custom_score))
			{
				self [[level.spectator_respawn_custom_score]]();
			}
			self.score = 1500;
		}
		if(isdefined(level.var_857878e6))
		{
			self [[level.var_857878e6]]();
		}
	}
}

/*
	Name: spectator_respawn
	Namespace: zm_player
	Checksum: 0x26D05C64
	Offset: 0x4FD0
	Size: 0x398
	Parameters: 0
	Flags: Linked
*/
function spectator_respawn()
{
	/#
		println("");
	#/
	/#
		assert(isdefined(self.spectator_respawn));
	#/
	if(!isdefined(self) || !isdefined(self.spectator_respawn))
	{
		return;
	}
	origin = self.spectator_respawn.origin;
	angles = self.spectator_respawn.angles;
	self setspectatepermissions(0);
	new_origin = undefined;
	if(isdefined(level.check_valid_spawn_override))
	{
		new_origin = [[level.check_valid_spawn_override]](self);
	}
	if(!isdefined(new_origin))
	{
		new_origin = check_for_valid_spawn_near_team(self, 1);
	}
	if(!isdefined(new_origin))
	{
		if(isdefined(self.var_f4710251))
		{
			targetplayer = getentbynum(self.var_f4710251);
			if(isdefined(targetplayer) && isplayer(targetplayer) && isalive(targetplayer))
			{
				new_origin = squad_spawn::function_e402b74e(self, targetplayer);
			}
		}
	}
	if(isdefined(new_origin))
	{
		if(!isdefined(new_origin.angles))
		{
			angles = (0, 0, 0);
		}
		else
		{
			angles = new_origin.angles;
		}
		if(isdefined(new_origin.origin))
		{
			origin = new_origin.origin;
		}
		self spawn(origin, angles);
	}
	else if(isvec(origin) && isvec(angles))
	{
		self spawn(origin, angles);
	}
	if(isdefined(self zm_loadout::get_player_placeable_mine()))
	{
		self takeweapon(self zm_loadout::get_player_placeable_mine());
		self zm_loadout::set_player_placeable_mine(level.weaponnone);
	}
	self zm_equipment::take();
	self.is_burning = undefined;
	self.abilities = [];
	self.is_zombie = 0;
	val::reset(#"laststand", "ignoreme");
	self clientfield::set("zmbLastStand", 0);
	self reviveplayer();
	if(isdefined(level._zombiemode_post_respawn_callback))
	{
		self thread [[level._zombiemode_post_respawn_callback]]();
	}
	self zm_score::player_reduce_points("died");
	self zm_melee_weapon::spectator_respawn_all();
	return true;
}

/*
	Name: check_for_valid_spawn_near_team
	Namespace: zm_player
	Checksum: 0xE6E9C245
	Offset: 0x5370
	Size: 0x2B6
	Parameters: 2
	Flags: Linked
*/
function check_for_valid_spawn_near_team(revivee, return_struct)
{
	if(isdefined(level.check_for_valid_spawn_near_team_callback))
	{
		spawn_location = [[level.check_for_valid_spawn_near_team_callback]](revivee, return_struct);
		return spawn_location;
	}
	players = getplayers();
	spawn_points = zm_gametype::get_player_spawns_for_gametype();
	closest_group = undefined;
	closest_distance = 100000000;
	backup_group = undefined;
	backup_distance = 100000000;
	if(spawn_points.size == 0)
	{
		return undefined;
	}
	a_enabled_zone_entities = zm_zonemgr::get_active_zones_entities();
	for(i = 0; i < players.size; i++)
	{
		if(zm_utility::is_player_valid(players[i], undefined, 1) && (players[i] != self || players.size == 1))
		{
			for(j = 0; j < spawn_points.size; j++)
			{
				if(isdefined(spawn_points[j].script_int))
				{
					ideal_distance = spawn_points[j].script_int;
				}
				else
				{
					ideal_distance = 1000;
				}
				if(zm_utility::check_point_in_enabled_zone(spawn_points[j].origin, 1, a_enabled_zone_entities) == 0)
				{
					continue;
				}
				if(spawn_points[j].locked == 0)
				{
					plyr_dist = distancesquared(players[i].origin, spawn_points[j].origin);
					if(plyr_dist < ideal_distance * ideal_distance)
					{
						if(plyr_dist < closest_distance)
						{
							closest_distance = plyr_dist;
							closest_group = j;
						}
						continue;
					}
					if(plyr_dist < backup_distance)
					{
						backup_group = j;
						backup_distance = plyr_dist;
					}
				}
			}
		}
		if(!isdefined(closest_group))
		{
			closest_group = backup_group;
		}
		if(isdefined(closest_group))
		{
			spawn_location = get_valid_spawn_location(revivee, spawn_points, closest_group, return_struct);
			if(isdefined(spawn_location))
			{
				return spawn_location;
			}
		}
	}
	return undefined;
}

/*
	Name: get_valid_spawn_location
	Namespace: zm_player
	Checksum: 0x60574922
	Offset: 0x5630
	Size: 0x2C2
	Parameters: 4
	Flags: Linked
*/
function get_valid_spawn_location(revivee, spawn_points, closest_group, return_struct)
{
	spawn_array = struct::get_array(spawn_points[closest_group].target, "targetname");
	if(level flag::get("round_reset"))
	{
		spawn_point_index = revivee getentitynumber();
		/#
			assert(spawn_point_index >= 0 && spawn_point_index < spawn_array.size);
		#/
		if(is_true(return_struct))
		{
			return spawn_array[spawn_point_index];
		}
		return spawn_array[spawn_point_index].origin;
	}
	spawn_array = array::randomize(spawn_array);
	for(k = 0; k < spawn_array.size; k++)
	{
		if(isdefined(spawn_array[k].plyr) && spawn_array[k].plyr == revivee getentitynumber())
		{
			if(positionwouldtelefrag(spawn_array[k].origin))
			{
				spawn_array[k].plyr = undefined;
				break;
				continue;
			}
			if(is_true(return_struct))
			{
				return spawn_array[k];
			}
			return spawn_array[k].origin;
		}
	}
	for(k = 0; k < spawn_array.size; k++)
	{
		if(positionwouldtelefrag(spawn_array[k].origin))
		{
			continue;
		}
		if(!isdefined(spawn_array[k].plyr) || spawn_array[k].plyr == revivee getentitynumber())
		{
			spawn_array[k].plyr = revivee getentitynumber();
			if(is_true(return_struct))
			{
				return spawn_array[k];
			}
			return spawn_array[k].origin;
		}
	}
	if(is_true(return_struct))
	{
		return spawn_array[0];
	}
	return spawn_array[0].origin;
}

/*
	Name: check_for_valid_spawn_near_position
	Namespace: zm_player
	Checksum: 0xE107FB28
	Offset: 0x5900
	Size: 0x1B6
	Parameters: 3
	Flags: None
*/
function check_for_valid_spawn_near_position(revivee, v_position, return_struct)
{
	spawn_points = zm_gametype::get_player_spawns_for_gametype();
	if(spawn_points.size == 0)
	{
		return undefined;
	}
	closest_group = undefined;
	closest_distance = 100000000;
	backup_group = undefined;
	backup_distance = 100000000;
	for(i = 0; i < spawn_points.size; i++)
	{
		if(isdefined(spawn_points[i].script_int))
		{
			ideal_distance = spawn_points[i].script_int;
		}
		else
		{
			ideal_distance = 1000;
		}
		if(spawn_points[i].locked == 0)
		{
			dist = distancesquared(v_position, spawn_points[i].origin);
			if(dist < ideal_distance * ideal_distance)
			{
				if(dist < closest_distance)
				{
					closest_distance = dist;
					closest_group = i;
				}
			}
			else if(dist < backup_distance)
			{
				backup_group = i;
				backup_distance = dist;
			}
		}
		if(!isdefined(closest_group))
		{
			closest_group = backup_group;
		}
	}
	if(isdefined(closest_group))
	{
		spawn_location = get_valid_spawn_location(revivee, spawn_points, closest_group, return_struct);
		if(isdefined(spawn_location))
		{
			return spawn_location;
		}
	}
	return undefined;
}

/*
	Name: check_for_valid_spawn_within_range
	Namespace: zm_player
	Checksum: 0x7CAB1828
	Offset: 0x5AC0
	Size: 0x14E
	Parameters: 5
	Flags: None
*/
function check_for_valid_spawn_within_range(revivee, v_position, return_struct, min_distance, max_distance)
{
	spawn_points = zm_gametype::get_player_spawns_for_gametype();
	if(spawn_points.size == 0)
	{
		return undefined;
	}
	closest_group = undefined;
	closest_distance = 100000000;
	for(i = 0; i < spawn_points.size; i++)
	{
		if(spawn_points[i].locked == 0)
		{
			dist = distance(v_position, spawn_points[i].origin);
			if(dist >= min_distance && dist <= max_distance)
			{
				if(dist < closest_distance)
				{
					closest_distance = dist;
					closest_group = i;
				}
			}
		}
	}
	if(isdefined(closest_group))
	{
		spawn_location = get_valid_spawn_location(revivee, spawn_points, closest_group, return_struct);
		if(isdefined(spawn_location))
		{
			return spawn_location;
		}
	}
	return undefined;
}

/*
	Name: get_players_on_team
	Namespace: zm_player
	Checksum: 0xD9ADC932
	Offset: 0x5C18
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function get_players_on_team(exclude)
{
	teammates = [];
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i].spawn_side == self.spawn_side && !isdefined(players[i].revivetrigger) && players[i] != exclude)
		{
			teammates[teammates.size] = players[i];
		}
	}
	return teammates;
}

/*
	Name: get_safe_breadcrumb_pos
	Namespace: zm_player
	Checksum: 0xDED06B4A
	Offset: 0x5CD0
	Size: 0x138
	Parameters: 1
	Flags: None
*/
function get_safe_breadcrumb_pos(player)
{
	players = getplayers();
	valid_players = [];
	for(i = 0; i < players.size; i++)
	{
		if(!zm_utility::is_player_valid(players[i]))
		{
			continue;
		}
		valid_players[valid_players.size] = players[i];
	}
	for(i = 0; i < valid_players.size; i++)
	{
		count = 0;
		for(q = 1; q < player.zombie_breadcrumbs.size; q++)
		{
			if(distancesquared(player.zombie_breadcrumbs[q], valid_players[i].origin) < 22500)
			{
				continue;
			}
			count++;
			if(count == valid_players.size)
			{
				return player.zombie_breadcrumbs[q];
			}
		}
	}
	return undefined;
}

/*
	Name: play_door_dialog
	Namespace: zm_player
	Checksum: 0x8C7070D6
	Offset: 0x5E10
	Size: 0x17A
	Parameters: 0
	Flags: None
*/
function play_door_dialog()
{
	self endon(#"warning_dialog");
	timer = 0;
	while(true)
	{
		waitframe(1);
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			dist = distancesquared(players[i].origin, self.origin);
			if(dist > 4900)
			{
				timer = 0;
				continue;
			}
			while(dist < 4900 && timer < 3)
			{
				wait(0.5);
				timer++;
			}
			if(dist > 4900 && timer >= 3)
			{
				self playsound(#"door_deny");
				players[i] zm_audio::create_and_play_dialog(#"general", #"outofmoney");
				wait(3);
				self notify(#"warning_dialog");
			}
		}
	}
}

/*
	Name: remove_ignore_attacker
	Namespace: zm_player
	Checksum: 0xE08CECA0
	Offset: 0x5F98
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function remove_ignore_attacker()
{
	self notify(#"new_ignore_attacker");
	self endon(#"new_ignore_attacker", #"disconnect");
	if(!isdefined(level.ignore_enemy_timer))
	{
		level.ignore_enemy_timer = 0.4;
	}
	wait(level.ignore_enemy_timer);
	self.ignoreattacker = undefined;
}

/*
	Name: player_damage_override_cheat
	Namespace: zm_player
	Checksum: 0x4D7CDBC
	Offset: 0x6010
	Size: 0x86
	Parameters: 11
	Flags: None
*/
function player_damage_override_cheat(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime)
{
	player_damage_override(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime);
	return false;
}

/*
	Name: player_damage_override
	Namespace: zm_player
	Checksum: 0xB5C5462C
	Offset: 0x60A0
	Size: 0x10DA
	Parameters: 11
	Flags: Linked
*/
function player_damage_override(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime)
{
	idamage = self check_player_damage_callbacks(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime);
	if(self.scene_takedamage === 0)
	{
		return 0;
	}
	if(isdefined(level.prevent_player_damage) && !level.friendlyfire)
	{
		if(self [[level.prevent_player_damage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime))
		{
			return 0;
		}
	}
	if(isdefined(eattacker) && is_true(eattacker.b_aat_fire_works_weapon))
	{
		return 0;
	}
	if(is_true(self.use_adjusted_grenade_damage))
	{
		self.use_adjusted_grenade_damage = undefined;
		if(self.health > idamage)
		{
			return idamage;
		}
	}
	if(!idamage)
	{
		return 0;
	}
	if(self laststand::player_is_in_laststand() && !is_true(self.var_b895a3ff))
	{
		return 0;
	}
	if(isdefined(einflictor))
	{
		if(is_true(einflictor.water_damage))
		{
			return 0;
		}
	}
	if(isdefined(eattacker))
	{
		if(eattacker.owner === self)
		{
			return 0;
		}
		if(isdefined(self.ignoreattacker) && self.ignoreattacker == eattacker)
		{
			return 0;
		}
		if(is_true(self.is_zombie) && is_true(eattacker.is_zombie))
		{
			return 0;
		}
		if(isdefined(eattacker.is_zombie) && eattacker.is_zombie)
		{
			self.ignoreattacker = eattacker;
			self thread remove_ignore_attacker();
			if(isdefined(eattacker.custom_damage_func))
			{
				idamage = eattacker [[eattacker.custom_damage_func]](self);
			}
		}
		if(isactor(eattacker) && (smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_MELEE_ASSASSINATE" || smeansofdeath == "MOD_MELEE_WEAPON_BUTT" || weapon.name === #"hash_4281516c4849b247"))
		{
			var_88e5b029 = 1;
			round_number = zm_utility::get_round_number();
			if(round_number > 10 && round_number <= 30)
			{
				var_88e5b029 = 1.6666;
			}
			else
			{
				if(round_number > 30 && round_number <= 45)
				{
					var_88e5b029 = 2.5;
				}
				else if(round_number > 45)
				{
					var_88e5b029 = 3;
				}
			}
			idamage = int(ceil(idamage * var_88e5b029));
			if(idamage > 225)
			{
				idamage = 225;
			}
		}
		eattacker notify(#"hit_player");
		if(isdefined(eattacker) && isdefined(eattacker.func_mod_damage_override))
		{
			smeansofdeath = eattacker [[eattacker.func_mod_damage_override]](einflictor, smeansofdeath, weapon);
		}
		if(smeansofdeath != "MOD_FALLING")
		{
			if(is_true(eattacker.is_zombie) || isplayer(eattacker))
			{
				self playrumbleonentity("damage_heavy");
			}
			if(eattacker.archetype === #"zombie")
			{
				self zm_audio::create_and_play_dialog(#"general", #"attacked");
			}
			if(randomintrange(0, 1) == 0)
			{
				self thread zm_audio::playerexert("hitmed");
			}
			else
			{
				self thread zm_audio::playerexert("hitlrg");
			}
		}
	}
	if(isdefined(smeansofdeath) && smeansofdeath == "MOD_DROWN")
	{
		self thread zm_audio::playerexert("drowning", 1);
		self.voxdrowning = 1;
	}
	if(isdefined(level.perk_damage_override))
	{
		foreach(func in level.perk_damage_override)
		{
			n_damage = self [[func]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime);
			if(isdefined(n_damage))
			{
				idamage = n_damage;
			}
		}
	}
	if(zm_loadout::is_placeable_mine(weapon))
	{
		return 0;
	}
	if(isdefined(self.player_damage_override))
	{
		self thread [[self.player_damage_override]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime);
	}
	if(isdefined(einflictor) && isdefined(einflictor.archetype) && einflictor.archetype == #"zombie_quad")
	{
		if(smeansofdeath == "MOD_EXPLOSIVE")
		{
			if(self.health > 75)
			{
				return 75;
			}
		}
	}
	if(smeansofdeath == "MOD_SUICIDE" && self bgb::is_enabled(#"zm_bgb_danger_closest"))
	{
		return 0;
	}
	armor = self armor::get_armor();
	gear_armor = self.armor;
	self.var_426947c4 = undefined;
	idamage = self armor::apply_damage(weapon, idamage, smeansofdeath, eattacker, shitloc);
	idamage = self armor::function_a77114f2(einflictor, eattacker, idamage, smeansofdeath, weapon, shitloc);
	var_8da1698b = armor != self armor::get_armor();
	if(var_8da1698b)
	{
		if(isdefined(self.var_fa7c46f))
		{
			idamage = 0;
		}
		idflags = idflags | 2048;
		if(gear_armor > 0 && self.armor <= 0)
		{
			self.var_426947c4 = 1;
		}
	}
	if(is_true(self.power_armor_took_damage))
	{
		idflags = idflags | 1024;
	}
	if(isdefined(level.var_ccdc4ca6))
	{
		for(i = 0; i < level.var_ccdc4ca6.size; i++)
		{
			var_36da0ddb = self [[level.var_ccdc4ca6[i]]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime);
			if(isdefined(var_36da0ddb) && var_36da0ddb != -1)
			{
				idamage = var_36da0ddb;
			}
		}
	}
	if(zm_utility::is_explosive_damage(smeansofdeath))
	{
		if(self bgb::is_enabled(#"zm_bgb_danger_closest"))
		{
			return 0;
		}
		if(!is_true(self.is_zombie))
		{
			if(!isdefined(eattacker) || (!is_true(eattacker.is_zombie) && !is_true(eattacker.b_override_explosive_damage_cap)))
			{
				if(isdefined(weapon.name) && (weapon.name == #"ray_gun" || weapon.name == #"ray_gun_upgraded"))
				{
					if(self.health > 25 && idamage > 25)
					{
						return 25;
					}
				}
				else if(self.health > 75 && idamage > 75)
				{
					return 75;
				}
			}
		}
	}
	if(is_true(self.var_96971e3c))
	{
		if(is_true(eattacker.is_zombie) && eattacker.var_6f84b820 === #"normal")
		{
			eattacker.var_6e9934ba = 1;
			playfxontag(#"hash_2bc83d9e991e53ad", eattacker, "j_spine4");
			eattacker thread zm_ai_utility::function_e9209002(self.origin, 2, 1, self);
		}
	}
	finaldamage = idamage;
	if(idamage < self.health)
	{
		if(isdefined(eattacker))
		{
			if(isdefined(level.custom_kill_damaged_vo))
			{
				eattacker thread [[level.custom_kill_damaged_vo]](self);
			}
			else
			{
				eattacker.sound_damage_player = self;
			}
			if(is_true(eattacker.missinglegs))
			{
				self zm_audio::create_and_play_dialog(#"general", #"crawl_hit");
			}
		}
		return idamage;
	}
	if(isgodmode(self))
	{
		return idamage;
	}
	if(isdefined(level.player_death_override) && self [[level.player_death_override]]())
	{
		return 0;
	}
	if(isdefined(eattacker))
	{
		self zm_stats::handle_death(einflictor, eattacker, weapon, smeansofdeath);
	}
	self thread clear_path_timers();
	if(level.intermission)
	{
		level waittill(#"forever");
	}
	if(level.scr_zm_ui_gametype == "zcleansed" && idamage > 0)
	{
		if(isdefined(eattacker) && isplayer(eattacker) && eattacker.team != self.team && (!is_true(self.laststand) && !self laststand::player_is_in_laststand() || !isdefined(self.last_player_attacker)))
		{
			if(isdefined(eattacker.maxhealth) && is_true(eattacker.is_zombie))
			{
				eattacker.health = eattacker.maxhealth;
			}
			if(isdefined(level.player_kills_player))
			{
				self thread [[level.player_kills_player]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime);
			}
		}
	}
	if(self hasperk(#"specialty_whoswho") && self zm_laststand::function_618fd37e() > 0)
	{
		self zm_laststand::function_409dc98e();
		if(isdefined(level.whoswho_laststand_func))
		{
			self thread [[level.whoswho_laststand_func]]();
			return 0;
		}
	}
	if(self zm_laststand::function_618fd37e() > 0 || is_true(self.var_5f465b1) || self namespace_791d0451::function_56cedda7(#"hash_504b3df717f88c4e") || (self namespace_e86ffa8::function_33d837e4() && !is_true(self.var_b895a3ff)))
	{
		var_228d944 = 1;
	}
	else
	{
		var_228d944 = function_3799b373(self);
	}
	if(var_228d944 || zm_utility::function_91403f47())
	{
		return finaldamage;
	}
	if(isdefined(level.var_57cc29f3) && [[level.var_57cc29f3]](self))
	{
		return finaldamage;
	}
	if(getplayers().size == 1 && level flag::get("solo_game"))
	{
		if(isdefined(level.check_end_solo_game_override) && [[level.check_end_solo_game_override]]())
		{
			return finaldamage;
		}
		self.intermission = 1;
	}
	level notify(#"stop_suicide_trigger");
	self allowprone(1);
	self thread zm_laststand::playerlaststand(einflictor, eattacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime);
	if(!isdefined(vdir))
	{
		vdir = (1, 0, 0);
	}
	self fakedamagefrom(vdir);
	level notify(#"last_player_died");
	if(isdefined(level.custom_player_fake_death))
	{
		self thread [[level.custom_player_fake_death]](vdir, smeansofdeath);
	}
	else
	{
		self player_fake_death();
	}
	level notify(#"pre_end_game");
	util::wait_network_frame();
	if(level flag::get("dog_round"))
	{
		zm::increment_dog_round_stat("lost");
	}
	level notify(#"end_game", {#reason:#"last_player_died"});
	return 0;
}

/*
	Name: clear_path_timers
	Namespace: zm_player
	Checksum: 0xBAB8B76
	Offset: 0x7188
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function clear_path_timers()
{
	zombies = getaiteamarray(level.zombie_team);
	foreach(zombie in zombies)
	{
		if(isdefined(zombie.favoriteenemy) && zombie.favoriteenemy == self)
		{
			zombie.zombie_path_timer = 0;
		}
	}
}

/*
	Name: check_player_damage_callbacks
	Namespace: zm_player
	Checksum: 0x5D95A9F9
	Offset: 0x7250
	Size: 0x150
	Parameters: 10
	Flags: Linked
*/
function check_player_damage_callbacks(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(isdefined(level.var_5391c404))
	{
		for(i = 0; i < level.var_5391c404.size; i++)
		{
			newdamage = self [[level.var_5391c404[i]]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime);
			if(-1 != newdamage)
			{
				return newdamage;
			}
		}
	}
	if(isdefined(level.player_damage_callbacks))
	{
		for(i = 0; i < level.player_damage_callbacks.size; i++)
		{
			newdamage = self [[level.player_damage_callbacks[i]]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime);
			if(-1 != newdamage)
			{
				return newdamage;
			}
		}
	}
	return idamage;
}

/*
	Name: function_57301eaf
	Namespace: zm_player
	Checksum: 0xA941FC72
	Offset: 0x73A8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_57301eaf(func)
{
	if(!isdefined(level.var_5391c404))
	{
		level.var_5391c404 = [];
	}
	level.var_5391c404[level.var_5391c404.size] = func;
}

/*
	Name: register_player_damage_callback
	Namespace: zm_player
	Checksum: 0xDF5A80FB
	Offset: 0x73F8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function register_player_damage_callback(func)
{
	if(!isdefined(level.player_damage_callbacks))
	{
		level.player_damage_callbacks = [];
	}
	level.player_damage_callbacks[level.player_damage_callbacks.size] = func;
}

/*
	Name: function_a827358a
	Namespace: zm_player
	Checksum: 0x63683E1F
	Offset: 0x7448
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_a827358a(func)
{
	if(!isdefined(level.var_ccdc4ca6))
	{
		level.var_ccdc4ca6 = [];
	}
	level.var_ccdc4ca6[level.var_ccdc4ca6.size] = func;
}

/*
	Name: player_fake_death
	Namespace: zm_player
	Checksum: 0x7F2280DC
	Offset: 0x7498
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function player_fake_death()
{
	self endon(#"death");
	level notify(#"fake_death");
	self notify(#"fake_death");
	self.health = 1;
	self takeallweapons();
	self allowprone(1);
	self allowstand(0);
	self allowcrouch(0);
	self allowsprint(0);
	self setstance("prone");
	if(self isinvehicle())
	{
		self unlink();
	}
	self.var_67ec7eb0 = 1;
	self val::set(#"fake_death", "ignoreme", 1);
	self val::set(#"fake_death", "takedamage", 0);
	wait(1);
	self val::set(#"fake_death", "freezecontrols", 1);
	wait(1.25);
}

/*
	Name: player_exit_level
	Namespace: zm_player
	Checksum: 0x7958CFC5
	Offset: 0x7650
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function player_exit_level()
{
	self allowstand(1);
	self allowcrouch(0);
	self allowprone(0);
}

/*
	Name: player_killed_override
	Namespace: zm_player
	Checksum: 0xF5BEBD
	Offset: 0x76A8
	Size: 0x6C
	Parameters: 10
	Flags: Linked
*/
function player_killed_override(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration)
{
	level waittill(#"forever");
}

/*
	Name: screen_fade_in
	Namespace: zm_player
	Checksum: 0xCF7BBC9C
	Offset: 0x7720
	Size: 0x62
	Parameters: 4
	Flags: Linked
*/
function screen_fade_in(n_time, v_color, str_menu_id, var_b675738a)
{
	if(!isdefined(var_b675738a))
	{
		var_b675738a = 0;
	}
	lui::screen_fade(n_time, 0, 1, v_color, 0, str_menu_id, var_b675738a);
	wait(n_time);
}

/*
	Name: player_intermission
	Namespace: zm_player
	Checksum: 0xDDA1238A
	Offset: 0x7790
	Size: 0x42A
	Parameters: 0
	Flags: Linked
*/
function player_intermission()
{
	self closeingamemenu();
	self closemenu("StartMenu_Main");
	self notify(#"player_intermission");
	self endon(#"player_intermission", #"disconnect", #"death");
	level endon(#"stop_intermission");
	self notify(#"_zombie_game_over");
	if(!isdefined(self.score_total))
	{
		self.score_total = 0;
	}
	self.score = self.score_total;
	points = struct::get_array("intermission", "targetname");
	if(!isdefined(points) || points.size == 0)
	{
		points = getentarray("info_intermission", "classname");
		if(points.size < 1)
		{
			/#
				println("");
			#/
			return;
		}
	}
	if(is_true(level.b_show_single_intermission))
	{
		a_s_temp_points = array::randomize(points);
		points = [];
		points[0] = array::random(a_s_temp_points);
	}
	else
	{
		points = array::randomize(points);
	}
	self zm_utility::create_streamer_hint(points[0].origin, points[0].angles, 0.9);
	wait(5);
	self lui::screen_fade_out(1, undefined, undefined, 1);
	self.sessionstate = "intermission";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.friendlydamage = undefined;
	if(isdefined(level.player_intemission_spawn_callback))
	{
		self thread [[level.player_intemission_spawn_callback]](points[0].origin, points[0].angles);
	}
	while(true)
	{
		for(i = 0; i < points.size; i++)
		{
			point = points[i];
			nextpoint = points[i + 1];
			self setorigin(point.origin);
			self setplayerangles(point.angles);
			wait(0.15);
			self notify(#"player_intermission_spawned");
			if(isdefined(nextpoint))
			{
				self zm_utility::create_streamer_hint(nextpoint.origin, nextpoint.angles, 0.9);
				self screen_fade_in(2, undefined, undefined, 1);
				wait(3);
				self lui::screen_fade_out(2, undefined, undefined, 1);
				continue;
			}
			self screen_fade_in(2, undefined, undefined, 1);
			if(points.size == 1)
			{
				return;
			}
		}
	}
}

/*
	Name: zm_on_player_connect
	Namespace: zm_player
	Checksum: 0xBCF89CF5
	Offset: 0x7BC8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function zm_on_player_connect()
{
	self.hitsoundtracker = 1;
	thread update_is_player_valid();
	characterindex = self getcharacterbodytype();
	self stats::function_7a850245(#"characterindex", characterindex);
}

/*
	Name: zm_on_player_spawned
	Namespace: zm_player
	Checksum: 0x7821B33
	Offset: 0x7C40
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function zm_on_player_spawned()
{
	self setperk("specialty_sprint");
	self setperk("specialty_sprintreload");
	self setperk("specialty_slide");
	thread zm_utility::update_zone_name();
	if(!isdefined(self.teammateindex) || self.teammateindex < 1 || self.teammateindex > 4)
	{
		self squads::function_c70b26ea();
	}
	self notify(#"hash_606be34c407533f6");
}

/*
	Name: update_is_player_valid
	Namespace: zm_player
	Checksum: 0x5B68CF29
	Offset: 0x7D18
	Size: 0x88
	Parameters: 0
	Flags: Linked
*/
function update_is_player_valid()
{
	self notify("5f2a3e73a0adc2f6");
	self endon("5f2a3e73a0adc2f6");
	self endon(#"disconnect");
	self.am_i_valid = 0;
	while(isdefined(self))
	{
		self.am_i_valid = zm_utility::is_player_valid(self, 1) || is_true(self.var_b895a3ff);
		waitframe(1);
	}
}

/*
	Name: register_slowdown
	Namespace: zm_player
	Checksum: 0x47121BB0
	Offset: 0x7DA8
	Size: 0xCA
	Parameters: 3
	Flags: None
*/
function register_slowdown(str_type, n_rate, n_duration)
{
	if(!isdefined(level.var_f27112f9))
	{
		level.var_f27112f9 = [];
	}
	else if(!isarray(level.var_f27112f9))
	{
		level.var_f27112f9 = array(level.var_f27112f9);
	}
	level.var_f27112f9[str_type] = spawnstruct();
	level.var_f27112f9[str_type].n_rate = n_rate;
	level.var_f27112f9[str_type].n_duration = n_duration;
}

/*
	Name: slowdown
	Namespace: zm_player
	Checksum: 0x244FC536
	Offset: 0x7E80
	Size: 0x334
	Parameters: 2
	Flags: None
*/
function slowdown(str_type, var_a47cf2b2)
{
	if(is_true(self.var_7b0667d9))
	{
		return;
	}
	self notify(#"hash_31eac0065ba118f5");
	self endoncallback(&function_fe7a7d5b, #"hash_31eac0065ba118f5", #"death", #"hash_28af7943f07d93e2");
	/#
		assert(isdefined(level.var_f27112f9[str_type]), ("" + str_type) + "");
	#/
	if(!isdefined(self.a_n_slowdown_timeouts))
	{
		self.a_n_slowdown_timeouts = [];
	}
	n_time = gettime();
	if(isdefined(level.var_f27112f9[str_type].n_duration))
	{
		n_timeout = n_time + level.var_f27112f9[str_type].n_duration;
		if(!isdefined(self.a_n_slowdown_timeouts[str_type]) || self.a_n_slowdown_timeouts[str_type] < n_timeout)
		{
			self.a_n_slowdown_timeouts[str_type] = n_timeout;
		}
	}
	else
	{
		self.a_n_slowdown_timeouts[str_type] = -1;
	}
	while(self.a_n_slowdown_timeouts.size)
	{
		str_lowest_type = undefined;
		n_lowest_rate = 10;
		foreach(str_index, n_slowdown_timeout in self.a_n_slowdown_timeouts)
		{
			if(isdefined(n_timeout) && n_slowdown_timeout <= n_time)
			{
				self.a_n_slowdown_timeouts[str_index] = undefined;
				continue;
			}
			if(str_index == str_type && isdefined(var_a47cf2b2))
			{
				n_rate = var_a47cf2b2;
			}
			else
			{
				n_rate = level.var_f27112f9[str_index].n_rate;
			}
			if(n_rate < n_lowest_rate)
			{
				str_lowest_type = str_index;
				n_lowest_rate = n_rate;
			}
		}
		if(isdefined(str_lowest_type))
		{
			self setmovespeedscale(n_lowest_rate);
			if(!isdefined(n_timeout))
			{
				self waittill(#"hash_28af7943f07d93e2");
				return;
			}
			n_duration = self.a_n_slowdown_timeouts[str_lowest_type] - n_time;
			wait(n_duration);
			self.a_n_slowdown_timeouts[str_lowest_type] = undefined;
		}
	}
	self setmovespeedscale(1);
}

/*
	Name: function_520f4da5
	Namespace: zm_player
	Checksum: 0x2923CD1
	Offset: 0x81C0
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function function_520f4da5()
{
	self notify(#"hash_28af7943f07d93e2");
}

/*
	Name: function_fe7a7d5b
	Namespace: zm_player
	Checksum: 0x1361CAD2
	Offset: 0x81E0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fe7a7d5b(str_notify)
{
	self setmovespeedscale(1);
}

/*
	Name: function_74b6d714
	Namespace: zm_player
	Checksum: 0x16CA6041
	Offset: 0x8218
	Size: 0x164
	Parameters: 5
	Flags: Linked
*/
function function_74b6d714(attacker, effectname, var_894859a2, var_ab5b905e, weapon)
{
	var_20df3f41 = function_1115bceb(effectname);
	if(isdefined(var_ab5b905e) && var_ab5b905e > 0)
	{
		duration = var_ab5b905e;
	}
	else
	{
		duration = undefined;
	}
	attackerishittingteammate = isplayer(attacker) && self util::isenemyplayer(attacker) == 0 && self != attacker;
	attackerishittingself = isplayer(attacker) && self == attacker;
	if(attackerishittingself && weapon.var_50d2316b)
	{
		return;
	}
	if(self namespace_e86ffa8::function_71680faf(1))
	{
		var_894859a2 = 0.5;
	}
	if(attackerishittingteammate)
	{
		return;
	}
	self status_effect::status_effect_apply(var_20df3f41, weapon, attacker, undefined, duration, var_894859a2);
}

