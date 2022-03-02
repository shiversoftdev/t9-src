#using script_396f7d71538c9677;
#using script_47fb62300ac0bd60;
#using script_545a0bac37bda541;
#using script_57f7003580bb15e0;
#using script_7bafaa95bb1b427e;
#using script_8988fdbc78d6c53;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\entityheadicons_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_8c178c42;

/*
	Name: function_dced4d5f
	Namespace: namespace_8c178c42
	Checksum: 0x7A402F36
	Offset: 0x1D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dced4d5f()
{
	level notify(1039631096);
}

#namespace namespace_ad7d66e9;

/*
	Name: function_89f2df9
	Namespace: namespace_ad7d66e9
	Checksum: 0xDB4739AB
	Offset: 0x1F8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6cc8dc4627aa0eaa", &init_shared, undefined, undefined, undefined);
}

/*
	Name: init_shared
	Namespace: namespace_ad7d66e9
	Checksum: 0xD0F8827A
	Offset: 0x240
	Size: 0x60
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	params = function_4d1e7b48(#"hash_69374f563cb01313");
	level.var_26472ea3 = params.var_18d16a6b;
	level.var_71a63cb2 = params.var_67e2281d;
	level.var_f217c587 = [];
}

/*
	Name: function_5545649e
	Namespace: namespace_ad7d66e9
	Checksum: 0x546DC927
	Offset: 0x2A8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_5545649e(watcher)
{
	watcher.onspawn = &function_77344457;
}

/*
	Name: function_77344457
	Namespace: namespace_ad7d66e9
	Checksum: 0x7EE2CC05
	Offset: 0x2D8
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_77344457(watcher, ent)
{
	ent endon(#"death", #"disconnect");
	level endon(#"game_ended");
	self thread function_1cdbb1e5(ent, self.weapon);
}

/*
	Name: function_bba54dca
	Namespace: namespace_ad7d66e9
	Checksum: 0x98A06EEA
	Offset: 0x358
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_bba54dca()
{
	self waittill(#"death");
	waittillframeend();
	self notify(#"hash_2a125df0aca068b");
}

/*
	Name: function_1cdbb1e5
	Namespace: namespace_ad7d66e9
	Checksum: 0xD7C1AB6C
	Offset: 0x390
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function function_1cdbb1e5(owner, weapon)
{
	self endon(#"hacked", #"hash_2a125df0aca068b");
	/#
		assert(isdefined(weapon.var_4dd46f8a), "" + weapon.name);
	#/
	self thread function_bba54dca();
	team = self.team;
	var_3e7a440 = getscriptbundle(weapon.var_4dd46f8a);
	self thread function_71c73ece();
	waitresult = undefined;
	waitresult = self waittill(#"projectile_impact_explode", #"explode");
	if(waitresult._notify == "projectile_impact_explode")
	{
		var_bd5f5c6c = !function_f4e48434(waitresult.position);
		if(var_bd5f5c6c)
		{
			function_462c8632(owner, waitresult.position, waitresult.normal, self.var_59ba00f5, weapon, team, var_3e7a440);
		}
	}
}

/*
	Name: function_462c8632
	Namespace: namespace_ad7d66e9
	Checksum: 0x524FD64B
	Offset: 0x520
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_462c8632(owner, origin, normal, velocity, weapon, team, var_4dd46f8a)
{
	playsoundatposition("", origin);
	self thread function_e8ad1d81(origin, owner, normal, velocity, weapon, team, var_4dd46f8a);
}

/*
	Name: function_f4e48434
	Namespace: namespace_ad7d66e9
	Checksum: 0x5C9A5688
	Offset: 0x5A0
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_f4e48434(position)
{
	var_c84f4998 = getwaterheight(position) - position[2];
	return var_c84f4998 >= 24;
}

/*
	Name: function_a66ba8cc
	Namespace: namespace_ad7d66e9
	Checksum: 0xA12EE061
	Offset: 0x5F0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_a66ba8cc(var_c84f4998)
{
	return 0 < var_c84f4998 && var_c84f4998 < 24;
}

/*
	Name: function_330c2616
	Namespace: namespace_ad7d66e9
	Checksum: 0xD804055
	Offset: 0x620
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_330c2616(position)
{
	return getwaterheight(position) - position[2];
}

/*
	Name: function_71c73ece
	Namespace: namespace_ad7d66e9
	Checksum: 0x6D84DBDA
	Offset: 0x658
	Size: 0x7A
	Parameters: 0
	Flags: Linked
*/
function function_71c73ece()
{
	self endon(#"projectile_impact_explode", #"death");
	while(true)
	{
		self.var_59ba00f5 = self getvelocity();
		wait(float(function_60d95f53()) / 1000);
	}
}

/*
	Name: function_7cbeb2f0
	Namespace: namespace_ad7d66e9
	Checksum: 0xD57F63C6
	Offset: 0x6E0
	Size: 0x84
	Parameters: 1
	Flags: Linked
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
	Namespace: namespace_ad7d66e9
	Checksum: 0x38CCAD7B
	Offset: 0x770
	Size: 0x8D4
	Parameters: 7
	Flags: Linked
*/
function function_e8ad1d81(position, owner, normal, velocity, weapon, team, var_4dd46f8a)
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
					level thread function_42b9fdbe(var_7bf146f2, newpos, (0, 0, 1), int(var_4dd46f8a.var_b79d64a9), team);
					break;
				}
				level thread function_42b9fdbe(var_5632b17, newpos, wall_normal, int(var_4dd46f8a.var_b79d64a9), team);
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
			spawntimedfx(var_5632b17, traceposition, var_252a0dc7, int(var_4dd46f8a.var_b79d64a9), team);
		}
	}
	var_1f254a06 = normal;
	level function_8a03d3f3(owner, position, startpos, var_1f254a06, var_d6d43109, rotation, weapon, var_4dd46f8a, team, var_e76400c0, wallnormal, var_693f108f);
}

