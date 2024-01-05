#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace player;

/*
	Name: __init__system__
	Namespace: player
	Checksum: 0xB21E671C
	Offset: 0x148
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player
	Checksum: 0x25E2524C
	Offset: 0x190
	Size: 0x1F4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "gameplay_started", 1, 1, "int");
	clientfield::register("toplayer", "gameplay_allows_deploy", 1, 1, "int");
	clientfield::register("toplayer", "player_dof_settings", 1, 2, "int");
	if(util::is_frontend_map())
	{
		return;
	}
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	setdvar(#"hash_256144ebda864b87", 1);
	if(!isdefined(getdvarint(#"hash_8351525729015ab", 0)))
	{
		setdvar(#"hash_8351525729015ab", 0);
	}
	level.var_7d3ed2bf = currentsessionmode() != 4 && (isdefined(getgametypesetting(#"hash_6e051e440a6c3b91")) ? getgametypesetting(#"hash_6e051e440a6c3b91") : 0);
	level.var_68de7e10 = 1;
	level thread function_c518cf71();
}

/*
	Name: on_player_connect
	Namespace: player
	Checksum: 0x52050817
	Offset: 0x390
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self.connect_time = gettime();
}

/*
	Name: spawn_player
	Namespace: player
	Checksum: 0xEFCBA7AF
	Offset: 0x3A8
	Size: 0x394
	Parameters: 0
	Flags: Linked
*/
function spawn_player()
{
	self endon(#"disconnect", #"joined_spectators");
	self notify(#"spawned");
	level notify(#"player_spawned");
	self notify(#"end_respawn");
	self set_spawn_variables();
	self luinotifyevent(#"player_spawned", 0);
	self function_8ba40d2f(#"player_spawned", 0);
	self setclientuivisibilityflag("killcam_nemesis", 0);
	self.sessionteam = self.team;
	function_73646bd9(self);
	self.sessionstate = "playing";
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.spectatekillcam = 0;
	self.statusicon = "";
	self.damagedplayers = [];
	self.friendlydamage = undefined;
	self.hasspawned = 1;
	self.lastspawntime = gettime();
	self.spawntime = gettime();
	self.afk = 0;
	self.laststunnedby = undefined;
	self.var_a010bd8f = undefined;
	self.var_9060b065 = undefined;
	self.lastflashedby = undefined;
	self.var_a7679005 = undefined;
	self.var_7ef2427c = undefined;
	self.var_e021fe43 = undefined;
	self.var_f866f320 = undefined;
	self.laststand = undefined;
	self.resurrect_not_allowed_by = undefined;
	self.revivingteammate = 0;
	self.burning = undefined;
	self.lastshotby = 127;
	self.maxhealth = self.spawnhealth;
	self.health = self.maxhealth;
	self function_9080887a();
	self.var_4a755632 = undefined;
	self.var_e03e3ae5 = undefined;
	if(self.pers[#"lives"] && !is_true(level.takelivesondeath))
	{
		self.pers[#"lives"]--;
	}
	if(isdefined(game.lives) && is_true(game.lives[self.team]) && !is_true(level.takelivesondeath))
	{
		game.lives[self.team]--;
		if(level.basegametype == "control")
		{
			self callback::callback(#"hash_7de173a0523c27c9", self);
		}
	}
	self.disabledweapon = 0;
	self util::resetusability();
	self reset_attacker_list();
	self resetfov();
}

/*
	Name: on_player_spawned
	Namespace: player
	Checksum: 0x61EFCD22
	Offset: 0x748
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(util::is_frontend_map())
	{
		return;
	}
	self function_619a5c20();
	level.var_2386648b = 0;
	if(sessionmodeiszombiesgame() || sessionmodeiscampaigngame())
	{
		snappedorigin = self get_snapped_spot_origin(self.origin);
		if(!self flag::get(#"shared_igc"))
		{
			self setorigin(snappedorigin);
		}
	}
}

/*
	Name: function_135acc2d
	Namespace: player
	Checksum: 0x4EDB6DB8
	Offset: 0x818
	Size: 0x2E6
	Parameters: 2
	Flags: Linked
*/
function function_135acc2d(var_e2bc3a9f, update_rate)
{
	var_d13c9b78 = getdvarint(#"com_maxclients", 0);
	wait_time = max(float(function_60d95f53()) / 1000, update_rate / var_d13c9b78);
	var_3c59cda4 = int(ceil(wait_time / (1 / var_d13c9b78)));
	var_bf4d050f = var_d13c9b78;
	while(level.var_68de7e10)
	{
		var_2a20944d = 0;
		var_7ac865f7 = var_d13c9b78;
		var_42016ec7 = var_bf4d050f + 1;
		if(var_42016ec7 >= var_d13c9b78)
		{
			var_42016ec7 = 0;
		}
		players = getplayers();
		if(players.size == 0)
		{
			waitframe(1);
			continue;
		}
		var_92c4d936 = 0;
		foreach(player in players)
		{
			player = players[index];
			player_num = player getentitynumber();
			if(player_num >= var_42016ec7)
			{
				break;
			}
			var_92c4d936++;
		}
		var_92c4d936 = var_92c4d936 % players.size;
		for(player_index = 0; player_index < players.size; player_index++)
		{
			var_1896e17 = (player_index + var_92c4d936) % players.size;
			/#
				assert(var_1896e17 < players.size);
			#/
			player = players[var_1896e17];
			if(player.sessionstate != "playing")
			{
				continue;
			}
			player [[var_e2bc3a9f]]();
			var_2a20944d++;
			var_bf4d050f = player getentitynumber();
			if(var_3c59cda4 <= var_2a20944d)
			{
				break;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_c518cf71
	Namespace: player
	Checksum: 0xFCB42902
	Offset: 0xB08
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_c518cf71()
{
	update_rate = 0.1;
	if(sessionmodeiszombiesgame() || sessionmodeiscampaigngame())
	{
		update_rate = 0.1;
	}
	if(sessionmodeiswarzonegame())
	{
		return;
	}
	function_135acc2d(&function_8fef418b, update_rate);
}

/*
	Name: function_8fef418b
	Namespace: player
	Checksum: 0x9D367F1
	Offset: 0xBD0
	Size: 0x456
	Parameters: 0
	Flags: Linked
*/
function function_8fef418b()
{
	if(!isdefined(self.last_valid_position))
	{
		self.last_valid_position = getclosestpointonnavmesh(self.origin, 2048, 0);
	}
	if(!isdefined(self.last_valid_position))
	{
		return;
	}
	if(isdefined(level.var_cdc822b) && ![[level.var_cdc822b]]())
	{
		return;
	}
	playerradius = self getpathfindingradius();
	if(ispointonnavmesh(self.last_valid_position) && distance2dsquared(self.origin, self.last_valid_position) < sqr(playerradius) && (sqr(self.origin[2] - self.last_valid_position[2])) < sqr(16))
	{
		return;
	}
	if(self isplayerswimming())
	{
		if(isdefined(self.var_5d991645))
		{
			if(distancesquared(self.origin, self.var_5d991645) < sqr(playerradius))
			{
				return;
			}
		}
		ground_pos = groundtrace(self.origin + vectorscale((0, 0, 1), 8), self.origin + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
		if(!isdefined(ground_pos))
		{
			return;
		}
		position = getclosestpointonnavmesh(ground_pos, 100, playerradius);
		if(isdefined(position))
		{
			self.last_valid_position = position;
			self.var_5d991645 = self.origin;
		}
	}
	else
	{
		if(ispointonnavmesh(self.origin, self))
		{
			self.last_valid_position = self.origin;
		}
		else
		{
			if(!ispointonnavmesh(self.origin, self) && ispointonnavmesh(self.last_valid_position, self) && distance2dsquared(self.origin, self.last_valid_position) < sqr(32) && (sqr(self.origin[2] - self.last_valid_position[2])) < sqr(32))
			{
				return;
			}
			position = getclosestpointonnavmesh(self.origin, 100, playerradius);
			if(isdefined(position))
			{
				if(is_true(level.var_2386648b))
				{
					player_position = self.origin + vectorscale((0, 0, 1), 20);
					var_f5df51f2 = position + vectorscale((0, 0, 1), 20);
					ignore_ent = undefined;
					if(self isinvehicle())
					{
						ignore_ent = self getvehicleoccupied();
					}
					if(bullettracepassed(player_position, var_f5df51f2, 0, self, ignore_ent))
					{
						self.last_valid_position = position;
					}
				}
				else
				{
					self.last_valid_position = position;
				}
			}
			else if(isdefined(level.var_a6a84389))
			{
				self.last_valid_position = self [[level.var_a6a84389]](playerradius);
			}
		}
	}
}

/*
	Name: take_weapons
	Namespace: player
	Checksum: 0xB007CB91
	Offset: 0x1030
	Size: 0x28C
	Parameters: 0
	Flags: Linked
*/
function take_weapons()
{
	if(!is_true(self.gun_removed))
	{
		self.gun_removed = 1;
		self._weapons = [];
		if(!isdefined(self._current_weapon))
		{
			self._current_weapon = level.weaponnone;
		}
		w_current = self getcurrentweapon();
		if(w_current != level.weaponnone)
		{
			self._current_weapon = w_current;
		}
		a_weapon_list = self getweaponslist();
		if(self._current_weapon == level.weaponnone)
		{
			if(isdefined(a_weapon_list[0]))
			{
				self._current_weapon = a_weapon_list[0];
			}
		}
		foreach(weapon in a_weapon_list)
		{
			if(is_true(weapon.dniweapon))
			{
				continue;
			}
			if(!isdefined(self._weapons))
			{
				self._weapons = [];
			}
			else if(!isarray(self._weapons))
			{
				self._weapons = array(self._weapons);
			}
			self._weapons[self._weapons.size] = get_weapondata(weapon);
		}
		foreach(weapon in a_weapon_list)
		{
			self takeweapon(weapon);
		}
		if(isdefined(level.detach_all_weapons))
		{
			self [[level.detach_all_weapons]]();
		}
	}
}

/*
	Name: generate_weapon_data
	Namespace: player
	Checksum: 0x57EB846C
	Offset: 0x12C8
	Size: 0x21C
	Parameters: 0
	Flags: Linked
*/
function generate_weapon_data()
{
	self._generated_weapons = [];
	if(!isdefined(self._generated_current_weapon))
	{
		self._generated_current_weapon = level.weaponnone;
	}
	if(is_true(self.gun_removed) && isdefined(self._weapons))
	{
		self._generated_weapons = arraycopy(self._weapons);
		self._generated_current_weapon = self._current_weapon;
	}
	else
	{
		w_current = self getcurrentweapon();
		if(w_current != level.weaponnone)
		{
			self._generated_current_weapon = w_current;
		}
		a_weapon_list = self getweaponslist();
		if(self._generated_current_weapon == level.weaponnone)
		{
			if(isdefined(a_weapon_list[0]))
			{
				self._generated_current_weapon = a_weapon_list[0];
			}
		}
		foreach(weapon in a_weapon_list)
		{
			if(is_true(weapon.dniweapon))
			{
				continue;
			}
			if(!isdefined(self._generated_weapons))
			{
				self._generated_weapons = [];
			}
			else if(!isarray(self._generated_weapons))
			{
				self._generated_weapons = array(self._generated_weapons);
			}
			self._generated_weapons[self._generated_weapons.size] = get_weapondata(weapon);
		}
	}
}

/*
	Name: give_back_weapons
	Namespace: player
	Checksum: 0xEAB417CE
	Offset: 0x14F0
	Size: 0x17E
	Parameters: 1
	Flags: Linked
*/
function give_back_weapons(b_immediate)
{
	if(!isdefined(b_immediate))
	{
		b_immediate = 0;
	}
	if(isdefined(self._weapons))
	{
		foreach(weapondata in self._weapons)
		{
			weapondata_give(weapondata);
		}
		if(isdefined(self._current_weapon) && self._current_weapon != level.weaponnone)
		{
			if(b_immediate)
			{
				self switchtoweaponimmediate(self._current_weapon);
			}
			else
			{
				self switchtoweapon(self._current_weapon);
			}
		}
		else
		{
			weapon = self loadout::function_18a77b37("primary");
			if(isdefined(weapon) && self hasweapon(weapon))
			{
				switch_to_primary_weapon(b_immediate);
			}
		}
	}
	self._weapons = undefined;
	self.gun_removed = undefined;
}

/*
	Name: get_weapondata
	Namespace: player
	Checksum: 0xA3B87C6
	Offset: 0x1678
	Size: 0x394
	Parameters: 1
	Flags: Linked
*/
function get_weapondata(weapon)
{
	if(isdefined(level.var_51443ce5))
	{
		return self [[level.var_51443ce5]](weapon);
	}
	weapondata = [];
	if(!isdefined(weapon))
	{
		weapon = self getcurrentweapon();
	}
	weapondata[#"weapon"] = weapon.rootweapon.name;
	weapondata[#"attachments"] = util::function_2146bd83(weapon);
	if(weapon != level.weaponnone)
	{
		weapondata[#"clip"] = self getweaponammoclip(weapon);
		weapondata[#"stock"] = self getweaponammostock(weapon);
		weapondata[#"fuel"] = self getweaponammofuel(weapon);
		weapondata[#"heat"] = self isweaponoverheating(1, weapon);
		weapondata[#"overheat"] = self isweaponoverheating(0, weapon);
		weapondata[#"hash_23866d36042bcd19"] = self function_ade49959(weapon);
		weapondata[#"hash_305a93e7a368c654"] = self function_8cbd254d(weapon);
		if(weapon.isriotshield)
		{
			weapondata[#"health"] = self.weaponhealth;
		}
	}
	else
	{
		weapondata[#"clip"] = 0;
		weapondata[#"stock"] = 0;
		weapondata[#"fuel"] = 0;
		weapondata[#"heat"] = 0;
		weapondata[#"overheat"] = 0;
	}
	if(weapon.dualwieldweapon != level.weaponnone)
	{
		weapondata[#"lh_clip"] = self getweaponammoclip(weapon.dualwieldweapon);
	}
	else
	{
		weapondata[#"lh_clip"] = 0;
	}
	if(weapon.altweapon != level.weaponnone)
	{
		weapondata[#"alt_clip"] = self getweaponammoclip(weapon.altweapon);
		weapondata[#"alt_stock"] = self getweaponammostock(weapon.altweapon);
	}
	else
	{
		weapondata[#"alt_clip"] = 0;
		weapondata[#"alt_stock"] = 0;
	}
	return weapondata;
}

/*
	Name: weapondata_give
	Namespace: player
	Checksum: 0x3E9D6ED0
	Offset: 0x1A18
	Size: 0x2BC
	Parameters: 1
	Flags: Linked
*/
function weapondata_give(weapondata)
{
	if(isdefined(level.var_bfbdc0cd))
	{
		self [[level.var_bfbdc0cd]](weapondata);
		return;
	}
	weapon = util::get_weapon_by_name(weapondata[#"weapon"], weapondata[#"attachments"]);
	self giveweapon(weapon, weapondata[#"hash_23866d36042bcd19"], weapondata[#"hash_305a93e7a368c654"]);
	if(weapon != level.weaponnone)
	{
		self setweaponammoclip(weapon, weapondata[#"clip"]);
		self setweaponammostock(weapon, weapondata[#"stock"]);
		if(isdefined(weapondata[#"fuel"]))
		{
			self setweaponammofuel(weapon, weapondata[#"fuel"]);
		}
		if(isdefined(weapondata[#"heat"]) && isdefined(weapondata[#"overheat"]))
		{
			self setweaponoverheating(weapondata[#"overheat"], weapondata[#"heat"], weapon);
		}
		if(weapon.isriotshield && isdefined(weapondata[#"health"]))
		{
			self.weaponhealth = weapondata[#"health"];
		}
	}
	if(weapon.dualwieldweapon != level.weaponnone)
	{
		self setweaponammoclip(weapon.dualwieldweapon, weapondata[#"lh_clip"]);
	}
	if(weapon.altweapon != level.weaponnone)
	{
		self setweaponammoclip(weapon.altweapon, weapondata[#"alt_clip"]);
		self setweaponammostock(weapon.altweapon, weapondata[#"alt_stock"]);
	}
}

/*
	Name: switch_to_primary_weapon
	Namespace: player
	Checksum: 0x49A1CF5D
	Offset: 0x1CE0
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function switch_to_primary_weapon(b_immediate, b_force_switch)
{
	if(!isdefined(b_immediate))
	{
		b_immediate = 0;
	}
	if(!isdefined(b_force_switch))
	{
		b_force_switch = 0;
	}
	weapon = self loadout::function_18a77b37("primary");
	if(is_valid_weapon(weapon))
	{
		if(b_immediate)
		{
			self switchtoweaponimmediate(weapon, b_force_switch);
		}
		else
		{
			self switchtoweapon(weapon, b_force_switch);
		}
	}
}

/*
	Name: function_1bff13a1
	Namespace: player
	Checksum: 0xBD97F967
	Offset: 0x1DA0
	Size: 0xB4
	Parameters: 2
	Flags: None
*/
function function_1bff13a1(b_immediate, b_force_switch)
{
	if(!isdefined(b_immediate))
	{
		b_immediate = 0;
	}
	if(!isdefined(b_force_switch))
	{
		b_force_switch = 0;
	}
	weapon = self loadout::function_18a77b37("secondary");
	if(is_valid_weapon(weapon))
	{
		if(b_immediate)
		{
			self switchtoweaponimmediate(weapon, b_force_switch);
		}
		else
		{
			self switchtoweapon(weapon, b_force_switch);
		}
	}
}

/*
	Name: fill_current_clip
	Namespace: player
	Checksum: 0x5ADEFB69
	Offset: 0x1E60
	Size: 0x19C
	Parameters: 1
	Flags: Linked
*/
function fill_current_clip(var_aa12242d)
{
	if(!isdefined(var_aa12242d))
	{
		var_aa12242d = 0;
	}
	w_current = self getcurrentweapon();
	if(w_current.isheavyweapon)
	{
		w_current = self loadout::function_18a77b37("primary");
	}
	if(isdefined(w_current) && self hasweapon(w_current))
	{
		if(var_aa12242d)
		{
			var_61b58f30 = self getweaponammoclip(w_current);
			var_45193587 = self getweaponammostock(w_current);
			var_c22fa6b8 = w_current.clipsize - var_61b58f30;
			var_f2084708 = int(min(var_c22fa6b8, var_45193587));
			if(var_c22fa6b8 > 0 && var_f2084708 > 0)
			{
				self setweaponammoclip(w_current, var_61b58f30 + var_c22fa6b8);
				self setweaponammostock(w_current, var_45193587 - var_f2084708);
			}
		}
		else
		{
			self setweaponammoclip(w_current, w_current.clipsize);
		}
	}
}

/*
	Name: is_valid_weapon
	Namespace: player
	Checksum: 0x39DEC9B2
	Offset: 0x2008
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function is_valid_weapon(weaponobject)
{
	return isdefined(weaponobject) && weaponobject != level.weaponnone;
}

/*
	Name: is_spawn_protected
	Namespace: player
	Checksum: 0xEFDF9E3C
	Offset: 0x2038
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function is_spawn_protected()
{
	if(!isdefined(self))
	{
		return 0;
	}
	if(!isdefined(self.spawntime))
	{
		self.spawntime = 0;
	}
	return (gettime() - (isdefined(self.spawntime) ? self.spawntime : 0)) <= (int(level.spawnsystem.var_d9984264 * 1000));
}

/*
	Name: simple_respawn
	Namespace: player
	Checksum: 0x13C87A93
	Offset: 0x20B8
	Size: 0x18
	Parameters: 0
	Flags: None
*/
function simple_respawn()
{
	self [[level.onspawnplayer]](0);
}

/*
	Name: get_snapped_spot_origin
	Namespace: player
	Checksum: 0xEF5AB270
	Offset: 0x20D8
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function get_snapped_spot_origin(spot_position)
{
	snap_max_height = 100;
	size = 15;
	height = size * 2;
	mins = (-1 * size, -1 * size, 0);
	maxs = (size, size, height);
	spot_position = (spot_position[0], spot_position[1], spot_position[2] + 5);
	new_spot_position = (spot_position[0], spot_position[1], spot_position[2] - snap_max_height);
	trace = physicstrace(spot_position, new_spot_position, mins, maxs, self);
	if(trace[#"fraction"] < 1)
	{
		return trace[#"position"];
	}
	return spot_position;
}

/*
	Name: allow_stance_change
	Namespace: player
	Checksum: 0x800370C1
	Offset: 0x2200
	Size: 0x1B2
	Parameters: 1
	Flags: None
*/
function allow_stance_change(b_allow)
{
	if(!isdefined(b_allow))
	{
		b_allow = 1;
	}
	if(b_allow)
	{
		self allowprone(1);
		self allowcrouch(1);
		self allowstand(1);
	}
	else
	{
		str_stance = self getstance();
		switch(str_stance)
		{
			case "prone":
			{
				self allowprone(1);
				self allowcrouch(0);
				self allowstand(0);
				break;
			}
			case "crouch":
			{
				self allowprone(0);
				self allowcrouch(1);
				self allowstand(0);
				break;
			}
			case "stand":
			{
				self allowprone(0);
				self allowcrouch(0);
				self allowstand(1);
				break;
			}
		}
	}
}

/*
	Name: set_spawn_variables
	Namespace: player
	Checksum: 0x342F798A
	Offset: 0x23C0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function set_spawn_variables()
{
	self stopshellshock();
	self stoprumble("damage_heavy");
}

/*
	Name: reset_attacker_list
	Namespace: player
	Checksum: 0xA395701D
	Offset: 0x2408
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function reset_attacker_list()
{
	self.attackers = [];
	self.attackerdata = [];
	self.attackerdamage = [];
	self.var_6ef09a14 = [];
	self.firsttimedamaged = 0;
}

/*
	Name: function_9080887a
	Namespace: player
	Checksum: 0xFE499B7B
	Offset: 0x2450
	Size: 0x126
	Parameters: 1
	Flags: Linked
*/
function function_9080887a(var_cf05ebb7)
{
	if(!isdefined(self.var_894f7879))
	{
		self.var_894f7879 = [];
	}
	var_f7d37aa4 = 0;
	foreach(modifier in self.var_894f7879)
	{
		var_f7d37aa4 = var_f7d37aa4 + modifier;
	}
	var_9fc0715e = (isdefined(var_cf05ebb7) ? var_cf05ebb7 : self.spawnhealth);
	self.var_66cb03ad = int((var_9fc0715e + var_f7d37aa4) + (isdefined(level.var_90bb9821) ? level.var_90bb9821 : 0));
	if(self.var_66cb03ad < 1)
	{
		self.var_66cb03ad = 1;
	}
}

/*
	Name: function_d1768e8e
	Namespace: player
	Checksum: 0x438FBF0E
	Offset: 0x2580
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_d1768e8e()
{
	self notify(#"fully_healed");
	callback::callback(#"fully_healed");
}

/*
	Name: function_c6fe9951
	Namespace: player
	Checksum: 0x74DAC4C1
	Offset: 0x25C0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_c6fe9951()
{
	self notify(#"done_healing");
	callback::callback(#"done_healing");
}

/*
	Name: function_2a67df65
	Namespace: player
	Checksum: 0xAAA147E4
	Offset: 0x2600
	Size: 0xEC
	Parameters: 4
	Flags: Linked
*/
function function_2a67df65(modname, value, var_96a9fbf4, var_b861a047)
{
	if(!isdefined(self.var_894f7879))
	{
		self.var_894f7879 = [];
	}
	self function_74598aba(var_96a9fbf4);
	can_modify = 1;
	if(level.wound_disabled === 1 && value < 0)
	{
		can_modify = 0;
	}
	if(can_modify)
	{
		self.var_894f7879[modname] = value;
	}
	self function_9080887a();
	if(!is_true(var_b861a047))
	{
		self function_b2b139e6();
	}
}

/*
	Name: function_b2b139e6
	Namespace: player
	Checksum: 0x5A45DB61
	Offset: 0x26F8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_b2b139e6()
{
	if(isdefined(self.var_abe2db87))
	{
		return;
	}
	if(self.health > self.var_66cb03ad)
	{
		self.health = self.var_66cb03ad;
		self function_d1768e8e();
	}
}

/*
	Name: function_b933de24
	Namespace: player
	Checksum: 0xCAE01E42
	Offset: 0x2750
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_b933de24(modname, var_b861a047)
{
	if(isdefined(self))
	{
		if(!isdefined(self.var_894f7879))
		{
			self.var_894f7879 = [];
		}
		var_d87cedce = self.var_66cb03ad;
		self.var_894f7879[modname] = undefined;
		self function_9080887a();
		if(!is_true(var_b861a047))
		{
			self function_b2b139e6();
		}
	}
}

/*
	Name: function_74598aba
	Namespace: player
	Checksum: 0xD4BEEA27
	Offset: 0x27F8
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_74598aba(var_96a9fbf4)
{
	if(!isdefined(var_96a9fbf4))
	{
		return;
	}
	foreach(modifier in var_96a9fbf4)
	{
		if(!isdefined(modifier))
		{
			continue;
		}
		self function_b933de24(modifier.name, modifier.var_b861a047);
	}
}

/*
	Name: function_466d8a4b
	Namespace: player
	Checksum: 0xE751A9BD
	Offset: 0x28B8
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function function_466d8a4b(var_b66879ad, team)
{
	params = {#hash_b66879ad:var_b66879ad, #team:team};
	self notify(#"joined_team", params);
	level notify(#"joined_team");
	self callback::callback(#"joined_team", params);
}

/*
	Name: function_6f6c29e
	Namespace: player
	Checksum: 0x97D26C5E
	Offset: 0x2958
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_6f6c29e(var_b66879ad)
{
	params = {#hash_b66879ad:var_b66879ad, #team:#"spectator"};
	self notify(#"joined_spectator", params);
	level notify(#"joined_spectator");
	self callback::callback(#"on_joined_spectator", params);
}

/*
	Name: function_2f80d95b
	Namespace: player
	Checksum: 0x2DA0FA58
	Offset: 0x2A00
	Size: 0xB0
	Parameters: 2
	Flags: Linked, Variadic
*/
function function_2f80d95b(player_func, ...)
{
	players = getplayers();
	foreach(player in players)
	{
		util::single_func_argarray(player, player_func, vararg);
	}
}

/*
	Name: function_4dcd9a89
	Namespace: player
	Checksum: 0xCD910F54
	Offset: 0x2AB8
	Size: 0xA0
	Parameters: 3
	Flags: Linked, Variadic
*/
function function_4dcd9a89(players, player_func, ...)
{
	foreach(player in players)
	{
		util::single_func_argarray(player, player_func, vararg);
	}
}

/*
	Name: function_7629df88
	Namespace: player
	Checksum: 0xFDFA917E
	Offset: 0x2B60
	Size: 0xD0
	Parameters: 3
	Flags: Variadic
*/
function function_7629df88(team, player_func, ...)
{
	players = getplayers();
	foreach(player in players)
	{
		if(player.team == team)
		{
			util::single_func_argarray(player, player_func, vararg);
		}
	}
}

/*
	Name: function_e7f18b20
	Namespace: player
	Checksum: 0xDB417B39
	Offset: 0x2C38
	Size: 0xD0
	Parameters: 2
	Flags: Linked, Variadic
*/
function function_e7f18b20(player_func, ...)
{
	players = getplayers();
	foreach(player in players)
	{
		if(!isdefined(player.pers[#"team"]))
		{
			continue;
		}
		util::single_func_argarray(player, player_func, vararg);
	}
}

/*
	Name: function_38de2d5a
	Namespace: player
	Checksum: 0x7E3B9764
	Offset: 0x2D10
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_38de2d5a(notification)
{
	players = getplayers();
	foreach(player in players)
	{
		player notify(notification);
	}
}

/*
	Name: init_heal
	Namespace: player
	Checksum: 0xF49F9E5
	Offset: 0x2DB8
	Size: 0xC6
	Parameters: 2
	Flags: Linked
*/
function init_heal(var_cd7b9255, var_e9c4ebeb)
{
	var_84d04e6 = {#hash_a1cac2f1:0, #hash_b8c7d886:0, #hash_c8777194:var_e9c4ebeb, #hash_bc840360:0, #rate:0, #enabled:var_cd7b9255};
	if(!isdefined(self.heal))
	{
		self.heal = var_84d04e6;
	}
	if(!isdefined(self.var_66cb03ad))
	{
		self.var_66cb03ad = self.maxhealth;
	}
}

/*
	Name: figure_out_attacker
	Namespace: player
	Checksum: 0xB511CE7E
	Offset: 0x2E88
	Size: 0x1BA
	Parameters: 1
	Flags: Linked
*/
function figure_out_attacker(eattacker)
{
	if(isdefined(eattacker) && !isplayer(eattacker))
	{
		team = self.team;
		if(isdefined(eattacker.script_owner))
		{
			if(util::function_fbce7263(eattacker.script_owner.team, team))
			{
				eattacker = eattacker.script_owner;
			}
		}
		if(isdefined(eattacker.owner))
		{
			eattacker = eattacker.owner;
		}
		if(is_true(eattacker.var_97f1b32a) && isdefined(level.var_6ed50229))
		{
			/#
				assert(isvehicle(eattacker));
			#/
			if(isvehicle(eattacker) && isdefined(eattacker.var_735382e) && isdefined(eattacker.var_a816f2cd))
			{
				driver = eattacker getseatoccupant(0);
				if(!isdefined(driver))
				{
					currenttime = gettime();
					if((currenttime - eattacker.var_a816f2cd) <= (int(level.var_6ed50229 * 1000)))
					{
						eattacker = eattacker.var_735382e;
					}
				}
			}
		}
	}
	return eattacker;
}

/*
	Name: function_4ca4d8c6
	Namespace: player
	Checksum: 0x4BEF3F35
	Offset: 0x3050
	Size: 0x58
	Parameters: 2
	Flags: None
*/
function function_4ca4d8c6(string, value)
{
	/#
		assert(isdefined(string), "");
	#/
	if(isdefined(self) && isdefined(self.pers))
	{
		self.pers[string] = value;
	}
}

/*
	Name: function_2abc116
	Namespace: player
	Checksum: 0xD034F29
	Offset: 0x30B0
	Size: 0x76
	Parameters: 2
	Flags: Linked
*/
function function_2abc116(string, defaultval)
{
	/#
		assert(isdefined(string), "");
	#/
	if(isdefined(self) && isdefined(self.pers) && isdefined(self.pers[string]))
	{
		return self.pers[string];
	}
	return defaultval;
}

/*
	Name: function_3d288f14
	Namespace: player
	Checksum: 0xDBF56D03
	Offset: 0x3130
	Size: 0x11A
	Parameters: 0
	Flags: Linked
*/
function function_3d288f14()
{
	/#
		if(isbot(self))
		{
			if(isdefined(self.var_30e2c3ec))
			{
				return self.var_30e2c3ec;
			}
			rand = randomintrange(0, 3);
			switch(rand)
			{
				case 0:
				{
					self.var_30e2c3ec = #"none";
					break;
				}
				case 1:
				{
					self.var_30e2c3ec = #"game";
					break;
				}
				case 2:
				{
					self.var_30e2c3ec = #"system";
					break;
				}
			}
			return self.var_30e2c3ec;
		}
	#/
	status = self voipstatus();
	return status;
}

/*
	Name: function_d36b6597
	Namespace: player
	Checksum: 0xF03D42E5
	Offset: 0x3258
	Size: 0xF8
	Parameters: 0
	Flags: Linked
*/
function function_d36b6597()
{
	var_d13c9b78 = getdvarint(#"com_maxclients", 0);
	/#
		assert(var_d13c9b78 != 0);
	#/
	if(!isdefined(level.maxteamplayers))
	{
		level.maxteamplayers = 0;
	}
	if(!isdefined(level.teamcount))
	{
		level.teamcount = 0;
	}
	var_27e8a04e = var_d13c9b78;
	if(level.teamcount == 0 || var_d13c9b78 == level.teamcount && level.maxteamplayers > 0)
	{
		var_27e8a04e = level.maxteamplayers;
	}
	else if(level.teamcount > 0)
	{
		var_27e8a04e = var_d13c9b78;
	}
	return var_27e8a04e;
}

/*
	Name: function_c70c4c93
	Namespace: player
	Checksum: 0xF8FDE81D
	Offset: 0x3358
	Size: 0x96
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c70c4c93(party)
{
	max_players = function_d36b6597();
	/#
		assert(max_players == 0 || party.var_a15e4438 <= max_players);
	#/
	if(isdefined(level.var_7d3ed2bf) && level.var_7d3ed2bf && !party.fill)
	{
		return max_players;
	}
	return party.var_a15e4438;
}

/*
	Name: function_1cec6cba
	Namespace: player
	Checksum: 0xA7CE453F
	Offset: 0x33F8
	Size: 0x1A8
	Parameters: 1
	Flags: Linked
*/
function function_1cec6cba(players)
{
	var_ab9e77bf = [];
	/#
		var_f8896168 = getdvarint(#"hash_4cbf229ab691d987", 0);
	#/
	foreach(player in players)
	{
		party = player getparty();
		var_ab9e77bf[party.party_id] = function_c70c4c93(party);
		/#
			if(var_f8896168)
			{
				var_ab9e77bf[party.party_id] = party.var_a15e4438;
			}
		#/
	}
	var_6195506c = 0;
	foreach(count in var_ab9e77bf)
	{
		var_6195506c = var_6195506c + count;
	}
	return var_6195506c;
}

/*
	Name: function_114b77dd
	Namespace: player
	Checksum: 0xFD04F7D
	Offset: 0x35A8
	Size: 0x9E
	Parameters: 2
	Flags: Linked
*/
function function_114b77dd(time, timeout)
{
	if(self isstreamerready(-1, 1))
	{
		return true;
	}
	if(!isdefined(timeout))
	{
		timeout = getdvarint(#"hash_6974ec4bbf3b9e97");
	}
	if(!isdefined(time))
	{
		time = gettime();
	}
	if(isdefined(self.connect_time) && (self.connect_time + timeout) < gettime())
	{
		return true;
	}
	return false;
}

/*
	Name: function_51b57f72
	Namespace: player
	Checksum: 0xBA286CCD
	Offset: 0x3650
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_51b57f72()
{
	return getdvarint(#"hash_6974ec4bbf3b9e97");
}

/*
	Name: function_80e763a4
	Namespace: player
	Checksum: 0xE2341418
	Offset: 0x3680
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_80e763a4()
{
	level flag::set(#"hash_2210f8d75db6eda7");
}

/*
	Name: function_171bf4c0
	Namespace: player
	Checksum: 0x89CFE505
	Offset: 0x36B0
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_171bf4c0()
{
	return level flag::get(#"hash_2210f8d75db6eda7");
}

