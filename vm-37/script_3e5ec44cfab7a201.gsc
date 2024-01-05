#using scripts\core_common\struct.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_617a54f4;

/*
	Name: function_d8383812
	Namespace: namespace_617a54f4
	Checksum: 0x543D181
	Offset: 0xC0
	Size: 0x1FC
	Parameters: 6
	Flags: None
*/
function function_d8383812(id, version, var_a1261809, var_3f541f5f, var_9a323ebf, var_b8d19839)
{
	if(!isdefined(var_b8d19839))
	{
		var_b8d19839 = 0;
	}
	if(!isdefined(level.var_d2540500))
	{
		callback::on_actor_killed(&function_88cb5e47);
		if(var_b8d19839)
		{
			callback::on_vehicle_killed(&function_88cb5e47);
		}
		level.var_d2540500 = [];
	}
	if(isstruct(var_a1261809))
	{
		capture_point = var_a1261809;
	}
	else
	{
		capture_point = struct::get(var_a1261809, "script_noteworthy");
	}
	var_1d81ef2d = {#hash_b8d19839:var_b8d19839, #hash_32edfed:var_9a323ebf, #hash_62f0c1c:var_3f541f5f, #active:0, #origin:capture_point.origin, #capture_point:capture_point, #id:id};
	level.var_d2540500[id] = var_1d81ef2d;
	clientfield::register("actor", "sc_" + id, version, 1, "int");
	if(var_b8d19839)
	{
		clientfield::register("vehicle", "sc_" + id, version, 1, "int");
	}
}

/*
	Name: function_3f808d3d
	Namespace: namespace_617a54f4
	Checksum: 0x4574BFE8
	Offset: 0x2C8
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function function_3f808d3d(id)
{
	var_1d81ef2d = level.var_d2540500[id];
	if(!isdefined(var_1d81ef2d))
	{
		return;
	}
	var_1d81ef2d.active = 1;
}

/*
	Name: function_2a94055d
	Namespace: namespace_617a54f4
	Checksum: 0x85174C44
	Offset: 0x310
	Size: 0x66
	Parameters: 1
	Flags: None
*/
function function_2a94055d(id)
{
	var_1d81ef2d = level.var_d2540500[id];
	if(!isdefined(var_1d81ef2d))
	{
		return;
	}
	playsoundatposition(#"hash_21967fb66e85ac4e", var_1d81ef2d.origin);
	var_1d81ef2d.active = 0;
}

/*
	Name: function_88cb5e47
	Namespace: namespace_617a54f4
	Checksum: 0xB1CE61E1
	Offset: 0x380
	Size: 0x164
	Parameters: 1
	Flags: Private
*/
function private function_88cb5e47(params)
{
	if(self.is_exploding !== 1 && isdefined(params.eattacker) && params.eattacker.classname === "worldspawn")
	{
		return;
	}
	foreach(var_1d81ef2d in level.var_d2540500)
	{
		if(!var_1d81ef2d.active)
		{
			continue;
		}
		if(isvehicle(self) && !var_1d81ef2d.var_b8d19839)
		{
			continue;
		}
		if([[var_1d81ef2d.var_62f0c1c]](var_1d81ef2d.capture_point, self))
		{
			[[var_1d81ef2d.var_32edfed]](var_1d81ef2d.capture_point, self);
			self clientfield::set("sc_" + var_1d81ef2d.id, 1);
			break;
		}
	}
}

