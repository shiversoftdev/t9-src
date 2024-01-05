#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_812a8849;

/*
	Name: function_ecec3e99
	Namespace: namespace_812a8849
	Checksum: 0x1970223B
	Offset: 0x178
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ecec3e99()
{
	level notify(1823303987);
}

/*
	Name: init
	Namespace: namespace_812a8849
	Checksum: 0x3F1BD896
	Offset: 0x198
	Size: 0x2BC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "dark_aether_active", 1, 1, "int");
	clientfield::register("world", "terminal_on", 1, 1, "int");
	clientfield::register("world", "center_zone_lights_off", 1, 1, "int");
	clientfield::register("world", "gold_container_receptacle", 1, 2, "int");
	clientfield::register("world", "exfil_begin", 1, 1, "int");
	clientfield::register("world", "exfil_aether_trigger", 1, 1, "int");
	level thread function_d88ded8(#"dark_aether_active", "dark_aether_active");
	level thread function_d88ded8(array("terminal_1_is_on", "terminal_2_is_on"), "terminal_on");
	level thread function_d88ded8(#"hash_94bda7ad49639f5", "center_zone_lights_off");
	level thread function_d88ded8(#"hash_6dae739b31c68d72", "exfil_begin");
	level thread function_d88ded8(#"exfil_aether_trigger", "exfil_aether_trigger");
	level thread function_b5bdf435();
	clientfield::register("world", "helping_hand_room_light", 1, 3, "int");
	clientfield::register("world", "dance_party_light", 1, 1, "int");
	clientfield::register("world", "eye_corpse_light", 1, 3, "int");
	level thread function_387ae4cb();
}

/*
	Name: function_d88ded8
	Namespace: namespace_812a8849
	Checksum: 0xEBC55928
	Offset: 0x460
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function function_d88ded8(flag, clientfield)
{
	level endon(#"end_game");
	while(true)
	{
		level waittill(flag);
		if(isarray(flag))
		{
			level clientfield::set(clientfield, level flag::get_all(flag));
		}
		else
		{
			level clientfield::set(clientfield, level flag::get(flag));
		}
	}
}

/*
	Name: function_b5bdf435
	Namespace: namespace_812a8849
	Checksum: 0xE1BC8108
	Offset: 0x530
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_b5bdf435()
{
	level endon(#"end_game");
	level waittill(#"hash_5d4ec14886878368");
	level clientfield::set("gold_container_receptacle", 1);
	level waittill(#"hash_3b0c1d89e0879d06");
	level clientfield::set("gold_container_receptacle", 2);
}

/*
	Name: function_bd7cde02
	Namespace: namespace_812a8849
	Checksum: 0x6FC2019
	Offset: 0x5C8
	Size: 0x1C2
	Parameters: 1
	Flags: Linked
*/
function function_bd7cde02(state)
{
	level endon(#"hash_2d0433bbc2675311");
	if(isdefined(state))
	{
		switch(state)
		{
			case "turn_all_lights_off":
			{
				level clientfield::set("helping_hand_room_light", 0);
				break;
			}
			case "hash_5352f9e4f4c14e5d":
			{
				level clientfield::set("helping_hand_room_light", 1);
				break;
			}
			case "hash_2ab337a49f728442":
			{
				level clientfield::set("helping_hand_room_light", 2);
				break;
			}
			case "hash_555317dd04ddfb53":
			{
				level clientfield::set("helping_hand_room_light", 3);
				break;
			}
			case "hash_39c27d9e66fbcc70":
			{
				level clientfield::set("helping_hand_room_light", 4);
				break;
			}
			case "turn_room_5_light_on":
			{
				level clientfield::set("helping_hand_room_light", 5);
				break;
			}
			case "turn_room_5_light_off":
			{
				level clientfield::set("helping_hand_room_light", 6);
				break;
			}
		}
	}
}

/*
	Name: function_387ae4cb
	Namespace: namespace_812a8849
	Checksum: 0x758DE2A8
	Offset: 0x798
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_387ae4cb()
{
	level endon(#"end_game");
	level waittill(#"dance_party_light_on");
	level clientfield::set("dance_party_light", 1);
	level waittill(#"dance_party_light_off");
	level clientfield::set("dance_party_light", 0);
}

/*
	Name: function_32ba2029
	Namespace: namespace_812a8849
	Checksum: 0x60A420FC
	Offset: 0x830
	Size: 0x1C2
	Parameters: 1
	Flags: Linked
*/
function function_32ba2029(state)
{
	level endon(#"hash_2d0433bbc2675311");
	if(isdefined(state))
	{
		switch(state)
		{
			case "eye_corpse_all_lights_off":
			{
				level clientfield::set("eye_corpse_light", 0);
				break;
			}
			case "hash_4f392103c121e5e8":
			{
				level clientfield::set("eye_corpse_light", 1);
				break;
			}
			case "hash_2cff279013344d8f":
			{
				level clientfield::set("eye_corpse_light", 2);
				break;
			}
			case "hash_3e957b81e3c5716e":
			{
				level clientfield::set("eye_corpse_light", 3);
				break;
			}
			case "hash_5d0f09f0cbf01d75":
			{
				level clientfield::set("eye_corpse_light", 4);
				break;
			}
			case "hash_10b3c9031d24f9c4":
			{
				level clientfield::set("eye_corpse_light", 5);
				break;
			}
			case "eye_corpse_final_light_on":
			{
				level clientfield::set("eye_corpse_light", 6);
				break;
			}
		}
	}
}

