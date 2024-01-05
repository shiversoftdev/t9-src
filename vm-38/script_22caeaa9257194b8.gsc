#using script_566bf433dcd9d9c;
#using script_caf007e2a98afa2;
#using scripts\cp_common\gametypes\globallogic_utils.gsc;
#using scripts\core_common\doors_shared.gsc;
#using script_7cc5fb39b97494c4;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_4fa53161;

/*
	Name: function_2dc54c
	Namespace: namespace_4fa53161
	Checksum: 0xFB80F703
	Offset: 0x190
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2dc54c()
{
	level notify(-361867324);
}

/*
	Name: __init__system__
	Namespace: namespace_4fa53161
	Checksum: 0xBD547E
	Offset: 0x1B0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_4ad49805c423429d", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_4fa53161
	Checksum: 0xAB49320E
	Offset: 0x208
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(function_550f629a())
	{
		spawner::add_archetype_spawn_function(#"human", &ai_monitor_doors);
		spawner::add_archetype_spawn_function(#"human", &namespace_4f6b19b0::function_6249a416);
	}
	/#
		function_5ac4dc99("", 0);
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_4fa53161
	Checksum: 0x80F724D1
	Offset: 0x2A8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: function_550f629a
	Namespace: namespace_4fa53161
	Checksum: 0xA51E552F
	Offset: 0x2B8
	Size: 0x1BC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_550f629a()
{
	var_1cde154f = getgametypesetting(#"use_doors");
	var_5a23774b = getdvarint(#"disabledoors", 0);
	if(!is_true(var_1cde154f) || is_true(var_5a23774b))
	{
		return;
	}
	a_doors = struct::get_array("scriptbundle_doors", "classname");
	a_doors = arraycombine(a_doors, getentarray("smart_object_door", "script_noteworthy"), 0, 0);
	foreach(s_instance in a_doors)
	{
		s_door_bundle = getscriptbundle(s_instance.scriptbundlename);
		if(isdefined(s_door_bundle) && is_true(s_door_bundle.door_connect_paths))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: door_manage_openers
	Namespace: namespace_4fa53161
	Checksum: 0x842D0651
	Offset: 0x480
	Size: 0x3BE
	Parameters: 1
	Flags: Linked, Private
*/
function private door_manage_openers(c_door)
{
	c_door.m_e_door endon(#"entitydeleted");
	c_door notify(#"hash_66ae5fc513adfddc");
	c_door endon(#"hash_66ae5fc513adfddc");
	var_f4b53b61 = c_door doors::get_door_center(1);
	/#
		var_be457ed9 = (randomfloat(1), randomfloat(1), randomfloat(1));
	#/
	var_1bb1d9d4 = 72;
	while(true)
	{
		if(c_door flag::get("door_fully_open"))
		{
			return;
		}
		function_1eaaceab(c_door.var_d0ca7119);
		if(c_door.var_d0ca7119.size == 0)
		{
			return;
		}
		c_door.var_d0ca7119 = arraysortclosest(c_door.var_d0ca7119, c_door.m_e_door.origin);
		opener = c_door.var_d0ca7119[0];
		/#
			if(getdvarint(#"hash_33928bcf1b3e5487", 0))
			{
				c_door thread function_cbb3e924(var_be457ed9);
			}
		#/
		closestdist = distance2d(var_f4b53b61, opener.origin);
		var_17b1d600 = 110;
		var_af33ff77 = length(opener getvelocity());
		if(var_af33ff77 > 90)
		{
			var_17b1d600 = 180;
		}
		if(closestdist <= var_17b1d600 && (abs(var_f4b53b61[2] - opener.origin[2])) < var_1bb1d9d4 && !is_true(c_door.breached))
		{
			results = opener function_a847c61f(4096, var_17b1d600 + 50);
			if(results.var_4e035bb7)
			{
				c_door thread door_manager_try_ai_opener(opener);
			}
		}
		foreach(guy in c_door.var_d0ca7119)
		{
			if(guy == opener && !is_true(c_door.breached))
			{
				if(isdefined(guy.ai.waitingfordoor))
				{
					guy stop_waiting_for_door();
				}
				continue;
			}
		}
		waitframe(1);
	}
}

/*
	Name: door_manager_try_ai_opener
	Namespace: namespace_4fa53161
	Checksum: 0x7DAA6DBB
	Offset: 0x848
	Size: 0xB8
	Parameters: 1
	Flags: Linked, Private
*/
function private door_manager_try_ai_opener(opener)
{
	if(is_true(self.lockedforai) || is_true(self.var_526bb929.lockedforai))
	{
		return;
	}
	self.var_14439ba5 = opener;
	result = opener ai_open_try_animated(self);
	if(!is_true(result))
	{
		function_50cd6f16(self.var_d0ca7119, "reset_door_check");
		self.var_14439ba5 = undefined;
		return;
	}
}

/*
	Name: function_50cd6f16
	Namespace: namespace_4fa53161
	Checksum: 0xD880025A
	Offset: 0x908
	Size: 0x68
	Parameters: 2
	Flags: Linked
*/
function function_50cd6f16(var_efcaa748, str_notify)
{
	array_size = var_efcaa748.size;
	for(i = 0; i < array_size; i++)
	{
		elem = var_efcaa748[i];
		if(isdefined(elem))
		{
			elem notify(str_notify);
		}
	}
}

/*
	Name: ai_open_try_animated
	Namespace: namespace_4fa53161
	Checksum: 0x5831BC01
	Offset: 0x978
	Size: 0x13A
	Parameters: 1
	Flags: Linked, Private
*/
function private ai_open_try_animated(c_door)
{
	self endon(#"death");
	c_door.m_e_door endon(#"entitydeleted");
	if(isdefined(self.ai.waitingfordoor))
	{
		self stop_waiting_for_door();
	}
	self.ai.doortoopen = c_door;
	result = undefined;
	result = self waittilltimeout(6, #"hash_6d9a59cc1ef486a8");
	var_f5c28fe2 = result._notify != #"timeout";
	if(var_f5c28fe2)
	{
		self waittilltimeout(4, #"hash_47b8208db121ca21");
	}
	if(isdefined(self.ai.doortoopen) && self.ai.doortoopen == c_door)
	{
		self.ai.doortoopen = undefined;
		self.ai.isopeningdoor = undefined;
	}
	return var_f5c28fe2;
}

/*
	Name: door_add_opener
	Namespace: namespace_4fa53161
	Checksum: 0x1BCCCCE0
	Offset: 0xAC0
	Size: 0xA8
	Parameters: 1
	Flags: Linked, Private
*/
function private door_add_opener(c_door)
{
	if(isdefined(self.ai.currentdoor) && self.ai.currentdoor != c_door)
	{
		arrayremovevalue(self.ai.currentdoor.var_d0ca7119, self);
	}
	self.ai.currentdoor = c_door;
	if(!isdefined(c_door.var_d0ca7119))
	{
		c_door.var_d0ca7119 = [];
	}
	c_door.var_d0ca7119[c_door.var_d0ca7119.size] = self;
}

/*
	Name: remove_as_opener
	Namespace: namespace_4fa53161
	Checksum: 0x41B2058C
	Offset: 0xB70
	Size: 0x52
	Parameters: 0
	Flags: Linked, Private
*/
function private remove_as_opener()
{
	if(isdefined(self.ai.currentdoor))
	{
		arrayremovevalue(self.ai.currentdoor.var_d0ca7119, self);
		self.ai.currentdoor = undefined;
	}
}

/*
	Name: function_a8a940ac
	Namespace: namespace_4fa53161
	Checksum: 0x7DA546CE
	Offset: 0xBD0
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_a8a940ac()
{
	if(isdefined(self.ai.waitingfordoor))
	{
		if(self.ai.waitingfordoor == self.ai.currentdoor)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: stop_waiting_for_door
	Namespace: namespace_4fa53161
	Checksum: 0xB3CC4F88
	Offset: 0xC20
	Size: 0x2E
	Parameters: 0
	Flags: Linked, Private
*/
function private stop_waiting_for_door()
{
	/#
		self notify(#"stop_waiting_for_door");
	#/
	self.ai.waitingfordoor = undefined;
}

/*
	Name: function_cbb3e924
	Namespace: namespace_4fa53161
	Checksum: 0x7A3C50F
	Offset: 0xC58
	Size: 0x16A
	Parameters: 1
	Flags: Private
*/
function private function_cbb3e924(var_be457ed9)
{
	/#
		foreach(i, g in self.var_d0ca7119)
		{
			if(isdefined(self.var_14439ba5) && self.var_14439ba5 == g)
			{
				circle(g.origin, 5, var_be457ed9, 0, 1, 1);
			}
			line(self.m_e_door.origin, g geteye(), var_be457ed9, 1, 0, 1);
			if(i == 0)
			{
				var_cab378c2 = "" + self.m_e_door getentnum();
				self notify(#"hash_46fda91c613b40e5", {#msg:var_cab378c2});
			}
		}
	#/
}

/*
	Name: draw_node_line
	Namespace: namespace_4fa53161
	Checksum: 0x4845998C
	Offset: 0xDD0
	Size: 0xA0
	Parameters: 3
	Flags: Private
*/
function private draw_node_line(node, time, color)
{
	/#
		self endon(#"death");
		timer = gettime() + (time * 1000);
		while(gettime() < timer)
		{
			line(self geteye(), node.origin, color, 0.5, 0, 1);
			wait(0.05);
		}
	#/
}

/*
	Name: function_a07f8293
	Namespace: namespace_4fa53161
	Checksum: 0x913CF68E
	Offset: 0xE78
	Size: 0xB0
	Parameters: 0
	Flags: Private
*/
function private function_a07f8293()
{
	/#
		self endon(#"death");
		var_dc35cd8c = "";
		var_e9968086 = "";
		while(true)
		{
			result = undefined;
			result = self waittill(#"hash_46fda91c613b40e5");
			msg = result.msg;
			var_e9968086 = msg;
			self childthread update_debug(var_e9968086, var_dc35cd8c);
			var_dc35cd8c = var_e9968086;
		}
	#/
}

/*
	Name: update_debug
	Namespace: namespace_4fa53161
	Checksum: 0x6A9480A1
	Offset: 0xF30
	Size: 0x18C
	Parameters: 2
	Flags: Private
*/
function private update_debug(var_e9968086, var_dc35cd8c)
{
	/#
		self notify(#"new_msg");
		self endon(#"new_msg");
		var_852f740c = 1;
		var_f304b84b = 5;
		steps = var_f304b84b * 20;
		var_18c3a98a = var_852f740c / steps;
		time = gettime();
		while(gettime() < time + (var_f304b84b * 1000))
		{
			if(getdvarint(#"hash_33928bcf1b3e5487", 0))
			{
				print3d(self geteye() + vectorscale((0, 0, 1), 15), var_e9968086, (1, 1, 1), 1, 0.3, 1);
				print3d(self geteye() + vectorscale((0, 0, 1), 10), var_dc35cd8c, vectorscale((1, 1, 1), 0.7), var_852f740c, 0.3, 1);
			}
			var_852f740c = var_852f740c - var_18c3a98a;
			wait(0.05);
		}
	#/
}

/*
	Name: function_b0731097
	Namespace: namespace_4fa53161
	Checksum: 0x3FA715A9
	Offset: 0x10C8
	Size: 0x302
	Parameters: 2
	Flags: None
*/
function function_b0731097(var_59e58a96, var_d5edc9c)
{
	path_array = undefined;
	results = undefined;
	distance = 0;
	var_1f2328d0 = self function_4794d6a3();
	goalpos = var_1f2328d0.goalpos;
	if(self isinscriptedstate())
	{
		return undefined;
	}
	if(isdefined(var_1f2328d0.goalvolume))
	{
		chosen_node = self findbestcovernode();
		if(isdefined(chosen_node))
		{
			goalpos = chosen_node.origin;
		}
		else
		{
			return undefined;
		}
	}
	path_array = self function_f14f56a8();
	if(!isdefined(path_array) || path_array.size <= 1)
	{
		return undefined;
	}
	mask = 8;
	for(i = 0; i < path_array.size; i++)
	{
		path_array[i] = path_array[i] + vectorscale((0, 0, 1), 20);
	}
	for(i = 1; i < path_array.size; i++)
	{
		if(isdefined(var_d5edc9c) && distance > var_d5edc9c)
		{
			return undefined;
		}
		prevpos = path_array[i - 1];
		nextpos = path_array[i];
		results = physicstrace(prevpos, nextpos, vectorscale((-1, -1, 0), 5), vectorscale((1, 1, 0), 5), self, mask);
		if(isdefined(results[#"entity"]))
		{
			hitent = results[#"entity"];
			if(isdefined(hitent.c_door))
			{
				var_fe505a43 = hitent function_808e656();
				if(var_fe505a43 & var_59e58a96)
				{
					hitpos = results[#"position"];
					distance = distance + distance(prevpos, hitpos);
					if(isdefined(var_d5edc9c) && distance > var_d5edc9c)
					{
						return undefined;
					}
					return_struct = spawnstruct();
					return_struct.hitpos = hitpos;
					return_struct.hitent = hitent;
					return return_struct;
				}
			}
		}
		distance = distance + distance(prevpos, nextpos);
	}
	return undefined;
}

/*
	Name: function_13f8cd4c
	Namespace: namespace_4fa53161
	Checksum: 0x7C29EC2B
	Offset: 0x13D8
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_13f8cd4c(e_door)
{
	if(!isdefined(e_door) || !isdefined(e_door.c_door) || e_door.c_door flag::get("animating"))
	{
		return undefined;
	}
	if(e_door.c_door flag::get("door_pushable") && !e_door.c_door flag::get("door_fully_open") || !e_door.c_door flag::get("open"))
	{
		return e_door;
	}
	return undefined;
}

/*
	Name: ai_monitor_doors
	Namespace: namespace_4fa53161
	Checksum: 0x780C0663
	Offset: 0x14B0
	Size: 0x368
	Parameters: 0
	Flags: Linked, Private
*/
function private ai_monitor_doors()
{
	self endon(#"death");
	/#
		self thread function_a07f8293();
	#/
	while(true)
	{
		var_12d56c89 = undefined;
		var_12d56c89 = self waittill(#"path_set", #"reset_door_check");
		result = var_12d56c89._notify;
		if(isdefined(self.ai.isopeningdoor))
		{
			continue;
		}
		if(isdefined(self.ai.waitingfordoor))
		{
			if(isdefined(result) && result == "path_set" && isdefined(self.doornode) && isdefined(self.pathgoalpos) && distance2dsquared(self.pathgoalpos, self.doornode.origin) < 4)
			{
				continue;
			}
			self stop_waiting_for_door();
		}
		self remove_as_opener();
		var_88e76247 = 0;
		var_3e8fb6d0 = undefined;
		while(true)
		{
			results = self function_a847c61f(4096);
			doorloc = results.entrypoint[0];
			var_3e8fb6d0 = function_13f8cd4c(results.entity[0]);
			if(isdefined(doorloc))
			{
				if(isdefined(var_3e8fb6d0))
				{
					var_715a5cbd = var_3e8fb6d0.c_door doors::get_door_bottom_center();
					if(distancesquared(self.origin, var_715a5cbd) < 400)
					{
						var_da7ac3f6 = vectornormalize(var_715a5cbd - self.origin);
						if(vectordot(self.lookaheaddir, var_da7ac3f6) < -0.707)
						{
							wait(2);
							continue;
						}
					}
					/#
						self notify(#"hash_46fda91c613b40e5", {#msg:"" + var_3e8fb6d0 getentnum()});
					#/
					var_88e76247 = 1;
					break;
				}
				else
				{
					wait(0.2);
					continue;
				}
			}
			else
			{
				break;
			}
			if(var_88e76247)
			{
				break;
			}
			wait(0.05);
		}
		if(!var_88e76247)
		{
			continue;
		}
		self door_add_opener(var_3e8fb6d0.c_door);
		level thread door_manage_openers(var_3e8fb6d0.c_door);
	}
}

