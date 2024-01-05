#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\player\player_killed.gsc;
#using scripts\mp_common\laststand.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace wz_contracts;

/*
	Name: __init__system__
	Namespace: wz_contracts
	Checksum: 0x5DF7329F
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"wz_contracts", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: wz_contracts
	Checksum: 0xFEE399C3
	Offset: 0x158
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.challengescallbacks))
	{
		level.challengescallbacks = [];
	}
	contracts::init_player_contract_events();
	callback::on_finalize_initialization(&finalize_init);
}

/*
	Name: finalize_init
	Namespace: wz_contracts
	Checksum: 0xB0B610F1
	Offset: 0x1B8
	Size: 0x5BC
	Parameters: 0
	Flags: None
*/
function finalize_init()
{
	if(can_process_contracts())
	{
		callback::on_connect(&on_player_connect);
		callback::on_player_killed(&on_player_killed);
		callback::on_player_damage(&on_player_damage);
		callback::on_downed(&on_player_downed);
		callback::on_revived(&on_player_revived);
		callback::on_ai_killed(&on_ai_killed);
		callback::on_vehicle_killed(&on_vehicle_killed);
		callback::on_item_pickup(&on_player_item_pickup);
		callback::on_item_use(&function_9d4c3c52);
		callback::on_stash_open(&on_stash_open);
		callback::add_callback("on_driving_wz_vehicle", &on_driving_wz_vehicle);
		callback::add_callback(#"hash_677c43609aa6ce47", &function_5648f82);
		level.var_79a93566 = &function_902ef0de;
		level.var_f202fa67 = &function_a221f6d7;
		level.var_e3551fe4 = &function_a7cdb8f0;
		level.var_c3e2bb05 = 4;
		level.var_bd3ddb14 = &function_bd3ddb14;
		level.var_d9ae19f0 = &function_d9ae19f0;
		level.var_29ab88df = &function_29ab88df;
		level callback::add_callback(#"hash_7119d854cd41a4fd", &function_28ba0ba6);
		level callback::add_callback(#"vehicle_emped", &function_362499ea);
		level.operator_weapons = [#"pistol_revolver_t8_operator":1, #"smg_fastfire_t8_operator":1, #"smg_accurate_t8_operator":1, #"lmg_standard_t8_operator":1, #"lmg_spray_t8_operator":1, #"sniper_quickscope_t8_operator":1, #"sniper_fastrechamber_t8_operator":1, #"tr_powersemi_t8_operator":1, #"tr_midburst_t8_operator":1, #"tr_longburst_t8_operator":1, #"ar_stealth_t8_operator":1, #"ar_fastfire_t8_operator":1];
		level.var_f290f0ba = [#"hash_78f8f730158519ff":30, #"hospital_stash":29, #"zombie_stash_graveyard":28, #"hash_468067e2be6e3cfd":27, #"hash_4b49cb98f0fd776a":26, #"hash_6dea2e4afc816818":25, #"hash_2783dbab1f862606":24, #"hash_2141ecb8d2d86b22":23, #"hash_678a1efded2b597a":22, #"hash_1b83b702bbaae298":21, #"hash_7d028af90dad72ae":20, #"hash_a211476d10546c":19, #"zombie_stash_graveyard_ee":18, #"hash_550872d1d1938f94":17, #"hash_408b3ed7db6f9401":16, #"hash_734bf5054445e0df":15, #"hash_2a93e93b275c38ed":14, #"hash_75cc919e81dc8b19":13, #"hash_779cba7072600ad1":12, #"hash_47a63bc4a605b45f":11, #"hash_4ee6deffa30cc6e2":10, #"hash_ca8b234ad1fea38":9, #"zombie_stash_graveyard_quest":8, #"hash_49e8a607ea22e650":7, #"hash_43647ef7af66f82f":6, #"hash_61373b747c6a21fd":5, #"hash_3ad3de90342f2d4b":4, #"hash_2b546c0315159617":3, #"hash_33f7121f70c3065f":2, #"hash_6a0d13acf3e5687d":1];
		callback::add_callback(#"hash_5775ae80fc576ea6", &function_314e09eb);
		/#
			thread devgui_setup();
		#/
	}
}

/*
	Name: on_player_connect
	Namespace: wz_contracts
	Checksum: 0xC08431B4
	Offset: 0x780
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	self contracts::setup_player_contracts(3, &function_1d4c6768);
}

/*
	Name: on_ai_killed
	Namespace: wz_contracts
	Checksum: 0xAC0FD9D7
	Offset: 0x7B8
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function on_ai_killed(params)
{
	if(isplayer(params.eattacker))
	{
		attacker = params.eattacker;
		if("_zombie" === self.scoretype)
		{
			attacker increment_wz_contract(#"hash_3be4286ceb86e3ee");
		}
		if(isdefined(params.weapon))
		{
			weapon = params.weapon;
			if(weapon.statname == #"ray_gun" || weapon.statname == #"ray_gun_mk2")
			{
				attacker increment_wz_contract(#"hash_662a7934c69c5aa7");
			}
		}
	}
}

/*
	Name: on_vehicle_killed
	Namespace: wz_contracts
	Checksum: 0x68B9047F
	Offset: 0x8C0
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function on_vehicle_killed(params)
{
	if(isdefined(params))
	{
		if(isplayer(params.eattacker))
		{
			attacker = params.eattacker;
			if(!attacker util::isenemyteam(self.team))
			{
				return;
			}
			if(isdefined(params.weapon))
			{
				weapon = params.weapon;
				if(weapon.statname == #"eq_tripwire")
				{
					attacker increment_wz_contract(#"hash_5468af4499f0c7fe");
				}
			}
		}
	}
}

/*
	Name: on_player_killed
	Namespace: wz_contracts
	Checksum: 0xFEDEFEC5
	Offset: 0x990
	Size: 0xC14
	Parameters: 1
	Flags: None
*/
function on_player_killed(var_a2f12b49)
{
	if(teams::is_all_dead(self.team) || !self player::function_73da2f89())
	{
		self function_521ac7e5();
	}
	if(!isdefined(self.laststandparams))
	{
		return;
	}
	attacker = self.laststandparams.attacker;
	weapon = self.laststandparams.weapon;
	if(!isplayer(attacker))
	{
		return;
	}
	if(!attacker util::isenemyteam(self.team))
	{
		return;
	}
	entnum = self getentitynumber();
	if(isdefined(attacker.var_9a787df5) && is_true(attacker.var_9a787df5[entnum]))
	{
		attacker increment_wz_contract(#"hash_1567f7b8fb5d379a");
	}
	else
	{
		attacker increment_wz_contract(#"hash_4bc7882cf1404beb");
	}
	if(death_circle::is_active() && isdefined(level.deathcircleindex))
	{
		if(!isdefined(attacker.var_4f1edabd) || attacker.var_4f1edabd < level.deathcircleindex)
		{
			attacker.var_4f1edabd = level.deathcircleindex;
			attacker increment_wz_contract(#"hash_427ce6c8328c38d0");
		}
	}
	if(attacker isinvehicle() && !attacker isremotecontrolling())
	{
		e_vehicle = attacker getvehicleoccupied();
		n_seat = e_vehicle getoccupantseat(attacker);
		if(isdefined(n_seat) && n_seat != 0)
		{
			attacker increment_wz_contract(#"hash_222aca7930cc6c4f");
		}
		turret_weapon = e_vehicle seatgetweapon(n_seat);
		if(isdefined(turret_weapon) && self.laststandparams.smeansofdeath != "MOD_CRUSH")
		{
			attacker increment_wz_contract(#"hash_6e74e2826c57979a");
		}
	}
	if(isdefined(level.deathcircle.players) && array::contains(level.deathcircle.players, attacker))
	{
		attacker increment_wz_contract(#"hash_27068f5b82298af6");
	}
	if(isdefined(self.var_156bf46e))
	{
		vehicle = self.var_156bf46e;
		if(isdefined(vehicle) && isvehicle(vehicle) && !vehicle isremotecontrol())
		{
			attacker increment_wz_contract(#"hash_3a8e1cd16ced090d");
		}
	}
	if(attacker isplayerswimming())
	{
		attacker increment_wz_contract(#"hash_3f01fdb33d536780");
	}
	if(isdefined(attacker.var_700a5910))
	{
		dt = (gettime() - attacker.var_700a5910) / 1000;
		if(dt <= 3)
		{
			attacker increment_wz_contract(#"hash_d0e756015e4f2e4");
		}
	}
	if(attacker === self.var_53b73ccf)
	{
		dt = (gettime() - self.var_2481a15b) / 1000;
		if(dt <= 2)
		{
			attacker increment_wz_contract(#"hash_55d855a64a351c16");
		}
	}
	if(self laststand_mp::is_reviving_any())
	{
		attacker increment_wz_contract(#"hash_579396af83d0d2b6");
	}
	var_96f43b4d = attacker.origin[2] - self.origin[2];
	if(var_96f43b4d >= 787.402)
	{
		attacker increment_wz_contract(#"hash_165a9439e9bfe79e");
	}
	if(isdefined(self.laststunnedtime))
	{
		if(isdefined(self.var_45b88627))
		{
			var_38dce50e = self.var_45b88627;
		}
		else
		{
			var_38dce50e = gettime();
		}
		dt = (var_38dce50e - self.laststunnedtime) / 1000;
		if(dt <= 3)
		{
			attacker increment_wz_contract(#"hash_500fb646c4b9ca1a");
		}
	}
	if(isdefined(attacker) && isdefined(attacker.pers) && isdefined(attacker.pers[#"characterindex"]))
	{
		n_character_index = attacker.pers[#"characterindex"];
		rf = getplayerrolefields(n_character_index, currentsessionmode());
		if(isdefined(rf))
		{
			if(!isdefined(rf.var_f0a975bf))
			{
				rf.var_f0a975bf = 0;
			}
			switch(rf.var_f0a975bf)
			{
				case 0:
				{
					attacker increment_wz_contract(#"hash_69ce9185eb96006");
					break;
				}
				case 1:
				{
					attacker increment_wz_contract(#"hash_762415d6941c625e");
					break;
				}
				case 2:
				{
					break;
				}
				case 3:
				{
					attacker increment_wz_contract(#"hash_3e6ea7a7898a0816");
					break;
				}
			}
		}
	}
	if(isdefined(weapon))
	{
		if(weapon.statname == #"melee_bowie")
		{
			if(!isdefined(attacker.var_6f3e3a9c))
			{
				attacker.var_6f3e3a9c = 1;
				attacker thread function_e49226a4();
			}
			else
			{
				attacker.var_6f3e3a9c++;
				if(attacker.var_6f3e3a9c >= 2)
				{
					attacker.var_6f3e3a9c = undefined;
					attacker increment_wz_contract(#"hash_375ede206821cb1");
				}
			}
		}
		if(weapon.statname == #"hatchet")
		{
			n_dist = distance(attacker.origin, self.origin);
			if(n_dist >= 3937.01)
			{
				attacker increment_wz_contract(#"hash_29c133baf1e0570a");
			}
		}
		var_49f7c24a = 0;
		weaponclass = util::getweaponclass(weapon);
		if(isdefined(weaponclass))
		{
			switch(weaponclass)
			{
				case "weapon_assault":
				{
					attacker increment_wz_contract(#"hash_26960896e41b052e");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_lmg":
				{
					attacker increment_wz_contract(#"hash_787c6658b5d8e5ab");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_pistol":
				{
					attacker increment_wz_contract(#"hash_55566633fad3906");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_cqb":
				{
					attacker increment_wz_contract(#"hash_917ca1622ee909");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_smg":
				{
					attacker increment_wz_contract(#"hash_15d3178944567fc8");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_sniper":
				{
					attacker increment_wz_contract(#"hash_24a6fe1d38c78fa6");
					var_49f7c24a = 1;
					break;
				}
				case "weapon_grenade":
				{
					if(!isdefined(attacker.var_c9daf540))
					{
						attacker.var_c9daf540 = 1;
						attacker thread function_db2da6f7();
					}
					else
					{
						attacker.var_c9daf540++;
						if(attacker.var_c9daf540 >= 2)
						{
							attacker.var_c9daf540 = undefined;
							attacker increment_wz_contract(#"hash_6d2f5796b496e676");
						}
					}
					break;
				}
				default:
				{
					break;
				}
			}
		}
		if(var_49f7c24a)
		{
			if(!isdefined(attacker.var_9c8d1c79))
			{
				attacker.var_9c8d1c79 = [];
			}
			if(attacker.var_9c8d1c79.size < 3 && !array::contains(attacker.var_9c8d1c79, weapon))
			{
				array::add(attacker.var_9c8d1c79, weapon, 0);
				if(attacker.var_9c8d1c79.size >= 3)
				{
					attacker increment_wz_contract(#"hash_1d768bc95604897d");
				}
			}
		}
		if(weapon.inventorytype === "offhand")
		{
			attacker increment_wz_contract(#"hash_667f2b93bcb7cf97");
		}
		if(is_true(level.operator_weapons[weapon.name]))
		{
			attacker increment_wz_contract(#"hash_5f4ee5f31ebf4597");
		}
	}
}

/*
	Name: function_e49226a4
	Namespace: wz_contracts
	Checksum: 0x3F94B438
	Offset: 0x15B0
	Size: 0x3E
	Parameters: 0
	Flags: None
*/
function function_e49226a4()
{
	self endon(#"death");
	wait(10);
	if(isplayer(self))
	{
		self.var_6f3e3a9c = undefined;
	}
}

/*
	Name: function_db2da6f7
	Namespace: wz_contracts
	Checksum: 0x92089F9B
	Offset: 0x15F8
	Size: 0x3E
	Parameters: 0
	Flags: None
*/
function function_db2da6f7()
{
	self endon(#"disconnect");
	wait(0.25);
	if(isplayer(self))
	{
		self.var_c9daf540 = undefined;
	}
}

/*
	Name: on_player_damage
	Namespace: wz_contracts
	Checksum: 0x5241BDC
	Offset: 0x1640
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function on_player_damage(params)
{
	if(!isdefined(params))
	{
		return;
	}
	attacker = params.eattacker;
	if(isplayer(attacker))
	{
		if(attacker != self)
		{
			if(!isdefined(self.var_9a787df5))
			{
				self.var_9a787df5 = [];
			}
			self.var_9a787df5[attacker getentitynumber()] = 1;
		}
	}
}

/*
	Name: on_player_downed
	Namespace: wz_contracts
	Checksum: 0x6553B14
	Offset: 0x16D0
	Size: 0x7A
	Parameters: 0
	Flags: None
*/
function on_player_downed()
{
	if(isdefined(self.laststandparams))
	{
		attacker = self.laststandparams.attacker;
		if(!isplayer(attacker))
		{
			return;
		}
		if(!attacker util::isenemyteam(self.team))
		{
			return;
		}
		self.var_53b73ccf = attacker;
		self.var_2481a15b = gettime();
	}
}

/*
	Name: on_player_revived
	Namespace: wz_contracts
	Checksum: 0xB25144D7
	Offset: 0x1758
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function on_player_revived(params)
{
	if(isdefined(params.reviver))
	{
		e_reviver = params.reviver;
		e_reviver increment_wz_contract(#"hash_4b331df1cf084980");
		if(isdefined(level.deathcircle.players) && array::contains(level.deathcircle.players, e_reviver))
		{
			e_reviver increment_wz_contract(#"hash_3ff60e8cd6dabd89");
		}
	}
}

/*
	Name: can_process_contracts
	Namespace: wz_contracts
	Checksum: 0xFF95D8C
	Offset: 0x1820
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function can_process_contracts()
{
	if(getdvarint(#"contracts_enabled", 0) == 0)
	{
		return false;
	}
	if(getdvarint(#"contracts_enabled_wz", 1) == 0)
	{
		return false;
	}
	if(!sessionmodeiswarzonegame())
	{
		return false;
	}
	return true;
}

/*
	Name: increment_wz_contract
	Namespace: wz_contracts
	Checksum: 0x44ED9034
	Offset: 0x18A8
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function increment_wz_contract(var_38280f2f, delta)
{
	if(!isdefined(delta))
	{
		delta = 1;
	}
	if(!can_process_contracts() || !self contracts::is_contract_active(var_38280f2f))
	{
		return;
	}
	if(level.inprematchperiod)
	{
		return;
	}
	self function_902ef0de(var_38280f2f, delta);
}

/*
	Name: function_902ef0de
	Namespace: wz_contracts
	Checksum: 0xD5C9EA60
	Offset: 0x1930
	Size: 0x40C
	Parameters: 2
	Flags: Private
*/
function private function_902ef0de(var_38280f2f, delta)
{
	/#
		if(getdvarint(#"scr_contract_debug_multiplier", 0) > 0)
		{
			delta = delta * getdvarint(#"scr_contract_debug_multiplier", 1);
		}
	#/
	if(delta <= 0)
	{
		return;
	}
	target_value = self.pers[#"contracts"][var_38280f2f].target_value;
	old_progress = (isdefined(self.pers[#"contracts"][var_38280f2f].current_value) ? self.pers[#"contracts"][var_38280f2f].current_value : self.pers[#"contracts"][var_38280f2f].var_59cb904f);
	if(old_progress == target_value)
	{
		return;
	}
	new_progress = int(old_progress + delta);
	if(new_progress > target_value)
	{
		new_progress = target_value;
	}
	if(new_progress != old_progress)
	{
		self.pers[#"contracts"][var_38280f2f].current_value = new_progress;
		if(isdefined(level.contract_ids[var_38280f2f]))
		{
			self luinotifyevent(#"hash_4b04b1cb4b3498d0", 2, level.contract_ids[var_38280f2f], new_progress);
		}
	}
	if(old_progress < target_value && target_value <= new_progress)
	{
		var_9d12108c = (isdefined(self.timeplayed[self.team]) ? self.timeplayed[self.team] : 0);
		self.pers[#"contracts"][var_38280f2f].var_be5bf249 = (self stats::get_stat_global(#"time_played_total") - self.pers[#"hash_5651f00c6c1790a4"]) + var_9d12108c;
		params = spawnstruct();
		params.player = self;
		params.var_38280f2f = var_38280f2f;
		self callback::callback(#"contract_complete", params);
		if(isdefined(level.contract_ids[var_38280f2f]))
		{
			self luinotifyevent(#"hash_1739c4bd5baf83bc", 1, level.contract_ids[var_38280f2f]);
		}
	}
	/#
		if(getdvarint(#"scr_contract_debug", 0) > 0)
		{
			iprintln((((function_9e72a96(var_38280f2f) + "") + new_progress) + "") + target_value);
			if(old_progress < target_value && target_value <= new_progress)
			{
				iprintln(function_9e72a96(var_38280f2f) + "");
			}
		}
	#/
}

/*
	Name: function_a221f6d7
	Namespace: wz_contracts
	Checksum: 0xA355D31B
	Offset: 0x1D48
	Size: 0x84
	Parameters: 1
	Flags: Private
*/
function private function_a221f6d7(var_38280f2f)
{
	switch(var_38280f2f)
	{
		case "hash_2c9ffdfc4e716112":
		case "hash_42580a6cc2bf989e":
		case "hash_443909a5b54c22b9":
		case "hash_48730ce04835417f":
		case "hash_7d40878d77a51836":
		case "hash_7e50a6cdb307039a":
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_a7cdb8f0
	Namespace: wz_contracts
	Checksum: 0xEA5D12E8
	Offset: 0x1DD8
	Size: 0xE4
	Parameters: 1
	Flags: Private
*/
function private function_a7cdb8f0(var_38280f2f)
{
	switch(var_38280f2f)
	{
		case "hash_114034ef741c57c":
		case "hash_67444eea6c3a2b4":
		case "hash_137173b281445b4d":
		case "hash_158213f4ee12211e":
		case "hash_17ed7af10aadfdbf":
		case "hash_1dbb5150a78086fb":
		case "hash_372bbe55a27ec4af":
		case "hash_395b9be57a35044e":
		case "hash_47ce5d5ec0614886":
		case "hash_533d85cab61c7cbe":
		case "hash_6bdbeb895b012fb2":
		case "hash_6f4d7d1506be4c97":
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_1d4c6768
	Namespace: wz_contracts
	Checksum: 0xC3810268
	Offset: 0x1EC8
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_1d4c6768(slot)
{
	return contracts::function_d17bcd3c(slot);
}

/*
	Name: function_bd3ddb14
	Namespace: wz_contracts
	Checksum: 0x12C24C05
	Offset: 0x1EF8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_bd3ddb14(e_player)
{
	e_player increment_wz_contract(#"hash_101e4b07a4707d36");
}

/*
	Name: function_d9ae19f0
	Namespace: wz_contracts
	Checksum: 0xD4E40755
	Offset: 0x1F30
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_d9ae19f0(e_player)
{
	e_player.var_b2f09f9f = 1;
	e_player increment_wz_contract(#"hash_6c95edbb431aa4e2");
}

/*
	Name: function_521ac7e5
	Namespace: wz_contracts
	Checksum: 0x97968FA2
	Offset: 0x1F78
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function function_521ac7e5()
{
	if(isdefined(self.var_56bd2c02))
	{
		return;
	}
	team = self.team;
	var_9d12108c = (isdefined(self.timeplayed[team]) ? self.timeplayed[team] : 0);
	self.var_56bd2c02 = self stats::get_stat_global(#"time_played_total") + var_9d12108c;
}

/*
	Name: function_4ec3f8fe
	Namespace: wz_contracts
	Checksum: 0x9944DBD7
	Offset: 0x2018
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function function_4ec3f8fe()
{
	if(isdefined(self.var_c619a827))
	{
		return;
	}
	team = self.team;
	var_9d12108c = (isdefined(self.timeplayed[team]) ? self.timeplayed[team] : 0);
	self.var_c619a827 = self stats::get_stat_global(#"time_played_total") + var_9d12108c;
}

/*
	Name: function_29ab88df
	Namespace: wz_contracts
	Checksum: 0xF2416BC9
	Offset: 0x20B8
	Size: 0x1A6
	Parameters: 2
	Flags: None
*/
function function_29ab88df(a_players, var_c1735b56)
{
	teamsize = getgametypesetting("maxTeamPlayers");
	foreach(player in a_players)
	{
		player function_4ec3f8fe();
		switch(teamsize)
		{
			case 1:
			{
				if(var_c1735b56 <= 10)
				{
					player increment_wz_contract(#"hash_443909a5b54c22b9");
				}
				break;
			}
			case 2:
			{
				if(var_c1735b56 <= 5)
				{
					player increment_wz_contract(#"hash_48730ce04835417f");
				}
				break;
			}
			case 4:
			{
				if(var_c1735b56 <= 3)
				{
					player increment_wz_contract(#"hash_2c9ffdfc4e716112");
				}
				break;
			}
		}
	}
}

/*
	Name: function_28ba0ba6
	Namespace: wz_contracts
	Checksum: 0x2C78EFED
	Offset: 0x2268
	Size: 0xA8
	Parameters: 0
	Flags: None
*/
function function_28ba0ba6()
{
	a_players = get_alive_players();
	foreach(player in a_players)
	{
		player increment_wz_contract(#"hash_76a6aeacc63e7ce7");
	}
}

/*
	Name: function_362499ea
	Namespace: wz_contracts
	Checksum: 0x3B8B680F
	Offset: 0x2318
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_362499ea(params)
{
	player = params.attacker;
	if(isplayer(player))
	{
		vehicle = params.vehicle;
		if(player util::isenemyteam(vehicle.team))
		{
			var_bbc128bb = vehicle getspeedmph();
			if(var_bbc128bb > 0)
			{
				player increment_wz_contract(#"hash_614322e468d90148");
			}
		}
	}
}

/*
	Name: on_player_item_pickup
	Namespace: wz_contracts
	Checksum: 0xDE6B01CC
	Offset: 0x23E0
	Size: 0x1DC
	Parameters: 1
	Flags: None
*/
function on_player_item_pickup(params)
{
	if(!gamestate::is_state(#"playing") || !isdefined(params.item))
	{
		return;
	}
	item = params.item;
	if(isplayer(self))
	{
		if(!isdefined(self.var_7c5ea163))
		{
			self.var_7c5ea163 = 0;
		}
		self.var_7c5ea163++;
		var_a6762160 = item.var_a6762160;
		self increment_wz_contract(#"hash_403147407bd1decc");
		if(var_a6762160.itemtype == #"backpack")
		{
			if(!is_true(self.var_9ed7994f))
			{
				self.var_9ed7994f = 1;
				self increment_wz_contract(#"hash_683a35f38b014b9");
			}
		}
		if(isdefined(item.targetname))
		{
			if(isdefined(level.var_f290f0ba[item.targetname]))
			{
				if(!isdefined(self.var_b4dfe8d3))
				{
					self.var_b4dfe8d3 = [];
				}
				self.var_b4dfe8d3[item.targetname] = 1;
				if(self.var_b4dfe8d3.size >= 2 && !is_true(self.var_8958535a))
				{
					self.var_8958535a = 1;
					self increment_wz_contract(#"hash_16305079185fffb7");
				}
			}
		}
	}
}

/*
	Name: function_314e09eb
	Namespace: wz_contracts
	Checksum: 0x87EF3E35
	Offset: 0x25C8
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_314e09eb(item)
{
	if(isdefined(self.inventory) && isdefined(self.inventory.consumed))
	{
		if((isdefined(self.inventory.consumed.size + 1) ? self.inventory.consumed.size + 1 : 0) >= 5)
		{
			increment_wz_contract(#"hash_5d572a379b7adf62");
		}
	}
}

/*
	Name: function_9d4c3c52
	Namespace: wz_contracts
	Checksum: 0x91B354D5
	Offset: 0x2668
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_9d4c3c52(params)
{
	if(!gamestate::is_state(#"playing") || !isdefined(params.item))
	{
		return;
	}
	item = params.item;
	if(isplayer(self))
	{
		var_a6762160 = item.var_a6762160;
		if(var_a6762160.itemtype == #"armor_shard")
		{
			self increment_wz_contract(#"hash_209c6ecb45a25a6a");
		}
	}
}

/*
	Name: function_9b431779
	Namespace: wz_contracts
	Checksum: 0x1B1D1133
	Offset: 0x2738
	Size: 0x3EC
	Parameters: 1
	Flags: None
*/
function function_9b431779(n_time_played)
{
	n_time_played = float(n_time_played) / 60000;
	self increment_wz_contract(#"hash_372bbe55a27ec4af", n_time_played);
	switch(level.gametype)
	{
		case "warzone_solo":
		case "warzone_escape_solo":
		{
			self increment_wz_contract(#"hash_1dbb5150a78086fb", n_time_played);
			break;
		}
		case "warzone_duo":
		case "warzone_escape_duo":
		{
			self increment_wz_contract(#"hash_67444eea6c3a2b4", n_time_played);
			break;
		}
		case "warzone_quad":
		case "warzone_escape_quad":
		{
			self increment_wz_contract(#"hash_6f4d7d1506be4c97", n_time_played);
			break;
		}
		case "warzone_closequarters_duo":
		case "warzone_closequarters_solo":
		case "warzone_closequarters_quads":
		{
			self increment_wz_contract(#"hash_bc7c4d0a20fd6b5", n_time_played);
			break;
		}
		case "warzone_hot_pursuit":
		{
			self increment_wz_contract(#"hash_47ce5d5ec0614886", n_time_played);
			break;
		}
		case "warzone_hardcore_duo":
		case "warzone_hardcore_quad":
		case "warzone_hardcore_solo":
		{
			self increment_wz_contract(#"hash_395b9be57a35044e", n_time_played);
			break;
		}
		case "warzone_ambush_quads":
		case "warzone_ambush_duo":
		case "warzone_ambush_solo":
		{
			self increment_wz_contract(#"hash_114034ef741c57c", n_time_played);
			break;
		}
		case "warzone_dbno_quad":
		case "hash_6ebd226da5b61bfb":
		case "warzone_dbno":
		{
			self increment_wz_contract(#"hash_137173b281445b4d", n_time_played);
			break;
		}
		case "warzone_bigteam_quad":
		case "warzone_bigteam_dbno_quad":
		{
			self increment_wz_contract(#"hash_16f3e3af0442596a", n_time_played);
			break;
		}
		case "warzone_spectre_rising":
		{
			self increment_wz_contract(#"hash_533d85cab61c7cbe", n_time_played);
			break;
		}
	}
	var_819e1b79 = (isdefined(getgametypesetting(#"wzplayerinsertiontypeindex")) ? getgametypesetting(#"wzplayerinsertiontypeindex") : 0);
	if(var_819e1b79 == 1)
	{
		self increment_wz_contract(#"hash_17ed7af10aadfdbf", n_time_played);
	}
}

/*
	Name: get_alive_players
	Namespace: wz_contracts
	Checksum: 0x54D1C16A
	Offset: 0x2B30
	Size: 0x14E
	Parameters: 1
	Flags: None
*/
function get_alive_players(disconnected_player)
{
	a_alive_players = [];
	foreach(team in level.teams)
	{
		var_22d28a75 = getplayers(team);
		foreach(player in var_22d28a75)
		{
			if(player === disconnected_player)
			{
				continue;
			}
			if(isalive(player))
			{
				a_alive_players[a_alive_players.size] = player;
			}
		}
	}
	return a_alive_players;
}

/*
	Name: on_driving_wz_vehicle
	Namespace: wz_contracts
	Checksum: 0x5C3E4294
	Offset: 0x2C88
	Size: 0x19C
	Parameters: 1
	Flags: None
*/
function on_driving_wz_vehicle(params)
{
	if(level.inprematchperiod)
	{
		return;
	}
	vehicle = params.vehicle;
	player = params.player;
	seatindex = params.seatindex;
	var_9a8c81d3 = isairborne(vehicle);
	var_9f80c1b9 = vehicle.vehicleclass === "boat";
	var_e20fb13a = !var_9a8c81d3 && !var_9f80c1b9;
	if(var_9a8c81d3)
	{
		player.var_925d487 = 1;
	}
	else
	{
		if(var_9f80c1b9)
		{
			player.var_8a507747 = 1;
		}
		else if(var_e20fb13a)
		{
			player.var_45708ffb = 1;
			if(seatindex == 0)
			{
				vehicle thread function_6fcfeebb(player);
			}
		}
	}
	if(is_true(player.var_925d487) && is_true(player.var_8a507747) && is_true(player.var_45708ffb))
	{
		player increment_wz_contract(#"hash_80a5bc9c87ee9ae");
	}
}

/*
	Name: function_6fcfeebb
	Namespace: wz_contracts
	Checksum: 0xFF9FFFEA
	Offset: 0x2E30
	Size: 0x140
	Parameters: 1
	Flags: None
*/
function function_6fcfeebb(player)
{
	self endon(#"death");
	if(!isplayer(player))
	{
		return;
	}
	player endon(#"exit_vehicle");
	player endon(#"death");
	player endon(#"disconnect");
	player endon(#"change_seat");
	while(true)
	{
		self waittill(#"veh_inair");
		time = gettime();
		self waittill(#"veh_landed");
		land_time = gettime();
		var_3cb46af = (float(land_time - time)) / 1000;
		if(var_3cb46af >= 2)
		{
			player increment_wz_contract(#"hash_64c765ebb1ad37db");
		}
	}
}

/*
	Name: on_stash_open
	Namespace: wz_contracts
	Checksum: 0x9B343567
	Offset: 0x2F78
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function on_stash_open(params)
{
	if(!gamestate::is_state(#"playing") || !isdefined(params.activator))
	{
		return;
	}
	activator = params.activator;
	if(isplayer(activator))
	{
		if(isdefined(self.birthtime))
		{
			activator increment_wz_contract(#"hash_20b07175517ed179");
		}
	}
}

/*
	Name: function_5648f82
	Namespace: wz_contracts
	Checksum: 0xF664C80A
	Offset: 0x3020
	Size: 0x20E
	Parameters: 1
	Flags: None
*/
function function_5648f82(team)
{
	teamsize = getgametypesetting("maxTeamPlayers");
	if(isdefined(team))
	{
		foreach(player in getplayers(team))
		{
			player increment_wz_contract(#"hash_7e50a6cdb307039a");
			if(!isdefined(player.var_7c5ea163))
			{
				player.var_7c5ea163 = 0;
			}
			if(player.var_7c5ea163 <= 20)
			{
				player increment_wz_contract(#"hash_42580a6cc2bf989e");
			}
			if(!is_true(player.var_b2f09f9f))
			{
				player increment_wz_contract(#"hash_7d40878d77a51836");
			}
			switch(teamsize)
			{
				case 1:
				{
					player increment_wz_contract(#"hash_443909a5b54c22b9");
					break;
				}
				case 2:
				{
					player increment_wz_contract(#"hash_48730ce04835417f");
					break;
				}
				case 4:
				{
					player increment_wz_contract(#"hash_2c9ffdfc4e716112");
					break;
				}
			}
		}
	}
}

/*
	Name: devgui_setup
	Namespace: wz_contracts
	Checksum: 0x6C4E2D13
	Offset: 0x3238
	Size: 0xA24
	Parameters: 0
	Flags: None
*/
function devgui_setup()
{
	/#
		devgui_base = "";
		wait(3);
		contracts::function_e07e542b(devgui_base, undefined);
		var_c8d599b5 = "";
		var_78a6fb52 = devgui_base + "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		var_78a6fb52 = devgui_base + "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		var_78a6fb52 = devgui_base + "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		var_78a6fb52 = devgui_base + "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

