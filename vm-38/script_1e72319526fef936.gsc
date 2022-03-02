#using script_215d7818c548cb51;
#using script_348ce871561476c9;
#using script_5b2a3c052bf17d0e;
#using script_6b2d896ac43eb90;
#using script_7fc996fe8678852;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_9c181b10;

/*
	Name: function_698aee77
	Namespace: namespace_9c181b10
	Checksum: 0x4A7EB49D
	Offset: 0x1B8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_698aee77()
{
	level notify(457812787);
}

#namespace namespace_7ec6ae9f;

/*
	Name: function_89f2df9
	Namespace: namespace_7ec6ae9f
	Checksum: 0xD53E963F
	Offset: 0x1D8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2ff0859bce056c66", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_7ec6ae9f
	Checksum: 0xC6E72392
	Offset: 0x228
	Size: 0x14C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_4bf87ef3ad101bb4")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	namespace_8b6a9d79::function_b3464a7c(#"hash_2ff0859bce056c66", &function_ea2db6a9);
	clientfield::register("allplayers", "phase_rift_player_fx", 1, 2, "int");
	clientfield::register("toplayer", "" + #"hash_1b01e37683714902", 1, 1, "int");
	callback::add_callback(#"hash_137b937fd26992be", &function_16ee428c);
}

/*
	Name: function_ea2db6a9
	Namespace: namespace_7ec6ae9f
	Checksum: 0x94D8B2B4
	Offset: 0x380
	Size: 0x324
	Parameters: 1
	Flags: None
*/
function function_ea2db6a9(instance)
{
	var_d4f4d124 = (isdefined(instance.var_fe2612fe[#"hash_1381b446e6ab7a37"]) ? instance.var_fe2612fe[#"hash_1381b446e6ab7a37"] : []);
	instance.a_s_teleports = (isdefined(instance.var_fe2612fe[#"teleport"]) ? instance.var_fe2612fe[#"teleport"] : []);
	instance.a_triggers = [];
	v_offset = vectorscale((0, 0, -1), 32);
	level.var_ff7bf48c = [];
	foreach(var_2b357ce9 in var_d4f4d124)
	{
		var_94b03771 = namespace_8b6a9d79::spawn_script_model(var_2b357ce9, "tag_origin");
		var_94b03771.fx_id = playfxontag(#"hash_7312068ea6037f71", var_94b03771, "tag_origin");
		var_94b03771 playloopsound(#"hash_15ff560465c71665");
		level.var_ff7bf48c[level.var_ff7bf48c.size] = var_94b03771;
		trigger = spawn("trigger_radius", var_2b357ce9.origin + v_offset, 0, 128, 64);
		trigger trigger::add_flags(16);
		trigger.instance = instance;
		trigger.var_2b357ce9 = var_2b357ce9;
		trigger.var_94b03771 = var_94b03771;
		trigger callback::function_35a12f19(&function_1c5803d9);
		if(!isdefined(instance.a_triggers))
		{
			instance.a_triggers = [];
		}
		else if(!isarray(instance.a_triggers))
		{
			instance.a_triggers = array(instance.a_triggers);
		}
		instance.a_triggers[instance.a_triggers.size] = trigger;
	}
	instance callback::function_d8abfc3d(#"hash_345e9169ebba28fb", &function_8ebdf278);
}

/*
	Name: function_16ee428c
	Namespace: namespace_7ec6ae9f
	Checksum: 0xFC26C8B8
	Offset: 0x6B0
	Size: 0xF6
	Parameters: 1
	Flags: None
*/
function function_16ee428c(params)
{
	if(isarray(level.var_ff7bf48c))
	{
		foreach(var_94b03771 in level.var_ff7bf48c)
		{
			if(isdefined(var_94b03771) && var_94b03771.instance.content_script_name !== #"hash_18be5193d8310f84")
			{
				var_94b03771.fx_id = playfxontag(#"hash_7312068ea6037f71", var_94b03771, "tag_origin");
			}
		}
	}
}

/*
	Name: function_1c5803d9
	Namespace: namespace_7ec6ae9f
	Checksum: 0xA3DE1FC8
	Offset: 0x7B0
	Size: 0x540
	Parameters: 1
	Flags: None
*/
function function_1c5803d9(eventstruct)
{
	var_2b357ce9 = self.var_2b357ce9;
	instance = self.instance;
	var_94b03771 = self.var_94b03771;
	var_85e930e6 = [];
	if(!isdefined(var_2b357ce9.s_teleport) && isarray(instance.a_s_teleports))
	{
		var_2b357ce9.s_teleport = array::function_a3b0f814(instance.a_s_teleports, 0);
	}
	s_teleport = var_2b357ce9.s_teleport;
	player = eventstruct.activator;
	if(isplayer(player))
	{
		if(player isinvehicle())
		{
			vehicle = player getvehicleoccupied();
		}
	}
	else
	{
		player = undefined;
	}
	if(isdefined(vehicle) || isvehicle(eventstruct.activator))
	{
		if(!isdefined(vehicle))
		{
			vehicle = eventstruct.activator;
		}
		foreach(passenger in function_a1ef346b())
		{
			if(passenger isinvehicle() && passenger getvehicleoccupied() === vehicle)
			{
				n_seat = vehicle getoccupantseat(passenger);
				if(n_seat === 0 || passenger === player)
				{
					if(!isdefined(player))
					{
						player = passenger;
					}
					continue;
				}
				if(!isdefined(var_85e930e6))
				{
					var_85e930e6 = [];
				}
				else if(!isarray(var_85e930e6))
				{
					var_85e930e6 = array(var_85e930e6);
				}
				if(!isinarray(var_85e930e6, passenger))
				{
					var_85e930e6[var_85e930e6.size] = passenger;
				}
			}
		}
		if(!is_true(vehicle.is_teleporting))
		{
			vehicle.is_teleporting = 1;
			vehicle makevehicleunusable();
		}
		if(!isdefined(player) && var_85e930e6.size)
		{
			player = array::pop(var_85e930e6, undefined, 0);
		}
	}
	if(!isplayer(player) || !isdefined(var_2b357ce9) || !isdefined(s_teleport) || var_2b357ce9 flag::get(#"hash_3492e2db103df124") || player flag::get(#"hash_9f062ac608bb7e4"))
	{
		return;
	}
	var_2b357ce9 thread flag::set_for_time(0.5, #"hash_3492e2db103df124");
	if(!isdefined(s_teleport.v_launch))
	{
		s_teleport.v_launch = (1250, 0, 300);
	}
	self thread function_a41c43bd(var_2b357ce9, var_94b03771, vehicle);
	v_trigger_offset = vectorscale((0, 0, -1), 32);
	if(isdefined(vehicle))
	{
		vehicle hide();
		vehicle val::set(#"hash_2ff0859bce056c66", "takedamage", 0);
		player.var_e1fd941b = vehicle;
	}
	s_teleport thread function_dda69211(player, vehicle, var_2b357ce9);
	foreach(passenger in var_85e930e6)
	{
		passenger.var_e1fd941b = vehicle;
		s_teleport thread function_dda69211(passenger);
	}
}

/*
	Name: function_dda69211
	Namespace: namespace_7ec6ae9f
	Checksum: 0x43320B5E
	Offset: 0xCF8
	Size: 0x624
	Parameters: 3
	Flags: Private
*/
function private function_dda69211(player, vehicle, var_2b357ce9)
{
	if(isalive(player))
	{
		if(player util::isusingremote() || player flag::get(#"hash_9f062ac608bb7e4"))
		{
			return;
		}
		player flag::set(#"hash_9f062ac608bb7e4");
		player val::set(#"hash_2ff0859bce056c66", "takedamage", 0);
		player val::set(#"hash_2ff0859bce056c66", "allow_crouch", 0);
		player val::set(#"hash_2ff0859bce056c66", "allow_prone", 0);
		player val::set(#"hash_2ff0859bce056c66", "allow_stand", 1);
		player val::set(#"hash_2ff0859bce056c66", "freezecontrols_allowlook", 1);
		player namespace_4b76712::allow_player_basejumping(0);
		player clientfield::set("phase_rift_player_fx", 1);
		if(isdefined(self.parent))
		{
			if(!isdefined(self.parent.var_73577d31))
			{
				self.parent.var_73577d31 = [];
			}
			else if(!isarray(self.parent.var_73577d31))
			{
				self.parent.var_73577d31 = array(self.parent.var_73577d31);
			}
			if(!isinarray(self.parent.var_73577d31, player))
			{
				self.parent.var_73577d31[self.parent.var_73577d31.size] = player;
			}
		}
		if(isdefined(vehicle))
		{
			vehicle clientfield::increment("" + #"vehicle_teleport");
			a_riders = vehicle getvehoccupants();
			foreach(rider in a_riders)
			{
				rider unlink();
			}
		}
		util::wait_network_frame();
		player playsoundtoplayer(#"hash_5ccf2f0b27ccbf41", player);
		if(is_true(var_2b357ce9.var_40803981))
		{
			player clientfield::set_to_player("" + #"hash_1b01e37683714902", 1);
		}
		player namespace_dbb31ff3::function_7b3dca17(self);
		if(is_true(var_2b357ce9.var_40803981))
		{
			player clientfield::set_to_player("" + #"hash_1b01e37683714902", 0);
		}
		if(isalive(player))
		{
			player clientfield::set("phase_rift_player_fx", 2);
			if(isdefined(vehicle))
			{
				vehicle show();
				vehicle unlink();
				util::wait_network_frame();
				if(isdefined(vehicle))
				{
					vehicle dontinterpolate();
					vehicle.origin = self.origin;
					vehicle.angles = self.angles;
				}
			}
		}
		if(isalive(player))
		{
			if(isdefined(var_2b357ce9))
			{
				var_2b357ce9 notify(#"hash_5bc4e4b06c059733");
			}
			namespace_957938f0::function_59d43f02(self, player, 1);
		}
		if(isdefined(player))
		{
			player.var_e1fd941b = undefined;
			player val::reset_all(#"hash_2ff0859bce056c66");
			player flag::clear(#"hash_9f062ac608bb7e4");
			player namespace_4b76712::allow_player_basejumping(1);
		}
		if(isdefined(vehicle))
		{
			vehicle val::reset_all(#"hash_2ff0859bce056c66");
			vehicle makevehicleusable();
			vehicle.is_teleporting = undefined;
		}
		wait(3);
		if(isdefined(player))
		{
			player clientfield::set("phase_rift_player_fx", 0);
		}
	}
}

/*
	Name: function_a41c43bd
	Namespace: namespace_7ec6ae9f
	Checksum: 0x711B143F
	Offset: 0x1328
	Size: 0x2EC
	Parameters: 3
	Flags: None
*/
function function_a41c43bd(var_2b357ce9, var_94b03771, vehicle)
{
	if(self flag::get(#"hash_39816ba0141eb30c"))
	{
		return;
	}
	self flag::set(#"hash_39816ba0141eb30c");
	var_94b03771 flag::set(#"hash_5c79c9319298891a");
	var_f49d0155 = (isdefined(self.instance.var_fe2612fe[#"hash_1381b446e6ab7a37"]) ? self.instance.var_fe2612fe[#"hash_1381b446e6ab7a37"] : []);
	foreach(var_4db48fec in var_f49d0155)
	{
		if(!var_4db48fec flag::get(#"hash_5c79c9319298891a"))
		{
			var_dfe9b4d8 = 1;
			break;
		}
	}
	self thread function_d3d632c3(vehicle);
	if(!var_f49d0155.size)
	{
		return;
	}
	s_teleport = var_94b03771.s_teleport;
	v_powerup = (namespace_77bd50da::function_81cad6d6(s_teleport.v_launch / 35, s_teleport.angles[1])) + s_teleport.origin;
	powerup = util::spawn_model("tag_origin", v_powerup);
	if(isdefined(powerup))
	{
		powerup.var_5c6f6051 = 384;
		powerup zm_powerups::powerup_init(powerup, undefined, undefined, undefined, 0, undefined, 0, 1, 0);
		if(!is_true(var_dfe9b4d8))
		{
			powerup waittilltimeout(15, #"powerup_grabbed");
			level scoreevents::doscoreeventcallback("scoreEventSR", {#a_players:self.instance.var_73577d31, #scoreevent:"event_complete"});
		}
	}
}

/*
	Name: function_d3d632c3
	Namespace: namespace_7ec6ae9f
	Checksum: 0xD12D0725
	Offset: 0x1620
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_d3d632c3(var_94b03771)
{
	self endon(#"death");
	/#
		if(getdvarint(#"hash_730311c63805303a", 0))
		{
			return;
		}
	#/
	if(!isdefined(self.var_3b53f898))
	{
		self.var_3b53f898 = 15;
	}
	wait(self.var_3b53f898);
	if(isdefined(var_94b03771))
	{
		arrayremovevalue(level.var_ff7bf48c, var_94b03771);
	}
	if(isdefined(var_94b03771))
	{
		var_94b03771 delete();
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_8ebdf278
	Namespace: namespace_7ec6ae9f
	Checksum: 0x14776E5D
	Offset: 0x1700
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_8ebdf278(eventstruct)
{
	if(isdefined(self.a_triggers))
	{
		foreach(trigger in self.a_triggers)
		{
			if(isdefined(trigger))
			{
				trigger delete();
			}
			if(isdefined(trigger.var_94b03771))
			{
				trigger.var_94b03771 delete();
			}
		}
	}
	self callback::function_52ac9652(#"hash_345e9169ebba28fb", &function_8ebdf278);
}

