#using script_7b68dad851540de;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_1a229754;

/*
	Name: function_9e2fe832
	Namespace: namespace_1a229754
	Checksum: 0x875012A
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9e2fe832()
{
	level notify(-373413425);
}

#namespace namespace_5cd4acd8;

/*
	Name: init_hunt_regions
	Namespace: namespace_5cd4acd8
	Checksum: 0x25E2A0F7
	Offset: 0x158
	Size: 0xCA
	Parameters: 0
	Flags: Linked
*/
function init_hunt_regions()
{
	if(!(isdefined(level.hunt_region_load) && isdefined(level.stealth.hunt_stealth_group_region_sets)))
	{
		level.hunt_region_load = spawnstruct();
		inithuntregiondata();
	}
	if(isdefined(level.stealth))
	{
		/#
			assert(isdefined(level.hunt_region_load) && isdefined(level.hunt_region_load.hunt_stealth_group_region_sets));
		#/
		level.stealth.hunt_stealth_group_region_sets = level.hunt_region_load.hunt_stealth_group_region_sets;
		level.hunt_region_load = undefined;
	}
}

/*
	Name: findnextpointofinterest
	Namespace: namespace_5cd4acd8
	Checksum: 0x65B53AC5
	Offset: 0x230
	Size: 0x386
	Parameters: 4
	Flags: Linked
*/
function findnextpointofinterest(curpos, region, var_5a990e80, var_939dd5a2)
{
	if(!isdefined(var_939dd5a2))
	{
		var_939dd5a2 = 1;
	}
	var_9a135fe4 = var_5a990e80;
	checkpos = curpos;
	dist = min(region.bfs_distance, 3);
	var_9da4df29 = 48 * (1 + dist);
	var_aea7aa5b = 84 * (1 + dist);
	while(var_939dd5a2 && var_9a135fe4 < region.route_points.size || (!var_939dd5a2 && var_9a135fe4 >= 0))
	{
		var_84ee6edd = region.route_points[var_9a135fe4].origin;
		var_9bf11123 = self smart_object::function_a49ba261(checkpos, var_84ee6edd, region, undefined, var_9da4df29, var_aea7aa5b, 0);
		if(isdefined(var_9bf11123))
		{
			var_640dd14c = checkpos;
			if(var_939dd5a2 && (var_9a135fe4 - 1) >= 0)
			{
				var_640dd14c = region.route_points[var_9a135fe4 - 1].origin;
			}
			else if(!var_939dd5a2 && (var_9a135fe4 + 1) < region.route_points.size)
			{
				var_640dd14c = region.route_points[var_9a135fe4 + 1].origin;
			}
			starttoend = var_84ee6edd - var_640dd14c;
			var_e15dea17 = length(starttoend);
			starttoend = starttoend / var_e15dea17;
			var_acb91842 = var_9a135fe4 == var_5a990e80 && (var_5a990e80 == 0 && var_939dd5a2 || (var_5a990e80 == region.route_points.size && !var_939dd5a2));
			result = [];
			result[0] = var_9bf11123;
			result[1] = var_9a135fe4;
			if(var_acb91842 || (vectordot(starttoend, var_9bf11123.origin - var_640dd14c)) > (var_e15dea17 - 24))
			{
				if(var_939dd5a2)
				{
					result[1] = var_9a135fe4 + 1;
				}
				else
				{
					result[1] = var_9a135fe4 - 1;
				}
			}
			return result;
		}
		var_c22264c1 = distance2d(checkpos, var_84ee6edd);
		var_9da4df29 = max(var_9da4df29 - var_c22264c1, 0);
		var_aea7aa5b = max(var_aea7aa5b - var_c22264c1, 0);
		checkpos = var_84ee6edd;
		if(var_939dd5a2)
		{
			var_9a135fe4++;
		}
		else
		{
			var_9a135fe4--;
		}
	}
}

