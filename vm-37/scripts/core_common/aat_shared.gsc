#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace aat;

/*
	Name: __init__system__
	Namespace: aat
	Checksum: 0xBEB64231
	Offset: 0x198
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"aat", &function_70a657d8, &finalize_clientfields, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: aat
	Checksum: 0x9AC316B4
	Offset: 0x1F0
	Size: 0x204
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	if(!isdefined(level.aat))
	{
		level.aat = [];
	}
	clientfield::register("toplayer", "rob_ammo_mod_ready", 1, 1, "int");
	level.aat[#"none"] = spawnstruct();
	level.aat[#"none"].name = "none";
	level.aat_reroll = [];
	level.var_bdba6ee8 = [];
	callback::on_connect(&on_player_connect);
	callback::on_ai_damage(&on_ai_damage);
	callback::function_33f0ddd3(&function_33f0ddd3);
	spawners = getspawnerarray();
	foreach(spawner in spawners)
	{
		spawner spawner::add_spawn_function(&aat_cooldown_init);
	}
	level.aat_exemptions = [];
	/#
		level thread setup_devgui();
	#/
}

/*
	Name: function_2b3bcce0
	Namespace: aat
	Checksum: 0xED6CB4CE
	Offset: 0x400
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_2b3bcce0()
{
	if(!isdefined(level.var_e44e90d6))
	{
		return;
	}
	foreach(call in level.var_e44e90d6)
	{
		[[call]]();
	}
}

/*
	Name: function_571fceb
	Namespace: aat
	Checksum: 0x73AEA57C
	Offset: 0x498
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_571fceb(aat_name, main)
{
	if(!isdefined(level.var_e44e90d6))
	{
		level.var_e44e90d6 = [];
	}
	/#
		if(isdefined(level.var_e44e90d6[aat_name]))
		{
			println(("" + aat_name) + "");
		}
	#/
	level.var_e44e90d6[aat_name] = main;
}

/*
	Name: on_player_connect
	Namespace: aat
	Checksum: 0x983C225F
	Offset: 0x528
	Size: 0xB8
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_connect()
{
	self.aat = [];
	self.aat_cooldown_start = [];
	foreach(key, v in level.aat)
	{
		self.aat_cooldown_start[key] = 0;
	}
	self thread watch_weapon_changes();
	/#
	#/
}

/*
	Name: function_33f0ddd3
	Namespace: aat
	Checksum: 0xFA66E19F
	Offset: 0x5E8
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_33f0ddd3(s_event)
{
	if(s_event.event === "take_weapon" && isdefined(s_event.weapon))
	{
		weapon = function_702fb333(s_event.weapon);
		if(isdefined(self.aat[weapon]))
		{
			self remove(weapon);
		}
	}
}

/*
	Name: setup_devgui
	Namespace: aat
	Checksum: 0x14AEBCCF
	Offset: 0x680
	Size: 0x19C
	Parameters: 1
	Flags: None
*/
function setup_devgui(var_e73fddff)
{
	/#
		if(!isdefined(var_e73fddff))
		{
			var_e73fddff = "";
		}
		waittillframeend();
		setdvar(#"aat_acquire_devgui", "");
		aat_devgui_base = var_e73fddff;
		foreach(key, v in level.aat)
		{
			if(key != "")
			{
				name = function_9e72a96(key);
				adddebugcommand((((((aat_devgui_base + name) + "") + "") + "") + name) + "");
			}
		}
		adddebugcommand(((((aat_devgui_base + "") + "") + "") + "") + "");
		level thread aat_devgui_think();
	#/
}

/*
	Name: aat_devgui_think
	Namespace: aat
	Checksum: 0x6DAEC7E5
	Offset: 0x828
	Size: 0x278
	Parameters: 0
	Flags: Private
*/
function private aat_devgui_think()
{
	/#
		self notify("");
		self endon("");
		for(;;)
		{
			aat_name = getdvarstring(#"aat_acquire_devgui");
			if(aat_name != "")
			{
				for(i = 0; i < level.players.size; i++)
				{
					if(aat_name == "")
					{
						if(sessionmodeiszombiesgame())
						{
							weapon = level.players[i] getcurrentweapon();
							item = level.players[i] item_inventory::function_230ceec4(weapon);
							if(isdefined(item.aat))
							{
								item.aat = undefined;
							}
						}
						level.players[i] thread remove(level.players[i] getcurrentweapon());
					}
					else
					{
						if(sessionmodeiszombiesgame())
						{
							weapon = level.players[i] getcurrentweapon();
							item = level.players[i] item_inventory::function_230ceec4(weapon);
							if(isdefined(item))
							{
								item.aat = aat_name;
							}
						}
						level.players[i] thread acquire(level.players[i] getcurrentweapon(), aat_name);
					}
					level.players[i] thread aat_set_debug_text(aat_name, 0, 0, 0);
				}
			}
			setdvar(#"aat_acquire_devgui", "");
			wait(0.5);
		}
	#/
}

/*
	Name: aat_set_debug_text
	Namespace: aat
	Checksum: 0x857FDF3B
	Offset: 0xAA8
	Size: 0x202
	Parameters: 4
	Flags: Private
*/
function private aat_set_debug_text(name, success, success_reroll, fail)
{
	/#
		self notify(#"aat_set_debug_text_thread");
		self endon(#"aat_set_debug_text_thread", #"disconnect");
		if(!isdefined(self.aat_debug_text))
		{
			return;
		}
		percentage = "";
		if(isdefined(level.aat[name]) && name != "")
		{
			percentage = level.aat[name].percentage;
		}
		self.aat_debug_text fadeovertime(0.05);
		self.aat_debug_text.alpha = 1;
		self.aat_debug_text settext((("" + name) + "") + percentage);
		if(success)
		{
			self.aat_debug_text.color = (0, 1, 0);
		}
		else
		{
			if(success_reroll)
			{
				self.aat_debug_text.color = vectorscale((1, 0, 1), 0.8);
			}
			else
			{
				if(fail)
				{
					self.aat_debug_text.color = (1, 0, 0);
				}
				else
				{
					self.aat_debug_text.color = (1, 1, 1);
				}
			}
		}
		wait(1);
		self.aat_debug_text fadeovertime(1);
		self.aat_debug_text.color = (1, 1, 1);
		if("" == name)
		{
			self.aat_debug_text.alpha = 0;
		}
	#/
}

/*
	Name: aat_cooldown_init
	Namespace: aat
	Checksum: 0xE1187F7
	Offset: 0xCB8
	Size: 0x90
	Parameters: 0
	Flags: Linked, Private
*/
function private aat_cooldown_init()
{
	self.aat_cooldown_start = [];
	foreach(key, v in level.aat)
	{
		self.aat_cooldown_start[key] = 0;
	}
}

/*
	Name: aat_vehicle_damage_monitor
	Namespace: aat
	Checksum: 0x3232717A
	Offset: 0xD50
	Size: 0xF8
	Parameters: 16
	Flags: Linked
*/
function aat_vehicle_damage_monitor(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	willbekilled = (self.health - weapon) <= 0;
	if(is_true(level.aat_in_use))
	{
		self thread aat_response(willbekilled, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
	}
	return weapon;
}

/*
	Name: function_3895d220
	Namespace: aat
	Checksum: 0x7704B842
	Offset: 0xE50
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function function_3895d220(weapon)
{
	if(isdefined(weapon))
	{
		if(weapon.isaltmode)
		{
			weapon = weapon.altweapon;
		}
		if(weapon.inventorytype == "dwlefthand")
		{
			weapon = weapon.dualwieldweapon;
		}
		weapon = weapon.rootweapon;
	}
	return weapon;
}

/*
	Name: on_ai_damage
	Namespace: aat
	Checksum: 0xFB7755AD
	Offset: 0xEC0
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function on_ai_damage(params)
{
	var_43cad97a = params.idamage > self.health;
	aat_response(var_43cad97a, params.einflictor, params.eattacker, params.idamage, params.idflags, params.smeansofdeath, params.weapon, params.var_fd90b0bb, params.vpoint, params.vdir, params.shitloc, params.psoffsettime, params.boneindex, params.surfacetype);
	name = params.eattacker.aat[function_702fb333(params.weapon)];
	if(isdefined(name) && var_43cad97a)
	{
		if(isdefined(level.aat[name].var_de81baf2) && var_43cad97a)
		{
			self thread [[level.aat[name].var_de81baf2]](params.idamage, params.eattacker, params.weapon);
		}
	}
}

/*
	Name: aat_response
	Namespace: aat
	Checksum: 0x3CF815F8
	Offset: 0x1018
	Size: 0x7BC
	Parameters: 14
	Flags: Linked
*/
function aat_response(death, inflictor, attacker, damage, flags, mod, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(!isplayer(vdir) || !isdefined(vdir.aat) || !isdefined(psoffsettime))
	{
		return;
	}
	if(psoffsettime.weapclass !== #"rocketlauncher" && shitloc != "MOD_PISTOL_BULLET" && shitloc != "MOD_RIFLE_BULLET" && shitloc != "MOD_GRENADE" && shitloc != "MOD_PROJECTILE" && shitloc != "MOD_EXPLOSIVE" && shitloc != "MOD_IMPACT" && (shitloc != "MOD_MELEE" || !is_true(level.var_9d1d502c)))
	{
		return;
	}
	if(is_true(level.var_9d1d502c) && isdefined(level.var_37c36b82) && shitloc == "MOD_MELEE")
	{
		if(![[level.var_37c36b82]](psoffsettime))
		{
			return;
		}
	}
	name = vdir.aat[function_702fb333(psoffsettime)];
	if(!isdefined(name))
	{
		return;
	}
	if(is_true(vpoint) && !is_true(level.aat[name].occurs_on_death))
	{
		return;
	}
	if(!isdefined(self.archetype))
	{
		return;
	}
	if(is_true(self.var_dd6fe31f))
	{
		return;
	}
	if(is_true(self.var_69a981e6))
	{
		return;
	}
	if(is_true(self.aat_turned))
	{
		return;
	}
	if(is_true(level.aat[name].immune_trigger[self.archetype]))
	{
		return;
	}
	now = float(gettime()) / 1000;
	if(isdefined(level.var_a839c34d))
	{
		if(self [[level.var_a839c34d]](name, now, vdir))
		{
			return;
		}
	}
	else
	{
		if(isdefined(self.aat_cooldown_start) && now <= (self.aat_cooldown_start[name] + level.aat[name].cooldown_time_entity))
		{
			return;
		}
		if(now <= (vdir.aat_cooldown_start[name] + level.aat[name].cooldown_time_attacker))
		{
			return;
		}
		if(now <= (level.aat[name].cooldown_time_global_start + level.aat[name].cooldown_time_global))
		{
			return;
		}
	}
	if(isdefined(level.aat[name].validation_func))
	{
		if(![[level.aat[name].validation_func]]())
		{
			return;
		}
	}
	success = 0;
	reroll_icon = undefined;
	percentage = level.aat[name].percentage;
	if(isdefined(level.var_bdba6ee8[psoffsettime]))
	{
		if(level.var_bdba6ee8[psoffsettime] < percentage)
		{
			percentage = level.var_bdba6ee8[psoffsettime];
		}
	}
	if(isdefined(vdir.var_2defbefd))
	{
		percentage = vdir.var_2defbefd;
	}
	/#
		aat_percentage_override = getdvarfloat(#"scr_aat_percentage_override", 0);
		if(aat_percentage_override > 0)
		{
			percentage = aat_percentage_override;
		}
	#/
	if(percentage >= randomfloat(1))
	{
		success = 1;
		/#
			vdir thread aat_set_debug_text(name, 1, 0, 0);
		#/
	}
	if(!success)
	{
		keys = getarraykeys(level.aat_reroll);
		keys = array::randomize(keys);
		foreach(key in keys)
		{
			if(vdir [[level.aat_reroll[key].active_func]]())
			{
				for(i = 0; i < level.aat_reroll[key].count; i++)
				{
					if(percentage >= randomfloat(1))
					{
						success = 1;
						reroll_icon = level.aat_reroll[key].damage_feedback_icon;
						/#
							vdir thread aat_set_debug_text(name, 0, 1, 0);
						#/
						break;
					}
				}
			}
			if(success)
			{
				break;
			}
		}
	}
	if(!success)
	{
		/#
			vdir thread aat_set_debug_text(name, 0, 0, 1);
		#/
		return;
	}
	level.aat[name].cooldown_time_global_start = now;
	vdir.aat_cooldown_start[name] = now;
	self thread [[level.aat[name].result_func]](vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
	if(isplayer(vdir))
	{
		vdir clientfield::set_to_player("rob_ammo_mod_ready", 0);
		vdir thread function_45db1b8a(name);
		vdir playlocalsound(level.aat[name].damage_feedback_sound);
	}
}

/*
	Name: function_45db1b8a
	Namespace: aat
	Checksum: 0xF653667E
	Offset: 0x17E0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_45db1b8a(name)
{
	self notify("61aa3b4ea1281053");
	self endon("61aa3b4ea1281053");
	self endon(#"death");
	while(true)
	{
		now = float(gettime()) / 1000;
		if(now >= (self.aat_cooldown_start[name] + level.aat[name].cooldown_time_attacker))
		{
			self clientfield::set_to_player("rob_ammo_mod_ready", 1);
			return;
		}
		wait(1);
	}
}

/*
	Name: register
	Namespace: aat
	Checksum: 0xFDC8422C
	Offset: 0x18B0
	Size: 0x69E
	Parameters: 13
	Flags: Linked
*/
function register(name, percentage, cooldown_time_entity, cooldown_time_attacker, cooldown_time_global, occurs_on_death, result_func, damage_feedback_icon, damage_feedback_sound, validation_func, element, var_de81baf2, var_68a3f665)
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	if(!isdefined(level.aat))
	{
		level.aat = [];
	}
	/#
		assert(!is_false(level.aat_initializing), "");
	#/
	/#
		assert(isdefined(name), "");
	#/
	/#
		assert("" != name, ("" + "") + "");
	#/
	/#
		assert(!isdefined(level.aat[name]), ("" + name) + "");
	#/
	/#
		assert(isdefined(percentage), ("" + name) + "");
	#/
	/#
		assert(0 <= percentage && 1 > percentage, ("" + name) + "");
	#/
	/#
		assert(isdefined(cooldown_time_entity), ("" + name) + "");
	#/
	/#
		assert(0 <= cooldown_time_entity, ("" + name) + "");
	#/
	/#
		assert(isdefined(cooldown_time_entity), ("" + name) + "");
	#/
	/#
		assert(0 <= cooldown_time_entity, ("" + name) + "");
	#/
	/#
		assert(isdefined(cooldown_time_global), ("" + name) + "");
	#/
	/#
		assert(0 <= cooldown_time_global, ("" + name) + "");
	#/
	/#
		assert(isdefined(occurs_on_death), ("" + name) + "");
	#/
	/#
		assert(isdefined(result_func), ("" + name) + "");
	#/
	/#
		assert(isdefined(damage_feedback_icon), ("" + name) + "");
	#/
	/#
		assert(isstring(damage_feedback_icon), ("" + name) + "");
	#/
	/#
		assert(isdefined(damage_feedback_sound), ("" + name) + "");
	#/
	/#
		assert(isstring(damage_feedback_sound), ("" + name) + "");
	#/
	level.aat[name] = spawnstruct();
	level.aat[name].name = name;
	level.aat[name].var_33c87f51 = function_129f6487(name);
	level.aat[name].percentage = percentage;
	level.aat[name].cooldown_time_entity = cooldown_time_entity;
	level.aat[name].cooldown_time_attacker = cooldown_time_attacker;
	level.aat[name].cooldown_time_global = cooldown_time_global;
	level.aat[name].cooldown_time_global_start = 0;
	level.aat[name].occurs_on_death = occurs_on_death;
	level.aat[name].result_func = result_func;
	level.aat[name].damage_feedback_icon = damage_feedback_icon;
	level.aat[name].damage_feedback_sound = damage_feedback_sound;
	level.aat[name].validation_func = validation_func;
	level.aat[name].immune_trigger = [];
	level.aat[name].immune_result_direct = [];
	level.aat[name].immune_result_indirect = [];
	level.aat[name].var_de81baf2 = var_de81baf2;
	level.aat[name].var_68a3f665 = var_68a3f665;
	if(!isdefined(level.var_7c5fd6a4))
	{
		level.var_7c5fd6a4 = [];
	}
	level.var_7c5fd6a4[hash(name)] = name;
	if(isdefined(element))
	{
		level.aat[name].element = element;
	}
}

/*
	Name: register_immunity
	Namespace: aat
	Checksum: 0x3D597367
	Offset: 0x1F58
	Size: 0x200
	Parameters: 5
	Flags: None
*/
function register_immunity(name, archetype, immune_trigger, immune_result_direct, immune_result_indirect)
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	while(level.aat_initializing !== 0)
	{
		waitframe(1);
	}
	/#
		assert(isdefined(name), "");
	#/
	/#
		assert(isdefined(archetype), "");
	#/
	/#
		assert(isdefined(immune_trigger), "");
	#/
	/#
		assert(isdefined(immune_result_direct), "");
	#/
	/#
		assert(isdefined(immune_result_indirect), "");
	#/
	if(!isdefined(level.aat[name].immune_trigger))
	{
		level.aat[name].immune_trigger = [];
	}
	if(!isdefined(level.aat[name].immune_result_direct))
	{
		level.aat[name].immune_result_direct = [];
	}
	if(!isdefined(level.aat[name].immune_result_indirect))
	{
		level.aat[name].immune_result_indirect = [];
	}
	level.aat[name].immune_trigger[archetype] = immune_trigger;
	level.aat[name].immune_result_direct[archetype] = immune_result_direct;
	level.aat[name].immune_result_indirect[archetype] = immune_result_indirect;
}

/*
	Name: finalize_clientfields
	Namespace: aat
	Checksum: 0xC51AEEB3
	Offset: 0x2160
	Size: 0x180
	Parameters: 0
	Flags: Linked
*/
function finalize_clientfields()
{
	/#
		println("");
	#/
	if(isdefined(level.aat) && level.aat.size > 1)
	{
		array::alphabetize(level.aat);
		i = 0;
		foreach(aat in level.aat)
		{
			aat.clientfield_index = i;
			i++;
			/#
				println("" + aat.name);
			#/
		}
		n_bits = getminbitcountfornum(level.aat.size - 1);
		clientfield::register("toplayer", "aat_current", 1, n_bits, "int");
	}
	level.aat_initializing = 0;
}

/*
	Name: register_aat_exemption
	Namespace: aat
	Checksum: 0x27692947
	Offset: 0x22E8
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function register_aat_exemption(weapon)
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	weapon = function_702fb333(weapon);
	level.aat_exemptions[weapon] = 1;
}

/*
	Name: is_exempt_weapon
	Namespace: aat
	Checksum: 0xEE1628EA
	Offset: 0x2340
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function is_exempt_weapon(weapon)
{
	if(!is_true(level.aat_in_use))
	{
		return 0;
	}
	weapon = function_702fb333(weapon);
	return isdefined(level.aat_exemptions[weapon]);
}

/*
	Name: register_reroll
	Namespace: aat
	Checksum: 0x9B555644
	Offset: 0x2398
	Size: 0x26A
	Parameters: 4
	Flags: None
*/
function register_reroll(name, count, active_func, damage_feedback_icon)
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	/#
		assert(isdefined(name), "");
	#/
	/#
		assert("" != name, ("" + "") + "");
	#/
	/#
		assert(!isdefined(level.aat[name]), ("" + name) + "");
	#/
	/#
		assert(isdefined(count), ("" + name) + "");
	#/
	/#
		assert(0 < count, ("" + name) + "");
	#/
	/#
		assert(isdefined(active_func), ("" + name) + "");
	#/
	/#
		assert(isdefined(damage_feedback_icon), ("" + name) + "");
	#/
	/#
		assert(isstring(damage_feedback_icon), ("" + name) + "");
	#/
	level.aat_reroll[name] = spawnstruct();
	level.aat_reroll[name].name = name;
	level.aat_reroll[name].count = count;
	level.aat_reroll[name].active_func = active_func;
	level.aat_reroll[name].damage_feedback_icon = damage_feedback_icon;
}

/*
	Name: function_702fb333
	Namespace: aat
	Checksum: 0xAA69F04E
	Offset: 0x2610
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_702fb333(weapon)
{
	if(!is_true(level.aat_in_use))
	{
		return undefined;
	}
	if(isdefined(level.var_ee5c0b6e))
	{
		weapon = self [[level.var_ee5c0b6e]](weapon);
		return weapon;
	}
	weapon = function_3895d220(weapon);
	return weapon;
}

/*
	Name: getaatonweapon
	Namespace: aat
	Checksum: 0x4DEC90A4
	Offset: 0x2690
	Size: 0x110
	Parameters: 2
	Flags: Linked
*/
function getaatonweapon(weapon, var_a217d0c1)
{
	if(!isdefined(var_a217d0c1))
	{
		var_a217d0c1 = 0;
	}
	weapon = function_702fb333(weapon);
	if(!isdefined(weapon) || weapon == level.weaponnone || !is_true(level.aat_in_use) || is_exempt_weapon(weapon) || (!isdefined(self.aat) || !isdefined(self.aat[weapon])) || !isdefined(level.aat[self.aat[weapon]]))
	{
		return undefined;
	}
	if(var_a217d0c1)
	{
		return self.aat[weapon];
	}
	return level.aat[self.aat[weapon]];
}

/*
	Name: acquire
	Namespace: aat
	Checksum: 0xD51F9502
	Offset: 0x27A8
	Size: 0x306
	Parameters: 3
	Flags: Linked
*/
function acquire(weapon, name, var_77cf85b7)
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	/#
		assert(isdefined(weapon), "");
	#/
	/#
		assert(weapon != level.weaponnone, "");
	#/
	weapon_instance = weapon;
	weapon = function_702fb333(weapon);
	if(is_exempt_weapon(weapon))
	{
		return;
	}
	if(isdefined(name))
	{
		/#
			assert("" != name, ("" + "") + "");
		#/
		/#
			assert(isdefined(level.aat[name]), ("" + name) + "");
		#/
		self.aat[weapon] = name;
	}
	else
	{
		keys = getarraykeys(level.aat);
		arrayremovevalue(keys, hash("none"));
		if(isdefined(self.aat[weapon]))
		{
			arrayremovevalue(keys, self.aat[weapon]);
		}
		if(isdefined(var_77cf85b7))
		{
			arrayremovevalue(keys, hash(var_77cf85b7));
		}
		if(keys.size)
		{
			rand = randomint(keys.size);
			name = keys[rand];
			self.aat[weapon] = name;
		}
	}
	if(weapon == function_702fb333(self getcurrentweapon()))
	{
		self clientfield::set_to_player("aat_current", level.aat[self.aat[weapon]].clientfield_index);
	}
	self clientfield::set_to_player("rob_ammo_mod_ready", 1);
	self notify(#"hash_4de2d5115dc310e2");
}

/*
	Name: remove
	Namespace: aat
	Checksum: 0x37CE516
	Offset: 0x2AB8
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function remove(weapon)
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	/#
		assert(isdefined(weapon), "");
	#/
	/#
		assert(weapon != level.weaponnone, "");
	#/
	weapon_instance = weapon;
	weapon = function_702fb333(weapon);
	self.aat[weapon] = undefined;
	self function_bf3044dc(weapon_instance, 0);
}

/*
	Name: watch_weapon_changes
	Namespace: aat
	Checksum: 0xD0F12D36
	Offset: 0x2B90
	Size: 0x148
	Parameters: 0
	Flags: Linked
*/
function watch_weapon_changes()
{
	self endon(#"disconnect");
	while(isdefined(self))
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_change");
		weapon = waitresult.weapon;
		if(sessionmodeiszombiesgame())
		{
			item = item_inventory::function_230ceec4(weapon);
			if(isdefined(item.aat))
			{
				name = item.aat;
			}
			else
			{
				name = "none";
			}
		}
		else
		{
			weapon = function_702fb333(weapon);
			name = "none";
			if(isdefined(self.aat[weapon]))
			{
				name = self.aat[weapon];
			}
		}
		self clientfield::set_to_player("aat_current", level.aat[name].clientfield_index);
	}
}

/*
	Name: has_aat
	Namespace: aat
	Checksum: 0xC721047A
	Offset: 0x2CE0
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function has_aat(w_current)
{
	if(!is_true(level.aat_in_use))
	{
		return false;
	}
	w_current = function_702fb333(w_current);
	if(isdefined(self.aat) && isdefined(self.aat[w_current]))
	{
		return true;
	}
	return false;
}

/*
	Name: function_7a12b737
	Namespace: aat
	Checksum: 0x209D12A3
	Offset: 0x2D50
	Size: 0x1DC
	Parameters: 2
	Flags: None
*/
function function_7a12b737(stat_name, amount)
{
	if(!isdefined(amount))
	{
		amount = 1;
	}
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	/#
		assert(ishash(stat_name), "");
	#/
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	self stats::function_dad108fa(stat_name, amount);
	/#
		var_ba1fb8c1 = self stats::get_stat_global(stat_name);
		if(isdefined(var_ba1fb8c1))
		{
			if(isdefined(self.entity_num))
			{
				println(((("" + self.entity_num) + "") + function_9e72a96(stat_name) + "") + var_ba1fb8c1);
			}
			else
			{
				println((("" + function_9e72a96(stat_name)) + "") + var_ba1fb8c1);
			}
		}
		if(!isdefined(var_ba1fb8c1))
		{
			println((("" + self.entity_num) + "") + function_9e72a96(stat_name) + "");
		}
	#/
}

