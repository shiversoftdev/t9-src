#using script_1254ac024174d9c0;
#using script_14f4a3c583c77d4b;
#using script_3f9e0dc8454d98e1;
#using script_467027ea7017462b;
#using script_52c6c2d1a2ef1b46;
#using script_53efad19aa55a030;
#using script_6e3c826b1814cab6;
#using script_ab890501c40b73c;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_challenges.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_crafting;

/*
	Name: function_fdd95943
	Namespace: zm_crafting
	Checksum: 0xF5C41DF1
	Offset: 0x280
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fdd95943()
{
	level notify(1427385702);
}

/*
	Name: function_89f2df9
	Namespace: zm_crafting
	Checksum: 0x4046639E
	Offset: 0x2A0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_crafting", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_crafting
	Checksum: 0x654BDD48
	Offset: 0x2F8
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_5df2581a = [];
	level.var_d95bcda9 = [];
	function_475a63eb();
}

/*
	Name: function_8ac3bea9
	Namespace: zm_crafting
	Checksum: 0x4C45F3EB
	Offset: 0x330
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	function_7a8f3cbd();
	function_60a6c623();
	setup_tables();
	if(zombie_utility::function_d2dfacfd(#"hash_44737d225ec3b9d7") || namespace_59ff1d6c::function_901b751c(#"hash_2a5dc43e6de87347"))
	{
		level thread function_40f32480();
	}
	/#
		thread devgui_think();
	#/
}

/*
	Name: function_60a6c623
	Namespace: zm_crafting
	Checksum: 0x5667CCEA
	Offset: 0x3E0
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function function_60a6c623()
{
	var_d3701e86 = getscriptbundles("craftfoundry");
	foreach(foundry in var_d3701e86)
	{
		setup_craftfoundry(foundry);
	}
}

/*
	Name: setup_craftfoundry
	Namespace: zm_crafting
	Checksum: 0xF365AF2A
	Offset: 0x490
	Size: 0x23C
	Parameters: 1
	Flags: Linked
*/
function setup_craftfoundry(craftfoundry)
{
	if(isdefined(craftfoundry))
	{
		if(!is_true(craftfoundry.loaded))
		{
			craftfoundry.loaded = 1;
			craftfoundry.blueprints = [];
			switch(craftfoundry.var_2a2adea3)
			{
				case 8:
				{
					craftfoundry.blueprints[7] = function_b18074d0(craftfoundry.var_b81b4995);
				}
				case 7:
				{
					craftfoundry.blueprints[6] = function_b18074d0(craftfoundry.var_5e039567);
				}
				case 6:
				{
					craftfoundry.blueprints[5] = function_b18074d0(craftfoundry.var_b84049db);
				}
				case 5:
				{
					craftfoundry.blueprints[4] = function_b18074d0(craftfoundry.var_5dee9539);
				}
				case 4:
				{
					craftfoundry.blueprints[3] = function_b18074d0(craftfoundry.var_93b280c0);
				}
				case 3:
				{
					craftfoundry.blueprints[2] = function_b18074d0(craftfoundry.var_a980ac5c);
				}
				case 2:
				{
					craftfoundry.blueprints[1] = function_b18074d0(craftfoundry.var_339dfcd);
				}
				case 1:
				{
					craftfoundry.blueprints[0] = function_b18074d0(craftfoundry.var_110b7b70);
				}
			}
			/#
				function_e197bb07(craftfoundry);
			#/
		}
	}
}

/*
	Name: setup_tables
	Namespace: zm_crafting
	Checksum: 0xF4576058
	Offset: 0x6D8
	Size: 0x228
	Parameters: 0
	Flags: Linked
*/
function setup_tables()
{
	level.var_4fe2f84d = [];
	var_c443493d = getentarray("crafting_trigger", "targetname");
	foreach(trigger in var_c443493d)
	{
		var_6886faaa = trigger.var_6886faaa;
		if(isdefined(var_6886faaa))
		{
			trigger.craftfoundry = function_c1552513(var_6886faaa);
		}
		else
		{
			/#
				assertmsg("");
			#/
		}
		unitrigger = function_f665fde0(trigger);
		if(!isdefined(level.var_4fe2f84d[var_6886faaa]))
		{
			level.var_4fe2f84d[var_6886faaa] = [];
		}
		if(!isdefined(level.var_4fe2f84d[var_6886faaa]))
		{
			level.var_4fe2f84d[var_6886faaa] = [];
		}
		else if(!isarray(level.var_4fe2f84d[var_6886faaa]))
		{
			level.var_4fe2f84d[var_6886faaa] = array(level.var_4fe2f84d[var_6886faaa]);
		}
		if(!isinarray(level.var_4fe2f84d[var_6886faaa], unitrigger))
		{
			level.var_4fe2f84d[var_6886faaa][level.var_4fe2f84d[var_6886faaa].size] = unitrigger;
		}
		/#
			level thread function_3012605d(unitrigger);
		#/
	}
}

/*
	Name: function_6dccf508
	Namespace: zm_crafting
	Checksum: 0x2C0285FA
	Offset: 0x908
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function function_6dccf508()
{
	/#
		assert(!is_true(self.registered), "");
	#/
	zm_unitrigger::register_static_unitrigger(self, &function_369159af);
	self function_35f5c90b(#"craft");
	self.crafted = 0;
	self.blueprint.completed = 0;
}

/*
	Name: function_c1552513
	Namespace: zm_crafting
	Checksum: 0x88D8EED9
	Offset: 0x9A8
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function function_c1552513(name)
{
	craftfoundry = getscriptbundle(name);
	if(isdefined(craftfoundry))
	{
		craftfoundry.name = name;
		setup_craftfoundry(craftfoundry);
	}
	else
	{
		/#
			assertmsg("" + name);
		#/
	}
	return craftfoundry;
}

/*
	Name: function_b18074d0
	Namespace: zm_crafting
	Checksum: 0x9C2E2B06
	Offset: 0xA30
	Size: 0x478
	Parameters: 1
	Flags: Linked
*/
function function_b18074d0(name)
{
	blueprint = getscriptbundle(name);
	if(isdefined(blueprint))
	{
		if(!is_true(blueprint.loaded))
		{
			blueprint.loaded = 1;
			blueprint.name = name;
			blueprint.components = [];
			switch(blueprint.var_f4a82731)
			{
				case 8:
				{
					blueprint.components[7] = function_4c2f8683(blueprint.var_f4d434cb, blueprint);
				}
				case 7:
				{
					blueprint.components[6] = function_4c2f8683(blueprint.var_e71f1961, blueprint);
				}
				case 6:
				{
					blueprint.components[5] = function_4c2f8683(blueprint.registerperk_packa_seepainterminate, blueprint);
				}
				case 5:
				{
					blueprint.components[4] = function_4c2f8683(blueprint.var_4282502a, blueprint);
				}
				case 4:
				{
					blueprint.components[3] = function_4c2f8683(blueprint.var_7b8e4241, blueprint);
				}
				case 3:
				{
					blueprint.components[2] = function_4c2f8683(blueprint.var_2e0a273a, blueprint);
				}
				case 2:
				{
					blueprint.components[1] = function_4c2f8683(blueprint.var_670f9944, blueprint);
				}
				case 1:
				{
					blueprint.components[0] = function_4c2f8683(blueprint.var_99577dd3, blueprint);
				}
			}
			blueprint.var_54a97edd = function_4c2f8683(blueprint.result, blueprint);
			x = (isdefined(blueprint.var_2206e7ed) ? float(blueprint.var_2206e7ed) : 0);
			y = (isdefined(blueprint.var_e414062) ? float(blueprint.var_e414062) : 0);
			z = (isdefined(blueprint.var_3c809ce0) ? float(blueprint.var_3c809ce0) : 0);
			blueprint.v_offset = (x, y, z);
			x = (isdefined(blueprint.prj_scr_round_pause) ? float(blueprint.prj_scr_round_pause) : 0);
			y = (isdefined(blueprint.var_11928e3b) ? float(blueprint.var_11928e3b) : 0);
			z = (isdefined(blueprint.var_71c8b937) ? float(blueprint.var_71c8b937) : 0);
			blueprint.v_angles = (x, y, z);
			if(!isdefined(blueprint.var_4dbc4aee))
			{
				blueprint.var_4dbc4aee = "ERROR: Missing Prompt String";
			}
			function_728a82e0(blueprint);
			/#
				level thread function_e5af6b6e(blueprint);
			#/
		}
	}
	else
	{
		/#
			assertmsg("" + name);
		#/
	}
	return blueprint;
}

