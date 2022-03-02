#using script_47fb62300ac0bd60;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace hostmigration;

/*
	Name: function_89f2df9
	Namespace: hostmigration
	Checksum: 0xCDD297E0
	Offset: 0x1F0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hostmigration", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: hostmigration
	Checksum: 0x2AFE87EB
	Offset: 0x238
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connect(&on_connect);
}

/*
	Name: on_connect
	Namespace: hostmigration
	Checksum: 0x171CB086
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private on_connect()
{
	callback::function_d8abfc3d(#"hash_137b937fd26992be", &function_6fa41b21);
}

/*
	Name: function_6fa41b21
	Namespace: hostmigration
	Checksum: 0x7712AF73
	Offset: 0x2A8
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6fa41b21()
{
	if(isdefined(self.inventory.items))
	{
		for(i = 0; i < self.inventory.items.size; i++)
		{
			item = self.inventory.items[i];
			if(item.var_bd027dd9 !== 32767)
			{
				self function_b00db06(4, item.id, item.count, i + 1);
			}
		}
	}
}

/*
	Name: updatetimerpausedness
	Namespace: hostmigration
	Checksum: 0xBC9448D9
	Offset: 0x360
	Size: 0xA0
	Parameters: 0
	Flags: None
*/
function updatetimerpausedness()
{
	shouldbestopped = isdefined(level.hostmigrationtimer);
	if(!level.timerstopped && shouldbestopped)
	{
		level.timerstopped = 1;
		level.timerpausetime = gettime();
	}
	else if(level.timerstopped && !shouldbestopped)
	{
		level.timerstopped = 0;
		level.discardtime = level.discardtime + (gettime() - level.timerpausetime);
	}
}