/*
	Name: findcurposonroute
	Namespace: namespace_5cd4acd8
	Checksum: 0xDC16F00C
	Offset: 0x5C0
	Size: 0x280
	Parameters: 2
	Flags: Linked
*/
function findcurposonroute(curpos, route)
{
	var_6a605059 = route.size;
	bestscore = 0;
	var_747c2571 = -1;
	var_5a1a59a4 = -1;
	var_5b94af06 = 0;
	for(var_6bc1390 = 0; var_6bc1390 < var_6a605059; var_6bc1390++)
	{
		var_ae402dfe = (var_6bc1390 + 1) % var_6a605059;
		starttoend = route[var_ae402dfe].origin - route[var_6bc1390].origin;
		var_5e9b5f9f = length(starttoend);
		starttoend = starttoend / var_5e9b5f9f;
		var_4fbaae92 = curpos - route[var_6bc1390].origin;
		var_98883cf9 = vectordot(starttoend, var_4fbaae92);
		if(bestscore > 0 && (var_98883cf9 < 0 || var_98883cf9 > var_5e9b5f9f))
		{
			continue;
		}
		var_bb8e7f0d = (starttoend[1], -1 * starttoend[0], 0);
		var_bb8e7f0d = vectornormalize(var_bb8e7f0d);
		var_c79274d2 = abs(vectordot(var_bb8e7f0d, var_4fbaae92));
		if(bestscore <= 0 || var_c79274d2 < bestscore)
		{
			bestscore = var_c79274d2;
			var_747c2571 = var_ae402dfe;
		}
		if(var_5b94af06 <= 0 || var_c79274d2 < var_5b94af06)
		{
			if(!isdefined(route[var_ae402dfe].var_4ff89bee) || gettime() > route[var_ae402dfe].var_4ff89bee)
			{
				var_5b94af06 = var_c79274d2;
				var_5a1a59a4 = var_ae402dfe;
			}
		}
	}
	if(var_5a1a59a4 >= 0)
	{
		var_747c2571 = var_5a1a59a4;
	}
	/#
		assert(var_747c2571 >= 0);
	#/
	return var_747c2571;
}

/*
	Name: getregionforpos
	Namespace: namespace_5cd4acd8
	Checksum: 0x3B98C8B
	Offset: 0x848
	Size: 0x16E
	Parameters: 1
	Flags: Linked
*/
function getregionforpos(pos)
{
	mindist = 1000000000;
	var_ccae54a1 = undefined;
	var_945ef26b = level.stealth.hunt_stealth_group_region_sets[self.script_stealth_region_group];
	if(!isdefined(var_945ef26b))
	{
		return undefined;
	}
	foreach(region in var_945ef26b.hunt_regions)
	{
		if(!isdefined(self.script_stealth_region_group) || self.script_stealth_region_group != region.stealth_group)
		{
			continue;
		}
		if(region.volume istouching(pos))
		{
			return region;
		}
		dist = lengthsquared(region.approx_location - self.origin);
		if(dist < mindist)
		{
			mindist = dist;
			var_ccae54a1 = region;
		}
	}
	return var_ccae54a1;
}

/*
	Name: function_7a946650
	Namespace: namespace_5cd4acd8
	Checksum: 0x5D809FE8
	Offset: 0x9C0
	Size: 0x12C
	Parameters: 3
	Flags: None
*/
function function_7a946650(msg, index, var_371132fe)
{
	/#
		idx = string(index);
		target = "";
		targetname = "";
		if(isdefined(var_371132fe.target))
		{
			target = var_371132fe.target;
		}
		if(isdefined(var_371132fe.targetname))
		{
			targetname = var_371132fe.targetname;
		}
		transition = "";
		if(var_371132fe.transitions.size > 0)
		{
			transition = "";
		}
		println((((((((("" + msg) + "") + idx) + "") + targetname) + "") + target) + "") + transition);
	#/
}

/*
	Name: function_28ec085c
	Namespace: namespace_5cd4acd8
	Checksum: 0x9F925225
	Offset: 0xAF8
	Size: 0x1A0
	Parameters: 0
	Flags: None
*/
function function_28ec085c()
{
	/#
		foreach(region in level.stealth.hunt_regions)
		{
			foreach(point in region.transition_points)
			{
				foreach(transition in point.transitions)
				{
					println(((("" + point.index) + "") + transition.index) + "");
				}
			}
		}
	#/
}

