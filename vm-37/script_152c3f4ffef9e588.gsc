#using script_1f41849126bfc83d;
#using script_49e18fd5437112e;
#using script_50fe40f0d2eaa66c;
#using script_c8d806d2487b617;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace radiation;

/*
	Name: function_89f2df9
	Namespace: radiation
	Checksum: 0x6110E9B0
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"radiation", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: radiation
	Checksum: 0x6C07168D
	Offset: 0x110
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	if(level.basegametype === "fireteam_dirty_bomb")
	{
		return;
	}
	level thread function_1e3ac913();
	callback::on_spawned(&function_e4a4b07b);
}

/*
	Name: function_3c3e40b6
	Namespace: radiation
	Checksum: 0xF529CDDB
	Offset: 0x188
	Size: 0xFA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3c3e40b6()
{
	if(!isdefined(level.radiation))
	{
		/#
			assertmsg("");
		#/
		return;
	}
	if(level.radiation.levels.size <= 0)
	{
		/#
			assertmsg("");
		#/
		return;
	}
	if(isdefined(self.radiation))
	{
		function_770871f5(self);
	}
	self.radiation = {};
	self.radiation.var_abd7d46a = level.radiation.levels[0].maxhealth;
	self.radiation.var_32adf91d = 0;
	self.radiation.sickness = [];
	self.radiation.var_393e0e31 = 0;
}

/*
	Name: function_e4a4b07b
	Namespace: radiation
	Checksum: 0xA47D7A28
	Offset: 0x290
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e4a4b07b()
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	/#
		assert(isplayer(self));
	#/
	self function_3c3e40b6();
}

/*
	Name: function_1e3ac913
	Namespace: radiation
	Checksum: 0x51AEBCD0
	Offset: 0x2F8
	Size: 0x126
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1e3ac913()
{
	level endon(#"game_ended");
	var_1a1c0d86 = 0;
	while(true)
	{
		foreach(index, player in getplayers())
		{
			if((index % 10) == var_1a1c0d86)
			{
				if(player.sessionstate != "playing" || !isalive(player))
				{
					continue;
				}
				player function_acb192d7();
			}
		}
		var_1a1c0d86 = (var_1a1c0d86 + 1) % 10;
		waitframe(1);
	}
}

/*
	Name: function_acb192d7
	Namespace: radiation
	Checksum: 0x40552C0A
	Offset: 0x428
	Size: 0x1E4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_acb192d7()
{
	if(!isplayer(self))
	{
		/#
			assert(0);
		#/
		return;
	}
	var_32adf91d = self.radiation.var_32adf91d;
	radiation = level.radiation.levels[var_32adf91d];
	if(!isdefined(radiation))
	{
		return;
	}
	if(var_32adf91d == 0 && self.radiation.var_abd7d46a == radiation.maxhealth && self.radiation.sickness.size == 0)
	{
		return;
	}
	timems = gettime();
	foreach(var_46bdb64c in self.radiation.sickness)
	{
		var_79904d8d = radiation.sickness[sickness];
		if(timems - var_46bdb64c.var_3e39b26c > var_46bdb64c.var_f8804aa0)
		{
			function_f68871f2(self, sickness);
		}
	}
	var_bb2d7819 = (timems - self.radiation.var_393e0e31) >= radiation.var_e8f27947;
	if(!var_bb2d7819)
	{
		return;
	}
	function_54031aad(self);
}

/*
	Name: function_770871f5
	Namespace: radiation
	Checksum: 0x58B93E82
	Offset: 0x618
	Size: 0xA0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_770871f5(player)
{
	foreach(var_46bdb64c in player.radiation.sickness)
	{
		function_f68871f2(player, sickness);
	}
}

/*
	Name: function_54031aad
	Namespace: radiation
	Checksum: 0x4943944F
	Offset: 0x6C0
	Size: 0x17C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_54031aad(player)
{
	var_32adf91d = player.radiation.var_32adf91d;
	radiation = level.radiation.levels[var_32adf91d];
	timems = gettime();
	player.radiation.var_393e0e31 = timems;
	var_62a95841 = radiation.var_9653dad7;
	if(radiation.var_9653dad7 < radiation.var_21a59205)
	{
		var_62a95841 = randomintrange(radiation.var_9653dad7, radiation.var_21a59205);
	}
	if(var_62a95841 <= 0)
	{
		return;
	}
	var_2ef8e686 = array::randomize(getarraykeys(radiation.sickness));
	for(var_f50d4e4a = 0; var_f50d4e4a < var_62a95841 && var_f50d4e4a < var_2ef8e686.size; var_f50d4e4a++)
	{
		var_f1869be0 = var_2ef8e686[var_f50d4e4a];
		if(isdefined(player.radiation.sickness[var_f1869be0]))
		{
			continue;
		}
		function_e2336716(player, var_32adf91d, var_f1869be0);
	}
}

/*
	Name: function_e2336716
	Namespace: radiation
	Checksum: 0xF131FFE4
	Offset: 0x848
	Size: 0x174
	Parameters: 3
	Flags: Linked
*/
function function_e2336716(player, radiationlevel, sickness)
{
	if(!isplayer(player))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!function_7a600918(sickness))
	{
		/#
			assert(0);
		#/
		return;
	}
	var_46bdb64c = level.radiation.levels[radiationlevel].sickness[sickness];
	var_2fbd0753 = level.radiation.sickness[sickness].initfunction;
	if(isdefined(var_2fbd0753))
	{
		player [[var_2fbd0753]]();
	}
	/#
		assert(!isdefined(player.radiation.sickness[sickness]));
	#/
	var_768b78bb = {};
	var_768b78bb.var_3e39b26c = gettime();
	var_768b78bb.var_f8804aa0 = var_46bdb64c.duration;
	player.radiation.sickness[sickness] = var_768b78bb;
	namespace_6615ea91::function_59621e3c(player, sickness);
}