/*
	Name: callback_hostmigrationsave
	Namespace: hostmigration
	Checksum: 0x80F724D1
	Offset: 0x408
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function callback_hostmigrationsave()
{
}

/*
	Name: callback_prehostmigrationsave
	Namespace: hostmigration
	Checksum: 0x77B10FF
	Offset: 0x418
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function callback_prehostmigrationsave()
{
	zm_utility::undo_link_changes();
	if(is_true(level._hm_should_pause_spawning))
	{
		level flag::set("spawn_zombies");
	}
	for(i = 0; i < level.players.size; i++)
	{
		level.players[i] val::set(#"host_migration", "takedamage", 0);
		level.players[i] stats::set_stat(#"afteractionreportstats", #"lobbypopup", #"summary");
		clientnum = level.players[i] getentitynumber();
		level.players[i] stats::set_stat(#"afteractionreportstats", #"clientnum", clientnum);
	}
}

/*
	Name: pausetimer
	Namespace: hostmigration
	Checksum: 0xA92FB709
	Offset: 0x590
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function pausetimer()
{
	level.migrationtimerpausetime = gettime();
}

/*
	Name: resumetimer
	Namespace: hostmigration
	Checksum: 0x2574C661
	Offset: 0x5A8
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function resumetimer()
{
	level.discardtime = level.discardtime + (gettime() - level.migrationtimerpausetime);
}

/*
	Name: locktimer
	Namespace: hostmigration
	Checksum: 0x4FDAB18B
	Offset: 0x5D8
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function locktimer()
{
	level endon(#"host_migration_begin", #"host_migration_end");
	for(;;)
	{
		currtime = gettime();
		waitframe(1);
		if(!level.timerstopped && isdefined(level.discardtime))
		{
			level.discardtime = level.discardtime + (gettime() - currtime);
		}
	}
}

/*
	Name: callback_hostmigration
	Namespace: hostmigration
	Checksum: 0xE460BB24
	Offset: 0x660
	Size: 0x930
	Parameters: 0
	Flags: Linked
*/
function callback_hostmigration()
{
	zm_utility::redo_link_changes();
	setslowmotion(1, 1, 0);
	level.hostmigrationreturnedplayercount = 0;
	if(level.gameended)
	{
		/#
			println(("" + gettime()) + "");
		#/
		return;
	}
	sethostmigrationstatus(1);
	callback::function_daed27e8(#"hash_4d2043b190b84792");
	level notify(#"host_migration_begin");
	for(i = 0; i < level.players.size; i++)
	{
		if(isdefined(level.hostmigration_link_entity_callback))
		{
			if(!isdefined(level.players[i]._host_migration_link_entity))
			{
				level.players[i]._host_migration_link_entity = level.players[i] [[level.hostmigration_link_entity_callback]]();
			}
		}
		level.players[i] thread hostmigrationtimerthink();
	}
	if(isdefined(level.hostmigration_ai_link_entity_callback))
	{
		zombies = getaiteamarray(level.zombie_team);
		if(isdefined(zombies) && zombies.size > 0)
		{
			foreach(zombie in zombies)
			{
				if(!isdefined(zombie._host_migration_link_entity))
				{
					zombie._host_migration_link_entity = zombie [[level.hostmigration_ai_link_entity_callback]]();
				}
			}
		}
	}
	else
	{
		zombies = getaiteamarray(level.zombie_team);
		if(isdefined(zombies) && zombies.size > 0)
		{
			foreach(zombie in zombies)
			{
				zombie.no_powerups = 1;
				zombie.marked_for_recycle = 1;
				zombie.has_been_damaged_by_player = 0;
				zombie dodamage(zombie.health + 1000, zombie.origin, zombie);
			}
		}
	}
	if(level.inprematchperiod)
	{
		level waittill(#"prematch_over");
	}
	/#
		println("" + gettime());
	#/
	level.hostmigrationtimer = 1;
	thread locktimer();
	if(is_true(level.b_host_migration_force_player_respawn))
	{
		foreach(player in level.players)
		{
			if(zm_utility::is_player_valid(player, 0, 0))
			{
				player host_migration_respawn();
			}
		}
	}
	zombies = getaiteamarray(level.zombie_team);
	if(isdefined(zombies) && zombies.size > 0)
	{
		foreach(zombie in zombies)
		{
			if(isdefined(zombie._host_migration_link_entity))
			{
				ent = spawn("script_origin", zombie.origin);
				ent.angles = zombie.angles;
				zombie linkto(ent);
				ent linkto(zombie._host_migration_link_entity, "tag_origin", zombie._host_migration_link_entity worldtolocalcoords(ent.origin), ent.angles + zombie._host_migration_link_entity.angles);
				zombie._host_migration_link_helper = ent;
				zombie linkto(zombie._host_migration_link_helper);
			}
		}
	}
	level endon(#"host_migration_begin");
	should_pause_spawning = level flag::get("spawn_zombies");
	if(should_pause_spawning)
	{
		level flag::clear("spawn_zombies");
	}
	hostmigrationwait();
	foreach(player in level.players)
	{
		player thread post_migration_invulnerability();
	}
	zombies = getaiteamarray(level.zombie_team);
	if(isdefined(zombies) && zombies.size > 0)
	{
		foreach(zombie in zombies)
		{
			if(isdefined(zombie._host_migration_link_entity))
			{
				zombie unlink();
				zombie._host_migration_link_helper delete();
				zombie._host_migration_link_helper = undefined;
				zombie._host_migration_link_entity = undefined;
			}
		}
	}
	if(should_pause_spawning)
	{
		level flag::set("spawn_zombies");
	}
	level.hostmigrationtimer = undefined;
	level._hm_should_pause_spawning = undefined;
	sethostmigrationstatus(0);
	/#
		println("" + gettime());
	#/
	level.host = util::gethostplayer();
	for(i = 0; i < level.players.size; i++)
	{
		clientnum = level.players[i] getentitynumber();
		level.players[i] stats::set_stat(#"afteractionreportstats", #"clientnum", clientnum);
	}
	callback::function_daed27e8(#"hash_137b937fd26992be");
	callback::callback(#"hash_137b937fd26992be");
	level notify(#"host_migration_end");
}

/*
	Name: post_migration_become_vulnerable
	Namespace: hostmigration
	Checksum: 0x2FD9C2FE
	Offset: 0xF98
	Size: 0x18
	Parameters: 0
	Flags: None
*/
function post_migration_become_vulnerable()
{
	self endon(#"disconnect");
}

/*
	Name: post_migration_invulnerability
	Namespace: hostmigration
	Checksum: 0x657A83C0
	Offset: 0xFB8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function post_migration_invulnerability()
{
	self thread val::set_for_time(3, "host_migration", "takedamage", 0);
}

/*
	Name: host_migration_respawn
	Namespace: hostmigration
	Checksum: 0x1D714D02
	Offset: 0xFF0
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function host_migration_respawn()
{
	/#
		println("");
	#/
	new_origin = undefined;
	if(isdefined(level.check_valid_spawn_override))
	{
		new_origin = [[level.check_valid_spawn_override]](self);
	}
	if(!isdefined(new_origin))
	{
		new_origin = zm_player::check_for_valid_spawn_near_team(self, 1);
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
		self dontinterpolate();
		self setorigin(new_origin.origin);
		self setplayerangles(angles);
	}
	return true;
}

/*
	Name: matchstarttimerconsole_internal
	Namespace: hostmigration
	Checksum: 0x5F06AE55
	Offset: 0x10F8
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function matchstarttimerconsole_internal(counttime)
{
	waittillframeend();
	level endon(#"match_start_timer_beginning");
	luinotifyevent(#"create_prematch_timer", 2, gettime() + (int(counttime * 1000)), 1);
	wait(counttime);
}

/*
	Name: matchstarttimerconsole
	Namespace: hostmigration
	Checksum: 0x1AA12B6E
	Offset: 0x1178
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function matchstarttimerconsole(type, duration)
{
	level notify(#"match_start_timer_beginning");
	waitframe(1);
	counttime = int(duration);
	var_5654073f = counttime >= 2;
	if(var_5654073f)
	{
		matchstarttimerconsole_internal(counttime);
	}
	luinotifyevent(#"prematch_timer_ended", 1, var_5654073f);
}

/*
	Name: hostmigrationwait
	Namespace: hostmigration
	Checksum: 0x16DEFB5F
	Offset: 0x1230
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function hostmigrationwait()
{
	level endon(#"game_ended");
	if(level.hostmigrationreturnedplayercount < (level.players.size * 2) / 3)
	{
		thread matchstarttimerconsole("waiting_for_teams", 20);
		hostmigrationwaitforplayers();
	}
	thread matchstarttimerconsole("match_starting_in", 9);
	wait(1);
}

/*
	Name: hostmigrationwaitforplayers
	Namespace: hostmigration
	Checksum: 0x16FD1A21
	Offset: 0x12D0
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function hostmigrationwaitforplayers()
{
	level endon(#"hostmigration_enoughplayers");
	wait(1);
}

/*
	Name: hostmigrationtimerthink_internal
	Namespace: hostmigration
	Checksum: 0x8F9112B7
	Offset: 0x12F8
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function hostmigrationtimerthink_internal()
{
	level endon(#"host_migration_begin", #"host_migration_end");
	self.hostmigrationcontrolsfrozen = 0;
	while(!isalive(self))
	{
		self waittill(#"spawned");
	}
	if(isdefined(self._host_migration_link_entity))
	{
		ent = spawn("script_origin", self.origin);
		ent.angles = self.angles;
		self linkto(ent);
		ent linkto(self._host_migration_link_entity, "tag_origin", self._host_migration_link_entity worldtolocalcoords(ent.origin), ent.angles + self._host_migration_link_entity.angles);
		self._host_migration_link_helper = ent;
		/#
			println("" + self._host_migration_link_entity.targetname);
		#/
	}
	self.hostmigrationcontrolsfrozen = 1;
	self val::set(#"host_migration", "freezecontrols");
	self val::set(#"host_migration", "disablegadgets");
	level waittill(#"host_migration_end");
}

/*
	Name: hostmigrationtimerthink
	Namespace: hostmigration
	Checksum: 0x4C71EDD3
	Offset: 0x14E0
	Size: 0x13E
	Parameters: 0
	Flags: Linked
*/
function hostmigrationtimerthink()
{
	self endon(#"disconnect");
	level endon(#"host_migration_begin");
	hostmigrationtimerthink_internal();
	if(self.hostmigrationcontrolsfrozen)
	{
		self val::reset(#"host_migration", "freezecontrols");
		self val::reset(#"host_migration", "disablegadgets");
		self.hostmigrationcontrolsfrozen = 0;
		/#
			println("");
		#/
	}
	if(isdefined(self._host_migration_link_entity))
	{
		self unlink();
		self._host_migration_link_helper delete();
		self._host_migration_link_helper = undefined;
		if(isdefined(self._host_migration_link_entity._post_host_migration_thread))
		{
			self thread [[self._host_migration_link_entity._post_host_migration_thread]](self._host_migration_link_entity);
		}
		self._host_migration_link_entity = undefined;
	}
}

/*
	Name: waittillhostmigrationdone
	Namespace: hostmigration
	Checksum: 0xBB6EF994
	Offset: 0x1628
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function waittillhostmigrationdone()
{
	if(!isdefined(level.hostmigrationtimer))
	{
		return 0;
	}
	starttime = gettime();
	level waittill(#"host_migration_end");
	return gettime() - starttime;
}

/*
	Name: waittillhostmigrationstarts
	Namespace: hostmigration
	Checksum: 0x7D8545E5
	Offset: 0x1678
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function waittillhostmigrationstarts(duration)
{
	if(isdefined(level.hostmigrationtimer))
	{
		return;
	}
	level endon(#"host_migration_begin");
	wait(duration);
}

/*
	Name: waitlongdurationwithhostmigrationpause
	Namespace: hostmigration
	Checksum: 0x66D3408
	Offset: 0x16B8
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function waitlongdurationwithhostmigrationpause(duration)
{
	if(duration == 0)
	{
		return;
	}
	/#
		assert(duration > 0);
	#/
	starttime = gettime();
	endtime = gettime() + (duration * 1000);
	while(gettime() < endtime)
	{
		waittillhostmigrationstarts((endtime - gettime()) / 1000);
		if(isdefined(level.hostmigrationtimer))
		{
			timepassed = waittillhostmigrationdone();
			endtime = endtime + timepassed;
		}
	}
	if(gettime() != endtime)
	{
		/#
			println((("" + gettime()) + "") + endtime);
		#/
	}
	waittillhostmigrationdone();
	return gettime() - starttime;
}

/*
	Name: waitlongdurationwithgameendtimeupdate
	Namespace: hostmigration
	Checksum: 0xC159C24A
	Offset: 0x17D8
	Size: 0x16E
	Parameters: 1
	Flags: None
*/
function waitlongdurationwithgameendtimeupdate(duration)
{
	if(duration == 0)
	{
		return;
	}
	/#
		assert(duration > 0);
	#/
	starttime = gettime();
	endtime = gettime() + (duration * 1000);
	while(gettime() < endtime)
	{
		waittillhostmigrationstarts((endtime - gettime()) / 1000);
		while(isdefined(level.hostmigrationtimer))
		{
			endtime = endtime + 1000;
			setgameendtime(int(endtime));
			wait(1);
		}
	}
	/#
		if(gettime() != endtime)
		{
			println((("" + gettime()) + "") + endtime);
		}
	#/
	while(isdefined(level.hostmigrationtimer))
	{
		endtime = endtime + 1000;
		setgameendtime(int(endtime));
		wait(1);
	}
	return gettime() - starttime;
}

/*
	Name: find_alternate_player_place
	Namespace: hostmigration
	Checksum: 0x4D1C0913
	Offset: 0x1950
	Size: 0x256
	Parameters: 5
	Flags: Linked
*/
function find_alternate_player_place(v_origin, min_radius, max_radius, max_height, ignore_targetted_nodes)
{
	found_node = undefined;
	a_nodes = getnodesinradiussorted(v_origin, max_radius, min_radius, max_height, "pathnodes");
	if(isdefined(a_nodes) && a_nodes.size > 0)
	{
		a_player_volumes = getentarray("player_volume", "script_noteworthy");
		index = a_nodes.size - 1;
		for(i = index; i >= 0; i--)
		{
			n_node = a_nodes[i];
			if(ignore_targetted_nodes == 1)
			{
				if(isdefined(n_node.target))
				{
					continue;
				}
			}
			if(!positionwouldtelefrag(n_node.origin))
			{
				if(zm_utility::check_point_in_enabled_zone(n_node.origin, 1, a_player_volumes))
				{
					v_start = (n_node.origin[0], n_node.origin[1], n_node.origin[2] + 30);
					v_end = (n_node.origin[0], n_node.origin[1], n_node.origin[2] - 30);
					trace = bullettrace(v_start, v_end, 0, undefined);
					if(trace[#"fraction"] < 1)
					{
						override_abort = 0;
						if(isdefined(level._whoswho_reject_node_override_func))
						{
							override_abort = [[level._whoswho_reject_node_override_func]](v_origin, n_node);
						}
						if(!override_abort)
						{
							found_node = n_node;
							break;
						}
					}
				}
			}
		}
	}
	return found_node;
}

/*
	Name: hostmigration_put_player_in_better_place
	Namespace: hostmigration
	Checksum: 0xC336B12D
	Offset: 0x1BB0
	Size: 0x34C
	Parameters: 0
	Flags: None
*/
function hostmigration_put_player_in_better_place()
{
	spawnpoint = undefined;
	spawnpoint = find_alternate_player_place(self.origin, 50, 150, 64, 1);
	if(!isdefined(spawnpoint))
	{
		spawnpoint = find_alternate_player_place(self.origin, 150, 400, 64, 1);
	}
	if(!isdefined(spawnpoint))
	{
		spawnpoint = find_alternate_player_place(self.origin, 50, 400, 256, 0);
	}
	if(!isdefined(spawnpoint))
	{
		spawnpoint = zm_player::check_for_valid_spawn_near_team(self, 1);
	}
	if(!isdefined(spawnpoint))
	{
		match_string = "";
		location = level.scr_zm_map_start_location;
		if(location == "default" || location == "" && isdefined(level.default_start_location))
		{
			location = level.default_start_location;
		}
		match_string = (level.scr_zm_ui_gametype + "_") + location;
		spawnpoints = [];
		structs = struct::get_array("initial_spawn", "script_noteworthy");
		if(isdefined(structs))
		{
			foreach(struct in structs)
			{
				if(isdefined(struct.script_string))
				{
					tokens = strtok(struct.script_string, " ");
					foreach(token in tokens)
					{
						if(token == match_string)
						{
							spawnpoints[spawnpoints.size] = struct;
						}
					}
				}
			}
		}
		if(!isdefined(spawnpoints) || spawnpoints.size == 0)
		{
			spawnpoints = struct::get_array("initial_spawn_points", "targetname");
		}
		/#
			assert(isdefined(spawnpoints), "");
		#/
		spawnpoint = zm_player::getfreespawnpoint(spawnpoints, self);
	}
	if(isdefined(spawnpoint))
	{
		self setorigin(spawnpoint.origin);
	}
}

