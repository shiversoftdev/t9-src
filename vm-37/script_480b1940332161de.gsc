#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\debug.gsc;

#namespace poi;

/*
	Name: function_89f2df9
	Namespace: poi
	Checksum: 0xD9BB09F5
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"poi", &function_f64316de, undefined, undefined, undefined);
}

/*
	Name: enable
	Namespace: poi
	Checksum: 0xC365C044
	Offset: 0x158
	Size: 0x4AE
	Parameters: 3
	Flags: None
*/
function enable(var_dc8b0c0d, var_90650979, doaim)
{
	/#
		assert(isactor(self));
	#/
	/#
		assert(var_dc8b0c0d === 1 || var_dc8b0c0d === 0, "");
	#/
	if(is_true(var_dc8b0c0d))
	{
		if(!isdefined(self.poi))
		{
			self.poi = {};
		}
	}
	else if(!isdefined(self.poi))
	{
		return;
	}
	if(!var_dc8b0c0d && (isdefined(self.poi.currentpoi.var_3b03815e) ? self.poi.currentpoi.var_3b03815e : 0) > gettime())
	{
		self ai::look_at(undefined, 3);
	}
	self.poi.currentpoi = undefined;
	self.poi.nextpoi = undefined;
	self.poi.doingpoi = var_dc8b0c0d;
	self.poi.doaim = doaim;
	if(!var_dc8b0c0d)
	{
		/#
			assert(isdefined(level.poi.activeai), "");
		#/
		arrayremovevalue(level.poi.activeai, self);
		self.turnrate = (isdefined(self.poi.poi_oldturnrate) ? self.poi.poi_oldturnrate : self.turnrate);
		self.gunadditiveoverride = undefined;
		self.gunposeoverride = undefined;
		if(isdefined(self.poi.auto))
		{
			self.poi = {#auto:self.poi.auto};
		}
		else
		{
			self.poi = undefined;
		}
		self notify(#"hash_540a2c03e6d27b24");
	}
	else
	{
		if(!isdefined(self.poi.var_1365068))
		{
			self.poi.var_1365068 = self function_359fd121();
		}
		var_67b78bf3 = function_f002dade("human", "fast");
		var_47658db3 = function_15a5703b("human", min(self.poi.var_1365068, var_67b78bf3));
		self function_2ce879d2(var_47658db3);
		if(!isdefined(level.poi.activeai))
		{
			level.poi.activeai = [];
		}
		if(!array::contains(level.poi.activeai, self))
		{
			level.poi.activeai[level.poi.activeai.size] = self;
		}
		if(isdefined(level.poi.fnfindcqbpointsofinterest))
		{
			level thread [[level.poi.fnfindcqbpointsofinterest]]();
		}
		/#
			assert(!isdefined(var_90650979) || isstruct(var_90650979));
		#/
		self.poi.poi_oldturnrate = self.turnrate;
		self.turnrate = 0.25;
		self.poi.leftaimlimit = 90;
		self.poi.rightaimlimit = -90;
		self.poi.poi_firstpoint = var_90650979;
		self.gunposeoverride = "disable";
		self notify(#"poi_enabled");
	}
}

/*
	Name: function_fc1d22bd
	Namespace: poi
	Checksum: 0xC50E64D3
	Offset: 0x610
	Size: 0x186
	Parameters: 6
	Flags: None
*/
function function_fc1d22bd(var_dc8b0c0d, yawmin, yawmax, pitchmin, pitchmax, doaim)
{
	var_dc8b0c0d = is_true(var_dc8b0c0d);
	if(var_dc8b0c0d && !isdefined(self.poi.auto))
	{
		self function_4d1af993(yawmin, yawmax, pitchmin, pitchmax, doaim);
		self thread function_c6ff2ee5();
		self notify(#"hash_4f88221ad3977829");
	}
	else if(!var_dc8b0c0d && isdefined(self.poi.auto))
	{
		self notify(#"hash_5ea869d8ad18e50b");
		self ai::look_at(self.poi.auto.angles, 3, 1, float(function_60d95f53()) / 1000, self.poi.auto.doaim, 1);
		self.poi.auto = undefined;
		self notify(#"hash_eb07a9b95814b4a");
	}
}

/*
	Name: function_f64316de
	Namespace: poi
	Checksum: 0x66983716
	Offset: 0x7A0
	Size: 0xDC
	Parameters: 0
	Flags: Private
*/
function private function_f64316de()
{
	level.poi = {};
	level.poi.var_1ee388be = [];
	level.poi.fnfindcqbpointsofinterest = &function_b31aaef9;
	level.poi.var_705e0648 = &enable;
	level.poi.var_38974483 = &function_fc1d22bd;
	/#
		function_5ac4dc99("", 0);
		function_cd140ee9("", &function_c30fad9a);
	#/
	thread function_4de58b23();
}

/*
	Name: function_4de58b23
	Namespace: poi
	Checksum: 0x8B8D18AE
	Offset: 0x888
	Size: 0x11A
	Parameters: 0
	Flags: Private
*/
function private function_4de58b23()
{
	waittillframeend();
	level.poi.var_1ee388be = struct::get_array("poi", "variantname");
	remove = [];
	foreach(poi in level.poi.var_1ee388be)
	{
		if(!is_true(poi.script_auto_use))
		{
			remove[remove.size] = poi;
		}
	}
	level.poi.var_1ee388be = array::exclude(level.poi.var_1ee388be, remove);
}

/*
	Name: function_b31aaef9
	Namespace: poi
	Checksum: 0x81E356E0
	Offset: 0x9B0
	Size: 0x3C4
	Parameters: 0
	Flags: Private
*/
function private function_b31aaef9()
{
	if(is_true(level.poi.alreadyfindingpoi))
	{
		return;
	}
	level.poi.alreadyfindingpoi = 1;
	waitframe(1);
	while(true)
	{
		if(!isarray(level.poi.activeai) || level.poi.activeai.size == 0)
		{
			level.poi.alreadyfindingpoi = undefined;
			return;
		}
		guystoremove = [];
		waited = 0;
		foreach(guy in level.poi.activeai)
		{
			if(isalive(guy) && is_true(guy.poi.doingpoi) && !guy is_combat())
			{
				poi = guy function_f3a2a643();
				if(isdefined(poi) && poi !== guy.poi.currentpoi)
				{
					now = gettime();
					guy.poi.poi_starttime = now;
					guy.poi.currentpoi = poi;
					doaim = (isdefined(poi.var_1eabcced) ? poi.var_1eabcced : self.poi.doaim);
					var_9ced4e21 = poi util::function_4b93f9c2();
					if((isdefined(var_9ced4e21) ? var_9ced4e21 : 0) == 0)
					{
						var_9ced4e21 = float(2000) / 1000;
					}
					guy.poi.currentpoi.var_3b03815e = now + (var_9ced4e21 * 1000);
					guy ai::look_at(poi.origin, 3, 1, var_9ced4e21, doaim);
					guy thread function_d0341c76(3, var_9ced4e21);
				}
				waitframe(1);
				waited = 1;
				continue;
			}
			guystoremove[guystoremove.size] = guy;
		}
		foreach(guy in guystoremove)
		{
			arrayremovevalue(level.poi.activeai, guy);
		}
		if(!waited)
		{
			wait(0.25);
		}
	}
}

/*
	Name: function_f3a2a643
	Namespace: poi
	Checksum: 0x977ADFDC
	Offset: 0xD80
	Size: 0x352
	Parameters: 0
	Flags: Private
*/
function private function_f3a2a643()
{
	ismoving = isdefined(self.pathgoalpos);
	var_df7a9e25 = isdefined(self.poi.currentpoi);
	if(!var_df7a9e25 && isdefined(self.poi.poi_firstpoint))
	{
		return function_aabc1f4c();
	}
	if(var_df7a9e25 && isdefined(self.poi.currentpoi.target) || isdefined(self.poi.nextpoi))
	{
		return function_75334336(var_df7a9e25);
	}
	self.poi.nextpoi = undefined;
	if(var_df7a9e25)
	{
		/#
			assert(isdefined(self.poi.poi_starttime));
		#/
		if(gettime() < self.poi.poi_starttime + 2000)
		{
			return self.poi.currentpoi;
		}
	}
	var_c2fb3093 = undefined;
	var_dea63fff = 1048576;
	foreach(var_a9af01c3 in level.poi.var_1ee388be)
	{
		var_970aced0 = float((isdefined(var_a9af01c3.var_715fc83d) ? var_a9af01c3.var_715fc83d : 0)) * 1000;
		if(var_970aced0 <= 0)
		{
			var_970aced0 = 5000;
		}
		if(isdefined(var_a9af01c3.var_3b03815e) && gettime() < (var_a9af01c3.var_3b03815e + var_970aced0))
		{
			continue;
		}
		poi = var_a9af01c3.origin;
		var_49277a4f = vectornormalize(poi - self.origin);
		var_6045790a = acos(vectordot(anglestoforward(self.angles), var_49277a4f));
		if(var_6045790a >= 50)
		{
			continue;
		}
		var_38a7325b = distance2d(self.origin, poi);
		if(var_38a7325b > var_dea63fff)
		{
			continue;
		}
		if(!sighttracepassed(self.origin, poi, 0, undefined))
		{
			continue;
		}
		var_c2fb3093 = var_a9af01c3;
		var_dea63fff = var_38a7325b;
	}
	return var_c2fb3093;
}

/*
	Name: function_aabc1f4c
	Namespace: poi
	Checksum: 0x399EBA30
	Offset: 0x10E0
	Size: 0xF2
	Parameters: 0
	Flags: Private
*/
function private function_aabc1f4c()
{
	/#
		assert(isdefined(self.poi.poi_firstpoint));
	#/
	if(sighttracepassed(self geteye(), self.poi.poi_firstpoint.origin, 0, undefined))
	{
		poi = self.poi.poi_firstpoint;
		if(isdefined(poi.target))
		{
			self.poi.nextpoi = struct::get(poi.target, "targetname");
		}
		if(function_a6d41d6e(poi))
		{
			return poi;
		}
		return undefined;
	}
	return undefined;
}

/*
	Name: function_75334336
	Namespace: poi
	Checksum: 0xB3330432
	Offset: 0x11E0
	Size: 0x346
	Parameters: 1
	Flags: Private
*/
function private function_75334336(var_df7a9e25)
{
	min_time = undefined;
	/#
		assert(var_df7a9e25 && isdefined(self.poi.currentpoi.target) || isdefined(self.poi.nextpoi));
	#/
	if(var_df7a9e25)
	{
		if(isdefined(self.poi.currentpoi.target))
		{
			self.poi.nextpoi = struct::get(self.poi.currentpoi.target, "targetname");
		}
		else
		{
			self.poi.nextpoi = undefined;
		}
	}
	if(isdefined(self.poi.poi_firstpoint))
	{
		self.poi.poi_firstpoint = undefined;
	}
	min_time = 2000;
	if(var_df7a9e25)
	{
		var_d78af89e = self.poi.currentpoi util::function_4b93f9c2();
		if(var_d78af89e > 0)
		{
			min_time = var_d78af89e;
		}
	}
	if(!isdefined(self.poi.nextpoi))
	{
		self notify(#"hash_1a7483ed1381776b");
		if(gettime() < (self.poi.poi_starttime + min_time) && function_a6d41d6e(self.poi.currentpoi))
		{
			return self.poi.currentpoi;
		}
		self enable(0);
		return undefined;
	}
	if(var_df7a9e25 && gettime() < (self.poi.poi_starttime + min_time) && function_a6d41d6e(self.poi.currentpoi))
	{
		return self.poi.currentpoi;
	}
	if(!sighttracepassed(self geteye(), self.poi.nextpoi.origin, 0, undefined))
	{
		return undefined;
	}
	if(!function_a6d41d6e(self.poi.nextpoi))
	{
		if(isdefined(self.poi.nextpoi.target))
		{
			self.poi.nextpoi = struct::get(self.poi.nextpoi.target, "targetname");
		}
		else
		{
			self enable(0);
		}
		return undefined;
	}
	return self.poi.nextpoi;
}

/*
	Name: function_a6d41d6e
	Namespace: poi
	Checksum: 0xC90C6ED3
	Offset: 0x1530
	Size: 0x100
	Parameters: 1
	Flags: Private
*/
function private function_a6d41d6e(poi)
{
	if(is_true(self.poi.poi_disablefov))
	{
		return 1;
	}
	/#
		assert(isdefined(poi));
	#/
	var_beabc994 = anglestoforward(self.angles);
	var_82b1379b = acos(vectordot(var_beabc994, vectornormalize(poi.origin - self geteye())));
	return var_82b1379b < (isdefined(self.poi.poi_fovlimit) ? self.poi.poi_fovlimit : 90);
}

/*
	Name: is_combat
	Namespace: poi
	Checksum: 0x90DD7A75
	Offset: 0x1638
	Size: 0x84
	Parameters: 0
	Flags: Private
*/
function private is_combat()
{
	/#
		assert(!isdefined(self) || isactor(self));
	#/
	if(isdefined(self.stealth) && level flag::get("stealth_spotted"))
	{
		return true;
	}
	if(isdefined(self.enemy))
	{
		return true;
	}
	return false;
}

/*
	Name: function_d0341c76
	Namespace: poi
	Checksum: 0x8770C499
	Offset: 0x16C8
	Size: 0xB4
	Parameters: 2
	Flags: Private
*/
function private function_d0341c76(priority, var_9ced4e21)
{
	self endon(#"death");
	result = undefined;
	result = self waittilltimeout(var_9ced4e21, #"stealth_attack", #"enemy");
	if(result._notify == "stealth_attack" || result._notify == "enemy")
	{
		self ai::look_at(undefined, priority, 1);
	}
}

/*
	Name: function_4d1af993
	Namespace: poi
	Checksum: 0xDA0804E7
	Offset: 0x1788
	Size: 0x11E
	Parameters: 5
	Flags: Private
*/
function private function_4d1af993(yawmin, yawmax, pitchmin, pitchmax, doaim)
{
	if(!isdefined(yawmin))
	{
		yawmin = 15;
	}
	if(!isdefined(yawmax))
	{
		yawmax = 35;
	}
	if(!isdefined(pitchmin))
	{
		pitchmin = -20;
	}
	if(!isdefined(pitchmax))
	{
		pitchmax = 0;
	}
	if(!isdefined(self.poi))
	{
		self.poi = {};
	}
	self.poi.auto = {};
	self.poi.auto.yawmax = yawmax;
	self.poi.auto.yawmin = yawmin;
	self.poi.auto.pitchmin = pitchmin;
	self.poi.auto.pitchmax = pitchmax;
	self.poi.auto.doaim = doaim;
}

/*
	Name: function_c6ff2ee5
	Namespace: poi
	Checksum: 0x71FFD693
	Offset: 0x18B0
	Size: 0x242
	Parameters: 0
	Flags: Private
*/
function private function_c6ff2ee5()
{
	self notify(#"hash_5ea869d8ad18e50b");
	self endon(#"hash_5ea869d8ad18e50b");
	self endon(#"death");
	var_796d6ecf = 500;
	var_b785492c = 0;
	var_8dfbd33c = 0;
	var_960224ae = gettime() + 30000;
	if(!isdefined(self.poi.auto))
	{
		self function_4d1af993();
	}
	/#
		self thread function_4c4e4ab0();
	#/
	while(true)
	{
		var_bed66f89 = 0;
		if(var_960224ae <= gettime())
		{
			self.poi.auto.angles = (0, 0, 0);
			if(var_960224ae == var_b785492c)
			{
				var_bed66f89 = 1;
			}
		}
		if(var_b785492c <= gettime())
		{
			var_960224ae = gettime() + (int(randomfloatrange(0.8, 1.8) * 1000));
			var_8dfbd33c = gettime();
			function_504eb38e(var_bed66f89);
			var_456b9fca = var_796d6ecf - gettime();
			var_33e79978 = var_960224ae - gettime();
			if((abs(var_33e79978 - var_456b9fca)) >= 550 && math::cointoss())
			{
				var_b785492c = var_960224ae;
			}
			else
			{
				if(var_456b9fca > 3000)
				{
					var_b785492c = gettime() + randomintrange(2000, 3000);
				}
				else
				{
					var_b785492c = ((gettime() + var_456b9fca) + 550) + randomintrange(1000, 2000);
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_34ed055a
	Namespace: poi
	Checksum: 0x848F3DD1
	Offset: 0x1B00
	Size: 0x96
	Parameters: 1
	Flags: Private
*/
function private function_34ed055a(angles)
{
	forward = anglestoforward(angles);
	var_553ec518 = rotatepoint(forward, self.angles);
	eye = self geteye();
	pos = eye + (var_553ec518 * 128);
	return pos;
}

/*
	Name: function_e019f08b
	Namespace: poi
	Checksum: 0xDC7ECCB3
	Offset: 0x1BA0
	Size: 0xCC
	Parameters: 0
	Flags: Private
*/
function private function_e019f08b()
{
	yaw = randomfloatrange(-45, 45);
	pitch = randomfloatrange(-20, 20);
	pos = function_34ed055a((pitch, yaw, 0));
	self.poi.auto.glancing = 1;
	self thread function_18a11ca3();
	self ai::look_at(pos, 3, 1, 0.55);
}

/*
	Name: function_18a11ca3
	Namespace: poi
	Checksum: 0xFDDAA4A6
	Offset: 0x1C78
	Size: 0x4A
	Parameters: 0
	Flags: Private
*/
function private function_18a11ca3()
{
	self notify(#"poiauto_glanceend");
	self endon(#"poiauto_glanceend");
	wait(0.55);
	self.poi.auto.glancing = 0;
}

/*
	Name: function_28f716d5
	Namespace: poi
	Checksum: 0x30C4E147
	Offset: 0x1CD0
	Size: 0x2A
	Parameters: 0
	Flags: Private
*/
function private function_28f716d5()
{
	return is_true(self.poi.auto.glancing);
}

/*
	Name: function_504eb38e
	Namespace: poi
	Checksum: 0xE8A8653E
	Offset: 0x1D08
	Size: 0x28C
	Parameters: 1
	Flags: Private
*/
function private function_504eb38e(var_bed66f89)
{
	if(var_bed66f89)
	{
		self.poi.auto.angles = self.poi.auto.nextangles;
		yaw = randomfloatrange(self.poi.auto.angles[1] + 5, self.poi.auto.angles[1] + 10);
		pitch = randomfloatrange(5, 10);
		if(math::cointoss())
		{
			pitch = pitch * -1;
		}
		pitch = self.poi.auto.angles[0] + pitch;
		if(math::cointoss())
		{
			yaw = yaw * -1;
		}
	}
	else
	{
		poiauto = self.poi.auto;
		yaw = randomfloatrange(poiauto.yawmin, poiauto.yawmax);
		pitch = randomfloatrange(poiauto.pitchmin, poiauto.pitchmax);
		if(math::cointoss())
		{
			yaw = yaw * -1;
		}
		self.poi.auto.angles = (pitch, yaw, 0);
	}
	self.poi.auto.nextangles = (pitch, yaw, 0);
	self.poi.auto.var_f0ada51b = randomintrange(100, 300) + gettime();
	self ai::look_at(self.poi.auto.angles, 3, 1, 0, self.poi.auto.doaim, 1);
}

/*
	Name: function_636d2b5d
	Namespace: poi
	Checksum: 0xC05E2D
	Offset: 0x1FA0
	Size: 0x1EA
	Parameters: 4
	Flags: Private
*/
function private function_636d2b5d(yawmax, yawmin, pitchmin, pitchmax)
{
	/#
		assert(isdefined(self.poi.auto));
	#/
	if(!isdefined(self.poi.auto.og_yawmax))
	{
		self.poi.auto.og_yawmax = self.poi.auto.yawmax;
	}
	if(!isdefined(self.poi.auto.og_yawmin))
	{
		self.poi.auto.og_yawmin = self.poi.auto.yawmin;
	}
	if(!isdefined(self.poi.auto.og_pitchmin))
	{
		self.poi.auto.og_pitchmin = self.poi.auto.pitchmin;
	}
	if(!isdefined(self.poi.auto.og_pitchmax))
	{
		self.poi.auto.og_pitchmax = self.poi.auto.pitchmax;
	}
	self.poi.auto.yawmax = yawmax;
	self.poi.auto.yawmin = yawmin;
	self.poi.auto.pitchmin = pitchmin;
	self.poi.auto.pitchmax = pitchmax;
}

/*
	Name: function_d60aa558
	Namespace: poi
	Checksum: 0x1083CEBD
	Offset: 0x2198
	Size: 0x182
	Parameters: 0
	Flags: Private
*/
function private function_d60aa558()
{
	/#
		assert(isdefined(self.poi.auto.og_yawmax));
	#/
	/#
		assert(isdefined(self.poi.auto.og_yawmin));
	#/
	/#
		assert(isdefined(self.poi.auto.og_pitchmin));
	#/
	/#
		assert(isdefined(self.poi.auto.og_pitchmax));
	#/
	self.poi.auto.yawmax = self.poi.auto.og_yawmax;
	self.poi.auto.yawmin = self.poi.auto.og_yawmin;
	self.poi.auto.pitchmin = self.poi.auto.og_pitchmin;
	self.poi.auto.pitchmax = self.poi.auto.og_pitchmax;
}

/*
	Name: function_c30fad9a
	Namespace: poi
	Checksum: 0x6654BFFF
	Offset: 0x2328
	Size: 0x94
	Parameters: 1
	Flags: Private
*/
function private function_c30fad9a(parms)
{
	/#
		level notify(#"hash_4821a87b2782d121");
		level.poi.debug = getdvarint(#"hash_1986594f14fcd987", 0);
		if(is_true(level.poi.debug))
		{
			level thread debug();
		}
	#/
}

/*
	Name: debug
	Namespace: poi
	Checksum: 0x6C4A699
	Offset: 0x23C8
	Size: 0x32A
	Parameters: 0
	Flags: Private
*/
function private debug()
{
	/#
		self notify(#"hash_4821a87b2782d121");
		self endon(#"hash_4821a87b2782d121");
		var_3b1af2ae = struct::get_array("", "");
		while(true)
		{
			if(isdefined(level.poi.activeai))
			{
				foreach(ai in level.poi.activeai)
				{
					if(isdefined(ai.poi.currentpoi) && gettime() < (isdefined(ai.poi.currentpoi.var_3b03815e) ? ai.poi.currentpoi.var_3b03815e : gettime() + (float(function_60d95f53()) / 1000)))
					{
						line(ai geteye(), ai.poi.currentpoi.origin, (0, 0, 1), 1, 0, 1);
						continue;
					}
					if(isdefined(ai.poi.nextpoi))
					{
						line(ai geteye(), ai.poi.nextpoi.origin, (1, 0, 0), 1, 0, 1);
						continue;
					}
					if(isdefined(ai.poi.poi_firstpoint))
					{
						line(ai geteye(), ai.poi.poi_firstpoint.origin, (1, 0, 0), 1, 0, 1);
					}
				}
			}
			foreach(poi in var_3b1af2ae)
			{
				function_9c52ce45(poi);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_4c4e4ab0
	Namespace: poi
	Checksum: 0xFECCC95A
	Offset: 0x2700
	Size: 0x126
	Parameters: 0
	Flags: Private
*/
function private function_4c4e4ab0()
{
	/#
		while(true)
		{
			if(is_true(level.poi.debug) && isdefined(self.poi.auto.angles))
			{
				var_65cfde26 = anglestoforward(self.poi.auto.angles);
				var_582b05a9 = rotatepoint(var_65cfde26, angleclamp180(self.angles));
				line(self geteye(), self geteye() + (var_582b05a9 * 50), (1, 0.5, 0), 1, 0, 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_9c52ce45
	Namespace: poi
	Checksum: 0xE407CD09
	Offset: 0x2830
	Size: 0x68C
	Parameters: 1
	Flags: Private
*/
function private function_9c52ce45(poi)
{
	/#
		hs = 4;
		color = (0, 0, 1);
		text = "";
		auto = 1;
		if(!is_true(poi.script_auto_use))
		{
			hs = 2;
			color = vectorscale((1, 1, 1), 0.2);
			text = "";
			auto = 0;
		}
		var_711c17c1 = float((isdefined(poi.var_715fc83d) ? poi.var_715fc83d : 0)) * 1000;
		if(var_711c17c1 <= 0)
		{
			var_711c17c1 = 2000;
		}
		visible = 0;
		prev = undefined;
		next = undefined;
		if(isdefined(poi.target))
		{
			next = struct::get(poi.target, "");
		}
		if(isdefined(poi.targetname))
		{
			prev = struct::get(poi.targetname, "");
		}
		if(auto && isdefined(poi.var_3b03815e) && gettime() < (poi.var_3b03815e + var_711c17c1))
		{
			print3d(poi.origin, "" + ((float((poi.var_3b03815e + var_711c17c1) - gettime())) / 1000), vectorscale((1, 1, 1), 0.2), 1, 0.25, 1);
		}
		else
		{
			line(poi.origin + (0, 0, hs), poi.origin + (0, 0, hs * -1), color, 1, 1, 1);
			line(poi.origin + (0, hs, 0), poi.origin + (0, hs * -1, 0), color, 1, 1, 1);
			line(poi.origin + (hs, 0, 0), poi.origin + (hs * -1, 0, 0), color, 1, 1, 1);
			time = "" + (float(2000) / 1000);
			waittime = poi util::function_4b93f9c2();
			if(waittime > 0)
			{
				time = "";
				if(isdefined(poi.script_wait))
				{
					time = time + float(poi.script_wait);
				}
				if(isdefined(poi.script_wait_min) || isdefined(poi.script_wait_min))
				{
					if(time.size > 0)
					{
						time = time + "";
					}
					time = time + (isdefined(poi.script_wait_min) ? poi.script_wait_min : 0);
					if(isdefined(poi.script_wait_max) && float(poi.script_wait_max) > float((isdefined(poi.script_wait_min) ? poi.script_wait_min : 0)))
					{
						time = (time + "") + poi.script_wait_max;
					}
				}
			}
			if(auto)
			{
				time = (time + "") + (float((isdefined(poi.var_715fc83d) ? poi.var_715fc83d : 0)) > 0 ? float(poi.var_715fc83d) : float(5000) / 1000);
			}
			print3d(poi.origin + vectorscale((0, 0, 1), 5), text, color, 1, 0.25, 1, 1);
			print3d(poi.origin + (vectorscale((0, 0, -1), 10)), time, color, 1, 0.25, 1, 1);
			visible = 1;
		}
		if(isdefined(next) && (gettime() < (isdefined(poi.var_3b03815e) ? poi.var_3b03815e : 0) || visible))
		{
			line(poi.origin, next.origin, vectorscale((1, 1, 1), 0.5), 0.5, 1, 1);
			debug::drawarrow(vectorlerp(poi.origin, next.origin, 0.1), vectortoangles(next.origin - poi.origin), vectorscale((1, 1, 1), 0.5), 0, 10, 0);
		}
	#/
}