/*
	Name: gethuntstealthgroups
	Namespace: namespace_5cd4acd8
	Checksum: 0xBAE41036
	Offset: 0xCA0
	Size: 0x16A
	Parameters: 1
	Flags: Linked
*/
function gethuntstealthgroups(var_bbf5d56f)
{
	var_9e7c8581 = [];
	foreach(volume in var_bbf5d56f)
	{
		/#
			assert(isdefined(volume.script_stealth_region_group), "");
		#/
		var_86fb4fc6 = strtok(volume.script_stealth_region_group, " ");
		foreach(str in var_86fb4fc6)
		{
			var_9e7c8581[var_9e7c8581.size] = str;
		}
	}
	var_9e7c8581 = array::function_b1d17853(var_9e7c8581);
	return var_9e7c8581;
}

/*
	Name: gethuntroutepoints
	Namespace: namespace_5cd4acd8
	Checksum: 0xCF6CBC64
	Offset: 0xE18
	Size: 0xF8
	Parameters: 1
	Flags: Linked
*/
function gethuntroutepoints(var_bbf5d56f)
{
	var_1f7c13ae = struct::get_array("stealth_clearpath", "variantname");
	var_23471399 = [];
	foreach(struct in var_1f7c13ae)
	{
		var_371132fe = struct;
		var_371132fe.transitions = [];
		size = var_23471399.size;
		var_371132fe.index = size;
		var_23471399[size] = var_371132fe;
	}
	return var_23471399;
}

/*
	Name: gethuntstealthgroupvolumelists
	Namespace: namespace_5cd4acd8
	Checksum: 0x85292825
	Offset: 0xF18
	Size: 0x14E
	Parameters: 2
	Flags: Linked
*/
function gethuntstealthgroupvolumelists(var_9e7c8581, var_bbf5d56f)
{
	var_5310ca1e = [];
	foreach(group in var_9e7c8581)
	{
		var_5310ca1e[group] = [];
		foreach(volume in var_bbf5d56f)
		{
			if(issubstr(volume.script_stealth_region_group, group))
			{
				size = var_5310ca1e[group].size;
				var_5310ca1e[group][size] = volume;
			}
		}
	}
	return var_5310ca1e;
}

/*
	Name: buildhuntstealthgrouptransitiondata
	Namespace: namespace_5cd4acd8
	Checksum: 0x41992284
	Offset: 0x1070
	Size: 0x410
	Parameters: 0
	Flags: Linked
*/
function buildhuntstealthgrouptransitiondata()
{
	foreach(var_462028a0 in level.hunt_region_load.hunt_stealth_group_region_sets)
	{
		foreach(region in var_462028a0.hunt_regions)
		{
			var_18b52478 = [];
			foreach(transition_point in region.transition_points)
			{
				stealth_group = region.stealth_group;
				transition_points = struct::get_array(transition_point.target, "targetname");
				foreach(var_b042e906 in transition_points)
				{
					foreach(var_4e481c6b in var_b042e906.containing_regions)
					{
						if(var_4e481c6b.stealth_group == stealth_group)
						{
							if(!array::contains(transition_point.transitions, var_b042e906))
							{
								transition_point.transitions[transition_point.transitions.size] = var_b042e906;
							}
							if(!isdefined(var_b042e906.transitions))
							{
								var_b042e906.transitions = [];
							}
							if(!array::contains(var_b042e906.transitions, transition_point))
							{
								var_b042e906.transitions[var_b042e906.transitions.size] = transition_point;
							}
							if(!array::contains(var_4e481c6b.transition_points, var_b042e906))
							{
								size = var_4e481c6b.transition_points.size;
								var_4e481c6b.transition_points[size] = var_b042e906;
							}
							break;
						}
					}
				}
				if(transition_point.transitions.size == 0)
				{
					var_18b52478[var_18b52478.size] = index;
				}
			}
			foreach(index in var_18b52478)
			{
				array::remove_index(region.transition_points, index, 0);
			}
		}
	}
}