/*
	Name: function_f68871f2
	Namespace: radiation
	Checksum: 0x2692243
	Offset: 0x9C8
	Size: 0x114
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f68871f2(player, sickness)
{
	if(!isplayer(player))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!function_7a600918(sickness))
	{
		/#
			assert(0);
		#/
		return;
	}
	var_46bdb64c = level.radiation.sickness[sickness];
	if(isdefined(var_46bdb64c.var_dad6905e))
	{
		player [[var_46bdb64c.var_dad6905e]]();
	}
	player.radiation.sickness[sickness] = undefined;
	arrayremovevalue(player.radiation.sickness, undefined, 1);
	namespace_6615ea91::function_5cf1c0a(player, sickness);
}

/*
	Name: function_d90ea0e7
	Namespace: radiation
	Checksum: 0xA182DC74
	Offset: 0xAE8
	Size: 0x16C
	Parameters: 3
	Flags: Linked
*/
function function_d90ea0e7(sickness, initfunction, var_dad6905e)
{
	if(!isdefined(initfunction))
	{
		initfunction = undefined;
	}
	if(!isdefined(var_dad6905e))
	{
		var_dad6905e = undefined;
	}
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	namespace_956bd4dd::function_f45ee99d();
	if(isdefined(level.radiation.sickness[sickness]))
	{
		/#
			assertmsg(("" + sickness) + "");
		#/
		return;
	}
	if(isdefined(initfunction) && !isfunctionptr(initfunction))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(isdefined(var_dad6905e) && !isfunctionptr(var_dad6905e))
	{
		/#
			assert(0);
		#/
		return;
	}
	var_46bdb64c = {};
	var_46bdb64c.initfunction = initfunction;
	var_46bdb64c.var_dad6905e = var_dad6905e;
	level.radiation.sickness[sickness] = var_46bdb64c;
}

/*
	Name: function_3ccea89c
	Namespace: radiation
	Checksum: 0x446B0D27
	Offset: 0xC60
	Size: 0xA6
	Parameters: 2
	Flags: None
*/
function function_3ccea89c(player, count)
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	if(!isplayer(player))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isint(count) && !isfloat(count))
	{
		/#
			assert(0);
		#/
		return;
	}
}

/*
	Name: function_c9c6dda1
	Namespace: radiation
	Checksum: 0xF5673900
	Offset: 0xD10
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function function_c9c6dda1(player)
{
	if(!isplayer(player))
	{
		/#
			assert(0);
		#/
		return;
	}
	return player.radiation.var_32adf91d;
}

/*
	Name: function_2f76803d
	Namespace: radiation
	Checksum: 0xA678A99
	Offset: 0xD68
	Size: 0x3BC
	Parameters: 2
	Flags: None
*/
function function_2f76803d(player, count)
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	if(!isplayer(player))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isint(count) && !isfloat(count))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isalive(player))
	{
		return;
	}
	if(player util::function_88c74107())
	{
		return;
	}
	namespace_6615ea91::function_36a2c924(player, count / 5);
	if(isdefined(level.var_c3a003ad))
	{
		count = player [[level.var_c3a003ad]](count);
		if(!isint(count) && !isfloat(count))
		{
			/#
				assert(0);
			#/
			return;
		}
	}
	if(count == 0)
	{
		return;
	}
	var_5a9583ae = player.radiation.var_abd7d46a - count;
	if(var_5a9583ae > 0)
	{
		player.radiation.var_abd7d46a = var_5a9583ae;
		var_32adf91d = player.radiation.var_32adf91d;
		namespace_6615ea91::function_835a6746(player, player.radiation.var_abd7d46a / level.radiation.levels[var_32adf91d].maxhealth);
		return;
	}
	player.radiation.var_32adf91d++;
	if(player.radiation.var_32adf91d > level.radiation.levels.size)
	{
		player.radiation.var_32adf91d--;
	}
	var_32adf91d = player.radiation.var_32adf91d;
	if(var_32adf91d >= level.radiation.levels.size)
	{
		namespace_6615ea91::function_835a6746(player, 1);
		player kill();
		return;
	}
	namespace_6615ea91::function_137e7814(player, player.radiation.var_32adf91d + 1);
	player.radiation.var_abd7d46a = level.radiation.levels[var_32adf91d].maxhealth - var_5a9583ae;
	namespace_6615ea91::function_835a6746(player, player.radiation.var_abd7d46a / level.radiation.levels[var_32adf91d].maxhealth);
	function_770871f5(player);
	function_54031aad(player);
}

