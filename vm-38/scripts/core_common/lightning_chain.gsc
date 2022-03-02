#using script_3f9e0dc8454d98e1;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_net.gsc;

#namespace lightning_chain;

/*
	Name: function_561f1360
	Namespace: lightning_chain
	Checksum: 0xC310F24A
	Offset: 0x1D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_561f1360()
{
	level notify(158067436);
}

/*
	Name: function_89f2df9
	Namespace: lightning_chain
	Checksum: 0x74661089
	Offset: 0x1F8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"lightning_chain", &init, undefined, undefined, undefined);
}

/*
	Name: init
	Namespace: lightning_chain
	Checksum: 0x8D5EC500
	Offset: 0x240
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level._effect[#"tesla_bolt"] = "zm_ai/fx8_elec_bolt";
	level._effect[#"tesla_shock"] = "zm_ai/fx8_elec_shock";
	level._effect[#"tesla_shock_secondary"] = "zm_ai/fx8_elec_bolt";
	level._effect[#"tesla_shock_nonfatal"] = "zm_ai/fx8_elec_shock_os";
	level._effect[#"tesla_shock_eyes"] = "zm_ai/fx8_elec_shock_eyes";
	level.default_lightning_chain_params = create_lightning_chain_params();
	clientfield::register("actor", "lc_fx", 1, 2, "int");
	clientfield::register("vehicle", "lc_fx", 1, 2, "int");
	clientfield::register("actor", "lc_death_fx", 1, 2, "int");
	clientfield::register("vehicle", "lc_death_fx", 1, 2, "int");
	callback::on_connect(&on_player_connect);
}

/*
	Name: create_lightning_chain_params
	Namespace: lightning_chain
	Checksum: 0x4DA8B49D
	Offset: 0x3E8
	Size: 0x21A
	Parameters: 14
	Flags: Linked
*/
function create_lightning_chain_params(max_arcs, max_enemies_killed, radius_start, radius_decay, head_gib_chance, arc_travel_time, kills_for_powerup, min_fx_distance, network_death_choke, should_kill_enemies, clientside_fx, arc_fx_sound, no_fx, prevent_weapon_kill_credit)
{
	if(!isdefined(max_arcs))
	{
		max_arcs = 5;
	}
	if(!isdefined(max_enemies_killed))
	{
		max_enemies_killed = 10;
	}
	if(!isdefined(radius_start))
	{
		radius_start = 300;
	}
	if(!isdefined(radius_decay))
	{
		radius_decay = 20;
	}
	if(!isdefined(head_gib_chance))
	{
		head_gib_chance = 75;
	}
	if(!isdefined(arc_travel_time))
	{
		arc_travel_time = 0.11;
	}
	if(!isdefined(kills_for_powerup))
	{
		kills_for_powerup = 10;
	}
	if(!isdefined(min_fx_distance))
	{
		min_fx_distance = 128;
	}
	if(!isdefined(network_death_choke))
	{
		network_death_choke = 4;
	}
	if(!isdefined(should_kill_enemies))
	{
		should_kill_enemies = 1;
	}
	if(!isdefined(clientside_fx))
	{
		clientside_fx = 1;
	}
	if(!isdefined(arc_fx_sound))
	{
		arc_fx_sound = undefined;
	}
	if(!isdefined(no_fx))
	{
		no_fx = 0;
	}
	if(!isdefined(prevent_weapon_kill_credit))
	{
		prevent_weapon_kill_credit = 0;
	}
	lcp = spawnstruct();
	lcp.max_arcs = max_arcs;
	lcp.max_enemies_killed = max_enemies_killed;
	lcp.radius_start = radius_start;
	lcp.radius_decay = radius_decay;
	lcp.head_gib_chance = head_gib_chance;
	lcp.arc_travel_time = arc_travel_time;
	lcp.kills_for_powerup = kills_for_powerup;
	lcp.min_fx_distance = min_fx_distance;
	lcp.network_death_choke = network_death_choke;
	lcp.should_kill_enemies = should_kill_enemies;
	lcp.clientside_fx = clientside_fx;
	lcp.arc_fx_sound = arc_fx_sound;
	lcp.no_fx = no_fx;
	lcp.prevent_weapon_kill_credit = prevent_weapon_kill_credit;
	return lcp;
}