/*
	Name: buildhuntstealthgroupgraphdata
	Namespace: namespace_5cd4acd8
	Checksum: 0x50187D0F
	Offset: 0x1488
	Size: 0x53A
	Parameters: 0
	Flags: Linked
*/
function buildhuntstealthgroupgraphdata()
{
	foreach(var_462028a0 in level.hunt_region_load.hunt_stealth_group_region_sets)
	{
		foreach(region in var_462028a0.hunt_regions)
		{
			region.region_links = [];
			foreach(transition_point in region.transition_points)
			{
				foreach(var_b568c168 in transition_point.transitions)
				{
					var_4e481c6b = undefined;
					foreach(var_35862c8b in var_b568c168.containing_regions)
					{
						if(var_35862c8b.stealth_group == region.stealth_group)
						{
							var_4e481c6b = var_35862c8b;
							break;
						}
					}
					if(!isdefined(var_4e481c6b))
					{
						continue;
					}
					var_2f106193 = spawnstruct();
					var_2f106193.region = var_4e481c6b;
					var_2f106193.transition_point = transition_point;
					var_2f106193.transition_to_point = var_b568c168;
					size = region.region_links.size;
					region.region_links[size] = var_2f106193;
				}
			}
		}
		foreach(region in var_462028a0.hunt_regions)
		{
			if(region.route_points.size == 0)
			{
				continue;
			}
			if(region.route_points.size == 1)
			{
				region.approx_location = region.route_points[0].origin;
				continue;
			}
			path_length = 0;
			segment_length = 0;
			i = 1;
			for(i = 1; i < region.route_points.size; i++)
			{
				segment_length = length(region.route_points[i].origin - (region.route_points[i - 1].origin));
				path_length = path_length + segment_length;
			}
			path_length = path_length * 0.5;
			for(i = 0; i < region.route_points.size - 1; i++)
			{
				segment_length = length(region.route_points[i].origin - (region.route_points[i + 1].origin));
				if(path_length - segment_length < 0)
				{
					break;
				}
				path_length = path_length - segment_length;
			}
			fraction = path_length / segment_length;
			region.approx_location = vectorlerp(region.route_points[i].origin, region.route_points[i + 1].origin, fraction);
		}
	}
}

/*
	Name: cleanuphuntbuilddata
	Namespace: namespace_5cd4acd8
	Checksum: 0x6CCA6341
	Offset: 0x19D0
	Size: 0x182
	Parameters: 1
	Flags: Linked
*/
function cleanuphuntbuilddata(var_23471399)
{
	foreach(point in var_23471399)
	{
		point.containing_regions = undefined;
		point.transitions = undefined;
	}
	foreach(var_57287dad in level.hunt_region_load.hunt_stealth_group_region_sets)
	{
		foreach(region in var_57287dad.hunt_regions)
		{
			region.transition_points = undefined;
		}
	}
}

