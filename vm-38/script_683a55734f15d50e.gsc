#using script_2474a362752098d2;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_5549681e1669c11a;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_41f5b853;

/*
	Name: function_af3c379b
	Namespace: namespace_41f5b853
	Checksum: 0x2B4B158F
	Offset: 0x650
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_af3c379b()
{
	level notify(-82461213);
}

/*
	Name: init
	Namespace: namespace_41f5b853
	Checksum: 0xECF00D2A
	Offset: 0x670
	Size: 0x4E4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "world_loot_type", 1, 8, "int");
	level.doa.var_f69d6693 = [];
	level.doa.var_2f6aa12d = [];
	function_5fd93de5("treasure chest", 1, "zombietron_treasure_chest_01", undefined, &function_650efe1c, 0);
	function_5fd93de5("golden treasure chest", 2, "zombietron_treasure_chest_02", undefined, &function_650efe1c, 0);
	function_5fd93de5("stone chest", 3, "zombietron_treasure_chest_03", undefined, &function_650efe1c, 0);
	function_5fd93de5("bronze weapon chest", 4, "zombietron_treasure_chest_small_01", undefined, &function_650efe1c, 0);
	function_5fd93de5("golden treasure chest XL", 5, "zombietron_treasure_chest_02_xl", undefined, &function_650efe1c, 1);
	function_5fd93de5("loot_basket", 6, "zombietron_loot_basket", &function_92a92219, &function_650efe1c, 0);
	function_5fd93de5("loot_crate", 12, "zombietron_loot_crate", &function_b3f8d2d5, &function_650efe1c, 0);
	function_5fd93de5("pirate chest", 5, "zombietron_pirate_chest", undefined, &function_650efe1c, 1, 0);
	function_5fd93de5("surprisebox1", 8, "zombietron_gift_box_stripe", undefined, &function_650efe1c, 1, 0, 5);
	function_5fd93de5("roforb", 9, "p7_zm_gen_apoth_corpt_engine_light_ball", undefined, &function_650efe1c, 1, 0, 6, -1);
	function_5fd93de5("trinket_box", 10, "zombietron_trinket_box", undefined, &function_650efe1c, 0, 0, 7);
	function_5fd93de5("arcade_machine1", 11, "zombietron_arcademachine", undefined, &function_7df596c3, 0, 0, 9);
	level.doa.var_b1f49ea1 = [];
	level.doa.var_4a9603d0 = [];
	function_f9bfcf6f(1, 400);
	function_f9bfcf6f(6, 20);
	function_f9bfcf6f(24, 15);
	function_f9bfcf6f(17, 15);
	function_f9bfcf6f(18, 15);
	function_f9bfcf6f(19, 15);
	function_f9bfcf6f(13, 15);
	function_f9bfcf6f(10, 15);
	function_f9bfcf6f(42, 10);
	function_f9bfcf6f(20, 10);
	function_f9bfcf6f(15, 5);
	function_f9bfcf6f(22, 5);
	function_f9bfcf6f(45, 5);
	function_f9bfcf6f(28, 5);
	function_f9bfcf6f(29, 5);
	function_f9bfcf6f(9, 4);
	function_f9bfcf6f(8, 3);
	function_f9bfcf6f(14, 1);
	function_f9bfcf6f(16, 1);
}

/*
	Name: function_f9bfcf6f
	Namespace: namespace_41f5b853
	Checksum: 0xB0CB7B58
	Offset: 0xB60
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_f9bfcf6f(type, weight)
{
	level.doa.var_b1f49ea1[type] = type;
	level.doa.var_4a9603d0[type] = weight;
}

/*
	Name: function_3af37a2
	Namespace: namespace_41f5b853
	Checksum: 0xFF68A167
	Offset: 0xBB0
	Size: 0x186
	Parameters: 2
	Flags: Linked
*/
function function_3af37a2(array, weights)
{
	/#
		assert(array.size == weights.size);
	#/
	if(array.size > 0)
	{
		var_766a145f = 0;
		keys = getarraykeys(array);
		foreach(key in keys)
		{
			var_766a145f = var_766a145f + weights[key];
		}
		var_ca23d24f = randomfloatrange(0, var_766a145f);
		var_da00fb33 = keys[0];
		for(i = 0; i < keys.size && var_ca23d24f >= 0; i++)
		{
			var_da00fb33 = keys[i];
			var_ca23d24f = var_ca23d24f - weights[var_da00fb33];
		}
		return array[var_da00fb33];
	}
	/#
		assert(0);
	#/
	return 0;
}

