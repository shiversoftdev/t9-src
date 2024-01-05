#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace namespace_e38c57c1;

/*
	Name: __init__system__
	Namespace: namespace_e38c57c1
	Checksum: 0xF384C07E
	Offset: 0xF8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7576c66086ab62aa", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e38c57c1
	Checksum: 0x4AF7CBBF
	Offset: 0x150
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	/#
		if(getdvarint(#"hash_4894e3a42dd84dfa", 0))
		{
			callback::on_connect(&on_player_connect);
		}
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_e38c57c1
	Checksum: 0x2A4B3A95
	Offset: 0x1A8
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	/#
		if(getdvarint(#"hash_4894e3a42dd84dfa", 0))
		{
			level thread devgui();
		}
	#/
}

/*
	Name: function_9af806be
	Namespace: namespace_e38c57c1
	Checksum: 0xB0FA8E40
	Offset: 0x1F8
	Size: 0x21A
	Parameters: 1
	Flags: None
*/
function function_9af806be(var_c5b25bc5)
{
	/#
		if(isdefined(self.var_2fe40b9d))
		{
			self function_2a94cd59();
		}
	#/
	self.var_2fe40b9d = var_c5b25bc5;
	switch(var_c5b25bc5)
	{
		case 1:
		{
			self player::function_2a67df65(#"fl1", -50);
			self zm_utility::set_max_health();
			break;
		}
		case 2:
		{
			self perks::perk_setperk(#"hash_53010725c65a98a5");
			break;
		}
		case 3:
		{
			self player::function_2a67df65(#"db1", 50);
			self zm_utility::set_max_health();
			break;
		}
		case 4:
		{
			self perks::perk_setperk(#"hash_130074ec6de7a431");
			break;
		}
		case 5:
		{
			self perks::perk_setperk(#"hash_1bc7d0ea42d1d0a8");
			break;
		}
		case 6:
		{
			self zm_laststand::function_3a00302e(1);
			if(!isdefined(self.n_regen_delay))
			{
				self.n_regen_delay = zombie_utility::function_d2dfacfd("player_health_regen_delay");
			}
			self.n_regen_delay = self.n_regen_delay + 1;
			break;
		}
	}
}

/*
	Name: function_2a94cd59
	Namespace: namespace_e38c57c1
	Checksum: 0x555E20E8
	Offset: 0x420
	Size: 0x19A
	Parameters: 0
	Flags: None
*/
function function_2a94cd59()
{
	/#
		var_c5b25bc5 = self.var_2fe40b9d;
	#/
	self.var_2fe40b9d = undefined;
	/#
		switch(var_c5b25bc5)
		{
			case 1:
			{
				self player::function_b933de24(#"fl1");
				break;
			}
			case 2:
			{
				self perks::perk_unsetperk(#"hash_53010725c65a98a5");
				break;
			}
			case 3:
			{
				self player::function_b933de24(#"db1");
				break;
			}
			case 4:
			{
				self perks::perk_unsetperk(#"hash_130074ec6de7a431");
				break;
			}
			case 5:
			{
				self perks::perk_unsetperk(#"hash_1bc7d0ea42d1d0a8");
				break;
			}
			case 6:
			{
				self zm_laststand::function_409dc98e(1, 0);
				self.n_regen_delay = self.n_regen_delay - 1;
				break;
			}
		}
	#/
}

/*
	Name: function_6a7a1533
	Namespace: namespace_e38c57c1
	Checksum: 0xCEF96B7B
	Offset: 0x5C8
	Size: 0x18
	Parameters: 1
	Flags: Linked
*/
function function_6a7a1533(var_c5b25bc5)
{
	return self.var_2fe40b9d === var_c5b25bc5;
}

/*
	Name: actor_damage_override
	Namespace: namespace_e38c57c1
	Checksum: 0xB96B7882
	Offset: 0x5E8
	Size: 0x1B2
	Parameters: 13
	Flags: None
*/
function actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(!isplayer(shitloc) || !isdefined(shitloc.var_2fe40b9d))
	{
		return psoffsettime;
	}
	switch(shitloc.var_2fe40b9d)
	{
		case 1:
		{
			if(shitloc zm_weapons::function_f5a0899d(surfacetype, 0))
			{
				psoffsettime = psoffsettime * 1.15;
			}
			break;
		}
		case 3:
		{
			if(shitloc zm_weapons::function_f5a0899d(surfacetype, 0))
			{
				psoffsettime = psoffsettime * 0.85;
			}
			break;
		}
		case 6:
		{
			if(boneindex == "MOD_MELEE" && isdefined(surfacetype) && !surfacetype.isriotshield && !zm_loadout::is_hero_weapon(surfacetype))
			{
				psoffsettime = psoffsettime + 200;
			}
			break;
		}
	}
	return int(psoffsettime);
}

/*
	Name: function_183814d3
	Namespace: namespace_e38c57c1
	Checksum: 0x724FF7C
	Offset: 0x7A8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_183814d3()
{
	self thread function_68992377(1, 1000);
}

/*
	Name: function_c3f3716
	Namespace: namespace_e38c57c1
	Checksum: 0x68FDA76B
	Offset: 0x7D8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_c3f3716()
{
	self thread function_68992377(3, 500);
}

/*
	Name: function_863dc0ef
	Namespace: namespace_e38c57c1
	Checksum: 0x452A1788
	Offset: 0x808
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_863dc0ef(n_cost)
{
	if(self function_6a7a1533(-1000))
	{
		n_cost = n_cost + -1000;
		return int(max(n_cost, 0));
	}
	return n_cost;
}

/*
	Name: function_cbf286b0
	Namespace: namespace_e38c57c1
	Checksum: 0x48F12B2
	Offset: 0x870
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_cbf286b0()
{
	if(!isdefined(self.var_2fe40b9d))
	{
		return 0;
	}
	switch(self.var_2fe40b9d)
	{
		case 2:
		{
			return 0.25;
		}
		case 4:
		{
			return -0.25;
		}
	}
	return 0;
}

/*
	Name: function_3da195ec
	Namespace: namespace_e38c57c1
	Checksum: 0xE842052C
	Offset: 0x8D8
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function function_3da195ec(weapon)
{
	if(!self function_6a7a1533(5))
	{
		return false;
	}
	if(aat::is_exempt_weapon(weapon))
	{
		return false;
	}
	return true;
}

/*
	Name: function_68992377
	Namespace: namespace_e38c57c1
	Checksum: 0xABAC06B2
	Offset: 0x928
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_68992377(var_c5b25bc5, n_cash_back)
{
	self endon(#"disconnect");
	if(self function_6a7a1533(var_c5b25bc5))
	{
		wait(1);
		self zm_score::add_to_player_score(n_cash_back);
	}
}

/*
	Name: devgui
	Namespace: namespace_e38c57c1
	Checksum: 0x2ADAC943
	Offset: 0x990
	Size: 0x640
	Parameters: 0
	Flags: None
*/
function devgui()
{
	/#
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		level.var_8e9d88b6 = [];
		level.var_8e9d88b6[#"fl1"] = 1;
		level.var_8e9d88b6[#"tn1"] = 2;
		level.var_8e9d88b6[#"db1"] = 3;
		level.var_8e9d88b6[#"bf1"] = 4;
		level.var_8e9d88b6[#"helmets1"] = 5;
		level.var_8e9d88b6[#"season1"] = 6;
		while(true)
		{
			waitframe(1);
			str_command = getdvarstring(#"hash_443a451d4b2f9de2", "");
			switch(str_command)
			{
				case "bf1":
				case "season1":
				case "helmets1":
				case "db1":
				case "tn1":
				case "fl1":
				{
					foreach(e_player in getplayers())
					{
						e_player function_9af806be(level.var_8e9d88b6[str_command]);
					}
					break;
				}
				case "clear":
				{
					foreach(e_player in getplayers())
					{
						e_player function_2a94cd59();
					}
					break;
				}
				case "hash_b8b434df6ef34b9":
				case "hash_114b0d4db1699d85":
				case "hash_138c6bb93906947e":
				case "hash_15ba4b3713a7633c":
				case "hash_34fa2d4dc5eb050f":
				case "hash_361dd9611538c0df":
				case "hash_3e6a2360d1dd886b":
				case "hash_410061a21976fb0d":
				case "hash_41af396a9a424584":
				case "hash_41e44f4b44ea8a50":
				case "hash_42e797318220640c":
				case "hash_474ce76a549f9856":
				case "hash_478329f218767aab":
				case "hash_481abb611f991c37":
				case "hash_4b9369313f16a734":
				case "hash_4ebf4bdbdeca4671":
				case "hash_53c07f6aa4b3f3d2":
				case "hash_544ef1318c01b458":
				case "hash_546d41eb20e9ed47":
				case "hash_5642f90448974736":
				case "hash_5a4711612a21ad6d":
				case "hash_6601596aaf4e0e5e":
				case "hash_66603731967362a6":
				case "hash_7f4e4b4da709788d":
				{
					n_player = int(strtok(str_command, "")[1]);
					var_afaaaae2 = strtok(str_command, "")[2];
					function_c1ccd7f3(&function_9af806be, n_player, level.var_8e9d88b6[var_afaaaae2]);
					break;
				}
				case "hash_10e7f44f002ed3c6":
				case "hash_33d0946a156bc141":
				case "hash_39098b3e5f02ee30":
				case "hash_3b6473dd2b0c56c7":
				{
					n_player = int(strtok(str_command, "")[1]);
					function_c1ccd7f3(&function_2a94cd59, n_player);
					break;
				}
				default:
				{
					break;
				}
			}
			setdvar(#"hash_443a451d4b2f9de2", "");
		}
	#/
}

/*
	Name: on_player_connect
	Namespace: namespace_e38c57c1
	Checksum: 0xC9BE47EC
	Offset: 0xFD8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	/#
		self endon(#"disconnect");
		level flag::wait_till("");
		self devgui_player_menu();
	#/
}

/*
	Name: function_c1ccd7f3
	Namespace: namespace_e38c57c1
	Checksum: 0x5BF7D437
	Offset: 0x1030
	Size: 0x74
	Parameters: 3
	Flags: Variadic
*/
function function_c1ccd7f3(var_fc09f1a3, n_player, ...)
{
	/#
		a_e_players = getplayers();
		if(a_e_players.size >= n_player)
		{
			util::single_func_argarray(a_e_players[n_player - 1], var_fc09f1a3, vararg);
		}
	#/
}

/*
	Name: devgui_player_menu
	Namespace: namespace_e38c57c1
	Checksum: 0x275AFB64
	Offset: 0x10B0
	Size: 0x274
	Parameters: 0
	Flags: None
*/
function devgui_player_menu()
{
	/#
		self function_1c3ffffd();
		var_21c1ba1 = self getentitynumber() + 1;
		adddebugcommand(((((("" + self.name) + "") + var_21c1ba1) + "") + var_21c1ba1) + "");
		adddebugcommand(((((("" + self.name) + "") + var_21c1ba1) + "") + var_21c1ba1) + "");
		adddebugcommand(((((("" + self.name) + "") + var_21c1ba1) + "") + var_21c1ba1) + "");
		adddebugcommand(((((("" + self.name) + "") + var_21c1ba1) + "") + var_21c1ba1) + "");
		adddebugcommand(((((("" + self.name) + "") + var_21c1ba1) + "") + var_21c1ba1) + "");
		adddebugcommand(((((("" + self.name) + "") + var_21c1ba1) + "") + var_21c1ba1) + "");
		adddebugcommand(((((("" + self.name) + "") + var_21c1ba1) + "") + var_21c1ba1) + "");
	#/
}

/*
	Name: function_1c3ffffd
	Namespace: namespace_e38c57c1
	Checksum: 0xF65B6B40
	Offset: 0x1330
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_1c3ffffd()
{
	/#
		adddebugcommand(("" + self.name) + "");
	#/
}