/*
	Name: inithuntregiondata
	Namespace: namespace_5cd4acd8
	Checksum: 0x8C780E81
	Offset: 0x1B60
	Size: 0xBF4
	Parameters: 0
	Flags: Linked
*/
function inithuntregiondata()
{
	aiprofile_beginentry("Init Hunt Region Data");
	var_bbf5d56f = getentarray("info_volume_stealth_clear", "variantname");
	var_9e7c8581 = gethuntstealthgroups(var_bbf5d56f);
	var_23471399 = gethuntroutepoints(var_bbf5d56f);
	var_b8850d25 = [];
	var_ed36f7a7 = gethuntstealthgroupvolumelists(var_9e7c8581, var_bbf5d56f);
	level.hunt_region_load.hunt_stealth_group_region_sets = [];
	foreach(group, var_2e6299dc in var_ed36f7a7)
	{
		level.hunt_region_load.hunt_stealth_group_region_sets[group] = spawnstruct();
		level.hunt_region_load.hunt_stealth_group_region_sets[group].hunt_regions = [];
		level.hunt_region_load.hunt_stealth_group_region_sets[group].target_score = 0;
		foreach(volume in var_2e6299dc)
		{
			region = spawnstruct();
			region.volume = volume;
			region.index = index;
			region.approx_location = (0, 0, 0);
			region.bfs_distance = 100000;
			region.bfs_score = 100000;
			region.cooldown = 20000;
			shared_data = var_b8850d25[volume getentitynumber()];
			if(!isdefined(shared_data))
			{
				shared_data = spawnstruct();
				shared_data.bfs_assigned = 0;
				shared_data.max_enemies = 2;
				shared_data.bfs_cooldown = 0;
				shared_data.in_region = 0;
				shared_data.player_in_region = 0;
				shared_data.assign_window = 0;
				var_b8850d25[volume getentitynumber()] = shared_data;
			}
			region.shared_data = shared_data;
			if(isdefined(volume.script_count))
			{
				shared_data.max_enemies = volume.script_count;
			}
			if(isdefined(volume.script_timer))
			{
				shared_data.cooldown = volume.script_timer * 1000;
			}
			region.stealth_group = group;
			region.route_points = [];
			region.transition_points = [];
			foreach(point in var_23471399)
			{
				if(volume istouching(point.origin))
				{
					size = region.route_points.size;
					region.route_points[size] = point;
					if(!isdefined(point.containing_regions))
					{
						point.containing_regions = [];
					}
					size = point.containing_regions.size;
					point.containing_regions[size] = region;
					var_3eeed7ad = struct::get_array(point.target, "targetname");
					var_3eeed7ad = arraycombine(var_3eeed7ad, struct::get_array(point.targetname, "target"));
					var_3eeed7ad = array::function_b1d17853(var_3eeed7ad);
					foreach(link in var_3eeed7ad)
					{
						if(link !== point && link.variantname === "stealth_clearpath" && !volume istouching(link.origin))
						{
							region.transition_points[region.transition_points.size] = link;
							region.transition_points = array::function_b1d17853(region.transition_points);
						}
					}
				}
			}
			if(region.route_points.size == 0)
			{
				/#
					assertmsg("");
				#/
			}
			region.smart_objects = [];
			foreach(smart_object in level.smartobjectpoints)
			{
				if(volume istouching(smart_object.origin))
				{
					size = region.smart_objects.size;
					region.smart_objects[size] = smart_object;
				}
			}
			size = level.hunt_region_load.hunt_stealth_group_region_sets[group].hunt_regions.size;
			level.hunt_region_load.hunt_stealth_group_region_sets[group].hunt_regions[size] = region;
		}
		foreach(region in level.hunt_region_load.hunt_stealth_group_region_sets[group].hunt_regions)
		{
			if(region.route_points.size == 0)
			{
				continue;
			}
			startnode = -1;
			for(i = 0; i < region.route_points.size; i++)
			{
				point = region.route_points[i];
				targetname = point.targetname;
				if(!isdefined(targetname))
				{
					if(startnode != -1)
					{
						orig = point.origin;
						/#
							assertmsg(((((("" + orig[0]) + "") + orig[1]) + "") + orig[2]) + "");
						#/
					}
					startnode = i;
					continue;
				}
				var_8bacc3fa = undefined;
				foreach(var_40ad2e7d in region.route_points)
				{
					if(isdefined(var_40ad2e7d.target) && var_40ad2e7d.target == targetname)
					{
						var_8bacc3fa = var_40ad2e7d;
					}
				}
				if(!isdefined(var_8bacc3fa))
				{
					if(startnode != -1)
					{
						/#
							assertmsg(("" + targetname) + "");
						#/
					}
					startnode = i;
				}
			}
			if(startnode == -1)
			{
				startnode = 0;
			}
			buffer = [];
			var_149c4067 = startnode;
			buffer[0] = region.route_points[var_149c4067];
			for(i = 1; i < region.route_points.size; i++)
			{
				point = region.route_points[var_149c4067];
				target = point.target;
				j = 0;
				found_point = undefined;
				while(j < region.route_points.size)
				{
					target_point = region.route_points[j];
					targetname = target_point.targetname;
					if(isdefined(targetname) && target == targetname)
					{
						found_point = target_point;
						break;
					}
					j++;
				}
				if(!isdefined(found_point))
				{
					/#
						assertmsg("");
					#/
				}
				buffer[i] = found_point;
				var_149c4067 = j;
			}
			region.route_points = buffer;
		}
	}
	var_b8850d25 = undefined;
	foreach(var_371132fe in var_23471399)
	{
		if(!isdefined(var_371132fe.containing_regions))
		{
			/#
				assertmsg(("" + var_371132fe.origin) + "");
			#/
		}
	}
	buildhuntstealthgrouptransitiondata();
	buildhuntstealthgroupgraphdata();
	cleanuphuntbuilddata(var_23471399);
	aiprofile_endentry();
}

