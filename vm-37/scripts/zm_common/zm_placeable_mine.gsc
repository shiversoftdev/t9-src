#using script_14f4a3c583c77d4b;
#using script_8988fdbc78d6c53;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_placeable_mine;

/*
	Name: function_89f2df9
	Namespace: zm_placeable_mine
	Checksum: 0xF49E945A
	Offset: 0x168
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"placeable_mine", undefined, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_8ac3bea9
	Namespace: zm_placeable_mine
	Checksum: 0xB6E3AA72
	Offset: 0x1B0
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(isdefined(level.placeable_mines))
	{
		level thread replenish_after_rounds();
	}
}

/*
	Name: init_internal
	Namespace: zm_placeable_mine
	Checksum: 0xED3E4068
	Offset: 0x1E8
	Size: 0x78
	Parameters: 0
	Flags: Linked, Private
*/
function private init_internal()
{
	if(isdefined(level.placeable_mines))
	{
		return;
	}
	level.placeable_mines = [];
	level.placeable_mines_on_damage = &placeable_mine_damage;
	level.pickup_placeable_mine = &pickup_placeable_mine;
	level.pickup_placeable_mine_trigger_listener = &pickup_placeable_mine_trigger_listener;
	level.placeable_mine_planted_callbacks = [];
}

/*
	Name: get_first_available
	Namespace: zm_placeable_mine
	Checksum: 0x18D72290
	Offset: 0x268
	Size: 0xA6
	Parameters: 0
	Flags: None
*/
function get_first_available()
{
	if(isdefined(zm_loadout::function_5a5a742a("placeable_mine")) && zm_loadout::function_5a5a742a("placeable_mine").size > 0)
	{
		str_key = getarraykeys(zm_loadout::function_5a5a742a("placeable_mine"))[0];
		return zm_loadout::function_5a5a742a("placeable_mine")[str_key];
	}
	return level.weaponnone;
}

/*
	Name: add_mine_type
	Namespace: zm_placeable_mine
	Checksum: 0x1D7197B
	Offset: 0x318
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function add_mine_type(mine_name, str_retrieval_prompt)
{
	init_internal();
	zm_loadout::function_e884e095("placeable_mine", str_retrieval_prompt);
	level.placeable_mine_planted_callbacks[str_retrieval_prompt] = [];
}

/*
	Name: add_weapon_to_mine_slot
	Namespace: zm_placeable_mine
	Checksum: 0x301445D1
	Offset: 0x370
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function add_weapon_to_mine_slot(mine_name)
{
	init_internal();
	level.placeable_mines[mine_name] = getweapon(mine_name);
	level.placeable_mine_planted_callbacks[mine_name] = [];
	if(!isdefined(level.placeable_mines_in_name_only))
	{
		level.placeable_mines_in_name_only = [];
	}
	level.placeable_mines_in_name_only[mine_name] = getweapon(mine_name);
}

/*
	Name: set_max_per_player
	Namespace: zm_placeable_mine
	Checksum: 0xF4C27950
	Offset: 0x408
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function set_max_per_player(n_max_per_player)
{
	level.placeable_mines_max_per_player = n_max_per_player;
}

/*
	Name: add_planted_callback
	Namespace: zm_placeable_mine
	Checksum: 0xE79AB61E
	Offset: 0x430
	Size: 0xB2
	Parameters: 2
	Flags: None
*/
function add_planted_callback(fn_planted_cb, wpn_name)
{
	if(!isdefined(level.placeable_mine_planted_callbacks[wpn_name]))
	{
		level.placeable_mine_planted_callbacks[wpn_name] = [];
	}
	else if(!isarray(level.placeable_mine_planted_callbacks[wpn_name]))
	{
		level.placeable_mine_planted_callbacks[wpn_name] = array(level.placeable_mine_planted_callbacks[wpn_name]);
	}
	level.placeable_mine_planted_callbacks[wpn_name][level.placeable_mine_planted_callbacks[wpn_name].size] = fn_planted_cb;
}

