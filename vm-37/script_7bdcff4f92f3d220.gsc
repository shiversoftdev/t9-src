#using script_61828ad9e71c6616;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreak_detect.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace killstreaks;

/*
	Name: __init__system__
	Namespace: killstreaks
	Checksum: 0xC3356C76
	Offset: 0x138
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"killstreaks", &function_70a657d8, undefined, undefined, #"zm");
}

/*
	Name: function_70a657d8
	Namespace: killstreaks
	Checksum: 0xAE2416C9
	Offset: 0x188
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	killstreak_detect::init_shared();
	killstreakrules::init();
	callback::on_start_gametype(&init);
	callback::add_callback(#"menu_response", &on_menu_response);
}

/*
	Name: init
	Namespace: killstreaks
	Checksum: 0x7FBC061C
	Offset: 0x218
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	/#
		level.killstreak_init_start_time = getmillisecondsraw();
		thread debug_ricochet_protection();
	#/
	function_447e6858();
	level.var_fee7acb5 = [];
	level.var_1f616ecc = [];
	level.var_4cc7833a = [];
	level.var_b0dc03c7 = &function_395f82d0;
	level.var_19a15e42 = &function_daabc818;
	callback::callback(#"hash_45f35669076bc317");
	function_f1707039();
	level thread function_d3106952();
	function_1f7e617a();
	/#
		level.killstreak_init_end_time = getmillisecondsraw();
		elapsed_time = level.killstreak_init_end_time - level.killstreak_init_start_time;
		println(("" + elapsed_time) + "");
		level thread killstreak_debug_think();
	#/
}

/*
	Name: function_f1707039
	Namespace: killstreaks
	Checksum: 0xB3CBA43D
	Offset: 0x390
	Size: 0x134
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f1707039()
{
	level.var_4b42d599 = [];
	for(i = 0; i < 4; i++)
	{
		level.var_4b42d599[i] = ("killstreaks.killstreak" + i) + ".inUse";
		clientfield::register_clientuimodel(level.var_4b42d599[i], 1, 1, "int");
	}
	level.var_46b33f90[i] = [];
	level.var_173b8ed7 = max(8, 4);
	for(i = 0; i < level.var_173b8ed7; i++)
	{
		level.var_46b33f90[i] = ("killstreaks.killstreak" + i) + ".spaceFull";
		clientfield::register_clientuimodel(level.var_46b33f90[i], 1, 1, "int");
	}
}

/*
	Name: function_1f7e617a
	Namespace: killstreaks
	Checksum: 0x948B598
	Offset: 0x4D0
	Size: 0x58
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1f7e617a()
{
	level.var_b84cb28e = [];
	level.var_b84cb28e[0] = 2;
	level.var_b84cb28e[3] = 0;
	level.var_b84cb28e[1] = 1;
	level.var_b84cb28e[-1] = 3;
}

/*
	Name: on_menu_response
	Namespace: killstreaks
	Checksum: 0xAB95B82D
	Offset: 0x530
	Size: 0x2DC
	Parameters: 1
	Flags: Linked, Private
*/
function private on_menu_response(eventstruct)
{
	if(self function_8cc6b278())
	{
		return;
	}
	if(eventstruct.response === "scorestreak_pool_purchase" && level.var_5b544215 === 1)
	{
		killstreakslot = level.var_b84cb28e[eventstruct.intpayload];
		if(isdefined(killstreakslot))
		{
			if(killstreakslot == 3)
			{
				if(isdefined(self.pers[#"killstreaks"]))
				{
					var_2a5574a6 = self.pers[#"killstreaks"].size - 1;
					if(var_2a5574a6 >= 0)
					{
						killstreakweapon = get_killstreak_weapon(self.pers[#"killstreaks"][var_2a5574a6]);
						self switchtoweapon(killstreakweapon);
					}
				}
			}
			else if(1)
			{
				killstreaktype = get_by_menu_name(self.killstreak[killstreakslot]);
				killstreakweapon = get_killstreak_weapon(killstreaktype);
				self switchtoweapon(killstreakweapon);
			}
		}
	}
	else if(eventstruct.response === "scorestreak_pool_purchase_and_use" && level.var_5b544215 === 1)
	{
		eventstruct = eventstruct;
		var_180d3406 = getscriptbundlelist(level.var_d1455682.var_a45c9c63);
		var_b133a8aa = getscriptbundle(var_180d3406[eventstruct.intpayload]);
		killstreakbundle = getscriptbundle(var_b133a8aa.killstreakbundle);
		if(isdefined(killstreakbundle))
		{
			unlockableindex = getitemindexfromref(var_b133a8aa.var_b302fb52);
			iteminfo = getunlockableiteminfofromindex(unlockableindex, 0);
			if(1)
			{
				self give(killstreakbundle.var_d3413870);
				self switchtoweapon(killstreakbundle.ksweapon);
			}
		}
	}
}

/*
	Name: function_3b4959c6
	Namespace: killstreaks
	Checksum: 0x2C2D243
	Offset: 0x818
	Size: 0x18
	Parameters: 0
	Flags: Linked
*/
function function_3b4959c6()
{
	return isdefined(level.var_d1455682.var_a45c9c63);
}

/*
	Name: function_7b6102ed
	Namespace: killstreaks
	Checksum: 0xB5984BCC
	Offset: 0x838
	Size: 0x20
	Parameters: 1
	Flags: Linked
*/
function function_7b6102ed(killstreaktype)
{
	level.var_fee7acb5[killstreaktype] = 1;
}

/*
	Name: function_353a9ccd
	Namespace: killstreaks
	Checksum: 0x6DD70B69
	Offset: 0x860
	Size: 0x24
	Parameters: 2
	Flags: Linked
*/
function function_353a9ccd(killstreaktype, func)
{
	level.var_1f616ecc[killstreaktype] = func;
}

/*
	Name: function_39c0c22a
	Namespace: killstreaks
	Checksum: 0x4D4BB027
	Offset: 0x890
	Size: 0x24
	Parameters: 2
	Flags: Linked
*/
function function_39c0c22a(killstreaktype, func)
{
	level.var_4cc7833a[killstreaktype] = func;
}

/*
	Name: function_395f82d0
	Namespace: killstreaks
	Checksum: 0xD8564571
	Offset: 0x8C0
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_395f82d0(killstreaktype)
{
}

/*
	Name: function_daabc818
	Namespace: killstreaks
	Checksum: 0x49B0B099
	Offset: 0x8D8
	Size: 0x24
	Parameters: 4
	Flags: Linked, Private
*/
function private function_daabc818(event, player, victim, weapon)
{
}

/*
	Name: function_d3106952
	Namespace: killstreaks
	Checksum: 0x3DFB6472
	Offset: 0x908
	Size: 0x494
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d3106952()
{
	self notify("606d9cc1a6278cc5");
	self endon("606d9cc1a6278cc5");
	if(function_3b4959c6())
	{
		return;
	}
	wait(5);
	var_7d46072 = 1;
	var_e9414fa = 0;
	while(!level.gameended)
	{
		players = getplayers();
		if(players.size == 0)
		{
			wait(1);
			continue;
		}
		foreach(player in players)
		{
			if(!isdefined(player))
			{
				continue;
			}
			if(!isdefined(player.killstreak))
			{
				continue;
			}
			if(is_true(player.var_6696e200))
			{
				continue;
			}
			var_6370491b = getarraykeys(player.killstreak);
			foreach(key in var_6370491b)
			{
				if(!isdefined(key))
				{
					continue;
				}
				var_63fd3e67 = player killstreakrules::iskillstreakallowed(player.killstreak[key], player.team, 1);
				player clientfield::set_player_uimodel(level.var_46b33f90[key], !var_63fd3e67);
			}
			if(isdefined(player.pers[#"killstreaks"]) && player.pers[#"killstreaks"].size > 0)
			{
				var_8c992ad8 = player.pers[#"killstreaks"][player.pers[#"killstreaks"].size - 1];
				if(is_true(level.var_fee7acb5[var_8c992ad8]))
				{
					if(killstreakrules::function_2912fa8(var_8c992ad8))
					{
						if(is_true(player.var_baf4657c))
						{
							player clientfield::set_player_uimodel(level.var_46b33f90[3], 1);
							wait(1);
							player clientfield::set_player_uimodel(level.var_46b33f90[3], 0);
							player.var_baf4657c = undefined;
						}
						else
						{
							player clientfield::set_player_uimodel(level.var_46b33f90[3], 0);
						}
					}
					else
					{
						var_63fd3e67 = player killstreakrules::iskillstreakallowed(var_8c992ad8, player.team, 1);
						player clientfield::set_player_uimodel(level.var_46b33f90[3], !var_63fd3e67);
					}
				}
				else
				{
					var_63fd3e67 = player killstreakrules::iskillstreakallowed(var_8c992ad8, player.team, 1);
					player clientfield::set_player_uimodel(level.var_46b33f90[3], !var_63fd3e67);
				}
			}
			var_e9414fa++;
			if(var_e9414fa >= var_7d46072)
			{
				waitframe(1);
				var_e9414fa = 0;
			}
		}
		waitframe(1);
	}
}