/*
	Name: huntcomputeaiindependentregionscores
	Namespace: namespace_5cd4acd8
	Checksum: 0x9858520D
	Offset: 0x2760
	Size: 0x464
	Parameters: 2
	Flags: Linked
*/
function huntcomputeaiindependentregionscores(group, var_462028a0)
{
	aiprofile_beginentry("AI Hunt Init Scoring");
	var_6a0d3fd4 = var_462028a0.hunt_regions.size;
	for(var_3e6a3ff3 = 0; var_3e6a3ff3 < var_6a0d3fd4; var_3e6a3ff3++)
	{
		region = var_462028a0.hunt_regions[var_3e6a3ff3];
		region.bfs_score = 1;
		region.shared_data.player_in_region = 0;
	}
	foreach(player in getplayers())
	{
		if(!player flag::exists("stealth_enabled") || !player flag::get("stealth_enabled"))
		{
			continue;
		}
		for(var_3e6a3ff3 = 0; var_3e6a3ff3 < var_6a0d3fd4; var_3e6a3ff3++)
		{
			region = var_462028a0.hunt_regions[var_3e6a3ff3];
			region.bfs_visited = 0;
		}
		var_924463ec = undefined;
		mindist = 1E+20;
		for(var_3e6a3ff3 = 0; var_3e6a3ff3 < var_6a0d3fd4; var_3e6a3ff3++)
		{
			region = var_462028a0.hunt_regions[var_3e6a3ff3];
			if(region.volume istouching(player.origin))
			{
				var_924463ec = region;
				break;
			}
			dist = lengthsquared(region.approx_location - player.origin);
			if(dist < mindist)
			{
				mindist = dist;
				var_924463ec = region;
			}
		}
		var_924463ec.shared_data.player_in_region = 1;
		var_21487804 = [0:var_924463ec];
		var_924463ec.bfs_visited = 1;
		dist = 0;
		index = 0;
		while(index < var_21487804.size)
		{
			stop = var_21487804.size;
			for(i = index; i < stop; i++)
			{
				region = var_21487804[i];
				region.bfs_score = dist * region.bfs_score;
				region.bfs_visited = 1;
				region.bfs_distance = dist;
				var_d6b10147 = region.region_links.size;
				for(var_91181e90 = 0; var_91181e90 < var_d6b10147; var_91181e90++)
				{
					link = region.region_links[var_91181e90];
					if(!link.region.bfs_visited)
					{
						var_21487804[var_21487804.size] = link.region;
						link.region.bfs_visited = 1;
					}
				}
			}
			index = stop;
			dist++;
		}
	}
	highestscore = 1;
	for(var_3e6a3ff3 = 0; var_3e6a3ff3 < var_6a0d3fd4; var_3e6a3ff3++)
	{
		region = var_462028a0.hunt_regions[var_3e6a3ff3];
		highestscore = max(region.bfs_score, highestscore);
	}
	for(var_3e6a3ff3 = 0; var_3e6a3ff3 < var_6a0d3fd4; var_3e6a3ff3++)
	{
		region = var_462028a0.hunt_regions[var_3e6a3ff3];
		region.bfs_score = region.bfs_score / highestscore;
		region.bfs_visited = undefined;
	}
	aiprofile_endentry();
}

