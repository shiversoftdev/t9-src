#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_perks.csc;
#using scripts\zm_common\zm_equipment.csc;
#using scripts\zm_common\util.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_altbody;

/*
	Name: __init__system__
	Namespace: zm_altbody
	Checksum: 0xCAE10446
	Offset: 0x138
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_altbody", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_altbody
	Checksum: 0x24417786
	Offset: 0x180
	Size: 0x154
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register_clientuimodel("player_lives", #"zm_hud", #"player_lives", 1, 2, "int", undefined, 0, 0);
	clientfield::register("toplayer", "player_mana", 1, 8, "float", &set_player_mana, 0, 1);
	clientfield::register("toplayer", "player_in_afterlife", 1, 1, "int", &toggle_player_altbody, 0, 1);
	clientfield::register("allplayers", "player_altbody", 1, 1, "int", &toggle_player_altbody_3p, 0, 1);
	setupclientfieldcodecallbacks("toplayer", 1, "player_in_afterlife");
}

/*
	Name: init
	Namespace: zm_altbody
	Checksum: 0x247BB749
	Offset: 0x2E0
	Size: 0x164
	Parameters: 9
	Flags: None
*/
function init(name, trigger_name, trigger_hint, visionset_name, visionset_priority, enter_callback, exit_callback, enter_3p_callback, exit_3p_callback)
{
	if(!isdefined(level.altbody_enter_callbacks))
	{
		level.altbody_enter_callbacks = [];
	}
	if(!isdefined(level.altbody_exit_callbacks))
	{
		level.altbody_exit_callbacks = [];
	}
	if(!isdefined(level.altbody_enter_3p_callbacks))
	{
		level.altbody_enter_3p_callbacks = [];
	}
	if(!isdefined(level.altbody_exit_3p_callbacks))
	{
		level.altbody_exit_3p_callbacks = [];
	}
	if(!isdefined(level.altbody_visionsets))
	{
		level.altbody_visionsets = [];
	}
	level.altbody_name = visionset_name;
	if(isdefined(visionset_priority))
	{
		level.altbody_visionsets[visionset_name] = visionset_priority;
		visionset_mgr::register_visionset_info(visionset_priority, 1, 1, visionset_priority, visionset_priority);
	}
	level.altbody_enter_callbacks[visionset_name] = enter_callback;
	level.altbody_exit_callbacks[visionset_name] = exit_callback;
	level.altbody_enter_3p_callbacks[visionset_name] = enter_3p_callback;
	level.altbody_exit_3p_callbacks[visionset_name] = exit_3p_callback;
}

/*
	Name: set_player_mana
	Namespace: zm_altbody
	Checksum: 0xF011DFF5
	Offset: 0x450
	Size: 0x4A
	Parameters: 7
	Flags: None
*/
function set_player_mana(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.mana = bwastimejump;
}

/*
	Name: toggle_player_altbody
	Namespace: zm_altbody
	Checksum: 0x5A123906
	Offset: 0x4A8
	Size: 0x144
	Parameters: 7
	Flags: None
*/
function toggle_player_altbody(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.altbody))
	{
		self.altbody = 0;
	}
	self usealternatehud(fieldname);
	if(self.altbody !== fieldname)
	{
		self.altbody = fieldname;
		if(bwastimejump)
		{
			self thread clear_transition(binitialsnap, fieldname);
		}
		else
		{
			self thread cover_transition(binitialsnap, fieldname);
		}
		if(fieldname == 1)
		{
			callback = level.altbody_enter_callbacks[level.altbody_name];
			if(isdefined(callback))
			{
				self [[callback]](binitialsnap);
			}
		}
		else
		{
			callback = level.altbody_exit_callbacks[level.altbody_name];
			if(isdefined(callback))
			{
				self [[callback]](binitialsnap);
			}
		}
	}
}

/*
	Name: toggle_player_altbody_3p
	Namespace: zm_altbody
	Checksum: 0x26B91E2C
	Offset: 0x5F8
	Size: 0xE0
	Parameters: 7
	Flags: None
*/
function toggle_player_altbody_3p(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(self function_21c0fa55())
	{
		return;
	}
	self.altbody_3p = bwastimejump;
	if(bwastimejump == 1)
	{
		callback = level.altbody_enter_3p_callbacks[level.altbody_name];
		if(isdefined(callback))
		{
			self [[callback]](fieldname);
		}
	}
	else
	{
		callback = level.altbody_exit_3p_callbacks[level.altbody_name];
		if(isdefined(callback))
		{
			self [[callback]](fieldname);
		}
	}
}

/*
	Name: cover_transition
	Namespace: zm_altbody
	Checksum: 0xD8C30420
	Offset: 0x6E0
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function cover_transition(localclientnum, onoff)
{
	if(!self util::function_50ed1561(onoff))
	{
		return;
	}
	if(isdemoplaying() && demoisanyfreemovecamera())
	{
		return;
	}
	level lui::screen_fade_out(onoff, 0.05);
	level waittilltimeout(0.15, #"demo_jump");
	level lui::screen_fade_in(onoff, 0.1);
}

/*
	Name: clear_transition
	Namespace: zm_altbody
	Checksum: 0xB248D8E1
	Offset: 0x7B0
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function clear_transition(localclientnum, onoff)
{
	level lui::screen_fade_in(onoff, 0);
}

