#using script_1c65dbfc2f1c8d8f;
#using script_35598499769dbb3d;
#using script_47fb62300ac0bd60;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace aat_shared;

/*
	Name: function_2466cf93
	Namespace: aat_shared
	Checksum: 0x395F8783
	Offset: 0x1C8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2466cf93()
{
	level notify(1107658620);
}

#namespace aat;

/*
	Name: function_89f2df9
	Namespace: aat
	Checksum: 0xC805F809
	Offset: 0x1E8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"aat", &function_70a657d8, &finalize_clientfields, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: aat
	Checksum: 0xCBFF4BE9
	Offset: 0x240
	Size: 0x22C
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
	clientfield::function_a8bbc967("hud_items.gibDismembermentType", 16000, 3, "int", 0);
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
	Checksum: 0x6A371A64
	Offset: 0x478
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
	Checksum: 0x6B064C31
	Offset: 0x510
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
	Checksum: 0x54985518
	Offset: 0x5A0
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
	Checksum: 0x9CA006C8
	Offset: 0x660
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
	Checksum: 0x2196E1AE
	Offset: 0x6F8
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
	Checksum: 0x154B5B5F
	Offset: 0x8A0
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
							item = level.players[i] namespace_b376ff3f::function_230ceec4(weapon);
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
							item = level.players[i] namespace_b376ff3f::function_230ceec4(weapon);
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
	Checksum: 0xE1750721
	Offset: 0xB20
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
	Checksum: 0x2E6A3CB4
	Offset: 0xD30
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
	Checksum: 0xE1BF0380
	Offset: 0xDC8
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
	Checksum: 0x42D66356
	Offset: 0xEC8
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
	Checksum: 0x52AE3460
	Offset: 0xF38
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
	Checksum: 0x93742F2B
	Offset: 0x1090
	Size: 0x7C4
	Parameters: 14
	Flags: Linked
*/
function aat_response(death, inflictor, attacker, damage, flags, mod, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(!isplayer(var_fd90b0bb) || !isdefined(var_fd90b0bb.aat) || !isdefined(vdir))
	{
		return;
	}
	if(vdir.weapclass !== #"rocketlauncher" && vpoint != "MOD_PISTOL_BULLET" && vpoint != "MOD_RIFLE_BULLET" && vpoint != "MOD_GRENADE" && vpoint != "MOD_PROJECTILE" && vpoint != "MOD_EXPLOSIVE" && vpoint != "MOD_IMPACT" && (vpoint != "MOD_MELEE" || !is_true(level.var_9d1d502c)))
	{
		return;
	}
	if(is_true(level.var_9d1d502c) && isdefined(level.var_37c36b82) && vpoint == "MOD_MELEE")
	{
		if(![[level.var_37c36b82]](vdir))
		{
			return;
		}
	}
	name = var_fd90b0bb.aat[function_702fb333(vdir)];
	if(!isdefined(name))
	{
		return;
	}
	if(is_true(weapon) && !is_true(level.aat[name].occurs_on_death))
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
		if(self [[level.var_a839c34d]](name, now, var_fd90b0bb))
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
		if(now <= (var_fd90b0bb.aat_cooldown_start[name] + level.aat[name].cooldown_time_attacker))
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
	if(isdefined(level.var_bdba6ee8[vdir]))
	{
		if(level.var_bdba6ee8[vdir] < percentage)
		{
			percentage = level.var_bdba6ee8[vdir];
		}
	}
	if(isdefined(var_fd90b0bb.var_2defbefd))
	{
		percentage = var_fd90b0bb.var_2defbefd;
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
			var_fd90b0bb thread aat_set_debug_text(name, 1, 0, 0);
		#/
	}
	if(!success)
	{
		keys = getarraykeys(level.aat_reroll);
		keys = array::randomize(keys);
		foreach(key in keys)
		{
			if(var_fd90b0bb [[level.aat_reroll[key].active_func]]())
			{
				for(i = 0; i < level.aat_reroll[key].count; i++)
				{
					if(percentage >= randomfloat(1))
					{
						success = 1;
						reroll_icon = level.aat_reroll[key].damage_feedback_icon;
						/#
							var_fd90b0bb thread aat_set_debug_text(name, 0, 1, 0);
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
			var_fd90b0bb thread aat_set_debug_text(name, 0, 0, 1);
		#/
		return;
	}
	level.aat[name].cooldown_time_global_start = now;
	var_fd90b0bb.aat_cooldown_start[name] = now;
	self thread [[level.aat[name].result_func]](weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
	if(isplayer(var_fd90b0bb))
	{
		var_fd90b0bb clientfield::set_to_player("rob_ammo_mod_ready", 0);
		var_fd90b0bb thread function_45db1b8a(name);
		var_fd90b0bb playlocalsound(level.aat[name].damage_feedback_sound);
	}
}

/*
	Name: function_45db1b8a
	Namespace: aat
	Checksum: 0x4272643C
	Offset: 0x1860
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_45db1b8a(name)
{
	self notify("2e8ccdf5577479df");
	self endon("2e8ccdf5577479df");
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
	Checksum: 0x7F7313C8
	Offset: 0x1930
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
	Checksum: 0xA8714140
	Offset: 0x1FD8
	Size: 0x200
	Parameters: 5
	Flags: Linked
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
	Checksum: 0x69889690
	Offset: 0x21E0
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
	Checksum: 0xC82AFCAC
	Offset: 0x2368
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
	Checksum: 0xC21ACD52
	Offset: 0x23C0
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
	Checksum: 0x5B192B80
	Offset: 0x2418
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
	Checksum: 0xEDD13EA5
	Offset: 0x2690
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
	Checksum: 0x35E0B3E0
	Offset: 0x2710
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
	Checksum: 0xD5BCE712
	Offset: 0x2828
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
	Checksum: 0x100C306D
	Offset: 0x2B38
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
	Checksum: 0xA43070C0
	Offset: 0x2C10
	Size: 0x180
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
			item = namespace_b376ff3f::function_230ceec4(weapon);
			if(isdefined(item.aat))
			{
				name = item.aat;
			}
			else
			{
				name = "none";
			}
			self clientfield::set_player_uimodel("hud_items.gibDismembermentType", gibserverutils::function_de4d9d(weapon, item.var_e91aba42));
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
	Name: function_c5abc232
	Namespace: aat
	Checksum: 0x34D5D79C
	Offset: 0x2D98
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_c5abc232(w_current)
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
	Checksum: 0x7F853929
	Offset: 0x2E08
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
		assert(function_7a600918(stat_name), "");
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
		var_ba1fb8c1 = self stats::function_441050ca(stat_name);
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

