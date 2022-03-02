#using script_68d2ee1489345a1d;
#using script_7edb54aca54e9a2b;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;

#namespace devgui;

/*
	Name: function_95020d15
	Namespace: devgui
	Checksum: 0xE4CA5BA4
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_95020d15()
{
	level notify(1295145962);
}

/*
	Name: function_89f2df9
	Namespace: devgui
	Checksum: 0x13EC93E
	Offset: 0xF0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	/#
		system::register(#"devgui", &function_70a657d8, undefined, undefined, #"load");
	#/
}

/*
	Name: function_70a657d8
	Namespace: devgui
	Checksum: 0x4F190E57
	Offset: 0x148
	Size: 0x3EC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		level.var_f9f04b00 = debug_center_screen::register();
		function_5ac4dc99("", "");
		function_5ac4dc99("", 0);
		function_5ac4dc99("", "");
		var_e37646f7 = 0;
		if(isdefined(getdvar(#"mp_weap_use_give_console_command_devgui")))
		{
			var_e37646f7 = int(getdvar(#"mp_weap_use_give_console_command_devgui"));
		}
		function_5ac4dc99("", var_e37646f7);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", "");
		level.attachment_cycling_dvars = [];
		level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "";
		level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "";
		level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "";
		level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "";
		level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "";
		level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "";
		level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "";
		level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "";
		level thread devgui_weapon_think();
		level thread devgui_weapon_asset_name_display_think();
		level thread devgui_player_weapons();
		level thread function_d14c2698();
		level thread function_caed2ca6();
		level thread dev::devgui_test_chart_think();
		level thread devgui_player_spawn_think();
		level thread devgui_vehicle_spawn_think();
		level thread function_7bef8d25();
		level thread function_be0f9897();
		level thread dev::function_487bf571();
		level thread function_46b22d99();
		level thread function_6a24e58f();
		level thread function_57edec18();
		thread init_debug_center_screen();
		level thread dev::body_customization_devgui(currentsessionmode());
		callback::on_connect(&hero_art_on_player_connect);
		callback::on_connect(&on_player_connect);
	#/
}

/*
	Name: on_player_connect
	Namespace: devgui
	Checksum: 0xE10CFCAD
	Offset: 0x540
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	/#
		self.devguilockspawn = 0;
		self thread devgui_player_spawn();
	#/
}

/*
	Name: devgui_player_spawn
	Namespace: devgui
	Checksum: 0x2F6C1151
	Offset: 0x570
	Size: 0x158
	Parameters: 0
	Flags: None
*/
function devgui_player_spawn()
{
	/#
		wait(1);
		player_devgui_base_mp = "";
		waitframe(1);
		players = getplayers();
		foreach(player in players)
		{
			if(player != self)
			{
				continue;
			}
			temp = (((((player_devgui_base_mp + player.playername) + "") + "") + "") + player.playername) + "";
			adddebugcommand((((((player_devgui_base_mp + player.playername) + "") + "") + "") + player.playername) + "");
		}
	#/
}

