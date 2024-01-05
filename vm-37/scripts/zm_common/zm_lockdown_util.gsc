#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_pack_a_punch.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_41fe08c37d53a635;
#using script_35598499769dbb3d;
#using script_71dfbfdfba4489a0;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

class class_6fde4e6 
{

	/*
		Name: constructor
		Namespace: namespace_6fde4e6
		Checksum: 0xF081AEF2
		Offset: 0x3E0
		Size: 0x32
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.claimed = 0;
		self.var_4f0ea1b5 = 0;
		self.owner = undefined;
		self.var_6f08706b = undefined;
	}

	/*
		Name: destructor
		Namespace: namespace_6fde4e6
		Checksum: 0x80F724D1
		Offset: 0x420
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

}

class class_b599a4bc 
{

	/*
		Name: constructor
		Namespace: namespace_b599a4bc
		Checksum: 0x1DE087B2
		Offset: 0x4B8
		Size: 0x1A
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_f6d13e1b = [];
		self.entity = undefined;
	}

	/*
		Name: destructor
		Namespace: namespace_b599a4bc
		Checksum: 0x80F724D1
		Offset: 0x4E0
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

}

#namespace zm_lockdown_util;

/*
	Name: __init__system__
	Namespace: zm_lockdown_util
	Checksum: 0x3253E5EC
	Offset: 0x398
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_lockdown_util", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_lockdown_util
	Checksum: 0x221890FD
	Offset: 0x578
	Size: 0x144
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level thread function_b595044c();
	level thread function_ccf7ac87();
	level.var_492142a5 = [#"lockdown_stub_type_wallbuys":&function_9c7d5271, #"lockdown_stub_type_traps":&function_d2ce5ac1, #"lockdown_stub_type_perks":&function_db989a2a, #"lockdown_stub_type_pap":&function_165e2bd6, #"lockdown_stub_type_magic_box":&function_e6761711, #"lockdown_stub_type_crafting_tables":&function_d0e1d38c, #"lockdown_stub_type_boards":&function_8850974b];
	level.var_85c076ab = [];
	/#
		level function_946bb116();
	#/
}

/*
	Name: function_b595044c
	Namespace: zm_lockdown_util
	Checksum: 0x2CB5ADD1
	Offset: 0x6C8
	Size: 0x104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b595044c()
{
	level endon(#"end_game");
	if(!isdefined(level.var_f17bdf53))
	{
		level.var_f17bdf53 = [];
	}
	if(!isdefined(level.pap_lockdown_stubs))
	{
		level.pap_lockdown_stubs = [];
	}
	if(!isdefined(level.var_9235b607))
	{
		level.var_9235b607 = [];
	}
	if(!isdefined(level.var_16cfe3ef))
	{
		level.var_16cfe3ef = [];
	}
	level flag::wait_till("start_zombie_round_logic");
	function_eeeb30d7();
	function_9559446b();
	function_f7bd473a();
	level flag::wait_till("pap_machine_active");
	function_2bdb235d();
}

/*
	Name: function_ccf7ac87
	Namespace: zm_lockdown_util
	Checksum: 0xA8C21E61
	Offset: 0x7D8
	Size: 0x200
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ccf7ac87()
{
	level endon(#"end_game");
	if(!isdefined(level.var_2510f3e4))
	{
		level.var_2510f3e4 = [];
	}
	level flag::wait_till("start_zombie_round_logic");
	traps = getentarray("zombie_trap", "targetname");
	foreach(trap in traps)
	{
		if(!isdefined(trap._trap_use_trigs))
		{
			continue;
		}
		foreach(trap_trig in trap._trap_use_trigs)
		{
			if(!isdefined(trap_trig._trap))
			{
				continue;
			}
			if(!isdefined(level.var_2510f3e4))
			{
				level.var_2510f3e4 = [];
			}
			else if(!isarray(level.var_2510f3e4))
			{
				level.var_2510f3e4 = array(level.var_2510f3e4);
			}
			level.var_2510f3e4[level.var_2510f3e4.size] = trap_trig;
		}
	}
}

/*
	Name: function_d67bafb5
	Namespace: zm_lockdown_util
	Checksum: 0x1E4F7E42
	Offset: 0x9E0
	Size: 0x35A
	Parameters: 2
	Flags: Linked
*/
function function_d67bafb5(stub, category)
{
	if(!isdefined(stub) || !isdefined(category))
	{
		return;
	}
	switch(category)
	{
		case "lockdown_stub_type_wallbuys":
		{
			if(!isdefined(level.var_f17bdf53))
			{
				level.var_f17bdf53 = [];
			}
			if(!isinarray(level.var_f17bdf53, stub))
			{
				if(!isdefined(level.var_f17bdf53))
				{
					level.var_f17bdf53 = [];
				}
				else if(!isarray(level.var_f17bdf53))
				{
					level.var_f17bdf53 = array(level.var_f17bdf53);
				}
				level.var_f17bdf53[level.var_f17bdf53.size] = stub;
			}
			break;
		}
		case "lockdown_stub_type_pap":
		{
			if(!isdefined(level.pap_lockdown_stubs))
			{
				level.pap_lockdown_stubs = [];
			}
			if(!isinarray(level.pap_lockdown_stubs, stub))
			{
				if(!isdefined(level.pap_lockdown_stubs))
				{
					level.pap_lockdown_stubs = [];
				}
				else if(!isarray(level.pap_lockdown_stubs))
				{
					level.pap_lockdown_stubs = array(level.pap_lockdown_stubs);
				}
				level.pap_lockdown_stubs[level.pap_lockdown_stubs.size] = stub;
			}
			break;
		}
		case "lockdown_stub_type_perks":
		{
			if(!isdefined(level.var_9235b607))
			{
				level.var_9235b607 = [];
			}
			if(!isinarray(level.var_9235b607, stub))
			{
				if(!isdefined(level.var_9235b607))
				{
					level.var_9235b607 = [];
				}
				else if(!isarray(level.var_9235b607))
				{
					level.var_9235b607 = array(level.var_9235b607);
				}
				level.var_9235b607[level.var_9235b607.size] = stub;
			}
			break;
		}
		case "lockdown_stub_type_crafting_tables":
		{
			if(!isdefined(level.var_16cfe3ef))
			{
				level.var_16cfe3ef = [];
			}
			if(!isinarray(level.var_16cfe3ef, stub))
			{
				if(!isdefined(level.var_16cfe3ef))
				{
					level.var_16cfe3ef = [];
				}
				else if(!isarray(level.var_16cfe3ef))
				{
					level.var_16cfe3ef = array(level.var_16cfe3ef);
				}
				level.var_16cfe3ef[level.var_16cfe3ef.size] = stub;
			}
			break;
		}
	}
}

/*
	Name: function_6b9e848
	Namespace: zm_lockdown_util
	Checksum: 0x3ABEB095
	Offset: 0xD48
	Size: 0x164
	Parameters: 1
	Flags: Linked
*/
function function_6b9e848(stub)
{
	function_77caff8b(stub);
	if(isdefined(level.var_f17bdf53) && isinarray(level.var_f17bdf53, stub))
	{
		arrayremovevalue(level.var_f17bdf53, stub);
	}
	if(isdefined(level.pap_lockdown_stubs) && isinarray(level.pap_lockdown_stubs, stub))
	{
		arrayremovevalue(level.pap_lockdown_stubs, stub);
	}
	if(isdefined(level.var_9235b607) && isinarray(level.var_9235b607, stub))
	{
		arrayremovevalue(level.var_9235b607, stub);
	}
	if(isdefined(level.var_16cfe3ef) && isinarray(level.var_16cfe3ef, stub))
	{
		arrayremovevalue(level.var_16cfe3ef, stub);
	}
}

/*
	Name: function_b913ec1b
	Namespace: zm_lockdown_util
	Checksum: 0xF4FBB1F0
	Offset: 0xEB8
	Size: 0xC8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b913ec1b(targetname, category)
{
	foreach(stub in level._unitriggers.trigger_stubs)
	{
		if(isdefined(stub.targetname) && stub.targetname == targetname)
		{
			function_d67bafb5(stub, category);
		}
	}
}

/*
	Name: function_eeeb30d7
	Namespace: zm_lockdown_util
	Checksum: 0x63074F59
	Offset: 0xF88
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_eeeb30d7()
{
	function_b913ec1b("weapon_upgrade", "lockdown_stub_type_wallbuys");
	function_b913ec1b("bowie_upgrade", "lockdown_stub_type_wallbuys");
}

/*
	Name: function_9559446b
	Namespace: zm_lockdown_util
	Checksum: 0x573FB856
	Offset: 0xFD8
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9559446b()
{
	function_b913ec1b("perk_vapor_altar_stub", "lockdown_stub_type_perks");
}

/*
	Name: function_f7bd473a
	Namespace: zm_lockdown_util
	Checksum: 0x28BE08D3
	Offset: 0x1008
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f7bd473a()
{
	function_b913ec1b("crafting_trigger", "lockdown_stub_type_crafting_tables");
}

/*
	Name: function_2bdb235d
	Namespace: zm_lockdown_util
	Checksum: 0x3192CA4E
	Offset: 0x1038
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_2bdb235d()
{
	function_b913ec1b("pap_machine_stub", "lockdown_stub_type_pap");
}

/*
	Name: function_2bdff7e1
	Namespace: zm_lockdown_util
	Checksum: 0x91BDF597
	Offset: 0x1068
	Size: 0xE6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_2bdff7e1(entity, stub, node)
{
	var_5bd89846 = groundtrace(node.origin + vectorscale((0, 0, 1), 8), node.origin + (vectorscale((0, 0, -1), 100000)), 0, entity)[#"position"];
	var_66694b96 = {#angles:node.angles, #origin:var_5bd89846};
	if(!is_true(stub.var_7c2f9a8b))
	{
		stub.var_66694b96 = var_66694b96;
	}
	return var_66694b96;
}

/*
	Name: function_dab6d796
	Namespace: zm_lockdown_util
	Checksum: 0xD9532FCD
	Offset: 0x1158
	Size: 0x374
	Parameters: 2
	Flags: None
*/
function function_dab6d796(entity, stub)
{
	if(!isdefined(stub))
	{
		return undefined;
	}
	if(isdefined(stub.var_66694b96))
	{
		return stub.var_66694b96;
	}
	if(isdefined(stub.target))
	{
		node = getnode(stub.target, "targetname");
		if(isdefined(node))
		{
			return function_2bdff7e1(entity, stub, node);
		}
	}
	radius = entity getpathfindingradius();
	height = entity function_6a9ae71();
	heightoffset = (0, 0, (height * -1) / 2);
	var_e790dc87 = (radius, radius, height / 2);
	if(isentity(stub))
	{
		maxs = stub.maxs;
	}
	else
	{
		switch(stub.script_unitrigger_type)
		{
			case "unitrigger_box_use":
			{
				maxs = (stub.script_width / 2, stub.script_height / 2, stub.script_length / 2);
				break;
			}
			case "unitrigger_radius_use":
			{
				maxs = (stub.radius, stub.script_height / 2, stub.radius);
				break;
			}
		}
	}
	search_radius = max(max(maxs[0] + var_e790dc87[0], maxs[1] + var_e790dc87[1]), maxs[2] + var_e790dc87[2]);
	nodes = getnodearray("lockdown_alignment_node", "script_noteworthy");
	nodes = arraysortclosest(nodes, stub.origin + heightoffset, 1, 0, search_radius);
	fallback_node = undefined;
	foreach(node in nodes)
	{
		if(!isdefined(fallback_node))
		{
			fallback_node = node;
		}
		if(node.script_noteworthy === "lockdown_alignment_node")
		{
			return function_2bdff7e1(entity, stub, node);
		}
	}
	if(isdefined(fallback_node))
	{
		return function_2bdff7e1(entity, stub, fallback_node);
	}
}

/*
	Name: function_da72073
	Namespace: zm_lockdown_util
	Checksum: 0xE67A9E23
	Offset: 0x14D8
	Size: 0xF2
	Parameters: 1
	Flags: None
*/
function function_da72073(stub)
{
	if(!isdefined(stub))
	{
		return undefined;
	}
	if(isdefined(stub.fxnode))
	{
		return stub.fxnode;
	}
	if(isdefined(stub.script_height))
	{
		n_radius = stub.script_height;
	}
	else
	{
		n_radius = 64;
	}
	a_structs = struct::get_array("lockdown_fx", "targetname");
	fxnode = arraygetclosest(stub.origin, a_structs, n_radius);
	if(isdefined(fxnode) && !is_true(stub.var_7e4bc0a2))
	{
		stub.fxnode = fxnode;
	}
	return fxnode;
}

/*
	Name: function_9f952db3
	Namespace: zm_lockdown_util
	Checksum: 0x9FCB3CBE
	Offset: 0x15D8
	Size: 0x184
	Parameters: 3
	Flags: Linked, Private
*/
function private function_9f952db3(stub, entity, maxheight)
{
	if(entity.origin[2] > stub.origin[2])
	{
		/#
			if(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1)
			{
				function_78eae22a(entity, stub, 7);
			}
		#/
		return false;
	}
	if(stub.origin[2] - entity.origin[2] > maxheight)
	{
		/#
			if(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1)
			{
				function_78eae22a(entity, stub, 11, stub.origin[2] - entity.origin[2]);
			}
		#/
		return false;
	}
	return true;
}

/*
	Name: function_adb36e84
	Namespace: zm_lockdown_util
	Checksum: 0x5F2DD3DB
	Offset: 0x1768
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_adb36e84(stub)
{
	self waittill(#"death");
	function_77caff8b(stub);
}

/*
	Name: function_77caff8b
	Namespace: zm_lockdown_util
	Checksum: 0xDCAD844F
	Offset: 0x17A8
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_77caff8b(stub)
{
	if(!isdefined(stub))
	{
		return;
	}
	var_a0692a89 = function_fd31eb92(stub);
	if(isdefined(var_a0692a89) && var_a0692a89.claimed)
	{
		function_66941fc3(stub);
	}
}

/*
	Name: function_66941fc3
	Namespace: zm_lockdown_util
	Checksum: 0x2C4A3437
	Offset: 0x1818
	Size: 0xF4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_66941fc3(stub)
{
	for(var_77f297ef = 0; var_77f297ef < level.var_85c076ab.size; var_77f297ef++)
	{
		var_2943f1ec = level.var_85c076ab[var_77f297ef];
		for(index = 0; index < var_2943f1ec.var_f6d13e1b.size; index++)
		{
			if(var_2943f1ec.var_f6d13e1b[index].stub == stub)
			{
				var_2943f1ec.var_f6d13e1b = array::remove_index(var_2943f1ec.var_f6d13e1b, index);
				break;
			}
		}
		if(var_2943f1ec.var_f6d13e1b.size == 0)
		{
			level.var_85c076ab = array::remove_index(level.var_85c076ab, var_77f297ef);
		}
	}
}

/*
	Name: function_fd31eb92
	Namespace: zm_lockdown_util
	Checksum: 0x11C7E6FA
	Offset: 0x1918
	Size: 0x11C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fd31eb92(stub)
{
	foreach(var_2943f1ec in level.var_85c076ab)
	{
		foreach(var_f1e20c7f in var_2943f1ec.var_f6d13e1b)
		{
			if(var_f1e20c7f.stub === stub || var_f1e20c7f.var_6f08706b === stub)
			{
				return var_f1e20c7f;
			}
		}
	}
}

/*
	Name: function_f7315b07
	Namespace: zm_lockdown_util
	Checksum: 0x913B49F5
	Offset: 0x1A40
	Size: 0x96
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f7315b07(entity)
{
	foreach(var_2943f1ec in level.var_85c076ab)
	{
		if(var_2943f1ec.entity === entity)
		{
			return var_2943f1ec;
		}
	}
}

/*
	Name: function_4ad92a9a
	Namespace: zm_lockdown_util
	Checksum: 0x42A36209
	Offset: 0x1AE0
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4ad92a9a(entity)
{
	foreach(var_2943f1ec in level.var_85c076ab)
	{
		if(var_2943f1ec.entity === entity)
		{
			foreach(var_f1e20c7f in var_2943f1ec.var_f6d13e1b)
			{
				if(is_true(var_f1e20c7f.claimed))
				{
					return var_f1e20c7f;
				}
			}
		}
	}
}

/*
	Name: function_e1f6d06a
	Namespace: zm_lockdown_util
	Checksum: 0xB8C7617A
	Offset: 0x1C10
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e1f6d06a(stub)
{
	var_f1e20c7f = function_fd31eb92(stub);
	return isdefined(var_f1e20c7f) && is_true(var_f1e20c7f.var_4f0ea1b5);
}

/*
	Name: function_55d2ad24
	Namespace: zm_lockdown_util
	Checksum: 0x66DF0A2F
	Offset: 0x1C70
	Size: 0x6E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_55d2ad24(stub, entity)
{
	var_f1e20c7f = function_fd31eb92(stub);
	return isdefined(var_f1e20c7f) && is_true(var_f1e20c7f.claimed) && entity !== var_f1e20c7f.owner;
}

/*
	Name: function_d3fbb5ec
	Namespace: zm_lockdown_util
	Checksum: 0x6F34473D
	Offset: 0x1CE8
	Size: 0x74
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d3fbb5ec(entity, stub, current_zone)
{
	if(isdefined(current_zone) && isdefined(stub.in_zone) && stub.in_zone != current_zone)
	{
		/#
			function_78eae22a(entity, stub, 2);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_9c7d5271
	Namespace: zm_lockdown_util
	Checksum: 0x2F7996D8
	Offset: 0x1D68
	Size: 0x1EE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_9c7d5271(entity, &registerlotus_right, range)
{
	current_zone = entity zm_utility::get_current_zone();
	stubs = arraysortclosest(level.var_f17bdf53, entity.origin, undefined, 0, range);
	foreach(stub in stubs)
	{
		if(function_e1f6d06a(stub))
		{
			/#
				function_78eae22a(entity, stub, 0);
			#/
			continue;
		}
		if(function_55d2ad24(stub, entity))
		{
			/#
				function_78eae22a(entity, stub, 1);
			#/
			continue;
		}
		if(!function_d3fbb5ec(entity, stub, current_zone))
		{
			continue;
		}
		stub.lockdowntype = "lockdown_stub_type_wallbuys";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, stub))
		{
			registerlotus_right[registerlotus_right.size] = stub;
		}
	}
}

/*
	Name: function_fea6f0c0
	Namespace: zm_lockdown_util
	Checksum: 0x742A1EE3
	Offset: 0x1F60
	Size: 0xCC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_fea6f0c0(entity, stub, current_zone)
{
	if(isdefined(current_zone) && isdefined(stub.in_zone) && stub.in_zone != current_zone)
	{
		/#
			function_78eae22a(entity, stub, 2);
		#/
		return false;
	}
	if(isdefined(stub.var_3468124) && stub.var_3468124.var_2977c27 !== "on")
	{
		/#
			function_78eae22a(entity, stub, 17);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_db989a2a
	Namespace: zm_lockdown_util
	Checksum: 0xBC66E994
	Offset: 0x2038
	Size: 0x1EE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_db989a2a(entity, &registerlotus_right, range)
{
	current_zone = entity zm_utility::get_current_zone();
	stubs = arraysortclosest(level.var_9235b607, entity.origin, undefined, 0, range);
	foreach(stub in stubs)
	{
		if(function_e1f6d06a(stub))
		{
			/#
				function_78eae22a(entity, stub, 0);
			#/
			continue;
		}
		if(function_55d2ad24(stub, entity))
		{
			/#
				function_78eae22a(entity, stub, 1);
			#/
			continue;
		}
		if(!function_fea6f0c0(entity, stub, current_zone))
		{
			continue;
		}
		stub.lockdowntype = "lockdown_stub_type_perks";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, stub))
		{
			registerlotus_right[registerlotus_right.size] = stub;
		}
	}
}

/*
	Name: function_ea677a9a
	Namespace: zm_lockdown_util
	Checksum: 0x8BD55C6E
	Offset: 0x2230
	Size: 0x74
	Parameters: 3
	Flags: Linked, Private
*/
function private function_ea677a9a(entity, stub, current_zone)
{
	if(isdefined(current_zone) && isdefined(stub.in_zone) && stub.in_zone != current_zone)
	{
		/#
			function_78eae22a(entity, stub, 2);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_d0e1d38c
	Namespace: zm_lockdown_util
	Checksum: 0xAD12AAF0
	Offset: 0x22B0
	Size: 0x1EE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d0e1d38c(entity, &registerlotus_right, range)
{
	current_zone = entity zm_utility::get_current_zone();
	stubs = arraysortclosest(level.var_16cfe3ef, entity.origin, undefined, 0, range);
	foreach(stub in stubs)
	{
		if(function_e1f6d06a(stub))
		{
			/#
				function_78eae22a(entity, stub, 0);
			#/
			continue;
		}
		if(function_55d2ad24(stub, entity))
		{
			/#
				function_78eae22a(entity, stub, 1);
			#/
			continue;
		}
		if(!function_ea677a9a(entity, stub, current_zone))
		{
			continue;
		}
		stub.lockdowntype = "lockdown_stub_type_crafting_tables";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, stub))
		{
			registerlotus_right[registerlotus_right.size] = stub;
		}
	}
}

/*
	Name: function_95250640
	Namespace: zm_lockdown_util
	Checksum: 0xD8053A84
	Offset: 0x24A8
	Size: 0x17C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_95250640(entity, stub)
{
	if(level flag::get("moving_chest_now"))
	{
		/#
			function_78eae22a(entity, stub.trigger_target, 15);
		#/
		return false;
	}
	if(is_true(stub.trigger_target.hidden))
	{
		/#
			function_78eae22a(entity, stub.trigger_target, 3);
		#/
		return false;
	}
	if(is_true(stub.trigger_target._box_open))
	{
		/#
			function_78eae22a(entity, stub.trigger_target, 4);
		#/
		return false;
	}
	if(is_true(stub.trigger_target.was_temp) || is_true(stub.trigger_target.being_removed))
	{
		/#
			function_78eae22a(entity, stub.trigger_target, 13);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_e6761711
	Namespace: zm_lockdown_util
	Checksum: 0xAB6A1D61
	Offset: 0x2630
	Size: 0x1E6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_e6761711(entity, &registerlotus_right, range)
{
	chests = arraysortclosest(level.chests, entity.origin, undefined, 0, range);
	foreach(chest in chests)
	{
		if(!function_95250640(entity, chest.unitrigger_stub))
		{
			continue;
		}
		if(function_e1f6d06a(chest.unitrigger_stub))
		{
			/#
				function_78eae22a(entity, chest, 0);
			#/
			continue;
		}
		if(function_55d2ad24(chest.unitrigger_stub, entity))
		{
			/#
				function_78eae22a(entity, chest, 1);
			#/
			continue;
		}
		chest.unitrigger_stub.lockdowntype = "lockdown_stub_type_magic_box";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, chest.unitrigger_stub))
		{
			registerlotus_right[registerlotus_right.size] = chest.unitrigger_stub;
		}
	}
}

/*
	Name: function_790e3eb0
	Namespace: zm_lockdown_util
	Checksum: 0xD74EE1DC
	Offset: 0x2820
	Size: 0xA4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_790e3eb0(entity, trigger)
{
	if(trigger.pap_machine.state !== "powered")
	{
		/#
			function_78eae22a(entity, trigger, 5);
		#/
		return false;
	}
	if(!trigger.pap_machine flag::get("pap_waiting_for_user"))
	{
		/#
			function_78eae22a(entity, trigger, 6);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_165e2bd6
	Namespace: zm_lockdown_util
	Checksum: 0x54E86241
	Offset: 0x28D0
	Size: 0x1B6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_165e2bd6(entity, &registerlotus_right, range)
{
	if(!level flag::get("pap_machine_active"))
	{
		return;
	}
	foreach(stub in level.pap_lockdown_stubs)
	{
		if(function_55d2ad24(stub, registerlotus_right))
		{
			/#
				function_78eae22a(registerlotus_right, stub, 1);
			#/
			continue;
		}
		if(!function_790e3eb0(registerlotus_right, stub))
		{
			continue;
		}
		if(function_e1f6d06a(stub))
		{
			/#
				function_78eae22a(registerlotus_right, stub, 0);
			#/
			continue;
		}
		stub.lockdowntype = "lockdown_stub_type_pap";
		if(!isdefined(range))
		{
			range = [];
		}
		else if(!isarray(range))
		{
			range = array(range);
		}
		if(!isinarray(range, stub))
		{
			range[range.size] = stub;
		}
	}
}

/*
	Name: function_809ae5cb
	Namespace: zm_lockdown_util
	Checksum: 0x72D4419F
	Offset: 0x2A90
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_809ae5cb(entity, blocker)
{
	if(zm_utility::all_chunks_destroyed(blocker, blocker.barrier_chunks))
	{
		/#
			function_78eae22a(entity, blocker, 12);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_8850974b
	Namespace: zm_lockdown_util
	Checksum: 0xF4785E5F
	Offset: 0x2AF8
	Size: 0x1DE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_8850974b(entity, &registerlotus_right, range)
{
	blockers = arraysortclosest(level.exterior_goals, entity.origin, undefined, 0, range);
	foreach(blocker in blockers)
	{
		if(function_55d2ad24(blocker, entity))
		{
			/#
				function_78eae22a(entity, blocker, 1);
			#/
			continue;
		}
		if(function_e1f6d06a(blocker))
		{
			/#
				function_78eae22a(entity, blocker, 0);
			#/
			continue;
		}
		if(!function_809ae5cb(entity, blocker))
		{
			/#
				function_78eae22a(entity, blocker, 12);
			#/
			continue;
		}
		blocker.lockdowntype = "lockdown_stub_type_boards";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, blocker))
		{
			registerlotus_right[registerlotus_right.size] = blocker;
		}
	}
}

/*
	Name: function_387fd27e
	Namespace: zm_lockdown_util
	Checksum: 0xBDF145EB
	Offset: 0x2CE0
	Size: 0x74
	Parameters: 2
	Flags: Linked, Private
*/
function private function_387fd27e(entity, trap_trig)
{
	if(!trap_trig._trap._trap_in_use || !trap_trig._trap istriggerenabled())
	{
		/#
			function_78eae22a(entity, trap_trig, 16);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_d2ce5ac1
	Namespace: zm_lockdown_util
	Checksum: 0xECA6B1C9
	Offset: 0x2D60
	Size: 0x18E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d2ce5ac1(entity, &registerlotus_right, range)
{
	trap_trigs = arraysortclosest(level.var_2510f3e4, entity.origin, undefined, 0, range);
	foreach(trap_trig in trap_trigs)
	{
		if(function_55d2ad24(trap_trig, entity))
		{
			/#
				function_78eae22a(entity, trap_trig, 1);
			#/
			continue;
		}
		if(!function_387fd27e(entity, trap_trig))
		{
			continue;
		}
		trap_trig.lockdowntype = "lockdown_stub_type_traps";
		if(!isdefined(registerlotus_right))
		{
			registerlotus_right = [];
		}
		else if(!isarray(registerlotus_right))
		{
			registerlotus_right = array(registerlotus_right);
		}
		if(!isinarray(registerlotus_right, trap_trig))
		{
			registerlotus_right[registerlotus_right.size] = trap_trig;
		}
	}
}

/*
	Name: function_22aeb4e9
	Namespace: zm_lockdown_util
	Checksum: 0x11D1BA13
	Offset: 0x2EF8
	Size: 0xD2
	Parameters: 1
	Flags: None
*/
function function_22aeb4e9(lockdowntype)
{
	switch(lockdowntype)
	{
		case "lockdown_stub_type_pap":
		{
			return "PAP";
		}
		case "lockdown_stub_type_magic_box":
		{
			return "MAGIC_BOX";
		}
		case "lockdown_stub_type_boards":
		{
			return "BOARDS";
		}
		case "lockdown_stub_type_wallbuys":
		{
			return "WALLBUY";
		}
		case "lockdown_stub_type_crafting_tables":
		{
			return "CRAFTING_TABLE";
		}
		case "lockdown_stub_type_perks":
		{
			return "PERK";
		}
		case "lockdown_stub_type_traps":
		{
			return "TRAP";
		}
	}
	return "INVALID";
}

/*
	Name: function_87c1193e
	Namespace: zm_lockdown_util
	Checksum: 0x425439AD
	Offset: 0x2FD8
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function function_87c1193e(entity)
{
	var_a0692a89 = function_4ad92a9a(entity);
	if(isdefined(var_a0692a89))
	{
		return var_a0692a89.stub;
	}
}

/*
	Name: function_50ba1eb0
	Namespace: zm_lockdown_util
	Checksum: 0x5164C311
	Offset: 0x3020
	Size: 0x134
	Parameters: 2
	Flags: None
*/
function function_50ba1eb0(entity, stub)
{
	var_2943f1ec = function_f7315b07(entity);
	if(!isdefined(var_2943f1ec))
	{
		var_2943f1ec = new class_b599a4bc();
		var_2943f1ec.entity = entity;
		array::add(level.var_85c076ab, var_2943f1ec);
	}
	var_f1e20c7f = function_fd31eb92(stub);
	if(!isdefined(var_f1e20c7f))
	{
		var_f1e20c7f = new class_6fde4e6();
		var_f1e20c7f.stub = stub;
		var_f1e20c7f.owner = entity;
		var_f1e20c7f.claimed = 1;
		array::add(var_2943f1ec.var_f6d13e1b, var_f1e20c7f);
		/#
			function_78eae22a(entity, stub, 10);
		#/
	}
	entity thread function_adb36e84(stub);
}

/*
	Name: function_9b84bb88
	Namespace: zm_lockdown_util
	Checksum: 0xA5D4E7DC
	Offset: 0x3160
	Size: 0x1E2
	Parameters: 4
	Flags: None
*/
function function_9b84bb88(entity, stubtypes, var_d05e79c8, var_c7455683)
{
	/#
		if(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1)
		{
			entity.var_d187874c = [];
		}
	#/
	registerlotus_right = [];
	foreach(stubtype in stubtypes)
	{
		[[level.var_492142a5[stubtype]]](entity, registerlotus_right, var_d05e79c8);
	}
	registerlotus_right = array::filter(registerlotus_right, 0, &function_9f952db3, entity, var_c7455683);
	/#
		if(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1)
		{
			function_6351d1c3(entity, registerlotus_right, var_d05e79c8);
		}
	#/
	return arraysortclosest(registerlotus_right, entity.origin);
}

/*
	Name: function_7258b5cc
	Namespace: zm_lockdown_util
	Checksum: 0xA982D1C9
	Offset: 0x3350
	Size: 0x34E
	Parameters: 4
	Flags: None
*/
function function_7258b5cc(entity, var_410a8c7, var_2baba799, unlockfunc)
{
	var_a0692a89 = function_4ad92a9a(entity);
	if(!isdefined(var_a0692a89) || !isdefined(var_a0692a89.stub))
	{
		return;
	}
	if(!function_c9105448(entity, var_a0692a89.stub))
	{
		function_77caff8b(var_a0692a89.stub);
		return undefined;
	}
	stub = var_a0692a89.stub;
	if(stub.lockdowntype === "lockdown_stub_type_boards")
	{
		zm_blockers::open_zbarrier(stub);
		function_66941fc3(stub);
		return;
	}
	if(stub.lockdowntype === "lockdown_stub_type_traps")
	{
		stub._trap notify(#"trap_finished");
		function_66941fc3(stub);
		return;
	}
	if(!isentity(stub))
	{
		if(!isdefined(stub.var_a0fc37f6))
		{
			stub.var_a0fc37f6 = stub.prompt_and_visibility_func;
		}
		stub.prompt_and_visibility_func = var_410a8c7;
		if(!isdefined(stub.var_492080a5))
		{
			stub.var_492080a5 = stub.trigger_func;
		}
		stub.trigger_func = var_2baba799;
		zm_unitrigger::reregister_unitrigger(stub);
	}
	else
	{
		stub triggerenable(0);
		newstub = stub zm_unitrigger::function_9267812e(stub.maxs[0] - stub.mins[0], stub.maxs[1] - stub.mins[1], stub.maxs[2] - stub.mins[2]);
		newstub.prompt_and_visibility_func = var_410a8c7;
		newstub.var_6f08706b = stub;
		newstub.lockdowntype = stub.lockdowntype;
		newstub.script_string = stub.script_string;
		stub.lockdowntype = undefined;
		stub.lockdownstub = newstub;
		var_a0692a89.stub = newstub;
		var_a0692a89.var_6f08706b = stub;
		stub = newstub;
		zm_unitrigger::register_unitrigger(newstub, var_2baba799);
	}
	if(stub.lockdowntype === "lockdown_stub_type_perks")
	{
		stub.var_3468124 zm_perks::function_efd2c9e6();
	}
	stub.unlockfunc = unlockfunc;
	var_a0692a89.var_4f0ea1b5 = 1;
	var_a0692a89.claimed = 0;
	return stub;
}

/*
	Name: function_7bfa8895
	Namespace: zm_lockdown_util
	Checksum: 0x6CBDB178
	Offset: 0x36A8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_7bfa8895(entity)
{
	return isdefined(function_4ad92a9a(entity));
}

/*
	Name: function_b5dd9241
	Namespace: zm_lockdown_util
	Checksum: 0xEB0B8412
	Offset: 0x36D8
	Size: 0x48
	Parameters: 1
	Flags: None
*/
function function_b5dd9241(stub)
{
	var_a0692a89 = function_fd31eb92(stub);
	if(!isdefined(var_a0692a89))
	{
		return 0;
	}
	return var_a0692a89.var_4f0ea1b5 === 1;
}

/*
	Name: function_c9105448
	Namespace: zm_lockdown_util
	Checksum: 0x716581D5
	Offset: 0x3728
	Size: 0x1AA
	Parameters: 2
	Flags: Linked
*/
function function_c9105448(entity, stub)
{
	switch(stub.lockdowntype)
	{
		case "lockdown_stub_type_boards":
		{
			return function_809ae5cb(entity, stub);
		}
		case "lockdown_stub_type_crafting_tables":
		{
			current_zone = entity zm_utility::get_current_zone();
			return function_ea677a9a(entity, stub, current_zone);
		}
		case "lockdown_stub_type_magic_box":
		{
			return function_95250640(entity, stub);
		}
		case "lockdown_stub_type_pap":
		{
			return function_790e3eb0(entity, stub);
		}
		case "lockdown_stub_type_perks":
		{
			current_zone = entity zm_utility::get_current_zone();
			return function_fea6f0c0(entity, stub, current_zone);
		}
		case "lockdown_stub_type_wallbuys":
		{
			current_zone = entity zm_utility::get_current_zone();
			return function_d3fbb5ec(entity, stub, current_zone);
		}
		case "lockdown_stub_type_traps":
		{
			return function_387fd27e(entity, stub);
		}
		default:
		{
			return 1;
		}
	}
}

/*
	Name: function_ac6907ec
	Namespace: zm_lockdown_util
	Checksum: 0x7329D870
	Offset: 0x38E0
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_ac6907ec()
{
	var_a0692a89 = function_fd31eb92(self);
	if(isdefined(var_a0692a89))
	{
		var_a0692a89.var_4f0ea1b5 = 2;
	}
	if(isdefined(self) && isdefined(self.unlockfunc))
	{
		[[self.unlockfunc]](self);
	}
	self.prompt_and_visibility_func = self.var_a0fc37f6;
	self.trigger_func = self.var_492080a5;
	if(self.lockdowntype === "lockdown_stub_type_perks")
	{
		self.var_3468124 zm_perks::function_1e721859();
	}
	self.var_a0fc37f6 = undefined;
	self.var_492080a5 = undefined;
	function_66941fc3(self);
	zm_unitrigger::reregister_unitrigger(self);
}

/*
	Name: function_4de23f77
	Namespace: zm_lockdown_util
	Checksum: 0xCBA18870
	Offset: 0x39E0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_4de23f77()
{
	var_a0692a89 = function_fd31eb92(self);
	if(isdefined(var_a0692a89))
	{
		var_a0692a89.var_4f0ea1b5 = 2;
	}
	self.var_6f08706b.lockdownstub = undefined;
	if(isdefined(self) && isdefined(self.unlockfunc))
	{
		[[self.unlockfunc]](self);
	}
	self.var_6f08706b triggerenable(1);
	function_66941fc3(self);
	zm_unitrigger::unregister_unitrigger(self);
}

/*
	Name: function_61a9bc58
	Namespace: zm_lockdown_util
	Checksum: 0x50D52885
	Offset: 0x3AB0
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function function_61a9bc58()
{
	var_a0692a89 = function_fd31eb92(self);
	/#
		assert(isdefined(var_a0692a89));
	#/
	self.var_6156031a = 1;
	if(isdefined(self.var_6f08706b))
	{
		self function_4de23f77();
	}
	else
	{
		self function_ac6907ec();
	}
	self.var_6156031a = undefined;
}

/*
	Name: function_78eae22a
	Namespace: zm_lockdown_util
	Checksum: 0x648DE244
	Offset: 0x3B50
	Size: 0x124
	Parameters: 4
	Flags: Variadic
*/
function function_78eae22a(entity, stub, reason, ...)
{
	/#
		if(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1)
		{
			if(!isdefined(entity.var_d187874c))
			{
				entity.var_d187874c = [];
			}
			else if(!isarray(entity.var_d187874c))
			{
				entity.var_d187874c = array(entity.var_d187874c);
			}
			entity.var_d187874c[entity.var_d187874c.size] = {#args:vararg, #reason:reason, #stub:stub};
		}
	#/
}

/*
	Name: function_f3cff6ff
	Namespace: zm_lockdown_util
	Checksum: 0x4FF261A9
	Offset: 0x3C80
	Size: 0x520
	Parameters: 1
	Flags: None
*/
function function_f3cff6ff(entity)
{
	/#
		if(!(getdvarint(#"hash_3ec02cda135af40f", 0) == 1 && getdvarint(#"recorder_enablerec", 0) == 1))
		{
			return;
		}
		if(!isdefined(entity.var_d187874c))
		{
			return;
		}
		if((getdvarint(#"zm_lockdown_ent", -1)) != entity getentitynumber())
		{
			return;
		}
		foreach(var_ca00d79a in entity.var_d187874c)
		{
			text = entity getentitynumber() + "";
			color = (1, 0, 0);
			switch(var_ca00d79a.reason)
			{
				case 0:
				{
					text = text + "";
					break;
				}
				case 1:
				{
					text = text + "";
					break;
				}
				case 2:
				{
					text = text + "";
					break;
				}
				case 3:
				{
					text = text + "";
					break;
				}
				case 4:
				{
					text = text + "";
					break;
				}
				case 5:
				{
					text = text + "";
					break;
				}
				case 6:
				{
					text = text + "";
					break;
				}
				case 8:
				{
					text = text + ("" + var_ca00d79a.args[0]);
					break;
				}
				case 9:
				{
					text = text + "";
					break;
				}
				case 7:
				{
					text = text + "";
					break;
				}
				case 11:
				{
					text = text + ("" + var_ca00d79a.args[0]);
					break;
				}
				case 10:
				{
					text = text + "";
					color = (0, 1, 0);
					break;
				}
				case 13:
				{
					text = text + "";
					break;
				}
				case 14:
				{
					text = text + "";
					recordstar(var_ca00d79a.args[0], (0, 1, 1));
					recordstar(var_ca00d79a.args[1].origin, (1, 0, 1));
					recordline(var_ca00d79a.args[1].origin, var_ca00d79a.args[1].origin + (anglestoforward(var_ca00d79a.args[1].angles) * 10), (1, 1, 0));
					break;
				}
				case 15:
				{
					text = text + "";
					break;
				}
				case 16:
				{
					text = text + "";
					break;
				}
				case 17:
				{
					text = text + "";
					break;
				}
			}
			recordstar(var_ca00d79a.stub.origin, (1, 1, 0));
			record3dtext(text, var_ca00d79a.stub.origin + vectorscale((0, 0, 1), 10), color);
		}
	#/
}

/*
	Name: function_6351d1c3
	Namespace: zm_lockdown_util
	Checksum: 0x5EBAA878
	Offset: 0x41A8
	Size: 0x100
	Parameters: 3
	Flags: Private
*/
function private function_6351d1c3(entity, registerlotus_right, var_d05e79c8)
{
	/#
		foreach(stub in registerlotus_right)
		{
			dist = distancesquared(entity.origin, stub.origin);
			if(dist > sqr(var_d05e79c8))
			{
				function_78eae22a(entity, stub, 8, sqrt(dist));
			}
		}
	#/
}

/*
	Name: function_946bb116
	Namespace: zm_lockdown_util
	Checksum: 0x65C583B4
	Offset: 0x42B0
	Size: 0xA4
	Parameters: 0
	Flags: Private
*/
function private function_946bb116()
{
	/#
		zm_devgui::add_custom_devgui_callback(&function_2765c63);
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
	#/
}

/*
	Name: function_2765c63
	Namespace: zm_lockdown_util
	Checksum: 0x20326966
	Offset: 0x4360
	Size: 0xAA
	Parameters: 1
	Flags: Private
*/
function private function_2765c63(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_619d20b906a39230":
			{
				level.var_cd20e41b = !is_true(level.var_cd20e41b);
				if(is_true(level.var_cd20e41b))
				{
					level thread function_6e1690d5();
				}
				else
				{
					level notify(#"hash_52b90374b27fcb8a");
				}
				break;
			}
		}
	#/
}

/*
	Name: function_6e1690d5
	Namespace: zm_lockdown_util
	Checksum: 0x36D106D3
	Offset: 0x4418
	Size: 0x3CC
	Parameters: 0
	Flags: Private
*/
function private function_6e1690d5()
{
	/#
		self notify("");
		self endon("");
		level endon(#"hash_52b90374b27fcb8a");
		stubs = arraycombine(level.exterior_goals, level.var_16cfe3ef, 0, 0);
		stubs = arraycombine(stubs, level.pap_lockdown_stubs, 0, 0);
		stubs = arraycombine(stubs, level.var_9235b607, 0, 0);
		stubs = arraycombine(stubs, level.var_2510f3e4, 0, 0);
		stubs = arraycombine(stubs, level.var_f17bdf53, 0, 0);
		foreach(chest in level.chests)
		{
			if(!isdefined(stubs))
			{
				stubs = [];
			}
			else if(!isarray(stubs))
			{
				stubs = array(stubs);
			}
			stubs[stubs.size] = chest.unitrigger_stub;
		}
		var_3bd3c0c1 = vectorscale((-1, -1, 0), 16);
		var_cbe5413e = (16, 16, 32);
		while(true)
		{
			wait(0.5);
			entity = getentbynum(getdvarint(#"zm_lockdown_ent", -1));
			if(!isdefined(entity))
			{
				continue;
			}
			foreach(stub in stubs)
			{
				var_754b10b4 = function_dab6d796(entity, stub);
				if(isdefined(var_754b10b4))
				{
					box(var_754b10b4.origin, var_3bd3c0c1, var_cbe5413e, var_754b10b4.angles[1], (0, 1, 0), 1, 0, 10);
					line(var_754b10b4.origin, var_754b10b4.origin + (anglestoforward(var_754b10b4.angles) * 32), (0, 1, 0), 1, 0, 10);
					continue;
				}
				circle(stub.origin, 16, (1, 0, 0), 0, 0, 10);
			}
		}
	#/
}

