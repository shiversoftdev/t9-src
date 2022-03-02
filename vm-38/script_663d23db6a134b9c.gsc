#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_8dac58da;

/*
	Name: function_7f73070a
	Namespace: namespace_8dac58da
	Checksum: 0x85C94511
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7f73070a()
{
	level notify(301700037);
}

/*
	Name: init
	Namespace: namespace_8dac58da
	Checksum: 0xC742E586
	Offset: 0xB8
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "" + #"hash_5a41b1632428880c", 1, 1, "int");
	clientfield::register("world", "" + #"hash_22f0944e4bd4dea9", 1, 1, "int");
	clientfield::register("world", "" + #"hash_c9774e0d25f882a", 1, 1, "int");
	clientfield::register("world", "" + #"hash_21e00c65edc6594c", 1, 1, "int");
	clientfield::register("world", "" + #"hash_249ac6ef9989bee4", 1, 1, "int");
	level thread function_d20f5e48();
}

/*
	Name: function_a7e6c47e
	Namespace: namespace_8dac58da
	Checksum: 0x1C021F48
	Offset: 0x220
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_a7e6c47e(state)
{
	if(state)
	{
		level clientfield::set("" + #"hash_21e00c65edc6594c", 1);
	}
	else
	{
		level clientfield::set("" + #"hash_21e00c65edc6594c", 0);
	}
}

/*
	Name: function_1a3aacac
	Namespace: namespace_8dac58da
	Checksum: 0xA7AB5B27
	Offset: 0x2B0
	Size: 0x1EA
	Parameters: 1
	Flags: Linked
*/
function function_1a3aacac(state)
{
	level endon(#"end_game");
	switch(state)
	{
		case 1:
		{
			level clientfield::set("" + #"hash_5a41b1632428880c", 1);
			break;
		}
		case 2:
		{
			level clientfield::set("" + #"hash_22f0944e4bd4dea9", 1);
			break;
		}
		case 3:
		{
			level clientfield::set("" + #"hash_c9774e0d25f882a", 1);
			break;
		}
		case 4:
		{
			level clientfield::set("" + #"hash_5a41b1632428880c", 0);
			break;
		}
		case 5:
		{
			level clientfield::set("" + #"hash_22f0944e4bd4dea9", 0);
			break;
		}
		case 6:
		{
			level clientfield::set("" + #"hash_c9774e0d25f882a", 0);
			break;
		}
	}
}

/*
	Name: function_d20f5e48
	Namespace: namespace_8dac58da
	Checksum: 0xCEE6652A
	Offset: 0x4A8
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_d20f5e48()
{
	level endon(#"end_game");
	while(true)
	{
		level flag::wait_till("power_on");
		level clientfield::set("" + #"hash_249ac6ef9989bee4", 1);
		level flag::wait_till_clear("power_on");
		level clientfield::set("" + #"hash_249ac6ef9989bee4", 0);
	}
}

