#using script_18910f59cc847b42;
#using script_30c7fb449869910;
#using script_3314b730521b9666;
#using script_38635d174016f682;
#using script_42cbbdcd1e160063;
#using script_60a2f38d6d37fd6a;
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

#namespace namespace_8c04284b;

/*
	Name: function_3ee92e59
	Namespace: namespace_8c04284b
	Checksum: 0x7F631396
	Offset: 0x1A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3ee92e59()
{
	level notify(1347259090);
}

/*
	Name: init
	Namespace: namespace_8c04284b
	Checksum: 0x3C6911E2
	Offset: 0x1C0
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "setArena", 1, 5, "int", &setarena, 0, 0);
	clientfield::register("world", "setTOD", 1, 3, "int", &settod, 0, 0);
	function_32d5e898();
}

/*
	Name: function_32d5e898
	Namespace: namespace_8c04284b
	Checksum: 0x64A4F49B
	Offset: 0x270
	Size: 0x2BE
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
	level.doa.arenas = [];
	level.doa.current_arena = undefined;
	arenas = struct::get_array("arena_center", "targetname");
	var_7f6c6c04 = [];
	foreach(arena in arenas)
	{
		args = strtok(arena.script_parameters, ";");
		order = int(args[0]);
		if(args.size > 1)
		{
			/#
				assert(args.size == 4);
			#/
			arena.var_13ea8aea = (float(args[1]), float(args[2]), float(args[3]));
		}
		else
		{
			arena.var_13ea8aea = vectorscale((1, 0, 0), 75);
		}
		arena.var_46f3a17d = arena.var_13ea8aea + vectorscale((0, 1, 0), 180);
		var_7f6c6c04[order] = arena;
	}
	id = 0;
	for(index = 0; index < 100; index++)
	{
		if(isdefined(var_7f6c6c04[index]))
		{
			var_7f6c6c04[index].id = id;
			level.doa.arenas[id] = var_7f6c6c04[index];
			id++;
		}
	}
	level.doa.current_arena = level.doa.arenas[0];
	level.doa.arenas[3].camera_max_height = 1000;
	level.doa.arenas[14].camera_max_height = 1100;
}

/*
	Name: setarena
	Namespace: namespace_8c04284b
	Checksum: 0x1E17DFDC
	Offset: 0x538
	Size: 0x1CC
	Parameters: 7
	Flags: Linked
*/
function setarena(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	cleanupspawneddynents();
	level.doa.current_arena = undefined;
	if(bwastimejump != (32 - 1))
	{
		level.doa.current_arena = level.doa.arenas[bwastimejump];
		/#
			namespace_1e25ad94::debugmsg("" + level.doa.current_arena.script_noteworthy);
		#/
	}
	var_129a290 = 1;
	if(getlocalplayers().size > 1)
	{
		var_129a290 = 4;
	}
	foreach(player in getlocalplayers())
	{
		player namespace_ac2a80f5::changecamera((isdefined(player.doa) ? player.doa.var_10752c35 : var_129a290));
	}
	namespace_9fc66ac::function_5beeba99();
}

/*
	Name: settod
	Namespace: namespace_8c04284b
	Checksum: 0xB00AD198
	Offset: 0x710
	Size: 0x33C
	Parameters: 7
	Flags: Linked
*/
function settod(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.doa.var_1fc44fbc))
	{
		stopradiantexploder(fieldname, level.doa.var_1fc44fbc);
		level.doa.var_1fc44fbc = undefined;
	}
	if(!isdefined(level.doa.current_arena))
	{
		return;
	}
	level.doa.var_3303cb0d = "morning";
	switch(bwastimejump)
	{
		case 0:
		{
			level.doa.var_3303cb0d = "morning";
			setworldfogactivebank(fieldname, 1);
			break;
		}
		case 1:
		{
			level.doa.var_3303cb0d = "noon";
			setworldfogactivebank(fieldname, 2);
			break;
		}
		case 2:
		{
			level.doa.var_3303cb0d = "dusk";
			setworldfogactivebank(fieldname, 4);
			break;
		}
		case 3:
		{
			level.doa.var_3303cb0d = "night";
			setworldfogactivebank(fieldname, 8);
			break;
		}
		default:
		{
			level.doa.var_3303cb0d = "morning";
			setworldfogactivebank(fieldname, 1);
			break;
		}
	}
	/#
		namespace_1e25ad94::debugmsg((("" + level.doa.current_arena.script_noteworthy) + "") + level.doa.var_3303cb0d);
	#/
	level.doa.var_1fc44fbc = (("fxexp_" + level.doa.current_arena.script_noteworthy) + "_") + level.doa.var_3303cb0d;
	/#
		namespace_1e25ad94::debugmsg((("" + level.doa.var_1fc44fbc) + "") + fieldname);
	#/
	playradiantexploder(fieldname, level.doa.var_1fc44fbc);
}

