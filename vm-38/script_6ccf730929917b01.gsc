#using script_35ae72be7b4fec10;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_93648050;

/*
	Name: function_2cd51c97
	Namespace: namespace_93648050
	Checksum: 0x62498BE0
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2cd51c97()
{
	level notify(1751842577);
}

/*
	Name: function_89f2df9
	Namespace: namespace_93648050
	Checksum: 0x6808CEDB
	Offset: 0x140
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7ccb313a097bf40", &preload, undefined, undefined, undefined);
}

/*
	Name: preload
	Namespace: namespace_93648050
	Checksum: 0x9EF3DB1C
	Offset: 0x188
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function preload()
{
	level.var_93648050 = {};
	level.var_93648050.ents = [];
	level.var_93648050.triggers = [];
	level.var_93648050.points = [];
	level.var_93648050.objects = [];
	level.var_93648050.trace_dist = 0;
	callback::on_spawned(&on_player_spawned);
	/#
		util::init_dvar("", 0, &function_5120dfdb);
	#/
}

/*
	Name: on_player_spawned
	Namespace: namespace_93648050
	Checksum: 0xB90FBE45
	Offset: 0x258
	Size: 0x250
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	var_7edfa20f = struct::get_array("obj_desc_rect", "variantname");
	circles = struct::get_array("obj_desc_circle", "variantname");
	foreach(index, rect in var_7edfa20f)
	{
		link_ent = undefined;
		if(isdefined(rect.target))
		{
			link_ent = getent(rect.target, "targetname");
		}
		function_23e7a30a("rect" + index, rect.origin, rect.angles, rect.script_width, rect.script_height, hash(rect.script_string), rect.script_maxdist, link_ent);
	}
	foreach(index, circle in circles)
	{
		link_ent = undefined;
		if(isdefined(circle.target))
		{
			link_ent = getent(circle.target, "targetname");
		}
		function_39142278("circle" + index, circle.origin, circle.angles, circle.script_radius, hash(circle.script_string), circle.script_maxdist, link_ent);
	}
}

/*
	Name: function_ccdf77da
	Namespace: namespace_93648050
	Checksum: 0x15D5DE97
	Offset: 0x4B0
	Size: 0xC4
	Parameters: 4
	Flags: None
*/
function function_ccdf77da(uid, ent, loc_string, max_dist)
{
	if(!isdefined(max_dist))
	{
		max_dist = 500;
	}
	data = {};
	data.ent = ent;
	data.loc_string = loc_string;
	data.max_dist = max_dist;
	data.var_c42ac92 = &function_73b1e949;
	data.var_f03d5bb1 = &function_136c1375;
	function_64126649(uid, data);
	ent thread function_50676d1(uid);
}

/*
	Name: function_eb5d0a02
	Namespace: namespace_93648050
	Checksum: 0x6FE3D726
	Offset: 0x580
	Size: 0xE4
	Parameters: 6
	Flags: None
*/
function function_eb5d0a02(uid, trigger, loc_string, max_dist, var_36247bfb, var_774d5d03)
{
	if(!isdefined(max_dist))
	{
		max_dist = 500;
	}
	if(!isdefined(var_774d5d03))
	{
		var_774d5d03 = 1;
	}
	data = {};
	data.trigger = trigger;
	data.loc_string = loc_string;
	data.var_36247bfb = var_36247bfb;
	data.max_dist = max_dist;
	data.var_c42ac92 = &function_fc5ed81d;
	data.var_f03d5bb1 = &function_f56da461;
	data.var_774d5d03 = var_774d5d03;
	function_64126649(uid, data);
}

/*
	Name: function_23e7a30a
	Namespace: namespace_93648050
	Checksum: 0x1F0BD7FE
	Offset: 0x670
	Size: 0x1E4
	Parameters: 10
	Flags: Linked
*/
function function_23e7a30a(uid, center, angles, width, height, loc_string, max_dist, link_ent, var_36247bfb, var_774d5d03)
{
	if(!isdefined(max_dist))
	{
		max_dist = 500;
	}
	if(!isdefined(var_774d5d03))
	{
		var_774d5d03 = 1;
	}
	data = {};
	data.center = center;
	data.axis = anglestoaxis(angles);
	data.width = width / 2;
	data.height = height / 2;
	data.loc_string = loc_string;
	data.max_dist = max_dist;
	data.var_c42ac92 = &function_f08e8278;
	data.var_f03d5bb1 = &function_3c2d7742;
	data.var_36247bfb = var_36247bfb;
	data.var_774d5d03 = var_774d5d03;
	/#
		data.var_ffc04e84 = &function_1ee1bf29;
		data.angles = angles;
	#/
	if(isdefined(link_ent))
	{
		data.angles = angles;
		data.link_ent = link_ent;
		data.var_9a145184 = center - link_ent.origin;
		data.var_1321588e = angleclamp180(angles - link_ent.angles);
		data.link_ent thread function_50676d1(uid);
	}
	function_64126649(uid, data);
}

