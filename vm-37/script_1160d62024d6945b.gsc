#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_d0eacb0d;

/*
	Name: function_89f2df9
	Namespace: namespace_d0eacb0d
	Checksum: 0xE78ED4CF
	Offset: 0x98
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_dd05779fff7e75f", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d0eacb0d
	Checksum: 0x862C5074
	Offset: 0xF0
	Size: 0xDC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(currentsessionmode() != 4 && getgametypesetting(#"hash_435c853b64e3175e") === 1)
	{
		level.var_9fd4b8f = spawnstruct();
		level.var_9fd4b8f.vehicles = [];
		level.var_10e55912 = getgametypesetting(#"hash_3cc3acd830a8eef") === 1;
		callback::on_vehicle_killed(&on_vehicle_killed);
		level thread function_7955100c();
	}
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_d0eacb0d
	Checksum: 0x80F724D1
	Offset: 0x1D8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: on_vehicle_killed
	Namespace: namespace_d0eacb0d
	Checksum: 0xFD81D6A7
	Offset: 0x1E8
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function on_vehicle_killed(params)
{
	if(isdefined(self.spawnindex))
	{
		level.var_9fd4b8f.vehicles[self.spawnindex].alive = 0;
		level.var_9fd4b8f.vehicles[self.spawnindex].var_93438377 = gettime();
	}
}

/*
	Name: function_b604ec09
	Namespace: namespace_d0eacb0d
	Checksum: 0xD04C9B4F
	Offset: 0x258
	Size: 0xF8
	Parameters: 6
	Flags: Linked, Private
*/
function private function_b604ec09(vehicletype, spawnpos, spawnangles, spawncallback, params, count)
{
	var_1957bf22 = spawnstruct();
	var_1957bf22.var_e7f51a60 = count;
	var_1957bf22.spawncount = 0;
	var_1957bf22.spawnpos = spawnpos;
	var_1957bf22.spawnangles = spawnangles;
	var_1957bf22.vehicletype = vehicletype;
	var_1957bf22.spawncallback = spawncallback;
	var_1957bf22.params = params;
	var_1957bf22.index = level.var_9fd4b8f.vehicles.size;
	var_1957bf22.alive = 1;
	level.var_9fd4b8f.vehicles[level.var_9fd4b8f.vehicles.size] = var_1957bf22;
	return var_1957bf22;
}

