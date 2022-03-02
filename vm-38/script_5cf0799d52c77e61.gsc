#using script_17dcb1172e441bf6;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_47851dbeea22fe66;
#using script_634ae70c663d1cc9;
#using script_774302f762d76254;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_a98303de;

/*
	Name: function_7a706cb
	Namespace: namespace_a98303de
	Checksum: 0xEE1F3EB3
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7a706cb()
{
	level notify(478457215);
}

#namespace namespace_98036e8c;

/*
	Name: init
	Namespace: namespace_98036e8c
	Checksum: 0x80F724D1
	Offset: 0x150
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: main
	Namespace: namespace_98036e8c
	Checksum: 0x55AF9D2E
	Offset: 0x160
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level.doa.var_584a046 = [];
}

/*
	Name: function_f5114543
	Namespace: namespace_98036e8c
	Checksum: 0x3C1672CC
	Offset: 0x180
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_f5114543()
{
	self notify("4e7c7f84f1757943");
	self endon("4e7c7f84f1757943");
	self thread namespace_268747c0::function_978c05b5();
	result = undefined;
	result = self waittill(#"hash_3e251384a5400dce");
	arrayremovevalue(level.doa.var_584a046, self);
	if(isdefined(self.script_model))
	{
		self.script_model delete();
		self.script_model = undefined;
	}
	self setmovingplatformenabled(0);
}

/*
	Name: function_2c3d65c4
	Namespace: namespace_98036e8c
	Checksum: 0xC21050CD
	Offset: 0x258
	Size: 0x2A0
	Parameters: 1
	Flags: Linked
*/
function function_2c3d65c4(platform)
{
	/#
		assert(isdefined(platform.target), "");
	#/
	if(!isdefined(platform.original_origin))
	{
		platform.original_origin = platform.origin;
		toks = strtok(platform.script_noteworthy, ";");
		/#
			assert(toks.size >= 2, "");
		#/
		/#
			assert(toks[0] == "" || toks[0] == "", "");
		#/
		platform.type = (toks[0] == "mover" ? 1 : 0);
		platform.duration = int(toks[1]);
		target = struct::get(platform.target, "targetname");
		if(platform.type == 0)
		{
			diffz = target.origin[2] - platform.origin[2];
			platform.destination = platform.origin + (0, 0, diffz);
		}
		else if(platform.type == 1)
		{
			diffx = target.origin[0] - platform.origin[0];
			diffy = target.origin[1] - platform.origin[1];
			if(diffx > diffy)
			{
				platform.destination = platform.origin + (diffx, 0, 0);
			}
			else
			{
				platform.destination = platform.origin + (0, diffy, 0);
			}
		}
	}
	platform.origin = platform.original_origin;
	platform setmovingplatformenabled(1);
	platform thread function_27b409b9();
	return platform;
}

/*
	Name: function_1ba8281d
	Namespace: namespace_98036e8c
	Checksum: 0xFAE48954
	Offset: 0x500
	Size: 0xF0
	Parameters: 0
	Flags: Linked
*/
function function_1ba8281d()
{
	if(isdefined(level.doa.var_a77e6349))
	{
		platforms = [[ level.doa.var_a77e6349 ]]->function_87f950c1("platform");
	}
	else
	{
		platforms = [[ level.doa.var_39e3fa99 ]]->function_242886d5("platform");
	}
	foreach(platform in platforms)
	{
		function_2c3d65c4(platform);
	}
}

/*
	Name: function_27b409b9
	Namespace: namespace_98036e8c
	Checksum: 0x39884C9E
	Offset: 0x5F8
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_27b409b9()
{
	self notify("177f39a01555cd50");
	self endon("177f39a01555cd50");
	level endon(#"game_over");
	self endon(#"hash_3e251384a5400dce");
	self thread function_f5114543();
	while(true)
	{
		self moveto(self.destination, self.duration);
		self waittill(#"movedone");
		wait(1);
		self moveto(self.original_origin, self.duration);
		self waittill(#"movedone");
		wait(1);
	}
}

