#using script_32399001bdb550da;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace oed;

/*
	Name: __init__system__
	Namespace: oed
	Checksum: 0x43B1B61A
	Offset: 0x178
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"oed", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: oed
	Checksum: 0x7D884E9B
	Offset: 0x1D0
	Size: 0x27C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "sitrep_toggle", 1, 1, "int");
	clientfield::register("toplayer", "active_dni_fx", 1, 1, "counter");
	clientfield::register("toplayer", "hack_dni_fx", 1, 1, "counter");
	clientfield::register("actor", "sitrep_material", 1, 1, "int");
	clientfield::register("vehicle", "sitrep_material", 1, 1, "int");
	clientfield::register("scriptmover", "sitrep_material", 1, 1, "int");
	clientfield::register("item", "sitrep_material", 1, 1, "int");
	clientfield::register("vehicle", "turret_keyline_render", 1, 1, "int");
	clientfield::register("vehicle", "vehicle_keyline_toggle", 1, 1, "int");
	callback::on_spawned(&on_player_spawned);
	spawner::add_global_spawn_function(#"axis", &enable_thermal_on_spawned);
	spawner::add_global_spawn_function(#"allies", &enable_thermal_on_spawned);
	level.b_enhanced_vision_enabled = 1;
	level.b_player_scene_active = 0;
	level.enable_thermal = &enable_thermal;
	level.disable_thermal = &disable_thermal;
}

/*
	Name: function_8ac3bea9
	Namespace: oed
	Checksum: 0x80F724D1
	Offset: 0x458
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: on_player_spawned
	Namespace: oed
	Checksum: 0x348BABBC
	Offset: 0x468
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self.b_enhanced_vision_enabled = level.b_enhanced_vision_enabled;
	self.ev_state = 0;
	self ev_activate_on_player(self.ev_state);
	b_playsound = 0;
	self clientfield::set_to_player("sitrep_toggle", 1);
}

/*
	Name: ev_mode_toggle
	Namespace: oed
	Checksum: 0xCEA494C7
	Offset: 0x4E0
	Size: 0x8C
	Parameters: 0
	Flags: Event
*/
event ev_mode_toggle()
{
	if(is_true(level.b_enhanced_vision_enabled) && is_true(self.b_enhanced_vision_enabled))
	{
		if(!scene::is_igc_active())
		{
			self.ev_state = !is_true(self.ev_state);
			self ev_activate_on_player(self.ev_state);
		}
	}
}

/*
	Name: enable_thermal_on_spawned
	Namespace: oed
	Checksum: 0x3567FE35
	Offset: 0x578
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function enable_thermal_on_spawned()
{
	if(self.team == #"axis")
	{
		self enable_thermal();
	}
	else if(self.team == #"allies")
	{
		self enable_thermal();
	}
}

/*
	Name: enable_thermal
	Namespace: oed
	Checksum: 0x6D8A1941
	Offset: 0x5E8
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function enable_thermal(str_disable)
{
	self endon(#"death");
	self thread disable_thermal_on_death();
	if(isdefined(str_disable))
	{
		level waittill(str_disable);
		self disable_thermal();
	}
}

/*
	Name: disable_thermal_on_death
	Namespace: oed
	Checksum: 0x7EAC93DE
	Offset: 0x650
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function disable_thermal_on_death()
{
	self endon(#"disable_thermal");
	self waittill(#"death");
	if(isdefined(self))
	{
		self disable_thermal();
	}
}

/*
	Name: disable_thermal
	Namespace: oed
	Checksum: 0x5C224B67
	Offset: 0x6A0
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function disable_thermal()
{
	self notify(#"disable_thermal");
}

/*
	Name: toggle_thermal_mode_for_players
	Namespace: oed
	Checksum: 0x73383328
	Offset: 0x6C0
	Size: 0xAA
	Parameters: 1
	Flags: None
*/
function toggle_thermal_mode_for_players(b_enabled)
{
	if(!isdefined(b_enabled))
	{
		b_enabled = 1;
	}
	level.b_enhanced_vision_enabled = b_enabled;
	foreach(e_player in level.players)
	{
		e_player.b_enhanced_vision_enabled = b_enabled;
	}
}

/*
	Name: enable_ev
	Namespace: oed
	Checksum: 0x6FDEF68C
	Offset: 0x778
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function enable_ev(b_enabled)
{
	if(!isdefined(b_enabled))
	{
		b_enabled = 1;
	}
	self.b_enhanced_vision_enabled = b_enabled;
	if(!b_enabled)
	{
		self ev_activate_on_player(b_enabled);
	}
}

/*
	Name: ev_activate_on_player
	Namespace: oed
	Checksum: 0x9AE44F5
	Offset: 0x7D0
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function ev_activate_on_player(b_enabled)
{
	if(!isdefined(b_enabled))
	{
		b_enabled = 1;
	}
	self.ev_state = b_enabled;
	if(self.ev_state)
	{
		self notify(#"enhanced_vision_activated");
	}
	else
	{
		self notify(#"enhanced_vision_deactivated");
	}
}

/*
	Name: enable_keyline
	Namespace: oed
	Checksum: 0x50E207A5
	Offset: 0x838
	Size: 0x8C
	Parameters: 2
	Flags: None
*/
function enable_keyline(b_interact, str_disable)
{
	self endon(#"death");
	self clientfield::set("sitrep_material", 1);
	self thread disable_on_death();
	if(isdefined(str_disable))
	{
		level waittill(str_disable);
		self disable_keyline();
	}
}

/*
	Name: disable_on_death
	Namespace: oed
	Checksum: 0xE474CE23
	Offset: 0x8D0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function disable_on_death()
{
	self waittill(#"death");
	if(isdefined(self))
	{
		self disable_keyline();
	}
}

/*
	Name: disable_keyline
	Namespace: oed
	Checksum: 0xBE57E15F
	Offset: 0x910
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function disable_keyline()
{
	self clientfield::set("sitrep_material", 0);
}

/*
	Name: toggle_sitrep_for_players
	Namespace: oed
	Checksum: 0xA49117C0
	Offset: 0x940
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function toggle_sitrep_for_players(b_active)
{
	foreach(player in level.players)
	{
		player.sitrep_active = !is_true(player.sitrep_active);
		player clientfield::set_to_player("sitrep_toggle", player.sitrep_active);
	}
}

/*
	Name: init_sitrep_model
	Namespace: oed
	Checksum: 0xB719C93B
	Offset: 0xA10
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function init_sitrep_model()
{
	if(!isdefined(self.angles))
	{
		self.angles = (0, 0, 0);
	}
	s_sitrep_bundle = level.scriptbundles[#"sitrep"][self.scriptbundlename];
	e_sitrep = util::spawn_model(s_sitrep_bundle.model, self.origin, self.angles);
	if(isdefined(s_sitrep_bundle.sitrep_interact))
	{
		e_sitrep.script_sitrep_id = s_sitrep_bundle.sitrep_interact;
	}
	else
	{
		e_sitrep.script_sitrep_id = 0;
	}
	return e_sitrep;
}