/*
	Name: function_f7bb1527
	Namespace: namespace_d0eacb0d
	Checksum: 0x72F33FA8
	Offset: 0x358
	Size: 0xAA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f7bb1527(var_1957bf22, vehicle)
{
	var_1957bf22.respawntime = function_f77a9b1b(vehicle);
	var_1957bf22.timeouttime = function_e674d71a(vehicle);
	var_1957bf22.radius = vehicle.radius;
	var_1957bf22.origin = vehicle.origin;
	var_1957bf22.angles = vehicle.angles;
	var_1957bf22.center = vehicle getboundsmidpoint();
	var_1957bf22.halfsize = vehicle getboundshalfsize();
}

/*
	Name: function_585a895b
	Namespace: namespace_d0eacb0d
	Checksum: 0xC77CA81F
	Offset: 0x410
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_585a895b()
{
	count = 0;
	infinitespawn = 0;
	spawnflags = self.spawnflags;
	if(isdefined(spawnflags))
	{
		infinitespawn = spawnflags & 64;
	}
	if(self.count && !infinitespawn)
	{
		count = self.count;
	}
}

/*
	Name: function_711f53df
	Namespace: namespace_d0eacb0d
	Checksum: 0x448CD1C3
	Offset: 0x488
	Size: 0xF6
	Parameters: 5
	Flags: Linked
*/
function function_711f53df(vehicletype, spawnpos, spawnangles, spawncallback, params)
{
	self endon(#"death");
	if(isdefined(level.var_9fd4b8f.vehicles))
	{
		wait(1);
		if(!isdefined(self.spawnindex))
		{
			count = self function_585a895b();
			var_1957bf22 = function_b604ec09(vehicletype, spawnpos, spawnangles, spawncallback, params, count);
			var_1957bf22.vehicle = self;
			function_f7bb1527(var_1957bf22, var_1957bf22.vehicle);
			self.spawnindex = var_1957bf22.index;
		}
	}
}

/*
	Name: function_f863c07e
	Namespace: namespace_d0eacb0d
	Checksum: 0xC8614515
	Offset: 0x588
	Size: 0x112
	Parameters: 5
	Flags: Linked
*/
function function_f863c07e(vehicletype, spawnpos, spawnangles, spawncallback, params)
{
	if(isdefined(level.var_9fd4b8f.vehicles))
	{
		count = self function_585a895b();
		var_1957bf22 = function_b604ec09(vehicletype, spawnpos, spawnangles, spawncallback, params, count);
		var_1957bf22.vehicle = spawn_vehicle(vehicletype, spawnpos, spawnangles, var_1957bf22.index, spawncallback, params);
		var_1957bf22.spawncount++;
		function_f7bb1527(var_1957bf22, var_1957bf22.vehicle);
		return var_1957bf22.vehicle;
	}
	return spawn_vehicle(vehicletype, spawnpos, spawnangles, undefined, spawncallback, params);
}

/*
	Name: spawn_vehicle
	Namespace: namespace_d0eacb0d
	Checksum: 0xA506BCD9
	Offset: 0x6A8
	Size: 0x13A
	Parameters: 6
	Flags: Linked, Private
*/
function private spawn_vehicle(vehicletype, spawnpos, spawnangles, index, callback, params)
{
	if(isdefined(params.var_45e1ab0))
	{
		var_23eccda7 = params.var_45e1ab0.var_23eccda7;
		var_389eb4d4 = params.var_45e1ab0.var_389eb4d4;
		var_6900386f = params.var_45e1ab0.var_6900386f;
		vehicle = spawnvehicle(vehicletype, spawnpos, spawnangles, undefined, 0, undefined, var_23eccda7, var_389eb4d4, var_6900386f);
	}
	else
	{
		vehicle = spawnvehicle(vehicletype, spawnpos, spawnangles);
	}
	/#
		assert(isdefined(vehicle));
	#/
	if(isdefined(vehicle))
	{
		if(isdefined(callback))
		{
			[[callback]](vehicle, params);
		}
		vehicle.spawnindex = index;
	}
	return vehicle;
}

/*
	Name: function_a20b03ed
	Namespace: namespace_d0eacb0d
	Checksum: 0xC87B4C8B
	Offset: 0x7F0
	Size: 0x310
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a20b03ed(vs)
{
	if(vs.alive)
	{
		return false;
	}
	if(!vs.respawntime)
	{
		return false;
	}
	if(isdefined(vs.var_e7f51a60) && vs.spawncount >= vs.var_e7f51a60)
	{
		return false;
	}
	time = gettime();
	if(time < vs.var_93438377 + vs.respawntime)
	{
		return false;
	}
	if(isdefined(vs.vehicle))
	{
		vs.vehicle delete();
	}
	ents = getentitiesinradius(vs.origin, vs.radius);
	if(ents.size > 0)
	{
		/#
		#/
		foreach(ent in ents)
		{
			if(!isdefined(ent.model))
			{
				continue;
			}
			if(ent.model == #"")
			{
				continue;
			}
			var_84c67202 = ent getboundsmidpoint();
			var_59485761 = ent getboundshalfsize();
			if(function_ecdf9b24(vs.origin + vs.center, vs.angles, vs.halfsize, ent.origin + var_84c67202, ent.angles, var_59485761))
			{
				/#
					if(getdvarint(#"hash_67f18c2de587c7d3", 0))
					{
						box(vs.origin + vs.center, vs.halfsize * -1, vs.halfsize, vs.angles, (1, 0, 0), 1, 0, 25);
						box(ent.origin + var_84c67202, var_59485761 * -1, var_59485761, ent.angles, (1, 0, 0), 1, 0, 25);
					}
				#/
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_6b4b0313
	Namespace: namespace_d0eacb0d
	Checksum: 0x1DBA9123
	Offset: 0xB08
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_6b4b0313(vs)
{
	time = gettime();
	if(function_a20b03ed(vs))
	{
		thread respawn_vehicle(vs);
	}
}

/*
	Name: respawn_vehicle
	Namespace: namespace_d0eacb0d
	Checksum: 0x8378FDB0
	Offset: 0xB58
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function respawn_vehicle(vs)
{
	vs.alive = 1;
	util::wait_network_frame();
	vs.vehicle = spawn_vehicle(vs.vehicletype, vs.spawnpos, vs.spawnangles, vs.index, vs.spawncallback, vs.params);
	vs.spawncount++;
}

/*
	Name: function_ef4c0e24
	Namespace: namespace_d0eacb0d
	Checksum: 0x2058015E
	Offset: 0xBE0
	Size: 0x1A6
	Parameters: 1
	Flags: Linked
*/
function function_ef4c0e24(vehicle)
{
	pixbeginevent();
	players = vehicle getvehoccupants();
	if(players.size > 0)
	{
		pixendevent();
		return 1;
	}
	players = getentitiesinradius(vehicle.origin, 150, 1);
	if(players.size > 0)
	{
		pixendevent();
		return 1;
	}
	players = getentitiesinradius(vehicle.origin, 1000, 1);
	foreach(player in players)
	{
		direction = vehicle.origin - player.origin;
		dir = vectornormalize(direction);
		forward = anglestoforward(player.angles);
		if(vectordot(forward, dir) > 0.707)
		{
			pixendevent();
			return 1;
		}
	}
	pixendevent();
	return 0;
}

/*
	Name: function_ef45a8f4
	Namespace: namespace_d0eacb0d
	Checksum: 0x17C4CDB3
	Offset: 0xD98
	Size: 0x158
	Parameters: 1
	Flags: Linked
*/
function function_ef45a8f4(vs)
{
	if(!level.var_10e55912)
	{
		return false;
	}
	if(!vs.alive)
	{
		return false;
	}
	if(!vs.timeouttime)
	{
		return false;
	}
	vehicle = vs.vehicle;
	if(!isdefined(vehicle))
	{
		return false;
	}
	if(!isvehicle(vehicle))
	{
		return false;
	}
	if(!isdefined(vehicle.var_4a479473))
	{
		return false;
	}
	if(distancesquared(vehicle.origin, vs.spawnpos) < 36864)
	{
		return false;
	}
	time = gettime();
	if(!isdefined(vehicle.var_70ad8a9e) || function_ef4c0e24(vehicle))
	{
		vehicle.var_70ad8a9e = time;
	}
	occupants = vehicle getvehoccupants();
	if(isdefined(occupants) && occupants.size)
	{
		return false;
	}
	if(vs.timeouttime + vehicle.var_70ad8a9e > time)
	{
		return false;
	}
	return true;
}

/*
	Name: function_6ecd8f13
	Namespace: namespace_d0eacb0d
	Checksum: 0x1022629B
	Offset: 0xEF8
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_6ecd8f13(vs)
{
	if(function_ef45a8f4(vs))
	{
		vs.vehicle on_vehicle_killed();
		vs.vehicle delete();
	}
}

/*
	Name: function_7955100c
	Namespace: namespace_d0eacb0d
	Checksum: 0x33F0D21E
	Offset: 0xF60
	Size: 0x182
	Parameters: 0
	Flags: Linked
*/
function function_7955100c()
{
	while(true)
	{
		if(isdefined(level.var_9fd4b8f) && isdefined(level.var_9fd4b8f.vehicles))
		{
			vehiclecount = level.var_9fd4b8f.vehicles.size;
			var_cefe19ce = int(vehiclecount * (float(function_60d95f53()) / 1000));
			count = 0;
			foreach(vs in level.var_9fd4b8f.vehicles)
			{
				count++;
				function_6b4b0313(vs);
				function_6ecd8f13(vs);
				if(var_cefe19ce > 0 && !count % var_cefe19ce)
				{
					waitframe(1);
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_2265d46b
	Namespace: namespace_d0eacb0d
	Checksum: 0xAED24AB1
	Offset: 0x10F0
	Size: 0xCA
	Parameters: 1
	Flags: None
*/
function function_2265d46b(deathmodel)
{
	if(isdefined(self.spawnindex))
	{
		/#
			assert(isdefined(level.var_9fd4b8f));
		#/
		/#
			assert(isdefined(level.var_9fd4b8f.vehicles));
		#/
		/#
			assert(isdefined(level.var_9fd4b8f.vehicles[self.spawnindex]));
		#/
		deathmodel.spawnindex = self.spawnindex;
		level.var_9fd4b8f.vehicles[self.spawnindex].vehicle = deathmodel;
	}
}

/*
	Name: function_e674d71a
	Namespace: namespace_d0eacb0d
	Checksum: 0x96064CE7
	Offset: 0x11C8
	Size: 0x46A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e674d71a(vehicle)
{
	respawntime = 60;
	if(isdefined(vehicle.scriptvehicletype))
	{
		switch(vehicle.scriptvehicletype)
		{
			case "player_atv":
			{
				respawntime = getgametypesetting(#"hash_25d72112144c5ea0");
				break;
			}
			case "player_tank":
			{
				respawntime = getgametypesetting(#"hash_4725de6afe873b87");
				break;
			}
			case "helicopter_light":
			{
				respawntime = getgametypesetting(#"hash_7f190c8839d3f05c");
				break;
			}
			case "helicopter_heavy":
			{
				respawntime = getgametypesetting(#"hash_4f00f3f568c284af");
				break;
			}
			case "hash_2212824fabcc986c":
			{
				respawntime = getgametypesetting(#"hash_7d53c8bab3db8122");
				break;
			}
			case "hash_1aa3be97c5bfcefa":
			case "player_motorcycle":
			{
				respawntime = getgametypesetting(#"hash_b30022a9302a5a6");
				break;
			}
			case "player_fav":
			{
				respawntime = getgametypesetting(#"hash_28005bb885acabc3");
				break;
			}
			case "hash_5115ee7eff718e37":
			{
				respawntime = getgametypesetting(#"hash_3eeb8cb5c84b1939");
				break;
			}
			case "hash_65231a254dac5391":
			{
				respawntime = getgametypesetting(#"hash_3d5a87878a3bef28");
				break;
			}
			case "cargo_truck_wz":
			{
				respawntime = getgametypesetting(#"hash_4201d2890785fb14");
				break;
			}
			case "player_hemtt":
			{
				respawntime = getgametypesetting(#"hash_22c53ddb2cb67f13");
				break;
			}
			case "hash_5899c013879294b7":
			{
				respawntime = getgametypesetting(#"hash_39cfd81268504039");
				break;
			}
			case "tactical_raft_wz":
			case "hash_60773cb8e1d97f62":
			{
				respawntime = getgametypesetting(#"hash_53fd9a3e9a0e78e1");
				break;
			}
			case "player_muscle":
			{
				respawntime = getgametypesetting(#"hash_5f116b8cfbdbc3fe");
				break;
			}
			case "player_suv":
			{
				respawntime = getgametypesetting(#"hash_208071125a2b0b0b");
				break;
			}
			case "hash_2d53e3136f122763":
			{
				respawntime = getgametypesetting(#"hash_52ef5b12764c8139");
				break;
			}
			case "hash_22256eb7a0eb3611":
			{
				respawntime = getgametypesetting(#"hash_76f686986e1a58b");
				break;
			}
			default:
			{
				break;
			}
		}
	}
	/#
		assert(isdefined(respawntime));
	#/
	return int(respawntime * 1000);
}

/*
	Name: function_f77a9b1b
	Namespace: namespace_d0eacb0d
	Checksum: 0x762E2F4
	Offset: 0x1640
	Size: 0x4BA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f77a9b1b(vehicle)
{
	/#
		if(getdvarint(#"hash_91ed3579d86e71", 0) > 0)
		{
			return int(1 * 1000);
		}
	#/
	respawntime = 0;
	if(isdefined(vehicle.scriptvehicletype))
	{
		switch(vehicle.scriptvehicletype)
		{
			case "player_atv":
			{
				respawntime = getgametypesetting(#"hash_42b840c668fd2c85");
				break;
			}
			case "player_tank":
			{
				respawntime = getgametypesetting(#"hash_46f0ae82f5c2f7d4");
				break;
			}
			case "helicopter_light":
			{
				respawntime = getgametypesetting(#"hash_2a02614601829003");
				break;
			}
			case "helicopter_heavy":
			{
				respawntime = getgametypesetting(#"hash_5598d36d6b224c9a");
				break;
			}
			case "hash_2212824fabcc986c":
			{
				respawntime = getgametypesetting(#"hash_7353bbc24d72ec59");
				break;
			}
			case "hash_1aa3be97c5bfcefa":
			case "player_motorcycle":
			{
				respawntime = getgametypesetting(#"hash_5a4fde688cbf1a01");
				break;
			}
			case "player_fav":
			{
				respawntime = getgametypesetting(#"hash_6b2754246df1bc7c");
				break;
			}
			case "hash_5115ee7eff718e37":
			{
				respawntime = getgametypesetting(#"hash_6773166f56896564");
				break;
			}
			case "hash_65231a254dac5391":
			{
				respawntime = getgametypesetting(#"hash_54d908d6273c8893");
				break;
			}
			case "cargo_truck_wz":
			{
				respawntime = getgametypesetting(#"hash_1974892bc7266bab");
				break;
			}
			case "player_hemtt":
			{
				respawntime = getgametypesetting(#"hash_273d049136c76afa");
				break;
			}
			case "hash_5899c013879294b7":
			{
				respawntime = getgametypesetting(#"hash_44f0b1c6b2d3b6f8");
				break;
			}
			case "tactical_raft_wz":
			case "hash_60773cb8e1d97f62":
			{
				respawntime = getgametypesetting(#"hash_56f6d77da3124af2");
				break;
			}
			case "player_muscle":
			{
				respawntime = getgametypesetting(#"hash_7c33e5bebaf05afb");
				break;
			}
			case "player_suv":
			{
				respawntime = getgametypesetting(#"hash_5dc620c6c0919d82");
				break;
			}
			case "hash_2d53e3136f122763":
			{
				respawntime = getgametypesetting(#"hash_2aea36c6a4135574");
				break;
			}
			case "hash_22256eb7a0eb3611":
			{
				respawntime = getgametypesetting(#"hash_38a8f601ab8388d0");
				break;
			}
			default:
			{
				break;
			}
		}
	}
	/#
		assert(isdefined(respawntime));
	#/
	return int(respawntime * 1000);
}

