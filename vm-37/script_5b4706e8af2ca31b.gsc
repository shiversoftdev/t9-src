#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace rappel;

/*
	Name: __init__system__
	Namespace: rappel
	Checksum: 0x11ADEB05
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"rappel", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: rappel
	Checksum: 0x879B64FE
	Offset: 0x148
	Size: 0x20C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.ascendstarts = struct::get_array("ascend_begin", "script_noteworthy");
	level.descendstarts = struct::get_array("descend_begin", "script_noteworthy");
	level.ascendstructs = [];
	foreach(a in level.ascendstarts)
	{
		function_731b9325(a, 1);
	}
	foreach(a in level.descendstarts)
	{
		function_731b9325(a, 0);
	}
	callback::function_532a4f74(&function_1858cdf2);
	callback::function_c16ce2bc(&function_7e99ed03);
	callback::on_player_killed(&on_player_killed);
	callback::on_disconnect(&on_player_disconnect);
	/#
		level thread debug_rappel();
	#/
}

/*
	Name: function_1858cdf2
	Namespace: rappel
	Checksum: 0x25D352D
	Offset: 0x360
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_1858cdf2()
{
	/#
		assert(isdefined(self.ascender));
	#/
	/#
		assert(is_true(self.ascender.inuse));
	#/
}

/*
	Name: function_7e99ed03
	Namespace: rappel
	Checksum: 0x113B0483
	Offset: 0x3C8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_7e99ed03()
{
	self function_1fd398d8();
}

/*
	Name: on_player_killed
	Namespace: rappel
	Checksum: 0x5142EF6E
	Offset: 0x3F0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(params)
{
	self function_1fd398d8();
}

/*
	Name: on_player_disconnect
	Namespace: rappel
	Checksum: 0x252C0ABE
	Offset: 0x420
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_disconnect()
{
	self function_1fd398d8();
}

/*
	Name: function_1fd398d8
	Namespace: rappel
	Checksum: 0xFAE56930
	Offset: 0x448
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_1fd398d8(ascender)
{
	function_752582be(self.ascender);
	self.ascender = undefined;
}

/*
	Name: function_752582be
	Namespace: rappel
	Checksum: 0xA86BEAD8
	Offset: 0x480
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_752582be(ascender)
{
	if(isdefined(ascender))
	{
		ascender.inuse = 0;
		hint = #"hash_4079b1df1f035718";
		ascender.trigger sethintstring(hint);
		if(isdefined(ascender.ascendstructend) && isdefined(ascender.ascendstructend.trigger))
		{
			ascender.ascendstructend.trigger sethintstring(hint);
			ascender.ascendstructend.inuse = 0;
		}
	}
}

/*
	Name: function_c487f6c0
	Namespace: rappel
	Checksum: 0xA180412A
	Offset: 0x540
	Size: 0x158
	Parameters: 1
	Flags: Linked
*/
function function_c487f6c0(var_13bb8c94)
{
	if(!isdefined(var_13bb8c94.radius))
	{
		var_13bb8c94.radius = 128;
	}
	var_3d783ef7 = spawn("trigger_radius_use", var_13bb8c94.origin + vectorscale((0, 0, 1), 16), 0, var_13bb8c94.radius, 128);
	var_3d783ef7.var_13bb8c94 = var_13bb8c94;
	var_3d783ef7 triggerignoreteam();
	var_3d783ef7 setvisibletoall();
	var_3d783ef7 setteamfortrigger(#"none");
	var_3d783ef7 setcursorhint("HINT_NOICON");
	var_3d783ef7 function_95c6df5a();
	hint = #"hash_4079b1df1f035718";
	var_3d783ef7 sethintstring(hint);
	var_3d783ef7 callback::on_trigger(&function_4945d10b);
	return var_3d783ef7;
}

/*
	Name: function_731b9325
	Namespace: rappel
	Checksum: 0x6AAB77E9
	Offset: 0x6A0
	Size: 0xFA
	Parameters: 2
	Flags: Linked
*/
function function_731b9325(struct, dir)
{
	endstruct = struct::get(struct.target, "targetname");
	var_1802b8ab = struct::get(endstruct.target, "targetname");
	level.ascendstructs[struct.target] = struct;
	struct.ascendstructend = endstruct;
	struct.ascendstructout = var_1802b8ab;
	struct.inuse = 0;
	struct.exitangle = struct.angles + vectorscale((0, 1, 0), 180);
	struct.startangle = struct.angles;
	struct.dir = dir;
	struct.trigger = function_c487f6c0(struct);
}

/*
	Name: function_8b08f357
	Namespace: rappel
	Checksum: 0x5020D36B
	Offset: 0x7A8
	Size: 0x96
	Parameters: 2
	Flags: Linked
*/
function function_8b08f357(player, var_13bb8c94)
{
	if(is_true(var_13bb8c94.inuse))
	{
		return false;
	}
	if(is_true(self.laststand))
	{
		return false;
	}
	if(player getstance() == "prone")
	{
		return false;
	}
	if(!player function_c73c0ee6())
	{
		return false;
	}
	return true;
}

/*
	Name: function_4945d10b
	Namespace: rappel
	Checksum: 0x606067DA
	Offset: 0x848
	Size: 0x1FC
	Parameters: 1
	Flags: Linked
*/
function function_4945d10b(var_df401071)
{
	player = var_df401071.activator;
	level endon(#"game_ended");
	player endon(#"death");
	player endon(#"disconnect");
	player endon(#"hash_210eae4f25120927");
	var_13bb8c94 = self.var_13bb8c94;
	if(!function_8b08f357(player, var_13bb8c94))
	{
		return;
	}
	var_5c1b57ee = var_13bb8c94.ascendstructend;
	var_81d2b10b = distance(var_5c1b57ee.origin, var_13bb8c94.origin);
	if(var_13bb8c94.origin[2] > var_5c1b57ee.origin[2])
	{
		var_81d2b10b = var_81d2b10b * -1;
	}
	player.ascender = var_13bb8c94;
	hint = #"hash_607b12b5d5733b3e";
	var_13bb8c94.trigger sethintstring(hint);
	var_13bb8c94.inuse = 1;
	if(isdefined(var_5c1b57ee) && isdefined(var_5c1b57ee.trigger))
	{
		var_5c1b57ee.trigger sethintstring(hint);
		var_5c1b57ee.inuse = 1;
	}
	var_13bb8c94 thread function_cf4e25e5();
	player function_256406a6(var_13bb8c94.origin, var_13bb8c94.angles[1], var_81d2b10b);
}

/*
	Name: function_cf4e25e5
	Namespace: rappel
	Checksum: 0x50E36698
	Offset: 0xA50
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_cf4e25e5()
{
	self notify("6bdfd780c539990f");
	self endon("6bdfd780c539990f");
	wait(5);
	function_752582be(self);
}

/*
	Name: debug_rappel
	Namespace: rappel
	Checksum: 0xB5BF0A92
	Offset: 0xA98
	Size: 0x164
	Parameters: 0
	Flags: None
*/
function debug_rappel()
{
	/#
		while(getdvarint(#"hash_7cfb013f9bd630b6", 0))
		{
			waitframe(1);
			foreach(rappel in level.ascendstarts)
			{
				var_86660d95 = rappel.origin;
				print3d(var_86660d95 + vectorscale((0, 0, 1), 16), rappel.targetname, (0, 1, 0));
				sphere(var_86660d95, 4, (0, 1, 0));
				circle(var_86660d95, 24, (0, 1, 0), 1, 1);
				line(var_86660d95, rappel.ascendstructend.origin, (0, 1, 0));
			}
		}
	#/
}

