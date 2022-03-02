#using script_1c65dbfc2f1c8d8f;
#using script_256b8879317373de;
#using script_2c5daa95f8fec03c;
#using script_47fb62300ac0bd60;
#using script_5f261a5d57de5f7c;
#using script_7e59d7bba853fe4b;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\healthoverlay.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_791d0451;

/*
	Name: function_bc55259f
	Namespace: namespace_791d0451
	Checksum: 0x1B88F0DB
	Offset: 0x1F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bc55259f()
{
	level notify(1083908188);
}

/*
	Name: function_89f2df9
	Namespace: namespace_791d0451
	Checksum: 0xA08E9D17
	Offset: 0x218
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2d064899850813e2", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_791d0451
	Checksum: 0x8D52B9E8
	Offset: 0x270
	Size: 0x4BC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_fcb9f1fb = [];
	callback::on_spawned(&on_player_spawn);
	callback::function_10a4dd0a(&function_10a4dd0a);
	/#
		level.var_c0f77370 = &function_c0f77370;
	#/
	level.var_c723ac75 = [];
	function_e854b81f(#"hash_47d7a8105237c88", #"hash_afdc97f440fbcec", #"hash_afdcc7f440fc205", #"hash_afdcb7f440fc052", #"hash_afdc67f440fb7d3", #"hash_afdc57f440fb620");
	function_e854b81f(#"hash_7f98b3dd3cce95aa", #"hash_504b41f717f8931a", #"hash_504b40f717f89167", #"hash_504b3ff717f88fb4", #"hash_504b3ef717f88e01", #"hash_504b3df717f88c4e");
	function_e854b81f(#"hash_5930cf0eb070e35a", #"hash_520b5db0216b778a", #"hash_520b5cb0216b75d7", #"hash_520b5bb0216b7424", #"hash_520b5ab0216b7271", #"hash_520b59b0216b70be");
	function_e854b81f(#"hash_4110e6372aa77f7e", #"hash_4110e6372aa77f7e", #"hash_4110e6372aa77f7e", #"hash_4110e6372aa77f7e", #"hash_4110e6372aa77f7e", #"hash_4110e6372aa77f7e");
	function_e854b81f(#"hash_210097a75bb6c49a", #"hash_1f95b48e4a49df4a", #"hash_1f95b38e4a49dd97", #"hash_1f95b28e4a49dbe4", #"hash_1f95b18e4a49da31", #"hash_1f95b08e4a49d87e");
	function_e854b81f(#"hash_602a1b6107105f07", #"hash_17ccbaee64daa05b", #"hash_17ccbbee64daa20e", #"hash_17ccbcee64daa3c1", #"hash_17ccbdee64daa574", #"hash_17ccbeee64daa727");
	function_e854b81f(#"hash_51b6cc6dbafb7f31", #"hash_79774556f321d921", #"hash_79774256f321d408", #"hash_79774356f321d5bb", #"hash_79774856f321de3a", #"hash_79774956f321dfed");
	function_e854b81f(#"hash_38c08136902fd553", #"hash_59dbecf72baaa96f", #"hash_59dbedf72baaab22", #"hash_59dbeef72baaacd5", #"hash_59dbe7f72baaa0f0", #"hash_59dbe8f72baaa2a3");
	clientfield::function_a8bbc967("zm_perks_per_controller.count", 1, 4, "int", 0);
	for(i = 1; i <= 9; i++)
	{
		clientfield::function_a8bbc967(("zm_perks_per_controller." + i) + ".itemIndex", 1, 8, "int", 0);
		clientfield::function_a8bbc967(("zm_perks_per_controller." + i) + ".lost", 1, 2, "int", 0);
	}
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_791d0451
	Checksum: 0x80F724D1
	Offset: 0x738
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

/*
	Name: function_e854b81f
	Namespace: namespace_791d0451
	Checksum: 0x7D8044CB
	Offset: 0x748
	Size: 0xF8
	Parameters: 2
	Flags: Linked, Variadic
*/
function function_e854b81f(var_24303d72, ...)
{
	var_50846129 = [];
	if(!isdefined(var_50846129))
	{
		var_50846129 = [];
	}
	else if(!isarray(var_50846129))
	{
		var_50846129 = array(var_50846129);
	}
	var_50846129[var_50846129.size] = var_24303d72;
	for(i = 0; i < vararg.size; i++)
	{
		if(!isdefined(var_50846129))
		{
			var_50846129 = [];
		}
		else if(!isarray(var_50846129))
		{
			var_50846129 = array(var_50846129);
		}
		var_50846129[var_50846129.size] = vararg[i];
	}
	level.var_c723ac75[var_24303d72] = var_50846129;
}

