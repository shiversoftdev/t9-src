#using script_2c6ff91addfd14b7;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace raps;

/*
	Name: function_89f2df9
	Namespace: raps
	Checksum: 0xA5FC7B4F
	Offset: 0x118
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"raps", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: raps
	Checksum: 0xEA17AFC5
	Offset: 0x160
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "raps_side_deathfx", 1, 1, "int");
	vehicle::add_main_callback("raps", &raps_initialize);
	slow_triggers = getentarray("raps_slow", "targetname");
	array::thread_all(slow_triggers, &slow_raps_trigger);
}

/*
	Name: raps_initialize
	Namespace: raps
	Checksum: 0xE85B218D
	Offset: 0x210
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function raps_initialize()
{
	namespace_c2dce87e::function_c6f75619();
	self useanimtree("generic");
	self initsounds();
	if(isdefined(level.vehicle_initializer_cb))
	{
		[[level.vehicle_initializer_cb]](self);
	}
	defaultrole();
}

/*
	Name: defaultrole
	Namespace: raps
	Checksum: 0x83BD0C1E
	Offset: 0x2A0
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function defaultrole()
{
	self vehicle_ai::init_state_machine_for_role("default");
	self vehicle_ai::get_state_callbacks("combat").update_func = &namespace_c2dce87e::state_combat_update;
	self vehicle_ai::get_state_callbacks("driving").update_func = &namespace_c2dce87e::state_scripted_update;
	self vehicle_ai::get_state_callbacks("death").update_func = &namespace_c2dce87e::state_death_update;
	self vehicle_ai::get_state_callbacks("emped").update_func = &namespace_c2dce87e::state_emped_update;
	self vehicle_ai::call_custom_add_state_callbacks();
	vehicle_ai::startinitialstate("combat");
}

/*
	Name: slow_raps_trigger
	Namespace: raps
	Checksum: 0xE2E6CE68
	Offset: 0x3B8
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function slow_raps_trigger()
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		other = waitresult.activator;
		if(isvehicle(other) && isdefined(other.archetype) && other.archetype == "raps")
		{
			other thread slow_raps(self);
		}
		wait(0.1);
	}
}

/*
	Name: slow_raps
	Namespace: raps
	Checksum: 0x763F7C70
	Offset: 0x478
	Size: 0x16E
	Parameters: 1
	Flags: Linked
*/
function slow_raps(trigger)
{
	self notify(#"slow_raps");
	self endon(#"slow_raps", #"death");
	self.slow_trigger = 1;
	if(isdefined(trigger.script_int))
	{
		if(isdefined(self._override_raps_combat_speed) && self._override_raps_combat_speed < trigger.script_int)
		{
			self setspeedimmediate(self._override_raps_combat_speed);
		}
		else
		{
			self setspeedimmediate(trigger.script_int, 200, 200);
		}
	}
	else
	{
		if(isdefined(self._override_raps_combat_speed) && self._override_raps_combat_speed < (0.5 * self.settings.defaultmovespeed))
		{
			self setspeed(self._override_raps_combat_speed);
		}
		else
		{
			self setspeed(0.5 * self.settings.defaultmovespeed);
		}
	}
	wait(1);
	self resumespeed();
	self.slow_trigger = undefined;
}

/*
	Name: initsounds
	Namespace: raps
	Checksum: 0x3DA19557
	Offset: 0x5F0
	Size: 0x4C4
	Parameters: 0
	Flags: Linked
*/
function initsounds()
{
	self.sndalias = [];
	self.sndalias[#"inair"] = #"veh_raps_in_air";
	self.sndalias[#"land"] = #"veh_raps_land";
	self.sndalias[#"spawn"] = #"veh_raps_spawn";
	self.sndalias[#"direction"] = #"veh_raps_direction";
	self.sndalias[#"jump_up"] = #"veh_raps_jump_up";
	self.sndalias[#"hash_6dacc5a8faf1b6f3"] = #"veh_raps_close_250";
	self.sndalias[#"hash_22b0b71c07ac7fea"] = #"veh_raps_close_1500";
	self.sndalias[#"hash_26569720e0ae76f3"] = #"veh_raps_targeting";
	self.sndalias[#"hash_2b3a22d457fba169"] = #"evt_raps_alarm";
	self.sndalias[#"hash_56dd8cae01fc143c"] = #"veh_wasp_wall_imp";
	if(isdefined(self.vehicletype) && (self.vehicletype == #"spawner_enemy_zombie_vehicle_raps_suicide" || self.vehicletype == #"spawner_zombietron_veh_meatball" || self.vehicletype == #"spawner_zombietron_veh_meatball_med" || self.vehicletype == #"spawner_zombietron_veh_meatball_small"))
	{
		self.sndalias[#"inair"] = undefined;
		self.sndalias[#"land"] = #"hash_7cbf89ceaf15bb25";
		self.sndalias[#"spawn"] = undefined;
		self.sndalias[#"direction"] = undefined;
		self.sndalias[#"jump_up"] = undefined;
		self.sndalias[#"hash_6dacc5a8faf1b6f3"] = undefined;
		self.sndalias[#"hash_22b0b71c07ac7fea"] = undefined;
		self.sndalias[#"hash_26569720e0ae76f3"] = undefined;
		self.sndalias[#"hash_2b3a22d457fba169"] = undefined;
		self.sndalias[#"hash_56dd8cae01fc143c"] = #"hash_33eb98c2a2669c78";
	}
	if(isdefined(self.vehicletype) && self.vehicletype == #"hash_22f2770b0b570f88")
	{
		self.sndalias[#"inair"] = #"hash_b4c1fb7fb7b70be";
		self.sndalias[#"land"] = #"hash_56707e87f5b058df";
		self.sndalias[#"spawn"] = #"hash_220536a567c22f9d";
		self.sndalias[#"direction"] = undefined;
		self.sndalias[#"jump_up"] = #"hash_1182d9ecfe86442e";
		self.sndalias[#"hash_6dacc5a8faf1b6f3"] = #"hash_4d4a13f08b063112";
		self.sndalias[#"hash_22b0b71c07ac7fea"] = undefined;
		self.sndalias[#"hash_26569720e0ae76f3"] = #"hash_57d3d8cf8a3cb109";
		self.sndalias[#"hash_2b3a22d457fba169"] = #"hash_28033d94de922793";
		self.sndalias[#"hash_56dd8cae01fc143c"] = #"hash_481f37c2ab12bdfe";
	}
}

/*
	Name: detonate_damage_monitored
	Namespace: raps
	Checksum: 0x5221655C
	Offset: 0xAC0
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function detonate_damage_monitored(attacker, weapon)
{
	self.selfdestruct = 1;
	namespace_c2dce87e::detonate(weapon);
}

/*
	Name: detonate
	Namespace: raps
	Checksum: 0x36B166D6
	Offset: 0xB00
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function detonate(attacker)
{
	namespace_c2dce87e::detonate(attacker);
}