/*
	Name: devgui_player_spawn_think
	Namespace: devgui
	Checksum: 0x3451EEF9
	Offset: 0x6D0
	Size: 0x168
	Parameters: 0
	Flags: None
*/
function devgui_player_spawn_think()
{
	/#
		for(;;)
		{
			playername = getdvarstring(#"mp_lockspawn_command_devgui");
			if(playername == "")
			{
				waitframe(1);
				continue;
			}
			players = getplayers();
			foreach(player in players)
			{
				if(player.playername != playername)
				{
					continue;
				}
				player.devguilockspawn = !player.devguilockspawn;
				if(player.devguilockspawn)
				{
					player.resurrect_origin = player.origin;
					player.resurrect_angles = player.angles;
				}
			}
			setdvar(#"mp_lockspawn_command_devgui", "");
			wait(0.5);
		}
	#/
}

/*
	Name: devgui_vehicle_spawn_think
	Namespace: devgui
	Checksum: 0xAD3C54F1
	Offset: 0x840
	Size: 0xEE
	Parameters: 0
	Flags: None
*/
function devgui_vehicle_spawn_think()
{
	/#
		waitframe(1);
		for(;;)
		{
			val = getdvarint(#"scr_spawnvehicle", 0);
			if(val != 0)
			{
				if(val == 1)
				{
					add_vehicle_at_eye_trace("");
				}
				else
				{
					if(val == 2)
					{
						add_vehicle_at_eye_trace("");
					}
					else if(val == 3)
					{
						add_vehicle_at_eye_trace("");
					}
				}
				setdvar(#"scr_spawnvehicle", 0);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_d14c2698
	Namespace: devgui
	Checksum: 0x827DDA1D
	Offset: 0x938
	Size: 0x2FC
	Parameters: 0
	Flags: None
*/
function function_d14c2698()
{
	/#
		if(is_true(game.var_67f8923f))
		{
			return;
		}
		self notify("");
		self endon("");
		level endon(#"game_ended");
		player_devgui_base = "";
		setdvar(#"hash_57f1a3b4775bec24", "");
		util::function_e2e9d901(player_devgui_base + "", ("" + "") + "");
		while(getdvarstring(#"hash_57f1a3b4775bec24", "") == "")
		{
			wait(1);
		}
		game.var_67f8923f = 1;
		setdvar(#"hash_57f1a3b4775bec24", "");
		var_81fd4bd0 = function_72eeb31d();
		foreach(callouts in var_81fd4bd0)
		{
			var_64345a05 = (player_devgui_base + function_9e72a96(var_1a983da1)) + "";
			foreach(callout in callouts)
			{
				util::function_e2e9d901(var_64345a05 + function_9e72a96(callout), (("" + "") + "") + function_9e72a96(callout));
			}
			waitframe(1);
		}
		util::function_d84da933(player_devgui_base + "");
		level thread function_d08b7aef();
	#/
}

/*
	Name: function_d08b7aef
	Namespace: devgui
	Checksum: 0x3CAAC1A9
	Offset: 0xC40
	Size: 0x1AE
	Parameters: 0
	Flags: None
*/
function function_d08b7aef()
{
	/#
		while(true)
		{
			level.var_befddc02 = getdvarint(#"hash_6046bac574d1e237", 0);
			var_600cca03 = getdvarstring(#"hash_57f1a3b4775bec24");
			if(var_600cca03 != "")
			{
				setdvar(#"hash_6aec7b5b37bd66cd", 0);
				players = getplayers();
				if(isdefined(level.var_befddc02) && isdefined(players[level.var_befddc02]))
				{
					callout = players[level.var_befddc02] gestures::function_c77349d4(var_600cca03);
					if(isdefined(callout))
					{
						players[level.var_befddc02] gestures::function_b204f6e3(callout, undefined, 0);
					}
				}
				else
				{
					callout = players[0] gestures::function_c77349d4(var_600cca03);
					if(isdefined(callout))
					{
						players[0] gestures::function_b204f6e3(callout, undefined, 0);
					}
				}
				setdvar(#"hash_57f1a3b4775bec24", "");
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_caed2ca6
	Namespace: devgui
	Checksum: 0x349F37E8
	Offset: 0xDF8
	Size: 0x2FC
	Parameters: 0
	Flags: None
*/
function function_caed2ca6()
{
	/#
		if(is_true(game.var_ea16e22a))
		{
			level thread function_f9e5168a();
			return;
		}
		self notify("");
		self endon("");
		level endon(#"game_ended");
		player_devgui_base = "";
		var_7713817f = getdvarstring(#"hash_874c8b63573fc42", "") != "";
		if(!var_7713817f)
		{
			util::function_e2e9d901(player_devgui_base + "", ("" + "") + "");
			while(getdvarstring(#"hash_874c8b63573fc42", "") == "")
			{
				wait(1);
			}
			util::function_d84da933(player_devgui_base + "");
		}
		setdvar(#"hash_874c8b63573fc42", "");
		game.var_ea16e22a = 1;
		var_b28591f0 = getscriptbundle("");
		if(isdefined(var_b28591f0))
		{
			var_eb7a15a5 = var_b28591f0.executions;
			var_64345a05 = player_devgui_base;
			count = 0;
			foreach(execution in var_eb7a15a5)
			{
				if(isdefined(execution.execution))
				{
					count++;
					util::function_e2e9d901(var_64345a05 + function_9e72a96(execution.execution), (("" + "") + "") + function_9e72a96(execution.execution));
					waitframe(1);
				}
			}
			if(count > 0)
			{
				level thread function_f9e5168a();
			}
		}
	#/
}

/*
	Name: function_f9e5168a
	Namespace: devgui
	Checksum: 0x6E23783A
	Offset: 0x1100
	Size: 0x1B6
	Parameters: 0
	Flags: None
*/
function function_f9e5168a()
{
	/#
		while(true)
		{
			level.var_fba97209 = getdvarint(#"hash_2702f51d0ea9e486", 0);
			execution = getdvarstring(#"hash_874c8b63573fc42");
			if(execution != "")
			{
				setdvar(#"hash_61dac11dea7f8b8d", 1);
				players = getplayers();
				foreach(player in players)
				{
					player clearexecution();
					player giveexecution(hash(execution));
				}
				setdvar(#"hash_874c8b63573fc42", "");
				setdvar(#"hash_13d12c0b5b9b9738", execution);
			}
			wait(1);
		}
	#/
}

/*
	Name: devgui_player_weapons
	Namespace: devgui
	Checksum: 0xAB7FC036
	Offset: 0x12C0
	Size: 0x6D4
	Parameters: 0
	Flags: None
*/
function devgui_player_weapons()
{
	/#
		level endon(#"game_ended");
		if(is_true(game.devgui_weapons_added))
		{
			return;
		}
		level flag::wait_till("");
		a_weapons = enumerateweapons("");
		var_b4bc030d = [];
		var_179cce42 = [];
		var_5046ba65 = [];
		var_dce9ec82 = [];
		var_a327f68 = [];
		a_misc_mp = [];
		foreach(weapon in a_weapons)
		{
			weapon_index = getitemindexfromref(weapon.name);
			if(weapon_index > 0)
			{
				var_c8570f9 = getunlockableiteminfofromindex(weapon_index, 1);
				if(isdefined(var_c8570f9.loadoutslotname))
				{
					switch(var_c8570f9.loadoutslotname)
					{
						case "primary":
						{
							arrayinsert(var_b4bc030d, weapon, 0);
							continue;
						}
						case "secondary":
						{
							arrayinsert(var_179cce42, weapon, 0);
							continue;
						}
						case "primarygrenade":
						{
							arrayinsert(var_5046ba65, weapon, 0);
							continue;
						}
						case "secondarygrenade":
						{
							arrayinsert(var_dce9ec82, weapon, 0);
							continue;
						}
						case "specialgrenade":
						{
							arrayinsert(var_a327f68, weapon, 0);
							continue;
						}
					}
				}
			}
			arrayinsert(a_misc_mp, weapon, 0);
		}
		menu_index = 100;
		level thread devgui_add_player_weapons("", var_b4bc030d, "", menu_index);
		menu_index++;
		level thread devgui_add_player_weapons("", var_179cce42, "", menu_index);
		menu_index++;
		level thread devgui_add_player_weapons("", var_5046ba65, "", menu_index);
		menu_index++;
		level thread devgui_add_player_weapons("", var_dce9ec82, "", menu_index);
		menu_index++;
		level thread devgui_add_player_weapons("", var_a327f68, "", menu_index);
		menu_index++;
		level thread devgui_add_player_weapons("", a_misc_mp, "", menu_index);
		game.devgui_weapons_added = 1;
		waitframe(1);
		adddebugcommand(((("" + "") + "") + "") + "");
		adddebugcommand(((("" + "") + "") + "") + "");
		adddebugcommand(((("" + "") + "") + "") + "");
		waitframe(1);
		menu_index = 30;
		attachment_cycling_devgui_base_mp = (("" + "") + menu_index) + "";
		adddebugcommand(((attachment_cycling_devgui_base_mp + "") + "") + "");
		adddebugcommand(((attachment_cycling_devgui_base_mp + "") + "") + "");
		attachmentnames = getattachmentnames();
		for(i = 0; i < 8; i++)
		{
			attachment_cycling_sub_menu_index = 1;
			adddebugcommand((((((attachment_cycling_devgui_base_mp + "") + (i + 1) + "") + "") + "") + i) + "");
			for(attachmentname = 0; attachmentname < attachmentnames.size; attachmentname++)
			{
				util::waittill_can_add_debug_command();
				adddebugcommand((((((((((attachment_cycling_devgui_base_mp + "") + (i + 1) + "") + attachmentnames[attachmentname]) + "") + "") + "") + level.attachment_cycling_dvars[i]) + "") + attachmentnames[attachmentname]) + "");
				attachment_cycling_sub_menu_index++;
			}
			if(i % 4)
			{
				waitframe(1);
			}
		}
		level thread devgui_attachment_cycling_think();
	#/
}

/*
	Name: devgui_add_player_weapons
	Namespace: devgui
	Checksum: 0xFCDAE1CD
	Offset: 0x19A0
	Size: 0x2A0
	Parameters: 4
	Flags: None
*/
function devgui_add_player_weapons(root, a_weapons, weapon_type, mindex)
{
	/#
		level endon(#"game_ended");
		if(isdedicated())
		{
			return;
		}
		devgui_root = (((root + weapon_type) + "") + mindex) + "";
		if(isdefined(a_weapons))
		{
			foreach(weapon in a_weapons)
			{
				attachments = weapon.supportedattachments;
				name = function_a16a090d(weapon);
				displayname = weapon.displayname;
				if(displayname == #"")
				{
					displayname = "";
				}
				else
				{
					displayname = ("" + makelocalizedstring(displayname)) + "";
				}
				if(attachments.size)
				{
					devgui_add_player_weap_command(((devgui_root + name) + displayname) + "", name, "");
					foreach(att in attachments)
					{
						if(att != "")
						{
							devgui_add_player_weap_command(((devgui_root + name) + displayname) + "", (name + "") + att, "");
						}
					}
					continue;
				}
				devgui_add_player_weap_command(devgui_root, name, displayname);
			}
		}
	#/
}

/*
	Name: devgui_add_player_weap_command
	Namespace: devgui
	Checksum: 0x5334A66D
	Offset: 0x1C48
	Size: 0x7C
	Parameters: 3
	Flags: None
*/
function devgui_add_player_weap_command(root, weap_name, displayname)
{
	/#
		util::waittill_can_add_debug_command();
		adddebugcommand(((((((root + weap_name) + displayname) + "") + "") + "") + weap_name) + "");
	#/
}

/*
	Name: devgui_weapon_think
	Namespace: devgui
	Checksum: 0xE1A07F14
	Offset: 0x1CD0
	Size: 0xA0
	Parameters: 0
	Flags: None
*/
function devgui_weapon_think()
{
	/#
		for(;;)
		{
			weapon_name = getdvarstring(#"mp_weap_devgui");
			if(weapon_name != "")
			{
				devgui_handle_player_command(&devgui_give_weapon, weapon_name);
			}
			setdvar(#"mp_weap_devgui", "");
			wait(0.5);
		}
	#/
}

/*
	Name: hero_art_on_player_connect
	Namespace: devgui
	Checksum: 0x1C5A600A
	Offset: 0x1D78
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function hero_art_on_player_connect()
{
	/#
		self._debugheromodels = spawnstruct();
	#/
}

/*
	Name: devgui_weapon_asset_name_display_think
	Namespace: devgui
	Checksum: 0x7D96B8B
	Offset: 0x1DA8
	Size: 0x3EE
	Parameters: 0
	Flags: None
*/
function devgui_weapon_asset_name_display_think()
{
	/#
		update_time = 1;
		print_duration = int(update_time / (float(function_60d95f53()) / 1000));
		printlnbold_update = int(1 / update_time);
		printlnbold_counter = 0;
		colors = [];
		colors[colors.size] = (1, 1, 1);
		colors[colors.size] = (1, 0, 0);
		colors[colors.size] = (0, 1, 0);
		colors[colors.size] = (1, 1, 0);
		colors[colors.size] = (1, 0, 1);
		colors[colors.size] = (0, 1, 1);
		for(;;)
		{
			wait(update_time);
			display = getdvarint(#"mp_weap_asset_name_display_devgui", 0);
			if(!display)
			{
				continue;
			}
			if(!printlnbold_counter)
			{
				iprintlnbold(function_a16a090d(level.players[0] getcurrentweapon()));
			}
			printlnbold_counter++;
			if(printlnbold_counter >= printlnbold_update)
			{
				printlnbold_counter = 0;
			}
			color_index = 0;
			for(i = 1; i < level.players.size; i++)
			{
				player = level.players[i];
				weapon = player getcurrentweapon();
				if(!isdefined(weapon) || level.weaponnone == weapon)
				{
					continue;
				}
				var_9643e38d = player gettagorigin("");
				if(!isdefined(var_9643e38d))
				{
					continue;
				}
				print3d(var_9643e38d, function_a16a090d(weapon), colors[color_index], 1, 0.15, print_duration);
				color_index++;
				if(color_index >= colors.size)
				{
					color_index = 0;
				}
			}
			color_index = 0;
			ai_list = getaiarray();
			for(i = 0; i < ai_list.size; i++)
			{
				ai = ai_list[i];
				if(isvehicle(ai))
				{
					weapon = ai.turretweapon;
				}
				else
				{
					weapon = ai.weapon;
				}
				if(!isdefined(weapon) || level.weaponnone == weapon)
				{
					continue;
				}
				var_9643e38d = ai gettagorigin("");
				if(!isdefined(var_9643e38d))
				{
					continue;
				}
				print3d(var_9643e38d, function_a16a090d(weapon), colors[color_index], 1, 0.15, print_duration);
				color_index++;
				if(color_index >= colors.size)
				{
					color_index = 0;
				}
			}
		}
	#/
}

/*
	Name: devgui_attachment_cycling_clear
	Namespace: devgui
	Checksum: 0xB87475CF
	Offset: 0x21A0
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function devgui_attachment_cycling_clear(index)
{
	/#
		setdvar(level.attachment_cycling_dvars[index], "");
	#/
}

/*
	Name: devgui_attachment_cycling_update
	Namespace: devgui
	Checksum: 0xB9B57BB9
	Offset: 0x21E8
	Size: 0x354
	Parameters: 0
	Flags: None
*/
function devgui_attachment_cycling_update()
{
	/#
		currentweapon = self getcurrentweapon();
		rootweapon = currentweapon.rootweapon;
		supportedattachments = currentweapon.supportedattachments;
		textcolors = [];
		attachments = [];
		originalattachments = [];
		for(i = 0; i < 8; i++)
		{
			originalattachments[i] = getdvarstring(level.attachment_cycling_dvars[i]);
			textcolor[i] = "";
			attachments[i] = "";
			name = originalattachments[i];
			if("" == name)
			{
				continue;
			}
			textcolor[i] = "";
			for(supportedindex = 0; supportedindex < supportedattachments.size; supportedindex++)
			{
				if(name == supportedattachments[supportedindex])
				{
					textcolor[i] = "";
					attachments[i] = name;
					break;
				}
			}
		}
		for(i = 0; i < 8; i++)
		{
			if("" == originalattachments[i])
			{
				continue;
			}
			for(j = i + 1; j < 8; j++)
			{
				if(originalattachments[i] == originalattachments[j])
				{
					textcolor[j] = "";
					attachments[j] = "";
				}
			}
		}
		msg = "";
		for(i = 0; i < 8; i++)
		{
			if("" == originalattachments[i])
			{
				continue;
			}
			msg = msg + textcolor[i];
			msg = msg + i;
			msg = msg + "";
			msg = msg + originalattachments[i];
			msg = msg + "";
		}
		iprintlnbold(msg);
		self takeweapon(currentweapon);
		currentweapon = getweapon(rootweapon.name, attachments[0], attachments[1], attachments[2], attachments[3], attachments[4], attachments[5], attachments[6], attachments[7]);
		wait(0.25);
		self giveweapon(currentweapon, undefined);
		self switchtoweapon(currentweapon);
	#/
}

/*
	Name: devgui_attachment_cycling_think
	Namespace: devgui
	Checksum: 0xE4381568
	Offset: 0x2548
	Size: 0x178
	Parameters: 0
	Flags: None
*/
function devgui_attachment_cycling_think()
{
	/#
		for(;;)
		{
			state = getdvarstring(#"mp_attachment_cycling_state_devgui");
			setdvar(#"mp_attachment_cycling_state_devgui", "");
			if(issubstr(state, ""))
			{
				if("" == state)
				{
					for(i = 0; i < 8; i++)
					{
						devgui_attachment_cycling_clear(i);
					}
				}
				else
				{
					index = int(getsubstr(state, 6, 7));
					devgui_attachment_cycling_clear(index);
				}
				state = "";
			}
			if("" == state)
			{
				array::thread_all(getplayers(), &devgui_attachment_cycling_update);
			}
			wait(0.5);
		}
	#/
}

/*
	Name: devgui_give_weapon
	Namespace: devgui
	Checksum: 0xF096526F
	Offset: 0x26C8
	Size: 0xCC4
	Parameters: 1
	Flags: None
*/
function devgui_give_weapon(weapon_name)
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		self notify(#"devgui_give_ammo");
		self endon(#"devgui_give_ammo");
		endtime = gettime() + 10000;
		while(!isalive(self) && gettime() < endtime)
		{
			wait(0.25);
		}
		if(!isalive(self))
		{
			util::warning(((((("" + weapon_name) + "") + self.name) + "") + self.name) + "");
			return;
		}
		takeweapon = undefined;
		currentweapon = self getcurrentweapon();
		if(strstartswith(weapon_name, ""))
		{
			split = strtok(weapon_name, "");
			if(isdefined(split[2]))
			{
				if(split[2] == "")
				{
					var_18a8ed6e = 1;
				}
				else if(split[2] == "")
				{
					var_18a8ed6e = -1;
				}
				currentweaponname = currentweapon.name;
				currentattachment = "";
				if(isdefined(currentweapon.attachments) && isdefined(currentweapon.attachments[0]) && currentweapon.attachments[0] != "")
				{
					currentattachment = currentweapon.attachments[0];
				}
				supportedattachments = currentweapon.supportedattachments;
				var_a67ed7c5 = -1;
				if(supportedattachments.size)
				{
					var_a67ed7c5 = supportedattachments.size;
					for(i = 0; i < supportedattachments.size; i++)
					{
						if(supportedattachments[i] == currentattachment)
						{
							var_a67ed7c5 = i;
							break;
						}
					}
				}
				weapon = currentweapon;
				nextindex = -1;
				if(var_a67ed7c5 == supportedattachments.size)
				{
					if(var_18a8ed6e > 0)
					{
						nextindex = 0;
					}
					else
					{
						nextindex = supportedattachments.size - 1;
					}
				}
				else if(var_a67ed7c5 >= 0)
				{
					nextindex = ((supportedattachments.size + var_a67ed7c5) + var_18a8ed6e) % supportedattachments.size;
				}
				if(nextindex >= 0 && nextindex < supportedattachments.size)
				{
					if(isdefined(supportedattachments[nextindex]))
					{
						attachment = supportedattachments[nextindex];
						takeweapon = currentweapon;
						weapon = getweapon(currentweaponname, attachment);
					}
				}
			}
		}
		else
		{
			split = strtok(weapon_name, "");
			switch(split.size)
			{
				case 1:
				default:
				{
					weapon = getweapon(split[0]);
					break;
				}
				case 2:
				{
					weapon = getweapon(split[0], split[1]);
					break;
				}
				case 3:
				{
					weapon = getweapon(split[0], split[1], split[2]);
					break;
				}
				case 4:
				{
					weapon = getweapon(split[0], split[1], split[2], split[3]);
					break;
				}
				case 5:
				{
					weapon = getweapon(split[0], split[1], split[2], split[3], split[4]);
					break;
				}
			}
		}
		if(weapon == getweapon(#"none"))
		{
			iprintln("");
		}
		/#
			assert(isdefined(level.var_34d27b26));
		#/
		/#
			assert(isdefined(level.var_6388e216));
		#/
		/#
			assert(isdefined(level.var_43a51921));
		#/
		if(currentweapon != weapon)
		{
			gadgets = [];
			gadgets[0] = level.var_34d27b26;
			gadgets[1] = level.var_6388e216;
			gadgets[2] = level.var_43a51921;
			var_63fee5a7 = [];
			if(isdefined(self._gadgets_player))
			{
				for(slot = 0; slot < 3; slot++)
				{
					if(isdefined(self._gadgets_player[slot]))
					{
						gadgets[slot] = self._gadgets_player[slot];
						var_63fee5a7[slot] = self gadgetpowerget(slot);
					}
				}
			}
			for(slot = 0; slot < 3; slot++)
			{
				if(self hasweapon(gadgets[slot]))
				{
					self takeweapon(gadgets[slot]);
				}
			}
			if(weapon.inventorytype == #"offhand" || weapon.inventorytype == #"offhand_primary")
			{
				pweapons = self getweaponslist();
				foreach(pweapon in pweapons)
				{
					if(pweapon != weapon && pweapon.gadget_type == 0 && (pweapon.inventorytype == #"offhand" || pweapon.inventorytype == #"offhand_primary"))
					{
						if(self hasweapon(pweapon))
						{
							self takeweapon(pweapon);
						}
					}
				}
			}
			else if(weapon.inventorytype == #"ability" && weapon.offhandslot == "")
			{
				pweapons = self getweaponslist();
				foreach(pweapon in pweapons)
				{
					if(pweapon != weapon && pweapon.inventorytype == #"ability" && pweapon.offhandslot == "")
					{
						if(self hasweapon(pweapon))
						{
							self takeweapon(pweapon);
						}
					}
				}
			}
			if(isdefined(takeweapon) && self hasweapon(takeweapon))
			{
				self takeweapon(takeweapon);
			}
			if(getdvarint(#"mp_weap_use_give_console_command_devgui", 0))
			{
				adddebugcommand("" + weapon_name);
				waitframe(1);
			}
			else
			{
				if(weapon.gadget_type == 0)
				{
					self giveweapon(weapon);
					if(weapon.inventorytype == #"offhand" || weapon.inventorytype == #"offhand_primary")
					{
						gadgets[0] = level.var_34d27b26;
					}
					else
					{
						gadgets[2] = level.var_43a51921;
					}
				}
				else
				{
					if(weapon.inventorytype == #"offhand" || weapon.inventorytype == #"offhand_primary")
					{
						if(weapon.gadget_type == 23)
						{
							gadgets[1] = weapon;
						}
						else
						{
							gadgets[0] = weapon;
						}
					}
					else if(weapon.inventorytype == #"ability")
					{
						gadgets[2] = weapon;
					}
				}
				for(slot = 0; slot < 3; slot++)
				{
					if(isdefined(gadgets[slot]))
					{
						if(!self hasweapon(gadgets[slot]))
						{
							self giveweapon(gadgets[slot]);
							if(!isdefined(var_63fee5a7[slot]))
							{
								var_63fee5a7[slot] = 100;
							}
							self gadgetpowerset(slot, var_63fee5a7[slot]);
						}
					}
				}
				if(!weapon.isgrenadeweapon && weapon.inventorytype != #"ability")
				{
					self switchtoweapon(weapon);
				}
			}
			max = weapon.maxammo;
			if(max)
			{
				self setweaponammostock(weapon, max);
			}
			else
			{
				clipammo = self getweaponammoclip(weapon);
				if(clipammo == 0)
				{
					self setweaponammoclip(weapon, 1);
				}
			}
		}
	#/
}

/*
	Name: devgui_handle_player_command
	Namespace: devgui
	Checksum: 0x2E3B1FCF
	Offset: 0x3398
	Size: 0x124
	Parameters: 3
	Flags: None
*/
function devgui_handle_player_command(playercallback, pcb_param_1, pcb_param_2)
{
	/#
		pid = getdvarint(#"mp_weap_devgui", 0);
		if(pid > 0)
		{
			player = getplayers()[pid - 1];
			if(isdefined(player))
			{
				if(isdefined(pcb_param_2))
				{
					player thread [[playercallback]](pcb_param_1, pcb_param_2);
				}
				else
				{
					if(isdefined(pcb_param_1))
					{
						player thread [[playercallback]](pcb_param_1);
					}
					else
					{
						player thread [[playercallback]]();
					}
				}
			}
		}
		else
		{
			array::thread_all(getplayers(), playercallback, pcb_param_1, pcb_param_2);
		}
		setdvar(#"mp_weap_devgui", "");
	#/
}

/*
	Name: init_debug_center_screen
	Namespace: devgui
	Checksum: 0x2BF3B7F3
	Offset: 0x34C8
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function init_debug_center_screen()
{
	/#
		zero_idle_movement = 0;
		for(;;)
		{
			if(getdvarint(#"debug_center_screen", 0))
			{
				if(!isdefined(level.var_7929a046) || level.var_7929a046 == 0)
				{
					thread debug_center_screen();
					zero_idle_movement = getdvarint(#"zero_idle_movement", 0);
					if(zero_idle_movement == 0)
					{
						setdvar(#"zero_idle_movement", 1);
						zero_idle_movement = 1;
					}
				}
			}
			else
			{
				level notify(#"hash_63054d2b7dcb7739");
				if(zero_idle_movement == 1)
				{
					setdvar(#"zero_idle_movement", 0);
					zero_idle_movement = 0;
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: debug_center_screen
	Namespace: devgui
	Checksum: 0x646517A8
	Offset: 0x3600
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function debug_center_screen()
{
	/#
		level.var_7929a046 = 1;
		wait(0.1);
		level.var_f9f04b00 debug_center_screen::open(level.players[0], 1);
		level waittill(#"hash_63054d2b7dcb7739");
		level.var_f9f04b00 debug_center_screen::close(level.players[0]);
		level.var_7929a046 = 0;
	#/
}

/*
	Name: add_vehicle_at_eye_trace
	Namespace: devgui
	Checksum: 0x916439DF
	Offset: 0x36A0
	Size: 0x120
	Parameters: 1
	Flags: None
*/
function add_vehicle_at_eye_trace(vehiclename)
{
	/#
		host = util::gethostplayer();
		trace = host eye_trace();
		veh_spawner = getent(vehiclename + "", "");
		vehicle = veh_spawner spawnfromspawner(vehiclename, 1, 1, 1);
		vehicle asmrequestsubstate(#"locomotion@movement");
		waitframe(1);
		vehicle makevehicleusable();
		vehicle.origin = trace[#"position"];
		vehicle.nojumping = 1;
		vehicle thread watch_player_death();
		return vehicle;
	#/
}

/*
	Name: watch_player_death
	Namespace: devgui
	Checksum: 0x56BBD656
	Offset: 0x37D0
	Size: 0x8E
	Parameters: 0
	Flags: None
*/
function watch_player_death()
{
	/#
		self endon(#"death");
		vehicle = self;
		while(true)
		{
			driver = self getseatoccupant(0);
			if(isdefined(driver) && !isalive(driver))
			{
				driver unlink();
			}
			waitframe(1);
		}
	#/
}

/*
	Name: devgui_add_ve_map_switches
	Namespace: devgui
	Checksum: 0xA4322B06
	Offset: 0x3868
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function devgui_add_ve_map_switches()
{
	/#
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
	#/
}

/*
	Name: function_6a24e58f
	Namespace: devgui
	Checksum: 0x6EBE1CC9
	Offset: 0x38C8
	Size: 0x64E
	Parameters: 0
	Flags: None
*/
function function_6a24e58f()
{
	/#
		level notify(#"hash_254f5df0e8f1d66");
		level endon(#"hash_254f5df0e8f1d66");
		setdvar(#"hash_3a3f995b08f2b9b8", -1);
		setdvar(#"hash_2aab28ebf600b8c7", -1);
		setdvar(#"hash_4874e2dd28221d6c", -1);
		wait(0.5);
		path = "";
		cmd = "";
		util::function_e2e9d901(path + "", cmd + "");
		for(minutes = 0; minutes < 10; minutes++)
		{
			seconds = 0;
			while(seconds < 60)
			{
				var_99cfbb07 = "" + seconds;
				totalseconds = (minutes * 60) + seconds;
				if(seconds == 0)
				{
					if(minutes == 0)
					{
						totalseconds = 1;
						var_99cfbb07 = "";
					}
					else
					{
						var_99cfbb07 = "";
					}
				}
				util::function_e2e9d901(((path + minutes) + "") + var_99cfbb07, cmd + totalseconds);
				seconds = seconds + 15;
			}
			waitframe(1);
		}
		var_a11730e4 = "";
		var_eb72e2d3 = "";
		var_3b0a5dad = "";
		var_5f2cb965 = "";
		if(util::isroundbased())
		{
			var_ca373442 = level.roundlimit * level.roundscorelimit;
		}
		else
		{
			var_ca373442 = level.scorelimit;
		}
		var_ca373442 = math::clamp(var_ca373442, 0, 300);
		wait(0.5);
		for(score = 0; score <= var_ca373442; score++)
		{
			var_8acb4d22 = (int(score / 10)) * 10;
			var_daf8d664 = ((int(score / 10)) * 10) + 10;
			util::function_e2e9d901(((((((var_a11730e4 + var_8acb4d22) + "") + var_daf8d664) + "") + var_8acb4d22) + "") + score, var_eb72e2d3 + score);
			util::function_e2e9d901(((((((var_3b0a5dad + var_8acb4d22) + "") + var_daf8d664) + "") + var_8acb4d22) + "") + score, var_5f2cb965 + score);
			if(score == var_daf8d664)
			{
				waitframe(1);
			}
		}
		while(true)
		{
			if((getdvarint(#"hash_3a3f995b08f2b9b8", -1)) != -1)
			{
				var_6d2040ea = getdvarint(#"hash_3a3f995b08f2b9b8", -1);
				var_14f1a63 = (int(var_6d2040ea * 1000)) + globallogic_utils::gettimepassed() / (int(60 * 1000));
				if(var_6d2040ea == 0)
				{
					var_14f1a63 = 0;
				}
				setdvar(#"hash_5424bc2a81bcb188", var_14f1a63);
				setdvar(#"hash_3a3f995b08f2b9b8", -1);
			}
			if((getdvarint(#"hash_2aab28ebf600b8c7", -1)) != -1)
			{
				var_168b7d5 = getdvarint(#"hash_2aab28ebf600b8c7", -1);
				[[level._setteamscore]](#"allies", var_168b7d5);
				setdvar(#"hash_2aab28ebf600b8c7", -1);
			}
			if((getdvarint(#"hash_4874e2dd28221d6c", -1)) != -1)
			{
				var_46c53e6e = getdvarint(#"hash_4874e2dd28221d6c", -1);
				[[level._setteamscore]](#"axis", var_46c53e6e);
				setdvar(#"hash_4874e2dd28221d6c", -1);
			}
			wait(1);
		}
	#/
}

/*
	Name: function_7bef8d25
	Namespace: devgui
	Checksum: 0xEEA49B5F
	Offset: 0x3F20
	Size: 0x198
	Parameters: 0
	Flags: None
*/
function function_7bef8d25()
{
	/#
		level notify(#"hash_6a8b1c9e1485919d");
		level endon(#"hash_6a8b1c9e1485919d");
		wait(5);
		function_e4b86469();
		wait(1);
		while(true)
		{
			wait(0.25);
			remaining_health = getdvarint(#"hash_28af507d964c5802", 0);
			if(remaining_health <= 0)
			{
				continue;
			}
			player = level.players[0];
			if(isplayer(player))
			{
				remaining_health = math::clamp(remaining_health, 0, (isdefined(player.maxhealth) ? player.maxhealth : 100));
				damage = player.health - remaining_health;
				if(damage <= 0)
				{
					player.health = remaining_health;
				}
				else
				{
					player dodamage(damage, player.origin + vectorscale((1, 0, 0), 100));
				}
			}
			setdvar(#"hash_28af507d964c5802", 0);
		}
	#/
}

/*
	Name: function_46b22d99
	Namespace: devgui
	Checksum: 0xD5F968A9
	Offset: 0x40C0
	Size: 0x1B8
	Parameters: 0
	Flags: None
*/
function function_46b22d99()
{
	/#
		level notify(#"hash_4c09c9d01060d7ad");
		level endon(#"hash_4c09c9d01060d7ad");
		wait(2);
		function_9fb69cba();
		wait(0.5);
		while(true)
		{
			wait(0.5);
			if(level.gameended)
			{
				continue;
			}
			var_7442b0e6 = getdvarint(#"hash_410a22566f5a0b32", 0);
			if(var_7442b0e6 == 0)
			{
				continue;
			}
			setdvar(#"hash_410a22566f5a0b32", 0);
			var_53b4c3ae = getgametypesetting(#"timelimit");
			var_c585681e = 0.25;
			setgametypesetting("", var_c585681e);
			aborted = 0;
			while(!level.gameended && !aborted)
			{
				wait(0.5);
				aborted = getgametypesetting(#"timelimit") != var_c585681e;
			}
			if(!aborted)
			{
				setgametypesetting("", var_53b4c3ae);
			}
		}
	#/
}

/*
	Name: function_be0f9897
	Namespace: devgui
	Checksum: 0xD62FE16D
	Offset: 0x4280
	Size: 0x1C8
	Parameters: 0
	Flags: None
*/
function function_be0f9897()
{
	/#
		level notify(#"hash_7528b3262d076f59");
		level endon(#"hash_7528b3262d076f59");
		wait(5.5);
		function_51cc2292();
		wait(1);
		while(true)
		{
			wait(0.25);
			damage = getdvarint(#"hash_3ea62f6d7351287c", 0);
			if(damage == 0)
			{
				continue;
			}
			player = level.players[0];
			if(isplayer(player))
			{
				if(damage <= 0)
				{
					heal = damage * -1;
					var_66cb03ad = (player.var_66cb03ad > 0 ? player.var_66cb03ad : player.maxhealth);
					if(!isdefined(var_66cb03ad))
					{
						var_66cb03ad = 100;
					}
					if(player.health + heal > var_66cb03ad)
					{
						player.health = var_66cb03ad;
					}
					else
					{
						player.health = player.health + heal;
					}
				}
				else
				{
					player dodamage(damage, player.origin + vectorscale((1, 0, 0), 100));
				}
			}
			setdvar(#"hash_3ea62f6d7351287c", 0);
		}
	#/
}

/*
	Name: function_e4b86469
	Namespace: devgui
	Checksum: 0x736C9753
	Offset: 0x4450
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_e4b86469()
{
	/#
		path = "";
		cmd = "";
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
	#/
}

/*
	Name: function_51cc2292
	Namespace: devgui
	Checksum: 0xCEEE78A3
	Offset: 0x4580
	Size: 0x174
	Parameters: 0
	Flags: None
*/
function function_51cc2292()
{
	/#
		path = "";
		cmd = "";
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
		util::function_e2e9d901(path + "", cmd + "");
	#/
}

/*
	Name: function_9fb69cba
	Namespace: devgui
	Checksum: 0x3FAAA0C9
	Offset: 0x4700
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_9fb69cba()
{
	/#
		util::function_e2e9d901("", "");
	#/
}

/*
	Name: function_57edec18
	Namespace: devgui
	Checksum: 0x92DC7CF3
	Offset: 0x4738
	Size: 0x1CE
	Parameters: 0
	Flags: Private
*/
function private function_57edec18()
{
	/#
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		while(true)
		{
			if(getdvarint(#"hash_428eca4823d65134", 0))
			{
				if(isdefined(level.var_6460e605))
				{
					waitframe(1);
					continue;
				}
				player = getplayers()[0];
				if(!isdefined(player))
				{
					waitframe(1);
					continue;
				}
				var_6460e605 = spawnvehicle("", player.origin + vectorscale((0, 0, 1), 150), player.angles, "");
				var_6460e605.ignoreme = 1;
				var_6460e605 usevehicle(player, 0);
				level.var_6460e605 = var_6460e605;
			}
			else if(isdefined(level.var_6460e605))
			{
				driver = level.var_6460e605 getseatoccupant(0);
				if(isdefined(driver))
				{
					driver unlink();
				}
				level.var_6460e605 delete();
			}
			waitframe(1);
		}
	#/
}

/*
	Name: eye_trace
	Namespace: devgui
	Checksum: 0xEC61D3E0
	Offset: 0x4910
	Size: 0xDA
	Parameters: 1
	Flags: None
*/
function eye_trace(hitents)
{
	/#
		if(!isdefined(hitents))
		{
			hitents = 0;
		}
		angles = self getplayerangles();
		fwd = anglestoforward(angles);
		eyeheight = self getplayerviewheight();
		eye = self.origin + (0, 0, eyeheight);
		end = eye + (fwd * 8000);
		return bullettrace(eye, end, hitents, self);
	#/
}

