#using script_1cd491b1807da8f7;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_2f51db47;

/*
	Name: function_89f2df9
	Namespace: namespace_2f51db47
	Checksum: 0x909762E7
	Offset: 0x220
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_61d578a98d57a51e", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2f51db47
	Checksum: 0x3A6CADB6
	Offset: 0x268
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	callback::on_player_corpse(&function_8cc4432b);
	level thread init_elevator("dynent_elevator_button");
	level thread init_elevator("dynent_elevator_button_2");
	level thread init_elevator("dynent_elevator_button_3");
	level thread init_elevator("dynent_elevator_button_4");
	level thread init_elevator("dynent_elevator_button_5");
	level thread function_ded5d217();
}

/*
	Name: function_ded5d217
	Namespace: namespace_2f51db47
	Checksum: 0x8DEFF256
	Offset: 0x350
	Size: 0x180
	Parameters: 0
	Flags: None
*/
function function_ded5d217()
{
	var_7b969086 = getdynentarray("wind_turbine");
	foreach(turbine in var_7b969086)
	{
		if(randomint(100) > 20)
		{
			function_e2a06860(turbine, randomintrange(1, 4));
		}
	}
	foreach(turbine in var_7b969086)
	{
		if(randomint(100) > 20)
		{
			function_e2a06860(turbine, randomintrange(1, 4));
		}
	}
}

