#using scripts\mp_common\gametypes\dev.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace dev_class;

/*
	Name: dev_cac_init
	Namespace: dev_class
	Checksum: 0xEB0DCC27
	Offset: 0x70
	Size: 0xB28
	Parameters: 0
	Flags: None
*/
function dev_cac_init()
{
	/#
		dev_cac_overlay = 0;
		dev_cac_camera_on = 0;
		level thread dev_cac_gdt_update_think();
		for(;;)
		{
			wait(0.5);
			reset = 1;
			if(getdvarstring(#"scr_disable_cac_2") != "")
			{
				continue;
			}
			host = util::gethostplayer();
			if(!isdefined(level.dev_cac_player))
			{
				level.dev_cac_player = host;
			}
			switch(getdvarstring(#"devgui_dev_cac"))
			{
				case 0:
				{
					reset = 0;
					break;
				}
				case "dpad_body":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_body, "");
					break;
				}
				case "dpad_head":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_head, "");
					break;
				}
				case "dpad_character":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_character, "");
					break;
				}
				case "next_player":
				{
					dev_cac_cycle_player(1);
					break;
				}
				case "prev_player":
				{
					dev_cac_cycle_player(0);
					break;
				}
				case "cac_overlay":
				{
					level notify(#"dev_cac_overlay_think");
					if(!dev_cac_overlay)
					{
						level thread dev_cac_overlay_think();
					}
					dev_cac_overlay = !dev_cac_overlay;
					break;
				}
				case "best_bullet_armor":
				{
					dev_cac_set_model_range(&sort_greatest, "");
					break;
				}
				case "worst_bullet_armor":
				{
					dev_cac_set_model_range(&sort_least, "");
					break;
				}
				case "best_explosive_armor":
				{
					dev_cac_set_model_range(&sort_greatest, "");
					break;
				}
				case "worst_explosive_armor":
				{
					dev_cac_set_model_range(&sort_least, "");
					break;
				}
				case "best_mobility":
				{
					dev_cac_set_model_range(&sort_greatest, "");
					break;
				}
				case "worst_mobility":
				{
					dev_cac_set_model_range(&sort_least, "");
					break;
				}
				case "camera":
				{
					dev_cac_camera_on = !dev_cac_camera_on;
					dev_cac_camera(dev_cac_camera_on);
					break;
				}
				case "dpad_camo":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "dpad_meleecamo":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "dpad_lens":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "dpad_reticle":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_726874ce63e6471c":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_175b7e6688ef31a6":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_4293810c7550f275":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_69d8a058583621e4":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_69d8a15858362397":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_69d8a2585836254a":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_69d8a358583626fd":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_69d89c5858361b18":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_69d89d5858361ccb":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_69d89e5858361e7e":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_69d89f5858362031":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_6197bff71b874ed0":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_6197c0f71b875083":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_6197c1f71b875236":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "hash_6197c2f71b8753e9":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "dpad_reticle_color":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "dpad_facepaint_pattern":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "dpad_facepaint_color":
				{
					host thread dev_cac_dpad_think("", &dev_cac_cycle_render_options, "");
					break;
				}
				case "dpad_reset":
				{
					host notify(#"dev_cac_dpad_think");
					if(isdefined(level.var_5a507627))
					{
						host setactionslot(3, level.var_5a507627);
						host setactionslot(4, level.var_4918d3b8);
						level.var_5a507627 = undefined;
						level.var_4918d3b8 = undefined;
					}
					break;
				}
			}
			if(reset)
			{
				setdvar(#"devgui_dev_cac", "");
			}
		}
	#/
}

/*
	Name: dev_cac_camera
	Namespace: dev_class
	Checksum: 0x57376449
	Offset: 0xBA0
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function dev_cac_camera(on)
{
	/#
		if(on)
		{
			self setclientthirdperson(1);
			setdvar(#"cg_thirdpersonangle", 185);
			setdvar(#"cg_thirdpersonrange", 138);
			setdvar(#"cg_fov", 20);
		}
		else
		{
			self setclientthirdperson(0);
			setdvar(#"cg_fov", getdvarstring(#"cg_fov_default"));
		}
	#/
}

/*
	Name: dev_cac_dpad_think
	Namespace: dev_class
	Checksum: 0xA391331A
	Offset: 0xCB0
	Size: 0x25E
	Parameters: 3
	Flags: None
*/
function dev_cac_dpad_think(part_name, cycle_function, tag)
{
	/#
		self notify(#"dev_cac_dpad_think");
		self endon(#"dev_cac_dpad_think", #"disconnect");
		iprintln(("" + part_name) + "");
		iprintln(("" + part_name) + "");
		dpad_left = 0;
		dpad_right = 0;
		if(!isdefined(level.var_5a507627))
		{
			level.var_5a507627 = self function_a8bbc98a(3);
			level.var_4918d3b8 = self function_a8bbc98a(4);
		}
		level.dev_cac_player thread highlight_player();
		for(;;)
		{
			self setactionslot(3, "");
			self setactionslot(4, "");
			if(!dpad_left && self buttonpressed(""))
			{
				[[cycle_function]](0, tag);
				dpad_left = 1;
			}
			else if(!self buttonpressed(""))
			{
				dpad_left = 0;
			}
			if(!dpad_right && self buttonpressed(""))
			{
				[[cycle_function]](1, tag);
				dpad_right = 1;
			}
			else if(!self buttonpressed(""))
			{
				dpad_right = 0;
			}
			waitframe(1);
		}
	#/
}

/*
	Name: next_in_list
	Namespace: dev_class
	Checksum: 0x744EC1EE
	Offset: 0xF18
	Size: 0x92
	Parameters: 2
	Flags: None
*/
function next_in_list(value, list)
{
	/#
		if(!isdefined(value))
		{
			return list[0];
		}
		for(i = 0; i < list.size; i++)
		{
			if(value == list[i])
			{
				if(isdefined(list[i + 1]))
				{
					value = list[i + 1];
				}
				else
				{
					value = list[0];
				}
				break;
			}
		}
		return value;
	#/
}

/*
	Name: prev_in_list
	Namespace: dev_class
	Checksum: 0x7D4BFF22
	Offset: 0xFB8
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function prev_in_list(value, list)
{
	/#
		if(!isdefined(value))
		{
			return list[0];
		}
		for(i = 0; i < list.size; i++)
		{
			if(value == list[i])
			{
				if(isdefined(list[i - 1]))
				{
					value = list[i - 1];
				}
				else
				{
					value = list[list.size - 1];
				}
				break;
			}
		}
		return value;
	#/
}

/*
	Name: dev_cac_set_player_model
	Namespace: dev_class
	Checksum: 0x2189EA25
	Offset: 0x1060
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function dev_cac_set_player_model()
{
	/#
		self.tag_stowed_back = undefined;
		self.tag_stowed_hip = undefined;
	#/
}

/*
	Name: dev_cac_cycle_body
	Namespace: dev_class
	Checksum: 0x8E65EA5
	Offset: 0x1088
	Size: 0xDC
	Parameters: 2
	Flags: None
*/
function dev_cac_cycle_body(forward, tag)
{
	/#
		if(!dev_cac_player_valid())
		{
			return;
		}
		player = level.dev_cac_player;
		keys = getarraykeys(level.cac_functions[#"set_body_model"]);
		if(tag)
		{
			player.cac_body_type = next_in_list(player.cac_body_type, keys);
		}
		else
		{
			player.cac_body_type = prev_in_list(player.cac_body_type, keys);
		}
		player dev_cac_set_player_model();
	#/
}

/*
	Name: dev_cac_cycle_head
	Namespace: dev_class
	Checksum: 0x418BA424
	Offset: 0x1170
	Size: 0xEC
	Parameters: 2
	Flags: None
*/
function dev_cac_cycle_head(forward, tag)
{
	/#
		if(!dev_cac_player_valid())
		{
			return;
		}
		player = level.dev_cac_player;
		keys = getarraykeys(level.cac_functions[#"set_head_model"]);
		if(tag)
		{
			player.cac_head_type = next_in_list(player.cac_head_type, keys);
		}
		else
		{
			player.cac_head_type = prev_in_list(player.cac_head_type, keys);
		}
		player.cac_hat_type = "";
		player dev_cac_set_player_model();
	#/
}

/*
	Name: dev_cac_cycle_character
	Namespace: dev_class
	Checksum: 0xFB468A6B
	Offset: 0x1268
	Size: 0xEC
	Parameters: 2
	Flags: None
*/
function dev_cac_cycle_character(forward, tag)
{
	/#
		if(!dev_cac_player_valid())
		{
			return;
		}
		player = level.dev_cac_player;
		keys = getarraykeys(level.cac_functions[#"set_body_model"]);
		if(tag)
		{
			player.cac_body_type = next_in_list(player.cac_body_type, keys);
		}
		else
		{
			player.cac_body_type = prev_in_list(player.cac_body_type, keys);
		}
		player.cac_hat_type = "";
		player dev_cac_set_player_model();
	#/
}

/*
	Name: dev_cac_cycle_render_options
	Namespace: dev_class
	Checksum: 0x4AEDFDC5
	Offset: 0x1360
	Size: 0x5C
	Parameters: 3
	Flags: None
*/
function dev_cac_cycle_render_options(forward, tag, count)
{
	/#
		if(!dev_cac_player_valid())
		{
			return;
		}
		level.dev_cac_player function_fda57e3c(tag, forward, count);
	#/
}

/*
	Name: dev_cac_player_valid
	Namespace: dev_class
	Checksum: 0x9D0D076B
	Offset: 0x13C8
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function dev_cac_player_valid()
{
	/#
		return isdefined(level.dev_cac_player) && level.dev_cac_player.sessionstate == "";
	#/
}

/*
	Name: dev_cac_cycle_player
	Namespace: dev_class
	Checksum: 0x55B99236
	Offset: 0x1408
	Size: 0xE2
	Parameters: 1
	Flags: None
*/
function dev_cac_cycle_player(forward)
{
	/#
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(forward)
			{
				level.dev_cac_player = next_in_list(level.dev_cac_player, players);
			}
			else
			{
				level.dev_cac_player = prev_in_list(level.dev_cac_player, players);
			}
			if(dev_cac_player_valid())
			{
				level.dev_cac_player thread highlight_player();
				return;
			}
		}
		level.dev_cac_player = undefined;
	#/
}

/*
	Name: highlight_player
	Namespace: dev_class
	Checksum: 0x6584C0A4
	Offset: 0x14F8
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function highlight_player()
{
	/#
		self sethighlighted(1);
		wait(1);
		self sethighlighted(0);
	#/
}

/*
	Name: dev_cac_overlay_think
	Namespace: dev_class
	Checksum: 0xF78C5315
	Offset: 0x1548
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function dev_cac_overlay_think()
{
	/#
		hud = dev_cac_overlay_create();
		level thread dev_cac_overlay_update(hud);
		level waittill(#"dev_cac_overlay_think");
		dev_cac_overlay_destroy(hud);
	#/
}

/*
	Name: dev_cac_overlay_update
	Namespace: dev_class
	Checksum: 0x20AF2DE1
	Offset: 0x15C0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function dev_cac_overlay_update(hud)
{
	/#
	#/
}

/*
	Name: dev_cac_overlay_destroy
	Namespace: dev_class
	Checksum: 0xD6C12804
	Offset: 0x15D8
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function dev_cac_overlay_destroy(hud)
{
	/#
		for(i = 0; i < hud.menu.size; i++)
		{
			hud.menu[i] destroy();
		}
		hud destroy();
		setdvar(#"player_debugsprint", 0);
	#/
}

/*
	Name: dev_cac_overlay_create
	Namespace: dev_class
	Checksum: 0x814CA91F
	Offset: 0x1678
	Size: 0xC0C
	Parameters: 0
	Flags: None
*/
function dev_cac_overlay_create()
{
	/#
		x = -80;
		y = 140;
		menu_name = "";
		hud = dev::new_hud(menu_name, undefined, x, y, 1);
		hud setshader(#"white", 185, 285);
		hud.alignx = "";
		hud.aligny = "";
		hud.sort = 10;
		hud.alpha = 0.6;
		hud.color = vectorscale((0, 0, 1), 0.5);
		x_offset = 100;
		hud.menu[0] = dev::new_hud(menu_name, "", x + 5, y + 10, 1.3);
		hud.menu[1] = dev::new_hud(menu_name, "", x + 5, y + 25, 1);
		hud.menu[2] = dev::new_hud(menu_name, "", x + 5, y + 35, 1);
		hud.menu[3] = dev::new_hud(menu_name, "", x + 5, y + 45, 1);
		hud.menu[4] = dev::new_hud(menu_name, "", x + 5, y + 55, 1);
		hud.menu[5] = dev::new_hud(menu_name, "", x + 5, y + 70, 1);
		hud.menu[6] = dev::new_hud(menu_name, "", x + 5, y + 80, 1);
		hud.menu[7] = dev::new_hud(menu_name, "", x + 5, y + 90, 1);
		hud.menu[8] = dev::new_hud(menu_name, "", x + 5, y + 100, 1);
		hud.menu[9] = dev::new_hud(menu_name, "", x + 5, y + 110, 1);
		hud.menu[10] = dev::new_hud(menu_name, "", x + 5, y + 120, 1);
		hud.menu[11] = dev::new_hud(menu_name, "", x + 5, y + 135, 1);
		hud.menu[12] = dev::new_hud(menu_name, "", x + 5, y + 145, 1);
		hud.menu[13] = dev::new_hud(menu_name, "", x + 5, y + 155, 1);
		hud.menu[14] = dev::new_hud(menu_name, "", x + 5, y + 170, 1);
		hud.menu[15] = dev::new_hud(menu_name, "", x + 5, y + 180, 1);
		hud.menu[16] = dev::new_hud(menu_name, "", x + 5, y + 190, 1);
		hud.menu[17] = dev::new_hud(menu_name, "", x + 5, y + 205, 1);
		hud.menu[18] = dev::new_hud(menu_name, "", x + 5, y + 215, 1);
		hud.menu[19] = dev::new_hud(menu_name, "", x + 5, y + 225, 1);
		hud.menu[20] = dev::new_hud(menu_name, "", x + 5, y + 235, 1);
		hud.menu[21] = dev::new_hud(menu_name, "", x + 5, y + 245, 1);
		hud.menu[22] = dev::new_hud(menu_name, "", x + 5, y + 255, 1);
		hud.menu[23] = dev::new_hud(menu_name, "", x + 5, y + 265, 1);
		hud.menu[24] = dev::new_hud(menu_name, "", x + 5, y + 275, 1);
		x_offset = 65;
		hud.menu[25] = dev::new_hud(menu_name, "", x + x_offset, y + 35, 1);
		hud.menu[26] = dev::new_hud(menu_name, "", x + x_offset, y + 45, 1);
		hud.menu[27] = dev::new_hud(menu_name, "", x + x_offset, y + 55, 1);
		x_offset = 100;
		hud.menu[28] = dev::new_hud(menu_name, "", x + x_offset, y + 80, 1);
		hud.menu[29] = dev::new_hud(menu_name, "", x + x_offset, y + 90, 1);
		hud.menu[30] = dev::new_hud(menu_name, "", x + x_offset, y + 100, 1);
		hud.menu[31] = dev::new_hud(menu_name, "", x + x_offset, y + 110, 1);
		hud.menu[32] = dev::new_hud(menu_name, "", x + x_offset, y + 120, 1);
		hud.menu[33] = dev::new_hud(menu_name, "", x + x_offset, y + 145, 1);
		hud.menu[34] = dev::new_hud(menu_name, "", x + x_offset, y + 155, 1);
		hud.menu[35] = dev::new_hud(menu_name, "", x + x_offset, y + 180, 1);
		hud.menu[36] = dev::new_hud(menu_name, "", x + x_offset, y + 190, 1);
		x_offset = 65;
		hud.menu[37] = dev::new_hud(menu_name, "", x + x_offset, y + 215, 1);
		hud.menu[38] = dev::new_hud(menu_name, "", x + x_offset, y + 225, 1);
		hud.menu[39] = dev::new_hud(menu_name, "", x + x_offset, y + 235, 1);
		hud.menu[40] = dev::new_hud(menu_name, "", x + x_offset, y + 245, 1);
		hud.menu[41] = dev::new_hud(menu_name, "", x + x_offset, y + 255, 1);
		hud.menu[42] = dev::new_hud(menu_name, "", x + x_offset, y + 265, 1);
		hud.menu[43] = dev::new_hud(menu_name, "", x + x_offset, y + 275, 1);
		return hud;
	#/
}

/*
	Name: color
	Namespace: dev_class
	Checksum: 0x2D131950
	Offset: 0x2290
	Size: 0x8A
	Parameters: 1
	Flags: None
*/
function color(value)
{
	/#
		r = 1;
		g = 1;
		b = 0;
		color = (0, 0, 0);
		if(value > 0)
		{
			r = r - value;
		}
		else
		{
			g = g + value;
		}
		c = (r, g, b);
		return c;
	#/
}

/*
	Name: dev_cac_gdt_update_think
	Namespace: dev_class
	Checksum: 0x2D0DA2A
	Offset: 0x2328
	Size: 0x1DA
	Parameters: 0
	Flags: None
*/
function dev_cac_gdt_update_think()
{
	/#
		for(;;)
		{
			waitresult = undefined;
			waitresult = level waittill(#"gdt_update");
			asset = waitresult.asset;
			keyvalue = waitresult.keyvalue;
			keyvalue = strtok(keyvalue, "");
			key = keyvalue[0];
			switch(key)
			{
				case "armorbullet":
				{
					key = "";
					break;
				}
				case "armorexplosive":
				{
					key = "";
					break;
				}
				case "movespeed":
				{
					key = "";
					break;
				}
				case "sprinttimetotal":
				{
					key = "";
					break;
				}
				case "sprinttimecooldown":
				{
					key = "";
					break;
				}
				default:
				{
					key = undefined;
					break;
				}
			}
			if(!isdefined(key))
			{
				continue;
			}
			value = float(keyvalue[1]);
			level.cac_attributes[key][asset] = value;
			players = getplayers();
			for(i = 0; i < players.size; i++)
			{
			}
		}
	#/
}

/*
	Name: sort_greatest
	Namespace: dev_class
	Checksum: 0x5ED4970B
	Offset: 0x2510
	Size: 0xB0
	Parameters: 3
	Flags: None
*/
function sort_greatest(func, attribute, greatest)
{
	/#
		keys = getarraykeys(level.cac_functions[func]);
		greatest = keys[0];
		for(i = 0; i < keys.size; i++)
		{
			if(level.cac_attributes[attribute][keys[i]] > level.cac_attributes[attribute][greatest])
			{
				greatest = keys[i];
			}
		}
		return greatest;
	#/
}

/*
	Name: sort_least
	Namespace: dev_class
	Checksum: 0xA45AA9B5
	Offset: 0x25D0
	Size: 0xB0
	Parameters: 3
	Flags: None
*/
function sort_least(func, attribute, least)
{
	/#
		keys = getarraykeys(level.cac_functions[func]);
		least = keys[0];
		for(i = 0; i < keys.size; i++)
		{
			if(level.cac_attributes[attribute][keys[i]] < level.cac_attributes[attribute][least])
			{
				least = keys[i];
			}
		}
		return least;
	#/
}

/*
	Name: dev_cac_set_model_range
	Namespace: dev_class
	Checksum: 0xA307B615
	Offset: 0x2690
	Size: 0xAC
	Parameters: 2
	Flags: None
*/
function dev_cac_set_model_range(sort_function, attribute)
{
	/#
		if(!dev_cac_player_valid())
		{
			return;
		}
		player = level.dev_cac_player;
		player.cac_body_type = [[sort_function]]("", attribute);
		player.cac_head_type = [[sort_function]]("", attribute);
		player.cac_hat_type = [[sort_function]]("", attribute);
		player dev_cac_set_player_model();
	#/
}