/*
	Name: function_39142278
	Namespace: namespace_93648050
	Checksum: 0x39EE167
	Offset: 0x860
	Size: 0x1B4
	Parameters: 9
	Flags: Linked
*/
function function_39142278(uid, center, angles, radius, loc_string, max_dist, link_ent, var_36247bfb, var_774d5d03)
{
	if(!isdefined(max_dist))
	{
		max_dist = 500;
	}
	if(!isdefined(var_774d5d03))
	{
		var_774d5d03 = 1;
	}
	data = {};
	data.center = center;
	data.axis = anglestoaxis(angles);
	data.radius = radius;
	data.loc_string = loc_string;
	data.max_dist = max_dist;
	data.var_c42ac92 = &function_d0acce99;
	data.var_f03d5bb1 = &function_3c2d7742;
	data.var_36247bfb = var_36247bfb;
	data.var_774d5d03 = var_774d5d03;
	/#
		data.var_ffc04e84 = &function_c6b00d99;
	#/
	if(isdefined(link_ent))
	{
		data.angles = angles;
		data.link_ent = link_ent;
		data.var_9a145184 = center - link_ent.origin;
		data.var_1321588e = angleclamp180(angles - link_ent.angles);
		data.link_ent thread function_50676d1(uid);
	}
	function_64126649(uid, data);
}

/*
	Name: remove
	Namespace: namespace_93648050
	Checksum: 0x827F16EF
	Offset: 0xA20
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function remove(uid)
{
	level notify("remove_object_description_" + uid);
	arrayremoveindex(level.var_93648050.ents, uid, 1);
	arrayremoveindex(level.var_93648050.triggers, uid, 1);
	arrayremoveindex(level.var_93648050.points, uid, 1);
	level.var_93648050.objects = arraycombine(level.var_93648050.ents, level.var_93648050.triggers, 1, 0);
	level.var_93648050.objects = arraycombine(level.var_93648050.objects, level.var_93648050.points, 1, 0);
	function_e8419844();
}

/*
	Name: remove_all
	Namespace: namespace_93648050
	Checksum: 0xF1ED3898
	Offset: 0xB68
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function remove_all()
{
	level notify(#"hash_54c689354421dd79");
	level.var_93648050.objects = [];
	level.var_93648050.ents = [];
	level.var_93648050.triggers = [];
	level.var_93648050.points = [];
	level.var_93648050.trace_dist = 0;
}

/*
	Name: function_64126649
	Namespace: namespace_93648050
	Checksum: 0xBEBD0381
	Offset: 0xBF0
	Size: 0x184
	Parameters: 2
	Flags: Linked, Private
*/
function private function_64126649(uid, data)
{
	if(!isdefined(data.var_774d5d03))
	{
		data.var_774d5d03 = 0;
	}
	if(isdefined(data.ent))
	{
		level.var_93648050.ents[uid] = data;
	}
	else
	{
		if(isdefined(data.trigger))
		{
			level.var_93648050.triggers[uid] = data;
		}
		else
		{
			level.var_93648050.points[uid] = data;
		}
	}
	level.var_93648050.objects = arraycombine(level.var_93648050.ents, level.var_93648050.triggers, 1, 0);
	level.var_93648050.objects = arraycombine(level.var_93648050.objects, level.var_93648050.points, 1, 0);
	function_e8419844();
	if(!level flag::get("object_descriptions_active"))
	{
		getplayers()[0] thread _think();
	}
}