/*
	Name: on_player_connect
	Namespace: lightning_chain
	Checksum: 0x40E417BF
	Offset: 0x610
	Size: 0x42
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_connect()
{
	self endon(#"death");
	self waittill(#"spawned_player");
	self.tesla_network_death_choke = 0;
	self.tesla_arc_count = 0;
}

/*
	Name: arc_damage
	Namespace: lightning_chain
	Checksum: 0xA603FFFD
	Offset: 0x660
	Size: 0x2A4
	Parameters: 4
	Flags: Linked
*/
function arc_damage(source_enemy, player, arc_num, params)
{
	if(!isdefined(params))
	{
		params = level.default_lightning_chain_params;
	}
	player endon(#"disconnect");
	if(!isdefined(player.tesla_network_death_choke))
	{
		player.tesla_network_death_choke = 0;
	}
	if(!isdefined(player.tesla_enemies_hit))
	{
		player.tesla_enemies_hit = 0;
	}
	/#
		function_df47c3e8((("" + arc_num) + "") + player.tesla_enemies_hit);
	#/
	lc_flag_hit(self, 1);
	radius_decay = params.radius_decay * arc_num;
	origin = self gettagorigin("j_head");
	if(!isdefined(origin))
	{
		origin = self.origin;
	}
	enemies = lc_get_enemies_in_area(origin, params.radius_start - radius_decay, player);
	util::wait_network_frame();
	lc_flag_hit(enemies, 1);
	self thread lc_do_damage(source_enemy, arc_num, player, params);
	/#
		function_df47c3e8((("" + enemies.size) + "") + arc_num);
	#/
	for(i = 0; i < enemies.size; i++)
	{
		if(!isdefined(enemies[i]) || enemies[i] == self)
		{
			continue;
		}
		if(lc_end_arc_damage(arc_num + 1, player.tesla_enemies_hit, params))
		{
			lc_flag_hit(enemies[i], 0);
			continue;
		}
		player.tesla_enemies_hit++;
		enemies[i] arc_damage(self, player, arc_num + 1, params);
	}
}

/*
	Name: arc_damage_ent
	Namespace: lightning_chain
	Checksum: 0x9EF95FB8
	Offset: 0x910
	Size: 0x74
	Parameters: 3
	Flags: Linked
*/
function arc_damage_ent(player, arc_num, params)
{
	if(!isdefined(params))
	{
		params = level.default_lightning_chain_params;
	}
	lc_flag_hit(self, 1, params.var_871d3454);
	self thread lc_do_damage(self, arc_num, player, params);
}

/*
	Name: lc_end_arc_damage
	Namespace: lightning_chain
	Checksum: 0x60ED724D
	Offset: 0x990
	Size: 0xE4
	Parameters: 3
	Flags: Linked, Private
*/
function private lc_end_arc_damage(arc_num, enemies_hit_num, params)
{
	if(arc_num >= params.max_arcs)
	{
		/#
			function_df47c3e8("");
		#/
		return true;
	}
	if(enemies_hit_num >= params.max_enemies_killed)
	{
		/#
			function_df47c3e8("");
		#/
		return true;
	}
	radius_decay = params.radius_decay * arc_num;
	if((params.radius_start - radius_decay) <= 0)
	{
		/#
			function_df47c3e8("");
		#/
		return true;
	}
	return false;
}

/*
	Name: lc_get_enemies_in_area
	Namespace: lightning_chain
	Checksum: 0x853C14E5
	Offset: 0xA80
	Size: 0x210
	Parameters: 3
	Flags: Linked, Private
*/
function private lc_get_enemies_in_area(origin, distance, player)
{
	/#
		level thread lc_debug_arc(origin, distance);
	#/
	distance_squared = distance * distance;
	enemies = [];
	if(!isdefined(player.tesla_enemies))
	{
		player.tesla_enemies = zombie_utility::get_round_enemy_array();
		if(player.tesla_enemies.size > 0)
		{
			player.tesla_enemies = array::get_all_closest(origin, player.tesla_enemies);
		}
	}
	zombies = player.tesla_enemies;
	if(isdefined(zombies))
	{
		for(i = 0; i < zombies.size; i++)
		{
			if(!isdefined(zombies[i]))
			{
				continue;
			}
			if(is_true(zombies[i].lightning_chain_immune))
			{
				continue;
			}
			test_origin = zombies[i] gettagorigin("j_head");
			if(!isdefined(test_origin))
			{
				test_origin = zombies[i].origin;
			}
			if(zombies[i] ai::is_stunned())
			{
				continue;
			}
			if(!is_true(zombies[i].allowdeath))
			{
				continue;
			}
			if(distancesquared(origin, test_origin) > distance_squared)
			{
				continue;
			}
			if(!bullettracepassed(origin, test_origin, 0, undefined))
			{
				continue;
			}
			enemies[enemies.size] = zombies[i];
		}
	}
	return enemies;
}

/*
	Name: lc_flag_hit
	Namespace: lightning_chain
	Checksum: 0x40D2459E
	Offset: 0xC98
	Size: 0xF4
	Parameters: 3
	Flags: Linked, Private
*/
function private lc_flag_hit(enemy, hit, var_ab5b905e)
{
	if(isdefined(enemy))
	{
		if(isarray(enemy))
		{
			for(i = 0; i < enemy.size; i++)
			{
				if(isdefined(enemy[i]))
				{
					if(hit)
					{
						enemy[i] ai::stun(var_ab5b905e);
						continue;
					}
					enemy[i] ai::function_62795e55();
				}
			}
		}
		else if(isdefined(enemy))
		{
			if(hit)
			{
				enemy ai::stun(var_ab5b905e);
			}
			else
			{
				enemy ai::function_62795e55();
			}
		}
	}
}

/*
	Name: lc_do_damage
	Namespace: lightning_chain
	Checksum: 0xD32E6C20
	Offset: 0xD98
	Size: 0x42C
	Parameters: 4
	Flags: Linked, Private
*/
function private lc_do_damage(source_enemy, arc_num, player, params)
{
	player endon(#"disconnect");
	if(arc_num > 1)
	{
		wait(randomfloatrange(0.2, 0.6) * arc_num);
	}
	if(!isalive(self))
	{
		return;
	}
	if(params.clientside_fx)
	{
		if(arc_num > 1)
		{
			clientfield::set("lc_fx", 2);
		}
		else
		{
			clientfield::set("lc_fx", 1);
		}
	}
	if(!isalive(self))
	{
		return;
	}
	if(isdefined(source_enemy) && source_enemy != self)
	{
		if(player.tesla_arc_count > 3)
		{
			util::wait_network_frame();
			player.tesla_arc_count = 0;
		}
		player.tesla_arc_count++;
		source_enemy lc_play_arc_fx(self, params);
	}
	if(player.tesla_network_death_choke > params.network_death_choke)
	{
		/#
			function_df47c3e8("" + player.tesla_network_death_choke);
		#/
		util::wait_network_frame(2);
		player.tesla_network_death_choke = 0;
	}
	if(!isalive(self))
	{
		return;
	}
	player.tesla_network_death_choke++;
	self lc_play_death_fx(arc_num, params);
	if(!isalive(self))
	{
		return;
	}
	self.tesla_death = params.should_kill_enemies;
	str_mod = (isdefined(params.str_mod) ? params.str_mod : "MOD_UNKNOWN");
	origin = player.origin;
	if(isdefined(source_enemy) && source_enemy != self)
	{
		origin = source_enemy.origin;
	}
	if(!isalive(self))
	{
		return;
	}
	if(params.should_kill_enemies)
	{
		if(isdefined(self.tesla_damage_func))
		{
			self [[self.tesla_damage_func]](origin, player, params);
			return;
		}
		if(is_true(params.prevent_weapon_kill_credit))
		{
			self dodamage(self.health + 666, origin, player, undefined, "none", str_mod, 0, level.weaponnone);
		}
		else
		{
			weapon = level.weaponnone;
			if(isdefined(params.weapon))
			{
				weapon = params.weapon;
			}
			self dodamage(self.health + 666, origin, player, undefined, "none", str_mod, 0, weapon);
		}
	}
	else
	{
		if(isdefined(self.tesla_damage_func))
		{
			self [[self.tesla_damage_func]](origin, player, params);
			return;
		}
		if(isdefined(params.n_damage_max))
		{
			self thread function_915d4fec(params, origin, player);
		}
	}
}

/*
	Name: function_915d4fec
	Namespace: lightning_chain
	Checksum: 0x8247D410
	Offset: 0x11D0
	Size: 0x150
	Parameters: 3
	Flags: Linked, Private
*/
function private function_915d4fec(params, v_origin, player)
{
	if(isdefined(params.var_a9255d36))
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(params.var_a9255d36, #"death");
	}
	weapon = (isdefined(params.weapon) ? params.weapon : level.weaponnone);
	str_mod = (isdefined(params.str_mod) ? params.str_mod : "MOD_UNKNOWN");
	if(isalive(self))
	{
		self dodamage(params.n_damage_max, v_origin, player, undefined, "none", str_mod, 0, weapon);
	}
}

/*
	Name: lc_play_death_fx
	Namespace: lightning_chain
	Checksum: 0xBAC57566
	Offset: 0x1328
	Size: 0x1D0
	Parameters: 2
	Flags: Linked
*/
function lc_play_death_fx(arc_num, params)
{
	tag = "J_SpineUpper";
	fx = "tesla_shock";
	n_fx = 1;
	b_can_clientside = 1;
	if(is_true(self.isdog))
	{
		tag = "J_Spine1";
	}
	if(isdefined(self.teslafxtag))
	{
		b_can_clientside = 0;
		tag = self.teslafxtag;
	}
	else if(self.archetype !== #"zombie")
	{
		tag = "tag_origin";
	}
	if(arc_num > 1)
	{
		fx = "tesla_shock_secondary";
		n_fx = 2;
	}
	if(!params.should_kill_enemies)
	{
		fx = "tesla_shock_nonfatal";
		n_fx = 3;
	}
	if(params.no_fx)
	{
	}
	else
	{
		if(params.clientside_fx && b_can_clientside)
		{
			clientfield::set("lc_death_fx", n_fx);
		}
		else
		{
			zm_net::network_safe_play_fx_on_tag("tesla_death_fx", 2, level._effect[fx], self, tag);
		}
	}
	if(isdefined(self.tesla_head_gib_func) && !self.head_gibbed && params.should_kill_enemies && !is_true(self.no_gib))
	{
		[[self.tesla_head_gib_func]]();
	}
}

/*
	Name: lc_play_arc_fx
	Namespace: lightning_chain
	Checksum: 0xD5E6338F
	Offset: 0x1500
	Size: 0x284
	Parameters: 2
	Flags: Linked
*/
function lc_play_arc_fx(target, params)
{
	if(!isdefined(self) || !isdefined(target))
	{
		wait(params.arc_travel_time);
		return;
	}
	tag = "J_SpineUpper";
	if(is_true(self.isdog))
	{
		tag = "J_Spine1";
	}
	else if(self.archetype !== #"zombie")
	{
		tag = "tag_origin";
	}
	target_tag = "J_SpineUpper";
	if(is_true(target.isdog))
	{
		target_tag = "J_Spine1";
	}
	else if(target.archetype !== #"zombie")
	{
		target_tag = "tag_origin";
	}
	origin = self gettagorigin(tag);
	target_origin = target gettagorigin(target_tag);
	distance_squared = params.min_fx_distance * params.min_fx_distance;
	if(distancesquared(origin, target_origin) < distance_squared)
	{
		/#
			function_df47c3e8("");
		#/
		return;
	}
	fxorg = util::spawn_model("tag_origin", origin);
	fx = playfxontag(level._effect[#"tesla_bolt"], fxorg, "tag_origin");
	if(isdefined(params.arc_fx_sound))
	{
		playsoundatposition(params.arc_fx_sound, fxorg.origin);
	}
	fxorg moveto(target_origin, params.arc_travel_time);
	fxorg waittill(#"movedone");
	fxorg delete();
}

/*
	Name: lc_debug_arc
	Namespace: lightning_chain
	Checksum: 0xA27DA88F
	Offset: 0x1790
	Size: 0x6E
	Parameters: 2
	Flags: Private
*/
function private lc_debug_arc(origin, distance)
{
	/#
		if(getdvarint(#"zombie_debug", 0) != 3)
		{
			return;
		}
		start = gettime();
		while(gettime() < start + 3000)
		{
			waitframe(1);
		}
	#/
}

/*
	Name: function_df47c3e8
	Namespace: lightning_chain
	Checksum: 0xE42B6C77
	Offset: 0x1808
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_df47c3e8(msg)
{
	/#
		if(getdvarint(#"zombie_debug", 0) > 0)
		{
			println("" + msg);
		}
	#/
}