/*
	Name: run_planted_callbacks
	Namespace: zm_placeable_mine
	Checksum: 0xC13D8429
	Offset: 0x4F0
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private run_planted_callbacks(e_planter)
{
	foreach(fn in level.placeable_mine_planted_callbacks[self.weapon.name])
	{
		self thread [[fn]](e_planter);
	}
}

/*
	Name: safe_to_plant
	Namespace: zm_placeable_mine
	Checksum: 0x83D7F0F
	Offset: 0x598
	Size: 0x3E
	Parameters: 0
	Flags: Linked, Private
*/
function private safe_to_plant()
{
	if(isdefined(level.placeable_mines_max_per_player) && self.owner.placeable_mines.size >= level.placeable_mines_max_per_player)
	{
		return false;
	}
	return true;
}

/*
	Name: wait_and_detonate
	Namespace: zm_placeable_mine
	Checksum: 0xB1CA073F
	Offset: 0x5E0
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private wait_and_detonate()
{
	wait(0.1);
	self detonate(self.owner);
}

/*
	Name: mine_watch
	Namespace: zm_placeable_mine
	Checksum: 0xEF2DA353
	Offset: 0x618
	Size: 0x188
	Parameters: 1
	Flags: Linked, Private
*/
function private mine_watch(wpn_type)
{
	self endon(#"death");
	self notify(#"mine_watch");
	self endon(#"mine_watch");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"grenade_fire");
		mine = waitresult.projectile;
		fired_weapon = waitresult.weapon;
		if(fired_weapon == wpn_type)
		{
			mine.owner = self;
			mine.team = self.team;
			mine.weapon = fired_weapon;
			self notify(("zmb_enable_" + fired_weapon.name) + "_prompt");
			if(mine safe_to_plant())
			{
				mine run_planted_callbacks(self);
				self zm_stats::increment_client_stat(fired_weapon.name + "_planted");
				self zm_stats::increment_player_stat(fired_weapon.name + "_planted");
			}
			else
			{
				mine thread wait_and_detonate();
			}
		}
	}
}

/*
	Name: is_true_placeable_mine
	Namespace: zm_placeable_mine
	Checksum: 0x81E99CCD
	Offset: 0x7A8
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function is_true_placeable_mine(mine_name)
{
	if(!isdefined(level.placeable_mines_in_name_only))
	{
		return true;
	}
	if(!isdefined(level.placeable_mines_in_name_only[mine_name]))
	{
		return true;
	}
	return false;
}

/*
	Name: setup_for_player
	Namespace: zm_placeable_mine
	Checksum: 0xAE4AB3DB
	Offset: 0x7F0
	Size: 0x15A
	Parameters: 2
	Flags: Linked
*/
function setup_for_player(wpn_type, ui_model)
{
	if(!isdefined(ui_model))
	{
		ui_model = "hudItems.showDpadRight";
	}
	if(!isdefined(self.placeable_mines))
	{
		self.placeable_mines = [];
	}
	if(isdefined(self.last_placeable_mine_uimodel))
	{
		self clientfield::set_player_uimodel(self.last_placeable_mine_uimodel, 0);
	}
	if(is_true_placeable_mine(wpn_type.name))
	{
		self thread mine_watch(wpn_type);
	}
	self giveweapon(wpn_type);
	self zm_loadout::set_player_placeable_mine(wpn_type);
	self setactionslot(4, "weapon", wpn_type);
	startammo = wpn_type.startammo;
	if(startammo)
	{
		self setweaponammostock(wpn_type, startammo);
	}
	if(isdefined(ui_model))
	{
		self clientfield::set_player_uimodel(ui_model, 1);
	}
	self.last_placeable_mine_uimodel = ui_model;
}

/*
	Name: disable_prompt_for_player
	Namespace: zm_placeable_mine
	Checksum: 0xC08B2097
	Offset: 0x958
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function disable_prompt_for_player(wpn_type)
{
	self notify(("zmb_disable_" + wpn_type.name) + "_prompt");
}

/*
	Name: disable_all_prompts_for_player
	Namespace: zm_placeable_mine
	Checksum: 0xB1D45D6C
	Offset: 0x990
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function disable_all_prompts_for_player()
{
	foreach(mine in zm_loadout::function_5a5a742a("placeable_mine"))
	{
		self disable_prompt_for_player(mine);
	}
}

/*
	Name: pickup_placeable_mine
	Namespace: zm_placeable_mine
	Checksum: 0xDD3167A4
	Offset: 0xA30
	Size: 0x264
	Parameters: 0
	Flags: Linked, Private
*/
function private pickup_placeable_mine()
{
	player = self.owner;
	wpn_type = self.weapon;
	if(player zm_utility::is_drinking())
	{
		return;
	}
	current_player_mine = player zm_loadout::get_player_placeable_mine();
	if(current_player_mine != wpn_type)
	{
		player takeweapon(current_player_mine);
	}
	if(!player hasweapon(wpn_type))
	{
		player thread mine_watch(wpn_type);
		player giveweapon(wpn_type);
		player zm_loadout::set_player_placeable_mine(wpn_type);
		player setactionslot(4, "weapon", wpn_type);
		player setweaponammoclip(wpn_type, 0);
		player notify(("zmb_enable_" + wpn_type.name) + "_prompt");
	}
	else
	{
		clip_ammo = player getweaponammoclip(wpn_type);
		clip_max_ammo = wpn_type.clipsize;
		if(clip_ammo >= clip_max_ammo)
		{
			self delete();
			player disable_prompt_for_player(wpn_type);
			return;
		}
	}
	self zm_utility::pick_up();
	clip_ammo = player getweaponammoclip(wpn_type);
	clip_max_ammo = wpn_type.clipsize;
	if(clip_ammo >= clip_max_ammo)
	{
		player disable_prompt_for_player(wpn_type);
	}
	player zm_stats::increment_client_stat(wpn_type.name + "_pickedup");
	player zm_stats::increment_player_stat(wpn_type.name + "_pickedup");
}

/*
	Name: pickup_placeable_mine_trigger_listener
	Namespace: zm_placeable_mine
	Checksum: 0x8AF6C424
	Offset: 0xCA0
	Size: 0x44
	Parameters: 2
	Flags: Linked, Private
*/
function private pickup_placeable_mine_trigger_listener(trigger, player)
{
	self thread pickup_placeable_mine_trigger_listener_enable(trigger, player);
	self thread pickup_placeable_mine_trigger_listener_disable(trigger, player);
}

/*
	Name: pickup_placeable_mine_trigger_listener_enable
	Namespace: zm_placeable_mine
	Checksum: 0xFC410C35
	Offset: 0xCF0
	Size: 0xB8
	Parameters: 2
	Flags: Linked, Private
*/
function private pickup_placeable_mine_trigger_listener_enable(trigger, player)
{
	self endon(#"delete", #"death");
	while(true)
	{
		player waittill(("zmb_enable_" + self.weapon.name) + "_prompt", #"spawned_player");
		if(!isdefined(trigger))
		{
			return;
		}
		trigger triggerenable(1);
		trigger linkto(self);
	}
}

/*
	Name: pickup_placeable_mine_trigger_listener_disable
	Namespace: zm_placeable_mine
	Checksum: 0xC3C0492F
	Offset: 0xDB0
	Size: 0xA8
	Parameters: 2
	Flags: Linked, Private
*/
function private pickup_placeable_mine_trigger_listener_disable(trigger, player)
{
	self endon(#"delete", #"death");
	while(true)
	{
		player waittill(("zmb_disable_" + self.weapon.name) + "_prompt");
		if(!isdefined(trigger))
		{
			return;
		}
		trigger unlink();
		trigger triggerenable(0);
	}
}

/*
	Name: placeable_mine_damage
	Namespace: zm_placeable_mine
	Checksum: 0x62741FA0
	Offset: 0xE60
	Size: 0x1EC
	Parameters: 0
	Flags: Linked, Private
*/
function private placeable_mine_damage()
{
	self endon(#"death");
	self setcandamage(1);
	self.health = 100000;
	self.maxhealth = self.health;
	attacker = undefined;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(!isdefined(self))
		{
			return;
		}
		self.health = self.maxhealth;
		if(!isplayer(waitresult.attacker))
		{
			continue;
		}
		if(isdefined(self.owner) && attacker == self.owner)
		{
			continue;
		}
		if(isdefined(waitresult.attacker.pers) && isdefined(waitresult.attacker.pers[#"team"]) && waitresult.attacker.pers[#"team"] != level.zombie_team)
		{
			continue;
		}
		break;
	}
	if(level.satchelexplodethisframe)
	{
		wait(0.1 + randomfloat(0.4));
	}
	else
	{
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	level.satchelexplodethisframe = 1;
	thread reset_satchel_explode_this_frame();
	self detonate(waitresult.attacker);
}

/*
	Name: reset_satchel_explode_this_frame
	Namespace: zm_placeable_mine
	Checksum: 0x4B8A7628
	Offset: 0x1058
	Size: 0x18
	Parameters: 0
	Flags: Linked, Private
*/
function private reset_satchel_explode_this_frame()
{
	waitframe(1);
	level.satchelexplodethisframe = 0;
}

/*
	Name: replenish_after_rounds
	Namespace: zm_placeable_mine
	Checksum: 0xAAEE3E13
	Offset: 0x1078
	Size: 0x208
	Parameters: 0
	Flags: Linked, Private
*/
function private replenish_after_rounds()
{
	while(true)
	{
		level waittill(#"between_round_over");
		if(isdefined(level.func_custom_placeable_mine_round_replenish))
		{
			[[level.func_custom_placeable_mine_round_replenish]]();
			continue;
		}
		if(!level flag::exists("teleporter_used") || !level flag::get("teleporter_used"))
		{
			players = getplayers();
			for(i = 0; i < players.size; i++)
			{
				foreach(mine in zm_loadout::function_5a5a742a("placeable_mine"))
				{
					if(players[i] zm_loadout::is_player_placeable_mine(mine) && is_true_placeable_mine(mine.name))
					{
						players[i] giveweapon(mine);
						players[i] zm_loadout::set_player_placeable_mine(mine);
						players[i] setactionslot(4, "weapon", mine);
						players[i] setweaponammoclip(mine, 2);
						break;
					}
				}
			}
		}
	}
}

/*
	Name: setup_watchers
	Namespace: zm_placeable_mine
	Checksum: 0xBCCDAB18
	Offset: 0x1288
	Size: 0xD0
	Parameters: 0
	Flags: None
*/
function setup_watchers()
{
	if(isdefined(zm_loadout::function_5a5a742a("placeable_mine")))
	{
		foreach(mine_type in zm_loadout::function_5a5a742a("placeable_mine"))
		{
			weaponobjects::function_e6400478(mine_type.name, &zm_red_challenges_hud_wear, 1);
		}
	}
}

/*
	Name: zm_red_challenges_hud_wear
	Namespace: zm_placeable_mine
	Checksum: 0xF35496AE
	Offset: 0x1360
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function zm_red_challenges_hud_wear(watcher)
{
	watcher.onspawnretrievetriggers = &on_spawn_retrieve_trigger;
	watcher.adjusttriggerorigin = &adjust_trigger_origin;
	watcher.pickup = level.pickup_placeable_mine;
	watcher.pickup_trigger_listener = level.pickup_placeable_mine_trigger_listener;
	watcher.skip_weapon_object_damage = 1;
	watcher.watchforfire = 1;
	watcher.ondetonatecallback = &placeable_mine_detonate;
	watcher.ondamage = level.placeable_mines_on_damage;
}

/*
	Name: on_spawn_retrieve_trigger
	Namespace: zm_placeable_mine
	Checksum: 0xE8DFF16
	Offset: 0x1408
	Size: 0x54
	Parameters: 2
	Flags: Linked, Private
*/
function private on_spawn_retrieve_trigger(watcher, player)
{
	self weaponobjects::function_23b0aea9(watcher, player);
	if(isdefined(self.pickuptrigger))
	{
		self.pickuptrigger sethintlowpriority(0);
	}
}

/*
	Name: adjust_trigger_origin
	Namespace: zm_placeable_mine
	Checksum: 0xE31D717D
	Offset: 0x1468
	Size: 0x26
	Parameters: 1
	Flags: Linked, Private
*/
function private adjust_trigger_origin(origin)
{
	origin = origin + vectorscale((0, 0, 1), 20);
	return origin;
}

/*
	Name: placeable_mine_detonate
	Namespace: zm_placeable_mine
	Checksum: 0x1622CD15
	Offset: 0x1498
	Size: 0xBC
	Parameters: 3
	Flags: Linked, Private
*/
function private placeable_mine_detonate(attacker, weapon, target)
{
	if(target.isemp)
	{
		self delete();
		return;
	}
	if(isdefined(weapon))
	{
		self detonate(weapon);
	}
	else
	{
		if(isdefined(self.owner) && isplayer(self.owner))
		{
			self detonate(self.owner);
		}
		else
		{
			self detonate();
		}
	}
}

