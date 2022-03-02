#using script_4108035fe400ce67;
#using script_8988fdbc78d6c53;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_e9082b55;

/*
	Name: function_2718f686
	Namespace: namespace_e9082b55
	Checksum: 0x2E46B80B
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2718f686()
{
	level notify(133945139);
}

/*
	Name: function_89f2df9
	Namespace: namespace_e9082b55
	Checksum: 0x9152B02F
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5b407861db3825b2", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e9082b55
	Checksum: 0x783E9D2D
	Offset: 0x130
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level thread _cleanup();
}

/*
	Name: _cleanup
	Namespace: namespace_e9082b55
	Checksum: 0x7DE46208
	Offset: 0x158
	Size: 0x234
	Parameters: 0
	Flags: Linked, Private
*/
function private _cleanup()
{
	level flag::wait_till(#"hash_38a387462f3a9ad");
	var_ce255078 = array(&function_b465b436, &function_35e11623, &function_b7c5f376, &function_6ef5c287, &function_ada16428);
	var_314770d8 = array(&function_a534560c);
	while(true)
	{
		if(death_circle::is_active())
		{
			foreach(func in var_ce255078)
			{
				util::wait_network_frame(1);
				[[func]](death_circle::function_b980b4ca(), death_circle::function_f8dae197(), death_circle::function_e32d74d8(), death_circle::function_3009b78f());
			}
		}
		foreach(func in var_314770d8)
		{
			util::wait_network_frame(1);
			[[func]]();
		}
		wait(1);
	}
}

/*
	Name: function_a534560c
	Namespace: namespace_e9082b55
	Checksum: 0x1864CDE2
	Offset: 0x398
	Size: 0x2DC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a534560c()
{
	if(!isdefined(level.var_a4a4012e))
	{
		return;
	}
	var_4d4bb0da = arraycopy(level.var_a4a4012e);
	time = gettime();
	foreach(dropitem in var_4d4bb0da)
	{
		if(!isdefined(dropitem))
		{
			continue;
		}
		if(is_true(dropitem.spawning))
		{
			continue;
		}
		supplydrop = dropitem getlinkedent();
		if(isdefined(supplydrop))
		{
			var_da05d0b2 = supplydrop getlinkedent();
			if(isdefined(var_da05d0b2) && is_true(var_da05d0b2.var_5d0810d7))
			{
				continue;
			}
		}
		if(!isdefined(dropitem.droptime))
		{
			continue;
		}
		if(isdefined(dropitem.var_a6762160.droptimeout) && dropitem.var_a6762160.droptimeout > 0)
		{
			var_e12c37ee = (float(time - dropitem.droptime)) / 1000;
			if(var_e12c37ee >= dropitem.var_a6762160.droptimeout)
			{
				item_world::function_7730442c(dropitem, 1);
				waitframe(1);
				time = gettime();
				continue;
			}
			if(isdefined(dropitem.var_a6762160.var_68c62574) && dropitem.var_a6762160.var_68c62574 > 0 && var_e12c37ee >= (dropitem.var_a6762160.droptimeout - dropitem.var_a6762160.var_68c62574))
			{
				dropitem clientfield::set("dynamic_item_timing_out", 1);
			}
		}
	}
	arrayremovevalue(level.var_a4a4012e, undefined, 1);
	arrayremovevalue(level.var_18dc9d17, undefined, 1);
}

/*
	Name: function_b465b436
	Namespace: namespace_e9082b55
	Checksum: 0xA05269DC
	Offset: 0x680
	Size: 0x134
	Parameters: 4
	Flags: Linked, Private
*/
function private function_b465b436(current_origin, var_c5a0bed8, previous_origin, var_7c597200)
{
	if(!isdefined(level.var_ace9fb52))
	{
		return;
	}
	var_3aeceeac = arraycopy(level.var_ace9fb52);
	foreach(var_4961f577 in var_3aeceeac)
	{
		if(!isdefined(var_4961f577))
		{
			continue;
		}
		if(function_3703bc36(var_4961f577, previous_origin, var_7c597200, 1))
		{
			var_4961f577 delete();
			waitframe(1);
		}
	}
	arrayremovevalue(level.var_ace9fb52, undefined, 0);
}

/*
	Name: function_35e11623
	Namespace: namespace_e9082b55
	Checksum: 0xFD9F7102
	Offset: 0x7C0
	Size: 0x690
	Parameters: 4
	Flags: Linked, Private
*/
function private function_35e11623(current_origin, var_c5a0bed8, previous_origin, var_7c597200)
{
	players = getplayers();
	excludelist = [#"willy_pete":1, #"frag_grenade":1, #"hash_c78156ba6aeda14":1, #"eq_swat_grenade":1, #"eq_slow_grenade":1, #"eq_molotov":1, #"eq_cluster_semtex_grenade":1, #"eq_acid_bomb":1];
	foreach(player in players)
	{
		if(!isplayer(player))
		{
			continue;
		}
		if(!isarray(player.weaponobjectwatcherarray))
		{
			continue;
		}
		foreach(var_b5645d79 in player.weaponobjectwatcherarray)
		{
			if(!isdefined(var_b5645d79) || !isarray(var_b5645d79.objectarray))
			{
				continue;
			}
			for(index = 0; index < var_b5645d79.objectarray.size; index++)
			{
				object = var_b5645d79.objectarray[index];
				if(function_3703bc36(object, previous_origin, var_7c597200))
				{
					if(isdefined(object.weapon))
					{
						weapon = object.weapon;
						if(isdefined(excludelist[weapon.name]))
						{
							continue;
						}
						if(weapon.name == #"hatchet" || weapon.name == #"tomahawk_t8")
						{
							velocity = object getvelocity();
							if(velocity[0] > 0 || velocity[1] > 0 || velocity[2])
							{
								continue;
							}
						}
						var_b5645d79 thread weaponobjects::waitanddetonate(object, 0);
					}
					if(isdefined(object) && !is_true(object.detonated))
					{
						object kill();
						if(isdefined(object))
						{
							object delete();
						}
					}
				}
			}
			arrayremovevalue(var_b5645d79.objectarray, undefined, 0);
		}
		waitframe(1);
	}
	if(isdefined(level.var_2e06b76a))
	{
		var_a5a016fc = [];
		foreach(tripwire in level.tripwires)
		{
			if(function_3703bc36(tripwire, previous_origin, var_7c597200))
			{
				var_a5a016fc[var_a5a016fc.size] = tripwire;
			}
		}
		for(index = 0; index < var_a5a016fc.size; index++)
		{
			var_a5a016fc[index] [[level.var_2e06b76a]]();
		}
	}
	if(isdefined(level.var_7c5c96dc))
	{
		var_90afc439 = [];
		foreach(monkey in level.var_7d95e1ed)
		{
			if(isdefined(monkey) && function_3703bc36(monkey, previous_origin, var_7c597200))
			{
				var_90afc439[var_90afc439.size] = monkey;
			}
		}
		for(index = 0; index < var_90afc439.size; index++)
		{
			var_90afc439[index] [[level.var_7c5c96dc]]();
		}
	}
	if(isdefined(level.var_cc310d06))
	{
		var_2e20127d = [];
		foreach(var_48ad08f5 in level.var_2da60c10)
		{
			if(isdefined(var_48ad08f5) && function_3703bc36(var_48ad08f5, previous_origin, var_7c597200))
			{
				var_2e20127d[var_2e20127d.size] = var_48ad08f5;
			}
		}
		for(index = 0; index < var_2e20127d.size; index++)
		{
			var_2e20127d[index] [[level.var_cc310d06]]();
		}
	}
}

/*
	Name: function_b7c5f376
	Namespace: namespace_e9082b55
	Checksum: 0x372E7E1F
	Offset: 0xE58
	Size: 0x20C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_b7c5f376(current_origin, var_c5a0bed8, previous_origin, var_7c597200)
{
	if(!isdefined(level.var_a4a4012e))
	{
		return;
	}
	var_4d4bb0da = arraycopy(level.var_a4a4012e);
	foreach(dropitem in var_4d4bb0da)
	{
		if(!isdefined(dropitem))
		{
			continue;
		}
		if(is_true(dropitem.spawning))
		{
			continue;
		}
		supplydrop = dropitem getlinkedent();
		if(isdefined(supplydrop))
		{
			var_da05d0b2 = supplydrop getlinkedent();
			if(isdefined(var_da05d0b2) && is_true(var_da05d0b2.var_5d0810d7))
			{
				continue;
			}
		}
		if(function_3703bc36(dropitem, previous_origin, var_7c597200, 1))
		{
			dropitem.var_8e092725 = gettime();
			item_world::function_a54d07e6(dropitem, undefined);
			dropitem delete();
			waitframe(1);
		}
	}
	arrayremovevalue(level.var_a4a4012e, undefined, 1);
	arrayremovevalue(level.var_18dc9d17, undefined, 1);
}

/*
	Name: function_6ef5c287
	Namespace: namespace_e9082b55
	Checksum: 0xB9FB9169
	Offset: 0x1070
	Size: 0x17C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_6ef5c287(current_origin, var_c5a0bed8, previous_origin, var_7c597200)
{
	if(!isdefined(level.var_a5f063d))
	{
		return;
	}
	var_b76aef06 = arraycopy(level.var_a5f063d);
	foreach(supplydrop in var_b76aef06)
	{
		if(!isdefined(supplydrop))
		{
			continue;
		}
		if(isdefined(supplydrop.var_b2513722))
		{
			continue;
		}
		if(function_3703bc36(supplydrop, previous_origin, var_7c597200, 1))
		{
			supplydrop clientfield::set("supply_drop_fx", 0);
			util::wait_network_frame(1);
			supplydrop delete();
			waitframe(1);
		}
	}
	arrayremovevalue(level.var_a5f063d, undefined, 0);
}

/*
	Name: function_ada16428
	Namespace: namespace_e9082b55
	Checksum: 0xB93D4B13
	Offset: 0x11F8
	Size: 0x584
	Parameters: 4
	Flags: Linked, Private
*/
function private function_ada16428(current_origin, var_c5a0bed8, previous_origin, var_7c597200)
{
	if(!isdefined(level.var_63e0085))
	{
		return;
	}
	time = gettime();
	if(time < level.var_63e0085)
	{
		return;
	}
	if(!isdefined(level.var_cd8f416a) || level.var_cd8f416a.size == 0)
	{
		return;
	}
	level.var_63e0085 = time + 10000;
	count = 0;
	var_3624d2c5 = 10;
	/#
		deleted = 0;
	#/
	time = gettime();
	foreach(vehicle in level.var_cd8f416a)
	{
		if(!isdefined(vehicle))
		{
			continue;
		}
		if(isvehicle(vehicle) && vehicle function_213a12e4())
		{
			continue;
		}
		if(function_3703bc36(vehicle, previous_origin, var_7c597200, 1))
		{
			if(!isdefined(vehicle.var_a6b3cbdc))
			{
				delay = 60000;
				if(isdefined(vehicle.var_8e382c5f))
				{
					delay = delay + 300000;
				}
				vehicle.var_a6b3cbdc = time + delay;
			}
			if(vehicle.var_a6b3cbdc > time)
			{
				continue;
			}
			safedelete = 1;
			foreach(player in level.deathcircle.players)
			{
				if(!isdefined(player) || !isalive(player))
				{
					continue;
				}
				var_6287b00e = distance2dsquared(vehicle.origin, player.origin);
				if(var_6287b00e < sqr(10000))
				{
					safedelete = 0;
					break;
				}
				var_42beec1c = (previous_origin[0] - player.origin[0], previous_origin[1] - player.origin[1], 0);
				var_42beec1c = vectornormalize(var_42beec1c);
				var_838d27e = (vehicle.origin[0] - player.origin[0], vehicle.origin[1] - player.origin[1], 0);
				var_838d27e = vectornormalize(var_838d27e);
				if(vectordot(var_42beec1c, var_838d27e) >= 0.9396)
				{
					var_c64c4a1f = distance2dsquared(vehicle.origin, player.origin);
					var_f25c153c = distance2dsquared(player.origin, previous_origin);
					if(var_c64c4a1f < var_f25c153c)
					{
						safedelete = 0;
						break;
					}
				}
			}
			if(safedelete)
			{
				/#
					if(getdvarint(#"hash_55e8ad2b1d030870", 0))
					{
						iprintlnbold((("" + vehicle.scriptvehicletype) + "") + vehicle.origin);
					}
					deleted++;
				#/
				vehicle delete();
			}
		}
		count++;
		if((count % var_3624d2c5) == 0)
		{
			util::wait_network_frame(1);
		}
	}
	arrayremovevalue(level.var_cd8f416a, undefined, 0);
	/#
		if(getdvarint(#"hash_55e8ad2b1d030870", 0) && deleted > 0)
		{
			iprintlnbold((("" + level.var_cd8f416a.size) + "") + deleted);
		}
	#/
}

/*
	Name: function_213a12e4
	Namespace: namespace_e9082b55
	Checksum: 0x61CA7509
	Offset: 0x1788
	Size: 0x86
	Parameters: 0
	Flags: Linked, Private
*/
function private function_213a12e4()
{
	b_occupied = 0;
	for(i = 0; i < 4; i++)
	{
		if(self function_dcef0ba1(i))
		{
			if(self isvehicleseatoccupied(i))
			{
				b_occupied = 1;
				break;
			}
			continue;
		}
		break;
	}
	return b_occupied;
}

/*
	Name: function_3703bc36
	Namespace: namespace_e9082b55
	Checksum: 0x3472A98B
	Offset: 0x1818
	Size: 0xAC
	Parameters: 4
	Flags: Linked, Private
*/
function private function_3703bc36(entity, origin, radius, var_7e2f7f1f)
{
	if(!isdefined(var_7e2f7f1f))
	{
		var_7e2f7f1f = 0;
	}
	if(!isdefined(entity) || !isdefined(origin) || !isdefined(radius))
	{
		return 0;
	}
	var_be38b475 = (var_7e2f7f1f ? 5000 : 0);
	return distance2dsquared(entity.origin, origin) >= (sqr(radius + var_be38b475));
}

