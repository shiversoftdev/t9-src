#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_game_module;

/*
	Name: register_game_module
	Namespace: zm_game_module
	Checksum: 0xDA15241D
	Offset: 0x128
	Size: 0x230
	Parameters: 7
	Flags: None
*/
function register_game_module(index, module_name, pre_init_func, post_init_func, pre_init_zombie_spawn_func, post_init_zombie_spawn_func, hub_start_func)
{
	if(!isdefined(level._game_modules))
	{
		level._game_modules = [];
		level._num_registered_game_modules = 0;
	}
	for(i = 0; i < level._num_registered_game_modules; i++)
	{
		if(!isdefined(level._game_modules[i]))
		{
			continue;
		}
		if(isdefined(level._game_modules[i].index) && level._game_modules[i].index == index)
		{
			/#
				assert(level._game_modules[i].index != index, ("" + index) + "");
			#/
		}
	}
	level._game_modules[level._num_registered_game_modules] = spawnstruct();
	level._game_modules[level._num_registered_game_modules].index = index;
	level._game_modules[level._num_registered_game_modules].module_name = module_name;
	level._game_modules[level._num_registered_game_modules].pre_init_func = pre_init_func;
	level._game_modules[level._num_registered_game_modules].post_init_func = post_init_func;
	level._game_modules[level._num_registered_game_modules].pre_init_zombie_spawn_func = pre_init_zombie_spawn_func;
	level._game_modules[level._num_registered_game_modules].post_init_zombie_spawn_func = post_init_zombie_spawn_func;
	level._game_modules[level._num_registered_game_modules].hub_start_func = hub_start_func;
	level._num_registered_game_modules++;
}

/*
	Name: set_current_game_module
	Namespace: zm_game_module
	Checksum: 0x99857032
	Offset: 0x360
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function set_current_game_module(game_module_index)
{
	if(!isdefined(game_module_index))
	{
		level.current_game_module = level.game_module_classic_index;
		level.scr_zm_game_module = level.game_module_classic_index;
		return;
	}
	game_module = get_game_module(game_module_index);
	if(!isdefined(game_module))
	{
		/#
			assert(isdefined(game_module), ("" + game_module_index) + "");
		#/
		return;
	}
	level.current_game_module = game_module_index;
}

/*
	Name: get_current_game_module
	Namespace: zm_game_module
	Checksum: 0x527984E4
	Offset: 0x410
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function get_current_game_module()
{
	return get_game_module(level.current_game_module);
}

/*
	Name: get_game_module
	Namespace: zm_game_module
	Checksum: 0x79F35382
	Offset: 0x438
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function get_game_module(game_module_index)
{
	if(!isdefined(game_module_index))
	{
		return undefined;
	}
	for(i = 0; i < level._game_modules.size; i++)
	{
		if(level._game_modules[i].index == game_module_index)
		{
			return level._game_modules[i];
		}
	}
	return undefined;
}

/*
	Name: game_module_pre_zombie_spawn_init
	Namespace: zm_game_module
	Checksum: 0xA1227335
	Offset: 0x4B8
	Size: 0x50
	Parameters: 0
	Flags: None
*/
function game_module_pre_zombie_spawn_init()
{
	current_module = get_current_game_module();
	if(!isdefined(current_module) || !isdefined(current_module.pre_init_zombie_spawn_func))
	{
		return;
	}
	self [[current_module.pre_init_zombie_spawn_func]]();
}

/*
	Name: game_module_post_zombie_spawn_init
	Namespace: zm_game_module
	Checksum: 0x7A6789C8
	Offset: 0x510
	Size: 0x50
	Parameters: 0
	Flags: None
*/
function game_module_post_zombie_spawn_init()
{
	current_module = get_current_game_module();
	if(!isdefined(current_module) || !isdefined(current_module.post_init_zombie_spawn_func))
	{
		return;
	}
	self [[current_module.post_init_zombie_spawn_func]]();
}

