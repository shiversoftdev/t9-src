#using script_1029986e2bc8ca8e;
#using script_2255a7ad3edc838f;
#using script_2618e0f3e5e11649;
#using script_3411bb48d41bd3b;
#using script_3f9e0dc8454d98e1;
#using script_4108035fe400ce67;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\rat_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_7d3a1543;

/*
	Name: function_b0702527
	Namespace: namespace_7d3a1543
	Checksum: 0x6473DA15
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b0702527()
{
	level notify(1990590965);
}

#namespace rat;

/*
	Name: function_89f2df9
	Namespace: rat
	Checksum: 0x640A85A9
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	/#
		system::register(#"hash_2a909a3d7374cf00", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: rat
	Checksum: 0xE331388D
	Offset: 0x120
	Size: 0x394
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		init();
		level.rat.common.gethostplayer = &util::gethostplayer;
		level.rat.deathcount = 0;
		addratscriptcmd("", &function_70f41194);
		addratscriptcmd("", &function_31980089);
		addratscriptcmd("", &function_1251949b);
		addratscriptcmd("", &function_684893c8);
		addratscriptcmd("", &function_7eabbc02);
		addratscriptcmd("", &function_d50abf44);
		addratscriptcmd("", &function_89684f6a);
		addratscriptcmd("", &function_baeffaeb);
		addratscriptcmd("", &function_63a39134);
		addratscriptcmd("", &function_d19f7fe9);
		addratscriptcmd("", &function_2bd96c6e);
		addratscriptcmd("", &function_ee280019);
		addratscriptcmd("", &function_40e4c9de);
		addratscriptcmd("", &function_fea33619);
		addratscriptcmd("", &function_163c296a);
		addratscriptcmd("", &function_92891f6e);
		addratscriptcmd("", &function_834d65f9);
		addratscriptcmd("", &function_ad78fe8a);
		addratscriptcmd("", &function_adb96ff1);
		addratscriptcmd("", &function_a93cbd41);
		setdvar(#"rat_death_count", 0);
	#/
}

/*
	Name: function_d50abf44
	Namespace: rat
	Checksum: 0xCE7BB681
	Offset: 0x4C0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_d50abf44(params)
{
	/#
		return getplayers().size;
	#/
}

/*
	Name: function_7eabbc02
	Namespace: rat
	Checksum: 0xCD30177B
	Offset: 0x4F0
	Size: 0x19C
	Parameters: 1
	Flags: None
*/
function function_7eabbc02(params)
{
	/#
		remaining = 0;
		host = [[level.rat.common.gethostplayer]]();
		hostteam = host.team;
		if(isdefined(params.remaining))
		{
			remaining = int(params.remaining);
		}
		if(isdefined(getplayers()))
		{
			for(i = 0; i < getplayers().size; i++)
			{
				if(getplayers().size <= remaining)
				{
					break;
				}
				if(!isdefined(getplayers()[i].bot) || getplayers()[i].team == hostteam || getplayers()[i].team == "")
				{
					continue;
				}
				bot::remove_bot(getplayers()[i]);
			}
		}
	#/
}

/*
	Name: function_684893c8
	Namespace: rat
	Checksum: 0x115F9AED
	Offset: 0x698
	Size: 0xD2
	Parameters: 1
	Flags: None
*/
function function_684893c8(params)
{
	/#
		count = 0;
		if(isdefined(getplayers()))
		{
			foreach(player in getplayers())
			{
				if(player laststand::player_is_in_laststand())
				{
					count++;
				}
			}
		}
		return count;
	#/
}

/*
	Name: function_1251949b
	Namespace: rat
	Checksum: 0x377A6D1D
	Offset: 0x778
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_1251949b(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		return player laststand::player_is_in_laststand();
	#/
}

/*
	Name: function_70f41194
	Namespace: rat
	Checksum: 0x19317072
	Offset: 0x7D0
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_70f41194(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		return player.inventory.var_c212de25;
	#/
}

/*
	Name: function_31980089
	Namespace: rat
	Checksum: 0x794ABFED
	Offset: 0x828
	Size: 0x238
	Parameters: 1
	Flags: None
*/
function function_31980089(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		numitems = 1000;
		distance = 1000;
		name = "";
		if(isdefined(params.var_1d978d3))
		{
			numitems = int(params.var_1d978d3);
		}
		if(isdefined(params.distance))
		{
			distance = int(params.distance);
		}
		if(isdefined(params.name))
		{
			name = params.name;
		}
		items = item_world::function_2e3efdda(player.origin, undefined, numitems, distance);
		foreach(item in items)
		{
			if(item.var_a6762160.name == "")
			{
				continue;
			}
			if(isdefined(params.handler))
			{
				if(params.handler != item.var_a6762160.handler && params.handler != "")
				{
					continue;
				}
			}
			if(name == "" || item.var_a6762160.name == name)
			{
				function_55e20e75(params._id, item.origin);
			}
		}
	#/
}