/*
	Name: function_e8419844
	Namespace: namespace_93648050
	Checksum: 0xDA2D9E22
	Offset: 0xD80
	Size: 0xCE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e8419844()
{
	level.var_93648050.trace_dist = 0;
	foreach(data in level.var_93648050.objects)
	{
		level.var_93648050.trace_dist = max(level.var_93648050.trace_dist, data.max_dist);
	}
}

/*
	Name: function_50676d1
	Namespace: namespace_93648050
	Checksum: 0xE710F4DC
	Offset: 0xE58
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_50676d1(uid)
{
	level endon(#"hash_54c689354421dd79", "remove_object_description_" + uid);
	self waittill(#"death");
	thread remove(uid);
}

/*
	Name: function_73b1e949
	Namespace: namespace_93648050
	Checksum: 0x7C0A0A68
	Offset: 0xEB8
	Size: 0x38
	Parameters: 3
	Flags: Linked, Private
*/
function private function_73b1e949(data, trace, var_a74a4e75)
{
	return var_a74a4e75[#"entity"] === trace.ent;
}

/*
	Name: function_fc5ed81d
	Namespace: namespace_93648050
	Checksum: 0xB0378D8A
	Offset: 0xEF8
	Size: 0x42
	Parameters: 3
	Flags: Linked, Private
*/
function private function_fc5ed81d(data, trace, var_a74a4e75)
{
	return istouching(var_a74a4e75[#"position"], trace.trigger);
}

/*
	Name: function_f08e8278
	Namespace: namespace_93648050
	Checksum: 0x47D0260
	Offset: 0xF48
	Size: 0x166
	Parameters: 3
	Flags: Linked, Private
*/
function private function_f08e8278(data, trace, var_a74a4e75)
{
	function_975e779f(data);
	var_2327a6ed = trace[#"position"] - data.center;
	if(abs(vectordot(var_2327a6ed, data.axis.forward)) > 6 || vectordot(var_a74a4e75, data.axis.forward) > -0.17)
	{
		return false;
	}
	if(abs(vectordot(var_2327a6ed, data.axis.right)) > data.width)
	{
		return false;
	}
	if(abs(vectordot(var_2327a6ed, data.axis.up)) > data.height)
	{
		return false;
	}
	return true;
}

/*
	Name: function_d0acce99
	Namespace: namespace_93648050
	Checksum: 0xAA27470F
	Offset: 0x10B8
	Size: 0xFE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d0acce99(data, trace, var_a74a4e75)
{
	function_975e779f(data);
	var_2327a6ed = trace[#"position"] - data.center;
	if(abs(vectordot(var_2327a6ed, data.axis.forward)) > 6 || vectordot(var_a74a4e75, data.axis.forward) > -0.17)
	{
		return 0;
	}
	return lengthsquared(var_2327a6ed) < (data.radius * data.radius);
}

/*
	Name: function_136c1375
	Namespace: namespace_93648050
	Checksum: 0xEEEF75D0
	Offset: 0x11C0
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_136c1375(data)
{
	return data.ent.origin;
}

/*
	Name: function_f56da461
	Namespace: namespace_93648050
	Checksum: 0xE2B66E70
	Offset: 0x11E8
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f56da461(data)
{
	return data.trigger.origin;
}

/*
	Name: function_3c2d7742
	Namespace: namespace_93648050
	Checksum: 0x7257C788
	Offset: 0x1210
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3c2d7742(data)
{
	return data.center;
}

/*
	Name: function_975e779f
	Namespace: namespace_93648050
	Checksum: 0x88A0443E
	Offset: 0x1230
	Size: 0x10E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_975e779f(data)
{
	if(isdefined(data.link_ent))
	{
		angle_delta = angleclamp180(data.var_1321588e - (data.angles - data.link_ent.angles));
		if(lengthsquared(angle_delta) > 1)
		{
			data.var_9a145184 = rotatepoint(data.var_9a145184, angle_delta);
			data.angles = data.link_ent.angles + data.var_1321588e;
			data.axis = anglestoaxis(data.angles);
		}
		data.center = data.link_ent.origin + data.var_9a145184;
	}
}

/*
	Name: _think
	Namespace: namespace_93648050
	Checksum: 0xD01A283
	Offset: 0x1348
	Size: 0x544
	Parameters: 0
	Flags: Linked, Private
*/
function private _think()
{
	self endon(#"death");
	level endon(#"level_restarting");
	level flag::set("object_descriptions_active");
	namespace_61e6d095::create(#"hash_7ccb313a097bf40", #"hash_1dbb8163d29524c9");
	var_ebb41806 = undefined;
	while(level.var_93648050.trace_dist > 0)
	{
		eye = self getplayercamerapos();
		var_a74a4e75 = anglestoforward(self getplayerangles());
		text = #"";
		var_36247bfb = #"";
		if(!namespace_61e6d095::exists(#"hash_66c6997fe4c5ccf") && !self flag::get(#"lockpicking") && function_185fc34e(eye, var_a74a4e75))
		{
			end = eye + (var_a74a4e75 * level.var_93648050.trace_dist);
			trace = bullettrace(eye, end, 1, self, 1, 0);
			if(trace[#"fraction"] < 1)
			{
				distance = level.var_93648050.trace_dist * trace[#"fraction"];
				start_index = 0;
				if(!isdefined(trace[#"entity"]))
				{
					start_index = level.var_93648050.ents.size;
				}
				for(i = start_index; i < level.var_93648050.objects.size; i++)
				{
					data = level.var_93648050.objects[i];
					/#
						if(level.var_93648050.debug_draw && isdefined(data.var_ffc04e84))
						{
							[[data.var_ffc04e84]](data);
						}
					#/
					if(data.max_dist > distance && [[data.var_c42ac92]](data, trace, var_a74a4e75))
					{
						text = data.loc_string;
						var_36247bfb = data.var_36247bfb;
						break;
					}
				}
			}
		}
		if(var_ebb41806 !== text)
		{
			var_ebb41806 = text;
			if(isdefined(data) && isdefined(var_ebb41806) && var_ebb41806 != #"")
			{
				if(isdefined(var_36247bfb) && var_36247bfb != #"")
				{
					namespace_61e6d095::function_d5ea17f0(#"hash_7ccb313a097bf40", var_36247bfb);
					namespace_61e6d095::function_bfdab223(#"hash_7ccb313a097bf40", text);
				}
				else
				{
					if(data.var_774d5d03 == 3)
					{
						namespace_61e6d095::function_d5ea17f0(#"hash_7ccb313a097bf40", text);
					}
					else
					{
						namespace_61e6d095::function_bfdab223(#"hash_7ccb313a097bf40", text);
					}
				}
				namespace_61e6d095::set_state(#"hash_7ccb313a097bf40", data.var_774d5d03);
			}
			else
			{
				namespace_61e6d095::function_d5ea17f0(#"hash_7ccb313a097bf40", #"");
				namespace_61e6d095::function_bfdab223(#"hash_7ccb313a097bf40", #"");
				namespace_61e6d095::set_state(#"hash_7ccb313a097bf40", 0);
			}
		}
		waitframe(1);
	}
	namespace_61e6d095::remove(#"hash_7ccb313a097bf40");
	level flag::clear("object_descriptions_active");
}

/*
	Name: function_185fc34e
	Namespace: namespace_93648050
	Checksum: 0x19006E3F
	Offset: 0x1898
	Size: 0x10E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_185fc34e(eye, var_a74a4e75)
{
	foreach(data in level.var_93648050.objects)
	{
		origin = [[data.var_f03d5bb1]](data);
		if(distancesquared(eye, origin) < (data.max_dist * data.max_dist) && (vectordot(var_a74a4e75, origin - eye)) > 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_5120dfdb
	Namespace: namespace_93648050
	Checksum: 0x3A7D7F65
	Offset: 0x19B0
	Size: 0x2A
	Parameters: 1
	Flags: Private
*/
function private function_5120dfdb(dvar)
{
	/#
		level.var_93648050.debug_draw = dvar.value;
	#/
}

/*
	Name: function_1ee1bf29
	Namespace: namespace_93648050
	Checksum: 0x3DB3437C
	Offset: 0x19E8
	Size: 0xD4
	Parameters: 1
	Flags: Private
*/
function private function_1ee1bf29(data)
{
	/#
		var_3b161ca3 = data.width / 2;
		half_height = data.height / 2;
		box(data.center, (-3, data.width * -1, data.height * -1), (3, data.width, data.height), data.angles, (1, 0.5, 0), 1, 1, 1);
	#/
}

/*
	Name: function_c6b00d99
	Namespace: namespace_93648050
	Checksum: 0x1DAECA35
	Offset: 0x1AC8
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_c6b00d99(data)
{
	/#
		circle(data.center, data.radius, (1, 0.5, 0), 1, 0, 1);
	#/
}

