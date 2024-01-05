#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_ai_faller;

/*
	Name: zombie_faller_delete
	Namespace: zm_ai_faller
	Checksum: 0xDBFDFB02
	Offset: 0x280
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function zombie_faller_delete()
{
	level.zombie_total++;
	self zombie_utility::reset_attack_spot();
	if(isdefined(self.zombie_faller_location))
	{
		self.zombie_faller_location.is_enabled = 1;
		self.zombie_faller_location = undefined;
	}
	self delete();
}

/*
	Name: faller_script_parameters
	Namespace: zm_ai_faller
	Checksum: 0xC70C34E8
	Offset: 0x2E8
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function faller_script_parameters()
{
	if(isdefined(self.script_parameters))
	{
		parms = strtok(self.script_parameters, ";");
		if(isdefined(parms) && parms.size > 0)
		{
			for(i = 0; i < parms.size; i++)
			{
				if(parms[i] == "drop_now")
				{
					self.drop_now = 1;
				}
				if(parms[i] == "drop_not_occupied")
				{
					self.drop_not_occupied = 1;
				}
				if(parms[i] == "emerge_top")
				{
					self.emerge_top = 1;
				}
				if(parms[i] == "emerge_bottom")
				{
					self.emerge_bottom = 1;
				}
			}
		}
	}
}

/*
	Name: setup_deathfunc
	Namespace: zm_ai_faller
	Checksum: 0xAFA3BE4
	Offset: 0x3E8
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function setup_deathfunc(func_name)
{
	self endon(#"death");
	while(!is_true(self.zombie_init_done))
	{
		util::wait_network_frame();
	}
	if(isdefined(func_name))
	{
		self.deathfunction = func_name;
	}
	else
	{
		if(isdefined(level.custom_faller_death))
		{
			self.deathfunction = level.custom_faller_death;
		}
		else
		{
			self.deathfunction = &zombie_fall_death_func;
		}
	}
}

/*
	Name: do_zombie_fall
	Namespace: zm_ai_faller
	Checksum: 0xC09FFE0B
	Offset: 0x4A0
	Size: 0x37E
	Parameters: 1
	Flags: Linked
*/
function do_zombie_fall(spot)
{
	self endon(#"death");
	self.zombie_faller_location = spot;
	self.zombie_faller_location.is_enabled = 0;
	self.zombie_faller_location faller_script_parameters();
	if(is_true(self.zombie_faller_location.emerge_bottom) || is_true(self.zombie_faller_location.emerge_top))
	{
		self do_zombie_emerge(spot);
		return;
	}
	self thread setup_deathfunc();
	self.var_98f1f37c = 1;
	self.no_powerups = 1;
	self.in_the_ceiling = 1;
	self.anchor = spawn("script_origin", self.origin);
	self.anchor.angles = self.angles;
	self linkto(self.anchor);
	self.anchor thread zm_utility::anchor_delete_failsafe(self);
	if(!isdefined(spot.angles))
	{
		spot.angles = (0, 0, 0);
	}
	anim_org = spot.origin;
	anim_ang = spot.angles;
	self ghost();
	self.anchor moveto(anim_org, 0.05);
	self.anchor waittill(#"movedone");
	target_org = zombie_utility::get_desired_origin();
	if(isdefined(target_org))
	{
		anim_ang = vectortoangles(target_org - self.origin);
		self.anchor rotateto((0, anim_ang[1], 0), 0.05);
		self.anchor waittill(#"rotatedone");
	}
	self unlink();
	if(isdefined(self.anchor))
	{
		self.anchor delete();
	}
	self thread zombie_utility::hide_pop();
	self thread zombie_fall_death(spot);
	self thread zombie_fall_fx(spot);
	self thread zombie_faller_death_wait();
	self thread zombie_faller_do_fall();
	self.var_98f1f37c = 0;
	self.no_powerups = 0;
	self notify(#"risen", {#find_flesh_struct_string:spot.script_string});
}

/*
	Name: zombie_faller_do_fall
	Namespace: zm_ai_faller
	Checksum: 0x5D7CA8EA
	Offset: 0x828
	Size: 0x446
	Parameters: 0
	Flags: Linked
*/
function zombie_faller_do_fall()
{
	self endon(#"death");
	self animscripted("fall_anim", self.origin, self.zombie_faller_location.angles, "zm_faller_emerge");
	self zombie_shared::donotetracks("emerge_anim", &handle_fall_notetracks, self.zombie_faller_location);
	self.zombie_faller_wait_start = gettime();
	self.zombie_faller_should_drop = 0;
	self thread zombie_fall_wait();
	self thread zombie_faller_watch_all_players();
	while(!self.zombie_faller_should_drop)
	{
		if(self zombie_fall_should_attack(self.zombie_faller_location))
		{
			self animscripted("fall_anim", self.origin, self.zombie_faller_location.angles, "zm_faller_attack");
			self zombie_shared::donotetracks("attack_anim", &handle_fall_notetracks, self.zombie_faller_location);
			if(!self zombie_faller_always_drop() && randomfloat(1) > 0.5)
			{
				self.zombie_faller_should_drop = 1;
			}
		}
		else
		{
			if(self zombie_faller_always_drop())
			{
				self.zombie_faller_should_drop = 1;
				break;
			}
			else
			{
				if(gettime() >= (self.zombie_faller_wait_start + 20000))
				{
					self.zombie_faller_should_drop = 1;
					break;
				}
				else
				{
					if(self zombie_faller_drop_not_occupied())
					{
						self.zombie_faller_should_drop = 1;
						break;
					}
					else
					{
						self animscripted("fall_anim", self.origin, self.zombie_faller_location.angles, "zm_faller_attack");
						self zombie_shared::donotetracks("attack_anim", &handle_fall_notetracks, self.zombie_faller_location);
					}
				}
			}
		}
	}
	self notify(#"falling");
	spot = self.zombie_faller_location;
	self zombie_faller_enable_location();
	self animscripted("fall_anim", self.origin, spot.angles, "zm_faller_fall");
	self zombie_shared::donotetracks("fall_anim", &handle_fall_notetracks, spot);
	self.deathfunction = &zm_spawner::zombie_death_animscript;
	self notify(#"fall_anim_finished");
	spot notify(#"stop_zombie_fall_fx");
	self stopanimscripted();
	landanimdelta = 15;
	ground_pos = zm_utility::groundpos_ignore_water_new(self.origin);
	physdist = (self.origin[2] - ground_pos[2]) + landanimdelta;
	if(physdist > 0)
	{
		self waittill(#"faller_on_ground");
		self waittill(#"zombie_land_done");
	}
	self.in_the_ceiling = 0;
	self traversemode("gravity");
	self.no_powerups = 0;
}

/*
	Name: zombie_fall_loop
	Namespace: zm_ai_faller
	Checksum: 0x12FBF96C
	Offset: 0xC78
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function zombie_fall_loop()
{
	self endon(#"death");
	self setanimstatefromasd("zm_faller_fall_loop");
	while(true)
	{
		ground_pos = zm_utility::groundpos_ignore_water_new(self.origin);
		if(self.origin[2] - ground_pos[2] < 20)
		{
			self notify(#"faller_on_ground");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: zombie_land
	Namespace: zm_ai_faller
	Checksum: 0x1C7D29B9
	Offset: 0xD20
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function zombie_land()
{
	self setanimstatefromasd("zm_faller_land");
	zombie_shared::donotetracks("land_anim");
	self notify(#"zombie_land_done");
}

/*
	Name: zombie_faller_always_drop
	Namespace: zm_ai_faller
	Checksum: 0x56E22C4D
	Offset: 0xD78
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function zombie_faller_always_drop()
{
	if(is_true(self.zombie_faller_location.drop_now))
	{
		return true;
	}
	return false;
}

/*
	Name: zombie_faller_drop_not_occupied
	Namespace: zm_ai_faller
	Checksum: 0xB9F916B1
	Offset: 0xDB0
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function zombie_faller_drop_not_occupied()
{
	if(is_true(self.zombie_faller_location.drop_not_occupied))
	{
		if(isdefined(self.zone_name) && isdefined(level.zones[self.zone_name]))
		{
			return !level.zones[self.zone_name].is_occupied;
		}
	}
	return 0;
}

/*
	Name: zombie_faller_watch_all_players
	Namespace: zm_ai_faller
	Checksum: 0x1E5C2C92
	Offset: 0xE20
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function zombie_faller_watch_all_players()
{
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		self thread zombie_faller_watch_player(players[i]);
	}
}

/*
	Name: zombie_faller_watch_player
	Namespace: zm_ai_faller
	Checksum: 0xBD675191
	Offset: 0xE88
	Size: 0x244
	Parameters: 1
	Flags: Linked
*/
function zombie_faller_watch_player(player)
{
	self endon(#"falling", #"death");
	player endon(#"disconnect");
	range = 200;
	rangesqr = range * range;
	timer = 5000;
	inrange = 0;
	inrangetime = 0;
	closerange = 60;
	closerangesqr = closerange * closerange;
	dirtoplayerenter = (0, 0, 0);
	incloserange = 0;
	while(true)
	{
		distsqr = distance2dsquared(self.origin, player.origin);
		if(distsqr < rangesqr)
		{
			if(inrange)
			{
				if(inrangetime + timer < gettime())
				{
					self.zombie_faller_should_drop = 1;
					break;
				}
			}
			else
			{
				inrange = 1;
				inrangetime = gettime();
			}
		}
		else
		{
			inrange = 0;
		}
		if(distsqr < closerangesqr)
		{
			if(!incloserange)
			{
				dirtoplayerenter = player.origin - self.origin;
				dirtoplayerenter = (dirtoplayerenter[0], dirtoplayerenter[1], 0);
				dirtoplayerenter = vectornormalize(dirtoplayerenter);
			}
			incloserange = 1;
		}
		else
		{
			if(incloserange)
			{
				dirtoplayerexit = player.origin - self.origin;
				dirtoplayerexit = (dirtoplayerexit[0], dirtoplayerexit[1], 0);
				dirtoplayerexit = vectornormalize(dirtoplayerexit);
				if(vectordot(dirtoplayerenter, dirtoplayerexit) < 0)
				{
					self.zombie_faller_should_drop = 1;
					break;
				}
			}
			incloserange = 0;
		}
		wait(0.1);
	}
}

/*
	Name: zombie_fall_wait
	Namespace: zm_ai_faller
	Checksum: 0xDB457A52
	Offset: 0x10D8
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function zombie_fall_wait()
{
	self endon(#"falling", #"death");
	if(isdefined(self.zone_name))
	{
		if(isdefined(level.zones) && isdefined(level.zones[self.zone_name]))
		{
			zone = level.zones[self.zone_name];
			while(true)
			{
				if(!zone.is_enabled || !zone.is_active)
				{
					if(!self potentially_visible(2250000))
					{
						if(self.health != level.zombie_health)
						{
							self.zombie_faller_should_drop = 1;
							break;
						}
						else
						{
							self zombie_faller_delete();
							return;
						}
					}
				}
				wait(0.5);
			}
		}
	}
}

/*
	Name: zombie_fall_should_attack
	Namespace: zm_ai_faller
	Checksum: 0x2C87B9F8
	Offset: 0x11F0
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function zombie_fall_should_attack(spot)
{
	victims = zombie_fall_get_vicitims(spot);
	return victims.size > 0;
}

/*
	Name: zombie_fall_get_vicitims
	Namespace: zm_ai_faller
	Checksum: 0x4A261844
	Offset: 0x1230
	Size: 0x17E
	Parameters: 1
	Flags: Linked
*/
function zombie_fall_get_vicitims(spot)
{
	ret = [];
	players = getplayers();
	checkdist2 = 40;
	checkdist2 = checkdist2 * checkdist2;
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(player laststand::player_is_in_laststand())
		{
			continue;
		}
		stance = player getstance();
		if(stance == "crouch" || stance == "prone")
		{
			continue;
		}
		zcheck = self.origin[2] - player.origin[2];
		if(zcheck < 0 || zcheck > 120)
		{
			continue;
		}
		dist2 = distance2dsquared(player.origin, self.origin);
		if(dist2 < checkdist2)
		{
			ret[ret.size] = player;
		}
	}
	return ret;
}

/*
	Name: get_fall_anim
	Namespace: zm_ai_faller
	Checksum: 0xF10A8F02
	Offset: 0x13B8
	Size: 0x2E
	Parameters: 1
	Flags: None
*/
function get_fall_anim(spot)
{
	return level._zombie_fall_anims[self.animname][#"fall"];
}

/*
	Name: zombie_faller_enable_location
	Namespace: zm_ai_faller
	Checksum: 0x611C59F5
	Offset: 0x13F0
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function zombie_faller_enable_location()
{
	if(isdefined(self.zombie_faller_location))
	{
		self.zombie_faller_location.is_enabled = 1;
		self.zombie_faller_location = undefined;
	}
}

/*
	Name: zombie_faller_death_wait
	Namespace: zm_ai_faller
	Checksum: 0xCD9DF829
	Offset: 0x1428
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function zombie_faller_death_wait(endon_notify)
{
	self endon(#"falling");
	if(isdefined(endon_notify))
	{
		self endon(endon_notify);
	}
	self waittill(#"death");
	self zombie_faller_enable_location();
}

/*
	Name: zombie_fall_death_func
	Namespace: zm_ai_faller
	Checksum: 0x80ABA12D
	Offset: 0x1490
	Size: 0x82
	Parameters: 8
	Flags: Linked, Private
*/
function private zombie_fall_death_func(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	self animmode("noclip");
	self.deathanim = "zm_faller_emerge_death";
	return self zm_spawner::zombie_death_animscript();
}

/*
	Name: zombie_fall_death
	Namespace: zm_ai_faller
	Checksum: 0xFC8423CF
	Offset: 0x1520
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function zombie_fall_death(spot)
{
	self endon(#"fall_anim_finished");
	while(self.health > 1)
	{
		self waittill(#"damage");
	}
	self stopanimscripted();
	spot notify(#"stop_zombie_fall_fx");
}

/*
	Name: _damage_mod_to_damage_type
	Namespace: zm_ai_faller
	Checksum: 0x8EF430D0
	Offset: 0x1598
	Size: 0xAA
	Parameters: 1
	Flags: None
*/
function _damage_mod_to_damage_type(type)
{
	toks = strtok(type, "_");
	if(toks.size < 2)
	{
		return type;
	}
	returnstr = toks[1];
	for(i = 2; i < toks.size; i++)
	{
		returnstr = returnstr + toks[i];
	}
	returnstr = tolower(returnstr);
	return returnstr;
}

/*
	Name: zombie_fall_fx
	Namespace: zm_ai_faller
	Checksum: 0x7A2ACE53
	Offset: 0x1650
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function zombie_fall_fx(spot)
{
	spot thread zombie_fall_dust_fx(self);
	spot thread zombie_fall_burst_fx();
	playsoundatposition(#"zmb_zombie_spawn", spot.origin);
	self endon(#"death");
	spot endon(#"stop_zombie_fall_fx");
	wait(1);
	if(self.zombie_move_speed != "sprint")
	{
		wait(1);
	}
}

/*
	Name: zombie_fall_burst_fx
	Namespace: zm_ai_faller
	Checksum: 0x3F82E758
	Offset: 0x1708
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function zombie_fall_burst_fx()
{
	self endon(#"stop_zombie_fall_fx", #"fall_anim_finished");
	playfx(level._effect[#"rise_burst"], self.origin + (0, 0, randomintrange(5, 10)));
	wait(0.25);
	playfx(level._effect[#"rise_billow"], self.origin + (randomintrange(-10, 10), randomintrange(-10, 10), randomintrange(5, 10)));
}

/*
	Name: zombie_fall_dust_fx
	Namespace: zm_ai_faller
	Checksum: 0x17870EF0
	Offset: 0x1818
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function zombie_fall_dust_fx(zombie)
{
	dust_tag = "J_SpineUpper";
	self endon(#"stop_zombie_fall_dust_fx");
	self thread stop_zombie_fall_dust_fx(zombie);
	dust_time = 4.5;
	dust_interval = 0.3;
	t = 0;
	while(t < dust_time)
	{
		playfxontag(level._effect[#"rise_dust"], zombie, dust_tag);
		wait(dust_interval);
		t = t + dust_interval;
	}
}

/*
	Name: stop_zombie_fall_dust_fx
	Namespace: zm_ai_faller
	Checksum: 0x7950EF5D
	Offset: 0x18E0
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function stop_zombie_fall_dust_fx(zombie)
{
	zombie waittill(#"death");
	self notify(#"stop_zombie_fall_dust_fx");
}

/*
	Name: handle_fall_notetracks
	Namespace: zm_ai_faller
	Checksum: 0x8AA6828D
	Offset: 0x1920
	Size: 0xDA
	Parameters: 2
	Flags: Linked
*/
function handle_fall_notetracks(note, spot)
{
	if(note == "deathout")
	{
		self.deathfunction = &faller_death_ragdoll;
	}
	else if(note == "fire")
	{
		victims = zombie_fall_get_vicitims(spot);
		for(i = 0; i < victims.size; i++)
		{
			victims[i] dodamage(self.meleedamage, self.origin, self, self, "none", "MOD_MELEE");
			self.zombie_faller_should_drop = 1;
		}
	}
}

/*
	Name: faller_death_ragdoll
	Namespace: zm_ai_faller
	Checksum: 0x7ED68297
	Offset: 0x1A08
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function faller_death_ragdoll()
{
	self startragdoll();
	self launchragdoll((0, 0, -1));
	return self zm_spawner::zombie_death_animscript();
}

/*
	Name: in_player_fov
	Namespace: zm_ai_faller
	Checksum: 0xF4519477
	Offset: 0x1A60
	Size: 0x1B2
	Parameters: 1
	Flags: Linked
*/
function in_player_fov(player)
{
	playerangles = player getplayerangles();
	playerforwardvec = anglestoforward(playerangles);
	playerunitforwardvec = vectornormalize(playerforwardvec);
	banzaipos = self.origin;
	playerpos = player getorigin();
	playertobanzaivec = banzaipos - playerpos;
	playertobanzaiunitvec = vectornormalize(playertobanzaivec);
	forwarddotbanzai = vectordot(playerunitforwardvec, playertobanzaiunitvec);
	anglefromcenter = acos(forwarddotbanzai);
	playerfov = getdvarfloat(#"cg_fov", 0);
	banzaivsplayerfovbuffer = getdvarfloat(#"g_banzai_player_fov_buffer", 0);
	if(banzaivsplayerfovbuffer <= 0)
	{
		banzaivsplayerfovbuffer = 0.2;
	}
	inplayerfov = anglefromcenter <= (playerfov * 0.5) * (1 - banzaivsplayerfovbuffer);
	return inplayerfov;
}

/*
	Name: potentially_visible
	Namespace: zm_ai_faller
	Checksum: 0x2F470A05
	Offset: 0x1C20
	Size: 0xDE
	Parameters: 1
	Flags: Linked
*/
function potentially_visible(how_close)
{
	if(!isdefined(how_close))
	{
		how_close = 1000000;
	}
	potentiallyvisible = 0;
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		dist = distancesquared(self.origin, players[i].origin);
		if(dist < how_close)
		{
			inplayerfov = self in_player_fov(players[i]);
			if(inplayerfov)
			{
				potentiallyvisible = 1;
				break;
			}
		}
	}
	return potentiallyvisible;
}

/*
	Name: do_zombie_emerge
	Namespace: zm_ai_faller
	Checksum: 0x9DCCBBD9
	Offset: 0x1D08
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function do_zombie_emerge(spot)
{
	self endon(#"death");
	self thread setup_deathfunc(&faller_death_ragdoll);
	self.no_powerups = 1;
	self.in_the_ceiling = 1;
	anim_org = spot.origin;
	anim_ang = spot.angles;
	self thread zombie_emerge_fx(spot);
	self thread zombie_faller_death_wait("risen");
	if(isdefined(level.custom_faller_entrance_logic))
	{
		self thread [[level.custom_faller_entrance_logic]]();
	}
	self zombie_faller_emerge(spot);
	self.create_eyes = 1;
	wait(0.1);
	self notify(#"risen", {#find_flesh_struct_string:spot.script_string});
	self zombie_faller_enable_location();
}

/*
	Name: zombie_faller_emerge
	Namespace: zm_ai_faller
	Checksum: 0x9EA0B53F
	Offset: 0x1E68
	Size: 0x122
	Parameters: 1
	Flags: Linked
*/
function zombie_faller_emerge(spot)
{
	self endon(#"death");
	if(is_true(self.zombie_faller_location.emerge_bottom))
	{
		self animscripted("fall_anim", self.zombie_faller_location.origin, self.zombie_faller_location.angles, "zombie_riser_elevator_from_floor");
	}
	else
	{
		self animscripted("fall_anim", self.zombie_faller_location.origin, self.zombie_faller_location.angles, "zombie_riser_elevator_from_ceiling");
	}
	self zombie_shared::donotetracks("rise_anim");
	self.deathfunction = &zm_spawner::zombie_death_animscript;
	self.in_the_ceiling = 0;
	self.no_powerups = 0;
}

/*
	Name: zombie_emerge_fx
	Namespace: zm_ai_faller
	Checksum: 0x9F1F409C
	Offset: 0x1F98
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function zombie_emerge_fx(spot)
{
	spot thread zombie_emerge_dust_fx(self);
	playsoundatposition(#"zmb_zombie_spawn", spot.origin);
	self endon(#"death");
	spot endon(#"stop_zombie_fall_fx");
	wait(1);
}

/*
	Name: zombie_emerge_dust_fx
	Namespace: zm_ai_faller
	Checksum: 0x85265B9
	Offset: 0x2018
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function zombie_emerge_dust_fx(zombie)
{
	dust_tag = "J_SpineUpper";
	self endon(#"stop_zombie_fall_dust_fx");
	self thread stop_zombie_fall_dust_fx(zombie);
	dust_time = 3.5;
	dust_interval = 0.5;
	t = 0;
	while(t < dust_time)
	{
		playfxontag(level._effect[#"rise_dust"], zombie, dust_tag);
		wait(dust_interval);
		t = t + dust_interval;
	}
}

/*
	Name: stop_zombie_emerge_dust_fx
	Namespace: zm_ai_faller
	Checksum: 0x28C35E32
	Offset: 0x20E0
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function stop_zombie_emerge_dust_fx(zombie)
{
	zombie waittill(#"death");
	self notify(#"stop_zombie_fall_dust_fx");
}

