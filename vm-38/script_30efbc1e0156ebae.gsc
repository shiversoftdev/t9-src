#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_60a2f38d6d37fd6a;
#using script_6b71c9befed901f2;
#using script_75c3996cce8959f7;
#using script_71603a58e2da0698;
#using script_30c7fb449869910;
#using script_1b2f6ef7778cf920;
#using script_771f5bff431d8d57;
#using script_42cbbdcd1e160063;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using script_18910f59cc847b42;
#using scripts\core_common\struct.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_5a917022;

/*
	Name: function_c5059c94
	Namespace: namespace_5a917022
	Checksum: 0x23AFA1FF
	Offset: 0x208
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c5059c94()
{
	level notify(-542158037);
}

/*
	Name: init
	Namespace: namespace_5a917022
	Checksum: 0x1E14931
	Offset: 0x228
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "set_bonus_room", 1, 4, "int", &function_40356127, 0, 0);
	function_32d5e898();
}

/*
	Name: function_32d5e898
	Namespace: namespace_5a917022
	Checksum: 0x2484D79A
	Offset: 0x290
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
	level.doa.var_8f6ccf63 = [];
	level.doa.var_938e4f08 = 0;
	rooms = struct::get_array("zombietron_bonus_room", "targetname");
	foreach(room in rooms)
	{
		if(isdefined(room.script_parameters))
		{
			args = strtok(room.script_parameters, ";");
			room.freecam = int(args[0]);
		}
		level.doa.var_8f6ccf63[room.script_noteworthy] = room;
	}
}

/*
	Name: function_40356127
	Namespace: namespace_5a917022
	Checksum: 0x6DADCC0C
	Offset: 0x3D8
	Size: 0x2D2
	Parameters: 7
	Flags: Linked
*/
function function_40356127(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.doa.var_938e4f08 = bwastimejump;
	switch(bwastimejump)
	{
		case 0:
		{
			function_a7ff1fc3(fieldname);
			break;
		}
		case 1:
		{
			function_d2e02ee(fieldname, "armory");
			break;
		}
		case 2:
		{
			function_d2e02ee(fieldname, "coop");
			break;
		}
		case 3:
		{
			function_d2e02ee(fieldname, "treasure");
			break;
		}
		case 4:
		{
			function_d2e02ee(fieldname, "tradingpost");
			break;
		}
		case 5:
		{
			function_d2e02ee(fieldname, "nukebunker");
			break;
		}
		case 6:
		{
			function_d2e02ee(fieldname, "snaketemple");
			break;
		}
		case 7:
		{
			function_d2e02ee(fieldname, "crypt");
			break;
		}
		case 8:
		{
			function_d2e02ee(fieldname, "cellar");
			break;
		}
		case 9:
		{
			function_d2e02ee(fieldname, "slideways");
			break;
		}
		case 10:
		{
			function_d2e02ee(fieldname, "slideways2");
			break;
		}
		case 11:
		{
			function_d2e02ee(fieldname, "slideways3");
			break;
		}
		case 13:
		{
			function_d2e02ee(fieldname, "warstore");
			break;
		}
	}
}

/*
	Name: function_a7ff1fc3
	Namespace: namespace_5a917022
	Checksum: 0xF0B2A02C
	Offset: 0x6B8
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_a7ff1fc3(localclientnum)
{
	player = function_5c10bd79(localclientnum);
	if(!isdefined(player) || !isdefined(player.doa))
	{
		return;
	}
	if(isdefined(player.doa.var_903d75b1))
	{
		player.doa.var_10752c35 = player namespace_ac2a80f5::function_f7736714(localclientnum, player.doa.var_903d75b1);
	}
	else
	{
		player.doa.var_10752c35 = 1;
	}
	player namespace_ac2a80f5::changecamera(player.doa.var_10752c35);
	namespace_9fc66ac::function_a77649db(0);
	namespace_4dae815d::function_b6e8ef46();
}

/*
	Name: function_d2e02ee
	Namespace: namespace_5a917022
	Checksum: 0xEFF0B33
	Offset: 0x7C8
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function function_d2e02ee(localclientnum, name)
{
	/#
		assert(isdefined(level.doa.var_8f6ccf63[name]));
	#/
	room = level.doa.var_8f6ccf63[name];
	player = function_5c10bd79(localclientnum);
	if(!isdefined(player.doa))
	{
		return;
	}
	if(!is_true(room.freecam))
	{
		player.doa.var_10752c35 = 7;
	}
	level.doa.var_b73cc08.origin = room.origin;
	level.doa.var_b73cc08.angles = room.angles;
	namespace_9fc66ac::function_a77649db(1, name);
}

