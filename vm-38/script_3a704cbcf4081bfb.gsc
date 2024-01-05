#using scripts\core_common\player\player_stats.gsc;
#using script_522aeb6ae906391e;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace namespace_4aff7b6b;

/*
	Name: function_883565af
	Namespace: namespace_4aff7b6b
	Checksum: 0xCF060A5C
	Offset: 0x258
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_883565af()
{
	level notify(-109984631);
}

#namespace namespace_be0f9d50;

/*
	Name: init
	Namespace: namespace_be0f9d50
	Checksum: 0xCD96D84D
	Offset: 0x278
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(!isdefined(level.var_5fafe5ac))
	{
		level.var_5fafe5ac = [];
	}
	if(!isdefined(level.var_b7a636c9))
	{
		level.var_b7a636c9 = [];
	}
	if(!isdefined(level.var_70d37ee0))
	{
		level.var_70d37ee0 = [];
	}
	if(!isdefined(level.var_6e175eb))
	{
		level.var_6e175eb = struct::get_array("mimic_spawn_point", "variantname");
	}
	if(!isdefined(level.var_5a6d7d3e))
	{
		level.var_5a6d7d3e = [];
	}
	clientfield::register("scriptmover", "mimic_prop_rob", 6000, 3, "int");
	clientfield::register("scriptmover", "mimic_prop_rattle_cf", 6000, 1, "int");
	level thread function_8be6cc92();
}

/*
	Name: function_b309db61
	Namespace: namespace_be0f9d50
	Checksum: 0x65ABB68F
	Offset: 0x3B0
	Size: 0x14A
	Parameters: 4
	Flags: Linked
*/
function function_b309db61(&var_b103a71c, entity, var_d1cd7a80, var_75f9ae2d)
{
	var_491e08a8 = var_d1cd7a80;
	if(var_b103a71c.size > 1)
	{
		var_d9501d8d = array::randomize(var_b103a71c);
		if(!isdefined(var_491e08a8))
		{
			var_491e08a8 = array::pop_front(var_d9501d8d);
		}
		var_7331ff6c = function_21a3a673(3, 5);
		var_a6fe91fd = function_c928b745(var_d9501d8d, var_7331ff6c, entity, var_75f9ae2d);
	}
	else
	{
		var_a6fe91fd = [];
		if(!isdefined(var_491e08a8))
		{
			var_491e08a8 = var_b103a71c[0];
		}
	}
	if(isdefined(var_491e08a8.origin) && !isstruct(var_491e08a8))
	{
		var_491e08a8 = {#origin:var_491e08a8.origin};
	}
	return function_913ecbbc(var_a6fe91fd, entity, var_491e08a8, undefined, var_75f9ae2d);
}

/*
	Name: function_51012821
	Namespace: namespace_be0f9d50
	Checksum: 0x9409D830
	Offset: 0x508
	Size: 0xB4
	Parameters: 5
	Flags: Linked
*/
function function_51012821(origin, entity, var_d1cd7a80, var_9b487a9b, search_radius)
{
	if(!isdefined(var_9b487a9b))
	{
		var_9b487a9b = 1;
	}
	if(!isdefined(search_radius))
	{
		search_radius = 1000;
	}
	spawn_points = function_d8f63afd(origin, search_radius, var_9b487a9b);
	if(spawn_points.size || isdefined(var_d1cd7a80))
	{
		if(!spawn_points.size)
		{
			spawn_points[spawn_points.size] = var_d1cd7a80;
		}
		return function_b309db61(spawn_points, entity, var_d1cd7a80);
	}
}

/*
	Name: function_913ecbbc
	Namespace: namespace_be0f9d50
	Checksum: 0xB495A0A5
	Offset: 0x5C8
	Size: 0x238
	Parameters: 5
	Flags: Linked
*/
function function_913ecbbc(&var_a6fe91fd, mimic, var_1386d828, var_c3962187, var_75f9ae2d)
{
	if(isstruct(var_1386d828))
	{
		if(isdefined(level.var_6939ebc1[var_1386d828.lure_prop_type]))
		{
			var_6f50b277 = [[level.var_6939ebc1[var_1386d828.lure_prop_type].handler]](var_1386d828);
			if(isdefined(var_6f50b277))
			{
				var_1386d828 = var_6f50b277.prop;
				var_d56229a9 = var_6f50b277.activation_func;
			}
		}
		else
		{
			var_1386d828 = spawn_prop(var_1386d828, var_75f9ae2d);
		}
		if(isdefined(var_1386d828))
		{
			var_a6fe91fd[var_a6fe91fd.size] = var_1386d828;
		}
	}
	if(!var_a6fe91fd.size)
	{
		return;
	}
	if(!isdefined(var_1386d828))
	{
		var_faa3dbdd = array::randomize(var_a6fe91fd);
		foreach(prop in var_faa3dbdd)
		{
			if(is_true(prop.var_3e64167))
			{
				var_1386d828 = prop;
				break;
			}
		}
		if(!isdefined(var_1386d828))
		{
			var_1386d828 = var_faa3dbdd[0];
		}
	}
	if(!isdefined(var_1386d828))
	{
		return;
	}
	if(!isinarray(level.var_b7a636c9, var_1386d828))
	{
		level.var_b7a636c9[level.var_b7a636c9.size] = var_1386d828;
	}
	if(isdefined(var_c3962187))
	{
		var_1386d828.origin = var_c3962187;
	}
	function_55657fb4(mimic, var_1386d828, var_a6fe91fd, var_d56229a9);
	return var_1386d828;
}

/*
	Name: function_2e8c33f6
	Namespace: namespace_be0f9d50
	Checksum: 0xA6B298B4
	Offset: 0x808
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function function_2e8c33f6()
{
	arrayremovevalue(level.var_b7a636c9, undefined);
	return level.var_b7a636c9;
}

/*
	Name: function_e82cee4e
	Namespace: namespace_be0f9d50
	Checksum: 0xAF1589C8
	Offset: 0x840
	Size: 0x122
	Parameters: 0
	Flags: None
*/
function function_e82cee4e()
{
	arrayremovevalue(level.var_b7a636c9, undefined);
	var_da43492e = [];
	foreach(prop in level.var_b7a636c9)
	{
		if(!prop ishidden())
		{
			if(!isdefined(var_da43492e))
			{
				var_da43492e = [];
			}
			else if(!isarray(var_da43492e))
			{
				var_da43492e = array(var_da43492e);
			}
			if(!isinarray(var_da43492e, prop))
			{
				var_da43492e[var_da43492e.size] = prop;
			}
		}
	}
	return var_da43492e;
}

/*
	Name: function_bc29cf28
	Namespace: namespace_be0f9d50
	Checksum: 0x7CC6984C
	Offset: 0x970
	Size: 0xE6
	Parameters: 0
	Flags: None
*/
function function_bc29cf28()
{
	if(!isdefined(level.var_6939ebc1))
	{
		return [];
	}
	var_526e473a = [];
	foreach(key in getarraykeys(level.var_6939ebc1))
	{
		var_526e473a = arraycombine(var_526e473a, function_7b8e26b3(level.var_6e175eb, key, "lure_prop_type"));
	}
	return var_526e473a;
}

/*
	Name: function_d8f63afd
	Namespace: namespace_be0f9d50
	Checksum: 0x723B856E
	Offset: 0xA60
	Size: 0x2B8
	Parameters: 4
	Flags: Linked
*/
function function_d8f63afd(origin, radius, var_9b487a9b, var_d022f4ac)
{
	if(!isdefined(var_d022f4ac))
	{
		var_d022f4ac = 1;
	}
	var_79422067 = level.var_6e175eb;
	var_79422067 = function_72d3bca6(var_79422067, origin, undefined, undefined, radius);
	foreach(index, spawn_point in var_79422067)
	{
		if(isdefined(level.var_6939ebc1[spawn_point.lure_prop_type].validator) && ![[level.var_6939ebc1[spawn_point.lure_prop_type].validator]](spawn_point))
		{
			var_79422067[index] = undefined;
		}
	}
	arrayremovevalue(var_79422067, undefined);
	if(var_79422067.size > var_9b487a9b)
	{
		var_79422067 = array::randomize(var_79422067);
		array_size = var_79422067.size;
		for(i = 0; i < array_size; i++)
		{
			if(i >= var_9b487a9b)
			{
				arrayremoveindex(var_79422067, i, 1);
			}
		}
	}
	if(var_79422067.size < var_9b487a9b && isdefined(level.var_64aa9d51))
	{
		var_79422067 = arraycombine(var_79422067, [[level.var_64aa9d51]](origin, var_9b487a9b - var_79422067.size), 0, 0);
	}
	var_9d369002 = [];
	foreach(spawn_point in var_79422067)
	{
		if(var_d022f4ac && is_true(spawn_point.claimed))
		{
			continue;
		}
		var_9d369002[var_9d369002.size] = spawn_point;
	}
	return var_9d369002;
}

/*
	Name: function_1541ff3a
	Namespace: namespace_be0f9d50
	Checksum: 0x79A105CC
	Offset: 0xD20
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_1541ff3a(var_9b487a9b, entity)
{
	if(!isdefined(var_9b487a9b))
	{
		var_9b487a9b = 1;
	}
	in_array = isdefined(entity) && isinarray(level.var_70d37ee0, entity);
	return (20 - ((level.var_5fafe5ac.size + level.var_70d37ee0.size) - in_array)) >= var_9b487a9b;
}

/*
	Name: function_c928b745
	Namespace: namespace_be0f9d50
	Checksum: 0x15052DA8
	Offset: 0xDB0
	Size: 0x2B6
	Parameters: 4
	Flags: Linked
*/
function function_c928b745(&spawn_points, var_9b487a9b, entity, var_75f9ae2d)
{
	arrayremovevalue(level.var_5fafe5ac, undefined);
	var_a6fe91fd = [];
	if(!function_1541ff3a(var_9b487a9b, entity))
	{
		in_array = isdefined(entity) && isinarray(level.var_70d37ee0, entity);
		/#
			if(is_true(level.var_bce8fb65))
			{
				println((("" + "") + (20 - ((level.var_5fafe5ac.size + level.var_70d37ee0.size) - in_array)) + "") + var_9b487a9b);
			}
		#/
		if((level.var_5fafe5ac.size + level.var_70d37ee0.size) >= 20)
		{
			return var_a6fe91fd;
		}
		var_9b487a9b = 20 - ((level.var_5fafe5ac.size + level.var_70d37ee0.size) - in_array);
	}
	if(!spawn_points.size)
	{
		/#
			if(is_true(level.var_bce8fb65))
			{
				println("" + "");
			}
		#/
		return var_a6fe91fd;
	}
	spawn_points = array::randomize(spawn_points);
	foreach(loc in spawn_points)
	{
		if(isdefined(loc.lure_prop_type) || function_a1ef346b(undefined, loc.origin, 300).size)
		{
			continue;
		}
		prop = spawn_prop(loc, var_75f9ae2d);
		var_a6fe91fd[var_a6fe91fd.size] = prop;
		if(var_a6fe91fd.size >= var_9b487a9b)
		{
			break;
		}
	}
	return var_a6fe91fd;
}

/*
	Name: function_c4504c49
	Namespace: namespace_be0f9d50
	Checksum: 0xB92EE57B
	Offset: 0x1070
	Size: 0x3B4
	Parameters: 2
	Flags: Linked
*/
function function_c4504c49(spawn_loc, var_75f9ae2d)
{
	if(isdefined(var_75f9ae2d))
	{
		bundle = getscriptbundle(var_75f9ae2d);
	}
	else if(isdefined(spawn_loc.scriptbundlename))
	{
		bundle = getscriptbundle(spawn_loc.scriptbundlename);
	}
	if(!isdefined(bundle))
	{
		return {#hash_6748b2d2:"amb_rattle_barrel", #angle_offset:(0, 0, 0), #pos_offset:(0, 0, 0), #prop_name:#"barrel_rust_01_green"};
	}
	var_641c724f = bundle.var_e451a3f7[randomint(bundle.var_e451a3f7.size)];
	if(!isdefined(var_641c724f))
	{
		return undefined;
	}
	pos_offset = ((isdefined(var_641c724f.offset_x) ? var_641c724f.offset_x : 0), (isdefined(var_641c724f.offset_y) ? var_641c724f.offset_y : 0), (isdefined(var_641c724f.offset_z) ? var_641c724f.offset_z : 0));
	angle_offset = ((isdefined(var_641c724f.pitch) ? var_641c724f.pitch : 0), (isdefined(var_641c724f.yaw) ? var_641c724f.yaw : 0), (isdefined(var_641c724f.roll) ? var_641c724f.roll : 0));
	prop_name = var_641c724f.model;
	var_d08c6baf = 0;
	if(!isdefined(var_641c724f.model) && isdefined(var_641c724f.var_dcb0ac7c))
	{
		var_d08c6baf = 1;
		prop_name = var_641c724f.var_dcb0ac7c;
	}
	if(isdefined(var_641c724f.var_6748b2d2))
	{
		var_6748b2d2 = var_641c724f.var_6748b2d2;
	}
	else
	{
		var_6748b2d2 = undefined;
		/#
			if(is_true(level.var_bce8fb65))
			{
				println((((("" + "") + prop_name) + "") + bundle.name) + "");
			}
		#/
	}
	if(is_true(var_641c724f.var_83556f31))
	{
		var_e9f8015d = 1;
	}
	else
	{
		var_e9f8015d = 0;
	}
	if(is_true(var_641c724f.var_f0c39cc2))
	{
		var_f0c39cc2 = 1;
	}
	else
	{
		var_f0c39cc2 = 0;
	}
	return {#hash_c39008ae:var_f0c39cc2, #hash_b9cdfa83:var_e9f8015d, #hash_d08c6baf:var_d08c6baf, #hash_6748b2d2:var_6748b2d2, #angle_offset:angle_offset, #pos_offset:pos_offset, #prop_name:prop_name};
}

/*
	Name: spawn_prop
	Namespace: namespace_be0f9d50
	Checksum: 0x6E8AF49F
	Offset: 0x1430
	Size: 0x5D4
	Parameters: 3
	Flags: Linked
*/
function spawn_prop(spawn_loc, var_75f9ae2d, var_18840a20)
{
	var_4d71cea4 = function_c4504c49(spawn_loc, var_75f9ae2d);
	model_name = var_4d71cea4.prop_name;
	var_95970e62 = 1;
	if(is_true(var_4d71cea4.var_d08c6baf))
	{
		var_6269746d = getscriptbundle(var_4d71cea4.prop_name);
		var_4d71cea4.pos_offset = ((isdefined(var_6269746d.var_ada071fe) ? var_6269746d.var_ada071fe : 0), (isdefined(var_6269746d.var_5ab74bb1) ? var_6269746d.var_5ab74bb1 : 0), (isdefined(var_6269746d.var_50773731) ? var_6269746d.var_50773731 : 0));
		var_4d71cea4.angle_offset = ((isdefined(var_6269746d.var_7adcadc1) ? var_6269746d.var_7adcadc1 : 0), (isdefined(var_6269746d.var_6731866b) ? var_6269746d.var_6731866b : 0), (isdefined(var_6269746d.var_e6ac0592) ? var_6269746d.var_e6ac0592 : 0));
		if(isdefined(var_6269746d.modelscale))
		{
			var_95970e62 = var_6269746d.modelscale;
		}
		if(isdefined(var_6269746d.model))
		{
			model_name = var_6269746d.model;
		}
		else
		{
			model_name = var_6269746d.weapon.worldmodel;
		}
		if(isdefined(var_6269746d.rarity))
		{
			rarity = var_6269746d.rarity;
		}
	}
	if(isdefined(var_18840a20))
	{
		model_name = var_18840a20;
	}
	playfx("zm_ai/fx9_mimic_prop_spawn_in", spawn_loc.origin + var_4d71cea4.pos_offset);
	if(!isdefined(spawn_loc.angles))
	{
		spawn_loc.angles = (0, 0, 0);
	}
	model = util::spawn_anim_model(model_name, spawn_loc.origin + var_4d71cea4.pos_offset, spawn_loc.angles + var_4d71cea4.angle_offset);
	model playsound(#"hash_4a011e2a2a0742ac");
	spawn_loc.claimed = 1;
	model.spawn_loc = spawn_loc;
	model.var_6748b2d2 = var_4d71cea4.var_6748b2d2;
	model.var_99ae5a60 = var_4d71cea4.var_b9cdfa83;
	model.var_c39008ae = var_4d71cea4.var_c39008ae;
	if(is_true(model.var_99ae5a60))
	{
		model disconnectpaths();
	}
	else
	{
		model notsolid();
		model.var_c9826077 = spawn("script_model", model getcentroid());
		model.var_c9826077 setmodel("wpn_t9_sr_electric_avogadro_projectile");
	}
	model setscale(var_95970e62);
	if(isdefined(var_6269746d))
	{
		model function_619a5c20();
		model.var_a6762160 = var_6269746d;
		model.var_79299f18 = "mimic_world_prop";
		item = function_4ba8fde(model.var_a6762160.name);
		if(isdefined(item))
		{
			model function_46d7f921(item.id);
		}
		switch(var_6269746d.rarity)
		{
			case "off":
			{
				var_9bed58c1 = 0;
				break;
			}
			case "resource":
			{
				var_9bed58c1 = 1;
				break;
			}
			case "uncommon":
			{
				var_9bed58c1 = 2;
				break;
			}
			case "rare":
			{
				var_9bed58c1 = 3;
				break;
			}
			case "epic":
			{
				var_9bed58c1 = 4;
				break;
			}
			case "legendary":
			{
				var_9bed58c1 = 5;
				break;
			}
			case "ultra":
			{
				var_9bed58c1 = 6;
				break;
			}
			case "loadout":
			{
				var_9bed58c1 = 7;
				break;
			}
			default:
			{
				var_9bed58c1 = 0;
				break;
			}
		}
		model clientfield::set("mimic_prop_rob", var_9bed58c1);
	}
	model callback::function_d8abfc3d(#"on_entity_deleted", &function_e85d511c);
	level.var_5fafe5ac[level.var_5fafe5ac.size] = model;
	return model;
}

/*
	Name: function_e85d511c
	Namespace: namespace_be0f9d50
	Checksum: 0xBD563851
	Offset: 0x1A10
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_e85d511c(params)
{
	self connectpaths();
	if(isdefined(self.spawn_loc))
	{
		self.spawn_loc.claimed = undefined;
	}
	if(isdefined(self.var_c9826077))
	{
		self.var_c9826077 delete();
	}
	self clientfield::set("mimic_prop_rob", 0);
}

/*
	Name: function_861757a2
	Namespace: namespace_be0f9d50
	Checksum: 0xF69231D9
	Offset: 0x1AA0
	Size: 0x158
	Parameters: 1
	Flags: Linked
*/
function function_861757a2(entity)
{
	var_1541ff3a = function_1541ff3a(1, entity);
	if(var_1541ff3a && !isinarray(level.var_70d37ee0, entity))
	{
		level.var_70d37ee0[level.var_70d37ee0.size] = entity;
	}
	/#
		if(is_true(level.var_bce8fb65))
		{
			println(("" + "") + entity getentitynumber() + (var_1541ff3a ? "" : "") + "");
		}
	#/
	/#
		if(is_true(level.var_bce8fb65))
		{
			println(((("" + "") + level.var_70d37ee0.size) + "") + 20);
		}
	#/
	return var_1541ff3a;
}

/*
	Name: function_8c7b02b0
	Namespace: namespace_be0f9d50
	Checksum: 0xED629DE4
	Offset: 0x1C00
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_8c7b02b0(entity)
{
	arrayremovevalue(level.var_70d37ee0, entity, 0);
	/#
		if(is_true(level.var_bce8fb65))
		{
			println(("" + "") + entity getentitynumber() + "");
		}
	#/
	/#
		if(is_true(level.var_bce8fb65))
		{
			println((((((("" + "") + level.var_70d37ee0.size) + "") + level.var_5fafe5ac.size) + "") + 20) + "");
		}
	#/
}

/*
	Name: function_b714128e
	Namespace: namespace_be0f9d50
	Checksum: 0x7CCEFB4C
	Offset: 0x1D20
	Size: 0x22
	Parameters: 2
	Flags: Linked
*/
function function_b714128e(var_1386d828, &var_a6fe91fd)
{
	var_1386d828.var_a6fe91fd = var_a6fe91fd;
}

/*
	Name: function_80335b6
	Namespace: namespace_be0f9d50
	Checksum: 0xEFAAAC0D
	Offset: 0x1D50
	Size: 0x314
	Parameters: 3
	Flags: Linked
*/
function function_80335b6(prop, &var_a6fe91fd, condition_func)
{
	if(!isdefined(condition_func))
	{
		condition_func = &function_708fe162;
	}
	prop.var_3e64167 = 1;
	var_7cfc32e1 = function_9cc082d2(prop.origin, 200);
	if(isdefined(var_7cfc32e1))
	{
		position = var_7cfc32e1[#"point"];
		if(!ispointonnavmesh(position, 15.1875))
		{
			position = getclosestpointonnavmesh(position, 15.1875, 15.1875);
		}
		prop.var_7170a3e1 = position;
	}
	if(isdefined(prop.var_7170a3e1))
	{
		if(abs(prop.origin[2] - prop.var_7170a3e1[2]) > 64)
		{
			prop.var_7170a3e1 = undefined;
		}
		if(isdefined(prop.var_7170a3e1) && is_true(prop.var_99ae5a60))
		{
			prop thread function_92ba7baa();
		}
	}
	/#
	#/
	prop thread function_6f7ce46e(var_a6fe91fd, condition_func);
	prop.health = (isdefined(prop.var_a0009315) ? prop.var_a0009315 : 50000);
	prop.takedamage = 1;
	if(isdefined(prop.var_c9826077))
	{
		prop.var_c9826077.health = (isdefined(prop.var_a0009315) ? prop.var_a0009315 : 50000);
		prop.var_c9826077.takedamage = 1;
		prop.var_c9826077 thread function_82305ba4(prop);
	}
	prop.var_10c5271 = 0;
	prop.last_damage_time = 0;
	prop val::reset(#"hash_7a847edcf44664a6", "hide");
	if(is_true(prop.var_99ae5a60))
	{
		prop solid();
	}
	prop callback::function_d8abfc3d(#"hash_2e68909d4e4ed889", &function_24811d29);
	if(is_true(prop.var_c39008ae))
	{
		level thread function_8f0687e(prop);
	}
}

/*
	Name: function_92ba7baa
	Namespace: namespace_be0f9d50
	Checksum: 0x636B71F1
	Offset: 0x2070
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function function_92ba7baa()
{
	self endon(#"death", #"disconnect");
	wait(1);
	if(isdefined(self))
	{
		v_forward = anglestoforward(self.angles) * 8;
		self.var_7170a3e1 = getclosestpointonnavmesh(self.var_7170a3e1 + v_forward, 64, 16);
	}
}

/*
	Name: function_8f0687e
	Namespace: namespace_be0f9d50
	Checksum: 0x6645375A
	Offset: 0x2108
	Size: 0x1E2
	Parameters: 1
	Flags: Linked
*/
function function_8f0687e(prop)
{
	queryresult = positionquery_source_navigation(prop.origin, 48, 128, 64, 32);
	if(!queryresult.data.size)
	{
		return;
	}
	if(isdefined(level.var_f29dd47))
	{
		loc = [[level.var_f29dd47]](prop.origin, queryresult.data);
	}
	else
	{
		loc = array::random(queryresult.data);
	}
	if(!isdefined(loc))
	{
		return;
	}
	var_8b84b3ce = groundtrace((loc.origin + vectorscale((0, 0, 1), 32)) + vectorscale((0, 0, 1), 8), (loc.origin + vectorscale((0, 0, 1), 32)) + (vectorscale((0, 0, -1), 100000)), 0, undefined)[#"position"];
	model1 = #"p9_sur_junk_parts_rare";
	model2 = #"p9_sur_junk_parts_pile";
	var_d661f9f1 = util::spawn_model(array::random([1:model2, 0:model1]), var_8b84b3ce, (0, 0, 0));
	if(isdefined(var_d661f9f1))
	{
		var_d661f9f1 clientfield::set("mimic_prop_lure_fx", 1);
		prop.var_d661f9f1 = var_d661f9f1;
	}
}

/*
	Name: function_55657fb4
	Namespace: namespace_be0f9d50
	Checksum: 0x965AEE81
	Offset: 0x22F8
	Size: 0xAC
	Parameters: 4
	Flags: Linked
*/
function function_55657fb4(mimic, var_1386d828, &var_a6fe91fd, var_d56229a9)
{
	/#
		assert(isinarray(var_a6fe91fd, var_1386d828), "");
	#/
	function_b714128e(var_1386d828, var_a6fe91fd);
	if(isdefined(mimic))
	{
		function_4540d40c(mimic, var_1386d828);
	}
	function_80335b6(var_1386d828, var_a6fe91fd, var_d56229a9);
}

/*
	Name: function_708fe162
	Namespace: namespace_be0f9d50
	Checksum: 0x1ACE515
	Offset: 0x23B0
	Size: 0x4A0
	Parameters: 0
	Flags: Linked
*/
function function_708fe162()
{
	prop_height = vectorscale((0, 0, 1), 64);
	players = arraysortclosest(getplayers(undefined, self.origin, 400), self.origin);
	if(players.size)
	{
		foreach(player in players)
		{
			if(!isalive(player))
			{
				continue;
			}
			if(is_true(player.ignoreme) || player isnotarget() || player inlaststand())
			{
				continue;
			}
			/#
				if(is_true(level.var_72a9fe4c))
				{
					circle(player.origin, player getpathfindingradius(), (0, 1, 0), 0, 1, 1);
				}
			#/
			if(isdefined(player.last_valid_position) && isdefined(self.var_7170a3e1))
			{
				if(!tracepassedonnavmesh(player.last_valid_position, self.var_7170a3e1, player getpathfindingradius()))
				{
					/#
						if(is_true(level.var_72a9fe4c))
						{
							line(player.last_valid_position, self.var_7170a3e1, (1, 0, 1), 1, 0, 1);
							circle(self.var_7170a3e1, player getpathfindingradius(), (1, 0, 0), 0, 1, 1);
						}
					#/
					continue;
				}
			}
			else if(!sighttracepassed(self.origin + prop_height, player gettagorigin("j_spine4"), 0, self))
			{
				/#
					if(is_true(level.var_72a9fe4c))
					{
						line(self.origin + prop_height, player gettagorigin(""), (1, 0.5, 0), 1, 0, 1);
					}
				#/
				continue;
			}
			traceresult = physicstraceex(self.origin + vectorscale((0, 0, 1), 23), player.origin + vectorscale((0, 0, 1), 36), vectorscale((-1, -1, -1), 15), vectorscale((1, 1, 1), 15), [1:player, 0:self]);
			if(traceresult[#"fraction"] >= 1)
			{
				self notify(#"hash_7fb506f40bcf5962");
				return player;
			}
			/#
				if(is_true(level.var_72a9fe4c))
				{
					line(self.origin + vectorscale((0, 0, 1), 8), player.origin + vectorscale((0, 0, 1), 8), (1, 0, 0), 1, 0, 1);
					sphere(traceresult[#"position"], 4, (1, 0, 0), 1, 0, 10, 1);
				}
			#/
		}
	}
}

/*
	Name: function_6f7ce46e
	Namespace: namespace_be0f9d50
	Checksum: 0xF76A9E66
	Offset: 0x2858
	Size: 0x1DA
	Parameters: 2
	Flags: Linked
*/
function function_6f7ce46e(var_a6fe91fd, condition_func)
{
	self endon(#"death", #"hash_4b5f92d76d4a73a3");
	level endon(#"game_ended");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittilltimeout(float(function_60d95f53()) / 1000, #"hash_7fd40fb3202e52db");
		if(is_true(self.var_3a3cdab8))
		{
			continue;
		}
		activator = self [[condition_func]]();
		if(isdefined(activator) || waitresult._notify === #"hash_7fd40fb3202e52db")
		{
			var_ef7458f2 = [0:activator];
			if(waitresult._notify === #"hash_7fd40fb3202e52db")
			{
				var_ef7458f2 = getplayers();
			}
			if(isdefined(self.health) && self.health > 0)
			{
				if(isvehicle(self))
				{
				}
				else if(0.35)
				{
					function_14bad487(self, 0.35, 0.05, 8);
				}
			}
			level thread function_f021ef67(self, var_ef7458f2);
			return;
		}
	}
}

/*
	Name: function_6a447863
	Namespace: namespace_be0f9d50
	Checksum: 0x4C018DCC
	Offset: 0x2A40
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_6a447863(notifyhash)
{
	if(isdefined(self))
	{
		self.angles = self.original_angles;
		self.var_624e969b = undefined;
	}
}

/*
	Name: function_e77fca72
	Namespace: namespace_be0f9d50
	Checksum: 0x9B0BD849
	Offset: 0x2A78
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function function_e77fca72()
{
	self endoncallback(&function_6a447863, #"death", #"hash_7fb506f40bcf5962");
	self.var_624e969b = 1;
	self.original_angles = self.angles;
	while(true)
	{
		function_14bad487(self, 0.75, 0.05, 2);
		if(2)
		{
			wait(2);
		}
	}
}

/*
	Name: function_14bad487
	Namespace: namespace_be0f9d50
	Checksum: 0xA7CE7780
	Offset: 0x2B18
	Size: 0x14E
	Parameters: 4
	Flags: Linked
*/
function function_14bad487(var_1386d828, total_time, var_4c1cc19a, angle)
{
	var_1386d828 endon(#"death", #"entitydeleted");
	original_angles = var_1386d828.angles;
	iterations = total_time / var_4c1cc19a;
	var_ff5fc66c = var_1386d828.angles[2];
	var_ef9ae7e0 = angle;
	self clientfield::set("mimic_prop_rattle_cf", 1);
	if(isdefined(self.var_6748b2d2))
	{
		playsoundatposition(self.var_6748b2d2, self.origin);
	}
	for(i = 0; i < iterations; i++)
	{
		var_1386d828 rotateroll(var_ff5fc66c + var_ef9ae7e0, var_4c1cc19a);
		var_ef9ae7e0 = var_ef9ae7e0 * -1;
		wait(var_4c1cc19a);
	}
	var_1386d828.angles = original_angles;
}

/*
	Name: function_8be6cc92
	Namespace: namespace_be0f9d50
	Checksum: 0xBE72BE7E
	Offset: 0x2C70
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function function_8be6cc92()
{
	level endon(#"game_ended");
	self notify("614d7ba460cb5cf7");
	self endon("614d7ba460cb5cf7");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(!isalive(player))
			{
				continue;
			}
			if(!isdefined(arraygetclosest(player.origin, level.var_b7a636c9, 400)))
			{
				player clientfield::set_to_player("mimic_force_stream", 0);
			}
			else
			{
				player clientfield::set_to_player("mimic_force_stream", 1);
			}
			waitframe(1);
		}
		wait(0.5);
	}
}

/*
	Name: function_24811d29
	Namespace: namespace_be0f9d50
	Checksum: 0xB3E54E73
	Offset: 0x2DD0
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
*/
function function_24811d29(s_info)
{
	prop = self;
	prop.health = (isdefined(prop.var_a0009315) ? prop.var_a0009315 : 50000);
	if(is_true(self.var_3a3cdab8))
	{
		return;
	}
	if(!isplayer(s_info.einflictor) && !isplayer(s_info.eattacker))
	{
		return;
	}
	if(gettime() - prop.last_damage_time > int(3 * 1000))
	{
		prop.var_10c5271 = 0;
	}
	prop.var_10c5271 = prop.var_10c5271 + s_info.idamage;
	prop.last_damage_time = gettime();
	if(prop.var_10c5271 >= 100)
	{
		player = (isplayer(s_info.einflictor) ? s_info.einflictor : s_info.eattacker);
		prop notify(#"hash_4b5f92d76d4a73a3");
		player stats::function_dad108fa(#"hash_7ce9029b025320f0", 1);
		function_f021ef67(prop, [0:player], s_info);
	}
}

/*
	Name: function_82305ba4
	Namespace: namespace_be0f9d50
	Checksum: 0x8901E396
	Offset: 0x2F90
	Size: 0xF0
	Parameters: 1
	Flags: Linked
*/
function function_82305ba4(var_46d20318)
{
	self endon(#"death");
	level endon(#"game_ended");
	collision_model = self;
	while(isdefined(collision_model))
	{
		waitresult = undefined;
		waitresult = collision_model waittill(#"damage");
		collision_model.health = (isdefined(var_46d20318.var_a0009315) ? var_46d20318.var_a0009315 : 50000);
		var_46d20318 dodamage(waitresult.amount, waitresult.position, waitresult.attacker, waitresult.inflictor, undefined, waitresult.mod, waitresult.flags, waitresult.weapon);
	}
}

/*
	Name: function_d52f5cf7
	Namespace: namespace_be0f9d50
	Checksum: 0x32DFCF93
	Offset: 0x3088
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_d52f5cf7(var_1386d828, mimic)
{
	mimic.var_a6fe91fd = var_1386d828.var_a6fe91fd;
	mimic callback::function_d8abfc3d(#"on_ai_killed", &function_1187de9);
}

/*
	Name: function_f021ef67
	Namespace: namespace_be0f9d50
	Checksum: 0x813419EA
	Offset: 0x30E8
	Size: 0x3CE
	Parameters: 3
	Flags: Linked
*/
function function_f021ef67(prop, &var_ef7458f2, var_1fc547b0)
{
	if(isdefined(prop.var_3c964886))
	{
		[[prop.var_3c964886]](prop);
		prop.var_3c964886 = undefined;
	}
	if(isdefined(prop.var_1626d18c))
	{
		arrayremovevalue(prop.var_1626d18c, undefined);
		foreach(entity in prop.var_1626d18c)
		{
			function_d52f5cf7(prop, entity);
			entity callback::callback(#"hash_484127e0cbd8f8cb", {#hash_1fc547b0:var_1fc547b0, #hash_ef7458f2:var_ef7458f2});
		}
	}
	else
	{
		var_32f66be7 = getaicount() < getailimit();
		if(!var_32f66be7 && isdefined(level.var_e1712840) && [[level.var_e1712840]]())
		{
			var_32f66be7 = 1;
		}
		if(var_32f66be7)
		{
			var_c25f58d9 = spawnactor("spawner_bo5_mimic", prop.origin, prop.angles, undefined, 1);
			if(isdefined(var_c25f58d9))
			{
				var_c25f58d9 hide();
				function_4540d40c(var_c25f58d9, prop);
				function_d52f5cf7(prop, var_c25f58d9);
				waitframe(1);
				if(isdefined(var_c25f58d9))
				{
					var_c25f58d9 show();
					var_c25f58d9 callback::callback(#"hash_484127e0cbd8f8cb", {#hash_1fc547b0:var_1fc547b0, #hash_ef7458f2:var_ef7458f2});
				}
			}
		}
		else
		{
			/#
				println("");
			#/
		}
	}
	if(!isdefined(prop))
	{
		return;
	}
	prop.var_1626d18c = undefined;
	prop.claimed = undefined;
	if(!isdefined(prop.spawn_loc.lure_prop_type))
	{
		prop val::set(#"hash_7a847edcf44664a6", "hide", 1);
		prop notsolid();
	}
	prop callback::function_52ac9652(#"hash_2e68909d4e4ed889", &function_24811d29);
	if(isdefined(prop.var_d661f9f1))
	{
		prop.var_d661f9f1 clientfield::set("mimic_prop_lure_fx", 0);
		prop.var_d661f9f1 deletedelay();
		prop.var_d661f9f1 = undefined;
	}
}

/*
	Name: function_4540d40c
	Namespace: namespace_be0f9d50
	Checksum: 0xD7F4BE0B
	Offset: 0x34C0
	Size: 0x1B8
	Parameters: 2
	Flags: Linked
*/
function function_4540d40c(entity, prop)
{
	/#
		assert(!is_true(entity.var_2ca2d270), "");
	#/
	entity.var_1386d828 = prop;
	entity.var_83fa6083 = 1;
	entity val::set(#"hash_263a780666aef25", "hide", 2);
	entity notsolid();
	entity pathmode("dont move", 1);
	entity dontinterpolate();
	entity forceteleport(prop.origin, prop.angles);
	entity setentitypaused(1);
	entity.var_2ca2d270 = 1;
	entity.var_e8920729 = 1;
	entity.var_9d11c76e = 1;
	entity callback::callback(#"hash_29cb63a7ebb5d699", {#prop:prop});
	if(!isdefined(prop.var_1626d18c))
	{
		prop.var_1626d18c = [];
	}
	prop.var_1626d18c[prop.var_1626d18c.size] = entity;
}

/*
	Name: function_1187de9
	Namespace: namespace_be0f9d50
	Checksum: 0xD0C3DD38
	Offset: 0x3680
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_1187de9(params)
{
	arrayremovevalue(self.var_a6fe91fd, undefined);
	foreach(prop in self.var_a6fe91fd)
	{
		if(isdefined(prop.var_33960526))
		{
			[[prop.var_33960526]]();
		}
		level thread function_175bb809(prop);
	}
}

/*
	Name: function_175bb809
	Namespace: namespace_be0f9d50
	Checksum: 0xBACC270D
	Offset: 0x3750
	Size: 0x29C
	Parameters: 2
	Flags: Linked
*/
function function_175bb809(prop, var_38acf8bf)
{
	if(!isdefined(var_38acf8bf))
	{
		var_38acf8bf = 1;
	}
	if(!isdefined(prop))
	{
		return;
	}
	level endon(#"game_ended");
	prop endon(#"death");
	if(isdefined(prop.var_1626d18c))
	{
		function_1eaaceab(prop.var_1626d18c);
		foreach(var_e2986be9 in prop.var_1626d18c)
		{
			if(var_e2986be9 ispaused())
			{
				var_e2986be9 setentitypaused(0);
			}
			var_e2986be9 deletedelay();
		}
	}
	arrayremovevalue(level.var_5fafe5ac, prop);
	arrayremovevalue(level.var_b7a636c9, prop);
	if(isdefined(prop.var_3c964886))
	{
		[[prop.var_3c964886]](prop);
		prop.var_3c964886 = undefined;
	}
	if(isdefined(prop.spawn_loc.lure_prop_type))
	{
		return;
	}
	if(isdefined(prop.var_d661f9f1))
	{
		prop.var_d661f9f1 clientfield::set("mimic_prop_lure_fx", 0);
		prop.var_d661f9f1 deletedelay();
		prop.var_d661f9f1 = undefined;
	}
	if(isdefined(prop.origin) && is_true(var_38acf8bf))
	{
		playfx("zm_ai/fx9_mimic_prop_spawn_out", prop.origin);
		prop playsound(#"hash_408f33e5cf20df9d");
		wait(0.1);
	}
	prop delete();
}

/*
	Name: function_fd24f982
	Namespace: namespace_be0f9d50
	Checksum: 0x26E1CB65
	Offset: 0x39F8
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function function_fd24f982()
{
	arrayremovevalue(level.var_5fafe5ac, undefined);
	foreach(prop in level.var_5fafe5ac)
	{
		level thread function_175bb809(prop);
	}
}

/*
	Name: function_da3be96b
	Namespace: namespace_be0f9d50
	Checksum: 0x1BFA97E1
	Offset: 0x3AB0
	Size: 0x84
	Parameters: 3
	Flags: Linked
*/
function function_da3be96b(type, handler, validator)
{
	if(isdefined(level.var_6939ebc1[type]))
	{
		return;
	}
	if(!isdefined(level.var_6939ebc1))
	{
		level.var_6939ebc1 = [];
	}
	level.var_6939ebc1[type] = {#validator:validator, #handler:handler};
}

/*
	Name: function_6fe38c03
	Namespace: namespace_be0f9d50
	Checksum: 0x6251685B
	Offset: 0x3B40
	Size: 0x1C6
	Parameters: 1
	Flags: Linked
*/
function function_6fe38c03(var_e9aa3e9c)
{
	trigger = var_e9aa3e9c.trigger;
	scriptmodel = var_e9aa3e9c.trigger.scriptmodel;
	if(!isdefined(scriptmodel))
	{
		scriptmodel = var_e9aa3e9c.scriptmodel;
	}
	if(!(isdefined(trigger) && isdefined(scriptmodel)) && !isdefined(var_e9aa3e9c.model))
	{
		return undefined;
	}
	if(isdefined(trigger) && isdefined(scriptmodel))
	{
		var_1386d828 = scriptmodel;
		var_1386d828.spawn_loc = var_e9aa3e9c;
		var_1386d828.var_86038c7b = 1;
		var_1386d828.var_be16d31e = 1;
		if(isdefined(trigger._callbacks[#"on_trigger"]))
		{
			trigger.var_d5434bfe = arraycopy(trigger._callbacks[#"on_trigger"]);
			trigger._callbacks[#"on_trigger"] = undefined;
		}
		var_1386d828.var_d503cbd6 = {#scriptmodel:scriptmodel, #trigger:trigger};
		var_1386d828.var_3c964886 = &function_3c964886;
		trigger callback::on_trigger(&function_55d49380, undefined, var_1386d828);
		return {#activation_func:&function_204a610e, #prop:var_1386d828};
	}
}

/*
	Name: function_644d4bf6
	Namespace: namespace_be0f9d50
	Checksum: 0x119DCF43
	Offset: 0x3D10
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_644d4bf6(var_752f06e1)
{
	if(!isdefined(var_752f06e1))
	{
		return;
	}
	var_1386d828 = var_752f06e1.prop;
	var_1386d828.spawn_loc = var_752f06e1;
	var_1386d828.var_a0009315 = 5;
	var_1386d828.var_3c964886 = &function_3c964886;
	var_1386d828 callback::function_d8abfc3d(#"hash_5f0caa4b2d44fedf", &function_7826507);
	return {#activation_func:&function_204a610e, #prop:var_1386d828};
}

/*
	Name: function_6f514803
	Namespace: namespace_be0f9d50
	Checksum: 0xCB5AF3F7
	Offset: 0x3DD8
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_6f514803(var_f358833e)
{
	if(!isdefined(var_f358833e))
	{
		return;
	}
	var_1386d828 = var_f358833e.prop;
	var_1386d828.var_2e8a136f = 1;
	var_1386d828.spawn_loc = var_f358833e;
	var_1386d828.var_86038c7b = 1;
	var_1386d828.var_be16d31e = 1;
	var_1386d828.var_d503cbd6 = undefined;
	var_1386d828.var_3c964886 = &function_6bb0d769;
	return {#activation_func:&function_204a610e, #prop:var_1386d828};
}

/*
	Name: function_7826507
	Namespace: namespace_be0f9d50
	Checksum: 0x7FE63AE7
	Offset: 0x3E90
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_7826507(params)
{
	self notify(#"hash_1e8aabc2641542e", {#activator:params.attacker});
}

/*
	Name: function_55d49380
	Namespace: namespace_be0f9d50
	Checksum: 0x71CE6D04
	Offset: 0x3ED8
	Size: 0x48
	Parameters: 2
	Flags: Linked
*/
function function_55d49380(var_df401071, var_1386d828)
{
	var_1386d828 notify(#"hash_1e8aabc2641542e", {#activator:var_df401071.activator});
}

/*
	Name: function_95f8029e
	Namespace: namespace_be0f9d50
	Checksum: 0xA3D367ED
	Offset: 0x3F28
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_95f8029e(var_657f8150)
{
	self.var_2e8a136f = 0;
	self notify(#"hash_1e8aabc2641542e", {#activator:var_657f8150});
}

/*
	Name: function_204a610e
	Namespace: namespace_be0f9d50
	Checksum: 0xA27DF305
	Offset: 0x3F70
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_204a610e(params)
{
	waitresult = undefined;
	waitresult = self waittill(#"hash_1e8aabc2641542e");
	return waitresult.activator;
}

/*
	Name: function_3c964886
	Namespace: namespace_be0f9d50
	Checksum: 0x9D2180FE
	Offset: 0x3FB8
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function function_3c964886(var_1386d828)
{
	if(!isdefined(var_1386d828.var_d503cbd6.trigger))
	{
		return;
	}
	trigger = var_1386d828.var_d503cbd6.trigger;
	scriptmodel = var_1386d828.var_d503cbd6.scriptmodel;
	level thread function_f78a8a69(trigger, scriptmodel, 5);
	var_1386d828.var_d503cbd6 = undefined;
}

/*
	Name: function_f78a8a69
	Namespace: namespace_be0f9d50
	Checksum: 0xF0A98437
	Offset: 0x4048
	Size: 0x126
	Parameters: 3
	Flags: Linked
*/
function function_f78a8a69(trigger, scriptmodel, var_3afa44ff)
{
	level endon(#"game_ended");
	trigger endon(#"death");
	scriptmodel endon(#"death");
	scriptmodel val::set(#"hash_b71e2a9baaa9c62", "hide", 2);
	scriptmodel notsolid();
	wait(var_3afa44ff);
	scriptmodel val::reset(#"hash_b71e2a9baaa9c62", "hide");
	scriptmodel solid();
	trigger._callbacks[#"on_trigger"] = arraycopy(trigger.var_d5434bfe);
	trigger.var_d5434bfe = undefined;
}

/*
	Name: function_6bb0d769
	Namespace: namespace_be0f9d50
	Checksum: 0x2F45EAEA
	Offset: 0x4178
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_6bb0d769(var_df6246a6)
{
	level thread function_2e4ba256(var_df6246a6, 5);
}

/*
	Name: function_2e4ba256
	Namespace: namespace_be0f9d50
	Checksum: 0xD187FB81
	Offset: 0x41B0
	Size: 0xBC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_2e4ba256(vehicle, var_3afa44ff)
{
	level endon(#"game_ended");
	vehicle val::set(#"hash_b71e2a9baaa9c62", "hide", 2);
	vehicle notsolid();
	wait(var_3afa44ff);
	if(!isdefined(vehicle))
	{
		return;
	}
	vehicle val::reset(#"hash_b71e2a9baaa9c62", "hide");
	vehicle solid();
}

