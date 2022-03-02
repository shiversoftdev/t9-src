#using script_1c65dbfc2f1c8d8f;
#using script_68d2ee1489345a1d;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\scoreevents.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_feb8f309;

/*
	Name: function_8ceef761
	Namespace: namespace_feb8f309
	Checksum: 0x615C8F31
	Offset: 0x240
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8ceef761()
{
	level notify(988617730);
}

#namespace scoreevents;

/*
	Name: function_89f2df9
	Namespace: scoreevents
	Checksum: 0xF86D00C3
	Offset: 0x260
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2f9a92f69b207b7c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: scoreevents
	Checksum: 0x48A99F69
	Offset: 0x2A8
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	registerscoreeventcallback("scoreEventSR", &function_abce7fd5);
	level.var_ade393f4 = &function_ade393f4;
	level.var_f8b76690 = &function_f8b76690;
	level.var_88e6f8b7 = &function_88e6f8b7;
	level.var_24a17c08 = &function_24a17c08;
	callback::on_player_damage(&on_player_damage);
	callback::function_10a4dd0a(&function_10a4dd0a);
}

/*
	Name: function_abce7fd5
	Namespace: scoreevents
	Checksum: 0x746D586B
	Offset: 0x380
	Size: 0x3FC
	Parameters: 1
	Flags: Linked
*/
function function_abce7fd5(params)
{
	if(is_true(params.allplayers))
	{
		players = getplayers();
		foreach(player in players)
		{
			level doscoreeventcallback("scoreEventZM", {#enemy:params.enemy, #scoreevent:params.scoreevent, #attacker:player});
			if(params.scoreevent === "defend_pristine_zm" || params.scoreevent === "escort_pristine_zm")
			{
				player zm_stats::increment_challenge_stat(#"hash_66d504a1593b165");
				continue;
			}
			if(params.scoreevent === "hvt_quick_kill_zm")
			{
				player zm_stats::increment_challenge_stat(#"hash_44961f90979e3ba9");
			}
		}
	}
	if(is_true(params.nearbyplayers) && isdefined(params.location))
	{
		if(!isdefined(params.var_b0a57f8c))
		{
			params.var_b0a57f8c = 512;
		}
		players = getplayers(undefined, params.location, params.var_b0a57f8c);
		foreach(player in players)
		{
			if(params.scoreevent === "event_complete")
			{
				player function_b122e75f();
				continue;
			}
			level doscoreeventcallback("scoreEventZM", {#enemy:params.enemy, #scoreevent:params.scoreevent, #attacker:player});
			if(params.scoreevent === "secure_pristine_zm")
			{
				player zm_stats::increment_challenge_stat(#"hash_66d504a1593b165");
			}
		}
	}
	else if(isdefined(params.attacker))
	{
		level doscoreeventcallback("scoreEventZM", {#enemy:params.enemy, #scoreevent:params.scoreevent, #attacker:params.attacker});
		if(params.scoreevent === "demented_echo_kill_before_shriek_zm")
		{
			params.attacker zm_stats::increment_challenge_stat(#"hash_22485a4cae21822b");
		}
	}
}

/*
	Name: function_b122e75f
	Namespace: scoreevents
	Checksum: 0xD49D9BA2
	Offset: 0x788
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_b122e75f()
{
	var_237b2ba0 = "";
	if(isdefined(level.var_b48509f9))
	{
		var_237b2ba0 = "event_complete_capsule_" + level.var_b48509f9;
		level doscoreeventcallback("scoreEventZM", {#scoreevent:var_237b2ba0, #attacker:self});
	}
}

/*
	Name: function_f8b76690
	Namespace: scoreevents
	Checksum: 0x4529A22B
	Offset: 0x808
	Size: 0x3DC
	Parameters: 3
	Flags: Linked
*/
function function_f8b76690(var_a0345f37, player, weapon)
{
	var_4838b749 = weapon namespace_b376ff3f::function_d768ea30();
	weapon_item = weapon.inventory.items[var_4838b749];
	if(weapon_item.var_a6762160.var_387e74f4 === 1)
	{
		weapon zm_stats::increment_challenge_stat(#"hash_79f623602d23af5a");
	}
	if(weapon isinvehicle())
	{
		weapon zm_stats::increment_challenge_stat(#"hash_2467f4d08b89456");
	}
	if(!isdefined(weapon.var_14c9514c))
	{
		weapon.var_14c9514c = {};
	}
	if(!isdefined(weapon.var_14c9514c) || weapon.var_14c9514c.destination.targetname !== level.var_7d45d0d4.currentdestination.targetname)
	{
		weapon.var_14c9514c = {#hash_3f8123b0:[], #destination:level.var_7d45d0d4.currentdestination};
		if(!isdefined(weapon.var_14c9514c.var_3f8123b0))
		{
			weapon.var_14c9514c.var_3f8123b0 = [];
		}
		else if(!isarray(weapon.var_14c9514c.var_3f8123b0))
		{
			weapon.var_14c9514c.var_3f8123b0 = array(weapon.var_14c9514c.var_3f8123b0);
		}
		if(!isinarray(weapon.var_14c9514c.var_3f8123b0, player.archetype))
		{
			weapon.var_14c9514c.var_3f8123b0[weapon.var_14c9514c.var_3f8123b0.size] = player.archetype;
		}
	}
	else if(player.var_6f84b820 === #"elite" || (player.var_6f84b820 === #"special" && weapon.var_14c9514c.var_3f8123b0.size < 5))
	{
		if(!isdefined(weapon.var_14c9514c.var_3f8123b0))
		{
			weapon.var_14c9514c.var_3f8123b0 = [];
		}
		else if(!isarray(weapon.var_14c9514c.var_3f8123b0))
		{
			weapon.var_14c9514c.var_3f8123b0 = array(weapon.var_14c9514c.var_3f8123b0);
		}
		if(!isinarray(weapon.var_14c9514c.var_3f8123b0, player.archetype))
		{
			weapon.var_14c9514c.var_3f8123b0[weapon.var_14c9514c.var_3f8123b0.size] = player.archetype;
		}
		if(weapon.var_14c9514c.var_3f8123b0.size === 5)
		{
			weapon zm_stats::increment_challenge_stat(#"hash_1eaffdbd7f765b07");
		}
	}
}

/*
	Name: function_ade393f4
	Namespace: scoreevents
	Checksum: 0x1B92CA8B
	Offset: 0xBF0
	Size: 0x28C
	Parameters: 3
	Flags: Linked
*/
function function_ade393f4(var_a0345f37, player, weapon)
{
	if(!zm_utility::is_player_valid(player, 0, 0))
	{
		return;
	}
	if(!isdefined(player.var_2a26f02))
	{
		player.var_2a26f02 = [];
	}
	if(killstreaks::is_killstreak_weapon(weapon) && isdefined(level.var_7d45d0d4.var_3385b421))
	{
		if(!isdefined(player.var_2a26f02[weapon.statname]) || player.var_2a26f02[weapon.statname].objective !== level.var_7d45d0d4.var_3385b421)
		{
			player.var_2a26f02[weapon.statname] = {#hash_22835c3f:0, #kill_count:0, #objective:level.var_7d45d0d4.var_3385b421};
		}
		player.var_2a26f02[weapon.statname].kill_count++;
		if(player.var_2a26f02[weapon.statname].kill_count === 10 && player.var_2a26f02[weapon.statname].var_22835c3f === 0)
		{
			player.var_2a26f02[weapon.statname].var_22835c3f = 1;
			player zm_stats::increment_challenge_stat(#"hash_36c9caf1c41a8356");
		}
	}
	if(level.var_7d45d0d4.var_3385b421.content_script_name === "holdout")
	{
		if(var_a0345f37.var_1d8cde9 === 1)
		{
			player zm_stats::increment_challenge_stat(#"hash_57e42cdb892d3717");
			level doscoreeventcallback("scoreEventZM", {#enemy:var_a0345f37, #scoreevent:"holdout_barricade_finisher_zm", #attacker:player});
		}
	}
}

/*
	Name: function_88e6f8b7
	Namespace: scoreevents
	Checksum: 0xFE505497
	Offset: 0xE88
	Size: 0x3B4
	Parameters: 1
	Flags: Linked
*/
function function_88e6f8b7(params)
{
	if(level.var_7d45d0d4.var_3385b421.content_script_name === "retrieval" && isdefined(params.enemy))
	{
		params.enemy function_513fa6e4(params.enemy.attacker);
	}
	if(isdefined(params.enemy.attackable) && params.enemy.attackable.targetname === "defend_object")
	{
		if(isdefined(params.eattacker) && zm_utility::is_player_valid(params.eattacker, 0, 0))
		{
			if(isdefined(params.eattacker.var_2a26f02[params.eattacker getentitynumber()]))
			{
				if(params.eattacker.var_2a26f02[params.eattacker getentitynumber()].time > (gettime() - 2000) && params.eattacker.var_2a26f02[params.eattacker getentitynumber()].on_cooldown === 0)
				{
					params.eattacker.var_2a26f02[params.eattacker getentitynumber()].var_4480a428++;
					params.eattacker.var_2a26f02[params.eattacker getentitynumber()].time = gettime() + 2000;
					if(params.eattacker.var_2a26f02[params.eattacker getentitynumber()].var_4480a428 === 5)
					{
						level doscoreeventcallback("scoreEventZM", {#scoreevent:"defend_cleanup_zm", #attacker:params.eattacker});
					}
				}
				else if(params.eattacker.var_2a26f02[params.eattacker getentitynumber()].time < gettime())
				{
					params.eattacker.var_2a26f02[params.eattacker getentitynumber()] = {#on_cooldown:0, #hash_4480a428:1, #time:gettime(), #player:params.eattacker};
				}
			}
			else
			{
				params.eattacker.var_2a26f02[params.eattacker getentitynumber()] = {#on_cooldown:0, #hash_4480a428:1, #time:gettime(), #player:params.eattacker};
			}
		}
	}
}

/*
	Name: on_player_damage
	Namespace: scoreevents
	Checksum: 0xBD487A16
	Offset: 0x1248
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function on_player_damage(params)
{
	if(isai(params.eattacker) && is_true(self.var_28107825))
	{
		function_46e3cf42(params.eattacker, self);
	}
}

/*
	Name: function_46e3cf42
	Namespace: scoreevents
	Checksum: 0x3C04EB6D
	Offset: 0x12B0
	Size: 0x7E
	Parameters: 2
	Flags: Linked
*/
function function_46e3cf42(zombie, player)
{
	if(zm_utility::is_player_valid(player, 0, 0) && is_true(player.var_28107825))
	{
		zombie.var_9624a42c = {#time:gettime(), #player:player};
	}
}

/*
	Name: function_513fa6e4
	Namespace: scoreevents
	Checksum: 0xCCBA70BF
	Offset: 0x1338
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_513fa6e4(player)
{
	if(isdefined(self.var_9624a42c))
	{
		if(zm_utility::is_player_valid(self.var_9624a42c.player, 0, 0) && player !== self.var_9624a42c.player && self.var_9624a42c.time > (gettime() - 10000))
		{
			level doscoreeventcallback("scoreEventZM", {#scoreevent:"retrieve_battery_guardian_zm", #attacker:player});
		}
	}
}

/*
	Name: function_31553fb3
	Namespace: scoreevents
	Checksum: 0x7BBCAA2A
	Offset: 0x1400
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_31553fb3()
{
	self.var_11b51fc0 = gettime();
	if(!isdefined(self.var_ce436417))
	{
		self.var_ce436417 = gettime();
		level doscoreeventcallback("scoreEventZM", {#scoreevent:"escort_payload_progress_zm", #attacker:self});
	}
	else if(self.var_11b51fc0 - 5000 > self.var_ce436417)
	{
		self.var_ce436417 = gettime();
		level doscoreeventcallback("scoreEventZM", {#scoreevent:"escort_payload_progress_zm", #attacker:self});
	}
}

/*
	Name: function_10a4dd0a
	Namespace: scoreevents
	Checksum: 0x9852CF1
	Offset: 0x14E0
	Size: 0x1BC
	Parameters: 1
	Flags: Linked
*/
function function_10a4dd0a(params)
{
	item = params.item;
	if(isplayer(self))
	{
		if(isdefined(item.var_a6762160.name))
		{
			if(item.var_a6762160.name === #"hash_5a5d63f61e6770f9" || item.var_a6762160.name === #"hash_58951f692bf35608" && is_true(item.var_569199b9))
			{
				self zm_stats::increment_challenge_stat(#"hash_5d77c9a44bc6f7eb");
			}
			else
			{
				if(item.var_a6762160.name === #"hash_682698368e3a043" && is_true(self.var_f163034c))
				{
					if(!isdefined(self.var_664db4ed))
					{
						self.var_664db4ed = 0;
					}
					self.var_664db4ed++;
				}
				else if(item.var_a6762160.name === #"hash_54c0cbd255553ce7" && item.var_a6762160.var_31dcb18d === #"hash_3b44370452dc91f8")
				{
					self zm_stats::increment_challenge_stat(#"hash_3c8437e4e9f1e638");
				}
			}
		}
	}
}

/*
	Name: function_24a17c08
	Namespace: scoreevents
	Checksum: 0xC953AEBE
	Offset: 0x16A8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_24a17c08()
{
	level endon(#"end_game");
	self endon(#"death");
	self.var_f163034c = 1;
	self.var_664db4ed = 0;
	while(true)
	{
		if(self.var_664db4ed >= 3)
		{
			level doscoreeventcallback("scoreEventZM", {#scoreevent:"jump_pads_collect_3_or_more_containers_zm", #attacker:self});
			return;
		}
		if(!self zm_utility::is_jumping())
		{
			return;
		}
		wait(0.25);
	}
}

