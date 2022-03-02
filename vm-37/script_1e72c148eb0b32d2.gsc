#using script_3f9e0dc8454d98e1;
#using script_5660bae5b402a1eb;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_powerup_nuke;

/*
	Name: function_89f2df9
	Namespace: zm_powerup_nuke
	Checksum: 0x7A4847BE
	Offset: 0x170
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_nuke", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_nuke
	Checksum: 0x2DA9F439
	Offset: 0x1B8
	Size: 0xFC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("nuke", &grab_nuke);
	clientfield::register("actor", "zm_nuked", 1, 1, "int");
	clientfield::register("vehicle", "zm_nuked", 1, 1, "int");
	zm_powerups::add_zombie_powerup("nuke", "p7_zm_power_up_nuke", #"hash_39772b1fab5ee98c", &function_8d3a47ed, 0, 0, 0, "zombie/fx9_powerup_nuke");
	level flag::init(#"hash_21921ed511559aa3");
}

/*
	Name: grab_nuke
	Namespace: zm_powerup_nuke
	Checksum: 0xD89028D4
	Offset: 0x2C0
	Size: 0x188
	Parameters: 1
	Flags: Linked
*/
function grab_nuke(player)
{
	level thread nuke_powerup(self, player.team, player);
	players = getplayers();
	foreach(e_player in players)
	{
		if(isdefined(e_player) && isplayer(e_player) && isdefined(self.hint))
		{
			e_player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", self.hint);
		}
	}
	player thread zm_powerups::powerup_vo("nuke");
	zombies = getaiteamarray(level.zombie_team);
	player.zombie_nuked = arraysort(zombies, self.origin);
	player notify(#"nuke_triggered");
}

/*
	Name: function_8d3a47ed
	Namespace: zm_powerup_nuke
	Checksum: 0x3D507343
	Offset: 0x450
	Size: 0xEA
	Parameters: 0
	Flags: Linked
*/
function function_8d3a47ed()
{
	if(zm_utility::is_survival())
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			a_enemies = player function_bdda420f(player.origin, 3000);
			if(a_enemies.size)
			{
				return true;
			}
		}
		return false;
	}
	return true;
}

