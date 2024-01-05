#using script_556e19065f09f8a2;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_35598499769dbb3d;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_transform;

/*
	Name: function_70a657d8
	Namespace: zm_transform
	Checksum: 0x246D402F
	Offset: 0x150
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	level.var_b175714d = [];
	level thread update();
	clientfield::register("actor", "transformation_spawn", 1, 1, "int");
	clientfield::register("actor", "transformation_stream_split", 1, 1, "int");
	level flag::init(#"hash_670ec83e1acfadff");
	level.var_50f7dbd5 = [];
	level.var_ebccd551 = [];
	/#
		level thread devgui();
	#/
}

/*
	Name: function_4da8230b
	Namespace: zm_transform
	Checksum: 0x370D0182
	Offset: 0x230
	Size: 0x100
	Parameters: 1
	Flags: None
*/
function function_4da8230b(var_736940b3)
{
	/#
		assert(ishash(var_736940b3), "");
	#/
	if(!isdefined(level.var_50f7dbd5))
	{
		level.var_50f7dbd5 = [];
	}
	else if(!isarray(level.var_50f7dbd5))
	{
		level.var_50f7dbd5 = array(level.var_50f7dbd5);
	}
	level.var_50f7dbd5[level.var_50f7dbd5.size] = var_736940b3;
	if(level.var_50f7dbd5.size == 1)
	{
		level flag::set(#"hash_670ec83e1acfadff");
		level notify(#"hash_239ebc19aab5a60b");
	}
}

/*
	Name: function_6b183c78
	Namespace: zm_transform
	Checksum: 0x509B1CF7
	Offset: 0x338
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_6b183c78(var_736940b3)
{
	/#
		assert(ishash(var_736940b3), "");
	#/
	foreach(index, var_8aa9ab80 in level.var_50f7dbd5)
	{
		if(var_8aa9ab80 == var_736940b3)
		{
			var_689205d = index;
			break;
		}
	}
	if(!isdefined(var_689205d))
	{
		return;
	}
	arrayremoveindex(level.var_50f7dbd5, var_689205d);
	if(level.var_50f7dbd5.size == 0)
	{
		level flag::clear(#"hash_670ec83e1acfadff");
	}
}

/*
	Name: function_770908a2
	Namespace: zm_transform
	Checksum: 0x5D9CA39D
	Offset: 0x470
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_770908a2()
{
	return level flag::get(#"hash_670ec83e1acfadff");
}

/*
	Name: function_cfca77a7
	Namespace: zm_transform
	Checksum: 0xAA992460
	Offset: 0x4A0
	Size: 0x49C
	Parameters: 9
	Flags: Linked
*/
function function_cfca77a7(var_42de336c, id, condition_func, cooldown_time, intro_func, outro_func, var_44c5827d, var_99fca475, var_accb1c92)
{
	/#
		assert(!isdefined(level.var_b175714d[id]));
	#/
	/#
		if(!isdefined(var_42de336c))
		{
			println(("" + id) + "");
			return;
		}
		if(isdefined(var_99fca475) && isentity(var_42de336c))
		{
			spawner = var_42de336c;
			if(!isdefined(spawner.targetname) || spawner.targetname == "")
			{
				println(((("" + id) + "") + var_99fca475) + "");
				return;
			}
			var_de6be79a = 0;
			scenedef = scene::get_scenedef(var_99fca475);
			foreach(object in scenedef.objects)
			{
				if(object.type === "" && object.name === spawner.targetname)
				{
					var_de6be79a = 1;
					break;
				}
			}
			if(!var_de6be79a)
			{
				println((("" + id) + "") + spawner.targetname);
				return;
			}
		}
		if(isdefined(var_44c5827d) && !isdefined(var_99fca475))
		{
			println(("" + id) + "");
			return;
		}
		if(!isdefined(var_44c5827d) && isdefined(var_99fca475))
		{
			println(("" + id) + "");
			return;
		}
		if(!isentity(var_42de336c) && !isassetloaded("", var_42de336c))
		{
			println((("" + id) + "") + (ishash(var_42de336c) ? function_9e72a96(var_42de336c) : var_42de336c) + "");
			return;
		}
	#/
	level.var_b175714d[id] = {#hash_2939a01a:[], #hash_33e393a7:0, #hash_ebaa8de9:0, #cooldown_time:cooldown_time, #hash_99fca475:var_99fca475, #hash_44c5827d:var_44c5827d, #hash_accb1c92:var_accb1c92, #outro_func:outro_func, #intro_func:intro_func, #condition:condition_func};
	if(isentity(var_42de336c))
	{
		level.var_b175714d[id].spawner = var_42de336c;
	}
	else
	{
		level.var_b175714d[id].aitype = var_42de336c;
		if(!isdefined(level.var_170852dc))
		{
			level.var_170852dc = [];
		}
	}
}

/*
	Name: function_abf1dcb4
	Namespace: zm_transform
	Checksum: 0x22920FE
	Offset: 0x948
	Size: 0x106
	Parameters: 1
	Flags: Linked
*/
function function_abf1dcb4(id)
{
	if(level.var_ebccd551.size >= 10)
	{
		return 1;
	}
	if(isdefined(level.var_88de5053) && level.var_ebccd551.size >= level.var_88de5053)
	{
		return 1;
	}
	if(isdefined(level.var_b175714d[id]) && isdefined(level.var_b175714d[id].spawner))
	{
		return isdefined(level.var_b175714d[id].spawner.var_ab46c56);
	}
	if(isdefined(level.var_b175714d[id]) && isdefined(level.var_b175714d[id].aitype))
	{
		return isdefined(level.var_170852dc[level.var_b175714d[id].aitype]);
	}
	return 0;
}

/*
	Name: function_9acf76e6
	Namespace: zm_transform
	Checksum: 0x4BA1A091
	Offset: 0xA58
	Size: 0x17C
	Parameters: 4
	Flags: None
*/
function function_9acf76e6(entity, id, var_c2a69066, var_2cf708f4)
{
	if(!isdefined(var_2cf708f4))
	{
		var_2cf708f4 = 1;
	}
	if(!isdefined(level.var_b175714d[id]))
	{
		/#
			iprintlnbold(("" + id) + "");
		#/
		return;
	}
	if(!isdefined(entity) || is_true(entity.var_69a981e6))
	{
		/#
			iprintlnbold(("" + id) + "");
		#/
		return;
	}
	if(function_abf1dcb4(id))
	{
		/#
			iprintlnbold(("" + id) + "");
		#/
		return;
	}
	if(function_331869(entity))
	{
		function_1afce5aa(entity);
	}
	var_167b5341 = level.var_b175714d[id];
	entity thread transform(id, var_c2a69066, var_2cf708f4);
}

/*
	Name: function_bdd8aba6
	Namespace: zm_transform
	Checksum: 0x3A376B89
	Offset: 0xBE0
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_bdd8aba6(id)
{
	if(!isdefined(level.var_b175714d[id]))
	{
		/#
			iprintlnbold(("" + id) + "");
		#/
		return;
	}
	level.var_b175714d[id].var_33e393a7++;
}

/*
	Name: function_3f502557
	Namespace: zm_transform
	Checksum: 0x737A4090
	Offset: 0xC50
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function function_3f502557(id)
{
	/#
		assert(level.var_b175714d[id].var_33e393a7 > 0);
	#/
	level.var_b175714d[id].var_33e393a7--;
}

/*
	Name: function_d2374144
	Namespace: zm_transform
	Checksum: 0xFC766C5B
	Offset: 0xCB0
	Size: 0x1A4
	Parameters: 2
	Flags: Linked
*/
function function_d2374144(entity, id)
{
	/#
		assert(!is_true(entity.var_69a981e6));
	#/
	/#
		assert(!isinarray(level.var_b175714d[id].var_2939a01a, entity));
	#/
	/#
		assert(!is_true(entity.var_d41ca76d));
	#/
	entity.var_d41ca76d = id;
	if(!isdefined(level.var_b175714d[id].var_2939a01a))
	{
		level.var_b175714d[id].var_2939a01a = [];
	}
	else if(!isarray(level.var_b175714d[id].var_2939a01a))
	{
		level.var_b175714d[id].var_2939a01a = array(level.var_b175714d[id].var_2939a01a);
	}
	level.var_b175714d[id].var_2939a01a[level.var_b175714d[id].var_2939a01a.size] = entity;
	entity thread function_525526be(id);
}

/*
	Name: function_1afce5aa
	Namespace: zm_transform
	Checksum: 0xC952439C
	Offset: 0xE60
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function function_1afce5aa(entity)
{
	/#
		assert(isdefined(entity.var_d41ca76d));
	#/
	/#
		assert(isinarray(level.var_b175714d[entity.var_d41ca76d].var_2939a01a, entity));
	#/
	entity notify(#"hash_610e5a8c0ec1a4b6");
}

/*
	Name: function_331869
	Namespace: zm_transform
	Checksum: 0xE58EE67
	Offset: 0xEE8
	Size: 0x18
	Parameters: 1
	Flags: Linked
*/
function function_331869(entity)
{
	return isdefined(entity.var_d41ca76d);
}

/*
	Name: function_e95ec8df
	Namespace: zm_transform
	Checksum: 0x5006AA69
	Offset: 0xF08
	Size: 0x110
	Parameters: 1
	Flags: Linked
*/
function function_e95ec8df(clear_active)
{
	foreach(transformation in level.var_b175714d)
	{
		transformation.var_33e393a7 = 0;
		foreach(var_d41ca76d in transformation.var_2939a01a)
		{
			var_d41ca76d notify(#"hash_610e5a8c0ec1a4b6");
		}
	}
}

/*
	Name: function_fb608075
	Namespace: zm_transform
	Checksum: 0xDBCF3C24
	Offset: 0x1020
	Size: 0x1CE
	Parameters: 0
	Flags: Linked
*/
function function_fb608075()
{
	if(!isdefined(level.var_ebccd551) || level.var_ebccd551.size == 0)
	{
		return;
	}
	var_4ff6ca41 = [];
	foreach(transformation in level.var_ebccd551)
	{
		if(isinarray(var_4ff6ca41, transformation.id))
		{
			continue;
		}
		var_167b5341 = level.var_b175714d[transformation.id];
		if(is_true(transformation.var_ad4fb608))
		{
			level scene::function_f81475ae(var_167b5341.var_99fca475);
			transformation.var_ad4fb608 = 0;
		}
		level scene::stop(var_167b5341.var_44c5827d, 1);
		level scene::stop(var_167b5341.var_99fca475, 1);
		if(!isdefined(var_4ff6ca41))
		{
			var_4ff6ca41 = [];
		}
		else if(!isarray(var_4ff6ca41))
		{
			var_4ff6ca41 = array(var_4ff6ca41);
		}
		var_4ff6ca41[var_4ff6ca41.size] = transformation.id;
	}
}

/*
	Name: function_5db4f2f5
	Namespace: zm_transform
	Checksum: 0xE6757828
	Offset: 0x11F8
	Size: 0x98
	Parameters: 2
	Flags: None
*/
function function_5db4f2f5(entity, var_8763d10e)
{
	if(!isdefined(entity) || is_true(entity.var_69a981e6))
	{
		return false;
	}
	entity.var_982f937 = 1;
	if(is_true(var_8763d10e) && function_331869(entity))
	{
		function_1afce5aa(entity);
	}
	return true;
}

/*
	Name: function_1a1cb53
	Namespace: zm_transform
	Checksum: 0x382EAF17
	Offset: 0x1298
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function function_1a1cb53(entity)
{
	entity.var_982f937 = undefined;
}

/*
	Name: function_a261938f
	Namespace: zm_transform
	Checksum: 0x42E34034
	Offset: 0x12B8
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_a261938f(entity)
{
	return entity.var_982f937 !== 1;
}

/*
	Name: function_525526be
	Namespace: zm_transform
	Checksum: 0xB0124ABA
	Offset: 0x12E0
	Size: 0xB6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_525526be(id)
{
	waitresult = undefined;
	waitresult = self waittill(#"death", #"transformation_started", #"hash_610e5a8c0ec1a4b6");
	if(waitresult._notify != "death")
	{
		self.var_d41ca76d = undefined;
	}
	arrayremovevalue(level.var_b175714d[id].var_2939a01a, self);
	/#
		self notify(#"hash_6e3d9f8c484e3d01");
	#/
}

/*
	Name: function_4e679db4
	Namespace: zm_transform
	Checksum: 0xE024D5E3
	Offset: 0x13A0
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4e679db4(id, def)
{
	if(isdefined(def.spawner))
	{
		def.spawner.var_ab46c56 = id;
	}
	else if(isdefined(def.aitype))
	{
		level.var_170852dc[def.aitype] = id;
	}
}

/*
	Name: function_c81eb299
	Namespace: zm_transform
	Checksum: 0x315F3E3D
	Offset: 0x1408
	Size: 0xC8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c81eb299(id, def)
{
	if(isdefined(def.spawner))
	{
		/#
			assert(def.spawner.var_ab46c56 == id, "");
		#/
		def.spawner.var_ab46c56 = undefined;
	}
	else if(isdefined(def.aitype))
	{
		/#
			assert(level.var_170852dc[def.aitype] == id, "");
		#/
		level.var_170852dc[def.aitype] = undefined;
	}
}

/*
	Name: function_1050ba72
	Namespace: zm_transform
	Checksum: 0x2706E0A4
	Offset: 0x14D8
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1050ba72(def)
{
	if(isdefined(def.spawner))
	{
		return def.spawner spawnfromspawner(0, 1);
	}
	if(isdefined(def.aitype))
	{
		return spawnactor(def.aitype, (0, 0, 0), (0, 0, 0), undefined, 1);
	}
}

/*
	Name: transform
	Namespace: zm_transform
	Checksum: 0xDD41B172
	Offset: 0x1558
	Size: 0xBB6
	Parameters: 3
	Flags: Linked, Private
*/
function private transform(id, var_c2a69066, var_2cf708f4)
{
	if(!isdefined(var_2cf708f4))
	{
		var_2cf708f4 = 1;
	}
	level endon(#"end_game");
	if(function_abf1dcb4(id))
	{
		return;
	}
	var_167b5341 = level.var_b175714d[id];
	function_4e679db4(id, var_167b5341);
	var_e236d061 = {#hash_1a90140:self, #id:id};
	if(!isdefined(level.var_ebccd551))
	{
		level.var_ebccd551 = [];
	}
	else if(!isarray(level.var_ebccd551))
	{
		level.var_ebccd551 = array(level.var_ebccd551);
	}
	level.var_ebccd551[level.var_ebccd551.size] = var_e236d061;
	aitype = (isdefined(var_167b5341.spawner) ? var_167b5341.spawner.aitype : var_167b5341.aitype);
	if(isdefined(aitype))
	{
		var_e236d061.archetype = getarchetypefromclassname(aitype);
	}
	self.var_69a981e6 = 1;
	self.var_e236d061 = var_e236d061;
	var_e3920264 = self.var_e3920264;
	n_health_percent = min(self.health / self.maxhealth, 1);
	self notify(#"transformation_started");
	if(isdefined(var_167b5341.intro_func))
	{
		self [[var_167b5341.intro_func]]();
	}
	if(!isdefined(self) || !isalive(self))
	{
		arrayremovevalue(level.var_ebccd551, var_e236d061);
		function_c81eb299(id, var_167b5341);
		level notify(#"transformation_interrupted", {#id:id});
		return;
	}
	if(!isdefined(var_167b5341.var_44c5827d))
	{
		var_944250d2 = function_1050ba72(var_167b5341);
		if(!isdefined(var_944250d2) || !isalive(var_944250d2))
		{
			function_c81eb299(id, var_167b5341);
			arrayremovevalue(level.var_ebccd551, var_e236d061);
			level notify(#"transformation_interrupted", {#id:id});
			return;
		}
		var_e236d061.var_944250d2 = var_944250d2;
		var_944250d2.health = int(max(var_944250d2.health * n_health_percent, 1));
		var_944250d2.var_e236d061 = var_e236d061;
		var_944250d2._starting_round_number = self._starting_round_number;
		function_c81eb299(id, var_167b5341);
		if(isdefined(var_167b5341.outro_func))
		{
			var_944250d2 [[var_167b5341.outro_func]](n_health_percent);
		}
		var_944250d2 forceteleport(self.origin, self.angles);
		self zombie_utility::gib_random_parts();
		gibserverutils::annihilate(self);
		self val::set(#"zm_transformation", "hide", 2);
		if(var_2cf708f4)
		{
			self kill();
		}
		if(isdefined(var_c2a69066))
		{
			thread [[var_c2a69066]](var_944250d2);
		}
	}
	else
	{
		script_origin = {#angles:self.angles, #origin:self.origin};
		self val::set(#"zm_transformation", "ignoreall");
		a_ents = undefined;
		a_ents = array(self);
		self.animname = "spawner_zm_zombie";
		if(!isdefined(var_167b5341.var_accb1c92))
		{
			self clientfield::set("transformation_stream_split", 1);
		}
		var_e236d061.var_ad4fb608 = 1;
		level scene::function_27f5972e(var_167b5341.var_99fca475);
		script_origin scene::play(var_167b5341.var_44c5827d, a_ents);
		if(!isdefined(self) || !isalive(self))
		{
			if(isdefined(self))
			{
				self clientfield::set("transformation_stream_split", 0);
			}
			var_e236d061.var_ad4fb608 = 0;
			level scene::function_f81475ae(var_167b5341.var_99fca475);
			arrayremovevalue(level.var_ebccd551, var_e236d061);
			function_c81eb299(id, var_167b5341);
			level notify(#"transformation_interrupted", {#id:id});
			return;
		}
		if(isdefined(var_167b5341.var_accb1c92))
		{
			[[var_167b5341.var_accb1c92]](self, var_167b5341);
		}
		else
		{
			settingsbundle = self ai::function_9139c839();
			if(isdefined(settingsbundle) && isdefined(settingsbundle.var_d354164e))
			{
				foreach(var_127d3a7a in settingsbundle.var_d354164e)
				{
					if(self.model === var_127d3a7a.var_a3c9023c)
					{
						self.no_gib = 1;
						self setmodel(var_127d3a7a.var_cdf1f53d);
						break;
					}
				}
			}
		}
		self clientfield::set("transformation_stream_split", 0);
		var_e236d061.var_ad4fb608 = 0;
		level scene::function_f81475ae(var_167b5341.var_99fca475);
		self zombie_eye_glow::function_95cae3e3();
		var_944250d2 = function_1050ba72(var_167b5341);
		if(!isalive(var_944250d2))
		{
			arrayremovevalue(level.var_ebccd551, var_e236d061);
			function_c81eb299(id, var_167b5341);
			level notify(#"transformation_interrupted", {#id:id});
			return;
		}
		var_e236d061.var_944250d2 = var_944250d2;
		var_944250d2 function_bbaec2fd();
		var_944250d2.var_e236d061 = var_e236d061;
		var_944250d2._starting_round_number = self._starting_round_number;
		function_c81eb299(id, var_167b5341);
		if(isdefined(var_167b5341.outro_func))
		{
			var_944250d2 [[var_167b5341.outro_func]](n_health_percent);
		}
		if(!isdefined(var_944250d2) || !isalive(var_944250d2))
		{
			arrayremovevalue(level.var_ebccd551, var_e236d061);
			level notify(#"transformation_interrupted", {#id:id});
			return;
		}
		a_ents = array(var_944250d2, self);
		self callback::function_d8abfc3d(#"on_ai_killed", &function_a51fe6f9, undefined, array(var_944250d2));
		script_origin scene::play(var_167b5341.var_99fca475, a_ents);
		if(isdefined(self))
		{
			self callback::function_52ac9652(#"on_ai_killed", &function_a51fe6f9);
		}
		if(!isdefined(var_944250d2) || !isalive(var_944250d2))
		{
			if(isdefined(self) && isalive(self) && self.allowdeath)
			{
				self kill();
			}
			arrayremovevalue(level.var_ebccd551, var_e236d061);
			level notify(#"transformation_interrupted", {#id:id});
			return;
		}
	}
	var_944250d2.var_e236d061 = undefined;
	arrayremovevalue(level.var_ebccd551, var_e236d061);
	level notify(#"transformation_complete", {#data:var_e3920264, #id:id, #hash_944250d2:array(var_944250d2)});
	if(isdefined(var_c2a69066))
	{
		thread [[var_c2a69066]](var_944250d2);
	}
}

/*
	Name: function_a51fe6f9
	Namespace: zm_transform
	Checksum: 0x1A9902CF
	Offset: 0x2118
	Size: 0xB4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a51fe6f9(params, var_944250d2)
{
	if(isdefined(var_944250d2) && isalive(var_944250d2) && var_944250d2.allowdeath && isdefined(params.eattacker) && isplayer(params.eattacker))
	{
		var_944250d2 kill(undefined, params.eattacker, params.einflictor, params.weapon, 0, 1);
	}
}

/*
	Name: function_c3a1379e
	Namespace: zm_transform
	Checksum: 0x2D2C30D8
	Offset: 0x21D8
	Size: 0x8E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c3a1379e()
{
	return !is_true(level.var_c9f5947d) && (zombie_utility::get_current_zombie_count() + level.zombie_total) <= 10 && !is_true(level.var_78acec0a) && !level flag::get(#"infinite_round_spawning");
}

/*
	Name: function_fad54d94
	Namespace: zm_transform
	Checksum: 0x10C666EE
	Offset: 0x2270
	Size: 0x2B2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_fad54d94(id, var_167b5341)
{
	level endon(#"hash_670ec83e1acfadff", #"game_ended");
	if(var_167b5341.var_2939a01a.size > 0)
	{
		foreach(zombie in var_167b5341.var_2939a01a)
		{
			if(function_a261938f(zombie) && isdefined(var_167b5341.condition) && zombie [[var_167b5341.condition]]())
			{
				zombie thread transform(id);
				return true;
			}
		}
	}
	if(var_167b5341.var_33e393a7 > 0)
	{
		zombies = zombie_utility::get_round_enemy_array();
		foreach(zombie in zombies)
		{
			if(!isdefined(zombie) || !isalive(zombie) || function_331869(zombie))
			{
				continue;
			}
			if(function_a261938f(zombie) && isdefined(var_167b5341.condition) && zombie [[var_167b5341.condition]]())
			{
				zombie thread transform(id);
				var_167b5341.var_33e393a7--;
				level.var_138b37c4++;
				if(level.var_138b37c4 >= 6)
				{
					waitframe(1);
					level.var_138b37c4 = 0;
				}
				return true;
			}
			level.var_138b37c4++;
			if(level.var_138b37c4 >= 6)
			{
				waitframe(1);
				level.var_138b37c4 = 0;
			}
		}
	}
	return false;
}

/*
	Name: update
	Namespace: zm_transform
	Checksum: 0xA898806B
	Offset: 0x2530
	Size: 0x2F2
	Parameters: 0
	Flags: Linked, Private
*/
function private update()
{
	level endoncallback(&registerelectricity_rq_started_fire_, #"end_game");
	var_52f926ed = 0;
	level.var_138b37c4 = 0;
	var_f38e5f93 = (isdefined(level.var_f38e5f93) ? level.var_f38e5f93 : 1);
	while(true)
	{
		if(is_true(var_52f926ed))
		{
			wait(var_f38e5f93);
		}
		else
		{
			wait(0.2);
		}
		level flag::wait_till_clear(#"hash_670ec83e1acfadff");
		if(function_c3a1379e())
		{
			level notify(#"hash_239ebc19aab5a60b");
			function_e95ec8df();
			level waittill(#"start_of_round", #"force_transformations");
		}
		var_52f926ed = 0;
		time = gettime();
		keys = array::randomize(getarraykeys(level.var_b175714d));
		foreach(id in keys)
		{
			transformation = level.var_b175714d[id];
			if(level flag::get(#"hash_670ec83e1acfadff") || function_c3a1379e())
			{
				break;
			}
			pixbeginevent();
			if(transformation.var_ebaa8de9 > time)
			{
				pixendevent();
				continue;
			}
			if(function_abf1dcb4(id))
			{
				pixendevent();
				continue;
			}
			var_52f926ed = function_fad54d94(id, transformation);
			pixendevent();
			if(is_true(var_52f926ed))
			{
				transformation.var_ebaa8de9 = (is_true(level.var_78acec0a) ? gettime() : gettime() + (transformation.cooldown_time * 1000));
				break;
			}
		}
	}
}

/*
	Name: registerelectricity_rq_started_fire_
	Namespace: zm_transform
	Checksum: 0x1B40F3DA
	Offset: 0x2830
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private registerelectricity_rq_started_fire_(var_201c5b1f)
{
	function_e95ec8df();
	function_fb608075();
}

/*
	Name: function_bbaec2fd
	Namespace: zm_transform
	Checksum: 0xDF9AE7CC
	Offset: 0x2868
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_bbaec2fd()
{
	self clientfield::set("transformation_spawn", 1);
}

/*
	Name: devgui
	Namespace: zm_transform
	Checksum: 0x693963A0
	Offset: 0x2898
	Size: 0x4DE
	Parameters: 0
	Flags: Private
*/
function private devgui()
{
	/#
		level waittill(#"start_zombie_round_logic");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		foreach(transformation in level.var_b175714d)
		{
			adddebugcommand((("" + function_9e72a96(id)) + "") + function_9e72a96(id) + "");
			adddebugcommand((("" + function_9e72a96(id)) + "") + function_9e72a96(id) + "");
			adddebugcommand((("" + function_9e72a96(id)) + "") + function_9e72a96(id) + "");
		}
		registershack_walla = 0;
		while(true)
		{
			wait(0.2);
			cmd = getdvarstring(#"hash_439ed91bbc9ac4c0", "");
			if(cmd == "")
			{
				continue;
			}
			setdvar(#"hash_439ed91bbc9ac4c0", "");
			cmd = strtok(cmd, "");
			switch(cmd[0])
			{
				case "toggle_status":
				{
					registershack_walla = !registershack_walla;
					if(!registershack_walla)
					{
						level notify(#"hash_53f34619e212c4cd");
					}
					else
					{
						level thread show_status();
					}
					break;
				}
				case "force":
				{
					var_167b5341 = level.var_b175714d[cmd[1]];
					if(!isdefined(var_167b5341))
					{
						break;
					}
					level thread function_3d080ace(cmd[1]);
					break;
				}
				case "spawn":
				{
					var_167b5341 = level.var_b175714d[cmd[1]];
					if(!isdefined(var_167b5341))
					{
						break;
					}
					level.var_78acec0a = 1;
					level notify(#"force_transformations");
					level thread function_2f40be20(cmd[1]);
					break;
				}
				case "queue":
				{
					level.var_78acec0a = 1;
					level notify(#"force_transformations");
					function_bdd8aba6(cmd[1]);
					break;
				}
				case "pause":
				{
					function_4da8230b(#"hash_7a79688cef85b533");
					break;
				}
				case "resume":
				{
					function_6b183c78(#"hash_7a79688cef85b533");
					break;
				}
				case "hash_5893e94d64f92905":
				{
					function_6bcb49b5();
					break;
				}
			}
		}
	#/
}

/*
	Name: function_ece5c99c
	Namespace: zm_transform
	Checksum: 0x8A1ACFCD
	Offset: 0x2D80
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_ece5c99c()
{
	/#
		self.zombie_think_done = 1;
		self.completed_emerging_into_playable_area = 1;
	#/
}

/*
	Name: function_3f433f41
	Namespace: zm_transform
	Checksum: 0xAEB5839D
	Offset: 0x2DB0
	Size: 0x1E8
	Parameters: 0
	Flags: None
*/
function function_3f433f41()
{
	/#
		if(!isdefined(level.zombie_spawners))
		{
			return;
		}
		player = level.players[0];
		direction = player getplayerangles();
		direction_vec = anglestoforward(direction);
		eye = player geteye();
		scale = 8000;
		direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
		trace = bullettrace(eye, eye + direction_vec, 0, undefined);
		if(trace[#"fraction"] >= 1)
		{
			return;
		}
		random_spawner = array::random(level.zombie_spawners);
		zombie = random_spawner spawnfromspawner(random_spawner.targetname, 1, 0, 1);
		zombie.custom_location = &function_ece5c99c;
		zombie.b_ignore_cleanup = 1;
		if(!isdefined(zombie))
		{
			return;
		}
		zombie forceteleport(trace[#"position"], player.angles + vectorscale((0, 1, 0), 180));
		return zombie;
	#/
}

/*
	Name: function_3d080ace
	Namespace: zm_transform
	Checksum: 0xD72437A8
	Offset: 0x2FA8
	Size: 0x94
	Parameters: 1
	Flags: Private
*/
function private function_3d080ace(var_70d26bfb)
{
	/#
		zombie = function_3f433f41();
		if(!isdefined(zombie))
		{
			return;
		}
		zombie endon(#"death");
		wait(0.5);
		while(function_abf1dcb4(var_70d26bfb))
		{
			waitframe(1);
		}
		function_9acf76e6(zombie, var_70d26bfb);
	#/
}

/*
	Name: function_2f40be20
	Namespace: zm_transform
	Checksum: 0x185852EB
	Offset: 0x3048
	Size: 0x74
	Parameters: 1
	Flags: Private
*/
function private function_2f40be20(var_70d26bfb)
{
	/#
		zombie = function_3f433f41();
		if(!isdefined(zombie))
		{
			return;
		}
		zombie endon(#"death");
		zombie.var_641025d6 = gettime() + 500;
		function_d2374144(zombie, var_70d26bfb);
	#/
}

/*
	Name: function_4bad29d9
	Namespace: zm_transform
	Checksum: 0x51401F74
	Offset: 0x30C8
	Size: 0x110
	Parameters: 1
	Flags: Private
*/
function private function_4bad29d9(notifyhash)
{
	/#
		foreach(var_deb567a8 in level.var_deb567a8)
		{
			if(!isdefined(var_deb567a8.id))
			{
				var_deb567a8.var_735311f0 destroy();
			}
			var_deb567a8.title destroy();
			var_deb567a8.var_d189697d destroy();
			var_deb567a8.var_b99573ec destroy();
		}
		level.var_deb567a8 = undefined;
		level notify(#"hash_6e3d9f8c484e3d01");
	#/
}

/*
	Name: create_hudelem
	Namespace: zm_transform
	Checksum: 0xB7347C8A
	Offset: 0x31E0
	Size: 0xA2
	Parameters: 2
	Flags: Private
*/
function private create_hudelem(y, x)
{
	/#
		if(!isdefined(x))
		{
			x = 0;
		}
		var_aa917a22 = newdebughudelem();
		var_aa917a22.alignx = "";
		var_aa917a22.horzalign = "";
		var_aa917a22.aligny = "";
		var_aa917a22.vertalign = "";
		var_aa917a22.y = y;
		var_aa917a22.x = x;
		return var_aa917a22;
	#/
}

/*
	Name: setup_status
	Namespace: zm_transform
	Checksum: 0x1DFFF44A
	Offset: 0x3290
	Size: 0x494
	Parameters: 0
	Flags: Private
*/
function private setup_status()
{
	/#
		level.var_deb567a8 = array();
		y = 10;
		colors = array((1, 1, 1));
		var_e859a426 = create_hudelem(y);
		var_e859a426 settext("");
		y = y + 10;
		var_735311f0 = create_hudelem(y);
		var_af5fbf35 = create_hudelem(y, 160);
		var_af5fbf35 settext("");
		var_f4676cb4 = create_hudelem(y, 220);
		var_f4676cb4 settext("");
		if(!isdefined(level.var_deb567a8))
		{
			level.var_deb567a8 = [];
		}
		else if(!isarray(level.var_deb567a8))
		{
			level.var_deb567a8 = array(level.var_deb567a8);
		}
		level.var_deb567a8[level.var_deb567a8.size] = {#hash_735311f0:var_735311f0, #hash_b99573ec:var_f4676cb4, #hash_d189697d:var_af5fbf35, #title:var_e859a426};
		i = 0;
		foreach(id, transformation in level.var_b175714d)
		{
			y = y + 10;
			current_color = colors[i % colors.size];
			id_elem = create_hudelem(y);
			id_elem settext(function_9e72a96(id));
			id_elem.color = current_color;
			id_elem.fontscale = 1.2;
			var_83db7237 = create_hudelem(y, 160);
			var_83db7237 settext(0);
			var_83db7237.color = current_color;
			var_83db7237.fontscale = 1.2;
			var_82f71158 = create_hudelem(y, 220);
			var_82f71158 settext(0);
			var_82f71158.color = current_color;
			var_82f71158.fontscale = 1.2;
			if(!isdefined(level.var_deb567a8))
			{
				level.var_deb567a8 = [];
			}
			else if(!isarray(level.var_deb567a8))
			{
				level.var_deb567a8 = array(level.var_deb567a8);
			}
			level.var_deb567a8[level.var_deb567a8.size] = {#color:current_color, #id:id, #hash_b99573ec:var_82f71158, #hash_d189697d:var_83db7237, #title:id_elem};
			i++;
		}
	#/
}

/*
	Name: function_9aa982db
	Namespace: zm_transform
	Checksum: 0x6FB90A34
	Offset: 0x3730
	Size: 0x1A
	Parameters: 1
	Flags: Private
*/
function private function_9aa982db(notifyhash)
{
	/#
		self.var_30acf8aa = undefined;
	#/
}

/*
	Name: function_4a065e66
	Namespace: zm_transform
	Checksum: 0xE044F162
	Offset: 0x3758
	Size: 0xCE
	Parameters: 2
	Flags: Private
*/
function private function_4a065e66(id, color)
{
	/#
		self endoncallback(&function_9aa982db, #"death", #"hash_6e3d9f8c484e3d01");
		level endoncallback(&function_9aa982db, #"hash_6e3d9f8c484e3d01");
		self.var_30acf8aa = 1;
		while(true)
		{
			record3dtext(function_9e72a96(id), self.origin + (0, 0, self.maxs[2]), color);
			waitframe(1);
		}
	#/
}

/*
	Name: show_status
	Namespace: zm_transform
	Checksum: 0x1353A992
	Offset: 0x3830
	Size: 0x260
	Parameters: 0
	Flags: Private
*/
function private show_status()
{
	/#
		level notify(#"hash_53f34619e212c4cd");
		level endoncallback(&function_4bad29d9, #"hash_53f34619e212c4cd");
		setup_status();
		while(true)
		{
			waitframe(1);
			foreach(var_deb567a8 in level.var_deb567a8)
			{
				if(!isdefined(var_deb567a8.id))
				{
					var_deb567a8.var_735311f0 settext((function_770908a2() ? "" : ""));
					continue;
				}
				var_deb567a8.var_d189697d settext(level.var_b175714d[var_deb567a8.id].var_33e393a7);
				var_deb567a8.var_b99573ec settext(level.var_b175714d[var_deb567a8.id].var_2939a01a.size);
				foreach(ai in level.var_b175714d[var_deb567a8.id].var_2939a01a)
				{
					if(!is_true(ai.var_30acf8aa))
					{
						ai thread function_4a065e66(var_deb567a8.id, var_deb567a8.color);
					}
				}
			}
		}
	#/
}

/*
	Name: function_6bcb49b5
	Namespace: zm_transform
	Checksum: 0xE02E80B
	Offset: 0x3A98
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private function_6bcb49b5()
{
	/#
		level.var_dfd1a1c0 = !is_true(level.var_dfd1a1c0);
		if(level.var_dfd1a1c0)
		{
			level thread function_dfd1a1c0();
		}
	#/
}

/*
	Name: function_dfd1a1c0
	Namespace: zm_transform
	Checksum: 0x60A3FFCB
	Offset: 0x3AF8
	Size: 0x168
	Parameters: 0
	Flags: Private
*/
function private function_dfd1a1c0()
{
	/#
		self notify("");
		self endon("");
		while(level.var_dfd1a1c0)
		{
			var_c2624dfc = 200;
			var_b010a959 = 100;
			debug2dtext((var_c2624dfc, var_b010a959, 0), "", (1, 1, 0), 1, (0, 0, 0), 0.8, 1);
			var_b010a959 = var_b010a959 + 25;
			foreach(pauser in level.var_50f7dbd5)
			{
				debug2dtext((var_c2624dfc, var_b010a959, 0), function_9e72a96(pauser), (1, 1, 1), 1, (0, 0, 0), 0.8, 1);
				var_b010a959 = var_b010a959 + 25;
			}
			waitframe(1);
		}
	#/
}

