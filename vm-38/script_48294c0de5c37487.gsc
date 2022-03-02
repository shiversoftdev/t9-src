#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\util.gsc;

#namespace hazard;

/*
	Name: function_b6b27265
	Namespace: hazard
	Checksum: 0xF74D1D97
	Offset: 0x248
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b6b27265()
{
	level notify(1331475598);
}

/*
	Name: function_89f2df9
	Namespace: hazard
	Checksum: 0xC36A4B95
	Offset: 0x268
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hazard", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: hazard
	Checksum: 0x1448FC52
	Offset: 0x2B0
	Size: 0x214
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "hazard_gas", 1, 1, "int");
	clientfield::register("toplayer", "hazard_gas_with_mask", 1, 1, "int");
	add_hazard("heat", 500, 50, 1, &function_34e51510);
	add_hazard("filter", 500, 50, 2);
	add_hazard("o2", 500, 60, 3, &function_4a55b624);
	add_hazard("radiation", 500, 50, 4);
	add_hazard("biohazard", 500, 50, 5);
	add_hazard("gas", 500, 50, 6, &function_6c8414c8);
	callback::on_spawned(&on_player_spawned);
	callback::on_player_killed(&on_player_killed);
	callback::on_connect(&on_player_connect);
	level.var_c1e49fd1 = [];
	level.var_c1e49fd1[#"huditems.hess1"] = "hudItems.hess1";
	level.var_c1e49fd1[#"huditems.hess2"] = "hudItems.hess2";
}

/*
	Name: add_hazard
	Namespace: hazard
	Checksum: 0x5E55098D
	Offset: 0x4D0
	Size: 0xFE
	Parameters: 5
	Flags: Linked
*/
function add_hazard(str_name, n_max_protection, n_regen_rate, n_type, func_update)
{
	if(!isdefined(level.hazards))
	{
		level.hazards = [];
	}
	if(!isdefined(level.hazards[str_name]))
	{
		level.hazards[str_name] = spawnstruct();
	}
	level.hazards[str_name].n_max_protection = n_max_protection;
	level.hazards[str_name].n_regen_rate = n_regen_rate;
	level.hazards[str_name].n_type = n_type;
	level.hazards[str_name].func_update = func_update;
	level.hazards[str_name].var_13b85955 = [];
}

