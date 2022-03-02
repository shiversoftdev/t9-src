#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_powerups.gsc;

#namespace zm_powerup_shield_charge;

/*
	Name: function_89f2df9
	Namespace: zm_powerup_shield_charge
	Checksum: 0xF30703EC
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_shield_charge", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_shield_charge
	Checksum: 0xB070CBB8
	Offset: 0xF8
	Size: 0xFC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("shield_charge", &grab_shield_charge);
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("shield_charge", "p8_wz_armor_scrap", #"hash_3f5e4aa38f9aeba5", &func_drop_when_players_own, 1, 0, 0);
		zm_powerups::function_59f7f2c6("shield_charge", #"hash_6c72c13078ae03d7", #"hash_3d58d22b97f9c9b4", #"hash_53f81d6d588b9984");
		zm_powerups::powerup_set_statless_powerup("shield_charge");
	}
	/#
		thread function_f5068a85();
	#/
}

/*
	Name: func_drop_when_players_own
	Namespace: zm_powerup_shield_charge
	Checksum: 0xF3021560
	Offset: 0x200
	Size: 0xB6
	Parameters: 0
	Flags: None
*/
function func_drop_when_players_own()
{
	players = getplayers();
	foreach(player in players)
	{
		if((isdefined(player.armortier) ? player.armortier : 0) > 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: grab_shield_charge
	Namespace: zm_powerup_shield_charge
	Checksum: 0xEE72A551
	Offset: 0x2C0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function grab_shield_charge(player)
{
	level thread shield_charge_powerup(self, player);
}

/*
	Name: shield_charge_powerup
	Namespace: zm_powerup_shield_charge
	Checksum: 0xC9655E3C
	Offset: 0x2F0
	Size: 0xCE
	Parameters: 2
	Flags: None
*/
function shield_charge_powerup(item, player)
{
	var_2cacdde7 = 50;
	var_b619c089 = player.inventory.items[6];
	if(isdefined(var_b619c089))
	{
		var_2cacdde7 = (isdefined(var_b619c089.var_a6762160.var_a3aa1ca2) ? var_b619c089.var_a6762160.var_a3aa1ca2 : 50);
		if(var_2cacdde7 == 0)
		{
			var_2cacdde7 = 50;
		}
	}
	player.armor = player.armor + math::clamp(var_2cacdde7, 0, player.maxarmor);
}

/*
	Name: function_f5068a85
	Namespace: zm_powerup_shield_charge
	Checksum: 0x86D13DD7
	Offset: 0x3C8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_f5068a85()
{
	/#
		level flag::wait_till("");
		wait(1);
		zm_devgui::add_custom_devgui_callback(&function_19ce1aa5);
		adddebugcommand("");
		adddebugcommand("");
	#/
}

/*
	Name: function_19ce1aa5
	Namespace: zm_powerup_shield_charge
	Checksum: 0x60E3C2F4
	Offset: 0x450
	Size: 0xC6
	Parameters: 1
	Flags: None
*/
function function_19ce1aa5(cmd)
{
	/#
		players = getplayers();
		retval = 0;
		switch(cmd)
		{
			case "shield_charge":
			{
				zm_devgui::zombie_devgui_give_powerup(cmd, 1);
				break;
			}
			case "next_shield_charge":
			{
				zm_devgui::zombie_devgui_give_powerup(getsubstr(cmd, 5), 0);
				break;
			}
		}
		return retval;
	#/
}

