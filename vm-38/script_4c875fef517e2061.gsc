#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_perks.csc;

#namespace namespace_e1e7cabf;

/*
	Name: function_7ed0d9d9
	Namespace: namespace_e1e7cabf
	Checksum: 0xEA9C0B6C
	Offset: 0x2D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7ed0d9d9()
{
	level notify(1209055122);
}

/*
	Name: function_89f2df9
	Namespace: namespace_e1e7cabf
	Checksum: 0x26FF8758
	Offset: 0x2F8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_31eaab29298885c6", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e1e7cabf
	Checksum: 0x713813A8
	Offset: 0x340
	Size: 0x12C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(getgametypesetting(#"hash_45fa8995b51490e8")))
	{
		return;
	}
	function_7a04ad0d();
	level.var_ba997 = &function_fcfd6064;
	level.var_d5d697f5 = &function_30fe2a1b;
	level.var_1c1febec = [];
	for(i = 0; i < getmaxlocalclients(); i++)
	{
		level.var_1c1febec[i] = 0;
	}
	level.var_5d9a0215 = [];
	ai::add_ai_spawn_function(&function_731d83de);
	scene::function_2e58158b(&function_dd6c1a8b);
	zm_perks::function_f3c80d73("zombie_perk_bottle_death_perception");
}

/*
	Name: function_7a04ad0d
	Namespace: namespace_e1e7cabf
	Checksum: 0xCB68CCDF
	Offset: 0x478
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_7a04ad0d()
{
	zm_perks::register_perk_clientfields(#"hash_1ea1a9cfee998e89", &function_6e0b6101, &function_95ed7b4a);
	zm_perks::register_perk_effects(#"hash_1ea1a9cfee998e89", "deathperception_light");
	zm_perks::register_perk_init_thread(#"hash_1ea1a9cfee998e89", &function_9b484511);
	zm_perks::function_b60f4a9f(#"hash_1ea1a9cfee998e89", #"hash_3135c5c88bb80ce5", "zombie/fx8_perk_altar_symbol_ambient_death_perception", #"hash_7d2a55a87f693582");
}

/*
	Name: function_9b484511
	Namespace: namespace_e1e7cabf
	Checksum: 0x80F724D1
	Offset: 0x568
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_9b484511()
{
}

/*
	Name: function_6e0b6101
	Namespace: namespace_e1e7cabf
	Checksum: 0x7FC436BC
	Offset: 0x578
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function function_6e0b6101()
{
	clientfield::register("scriptmover", "perk_death_perception_item_marked_for_rob", 15000, 1, "int", &function_a759ad17, 0, 0);
	clientfield::register("toplayer", "perk_death_perception_visuals", 15000, 1, "int", &perk_death_perception_visuals, 0, 0);
	clientfield::register("toplayer", "perk_death_perception_visuals_items", 15000, 1, "int", &function_30fe2a1b, 0, 0);
	clientfield::register("toplayer", "perk_death_perception_hud_warning", 15000, 1, "int", &function_3a73a8b0, 0, 0);
	clientfield::register("world", "dark_aether_crystal_check_dynentstate", 15000, 1, "counter", &function_1f15c4b5, 0, 0);
}

/*
	Name: function_95ed7b4a
	Namespace: namespace_e1e7cabf
	Checksum: 0x80F724D1
	Offset: 0x6F0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_95ed7b4a()
{
}

/*
	Name: function_fcfd6064
	Namespace: namespace_e1e7cabf
	Checksum: 0x49D5199C
	Offset: 0x700
	Size: 0x53A
	Parameters: 4
	Flags: Linked
*/
function function_fcfd6064(localclientnum, var_a6762160, var_8040e225, var_bd027dd9)
{
	player = function_27673a7(localclientnum);
	if(isdefined(player) && is_true(level.var_1c1febec[localclientnum]) && !function_65b9eb0f(localclientnum) && player function_6c32d092(localclientnum, #"hash_7082a9127deb8f95"))
	{
		var_8ad7f92f = "rob_sr_item_white_dp";
		if(isdefined(var_a6762160))
		{
			switch(var_a6762160.rarity)
			{
				case "none":
				{
					break;
				}
				case "resource":
				{
					var_8ad7f92f = "rob_sr_item_white_dp";
					break;
				}
				case "uncommon":
				{
					var_8ad7f92f = "rob_sr_item_green_dp";
					break;
				}
				case "rare":
				{
					var_8ad7f92f = "rob_sr_item_blue_dp";
					break;
				}
				case "epic":
				{
					var_8ad7f92f = "rob_sr_item_purple_dp";
					break;
				}
				case "legendary":
				{
					var_8ad7f92f = "rob_sr_item_orange_dp";
					break;
				}
				case "ultra":
				{
					var_8ad7f92f = "rob_sr_item_gold_dp";
					break;
				}
				case "loadout":
				{
					var_8ad7f92f = "rob_sr_item_red_dp";
					break;
				}
			}
			if(var_a6762160.itemtype == #"resource")
			{
				var_8ad7f92f = #"hash_2f523d47697a9ce3";
			}
			if(is_true(var_a6762160.var_47f145b4))
			{
				var_8ad7f92f = #"hash_52f7937d76fafca0";
			}
			if(isdefined(var_a6762160.var_599225da))
			{
				var_8ad7f92f = var_a6762160.var_599225da;
			}
		}
		if(isdefined(var_bd027dd9) && isdefined(var_8040e225) && isdefined(var_8040e225.var_ffc1c0e1))
		{
			if(isdefined(var_8040e225.var_ffc1c0e1[var_bd027dd9]) && var_8040e225.var_ffc1c0e1[var_bd027dd9].servertime > getservertime(localclientnum, 1))
			{
				var_8ad7f92f = #"hash_3d6eb4b9bbc74fbd";
			}
		}
		return var_8ad7f92f;
	}
	var_8ad7f92f = #"hash_312ceb838675b80";
	if(isdefined(var_a6762160))
	{
		switch(var_a6762160.rarity)
		{
			case "none":
			{
				break;
			}
			case "resource":
			{
				var_8ad7f92f = #"hash_312ceb838675b80";
				break;
			}
			case "uncommon":
			{
				var_8ad7f92f = #"hash_70c807782a37573e";
				break;
			}
			case "rare":
			{
				var_8ad7f92f = #"hash_5b08235c0b55a003";
				break;
			}
			case "epic":
			{
				var_8ad7f92f = #"hash_646d58f646eba5ed";
				break;
			}
			case "legendary":
			{
				var_8ad7f92f = #"hash_64261dabb4df88cd";
				break;
			}
			case "ultra":
			{
				var_8ad7f92f = #"hash_7bed6d31a7d8d425";
				break;
			}
			case "loadout":
			{
				var_8ad7f92f = #"hash_3088f081654a720e";
				break;
			}
		}
		if(var_a6762160.itemtype == #"resource")
		{
			var_8ad7f92f = #"hash_2f523d47697a9ce3";
		}
		if(is_true(var_a6762160.var_47f145b4))
		{
			var_8ad7f92f = #"hash_52f7937d76fafca0";
		}
		if(isdefined(var_a6762160.var_599225da))
		{
			var_8ad7f92f = var_a6762160.var_599225da;
		}
	}
	if(isdefined(var_bd027dd9) && isdefined(var_8040e225) && isdefined(var_8040e225.var_ffc1c0e1))
	{
		if(isdefined(var_8040e225.var_ffc1c0e1[var_bd027dd9]) && var_8040e225.var_ffc1c0e1[var_bd027dd9].servertime > getservertime(localclientnum, 1))
		{
			var_8ad7f92f = #"hash_3d6eb4b9bbc74fbd";
		}
	}
	return var_8ad7f92f;
}

/*
	Name: function_a759ad17
	Namespace: namespace_e1e7cabf
	Checksum: 0xB007E33E
	Offset: 0xC48
	Size: 0xFC
	Parameters: 7
	Flags: Linked
*/
function function_a759ad17(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(level.var_5d9a0215))
		{
			level.var_5d9a0215 = [];
		}
		else if(!isarray(level.var_5d9a0215))
		{
			level.var_5d9a0215 = array(level.var_5d9a0215);
		}
		level.var_5d9a0215[level.var_5d9a0215.size] = self;
	}
	else
	{
		arrayremovevalue(level.var_5d9a0215, self);
		self function_5d482e78(#"hash_5826a243f40e004c");
	}
}

/*
	Name: function_3a73a8b0
	Namespace: namespace_e1e7cabf
	Checksum: 0xFEF837FA
	Offset: 0xD50
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function function_3a73a8b0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && !is_true(level.var_dc60105c) && !isigcactive(fieldname))
	{
		self thread function_fff5377e(fieldname);
	}
	else
	{
		self notify(#"hash_45ed6efeef67b773");
	}
}

/*
	Name: function_30fe2a1b
	Namespace: namespace_e1e7cabf
	Checksum: 0x3C9BA397
	Offset: 0xE08
	Size: 0x1A8
	Parameters: 7
	Flags: Linked
*/
function function_30fe2a1b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(function_65b9eb0f(fieldname))
	{
		return;
	}
	if(bwastimejump && !is_true(level.var_dc60105c) && !isigcactive(fieldname))
	{
		self.var_fc689684 = 1;
		arrayremovevalue(level.var_5d9a0215, undefined);
		self thread function_1300c2fe();
	}
	else
	{
		self notify(#"hash_48d1d774df4a8016");
		self.var_fc689684 = undefined;
		foreach(var_98bbded7 in level.var_5d9a0215)
		{
			if(!isentity(var_98bbded7))
			{
				continue;
			}
			var_98bbded7 function_5d482e78(#"hash_5826a243f40e004c");
		}
	}
}

/*
	Name: function_1300c2fe
	Namespace: namespace_e1e7cabf
	Checksum: 0x58C1E9B
	Offset: 0xFB8
	Size: 0x152
	Parameters: 0
	Flags: Linked
*/
function function_1300c2fe()
{
	self endon(#"death", #"hash_48d1d774df4a8016");
	while(true)
	{
		foreach(var_98bbded7 in level.var_5d9a0215)
		{
			if(isdefined(var_98bbded7))
			{
				if(distance2d(self.origin, var_98bbded7.origin) <= 1000)
				{
					if(!var_98bbded7 function_d2503806(#"hash_5826a243f40e004c"))
					{
						var_98bbded7 function_bf9d3071(#"hash_5826a243f40e004c");
					}
					continue;
				}
				var_98bbded7 function_5d482e78(#"hash_5826a243f40e004c");
			}
		}
		waitframe(1);
	}
}

/*
	Name: perk_death_perception_visuals
	Namespace: namespace_e1e7cabf
	Checksum: 0x2FBA4CD1
	Offset: 0x1118
	Size: 0x1A0
	Parameters: 7
	Flags: Linked
*/
function perk_death_perception_visuals(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(function_65b9eb0f(fieldname))
	{
		return;
	}
	if(bwastimejump && !is_true(level.var_dc60105c) && !isigcactive(fieldname))
	{
		level.var_1c1febec[fieldname] = 1;
		self thread function_6c1f79e3(fieldname);
	}
	else
	{
		self notify(#"hash_324f3fd9a0081db0");
		level.var_1c1febec[fieldname] = 0;
		a_ai = function_793a9f3d(fieldname);
		foreach(ai in a_ai)
		{
			if(isdefined(ai))
			{
				ai function_5d482e78(#"hash_30651f363ef055e9");
			}
		}
	}
}

/*
	Name: function_6c1f79e3
	Namespace: namespace_e1e7cabf
	Checksum: 0x95D4EAA5
	Offset: 0x12C0
	Size: 0x15A
	Parameters: 1
	Flags: Linked
*/
function function_6c1f79e3(localclientnum)
{
	self endon(#"death", #"hash_324f3fd9a0081db0");
	while(true)
	{
		a_ai = function_793a9f3d(localclientnum);
		foreach(ai in a_ai)
		{
			if(isdefined(ai))
			{
				if(distance2d(ai.origin, self.origin) <= 850 && !isdefined(ai.var_d59aa7bb))
				{
					ai function_731d83de(localclientnum);
					continue;
				}
				ai function_5d482e78(#"hash_30651f363ef055e9");
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_731d83de
	Namespace: namespace_e1e7cabf
	Checksum: 0xF8275515
	Offset: 0x1428
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_731d83de(localclientnum)
{
	if(level.var_1c1febec[localclientnum] && self.team === #"axis")
	{
		wait(0.1);
		if(isdefined(self))
		{
			self function_bf9d3071(#"hash_30651f363ef055e9");
		}
	}
	else if(isdefined(self))
	{
		self function_5d482e78(#"hash_30651f363ef055e9");
	}
}

/*
	Name: function_fff5377e
	Namespace: namespace_e1e7cabf
	Checksum: 0x2FC45F8E
	Offset: 0x14D0
	Size: 0x28C
	Parameters: 1
	Flags: Linked
*/
function function_fff5377e(localclientnum)
{
	self endon(#"death", #"hash_45ed6efeef67b773");
	while(true)
	{
		if(!is_true(level.var_dc60105c) && !isigcactive(localclientnum))
		{
			a_ai = function_793a9f3d(localclientnum);
			a_ai = arraysortclosest(a_ai, self.origin, undefined, undefined, 200);
			var_8475afc1 = anglestoforward(self.angles);
			foreach(ai in a_ai)
			{
				if(isalive(ai))
				{
					if(vectordot(var_8475afc1, vectornormalize(ai.origin - self.origin)) < 0.35)
					{
						var_f2c7b8b0 = ai.origin;
						if(ai.type === #"vehicle")
						{
							var_f2c7b8b0 = (ai.origin[0], ai.origin[1], self.origin[2]);
						}
						var_5d77125a = 1000 * ((0.25 + (0.016 * a_ai.size)) + 0.015);
						self addawarenessindicator(var_f2c7b8b0, "noncombat_danger", int(var_5d77125a));
					}
					waitframe(1);
				}
			}
		}
		wait(0.25);
	}
}

/*
	Name: function_793a9f3d
	Namespace: namespace_e1e7cabf
	Checksum: 0xE27EAB83
	Offset: 0x1768
	Size: 0xB2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_793a9f3d(localclientnum)
{
	a_ai = getentarraybytype(localclientnum, 15);
	a_vh = getentarraybytype(localclientnum, 12);
	a_ai = arraycombine(a_ai, a_vh, 0, 0);
	if(a_ai.size)
	{
		a_ai = array::filter(a_ai, 0, &function_6a5f77);
	}
	return a_ai;
}

/*
	Name: function_6a5f77
	Namespace: namespace_e1e7cabf
	Checksum: 0xC19A1C73
	Offset: 0x1828
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_6a5f77(val)
{
	return val.team === #"axis";
}

/*
	Name: function_25410869
	Namespace: namespace_e1e7cabf
	Checksum: 0xC5FA64F7
	Offset: 0x1858
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_25410869(localclientnum)
{
	if(self == function_5c10bd79(localclientnum))
	{
		value = self clientfield::get_to_player("perk_death_perception_visuals");
		self perk_death_perception_visuals(localclientnum, undefined, value, undefined, undefined, undefined, undefined);
	}
}

/*
	Name: function_dd6c1a8b
	Namespace: namespace_e1e7cabf
	Checksum: 0xA66584EF
	Offset: 0x18D8
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_dd6c1a8b(localclientnum, b_igc_active)
{
	self function_25410869(b_igc_active);
}

/*
	Name: function_1f15c4b5
	Namespace: namespace_e1e7cabf
	Checksum: 0x95382A1
	Offset: 0x1910
	Size: 0x158
	Parameters: 7
	Flags: Linked
*/
function function_1f15c4b5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_87edbe2f = getdynentarray("dark_aehter_loot_crystal", 1);
	foreach(crystal in var_87edbe2f)
	{
		state = function_ffdbe8c2(crystal);
		if(state === 1)
		{
			if(isarray(level.var_5d9a0215))
			{
				arrayremovevalue(level.var_5d9a0215, crystal);
				crystal function_5d482e78(#"hash_5826a243f40e004c");
			}
		}
	}
}