/*
	Name: respawn_spectators_and_freeze_players
	Namespace: zm_game_module
	Checksum: 0xCFCF90DA
	Offset: 0x568
	Size: 0xD0
	Parameters: 0
	Flags: None
*/
function respawn_spectators_and_freeze_players()
{
	foreach(player in getplayers())
	{
		if(player.sessionstate == "spectator")
		{
			player [[level.spawnplayer]]();
		}
		player val::set(#"respawn_spectators_and_freeze_players", "freezecontrols");
	}
}

/*
	Name: damage_callback_no_pvp_damage
	Namespace: zm_game_module
	Checksum: 0x5A1EFF4E
	Offset: 0x640
	Size: 0xC8
	Parameters: 10
	Flags: None
*/
function damage_callback_no_pvp_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, eapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(isdefined(shitloc) && isplayer(shitloc) && shitloc == self)
	{
		return psoffsettime;
	}
	if(isdefined(shitloc) && !isplayer(shitloc))
	{
		return psoffsettime;
	}
	if(!isdefined(shitloc))
	{
		return psoffsettime;
	}
	return 0;
}

/*
	Name: respawn_players
	Namespace: zm_game_module
	Checksum: 0xC24149FA
	Offset: 0x710
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function respawn_players()
{
	players = getplayers();
	foreach(player in players)
	{
		player [[level.spawnplayer]]();
	}
}

/*
	Name: zombie_goto_round
	Namespace: zm_game_module
	Checksum: 0x986E58D5
	Offset: 0x7B8
	Size: 0x238
	Parameters: 1
	Flags: Linked
*/
function zombie_goto_round(target_round)
{
	level flag::set("round_reset");
	level notify(#"restart_round");
	if(target_round < 1)
	{
		target_round = 1;
	}
	level.zombie_total = 0;
	level.zombie_health = (isdefined(level.var_41dd92fd[#"zombie"].health) ? level.var_41dd92fd[#"zombie"].health : 100);
	zm_round_logic::set_round_number(target_round);
	enemies = getaiteamarray(level.zombie_team);
	if(isdefined(enemies))
	{
		for(i = 0; i < enemies.size; i++)
		{
			enemy = enemies[i];
			if(zm_utility::is_magic_bullet_shield_enabled(enemy))
			{
				enemy util::stop_magic_bullet_shield();
			}
			enemy.allowdeath = 1;
			enemy kill(undefined, undefined, undefined, undefined, undefined, 1);
		}
	}
	wait(5);
	corpses = getcorpsearray();
	foreach(corpse in corpses)
	{
		if(isactorcorpse(corpse))
		{
			corpse delete();
		}
	}
}

/*
	Name: make_supersprinter
	Namespace: zm_game_module
	Checksum: 0x4E80C545
	Offset: 0x9F8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function make_supersprinter()
{
	self zombie_utility::set_zombie_run_cycle("super_sprint");
}

/*
	Name: create_fireworks
	Namespace: zm_game_module
	Checksum: 0xEFAA1F32
	Offset: 0xA28
	Size: 0x128
	Parameters: 4
	Flags: None
*/
function create_fireworks(launch_spots, min_wait, max_wait, randomize)
{
	level endon(#"stop_fireworks");
	while(true)
	{
		if(is_true(randomize))
		{
			launch_spots = array::randomize(launch_spots);
		}
		foreach(spot in launch_spots)
		{
			level thread fireworks_launch(spot);
			wait(randomfloatrange(min_wait, max_wait));
		}
		wait(randomfloatrange(min_wait, max_wait));
	}
}

/*
	Name: fireworks_launch
	Namespace: zm_game_module
	Checksum: 0xCF6CC710
	Offset: 0xB58
	Size: 0x2BC
	Parameters: 1
	Flags: Linked
*/
function fireworks_launch(launch_spot)
{
	firework = spawn("script_model", launch_spot.origin + (randomintrange(-60, 60), randomintrange(-60, 60), 0));
	firework setmodel(#"tag_origin");
	util::wait_network_frame();
	playfxontag(level._effect[#"fw_trail_cheap"], firework, "tag_origin");
	firework playloopsound(#"zmb_souls_loop", 0.75);
	dest = launch_spot;
	while(isdefined(dest) && isdefined(dest.target))
	{
		random_offset = (randomintrange(-60, 60), randomintrange(-60, 60), 0);
		new_dests = struct::get_array(dest.target, "targetname");
		new_dest = array::random(new_dests);
		dest = new_dest;
		dist = distance(new_dest.origin + random_offset, firework.origin);
		time = dist / 700;
		firework moveto(new_dest.origin + random_offset, time);
		firework waittill(#"movedone");
	}
	firework playsound(#"zmb_souls_end");
	playfx(level._effect[#"fw_pre_burst"], firework.origin);
	firework delete();
}

