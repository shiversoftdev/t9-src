#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm.csc;
#using scripts\zm_common\util.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_zdraw;

/*
	Name: function_ded25716
	Namespace: zm_zdraw
	Checksum: 0xD9DDDEB0
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ded25716()
{
	level notify(-496904736);
}

/*
	Name: __init__system__
	Namespace: zm_zdraw
	Checksum: 0x1FB80060
	Offset: 0xD0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	/#
		system::register(#"zdraw", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: zm_zdraw
	Checksum: 0xDC258F57
	Offset: 0x128
	Size: 0x94
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		setdvar(#"zdraw", "");
		level.zdraw = spawnstruct();
		function_c9f70832();
		function_99bd35ec();
		function_b36498d3();
		level thread function_c78d9e67();
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: zm_zdraw
	Checksum: 0xA6AD33F8
	Offset: 0x1C8
	Size: 0x8
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	/#
	#/
}

/*
	Name: function_c9f70832
	Namespace: zm_zdraw
	Checksum: 0x8DC3FD98
	Offset: 0x1D8
	Size: 0x3D4
	Parameters: 0
	Flags: None
*/
function function_c9f70832()
{
	/#
		level.zdraw.colors = [];
		level.zdraw.colors[#"red"] = (1, 0, 0);
		level.zdraw.colors[#"green"] = (0, 1, 0);
		level.zdraw.colors[#"blue"] = (0, 0, 1);
		level.zdraw.colors[#"yellow"] = (1, 1, 0);
		level.zdraw.colors[#"orange"] = (1, 0.5, 0);
		level.zdraw.colors[#"cyan"] = (0, 1, 1);
		level.zdraw.colors[#"purple"] = (1, 0, 1);
		level.zdraw.colors[#"black"] = (0, 0, 0);
		level.zdraw.colors[#"white"] = (1, 1, 1);
		level.zdraw.colors[#"grey"] = vectorscale((1, 1, 1), 0.75);
		level.zdraw.colors[#"gray1"] = vectorscale((1, 1, 1), 0.1);
		level.zdraw.colors[#"gray2"] = vectorscale((1, 1, 1), 0.2);
		level.zdraw.colors[#"gray3"] = vectorscale((1, 1, 1), 0.3);
		level.zdraw.colors[#"gray4"] = vectorscale((1, 1, 1), 0.4);
		level.zdraw.colors[#"gray5"] = vectorscale((1, 1, 1), 0.5);
		level.zdraw.colors[#"gray6"] = vectorscale((1, 1, 1), 0.6);
		level.zdraw.colors[#"gray7"] = vectorscale((1, 1, 1), 0.7);
		level.zdraw.colors[#"gray8"] = vectorscale((1, 1, 1), 0.8);
		level.zdraw.colors[#"gray9"] = vectorscale((1, 1, 1), 0.9);
		level.zdraw.colors[#"slate"] = (0.4392157, 0.5019608, 0.5647059);
		level.zdraw.colors[#"pink"] = (1, 0.7529412, 0.7960784);
		level.zdraw.colors[#"olive"] = vectorscale((1, 1, 0), 0.5019608);
		level.zdraw.colors[#"brown"] = (0.5450981, 0.2705882, 0.07450981);
		level.zdraw.colors[#"default"] = (1, 1, 1);
	#/
}

/*
	Name: function_99bd35ec
	Namespace: zm_zdraw
	Checksum: 0x3B082C52
	Offset: 0x5B8
	Size: 0x22C
	Parameters: 0
	Flags: None
*/
function function_99bd35ec()
{
	/#
		level.zdraw.commands = [];
		level.zdraw.commands[#"color"] = &function_54389019;
		level.zdraw.commands[#"alpha"] = &function_82f2d020;
		level.zdraw.commands[#"duration"] = &function_cb18c560;
		level.zdraw.commands[#"seconds"] = &function_82201799;
		level.zdraw.commands[#"scale"] = &function_f7176625;
		level.zdraw.commands[#"radius"] = &function_a026f442;
		level.zdraw.commands[#"sides"] = &function_912c8db9;
		level.zdraw.commands[#"text"] = &function_b5cdeec6;
		level.zdraw.commands[#"star"] = &function_da7503f4;
		level.zdraw.commands[#"sphere"] = &function_3a2c5c6b;
		level.zdraw.commands[#"line"] = &function_25fd7d2a;
	#/
}

/*
	Name: function_b36498d3
	Namespace: zm_zdraw
	Checksum: 0xDEA86066
	Offset: 0x7F0
	Size: 0xF2
	Parameters: 0
	Flags: None
*/
function function_b36498d3()
{
	/#
		level.zdraw.color = level.zdraw.colors[#"default"];
		level.zdraw.alpha = 1;
		level.zdraw.scale = 1;
		level.zdraw.duration = int(1 * 62.5);
		level.zdraw.radius = 8;
		level.zdraw.sides = 10;
		level.zdraw.var_eeef5e89 = (0, 0, 0);
		level.zdraw.var_f78505a1 = 0;
		level.zdraw.var_d15c03f8 = "";
	#/
}

/*
	Name: function_c78d9e67
	Namespace: zm_zdraw
	Checksum: 0x67D0C762
	Offset: 0x8F0
	Size: 0xF8
	Parameters: 0
	Flags: None
*/
function function_c78d9e67()
{
	/#
		level notify(#"hash_79dc2eb04ee1da22");
		level endon(#"hash_79dc2eb04ee1da22");
		for(;;)
		{
			cmd = getdvarstring(#"zdraw");
			if(cmd.size)
			{
				function_b36498d3();
				params = strtok(cmd, "");
				function_cd7ed6c5(params, 0, 1);
				setdvar(#"zdraw", "");
			}
			wait(0.5);
		}
	#/
}

/*
	Name: function_cd7ed6c5
	Namespace: zm_zdraw
	Checksum: 0x9BE799C3
	Offset: 0x9F0
	Size: 0xD2
	Parameters: 3
	Flags: None
*/
function function_cd7ed6c5(var_a99ac828, startat, var_7d04e9ec)
{
	/#
		if(!isdefined(var_7d04e9ec))
		{
			var_7d04e9ec = 0;
		}
		while(isdefined(var_a99ac828[startat]))
		{
			if(isdefined(level.zdraw.commands[var_a99ac828[startat]]))
			{
				startat = [[level.zdraw.commands[var_a99ac828[startat]]]](var_a99ac828, startat + 1);
			}
			else
			{
				if(is_true(var_7d04e9ec))
				{
					function_96c207f("" + var_a99ac828[startat]);
				}
				return startat;
			}
		}
		return startat;
	#/
}

/*
	Name: function_3a2c5c6b
	Namespace: zm_zdraw
	Checksum: 0x9CF6ADAE
	Offset: 0xAD0
	Size: 0x148
	Parameters: 2
	Flags: None
*/
function function_3a2c5c6b(var_a99ac828, startat)
{
	/#
		while(isdefined(var_a99ac828[startat]))
		{
			if(function_b0f457f2(var_a99ac828[startat]))
			{
				var_769ff4d7 = function_b59acc83(var_a99ac828, startat);
				if(var_769ff4d7 > startat)
				{
					startat = var_769ff4d7;
					center = level.zdraw.var_eeef5e89;
					sphere(center, level.zdraw.radius, level.zdraw.color, level.zdraw.alpha, 1, level.zdraw.sides, level.zdraw.duration);
					level.zdraw.var_eeef5e89 = (0, 0, 0);
				}
			}
			else
			{
				var_769ff4d7 = function_cd7ed6c5(var_a99ac828, startat);
				if(var_769ff4d7 > startat)
				{
					startat = var_769ff4d7;
				}
				else
				{
					return startat;
				}
			}
		}
		return startat;
	#/
}

/*
	Name: function_da7503f4
	Namespace: zm_zdraw
	Checksum: 0xF54E326F
	Offset: 0xC28
	Size: 0x118
	Parameters: 2
	Flags: None
*/
function function_da7503f4(var_a99ac828, startat)
{
	/#
		while(isdefined(var_a99ac828[startat]))
		{
			if(function_b0f457f2(var_a99ac828[startat]))
			{
				var_769ff4d7 = function_b59acc83(var_a99ac828, startat);
				if(var_769ff4d7 > startat)
				{
					startat = var_769ff4d7;
					center = level.zdraw.var_eeef5e89;
					debugstar(center, level.zdraw.duration, level.zdraw.color);
					level.zdraw.var_eeef5e89 = (0, 0, 0);
				}
			}
			else
			{
				var_769ff4d7 = function_cd7ed6c5(var_a99ac828, startat);
				if(var_769ff4d7 > startat)
				{
					startat = var_769ff4d7;
				}
				else
				{
					return startat;
				}
			}
		}
		return startat;
	#/
}

/*
	Name: function_25fd7d2a
	Namespace: zm_zdraw
	Checksum: 0xE82D2E0D
	Offset: 0xD50
	Size: 0x178
	Parameters: 2
	Flags: None
*/
function function_25fd7d2a(var_a99ac828, startat)
{
	/#
		level.zdraw.linestart = undefined;
		while(isdefined(var_a99ac828[startat]))
		{
			if(function_b0f457f2(var_a99ac828[startat]))
			{
				var_769ff4d7 = function_b59acc83(var_a99ac828, startat);
				if(var_769ff4d7 > startat)
				{
					startat = var_769ff4d7;
					lineend = level.zdraw.var_eeef5e89;
					if(isdefined(level.zdraw.linestart))
					{
						line(level.zdraw.linestart, lineend, level.zdraw.color, level.zdraw.alpha, 1, level.zdraw.duration);
					}
					level.zdraw.linestart = lineend;
					level.zdraw.var_eeef5e89 = (0, 0, 0);
				}
			}
			else
			{
				var_769ff4d7 = function_cd7ed6c5(var_a99ac828, startat);
				if(var_769ff4d7 > startat)
				{
					startat = var_769ff4d7;
				}
				else
				{
					return startat;
				}
			}
		}
		return startat;
	#/
}

/*
	Name: function_b5cdeec6
	Namespace: zm_zdraw
	Checksum: 0x964169D8
	Offset: 0xED8
	Size: 0x1D0
	Parameters: 2
	Flags: None
*/
function function_b5cdeec6(var_a99ac828, startat)
{
	/#
		level.zdraw.text = "";
		if(isdefined(var_a99ac828[startat]))
		{
			var_769ff4d7 = function_7bf700e4(var_a99ac828, startat);
			if(var_769ff4d7 > startat)
			{
				startat = var_769ff4d7;
				level.zdraw.text = level.zdraw.var_d15c03f8;
				level.zdraw.var_d15c03f8 = "";
			}
		}
		while(isdefined(var_a99ac828[startat]))
		{
			if(function_b0f457f2(var_a99ac828[startat]))
			{
				var_769ff4d7 = function_b59acc83(var_a99ac828, startat);
				if(var_769ff4d7 > startat)
				{
					startat = var_769ff4d7;
					center = level.zdraw.var_eeef5e89;
					print3d(center, level.zdraw.text, level.zdraw.color, level.zdraw.alpha, level.zdraw.scale, level.zdraw.duration);
					level.zdraw.var_eeef5e89 = (0, 0, 0);
				}
			}
			else
			{
				var_769ff4d7 = function_cd7ed6c5(var_a99ac828, startat);
				if(var_769ff4d7 > startat)
				{
					startat = var_769ff4d7;
				}
				else
				{
					return startat;
				}
			}
		}
		return startat;
	#/
}

/*
	Name: function_54389019
	Namespace: zm_zdraw
	Checksum: 0x78A95328
	Offset: 0x10B8
	Size: 0x156
	Parameters: 2
	Flags: None
*/
function function_54389019(var_a99ac828, startat)
{
	/#
		if(isdefined(var_a99ac828[startat]))
		{
			if(function_b0f457f2(var_a99ac828[startat]))
			{
				var_769ff4d7 = function_b59acc83(var_a99ac828, startat);
				if(var_769ff4d7 > startat)
				{
					startat = var_769ff4d7;
					level.zdraw.color = level.zdraw.var_eeef5e89;
					level.zdraw.var_eeef5e89 = (0, 0, 0);
				}
				else
				{
					level.zdraw.color = (1, 1, 1);
				}
			}
			else
			{
				if(isdefined(level.zdraw.colors[var_a99ac828[startat]]))
				{
					level.zdraw.color = level.zdraw.colors[var_a99ac828[startat]];
				}
				else
				{
					level.zdraw.color = (1, 1, 1);
					function_96c207f("" + var_a99ac828[startat]);
				}
				startat = startat + 1;
			}
		}
		return startat;
	#/
}

/*
	Name: function_82f2d020
	Namespace: zm_zdraw
	Checksum: 0x6D79EDF3
	Offset: 0x1218
	Size: 0xA6
	Parameters: 2
	Flags: None
*/
function function_82f2d020(var_a99ac828, startat)
{
	/#
		if(isdefined(var_a99ac828[startat]))
		{
			var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
			if(var_769ff4d7 > startat)
			{
				startat = var_769ff4d7;
				level.zdraw.alpha = level.zdraw.var_f78505a1;
				level.zdraw.var_f78505a1 = 0;
			}
			else
			{
				level.zdraw.alpha = 1;
			}
		}
		return startat;
	#/
}

/*
	Name: function_f7176625
	Namespace: zm_zdraw
	Checksum: 0xB49B4085
	Offset: 0x12C8
	Size: 0xA6
	Parameters: 2
	Flags: None
*/
function function_f7176625(var_a99ac828, startat)
{
	/#
		if(isdefined(var_a99ac828[startat]))
		{
			var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
			if(var_769ff4d7 > startat)
			{
				startat = var_769ff4d7;
				level.zdraw.scale = level.zdraw.var_f78505a1;
				level.zdraw.var_f78505a1 = 0;
			}
			else
			{
				level.zdraw.scale = 1;
			}
		}
		return startat;
	#/
}

/*
	Name: function_cb18c560
	Namespace: zm_zdraw
	Checksum: 0xFC6807BD
	Offset: 0x1378
	Size: 0xD6
	Parameters: 2
	Flags: None
*/
function function_cb18c560(var_a99ac828, startat)
{
	/#
		if(isdefined(var_a99ac828[startat]))
		{
			var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
			if(var_769ff4d7 > startat)
			{
				startat = var_769ff4d7;
				level.zdraw.duration = int(level.zdraw.var_f78505a1);
				level.zdraw.var_f78505a1 = 0;
			}
			else
			{
				level.zdraw.duration = int(1 * 62.5);
			}
		}
		return startat;
	#/
}

/*
	Name: function_82201799
	Namespace: zm_zdraw
	Checksum: 0x896438C3
	Offset: 0x1458
	Size: 0xDE
	Parameters: 2
	Flags: None
*/
function function_82201799(var_a99ac828, startat)
{
	/#
		if(isdefined(var_a99ac828[startat]))
		{
			var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
			if(var_769ff4d7 > startat)
			{
				startat = var_769ff4d7;
				level.zdraw.duration = int(62.5 * level.zdraw.var_f78505a1);
				level.zdraw.var_f78505a1 = 0;
			}
			else
			{
				level.zdraw.duration = int(1 * 62.5);
			}
		}
		return startat;
	#/
}

/*
	Name: function_a026f442
	Namespace: zm_zdraw
	Checksum: 0x89D758DD
	Offset: 0x1540
	Size: 0xA6
	Parameters: 2
	Flags: None
*/
function function_a026f442(var_a99ac828, startat)
{
	/#
		if(isdefined(var_a99ac828[startat]))
		{
			var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
			if(var_769ff4d7 > startat)
			{
				startat = var_769ff4d7;
				level.zdraw.radius = level.zdraw.var_f78505a1;
				level.zdraw.var_f78505a1 = 0;
			}
			else
			{
				level.zdraw.radius = 8;
			}
		}
		return startat;
	#/
}

/*
	Name: function_912c8db9
	Namespace: zm_zdraw
	Checksum: 0x67B6283D
	Offset: 0x15F0
	Size: 0xBA
	Parameters: 2
	Flags: None
*/
function function_912c8db9(var_a99ac828, startat)
{
	/#
		if(isdefined(var_a99ac828[startat]))
		{
			var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
			if(var_769ff4d7 > startat)
			{
				startat = var_769ff4d7;
				level.zdraw.sides = int(level.zdraw.var_f78505a1);
				level.zdraw.var_f78505a1 = 0;
			}
			else
			{
				level.zdraw.sides = 10;
			}
		}
		return startat;
	#/
}

/*
	Name: function_b0f457f2
	Namespace: zm_zdraw
	Checksum: 0xD4EEB650
	Offset: 0x16B8
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_b0f457f2(param)
{
	/#
		if(isdefined(param) && (isint(param) || isfloat(param) || (isstring(param) && strisnumber(param))))
		{
			return true;
		}
		return false;
	#/
}

/*
	Name: function_b59acc83
	Namespace: zm_zdraw
	Checksum: 0x1AAA519E
	Offset: 0x1748
	Size: 0x246
	Parameters: 2
	Flags: None
*/
function function_b59acc83(var_a99ac828, startat)
{
	/#
		if(isdefined(var_a99ac828[startat]))
		{
			var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
			if(var_769ff4d7 > startat)
			{
				startat = var_769ff4d7;
				level.zdraw.var_eeef5e89 = (level.zdraw.var_f78505a1, level.zdraw.var_eeef5e89[1], level.zdraw.var_eeef5e89[2]);
				level.zdraw.var_f78505a1 = 0;
			}
			else
			{
				function_96c207f("");
				return startat;
			}
			var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
			if(var_769ff4d7 > startat)
			{
				startat = var_769ff4d7;
				level.zdraw.var_eeef5e89 = (level.zdraw.var_eeef5e89[0], level.zdraw.var_f78505a1, level.zdraw.var_eeef5e89[2]);
				level.zdraw.var_f78505a1 = 0;
			}
			else
			{
				function_96c207f("");
				return startat;
			}
			var_769ff4d7 = revive_getdvar(var_a99ac828, startat);
			if(var_769ff4d7 > startat)
			{
				startat = var_769ff4d7;
				level.zdraw.var_eeef5e89 = (level.zdraw.var_eeef5e89[0], level.zdraw.var_eeef5e89[1], level.zdraw.var_f78505a1);
				level.zdraw.var_f78505a1 = 0;
			}
			else
			{
				function_96c207f("");
				return startat;
			}
		}
		return startat;
	#/
}

/*
	Name: revive_getdvar
	Namespace: zm_zdraw
	Checksum: 0xB5303EBE
	Offset: 0x1998
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function revive_getdvar(var_a99ac828, startat)
{
	/#
		if(isdefined(var_a99ac828[startat]))
		{
			if(function_b0f457f2(var_a99ac828[startat]))
			{
				level.zdraw.var_f78505a1 = float(var_a99ac828[startat]);
				startat = startat + 1;
			}
		}
		return startat;
	#/
}

/*
	Name: function_7bf700e4
	Namespace: zm_zdraw
	Checksum: 0xACD09615
	Offset: 0x1A18
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_7bf700e4(var_a99ac828, startat)
{
	/#
		if(isdefined(var_a99ac828[startat]))
		{
			level.zdraw.var_d15c03f8 = var_a99ac828[startat];
			startat = startat + 1;
		}
		return startat;
	#/
}

/*
	Name: function_96c207f
	Namespace: zm_zdraw
	Checksum: 0x7B33A272
	Offset: 0x1A70
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_96c207f(msg)
{
	/#
		println("" + msg);
	#/
}

