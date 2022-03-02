#using script_16b1b77a76492c6a;
#using script_3f9e0dc8454d98e1;
#using script_7fc996fe8678852;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_e51c1e80;

/*
	Name: function_697bd9b1
	Namespace: namespace_e51c1e80
	Checksum: 0x3629D781
	Offset: 0x288
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_697bd9b1()
{
	level notify(380052246);
}

/*
	Name: function_89f2df9
	Namespace: namespace_e51c1e80
	Checksum: 0x180DC938
	Offset: 0x2A8
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4713d315c3e40cdc", &function_70a657d8, undefined, &finalize, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_e51c1e80
	Checksum: 0x13546E78
	Offset: 0x308
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	namespace_8b6a9d79::function_b3464a7c(#"hash_42f3e9628d7a7b24", &vehicle_spawn);
	callback::on_vehicle_killed(&function_483f7f18);
	hidemiscmodels("static_car");
}

/*
	Name: finalize
	Namespace: namespace_e51c1e80
	Checksum: 0x80F724D1
	Offset: 0x380
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private finalize()
{
}

/*
	Name: function_483f7f18
	Namespace: namespace_e51c1e80
	Checksum: 0xAAE623B0
	Offset: 0x390
	Size: 0x372
	Parameters: 1
	Flags: Linked
*/
function function_483f7f18(params)
{
	if(isdefined(self))
	{
		a_ai_zombies = function_a38db454(self.origin, 500);
		v_org = self.origin;
	}
	if(!isdefined(a_ai_zombies) || !isdefined(v_org))
	{
		return;
	}
	for(i = 0; i < a_ai_zombies.size; i++)
	{
		if(!isalive(a_ai_zombies[i]) || !isactor(a_ai_zombies[i]))
		{
			continue;
		}
		if(a_ai_zombies[i].var_6f84b820 === #"normal")
		{
			if(distance2dsquared(self.origin, a_ai_zombies[i].origin) <= sqr(250))
			{
				if(isdefined(a_ai_zombies[i].var_94378ef))
				{
					a_ai_zombies[i] dodamage(abs(a_ai_zombies[i].health - a_ai_zombies[i].var_94378ef), self.origin);
				}
				else
				{
					self thread function_912eedf3(a_ai_zombies[i]);
				}
			}
			else
			{
				a_ai_zombies[i] thread knockdown_zombie(v_org);
			}
		}
		if(!a_ai_zombies[i].var_6f84b820 === #"normal")
		{
			entity = a_ai_zombies[i];
			/#
				if(!isdefined(entity.basehealth))
				{
					println("");
				}
			#/
			var_6348e344 = entity.maxhealth / (isdefined(entity.basehealth) ? entity.basehealth : 1);
			if(distance2dsquared(self.origin, entity.origin) <= sqr(250))
			{
				damage = int(750 * var_6348e344);
			}
			else
			{
				damage = int(375 * var_6348e344);
			}
			if(isdefined(entity.var_94378ef) && (entity.health - damage) <= entity.var_94378ef)
			{
				damage = abs(entity.health - entity.var_94378ef);
			}
			entity dodamage(damage, self.origin);
		}
		waitframe(1);
	}
}

/*
	Name: function_912eedf3
	Namespace: namespace_e51c1e80
	Checksum: 0x1560B463
	Offset: 0x710
	Size: 0x164
	Parameters: 1
	Flags: Linked
*/
function function_912eedf3(zombie)
{
	self endon(#"death");
	zombie endon(#"death");
	if(isdefined(zombie) && !is_true(zombie.var_a950813d) && zombie.var_6f84b820 === #"normal")
	{
		v_dir = vectornormalize(zombie.origin - self.origin);
		v_launch = (v_dir * randomintrange(10, 25)) + (0, 0, randomintrange(50, 100));
		zombie.allowdeath = 1;
		if(!zombie isragdoll())
		{
			zombie startragdoll();
			waitframe(2);
			zombie launchragdoll(v_launch);
		}
		zombie kill();
	}
}

/*
	Name: knockdown_zombie
	Namespace: namespace_e51c1e80
	Checksum: 0x9DA7596F
	Offset: 0x880
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function knockdown_zombie(v_org)
{
	self endon(#"death");
	if(isalive(self))
	{
		self dodamage(500, v_org, undefined, undefined, "none", "MOD_EXPLOSIVE");
		if(self.var_6f84b820 === #"normal")
		{
			self zombie_utility::setup_zombie_knockdown(v_org);
		}
		else if(self.var_6f84b820 === #"special" || self.var_6f84b820 === #"elite")
		{
			self ai::stun(2);
		}
	}
}

/*
	Name: vehicle_spawn
	Namespace: namespace_e51c1e80
	Checksum: 0xDE6EC720
	Offset: 0x970
	Size: 0x670
	Parameters: 1
	Flags: Linked
*/
function vehicle_spawn(s_instance)
{
	s_instance.var_2bb61e5b = 0;
	level flag::wait_till_clear(#"hash_6559e11da1f3a7cf");
	var_f6b6b97e = (isdefined(s_instance.var_fe2612fe[#"hash_402487319cc06a4c"]) ? s_instance.var_fe2612fe[#"hash_402487319cc06a4c"] : []);
	var_f6b6b97e = array::randomize(var_f6b6b97e);
	if(isdefined(s_instance.script_noteworthy))
	{
		s_instance.var_28f56db4 = [];
		s_instance.var_b550f3c3 = [];
		foreach(var_50b7449f in var_f6b6b97e)
		{
			s_instance.var_b550f3c3[var_50b7449f.script_int] = var_50b7449f;
		}
		var_8ebffad3 = int(s_instance.var_b550f3c3.size * 0.7);
		var_476999d6 = [];
		for(i = 0; i < s_instance.var_b550f3c3.size; i++)
		{
			var_476999d6[var_476999d6.size] = i + 1;
		}
		var_476999d6 = array::randomize(var_476999d6);
		var_7a436008 = [];
		for(i = 0; i < var_476999d6.size; i++)
		{
			var_7a436008[var_7a436008.size] = 0;
		}
		foreach(var_50b7449f in var_f6b6b97e)
		{
			for(i = 0; i < var_8ebffad3; i++)
			{
				if(var_50b7449f.script_int === var_476999d6[i] && var_7a436008[i] < 4)
				{
					vehicle = spawnvehicle(var_50b7449f.vehicletype, var_50b7449f.origin, var_50b7449f.angles, "sr_vehicle");
					if(isdefined(vehicle))
					{
						var_7a436008[i] = var_7a436008[i] + var_50b7449f.seats;
						if(!isdefined(s_instance.location.destination.a_vehicles))
						{
							s_instance.location.destination.a_vehicles = [];
						}
						else if(!isarray(s_instance.location.destination.a_vehicles))
						{
							s_instance.location.destination.a_vehicles = array(s_instance.location.destination.a_vehicles);
						}
						if(!isinarray(s_instance.location.destination.a_vehicles, vehicle))
						{
							s_instance.location.destination.a_vehicles[s_instance.location.destination.a_vehicles.size] = vehicle;
						}
						vehicle.v_org = vehicle.origin;
						vehicle.v_ang = vehicle.angles;
						vehicle thread function_17a3dc2f(s_instance);
					}
				}
			}
		}
	}
	else
	{
		foreach(var_50b7449f in var_f6b6b97e)
		{
			if(s_instance.var_2bb61e5b < 4)
			{
				vehicle = spawnvehicle(var_50b7449f.vehicletype, var_50b7449f.origin, var_50b7449f.angles, "sr_vehicle");
				if(isdefined(vehicle))
				{
					if(!isdefined(s_instance.location.destination.a_vehicles))
					{
						s_instance.location.destination.a_vehicles = [];
					}
					else if(!isarray(s_instance.location.destination.a_vehicles))
					{
						s_instance.location.destination.a_vehicles = array(s_instance.location.destination.a_vehicles);
					}
					if(!isinarray(s_instance.location.destination.a_vehicles, vehicle))
					{
						s_instance.location.destination.a_vehicles[s_instance.location.destination.a_vehicles.size] = vehicle;
					}
					vehicle.v_org = vehicle.origin;
					vehicle.v_ang = vehicle.angles;
					s_instance.var_2bb61e5b = s_instance.var_2bb61e5b + var_50b7449f.seats;
					vehicle thread function_17a3dc2f(s_instance);
				}
			}
		}
	}
}

/*
	Name: spawn_vehicles
	Namespace: namespace_e51c1e80
	Checksum: 0x89F8B64D
	Offset: 0xFE8
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function spawn_vehicles(destination)
{
	foreach(s_location in destination.locations)
	{
		s_instance = s_location.instances[#"hash_42f3e9628d7a7b24"];
		if(isdefined(s_instance))
		{
			namespace_8b6a9d79::function_20d7e9c7(s_instance);
		}
	}
}

/*
	Name: function_c772bd2c
	Namespace: namespace_e51c1e80
	Checksum: 0x771E3145
	Offset: 0x10B0
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_c772bd2c(destination)
{
	level flag::set(#"hash_6559e11da1f3a7cf");
	if(isdefined(destination.destination.a_vehicles))
	{
		foreach(vehicle in destination.destination.a_vehicles)
		{
			if(isdefined(vehicle))
			{
				vehicle delete();
				util::wait_network_frame();
			}
		}
	}
	level flag::clear(#"hash_6559e11da1f3a7cf");
}

/*
	Name: function_17a3dc2f
	Namespace: namespace_e51c1e80
	Checksum: 0xDC0050D
	Offset: 0x11C8
	Size: 0x2DC
	Parameters: 1
	Flags: Linked
*/
function function_17a3dc2f(s_instance)
{
	self makevehicleusable();
	if(!isdefined(s_instance.a_vehicles))
	{
		s_instance.a_vehicles = [];
	}
	else if(!isarray(s_instance.a_vehicles))
	{
		s_instance.a_vehicles = array(s_instance.a_vehicles);
	}
	s_instance.a_vehicles[s_instance.a_vehicles.size] = self;
	if(self.vehicletype === "vehicle_t9_mil_ru_truck_light_player" && (getdvarint(#"hash_11ff4ccbba6b40f6", 0) === 1 || math::cointoss(66)))
	{
		self thread function_cddedd63(#"hash_1fb3bec008c18436");
	}
	else
	{
		if(self.vehicletype === "vehicle_t9_mil_fav_light" && (getdvarint(#"hash_11ff4ccbba6b40f6", 0) === 1 || math::cointoss(50)))
		{
			if(math::cointoss(50))
			{
				v_rotate = vectorscale((0, -1, 0), 90);
				n_x_offset = 40;
			}
			else
			{
				v_rotate = vectorscale((0, 1, 0), 90);
				n_x_offset = -40;
			}
			self thread function_cddedd63(#"hash_43b6b22949e57424", v_rotate, n_x_offset);
		}
		else if(self.vehicletype === "vehicle_t9_civ_ru_sedan_80s_player" && (getdvarint(#"hash_11ff4ccbba6b40f6", 0) === 1 || math::cointoss(50)))
		{
			if(math::cointoss(50))
			{
				v_rotate = vectorscale((0, -1, 0), 90);
				n_x_offset = 40;
			}
			else
			{
				v_rotate = vectorscale((0, 1, 0), 90);
				n_x_offset = -40;
			}
			self thread function_cddedd63(#"hash_43b6b22949e57424", v_rotate, n_x_offset);
		}
	}
}

/*
	Name: function_724dafb1
	Namespace: namespace_e51c1e80
	Checksum: 0x1702B2C0
	Offset: 0x14B0
	Size: 0x468
	Parameters: 1
	Flags: None
*/
function function_724dafb1(destination)
{
	level flag::wait_till_clear(#"hash_6559e11da1f3a7cf");
	a_spawns = function_6465d1fa(destination);
	var_33ffcb09 = 0;
	foreach(spawn in a_spawns)
	{
		switch(spawn.targetname)
		{
			case "hash_c64614656e0182f":
			{
				var_22e1dc7 = "vehicle_t9_mil_fav_light";
				break;
			}
			case "hash_109832f363ee6abe":
			{
				var_22e1dc7 = "veh_boct_mil_jetski";
				break;
			}
			case "hash_1b7c5cdc7dca1887":
			{
				var_22e1dc7 = "vehicle_motorcycle_mil_us_offroad";
				break;
			}
			case "hash_6d89a26b51ebc12e":
			{
				var_22e1dc7 = "vehicle_boct_mil_boat_pbr";
				break;
			}
			case "hash_40c3b9ab556335b3":
			{
				var_22e1dc7 = "vehicle_t9_mil_snowmobile";
				break;
			}
			case "hash_307f829b4d3ea1de":
			{
				var_22e1dc7 = "vehicle_t9_mil_ru_truck_light_player";
				break;
			}
			default:
			{
				var_22e1dc7 = undefined;
				break;
			}
		}
		if(isdefined(var_22e1dc7) && function_e0a22931(var_22e1dc7))
		{
			vehicle = spawnvehicle(var_22e1dc7, spawn.origin, spawn.angles, "sr_vehicle");
			vehicle makevehicleusable();
			if(!isdefined(destination.a_vehicles))
			{
				destination.a_vehicles = [];
			}
			else if(!isarray(destination.a_vehicles))
			{
				destination.a_vehicles = array(destination.a_vehicles);
			}
			destination.a_vehicles[destination.a_vehicles.size] = vehicle;
			var_33ffcb09++;
			if(spawn.targetname === "mp_map_wide_uaz_spawn" && (getdvarint(#"hash_11ff4ccbba6b40f6", 0) === 1 || math::cointoss(66)))
			{
				vehicle thread function_cddedd63(#"hash_1fb3bec008c18436");
			}
			else if(spawn.targetname === "mp_map_wide_fav_spawn" && (getdvarint(#"hash_11ff4ccbba6b40f6", 0) === 1 || math::cointoss(50)))
			{
				if(math::cointoss(50))
				{
					v_rotate = vectorscale((0, -1, 0), 90);
					n_x_offset = 40;
				}
				else
				{
					v_rotate = vectorscale((0, 1, 0), 90);
					n_x_offset = -40;
				}
				vehicle thread function_cddedd63(#"hash_43b6b22949e57424", v_rotate, n_x_offset);
			}
			if(var_33ffcb09 > (a_spawns.size / 2) || getvehiclearray().size > 50)
			{
				return;
			}
			util::wait_network_frame();
		}
	}
}

/*
	Name: function_6465d1fa
	Namespace: namespace_e51c1e80
	Checksum: 0x3195F905
	Offset: 0x1920
	Size: 0x26A
	Parameters: 1
	Flags: Linked
*/
function function_6465d1fa(destination)
{
	triggers = [];
	if(!isdefined(destination.var_fe2612fe[#"hash_3460aae6bb799a99"]))
	{
		return [];
	}
	var_a91694c7 = function_de75fe06();
	foreach(struct in destination.var_fe2612fe[#"hash_3460aae6bb799a99"])
	{
		triggers[triggers.size] = getent(struct.targetname, "target");
	}
	a_spawns = [];
	if(isarray(triggers))
	{
		foreach(spawn in var_a91694c7)
		{
			var_dcb79cb0 = 0;
			foreach(trigger in triggers)
			{
				if(trigger istouching(spawn.origin))
				{
					var_dcb79cb0 = 1;
					break;
				}
			}
			if(!var_dcb79cb0)
			{
				continue;
			}
			a_spawns[a_spawns.size] = spawn;
		}
	}
	return array::randomize(a_spawns);
}

/*
	Name: function_de75fe06
	Namespace: namespace_e51c1e80
	Checksum: 0x62105034
	Offset: 0x1B98
	Size: 0x116
	Parameters: 0
	Flags: Linked, Private
*/
function private function_de75fe06()
{
	var_a91694c7 = [];
	var_86c74be8 = array("mp_map_wide_fav_spawn", "mp_map_wide_jetski_spawn", "mp_map_wide_motorcycle_spawn", "mp_map_wide_pbr_spawn", "mp_map_wide_snowmobile_spawn", "mp_map_wide_uaz_spawn");
	foreach(str_targetname in var_86c74be8)
	{
		a_points = function_91b29d2a(str_targetname);
		if(isdefined(a_points))
		{
			var_a91694c7 = arraycombine(var_a91694c7, a_points, 0, 0);
		}
	}
	return var_a91694c7;
}

/*
	Name: function_cddedd63
	Namespace: namespace_e51c1e80
	Checksum: 0x8B1B8A65
	Offset: 0x1CB8
	Size: 0x15C
	Parameters: 3
	Flags: Linked
*/
function function_cddedd63(var_1028910, v_angle_offset, n_x_offset)
{
	if(!isdefined(v_angle_offset))
	{
		v_angle_offset = (0, 0, 0);
	}
	self endon(#"death");
	wait(3);
	if(isdefined(n_x_offset))
	{
		v_origin_offset = anglestoright(self.angles) * n_x_offset;
	}
	else
	{
		v_origin_offset = (0, 0, 0);
	}
	trigger = spawn("trigger_radius", self.origin, 0, 400, 128);
	struct = spawnstruct();
	struct.origin = self.origin + v_origin_offset;
	struct.angles = self.angles + v_angle_offset;
	struct.var_90d0c0ff = var_1028910;
	trigger.vehicle = self;
	trigger.vehicle_position = self.origin;
	trigger.spawn_struct = struct;
	trigger callback::function_35a12f19(&namespace_2c949ef8::function_39ee3b21);
}