/*
	Name: function_4c2f8683
	Namespace: zm_crafting
	Checksum: 0xA37EE4DC
	Offset: 0xEB0
	Size: 0x2F8
	Parameters: 2
	Flags: Linked
*/
function function_4c2f8683(component, blueprint)
{
	if(isstring(component) || function_7a600918(component))
	{
		component_name = component;
		component = getweapon(component);
	}
	else
	{
		component_name = component.name;
	}
	if(isdefined(blueprint))
	{
		var_f61629fd = blueprint.name;
	}
	if(!isdefined(level.var_d95bcda9[component.name]))
	{
		if(component == level.weaponnone)
		{
			/#
				if(isdefined(component_name))
				{
					component_name = function_9e72a96(component_name);
				}
				if(isdefined(var_f61629fd))
				{
					var_f61629fd = function_9e72a96(var_f61629fd);
				}
			#/
			/#
				loc_00001008:
				assertmsg((("" + (isdefined(component_name) ? component_name : "")) + "") + (isdefined(var_f61629fd) ? var_f61629fd : ""));
			#/
		}
		/#
			function_4765f5b3(component);
		#/
		level.var_d95bcda9[component.name] = component;
	}
	if(isdefined(blueprint) && isdefined(blueprint.result))
	{
		if(is_true(blueprint.result.isriotshield))
		{
			if(!namespace_59ff1d6c::function_901b751c(#"zmshieldisenabled"))
			{
				a_items = getitemarray();
				foreach(var_2e1f34dd in a_items)
				{
					if(var_2e1f34dd.item == component)
					{
						var_2e1f34dd delete();
					}
				}
			}
			else
			{
				zm_items::function_4d230236(component, &function_86531922);
			}
		}
		else
		{
			zm_items::function_4d230236(component, &function_d56724a6);
		}
	}
	return level.var_d95bcda9[component.name];
}

/*
	Name: function_40f32480
	Namespace: zm_crafting
	Checksum: 0xB2E506C9
	Offset: 0x11B0
	Size: 0xF8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_40f32480()
{
	level waittill(#"all_players_spawned");
	a_items = getitemarray();
	foreach(var_2e1f34dd in a_items)
	{
		if(isdefined(var_2e1f34dd.item) && isinarray(level.var_d95bcda9, var_2e1f34dd.item))
		{
			var_2e1f34dd clientfield::set("highlight_item", 1);
		}
	}
}

/*
	Name: function_728a82e0
	Namespace: zm_crafting
	Checksum: 0x556D0F3F
	Offset: 0x12B0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_728a82e0(blueprint)
{
	if(!isdefined(level.var_5df2581a[blueprint.name]))
	{
		blueprint.completed = 0;
		blueprint.builder = undefined;
		level.var_5df2581a[blueprint.name] = blueprint;
	}
}

/*
	Name: function_31d883d7
	Namespace: zm_crafting
	Checksum: 0x816AF6F3
	Offset: 0x1310
	Size: 0xE2
	Parameters: 0
	Flags: None
*/
function function_31d883d7()
{
	results = [];
	foreach(blueprint in level.var_5df2581a)
	{
		if(blueprint.completed)
		{
			if(!isdefined(results))
			{
				results = [];
			}
			else if(!isarray(results))
			{
				results = array(results);
			}
			results[results.size] = blueprint;
		}
	}
	return results;
}

/*
	Name: function_4165306b
	Namespace: zm_crafting
	Checksum: 0xC1837D75
	Offset: 0x1400
	Size: 0x1A6
	Parameters: 1
	Flags: Linked
*/
function function_4165306b(player)
{
	results = [];
	if(isdefined(self.craftfoundry.blueprints))
	{
		foreach(blueprint in self.craftfoundry.blueprints)
		{
			if(!blueprint.completed && function_6d1e4410(player, blueprint))
			{
				if(!isdefined(results))
				{
					results = [];
				}
				else if(!isarray(results))
				{
					results = array(results);
				}
				results[results.size] = blueprint;
			}
		}
	}
	else
	{
		blueprint = self.craftfoundry;
		if(!blueprint.completed && function_6d1e4410(player, blueprint))
		{
			if(!isdefined(results))
			{
				results = [];
			}
			else if(!isarray(results))
			{
				results = array(results);
			}
			results[results.size] = blueprint;
		}
	}
	return results;
}

/*
	Name: function_6d1e4410
	Namespace: zm_crafting
	Checksum: 0xFED65555
	Offset: 0x15B0
	Size: 0xAA
	Parameters: 2
	Flags: Linked
*/
function function_6d1e4410(player, blueprint)
{
	foreach(component in blueprint.components)
	{
		if(!zm_items::player_has(player, component))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_6f635422
	Namespace: zm_crafting
	Checksum: 0x642E576D
	Offset: 0x1668
	Size: 0xB8
	Parameters: 2
	Flags: Linked
*/
function function_6f635422(player, blueprint)
{
	foreach(component in blueprint.components)
	{
		if(zm_items::player_has(player, component))
		{
			zm_items::player_take(player, component);
		}
	}
}

/*
	Name: function_7a8f3cbd
	Namespace: zm_crafting
	Checksum: 0xBE1B903A
	Offset: 0x1728
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_7a8f3cbd()
{
	level.var_90237ebd = zm_progress::function_53a680b8(&function_7362ecc8, &function_8962a3bb, &function_735c3a67, &function_f7dbfdf9, &function_d95a600f, &function_73f3bb03);
	level.var_98dad84e = zm_progress::function_53a680b8(&function_7362ecc8, &function_8962a3bb, &function_735c3a67, &function_f7dbfdf9, &function_d95a600f, &function_73f3bb03);
	zm_progress::function_163442cb(level.var_98dad84e, level.weaponnone);
}

/*
	Name: function_7362ecc8
	Namespace: zm_crafting
	Checksum: 0x7E8694EA
	Offset: 0x1848
	Size: 0x96
	Parameters: 2
	Flags: Linked
*/
function function_7362ecc8(player, unitrigger)
{
	if(is_true(unitrigger.locked))
	{
		return false;
	}
	blueprints = unitrigger function_4165306b(player);
	if(blueprints.size < 1)
	{
		return false;
	}
	if(is_true(unitrigger.blueprint.locked))
	{
		return false;
	}
	return true;
}

/*
	Name: function_8962a3bb
	Namespace: zm_crafting
	Checksum: 0x32E822D6
	Offset: 0x18E8
	Size: 0x18
	Parameters: 2
	Flags: Linked
*/
function function_8962a3bb(player, unitrigger)
{
	return true;
}

/*
	Name: function_735c3a67
	Namespace: zm_crafting
	Checksum: 0xC4252940
	Offset: 0x1908
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_735c3a67(player, unitrigger)
{
	if(isdefined(player))
	{
		unitrigger.locked = 1;
		unitrigger.blueprint.locked = 1;
		player playsound(#"hash_1fff2aa71bff91fa");
	}
}

/*
	Name: function_f7dbfdf9
	Namespace: zm_crafting
	Checksum: 0x7C57BA2A
	Offset: 0x1970
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_f7dbfdf9(player, unitrigger)
{
	if(isdefined(unitrigger))
	{
		unitrigger notify(#"hash_7fd32c9551894e64");
		unitrigger playsound(#"hash_15b7f680d9f65b62");
	}
}

/*
	Name: function_d95a600f
	Namespace: zm_crafting
	Checksum: 0x330308C
	Offset: 0x19D0
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_d95a600f(player, unitrigger)
{
	if(isdefined(unitrigger))
	{
		unitrigger notify(#"hash_424834e6dee13bc3");
		unitrigger playsound(#"hash_421a00cb329b2a45");
	}
}

/*
	Name: function_73f3bb03
	Namespace: zm_crafting
	Checksum: 0x1D2AE911
	Offset: 0x1A30
	Size: 0x32
	Parameters: 2
	Flags: Linked
*/
function function_73f3bb03(player, unitrigger)
{
	unitrigger.locked = 0;
	unitrigger.blueprint.locked = 0;
}

/*
	Name: function_7bffa1ac
	Namespace: zm_crafting
	Checksum: 0xB7D88EFD
	Offset: 0x1A70
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_7bffa1ac(weapon)
{
	if(zm_equipment::is_equipment(weapon))
	{
		if(zm_equipment::is_limited(weapon) && zm_equipment::limited_in_use(weapon))
		{
			return 1;
		}
		return 0;
	}
	return !zm_weapons::limited_weapon_below_quota(weapon, undefined);
}

/*
	Name: function_2d53738e
	Namespace: zm_crafting
	Checksum: 0xF0649648
	Offset: 0x1AF8
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_2d53738e(weapon)
{
	if(zm_equipment::is_equipment(weapon))
	{
		return zm_equipment::is_player_equipment(weapon);
	}
	return self hasweapon(weapon);
}

/*
	Name: function_48ce9379
	Namespace: zm_crafting
	Checksum: 0xDDAE3D
	Offset: 0x1B58
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_48ce9379(weapon)
{
	if(isdefined(self.var_4e90ce0c))
	{
		return array::contains(self.var_4e90ce0c, weapon);
	}
	return 0;
}

/*
	Name: function_126fc77c
	Namespace: zm_crafting
	Checksum: 0x15640AF8
	Offset: 0x1B98
	Size: 0x1B8
	Parameters: 1
	Flags: Linked
*/
function function_126fc77c(player)
{
	if(!isdefined(self.stub))
	{
		/#
			iprintlnbold("");
		#/
		return 0;
	}
	can_use = self.stub function_18f2be60(player);
	if(!isdefined(self.stub.hint_string))
	{
		/#
			iprintlnbold("");
		#/
		return can_use;
	}
	if(isdefined(level.var_a6f62e91) && isdefined(self.stub.cost) && self.stub [[level.var_a6f62e91]](player, #"crafting_table"))
	{
		self sethintstringforplayer(player, self.stub.hint_string, self.stub.cost);
	}
	else
	{
		if(isdefined(self.stub.cost) && self.stub.cost != 0)
		{
			self sethintstring(self.stub.hint_string, self.stub.cost);
		}
		else
		{
			self sethintstring(self.stub.hint_string);
		}
	}
	return can_use;
}

/*
	Name: function_f665fde0
	Namespace: zm_crafting
	Checksum: 0x1DF38E53
	Offset: 0x1D58
	Size: 0x760
	Parameters: 1
	Flags: Linked
*/
function function_f665fde0(trig)
{
	if(!isdefined(trig))
	{
		return;
	}
	unitrigger_stub = spawnstruct();
	unitrigger_stub.craftfoundry = trig.craftfoundry;
	if(zm_utility::function_166646a6() == 1 && isdefined(trig.target2))
	{
		unitrigger_stub.var_c2f40a58 = getent(trig.target2, "targetname");
		unitrigger_stub.var_c2f40a58 ghost();
	}
	if(zm_utility::function_166646a6() == 1 && isdefined(trig.target3))
	{
		unitrigger_stub.var_4f749ffe = getent(trig.target3, "targetname");
		unitrigger_stub.var_4f749ffe ghost();
	}
	angles = trig.script_angles;
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	unitrigger_stub.origin = trig.origin + (anglestoright(angles) * -6);
	unitrigger_stub.angles = trig.angles;
	if(isdefined(trig.script_angles))
	{
		unitrigger_stub.angles = trig.script_angles;
	}
	unitrigger_stub.delete_trigger = 1;
	unitrigger_stub.crafted = 0;
	unitrigger_stub.var_c66d8f22 = 1;
	unitrigger_stub.var_42839ec7 = 1;
	unitrigger_stub.usetime = int(3000);
	if(isdefined(self.usetime))
	{
		unitrigger_stub.usetime = self.usetime;
	}
	else if(isdefined(trig.usetime))
	{
		unitrigger_stub.usetime = trig.usetime;
	}
	tmins = trig getmins();
	tmaxs = trig getmaxs();
	tsize = tmaxs - tmins;
	if(isdefined(trig.script_depth))
	{
		unitrigger_stub.script_length = trig.script_depth;
	}
	else
	{
		unitrigger_stub.script_length = tsize[1];
	}
	if(isdefined(trig.script_width))
	{
		unitrigger_stub.script_width = trig.script_width;
	}
	else
	{
		unitrigger_stub.script_width = tsize[0];
	}
	if(isdefined(trig.script_height))
	{
		unitrigger_stub.script_height = trig.script_height;
	}
	else
	{
		unitrigger_stub.script_height = tsize[2];
	}
	unitrigger_stub.target = trig.target;
	unitrigger_stub.targetname = trig.targetname;
	unitrigger_stub.script_noteworthy = trig.script_noteworthy;
	unitrigger_stub.script_parameters = trig.script_parameters;
	unitrigger_stub.script_string = trig.script_string;
	unitrigger_stub.cursor_hint = "HINT_NOICON";
	unitrigger_stub.hint_string = #"hash_a502ccb8fec4c7a";
	unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	unitrigger_stub.require_look_at = 1;
	unitrigger_stub.require_look_toward = 0;
	unitrigger_stub.var_c060d2c8 = 1;
	zm_unitrigger::unitrigger_force_per_player_triggers(unitrigger_stub, 1);
	unitrigger_stub.prompt_and_visibility_func = &function_126fc77c;
	zm_unitrigger::register_static_unitrigger(unitrigger_stub, &function_369159af);
	unitrigger_stub.piece_trigger = trig;
	trig.trigger_stub = unitrigger_stub;
	if(isdefined(trig.zombie_weapon_upgrade))
	{
		unitrigger_stub.zombie_weapon_upgrade = getweapon(trig.zombie_weapon_upgrade);
	}
	if(isdefined(unitrigger_stub.target))
	{
		m_target = getent(unitrigger_stub.target, "targetname");
		if(isdefined(m_target))
		{
			unitrigger_stub.model = m_target;
			if(isdefined(unitrigger_stub.zombie_weapon_upgrade))
			{
				unitrigger_stub.model useweaponhidetags(unitrigger_stub.zombie_weapon_upgrade);
			}
			if(isdefined(unitrigger_stub.model.script_parameters))
			{
				a_utm_params = strtok(unitrigger_stub.model.script_parameters, " ");
				foreach(param in a_utm_params)
				{
					if(param == "starts_visible")
					{
						b_start_visible = 1;
						continue;
						continue;
					}
					if(param == "starts_empty")
					{
						b_start_empty = 1;
					}
				}
			}
			if(b_start_visible !== 1)
			{
				unitrigger_stub.model ghost();
				unitrigger_stub.model notsolid();
			}
		}
	}
	if(isdefined(unitrigger_stub.model) && b_start_empty === 1)
	{
		for(i = 0; i < unitrigger_stub.craftablespawn.a_piecespawns.size; i++)
		{
			if(isdefined(unitrigger_stub.craftablespawn.a_piecespawns[i].tag_name))
			{
				if(unitrigger_stub.craftablespawn.a_piecespawns[i].crafted !== 1)
				{
					unitrigger_stub.model hidepart(unitrigger_stub.craftablespawn.a_piecespawns[i].tag_name);
					continue;
				}
				unitrigger_stub.model showpart(unitrigger_stub.craftablespawn.a_piecespawns[i].tag_name);
			}
		}
	}
	if(unitrigger_stub.delete_trigger)
	{
		trig delete();
	}
	unitrigger_stub function_35f5c90b(#"craft");
	return unitrigger_stub;
}

/*
	Name: function_987a472
	Namespace: zm_crafting
	Checksum: 0x23AE8ED4
	Offset: 0x24C0
	Size: 0x1FC
	Parameters: 2
	Flags: Linked
*/
function function_987a472(modelname, blueprint)
{
	if(isdefined(self.stub))
	{
		s_crafting = self.stub;
	}
	else
	{
		s_crafting = self;
	}
	if(!isdefined(s_crafting.model))
	{
		s_model = struct::get(s_crafting.target, "targetname");
		if(isdefined(s_model))
		{
			m_spawn = spawn("script_model", s_model.origin);
			m_spawn.origin = m_spawn.origin + blueprint.v_offset;
			if(isdefined(s_crafting.v_origin_offset))
			{
				m_spawn.origin = m_spawn.origin + s_crafting.v_origin_offset;
			}
			m_spawn.angles = s_model.angles;
			m_spawn.angles = m_spawn.angles + blueprint.v_angles;
			if(isdefined(s_crafting.v_angle_offset))
			{
				m_spawn.angles = m_spawn.angles + s_crafting.v_angle_offset;
			}
			m_spawn setmodel(modelname);
			s_crafting.model = m_spawn;
			s_crafting.model notsolid();
			s_crafting.model show();
		}
		else
		{
			/#
				assertmsg("");
			#/
		}
	}
	else
	{
		s_crafting.model notsolid();
		s_crafting.model show();
	}
}

/*
	Name: player_melee
	Namespace: zm_crafting
	Checksum: 0xC286406F
	Offset: 0x26C8
	Size: 0xB0
	Parameters: 0
	Flags: Event
*/
event player_melee()
{
	player = self;
	if(!isdefined(player.useholdent) || !isdefined(player.useholdent.stub))
	{
		return;
	}
	stub = player.useholdent.stub;
	if(isdefined(stub.var_90dfb0bf) && isdefined(level.var_b87dee47[stub.var_90dfb0bf].var_cb2020d8))
	{
		stub [[level.var_b87dee47[stub.var_90dfb0bf].var_cb2020d8]](player);
	}
}

/*
	Name: function_ca244624
	Namespace: zm_crafting
	Checksum: 0xFDEEAE86
	Offset: 0x2780
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_ca244624(var_55426150)
{
	if(!isdefined(level.var_4fe2f84d[var_55426150]))
	{
		return;
	}
	foreach(trigger in level.var_4fe2f84d[var_55426150])
	{
		trigger.locked = 1;
		level thread zm_unitrigger::unregister_unitrigger(trigger);
	}
}

/*
	Name: function_d1f16587
	Namespace: zm_crafting
	Checksum: 0xC815C69D
	Offset: 0x2848
	Size: 0x1A4
	Parameters: 2
	Flags: None
*/
function function_d1f16587(var_55426150, func)
{
	if(!isdefined(level.var_4fe2f84d[var_55426150]))
	{
		return;
	}
	foreach(trigger in level.var_4fe2f84d[var_55426150])
	{
		if(!isdefined(trigger.craftfoundry.var_ffe774be))
		{
			trigger.craftfoundry.var_ffe774be = [];
		}
		if(!isdefined(trigger.craftfoundry.var_ffe774be))
		{
			trigger.craftfoundry.var_ffe774be = [];
		}
		else if(!isarray(trigger.craftfoundry.var_ffe774be))
		{
			trigger.craftfoundry.var_ffe774be = array(trigger.craftfoundry.var_ffe774be);
		}
		if(!isinarray(trigger.craftfoundry.var_ffe774be, func))
		{
			trigger.craftfoundry.var_ffe774be[trigger.craftfoundry.var_ffe774be.size] = func;
		}
	}
}

/*
	Name: function_86531922
	Namespace: zm_crafting
	Checksum: 0x112CE56D
	Offset: 0x29F8
	Size: 0xEC
	Parameters: 2
	Flags: Linked
*/
function function_86531922(e_holder, var_9c95ad05)
{
	if(isdefined(var_9c95ad05.gadgetreadysoundplayer))
	{
		self thread zm_audio::create_and_play_dialog(#"hash_76042abadb490bd", var_9c95ad05.gadgetreadysoundplayer);
	}
	else
	{
		self thread zm_audio::create_and_play_dialog(#"hash_ef08945f5a2461d", #"pickup");
	}
	self playsound(#"hash_230737b2535a3374");
	if(var_9c95ad05.var_f56ac2bd !== "")
	{
		level namespace_6747c550::function_7df6bb60(hash(var_9c95ad05.var_f56ac2bd), 1);
	}
}

/*
	Name: function_d56724a6
	Namespace: zm_crafting
	Checksum: 0x214C8278
	Offset: 0x2AF0
	Size: 0x164
	Parameters: 2
	Flags: Linked
*/
function function_d56724a6(e_holder, var_9c95ad05)
{
	if(var_9c95ad05.var_f56ac2bd !== "")
	{
		level namespace_6747c550::function_7df6bb60(hash(var_9c95ad05.var_f56ac2bd), 1);
	}
	if(isdefined(var_9c95ad05.var_25bb96cc))
	{
		self playsound(var_9c95ad05.var_25bb96cc);
	}
	else
	{
		self playsound(#"hash_230737b2535a3374");
	}
	if(isdefined(var_9c95ad05.gadgetreadysoundplayer))
	{
		self thread zm_audio::create_and_play_dialog(#"hash_44b4edd3d705820d", var_9c95ad05.gadgetreadysoundplayer);
	}
	else
	{
		if(isdefined(var_9c95ad05.var_62a98b13))
		{
			self thread zm_audio::create_and_play_dialog(#"hash_44b4edd3d705820d", var_9c95ad05.var_62a98b13);
		}
		else
		{
			self thread zm_audio::create_and_play_dialog(#"hash_44b4edd3d705820d", #"generic");
		}
	}
}

/*
	Name: function_475a63eb
	Namespace: zm_crafting
	Checksum: 0x8666BABF
	Offset: 0x2C60
	Size: 0x214
	Parameters: 0
	Flags: Linked, Private
*/
function private function_475a63eb()
{
	if(!isdefined(level.var_b87dee47))
	{
		level.var_b87dee47 = [];
	}
	function_e1eeba22(#"craft", &function_8109ae21, &function_f37c4bb5, &function_b03ccfce, &function_d564a5c0);
	function_e1eeba22(#"persistent_buy", &function_9693e041, &function_df8ce6e2, &function_b03ccfce);
	function_e1eeba22(#"buy_once_then_box", &function_15d10d06, &function_42673a26, &function_6e16f902);
	function_e1eeba22(#"one_time_craft", &function_f189f7f, &function_5a4c40a2, &function_578c67bf);
	function_e1eeba22(#"spawn_as_ingredient", &function_f189f7f, &function_5a4c40a2, &function_3c45b116);
	function_e1eeba22(#"hash_1d3d78065e5628f5", &function_f189f7f, &function_5a4c40a2, &function_230f6303);
}

/*
	Name: function_e1eeba22
	Namespace: zm_crafting
	Checksum: 0x594B9A16
	Offset: 0x2E80
	Size: 0x90
	Parameters: 5
	Flags: Linked, Private
*/
function private function_e1eeba22(state, var_a3d8c117, var_ea7ebe1f, var_aee03b4c, var_cb2020d8)
{
	var_90dfb0bf = spawnstruct();
	var_90dfb0bf.name = state;
	var_90dfb0bf.var_a3d8c117 = var_a3d8c117;
	var_90dfb0bf.var_ea7ebe1f = var_ea7ebe1f;
	var_90dfb0bf.var_cb2020d8 = var_cb2020d8;
	var_90dfb0bf.var_aee03b4c = var_aee03b4c;
	level.var_b87dee47[state] = var_90dfb0bf;
}

/*
	Name: function_35f5c90b
	Namespace: zm_crafting
	Checksum: 0x89B045DB
	Offset: 0x2F18
	Size: 0xDC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_35f5c90b(state)
{
	if(!isdefined(state))
	{
		return;
	}
	self.var_90dfb0bf = state;
	if(!isdefined(level.var_b87dee47[self.var_90dfb0bf]))
	{
		/#
			if(function_7a600918(state))
			{
				state = "" + function_9e72a96(state);
			}
			/#
				assertmsg("" + state);
			#/
		#/
		return;
	}
	if(isdefined(level.var_b87dee47[self.var_90dfb0bf].var_aee03b4c))
	{
		self [[level.var_b87dee47[self.var_90dfb0bf].var_aee03b4c]]();
	}
}

/*
	Name: function_18f2be60
	Namespace: zm_crafting
	Checksum: 0x51E19B82
	Offset: 0x3000
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function function_18f2be60(player)
{
	if(is_true(self.locked))
	{
		self.hint_string = "";
		return 0;
	}
	if(player laststand::player_is_in_laststand() || player zm_utility::in_revive_trigger())
	{
		self.hint_string = "";
		return 0;
	}
	if(player zm_utility::is_drinking() && !is_true(player.var_1f8802c9))
	{
		self.hint_string = "";
		return 0;
	}
	initial_current_weapon = player getcurrentweapon();
	current_weapon = zm_weapons::get_nonalternate_weapon(initial_current_weapon);
	if(zm_equipment::is_equipment(current_weapon))
	{
		self.hint_string = "";
		return 0;
	}
	if(isdefined(self.var_90dfb0bf))
	{
		return self [[level.var_b87dee47[self.var_90dfb0bf].var_a3d8c117]](player);
	}
	self.hint_string = "";
	return 0;
}

/*
	Name: function_369159af
	Namespace: zm_crafting
	Checksum: 0xF319FB4D
	Offset: 0x3180
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_369159af()
{
	self notify(#"hash_79308edbd278188");
	self endon(#"hash_79308edbd278188", #"kill_trigger", #"death");
	while(isdefined(self))
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		level notify(#"hash_356be6a8a0b0668d", {#activator:player, #unitrigger:self});
		if(isdefined(self.stub.var_90dfb0bf))
		{
			self [[level.var_b87dee47[self.stub.var_90dfb0bf].var_ea7ebe1f]](player);
		}
	}
}

/*
	Name: function_b03ccfce
	Namespace: zm_crafting
	Checksum: 0x80F724D1
	Offset: 0x3298
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b03ccfce()
{
}

/*
	Name: function_f189f7f
	Namespace: zm_crafting
	Checksum: 0xF32023A0
	Offset: 0x32A8
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f189f7f(player)
{
	self.hint_string = "";
	return false;
}

/*
	Name: function_5a4c40a2
	Namespace: zm_crafting
	Checksum: 0xB438AB86
	Offset: 0x32D0
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5a4c40a2(player)
{
}

/*
	Name: function_8109ae21
	Namespace: zm_crafting
	Checksum: 0x3BA7EB8D
	Offset: 0x32E8
	Size: 0x3A6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8109ae21(player)
{
	blueprints = function_4165306b(player);
	var_9c8338de = blueprints.size;
	if(!isdefined(self.blueprint) || self.var_9c8338de !== var_9c8338de || is_true(self.blueprint.completed))
	{
		self.blueprint = self.craftfoundry;
		if(blueprints.size)
		{
			if(!isdefined(self.var_c0df4857))
			{
				self.var_c0df4857 = 0;
			}
			if(self.var_c0df4857 >= blueprints.size)
			{
				self.var_c0df4857 = 0;
			}
			self.blueprint = blueprints[self.var_c0df4857];
		}
		self.var_9c8338de = var_9c8338de;
	}
	if(blueprints.size < 1 || !array::contains(blueprints, self.blueprint))
	{
		self.hint_string = #"hash_64cb545dd18c607";
		if(zm_utility::function_166646a6() == 1 && isdefined(self.var_c2f40a58) && is_true(self.var_c2f40a58.is_visible))
		{
			self.var_c2f40a58 ghost();
			self.var_c2f40a58.is_visible = undefined;
		}
		return true;
	}
	if(is_true(self.blueprint.locked))
	{
		self.hint_string = "";
		return false;
	}
	if(blueprints.size > 1 && isdefined(self.blueprint.var_4050486a))
	{
		self.hint_string = self.blueprint.var_4050486a;
	}
	else
	{
		self.hint_string = self.blueprint.var_4dbc4aee;
	}
	if(zm_utility::function_166646a6() == 1 && isdefined(self.var_c2f40a58))
	{
		if(isdefined(self.blueprint.var_db27a7f7))
		{
			if(self.blueprint.var_db27a7f7 !== self.var_c2f40a58)
			{
				self.var_c2f40a58 setmodel(self.blueprint.var_db27a7f7);
				self.var_c2f40a58 show();
				self.var_c2f40a58.is_visible = 1;
			}
			else if(!is_true(self.var_c2f40a58.is_visible))
			{
				self.var_c2f40a58 show();
				self.var_c2f40a58.is_visible = 1;
			}
		}
		else if(is_true(self.var_c2f40a58.is_visible))
		{
			self.var_c2f40a58 ghost();
			self.var_c2f40a58.is_visible = undefined;
		}
	}
	return true;
}

/*
	Name: function_d564a5c0
	Namespace: zm_crafting
	Checksum: 0xAFBE25A9
	Offset: 0x3698
	Size: 0xF6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d564a5c0(player)
{
	if(self.crafted)
	{
		return;
	}
	if(!isdefined(self.blueprint))
	{
		return;
	}
	if(is_true(self.blueprint.locked))
	{
		return;
	}
	blueprints = function_4165306b(player);
	var_9c8338de = blueprints.size;
	if(self.var_9c8338de != var_9c8338de)
	{
		return;
	}
	self.blueprint = self.craftfoundry;
	if(blueprints.size)
	{
		if(!isdefined(self.var_c0df4857))
		{
			self.var_c0df4857 = 0;
		}
		self.var_c0df4857++;
		if(self.var_c0df4857 >= blueprints.size)
		{
			self.var_c0df4857 = 0;
		}
		self.blueprint = blueprints[self.var_c0df4857];
	}
}

/*
	Name: function_f37c4bb5
	Namespace: zm_crafting
	Checksum: 0xD1096C77
	Offset: 0x3798
	Size: 0x5FC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f37c4bb5(player)
{
	if(self.stub.crafted)
	{
		return;
	}
	if(!isdefined(self.stub.blueprint))
	{
		return;
	}
	var_c060d2c8 = self.stub.var_c060d2c8;
	silent = 0;
	initial_current_weapon = player getcurrentweapon();
	current_weapon = zm_weapons::get_nonalternate_weapon(initial_current_weapon);
	if(current_weapon.isheroweapon || current_weapon.isgadget || current_weapon.isriotshield)
	{
		silent = 1;
	}
	if(silent)
	{
		var_6ea6e65 = zm_progress::progress_think(player, level.var_98dad84e, var_c060d2c8);
	}
	else
	{
		var_6ea6e65 = zm_progress::progress_think(player, level.var_90237ebd, var_c060d2c8);
	}
	self notify(#"hash_6db03c91467a21f5", {#b_completed:var_6ea6e65});
	if(var_6ea6e65)
	{
		self.stub.crafted = 1;
		player_crafted = player;
		self.stub.blueprint.completed = 1;
		if(is_true(self.stub.blueprint.var_d8967a0c))
		{
			function_6f635422(player, self.stub.blueprint);
		}
		level notify(#"hash_656719782f57ca1a", {#player:player, #produced:self.stub.blueprint.var_54a97edd, #blueprint:self.stub.blueprint});
		player notify(#"hash_656719782f57ca1a", {#produced:self.stub.blueprint.var_54a97edd, #blueprint:self.stub.blueprint});
		if(self.stub.blueprint.var_46309255 === "persistent_buy" || self.stub.blueprint.var_46309255 === "buy_once_then_box" || self.stub.blueprint.var_46309255 === "spawn_as_ingredient")
		{
			function_987a472(self.stub.blueprint.var_54a97edd.worldmodel, self.stub.blueprint);
		}
		if(isdefined(player_crafted))
		{
			player_crafted playsound(#"zmb_craftable_complete");
			if(isdefined(self.stub.blueprint.name))
			{
				player_crafted thread zm_audio::create_and_play_dialog(#"build_complete", self.stub.blueprint.name);
			}
		}
		if(isdefined(self.stub.craftfoundry.var_ffe774be))
		{
			foreach(func in self.stub.craftfoundry.var_ffe774be)
			{
				self thread [[func]](player);
			}
		}
		if(isdefined(self.stub.blueprint.var_54a97edd) && is_true(self.stub.blueprint.var_54a97edd.isriotshield))
		{
			foreach(e_player in getplayers())
			{
				/#
					e_player zm_challenges::debug_print("");
				#/
				e_player zm_stats::increment_challenge_stat(#"hash_7199c0c1e12de89a", undefined, 1);
			}
		}
		if(isdefined(self.stub.blueprint.var_46309255))
		{
			self.stub function_35f5c90b(self.stub.blueprint.var_46309255);
		}
	}
}

/*
	Name: function_a187b293
	Namespace: zm_crafting
	Checksum: 0x1C058375
	Offset: 0x3DA0
	Size: 0x20C
	Parameters: 1
	Flags: None
*/
function function_a187b293(player)
{
	if(self.crafted)
	{
		return;
	}
	if(!isdefined(player))
	{
		player = array::random(level.players);
	}
	if(!isdefined(self.blueprint))
	{
		self.blueprint = self.craftfoundry;
	}
	var_6e022a91 = function_4165306b(player);
	self.var_9c8338de = var_6e022a91.size;
	self.crafted = 1;
	self.blueprint.completed = 1;
	if(self.blueprint.var_46309255 === "persistent_buy" || self.blueprint.var_46309255 === "buy_once_then_box" || self.blueprint.var_46309255 === "spawn_as_ingredient")
	{
		function_987a472(self.blueprint.var_54a97edd.worldmodel, self.blueprint);
	}
	if(isdefined(self.craftfoundry.var_ffe774be))
	{
		foreach(func in self.craftfoundry.var_ffe774be)
		{
			self thread [[func]](player);
		}
	}
	if(isdefined(self.blueprint.var_46309255))
	{
		self function_35f5c90b(self.blueprint.var_46309255);
	}
}

/*
	Name: function_578c67bf
	Namespace: zm_crafting
	Checksum: 0x4EDB1E19
	Offset: 0x3FB8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_578c67bf()
{
	thread zm_unitrigger::unregister_unitrigger(self);
}

/*
	Name: function_3c45b116
	Namespace: zm_crafting
	Checksum: 0xED7B32E
	Offset: 0x3FE0
	Size: 0x12C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3c45b116()
{
	v_origin = self.origin;
	v_angles = self.angles;
	if(!isdefined(self.model))
	{
		s_model = struct::get(self.target, "targetname");
		if(isdefined(s_model))
		{
			v_origin = s_model.origin;
			if(isdefined(self.v_origin_offset))
			{
				v_origin = v_origin + self.v_origin_offset;
			}
			v_angles = s_model.angles;
			if(isdefined(self.v_angle_offset))
			{
				v_angles = v_angles + self.v_angle_offset;
			}
		}
	}
	else
	{
		v_origin = self.model.origin;
		v_angles = self.model.angles;
	}
	zm_items::spawn_item(self.blueprint.var_54a97edd, v_origin, v_angles);
	thread zm_unitrigger::unregister_unitrigger(self);
}

/*
	Name: function_230f6303
	Namespace: zm_crafting
	Checksum: 0xB347F08C
	Offset: 0x4118
	Size: 0x114
	Parameters: 0
	Flags: Linked, Private
*/
function private function_230f6303()
{
	v_origin = self.origin;
	v_angles = self.angles;
	if(!isdefined(self.model))
	{
		s_model = struct::get(self.target, "targetname");
		if(isdefined(s_model))
		{
			v_origin = s_model.origin;
			if(isdefined(self.v_origin_offset))
			{
				v_origin = v_origin + self.v_origin_offset;
			}
			v_angles = s_model.angles;
			if(isdefined(self.v_angle_offset))
			{
				v_angles = v_angles + self.v_angle_offset;
			}
		}
	}
	else
	{
		self.model notsolid();
		self.model show();
	}
	thread zm_unitrigger::unregister_unitrigger(self);
}

/*
	Name: function_9693e041
	Namespace: zm_crafting
	Checksum: 0x3BCDF3FE
	Offset: 0x4238
	Size: 0x454
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9693e041(player)
{
	if(player function_7bffa1ac(self.blueprint.var_54a97edd))
	{
		self.hint_string = #"hash_718d32f9e8cea17";
		self.cost = undefined;
		return true;
	}
	if(player function_2d53738e(self.blueprint.var_54a97edd))
	{
		if(is_true(self.var_ad7ae074))
		{
			return true;
		}
		if(is_true(self.blueprint.var_54a97edd.isriotshield) && isdefined(player.player_shield_reset_health) && is_true(player.var_d3345483))
		{
			self.cost = function_ceac3bf9(player, 1);
			str = self.blueprint.var_1238231a;
			var_e7ed2264 = function_c9163c5d(str);
			var_868b4fdd = player zm_utility::function_d6046228(str, var_e7ed2264);
			var_495e9cd = player zm_utility::function_d6046228(#"hash_38222048e6736323", #"hash_197687e8f04962c9");
			self.hint_string = (isdefined(var_868b4fdd) ? var_868b4fdd : var_495e9cd);
			_shad_turret_debug_server = 1;
		}
		else
		{
			self.hint_string = #"hash_53fd856df9288be7";
			self.cost = undefined;
			return true;
		}
	}
	else
	{
		if(!player function_2d53738e(self.blueprint.var_54a97edd) && (is_true(self.blueprint.var_c028dcfe) && !player function_48ce9379(self.blueprint.var_54a97edd) || is_true(level.var_905507c3)))
		{
			str = self.blueprint.var_abd9b2d0;
			var_e7ed2264 = function_c9163c5d(str);
			var_868b4fdd = player zm_utility::function_d6046228(str, var_e7ed2264);
			self.hint_string = (isdefined(var_868b4fdd) ? var_868b4fdd : "");
			self.cost = undefined;
		}
		else
		{
			if(namespace_497ab7da::is_active())
			{
				self.hint_string = #"hash_55d25caf8f7bbb2f";
			}
			else
			{
				if(!is_true(_shad_turret_debug_server))
				{
					str = self.blueprint.var_391591d0;
					var_e7ed2264 = function_c9163c5d(str);
					self.hint_string = player zm_utility::function_d6046228(str, var_e7ed2264);
				}
				self.cost = function_ceac3bf9(player);
				if(self.cost == 0)
				{
					str = self.blueprint.var_abd9b2d0;
					var_e7ed2264 = function_c9163c5d(str);
					var_868b4fdd = player zm_utility::function_d6046228(str, var_e7ed2264);
					self.hint_string = (isdefined(var_868b4fdd) ? var_868b4fdd : "");
					self.cost = undefined;
				}
			}
		}
	}
	if(isdefined(level.var_932a1afb))
	{
		self [[level.var_932a1afb]](player);
	}
	return true;
}

/*
	Name: function_c9163c5d
	Namespace: zm_crafting
	Checksum: 0xE7E61585
	Offset: 0x4698
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_c9163c5d(str)
{
	if(isdefined(str) && str != "")
	{
		str = str + "_KEYBOARD";
	}
	return str;
}

/*
	Name: function_ceac3bf9
	Namespace: zm_crafting
	Checksum: 0x1D34E2D8
	Offset: 0x46E0
	Size: 0x1FA
	Parameters: 2
	Flags: Linked
*/
function function_ceac3bf9(player, b_repaired)
{
	if(!isdefined(b_repaired))
	{
		b_repaired = 0;
	}
	if(!isdefined(player.var_36ea3103))
	{
		player.var_36ea3103 = 0;
	}
	if(isdefined(player.talisman_shield_price) && self.blueprint.var_54a97edd.isriotshield)
	{
		var_a185bd91 = player.talisman_shield_price;
	}
	else
	{
		var_a185bd91 = 0;
	}
	switch(player.var_36ea3103)
	{
		case 0:
		{
			n_cost = 0;
			break;
		}
		case 1:
		{
			n_cost = 250;
			break;
		}
		case 2:
		{
			n_cost = 500;
			break;
		}
		case 3:
		{
			n_cost = 750;
			break;
		}
		case 4:
		{
			n_cost = 1000;
			break;
		}
		case 5:
		{
			n_cost = 1250;
			break;
		}
		case 6:
		{
			n_cost = 1500;
			break;
		}
		case 7:
		{
			n_cost = 2000;
			break;
		}
		default:
		{
			n_cost = player function_86cab486();
			break;
		}
	}
	n_cost = n_cost - var_a185bd91;
	if(n_cost < 100)
	{
		n_cost = 100;
	}
	if(b_repaired)
	{
		n_cost = math::clamp(n_cost, 250, 2500);
	}
	return n_cost;
}

/*
	Name: function_86cab486
	Namespace: zm_crafting
	Checksum: 0x2DAD9E4E
	Offset: 0x48E8
	Size: 0xCE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_86cab486()
{
	if(!isdefined(self.var_76a15cfd))
	{
		self.var_76a15cfd = 0;
	}
	if(self.var_3b6a5556 !== level.round_number)
	{
		n_cost = 2500;
	}
	else
	{
		switch(self.var_76a15cfd)
		{
			case 0:
			{
				n_cost = 2500;
				break;
			}
			case 1:
			{
				n_cost = 3000;
				break;
			}
			case 2:
			{
				n_cost = 4000;
				break;
			}
			default:
			{
				n_cost = 5000;
				break;
			}
		}
	}
	return n_cost;
}

/*
	Name: function_fccf9f0d
	Namespace: zm_crafting
	Checksum: 0x4BCD9257
	Offset: 0x49C0
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_fccf9f0d()
{
	if(self.var_36ea3103 >= 8)
	{
		if(self.var_3b6a5556 !== level.round_number)
		{
			self.var_76a15cfd = 1;
			self.var_3b6a5556 = level.round_number;
		}
		else
		{
			self.var_76a15cfd++;
		}
	}
	self.var_36ea3103++;
}

/*
	Name: function_df8ce6e2
	Namespace: zm_crafting
	Checksum: 0x1CBE90A3
	Offset: 0x4A30
	Size: 0x7B0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_df8ce6e2(player)
{
	if(isdefined(level.var_f7d93c4e))
	{
		if(!is_true(self [[level.var_f7d93c4e]](player)))
		{
			return;
		}
	}
	if(!is_true(self.stub.crafted))
	{
		self.stub.hint_string = "";
		self sethintstring(self.stub.hint_string);
		return;
	}
	if(player != self.parent_player)
	{
		return;
	}
	if(!zm_utility::is_player_valid(player))
	{
		player thread zm_utility::ignore_triggers(0.5);
		return;
	}
	if(isdefined(level.var_a6f62e91))
	{
		if(self [[level.var_a6f62e91]](player, #"crafting_table"))
		{
			return;
		}
	}
	if(player function_2d53738e(self.stub.blueprint.var_54a97edd))
	{
		if(is_true(self.stub.blueprint.var_54a97edd.isriotshield) && isdefined(player.player_shield_reset_health) && is_true(player.var_d3345483))
		{
			var_d97673ff = 1;
		}
		else
		{
			return;
		}
	}
	if(player function_7bffa1ac(self.stub.blueprint.var_54a97edd))
	{
		self.stub.hint_string = "";
		self sethintstring(self.stub.hint_string);
	}
	else
	{
		if(is_true(var_d97673ff))
		{
			var_f66d1847 = self.stub function_ceac3bf9(player, 1);
		}
		else
		{
			var_f66d1847 = self.stub function_ceac3bf9(player);
		}
		if(isdefined(var_f66d1847) && var_f66d1847 > 0)
		{
			if(is_true(self.stub.blueprint.var_c028dcfe) && !player function_48ce9379(self.stub.blueprint.var_54a97edd))
			{
				if(!isdefined(player.var_4e90ce0c))
				{
					player.var_4e90ce0c = [];
				}
				array::add(player.var_4e90ce0c, self.stub.blueprint.var_54a97edd, 0);
				player thread function_fccf9f0d();
			}
			else
			{
				if(namespace_497ab7da::is_active())
				{
					return;
				}
				if(player zm_score::can_player_purchase(var_f66d1847))
				{
					player thread function_fccf9f0d();
					player zm_score::minus_to_player_score(var_f66d1847);
					player zm_utility::play_sound_on_ent("purchase");
				}
				else
				{
					zm_utility::play_sound_on_ent("no_purchase");
					player zm_audio::create_and_play_dialog(#"general", #"outofmoney");
					return;
				}
			}
		}
		if(isdefined(self.stub.blueprint.var_fe8a5e39))
		{
			if(!isdefined(player.var_2f3339f0))
			{
				player.var_2f3339f0 = [];
			}
			if(!is_true(player.var_2f3339f0[self.stub.blueprint.var_54a97edd]))
			{
				player thread zm_equipment::show_hint_text(self.stub.blueprint.var_fe8a5e39);
				player.var_2f3339f0[self.stub.blueprint.var_54a97edd] = 1;
			}
		}
		if(is_true(self.stub.blueprint.var_54a97edd.isriotshield))
		{
			if(is_true(var_d97673ff))
			{
				player [[player.player_shield_reset_health]](undefined, 1);
			}
			else if(is_true(player.hasriotshield) && isdefined(player.weaponriotshield))
			{
				player zm_weapons::weapon_take(player.weaponriotshield);
			}
		}
		if(!is_true(var_d97673ff))
		{
			player zm_weapons::weapon_give(self.stub.blueprint.var_54a97edd);
		}
		else
		{
			player playsound(#"hash_230737b2535a3374");
		}
		player notify(#"hash_77d44943fb143b18", {#weapon:self.stub.blueprint.var_54a97edd});
		player zm_stats::function_c0c6ab19(#"hash_6f9f408a95b50400", 1, 1);
		player contracts::function_5b88297d(#"hash_4a8bbc38f59c2743", 1, #"zstandard");
		self.stub.bought = 1;
		self.stub.hint_string = "";
		self.stub.cost = undefined;
		self sethintstring(self.stub.hint_string);
		self.stub.var_ad7ae074 = 1;
		self.stub thread function_d94efa98();
		player zm_stats::track_craftables_pickedup(self.stub.blueprint.var_54a97edd);
		if(isdefined(level.var_8c978b55))
		{
			self [[level.var_8c978b55]](player);
		}
	}
}

/*
	Name: function_d94efa98
	Namespace: zm_crafting
	Checksum: 0xF1326759
	Offset: 0x51E8
	Size: 0x46
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d94efa98()
{
	self endon(#"death");
	self notify("6d0b8e7f969efd16");
	self endon("6d0b8e7f969efd16");
	wait(5);
	self.var_ad7ae074 = undefined;
}

/*
	Name: function_6e16f902
	Namespace: zm_crafting
	Checksum: 0x8C14017A
	Offset: 0x5238
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6e16f902()
{
	if(isdefined(self.model))
	{
		self.model notsolid();
		self.model show();
	}
}

/*
	Name: function_15d10d06
	Namespace: zm_crafting
	Checksum: 0xD4CB1A6B
	Offset: 0x5288
	Size: 0xDE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_15d10d06(player)
{
	if(player function_7bffa1ac(self.blueprint.var_54a97edd))
	{
		self.hint_string = #"hash_7b4e31b02c13ed59";
		return true;
	}
	if(is_true(self.bought))
	{
		self.hint_string = #"hash_48157c44f8771b6c";
		return true;
	}
	str = self.blueprint.var_391591d0;
	var_e7ed2264 = function_c9163c5d(str);
	self.hint_string = player zm_utility::function_d6046228(str, var_e7ed2264);
	return true;
}

/*
	Name: function_42673a26
	Namespace: zm_crafting
	Checksum: 0x53DC92B6
	Offset: 0x5370
	Size: 0x26C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_42673a26(player)
{
	if(is_true(self.stub.bought))
	{
		return;
	}
	current_weapon = player getcurrentweapon();
	if(zm_loadout::is_placeable_mine(current_weapon) || zm_equipment::is_equipment_that_blocks_purchase(current_weapon))
	{
		return;
	}
	if(!is_true(self.stub.crafted))
	{
		self.stub.hint_string = "";
		self sethintstring(self.stub.hint_string);
		return;
	}
	if(!zm_utility::is_player_valid(player))
	{
		player thread zm_utility::ignore_triggers(0.5);
		return;
	}
	if(player != self.parent_player)
	{
		return;
	}
	if(!player function_7bffa1ac(self.stub.blueprint.var_54a97edd))
	{
		player zm_weapons::weapon_give(self.stub.blueprint.var_54a97edd);
		zm_weapons::function_603af7a8(self.stub.blueprint.var_54a97edd);
		self.stub.bought = 1;
	}
	if(player function_7bffa1ac(self.stub.blueprint.var_54a97edd))
	{
		self.stub.hint_string = #"hash_7b4e31b02c13ed59";
	}
	else
	{
		self.stub.hint_string = #"hash_48157c44f8771b6c";
	}
	self sethintstring(self.stub.hint_string);
}

/*
	Name: function_3012605d
	Namespace: zm_crafting
	Checksum: 0x64EAF988
	Offset: 0x55E8
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_3012605d(unitrigger)
{
	/#
		if(!isdefined(level.var_644b04e2))
		{
			level.var_644b04e2 = [];
		}
		if(!isdefined(level.var_a9839862))
		{
			level.var_a9839862 = 0;
		}
		table_id = level.var_a9839862;
		level.var_a9839862++;
		level.var_644b04e2[table_id] = unitrigger;
		name = unitrigger.craftfoundry.name;
		if(unitrigger.craftfoundry.displayname != "")
		{
			name = unitrigger.craftfoundry.displayname;
		}
		util::waittill_can_add_debug_command();
		str_cmd = ((((("" + table_id) + "") + name) + "") + table_id) + "";
		adddebugcommand(str_cmd);
	#/
}

/*
	Name: function_e197bb07
	Namespace: zm_crafting
	Checksum: 0xEB26ECBD
	Offset: 0x5728
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_e197bb07(foundry)
{
	/#
	#/
}

/*
	Name: function_e5af6b6e
	Namespace: zm_crafting
	Checksum: 0x632FCF36
	Offset: 0x5740
	Size: 0xD0
	Parameters: 1
	Flags: None
*/
function function_e5af6b6e(blueprint)
{
	/#
		name = blueprint.name;
		if(blueprint.displayname != "")
		{
			name = blueprint.displayname;
		}
		foreach(component in blueprint.components)
		{
			function_e9e4a1d0(name, component);
		}
	#/
}

/*
	Name: function_e9e4a1d0
	Namespace: zm_crafting
	Checksum: 0xED4A8206
	Offset: 0x5818
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_e9e4a1d0(var_a13e8cac, component)
{
	/#
		util::waittill_can_add_debug_command();
		name = function_a16a090d(component);
		str_cmd = ((((("" + var_a13e8cac) + "") + name) + "") + name) + "";
		adddebugcommand(str_cmd);
	#/
}

/*
	Name: function_4765f5b3
	Namespace: zm_crafting
	Checksum: 0x8527A86
	Offset: 0x58C8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_4765f5b3(component)
{
	/#
	#/
}

/*
	Name: function_bebf36b
	Namespace: zm_crafting
	Checksum: 0x5D347F4A
	Offset: 0x58E0
	Size: 0xF2
	Parameters: 0
	Flags: None
*/
function function_bebf36b()
{
	/#
		var_4ab6b47 = getdvarstring(#"hash_7c8c0c3f35357a53");
		if(var_4ab6b47 != "")
		{
			player_id = int(var_4ab6b47);
			if(player_id > 0 && player_id <= 4 && isdefined(getplayers()[player_id - 1]))
			{
				result = [];
				result[player_id - 1] = getplayers()[player_id - 1];
				return result;
			}
		}
		return getplayers();
	#/
}

/*
	Name: devgui_think
	Namespace: zm_crafting
	Checksum: 0x93D51445
	Offset: 0x59E0
	Size: 0x276
	Parameters: 0
	Flags: None
*/
function devgui_think()
{
	/#
		setdvar(#"hash_7c8c0c3f35357a53", "");
		util::waittill_can_add_debug_command();
		str_cmd = "";
		adddebugcommand(str_cmd);
		for(i = 1; i <= 4; i++)
		{
			util::waittill_can_add_debug_command();
			str_cmd = ((((("" + i) + "") + i) + "") + i) + "";
			adddebugcommand(str_cmd);
		}
		while(true)
		{
			var_cf5ebef8 = getdvarstring(#"hash_43086839e587cc6c");
			if(var_cf5ebef8 != "")
			{
				table_id = int(var_cf5ebef8);
				array::thread_all(function_bebf36b(), &function_fe738a08, table_id);
				setdvar(#"hash_43086839e587cc6c", "");
			}
			component = getdvarstring(#"hash_3a357be22156749e");
			if(component != "")
			{
				var_ef492be = function_4c2f8683(component);
				array::thread_all(function_bebf36b(), &function_3e29352d, var_ef492be);
				setdvar(#"hash_3a357be22156749e", "");
			}
			wait(1);
		}
	#/
}

/*
	Name: function_3e29352d
	Namespace: zm_crafting
	Checksum: 0xE6A71292
	Offset: 0x5C60
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_3e29352d(var_ef492be)
{
	/#
		self giveweapon(var_ef492be);
	#/
}

/*
	Name: function_fe738a08
	Namespace: zm_crafting
	Checksum: 0xA0CA7EDD
	Offset: 0x5C90
	Size: 0x1DC
	Parameters: 1
	Flags: None
*/
function function_fe738a08(table_id)
{
	/#
		unitrigger = level.var_644b04e2[table_id];
		entnum = self getentitynumber();
		origin = unitrigger.origin;
		forward = anglestoforward(unitrigger.angles);
		right = anglestoright(unitrigger.angles);
		var_21f5823e = vectortoangles(forward * -1);
		var_916d3dfe = origin + (48 * forward);
		switch(entnum)
		{
			case 0:
			{
				var_916d3dfe = var_916d3dfe + (16 * right);
				break;
			}
			case 1:
			{
				var_916d3dfe = var_916d3dfe + (16 * forward);
				break;
			}
			case 2:
			{
				var_916d3dfe = var_916d3dfe - (16 * right);
				break;
			}
			case 3:
			{
				var_916d3dfe = var_916d3dfe - (16 * forward);
				break;
			}
		}
		self setorigin(var_916d3dfe);
		self setplayerangles(var_21f5823e);
	#/
}

