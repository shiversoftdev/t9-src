#using script_19367cd29a4485db;
#using script_1cc417743d7c262d;
#using script_27347f09888ad15;
#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_2c949ef8;

/*
	Name: function_77a2ce9e
	Namespace: namespace_2c949ef8
	Checksum: 0xCDA4EA31
	Offset: 0x1B8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_77a2ce9e()
{
	level notify(1786615634);
}

/*
	Name: init
	Namespace: namespace_2c949ef8
	Checksum: 0x29C595F5
	Offset: 0x1D8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level thread main();
}

/*
	Name: main
	Namespace: namespace_2c949ef8
	Checksum: 0xC30CA1F4
	Offset: 0x200
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function main()
{
	/#
		function_2085db3b();
	#/
}

/*
	Name: function_5e62ed5c
	Namespace: namespace_2c949ef8
	Checksum: 0x96E5929F
	Offset: 0x228
	Size: 0x4B8
	Parameters: 0
	Flags: None
*/
function function_5e62ed5c()
{
	level endon(#"game_ended", #"hash_745d15f8fa0daab0");
	while(true)
	{
		if(!isdefined(level.var_cf15d540))
		{
			level.var_cf15d540 = 300;
		}
		if(!isdefined(level.var_f535b5f0))
		{
			level.var_f535b5f0 = 480;
		}
		level.var_49f4fe8e = undefined;
		var_7f729179 = undefined;
		var_7f729179 = level waittilltimeout(randomfloatrange(level.var_cf15d540, level.var_f535b5f0), #"start_ambush", #"objective_locked");
		if(level flag::get("objective_locked"))
		{
			level flag::wait_till_clear("objective_locked");
		}
		else
		{
			a_players = namespace_85745671::function_347f7d34();
			a_ai_zombies = getaiarray();
			var_571f5454 = undefined;
			e_target = undefined;
			if(var_7f729179._notify === "start_ambush")
			{
				if(!isdefined(level.var_49f4fe8e))
				{
					level.var_49f4fe8e = 1;
				}
				if(isdefined(var_7f729179.player))
				{
					e_target = var_7f729179.player;
					var_571f5454 = e_target.origin;
				}
				else if(isdefined(var_7f729179.location))
				{
					var_571f5454 = var_7f729179.location;
					if(a_players.size > 0)
					{
						e_target = arraygetclosest(var_571f5454, a_players);
					}
				}
				var_30ff34e3 = var_7f729179.var_30ff34e3;
			}
			else if(getdvarint(#"hash_21e1866f0c677ab8", 1))
			{
				return;
			}
			if(isdefined(e_target))
			{
				var_120d0570 = array::get_all_closest(e_target.origin, a_ai_zombies, undefined, undefined, 1200);
			}
			else if(a_players.size > 0)
			{
				var_5502295b = function_8af8f660();
				var_df053feb = array::get_all_farthest(var_5502295b, a_players);
				foreach(player in var_df053feb)
				{
					var_120d0570 = array::get_all_closest(player.origin, a_ai_zombies, undefined, undefined, 1200);
					if(var_120d0570.size <= 10)
					{
						var_571f5454 = player.origin;
						break;
					}
				}
			}
			if(isdefined(var_571f5454))
			{
				foreach(safehouse in struct::get_array("safehouse", "content_script_name"))
				{
					if(isdefined(safehouse.origin) && distance2dsquared(var_571f5454, safehouse.origin) <= sqr(2000))
					{
						var_571f5454 = undefined;
						break;
					}
				}
			}
			if(isdefined(var_571f5454))
			{
				do_ambush(var_571f5454, undefined, undefined, undefined, level.var_49f4fe8e);
				level thread function_39925c0d();
			}
		}
	}
}

/*
	Name: function_39925c0d
	Namespace: namespace_2c949ef8
	Checksum: 0xFBCDC4BA
	Offset: 0x6E8
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function function_39925c0d()
{
	level endon(#"game_ended", #"hash_51e64b5183e4c028", #"hash_745d15f8fa0daab0");
	wait(240);
	level notify(#"hash_51e64b5183e4c028");
}

/*
	Name: function_f4413120
	Namespace: namespace_2c949ef8
	Checksum: 0x532A3F0F
	Offset: 0x748
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_f4413120()
{
	if(isalive(self))
	{
		self playsoundtoplayer(#"hash_177c25d969608d58", self);
	}
}

/*
	Name: function_be6ec6c
	Namespace: namespace_2c949ef8
	Checksum: 0x49796EEA
	Offset: 0x798
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function function_be6ec6c(var_2b43a4c4, var_30ff34e3)
{
	if(!isdefined(var_30ff34e3))
	{
		var_30ff34e3 = 1;
	}
	if(!isdefined(var_2b43a4c4))
	{
		level notify(#"start_ambush", {#hash_30ff34e3:var_30ff34e3});
	}
	else
	{
		if(isplayer(var_2b43a4c4))
		{
			level notify(#"start_ambush", {#hash_30ff34e3:var_30ff34e3, #player:var_2b43a4c4});
		}
		else if(isvec(var_2b43a4c4))
		{
			level notify(#"start_ambush", {#hash_30ff34e3:var_30ff34e3, #location:var_2b43a4c4});
		}
	}
}

/*
	Name: function_47838885
	Namespace: namespace_2c949ef8
	Checksum: 0xF73A33B2
	Offset: 0x8A8
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_47838885(var_120d0570)
{
	if(isarray(var_120d0570))
	{
		foreach(ai_zombie in var_120d0570)
		{
			if(ai_zombie.team === #"axis")
			{
				ai_zombie thread namespace_85745671::function_9456addc(60);
			}
		}
	}
}

/*
	Name: function_8d3a76bb
	Namespace: namespace_2c949ef8
	Checksum: 0xEADF8153
	Offset: 0x978
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8d3a76bb(var_cf21a49f)
{
	switch(getplayers("allies", var_cf21a49f, 4096).size)
	{
		case 1:
		{
			return 5;
		}
		case 2:
		{
			return 7;
		}
		case 3:
		{
			return 10;
		}
		default:
		{
			return 12;
		}
	}
}

/*
	Name: do_ambush
	Namespace: namespace_2c949ef8
	Checksum: 0xBDD613F5
	Offset: 0xA18
	Size: 0x114
	Parameters: 7
	Flags: Linked
*/
function do_ambush(v_loc, var_aa19ae, var_437c9d8d, var_f24d0052, var_6a7b6ec4, var_6cd49f50, var_c8c520ef)
{
	if(!isdefined(var_c8c520ef))
	{
		var_c8c520ef = 1;
	}
	var_120d0570 = array::get_all_closest(v_loc, getaiarray(), undefined, undefined, var_f24d0052);
	function_47838885(var_120d0570);
	var_76913854 = getplayers("allies", v_loc, 4096);
	if(is_true(var_c8c520ef))
	{
		array::thread_all(var_76913854, &function_f4413120);
	}
	function_156560eb(v_loc, var_aa19ae, var_437c9d8d, var_f24d0052, var_6a7b6ec4, var_6cd49f50);
}

/*
	Name: function_156560eb
	Namespace: namespace_2c949ef8
	Checksum: 0x1580AEB7
	Offset: 0xB38
	Size: 0x42A
	Parameters: 6
	Flags: Linked
*/
function function_156560eb(var_cf21a49f, var_aa19ae, var_437c9d8d, var_f24d0052, var_6a7b6ec4, var_6cd49f50)
{
	if(!isdefined(var_437c9d8d))
	{
		var_437c9d8d = 1500;
	}
	if(!isdefined(var_f24d0052))
	{
		var_f24d0052 = 3000;
	}
	if(!isdefined(var_6a7b6ec4))
	{
		var_6a7b6ec4 = 1;
	}
	level endon(#"game_ended", #"hash_51e64b5183e4c028", #"hash_745d15f8fa0daab0");
	var_5b660261 = undefined;
	var_42c6e7d2 = [];
	if(!isdefined(var_aa19ae))
	{
		var_aa19ae = "default_ambush_list_realm_" + level.var_15d17eb2;
	}
	var_6443acc = namespace_679a22ba::function_77be8a83(var_aa19ae);
	while(isdefined(var_cf21a49f))
	{
		var_663d8b4e = function_8d3a76bb(var_cf21a49f);
		var_bb956a6c = function_48defc2d(var_cf21a49f, var_663d8b4e, var_437c9d8d, var_f24d0052, var_6a7b6ec4);
		for(i = 0; i < var_bb956a6c.size; i++)
		{
			a_players = namespace_85745671::function_347f7d34();
			if(!a_players.size)
			{
				wait(1);
				continue;
			}
			v_spawn = var_bb956a6c[i].origin;
			v_target = arraygetclosest(v_spawn, a_players).origin;
			if(!(isdefined(v_target) && isdefined(v_spawn)))
			{
				wait(1);
				continue;
			}
			v_angles = vectortoangles(v_target - v_spawn);
			v_angles = (0, v_angles[1], 0);
			var_4bf95f4c = namespace_679a22ba::function_ca209564(var_aa19ae, var_6443acc);
			if(!isdefined(var_4bf95f4c))
			{
				function_1eaaceab(var_42c6e7d2);
				if(!var_42c6e7d2.size)
				{
					return;
				}
				wait(1);
				continue;
			}
			ai_spawned = namespace_85745671::function_9d3ad056(var_4bf95f4c.var_990b33df, v_spawn, v_angles, "ambush_zombie");
			if(isdefined(ai_spawned))
			{
				if(!isdefined(var_42c6e7d2))
				{
					var_42c6e7d2 = [];
				}
				else if(!isarray(var_42c6e7d2))
				{
					var_42c6e7d2 = array(var_42c6e7d2);
				}
				var_42c6e7d2[var_42c6e7d2.size] = ai_spawned;
				ai_spawned.var_9602c8b2 = &function_12db74f8;
				ai_spawned thread function_1c491c2b(var_6cd49f50, var_4bf95f4c.var_29459a31, var_6443acc);
				namespace_679a22ba::function_266ee075(var_4bf95f4c.var_29459a31, var_6443acc);
				if(isdefined(level.var_ed7e8fdd))
				{
					playfxontag(level.var_ed7e8fdd, ai_spawned, "tag_origin");
				}
				waitframe(function_21a3a673(1, 3));
				continue;
			}
			wait(1);
		}
		wait(randomfloatrange(5, 6));
		a_players = namespace_85745671::function_347f7d34();
		if(a_players.size)
		{
			var_cf21a49f = arraygetclosest(var_cf21a49f, a_players).origin;
		}
	}
}

/*
	Name: function_48defc2d
	Namespace: namespace_2c949ef8
	Checksum: 0x8365576E
	Offset: 0xF70
	Size: 0x132
	Parameters: 5
	Flags: Linked, Private
*/
function private function_48defc2d(var_cf21a49f, var_6c57e71b, var_437c9d8d, var_f24d0052, var_6a7b6ec4)
{
	if(!var_6a7b6ec4)
	{
		var_bb956a6c = namespace_85745671::function_e4791424(var_cf21a49f, 1, 80, var_f24d0052, max(var_437c9d8d, int(var_f24d0052 * 0.75)));
		if(isdefined(var_bb956a6c[0]))
		{
			var_bb956a6c = array::randomize(namespace_85745671::function_e4791424(var_bb956a6c[0].origin, var_6c57e71b, 80, 1024, 8));
		}
	}
	if(!isdefined(var_bb956a6c) || !var_bb956a6c.size)
	{
		var_bb956a6c = array::randomize(namespace_85745671::function_e4791424(var_cf21a49f, var_6c57e71b, 80, var_f24d0052, var_437c9d8d));
	}
	return var_bb956a6c;
}

/*
	Name: function_1c491c2b
	Namespace: namespace_2c949ef8
	Checksum: 0xF040D2EE
	Offset: 0x10B0
	Size: 0xE8
	Parameters: 3
	Flags: Linked
*/
function function_1c491c2b(var_6cd49f50, var_f6dca9f2, var_6443acc)
{
	if(!isdefined(var_6cd49f50))
	{
		var_6cd49f50 = 60;
	}
	self endon(#"death");
	self thread namespace_85745671::function_9456addc(var_6cd49f50);
	while(true)
	{
		wait(5);
		a_players = getplayers("all", self.origin, 4096);
		if(a_players.size == 0)
		{
			if(isdefined(var_f6dca9f2) && isdefined(var_6443acc))
			{
				namespace_679a22ba::function_898aced0(var_f6dca9f2, var_6443acc);
			}
			self callback::callback(#"hash_10ab46b52df7967a");
		}
	}
}

/*
	Name: function_12db74f8
	Namespace: namespace_2c949ef8
	Checksum: 0x5DC38796
	Offset: 0x11A0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_12db74f8()
{
	if(self.zombie_move_speed !== #"super_sprint" && self.zombie_move_speed !== #"sprint")
	{
		self namespace_85745671::function_9758722(#"sprint");
	}
}

/*
	Name: function_8af8f660
	Namespace: namespace_2c949ef8
	Checksum: 0x23FC8F7C
	Offset: 0x1208
	Size: 0xF2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8af8f660()
{
	var_657dc854 = (0, 0, 0);
	a_players = getplayers();
	foreach(player in a_players)
	{
		if(player.sessionstate === "spectator")
		{
			continue;
		}
		var_657dc854 = var_657dc854 + function_b5c91b37(player);
	}
	if(a_players.size > 1)
	{
		var_657dc854 = var_657dc854 / a_players.size;
	}
	return var_657dc854;
}

/*
	Name: function_b5c91b37
	Namespace: namespace_2c949ef8
	Checksum: 0xC4E92253
	Offset: 0x1308
	Size: 0x82
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b5c91b37(player)
{
	if(player isinvehicle())
	{
		velocity = player getvehicleoccupied() getvelocity();
	}
	else
	{
		velocity = player getvelocity();
	}
	return player.origin + (velocity * 5);
}

/*
	Name: function_c0966bb1
	Namespace: namespace_2c949ef8
	Checksum: 0xA1D1CB37
	Offset: 0x1398
	Size: 0x2A8
	Parameters: 1
	Flags: Linked
*/
function function_c0966bb1(destination)
{
	a_triggers = array::randomize(getentarray("ambush_trigger", "targetname"));
	var_d0300267 = [];
	foreach(trigger in a_triggers)
	{
		if(trigger.destination === destination.targetname)
		{
			if(!isdefined(var_d0300267))
			{
				var_d0300267 = [];
			}
			else if(!isarray(var_d0300267))
			{
				var_d0300267 = array(var_d0300267);
			}
			var_d0300267[var_d0300267.size] = trigger;
		}
	}
	if(!var_d0300267.size)
	{
		return;
	}
	level flag::set(#"hash_44074059e3987765");
	n_max = var_d0300267.size * 0.666;
	n_count = 0;
	/#
		if(getdvarint(#"hash_11ff4ccbba6b40f6", 0))
		{
			n_max = var_d0300267.size;
		}
	#/
	foreach(trigger in var_d0300267)
	{
		trigger.var_83523415 = undefined;
		if(n_count < n_max)
		{
			a_spawns = array::randomize(struct::get_array(trigger.target));
			trigger callback::function_35a12f19(&function_39ee3b21, undefined, a_spawns);
			n_count++;
			waitframe(1);
			continue;
		}
		trigger delete();
	}
}

/*
	Name: function_39ee3b21
	Namespace: namespace_2c949ef8
	Checksum: 0x399A24C2
	Offset: 0x1648
	Size: 0x2E0
	Parameters: 2
	Flags: Linked
*/
function function_39ee3b21(eventstruct, a_spawns)
{
	if(!is_true(self.var_83523415) && isplayer(eventstruct.activator) && level flag::get(#"hash_44074059e3987765"))
	{
		self.var_83523415 = 1;
		self callback::function_b74bf3e(&function_39ee3b21);
		str_bundle = "default_zombies_realm_" + level.var_15d17eb2;
		if(!isdefined(a_spawns) || !a_spawns.size && isdefined(self.spawn_struct))
		{
			if(isalive(self.vehicle) && self.vehicle_position === self.vehicle.origin)
			{
				a_spawns = array(self.spawn_struct);
			}
			else
			{
				self delete();
				return;
			}
		}
		foreach(spawn in a_spawns)
		{
			if(getaicount() < getailimit())
			{
				var_4bf95f4c = namespace_679a22ba::function_ca209564(str_bundle);
				if(!isdefined(var_4bf95f4c))
				{
					break;
				}
				ai = spawnactor(var_4bf95f4c.var_990b33df, spawn.origin, spawn.angles, undefined, 1, 1);
				if(isdefined(ai))
				{
					if(isdefined(spawn.var_90d0c0ff))
					{
						ai.var_c9b11cb3 = spawn.var_90d0c0ff;
					}
					ai thread awareness::function_c241ef9a(ai, eventstruct.activator, 20);
					ai callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_5c3d1f);
				}
			}
			waitframe(randomintrange(2, 5));
		}
	}
}

/*
	Name: function_5c3d1f
	Namespace: namespace_2c949ef8
	Checksum: 0xDD426419
	Offset: 0x1930
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function function_5c3d1f()
{
	self notify("cc74e46f9e9c720");
	self endon("cc74e46f9e9c720");
	self endon(#"death");
	if(self.current_state.name !== #"wander" && self.current_state.name !== #"idle")
	{
		return;
	}
	while((self.birthtime + (int(30 * 1000))) > gettime() || getplayers(undefined, self.origin, 2048).size > 0)
	{
		wait(1);
	}
	if(self.current_state.name === #"wander" || self.current_state.name === #"idle")
	{
		self callback::callback(#"hash_10ab46b52df7967a");
	}
}

/*
	Name: function_2085db3b
	Namespace: namespace_2c949ef8
	Checksum: 0xB450D235
	Offset: 0x1A78
	Size: 0x1D4
	Parameters: 0
	Flags: None
*/
function function_2085db3b()
{
	/#
		mapname = util::function_53bbf9d2();
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		level thread function_2ebea850();
		level thread function_cfc99c9e();
		level thread function_986ead58();
	#/
}

/*
	Name: function_2ebea850
	Namespace: namespace_2c949ef8
	Checksum: 0xBE6342FD
	Offset: 0x1C58
	Size: 0x268
	Parameters: 0
	Flags: None
*/
function function_2ebea850()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_21e1866f0c677ab8", 0))
			{
				level notify(#"hash_745d15f8fa0daab0");
				setdvar(#"hash_21e1866f0c677ab8", 0);
			}
			else
			{
				if(getdvarint(#"hash_606c763dd8de6def", 0))
				{
					level notify(#"hash_745d15f8fa0daab0");
					level thread function_5e62ed5c();
					setdvar(#"hash_606c763dd8de6def", 0);
				}
				else
				{
					if(getdvarint(#"hash_56ab9987e62df113", 0))
					{
						level notify(#"hash_51e64b5183e4c028");
						array::run_all(getaiarray("", ""), &kill);
						setdvar(#"hash_56ab9987e62df113", 0);
					}
					else
					{
						if(getdvarint(#"hash_94d12ce1eee7e5a", 0))
						{
							level.var_49f4fe8e = 1;
							level thread function_be6ec6c();
							setdvar(#"hash_94d12ce1eee7e5a", 0);
						}
						else if(getdvarint(#"hash_3139027e2331e6b6", 0))
						{
							level.var_49f4fe8e = 0;
							level thread function_be6ec6c();
							setdvar(#"hash_3139027e2331e6b6", 0);
						}
					}
				}
			}
			wait(0.1);
		}
	#/
}

/*
	Name: function_cfc99c9e
	Namespace: namespace_2c949ef8
	Checksum: 0xC1C6BDAA
	Offset: 0x1EC8
	Size: 0x138
	Parameters: 0
	Flags: None
*/
function function_cfc99c9e()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_6c7a7cb80d06cc72", 0))
			{
				level notify(#"hash_745d15f8fa0daab0");
				level.var_cf15d540 = 30;
				level.var_f535b5f0 = 40;
				level thread function_5e62ed5c();
				setdvar(#"hash_6c7a7cb80d06cc72", 0);
			}
			else if(getdvarint(#"hash_4ca0f239aa5ff2d7", 0))
			{
				level notify(#"hash_745d15f8fa0daab0");
				level.var_cf15d540 = 300;
				level.var_f535b5f0 = 480;
				level thread function_5e62ed5c();
				setdvar(#"hash_4ca0f239aa5ff2d7", 0);
			}
			wait(0.1);
		}
	#/
}

/*
	Name: function_986ead58
	Namespace: namespace_2c949ef8
	Checksum: 0xA321774
	Offset: 0x2008
	Size: 0x120
	Parameters: 0
	Flags: None
*/
function function_986ead58()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_35d97c59a1cbade9", 0))
			{
				spawns = function_10c88d2e();
				level thread namespace_420b39d3::function_46997bdf(&spawns, "");
				setdvar(#"hash_35d97c59a1cbade9", 0);
			}
			else if(getdvarint(#"hash_2fcac2478bfe37f7", 0))
			{
				spawns = function_10c88d2e();
				namespace_420b39d3::function_70e877d7(&spawns);
				setdvar(#"hash_2fcac2478bfe37f7", 0);
			}
			wait(0.1);
		}
	#/
}

/*
	Name: function_10c88d2e
	Namespace: namespace_2c949ef8
	Checksum: 0xA5F25DD7
	Offset: 0x2130
	Size: 0x136
	Parameters: 0
	Flags: None
*/
function function_10c88d2e()
{
	/#
		spawns = [];
		if(isdefined(level.var_7d45d0d4.currentdestination))
		{
			destination = level.var_7d45d0d4.currentdestination;
			a_triggers = getentarray("", "");
			foreach(trigger in a_triggers)
			{
				if(trigger.destination === destination.targetname)
				{
					a_spawns = struct::get_array(trigger.target);
					spawns = arraycombine(a_spawns, spawns);
				}
			}
		}
		return spawns;
	#/
}

