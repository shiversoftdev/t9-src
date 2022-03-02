#using script_25c09ccacf057919;
#using script_69d3c825b6585548;
#using script_7133a4d461308099;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\delete.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace load_shared;

/*
	Name: function_14ad4fd4
	Namespace: load_shared
	Checksum: 0xA4F646CC
	Offset: 0x260
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_14ad4fd4()
{
	level notify(439927368);
}

#namespace load;

/*
	Name: function_89f2df9
	Namespace: load
	Checksum: 0xC93E092C
	Offset: 0x280
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"load", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: main
	Namespace: load
	Checksum: 0x690D799B
	Offset: 0x2C8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function main()
{
	/#
		assert(isdefined(level.var_f18a6bd6));
	#/
	[[level.var_f18a6bd6]]();
}

/*
	Name: init_flags
	Namespace: load
	Checksum: 0xF3765AD3
	Offset: 0x308
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
	level flag::init("all_players_connected");
	level flag::init("all_players_spawned");
	level flag::init("first_player_spawned");
}

/*
	Name: first_frame
	Namespace: load
	Checksum: 0xF81E1164
	Offset: 0x378
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function first_frame()
{
	level.first_frame = 1;
	waitframe(1);
	level.first_frame = undefined;
	level.var_22944a63 = 1;
}

/*
	Name: function_70a657d8
	Namespace: load
	Checksum: 0xE694FD04
	Offset: 0x3B8
	Size: 0x3A4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.animation))
	{
		level.animation = spawnstruct();
	}
	init_flags();
	thread first_frame();
	/#
		level thread level_notify_listener();
		level thread client_notify_listener();
		level thread load_checkpoint_on_notify();
		level thread save_checkpoint_on_notify();
	#/
	level.var_8a3a9ca4 = spawnstruct();
	defaultaspectratio = 1;
	if(sessionmodeiscampaigngame())
	{
		level.game_mode_suffix = "_cp";
		defaultaspectratio = 1.777778;
	}
	else
	{
		if(sessionmodeiszombiesgame())
		{
			level.game_mode_suffix = "_zm";
		}
		else
		{
			level.game_mode_suffix = "_mp";
			defaultaspectratio = 1.777778;
		}
	}
	level.script = util::function_53bbf9d2();
	level.clientscripts = getdvarstring(#"cg_usingclientscripts") != "";
	level.clientscripts = getdvarstring(#"cg_usingclientscripts") != "";
	if(!isdefined(level.timeofday))
	{
		level.timeofday = "day";
	}
	if(getdvarstring(#"scr_requiredmapaspectratio") == "")
	{
		setdvar(#"scr_requiredmapaspectratio", defaultaspectratio);
	}
	util::registerclientsys("levelNotify");
	level thread all_players_spawned();
	level thread keep_time();
	level thread count_network_frames();
	callback::on_spawned(&on_spawned);
	self thread playerdamagerumble();
	array::thread_all(getentarray("water", "targetname"), &water_think);
	array::thread_all_ents(getentarray("badplace", "targetname"), &badplace_think);
	weapon_ammo();
	set_objective_text_colors();
	link_ents();
	hide_ents();
}

/*
	Name: count_network_frames
	Namespace: load
	Checksum: 0xCA5648BF
	Offset: 0x768
	Size: 0x48
	Parameters: 0
	Flags: Linked
*/
function count_network_frames()
{
	level.network_frame = 0;
	while(true)
	{
		util::wait_network_frame();
		level.network_frame++;
		level.var_58bc5d04 = gettime();
	}
}

