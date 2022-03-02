#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_74a56359b7d02ab6;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_9fc66ac;

/*
	Name: function_cc5bbc97
	Namespace: namespace_9fc66ac
	Checksum: 0xA8464E64
	Offset: 0x1F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cc5bbc97()
{
	level notify(1173626193);
}

/*
	Name: init
	Namespace: namespace_9fc66ac
	Checksum: 0xD71CFCE2
	Offset: 0x210
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "doa_announce", 1, 11, "int");
}

/*
	Name: main
	Namespace: namespace_9fc66ac
	Checksum: 0x8CD71C10
	Offset: 0x250
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level clientfield::set("doa_announce", 0);
}

/*
	Name: announce
	Namespace: namespace_9fc66ac
	Checksum: 0xFEC2E923
	Offset: 0x280
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function announce(id, var_971e1071)
{
	if(!isdefined(var_971e1071))
	{
		var_971e1071 = 15;
	}
	if(!isdefined(id))
	{
		return;
	}
	/#
		assert(id >= 0 && id <= 72, "");
	#/
	payload = (id << 4) + var_971e1071;
	level clientfield::set("doa_announce", payload);
	util::wait_network_frame();
	level clientfield::set("doa_announce", 0);
}

/*
	Name: function_a77649db
	Namespace: namespace_9fc66ac
	Checksum: 0xF314746B
	Offset: 0x358
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function function_a77649db(name, onoff)
{
	if(is_true(onoff))
	{
		level.var_7704256 = level.musicstate;
		if(name === "slideways" || name === "slideways2" || name === "slideways3")
		{
			function_5e3127a5(undefined, "slideways");
		}
		else
		{
			function_5e3127a5(#"hash_516660c49395257f");
		}
	}
	else
	{
		function_5e3127a5(undefined, level.var_7704256);
	}
}

/*
	Name: function_5beeba99
	Namespace: namespace_9fc66ac
	Checksum: 0x1A9A7562
	Offset: 0x440
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_5beeba99()
{
	if(!isdefined(level.doa.var_39e3fa99))
	{
		return;
	}
	name = [[ level.doa.var_39e3fa99 ]]->getname();
	var_8576a4b1 = level.doa.roundnumber;
	if(name === "boss")
	{
		function_5e3127a5(#"hash_7de402b647d0af4a");
	}
	else
	{
		function_5e3127a5(#"arena");
	}
}

/*
	Name: function_2fc07d61
	Namespace: namespace_9fc66ac
	Checksum: 0xF10E4E6A
	Offset: 0x508
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function function_2fc07d61()
{
	if(!isdefined(level.doa.var_39e3fa99))
	{
		return;
	}
	name = [[ level.doa.var_39e3fa99 ]]->getname();
	var_8576a4b1 = level.doa.roundnumber;
}

/*
	Name: function_65fcd877
	Namespace: namespace_9fc66ac
	Checksum: 0x5AAA9A1C
	Offset: 0x578
	Size: 0xDA
	Parameters: 0
	Flags: Linked
*/
function function_65fcd877()
{
	switch(level.doa.world_state)
	{
		case 0:
		{
			break;
		}
		case 4:
		{
			function_5e3127a5(#"hash_54447a2733c45e2d");
			break;
		}
		case 5:
		{
			function_5e3127a5(#"hash_4599146c78031b2d");
			break;
		}
		case 1:
		{
			function_5e3127a5(undefined, "winners_circle");
			break;
		}
	}
}

/*
	Name: function_5e3127a5
	Namespace: namespace_9fc66ac
	Checksum: 0xF22D5FE8
	Offset: 0x660
	Size: 0x220
	Parameters: 2
	Flags: Linked
*/
function function_5e3127a5(var_75e87d7f, var_6ea1719d)
{
	if(!isdefined(var_6ea1719d))
	{
		var_6ea1719d = undefined;
	}
	if(!isdefined(level.var_402c5b0e))
	{
		level.var_402c5b0e = [];
	}
	if(!isdefined(level.var_402c5b0e[#"arena"]))
	{
		level.var_402c5b0e[#"arena"] = [];
	}
	if(!isdefined(level.var_402c5b0e[#"hash_54447a2733c45e2d"]))
	{
		level.var_402c5b0e[#"hash_54447a2733c45e2d"] = [];
	}
	if(!isdefined(level.var_402c5b0e[#"hash_4599146c78031b2d"]))
	{
		level.var_402c5b0e[#"hash_4599146c78031b2d"] = [];
	}
	if(!isdefined(level.var_402c5b0e[#"hash_7de402b647d0af4a"]))
	{
		level.var_402c5b0e[#"hash_7de402b647d0af4a"] = [];
	}
	if(!isdefined(level.var_402c5b0e[#"hash_516660c49395257f"]))
	{
		level.var_402c5b0e[#"hash_516660c49395257f"] = [];
	}
	if(is_true(level.var_1c6708d0))
	{
		return;
	}
	if(isdefined(var_6ea1719d))
	{
		music::setmusicstate(var_6ea1719d);
		return;
	}
	if(!isdefined(var_75e87d7f))
	{
		return;
	}
	if(level.var_402c5b0e[var_75e87d7f].size <= 0)
	{
		function_914016fe(var_75e87d7f);
	}
	music::setmusicstate(level.var_402c5b0e[var_75e87d7f][0]);
	level.var_402c5b0e[var_75e87d7f] = array::remove_index(level.var_402c5b0e[var_75e87d7f], 0);
}

/*
	Name: function_914016fe
	Namespace: namespace_9fc66ac
	Checksum: 0x9FEF56FB
	Offset: 0x888
	Size: 0x178
	Parameters: 1
	Flags: Linked
*/
function function_914016fe(var_75e87d7f)
{
	switch(var_75e87d7f)
	{
		case "arena":
		{
			min = 0;
			max = 8;
			var_69836136 = "arena_0";
			break;
		}
		case "hash_54447a2733c45e2d":
		{
			min = 0;
			max = 2;
			var_69836136 = "overworld_0";
			break;
		}
		case "hash_4599146c78031b2d":
		{
			min = 0;
			max = 2;
			var_69836136 = "dungeon_0";
			break;
		}
		case "hash_7de402b647d0af4a":
		{
			min = 0;
			max = 0;
			var_69836136 = "bossfight_0";
			break;
		}
		case "hash_516660c49395257f":
		{
			min = 0;
			max = 1;
			var_69836136 = "bonusroom_0";
			break;
		}
	}
	for(i = min; i < max + 1; i++)
	{
		level.var_402c5b0e[var_75e87d7f][i] = var_69836136 + i;
	}
	level.var_402c5b0e[var_75e87d7f] = array::randomize(level.var_402c5b0e[var_75e87d7f]);
}

/*
	Name: networksafereset
	Namespace: namespace_9fc66ac
	Checksum: 0xEB62FF3E
	Offset: 0xA10
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function networksafereset()
{
	self notify("736ddcf43ece996d");
	self endon("736ddcf43ece996d");
	while(true)
	{
		level.doa.var_3d0539c1 = 0;
		util::wait_network_frame();
	}
}

/*
	Name: sndisnetworksafe
	Namespace: namespace_9fc66ac
	Checksum: 0x957CA0B5
	Offset: 0xA68
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function sndisnetworksafe()
{
	if(!isdefined(level.doa.var_3d0539c1))
	{
		level thread networksafereset();
	}
	if(level.doa.var_3d0539c1 >= 2)
	{
		return false;
	}
	level.doa.var_3d0539c1++;
	return true;
}

/*
	Name: function_ba33d23d
	Namespace: namespace_9fc66ac
	Checksum: 0xCB4297A6
	Offset: 0xAE0
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function function_ba33d23d(var_78c0dedd, var_8871bfcd, var_43d8daa2)
{
	self.var_2b45c795 = {#death:var_43d8daa2, #hash_71846889:var_8871bfcd, #hash_6ceeee01:var_78c0dedd};
	self thread function_7e8995ce();
	self thread function_55aa8bb7();
}

/*
	Name: function_7e8995ce
	Namespace: namespace_9fc66ac
	Checksum: 0x397F5DF9
	Offset: 0xB78
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_7e8995ce()
{
	str_alias = self.var_2b45c795.death;
	var_acdd3525 = self.var_2b45c795.var_6ceeee01;
	var_9a9e90a8 = self.var_2b45c795.var_71846889;
	self waittill(#"death");
	if(isdefined(self))
	{
		if(isdefined(var_acdd3525))
		{
			self stopsound(var_acdd3525);
		}
		if(isdefined(var_9a9e90a8))
		{
			self stopsound(var_9a9e90a8);
		}
		if(isdefined(str_alias))
		{
			self playsound(str_alias);
		}
	}
}

/*
	Name: function_55aa8bb7
	Namespace: namespace_9fc66ac
	Checksum: 0x44B54705
	Offset: 0xC58
	Size: 0x108
	Parameters: 0
	Flags: Linked
*/
function function_55aa8bb7()
{
	self endon(#"death");
	wait(1);
	if(!isdefined(self.var_2b45c795))
	{
		return;
	}
	while(true)
	{
		if(isdefined(self.zombie_move_speed))
		{
			if(self.zombie_move_speed === "sprint" || self.zombie_move_speed === "run")
			{
				str_alias = self.var_2b45c795.var_71846889;
			}
			else
			{
				str_alias = self.var_2b45c795.var_6ceeee01;
			}
		}
		else
		{
			str_alias = self.var_2b45c795.var_71846889;
		}
		if(sndisnetworksafe())
		{
			self playsound(str_alias);
		}
		wait(randomfloatrange(1.5, 5));
	}
}