/*
	Name: function_523961e2
	Namespace: namespace_ad7d66e9
	Checksum: 0xEF1A728C
	Offset: 0x1050
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_523961e2(startpos, normal, var_4997e17c, fxindex, fxcount, defaultdistance, rotation)
{
	currentangle = (360 / fxcount) * fxindex;
	var_7ee25402 = rotatepointaroundaxis(var_4997e17c * defaultdistance, normal, currentangle + rotation);
	return startpos + var_7ee25402;
}

/*
	Name: function_31cc6bd9
	Namespace: namespace_ad7d66e9
	Checksum: 0x66100384
	Offset: 0x10E8
	Size: 0xE4
	Parameters: 0
	Flags: Linked
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
	Namespace: namespace_ad7d66e9
	Checksum: 0xE2F5F7E6
	Offset: 0x11D8
	Size: 0xFE
	Parameters: 2
	Flags: Linked
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
	Namespace: namespace_ad7d66e9
	Checksum: 0x45BF7936
	Offset: 0x12E0
	Size: 0xE70
	Parameters: 12
	Flags: Linked
*/
function function_8a03d3f3(owner, impactpos, startpos, normal, multiplier, rotation, weapon, var_4dd46f8a, team, var_e76400c0, wallnormal, var_693f108f)
{
	defaultdistance = var_4dd46f8a.var_6193a41b * multiplier;
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
	fxcount = var_4dd46f8a.var_b650dc43;
	var_33ad9452 = (isdefined(var_4dd46f8a.var_bc24d9d3) ? var_4dd46f8a.var_bc24d9d3 : 0);
	fxcount = int(math::clamp((fxcount * multiplier) + 6, 6, var_4dd46f8a.var_b650dc43));
	if(multiplier < 0.04)
	{
		fxcount = 0;
	}
	function_31cc6bd9();
	if(function_31f342a2(startpos, sqr(var_4dd46f8a.var_6193a41b * 1.5)) && fxcount > 10)
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
		if(!isdefined(var_e76400c0))
		{
			spawntimedfx(weapon, var_6b23e1c9, normal, int(var_4dd46f8a.var_b79d64a9), team);
		}
	}
	if(level.gameended)
	{
		return;
	}
	if(!isdefined(level.var_e9c1dfe9))
	{
		level.var_e9c1dfe9 = 0;
	}
	if(!isdefined(level.var_a88ac760))
	{
		level.var_a88ac760 = [];
	}
	var_bf264593 = level.var_a88ac760.size;
	level.var_a88ac760[var_bf264593] = {};
	var_4b424bc1 = level.var_a88ac760[var_bf264593];
	var_4b424bc1.var_46ee5246 = int(gettime() + (var_4dd46f8a.var_b79d64a9 * 1000));
	var_4b424bc1.origin = startpos;
	thread damageeffectarea(owner, startpos, normal, var_aecaaa11, var_4dd46f8a, multiplier, var_e76400c0, wallnormal, var_693f108f, var_4b424bc1.var_46ee5246);
	thread function_9464e4ad(owner, startpos, normal, var_aecaaa11, var_4dd46f8a, multiplier, var_e76400c0, wallnormal, var_693f108f, var_4b424bc1.var_46ee5246);
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
		level thread function_42b9fdbe(fireweapon, locations[#"loc"][var_7ee5c69b], locations[#"normal"][var_7ee5c69b], int(var_4dd46f8a.var_b79d64a9), team);
	}
}