/*
	Name: keep_time
	Namespace: load
	Checksum: 0x85167153
	Offset: 0x7B8
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function keep_time()
{
	while(true)
	{
		level.time = gettime();
		waitframe(1);
	}
}

/*
	Name: level_notify_listener
	Namespace: load
	Checksum: 0x3B73A9BE
	Offset: 0x7E8
	Size: 0x148
	Parameters: 0
	Flags: None
*/
function level_notify_listener()
{
	/#
		while(true)
		{
			val = getdvarstring(#"level_notify");
			if(val != "")
			{
				toks = strtok(val, "");
				if(toks.size == 3)
				{
					level notify(toks[0], {#param2:toks[2], #param1:toks[1]});
				}
				else
				{
					if(toks.size == 2)
					{
						level notify(toks[0], {#param1:toks[1]});
					}
					else
					{
						level notify(toks[0]);
					}
				}
				setdvar(#"level_notify", "");
			}
			wait(0.2);
		}
	#/
}

/*
	Name: client_notify_listener
	Namespace: load
	Checksum: 0x68C96B8C
	Offset: 0x938
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function client_notify_listener()
{
	/#
		while(true)
		{
			val = getdvarstring(#"client_notify");
			if(val != "")
			{
				util::clientnotify(val);
				setdvar(#"client_notify", "");
			}
			wait(0.2);
		}
	#/
}

/*
	Name: save_checkpoint_on_notify
	Namespace: load
	Checksum: 0x712D2F21
	Offset: 0x9D8
	Size: 0x48
	Parameters: 0
	Flags: None
*/
function save_checkpoint_on_notify()
{
	/#
		while(true)
		{
			level waittill(#"save");
			checkpointcreate();
			checkpointcommit();
		}
	#/
}

/*
	Name: load_checkpoint_on_notify
	Namespace: load
	Checksum: 0x5602BF4B
	Offset: 0xA28
	Size: 0x68
	Parameters: 0
	Flags: None
*/
function load_checkpoint_on_notify()
{
	/#
		while(true)
		{
			level waittill(#"load");
			if(isdefined(level.var_36a4cf75))
			{
				[[level.var_36a4cf75]]();
			}
			level.var_5be43b2d = 1;
			checkpointrestart();
		}
	#/
}

/*
	Name: weapon_ammo
	Namespace: load
	Checksum: 0x4F52ECFD
	Offset: 0xA98
	Size: 0x254
	Parameters: 0
	Flags: Linked
*/
function weapon_ammo()
{
	ents = getentarray();
	for(i = 0; i < ents.size; i++)
	{
		if(isdefined(ents[i].classname) && getsubstr(ents[i].classname, 0, 7) == "weapon_")
		{
			weap = ents[i];
			change_ammo = 0;
			clip = undefined;
			extra = undefined;
			if(isdefined(weap.script_ammo_clip))
			{
				clip = weap.script_ammo_clip;
				change_ammo = 1;
			}
			if(isdefined(weap.script_ammo_extra))
			{
				extra = weap.script_ammo_extra;
				change_ammo = 1;
			}
			if(is_true(weap.var_d99dd379))
			{
				clip = weap.item.clipsize;
				change_ammo = 1;
			}
			if(is_true(weap.var_38a11c38))
			{
				extra = weap.item.maxammo;
				change_ammo = 1;
			}
			if(change_ammo)
			{
				if(!isdefined(clip))
				{
					/#
						assertmsg(((("" + weap.classname) + "") + weap.origin) + "");
					#/
				}
				if(!isdefined(extra))
				{
					/#
						assertmsg(((("" + weap.classname) + "") + weap.origin) + "");
					#/
				}
				weap itemweaponsetammo(clip, extra);
				weap itemweaponsetammo(clip, extra, 1);
			}
		}
	}
}

/*
	Name: badplace_think
	Namespace: load
	Checksum: 0x87C71F63
	Offset: 0xCF8
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function badplace_think(badplace)
{
	if(!isdefined(level.badplaces))
	{
		level.badplaces = 0;
	}
	level.badplaces++;
	if(isdefined(badplace.radius))
	{
		badplace_box("badplace" + level.badplaces, -1, badplace.origin, badplace.radius, "all");
	}
	else
	{
		var_d5d73152 = badplace getpointinbounds(1, 1, 1);
		var_c7691d56 = badplace getpointinbounds(-1, -1, -1);
		var_9a490e0c = badplace getpointinbounds(0, 0, 0);
		var_856c0347 = (var_d5d73152 - var_c7691d56) * 0.5;
		badplace_box("badplace" + level.badplaces, -1, var_9a490e0c, var_856c0347, "all");
	}
}

/*
	Name: playerdamagerumble
	Namespace: load
	Checksum: 0x6B8FBA31
	Offset: 0xE60
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function playerdamagerumble()
{
	while(true)
	{
		self waittill(#"damage");
		if(isdefined(self.specialdamage))
		{
			continue;
		}
		self playrumbleonentity("damage_heavy");
	}
}

/*
	Name: map_is_early_in_the_game
	Namespace: load
	Checksum: 0xECFEA61A
	Offset: 0xEC0
	Size: 0x72
	Parameters: 0
	Flags: None
*/
function map_is_early_in_the_game()
{
	/#
		if(isdefined(level.testmap))
		{
			return 1;
		}
	#/
	/#
		if(!isdefined(level.early_level[level.script]))
		{
			level.early_level[level.script] = 0;
		}
	#/
	return is_true(level.early_level[level.script]);
}

/*
	Name: player_throwgrenade_timer
	Namespace: load
	Checksum: 0xD5AD3519
	Offset: 0xF40
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function player_throwgrenade_timer()
{
	self endon(#"death", #"disconnect");
	self.lastgrenadetime = 0;
	while(true)
	{
		while(!self isthrowinggrenade())
		{
			wait(0.05);
		}
		self.lastgrenadetime = gettime();
		while(self isthrowinggrenade())
		{
			wait(0.05);
		}
	}
}

/*
	Name: water_think
	Namespace: load
	Checksum: 0xD2ACAB9C
	Offset: 0xFD8
	Size: 0x40A
	Parameters: 0
	Flags: Linked
*/
function water_think()
{
	/#
		assert(isdefined(self.target));
	#/
	targeted = getent(self.target, "targetname");
	/#
		assert(isdefined(targeted));
	#/
	waterheight = targeted.origin[2];
	targeted = undefined;
	level.depth_allow_prone = 8;
	level.depth_allow_crouch = 33;
	level.depth_allow_stand = 50;
	while(true)
	{
		waitframe(1);
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i].inwater)
			{
				players[i] allowprone(1);
				players[i] allowcrouch(1);
				players[i] allowstand(1);
			}
		}
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		other = waitresult.activator;
		if(!isplayer(other))
		{
			continue;
		}
		while(true)
		{
			players = getplayers();
			players_in_water_count = 0;
			for(i = 0; i < players.size; i++)
			{
				if(players[i] istouching(self))
				{
					players_in_water_count++;
					players[i].inwater = 1;
					playerorg = players[i] getorigin();
					d = playerorg[2] - waterheight;
					if(d > 0)
					{
						continue;
					}
					newspeed = int(level.default_run_speed - (abs(d * 5)));
					if(newspeed < 50)
					{
						newspeed = 50;
					}
					/#
						assert(newspeed <= 190);
					#/
					if(abs(d) > level.depth_allow_crouch)
					{
						players[i] allowcrouch(0);
					}
					else
					{
						players[i] allowcrouch(1);
					}
					if(abs(d) > level.depth_allow_prone)
					{
						players[i] allowprone(0);
					}
					else
					{
						players[i] allowprone(1);
					}
					continue;
				}
				if(players[i].inwater)
				{
					players[i].inwater = 0;
				}
			}
			if(players_in_water_count == 0)
			{
				break;
			}
			wait(0.5);
		}
		waitframe(1);
	}
}

/*
	Name: set_objective_text_colors
	Namespace: load
	Checksum: 0x72A78344
	Offset: 0x13F0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function set_objective_text_colors()
{
	if(isdedicated())
	{
		return;
	}
	my_textbrightness_default = "1.0 1.0 1.0";
	my_textbrightness_90 = "0.9 0.9 0.9";
	if(level.script == "armada")
	{
		setsaveddvar(#"con_typewritercolorbase", my_textbrightness_90);
		return;
	}
	setsaveddvar(#"con_typewritercolorbase", my_textbrightness_default);
}

/*
	Name: lerp_trigger_dvar_value
	Namespace: load
	Checksum: 0xE60A05D5
	Offset: 0x1498
	Size: 0xF4
	Parameters: 4
	Flags: None
*/
function lerp_trigger_dvar_value(trigger, dvar, value, time)
{
	trigger.lerping_dvar[dvar] = 1;
	steps = time * 20;
	curr_value = getdvarfloat(dvar, 0);
	diff = (curr_value - value) / steps;
	for(i = 0; i < steps; i++)
	{
		curr_value = curr_value - diff;
		setsaveddvar(dvar, curr_value);
		waitframe(1);
	}
	setsaveddvar(dvar, value);
	trigger.lerping_dvar[dvar] = 0;
}

/*
	Name: set_fog_progress
	Namespace: load
	Checksum: 0x9FF9669B
	Offset: 0x1598
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function set_fog_progress(progress)
{
	anti_progress = 1 - progress;
	startdist = (self.script_start_dist * anti_progress) + (self.script_start_dist * progress);
	halfwaydist = (self.script_halfway_dist * anti_progress) + (self.script_halfway_dist * progress);
	color = (self.script_color * anti_progress) + (self.script_color * progress);
	setvolfog(startdist, halfwaydist, self.script_halfway_height, self.script_base_height, color[0], color[1], color[2], 0.4);
}

/*
	Name: ascii_logo
	Namespace: load
	Checksum: 0x18A642E1
	Offset: 0x1680
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function ascii_logo()
{
	/#
		println("");
	#/
}

/*
	Name: all_players_spawned
	Namespace: load
	Checksum: 0x65B45114
	Offset: 0x16B0
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function all_players_spawned()
{
	level flag::wait_till("all_players_connected");
	waittillframeend();
	level.host = util::gethostplayer();
	while(true)
	{
		if(getnumconnectedplayers() == 0)
		{
			waitframe(1);
			continue;
		}
		players = getplayers();
		count = 0;
		for(i = 0; i < players.size; i++)
		{
			if(players[i].sessionstate == "playing" || (players[i].team == #"spectator" && players[i].sessionstate == "spectator"))
			{
				count++;
			}
		}
		waitframe(1);
		if(count > 0)
		{
			level flag::set("first_player_spawned");
		}
		if(count == players.size)
		{
			break;
		}
	}
	level flag::set("all_players_spawned");
}

/*
	Name: shock_onpain
	Namespace: load
	Checksum: 0xB0384F0C
	Offset: 0x1830
	Size: 0x238
	Parameters: 0
	Flags: Linked
*/
function shock_onpain()
{
	self endon(#"death", #"disconnect", #"killonpainmonitor");
	if(getdvarstring(#"blurpain") == "")
	{
		setdvar(#"blurpain", "on");
	}
	while(true)
	{
		oldhealth = self.health;
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		mod = waitresult.mod;
		damage = waitresult.amount;
		if(isdefined(level.shock_onpain) && !level.shock_onpain)
		{
			continue;
		}
		if(isdefined(self.shock_onpain) && !self.shock_onpain)
		{
			continue;
		}
		if(self.health < 1)
		{
			continue;
		}
		if(mod === "MOD_PROJECTILE")
		{
			continue;
		}
		else
		{
			if(mod === "MOD_GRENADE_SPLASH" || mod === "MOD_GRENADE" || mod === "MOD_EXPLOSIVE" || mod === "MOD_PROJECTILE_SPLASH")
			{
				self shock_onexplosion(damage);
			}
			else if(getdvarstring(#"blurpain") == "on")
			{
				self shellshock(#"pain", 0.5);
			}
		}
	}
}

/*
	Name: shock_onexplosion
	Namespace: load
	Checksum: 0x1A6E8B22
	Offset: 0x1A70
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function shock_onexplosion(damage)
{
	time = 0;
	multiplier = self.maxhealth / 100;
	scaled_damage = damage * multiplier;
	if(scaled_damage >= 90)
	{
		time = 4;
	}
	else
	{
		if(scaled_damage >= 50)
		{
			time = 3;
		}
		else
		{
			if(scaled_damage >= 25)
			{
				time = 2;
			}
			else if(scaled_damage > 10)
			{
				time = 1;
			}
		}
	}
}

/*
	Name: shock_ondeath
	Namespace: load
	Checksum: 0xCAFD8B62
	Offset: 0x1B28
	Size: 0x96
	Parameters: 0
	Flags: Linked
*/
function shock_ondeath()
{
	self waittill(#"death");
	if(isdefined(level.shock_ondeath) && !level.shock_ondeath)
	{
		return;
	}
	if(isdefined(self.shock_ondeath) && !self.shock_ondeath)
	{
		return;
	}
	if(isdefined(self.specialdeath))
	{
		return;
	}
	if(getdvarint(#"r_texturebits", 0) == 16)
	{
		return;
	}
}

/*
	Name: on_spawned
	Namespace: load
	Checksum: 0xA026A69
	Offset: 0x1BC8
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function on_spawned()
{
	if(!isdefined(self.player_inited) || !self.player_inited)
	{
		if(sessionmodeiscampaigngame())
		{
			self thread shock_ondeath();
			self thread shock_onpain();
			self flag::init("player_is_invulnerable");
		}
		waitframe(1);
		if(isdefined(self))
		{
			self.player_inited = 1;
		}
	}
}

/*
	Name: link_ents
	Namespace: load
	Checksum: 0xD6C991FC
	Offset: 0x1C70
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function link_ents()
{
	foreach(ent in getentarray())
	{
		if(isdefined(ent.linkto))
		{
			e_link = getent(ent.linkto, "linkname");
			if(isdefined(e_link))
			{
				ent enablelinkto();
				ent linkto(e_link);
			}
		}
	}
}

/*
	Name: hide_ents
	Namespace: load
	Checksum: 0xB8356A1C
	Offset: 0x1D60
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function hide_ents()
{
	foreach(ent in getentarray())
	{
		if(is_true(ent.var_8c43d611))
		{
			ent val::set(#"hash_231dddc2afe6275f", "hide", 1);
		}
	}
}

/*
	Name: art_review
	Namespace: load
	Checksum: 0xD0BD4569
	Offset: 0x1E30
	Size: 0x23A
	Parameters: 0
	Flags: Linked
*/
function art_review()
{
	dvarvalue = getdvarint(#"art_review", 0);
	switch(dvarvalue)
	{
		case 1:
		case 2:
		{
			/#
				hud = hud::function_f5a689d("", 1.2);
				hud hud::setpoint("", "", 0, -200);
				hud.sort = 1001;
				hud.color = (1, 0, 0);
				hud settext("");
				hud.foreground = 0;
				hud.hidewheninmenu = 0;
			#/
			if(sessionmodeiszombiesgame())
			{
				/#
					setdvar(#"zombie_cheat", 2);
					if(dvarvalue == 1)
					{
						setdvar(#"zombie_devgui", "");
					}
				#/
			}
			else
			{
				foreach(trig in trigger::get_all())
				{
					trig triggerenable(0);
				}
			}
			level.prematchperiod = 0;
			level waittill(#"forever");
			break;
		}
	}
}

