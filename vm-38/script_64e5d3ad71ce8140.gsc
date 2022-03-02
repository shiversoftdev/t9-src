#using script_18910f59cc847b42;
#using script_30c7fb449869910;
#using script_3314b730521b9666;
#using script_38635d174016f682;
#using script_42cbbdcd1e160063;
#using script_4adf64e112e9afec;
#using script_64ac23dbb2d7d587;
#using script_64e5d3ad71ce8140;
#using script_67049b48b589d81;
#using script_6b71c9befed901f2;
#using script_71603a58e2da0698;
#using script_75c3996cce8959f7;
#using script_76abb7986de59601;
#using script_77163d5a569e2071;
#using script_771f5bff431d8d57;
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

#namespace namespace_c85a46fe;

/*
	Name: function_e7e4a39b
	Namespace: namespace_c85a46fe
	Checksum: 0xECB440B7
	Offset: 0x208
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e7e4a39b()
{
	level notify(1458503569);
}

/*
	Name: init
	Namespace: namespace_c85a46fe
	Checksum: 0xD6E3FDCD
	Offset: 0x228
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "set_icon", 1, 4, "int", &function_76f6cec6, 0, 0);
	clientfield::register("toplayer", "generator_sonar", 1, 1, "int", &function_b8b01a1f, 0, 0);
	function_32d5e898();
}

/*
	Name: function_32d5e898
	Namespace: namespace_c85a46fe
	Checksum: 0x351406B9
	Offset: 0x2D8
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
	level.doa.var_87b8e8ea = [];
}

/*
	Name: function_76f6cec6
	Namespace: namespace_c85a46fe
	Checksum: 0x43AD9C2
	Offset: 0x300
	Size: 0x33C
	Parameters: 7
	Flags: Linked
*/
function function_76f6cec6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self enableonradar();
	color = undefined;
	scale = 1.2;
	switch(bwastimejump)
	{
		case 0:
		{
			self function_811196d1(1);
			return;
		}
		case 2:
		{
			icon = "doa_hud_icon_ai_" + "zombie";
			break;
		}
		case 7:
		{
			icon = "doa_hud_icon_ai_" + "skeleton";
			break;
		}
		case 3:
		{
			icon = "doa_hud_icon_ai_" + "brutus";
			break;
		}
		case 4:
		{
			icon = "doa_hud_icon_ai_" + "flyer";
			scale = 1.4;
			break;
		}
		case 5:
		{
			icon = "doa_hud_icon_ai_" + "demon";
			break;
		}
		case 6:
		{
			icon = "doa_hud_icon_ai_" + "wolf";
			break;
		}
		case 8:
		{
			icon = "doa_hud_icon_ai_" + "crawler";
			break;
		}
		case 1:
		{
			icon = "icon_minimap_sensor_dart";
			color = #"neutral";
			var_9c06499c = 1;
			break;
		}
		case 9:
		{
			icon = "ui_icon_minimap_waypoint_ladder";
			color = #"neutral";
			var_9c06499c = 1;
			break;
		}
	}
	if(isdefined(icon))
	{
		self setcompassicon(icon);
		self function_811196d1(0);
		self function_5e00861(scale);
		if(isdefined(color))
		{
			self function_a5edb367(color);
		}
	}
	if(!is_true(var_9c06499c) && !isinarray(level.doa.var_87b8e8ea, self))
	{
		level.doa.var_87b8e8ea[level.doa.var_87b8e8ea.size] = self;
	}
}

/*
	Name: function_b8b01a1f
	Namespace: namespace_c85a46fe
	Checksum: 0xE83CAADB
	Offset: 0x648
	Size: 0x128
	Parameters: 7
	Flags: Linked
*/
function function_b8b01a1f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!namespace_7f5aeb59::islocalplayer(self))
	{
		return;
	}
	state = (newval ? 1 : 0);
	foreach(model in level.doa.var_87b8e8ea)
	{
		if(!isdefined(model))
		{
			continue;
		}
		model.var_6abc296 = state;
		model weaponobjects::enemyequip_changed(oldval, 0, state, bnewent, binitialsnap, fieldname, bwastimejump);
	}
}

