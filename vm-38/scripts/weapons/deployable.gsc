#using scripts\core_common\oob.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace deployable;

/*
	Name: function_3827db29
	Namespace: deployable
	Checksum: 0xAF0F8746
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3827db29()
{
	level notify(-1772009333);
}

/*
	Name: __init__system__
	Namespace: deployable
	Checksum: 0x72CE963
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"deployable", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: deployable
	Checksum: 0x23128B54
	Offset: 0x140
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_spawned(&on_player_spawned);
	level.var_160dcfef = spawnstruct();
	level.var_160dcfef.var_1b8ab31d = [];
	level.var_160dcfef.var_d4ef836e = 0;
	level.var_160dcfef.var_a48608a0 = [];
	if(!isdefined(level.var_1765ad79))
	{
		level.var_1765ad79 = 1;
	}
	/#
		level.var_160dcfef.var_193db709 = [];
		setdvar(#"hash_8d4e58d73e3f876", 0);
	#/
}

/*
	Name: register_deployable
	Namespace: deployable
	Checksum: 0x7FF5B632
	Offset: 0x218
	Size: 0x1C6
	Parameters: 6
	Flags: Linked
*/
function register_deployable(weapon, var_c0064c29, var_94b4fa08, placehintstr, var_a39cb3db, var_fe12c0d9)
{
	if(!isdefined(var_94b4fa08))
	{
		var_94b4fa08 = undefined;
	}
	if(!isdefined(placehintstr))
	{
		placehintstr = undefined;
	}
	if(!isdefined(var_a39cb3db))
	{
		var_a39cb3db = undefined;
	}
	if(!isdefined(var_fe12c0d9))
	{
		var_fe12c0d9 = undefined;
	}
	if(!isdefined(level._deployable_weapons))
	{
		level._deployable_weapons = [];
	}
	if(weapon.name == #"none")
	{
		return;
	}
	/#
		assert(weapon.name != #"none");
	#/
	level._deployable_weapons[weapon.statindex] = spawnstruct();
	level._deployable_weapons[weapon.statindex].var_159652c0 = &function_6654310c;
	level._deployable_weapons[weapon.statindex].var_9f2c21ea = var_c0064c29;
	level._deployable_weapons[weapon.statindex].var_1463c9a8 = var_94b4fa08;
	level._deployable_weapons[weapon.statindex].placehintstr = placehintstr;
	level._deployable_weapons[weapon.statindex].var_a39cb3db = var_a39cb3db;
	level._deployable_weapons[weapon.statindex].var_fe12c0d9 = var_fe12c0d9;
}

/*
	Name: function_209fda28
	Namespace: deployable
	Checksum: 0x55800863
	Offset: 0x3E8
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_209fda28(weapon)
{
	if(!isdefined(level._deployable_weapons))
	{
		level._deployable_weapons = [];
	}
	if(isdefined(level._deployable_weapons[weapon.statindex]) && isdefined(level._deployable_weapons[weapon.statindex].var_159652c0))
	{
		self [[level._deployable_weapons[weapon.statindex].var_159652c0]](weapon);
	}
}

/*
	Name: function_84fa8d39
	Namespace: deployable
	Checksum: 0x9D291DA1
	Offset: 0x478
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_84fa8d39(weapon)
{
	/#
		println("");
	#/
}

/*
	Name: function_cf538621
	Namespace: deployable
	Checksum: 0xA53A6805
	Offset: 0x4B0
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_cf538621(weapon)
{
	/#
		println("");
	#/
	self clientfield::set_to_player("gameplay_allows_deploy", 1);
}

/*
	Name: function_2750bb69
	Namespace: deployable
	Checksum: 0x5EE368D6
	Offset: 0x508
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_2750bb69(weapon)
{
	/#
		println("");
	#/
	self thread battlechatter::function_916b4c72(weapon);
}

/*
	Name: function_d60e5a06
	Namespace: deployable
	Checksum: 0xA8D94EA6
	Offset: 0x558
	Size: 0x148
	Parameters: 2
	Flags: None
*/
function function_d60e5a06(center, radius)
{
	var_5795c216 = spawnstruct();
	var_5795c216.origin = center;
	var_5795c216.radiussqr = radius * radius;
	var_5795c216._id = level.var_160dcfef.var_d4ef836e;
	if(!isdefined(level.var_160dcfef.var_1b8ab31d))
	{
		level.var_160dcfef.var_1b8ab31d = [];
	}
	else if(!isarray(level.var_160dcfef.var_1b8ab31d))
	{
		level.var_160dcfef.var_1b8ab31d = array(level.var_160dcfef.var_1b8ab31d);
	}
	level.var_160dcfef.var_1b8ab31d[level.var_160dcfef.var_1b8ab31d.size] = var_5795c216;
	var_81327e4b = level.var_160dcfef.var_d4ef836e;
	level.var_160dcfef.var_d4ef836e++;
	return var_81327e4b;
}

/*
	Name: function_b20df196
	Namespace: deployable
	Checksum: 0x33A82F9B
	Offset: 0x6A8
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function function_b20df196(var_a4879492)
{
	for(index = 0; index < level.var_160dcfef.var_1b8ab31d.size; index++)
	{
		if(level.var_160dcfef.var_1b8ab31d[index]._id == var_a4879492)
		{
			level.var_160dcfef.var_1b8ab31d = array::remove_index(level.var_160dcfef.var_1b8ab31d, index, 0);
			break;
		}
	}
}

/*
	Name: function_89d64a2c
	Namespace: deployable
	Checksum: 0xD8BBADBC
	Offset: 0x750
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function function_89d64a2c(origin)
{
	foreach(var_5795c216 in level.var_160dcfef.var_1b8ab31d)
	{
		if(distance2dsquared(var_5795c216.origin, origin) < var_5795c216.radiussqr)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_6ec9ee30
	Namespace: deployable
	Checksum: 0xDFC663BC
	Offset: 0x810
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_6ec9ee30(var_a2a6139a, deployable_weapon)
{
	battlechatter::function_cad61ec(deployable_weapon);
	var_a2a6139a.weapon = deployable_weapon;
	var_a2a6139a thread function_670cd4a3();
	var_4d5b521e = self gadgetgetslot(deployable_weapon);
	self function_69b5c53c(var_4d5b521e, 0);
}

/*
	Name: function_81598103
	Namespace: deployable
	Checksum: 0x22B3E778
	Offset: 0x8A8
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_81598103(var_a2a6139a)
{
	var_a2a6139a function_34d37476();
}

/*
	Name: function_416f03e6
	Namespace: deployable
	Checksum: 0x2095683D
	Offset: 0x8D8
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_416f03e6(deployableweapon)
{
	if(!isdefined(self))
	{
		return;
	}
	var_4d5b521e = self gadgetgetslot(deployableweapon);
	if(isdefined(deployableweapon))
	{
		self function_69b5c53c(var_4d5b521e, 0);
	}
	if(isdefined(deployableweapon) && deployableweapon.issupplydropweapon !== 1)
	{
		self setriotshieldfailhint();
	}
	if(isdefined(level.var_cf16ff75))
	{
		self [[level.var_cf16ff75]](deployableweapon);
	}
}

/*
	Name: function_b3d993e9
	Namespace: deployable
	Checksum: 0xA9A66BF9
	Offset: 0x990
	Size: 0x1A6
	Parameters: 2
	Flags: Linked
*/
function function_b3d993e9(deployable_weapon, sethintstring)
{
	if(!isdefined(sethintstring))
	{
		sethintstring = 0;
	}
	player = self;
	if(deployable_weapon.var_e0d42861)
	{
		player function_bf191832(1, (0, 0, 0), (0, 0, 0));
		return 1;
	}
	var_2e7d45cb = player function_27476e09(deployable_weapon, sethintstring);
	player.var_7a3f3edf = function_ab25be55(deployable_weapon, sethintstring) && var_2e7d45cb.isvalid && function_d6ac81c7(deployable_weapon, player, var_2e7d45cb.origin, var_2e7d45cb.angles);
	player setplacementhint(player.var_7a3f3edf);
	player function_bf191832(player.var_7a3f3edf, var_2e7d45cb.origin, var_2e7d45cb.angles);
	player clientfield::set_to_player("gameplay_allows_deploy", player.var_7a3f3edf);
	if(player.var_7a3f3edf)
	{
		self.var_b8878ba9 = var_2e7d45cb.origin;
		self.var_ddc03e10 = var_2e7d45cb.angles;
	}
	else
	{
		self.var_b8878ba9 = undefined;
		self.var_ddc03e10 = undefined;
	}
	return player.var_7a3f3edf;
}

/*
	Name: function_ab25be55
	Namespace: deployable
	Checksum: 0xA0E19B8F
	Offset: 0xB40
	Size: 0x96
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ab25be55(weapon, sethintstring)
{
	if(self isplayerswimming() && !(isdefined(sethintstring.canuseunderwater) ? sethintstring.canuseunderwater : 0))
	{
		self sethintstring(#"hash_37605398dce96965");
		return false;
	}
	if(!self isonground())
	{
		return false;
	}
	return true;
}

/*
	Name: function_831707e8
	Namespace: deployable
	Checksum: 0x9B7AE701
	Offset: 0xBE0
	Size: 0x18E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_831707e8(player, deployable_weapon)
{
	if(!is_true(deployable_weapon.var_dbbd4cec))
	{
		return false;
	}
	if(player depthinwater() > (isdefined(deployable_weapon.var_76127e14) ? deployable_weapon.var_76127e14 : 0))
	{
		return false;
	}
	if(oob::chr_party(player.origin))
	{
		return false;
	}
	if(!player isonground())
	{
		return false;
	}
	if(function_89d64a2c(player.origin))
	{
		return false;
	}
	if(function_54267517(player.origin))
	{
		return false;
	}
	traceresults = bullettrace(player.origin + vectorscale((0, 0, 1), 20), player.origin + (vectorscale((0, 0, -1), 20)), 0, player);
	if(isdefined(traceresults[#"entity"]))
	{
		entity = traceresults[#"entity"];
		if(!function_db9eb027(entity))
		{
			return false;
		}
	}
	else
	{
		return false;
	}
	return true;
}

/*
	Name: function_867664f6
	Namespace: deployable
	Checksum: 0x7D1253C
	Offset: 0xD78
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_867664f6(player)
{
	var_8a074131 = worldentnumber();
	groundent = player getgroundent();
	if(!isdefined(groundent))
	{
		return 0;
	}
	return var_8a074131 == groundent getentitynumber();
}

/*
	Name: function_27476e09
	Namespace: deployable
	Checksum: 0xD7C804AB
	Offset: 0xDF0
	Size: 0x2FE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_27476e09(deployable_weapon, sethintstring)
{
	var_ac12dd4b = level._deployable_weapons[sethintstring.statindex].var_1463c9a8;
	if(!isdefined(var_ac12dd4b))
	{
		results = self function_242060b9(sethintstring);
	}
	else
	{
		results = [[var_ac12dd4b]](self);
	}
	/#
		assert(isdefined(results));
	#/
	/#
		assert(isdefined(results.isvalid));
	#/
	/#
		assert(isdefined(results.origin));
	#/
	/#
		assert(isdefined(results.angles));
	#/
	if(!isdefined(results.waterdepth))
	{
		results.waterdepth = 0;
	}
	var_a98c3ea7 = 1;
	if(results.waterdepth > (isdefined(sethintstring.var_76127e14) ? sethintstring.var_76127e14 : 0))
	{
		results.isvalid = 0;
	}
	results.origin = results.waterbottom;
	results.isvalid = results.isvalid && !oob::chr_party(results.origin);
	results.isvalid = results.isvalid && !function_89d64a2c(results.origin);
	results.isvalid = results.isvalid && !function_54267517(results.origin);
	results.isvalid = results.isvalid && function_db9eb027(results.hitent);
	if(level.var_1765ad79 && !isdefined(results.hitent))
	{
		results.isvalid = results.isvalid && function_867664f6(self);
	}
	if(!results.isvalid && function_831707e8(self, sethintstring))
	{
		results.origin = self.origin;
		results.angles = self.angles;
		results.isvalid = 1;
	}
	return results;
}

/*
	Name: function_d6ac81c7
	Namespace: deployable
	Checksum: 0x4E6AB439
	Offset: 0x10F8
	Size: 0x68
	Parameters: 4
	Flags: Linked, Private
*/
function private function_d6ac81c7(deployable_weapon, player, origin, angles)
{
	var_9f2c21ea = level._deployable_weapons[deployable_weapon.statindex].var_9f2c21ea;
	if(!isdefined(var_9f2c21ea))
	{
		return 1;
	}
	return [[var_9f2c21ea]](origin, angles, player);
}

/*
	Name: function_6654310c
	Namespace: deployable
	Checksum: 0x290DCCBE
	Offset: 0x1168
	Size: 0x66
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6654310c(weapon)
{
	player = self;
	if(level.time == player.var_3abd9b54)
	{
		return;
	}
	player.var_3abd9b54 = level.time;
	var_7a3f3edf = player function_b3d993e9(weapon);
}

/*
	Name: function_f8fe102f
	Namespace: deployable
	Checksum: 0xA560BE3
	Offset: 0x11D8
	Size: 0xC
	Parameters: 0
	Flags: None
*/
function function_f8fe102f()
{
	return isdefined(self.var_b8878ba9);
}

/*
	Name: function_dd266e08
	Namespace: deployable
	Checksum: 0xF5C3EA4A
	Offset: 0x11F0
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function function_dd266e08(owner)
{
	if(isdefined(owner) && isdefined(owner.var_b8878ba9))
	{
		self.origin = owner.var_b8878ba9;
	}
	if(isdefined(owner) && isdefined(owner.var_ddc03e10))
	{
		self.angles = owner.var_ddc03e10;
	}
}

/*
	Name: on_player_spawned
	Namespace: deployable
	Checksum: 0x65333180
	Offset: 0x1258
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self.var_3abd9b54 = 0;
	self clientfield::set_to_player("gameplay_allows_deploy", 1);
	self callback::on_weapon_change(&on_weapon_change);
}

/*
	Name: function_aab01e08
	Namespace: deployable
	Checksum: 0x5D701C88
	Offset: 0x12B0
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_aab01e08()
{
	weapon = undefined;
	if(self isusingoffhand())
	{
		weapon = self getcurrentoffhand();
	}
	else
	{
		weapon = self getcurrentweapon();
	}
	if(!weapon.deployable || weapon.var_e0d42861)
	{
		return undefined;
	}
	return weapon;
}

/*
	Name: function_f0adf9c
	Namespace: deployable
	Checksum: 0xDCB584FD
	Offset: 0x1338
	Size: 0x1AE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f0adf9c()
{
	self notify("3fe9db6e886fbc87");
	self endon("3fe9db6e886fbc87");
	player = self;
	player endon(#"death", #"disconnect");
	deployable_weapon = player function_aab01e08();
	if(!isdefined(deployable_weapon))
	{
		if(is_true(player.var_c702a701))
		{
			player.var_c702a701 = undefined;
			player thread function_765a2e96();
		}
		return;
	}
	while(true)
	{
		waitframe(1);
		var_7a3f3edf = player function_b3d993e9(deployable_weapon);
		if(var_7a3f3edf)
		{
			if(isdefined(level._deployable_weapons[deployable_weapon.statindex].placehintstr))
			{
				player sethintstring(level._deployable_weapons[deployable_weapon.statindex].placehintstr);
				player.var_c702a701 = 1;
			}
		}
		else if(isdefined(level._deployable_weapons[deployable_weapon.statindex].var_a39cb3db))
		{
			player sethintstring(level._deployable_weapons[deployable_weapon.statindex].var_a39cb3db);
			player.var_c702a701 = 1;
		}
	}
}

/*
	Name: function_765a2e96
	Namespace: deployable
	Checksum: 0x780AA20
	Offset: 0x14F0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_765a2e96()
{
	self endon(#"death", #"disconnect");
	wait(1.5);
	self sethintstring("");
}

/*
	Name: function_db9eb027
	Namespace: deployable
	Checksum: 0x7A6CCBC6
	Offset: 0x1548
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function function_db9eb027(entity)
{
	if(!isdefined(entity))
	{
		return true;
	}
	if(isvehicle(entity) || isai(entity) || entity ismovingplatform())
	{
		return false;
	}
	if(isdefined(entity.weapon) || isdefined(entity.killstreakid))
	{
		return false;
	}
	return true;
}

/*
	Name: function_54d27855
	Namespace: deployable
	Checksum: 0xCB1E789F
	Offset: 0x15E0
	Size: 0x9A2
	Parameters: 5
	Flags: None
*/
function function_54d27855(client_pos, client_angles, var_36baa3f1, previs_weapon, ignore_entity)
{
	results = spawnstruct();
	var_5130f5dd = 0;
	var_caa96e8a = 0;
	var_a7bfb = 0;
	var_e76d3149 = 0;
	var_68e91c5c = 0;
	var_ae7d780d = 0;
	var_f94d59f8 = 2;
	var_5adff8ce = (0, 0, 0);
	var_4c59d56 = (0, 0, 0);
	forward = anglestoforward(client_angles);
	var_6c16750a = previs_weapon.var_f7e67f28;
	if(previs_weapon.var_9111ccc0 && previs_weapon.var_5ac2e7a4 > previs_weapon.var_f7e67f28)
	{
		var_6c16750a = previs_weapon.var_5ac2e7a4;
	}
	trace_distance = var_6c16750a / abs(cos(client_angles[0]));
	forward_vector = vectorscale(forward, trace_distance);
	trace_start = var_36baa3f1;
	trace_result = bullettrace(trace_start, trace_start + forward_vector, 0, ignore_entity);
	hit_location = trace_start + forward_vector;
	var_db3ce012 = (0, 0, 1);
	hit_distance = 10;
	var_def28dc4 = previs_weapon.var_9111ccc0;
	hitent = undefined;
	var_d22ba639 = 0;
	if(trace_result[#"fraction"] < 1)
	{
		hit_location = trace_result[#"position"];
		var_db3ce012 = trace_result[#"normal"];
		var_6165e0de = var_db3ce012[2] < 0.7;
		hit_distance = trace_result[#"fraction"] * trace_distance;
		if(distance2dsquared(client_pos, hit_location) < sqr(previs_weapon.var_f7e67f28))
		{
			var_caa96e8a = 1;
		}
		height_offset = hit_location[2] - client_pos[2];
		if(var_def28dc4 && var_6165e0de)
		{
			if(height_offset <= previs_weapon.var_ab300840 && height_offset >= previs_weapon.var_849af6b4)
			{
				var_a7bfb = 1;
			}
			var_e76d3149 = 1;
			wall_dot = vectordot(forward * -1, var_db3ce012);
			if(wall_dot > cos(previs_weapon.var_c4aae0fa))
			{
				var_68e91c5c = 1;
			}
			if(!var_68e91c5c)
			{
				var_d22ba639 = 1;
			}
			hitent = trace_result[#"entity"];
		}
		else
		{
			if(height_offset <= previs_weapon.var_227c90e1 && height_offset >= previs_weapon.var_849af6b4)
			{
				var_a7bfb = 1;
			}
			out_of_range = hit_distance > previs_weapon.var_f7e67f28;
			if(out_of_range)
			{
				var_d22ba639 = 1;
			}
			if(!var_def28dc4 && var_6165e0de)
			{
				hit_location = client_pos + ((forward_vector[0], forward_vector[1], 0) * trace_result[#"fraction"]);
				var_db3ce012 = (0, 0, 1);
				var_ae7d780d = 1;
				var_d22ba639 = 0;
			}
		}
	}
	else
	{
		var_d22ba639 = 1;
	}
	water_depth = 0;
	water_bottom = hit_location;
	if(var_d22ba639)
	{
		forward2d = anglestoforward((0, client_angles[1], 0));
		var_f7e67f28 = previs_weapon.var_f7e67f28;
		var_75e7a61 = client_pos + (0, 0, previs_weapon.var_227c90e1);
		var_1a606e14 = var_75e7a61 + (forward2d * var_f7e67f28);
		var_b6085963 = bullettrace(var_75e7a61, var_1a606e14, 0, ignore_entity);
		if(var_b6085963[#"fraction"] > 0)
		{
			var_f7e67f28 = (previs_weapon.var_f7e67f28 * var_b6085963[#"fraction"]) - var_f94d59f8;
			var_14b67847 = (client_pos + (forward2d * var_f7e67f28)) + (0, 0, previs_weapon.var_227c90e1);
			var_c9851f67 = var_14b67847 - (0, 0, previs_weapon.var_227c90e1 - previs_weapon.var_849af6b4);
			var_4bc118b9 = groundtrace(var_14b67847, var_c9851f67, 0, ignore_entity);
			hitent = var_4bc118b9[#"entity"];
			if(var_4bc118b9[#"fraction"] > 0.01 && var_4bc118b9[#"fraction"] < 1 && var_4bc118b9[#"normal"][2] > 0.9)
			{
				hit_location = var_4bc118b9[#"position"];
				var_db3ce012 = var_4bc118b9[#"normal"];
				hit_distance = var_4bc118b9[#"fraction"] * var_f7e67f28;
				var_caa96e8a = 1;
				var_a7bfb = 1;
				if(isdefined(var_4bc118b9[#"waterdepth"]))
				{
					water_depth = var_4bc118b9[#"waterdepth"];
					water_bottom = var_4bc118b9[#"waterbottom"];
				}
			}
		}
	}
	if(isdefined(hit_location))
	{
		var_5adff8ce = hit_location;
		if(var_db3ce012[2] < 0.7)
		{
			var_89135834 = angleclamp180(vectortoangles(var_db3ce012)[0] + 90);
			var_503578d3 = vectortoangles(var_db3ce012)[1];
			var_e8a49b1 = 0;
		}
		else
		{
			hit_angles = vectortoangles(var_db3ce012);
			var_503578d3 = client_angles[1];
			pitch = angleclamp180(hit_angles[0] + 90);
			var_18f32ba4 = absangleclamp360(hit_angles[1] - client_angles[1]);
			var_aba68694 = cos(var_18f32ba4);
			var_c59a47b6 = sin(var_18f32ba4) * -1;
			var_89135834 = pitch * var_aba68694;
			var_e8a49b1 = pitch * var_c59a47b6;
		}
		var_4c59d56 = (var_89135834, var_503578d3, var_e8a49b1);
	}
	var_5130f5dd = var_caa96e8a && var_a7bfb && (!var_e76d3149 || var_68e91c5c) && !var_ae7d780d;
	if(var_5130f5dd && !is_true(previs_weapon.var_33d50507))
	{
		var_e3c2e9c6 = var_5adff8ce + ((0, 0, 1) * 30);
		var_cc9ea9b = physicstrace(var_36baa3f1, var_e3c2e9c6, vectorscale((-1, -1, -1), 16), vectorscale((1, 1, 1), 16), ignore_entity);
		var_5130f5dd = var_cc9ea9b[#"fraction"] == 1;
	}
	results.isvalid = var_5130f5dd;
	results.origin = var_5adff8ce;
	results.angles = var_4c59d56;
	results.hitent = hitent;
	results.waterdepth = water_depth;
	results.waterbottom = water_bottom;
	return results;
}

/*
	Name: on_weapon_change
	Namespace: deployable
	Checksum: 0x4FCA9E37
	Offset: 0x1F90
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_weapon_change(params)
{
	self setplacementhint(1);
	self clientfield::set_to_player("gameplay_allows_deploy", 1);
	self thread function_f0adf9c();
}

/*
	Name: function_670cd4a3
	Namespace: deployable
	Checksum: 0xF56DDB53
	Offset: 0x1FF8
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function function_670cd4a3()
{
	self endon(#"death");
	self.var_19fde5b7 = [];
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"grenade_stuck");
		if(isdefined(waitresult.projectile))
		{
			array::add(self.var_19fde5b7, waitresult.projectile);
		}
	}
}

/*
	Name: function_34d37476
	Namespace: deployable
	Checksum: 0xDB915EED
	Offset: 0x2080
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_34d37476()
{
	if(!isdefined(self.var_19fde5b7))
	{
		return;
	}
	foreach(var_221be278 in self.var_19fde5b7)
	{
		if(!isdefined(var_221be278))
		{
			continue;
		}
		var_221be278 dodamage(500, self.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
	}
}

