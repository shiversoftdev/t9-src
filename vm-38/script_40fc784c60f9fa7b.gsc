#using script_1160d62024d6945b;
#using script_4108035fe400ce67;
#using script_47fb62300ac0bd60;
#using script_68d2ee1489345a1d;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace player_vehicle;

/*
	Name: function_898022f9
	Namespace: player_vehicle
	Checksum: 0xAC8D6313
	Offset: 0x3D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_898022f9()
{
	level notify(732362470);
}

/*
	Name: function_89f2df9
	Namespace: player_vehicle
	Checksum: 0x668B6B49
	Offset: 0x3F8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"player_vehicle", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player_vehicle
	Checksum: 0xDB6DAE12
	Offset: 0x440
	Size: 0x274
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_vehicle_spawned(&on_vehicle_spawned);
	callback::on_vehicle_damage(&on_vehicle_damage);
	callback::on_vehicle_killed(&on_vehicle_killed);
	callback::on_player_damage(&on_player_damage);
	callback::on_player_killed(&on_player_killed);
	callback::on_spawned(&on_player_spawned);
	callback::on_end_game(&on_end_game);
	clientfield::register("vehicle", "overheat_fx", 1, 1, "int");
	clientfield::register("vehicle", "overheat_fx1", 1, 1, "int");
	clientfield::register("vehicle", "overheat_fx2", 1, 1, "int");
	clientfield::register("vehicle", "overheat_fx3", 1, 1, "int");
	clientfield::register("vehicle", "overheat_fx4", 1, 1, "int");
	clientfield::register("toplayer", "toggle_vehicle_sensor", 1, 1, "int");
	level.var_2513e40c = &function_2513e40c;
	level thread function_69c9e9a0();
	level.is_staircase_up = &is_staircase_up;
	level.var_80d8731e = 0;
	level.var_6ed50229 = 10;
	level.vehicle_tracking = [];
}

/*
	Name: on_vehicle_spawned
	Namespace: player_vehicle
	Checksum: 0x8ED2046C
	Offset: 0x6C0
	Size: 0x144
	Parameters: 0
	Flags: Linked, Private
*/
function private on_vehicle_spawned()
{
	if(!is_true(self.var_46439e18))
	{
		return;
	}
	self function_4edde887();
	callback::callback(#"hash_5ca3a1f306039e1e");
	params = spawnstruct();
	params.origin = self.origin;
	params.var_45e1ab0 = self function_546791ef();
	self thread namespace_d0eacb0d::function_711f53df(self.vehicletype, self.origin, self.angles, &function_934f56ec, params);
	if(isdefined(self.settings.var_b40b5493))
	{
		self influencers::create_influencer_generic(self.settings.var_b40b5493, self, "any");
	}
	level.vehicle_tracking[level.vehicle_tracking.size] = self;
	self function_7ae07b7();
}

/*
	Name: function_4edde887
	Namespace: player_vehicle
	Checksum: 0xF51D5F5A
	Offset: 0x810
	Size: 0x2B4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4edde887()
{
	if(isdefined(self.scriptbundlesettings))
	{
		self.settings = getscriptbundle(self.scriptbundlesettings);
	}
	if(self function_b835102b() && !self.vehicleclass === "boat" && !self.vehicleclass === "helicopter" && !self.vehicleclass === "plane")
	{
		self function_3f24c5a(1);
	}
	self.var_ffdf490c = 1;
	self.script_disconnectpaths = 0;
	self.do_scripted_crash = 0;
	self.var_97f1b32a = 1;
	self.emped = 0;
	self.vehkilloccupantsondeath = 1;
	self.var_32371376 = level.var_80d8731e;
	level.var_80d8731e++;
	if(!self.vehicleclass === "artillery")
	{
		target_set(self, (0, 0, 0));
	}
	self callback::function_d8abfc3d(#"hash_1a32e0fdeb70a76b", &function_c25f7d1);
	if(isdefined(self.settings) && is_true(self.settings.var_2627e80a))
	{
		self callback::function_d8abfc3d(#"hash_6e388f6a0df7bdac", &function_ef44d420);
	}
	if(isdefined(self.settings))
	{
		if(is_true(self.settings.ismovingplatform))
		{
			self setmovingplatformenabled(1, 0);
		}
	}
	if(!isairborne(self))
	{
		self callback::function_36aab2f3(&function_36aab2f3);
	}
	if(!isairborne(self) && !self.vehicleclass === "boat")
	{
		self.disconnectpathdetail = 0;
		self function_d733412a(1);
	}
}

/*
	Name: function_bc79899e
	Namespace: player_vehicle
	Checksum: 0xB98EF347
	Offset: 0xAD0
	Size: 0xC2
	Parameters: 0
	Flags: None
*/
function function_bc79899e()
{
	self vehicle_ai::init_state_machine_for_role("default");
	self vehicle_ai::add_interrupt_connection("driving", "off", "exit_vehicle", &vehicle_ai::function_6664e3af);
	self vehicle_ai::add_interrupt_connection("driving", "off", "emped_vehicle", &vehicle_ai::function_6664e3af);
	self vehicle_ai::get_state_callbacks("driving").enter_func = &function_25b9a9b;
}

/*
	Name: function_934f56ec
	Namespace: player_vehicle
	Checksum: 0x72C146EC
	Offset: 0xBA0
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_934f56ec(vehicle, params)
{
	if(isairborne(vehicle))
	{
		spawnoffset = (0, 0, vehicle.height);
		vehicle.origin = params.origin + spawnoffset;
	}
	vehicle makeusable();
	if(is_true(vehicle.isphysicsvehicle))
	{
		vehicle setbrake(1);
	}
	if(!sessionmodeiszombiesgame() && is_true(getgametypesetting(#"hash_59ab05f71c3789c7")))
	{
		target_remove(vehicle);
	}
}

/*
	Name: function_7ae07b7
	Namespace: player_vehicle
	Checksum: 0xB6BE05E
	Offset: 0xCB8
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7ae07b7()
{
	if(self vehicle_ai::has_state("off"))
	{
		vehicle_ai::startinitialstate("off");
	}
	else
	{
		self function_ed173e0b();
	}
}

/*
	Name: function_e95a0595
	Namespace: player_vehicle
	Checksum: 0xAE1C16A3
	Offset: 0xD18
	Size: 0x26
	Parameters: 0
	Flags: Private
*/
function private function_e95a0595()
{
	if(isairborne(self))
	{
		return false;
	}
	return true;
}

/*
	Name: function_25b9a9b
	Namespace: player_vehicle
	Checksum: 0xA766898A
	Offset: 0xD48
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_25b9a9b(params)
{
	params.var_c2e048f9 = 1;
	if(is_true(self.emped) || is_true(self.isjammed))
	{
		return;
	}
	self vehicle_ai::defaultstate_driving_enter(params);
}

/*
	Name: function_1a852d1d
	Namespace: player_vehicle
	Checksum: 0xDE1D29D0
	Offset: 0xDC0
	Size: 0x104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1a852d1d()
{
	if(is_true(self.emped) || is_true(self.isjammed))
	{
		self takeplayercontrol();
		return;
	}
	if(isdefined(self.state_machines))
	{
		return;
	}
	if(is_true(self.var_52e23e90))
	{
		return;
	}
	turn_on();
	var_a56c96d1 = spawnstruct();
	var_a56c96d1.var_c2e048f9 = 1;
	var_a56c96d1.turn_off = &function_6c46026b;
	var_a56c96d1.var_7dabdc1b = !is_false(self.var_56b349b4);
	self vehicle_ai::defaultstate_driving_enter(var_a56c96d1);
}

/*
	Name: turn_on
	Namespace: player_vehicle
	Checksum: 0x598AEBE9
	Offset: 0xED0
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function turn_on(params)
{
	var_9cd704a7 = spawnstruct();
	var_9cd704a7.var_da88902a = 1;
	if(isdefined(params))
	{
		var_9cd704a7.var_30a04b16 = params.var_30a04b16;
	}
	self vehicle_ai::defaultstate_off_exit(var_9cd704a7);
	self.var_52e23e90 = 1;
}

/*
	Name: turn_off
	Namespace: player_vehicle
	Checksum: 0x1340F4A4
	Offset: 0xF50
	Size: 0x196
	Parameters: 0
	Flags: Linked
*/
function turn_off()
{
	if(is_true(self.var_52e23e90))
	{
		self vehicle::function_7f0bbde3();
	}
	self vehicle::toggle_tread_fx(0);
	self vehicle::toggle_exhaust_fx(0);
	self vehicle::toggle_sounds(0);
	self vehicle::function_bbc1d940(0);
	self vehicle::lights_off();
	self vehicle::toggle_lights_group(1, 0);
	self vehicle::toggle_lights_group(2, 0);
	self vehicle::toggle_lights_group(3, 0);
	self vehicle::toggle_lights_group(4, 0);
	self vehicle::toggle_force_driver_taillights(0);
	self vehicle_ai::turnoffallambientanims();
	if(isairborne(self))
	{
		self setphysacceleration(vectorscale((0, 0, -1), 300));
		self setrotorspeed(0);
	}
	self.var_52e23e90 = undefined;
}

/*
	Name: function_6c46026b
	Namespace: player_vehicle
	Checksum: 0x2FD104
	Offset: 0x10F0
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6c46026b()
{
	if(isdefined(self.state_machines))
	{
		return;
	}
	self turn_off();
	self vehicle_ai::defaultstate_driving_exit();
}

/*
	Name: function_ed173e0b
	Namespace: player_vehicle
	Checksum: 0x5E1FD833
	Offset: 0x1138
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ed173e0b()
{
	if(isdefined(self.state_machines))
	{
		return;
	}
	var_9cd704a7 = spawnstruct();
	self vehicle_ai::defaultstate_off_enter(var_9cd704a7);
}

/*
	Name: is_staircase_up
	Namespace: player_vehicle
	Checksum: 0x2578DBD7
	Offset: 0x1188
	Size: 0x214
	Parameters: 2
	Flags: Linked
*/
function is_staircase_up(var_dbd1a594, jammer)
{
	if(!isdefined(var_dbd1a594))
	{
		var_dbd1a594 = undefined;
	}
	if(!isdefined(jammer))
	{
		jammer = undefined;
	}
	if(!isvehicle(self))
	{
		return;
	}
	self notify(#"emped_vehicle");
	self endon(#"emped_vehicle", #"death");
	params = spawnstruct();
	emp_duration = 30;
	if(isdefined(jammer) && isdefined(jammer.weapon) && isdefined(jammer.weapon.var_4dd46f8a))
	{
		var_4f1e1bed = getscriptbundle(jammer.weapon.var_4dd46f8a);
		emp_duration = var_4f1e1bed.var_3bd9b483;
	}
	else if(isdefined(level.var_578f7c6d.var_4dd46f8a.var_3bd9b483))
	{
		emp_duration = level.var_578f7c6d.var_4dd46f8a.var_3bd9b483;
	}
	params.param0 = emp_duration;
	params.param1 = var_dbd1a594;
	params.param2 = jammer;
	if(isplayer(var_dbd1a594))
	{
		level callback::callback(#"hash_69ec922777c59153", {#vehicle:self, #attacker:var_dbd1a594});
	}
	if(isdefined(self.is_staircase_up))
	{
		self [[self.is_staircase_up]](params);
	}
	else
	{
		self function_c9620f20(params);
	}
}

/*
	Name: on_vehicle_damage
	Namespace: player_vehicle
	Checksum: 0x2FFC2A9D
	Offset: 0x13A8
	Size: 0x4B4
	Parameters: 1
	Flags: Linked
*/
function on_vehicle_damage(params)
{
	vehicle = self;
	if(!is_true(vehicle.var_46439e18))
	{
		return;
	}
	if(isdefined(vehicle.session))
	{
		damagedone = int(min(params.idamage, (isdefined(vehicle.health) ? vehicle.health : params.idamage)));
		if(isdefined(params.eattacker) && isplayer(params.eattacker) && params.eattacker isinvehicle() && !params.eattacker isremotecontrolling())
		{
			var_364c1a03 = params.eattacker getvehicleoccupied();
			if(var_364c1a03 == vehicle)
			{
				vehicle.session.var_309ad81f = vehicle.session.var_309ad81f + damagedone;
			}
			else if(isdefined(var_364c1a03.session))
			{
				var_364c1a03.session.var_ecd1fe60 = var_364c1a03.session.var_ecd1fe60 + damagedone;
				vehicle.session.var_770fd50d = vehicle.session.var_770fd50d + damagedone;
			}
		}
		else
		{
			if(isplayer(params.eattacker))
			{
				vehicle.session.var_5ba0df6e = vehicle.session.var_5ba0df6e + damagedone;
			}
			else
			{
				vehicle.session.var_309ad81f = vehicle.session.var_309ad81f + damagedone;
			}
		}
	}
	if(isplayer(params.eattacker) && isdefined(params.idamage))
	{
		params.eattacker stats::function_d40764f3(#"vehicle_damage", int(params.idamage));
		occupants = vehicle getvehoccupants();
		if(isdefined(occupants) && occupants.size > 0)
		{
			params.eattacker stats::function_d40764f3(#"hash_6d5ae3ac5cb7968a", int(params.idamage));
		}
	}
	if(isdefined(params.smeansofdeath))
	{
		occupants = vehicle getvehoccupants();
		if(isdefined(occupants) && occupants.size > 0)
		{
			foreach(occupant in occupants)
			{
				if(!isplayer(occupant))
				{
					continue;
				}
				switch(params.smeansofdeath)
				{
					case "mod_projectile":
					{
						self playsoundtoplayer(#"hash_4cf0470b5276e61a", occupant);
						break;
					}
					case "mod_rifle_bullet":
					case "mod_pistol_bullet":
					{
						self playsoundtoplayer(#"hash_6dd3a55ee3658ca", occupant);
						break;
					}
				}
			}
		}
	}
	vehicle vehicle_ai::update_damage_fx_level(params.idamage);
}

/*
	Name: on_vehicle_killed
	Namespace: player_vehicle
	Checksum: 0x53BE676
	Offset: 0x1868
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function on_vehicle_killed(params)
{
	vehicle = self;
	if(!isdefined(level.cathedral_sitting))
	{
		return;
	}
	if(!is_true(vehicle.var_46439e18))
	{
		return;
	}
	if(isdefined(vehicle.session) && isdefined(params.weapon))
	{
		attachments = util::function_2146bd83(params.weapon);
		weaponfullname = (attachments != "" ? (params.weapon.name + ("+")) + attachments : params.weapon.name);
		vehicle.session.var_6e1d768e = hash(weaponfullname);
	}
	if(isdefined(level.cathedral_sitting))
	{
		vehicle clientfield::set("enemyvehicle", 0);
	}
}

/*
	Name: on_player_damage
	Namespace: player_vehicle
	Checksum: 0x30885E15
	Offset: 0x19A0
	Size: 0x3E2
	Parameters: 1
	Flags: Linked
*/
function on_player_damage(params)
{
	victim = self;
	attacker = params.eattacker;
	damagedone = int(min(params.idamage, (isdefined(victim.health) ? victim.health : params.idamage)));
	if(victim isinvehicle() && !victim isremotecontrolling())
	{
		vehicle = victim getvehicleoccupied();
		if(isdefined(vehicle.session))
		{
			seatindex = vehicle getoccupantseat(victim);
			if(seatindex == 0)
			{
				vehicle.session.var_61ceb3c1 = vehicle.session.var_61ceb3c1 + damagedone;
			}
			else
			{
				if(seatindex >= 1 && seatindex <= 4)
				{
					vehicle.session.var_c19a5249 = vehicle.session.var_c19a5249 + damagedone;
				}
				else if(seatindex >= 5 && seatindex <= 9)
				{
					vehicle.session.var_ffb0c509 = vehicle.session.var_ffb0c509 + damagedone;
				}
			}
		}
	}
	if(isplayer(attacker))
	{
		if(attacker isinvehicle() && !attacker isremotecontrolling())
		{
			vehicle = attacker getvehicleoccupied();
			if(isdefined(vehicle))
			{
				if(params.smeansofdeath == "MOD_CRUSH")
				{
					if(isdefined(victim))
					{
						victim playsound("veh_body_impact_flesh");
					}
					if(isdefined(vehicle.var_93dc9da9))
					{
						vehicle playsound(vehicle.var_93dc9da9);
					}
				}
				if(isdefined(vehicle.session))
				{
					if(params.smeansofdeath === "MOD_CRUSH")
					{
						vehicle.session.var_33f48e5a = vehicle.session.var_33f48e5a + damagedone;
					}
					else
					{
						seatindex = vehicle getoccupantseat(attacker);
						if(seatindex == 0)
						{
							vehicle.session.var_c1b985ee = vehicle.session.var_c1b985ee + damagedone;
						}
						else
						{
							if(seatindex >= 1 && seatindex <= 4)
							{
								vehicle.session.var_f07350a4 = vehicle.session.var_f07350a4 + damagedone;
							}
							else if(seatindex >= 5 && seatindex <= 9)
							{
								vehicle.session.var_45bf3627 = vehicle.session.var_45bf3627 + damagedone;
							}
						}
					}
				}
			}
		}
	}
}

/*
	Name: on_player_killed
	Namespace: player_vehicle
	Checksum: 0xE96DB3F1
	Offset: 0x1D90
	Size: 0x274
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(params)
{
	victim = self;
	attacker = params.eattacker;
	if(victim isinvehicle() && !victim isremotecontrolling())
	{
		vehicle = victim getvehicleoccupied();
		if(isdefined(vehicle.session))
		{
			seatindex = vehicle getoccupantseat(victim);
			if(seatindex == 0)
			{
				vehicle.session.var_888cce59++;
			}
			else
			{
				if(seatindex >= 1 && seatindex <= 4)
				{
					vehicle.session.var_c5d87ed4++;
				}
				else if(seatindex >= 5 && seatindex <= 9)
				{
					vehicle.session.var_3893d13e++;
				}
			}
		}
	}
	if(isplayer(attacker))
	{
		if(attacker isinvehicle() && !attacker isremotecontrolling())
		{
			vehicle = attacker getvehicleoccupied();
			if(isdefined(vehicle.session))
			{
				if(params.smeansofdeath == "MOD_CRUSH")
				{
					vehicle.session.var_865ffc35++;
				}
				else
				{
					seatindex = vehicle getoccupantseat(attacker);
					if(seatindex == 0)
					{
						vehicle.session.var_3724beba++;
					}
					else
					{
						if(seatindex >= 1 && seatindex <= 4)
						{
							vehicle.session.var_7c3e6a02++;
						}
						else if(seatindex >= 5 && seatindex <= 9)
						{
							vehicle.session.var_a1f4ebc0++;
						}
					}
				}
			}
		}
	}
}

/*
	Name: on_player_spawned
	Namespace: player_vehicle
	Checksum: 0x503CDAF4
	Offset: 0x2010
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self.var_3a76b3aa = undefined;
	self.var_c0f5ab51 = undefined;
}

/*
	Name: on_player_corpse
	Namespace: player_vehicle
	Checksum: 0x47E406BB
	Offset: 0x2030
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function on_player_corpse(params)
{
	foreach(player in getplayers())
	{
		if(is_true(player.var_2e8665de) && self === player.body)
		{
			self hide();
			return;
		}
	}
}

/*
	Name: function_69c9e9a0
	Namespace: player_vehicle
	Checksum: 0xAE31CF29
	Offset: 0x2108
	Size: 0x1B0
	Parameters: 0
	Flags: Linked
*/
function function_69c9e9a0()
{
	level endon(#"game_ended");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_4aced1739d6627a2");
		vehicle = waitresult.vehicle;
		if(!isvehicle(vehicle))
		{
			continue;
		}
		if(!is_true(vehicle.var_46439e18))
		{
			return;
		}
		callback::on_player_corpse(&on_player_corpse);
		occupants = vehicle getvehoccupants();
		foreach(occupant in occupants)
		{
			occupant unlink();
			occupant.var_2e8665de = 1;
			occupant dodamage(occupant.health * 100, occupant.origin);
		}
		vehicle deletedelay();
	}
}

/*
	Name: function_c747eedd
	Namespace: player_vehicle
	Checksum: 0x1557CA3E
	Offset: 0x22C0
	Size: 0xA6
	Parameters: 3
	Flags: Linked
*/
function function_c747eedd(vehicle, player, seatindex)
{
	if(vehicle.vehicleclass === "boat")
	{
		if(vehicle function_7548ecb2() && is_true(vehicle.var_221879dc))
		{
			if(seatindex === 0)
			{
				return false;
			}
		}
	}
	if(player flag::get("encumbered"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_2513e40c
	Namespace: player_vehicle
	Checksum: 0x54B485B7
	Offset: 0x2370
	Size: 0x88
	Parameters: 3
	Flags: Linked
*/
function function_2513e40c(vehicle, player, seatindex)
{
	if(!function_c747eedd(vehicle, player, seatindex))
	{
		return false;
	}
	if(player item_world::function_8e0d14c1(0))
	{
		return false;
	}
	if(isdefined(level.var_402b86e) && player [[level.var_402b86e]]())
	{
		return false;
	}
	return true;
}

/*
	Name: function_d69d0773
	Namespace: player_vehicle
	Checksum: 0xD8804F24
	Offset: 0x2400
	Size: 0x42
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d69d0773()
{
	if(!isdefined(self.var_d6a1af09))
	{
		self.var_d6a1af09 = 0;
	}
	if((gettime() - self.var_d6a1af09) >= 250)
	{
		self.var_d6a1af09 = gettime();
		return true;
	}
	return false;
}

/*
	Name: function_36aab2f3
	Namespace: player_vehicle
	Checksum: 0x5CBF4C2B
	Offset: 0x2450
	Size: 0x39C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_36aab2f3(params)
{
	if(!function_d69d0773())
	{
		return;
	}
	if(isdefined(self.var_4ca92b57))
	{
		var_1fdf316c = self.var_4ca92b57;
	}
	else
	{
		var_1fdf316c = 30;
	}
	if(isdefined(self.var_57371c71))
	{
		var_a7796a79 = self.var_57371c71;
	}
	else
	{
		var_a7796a79 = 60;
	}
	if(isdefined(self.var_84fed14b))
	{
		mindamage = self.var_84fed14b;
	}
	else
	{
		mindamage = 50;
	}
	if(isdefined(self.var_d6691161))
	{
		maxdamage = self.var_d6691161;
	}
	else
	{
		maxdamage = 250;
	}
	if(isdefined(self.var_5d662124))
	{
		var_1831f049 = self.var_5d662124;
	}
	else
	{
		var_1831f049 = 1;
	}
	if(isdefined(self.var_5002d77c))
	{
		var_a1805d6e = self.var_5002d77c;
	}
	else
	{
		var_a1805d6e = 0.65;
	}
	self callback::callback(#"hash_551381cffdc79048", params);
	var_2ad7f33b = params.intensity;
	if(isdefined(var_2ad7f33b) && var_2ad7f33b > var_1fdf316c)
	{
		var_ae95ae92 = mapfloat(var_1fdf316c, var_a7796a79, mindamage, maxdamage, var_2ad7f33b);
		if(isdefined(params.normal) && params.normal[2] < -0.5)
		{
			var_d3f8fc8a = vectordot(anglestoup(self.angles), -1 * params.normal);
			if(var_d3f8fc8a > var_a1805d6e)
			{
				var_ae95ae92 = var_ae95ae92 * 0;
			}
		}
		if(isdefined(params.entity) && isvehicle(params.entity))
		{
			riders = params.entity getvehoccupants();
			if(isdefined(riders) && isdefined(riders[0]))
			{
				attacker = riders[0];
			}
			else
			{
				attacker = self;
			}
		}
		if(isdefined(params.entity))
		{
			self dodamage(var_ae95ae92, self.origin, attacker);
		}
	}
	if(isdefined(params.entity) && issentient(params.entity))
	{
		if(isdefined(var_2ad7f33b) && var_2ad7f33b > 12)
		{
			var_ae95ae92 = mapfloat(12, 50, 50, 1000, var_2ad7f33b);
			params.entity dodamage(var_ae95ae92 * var_1831f049, self.origin, self);
		}
	}
}

/*
	Name: function_f7794c85
	Namespace: player_vehicle
	Checksum: 0xD9372398
	Offset: 0x27F8
	Size: 0xFC
	Parameters: 1
	Flags: Event
*/
event function_f7794c85(eventstruct)
{
	self.challenge_sprint_end = gettime();
	wait(0.75);
	if(!isvehicle(self) || !self function_2c2c30e0())
	{
		return;
	}
	self function_8cf138bb();
	self.takedamage = 0;
	self.var_e8ec304d = 1;
	self namespace_d0eacb0d::on_vehicle_killed();
	self clientfield::set("stopallfx", 1);
	self clientfield::set("flickerlights", 1);
	self launchvehicle((0, 0, 0), (0, 0, 0), 0, 1);
}

/*
	Name: function_df786031
	Namespace: player_vehicle
	Checksum: 0x5228ADC0
	Offset: 0x2900
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_df786031()
{
	return isdefined(self.locking_on) && self.locking_on > 0;
}

/*
	Name: function_ea4291d3
	Namespace: player_vehicle
	Checksum: 0x1FEB696F
	Offset: 0x2928
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ea4291d3()
{
	return isdefined(self.locked_on) && self.locked_on > 0;
}

/*
	Name: function_b3caeebc
	Namespace: player_vehicle
	Checksum: 0xB141EE57
	Offset: 0x2950
	Size: 0x14E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b3caeebc(player)
{
	self endon(#"death");
	player endon(#"exit_vehicle", #"death");
	while(true)
	{
		if(self function_ea4291d3())
		{
			player clientfield::set_player_uimodel("vehicle.missileLock", 2);
			self playsoundtoplayer(#"hash_445c9fb1793c4259", player);
			wait(0.25);
		}
		else
		{
			if(self function_df786031())
			{
				player clientfield::set_player_uimodel("vehicle.missileLock", 1);
				self playsoundtoplayer(#"hash_107b6827696673cb", player);
				wait(0.25);
			}
			else
			{
				player clientfield::set_player_uimodel("vehicle.missileLock", 0);
				self waittill(#"hash_594587fd1093c3b3");
			}
		}
	}
}

/*
	Name: function_28e59742
	Namespace: player_vehicle
	Checksum: 0x4151F1E8
	Offset: 0x2AA8
	Size: 0xD8
	Parameters: 0
	Flags: Linked
*/
function function_28e59742()
{
	occupants = self getvehoccupants();
	if(isdefined(occupants))
	{
		foreach(occupant in occupants)
		{
			if(!isplayer(occupant))
			{
				continue;
			}
			occupant clientfield::set_player_uimodel("vehicle.incomingMissile", 0);
		}
	}
}

/*
	Name: function_c25f7d1
	Namespace: player_vehicle
	Checksum: 0x4D7B5EB
	Offset: 0x2B88
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_c25f7d1(params)
{
	self endon(#"death", #"hash_158a0007d6fac6ed");
	if(!isvehicle(self))
	{
		return;
	}
	occupants = self getvehoccupants();
	foreach(occupant in occupants)
	{
		if(!isplayer(occupant))
		{
			continue;
		}
		occupant clientfield::set_player_uimodel("vehicle.incomingMissile", 1);
		occupant thread function_6aa73a2a(params.projectile, self);
	}
	params.projectile waittill(#"projectile_impact_explode", #"death");
	self function_28e59742();
}

/*
	Name: function_6aa73a2a
	Namespace: player_vehicle
	Checksum: 0x5F7801C8
	Offset: 0x2D00
	Size: 0x190
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6aa73a2a(missile, vehicle)
{
	self endon(#"death", #"exit_vehicle", #"hash_158a0007d6fac6ed");
	missile endon(#"death");
	vehicle endon(#"death");
	range = 8000 - 10;
	dist = undefined;
	while(true)
	{
		old_dist = dist;
		dist = distance(missile.origin, self.origin);
		var_38fa5914 = isdefined(old_dist) && dist < old_dist;
		if(var_38fa5914)
		{
			vehicle playsoundtoplayer(#"uin_ac130_alarm_missile_incoming", self);
		}
		var_6ce65309 = (dist - 10) / range;
		beep_interval = lerpfloat(0.05, 0.2, var_6ce65309);
		wait(beep_interval);
	}
}

/*
	Name: function_adc0649a
	Namespace: player_vehicle
	Checksum: 0x3DD71FF5
	Offset: 0x2E98
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_adc0649a()
{
	/#
		assert(isvehicle(self));
	#/
	return is_true(self.emped) || is_true(self.isjammed);
}

/*
	Name: function_3054737a
	Namespace: player_vehicle
	Checksum: 0x9AAEEF5C
	Offset: 0x2F00
	Size: 0x336
	Parameters: 1
	Flags: Linked
*/
function function_3054737a(player)
{
	vehicle = self;
	if(game.state == #"pregame" || !isplayer(player) || player isremotecontrolling() || isdefined(vehicle.session))
	{
		return;
	}
	vehicle.session = {#hash_6e1d768e:#"", #hash_a1f4ebc0:0, #hash_3893d13e:0, #hash_45bf3627:0, #hash_ffb0c509:0, #hash_afb151ad:0, #hash_7c3e6a02:0, #hash_c5d87ed4:0, #hash_f07350a4:0, #hash_c19a5249:0, #hash_7db0543d:0, #hash_9678e53b:0, #hash_3724beba:0, #hash_888cce59:0, #hash_c1b985ee:0, #hash_61ceb3c1:0, #hash_865ffc35:0, #hash_ecd1fe60:0, #hash_33f48e5a:0, #hash_770fd50d:0, #hash_5ba0df6e:0, #hash_309ad81f:0, #hash_efe98761:1, #first_player:int(player getxuid(1)), #end_health:vehicle.health, #start_health:vehicle.health, #end_time:0, #start_time:gettime(), #hash_c87538d9:vehicle.var_32371376, #hash_4ba3155:vehicle.origin[1], #hash_16f7d5d0:vehicle.origin[0], #hash_1ff15d37:vehicle.origin[1], #hash_2dbaf8ca:vehicle.origin[0], #vehicle:vehicle.vehicletype};
}

/*
	Name: function_2d00376
	Namespace: player_vehicle
	Checksum: 0xA3465498
	Offset: 0x3240
	Size: 0x116
	Parameters: 0
	Flags: Linked
*/
function function_2d00376()
{
	if(game.state == #"pregame")
	{
		return;
	}
	vehicle = self;
	if(isdefined(vehicle.session))
	{
		vehicle.session.end_time = function_f8d53445();
		vehicle.session.end_health = int(max(0, vehicle.health));
		vehicle.session.var_16f7d5d0 = vehicle.origin[0];
		vehicle.session.var_4ba3155 = vehicle.origin[1];
		function_92d1707f(#"hash_4fd470ea26ade803", vehicle.session);
		vehicle.session = undefined;
	}
}

/*
	Name: function_f442b1c
	Namespace: player_vehicle
	Checksum: 0x6EC83B64
	Offset: 0x3360
	Size: 0x20C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f442b1c()
{
	var_e61d6eb0 = [];
	foreach(vehicle in level.vehicle_tracking)
	{
		if(!isdefined(vehicle))
		{
			continue;
		}
		data = {#used:is_true(vehicle.used), #type:vehicle.vehicletype, #pos_z:vehicle.origin[2], #pos_y:vehicle.origin[1], #pos_x:vehicle.origin[0]};
		if(!isdefined(var_e61d6eb0))
		{
			var_e61d6eb0 = [];
		}
		else if(!isarray(var_e61d6eb0))
		{
			var_e61d6eb0 = array(var_e61d6eb0);
		}
		var_e61d6eb0[var_e61d6eb0.size] = data;
		if(var_e61d6eb0.size >= 100)
		{
			function_92d1707f(#"hash_55f923de6ff3632b", #"entries", var_e61d6eb0);
			var_e61d6eb0 = [];
			wait(0.1);
		}
	}
	if(var_e61d6eb0.size > 0)
	{
		function_92d1707f(#"hash_55f923de6ff3632b", #"entries", var_e61d6eb0);
	}
}

/*
	Name: on_end_game
	Namespace: player_vehicle
	Checksum: 0xB8066E20
	Offset: 0x3578
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function on_end_game(params)
{
	vehicles = getvehiclearray();
	for(i = 0; i < vehicles.size; i++)
	{
		vehicles[i] function_2d00376();
	}
	thread function_f442b1c();
}

/*
	Name: function_5fb6b45c
	Namespace: player_vehicle
	Checksum: 0xA7512ADC
	Offset: 0x35F0
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5fb6b45c(var_23eccda7)
{
	if(isdefined(self.var_f7c3ca97) && self.var_f7c3ca97 == var_23eccda7)
	{
		return;
	}
	oldhealth = self.health;
	self.var_f7c3ca97 = var_23eccda7;
	self function_9e96f231(var_23eccda7);
	damage = self.healthdefault - oldhealth;
	if(damage > 0)
	{
		self dodamage(damage, self.origin);
	}
}

/*
	Name: function_b5220c3c
	Namespace: player_vehicle
	Checksum: 0x7BC1D032
	Offset: 0x36A0
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b5220c3c(var_b6cebec7)
{
	if(isdefined(self.var_f04b2790) && self.var_f04b2790 == var_b6cebec7)
	{
		return;
	}
	self.var_f04b2790 = var_b6cebec7;
	self function_3e79d199(var_b6cebec7);
}

/*
	Name: function_92bb5a6f
	Namespace: player_vehicle
	Checksum: 0xE232F033
	Offset: 0x3700
	Size: 0x124
	Parameters: 2
	Flags: Linked, Private
*/
function private function_92bb5a6f(vehicle, var_6747c7b8)
{
	if(!isdefined(vehicle.var_13c5ef5f))
	{
		return;
	}
	if(isdefined(vehicle.var_260e3593) && isdefined(var_6747c7b8) && var_6747c7b8 == vehicle.var_260e3593)
	{
		return;
	}
	var_a90d69df = self function_1e0b31cf(vehicle.var_13c5ef5f);
	if(isdefined(var_a90d69df) && var_a90d69df != #"")
	{
		vehicle function_5fb6b45c(var_a90d69df);
	}
	var_b6cebec7 = self function_9497b7cb(vehicle.var_13c5ef5f);
	if(isdefined(var_b6cebec7) && var_b6cebec7 != #"")
	{
		vehicle function_b5220c3c(var_b6cebec7);
	}
}

/*
	Name: function_ca9b286c
	Namespace: player_vehicle
	Checksum: 0x57805B9A
	Offset: 0x3830
	Size: 0x48A
	Parameters: 1
	Flags: Event
*/
event function_ca9b286c(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	vehicle = eventstruct.vehicle;
	seatindex = eventstruct.seat_index;
	if(!is_true(vehicle.var_46439e18))
	{
		return;
	}
	if(killstreaks::is_killstreak_weapon(self.currentweapon))
	{
		self killstreaks::switch_to_last_non_killstreak_weapon();
	}
	vehicle.var_4a479473 = gettime();
	if(is_true(vehicle.isphysicsvehicle))
	{
		vehicle setbrake(0);
	}
	self clientfield::set_player_uimodel("vehicle.vehicleAttackMode", 0);
	vehicle callback::callback(#"hash_666d48a558881a36", {#eventstruct:eventstruct, #player:self});
	occupants = vehicle getvehoccupants();
	if(isdefined(vehicle) && isdefined(self.team))
	{
		vehicle.team = self.team;
	}
	vehicle.var_37f0c900 = undefined;
	if(!is_false(vehicle.var_cd4099ea))
	{
		if(seatindex === 0)
		{
			vehicle function_1a852d1d();
		}
	}
	if(isdefined(vehicle.settings) && is_true(vehicle.settings.var_2627e80a))
	{
		if(seatindex === 0)
		{
			if(is_true(vehicle.var_304cf9da))
			{
				vehicle vehicle::function_bbc1d940(1);
			}
		}
		var_1861e0b1 = vehicle clientfield::get("toggle_horn_sound");
		if(is_true(var_1861e0b1))
		{
			self clientfield::set_to_player("toggle_vehicle_sensor", 1);
		}
	}
	isemped = vehicle function_adc0649a();
	vehicle function_388973e4(isemped);
	vehicle thread function_b3caeebc(self);
	if(isdefined(level.cathedral_sitting))
	{
		vehicle clientfield::set("enemyvehicle", 1);
	}
	if(!isdefined(vehicle.maxhealth))
	{
		vehicle.maxhealth = vehicle.healthdefault;
	}
	if(seatindex === 0)
	{
		self function_92bb5a6f(vehicle, -1);
	}
	if(isdefined(level.vehicle_tracking))
	{
		foreach(var_c9fc0d83 in level.vehicle_tracking)
		{
			if(var_c9fc0d83 === vehicle)
			{
				var_c9fc0d83.used = 1;
			}
		}
	}
	if(!isdefined(vehicle.session))
	{
		vehicle function_3054737a(self);
	}
	else
	{
		vehicle.session.var_efe98761 = int(max(vehicle.session.var_efe98761, occupants.size));
	}
}

/*
	Name: function_e011eea6
	Namespace: player_vehicle
	Checksum: 0x25EB3451
	Offset: 0x3CC8
	Size: 0x418
	Parameters: 1
	Flags: Event
*/
event function_e011eea6(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	vehicle = eventstruct.vehicle;
	seatindex = eventstruct.seat_index;
	if(!is_true(vehicle.var_46439e18))
	{
		return;
	}
	vehicle.var_8e382c5f = gettime();
	vehicle.var_beafde27 = self.team;
	self.var_3a76b3aa = gettime();
	self.var_6309c512 = vehicle;
	self.var_65b3d786 = self.vehicleposition;
	if(vehicle function_f89e1149(seatindex))
	{
		self.var_c0f5ab51 = self;
	}
	else
	{
		self.var_c0f5ab51 = vehicle get_vehicle_driver();
	}
	self clientfield::set_player_uimodel("vehicle.incomingMissile", 0);
	self clientfield::set_player_uimodel("vehicle.missileLock", 0);
	vehicle callback::callback(#"hash_55f29e0747697500", {#eventstruct:eventstruct, #player:self});
	if(isdefined(vehicle.settings) && is_true(vehicle.settings.var_2627e80a))
	{
		self clientfield::set_to_player("toggle_vehicle_sensor", 0);
	}
	if(vehicle function_ea4291d3())
	{
		callback::callback("on_exit_locked_on_vehicle", {#seatindex:seatindex, #player:self, #vehicle:vehicle});
	}
	occupants = vehicle getvehoccupants();
	if(occupants.size == 0)
	{
		vehicle function_2d00376();
	}
	if(vehicle.var_bd9434ec !== 1)
	{
		if(!isdefined(occupants) || !occupants.size)
		{
			vehicle.var_37f0c900 = {#time:gettime(), #team:vehicle.team};
			vehicle.team = #"neutral";
			if(isdefined(level.cathedral_sitting))
			{
				vehicle clientfield::set("enemyvehicle", 0);
			}
		}
	}
	if(!is_false(vehicle.var_cd4099ea))
	{
		if(!isdefined(occupants) || !occupants.size)
		{
			vehicle function_6c46026b();
			if(is_true(vehicle.var_ffdf490c))
			{
				vehicle thread function_ffdf490c();
			}
		}
	}
	if(isdefined(vehicle.var_260e3593) && seatindex === vehicle.var_260e3593)
	{
		self function_b9604c53(vehicle);
	}
	if(seatindex !== 0)
	{
		return;
	}
	if(is_true(vehicle.var_97f1b32a))
	{
		vehicle.var_735382e = self;
		vehicle.var_a816f2cd = gettime();
	}
}

/*
	Name: function_3a4d53f8
	Namespace: player_vehicle
	Checksum: 0x1338DB91
	Offset: 0x40E8
	Size: 0x84
	Parameters: 1
	Flags: Event
*/
event function_3a4d53f8(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	vehicle = eventstruct.vehicle;
	vehicle callback::callback(#"hash_80ab24b716412e1", {#eventstruct:eventstruct, #player:self});
}

/*
	Name: function_2aa4e6cf
	Namespace: player_vehicle
	Checksum: 0x184B17B
	Offset: 0x4178
	Size: 0x434
	Parameters: 1
	Flags: Event
*/
event function_2aa4e6cf(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	vehicle = eventstruct.vehicle;
	seatindex = eventstruct.seat_index;
	var_6747c7b8 = eventstruct.var_21911287;
	if(!is_true(vehicle.var_46439e18))
	{
		return;
	}
	if(var_6747c7b8 === 0)
	{
		if(is_true(vehicle.var_97f1b32a))
		{
			vehicle.var_735382e = self;
			vehicle.var_a816f2cd = gettime();
		}
	}
	else if(seatindex === 0)
	{
		if(vehicle vehicle_ai::function_329f45a4() && !is_true(self.var_d271cf82))
		{
			if(vehicle vehicle_ai::has_state("landed") && vehicle vehicle_ai::get_current_state() === "off")
			{
				vehicle vehicle_ai::set_state("landed");
			}
			else
			{
				if(vehicle vehicle_ai::has_state("recovery") && vehicle vehicle_ai::get_current_state() === "spiral")
				{
					vehicle vehicle_ai::set_state("recovery");
				}
				else
				{
					if(vehicle vehicle_ai::has_state("driving"))
					{
						vehicle vehicle_ai::set_state("driving");
					}
					else if(!is_false(vehicle.var_cd4099ea))
					{
						vehicle function_1a852d1d();
					}
				}
			}
			if(isdefined(vehicle.settings) && is_true(vehicle.settings.var_2627e80a))
			{
				if(is_true(vehicle.var_304cf9da))
				{
					vehicle vehicle::function_bbc1d940(1);
				}
				var_1861e0b1 = vehicle clientfield::get("toggle_horn_sound");
				if(is_true(var_1861e0b1))
				{
					self clientfield::set_to_player("toggle_vehicle_sensor", 1);
				}
			}
		}
		else
		{
			vehicle takeplayercontrol();
		}
		self function_92bb5a6f(vehicle, var_6747c7b8);
	}
	if(isdefined(vehicle.var_260e3593))
	{
		if(isdefined(seatindex) && seatindex == vehicle.var_260e3593)
		{
			self function_3afc1410(vehicle);
		}
		else if(isdefined(var_6747c7b8) && var_6747c7b8 == vehicle.var_260e3593)
		{
			self function_b9604c53(vehicle);
		}
	}
	vehicle callback::callback(#"hash_2c1cafe2a67dfef8", {#eventstruct:eventstruct, #player:self});
	isemped = vehicle function_adc0649a();
	vehicle function_388973e4(isemped);
}

/*
	Name: function_2d7f6e48
	Namespace: player_vehicle
	Checksum: 0x5755ECCB
	Offset: 0x45B8
	Size: 0xBC
	Parameters: 1
	Flags: Event
*/
event function_2d7f6e48(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	if(isdefined(eventstruct.seat_index) && (eventstruct.seat_index >= 5 && eventstruct.seat_index <= 9))
	{
		if(eventstruct.var_e3e139f === 1)
		{
			self clientfield::set_player_uimodel("vehicle.vehicleAttackMode", 1);
		}
		else
		{
			self clientfield::set_player_uimodel("vehicle.vehicleAttackMode", 0);
		}
	}
}

/*
	Name: function_8cf138bb
	Namespace: player_vehicle
	Checksum: 0x69F67124
	Offset: 0x4680
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_8cf138bb()
{
	if(!isvehicle(self))
	{
		return;
	}
	occupants = self getvehoccupants();
	if(isdefined(occupants) && occupants.size)
	{
		for(i = 0; i < occupants.size; i++)
		{
			seat = self getoccupantseat(occupants[i]);
			if(isdefined(seat))
			{
				self usevehicle(occupants[i], seat);
			}
		}
	}
	self makevehicleunusable();
}

/*
	Name: function_22d9386e
	Namespace: player_vehicle
	Checksum: 0xC828C71D
	Offset: 0x4760
	Size: 0xEC
	Parameters: 1
	Flags: Event
*/
event function_22d9386e(eventstruct)
{
	if(!is_true(self.var_46439e18))
	{
		return;
	}
	if(is_true(self.var_a195943))
	{
		return;
	}
	self function_8cf138bb();
	waterheight = getwaterheight(self.origin, 100, -10000);
	if(waterheight != 131072 && self.origin[2] < waterheight)
	{
		self.health = 5;
	}
	else
	{
		self dodamage(self.health - 5, self.origin);
	}
}

/*
	Name: function_ef44d420
	Namespace: player_vehicle
	Checksum: 0xB816ED8
	Offset: 0x4858
	Size: 0x1B8
	Parameters: 1
	Flags: Linked
*/
function function_ef44d420(params)
{
	self vehicle::toggle_lights_group(1, !params.var_d8ceeba3);
	self vehicle::toggle_lights_group(2, !params.var_d8ceeba3);
	self vehicle::toggle_lights_group(3, !params.var_d8ceeba3);
	self vehicle::toggle_lights_group(4, params.var_d8ceeba3);
	occupants = self getvehoccupants();
	if(isdefined(occupants))
	{
		foreach(occupant in occupants)
		{
			if(!isplayer(occupant))
			{
				continue;
			}
			if(is_true(occupant function_bee2bbc7()))
			{
				continue;
			}
			if(params.var_d8ceeba3)
			{
				occupant clientfield::set_to_player("toggle_vehicle_sensor", 1);
				continue;
			}
			occupant clientfield::set_to_player("toggle_vehicle_sensor", 0);
		}
	}
}

/*
	Name: function_ffdf490c
	Namespace: player_vehicle
	Checksum: 0xF0C3DB7F
	Offset: 0x4A18
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ffdf490c()
{
	if(!isdefined(self) || self.health < 1)
	{
		return;
	}
	self endon(#"death");
	util::wait_network_frame();
	for(group = 1; group < 4; group++)
	{
		self vehicle::toggle_lights_group(group, 1);
	}
	self vehicle::toggle_force_driver_taillights(1);
}

/*
	Name: function_85aaed19
	Namespace: player_vehicle
	Checksum: 0x1263F2DA
	Offset: 0x4AC8
	Size: 0xAA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_85aaed19(seat_index)
{
	switch(seat_index)
	{
		case 0:
		{
			return "overheat_fx";
		}
		case 1:
		{
			return "overheat_fx1";
		}
		case 2:
		{
			return "overheat_fx2";
		}
		case 3:
		{
			return "overheat_fx3";
		}
		case 4:
		{
			return "overheat_fx4";
		}
		default:
		{
			return undefined;
		}
	}
}

/*
	Name: function_5bce3f3a
	Namespace: player_vehicle
	Checksum: 0xCAE147A9
	Offset: 0x4B80
	Size: 0xBE
	Parameters: 2
	Flags: Linked
*/
function function_5bce3f3a(seat_index, var_ddd294e3)
{
	self endon(#"death");
	clientfield = function_85aaed19(var_ddd294e3);
	while(true)
	{
		var_24139930 = self isvehicleturretoverheating(var_ddd294e3);
		if(var_24139930)
		{
			self clientfield::set(clientfield, 1);
		}
		else
		{
			self clientfield::set(clientfield, 0);
		}
		waitframe(1);
	}
}

/*
	Name: function_41cb03eb
	Namespace: player_vehicle
	Checksum: 0x1BFDD566
	Offset: 0x4C48
	Size: 0xAA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_41cb03eb(seat_index)
{
	switch(seat_index)
	{
		case 0:
		{
			return "tag_turret";
		}
		case 1:
		{
			return "tag_gunner_turret1";
		}
		case 2:
		{
			return "tag_gunner_turret2";
		}
		case 3:
		{
			return "tag_gunner_turret3";
		}
		case 4:
		{
			return "tag_gunner_turret4";
		}
		default:
		{
			return undefined;
		}
	}
}

/*
	Name: function_58adb71c
	Namespace: player_vehicle
	Checksum: 0xCF5EEA07
	Offset: 0x4D00
	Size: 0x234
	Parameters: 3
	Flags: None
*/
function function_58adb71c(vehicle, seat_index, var_c269692d)
{
	self endon(#"death", #"disconnect", #"exit_vehicle", #"change_seat");
	vehicle endon(#"death");
	if(vehicle.var_96c0f900[seat_index] == 0)
	{
		vehicle disablegunnerfiring(seat_index - 1, 1);
		return;
	}
	while(true)
	{
		params = undefined;
		params = vehicle waittill(#"gunner_weapon_fired");
		if(params.gunner_index === seat_index)
		{
			vehicle.var_96c0f900[seat_index] = vehicle.var_96c0f900[seat_index] - var_c269692d;
			var_251a3d58 = function_41cb03eb(seat_index);
			if(isdefined(var_251a3d58))
			{
				damageparts = [];
				if(!isdefined(damageparts))
				{
					damageparts = [];
				}
				else if(!isarray(damageparts))
				{
					damageparts = array(damageparts);
				}
				damageparts[damageparts.size] = var_251a3d58;
				vehicle function_902cf00a(damageparts, int(var_c269692d));
			}
			if(vehicle.var_96c0f900[seat_index] < 0)
			{
				vehicle.var_96c0f900[seat_index] = 0;
			}
			if(vehicle.var_96c0f900[seat_index] == 0)
			{
				vehicle disablegunnerfiring(seat_index - 1, 1);
				break;
			}
		}
	}
}

/*
	Name: function_388973e4
	Namespace: player_vehicle
	Checksum: 0xDAAA4239
	Offset: 0x4F40
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_388973e4(disable)
{
	self disabledriverfiring(disable);
	for(gunnerindex = 0; gunnerindex < 4; gunnerindex++)
	{
		self disablegunnerfiring(gunnerindex, disable);
	}
}

/*
	Name: function_cc30c4bb
	Namespace: player_vehicle
	Checksum: 0x8E591A2
	Offset: 0x4FB0
	Size: 0x2E
	Parameters: 2
	Flags: Linked
*/
function function_cc30c4bb(gesture, seat_index)
{
	self.var_66329fbb = gesture;
	self.var_260e3593 = seat_index;
}

/*
	Name: function_f43c0cb7
	Namespace: player_vehicle
	Checksum: 0x3FD952E
	Offset: 0x4FE8
	Size: 0x90
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f43c0cb7(vehicle)
{
	if(self function_104d7b4d())
	{
		return false;
	}
	if(self isswitchingweapons())
	{
		return false;
	}
	if(self isreloading())
	{
		return false;
	}
	if(isdefined(vehicle.var_66329fbb) && self isgestureplaying(vehicle.var_66329fbb))
	{
		return false;
	}
	return true;
}

/*
	Name: function_3afc1410
	Namespace: player_vehicle
	Checksum: 0x70C6957F
	Offset: 0x5080
	Size: 0xD0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3afc1410(vehicle)
{
	self endon(#"death", #"exit_vehicle", #"change_seat");
	if(getdvarint(#"hash_7f03a8a63481ec2f", 0) == 1)
	{
		return;
	}
	if(!isdefined(vehicle.var_66329fbb))
	{
		return;
	}
	while(true)
	{
		if(function_f43c0cb7(vehicle))
		{
			self playgestureviewmodel(vehicle.var_66329fbb);
		}
		wait(0.05);
	}
}

/*
	Name: function_b9604c53
	Namespace: player_vehicle
	Checksum: 0xB6895E10
	Offset: 0x5158
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b9604c53(vehicle)
{
	if(getdvarint(#"hash_7f03a8a63481ec2f", 0) == 1)
	{
		return;
	}
	if(isdefined(vehicle.var_66329fbb))
	{
		self stopgestureviewmodel(vehicle.var_66329fbb);
	}
}

/*
	Name: function_17949e01
	Namespace: player_vehicle
	Checksum: 0x22DE2D61
	Offset: 0x51C8
	Size: 0x26A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_17949e01()
{
	self notify("54d2d53cb8fe6ee7");
	self endon("54d2d53cb8fe6ee7");
	self endon(#"death");
	mag = getdvarfloat(#"hash_2612e4b1db15d42e", 150);
	height = getdvarfloat(#"hash_57e0d780126c4f57", 100);
	var_80831eb5 = 0;
	while(true)
	{
		self waittill(#"beached");
		while(true)
		{
			waitresult = undefined;
			waitresult = self waittill(#"touch", #"hash_5dd07f78cd8cd3b8");
			if(!self function_b835102b())
			{
				/#
					println("" + self getentitynumber());
				#/
				return;
			}
			if(waitresult._notify == #"touch" && isdefined(waitresult.entity) && isplayer(waitresult.entity))
			{
				time = gettime();
				if(time > var_80831eb5 && waitresult.entity isonslide())
				{
					force = anglestoforward(waitresult.entity getplayerangles());
					force = force * mag;
					force = force + (0, 0, height);
					self launchvehicle(force, self.origin);
					var_80831eb5 = time + 1500;
				}
			}
			else if(!self function_7548ecb2())
			{
				break;
			}
		}
	}
}

/*
	Name: deletemeonnotify
	Namespace: player_vehicle
	Checksum: 0x7E826F7F
	Offset: 0x5440
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function deletemeonnotify(enttowatch, note)
{
	self endon(#"death");
	if(!isdefined(enttowatch))
	{
		return;
	}
	enttowatch waittill(note);
	self delete();
}

/*
	Name: function_e8e41bbb
	Namespace: player_vehicle
	Checksum: 0x6F772D4F
	Offset: 0x54A0
	Size: 0x3DE
	Parameters: 0
	Flags: Linked
*/
function function_e8e41bbb()
{
	self notify("38750425a79d98a9");
	self endon("38750425a79d98a9");
	self endon(#"death");
	self.var_221879dc = 0;
	if(self function_7ca7a7e5())
	{
		return;
	}
	if(isdefined(self.settings) && is_true(self.settings.var_95ebe8e0))
	{
		self thread function_17949e01();
	}
	fxorg = undefined;
	while(true)
	{
		if(!self function_b835102b())
		{
			/#
				println("" + self getentitynumber());
			#/
			return;
		}
		speed = length(self getvelocity());
		if(self function_7548ecb2() && speed < 5)
		{
			if(!self.var_221879dc)
			{
				driver = self getseatoccupant(0);
				if(isplayer(driver))
				{
					self usevehicle(driver, 0);
				}
				if(isdefined(self.settings))
				{
					if(isdefined(self.settings.var_b5c8e89a) && isdefined(self.settings.var_95861ca4))
					{
						if(isdefined(fxorg))
						{
							fxorg delete();
						}
						fxorg = spawn("script_model", self gettagorigin(self.settings.var_95861ca4));
						fxorg.targetname = "vehicle_beach_fx";
						if(isdefined(fxorg))
						{
							fxorg setmodel(#"tag_origin");
							fxorg enablelinkto();
							fxorg linkto(self, self.settings.var_95861ca4, (0, 0, 0), (0, 0, 0));
							playfxontag(self.settings.var_b5c8e89a, fxorg, "tag_origin");
							fxorg thread deletemeonnotify(self, "death");
						}
					}
					if(isdefined(self.settings.var_a8fa65d7))
					{
						self playsound(self.settings.var_a8fa65d7);
					}
				}
				self.var_221879dc = 1;
				self notify(#"beached");
			}
		}
		else if(self.var_221879dc && !self function_7548ecb2())
		{
			self.var_221879dc = 0;
			if(isdefined(fxorg))
			{
				fxorg delete();
			}
			self notify(#"hash_5dd07f78cd8cd3b8");
			wait(5);
		}
		waitframe(1);
	}
}

/*
	Name: function_971ca64b
	Namespace: player_vehicle
	Checksum: 0x8924BD8E
	Offset: 0x5888
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function function_971ca64b()
{
	self.var_b71d69e0 = 1;
}

/*
	Name: function_a2626745
	Namespace: player_vehicle
	Checksum: 0x4B1DB2F4
	Offset: 0x58A8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_a2626745()
{
	self.var_b71d69e0 = 0;
	self thread function_e8e41bbb();
}

/*
	Name: function_7ca7a7e5
	Namespace: player_vehicle
	Checksum: 0x5E853F55
	Offset: 0x58D8
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function function_7ca7a7e5()
{
	if(is_true(self.var_b71d69e0))
	{
		return true;
	}
	return false;
}

/*
	Name: function_9e6e374a
	Namespace: player_vehicle
	Checksum: 0x7781909C
	Offset: 0x5908
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function function_9e6e374a(params)
{
	if(isdefined(self))
	{
		if(isdefined(level.var_fc1bbaef))
		{
			[[level.var_fc1bbaef]](self);
		}
		self clientfield::set("stunned", 0);
		self vehicle_ai::emp_startup_fx();
		self vehicle::toggle_emp_fx(0);
		self vehicle::function_bbc1d940(1);
		self vehicle::toggle_sounds(1);
		if(isdefined(level.var_fc1bbaef))
		{
			[[level.var_fc1bbaef]](self);
		}
		self clientfield::set("isJammed", 0);
		self.isjammed = 0;
		self.emped = 0;
		self.abnormal_status.emped = 0;
		if(vehicle_ai::function_329f45a4())
		{
			if(!is_false(self.var_cd4099ea))
			{
				self function_1a852d1d();
			}
		}
		self function_388973e4(0);
	}
}

/*
	Name: function_c9620f20
	Namespace: player_vehicle
	Checksum: 0x8BDDC825
	Offset: 0x5A88
	Size: 0x27C
	Parameters: 1
	Flags: Linked
*/
function function_c9620f20(params)
{
	self vehicle::toggle_emp_fx(1);
	self vehicle::function_bbc1d940(0);
	self vehicle::toggle_sounds(0);
	if(is_true(self.var_52e23e90))
	{
		self vehicle::function_7f0bbde3();
		self playsound(#"hash_d6643b88d0186ae");
	}
	self function_388973e4(1);
	self.var_52e23e90 = undefined;
	if(isdefined(self.settings) && is_true(self.settings.var_2627e80a))
	{
		params.var_d8ceeba3 = 0;
		self function_ef44d420(params);
	}
	if(!isdefined(self.abnormal_status))
	{
		self.abnormal_status = spawnstruct();
	}
	self clientfield::set("stunned", 1);
	self.abnormal_status.emped = 1;
	self.abnormal_status.attacker = params.param1;
	self.abnormal_status.inflictor = params.param2;
	time = params.param0;
	/#
		assert(isdefined(time));
	#/
	util::cooldown("emped_timer", time);
	while(!util::iscooldownready("emped_timer") && isalive(self))
	{
		timeleft = max(util::getcooldownleft("emped_timer"), 0.5);
		wait(timeleft);
	}
	self function_9e6e374a(params);
}

/*
	Name: function_d3da7e1e
	Namespace: player_vehicle
	Checksum: 0x8F4274D9
	Offset: 0x5D10
	Size: 0x22C
	Parameters: 0
	Flags: Linked
*/
function function_d3da7e1e()
{
	self notify("352e19f8e692c958");
	self endon("352e19f8e692c958");
	self endon(#"death", #"exit_vehicle", #"change_seat");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_fired");
		var_1c7142e7 = waitresult.projectile;
		/#
			/#
				assert(isdefined(var_1c7142e7), "");
			#/
		#/
		target = self turretgettarget(0);
		/#
			/#
				assert(isdefined(target), "");
			#/
		#/
		var_251a3d58 = function_41cb03eb(0);
		foreach(projectile in var_1c7142e7)
		{
			targetent = spawn("script_origin", target);
			projectile missile_settarget(targetent);
			projectile thread function_11b95c7f(targetent);
			/#
				if(getdvarint(#"hash_4e5f56d5a1a9fea4", 0) > 0)
				{
					projectile thread function_2f3dd76f(targetent);
				}
			#/
		}
	}
}

/*
	Name: function_11b95c7f
	Namespace: player_vehicle
	Checksum: 0xF1E12AE3
	Offset: 0x5F48
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_11b95c7f(targetent)
{
	self waittill(#"death");
	targetent delete();
}

/*
	Name: get_vehicle_driver
	Namespace: player_vehicle
	Checksum: 0xD221705E
	Offset: 0x5F88
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function get_vehicle_driver()
{
	var_ef743cda = self getseatoccupant(0);
	if(!isdefined(var_ef743cda) && isdefined(self.var_260e3593))
	{
		var_ef743cda = self getseatoccupant(self.var_260e3593);
	}
	return var_ef743cda;
}

/*
	Name: function_f89e1149
	Namespace: player_vehicle
	Checksum: 0x485E8AC1
	Offset: 0x5FF8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_f89e1149(seatindex)
{
	return seatindex == 0 || (isdefined(self.var_260e3593) && seatindex == self.var_260e3593);
}

/*
	Name: function_2f3dd76f
	Namespace: player_vehicle
	Checksum: 0x2DBB715C
	Offset: 0x6038
	Size: 0x56
	Parameters: 1
	Flags: Private
*/
function private function_2f3dd76f(targetent)
{
	/#
		self endon(#"death");
		while(true)
		{
			sphere(targetent.origin, 30, (0, 1, 0));
			waitframe(1);
		}
	#/
}