/*
	Name: function_42b9fdbe
	Namespace: namespace_ad7d66e9
	Checksum: 0x7F40D227
	Offset: 0x2158
	Size: 0x7C
	Parameters: 5
	Flags: Linked
*/
function function_42b9fdbe(weapon, loc, normal, duration, team)
{
	fxnormal = normal;
	wait(randomfloatrange(0, 0.5));
	spawntimedfx(weapon, loc, fxnormal, duration, team);
}

/*
	Name: incendiary_debug_line
	Namespace: namespace_ad7d66e9
	Checksum: 0x7AEBB9CD
	Offset: 0x21E0
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
	Namespace: namespace_ad7d66e9
	Checksum: 0x82100E0
	Offset: 0x22A0
	Size: 0x660
	Parameters: 10
	Flags: Linked
*/
function damageeffectarea(owner, position, normal, weapon, var_4dd46f8a, radius_multiplier, var_e76400c0, wallnormal, var_cbaaea69, damageendtime)
{
	level endon(#"game_ended");
	radius = var_4dd46f8a.var_6193a41b * radius_multiplier;
	height = var_4dd46f8a.var_cbd86f3e;
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
			firesound playloopsound(#"hash_524e5d248acb8f81");
		}
		level thread influencers::create_grenade_influencers((isdefined(position) ? position.team : undefined), weapon, fireeffectarea);
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
	originalteam = (isdefined(position) ? position.team : undefined);
	while(gettime() < damageendtime && (!isdefined(position) || position.team == originalteam))
	{
		damageapplied = 0;
		potential_targets = self getpotentialtargets(position, var_4dd46f8a);
		if(isdefined(position))
		{
			position.var_52dceca = [];
		}
		foreach(target in potential_targets)
		{
			self trytoapplyfiredamage(target, position, normal, fireeffectarea, var_289a74bc, weapon, var_4dd46f8a);
		}
		if(isdefined(position))
		{
			var_2d3611fa = position.var_52dceca.size;
			if(var_2d3611fa > 0 && burntime < gettime())
			{
				scoreevents::processscoreevent(#"hash_1343f5418bd52c6c", position, undefined, weapon, var_2d3611fa);
				burntime = gettime() + (int(var_4dd46f8a.var_5c06ec56 * 1000));
			}
			if(var_d0603aba)
			{
				var_9194a036 = battlechatter::mpdialog_value("molotovSuccessLineCount", 0);
				if(var_2d3611fa >= (isdefined(var_9194a036) ? var_9194a036 : 3))
				{
					position battlechatter::play_gadget_success(weapon);
				}
			}
			if(var_d0603aba)
			{
				var_d0603aba = 0;
			}
		}
		wait(var_4dd46f8a.var_90bd7d92);
	}
	arrayremovevalue(self.var_ebf0b1c9, undefined);
	foreach(target in self.var_ebf0b1c9)
	{
		target.var_84e41b20 = undefined;
		target status_effect::function_408158ef(level.var_71a63cb2, level.var_26472ea3);
	}
	if(isdefined(position))
	{
		position.var_52dceca = [];
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
	Name: stopfiresound
	Namespace: namespace_ad7d66e9
	Checksum: 0x48A0BD54
	Offset: 0x2908
	Size: 0x54
	Parameters: 0
	Flags: Linked
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
	Namespace: namespace_ad7d66e9
	Checksum: 0x4B173870
	Offset: 0x2968
	Size: 0x3BC
	Parameters: 10
	Flags: Linked
*/
function function_9464e4ad(owner, position, normal, weapon, var_4dd46f8a, radius_multiplier, var_e76400c0, wallnormal, var_cbaaea69, damageendtime)
{
	level endon(#"game_ended");
	radius = var_4dd46f8a.var_6193a41b * radius_multiplier;
	height = var_4dd46f8a.var_cbd86f3e;
	trigger_radius_position = normal - (0, 0, height);
	trigger_radius_height = height * 2;
	if(isdefined(var_e76400c0) && isdefined(wallnormal))
	{
		var_21f4217c = (var_e76400c0 + vectorscale(wallnormal, 12)) - (0, 0, var_cbaaea69);
		var_289a74bc = spawn("trigger_radius", var_21f4217c, 0, 12, var_cbaaea69);
	}
	if(radius >= 0.04)
	{
		fireeffectarea = spawn("trigger_radius", trigger_radius_position, 0, radius, trigger_radius_height);
	}
	self.var_ebf0b1c9 = [];
	self thread function_f8f4d9fc(damageendtime, position, normal, fireeffectarea, var_289a74bc, weapon, var_4dd46f8a);
	while(gettime() < damageendtime)
	{
		damageapplied = 0;
		potential_targets = self weapons::function_356292be(position, normal, radius);
		foreach(target in potential_targets)
		{
			if(!isdefined(target))
			{
				continue;
			}
			if(isactor(target))
			{
				continue;
			}
			self trytoapplyfiredamage(target, position, normal, fireeffectarea, var_289a74bc, weapon, var_4dd46f8a);
		}
		wait(var_4dd46f8a.var_8fbd03cb);
	}
	arrayremovevalue(self.var_ebf0b1c9, undefined);
	foreach(target in self.var_ebf0b1c9)
	{
		target.var_84e41b20 = undefined;
		target status_effect::function_408158ef(level.var_71a63cb2, level.var_26472ea3);
	}
	if(isdefined(position))
	{
		position globallogic_score::function_d3ca3608(#"hash_468ad9ee571cf1c6");
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
	Name: getpotentialtargets
	Namespace: namespace_ad7d66e9
	Checksum: 0x1424E64
	Offset: 0x2D30
	Size: 0x346
	Parameters: 2
	Flags: Linked
*/
function getpotentialtargets(owner, var_4dd46f8a)
{
	owner_team = (isdefined(owner) ? owner.team : undefined);
	if(level.teambased && isdefined(owner_team) && level.friendlyfire == 0)
	{
		potential_targets = [];
		foreach(team, _ in level.teams)
		{
			if(var_4dd46f8a.var_14e16318 === 1 || util::function_fbce7263(team, owner_team))
			{
				potential_targets = arraycombine(potential_targets, getplayers(team), 0, 0);
				continue;
			}
		}
		if(is_true(var_4dd46f8a.var_4e1d1f97))
		{
			if(!isdefined(potential_targets))
			{
				potential_targets = [];
			}
			else if(!isarray(potential_targets))
			{
				potential_targets = array(potential_targets);
			}
			if(!isinarray(potential_targets, owner))
			{
				potential_targets[potential_targets.size] = owner;
			}
		}
		return potential_targets;
	}
	all_targets = [];
	all_targets = arraycombine(all_targets, level.players, 0, 0);
	if(level.friendlyfire > 0)
	{
		return all_targets;
	}
	potential_targets = [];
	foreach(target in all_targets)
	{
		if(!isdefined(target))
		{
			continue;
		}
		if(!isdefined(target.team))
		{
			continue;
		}
		if(isdefined(owner))
		{
			if(target != owner)
			{
				if(!isdefined(owner_team))
				{
					continue;
				}
				if(!util::function_fbce7263(target.team, owner_team))
				{
					continue;
				}
			}
		}
		else
		{
			if(!isdefined(self))
			{
				continue;
			}
			if(!isdefined(self.team))
			{
				continue;
			}
			if(!util::function_fbce7263(target.team, self.team))
			{
				continue;
			}
		}
		potential_targets[potential_targets.size] = target;
	}
	return potential_targets;
}

/*
	Name: function_5a49ebd3
	Namespace: namespace_ad7d66e9
	Checksum: 0x12A8A32A
	Offset: 0x3080
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
	Name: trytoapplyfiredamage
	Namespace: namespace_ad7d66e9
	Checksum: 0x39CA25DF
	Offset: 0x31F0
	Size: 0x2E4
	Parameters: 7
	Flags: Linked
*/
function trytoapplyfiredamage(target, owner, position, fireeffectarea, var_289a74bc, weapon, var_4dd46f8a)
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
				target thread damageinfirearea(sourcepos, trace, position, weapon, var_4dd46f8a, owner);
				if(isdefined(owner) && util::function_fbce7263(target.team, owner.team))
				{
					owner.var_52dceca[targetentnum] = target;
				}
			}
			else
			{
				target thread function_37ddab3(sourcepos, trace, position, weapon, var_4dd46f8a, owner);
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
			target status_effect::function_408158ef(level.var_71a63cb2, level.var_26472ea3);
			self.var_ebf0b1c9[targetentnum] = undefined;
		}
		if(isdefined(owner))
		{
			owner.var_52dceca[targetentnum] = undefined;
		}
	}
}

/*
	Name: damageinfirearea
	Namespace: namespace_ad7d66e9
	Checksum: 0x49CBAA37
	Offset: 0x34E0
	Size: 0x18C
	Parameters: 6
	Flags: Linked
*/
function damageinfirearea(origin, trace, position, weapon, var_4dd46f8a, owner)
{
	self endon(#"death");
	timer = 0;
	if(candofiredamage(self, var_4dd46f8a.var_90bd7d92))
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
		var_4dd4e6ee = owner;
		if(!isdefined(self.var_84e41b20))
		{
			self.var_84e41b20 = [];
		}
		params = function_4d1e7b48(#"hash_69374f563cb01313");
		self status_effect::status_effect_apply(params, weapon, owner, 0, undefined, undefined, position);
		self.var_ae639436 = var_4dd4e6ee;
		self thread sndfiredamage();
	}
}

/*
	Name: function_f8f4d9fc
	Namespace: namespace_ad7d66e9
	Checksum: 0x17DCEF32
	Offset: 0x3678
	Size: 0x118
	Parameters: 7
	Flags: Linked
*/
function function_f8f4d9fc(damageendtime, owner, position, fireeffectarea, var_289a74bc, weapon, var_4dd46f8a)
{
	while(gettime() < damageendtime)
	{
		damageapplied = 0;
		potential_targets = getaiarray();
		foreach(target in potential_targets)
		{
			if(!isdefined(target))
			{
				continue;
			}
			self trytoapplyfiredamage(target, owner, position, fireeffectarea, var_289a74bc, weapon, var_4dd46f8a);
		}
		wait(var_4dd46f8a.var_4bf1fc1f);
	}
}

/*
	Name: function_37ddab3
	Namespace: namespace_ad7d66e9
	Checksum: 0xEDC05038
	Offset: 0x3798
	Size: 0x112
	Parameters: 6
	Flags: Linked
*/
function function_37ddab3(origin, trace, position, weapon, var_4dd46f8a, owner)
{
	self endon(#"death");
	timer = 0;
	if(candofiredamage(self, var_4dd46f8a.var_8fbd03cb))
	{
		var_4dd4e6ee = owner;
		if(!isdefined(self.var_84e41b20))
		{
			self.var_84e41b20 = [];
		}
		var_341dfe48 = int(var_4dd46f8a.var_4931651e * var_4dd46f8a.var_8fbd03cb);
		self dodamage(var_341dfe48, self.origin, owner, weapon, "none", "MOD_BURNED", 0, weapon);
		self.var_ae639436 = var_4dd4e6ee;
	}
}

/*
	Name: sndfiredamage
	Namespace: namespace_ad7d66e9
	Checksum: 0x17AEF257
	Offset: 0x38B8
	Size: 0x14E
	Parameters: 0
	Flags: Linked
*/
function sndfiredamage()
{
	self notify(#"sndfire");
	self endon(#"sndfire", #"death", #"disconnect");
	if(!isdefined(self.sndfireent))
	{
		self.sndfireent = spawn("script_origin", self.origin);
		self.sndfireent linkto(self, "tag_origin");
		self.sndfireent playsound(#"chr_burn_start");
		self thread sndfiredamage_deleteent(self.sndfireent);
	}
	self.sndfireent playloopsound(#"chr_burn_start_loop", 0.5);
	wait(3);
	if(isdefined(self.sndfireent))
	{
		self.sndfireent delete();
		self.sndfireent = undefined;
	}
}

/*
	Name: sndfiredamage_deleteent
	Namespace: namespace_ad7d66e9
	Checksum: 0x45688E4B
	Offset: 0x3A10
	Size: 0x4C
	Parameters: 1
	Flags: Linked
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
	Namespace: namespace_ad7d66e9
	Checksum: 0x92AF18EB
	Offset: 0x3A68
	Size: 0xE0
	Parameters: 3
	Flags: Linked
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
	Namespace: namespace_ad7d66e9
	Checksum: 0x4DEBC08B
	Offset: 0x3B50
	Size: 0x13C
	Parameters: 2
	Flags: Linked
*/
function candofiredamage(victim, resetfiretime)
{
	if(isplayer(victim) && victim depthofplayerinwater() >= 1)
	{
		return false;
	}
	in_vehicle = isplayer(victim) && victim isinvehicle();
	if(in_vehicle)
	{
		vehicle = victim getvehicleoccupied();
		if(is_true(vehicle.var_9a6644f2))
		{
			return false;
		}
	}
	entnum = victim getentitynumber();
	if(!isdefined(level.var_f217c587[entnum]))
	{
		level.var_f217c587[entnum] = 1;
		level thread resetfiredamage(entnum, resetfiretime);
		return true;
	}
	return false;
}

/*
	Name: resetfiredamage
	Namespace: namespace_ad7d66e9
	Checksum: 0xAB101D06
	Offset: 0x3C98
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function resetfiredamage(entnum, time)
{
	if(time > 0.05)
	{
		wait(time - 0.05);
	}
	level.var_f217c587[entnum] = undefined;
}

/*
	Name: function_1493c734
	Namespace: namespace_ad7d66e9
	Checksum: 0x84DC18F9
	Offset: 0x3CE0
	Size: 0xAC
	Parameters: 5
	Flags: Linked
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

