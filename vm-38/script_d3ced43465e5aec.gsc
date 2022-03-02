#using script_18910f59cc847b42;
#using script_30c7fb449869910;
#using script_3314b730521b9666;
#using script_38635d174016f682;
#using script_42cbbdcd1e160063;
#using script_54c0478b7e9d6d81;
#using script_64e5d3ad71ce8140;
#using script_67049b48b589d81;
#using script_6b71c9befed901f2;
#using script_71603a58e2da0698;
#using script_75c3996cce8959f7;
#using script_76abb7986de59601;
#using script_77163d5a569e2071;
#using script_771f5bff431d8d57;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_515a5054;

/*
	Name: function_242da59e
	Namespace: namespace_515a5054
	Checksum: 0x768EFC24
	Offset: 0x180
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_242da59e()
{
	level notify(601786552);
}

#namespace namespace_5d515bd5;

/*
	Name: init
	Namespace: namespace_5d515bd5
	Checksum: 0x10BE4304
	Offset: 0x1A0
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("actor", "clone_activated", 1, 1, "int", &clone_activated, 0, 1);
	clientfield::register("actor", "clone_damaged", 1, 1, "int", &clone_damaged, 0, 0);
	clientfield::register("allplayers", "clone_activated", 1, 1, "int", &player_clone_activated, 0, 0);
}

/*
	Name: clone_activated
	Namespace: namespace_5d515bd5
	Checksum: 0xC338D9D3
	Offset: 0x288
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function clone_activated(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self._isclone = 1;
		if(isdefined(level._monitor_tracker))
		{
			self thread [[level._monitor_tracker]](fieldname);
		}
		self thread gadget_clone_render::transition_shader(fieldname);
	}
}

/*
	Name: player_clone_activated
	Namespace: namespace_5d515bd5
	Checksum: 0x916ECA02
	Offset: 0x320
	Size: 0xAC
	Parameters: 7
	Flags: Linked
*/
function player_clone_activated(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		self thread gadget_clone_render::transition_shader(fieldname);
	}
	else
	{
		self notify(#"clone_shader_off");
		self mapshaderconstant(fieldname, 0, "scriptVector3", 1, 0, 0, 1);
	}
}

/*
	Name: clone_damage_flicker
	Namespace: namespace_5d515bd5
	Checksum: 0x7549B940
	Offset: 0x3D8
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function clone_damage_flicker(localclientnum)
{
	self endon(#"death");
	self notify(#"start_flicker");
	self endon(#"start_flicker");
	self waittill(#"stop_flicker");
}

/*
	Name: clone_damage_finish
	Namespace: namespace_5d515bd5
	Checksum: 0xE3EF54FA
	Offset: 0x440
	Size: 0x56
	Parameters: 0
	Flags: Linked
*/
function clone_damage_finish()
{
	self endon(#"death");
	self endon(#"start_flicker");
	self endon(#"stop_flicker");
	wait(0.2);
	self notify(#"stop_flicker");
}

/*
	Name: clone_damaged
	Namespace: namespace_5d515bd5
	Checksum: 0x408A9250
	Offset: 0x4A0
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function clone_damaged(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self thread clone_damage_flicker(fieldname);
	}
	else
	{
		self thread clone_damage_finish();
	}
}

