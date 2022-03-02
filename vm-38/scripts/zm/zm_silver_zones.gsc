#using script_2f560596a9a134ab;
#using script_4ce5d94e8c797350;
#using script_5b4f7a8178990872;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_51925ebc;

/*
	Name: function_c38e39b8
	Namespace: namespace_51925ebc
	Checksum: 0x17E9F752
	Offset: 0x948
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c38e39b8()
{
	level notify(125311928);
}

/*
	Name: init
	Namespace: namespace_51925ebc
	Checksum: 0xFE1EE685
	Offset: 0x968
	Size: 0x154
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	callback::on_spawned(&function_44b1279a);
	level.var_65c43c31 = [14:"zone_trans_south_pap_room", 13:"zone_trans_north_pap_room", 12:"zone_trans_south_tunnel", 11:"zone_power_tunnel", 10:"zone_center_lower", 9:"zone_center_upper", 8:"zone_center_upper_north", 7:"zone_center_upper_west", 6:"zone_trans_south", 5:"zone_trans_north", 4:"zone_power_trans_south", 3:"zone_power_trans_north", 2:"zone_power_room_outside", 1:"zone_power_room", 0:"zone_tunnel_interior"];
	level.var_aa3b88c5 = &function_27028b8e;
	level.var_27028b8e = &function_27028b8e;
}

/*
	Name: zone_init
	Namespace: namespace_51925ebc
	Checksum: 0xA630E247
	Offset: 0xAC8
	Size: 0x1034
	Parameters: 0
	Flags: Linked
*/
function zone_init()
{
	level flag::init("always_on");
	level flag::set("always_on");
	zm_zonemgr::zone_init("zone_proto_start");
	zm_zonemgr::add_adjacent_zone("zone_proto_start", "zone_proto_start2", "always_on", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_start", "zone_proto_interior_lower", "connect_start_to_proto_interior", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_start", "zone_power_tunnel", "connect_to_power_tunnel", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_start2", "zone_proto_interior_cave", "connect_start_to_proto_cave", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_upstairs", "zone_proto_plane_exterior", "connect_upstairs_to_proto_plane_exterior", 0);
	zm_zonemgr::add_zone_flags("connect_upstairs_to_proto_plane_exterior", "connect_upstairs_to_roof");
	zm_zonemgr::add_zone_flags("connect_upstairs_to_proto_cave", "connect_upstairs_to_roof");
	zm_zonemgr::add_adjacent_zone("zone_proto_roof_plane", "zone_proto_plane_exterior", "connect_roof_to_plane", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_roof_plane", "zone_proto_roof_center", "connect_interior_to_proto_upstairs_2", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_roof_plane", "zone_proto_roof_center", "connect_upstairs_to_proto_cave", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_interior_cave", "zone_proto_upstairs", "connect_upstairs_to_proto_cave", 0);
	zm_zonemgr::add_zone_flags("connect_start_to_proto_interior", "connect_interior_lower");
	zm_zonemgr::add_zone_flags("connect_cave_to_proto_interior", "connect_interior_lower");
	zm_zonemgr::add_zone_flags("connect_interior_to_proto_upstairs_2", "connect_interior_lower");
	zm_zonemgr::add_adjacent_zone("zone_proto_interior_lower", "zone_proto_interior_cave", "connect_cave_to_proto_interior", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_interior_lower", "zone_proto_upstairs_2", "connect_interior_to_proto_upstairs_2", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_interior_lower", "zone_proto_exterior_rear", "connect_interior_to_proto_exterior_rear", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_interior_lower", "zone_wonder_weapon_room", "open_wonder_weapon_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_upstairs_2", "zone_proto_upstairs", "connect_upstairs_2_to_proto_upstairs", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_upstairs_2", "zone_proto_exterior_rear", "connect_upstairs_2_to_proto_exterior_rear", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_upstairs_2", "zone_proto_roof_center", "connect_upstairs_2_to_roof", 0);
	zm_zonemgr::add_zone_flags("connect_interior_to_proto_upstairs_2", "connect_upstairs_2_to_roof");
	zm_zonemgr::add_zone_flags("connect_upstairs_2_to_proto_upstairs", "connect_upstairs_2_to_roof");
	zm_zonemgr::add_zone_flags("connect_upstairs_2_to_proto_exterior_rear", "connect_upstairs_2_to_roof");
	zm_zonemgr::add_adjacent_zone("zone_proto_plane_exterior", "zone_proto_exterior_rear", "connect_plane_2_to_proto_front", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_plane_exterior", "zone_tunnel_interior", "connect_plane_to_tunnel", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_plane_exterior", "zone_proto_plane_exterior2", "connect_plane_exterior", 0);
	zm_zonemgr::add_zone_flags("connect_upstairs_to_proto_plane_exterior", "connect_plane_exterior");
	zm_zonemgr::add_zone_flags("connect_roof_to_plane", "connect_plane_exterior");
	zm_zonemgr::add_zone_flags("connect_plane_2_to_proto_front", "connect_plane_exterior");
	zm_zonemgr::add_zone_flags("connect_plane_to_tunnel", "connect_plane_exterior");
	zm_zonemgr::add_adjacent_zone("zone_proto_exterior_rear2", "zone_tunnel_interior", "connect_proto_exterior_rear_to_tunnel", 0);
	zm_zonemgr::add_adjacent_zone("zone_proto_exterior_rear2", "zone_proto_exterior_rear", "connect_exterior_rear", 0);
	zm_zonemgr::add_zone_flags("connect_proto_exterior_rear_to_tunnel", "connect_exterior_rear");
	zm_zonemgr::add_zone_flags("connect_upstairs_2_to_proto_exterior_rear", "connect_exterior_rear");
	zm_zonemgr::add_zone_flags("connect_plane_2_to_proto_front", "connect_exterior_rear");
	zm_zonemgr::add_zone_flags("connect_upstairs_2_to_proto_exterior_rear", "connect_exterior_rear");
	zm_zonemgr::add_adjacent_zone("zone_tunnel_interior", "zone_power_room", "connect_tunnel_to_power_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_tunnel_interior", "zone_power_room_outside", "connect_tunnel_to_power_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_power_room_outside", "zone_power_room", "connect_tunnel_to_power_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_power_room", "zone_power_trans_north", "connect_power_trans_north_to_trans_north_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_power_room_outside", "zone_power_trans_north", "connect_power_trans_north_to_trans_north_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_power_room", "zone_power_trans_south", "connect_power_trans_south_to_trans_south_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_power_room_outside", "zone_power_trans_south", "connect_power_trans_south_to_trans_south_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_power_trans_north", "zone_trans_north", "connect_power_trans_north_to_trans_north_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_trans_north", "zone_center_upper_north", "connect_trans_to_particle_accelerator", 0);
	zm_zonemgr::add_adjacent_zone("zone_trans_north", "zone_trans_north_pap_room", "connect_zone_trans_north_pap_room_to_zone_trans_north", 0);
	zm_zonemgr::add_zone_flags("connect_power_trans_north_to_trans_north_room", "connect_medical_bay");
	zm_zonemgr::add_zone_flags("connect_trans_to_particle_accelerator", "connect_medical_bay");
	zm_zonemgr::add_adjacent_zone("zone_center_upper_north", "zone_center_lower", "connect_center_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_center_upper_north", "zone_center_upper", "connect_center_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_power_trans_south", "zone_trans_south", "connect_power_trans_south_to_trans_south_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_trans_south", "zone_trans_south_tunnel", "connect_trans_to_particle_accelerator", 0);
	zm_zonemgr::add_adjacent_zone("zone_trans_south", "zone_trans_south_pap_room", "connect_zone_trans_south_pap_room_to_zone_trans_south", 0);
	zm_zonemgr::add_zone_flags("connect_power_trans_south_to_trans_south_room", "connect_weapon_lab");
	zm_zonemgr::add_zone_flags("connect_trans_to_particle_accelerator", "connect_weapon_lab");
	zm_zonemgr::add_adjacent_zone("zone_center_upper_west", "zone_center_lower", "connect_center_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_center_upper_west", "zone_center_upper", "connect_center_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_center_upper_west", "zone_trans_south_tunnel", "connect_trans_to_particle_accelerator", 0);
	zm_zonemgr::add_adjacent_zone("zone_center_lower", "zone_center_upper", "connect_center_room", 0);
	zm_zonemgr::add_adjacent_zone("zone_center_upper", "zone_power_tunnel", "connect_to_power_tunnel", 0);
	zm_zonemgr::add_zone_flags("connect_trans_to_particle_accelerator", "connect_center_room");
	zm_zonemgr::add_zone_flags("connect_to_power_tunnel", "connect_center_room");
	zm_zonemgr::add_zone_flags("connect_proto_exterior_rear_to_tunnel", "connect_tunnel_to_power_room");
	zm_zonemgr::add_zone_flags("connect_plane_to_tunnel", "connect_tunnel_to_power_room");
	namespace_f0b43eb5::function_cd7f17dd(#"hash_60b2f29696c25fc4", 90, array("zone_proto_start", "zone_proto_start2"), undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_yard", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_57c709d0608e925f", 90, "zone_proto_interior_lower", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_west_ruins_1f", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_3e868812f1167436", 90, "zone_proto_upstairs", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_east_ruins_2f", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_403956d6660b774e", 90, array("zone_proto_roof_center", "zone_proto_roof_plane"), undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_ruins_roof", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_1417cb50f78e17e3", 90, "zone_power_tunnel", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_main_power", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_77344bcb8a308c09", 90, array("zone_power_room_outside", "zone_power_room"), undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_control_room", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	s_challenge = namespace_f0b43eb5::function_cd7f17dd(#"hash_7bfe0d876e389ddc", 90, "zone_proto_plane_exterior", undefined, #"hash_5cee7e17aff44d7e", "s_obj_challenge_zone_plane_wing", &namespace_f0b43eb5::function_1d60215, &namespace_f0b43eb5::function_6be352fc);
	s_challenge.var_4e0096cd = #"hash_529ed1bcbf7f6525";
	namespace_f0b43eb5::function_cd7f17dd(#"hash_7cb657a5f657cbbe", 90, array("zone_proto_start", "zone_proto_start2"), undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_yard", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_756817dc68da56e9", 90, array("zone_proto_exterior_rear", "zone_proto_exterior_rear2"), undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_pond", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_2272d4303498d425", 90, array("zone_proto_plane_exterior", "zone_proto_plane_exterior2"), undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_crash_site", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_7e17eba37f893fb4", 90, "zone_tunnel_interior", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_tunnel", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_795ccb5ead8f853e", 90, "zone_trans_north", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_medical_bay", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_7f0be97960376eb0", 90, array("zone_center_upper", "zone_center_lower", "zone_center_upper_north", "zone_center_upper_west"), undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_particle_accelerator", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_aee5cb4bd88c4ee", 90, "zone_trans_south", undefined, #"hash_374955e0c82d6aa4", "s_obj_challenge_zone_weapons_lab", &namespace_f0b43eb5::function_f51adffa, &namespace_f0b43eb5::function_9742c28f);
	namespace_f0b43eb5::function_cd7f17dd(#"hash_28a0e374fc2d128b", 90, undefined, undefined, #"hash_136efa9e9c0bcf06", undefined, &function_a0910b80, &function_f62d4e38);
}

/*
	Name: function_a0910b80
	Namespace: namespace_51925ebc
	Checksum: 0xE232F773
	Offset: 0x1B08
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_a0910b80()
{
	callback::on_ai_killed(&function_34c9de53);
}

/*
	Name: function_34c9de53
	Namespace: namespace_51925ebc
	Checksum: 0xD95DDDC7
	Offset: 0x1B38
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_34c9de53(params)
{
	if(isplayer(params.eattacker) && level flag::get(#"dark_aether_active"))
	{
		params.eattacker namespace_f999c142::function_53a333a8(#"hash_1c39f9ea95f27462", level.var_8b7ab859 * 0.02);
	}
}

/*
	Name: function_f62d4e38
	Namespace: namespace_51925ebc
	Checksum: 0xB68F271D
	Offset: 0x1BC8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_f62d4e38()
{
	callback::remove_on_ai_killed(&function_34c9de53);
}

/*
	Name: function_a74dcd0a
	Namespace: namespace_51925ebc
	Checksum: 0x425C7913
	Offset: 0x1BF8
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function function_a74dcd0a(player)
{
	if(!isdefined(level.var_fdcaf3a6))
	{
		return player zm_zonemgr::get_player_zone();
	}
	if(player.cached_zone.name === #"zone_proto_exterior_rear2" || player.cached_zone.name === #"zone_proto_exterior_rear")
	{
		return #"zone_proto_exterior_rear";
	}
	return player zm_zonemgr::get_player_zone();
}

/*
	Name: function_64c67df3
	Namespace: namespace_51925ebc
	Checksum: 0x486F47E1
	Offset: 0x1CB8
	Size: 0x13E
	Parameters: 1
	Flags: Linked
*/
function function_64c67df3(var_e2414b1b)
{
	if(isdefined(level.var_fdcaf3a6) && isdefined(var_e2414b1b))
	{
		if(var_e2414b1b.cost == 2)
		{
			if(self.cached_zone.name === #"zone_tunnel_interior")
			{
				if(self.favoriteenemy.cached_zone.name === #"zone_proto_exterior_rear2")
				{
					if(is_true(level.flag[#"connect_proto_exterior_rear_to_tunnel"]))
					{
						return level.zones[#"zone_proto_exterior_rear2"];
					}
				}
				else if(self.favoriteenemy.cached_zone.name === #"zone_proto_exterior_rear")
				{
					if(is_true(level.flag[#"connect_proto_exterior_rear_to_tunnel"]))
					{
						return level.zones[#"zone_proto_exterior_rear2"];
					}
				}
			}
		}
	}
}

/*
	Name: function_44b1279a
	Namespace: namespace_51925ebc
	Checksum: 0x5596DED9
	Offset: 0x1E00
	Size: 0x1A8
	Parameters: 0
	Flags: Linked
*/
function function_44b1279a()
{
	self notify("13555e3c28fae15f");
	self endon("13555e3c28fae15f");
	self endon(#"disconnect");
	while(true)
	{
		is_player_in_zone = self zm_zonemgr::is_player_in_zone(level.var_65c43c31, 0);
		var_c2858d41 = self clientfield::get_to_player("" + #"hash_464e0cd19b3b8c12");
		if(is_player_in_zone && var_c2858d41 == 0)
		{
			self clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 1);
			self clientfield::set_to_player("" + #"hash_464e0cd19b3b8c12", 1);
		}
		else if(!is_player_in_zone && var_c2858d41 == 1)
		{
			self clientfield::set_to_player("" + #"hash_464e0cd19b3b8c12", 0);
			self clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 0);
		}
		var_be17187b = undefined;
		var_be17187b = self waittill(#"hash_2d4daa9e80b86b60");
	}
}

/*
	Name: function_27028b8e
	Namespace: namespace_51925ebc
	Checksum: 0xA8A75229
	Offset: 0x1FB0
	Size: 0x36E
	Parameters: 1
	Flags: Linked
*/
function function_27028b8e(str_zone)
{
	if(!isdefined(str_zone))
	{
		return undefined;
	}
	if(isarray(str_zone))
	{
		str_zone = str_zone[0];
	}
	switch(str_zone)
	{
		case "zone_proto_start2":
		case "zone_proto_start":
		{
			var_601fee0 = #"hash_5dec24fd79fe88e4";
			break;
		}
		case "zone_proto_upstairs":
		{
			var_601fee0 = #"hash_1883157e3a8c1bcf";
			break;
		}
		case "zone_proto_interior_cave":
		{
			var_601fee0 = #"hash_3b12520037a181";
			break;
		}
		case "zone_proto_interior_lower":
		{
			var_601fee0 = #"hash_48fcaccdc583f88a";
			break;
		}
		case "zone_proto_upstairs_2":
		{
			var_601fee0 = #"hash_58e5493c26a40efd";
			break;
		}
		case "zone_proto_roof_plane":
		case "zone_proto_roof_center":
		{
			var_601fee0 = #"hash_29459d2873e524e";
			break;
		}
		case "zone_proto_plane_exterior":
		case "zone_proto_plane_exterior2":
		{
			var_601fee0 = #"hash_621ea24bd69a239";
			break;
		}
		case "zone_proto_exterior_rear":
		case "zone_proto_exterior_rear2":
		{
			var_601fee0 = #"hash_3b327c1463ec9f8d";
			break;
		}
		case "zone_tunnel_interior":
		{
			var_601fee0 = #"hash_32b5142fe11acb26";
			break;
		}
		case "zone_power_room":
		case "zone_power_room_outside":
		case "zone_power_trans_north":
		case "zone_power_trans_south":
		{
			var_601fee0 = #"hash_3f356cdd2bb6e576";
			break;
		}
		case "zone_trans_north_pap_room":
		case "zone_trans_north":
		{
			var_601fee0 = #"hash_3e51b8ba7a93fbe";
			break;
		}
		case "zone_trans_south_pap_room":
		case "zone_trans_south":
		case "zone_trans_south_tunnel":
		{
			var_601fee0 = #"hash_7988e17f66389e69";
			break;
		}
		case "zone_center_upper_west":
		case "zone_center_lower":
		case "zone_center_upper_north":
		case "zone_center_upper":
		{
			var_601fee0 = #"hash_57edcb7278524c75";
			break;
		}
		case "zone_power_tunnel":
		{
			var_601fee0 = #"hash_75f7127232f283bb";
			break;
		}
		default:
		{
			var_601fee0 = undefined;
			break;
		}
	}
	return var_601fee0;
}