/*
	Name: function_89684f6a
	Namespace: rat
	Checksum: 0xE967F3EF
	Offset: 0xA68
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_89684f6a(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		return player.inventory.items[5].var_bd027dd9 != 32767;
	#/
}

/*
	Name: function_baeffaeb
	Namespace: rat
	Checksum: 0xF6747033
	Offset: 0xAD0
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function function_baeffaeb(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		direction = player getplayerangles();
		direction_vec = anglestoforward(direction);
		guy = undefined;
		guy = namespace_85745671::function_9d3ad056("", player.origin, player.angles, "");
	#/
}

/*
	Name: function_63a39134
	Namespace: rat
	Checksum: 0x67382B1F
	Offset: 0xB90
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_63a39134(params)
{
	/#
		return zombie_utility::get_current_zombie_count();
	#/
}

/*
	Name: function_d19f7fe9
	Namespace: rat
	Checksum: 0xC6A397A4
	Offset: 0xBC0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_d19f7fe9(params)
{
	/#
		namespace_ce1f29cc::function_368a7cde();
	#/
}

/*
	Name: function_2bd96c6e
	Namespace: rat
	Checksum: 0x6E9EFFAE
	Offset: 0xBF0
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_2bd96c6e(params)
{
	/#
		location = level.var_7d45d0d4.locations[params.location];
		return location.var_dcb924fd.content_script_name;
	#/
}

/*
	Name: function_40e4c9de
	Namespace: rat
	Checksum: 0x190733C9
	Offset: 0xC48
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_40e4c9de(params)
{
	/#
		location = level.var_7d45d0d4.locations[params.location];
		location.var_dcb924fd = undefined;
	#/
}

/*
	Name: function_ee280019
	Namespace: rat
	Checksum: 0x6AB36CBF
	Offset: 0xC98
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_ee280019(params)
{
	/#
		location = level.var_7d45d0d4.locations[params.location];
		if(!isdefined(location.var_dcb924fd.starttrigger))
		{
			return;
		}
		function_55e20e75(params._id, location.var_dcb924fd.starttrigger.origin);
	#/
}

/*
	Name: function_fea33619
	Namespace: rat
	Checksum: 0x3EB1ACAF
	Offset: 0xD28
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_fea33619(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		location = level.var_7d45d0d4.locations[params.location];
		if(!isdefined(location.var_dcb924fd) || !isdefined(location.var_dcb924fd.var_e55c8b4e))
		{
			return false;
		}
		location.var_dcb924fd.starttrigger useby(player);
	#/
}

/*
	Name: function_163c296a
	Namespace: rat
	Checksum: 0x7E00DCCC
	Offset: 0xDE8
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_163c296a(params)
{
	/#
		if(!isdefined(level.var_7d45d0d4.var_3385b421))
		{
			return "";
		}
		return level.var_7d45d0d4.var_3385b421.content_script_name;
	#/
}

/*
	Name: function_92891f6e
	Namespace: rat
	Checksum: 0x235E26F4
	Offset: 0xE40
	Size: 0xA6
	Parameters: 1
	Flags: None
*/
function function_92891f6e(params)
{
	/#
		var_4f7fa3d1 = 1;
		if(params.success === "")
		{
			var_4f7fa3d1 = 0;
		}
		if(!isdefined(level.var_7d45d0d4.var_3385b421))
		{
			return 0;
		}
		instance = level.var_7d45d0d4.var_3385b421;
		objective_manager::function_2c679cc2(level.var_7d45d0d4.var_3385b421, var_4f7fa3d1);
		return instance.success;
	#/
}

/*
	Name: function_834d65f9
	Namespace: rat
	Checksum: 0x47867250
	Offset: 0xEF0
	Size: 0x182
	Parameters: 1
	Flags: None
*/
function function_834d65f9(params)
{
	/#
		if(!isdefined(level.var_7d45d0d4.var_3385b421) || level.var_7d45d0d4.var_3385b421.content_script_name != "")
		{
			return;
		}
		var_4f7fa3d1 = 1;
		if(params.success === "")
		{
			var_4f7fa3d1 = 0;
		}
		instance = level.var_7d45d0d4.var_3385b421;
		if(var_4f7fa3d1)
		{
			level notify(#"hash_489578e243cefa93");
			objective_manager::stop_timer();
		}
		else
		{
			foreach(s_instance in instance.var_fe2612fe[#"console"])
			{
				s_instance.var_4a416ea9.health = 0;
				s_instance.var_4a416ea9 notify(#"damage");
			}
		}
		return instance.success;
	#/
}

/*
	Name: function_ad78fe8a
	Namespace: rat
	Checksum: 0x20EE2AF1
	Offset: 0x1080
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_ad78fe8a()
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		portal = level.var_7d75c960.var_fb516651;
		portal.a_mdl_switch[0].mdl_gameobject gameobjects::use_object_onuse(player);
	#/
}

/*
	Name: function_adb96ff1
	Namespace: rat
	Checksum: 0xD387CC45
	Offset: 0x1100
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function function_adb96ff1()
{
	/#
		instance = level.var_7d45d0d4.var_3385b421;
		level.var_7d75c960.var_fb516651.var_94b03771.health = 0;
		return instance.success;
	#/
}

/*
	Name: function_a93cbd41
	Namespace: rat
	Checksum: 0xB0950EF0
	Offset: 0x1160
	Size: 0xDE
	Parameters: 1
	Flags: None
*/
function function_a93cbd41(params)
{
	/#
		if(!isdefined(level.var_7d45d0d4.var_3385b421) || level.var_7d45d0d4.var_3385b421.content_script_name != "")
		{
			return;
		}
		var_4f7fa3d1 = 1;
		if(params.success === "")
		{
			var_4f7fa3d1 = 0;
		}
		instance = level.var_7d45d0d4.var_3385b421;
		if(var_4f7fa3d1)
		{
		}
		else
		{
			level notify(#"hash_681a588173f0b1d7");
			objective_manager::stop_timer();
		}
		return instance.success;
	#/
}

