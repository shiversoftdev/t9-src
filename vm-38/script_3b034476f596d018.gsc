#using script_57f7003580bb15e0;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace status_effects;

/*
	Name: function_8e6fd1a9
	Namespace: status_effects
	Checksum: 0x263DA74D
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8e6fd1a9()
{
	level notify(1403534134);
}

#namespace status_effect;

/*
	Name: function_89f2df9
	Namespace: status_effect
	Checksum: 0xAAAF74F7
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"status_effects", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect
	Checksum: 0xC3095D74
	Offset: 0xE8
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
	Checksum: 0xEA65D008
	Offset: 0x170
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
	Checksum: 0x56FF2885
	Offset: 0x1B0
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
	Checksum: 0x19912F4F
	Offset: 0x1D8
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
	Checksum: 0x8A3090CB
	Offset: 0x268
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
	Checksum: 0x49A30EFE
	Offset: 0x350
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
	Checksum: 0x11820D32
	Offset: 0x3B8
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
	Checksum: 0xB9E4B0CC
	Offset: 0x460
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
	Checksum: 0x4E88234D
	Offset: 0x4F0
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
	Checksum: 0xAA3BC8B8
	Offset: 0x618
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
	Checksum: 0x726C8E94
	Offset: 0x758
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
	Checksum: 0x65062846
	Offset: 0x828
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
				case "hash_5ef5fa93b3352722":
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
	Checksum: 0xD7B8BA20
	Offset: 0x9A8
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
	Checksum: 0xA065581B
	Offset: 0xA08
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
	Checksum: 0x145098A6
	Offset: 0xAA0
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