/*
	Name: spawnlootitem
	Namespace: namespace_41f5b853
	Checksum: 0xB4B8622E
	Offset: 0xD40
	Size: 0x2E0
	Parameters: 5
	Flags: Linked
*/
function spawnlootitem(origin, angles, var_1360e692, radius, context)
{
	if(var_1360e692 === #"fate")
	{
		if(context != 2)
		{
			return;
		}
		fate = doa_fate::function_1324dc3b();
		if(!isdefined(fate))
		{
			return;
		}
		def = {#hash_d6118311:4, #name:#"fate", #locked:0, #data:fate, #type:7, #modelname:fate.model};
	}
	else
	{
		def = function_9acb7d7a(var_1360e692);
	}
	/#
		assert(isdefined(def), "");
	#/
	var_a1f88ae1 = namespace_ec06fe4a::function_e22ae9b3(origin, def.modelname);
	if(!isdefined(var_a1f88ae1))
	{
		return;
	}
	var_a1f88ae1 setmodel(def.modelname);
	var_a1f88ae1.angles = angles;
	var_a1f88ae1 solid();
	var_a1f88ae1.targetname = namespace_ec06fe4a::function_3390402b();
	var_a1f88ae1.script_noteworthy = "world_loot";
	var_a1f88ae1 disconnectpaths();
	var_a1f88ae1.var_d6118311 = def.var_d6118311;
	var_a1f88ae1.loottype = def.type;
	var_a1f88ae1.data = def.data;
	var_a1f88ae1.locked = def.locked;
	var_a1f88ae1.var_8cbdb71 = def.name;
	var_a1f88ae1.radius = radius;
	var_a1f88ae1.context = context;
	var_a1f88ae1.var_cbff4088 = def.var_cbff4088;
	namespace_1e25ad94::debugmsg((("Spawning Loot (" + def.modelname) + ") at ") + origin);
	level.doa.var_b8ef1466[level.doa.var_b8ef1466.size] = var_a1f88ae1;
	if(isdefined(def.var_e254c3ed))
	{
		var_a1f88ae1 [[def.var_e254c3ed]](def);
	}
	return var_a1f88ae1;
}

/*
	Name: function_9acb7d7a
	Namespace: namespace_41f5b853
	Checksum: 0x6AEA26FD
	Offset: 0x1028
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_9acb7d7a(name)
{
	foreach(item in level.doa.var_f69d6693)
	{
		if(item.name === name)
		{
			return item;
		}
	}
	return level.doa.var_2f6aa12d[randomint(level.doa.var_2f6aa12d.size)];
}

/*
	Name: function_dcd8be88
	Namespace: namespace_41f5b853
	Checksum: 0xAB1BA9DD
	Offset: 0x1108
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_dcd8be88(type)
{
	foreach(item in level.doa.var_f69d6693)
	{
		if(item.type == type)
		{
			return item.var_ecdc444;
		}
	}
}

/*
	Name: function_dca53316
	Namespace: namespace_41f5b853
	Checksum: 0xAC8BEFF
	Offset: 0x11B8
	Size: 0xF2
	Parameters: 1
	Flags: None
*/
function function_dca53316(name)
{
	if(isdefined(name))
	{
		foreach(item in level.doa.var_f69d6693)
		{
			if(item.name === name)
			{
				return item.modelname;
			}
		}
	}
	item = level.doa.var_f69d6693[randomint(level.doa.var_f69d6693.size)];
	return item.modelname;
}

/*
	Name: function_2732d95
	Namespace: namespace_41f5b853
	Checksum: 0xFE73C86D
	Offset: 0x12B8
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_2732d95(name)
{
	foreach(item in level.doa.var_f69d6693)
	{
		if(item.name === name)
		{
			return item.type;
		}
	}
}

/*
	Name: function_aeb57dc6
	Namespace: namespace_41f5b853
	Checksum: 0x9BE1E7B2
	Offset: 0x1368
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_aeb57dc6(name)
{
	foreach(item in level.doa.var_f69d6693)
	{
		if(item.modelname === name)
		{
			return item.type;
		}
	}
}

/*
	Name: function_dea1324e
	Namespace: namespace_41f5b853
	Checksum: 0xA70CB5
	Offset: 0x1418
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_dea1324e(type)
{
	foreach(item in level.doa.var_f69d6693)
	{
		if(item.type === type)
		{
			return item.locked;
		}
	}
}

/*
	Name: function_5fd93de5
	Namespace: namespace_41f5b853
	Checksum: 0x37799E4F
	Offset: 0x14C8
	Size: 0x164
	Parameters: 9
	Flags: Linked
*/
function function_5fd93de5(name, type, modelname, var_e254c3ed, var_ecdc444, locked, var_641be55e, var_5653e2ee, var_950bcf12)
{
	if(!isdefined(locked))
	{
		locked = 0;
	}
	if(!isdefined(var_641be55e))
	{
		var_641be55e = 1;
	}
	if(!isdefined(var_5653e2ee))
	{
		var_5653e2ee = 3;
	}
	if(!isdefined(var_950bcf12))
	{
		var_950bcf12 = 1;
	}
	var_6201c191 = spawnstruct();
	var_6201c191.name = name;
	var_6201c191.type = type;
	var_6201c191.locked = locked;
	var_6201c191.modelname = modelname;
	var_6201c191.var_e254c3ed = var_e254c3ed;
	var_6201c191.var_ecdc444 = var_ecdc444;
	var_6201c191.var_d6118311 = var_5653e2ee;
	var_6201c191.var_cbff4088 = var_950bcf12;
	level.doa.var_f69d6693[level.doa.var_f69d6693.size] = var_6201c191;
	if(var_641be55e)
	{
		level.doa.var_2f6aa12d[level.doa.var_2f6aa12d.size] = var_6201c191;
	}
}

/*
	Name: function_4d27013d
	Namespace: namespace_41f5b853
	Checksum: 0x2AF5FD38
	Offset: 0x1638
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function function_4d27013d(item)
{
	namespace_1e25ad94::debugmsg("Loot Opened");
	var_2f0b512f = function_dcd8be88(item.loottype);
	/#
		assert(isdefined(var_2f0b512f), "");
	#/
	level thread [[var_2f0b512f]](item);
}

/*
	Name: function_7df596c3
	Namespace: namespace_41f5b853
	Checksum: 0x792CD100
	Offset: 0x16B8
	Size: 0x262
	Parameters: 1
	Flags: Linked
*/
function function_7df596c3(item)
{
	switch(item.loottype)
	{
		case 11:
		{
			rooms = array("slideways", "slideways2", "slideways3");
			room = namespace_5a917022::function_c8892b0f(rooms[randomint(rooms.size)]);
			var_4200bfbf = [];
			var_4200bfbf[0] = {#angles:item.angles + vectorscale((0, 1, 0), 270), #origin:item.origin};
			var_4200bfbf[1] = {#angles:var_4200bfbf[0].angles, #origin:var_4200bfbf[0].origin + vectorscale((1, 0, 0), 30)};
			var_4200bfbf[2] = {#angles:var_4200bfbf[0].angles, #origin:var_4200bfbf[0].origin + (vectorscale((-1, 0, 0), 30))};
			var_4200bfbf[3] = {#angles:var_4200bfbf[0].angles, #origin:var_4200bfbf[0].origin + vectorscale((0, 1, 0), 30)};
			level thread namespace_5a917022::function_a9f78bf(var_4200bfbf, room);
			level waittill(#"hash_1b322de3d2e3e781");
			break;
		}
		default:
		{
			/#
				assert(0);
			#/
			break;
		}
	}
}

/*
	Name: function_650efe1c
	Namespace: namespace_41f5b853
	Checksum: 0x608C231
	Offset: 0x1928
	Size: 0x224
	Parameters: 1
	Flags: Linked
*/
function function_650efe1c(item)
{
	switch(item.loottype)
	{
		case 1:
		{
			namespace_1e25ad94::debugmsg("Loot Opened - Large Bronze");
			break;
		}
		case 2:
		{
			namespace_1e25ad94::debugmsg("Loot Opened - Large Golden");
			break;
		}
		case 3:
		{
			namespace_1e25ad94::debugmsg("Loot Opened - Large Stone");
			break;
		}
		case 4:
		{
			namespace_1e25ad94::debugmsg("Loot Opened - Medium Bronze");
			break;
		}
		case 5:
		{
			namespace_1e25ad94::debugmsg("Loot Opened - XL Golden");
			break;
		}
		case 6:
		{
			namespace_1e25ad94::debugmsg("Loot Opened - Basket");
			break;
		}
		case 12:
		{
			namespace_1e25ad94::debugmsg("Loot Opened - Crate");
			break;
		}
		case 8:
		{
			namespace_1e25ad94::debugmsg("Loot Opened - Gift Box");
			break;
		}
		case 9:
		{
			namespace_1e25ad94::debugmsg("Loot Opened - ROF ORB");
			break;
		}
		case 10:
		{
			namespace_1e25ad94::debugmsg("Loot Opened - TRINKET BOX");
			break;
		}
	}
	level thread function_389aad25(item, item.loottype);
}

/*
	Name: function_389aad25
	Namespace: namespace_41f5b853
	Checksum: 0xD0CDE09C
	Offset: 0x1B58
	Size: 0x6B4
	Parameters: 2
	Flags: Linked
*/
function function_389aad25(item, type)
{
	item endon(#"death");
	item namespace_e32bb68::function_3a59ec34("zmb_box_interact");
	original = item.origin;
	var_3e2d48b2 = "glow_white";
	reward = 1;
	rare = 0;
	qty = 10;
	radius = (isdefined(item.radius) ? item.radius : 128);
	scenedef = #"hash_7a2190c40fdc3bbc";
	switch(type)
	{
		case 1:
		{
			reward = "treasure";
			break;
		}
		case 2:
		{
			var_3e2d48b2 = "glow_yellow";
			var_f9060edc = "player_trail_yellow";
			reward = "treasure_horde";
			scenedef = #"hash_30c46dd666dd7707";
			qty = 16;
			break;
		}
		case 3:
		{
			reward = "items";
			break;
		}
		case 4:
		{
			reward = "weapon_cache";
			break;
		}
		case 5:
		{
			var_3e2d48b2 = "glow_yellow";
			var_f9060edc = "player_trail_yellow";
			reward = "treasure_horde_plus";
			scenedef = #"hash_78fd0527319f0425";
			qty = 64;
			var_2468c36a = "fireworks";
			break;
		}
		case 10:
		{
			var_3e2d48b2 = "glow_yellow";
			var_f9060edc = "player_trail_yellow";
			scenedef = #"hash_7a2190c40fdc3bbc";
			qty = 2;
			roll = randomint(100);
			if(roll > 96)
			{
				reward = "extraLife";
			}
			else
			{
				if(roll > 75)
				{
					reward = "nuke";
				}
				else
				{
					if(roll > 50)
					{
						reward = "boost";
					}
					else
					{
						reward = "chickens";
						qty = 5;
					}
				}
			}
			break;
		}
		case 8:
		{
			var_3e2d48b2 = "glow_yellow";
			var_f9060edc = "player_trail_yellow";
			scenedef = #"hash_7a2190c40fdc3bbc";
			reward = "extraLife";
			qty = 2;
			var_2468c36a = "fireworks";
			break;
		}
		case 6:
		{
			item dodamage(item.health, item.origin);
			return;
		}
		case 12:
		{
			item dodamage(item.health, item.origin);
			return;
		}
		case 9:
		{
			var_3e2d48b2 = "glow_blue";
			var_f9060edc = "player_trail_blue";
			scenedef = #"hash_78fd0527319f0425";
			var_2468c36a = "lightningStrike";
			var_ef88bfeb = 1;
			level.doa.var_2e2d85d4 = 1;
			reward = undefined;
			break;
		}
	}
	item namespace_83eb6304::function_3ecfde67(var_3e2d48b2);
	if(isdefined(var_f9060edc))
	{
		item namespace_83eb6304::function_3ecfde67(var_f9060edc);
	}
	item scene::play(scenedef, item);
	item waittill(#"scenes_done");
	if(isdefined(var_2468c36a))
	{
		item namespace_83eb6304::function_3ecfde67(var_2468c36a);
	}
	item namespace_e32bb68::function_3a59ec34("zmb_chest_explode");
	if(!is_true(var_ef88bfeb))
	{
		item namespace_ec06fe4a::function_8c808737();
		item notsolid();
	}
	item namespace_83eb6304::turnofffx(var_3e2d48b2);
	if(isdefined(var_f9060edc))
	{
		item namespace_83eb6304::turnofffx(var_f9060edc);
	}
	if(isdefined(reward))
	{
		if(isdefined(item.target))
		{
			targets = struct::get_array(item.target, "targetname");
			if(targets.size > 0)
			{
				qty = int(qty / targets.size);
				foreach(target in targets)
				{
					function_d2c582ec(target.origin, qty, radius, reward);
				}
			}
		}
		else
		{
			function_d2c582ec(item.origin, qty, radius, reward);
		}
	}
	item connectpaths();
	wait(1);
	if(!is_true(var_ef88bfeb))
	{
		item delete();
	}
}

/*
	Name: function_d2c582ec
	Namespace: namespace_41f5b853
	Checksum: 0xB936FC1B
	Offset: 0x2218
	Size: 0x65A
	Parameters: 5
	Flags: Linked
*/
function function_d2c582ec(origin, qty, radius, reward, flag)
{
	switch(flag)
	{
		case "treasure_horde_plus":
		{
			doa_pickups::function_d06cbfe8(qty, radius >> 1, reward);
			if(randomint(100) < 20)
			{
				doa_pickups::function_ad7ac41b(qty, 1, 32, 16, 1);
			}
			if(randomint(100) < 10)
			{
				doa_pickups::function_ad7ac41b(qty, 1, 32, 14, 1);
			}
		}
		case "treasure_horde":
		{
			doa_pickups::function_68442ee7(qty, radius, reward, 1);
			doa_pickups::function_d06cbfe8(qty, radius >> 2, reward);
		}
		case "treasure":
		{
			doa_pickups::function_68442ee7(qty, radius, reward);
			break;
		}
		case "extralife":
		{
			doa_pickups::function_ad7ac41b(qty, radius, 32, 16, 1);
			break;
		}
		case "boost":
		{
			doa_pickups::function_ad7ac41b(qty, radius, 32, 9, 1);
			break;
		}
		case "nuke":
		{
			doa_pickups::function_ad7ac41b(qty, radius, 32, 8, 1);
			break;
		}
		case "chickens":
		{
			doa_pickups::function_ad7ac41b(qty, radius, 32, 15, 1);
			break;
		}
		case "items":
		{
			while(radius)
			{
				radius--;
				function_e2b14b6(qty + (randomintrange(-60, 60), randomintrange(-60, 60), 0), (0, 0, 0));
			}
			break;
		}
		case "weapon_cache":
		{
			var_d7d0ebdd = doa_pickups::function_57160cba(6);
			doa_pickups::itemspawn(var_d7d0ebdd, qty + (randomintrange(-60, 60), randomintrange(-60, 60), 0), undefined, undefined, 1);
			doa_pickups::itemspawn(var_d7d0ebdd, qty + (randomintrange(-60, 60), randomintrange(-60, 60), 0), undefined, undefined, 1);
			doa_pickups::itemspawn(var_d7d0ebdd, qty + (randomintrange(-60, 60), randomintrange(-60, 60), 0), undefined, undefined, 1);
			doa_pickups::itemspawn(var_d7d0ebdd, qty + (randomintrange(-60, 60), randomintrange(-60, 60), 0), undefined, undefined, 1);
			doa_pickups::itemspawn(var_d7d0ebdd, qty + (randomintrange(-60, 60), randomintrange(-60, 60), 0), undefined, undefined, 1);
			doa_pickups::itemspawn(var_d7d0ebdd, qty + (randomintrange(-60, 60), randomintrange(-60, 60), 0), undefined, undefined, 1);
			doa_pickups::itemspawn(var_d7d0ebdd, qty + (randomintrange(-60, 60), randomintrange(-60, 60), 0), undefined, undefined, 1);
			doa_pickups::itemspawn(var_d7d0ebdd, qty + (randomintrange(-60, 60), randomintrange(-60, 60), 0), undefined, undefined, 1);
			doa_pickups::itemspawn(var_d7d0ebdd, qty + (randomintrange(-60, 60), randomintrange(-60, 60), 0), undefined, undefined, 1);
			break;
		}
		default:
		{
			doa_pickups::function_ad7ac41b(qty, radius, reward, flag, 1);
			break;
		}
	}
}

/*
	Name: function_92a92219
	Namespace: namespace_41f5b853
	Checksum: 0x378D9D6C
	Offset: 0x2880
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_92a92219(def)
{
	self.takedamage = 1;
	self.health = 575;
	self thread function_8534e7be();
}

/*
	Name: function_b3f8d2d5
	Namespace: namespace_41f5b853
	Checksum: 0x54B3A528
	Offset: 0x28C8
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_b3f8d2d5(def)
{
	function_92a92219(def);
	self.crate = 1;
}

/*
	Name: function_8534e7be
	Namespace: namespace_41f5b853
	Checksum: 0xF4DCADB3
	Offset: 0x2908
	Size: 0xB2
	Parameters: 0
	Flags: Linked
*/
function function_8534e7be()
{
	self endon(#"death");
	while(self.health > 0)
	{
		result = undefined;
		result = self waittill(#"damage");
		if(result.amount > self.health)
		{
			self.health = self.health + result.amount;
			self thread basketexplo(is_true(self.crate));
			return;
		}
	}
}

/*
	Name: function_e2b14b6
	Namespace: namespace_41f5b853
	Checksum: 0xF6062A98
	Offset: 0x29C8
	Size: 0x164
	Parameters: 2
	Flags: Linked
*/
function function_e2b14b6(origin, angles)
{
	type = function_3af37a2(level.doa.var_b1f49ea1, level.doa.var_4a9603d0);
	if(!isdefined(type) || type == 0)
	{
		return;
	}
	while(!isdefined(type) || (type == 42 && !isdefined(level.doa.var_182fb75a)))
	{
		waitframe(1);
		type = function_3af37a2(level.doa.var_b1f49ea1, level.doa.var_4a9603d0);
	}
	def = doa_pickups::function_57160cba(type);
	if(type == 13)
	{
		doa_pickups::function_b8f6a8cd(def, origin, 1, 1, randomfloatrange(0.25, 1.25));
	}
	else
	{
		doa_pickups::itemspawn(def, origin, angles, undefined, 1);
	}
}

/*
	Name: basketexplo
	Namespace: namespace_41f5b853
	Checksum: 0xB8B88F1E
	Offset: 0x2B38
	Size: 0x24C
	Parameters: 1
	Flags: Linked
*/
function basketexplo(var_7ef2dd9c)
{
	if(!isdefined(var_7ef2dd9c))
	{
		var_7ef2dd9c = 0;
	}
	origin = self.origin;
	angles = self.angles;
	self namespace_83eb6304::function_3ecfde67("basketExplo");
	self namespace_e32bb68::function_3a59ec34("zmb_basket_explode");
	if(isdefined(self.owner))
	{
		self.owner.activated = 1;
	}
	wait(0.15);
	if(var_7ef2dd9c)
	{
		function_e2b14b6(origin + (randomintrange(-12, 12), randomintrange(-12, 12), randomint(10)), angles);
		function_e2b14b6(origin + (randomintrange(-12, 12), randomintrange(-12, 12), randomint(10)), angles);
		function_e2b14b6(origin + (randomintrange(-12, 12), randomintrange(-12, 12), randomint(10)), angles);
	}
	else
	{
		function_e2b14b6(origin, angles);
	}
	if(isdefined(self))
	{
		self namespace_ec06fe4a::function_8c808737();
		self connectpaths();
	}
	wait(0.2);
	if(isdefined(self))
	{
		self delete();
	}
}

