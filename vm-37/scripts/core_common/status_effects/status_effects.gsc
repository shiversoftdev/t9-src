#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect;

/*
	Name: __init__system__
	Namespace: status_effect
	Checksum: 0x580D383
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effects", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect
	Checksum: 0x1AF27169
	Offset: 0xC8
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connect(&on_player_connect);
	callback::on_disconnect(&on_player_disconnect);
	callback::on_end_game(&on_end_game);
	/#
		level thread status_effects_init();
	#/
}

/*
	Name: on_player_connect
	Namespace: status_effect
	Checksum: 0xA0601E47
	Offset: 0x150
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(!isdefined(self._gadgets_player))
	{
		self._gadgets_player = [];
	}
	/#
		self thread status_effects_devgui_player_connect();
	#/
}

/*
	Name: on_player_disconnect
	Namespace: status_effect
	Checksum: 0x52720E8A
	Offset: 0x190
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_disconnect()
{
	/#
		self thread status_effects_devgui_player_disconnect();
	#/
}

/*
	Name: on_end_game
	Namespace: status_effect
	Checksum: 0x55BB6CEC
	Offset: 0x1B8
	Size: 0x88
	Parameters: 0
	Flags: Linked
*/
function on_end_game()
{
	foreach(player in level.players)
	{
		player thread function_6519f95f();
	}
}

/*
	Name: status_effects_init
	Namespace: status_effect
	Checksum: 0xEC81179B
	Offset: 0x248
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function status_effects_init()
{
	/#
		setdvar(#"scr_status_effects_devgui_cmd", "");
		setdvar(#"scr_status_effects_devgui_arg", 0);
		setdvar(#"scr_status_effects_devgui_player", 0);
		if(isdedicated())
		{
			return;
		}
		level.status_effects_devgui_base = "";
		level.status_effects_devgui_player_connect = &status_effects_devgui_player_connect;
		level.status_effects_devgui_player_disconnect = &status_effects_devgui_player_disconnect;
		level thread status_effects_devgui_think();
	#/
}

/*
	Name: status_effects_devgui_player_disconnect
	Namespace: status_effect
	Checksum: 0x69251A43
	Offset: 0x330
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function status_effects_devgui_player_disconnect()
{
	/#
		if(!isdefined(level.status_effects_devgui_base))
		{
			return;
		}
		remove_cmd_with_root = (("" + level.status_effects_devgui_base) + self.playername) + "";
		util::add_queued_debug_command(remove_cmd_with_root);
	#/
}

/*
	Name: status_effects_devgui_player_connect
	Namespace: status_effect
	Checksum: 0x7E4418F0
	Offset: 0x398
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function status_effects_devgui_player_connect()
{
	/#
		if(!isdefined(level.status_effects_devgui_base))
		{
			return;
		}
		index = self getentitynumber() + 1;
		status_effects_devgui_add_player_status_effects(level.status_effects_devgui_base, self.playername, index);
		status_effects_devgui_add_player_grenades(level.status_effects_devgui_base, self.playername, index);
		function_2a302935(level.status_effects_devgui_base, self.playername, index);
	#/
}

/*
	Name: function_2a302935
	Namespace: status_effect
	Checksum: 0xDF9BEB8F
	Offset: 0x440
	Size: 0x84
	Parameters: 3
	Flags: None
*/
function function_2a302935(root, pname, index)
{
	/#
		add_cmd_with_root = (("" + root) + pname) + "";
		pid = "" + index;
		status_effects_devgui_add_player_command(add_cmd_with_root, pid, "", "", undefined);
	#/
}

/*
	Name: status_effects_devgui_add_player_status_effects
	Namespace: status_effect
	Checksum: 0xFFA32DF7
	Offset: 0x4D0
	Size: 0x11C
	Parameters: 3
	Flags: None
*/
function status_effects_devgui_add_player_status_effects(root, pname, index)
{
	/#
		add_cmd_with_root = (("" + root) + pname) + "";
		pid = "" + index;
		if(isdefined(level.var_233471d2))
		{
			for(i = 0; i < level.var_233471d2.size; i++)
			{
				if(!isdefined(level.var_233471d2[i]))
				{
					println("" + i);
				}
				if(isdefined(level.var_233471d2[i].var_18d16a6b))
				{
					status_effects_devgui_add_player_command(add_cmd_with_root, pid, level.var_233471d2[i].var_18d16a6b, "", i);
				}
			}
		}
	#/
}