/*
	Name: huntassigntoregion
	Namespace: namespace_5cd4acd8
	Checksum: 0xC1A65297
	Offset: 0x2BD0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function huntassigntoregion(region)
{
	if(isdefined(self.stealth.cleardata))
	{
		self.stealth.cleardata.curregion = region;
		huntincaiassignment(region);
	}
}

/*
	Name: huntunassignfromregion
	Namespace: namespace_5cd4acd8
	Checksum: 0x571564B
	Offset: 0x2C28
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function huntunassignfromregion(region)
{
	if(isdefined(self.stealth.cleardata.curregion) && self.stealth.cleardata.curregion == region)
	{
		huntdecaiassignment(region);
	}
}

/*
	Name: huntincaiassignment
	Namespace: namespace_5cd4acd8
	Checksum: 0xE252418D
	Offset: 0x2C90
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function huntincaiassignment(region)
{
	region.shared_data.bfs_assigned = region.shared_data.bfs_assigned + 1;
	self hunttrytoenterregionvolume(region);
}

/*
	Name: huntdecaiassignment
	Namespace: namespace_5cd4acd8
	Checksum: 0xAA5C3AB9
	Offset: 0x2CE8
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function huntdecaiassignment(region)
{
	/#
		assert(region.shared_data.bfs_assigned != 0, "");
	#/
	region.shared_data.bfs_assigned = region.shared_data.bfs_assigned - 1;
	self hunttrytoexitregionvolume(region);
	if(region.shared_data.in_region == 0)
	{
		region.shared_data.bfs_cooldown = gettime() + region.cooldown;
	}
}

/*
	Name: hunttrytoenterregionvolume
	Namespace: namespace_5cd4acd8
	Checksum: 0xC4F33F0C
	Offset: 0x2DA8
	Size: 0x13A
	Parameters: 1
	Flags: Linked
*/
function hunttrytoenterregionvolume(region)
{
	if(!self.stealth.cleardata.isinregion && region.volume istouching(self.origin))
	{
		/#
			assert(self.stealth.cleardata.curregion == region, ("" + region.index) + "");
		#/
		region.shared_data.in_region = region.shared_data.in_region + 1;
		self.stealth.cleardata.isinregion = 1;
		if(region.shared_data.player_in_region && region.shared_data.in_region == 1)
		{
			var_8a32f5c = 1000;
			region.shared_data.assign_window = gettime() + var_8a32f5c;
		}
	}
}

/*
	Name: hunttrytoexitregionvolume
	Namespace: namespace_5cd4acd8
	Checksum: 0x36974A85
	Offset: 0x2EF0
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function hunttrytoexitregionvolume(region)
{
	/#
		assert(self.stealth.cleardata.curregion == region, ("" + region.index) + "");
	#/
	if(self.stealth.cleardata.isinregion)
	{
		region.shared_data.in_region = region.shared_data.in_region - 1;
		self.stealth.cleardata.isinregion = 0;
	}
}

/*
	Name: huntgetnextregion
	Namespace: namespace_5cd4acd8
	Checksum: 0x159C7F27
	Offset: 0x2FB0
	Size: 0x370
	Parameters: 1
	Flags: Linked
*/
function huntgetnextregion(region)
{
	aiprofile_beginentry("Hunt Get Next Reg");
	if(region.region_links.size == 0)
	{
		aiprofile_endentry();
		return;
	}
	if(!isdefined(self.script_stealth_region_group) || !isdefined(level.stealth.hunt_stealth_group_region_sets[self.script_stealth_region_group]))
	{
		aiprofile_endentry();
		return;
	}
	var_161b41f9 = undefined;
	curtime = gettime();
	target_score = level.stealth.hunt_stealth_group_region_sets[self.script_stealth_region_group].target_score;
	var_6036e3a2 = 1;
	foreach(var_35b60bb6 in level.stealth.hunt_stealth_group_region_sets[self.script_stealth_region_group].hunt_regions)
	{
		if(var_35b60bb6 == region)
		{
			continue;
		}
		if(var_35b60bb6.shared_data.bfs_cooldown > gettime())
		{
			continue;
		}
		if(var_35b60bb6.shared_data.player_in_region && var_35b60bb6.shared_data.in_region > 0 && curtime > var_35b60bb6.shared_data.assign_window)
		{
			continue;
		}
		if(self.script_stealth_region_group != var_35b60bb6.stealth_group)
		{
			continue;
		}
		if(var_35b60bb6.shared_data.bfs_assigned >= var_35b60bb6.shared_data.max_enemies)
		{
			continue;
		}
		target_dist = abs(target_score - var_35b60bb6.bfs_score);
		if(target_dist < var_6036e3a2)
		{
			var_161b41f9 = var_35b60bb6;
			var_6036e3a2 = target_dist;
		}
	}
	if(!isdefined(var_161b41f9))
	{
		var_161b41f9 = region.region_links[0].region;
	}
	self.stealth.cleardata.prevregion[0] = self.stealth.cleardata.prevregion[1];
	self.stealth.cleardata.prevregion[1] = self.stealth.cleardata.curregion;
	target_score = target_score + 0.5;
	if(target_score > 1)
	{
		target_score = 0;
	}
	level.stealth.hunt_stealth_group_region_sets[self.script_stealth_region_group].target_score = target_score;
	aiprofile_endentry();
	return var_161b41f9;
}