/*
	Name: function_1b16bd84
	Namespace: namespace_791d0451
	Checksum: 0x6BA7A941
	Offset: 0x848
	Size: 0xCA
	Parameters: 2
	Flags: Linked
*/
function function_1b16bd84(var_24303d72, tier)
{
	var_8c590502 = (isdefined(getgametypesetting(#"hash_3c2c78e639bfd3c6")) ? getgametypesetting(#"hash_3c2c78e639bfd3c6") : 0);
	if(var_8c590502 > 0)
	{
		tier = var_8c590502;
	}
	var_50846129 = level.var_c723ac75[var_24303d72];
	if(!isdefined(var_50846129))
	{
		return var_24303d72;
	}
	talent = var_50846129[tier];
	if(!isdefined(talent))
	{
		return var_24303d72;
	}
	return talent;
}

/*
	Name: function_1050b262
	Namespace: namespace_791d0451
	Checksum: 0x5A933C5B
	Offset: 0x920
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_1050b262(talent, func)
{
	if(isdefined(talent) && isdefined(func))
	{
		level.var_fcb9f1fb[talent] = func;
	}
}

/*
	Name: function_56cedda7
	Namespace: namespace_791d0451
	Checksum: 0x47647AFB
	Offset: 0x960
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_56cedda7(perk)
{
	if(!isplayer(self) || !isdefined(self.var_7341f980))
	{
		return false;
	}
	foreach(var_7387d8e1 in self.var_7341f980)
	{
		if(perk == var_7387d8e1)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_12b698fa
	Namespace: namespace_791d0451
	Checksum: 0xD80CE7AC
	Offset: 0xA28
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_12b698fa(statname)
{
	var_8c590502 = (isdefined(getgametypesetting(#"hash_3c2c78e639bfd3c6")) ? getgametypesetting(#"hash_3c2c78e639bfd3c6") : 0);
	if(var_8c590502 > 0)
	{
		return var_8c590502;
	}
	return self stats::function_6d50f14b(#"cacloadouts", #"hash_1b24e5b336f5ae8d", statname);
}

/*
	Name: function_b852953c
	Namespace: namespace_791d0451
	Checksum: 0x94932D0B
	Offset: 0xAD8
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function function_b852953c(var_aac3d74d)
{
	item_index = getitemindexfromref(var_aac3d74d);
	var_438da649 = function_b143666d(item_index, 5);
	var_40e28ba = var_438da649.var_cd070e56;
	if(!isdefined(var_40e28ba) || var_40e28ba == #"")
	{
		return var_aac3d74d;
	}
	tier = self function_12b698fa(var_40e28ba);
	return function_1b16bd84(var_aac3d74d, tier);
}

/*
	Name: function_a0a66726
	Namespace: namespace_791d0451
	Checksum: 0x1184BE22
	Offset: 0xBA8
	Size: 0x182
	Parameters: 0
	Flags: Linked
*/
function function_a0a66726()
{
	if(!isplayer(self))
	{
		return;
	}
	if(!isdefined(self.var_7341f980))
	{
		return;
	}
	var_fc14f601 = [];
	foreach(var_91b99f7 in self.var_7341f980)
	{
		itemindex = 0;
		if(isdefined(var_91b99f7) && function_7a600918(var_91b99f7) && var_91b99f7 != #"")
		{
			itemindex = getitemindexfromref(var_91b99f7);
		}
		if(itemindex > 0)
		{
			if(!isdefined(var_fc14f601))
			{
				var_fc14f601 = [];
			}
			else if(!isarray(var_fc14f601))
			{
				var_fc14f601 = array(var_fc14f601);
			}
			if(!isinarray(var_fc14f601, var_91b99f7))
			{
				var_fc14f601[var_fc14f601.size] = var_91b99f7;
			}
		}
	}
	self.var_7341f980 = var_fc14f601;
}

/*
	Name: function_a173ab53
	Namespace: namespace_791d0451
	Checksum: 0xE0EAB2BA
	Offset: 0xD38
	Size: 0x22C
	Parameters: 0
	Flags: Linked
*/
function function_a173ab53()
{
	if(!isplayer(self))
	{
		return false;
	}
	self function_a0a66726();
	count = 0;
	if(isdefined(self.var_7341f980))
	{
		count = self.var_7341f980.size;
		for(i = 1; i <= 9; i++)
		{
			itemindex = 0;
			var_91b99f7 = self.var_7341f980[i - 1];
			if(isdefined(var_91b99f7))
			{
				itemindex = getitemindexfromref(var_91b99f7);
			}
			clientfield::set_player_uimodel(("zm_perks_per_controller." + i) + ".itemIndex", itemindex);
			var_58257a54 = 0;
			if(isdefined(self.var_1f3077f0))
			{
				foreach(var_9aaeaf22 in self.var_1f3077f0)
				{
					if(var_9aaeaf22 === var_91b99f7)
					{
						var_58257a54 = 1;
						break;
					}
				}
			}
			if(self namespace_e86ffa8::function_33d837e4(5))
			{
				clientfield::set_player_uimodel(("zm_perks_per_controller." + i) + ".lost", 2);
				continue;
			}
			clientfield::set_player_uimodel(("zm_perks_per_controller." + i) + ".lost", var_58257a54);
		}
	}
	clientfield::set_player_uimodel("zm_perks_per_controller.count", count);
}

/*
	Name: function_4c5d2b62
	Namespace: namespace_791d0451
	Checksum: 0x2216EACC
	Offset: 0xF70
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_4c5d2b62()
{
	cost = 2500;
	if(isdefined(self.var_7341f980))
	{
		cost = cost + (self.var_7341f980.size * 500);
	}
	return cost;
}

/*
	Name: function_3fecad82
	Namespace: namespace_791d0451
	Checksum: 0xBA4FA983
	Offset: 0xFB8
	Size: 0x7D8
	Parameters: 2
	Flags: Linked
*/
function function_3fecad82(talent, var_6e2cc6cb)
{
	if(!isdefined(var_6e2cc6cb))
	{
		var_6e2cc6cb = 1;
	}
	if(!isplayer(self) || !isdefined(self.var_7341f980))
	{
		return;
	}
	if(!isdefined(self.var_7341f980))
	{
		self.var_7341f980 = [];
	}
	else if(!isarray(self.var_7341f980))
	{
		self.var_7341f980 = array(self.var_7341f980);
	}
	if(!isinarray(self.var_7341f980, talent))
	{
		self.var_7341f980[self.var_7341f980.size] = talent;
	}
	self function_a173ab53();
	self namespace_b376ff3f::function_9f438f15();
	if(isdefined(level.var_fcb9f1fb) && isdefined(level.var_fcb9f1fb[talent]))
	{
		self [[level.var_fcb9f1fb[talent]]]();
	}
	self notify(#"perk_acquired", {#hash_16c042b8:talent});
	switch(talent)
	{
		case "hash_504b3df717f88c4e":
		case "hash_504b3ef717f88e01":
		case "hash_504b3ff717f88fb4":
		case "hash_504b40f717f89167":
		case "hash_504b41f717f8931a":
		case "hash_7f98b3dd3cce95aa":
		{
			var_6d3b160e = self.var_7341f980[self.var_7341f980.size - 1];
			if(var_6d3b160e != #"hash_7f98b3dd3cce95aa" || var_6d3b160e != #"hash_504b41f717f8931a" || var_6d3b160e != #"hash_504b40f717f89167" || var_6d3b160e != #"hash_504b3ff717f88fb4" || var_6d3b160e != #"hash_504b3ef717f88e01" || var_6d3b160e != #"hash_504b3df717f88c4e")
			{
				self.var_7341f980[self.var_7341f980.size - 1] = self.var_7341f980[0];
				self.var_7341f980[0] = var_6d3b160e;
			}
			if(var_6e2cc6cb)
			{
				self perk_give_bottle_begin(#"hash_7f98b3dd3cce95aa");
			}
			break;
		}
		case "hash_520b59b0216b70be":
		case "hash_520b5ab0216b7271":
		case "hash_520b5bb0216b7424":
		case "hash_520b5cb0216b75d7":
		case "hash_520b5db0216b778a":
		case "hash_5930cf0eb070e35a":
		{
			if(var_6e2cc6cb)
			{
				self perk_give_bottle_begin(#"hash_5930cf0eb070e35a");
			}
			break;
		}
		case "hash_1f95b08e4a49d87e":
		case "hash_1f95b18e4a49da31":
		case "hash_1f95b28e4a49dbe4":
		case "hash_1f95b38e4a49dd97":
		case "hash_1f95b48e4a49df4a":
		case "hash_210097a75bb6c49a":
		{
			if(var_6e2cc6cb)
			{
				self perk_give_bottle_begin(#"hash_210097a75bb6c49a");
			}
			break;
		}
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		{
			if(var_6e2cc6cb)
			{
				self perk_give_bottle_begin(#"hash_4110e6372aa77f7e");
			}
			break;
		}
		case "hash_47d7a8105237c88":
		case "hash_afdc57f440fb620":
		case "hash_afdc67f440fb7d3":
		case "hash_afdc97f440fbcec":
		case "hash_afdcb7f440fc052":
		case "hash_afdcc7f440fc205":
		{
			if(var_6e2cc6cb)
			{
				self perk_give_bottle_begin(#"hash_47d7a8105237c88");
			}
			healthoverlay::function_d2880c8f();
			break;
		}
		case "hash_17ccbaee64daa05b":
		case "hash_17ccbbee64daa20e":
		case "hash_17ccbcee64daa3c1":
		case "hash_17ccbdee64daa574":
		case "hash_17ccbeee64daa727":
		case "hash_602a1b6107105f07":
		{
			if(var_6e2cc6cb)
			{
				self perk_give_bottle_begin(#"hash_602a1b6107105f07");
			}
			break;
		}
		case "hash_51b6cc6dbafb7f31":
		case "hash_79774256f321d408":
		case "hash_79774356f321d5bb":
		case "hash_79774556f321d921":
		case "hash_79774856f321de3a":
		case "hash_79774956f321dfed":
		{
			if(var_6e2cc6cb)
			{
				self perk_give_bottle_begin(#"hash_51b6cc6dbafb7f31");
			}
			break;
		}
		case "hash_38c08136902fd553":
		case "hash_59dbe7f72baaa0f0":
		case "hash_59dbe8f72baaa2a3":
		case "hash_59dbecf72baaa96f":
		case "hash_59dbedf72baaab22":
		case "hash_59dbeef72baaacd5":
		{
			if(var_6e2cc6cb)
			{
				self perk_give_bottle_begin(#"hash_38c08136902fd553");
			}
			break;
		}
	}
	self function_b4083162(talent);
	var_3dab8681 = namespace_e86ffa8::function_cde018a9(talent);
	if(isdefined(level._custom_perks[var_3dab8681]) && isdefined(level._custom_perks[var_3dab8681].player_thread_give))
	{
		self thread [[level._custom_perks[var_3dab8681].player_thread_give]]();
	}
	if(isdefined(level._custom_perks[var_3dab8681]) && isdefined(level._custom_perks[var_3dab8681].clientfield_set))
	{
		self [[level._custom_perks[var_3dab8681].clientfield_set]](1);
	}
}

/*
	Name: function_b4083162
	Namespace: namespace_791d0451
	Checksum: 0x43693EC5
	Offset: 0x1798
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b4083162(talent)
{
	if(isplayer(self))
	{
		var_4f88d102 = {#perk:talent, #hash_75c4407f:zm_utility::get_round_number(), #hash_13f78fc7:zm_utility::function_e3025ca5(), #hash_aa8a99e8:function_f8d53445()};
		self function_678f57c8(#"hash_1c64557e9577551e", var_4f88d102);
	}
}

/*
	Name: perk_give_bottle_begin
	Namespace: namespace_791d0451
	Checksum: 0xE1C390B1
	Offset: 0x1870
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function perk_give_bottle_begin(str_perk)
{
	weapon = function_6dc1382(str_perk);
	self giveweapon(weapon);
	self switchtooffhand(weapon);
	self thread gestures::function_f3e2696f(self, weapon, undefined, 2.5, undefined, undefined, undefined);
}

/*
	Name: function_6dc1382
	Namespace: namespace_791d0451
	Checksum: 0x6DE1CFE9
	Offset: 0x1900
	Size: 0x222
	Parameters: 1
	Flags: Linked
*/
function function_6dc1382(str_perk)
{
	switch(str_perk)
	{
		case "hash_7f98b3dd3cce95aa":
		{
			weapon = getweapon(#"zombie_perk_bottle_revive");
			return weapon;
			break;
		}
		case "hash_5930cf0eb070e35a":
		{
			weapon = getweapon(#"zombie_perk_bottle_sleight");
			return weapon;
			break;
		}
		case "hash_210097a75bb6c49a":
		{
			weapon = getweapon(#"zombie_perk_bottle_deadshot");
			return weapon;
			break;
		}
		case "hash_4110e6372aa77f7e":
		{
			weapon = getweapon(#"zombie_perk_bottle_doubletap");
			return weapon;
			break;
		}
		case "hash_47d7a8105237c88":
		{
			weapon = getweapon(#"zombie_perk_bottle_jugg");
			return weapon;
			break;
		}
		case "hash_602a1b6107105f07":
		{
			weapon = getweapon(#"zombie_perk_bottle_marathon");
			return weapon;
			break;
		}
		case "hash_51b6cc6dbafb7f31":
		{
			weapon = getweapon(#"zombie_perk_bottle_elemental_pop");
			return weapon;
			break;
		}
		case "hash_38c08136902fd553":
		{
			weapon = getweapon(#"zombie_perk_bottle_tombstone");
			return weapon;
			break;
		}
	}
}

/*
	Name: function_4c1d0e25
	Namespace: namespace_791d0451
	Checksum: 0x6850FF5
	Offset: 0x1B30
	Size: 0x2CC
	Parameters: 3
	Flags: Linked
*/
function function_4c1d0e25(perk, var_b2d43592, var_cd9efd85)
{
	if(!isdefined(var_b2d43592))
	{
		var_b2d43592 = 0;
	}
	if(!isdefined(var_cd9efd85))
	{
		var_cd9efd85 = 0;
	}
	if(!isplayer(self) || !isdefined(self.var_7341f980))
	{
		return;
	}
	if(var_b2d43592)
	{
		self.var_1f3077f0 = (isdefined(self.var_1f3077f0) ? self.var_1f3077f0 : []);
		if(!isdefined(self.var_1f3077f0))
		{
			self.var_1f3077f0 = [];
		}
		else if(!isarray(self.var_1f3077f0))
		{
			self.var_1f3077f0 = array(self.var_1f3077f0);
		}
		self.var_1f3077f0[self.var_1f3077f0.size] = perk;
		if(var_cd9efd85)
		{
			self.var_ff5d288f = (isdefined(self.var_ff5d288f) ? self.var_ff5d288f : []);
			if(!isdefined(self.var_ff5d288f))
			{
				self.var_ff5d288f = [];
			}
			else if(!isarray(self.var_ff5d288f))
			{
				self.var_ff5d288f = array(self.var_ff5d288f);
			}
			self.var_ff5d288f[self.var_ff5d288f.size] = perk;
		}
		self function_a173ab53();
	}
	else
	{
		arrayremovevalue(self.var_7341f980, perk);
		self function_a173ab53();
		self namespace_b376ff3f::function_9f438f15();
		var_3dab8681 = namespace_e86ffa8::function_cde018a9(perk);
		if(isdefined(level._custom_perks[var_3dab8681]) && isdefined(level._custom_perks[var_3dab8681].clientfield_set))
		{
			self [[level._custom_perks[var_3dab8681].clientfield_set]](0);
		}
		if(isdefined(level._custom_perks[var_3dab8681]) && isdefined(level._custom_perks[var_3dab8681].player_thread_take))
		{
			self thread [[level._custom_perks[var_3dab8681].player_thread_take]](0, undefined, undefined, -1);
		}
	}
}

/*
	Name: function_4af7e89f
	Namespace: namespace_791d0451
	Checksum: 0xC034BAA
	Offset: 0x1E08
	Size: 0xCA
	Parameters: 0
	Flags: Linked
*/
function function_4af7e89f()
{
	if(!isplayer(self) || !isdefined(self.var_1f3077f0))
	{
		return;
	}
	foreach(perk in self.var_1f3077f0)
	{
		self function_4c1d0e25(perk);
	}
	self.var_1f3077f0 = undefined;
	self.var_ff5d288f = undefined;
}

/*
	Name: on_player_spawn
	Namespace: namespace_791d0451
	Checksum: 0xACB2934C
	Offset: 0x1EE0
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function on_player_spawn()
{
	if(!isdefined(self.var_7341f980))
	{
		self.var_7341f980 = [];
	}
}

/*
	Name: function_10a4dd0a
	Namespace: namespace_791d0451
	Checksum: 0x60A07337
	Offset: 0x1F08
	Size: 0x168
	Parameters: 1
	Flags: Linked
*/
function function_10a4dd0a(params)
{
	item = params.item;
	if(isplayer(self))
	{
		if(isdefined(item.var_a6762160))
		{
			if(item.var_a6762160.itemtype === #"hash_70823406977e7c34")
			{
				if(isdefined(item.var_a6762160.talents))
				{
					foreach(talent in item.var_a6762160.talents)
					{
						if(isdefined(talent.talent))
						{
							talent = self function_b852953c(talent.talent);
							function_3fecad82(talent);
						}
					}
				}
			}
			else
			{
			}
		}
	}
}

/*
	Name: function_c5fb4741
	Namespace: namespace_791d0451
	Checksum: 0xC99D4F3
	Offset: 0x2078
	Size: 0x20A
	Parameters: 1
	Flags: Linked
*/
function function_c5fb4741(var_79291fdb)
{
	if(!isdefined(var_79291fdb))
	{
		var_79291fdb = 0;
	}
	self endon(#"death");
	self endon(#"hash_7d1062382b3d7c69");
	var_3354472e = array("mus_perks_jugganog_jingle", "mus_perks_speed_jingle", "mus_perks_revive_jingle", "mus_perks_stamin_jingle", "mus_perks_deadshot_jingle", "mus_perks_elementalpop_jingle", "mus_perks_tombstone_jingle");
	var_8f2bdcca = self function_381f04ca();
	while(true)
	{
		wait(randomintrange(90, 240));
		if(self ishidden())
		{
			continue;
		}
		if(var_79291fdb)
		{
			var_8f2bdcca = var_3354472e[randomintrange(0, var_3354472e.size)];
		}
		if(!is_true(self.var_c000552f) && isdefined(var_8f2bdcca))
		{
			self.var_c000552f = 1;
			var_dfeb1fd = float(max((isdefined(soundgetplaybacktime(var_8f2bdcca)) ? soundgetplaybacktime(var_8f2bdcca) : 500), 500)) / 1000;
			playsoundatposition(var_8f2bdcca, self.origin + vectorscale((0, 0, 1), 50));
			wait(var_dfeb1fd);
			self.var_c000552f = 0;
		}
	}
}

/*
	Name: function_381f04ca
	Namespace: namespace_791d0451
	Checksum: 0xA599B6DA
	Offset: 0x2290
	Size: 0x11E
	Parameters: 0
	Flags: Linked
*/
function function_381f04ca()
{
	str_alias = undefined;
	if(isdefined(self.targetname))
	{
		switch(self.targetname)
		{
			case "vending_revive":
			{
				str_alias = "mus_perks_revive_jingle";
				break;
			}
			case "vending_sleight":
			{
				str_alias = "mus_perks_speed_jingle";
				break;
			}
			case "vending_marathon":
			{
				str_alias = "mus_perks_stamin_jingle";
				break;
			}
			case "vending_deadshot":
			{
				str_alias = "mus_perks_deadshot_jingle";
				break;
			}
			case "vending_elemental_pop":
			{
				str_alias = "mus_perks_elementalpop_jingle";
				break;
			}
			case "vending_jugg":
			{
				str_alias = "mus_perks_jugganog_jingle";
				break;
			}
			case "vending_tombstone":
			{
				str_alias = "mus_perks_tombstone_jingle";
				break;
			}
		}
	}
	return str_alias;
}

/*
	Name: function_3e9d8a8e
	Namespace: namespace_791d0451
	Checksum: 0x24FAED4F
	Offset: 0x23B8
	Size: 0x476
	Parameters: 1
	Flags: Linked
*/
function function_3e9d8a8e(var_11868f5d)
{
	self endon(#"death");
	if(is_true(self.var_c000552f))
	{
		return;
	}
	str_alias = undefined;
	switch(var_11868f5d)
	{
		case "hash_47d7a8105237c88":
		case "hash_afdc57f440fb620":
		case "hash_afdc67f440fb7d3":
		case "hash_afdc97f440fbcec":
		case "hash_afdcb7f440fc052":
		case "hash_afdcc7f440fc205":
		{
			str_alias = #"mus_perks_jugganog_sting";
			break;
		}
		case "hash_504b3df717f88c4e":
		case "hash_504b3ef717f88e01":
		case "hash_504b3ff717f88fb4":
		case "hash_504b40f717f89167":
		case "hash_504b41f717f8931a":
		case "hash_7f98b3dd3cce95aa":
		{
			str_alias = #"mus_perks_revive_sting";
			break;
		}
		case "hash_520b59b0216b70be":
		case "hash_520b5ab0216b7271":
		case "hash_520b5bb0216b7424":
		case "hash_520b5cb0216b75d7":
		case "hash_520b5db0216b778a":
		case "hash_5930cf0eb070e35a":
		{
			str_alias = #"mus_perks_speed_sting";
			break;
		}
		case "hash_1f95b08e4a49d87e":
		case "hash_1f95b18e4a49da31":
		case "hash_1f95b28e4a49dbe4":
		case "hash_1f95b38e4a49dd97":
		case "hash_1f95b48e4a49df4a":
		case "hash_210097a75bb6c49a":
		{
			str_alias = #"mus_perks_deadshot_sting";
			break;
		}
		case "hash_17ccbaee64daa05b":
		case "hash_17ccbbee64daa20e":
		case "hash_17ccbcee64daa3c1":
		case "hash_17ccbdee64daa574":
		case "hash_17ccbeee64daa727":
		case "hash_602a1b6107105f07":
		{
			str_alias = #"mus_perks_stamin_sting";
			break;
		}
		case "hash_51b6cc6dbafb7f31":
		case "hash_79774256f321d408":
		case "hash_79774356f321d5bb":
		case "hash_79774556f321d921":
		case "hash_79774856f321de3a":
		case "hash_79774956f321dfed":
		{
			str_alias = #"mus_perks_elementalpop_sting";
			break;
		}
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		{
			str_alias = #"mus_perks_doubletap_sting";
			break;
		}
		case "hash_38c08136902fd553":
		case "hash_59dbe7f72baaa0f0":
		case "hash_59dbe8f72baaa2a3":
		case "hash_59dbecf72baaa96f":
		case "hash_59dbedf72baaab22":
		case "hash_59dbeef72baaacd5":
		{
			str_alias = #"mus_perks_tombstone_sting";
			break;
		}
	}
	if(isdefined(str_alias))
	{
		self.var_c000552f = 1;
		playsoundatposition(str_alias, self.origin + vectorscale((0, 0, 1), 50));
		wait(5);
		self.var_c000552f = 0;
	}
}

/*
	Name: function_cc0055e9
	Namespace: namespace_791d0451
	Checksum: 0x901E90EF
	Offset: 0x2838
	Size: 0x4F6
	Parameters: 1
	Flags: Linked
*/
function function_cc0055e9(talent)
{
	if(!isdefined(talent))
	{
		return false;
	}
	switch(talent)
	{
		case "hash_47d7a8105237c88":
		case "hash_afdc57f440fb620":
		case "hash_afdc67f440fb7d3":
		case "hash_afdc97f440fbcec":
		case "hash_afdcb7f440fc052":
		case "hash_afdcc7f440fc205":
		{
			if(!is_true(getgametypesetting(#"hash_350adc73849f66ad")))
			{
				return false;
			}
			break;
		}
		case "hash_504b3df717f88c4e":
		case "hash_504b3ef717f88e01":
		case "hash_504b3ff717f88fb4":
		case "hash_504b40f717f89167":
		case "hash_504b41f717f8931a":
		case "hash_7f98b3dd3cce95aa":
		{
			if(!is_true(getgametypesetting(#"hash_790760c24def02df")))
			{
				return false;
			}
			break;
		}
		case "hash_520b59b0216b70be":
		case "hash_520b5ab0216b7271":
		case "hash_520b5bb0216b7424":
		case "hash_520b5cb0216b75d7":
		case "hash_520b5db0216b778a":
		case "hash_5930cf0eb070e35a":
		{
			if(!is_true(getgametypesetting(#"hash_3ad94f36f9fe01c3")))
			{
				return false;
			}
			break;
		}
		case "hash_1f95b08e4a49d87e":
		case "hash_1f95b18e4a49da31":
		case "hash_1f95b28e4a49dbe4":
		case "hash_1f95b38e4a49dd97":
		case "hash_1f95b48e4a49df4a":
		case "hash_210097a75bb6c49a":
		{
			if(!is_true(getgametypesetting(#"hash_6c0eea959e1beea9")))
			{
				return false;
			}
			break;
		}
		case "hash_17ccbaee64daa05b":
		case "hash_17ccbbee64daa20e":
		case "hash_17ccbcee64daa3c1":
		case "hash_17ccbdee64daa574":
		case "hash_17ccbeee64daa727":
		case "hash_602a1b6107105f07":
		{
			if(!is_true(getgametypesetting(#"hash_1eae2946efd5fc50")))
			{
				return false;
			}
			break;
		}
		case "hash_51b6cc6dbafb7f31":
		case "hash_79774256f321d408":
		case "hash_79774356f321d5bb":
		case "hash_79774556f321d921":
		case "hash_79774856f321de3a":
		case "hash_79774956f321dfed":
		{
			if(!is_true(getgametypesetting(#"hash_4a821fd3ce297dbb")))
			{
				return false;
			}
			break;
		}
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		case "hash_4110e6372aa77f7e":
		{
			return false;
			break;
		}
		case "hash_38c08136902fd553":
		case "hash_59dbe7f72baaa0f0":
		case "hash_59dbe8f72baaa2a3":
		case "hash_59dbecf72baaa96f":
		case "hash_59dbedf72baaab22":
		case "hash_59dbeef72baaacd5":
		{
			if(!is_true(getgametypesetting(#"hash_21f347fcb9fbef2a")))
			{
				return false;
			}
			break;
		}
	}
	return true;
}

/*
	Name: function_c0f77370
	Namespace: namespace_791d0451
	Checksum: 0x7EC53BAE
	Offset: 0x2D38
	Size: 0x15CC
	Parameters: 0
	Flags: None
*/
function function_c0f77370()
{
	/#
		level endon(#"game_ended");
		setdvar(#"hash_24d26fc861b6ec66", "");
		setdvar(#"hash_2a5f4e9d8ec20538", "");
		adddebugcommand(("" + function_9e72a96(#"hash_7f98b3dd3cce95aa")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_5930cf0eb070e35a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_210097a75bb6c49a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_47d7a8105237c88")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_602a1b6107105f07")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_51b6cc6dbafb7f31")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_38c08136902fd553")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_7f98b3dd3cce95aa")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_5930cf0eb070e35a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_210097a75bb6c49a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_47d7a8105237c88")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_602a1b6107105f07")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_51b6cc6dbafb7f31")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_38c08136902fd553")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_504b41f717f8931a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_520b5db0216b778a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1f95b48e4a49df4a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_afdc97f440fbcec")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_17ccbaee64daa05b")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_79774556f321d921")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_59dbecf72baaa96f")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_504b41f717f8931a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_520b5db0216b778a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1f95b48e4a49df4a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_afdc97f440fbcec")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_17ccbaee64daa05b")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_79774556f321d921")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_59dbecf72baaa96f")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_504b40f717f89167")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_520b5cb0216b75d7")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1f95b38e4a49dd97")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_afdcc7f440fc205")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_17ccbbee64daa20e")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_79774256f321d408")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_59dbedf72baaab22")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_504b40f717f89167")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_520b5cb0216b75d7")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1f95b38e4a49dd97")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_afdcc7f440fc205")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_17ccbbee64daa20e")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_79774256f321d408")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_59dbedf72baaab22")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_504b3ff717f88fb4")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_520b5bb0216b7424")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1f95b28e4a49dbe4")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_afdcb7f440fc052")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_17ccbcee64daa3c1")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_79774356f321d5bb")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_59dbeef72baaacd5")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_504b3ff717f88fb4")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_520b5bb0216b7424")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1f95b28e4a49dbe4")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_afdcb7f440fc052")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_17ccbcee64daa3c1")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_79774356f321d5bb")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_59dbeef72baaacd5")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_504b3ef717f88e01")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_520b5ab0216b7271")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1f95b18e4a49da31")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_afdc67f440fb7d3")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_17ccbdee64daa574")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_79774856f321de3a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_59dbe7f72baaa0f0")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_504b3ef717f88e01")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_520b5ab0216b7271")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1f95b18e4a49da31")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_afdc67f440fb7d3")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_17ccbdee64daa574")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_79774856f321de3a")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_59dbe7f72baaa0f0")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_504b3df717f88c4e")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_520b59b0216b70be")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1f95b08e4a49d87e")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_afdc57f440fb620")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_17ccbeee64daa727")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_79774956f321dfed")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_59dbe8f72baaa2a3")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_504b3df717f88c4e")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_520b59b0216b70be")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_1f95b08e4a49d87e")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_afdc57f440fb620")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_17ccbeee64daa727")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_79774956f321dfed")) + "");
		adddebugcommand(("" + function_9e72a96(#"hash_59dbe8f72baaa2a3")) + "");
		function_cd140ee9(#"hash_24d26fc861b6ec66", &function_1d36527d);
		function_cd140ee9(#"hash_2a5f4e9d8ec20538", &function_1d36527d);
	#/
}

/*
	Name: function_1d36527d
	Namespace: namespace_791d0451
	Checksum: 0xB8FC656D
	Offset: 0x4310
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function function_1d36527d(params)
{
	/#
		self notify("");
		self endon("");
		waitframe(1);
		foreach(player in getplayers())
		{
			if(params.value == "")
			{
				continue;
			}
			if(params.name === #"hash_24d26fc861b6ec66")
			{
				player function_3fecad82(hash(params.value), 0);
				continue;
			}
			player function_4c1d0e25(hash(params.value));
		}
		setdvar(#"hash_24d26fc861b6ec66", "");
		setdvar(#"hash_2a5f4e9d8ec20538", "");
	#/
}