/*
	Name: nuke_powerup
	Namespace: zm_powerup_nuke
	Checksum: 0x30767523
	Offset: 0x548
	Size: 0x6E8
	Parameters: 3
	Flags: Linked
*/
function nuke_powerup(drop_item, player_team, var_264cf1f9)
{
	level thread nuke_delay_spawning(3);
	location = drop_item.origin;
	if(isdefined(drop_item.fx))
	{
		playfx(drop_item.fx, location);
	}
	if(!is_true(level.var_5f911d8e))
	{
		level thread nuke_flash(player_team);
	}
	if(zm_utility::is_survival())
	{
		a_enemies = var_264cf1f9 function_bdda420f(location, 3000);
	}
	else
	{
		a_enemies = getaiteamarray(level.zombie_team);
	}
	foreach(ai_enemy in a_enemies)
	{
		ai_enemy ai::stun(1.5);
	}
	wait(0.5);
	if(zm_utility::is_survival())
	{
		zombies = a_enemies;
		function_1eaaceab(zombies);
	}
	else
	{
		zombies = getaiteamarray(level.zombie_team);
	}
	zombies = arraysort(zombies, location);
	zombies_nuked = [];
	for(i = 0; i < zombies.size; i++)
	{
		if(is_true(zombies[i].ignore_nuke))
		{
			continue;
		}
		if(isdefined(zombies[i].marked_for_death) && zombies[i].marked_for_death)
		{
			continue;
		}
		if(isdefined(zombies[i].nuke_damage_func))
		{
			zombies[i] thread [[zombies[i].nuke_damage_func]]();
			continue;
		}
		if(zm_utility::is_magic_bullet_shield_enabled(zombies[i]))
		{
			continue;
		}
		zombies[i].marked_for_death = 1;
		if(!is_true(zombies[i].nuked) && !zm_utility::is_magic_bullet_shield_enabled(zombies[i]))
		{
			zombies[i].nuked = 1;
			zombies[i].var_98f1f37c = 1;
			zombies_nuked[zombies_nuked.size] = zombies[i];
			zombies[i] clientfield::set("zm_nuked", 1);
			zombies[i] zombie_utility::set_zombie_run_cycle_override_value("walk");
		}
	}
	for(i = 0; i < zombies_nuked.size; i++)
	{
		wait(randomfloatrange(0.1, 0.3));
		if(!isdefined(zombies_nuked[i]))
		{
			continue;
		}
		if(zm_utility::is_magic_bullet_shield_enabled(zombies_nuked[i]))
		{
			continue;
		}
		if(!is_true(zombies_nuked[i].isdog))
		{
			if(!is_true(zombies_nuked[i].no_gib))
			{
				zombies_nuked[i] zombie_utility::zombie_head_gib();
			}
			zombies_nuked[i] playsound(#"evt_nuked");
		}
		if(zombies_nuked[i].var_6f84b820 === #"normal")
		{
			zombies_nuked[i] kill();
		}
		else
		{
			if(zombies_nuked[i].var_6f84b820 === #"special")
			{
				var_c790ea95 = zombies_nuked[i].maxhealth * 0.75;
			}
			else if(zombies_nuked[i].var_6f84b820 === #"elite")
			{
				var_c790ea95 = zombies_nuked[i].maxhealth * 0.25;
			}
		}
		if(isdefined(var_c790ea95))
		{
			zombies_nuked[i] dodamage(var_c790ea95, zombies_nuked[i].origin);
		}
	}
	level notify(#"nuke_complete");
	if(zm_powerups::function_cfd04802(#"nuke") && isplayer(var_264cf1f9))
	{
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"nuke_powerup_zm", #attacker:var_264cf1f9});
	}
	else
	{
		foreach(e_player in level.players)
		{
			level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"nuke_powerup_zm", #attacker:e_player});
		}
	}
}

/*
	Name: nuke_flash
	Namespace: zm_powerup_nuke
	Checksum: 0xDE130EE4
	Offset: 0xC38
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function nuke_flash(team)
{
	if(isdefined(team))
	{
		getplayers()[0] playsoundtoteam("evt_nuke_flash", team);
	}
	else
	{
		getplayers()[0] playsound(#"evt_nuke_flash");
	}
	lui::screen_flash(0.2, 0.5, 1, 0.8, "white", undefined, 1);
}

/*
	Name: nuke_delay_spawning
	Namespace: zm_powerup_nuke
	Checksum: 0x7D10BF78
	Offset: 0xD00
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function nuke_delay_spawning(n_spawn_delay)
{
	level endoncallback(&function_406d206b, #"disable_nuke_delay_spawning");
	if(is_true(level.disable_nuke_delay_spawning))
	{
		return;
	}
	b_spawn_zombies_before_nuke = level flag::get("spawn_zombies");
	level flag::set(#"hash_21921ed511559aa3");
	level flag::clear("spawn_zombies");
	level waittill(#"nuke_complete");
	if(is_true(level.disable_nuke_delay_spawning))
	{
		level flag::clear(#"hash_21921ed511559aa3");
		return;
	}
	wait(n_spawn_delay);
	if(!is_true(level.disable_nuke_delay_spawning) && b_spawn_zombies_before_nuke)
	{
		level flag::set("spawn_zombies");
	}
	level flag::clear(#"hash_21921ed511559aa3");
}

/*
	Name: function_406d206b
	Namespace: zm_powerup_nuke
	Checksum: 0x559F5703
	Offset: 0xE78
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_406d206b(var_c34665fc)
{
	level flag::clear(#"hash_21921ed511559aa3");
}

/*
	Name: function_9a79647b
	Namespace: zm_powerup_nuke
	Checksum: 0x3A0C1AD9
	Offset: 0xEB0
	Size: 0x2E
	Parameters: 1
	Flags: None
*/
function function_9a79647b(var_8de6cf73)
{
	self.nuke_damage_func = &nuke_damage_func;
	self.var_3b6e5508 = var_8de6cf73;
}

/*
	Name: nuke_damage_func
	Namespace: zm_powerup_nuke
	Checksum: 0x6ECE0714
	Offset: 0xEE8
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function nuke_damage_func()
{
	self endon(#"death");
	wait(randomfloatrange(0.1, 0.7));
	self thread zombie_death::flame_death_fx();
	self playsound(#"evt_nuked");
	self dodamage(self.maxhealth * self.var_3b6e5508, self.origin);
}

