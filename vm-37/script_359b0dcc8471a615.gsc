#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_7fe06af4;

/*
	Name: init
	Namespace: namespace_7fe06af4
	Checksum: 0x5D2E7666
	Offset: 0xF8
	Size: 0x4C
	Parameters: 1
	Flags: Event
*/
event init(eventstruct)
{
	clientfield::register("world", "" + #"hash_5e7d02ead4a03f50", 1, 2, "int");
}

/*
	Name: main
	Namespace: namespace_7fe06af4
	Checksum: 0x4FAB4A05
	Offset: 0x150
	Size: 0xB4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level thread function_5089875d();
	/#
		level thread function_bcce4bc0();
	#/
	if(!function_a23c96ea())
	{
		return;
	}
	callback::function_98a0917d(&function_98a0917d);
	level.var_d38af2b = 0;
	level.headless_mannequin_count = 0;
	level.destructible_callbacks[#"headless"] = &mannequin_headless;
}

/*
	Name: function_5089875d
	Namespace: namespace_7fe06af4
	Checksum: 0x4CA385E5
	Offset: 0x210
	Size: 0x2B0
	Parameters: 0
	Flags: Linked
*/
function function_5089875d()
{
	mannequins = getentarray("ee_mannequin", "script_noteworthy");
	var_ecf867b5 = getentarray("ee_mannequin_clip", "targetname");
	var_1c94845d = [];
	mannequins = array::randomize(mannequins);
	var_8091ece = mannequins.size;
	if(var_8091ece > 28)
	{
		var_8091ece = 28;
	}
	setdvar(#"hash_21da43870d56a220", var_8091ece);
	foreach(i, mannequin in mannequins)
	{
		var_4c9b75d1 = arraygetclosest(mannequin.origin, var_ecf867b5);
		if(i < 28)
		{
			if(isdefined(var_4c9b75d1))
			{
				var_4c9b75d1 disconnectpaths();
			}
			continue;
		}
		if(isdefined(var_4c9b75d1))
		{
			var_4c9b75d1 delete();
		}
		if(!isdefined(var_1c94845d))
		{
			var_1c94845d = [];
		}
		else if(!isarray(var_1c94845d))
		{
			var_1c94845d = array(var_1c94845d);
		}
		var_1c94845d[var_1c94845d.size] = mannequin;
	}
	array::delete_all(var_1c94845d);
	/#
		if(getdvarint(#"hash_42a5a4b0b2854ca1", 0))
		{
			foreach(mannequin in mannequins)
			{
				if(isdefined(mannequin))
				{
					mannequin thread function_fa68a2e6();
				}
			}
		}
	#/
}

/*
	Name: function_98a0917d
	Namespace: namespace_7fe06af4
	Checksum: 0xD6E9B583
	Offset: 0x4C8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_98a0917d()
{
	level.mannequin_time = gettime();
	/#
		level thread function_9c9ba5();
	#/
	/#
		level thread function_ee18bf8f();
	#/
}

/*
	Name: mannequin_headless
	Namespace: namespace_7fe06af4
	Checksum: 0x4091155D
	Offset: 0x518
	Size: 0x14C
	Parameters: 7
	Flags: Linked
*/
function mannequin_headless(destructible_event, attacker, weapon, piece_index, point, dir, mod)
{
	if(!isdefined(level.mannequin_time))
	{
		return;
	}
	var_d1e925fc = int(getdvarint(#"hash_5d828d352b1ef6bc", 120) * 1000);
	if(gettime() < (level.mannequin_time + var_d1e925fc) || !var_d1e925fc)
	{
		level.headless_mannequin_count++;
		var_fa149ac8 = getdvarint(#"hash_21da43870d56a220", 28);
		if(level.headless_mannequin_count >= var_fa149ac8 && level.var_d38af2b == 0)
		{
			level.destructible_callbacks[#"headless"] = undefined;
			level thread function_d38af2b();
		}
	}
}

/*
	Name: function_d38af2b
	Namespace: namespace_7fe06af4
	Checksum: 0xF2463C85
	Offset: 0x670
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_d38af2b()
{
	function_a150d07b(1);
}

/*
	Name: function_a150d07b
	Namespace: namespace_7fe06af4
	Checksum: 0x20CA9AC4
	Offset: 0x698
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function function_a150d07b(randomize)
{
	if(!isdefined(randomize))
	{
		randomize = 0;
	}
	if(randomize)
	{
		state = randomintrange(1, 3);
		setdvar(#"hash_41e6a8d79082e88", state);
	}
	if(!isdefined(state))
	{
		state = getdvarint(#"hash_41e6a8d79082e88", 0);
	}
	if(level.var_ffae3a51 === state)
	{
		return;
	}
	level.var_ffae3a51 = state;
	if(state != 0)
	{
		level.var_97902f80 = 1;
		music::setmusicstate("ee_oneshot", undefined, 3);
	}
	else
	{
		music::setmusicstate("");
		level.var_97902f80 = 0;
	}
	level clientfield::set("" + #"hash_5e7d02ead4a03f50", state);
}

/*
	Name: function_a23c96ea
	Namespace: namespace_7fe06af4
	Checksum: 0x21ACED1
	Offset: 0x7F8
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function function_a23c96ea()
{
	if(getdvarint(#"hash_2abc0a6ee874fbc7", 0))
	{
		return true;
	}
	if(sessionmodeisonlinegame() && !sessionmodeisprivateonlinegame())
	{
		return false;
	}
	return true;
}

/*
	Name: function_bcce4bc0
	Namespace: namespace_7fe06af4
	Checksum: 0x78A3991D
	Offset: 0x868
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_bcce4bc0()
{
	/#
		waitframe(1);
		mapname = util::function_53bbf9d2();
		adddebugcommand("");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
	#/
}

/*
	Name: function_9c9ba5
	Namespace: namespace_7fe06af4
	Checksum: 0x42D557E
	Offset: 0x908
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function function_9c9ba5()
{
	/#
		level endon(#"game_ended");
		while(true)
		{
			wait(0.5);
			function_a150d07b();
		}
	#/
}

/*
	Name: function_ee18bf8f
	Namespace: namespace_7fe06af4
	Checksum: 0x4C28FDA7
	Offset: 0x950
	Size: 0xA8
	Parameters: 0
	Flags: None
*/
function function_ee18bf8f()
{
	/#
		level endon(#"game_ended");
		while(true)
		{
			wait(0.5);
			state = getdvarint(#"hash_4c0f0935eafdfaa", 0);
			if(state || state === 2)
			{
				function_d38af2b();
				setdvar(#"hash_4c0f0935eafdfaa", 0);
			}
		}
	#/
}

/*
	Name: function_fa68a2e6
	Namespace: namespace_7fe06af4
	Checksum: 0xB2981B21
	Offset: 0xA00
	Size: 0x5E
	Parameters: 0
	Flags: None
*/
function function_fa68a2e6()
{
	/#
		self endon(#"death", #"headless");
		while(true)
		{
			sphere(self.origin, 16, (0, 1, 0));
			waitframe(1);
		}
	#/
}