/*
	Name: init_elevator
	Namespace: namespace_2f51db47
	Checksum: 0x5A72B574
	Offset: 0x4D8
	Size: 0x322
	Parameters: 1
	Flags: None
*/
function init_elevator(var_fd98a47c)
{
	dynents = getdynentarray(var_fd98a47c);
	if(dynents.size == 0)
	{
		return;
	}
	/#
		assert(dynents.size == 2);
	#/
	foreach(dynent in dynents)
	{
		dynent.onuse = &function_31042f91;
		dynent.ondamaged = &function_724a2fa5;
		dynent.buttons = dynents;
		position = struct::get(dynent.target, "targetname");
		elevator = getent(position.target, "targetname");
		elevator.buttons = dynents;
		if(position.script_noteworthy === "start")
		{
			function_e2a06860(dynent, 1);
			if(!isdefined(elevator.target))
			{
				continue;
			}
			button = getent(elevator.target, "targetname");
			if(!isdefined(button))
			{
				continue;
			}
			button triggerignoreteam();
			button setvisibletoall();
			button usetriggerrequirelookat();
			button setteamfortrigger(#"none");
			button setcursorhint("HINT_NOICON");
			button sethintstring(#"hash_29965b65bca9cd7b");
			button usetriggerignoreuseholdtime();
			button callback::function_35a12f19(&function_af088c90);
			button.elevator = elevator;
			elevator.button = button;
			elevator.var_e87f4c9 = button.origin - elevator.origin;
			elevator.var_8273f574 = dynent;
			elevator.var_8ba5c861 = dynent;
			continue;
		}
		elevator.var_ec68615b = dynent;
		elevator.var_d98394f7 = dynent;
	}
}

/*
	Name: function_724a2fa5
	Namespace: namespace_2f51db47
	Checksum: 0xD529BF62
	Offset: 0x808
	Size: 0xEE
	Parameters: 1
	Flags: Private
*/
function private function_724a2fa5(eventstruct)
{
	dynent = eventstruct.ent;
	if(isdefined(eventstruct))
	{
		dynent.health = dynent.health + eventstruct.amount;
	}
	if(isdefined(dynent.var_a548ec11) && gettime() <= dynent.var_a548ec11)
	{
		return;
	}
	if(distancesquared(eventstruct.ent.origin, eventstruct.position) > sqr(15))
	{
		return;
	}
	var_a852a7dd = dynent_use::function_bf7b8a27(dynent);
	dynent.var_a548ec11 = gettime() + (var_a852a7dd * 1000);
}

/*
	Name: function_8cc4432b
	Namespace: namespace_2f51db47
	Checksum: 0xB565CA3
	Offset: 0x900
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_8cc4432b(params)
{
	waitframe(1);
	if(isdefined(self) && isdefined(self.player) && is_true(self.player.var_1a776c13))
	{
		self notsolid();
		self ghost();
	}
}

/*
	Name: function_ad26976
	Namespace: namespace_2f51db47
	Checksum: 0x69D0DCAD
	Offset: 0x988
	Size: 0x194
	Parameters: 0
	Flags: None
*/
function function_ad26976()
{
	self endon(#"movedone");
	while(true)
	{
		vehicles = getentitiesinradius(self.origin, 1536, 12);
		var_4ab0fd8c = getentitiesinradius(self.origin, 1536, 14);
		foreach(vehicle in vehicles)
		{
			vehicle launchvehicle((0, 0, 0), vehicle.origin, 0);
		}
		foreach(vehicle_corpse in var_4ab0fd8c)
		{
			vehicle_corpse delete();
		}
		wait(0.25);
	}
}

/*
	Name: function_211e7277
	Namespace: namespace_2f51db47
	Checksum: 0x160517DC
	Offset: 0xB28
	Size: 0x1B4
	Parameters: 2
	Flags: None
*/
function function_211e7277(point, var_8bd17d7d)
{
	nearby_players = getplayers(undefined, point.origin, 256);
	move_pos = point.origin;
	var_93a4284 = 0;
	var_ff951b7a = 0;
	if(nearby_players.size > 0)
	{
		var_93a4284 = 1;
	}
	while(var_93a4284 && var_ff951b7a < 20)
	{
		foreach(player in nearby_players)
		{
			if(distance(player.origin, point.origin) < 16 && player.sessionstate == "playing")
			{
				var_93a4284 = 1;
				n_forward = var_8bd17d7d;
				n_forward = n_forward * vectorscale((1, 1, 0), 32);
				move_pos = move_pos + n_forward;
				break;
				continue;
			}
			var_93a4284 = 0;
		}
		var_ff951b7a++;
	}
	self setorigin(move_pos);
}

/*
	Name: is_equipment
	Namespace: namespace_2f51db47
	Checksum: 0xA8D039D8
	Offset: 0xCE8
	Size: 0x11A
	Parameters: 1
	Flags: None
*/
function is_equipment(entity)
{
	if(isdefined(entity.weapon))
	{
		weapon = entity.weapon;
		if(weapon.name === #"ability_smart_cover" || weapon.name === #"eq_tripwire" || weapon.name === #"trophy_system" || weapon.name === #"eq_concertina_wire" || weapon.name === #"eq_sensor" || weapon.name === #"cymbal_monkey" || weapon.name === #"hash_10f614b278daaebc")
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_777e012d
	Namespace: namespace_2f51db47
	Checksum: 0x2704F358
	Offset: 0xE10
	Size: 0x266
	Parameters: 1
	Flags: None
*/
function function_777e012d(t_damage)
{
	self endon(#"death");
	level endon(#"hash_1c605a92cc507414");
	if(!isdefined(t_damage))
	{
		return;
	}
	equipment = getentitiesinradius(t_damage.origin, 1536);
	foreach(device in equipment)
	{
		if(isdefined(device) && device istouching(t_damage))
		{
			if(is_equipment(device))
			{
				switch(device.weapon.name)
				{
					case "eq_tripwire":
					{
						device [[level.var_2e06b76a]]();
						break;
					}
					case "trophy_system":
					{
						device [[level.var_4f3822f4]]();
						break;
					}
					case "cymbal_monkey":
					{
						device [[level.var_7c5c96dc]]();
						break;
					}
					case "hash_10f614b278daaebc":
					{
						device [[level.var_cc310d06]]();
						break;
					}
					case "eq_sensor":
					{
						device [[level.var_9911d36f]]();
						break;
					}
					case "eq_concertina_wire":
					{
						device [[level.var_94029383]]();
						break;
					}
					case "gadget_supplypod":
					{
						device notify(#"death");
						break;
					}
					default:
					{
						device kill();
					}
				}
			}
		}
	}
}

/*
	Name: elevator_kill_player
	Namespace: namespace_2f51db47
	Checksum: 0xC28FBDAB
	Offset: 0x1080
	Size: 0x228
	Parameters: 1
	Flags: None
*/
function elevator_kill_player(t_damage)
{
	self endon(#"death");
	level endon(#"hash_1c605a92cc507414");
	if(!isdefined(t_damage))
	{
		return;
	}
	foreach(e_player in getplayers())
	{
		if(e_player istouching(t_damage) && isalive(e_player) && isdefined(e_player))
		{
			if(level.inprematchperiod)
			{
				var_96c44bd9 = 1;
				str_targetname = t_damage.targetname;
				if(isstring(str_targetname))
				{
					var_96c44bd9 = str_targetname[8];
				}
				point = struct::get("elevator_teleport_" + var_96c44bd9, "targetname");
				var_8bd17d7d = anglestoforward(point.angles);
				var_8bd17d7d = vectornormalize(var_8bd17d7d);
				if(isdefined(point))
				{
					e_player function_211e7277(point, var_8bd17d7d);
				}
				continue;
			}
			var_1c8ad6c7 = level flag::get(#"hash_5a3e17fbc33cdc86");
			if(var_1c8ad6c7)
			{
				e_player.var_1a776c13 = 1;
				e_player suicide();
			}
		}
	}
}

/*
	Name: function_8e73d913
	Namespace: namespace_2f51db47
	Checksum: 0xB4DFCFFF
	Offset: 0x12B0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_8e73d913()
{
	util::wait_network_frame(2);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_26ab1b5e
	Namespace: namespace_2f51db47
	Checksum: 0xB65507F0
	Offset: 0x12F8
	Size: 0x3E4
	Parameters: 1
	Flags: None
*/
function function_26ab1b5e(t_damage)
{
	self endon(#"death");
	level endon(#"hash_1c605a92cc507414");
	if(!isdefined(t_damage))
	{
		return;
	}
	vehicles = getentitiesinradius(t_damage.origin, 1536, 12);
	foreach(e_vehicle in vehicles)
	{
		if(e_vehicle istouching(t_damage) && isalive(e_vehicle))
		{
			var_38ae32ff = e_vehicle.origin - t_damage.origin;
			var_8fa58819 = var_38ae32ff[2];
			var_8fa58819 = var_8fa58819 * var_8fa58819;
			if(var_8fa58819 < 32 || e_vehicle.scriptvehicletype === #"helicopter_light")
			{
				a_players = e_vehicle getvehoccupants();
				e_vehicle.takedamage = 1;
				e_vehicle.allowdeath = 1;
				e_vehicle dodamage(e_vehicle.health + 10000, e_vehicle.origin, undefined, undefined, "none", "MOD_EXPLOSIVE", 8192);
				waitframe(1);
				e_vehicle thread function_8e73d913();
				foreach(player in a_players)
				{
					if(isalive(player) && isdefined(player) && !player isremotecontrolling())
					{
						if(level.inprematchperiod)
						{
							var_96c44bd9 = 1;
							str_targetname = t_damage.targetname;
							if(isstring(str_targetname))
							{
								var_96c44bd9 = str_targetname[8];
							}
							point = struct::get("elevator_teleport_" + var_96c44bd9, "targetname");
							var_8bd17d7d = anglestoforward(point.angles);
							var_8bd17d7d = vectornormalize(var_8bd17d7d);
							if(isdefined(point))
							{
								player function_211e7277(point, var_8bd17d7d);
							}
							continue;
						}
						var_1c8ad6c7 = level flag::get(#"hash_5a3e17fbc33cdc86");
						if(var_1c8ad6c7)
						{
							player.var_1a776c13 = 1;
							player suicide();
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_76ad6828
	Namespace: namespace_2f51db47
	Checksum: 0xCEF45AAC
	Offset: 0x16E8
	Size: 0x18E
	Parameters: 1
	Flags: None
*/
function function_76ad6828(position)
{
	self endon(#"death");
	if(isdefined(self.script_noteworthy) && isdefined(position))
	{
		var_a91da4b7 = self.script_noteworthy + "_player";
		var_bda7a712 = self.script_noteworthy + "_vehicle";
		var_68dc3bdf = getent(var_a91da4b7, "targetname");
		var_42611516 = getent(var_bda7a712, "targetname");
		if(isdefined(var_68dc3bdf) && isdefined(var_42611516))
		{
			var_d011282b = distancesquared(self.origin, position.origin);
			while(var_d011282b > 16)
			{
				var_d011282b = distancesquared(self.origin, position.origin);
				if(var_d011282b <= 5000)
				{
					self thread function_777e012d(var_68dc3bdf);
					self thread function_26ab1b5e(var_42611516);
					self thread elevator_kill_player(var_68dc3bdf);
				}
				waitframe(1);
			}
		}
	}
}

/*
	Name: elevator_move
	Namespace: namespace_2f51db47
	Checksum: 0x40C16463
	Offset: 0x1880
	Size: 0x3B4
	Parameters: 1
	Flags: None
*/
function elevator_move(elevator)
{
	position = struct::get(elevator.var_d98394f7.target, "targetname");
	elevator.button triggerenable(0);
	if(isdefined(elevator.script_noteworthy) && position.script_noteworthy === "start")
	{
		elevator thread function_76ad6828(position);
	}
	elevator.moving = 1;
	elevator.button playsound("evt_elevator_button_bell");
	elevator callback::callback(#"hash_5a18bf6aa6ae81c6", {#current_position:struct::get(elevator.var_8ba5c861.target, "targetname")});
	wait(0.5);
	elevator thread function_ad26976();
	elevator playsound("evt_elevator_start");
	elevator playloopsound("evt_elevator_move", 0);
	elevator moveto(position.origin, 10, 0.5, 0.5);
	function_e2a06860(elevator.var_d98394f7, 1);
	function_e2a06860(elevator.var_8ba5c861, 1);
	var_d98394f7 = elevator.var_8ba5c861;
	elevator.var_8ba5c861 = elevator.var_d98394f7;
	elevator.var_d98394f7 = var_d98394f7;
	elevator waittill(#"movedone");
	elevator playsound("evt_elevator_stop");
	elevator stoploopsound(1);
	elevator.moving = 0;
	elevator.button.origin = elevator.origin + elevator.var_e87f4c9;
	elevator callback::callback(#"hash_15c98df2b5cc27ae", {#current_position:struct::get(elevator.var_8ba5c861.target, "targetname")});
	if(elevator.var_d98394f7 == elevator.var_8273f574)
	{
		elevator.button sethintstring(#"hash_310ad55f171e194e");
	}
	else
	{
		elevator.button sethintstring(#"hash_29965b65bca9cd7b");
	}
	function_e2a06860(elevator.var_d98394f7, 0);
	elevator.button triggerenable(1);
}

/*
	Name: function_af088c90
	Namespace: namespace_2f51db47
	Checksum: 0xD24956E9
	Offset: 0x1C40
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_af088c90(trigger_struct)
{
	trigger = self;
	activator = trigger_struct.activator;
	elevator = trigger.elevator;
	activator gestures::function_56e00fbf("gestable_door_interact", undefined, 0);
	elevator_move(elevator);
}

/*
	Name: function_31042f91
	Namespace: namespace_2f51db47
	Checksum: 0xBC888417
	Offset: 0x1CC8
	Size: 0xCC
	Parameters: 3
	Flags: None
*/
function function_31042f91(activator, laststate, state)
{
	if(isdefined(self.target))
	{
		position = struct::get(self.target, "targetname");
		elevator = getent(position.target, "targetname");
		if(is_true(elevator.moving))
		{
			elevator waittill(#"movedone");
		}
		elevator_move(elevator);
	}
}