/*
	Name: status_effects_devgui_add_player_grenades
	Namespace: status_effect
	Checksum: 0x6BFF4D70
	Offset: 0x5F8
	Size: 0x134
	Parameters: 3
	Flags: None
*/
function status_effects_devgui_add_player_grenades(root, pname, index)
{
	/#
		add_cmd_with_root = (("" + root) + pname) + "";
		pid = "" + index;
		if(isdefined(level.var_233471d2))
		{
			for(i = 0; i < level.var_233471d2.size; i++)
			{
				if(!isdefined(level.var_233471d2[i]))
				{
					println("" + i);
				}
				if(isdefined(level.var_233471d2[i].var_18d16a6b))
				{
					grenade = "" + level.var_233471d2[i].var_18d16a6b;
					status_effects_devgui_add_player_command(add_cmd_with_root, pid, grenade, "", grenade);
				}
			}
		}
	#/
}

/*
	Name: status_effects_devgui_add_player_command
	Namespace: status_effect
	Checksum: 0x58E1BE51
	Offset: 0x738
	Size: 0xC4
	Parameters: 5
	Flags: None
*/
function status_effects_devgui_add_player_command(root, pid, cmdname, cmddvar, argdvar)
{
	/#
		if(!isdefined(argdvar))
		{
			argdvar = "";
		}
		adddebugcommand((((((((((((((root + cmdname) + "") + "") + "") + pid) + "") + "") + "") + cmddvar) + "") + "") + "") + argdvar) + "");
	#/
}

/*
	Name: status_effects_devgui_think
	Namespace: status_effect
	Checksum: 0xBC5DDAA6
	Offset: 0x808
	Size: 0x178
	Parameters: 0
	Flags: None
*/
function status_effects_devgui_think()
{
	/#
		for(;;)
		{
			cmd = getdvarstring(#"scr_status_effects_devgui_cmd");
			if(cmd == "")
			{
				waitframe(1);
				continue;
			}
			pid = getdvarint(#"scr_status_effects_devgui_player", 0);
			switch(cmd)
			{
				case "set_active":
				{
					status_effects_set_active_effect(pid);
					break;
				}
				case "give_grenade":
				{
					status_effects_give_grenade(pid);
					break;
				}
				case "clear_all":
				{
					function_64ba1c7e(pid);
				}
				default:
				{
					break;
				}
			}
			setdvar(#"scr_status_effects_devgui_cmd", "");
			setdvar(#"scr_status_effects_devgui_arg", "");
			wait(0.5);
		}
	#/
}

/*
	Name: function_64ba1c7e
	Namespace: status_effect
	Checksum: 0x7A73AD40
	Offset: 0x988
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_64ba1c7e(pid)
{
	/#
		player = getplayers()[pid - 1];
		if(isdefined(player))
		{
			player function_6519f95f();
		}
	#/
}

/*
	Name: status_effects_set_active_effect
	Namespace: status_effect
	Checksum: 0xB3C237B3
	Offset: 0x9E8
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function status_effects_set_active_effect(pid)
{
	/#
		arg = getdvarint(#"scr_status_effects_devgui_arg", 0);
		player = getplayers()[pid - 1];
		if(isdefined(player))
		{
			player function_e2bff3ce(arg, undefined, player);
		}
	#/
}

/*
	Name: status_effects_give_grenade
	Namespace: status_effect
	Checksum: 0x47CE66BB
	Offset: 0xA80
	Size: 0x21C
	Parameters: 1
	Flags: None
*/
function status_effects_give_grenade(pid)
{
	/#
		arg = getdvarstring(#"scr_status_effects_devgui_arg");
		player = getplayers()[pid - 1];
		if(isdefined(player))
		{
			weapon = getweapon(arg);
			grenades = 0;
			pweapons = player getweaponslist();
			foreach(pweapon in pweapons)
			{
				if(pweapon != weapon && pweapon.isgrenadeweapon)
				{
					grenades++;
				}
			}
			if(grenades > 1)
			{
				foreach(pweapon in pweapons)
				{
					if(pweapon != weapon && pweapon.isgrenadeweapon)
					{
						grenades--;
						player takeweapon(pweapon);
						if(grenades < 2)
						{
							break;
						}
					}
				}
			}
			player giveweapon(weapon);
		}
	#/
}