/*
	Name: on_player_spawned
	Namespace: hazard
	Checksum: 0x7E288D7A
	Offset: 0x5D8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self reset(1);
}

/*
	Name: function_5795b52b
	Namespace: hazard
	Checksum: 0x98B97E21
	Offset: 0x600
	Size: 0xD6
	Parameters: 4
	Flags: None
*/
function function_5795b52b(ent, var_393cf5b7, n_max_dist_sq, var_c6ab6ff5)
{
	if(!isdefined(n_max_dist_sq))
	{
		n_max_dist_sq = 250000;
	}
	if(!isdefined(var_c6ab6ff5))
	{
		var_c6ab6ff5 = 10;
	}
	if(!isdefined(ent))
	{
		ent = self;
	}
	if(!isinarray(level.hazards[var_393cf5b7].var_13b85955, ent))
	{
		array::add(level.hazards[var_393cf5b7].var_13b85955, ent, 0);
		ent.var_11019442 = {#hash_c6ab6ff5:var_c6ab6ff5, #n_max_dist_sq:n_max_dist_sq};
	}
}

/*
	Name: function_38603984
	Namespace: hazard
	Checksum: 0x27EB8854
	Offset: 0x6E0
	Size: 0x7E
	Parameters: 2
	Flags: None
*/
function function_38603984(ent, var_393cf5b7)
{
	if(!isdefined(ent))
	{
		ent = self;
	}
	if(isinarray(level.hazards[var_393cf5b7].var_13b85955, ent))
	{
		arrayremovevalue(level.hazards[var_393cf5b7].var_13b85955, ent);
		ent.var_11019442 = undefined;
	}
}

/*
	Name: function_551f9f75
	Namespace: hazard
	Checksum: 0x3C9C3363
	Offset: 0x768
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function function_551f9f75(var_393cf5b7)
{
	if(isdefined(var_393cf5b7))
	{
		if(isinarray(level.hazards[var_393cf5b7], self) && isdefined(self.var_11019442))
		{
			return true;
		}
	}
	else
	{
		foreach(s_hazard in level.hazards)
		{
			if(isinarray(s_hazard.var_13b85955, self) && isdefined(self.var_11019442))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_cc876e01
	Namespace: hazard
	Checksum: 0x5FC9DC98
	Offset: 0x878
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_cc876e01(ent)
{
	if(self istouching(ent))
	{
		return 1;
	}
	if(!ent function_551f9f75())
	{
		return 0;
	}
	n_dist_sq = distancesquared(self.origin, ent.origin);
	n_dist_normalized = 1 - mapfloat(0, ent.var_11019442.n_max_dist_sq, 0, 1, n_dist_sq);
	return n_dist_normalized;
}

/*
	Name: function_32b2e015
	Namespace: hazard
	Checksum: 0x11290B4B
	Offset: 0x940
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_32b2e015(ent)
{
	if(!ent function_551f9f75())
	{
		return 0;
	}
	n_dist_sq = distancesquared(self.origin, ent.origin);
	n_dist_normalized = 1 - mapfloat(0, ent.var_11019442.n_max_dist_sq, 0, 1, n_dist_sq);
	n_damage = ent.var_11019442.var_c6ab6ff5 * n_dist_normalized;
	return n_damage;
}

/*
	Name: function_d63819fe
	Namespace: hazard
	Checksum: 0x9B612DA5
	Offset: 0xA08
	Size: 0x18A
	Parameters: 0
	Flags: None
*/
function function_d63819fe()
{
	self endon(#"death");
	if(isbot(self))
	{
		return;
	}
	while(true)
	{
		foreach(str_name, s_hazard in level.hazards)
		{
			foreach(ent in s_hazard.var_13b85955)
			{
				if(isdefined(ent) && self function_cc876e01(ent))
				{
					n_damage = function_32b2e015(ent);
					self do_damage(str_name, n_damage, ent, 0);
					continue;
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: on_player_connect
	Namespace: hazard
	Checksum: 0x6EC47355
	Offset: 0xBA0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self reset(0);
	self thread function_26752de1();
	self thread function_66980cf3();
}

/*
	Name: on_player_killed
	Namespace: hazard
	Checksum: 0xE5CF368C
	Offset: 0xBF8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(params)
{
	self reset(1);
	self function_b9699173();
}

/*
	Name: reset
	Namespace: hazard
	Checksum: 0x4830041D
	Offset: 0xC40
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function reset(var_f9b16c16)
{
	foreach(str_name, _ in level.hazards)
	{
		self.hazard_damage[str_name] = 0;
		self.var_faa7fdee[str_name] = 1;
	}
	self.hazard_ui_models = [];
	self.hazard_ui_models[#"huditems.hess1"] = 0;
	self.hazard_ui_models[#"huditems.hess2"] = 0;
}

/*
	Name: function_c370832e
	Namespace: hazard
	Checksum: 0x387570C1
	Offset: 0xD30
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_c370832e()
{
	if(is_true(level.var_a51b5712))
	{
		waitframe(1);
		if(is_true(self.var_59d09950))
		{
			self allowsprint(1);
			self allowslide(1);
		}
		else
		{
			self.var_bbfa647a = 1;
			self allowsprint(0);
			self allowslide(0);
		}
		self allowjump(1);
		self thread function_ec94d4eb();
	}
	else
	{
		self allowsprint(1);
		self allowslide(1);
		self allowjump(1);
	}
}

/*
	Name: function_81d8cdd8
	Namespace: hazard
	Checksum: 0x98479DC8
	Offset: 0xE68
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_81d8cdd8()
{
	level.var_a51b5712 = 1;
	a_players = getplayers();
	array::thread_all(a_players, &function_c370832e);
	callback::on_spawned(&function_c370832e);
}

/*
	Name: function_6faef2d1
	Namespace: hazard
	Checksum: 0x7FDAB9F7
	Offset: 0xEE0
	Size: 0x118
	Parameters: 0
	Flags: None
*/
function function_6faef2d1()
{
	callback::remove_on_spawned(&function_c370832e);
	level.var_a51b5712 = undefined;
	level notify(#"hash_440299874a982aae");
	foreach(player in getplayers())
	{
		if(is_true(player.var_bbfa647a))
		{
			player.var_bbfa647a = undefined;
			player allowsprint(1);
			player allowslide(1);
		}
	}
}

/*
	Name: function_c687b8bc
	Namespace: hazard
	Checksum: 0x95305DE4
	Offset: 0x1000
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_c687b8bc()
{
	return is_true(level.var_a51b5712);
}

/*
	Name: give_gas_mask
	Namespace: hazard
	Checksum: 0x4D051CAF
	Offset: 0x1028
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function give_gas_mask()
{
	self.var_59d09950 = 1;
}

/*
	Name: remove_gas_mask
	Namespace: hazard
	Checksum: 0x378FBE7D
	Offset: 0x1048
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function remove_gas_mask()
{
	self.var_59d09950 = undefined;
}

/*
	Name: function_612d007d
	Namespace: hazard
	Checksum: 0x52398532
	Offset: 0x1060
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_612d007d()
{
	return is_true(self.var_59d09950);
}

/*
	Name: function_ec94d4eb
	Namespace: hazard
	Checksum: 0xCC2C685C
	Offset: 0x1088
	Size: 0x1B6
	Parameters: 0
	Flags: Linked
*/
function function_ec94d4eb()
{
	self notify(#"hash_440299874a982aae");
	self endon(#"hash_440299874a982aae", #"death");
	level endon(#"hash_440299874a982aae");
	self.hazard_damage[#"gas"] = 0;
	while(true)
	{
		if(is_true(level.var_a51b5712))
		{
			if(is_true(self.var_59d09950))
			{
				if(self function_838a3ba4("gas") >= 0.75)
				{
					self.hazard_damage[#"gas"] = level.hazards[#"gas"].n_max_protection * 0.75;
					self thread _fill_hazard_protection("gas", undefined, 0);
				}
			}
			else if(self function_838a3ba4("gas") < 0.25)
			{
				self.hazard_damage[#"gas"] = level.hazards[#"gas"].n_max_protection * 0.25;
				self thread _fill_hazard_protection("gas", undefined, 0);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_26752de1
	Namespace: hazard
	Checksum: 0xCC6634E5
	Offset: 0x1248
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_26752de1()
{
	self endon(#"disconnect");
	while(true)
	{
		level waittill(#"save_restore");
		if(is_true(self.var_ac0c25c9))
		{
			continue;
		}
		var_908e6259 = getarraykeys(level.hazards);
		foreach(str_name in var_908e6259)
		{
			self do_damage(str_name, 3, undefined);
			wait(0.1);
		}
	}
}

/*
	Name: function_66980cf3
	Namespace: hazard
	Checksum: 0xB65E297C
	Offset: 0x1360
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_66980cf3()
{
	self endon(#"disconnect");
	while(true)
	{
		self waittill(#"player_revived");
		foreach(_ in level.hazards)
		{
			if(function_838a3ba4(str_name) >= 1)
			{
				function_de8dda88(str_name);
			}
		}
	}
}

/*
	Name: function_de8dda88
	Namespace: hazard
	Checksum: 0xD1017042
	Offset: 0x1448
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_de8dda88(str_name)
{
	/#
		assert(isdefined(level.hazards[str_name]), ("" + str_name) + "");
	#/
	self.hazard_damage[str_name] = 0;
}

/*
	Name: do_damage
	Namespace: hazard
	Checksum: 0x18D4D1D0
	Offset: 0x14B0
	Size: 0x2CE
	Parameters: 4
	Flags: Linked
*/
function do_damage(str_name, n_damage, e_ent, disable_ui)
{
	/#
		assert(isdefined(level.hazards[str_name]), ("" + str_name) + "");
	#/
	if(!isdefined(disable_ui))
	{
		disable_ui = 0;
	}
	if(self scene::is_igc_active())
	{
		return false;
	}
	s_hazard = level.hazards[str_name];
	self.hazard_damage[str_name] = min(self.hazard_damage[str_name] + n_damage, s_hazard.n_max_protection);
	if(str_name == "gas")
	{
		if(is_true(self.var_59d09950))
		{
			if(self.hazard_damage[#"gas"] >= (s_hazard.n_max_protection * 0.75))
			{
				self.hazard_damage[#"gas"] = s_hazard.n_max_protection * 0.75;
			}
		}
		else
		{
			self.hazard_damage[#"gas"] = self.hazard_damage[#"gas"] * 1.1;
		}
	}
	if(self.hazard_damage[str_name] < s_hazard.n_max_protection)
	{
		self thread _fill_hazard_protection(str_name, e_ent, disable_ui);
		return true;
	}
	switch(str_name)
	{
		case "o2":
		{
			str_mod = "MOD_DROWN";
			break;
		}
		case "heat":
		{
			str_mod = "MOD_BURNED";
			break;
		}
		case "gas":
		{
			str_mod = "MOD_GAS";
			n_delay = 3.5;
			break;
		}
		default:
		{
			str_mod = "MOD_UNKNOWN";
		}
	}
	if(!is_true(self.var_b6364cf6))
	{
		self.var_b6364cf6 = 1;
		self thread function_df0660b4(str_name, str_mod, n_delay);
	}
	return false;
}

/*
	Name: function_df0660b4
	Namespace: hazard
	Checksum: 0xDB225A6A
	Offset: 0x1788
	Size: 0x144
	Parameters: 3
	Flags: Linked
*/
function function_df0660b4(var_36fe5e98, str_mod, n_delay)
{
	self endoncallback(&function_c64631b9, #"hash_146502ffd81b5e00", #"death");
	if(isdefined(n_delay))
	{
		wait(n_delay);
	}
	if(self.hazard_damage[var_36fe5e98] < level.hazards[var_36fe5e98].n_max_protection)
	{
		self notify(#"hash_146502ffd81b5e00");
	}
	else if(var_36fe5e98 === "gas")
	{
		self dodamage(self.health / 2, self.origin, undefined, undefined, undefined, str_mod);
		wait(3);
	}
	self.var_b6364cf6 = undefined;
	if(self.hazard_damage[var_36fe5e98] >= level.hazards[var_36fe5e98].n_max_protection)
	{
		self dodamage(self.health, self.origin, undefined, undefined, undefined, str_mod);
	}
}

/*
	Name: function_c64631b9
	Namespace: hazard
	Checksum: 0x45091E5D
	Offset: 0x18D8
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_c64631b9(str_notify)
{
	self.var_b6364cf6 = undefined;
}

/*
	Name: function_a4d2293
	Namespace: hazard
	Checksum: 0x9D62F216
	Offset: 0x18F8
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_a4d2293(str_name)
{
	/#
		assert(isdefined(self.hazard_damage[str_name]), ("" + str_name) + "");
	#/
	return self.hazard_damage[str_name];
}

/*
	Name: function_838a3ba4
	Namespace: hazard
	Checksum: 0x58147A9A
	Offset: 0x1950
	Size: 0x138
	Parameters: 1
	Flags: Linked
*/
function function_838a3ba4(str_name)
{
	/#
		assert(isdefined(self.hazard_damage[str_name]), ("" + str_name) + "");
	#/
	/#
		assert(isdefined(level.hazards[str_name]), ("" + str_name) + "");
	#/
	/#
		assert(isdefined(level.hazards[str_name].n_max_protection), ("" + str_name) + "");
	#/
	/#
		assert(level.hazards[str_name].n_max_protection != 0, ("" + str_name) + "");
	#/
	return self.hazard_damage[str_name] / level.hazards[str_name].n_max_protection;
}

/*
	Name: function_e9b38487
	Namespace: hazard
	Checksum: 0xBFBB512C
	Offset: 0x1A90
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_e9b38487(str_name, var_e7cbf6d7)
{
	if(!isdefined(var_e7cbf6d7))
	{
		var_e7cbf6d7 = 1;
	}
	/#
		assert(isdefined(self.var_faa7fdee[str_name]), ("" + str_name) + "");
	#/
	self.var_faa7fdee[str_name] = var_e7cbf6d7;
}

/*
	Name: _fill_hazard_protection
	Namespace: hazard
	Checksum: 0xE24B2975
	Offset: 0x1B08
	Size: 0x314
	Parameters: 3
	Flags: Linked, Private
*/
function private _fill_hazard_protection(str_name, e_ent, disable_ui)
{
	self notify("_hazard_protection_" + str_name);
	self endon("_hazard_protection_" + str_name, #"death");
	s_hazard = level.hazards[str_name];
	str_ui_model = "";
	foreach(model, type in self.hazard_ui_models)
	{
		if(type == s_hazard.n_type)
		{
			str_ui_model = model;
			break;
		}
	}
	if(str_ui_model == "")
	{
		foreach(model, type in self.hazard_ui_models)
		{
			if(type == 0)
			{
				str_ui_model = model;
				break;
			}
		}
	}
	if(str_ui_model != "")
	{
		self.hazard_ui_models[str_ui_model] = s_hazard.n_type;
	}
	do
	{
		n_frac = mapfloat(0, s_hazard.n_max_protection, 1, 0, self.hazard_damage[str_name]);
		if(isdefined(s_hazard.func_update))
		{
			[[s_hazard.func_update]](n_frac, e_ent);
		}
		waitframe(1);
		if(self.var_faa7fdee[str_name] == 1)
		{
			self.hazard_damage[str_name] = self.hazard_damage[str_name] - (s_hazard.n_regen_rate * (float(function_60d95f53()) / 1000));
		}
	}
	while(self.hazard_damage[str_name] >= 0);
	self function_b9699173();
	if(str_ui_model != "")
	{
		self.hazard_ui_models[str_ui_model] = 0;
	}
	else
	{
		util::warning("Invalid UI model while running _fill_hazard_protection() in hazard.gsc");
	}
}

/*
	Name: function_b9699173
	Namespace: hazard
	Checksum: 0x260ECC0C
	Offset: 0x1E28
	Size: 0x8E
	Parameters: 0
	Flags: Linked
*/
function function_b9699173()
{
	self clientfield::set("burn", 0);
	self clientfield::set_to_player("player_cam_bubbles", 0);
	self clientfield::set_to_player("hazard_gas", 0);
	self clientfield::set_to_player("hazard_gas_with_mask", 0);
	self.var_d3021168 = undefined;
}

/*
	Name: function_6c8414c8
	Namespace: hazard
	Checksum: 0x1B1BF343
	Offset: 0x1EC0
	Size: 0x244
	Parameters: 2
	Flags: Linked
*/
function function_6c8414c8(n_damage_frac, e_ent)
{
	if(!isdefined(e_ent) || self scene::is_igc_active())
	{
		self.var_d3021168 = undefined;
		if(is_true(self.var_59d09950))
		{
			self clientfield::set_to_player("hazard_gas_with_mask", 0);
		}
		else
		{
			self clientfield::set_to_player("hazard_gas", 0);
		}
		return;
	}
	if(!is_true(self.var_d3021168) && self function_cc876e01(e_ent))
	{
		self.var_d3021168 = 1;
		self thread function_f8b76be2(e_ent);
		if(is_true(self.var_59d09950))
		{
			self clientfield::set_to_player("hazard_gas_with_mask", 1);
		}
		else
		{
			self clientfield::set_to_player("hazard_gas", 1);
			self thread function_706c6374(e_ent);
			self thread function_ec916448(e_ent);
		}
	}
	else if(is_true(self.var_d3021168) && !self function_cc876e01(e_ent))
	{
		self notify(#"hash_146502ffd81b5e00");
		self notify(#"hash_3f0b3437172b9a8");
		self.var_d3021168 = undefined;
		if(is_true(self.var_59d09950))
		{
			self clientfield::set_to_player("hazard_gas_with_mask", 0);
		}
		else
		{
			self clientfield::set_to_player("hazard_gas", 0);
		}
	}
}

/*
	Name: function_f8b76be2
	Namespace: hazard
	Checksum: 0x5A539CEB
	Offset: 0x2110
	Size: 0x23C
	Parameters: 1
	Flags: Linked
*/
function function_f8b76be2(var_4380761c)
{
	self notify(#"hash_2b952f4edc0e373e");
	self endon(#"death", #"hash_2b952f4edc0e373e");
	var_c98d6d89 = self getmovespeedscale();
	while(isdefined(var_4380761c) && self function_cc876e01(var_4380761c))
	{
		if(self function_838a3ba4("gas") < 0.25)
		{
			self allowsprint(1);
			self allowslide(1);
		}
		if(self function_838a3ba4("gas") >= 0.25)
		{
			self allowsprint(0);
			self allowslide(0);
		}
		if(self function_838a3ba4("gas") < 0.5)
		{
			self allowjump(1);
		}
		if(self function_838a3ba4("gas") >= 0.5)
		{
			self allowjump(0);
		}
		if(self function_838a3ba4("gas") > 0.75)
		{
			var_c98d6d89 = var_c98d6d89 - 0.02;
			if(var_c98d6d89 < 0.25)
			{
				var_c98d6d89 = 0.25;
			}
			self setmovespeedscale(var_c98d6d89);
		}
		waitframe(1);
	}
	self thread function_fadc8777();
}

/*
	Name: function_fadc8777
	Namespace: hazard
	Checksum: 0x187D9C9C
	Offset: 0x2358
	Size: 0x18E
	Parameters: 0
	Flags: Linked
*/
function function_fadc8777()
{
	self notify(#"hash_6beb94844e993bc4");
	self endon(#"death", #"hash_2b952f4edc0e373e", #"hash_6beb94844e993bc4");
	var_c98d6d89 = self getmovespeedscale();
	if(function_c687b8bc())
	{
		if(self function_612d007d())
		{
			self allowsprint(1);
			self allowslide(1);
		}
		self allowjump(1);
	}
	else
	{
		self allowsprint(1);
		self allowslide(1);
		self allowjump(1);
	}
	while(var_c98d6d89 < 1)
	{
		var_c98d6d89 = var_c98d6d89 + 0.02;
		var_c98d6d89 = math::clamp(var_c98d6d89, 0.25, 1);
		self setmovespeedscale(var_c98d6d89);
		waitframe(1);
	}
}

/*
	Name: function_706c6374
	Namespace: hazard
	Checksum: 0x3CC96114
	Offset: 0x24F0
	Size: 0x126
	Parameters: 1
	Flags: Linked
*/
function function_706c6374(var_4380761c)
{
	self endon(#"death", #"hash_77bc187f88f8dd90");
	var_46d77ca5 = getweapon(#"hash_dc178a25bd3f753");
	w_current = self getcurrentweapon();
	self disableweaponcycling();
	while(isdefined(var_4380761c) && self function_cc876e01(var_4380761c))
	{
		self giveweapon(var_46d77ca5);
		self switchtoweapon(var_46d77ca5);
		wait(3);
		self takeweapon(var_46d77ca5);
		self switchtoweapon(w_current);
		wait(2);
	}
}

/*
	Name: function_ec916448
	Namespace: hazard
	Checksum: 0x3DEB6841
	Offset: 0x2620
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_ec916448(var_4380761c)
{
	self endon(#"death");
	w_current = self getcurrentweapon();
	var_46d77ca5 = getweapon(#"hash_dc178a25bd3f753");
	while(isdefined(var_4380761c) && self function_cc876e01(var_4380761c))
	{
		wait(0.1);
	}
	self notify(#"hash_77bc187f88f8dd90");
	self takeweapon(var_46d77ca5);
	self switchtoweapon(w_current);
	self enableweaponcycling();
}

/*
	Name: function_34e51510
	Namespace: hazard
	Checksum: 0x80A87C85
	Offset: 0x2718
	Size: 0xEC
	Parameters: 2
	Flags: Linked
*/
function function_34e51510(n_damage_frac, e_ent)
{
	if(!isdefined(e_ent) || scene::is_igc_active())
	{
		self.var_fa3bf1f = undefined;
		self clientfield::set("burn", 0);
		return;
	}
	if(!is_true(self.var_fa3bf1f) && self istouching(e_ent))
	{
		self clientfield::set("burn", 1);
	}
	else
	{
		self.var_fa3bf1f = undefined;
		self clientfield::set("burn", 0);
	}
}

/*
	Name: function_d9a95517
	Namespace: hazard
	Checksum: 0x487C81D3
	Offset: 0x2810
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_d9a95517()
{
	self endon(#"death");
	self clientfield::set_to_player("player_cam_bubbles", 1);
	wait(4);
	self clientfield::set_to_player("player_cam_bubbles", 0);
}

/*
	Name: function_4a55b624
	Namespace: hazard
	Checksum: 0xFA659FCA
	Offset: 0x2880
	Size: 0x1F2
	Parameters: 2
	Flags: Linked
*/
function function_4a55b624(var_3543da4, e_ent)
{
	if(!isdefined(self.var_92ad1a5c))
	{
		self.var_92ad1a5c = 0;
	}
	if(e_ent <= 0.2)
	{
		if(self.var_92ad1a5c > 0.2)
		{
			self thread function_d9a95517();
		}
	}
	else if(e_ent <= 0.1)
	{
		if(self.var_92ad1a5c > 0.1)
		{
			self thread function_d9a95517();
		}
	}
	var_7b926b32 = array(0.5, 0.3, 0.2, 0.15, 0.1, 0.5);
	foreach(num in var_7b926b32)
	{
		if(e_ent != 0 && e_ent <= num)
		{
			if(self.var_92ad1a5c > num)
			{
				self playsound(#"vox_plyr_uw_gasp");
				if(num < 0.4)
				{
					self thread function_c3bcd54a("vox_plyr_uw_emerge_gasp");
				}
				else
				{
					self thread function_c3bcd54a("vox_plyr_uw_emerge");
				}
				break;
			}
		}
	}
	self.var_92ad1a5c = e_ent;
}

/*
	Name: function_c3bcd54a
	Namespace: hazard
	Checksum: 0x7B7B5F6D
	Offset: 0x2A80
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_c3bcd54a(alias)
{
	self notify(#"hash_715de5af996bbe35");
	self endon(#"hash_715de5af996bbe35", #"death");
	level endon(#"save_restore");
	while(self isplayerunderwater())
	{
		wait(0.1);
	}
	self playsound(alias);
}

/*
	Name: function_a80c4c4f
	Namespace: hazard
	Checksum: 0x7A83B19F
	Offset: 0x2B18
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_a80c4c4f(n_time, var_a64e984c)
{
	if(!isdefined(var_a64e984c))
	{
		var_a64e984c = 1;
	}
	self thread function_54b9a44e("o2", 4, n_time, var_a64e984c);
}

/*
	Name: function_54b9a44e
	Namespace: hazard
	Checksum: 0x102FDAC2
	Offset: 0x2B70
	Size: 0x1D0
	Parameters: 4
	Flags: Linked
*/
function function_54b9a44e(var_c1735d11, var_25dc3e31, n_time, var_a64e984c)
{
	/#
		assert(isdefined(level.hazards[var_c1735d11]), ("" + var_c1735d11) + "");
	#/
	self notify("stop_hazard_dot_" + var_c1735d11);
	self endon("stop_hazard_dot_" + var_c1735d11, #"death");
	self function_e9b38487(var_c1735d11, 0);
	var_9ec8f5ba = 1;
	s_hazard = level.hazards[var_c1735d11];
	n_damage = var_25dc3e31;
	if(isdefined(n_time))
	{
		var_c946aac = self function_a4d2293(var_c1735d11);
		var_bb7cc5e4 = s_hazard.n_max_protection;
		var_8a801a72 = var_a64e984c * var_bb7cc5e4;
		var_235cc8af = var_8a801a72 - var_c946aac;
		if(var_235cc8af > 0)
		{
			n_damage = var_235cc8af / n_time;
		}
	}
	while(true)
	{
		wait(1);
		var_9ec8f5ba = self do_damage(var_c1735d11, n_damage);
		var_6afe1e1a = self function_838a3ba4(var_c1735d11);
		if(n_damage > var_25dc3e31 && var_6afe1e1a >= var_a64e984c)
		{
			n_damage = var_25dc3e31;
		}
	}
}

/*
	Name: function_87eaefa2
	Namespace: hazard
	Checksum: 0x6525976A
	Offset: 0x2D48
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_87eaefa2(var_c1735d11)
{
	self notify("stop_hazard_dot_" + var_c1735d11);
	self function_e9b38487(var_c1735d11, 1);
}

