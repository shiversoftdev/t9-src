#using script_396f7d71538c9677;
#using script_3f9e0dc8454d98e1;
#using script_4d85e8de54b02198;
#using script_57f7003580bb15e0;
#using script_62caa307a394c18c;
#using script_6809bf766eba194a;
#using script_7bafaa95bb1b427e;
#using script_8988fdbc78d6c53;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\scoreevents.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_68a80213;

/*
	Name: function_89f2df9
	Namespace: namespace_68a80213
	Checksum: 0x8081C51A
	Offset: 0x260
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_512409f8a5de10e4", &init_shared, undefined, undefined, undefined);
}

/*
	Name: init_shared
	Namespace: namespace_68a80213
	Checksum: 0xBCD77888
	Offset: 0x2A8
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	clientfield::register("actor", "" + #"hash_c5d06ae18fde4c0", 1, 1, "int");
	params = function_4d1e7b48("dot_molotov_dog");
	level.var_e6a4f161 = params.var_18d16a6b;
	level.var_5d450296 = params.var_67e2281d;
	level.var_e8a6b3ee = [];
	spawner::add_archetype_spawn_function(#"zombie_dog", &function_4f3cd1f0);
}

/*
	Name: function_4f3cd1f0
	Namespace: namespace_68a80213
	Checksum: 0xFFFE0DEC
	Offset: 0x380
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_4f3cd1f0()
{
	if(self.var_9fde8624 === #"hash_28e36e7b7d5421f")
	{
		self.var_90d0c0ff = "anim_spawn_hellhound";
		self callback::function_d8abfc3d(#"hash_46a032931418eecf", &start_fire);
	}
}

/*
	Name: start_fire
	Namespace: namespace_68a80213
	Checksum: 0x8F59C624
	Offset: 0x3E8
	Size: 0x1EC
	Parameters: 0
	Flags: None
*/
function start_fire()
{
	if(!isdefined(self.exploded) && !is_true(self.var_270befd2))
	{
		self.exploded = 1;
		self clientfield::set("" + #"hash_c5d06ae18fde4c0", 1);
		var_3e7a440 = getscriptbundle("molotov_custom_settings");
		blast_radius = 65;
		attacker = undefined;
		if(isdefined(self.attacker))
		{
			attacker = self.attacker;
		}
		level thread function_59d981cc(self.origin + vectorscale((0, 0, 1), 18), blast_radius, attacker, self);
		function_ccb2e201(self.origin + vectorscale((0, 0, 1), 18), blast_radius);
		if(!isdefined(self.var_338d4a29) || self.var_338d4a29 == 0)
		{
			function_e8ad1d81(self.origin, (0, 0, 1), (0, 0, 1), self.team, var_3e7a440, attacker, self);
		}
		self.var_7a68cd0c = 1;
		self ghost();
		self notsolid();
		if(isalive(self))
		{
			self.allowdeath = 1;
			self kill(undefined, undefined, undefined, undefined, undefined, 1);
		}
	}
}

/*
	Name: function_f4e48434
	Namespace: namespace_68a80213
	Checksum: 0xD5B63154
	Offset: 0x5E0
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_f4e48434(position)
{
	var_c84f4998 = getwaterheight(position) - position[2];
	return var_c84f4998 >= 24;
}

/*
	Name: function_a66ba8cc
	Namespace: namespace_68a80213
	Checksum: 0xD4427BD7
	Offset: 0x630
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_a66ba8cc(var_c84f4998)
{
	return 0 < var_c84f4998 && var_c84f4998 < 24;
}

/*
	Name: function_330c2616
	Namespace: namespace_68a80213
	Checksum: 0x27FD763F
	Offset: 0x660
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_330c2616(position)
{
	return getwaterheight(position) - position[2];
}

/*
	Name: function_7cbeb2f0
	Namespace: namespace_68a80213
	Checksum: 0x1D564BE8
	Offset: 0x698
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_7cbeb2f0(normal)
{
	if(normal[2] < 0.5)
	{
		stepoutdistance = normal * getdvarint(#"hash_72463d6fcf7cb178", 50);
	}
	else
	{
		stepoutdistance = normal * getdvarint(#"hash_1423ebf820f9483f", 12);
	}
	return stepoutdistance;
}

/*
	Name: function_e8ad1d81
	Namespace: namespace_68a80213
	Checksum: 0xEFD87C3E
	Offset: 0x728
	Size: 0x8CC
	Parameters: 7
	Flags: None
*/
function function_e8ad1d81(position, normal, velocity, team, var_4dd46f8a, attacker, exploder)
{
	var_4f9d7296 = position;
	var_493d36f9 = normal;
	var_77261b6 = vectornormalize(velocity);
	var_1f254a06 = vectorscale(var_77261b6, -1);
	var_d6d43109 = 1;
	var_e76400c0 = undefined;
	wallnormal = undefined;
	var_693f108f = undefined;
	var_aecaaa11 = getweapon(#"hash_23dd6039fe2f36c6");
	var_5632b17 = getweapon("molotov_fire_wall");
	var_7bf146f2 = getweapon("molotov_steam");
	if(normal[2] < -0.5)
	{
		var_36c22d1d = position + vectorscale(normal, 2);
		var_8ae62b02 = var_36c22d1d - vectorscale((0, 0, 1), 240);
		var_69d15ad0 = physicstrace(var_36c22d1d, var_8ae62b02, vectorscale((-1, -1, -1), 0.5), vectorscale((1, 1, 1), 0.5), self, 1);
		if(var_69d15ad0[#"fraction"] < 1)
		{
			position = var_69d15ad0[#"position"];
			if(var_69d15ad0[#"fraction"] > 0)
			{
				normal = var_69d15ad0[#"normal"];
			}
			else
			{
				normal = (0, 0, 1);
			}
			var_1b1117c6 = 1.2 * var_69d15ad0[#"fraction"];
			var_1f254a06 = normal;
			if(var_1b1117c6 > 0)
			{
				wait(var_1b1117c6);
			}
		}
		else
		{
			return;
		}
	}
	else if(normal[2] < 0.5)
	{
		var_36c22d1d = position + vectorscale(var_493d36f9, 2);
		var_8ae62b02 = var_36c22d1d - vectorscale((0, 0, 1), 20);
		var_69d15ad0 = physicstrace(var_36c22d1d, var_8ae62b02, vectorscale((-1, -1, -1), 0.5), vectorscale((1, 1, 1), 0.5), self, 1);
		if(var_69d15ad0[#"fraction"] < 1)
		{
			position = var_36c22d1d;
			if(var_69d15ad0[#"fraction"] > 0)
			{
				normal = var_69d15ad0[#"normal"];
			}
			else
			{
				normal = (0, 0, 1);
			}
		}
	}
	if(normal[2] < 0.5)
	{
		wall_normal = normal;
		var_36c22d1d = var_4f9d7296 + vectorscale(var_493d36f9, 8);
		var_8ae62b02 = var_36c22d1d - vectorscale((0, 0, 1), 300);
		var_69d15ad0 = physicstrace(var_36c22d1d, var_8ae62b02, vectorscale((-1, -1, -1), 3), vectorscale((1, 1, 1), 3), self, 1);
		var_693f108f = var_69d15ad0[#"fraction"] * 300;
		var_959a2a8b = 0;
		if(var_693f108f > 10)
		{
			var_e76400c0 = var_4f9d7296;
			wallnormal = var_493d36f9;
			var_d6d43109 = sqrt(1 - var_69d15ad0[#"fraction"]);
			var_959a2a8b = 1;
		}
		if(var_69d15ad0[#"fraction"] < 1)
		{
			position = var_69d15ad0[#"position"];
			if(var_69d15ad0[#"fraction"] > 0)
			{
				normal = var_69d15ad0[#"normal"];
			}
			else
			{
				normal = (0, 0, 1);
			}
		}
		if(var_959a2a8b)
		{
			x = var_4f9d7296[0];
			y = var_4f9d7296[1];
			lowestz = var_69d15ad0[#"position"][2];
			z = var_4f9d7296[2];
			while(z > lowestz)
			{
				newpos = (x, y, z);
				var_c84f4998 = function_330c2616(newpos);
				if(function_a66ba8cc(var_c84f4998) || function_f4e48434(newpos))
				{
					newpos = newpos - (0, 0, var_c84f4998);
					level thread function_42b9fdbe(var_7bf146f2, newpos, (0, 0, 1), int(5), team);
					break;
				}
				level thread function_42b9fdbe(var_5632b17, newpos, wall_normal, int(5), team);
				z = z - randomintrange(20, 30);
			}
			var_bc9ec158 = 0.6 * var_69d15ad0[#"fraction"];
			if(var_bc9ec158 > 0)
			{
				wait(var_bc9ec158);
			}
		}
	}
	startpos = position + function_7cbeb2f0(normal);
	desiredendpos = startpos + vectorscale((0, 0, 1), 60);
	function_1493c734(startpos, 20, (0, 1, 0), 0.6, 200);
	phystrace = physicstrace(startpos, desiredendpos, vectorscale((-1, -1, -1), 4), vectorscale((1, 1, 1), 4), self, 1);
	goalpos = (phystrace[#"fraction"] < 1 ? phystrace[#"position"] : desiredendpos);
	rotation = randomint(360);
	if(normal[2] < 0.1 && !isdefined(var_e76400c0))
	{
		black = vectorscale((1, 1, 1), 0.1);
		trace = hitpos(startpos, (startpos + ((normal * -1) * 70)) + ((0, 0, -1) * 70), black);
		traceposition = trace[#"position"];
		if(trace[#"fraction"] < 0.9)
		{
			var_252a0dc7 = trace[#"normal"];
			spawntimedfx(var_5632b17, traceposition, var_252a0dc7, int(5), team);
		}
	}
	var_1f254a06 = normal;
	level function_8a03d3f3(position, startpos, var_1f254a06, var_d6d43109, rotation, team, var_e76400c0, wallnormal, var_693f108f, var_4dd46f8a, attacker, exploder);
}

/*
	Name: function_523961e2
	Namespace: namespace_68a80213
	Checksum: 0x6D93A5A5
	Offset: 0x1000
	Size: 0x8C
	Parameters: 7
	Flags: None
*/
function function_523961e2(startpos, normal, var_4997e17c, fxindex, fxcount, defaultdistance, rotation)
{
	currentangle = (360 / fxcount) * fxindex;
	var_7ee25402 = rotatepointaroundaxis(var_4997e17c * defaultdistance, normal, currentangle + rotation);
	return startpos + var_7ee25402;
}

/*
	Name: function_31cc6bd9
	Namespace: namespace_68a80213
	Checksum: 0xB4705E5F
	Offset: 0x1098
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_31cc6bd9()
{
	if(!isdefined(level.var_a88ac760))
	{
		return;
	}
	keys = getarraykeys(level.var_a88ac760);
	time = gettime();
	foreach(key in keys)
	{
		if(level.var_a88ac760[key].var_46ee5246 < time)
		{
			level.var_a88ac760[key] = undefined;
		}
	}
}

/*
	Name: function_31f342a2
	Namespace: namespace_68a80213
	Checksum: 0x417877BF
	Offset: 0x1188
	Size: 0xFE
	Parameters: 2
	Flags: None
*/
function function_31f342a2(origin, var_9c7e3678)
{
	if(!isdefined(level.var_a88ac760))
	{
		return false;
	}
	foreach(molotov in level.var_a88ac760)
	{
		if(abs((molotov.origin[2] - origin[2]) > 20))
		{
			continue;
		}
		if(distance2dsquared(molotov.origin, origin) < var_9c7e3678)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_8a03d3f3
	Namespace: namespace_68a80213
	Checksum: 0xABA7160E
	Offset: 0x1290
	Size: 0xE68
	Parameters: 12
	Flags: None
*/
function function_8a03d3f3(impactpos, startpos, normal, multiplier, rotation, team, var_e76400c0, wallnormal, var_693f108f, var_4dd46f8a, attacker, exploder)
{
	defaultdistance = 65 * multiplier;
	defaultdropdistance = getdvarint(#"hash_4a8fc6d7cacea9d5", 90);
	colorarray = [];
	colorarray[colorarray.size] = (0.9, 0.2, 0.2);
	colorarray[colorarray.size] = (0.2, 0.9, 0.2);
	colorarray[colorarray.size] = (0.2, 0.2, 0.9);
	colorarray[colorarray.size] = vectorscale((1, 1, 1), 0.9);
	locations = [];
	locations[#"color"] = [];
	locations[#"loc"] = [];
	locations[#"tracepos"] = [];
	locations[#"distsqrd"] = [];
	locations[#"fxtoplay"] = [];
	locations[#"radius"] = [];
	locations[#"hash_33059ac06a23beca"] = [];
	locations[#"hash_7852e39f75c4b5c0"] = [];
	locations[#"steam"] = [];
	fxcount = 7;
	var_33ad9452 = (isdefined(1) ? 1 : 0);
	fxcount = int(math::clamp((fxcount * multiplier) + 6, 6, 7));
	if(multiplier < 0.04)
	{
		fxcount = 0;
	}
	function_31cc6bd9();
	if(function_31f342a2(startpos, sqr(97.5)) && fxcount > 10)
	{
		fxcount = 7;
	}
	var_4997e17c = perpendicularvector(normal);
	for(fxindex = 0; fxindex < fxcount; fxindex++)
	{
		locations[#"point"][fxindex] = function_523961e2(startpos, normal, var_4997e17c, fxindex, fxcount, defaultdistance, rotation);
		function_1493c734(locations[#"point"][fxindex], 10, (0, fxindex * 20, 0), 0.6, 200);
		locations[#"color"][fxindex] = colorarray[fxindex % colorarray.size];
	}
	var_1cac1ca8 = normal[2] > 0.5;
	for(count = 0; count < fxcount; count++)
	{
		trace = hitpos(startpos, locations[#"point"][count], locations[#"color"][count]);
		traceposition = trace[#"position"];
		locations[#"tracepos"][count] = traceposition;
		hitsomething = 0;
		if(trace[#"fraction"] < 0.7)
		{
			function_1493c734(traceposition, 10, (1, 0, 0), 0.6, 200);
			locations[#"loc"][count] = traceposition;
			locations[#"normal"][count] = trace[#"normal"];
			if(var_1cac1ca8)
			{
				locations[#"hash_33059ac06a23beca"][count] = 1;
			}
			hitsomething = 1;
		}
		if(!hitsomething)
		{
			var_e5d1793d = hitpos(traceposition, traceposition - (normal * defaultdropdistance), locations[#"color"][count]);
			if(var_e5d1793d[#"fraction"] != 1)
			{
				function_1493c734(var_e5d1793d[#"position"], 10, (0, 0, 1), 0.6, 200);
				locations[#"loc"][count] = var_e5d1793d[#"position"];
				var_c84f4998 = function_330c2616(var_e5d1793d[#"position"]);
				if(function_a66ba8cc(var_c84f4998))
				{
					locations[#"normal"][count] = (0, 0, 1);
					locations[#"steam"][count] = 1;
					locations[#"loc"][count] = locations[#"loc"][count] - (0, 0, var_c84f4998);
				}
				else
				{
					locations[#"normal"][count] = var_e5d1793d[#"normal"];
					locations[#"hash_7852e39f75c4b5c0"][count] = 1;
				}
			}
		}
		randangle = randomint(360);
		var_c4b09917 = randomfloatrange(-25, 25);
		var_7ee25402 = rotatepointaroundaxis(var_4997e17c, normal, randangle);
		var_995eb37a = int(min(((var_33ad9452 * multiplier) * trace[#"fraction"]) + 1, var_33ad9452));
		for(var_ecef2fde = 0; var_ecef2fde < var_995eb37a && (count % 2) == 0; var_ecef2fde++)
		{
			fraction = (var_ecef2fde + 1) / (var_995eb37a + 1);
			offsetpoint = (startpos + ((traceposition - startpos) * fraction)) + (var_7ee25402 * var_c4b09917);
			var_9417df90 = hitpos(offsetpoint, offsetpoint - (normal * defaultdropdistance), locations[#"color"][count]);
			if(var_9417df90[#"fraction"] != 1)
			{
				function_1493c734(var_9417df90[#"position"], 10, (0, 0, 1), 0.6, 200);
				locindex = count + (fxcount * (var_ecef2fde + 1));
				locations[#"loc"][locindex] = var_9417df90[#"position"];
				var_c84f4998 = function_330c2616(var_9417df90[#"position"]);
				if(function_a66ba8cc(var_c84f4998))
				{
					locations[#"normal"][locindex] = (0, 0, 1);
					locations[#"steam"][locindex] = 1;
					locations[#"loc"][locindex] = locations[#"loc"][locindex] - (0, 0, var_c84f4998);
					continue;
				}
				locations[#"normal"][locindex] = var_9417df90[#"normal"];
			}
		}
	}
	var_aecaaa11 = getweapon(#"hash_23dd6039fe2f36c6");
	var_3cbce009 = getweapon("molotov_fire_tall");
	var_4a1b9411 = getweapon("molotov_fire_small");
	var_7bf146f2 = getweapon("molotov_steam");
	var_6b23e1c9 = impactpos + (normal * 1.5);
	forward = (1, 0, 0);
	if(abs(vectordot(forward, normal)) > 0.999)
	{
		forward = (0, 0, 1);
	}
	if(!function_f4e48434(var_6b23e1c9))
	{
		playfx(#"hash_789d7811f6a28f9a", var_6b23e1c9, forward, normal, 0, team);
		if(!isdefined(var_e76400c0))
		{
			spawntimedfx(var_aecaaa11, var_6b23e1c9, normal, int(5), team);
		}
	}
	if(level.gameended)
	{
		return;
	}
	if(!isdefined(level.var_801fd65e))
	{
		level.var_801fd65e = 0;
	}
	if(!isdefined(level.var_a88ac760))
	{
		level.var_a88ac760 = [];
	}
	var_bf264593 = level.var_a88ac760.size;
	level.var_a88ac760[var_bf264593] = {};
	var_4b424bc1 = level.var_a88ac760[var_bf264593];
	var_4b424bc1.var_46ee5246 = int(gettime() + 5000);
	var_4b424bc1.origin = startpos;
	thread damageeffectarea(startpos, normal, var_aecaaa11, multiplier, var_e76400c0, wallnormal, var_693f108f, var_4b424bc1.var_46ee5246, var_4dd46f8a, attacker, exploder);
	thread function_9464e4ad(startpos, normal, var_aecaaa11, multiplier, var_e76400c0, wallnormal, var_693f108f, var_4b424bc1.var_46ee5246, var_4dd46f8a, attacker);
	var_b1dd2ca0 = getarraykeys(locations[#"loc"]);
	foreach(var_7ee5c69b in var_b1dd2ca0)
	{
		if(!isdefined(var_7ee5c69b))
		{
			continue;
		}
		if(function_f4e48434(locations[#"loc"][var_7ee5c69b]))
		{
			continue;
		}
		if(isdefined(locations[#"hash_7852e39f75c4b5c0"][var_7ee5c69b]))
		{
			fireweapon = var_4a1b9411;
		}
		else
		{
			if(isdefined(locations[#"steam"][var_7ee5c69b]))
			{
				fireweapon = var_7bf146f2;
			}
			else
			{
				fireweapon = (isdefined(locations[#"hash_33059ac06a23beca"][var_7ee5c69b]) ? var_3cbce009 : var_aecaaa11);
			}
		}
		level thread function_42b9fdbe(fireweapon, locations[#"loc"][var_7ee5c69b], locations[#"normal"][var_7ee5c69b], int(5), team);
	}
}

/*
	Name: function_42b9fdbe
	Namespace: namespace_68a80213
	Checksum: 0x3140B0E8
	Offset: 0x2100
	Size: 0x84
	Parameters: 5
	Flags: None
*/
function function_42b9fdbe(weapon, loc, normal, duration, team)
{
	fxnormal = duration;
	wait(randomfloatrange(0, 0.5));
	spawntimedfx(loc, normal, fxnormal, team, #"axis");
}

/*
	Name: incendiary_debug_line
	Namespace: namespace_68a80213
	Checksum: 0xC161D79F
	Offset: 0x2190
	Size: 0xB4
	Parameters: 5
	Flags: None
*/
function incendiary_debug_line(from, to, color, depthtest, time)
{
	/#
		debug_rcbomb = getdvarint(#"hash_4eff71fc5bf5542a", 0);
		if(debug_rcbomb == 1)
		{
			if(!isdefined(time))
			{
				time = 100;
			}
			if(!isdefined(depthtest))
			{
				depthtest = 1;
			}
			line(from, to, color, 1, depthtest, time);
		}
	#/
}

/*
	Name: damageeffectarea
	Namespace: namespace_68a80213
	Checksum: 0x68CC88AF
	Offset: 0x2250
	Size: 0x4F8
	Parameters: 11
	Flags: None
*/
function damageeffectarea(position, normal, weapon, radius_multiplier, var_e76400c0, wallnormal, var_cbaaea69, damageendtime, var_4dd46f8a, attacker, exploder)
{
	level endon(#"game_ended");
	radius = 65 * radius_multiplier;
	height = 48;
	trigger_radius_position = normal - (0, 0, height);
	trigger_radius_height = height * 2;
	if(isdefined(var_e76400c0) && isdefined(wallnormal))
	{
		var_21f4217c = (var_e76400c0 + vectorscale(wallnormal, 12)) - (0, 0, var_cbaaea69);
		var_289a74bc = spawn("trigger_radius", var_21f4217c, 0, 12, var_cbaaea69);
		/#
			if(getdvarint(#"scr_draw_triggers", 0))
			{
				level thread util::drawcylinder(var_21f4217c, 12, var_cbaaea69, undefined, "", (1, 0, 0), 0.9);
			}
		#/
	}
	if(radius >= 0.04)
	{
		fireeffectarea = spawn("trigger_radius", trigger_radius_position, 0, radius, trigger_radius_height);
		firesound = spawn("script_origin", fireeffectarea.origin);
		if(isdefined(firesound))
		{
			firesound playloopsound(#"hash_6993f289f9415bd1");
		}
	}
	/#
		if(getdvarint(#"scr_draw_triggers", 0))
		{
			level thread util::drawcylinder(trigger_radius_position, radius, trigger_radius_height, undefined, "");
		}
	#/
	self.var_ebf0b1c9 = [];
	burntime = 0;
	var_d0603aba = 1;
	self thread function_1f077104(normal, fireeffectarea, var_289a74bc, weapon, damageendtime);
	while(gettime() < damageendtime)
	{
		damageapplied = 0;
		potential_targets = self getpotentialtargets(normal);
		foreach(target in potential_targets)
		{
			waitframe(1);
			if(isdefined(target) && isdefined(self))
			{
				self trytoapplyfiredamage(target, normal, fireeffectarea, var_289a74bc, weapon, var_4dd46f8a, attacker, exploder);
			}
		}
		wait(0.2);
	}
	arrayremovevalue(self.var_ebf0b1c9, undefined);
	foreach(target in self.var_ebf0b1c9)
	{
		target.var_84e41b20 = undefined;
		target status_effect::function_408158ef(level.var_5d450296, level.var_e6a4f161);
	}
	if(isdefined(fireeffectarea))
	{
		fireeffectarea delete();
		if(isdefined(firesound))
		{
			firesound thread stopfiresound();
		}
	}
	if(isdefined(var_289a74bc))
	{
		var_289a74bc delete();
	}
	/#
		if(getdvarint(#"scr_draw_triggers", 0))
		{
			level notify(#"hash_33d328e380ab0acc");
		}
	#/
}

/*
	Name: function_1f077104
	Namespace: namespace_68a80213
	Checksum: 0xA1C0DDFA
	Offset: 0x2750
	Size: 0x11C
	Parameters: 5
	Flags: None
*/
function function_1f077104(position, fireeffectarea, var_289a74bc, weapon, damageendtime)
{
	level endon(#"game_ended");
	self endon(#"death");
	while(gettime() < damageendtime)
	{
		friendly_targets = self function_ae0a22c4(position);
		foreach(target in friendly_targets)
		{
			self function_851843a5(target, position, fireeffectarea, var_289a74bc, weapon);
		}
		wait(0.25);
	}
}

/*
	Name: stopfiresound
	Namespace: namespace_68a80213
	Checksum: 0x8B73425F
	Offset: 0x2878
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function stopfiresound()
{
	firesound = self;
	firesound stoploopsound(2);
	wait(0.5);
	if(isdefined(firesound))
	{
		firesound delete();
	}
}

/*
	Name: function_9464e4ad
	Namespace: namespace_68a80213
	Checksum: 0x64F5C4D0
	Offset: 0x28D8
	Size: 0x374
	Parameters: 10
	Flags: None
*/
function function_9464e4ad(position, normal, weapon, radius_multiplier, var_e76400c0, wallnormal, var_cbaaea69, damageendtime, var_4dd46f8a, attacker)
{
	level endon(#"game_ended");
	radius = 65 * radius_multiplier;
	height = 48;
	trigger_radius_position = normal - (0, 0, height);
	trigger_radius_height = height * 2;
	if(isdefined(var_e76400c0) && isdefined(wallnormal))
	{
		var_21f4217c = (var_e76400c0 + vectorscale(wallnormal, 12)) - (0, 0, var_cbaaea69);
		var_289a74bc = spawn("trigger_radius", var_21f4217c, 0, 12, var_cbaaea69);
		var_289a74bc.targetname = "fire_area";
	}
	if(radius >= 0.04)
	{
		fireeffectarea = spawn("trigger_radius", trigger_radius_position, 0, radius, trigger_radius_height);
		fireeffectarea.targetname = "fire_area";
	}
	self.var_ebf0b1c9 = [];
	while(gettime() < damageendtime)
	{
		damageapplied = 0;
		potential_targets = self weapons::function_356292be(undefined, normal, radius);
		foreach(target in potential_targets)
		{
			waitframe(1);
			if(isdefined(target) && isdefined(self))
			{
				self trytoapplyfiredamage(target, normal, fireeffectarea, var_289a74bc, weapon, var_4dd46f8a, attacker);
			}
		}
		wait(var_4dd46f8a.var_8fbd03cb);
	}
	arrayremovevalue(self.var_ebf0b1c9, undefined);
	foreach(target in self.var_ebf0b1c9)
	{
		target.var_84e41b20 = undefined;
		target status_effect::function_408158ef(level.var_5d450296, level.var_e6a4f161);
	}
	if(isdefined(fireeffectarea))
	{
		fireeffectarea delete();
	}
	if(isdefined(var_289a74bc))
	{
		var_289a74bc delete();
	}
}

/*
	Name: function_ae0a22c4
	Namespace: namespace_68a80213
	Checksum: 0x6291142C
	Offset: 0x2C58
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_ae0a22c4(position)
{
	potential_targets = [];
	potential_targets = getentitiesinradius(position, 65, 15);
	return potential_targets;
}

/*
	Name: getpotentialtargets
	Namespace: namespace_68a80213
	Checksum: 0xEB7ABF1
	Offset: 0x2CA8
	Size: 0x14E
	Parameters: 1
	Flags: None
*/
function getpotentialtargets(origin)
{
	if(level.teambased && level.friendlyfire == 0)
	{
		potential_targets = [];
		foreach(_ in level.teams)
		{
			potential_targets = arraycombine(potential_targets, getplayers(team, origin, 65), 0, 0);
			continue;
		}
	}
	all_targets = [];
	all_targets = arraycombine(potential_targets, getaiarray(), 0, 0);
	all_targets = function_72d3bca6(all_targets, origin, undefined, undefined, 65);
	if(level.friendlyfire > 0)
	{
		return all_targets;
	}
	return all_targets;
}

/*
	Name: function_5a49ebd3
	Namespace: namespace_68a80213
	Checksum: 0xA3E645B8
	Offset: 0x2E00
	Size: 0x162
	Parameters: 1
	Flags: None
*/
function function_5a49ebd3(team)
{
	scriptmodels = getentarray("script_model", "classname");
	var_e26b971c = [];
	foreach(scriptmodel in scriptmodels)
	{
		if(!isdefined(scriptmodel))
		{
			continue;
		}
		if(!isdefined(scriptmodel.team))
		{
			continue;
		}
		if(scriptmodel.health <= 0)
		{
			continue;
		}
		if(scriptmodel.team == team)
		{
			if(!isdefined(var_e26b971c))
			{
				var_e26b971c = [];
			}
			else if(!isarray(var_e26b971c))
			{
				var_e26b971c = array(var_e26b971c);
			}
			if(!isinarray(var_e26b971c, scriptmodel))
			{
				var_e26b971c[var_e26b971c.size] = scriptmodel;
			}
		}
	}
	return var_e26b971c;
}

/*
	Name: function_851843a5
	Namespace: namespace_68a80213
	Checksum: 0xD822C4B6
	Offset: 0x2F70
	Size: 0x1C8
	Parameters: 5
	Flags: None
*/
function function_851843a5(target, position, fireeffectarea, var_289a74bc, weapon)
{
	if(!(isdefined(var_289a74bc) || isdefined(weapon)))
	{
		return;
	}
	var_4c3c1b32 = 0;
	var_75046efd = 0;
	sourcepos = fireeffectarea;
	if(isdefined(var_289a74bc))
	{
		var_4c3c1b32 = position istouching(var_289a74bc);
		sourcepos = var_289a74bc.origin;
	}
	if(isdefined(weapon))
	{
		var_75046efd = position istouching(weapon);
		sourcepos = weapon.origin;
	}
	var_be45d685 = !(var_4c3c1b32 || var_75046efd);
	targetentnum = position getentitynumber();
	if(!var_be45d685 && (!isdefined(position.sessionstate) || position.sessionstate == "playing"))
	{
		trace = bullettrace(fireeffectarea, position getshootatpos(), 0, position);
		if(trace[#"fraction"] == 1)
		{
			if(position.var_9fde8624 === #"hash_28e36e7b7d5421f")
			{
				position thread function_c049196a();
			}
		}
		else
		{
			var_be45d685 = 1;
		}
	}
}

/*
	Name: trytoapplyfiredamage
	Namespace: namespace_68a80213
	Checksum: 0x84ACD800
	Offset: 0x3140
	Size: 0x2DC
	Parameters: 8
	Flags: None
*/
function trytoapplyfiredamage(target, position, fireeffectarea, var_289a74bc, weapon, var_4dd46f8a, attacker, exploder)
{
	if(!(isdefined(fireeffectarea) || isdefined(var_289a74bc)))
	{
		return;
	}
	var_4c3c1b32 = 0;
	var_75046efd = 0;
	sourcepos = position;
	if(isdefined(fireeffectarea))
	{
		var_4c3c1b32 = target istouching(fireeffectarea);
		sourcepos = fireeffectarea.origin;
	}
	if(isdefined(var_289a74bc))
	{
		var_75046efd = target istouching(var_289a74bc);
		sourcepos = var_289a74bc.origin;
	}
	var_be45d685 = !(var_4c3c1b32 || var_75046efd);
	targetentnum = target getentitynumber();
	if(!var_be45d685 && (!isdefined(target.sessionstate) || target.sessionstate == "playing"))
	{
		trace = bullettrace(position, target getshootatpos(), 0, target);
		if(trace[#"fraction"] == 1)
		{
			if(isplayer(target))
			{
				target thread damageinfirearea(sourcepos, trace, position, weapon, fireeffectarea, var_289a74bc, var_4dd46f8a);
			}
			else
			{
				if(isai(target))
				{
					target function_8422dabd(sourcepos, trace, position, var_4dd46f8a, attacker, exploder);
				}
				else
				{
					target thread function_37ddab3(sourcepos, trace, position, weapon, var_4dd46f8a);
				}
			}
			self.var_ebf0b1c9[targetentnum] = target;
		}
		else
		{
			var_be45d685 = 1;
		}
	}
	if(var_be45d685 && isdefined(target.var_84e41b20) && isplayer(target))
	{
		if(target.var_84e41b20.size == 0)
		{
			target.var_84e41b20 = undefined;
			target status_effect::function_408158ef(level.var_5d450296, level.var_e6a4f161);
			self.var_ebf0b1c9[targetentnum] = undefined;
		}
	}
}

/*
	Name: function_c049196a
	Namespace: namespace_68a80213
	Checksum: 0xE7862366
	Offset: 0x3428
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function function_c049196a()
{
	self endon(#"death");
	t = gettime();
	wait_time = gettime() + 1000;
	if(isdefined(self))
	{
		self.var_338d4a29 = 1;
		wait(0.25);
		self.var_338d4a29 = 0;
	}
}

/*
	Name: damageinfirearea
	Namespace: namespace_68a80213
	Checksum: 0x5A9DA35D
	Offset: 0x3498
	Size: 0x1DC
	Parameters: 7
	Flags: None
*/
function damageinfirearea(origin, trace, position, weapon, fireeffectarea, var_289a74bc, var_4dd46f8a)
{
	self endon(#"death");
	timer = 0;
	if(candofiredamage(self, 0.2))
	{
		/#
			level.var_de532e7f = getdvarint(#"hash_4eff71fc5bf5542a", 0);
			if(level.var_de532e7f)
			{
				if(!isdefined(level.incendiarydamagetime))
				{
					level.incendiarydamagetime = gettime();
				}
				iprintlnbold(level.incendiarydamagetime - gettime());
				level.incendiarydamagetime = gettime();
			}
		#/
		if(!isdefined(self.var_84e41b20))
		{
			self.var_84e41b20 = [];
		}
		params = function_4d1e7b48("dot_molotov_dog");
		if(undefined !== self)
		{
			if(isdefined(var_289a74bc))
			{
				self status_effect::status_effect_apply(params, fireeffectarea, var_289a74bc, 0, undefined, undefined, weapon);
				self.var_ae639436 = var_289a74bc;
				self thread sndfiredamage();
			}
			else if(isdefined(var_4dd46f8a))
			{
				self status_effect::status_effect_apply(params, fireeffectarea, var_4dd46f8a, 0, undefined, undefined, weapon);
				self.var_ae639436 = var_4dd46f8a;
				self thread sndfiredamage();
			}
		}
	}
}

/*
	Name: function_8422dabd
	Namespace: namespace_68a80213
	Checksum: 0x7546AB01
	Offset: 0x3680
	Size: 0x2BC
	Parameters: 6
	Flags: None
*/
function function_8422dabd(origin, trace, position, var_4dd46f8a, attacker, exploder)
{
	self endon(#"death");
	timer = 0;
	if(candofiredamage(self, var_4dd46f8a.var_90bd7d92))
	{
		if(!isdefined(self.var_84e41b20))
		{
			self.var_84e41b20 = [];
		}
		damage = 14;
		round = zm_utility::get_round_number();
		if(round >= 2)
		{
			if(round > 35)
			{
				round = 35;
			}
			var_67866c7d = (round - 2) + 1;
			var_5a3c0fab = 1.2;
			var_e2d3357 = pow(var_5a3c0fab, var_67866c7d);
			damage = int(damage * var_e2d3357);
		}
		if(self !== exploder && isalive(self))
		{
			damage = int(damage);
			if(damage >= self.health && !is_true(self.var_865b1595))
			{
				scoreevents::function_a1f450c2("hellhound_flame_killingblow", attacker, self);
				self.var_865b1595 = 1;
			}
			self dodamage(damage, self.origin, undefined, undefined, "none", "MOD_BURNED", 0, undefined);
			scoreevents::function_82234b38(self, attacker, undefined, undefined, undefined, undefined);
			if(isplayer(attacker))
			{
				point = aiutility::function_cb552839(self);
				hud::function_c9800094(attacker, point, damage, 1, self namespace_42457a0::function_1b3815a7(#"fire"));
			}
		}
	}
}

/*
	Name: function_37ddab3
	Namespace: namespace_68a80213
	Checksum: 0x7FC9C9FE
	Offset: 0x3948
	Size: 0x10A
	Parameters: 5
	Flags: None
*/
function function_37ddab3(origin, trace, position, weapon, var_4dd46f8a)
{
	self endon(#"death");
	timer = 0;
	if(candofiredamage(self, var_4dd46f8a.var_8fbd03cb))
	{
		var_4dd4e6ee = undefined;
		if(!isdefined(self.var_84e41b20))
		{
			self.var_84e41b20 = [];
		}
		var_341dfe48 = int(var_4dd46f8a.var_4931651e * var_4dd46f8a.var_8fbd03cb);
		self dodamage(var_341dfe48, self.origin, undefined, weapon, "none", "MOD_BURNED", 0, weapon);
		self.var_ae639436 = var_4dd4e6ee;
	}
}

/*
	Name: function_59d981cc
	Namespace: namespace_68a80213
	Checksum: 0x9DDC02B5
	Offset: 0x3A60
	Size: 0x350
	Parameters: 4
	Flags: None
*/
function function_59d981cc(origin, blast_radius, attacker, exploder)
{
	level endon(#"game_ended");
	potential_targets = [];
	potential_targets = arraycombine(getpotentialtargets(origin), self weapons::function_356292be(undefined, origin, blast_radius), 0);
	foreach(target in potential_targets)
	{
		waitframe(1);
		if(isdefined(target))
		{
			var_9dea1e72 = mapfloat(0, blast_radius, 10, 25, distance(target.origin, origin));
			if(isactor(target))
			{
				round = zm_utility::get_round_number();
				if(round >= 2)
				{
					if(round > 35)
					{
						round = 35;
					}
					var_67866c7d = (round - 2) + 1;
					var_5a3c0fab = 1.2;
					var_e2d3357 = pow(var_5a3c0fab, var_67866c7d);
					var_9dea1e72 = int(var_9dea1e72 * var_e2d3357);
				}
			}
			if(target !== exploder && isalive(target))
			{
				var_9dea1e72 = int(var_9dea1e72);
				if(var_9dea1e72 >= target.health)
				{
					scoreevents::function_a1f450c2("hellhound_flame_killingblow", attacker, target);
				}
				scoreevents::function_82234b38(self, attacker, undefined, undefined, undefined, undefined);
				target dodamage(var_9dea1e72, origin, undefined, attacker, "none", "MOD_EXPLOSIVE", 0, undefined);
				if(isplayer(attacker))
				{
					point = aiutility::function_cb552839(target);
					hud::function_c9800094(attacker, point, var_9dea1e72, 1, self namespace_42457a0::function_1b3815a7(#"fire"));
				}
			}
		}
	}
}

/*
	Name: sndfiredamage
	Namespace: namespace_68a80213
	Checksum: 0xD373F2F8
	Offset: 0x3DB8
	Size: 0x14E
	Parameters: 0
	Flags: None
*/
function sndfiredamage()
{
	self notify(#"sndfire");
	self endon(#"sndfire", #"death", #"disconnect");
	if(!isdefined(self.sndfireent))
	{
		self.sndfireent = spawn("script_origin", self.origin);
		self.sndfireent linkto(self, "tag_origin");
		self.sndfireent playsound(#"hash_42d7a7b01bd2b414");
		self thread sndfiredamage_deleteent(self.sndfireent);
	}
	self.sndfireent playloopsound(#"hash_aa65888a78201f4", 0.5);
	wait(3);
	if(isdefined(self.sndfireent))
	{
		self.sndfireent delete();
		self.sndfireent = undefined;
	}
}

/*
	Name: sndfiredamage_deleteent
	Namespace: namespace_68a80213
	Checksum: 0x4144242
	Offset: 0x3F10
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function sndfiredamage_deleteent(ent)
{
	self waittill(#"death", #"disconnect");
	if(isdefined(ent))
	{
		ent delete();
	}
}

/*
	Name: hitpos
	Namespace: namespace_68a80213
	Checksum: 0xA256A557
	Offset: 0x3F68
	Size: 0xE0
	Parameters: 3
	Flags: None
*/
function hitpos(start, end, color)
{
	trace = bullettrace(start, end, 0, undefined);
	/#
		level.var_de532e7f = getdvarint(#"hash_4eff71fc5bf5542a", 0);
		if(level.var_de532e7f)
		{
			debugstar(trace[#"position"], 2000, color);
		}
		thread incendiary_debug_line(start, trace[#"position"], color, 1, 80);
	#/
	return trace;
}

/*
	Name: candofiredamage
	Namespace: namespace_68a80213
	Checksum: 0xA011723A
	Offset: 0x4050
	Size: 0xF4
	Parameters: 2
	Flags: None
*/
function candofiredamage(victim, resetfiretime)
{
	if(isplayer(victim) && victim depthofplayerinwater() >= 1)
	{
		return false;
	}
	if(isactor(victim) && victim.var_9fde8624 === #"hash_28e36e7b7d5421f")
	{
		return false;
	}
	entnum = victim getentitynumber();
	if(!isdefined(level.var_e8a6b3ee[entnum]))
	{
		level.var_e8a6b3ee[entnum] = 1;
		level thread resetfiredamage(entnum, resetfiretime);
		return true;
	}
	return false;
}

/*
	Name: resetfiredamage
	Namespace: namespace_68a80213
	Checksum: 0x4F0CE147
	Offset: 0x4150
	Size: 0x40
	Parameters: 2
	Flags: None
*/
function resetfiredamage(entnum, time)
{
	if(time > 0.05)
	{
		wait(time - 0.05);
	}
	level.var_e8a6b3ee[entnum] = undefined;
}

/*
	Name: function_1493c734
	Namespace: namespace_68a80213
	Checksum: 0xC5554072
	Offset: 0x4198
	Size: 0xAC
	Parameters: 5
	Flags: None
*/
function function_1493c734(origin, radius, color, alpha, time)
{
	/#
		var_9f49d7d = getdvarint(#"hash_58042b6209e0c2a6", 0);
		if(var_9f49d7d > 0)
		{
			if(var_9f49d7d > 1)
			{
				radius = int(radius / var_9f49d7d);
			}
			util::debug_sphere(origin, radius, color, alpha, time);
		}
	#/
}

/*
	Name: function_ccb2e201
	Namespace: namespace_68a80213
	Checksum: 0xF595FB90
	Offset: 0x4250
	Size: 0xF8
	Parameters: 2
	Flags: None
*/
function function_ccb2e201(position, radius)
{
	a_zombies = getentitiesinradius(position, radius, 15);
	a_filtered_zombies = array::filter(a_zombies, 0, &function_53811067);
	if(a_filtered_zombies.size > 0)
	{
		foreach(zombie in a_filtered_zombies)
		{
			zombie zombie_utility::setup_zombie_knockdown(position);
		}
	}
}

/*
	Name: function_53811067
	Namespace: namespace_68a80213
	Checksum: 0xDD207DD
	Offset: 0x4350
	Size: 0x70
	Parameters: 1
	Flags: Private
*/
function private function_53811067(zombie)
{
	if(!isdefined(zombie))
	{
		return false;
	}
	if(zombie.knockdown === 1)
	{
		return false;
	}
	if(zombie.archetype !== #"zombie")
	{
		return false;
	}
	if(zombie.is_immune_to_knockdown === 1)
	{
		return false;
	}
	return true;
}

