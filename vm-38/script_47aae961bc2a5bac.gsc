#using script_1cd690a97dfca36e;
#using script_28e27ee9b45fd02d;
#using script_31671175564a93b7;
#using scripts\core_common\util_shared.csc;

#namespace namespace_db9ff804;

/*
	Name: function_629c5d3b
	Namespace: namespace_db9ff804
	Checksum: 0xC63B36E9
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_629c5d3b()
{
	level notify(1077764833);
}

#namespace snd;

/*
	Name: function_ce893a25
	Namespace: snd
	Checksum: 0x5CE7CB1D
	Offset: 0xA0
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function function_ce893a25()
{
	/#
		level thread function_926b63ee();
		level thread function_222f3594();
		dvar("", "", &function_29bb1234);
		dvar("", "", &function_53489ad);
		dvar("", "", &function_3261cc72);
		dvar("", "", &function_1dddb5c2);
	#/
}

/*
	Name: function_1c3e68dd
	Namespace: snd
	Checksum: 0xFED6E4FA
	Offset: 0x1A0
	Size: 0xB2
	Parameters: 1
	Flags: Private
*/
function private function_1c3e68dd(linenum)
{
	/#
		var_d63a89fd = level.var_17e6189d._debug.hud_y;
		var_1790a507 = function_827811b5();
		var_38c41a5e = var_1790a507[0];
		var_c13d121d = var_1790a507[1];
		if(var_d63a89fd < 0)
		{
			var_d63a89fd = var_c13d121d + var_d63a89fd;
		}
		posy = var_d63a89fd + (31.99999 * linenum);
		return posy;
	#/
}

/*
	Name: function_d34c1a24
	Namespace: snd
	Checksum: 0xBDF678F7
	Offset: 0x260
	Size: 0x11C
	Parameters: 4
	Flags: Private
*/
function private function_d34c1a24(xoffset, linenum, text, color)
{
	/#
		var_7ab7d2f1 = level.var_17e6189d._debug.hud_x;
		var_1790a507 = function_827811b5();
		var_38c41a5e = var_1790a507[0];
		var_c13d121d = var_1790a507[1];
		if(isdefined(color) == 0)
		{
			color = (1, 1, 1);
		}
		if(var_7ab7d2f1 < 0)
		{
			var_7ab7d2f1 = var_38c41a5e + var_7ab7d2f1;
		}
		function_65bb0ccd(text, var_7ab7d2f1 + xoffset, function_1c3e68dd(linenum), 1.333333, "", color, 0.8542482, (0, 0, 0), 0.72974, (1, 1, 1), 0.72974);
	#/
}

/*
	Name: function_43c85ce2
	Namespace: snd
	Checksum: 0x762C5A5C
	Offset: 0x388
	Size: 0xD8
	Parameters: 0
	Flags: Private
*/
function private function_43c85ce2()
{
	/#
		origin = undefined;
		if(isdefined(self.origin) == 1)
		{
			origin = self.origin;
		}
		if(isdefined(self.v) == 1)
		{
			origin = self.v[#"origin"];
			self.origin = origin;
			self.var_3f03e75e = 1;
		}
		if(function_3132f113(self) == 1)
		{
			return undefined;
		}
		/#
			assert(isvec(origin) == 1);
		#/
		return origin;
	#/
}

/*
	Name: function_cb457f5b
	Namespace: snd
	Checksum: 0xB49542DE
	Offset: 0x470
	Size: 0xD8
	Parameters: 0
	Flags: Private
*/
function private function_cb457f5b()
{
	/#
		angles = undefined;
		if(isdefined(self.angles) == 1)
		{
			angles = self.angles;
		}
		if(isdefined(self.v) == 1)
		{
			angles = self.v[#"angles"];
			self.angles = angles;
			self.var_45dbf7c9 = 1;
		}
		if(function_3132f113(self) == 1)
		{
			return undefined;
		}
		/#
			assert(isvec(angles) == 1);
		#/
		return angles;
	#/
}

/*
	Name: function_738e0260
	Namespace: snd
	Checksum: 0x47945ECB
	Offset: 0x558
	Size: 0x96
	Parameters: 0
	Flags: Private
*/
function private function_738e0260()
{
	/#
		soundalias = "";
		if(isdefined(self.v) == 1 && isdefined(self.v[#"soundalias"]) == 1)
		{
			soundalias = self.v[#"soundalias"];
		}
		else if(isdefined(self.soundalias) == 1)
		{
			soundalias = self.soundalias;
		}
		return soundalias;
	#/
}

/*
	Name: function_7814c6ed
	Namespace: snd
	Checksum: 0xAFFD7506
	Offset: 0x5F8
	Size: 0x30A
	Parameters: 5
	Flags: Private
*/
function private function_7814c6ed(player, playerview, playerangles, cosfov, maxdistance)
{
	/#
		var_1e686756 = level.var_17e6189d._debug.filter;
		soundalias = self function_738e0260();
		origin = undefined;
		/#
			assert(isdefined(soundalias) == 1);
		#/
		var_688ce44d = function_c41f829d(soundalias);
		if(isdefined(var_688ce44d) && var_688ce44d == 0)
		{
			return -1;
		}
		if(isdefined(var_1e686756) == 1 && var_1e686756 != "")
		{
			if(issubstr(soundalias, var_1e686756) == 0)
			{
				return -1;
			}
		}
		origin = self function_43c85ce2();
		if(isdefined(origin) == 0)
		{
			return -1;
		}
		deltapos = origin - playerview;
		normal = vectornormalize(deltapos);
		playerforward = anglestoforward(playerangles);
		dot = vectordot(playerforward, normal);
		iswithinfov = dot >= cosfov;
		var_25f190e = level.var_17e6189d._debug.dot;
		if(isdefined(player.var_6d42228d) && player.var_6d42228d == self && isdefined(player.var_c84d8d23) && player.var_c84d8d23 != dot)
		{
			player.var_c84d8d23 = dot;
			player.var_6d42228d = undefined;
		}
		if(dot > var_25f190e && (!isdefined(player.var_c84d8d23) || dot > player.var_c84d8d23))
		{
			player.var_c84d8d23 = dot;
			player.var_6d42228d = self;
		}
		if(iswithinfov == 0)
		{
			return -1;
		}
		dist = distance(playerview, origin);
		if(dist < 1)
		{
			return -1;
		}
		if(maxdistance > 0 && maxdistance < dist)
		{
			return -1;
		}
		return dist;
	#/
}

/*
	Name: function_a3b46281
	Namespace: snd
	Checksum: 0xC95053AD
	Offset: 0x910
	Size: 0x214
	Parameters: 7
	Flags: Private
*/
function private function_a3b46281(var_22a4e6a0, array, player, playerview, playerangles, cosfov, maxdistance)
{
	/#
		playerforward = anglestoforward(cosfov);
		playerfov = playerview function_731299e5();
		visible = [];
		/#
			assert(isarray(array));
		#/
		if(isarray(player) && player.size > 0)
		{
			visible = function_ada64c98(player, playerangles, playerforward, playerfov, maxdistance);
			array = arraycombine(array, visible, 0);
		}
		var_1e686756 = level.var_17e6189d._debug.filter;
		if(isdefined(var_1e686756) == 1 && var_1e686756 != "")
		{
			foreach(ent in array)
			{
				soundalias = ent function_738e0260();
				if(issubstr(soundalias, var_1e686756))
				{
					arrayremovevalue(array, ent);
				}
			}
		}
		return array;
	#/
}

/*
	Name: function_9386ad03
	Namespace: snd
	Checksum: 0x5E610F9
	Offset: 0xB30
	Size: 0x1EA
	Parameters: 2
	Flags: Private
*/
function private function_9386ad03(player, var_977d0bf3)
{
	/#
		maxdistance = level.var_17e6189d._debug.distance_max;
		maxdistance = (maxdistance <= 0 ? 262144 : maxdistance);
		var_22a4e6a0 = [];
		/#
			assert(isdefined(player) == 1);
		#/
		/#
			assert(isdefined(var_977d0bf3) == 1);
		#/
		playerview = player function_efda2d6d();
		playerangles = player function_3d31768f();
		fov = player function_731299e5();
		cosfov = cos(fov);
		if(isdefined(level.var_b7d2deb) == 1 && var_977d0bf3 >= 3)
		{
			var_22a4e6a0 = function_a3b46281(var_22a4e6a0, level.var_b7d2deb, player, playerview, playerangles, cosfov, maxdistance);
		}
		if(isdefined(level.var_17e6189d) == 1 && isdefined(level.var_17e6189d.var_3cc765a3) == 1)
		{
			var_22a4e6a0 = function_a3b46281(var_22a4e6a0, level.var_17e6189d.var_3cc765a3, player, playerview, playerangles, cosfov, maxdistance);
		}
		return var_22a4e6a0;
	#/
}

/*
	Name: function_bf58f58b
	Namespace: snd
	Checksum: 0x6F35644C
	Offset: 0xD28
	Size: 0x384
	Parameters: 0
	Flags: Private
*/
function private function_bf58f58b()
{
	/#
		origin = self function_43c85ce2();
		angles = self function_cb457f5b();
		soundalias = self function_738e0260();
		var_3c7a802b = level.var_17e6189d._debug.var_2e1c6bb5;
		radius = var_3c7a802b;
		var_6d59b8a9 = 0;
		angle = undefined;
		if(isdefined(self.angles) == 1)
		{
			angles = self.angles;
		}
		if(soundalias != "")
		{
			angle = function_9119c373(soundalias, "");
			dist_min = function_7139f5ae(soundalias, "");
			if(isdefined(dist_min) == 1 && dist_min > 0)
			{
				radius = dist_min;
			}
			else
			{
				var_6d59b8a9 = 1;
			}
		}
		var_e3eb0c85 = 0;
		foreach(player in function_2b2b83dc())
		{
			playerview = player function_efda2d6d();
			var_e3eb0c85 = function_c8caaab4(playerview, origin, radius);
			if(var_e3eb0c85 == 1)
			{
				radius = var_3c7a802b;
				break;
			}
		}
		colorscale = level.var_17e6189d._debug.var_2d81109e;
		color = vectorscale((1, 1, 1), colorscale);
		var_63d57cb2 = 0.72974;
		if(isdefined(angle) && angle > 0)
		{
			var_3a6a1553 = radius * 0.5;
			var_375e8be6 = 2 + ((radius * 2) - var_3a6a1553);
			function_8aaa798e(origin, angles, var_375e8be6, var_3a6a1553, (1, 1, 1), var_63d57cb2);
		}
		function_81183b3(origin, radius * 2, angles, (1, 1, 1), var_63d57cb2);
		if(var_e3eb0c85 == 1 || var_6d59b8a9 == 1)
		{
			cube(origin, angles, radius, color, var_63d57cb2, 0, 1);
		}
		else
		{
			function_b95b9a60(origin, radius, color, var_63d57cb2, 0, 1);
		}
	#/
}

/*
	Name: function_17547f34
	Namespace: snd
	Checksum: 0xD61084E0
	Offset: 0x10B8
	Size: 0x1E8
	Parameters: 3
	Flags: Private
*/
function private function_17547f34(player, var_22a4e6a0, var_977d0bf3)
{
	/#
		if(isdefined(var_22a4e6a0.var_6d42228d))
		{
			return var_22a4e6a0.var_6d42228d;
		}
		crosshairradius = level.var_17e6189d._debug.var_4b824b64;
		fov = var_22a4e6a0 function_731299e5();
		playerview = var_22a4e6a0 function_efda2d6d();
		playerangles = var_22a4e6a0 function_3d31768f();
		playerforward = anglestoforward(playerangles);
		var_25f190e = level.var_17e6189d._debug.dot;
		var_f45e7cd0 = 0;
		var_2ae8ee02 = undefined;
		var_574dfdc3 = function_9ade037c(playerview, playerforward, var_977d0bf3);
		if(isdefined(var_574dfdc3))
		{
			origin = var_574dfdc3 function_43c85ce2();
			deltapos = origin - playerview;
			normal = vectornormalize(deltapos);
			dot = vectordot(playerforward, normal);
			if(dot > var_25f190e && dot > var_f45e7cd0)
			{
				var_f45e7cd0 = dot;
				var_2ae8ee02 = var_574dfdc3;
			}
		}
		return var_2ae8ee02;
	#/
}

/*
	Name: function_b78b1ab1
	Namespace: snd
	Checksum: 0xB55CE21C
	Offset: 0x12B0
	Size: 0x614
	Parameters: 2
	Flags: Private
*/
function private function_b78b1ab1(player, var_977d0bf3)
{
	/#
		var_57cfcf52 = level.var_17e6189d._debug.var_87b166bf;
		colorscale = level.var_17e6189d._debug.var_2d81109e;
		var_ff7397dc = function_2677a7e2(var_57cfcf52, colorscale * 10);
		fov = var_977d0bf3 function_731299e5();
		origin = self function_43c85ce2();
		soundalias = self function_738e0260();
		radiusmin = "";
		radiusmax = "";
		/#
			assert(isdefined(var_977d0bf3) == 1);
		#/
		playerview = var_977d0bf3 function_efda2d6d();
		playerangles = var_977d0bf3 function_3d31768f();
		var_a82b48d6 = anglestoright(playerangles);
		if(soundalias != "")
		{
			dist_min = function_7139f5ae(soundalias, "");
			dist_max = function_10120598(soundalias, "");
			if(isdefined(dist_min) == 1 && dist_min > 0)
			{
				radiusmin = dist_min;
			}
			if(isdefined(dist_max) == 1 && dist_max > 0)
			{
				radiusmax = dist_max;
			}
		}
		if(isdefined(soundalias) == 1)
		{
			var_c75cd11f = level.var_17e6189d._debug.var_29cb2b81;
			dist = distance(origin, playerview);
			alpha = 1;
			var_8b9208e = alpha * alpha;
			if(isnumber(radiusmin) == 1 && radiusmin > 0 && isnumber(radiusmax) == 1 && radiusmax > 0)
			{
				var_72d23dae = 0;
				if(radiusmin == radiusmax)
				{
					var_72d23dae = 0.001;
				}
				mapfloat(radiusmin, radiusmax + var_72d23dae, 1, 0.5, dist);
			}
			var_7295dcac = dist * 0.001333333;
			function_ac033c46(soundalias, origin + (0, 0, -1.666 * var_7295dcac * var_c75cd11f * 24), -1.666 * var_c75cd11f, "", var_ff7397dc, alpha, (0, 0, 0), var_8b9208e, (1, 1, 1), var_8b9208e, 1);
			var_69ea3b2c = "";
			if(is_true(level.var_17e6189d.var_2dd09170))
			{
				var_69ea3b2c = "";
			}
			if(is_true(level.var_17e6189d.var_8c37ff34))
			{
				var_69ea3b2c = "";
			}
			var_69ea3b2c = var_69ea3b2c + ((("" + function_d6053a8f(radiusmin)) + "") + function_d6053a8f(dist) + "") + function_d6053a8f(radiusmax);
			function_ac033c46(var_69ea3b2c, origin + (0, 0, -2.666 * var_7295dcac * var_c75cd11f * 24), -1.333 * var_c75cd11f, "", var_ff7397dc, alpha, (0, 0, 0), var_8b9208e, (1, 1, 1), var_8b9208e, 1);
		}
		if(isdefined(radiusmax) == 1 && isnumber(radiusmax) == 1 && radiusmax > 0)
		{
			color = vectorscale(var_ff7397dc, 1);
			var_63d57cb2 = 1;
			angles = self function_cb457f5b();
			function_81183b3(origin, radiusmax * 2, angles, color, var_63d57cb2);
			function_b95b9a60(origin, radiusmax, vectorscale(var_ff7397dc, 0.72974), var_63d57cb2, 0, 1);
		}
	#/
}

/*
	Name: function_c5ac5c05
	Namespace: snd
	Checksum: 0xE7C8EBBD
	Offset: 0x18D0
	Size: 0x4B2
	Parameters: 1
	Flags: Private
*/
function private function_c5ac5c05(var_977d0bf3)
{
	/#
		if(var_977d0bf3 <= 1)
		{
			return;
		}
		players = function_2b2b83dc();
		if(!isarray(level.var_dbe59aee))
		{
			level.var_dbe59aee = [];
		}
		foreach(player in players)
		{
			var_a9d76ab3 = [];
			var_a9d76ab3 = function_9386ad03(player, var_977d0bf3);
			level.var_dbe59aee = arraycombine(level.var_dbe59aee, var_a9d76ab3, 0);
		}
		var_6c5d4613 = level.var_17e6189d._debug.var_797d43c2;
		var_82d451c6 = 0;
		if(level.var_dbe59aee.size >= var_6c5d4613)
		{
			var_d8515b45 = [];
			foreach(player in players)
			{
				var_d8515b45[var_d8515b45.size] = player function_efda2d6d();
			}
			var_2ccfcb0e = function_154caeff(var_d8515b45);
			level.var_dbe59aee = arraysortclosest(level.var_dbe59aee, var_2ccfcb0e);
			foreach(ent in level.var_dbe59aee)
			{
				if(isdefined(ent.var_3f03e75e) == 1)
				{
					ent.origin = undefined;
					ent.var_3f03e75e = undefined;
				}
			}
		}
		foreach(var_574dfdc3 in level.var_dbe59aee)
		{
			if(var_6c5d4613 > 0 && var_82d451c6 >= var_6c5d4613)
			{
				function_d34c1a24(520, 2, ("" + var_6c5d4613) + "", (1, 0, 0));
				break;
			}
			var_574dfdc3 function_bf58f58b();
			var_82d451c6 = var_82d451c6 + 1;
		}
		var_a91b3615 = [];
		foreach(player in players)
		{
			var_e70b966c = function_17547f34(player, level.var_dbe59aee, var_977d0bf3);
			if(isdefined(var_a91b3615) == 1 && isdefined(var_e70b966c) == 1)
			{
				var_e70b966c function_b78b1ab1(player, var_977d0bf3);
				var_a91b3615[var_a91b3615.size] = var_e70b966c;
				var_82d451c6 = var_82d451c6 + 1;
			}
		}
	#/
}

/*
	Name: function_3d58f598
	Namespace: snd
	Checksum: 0xE355FB4
	Offset: 0x1D90
	Size: 0x638
	Parameters: 1
	Flags: Private
*/
function private function_3d58f598(var_977d0bf3)
{
	/#
		var_1e686756 = level.var_17e6189d._debug.filter;
		var_56ac818e = 0;
		var_da38b6bb = 0;
		var_a00ac395 = 0;
		var_52e339ad = "";
		var_89cff76c = "";
		var_a91ca488 = 0;
		if(isdefined(level.var_b7d2deb) == 1)
		{
			/#
				assert(isdefined(level.var_c8afcee6) == 1);
			#/
			/#
				assert(isdefined(level.var_eb0e2b51) == 1);
			#/
			var_56ac818e = level.var_c8afcee6;
			var_da38b6bb = level.var_eb0e2b51;
		}
		if(isdefined(level.var_17e6189d) == 1 && isdefined(level.var_17e6189d.var_3cc765a3) == 1)
		{
			var_a00ac395 = level.var_17e6189d.var_3cc765a3.size;
		}
		if(isdefined(level.var_dbe59aee) == 1 && level.var_dbe59aee.size > 0 && var_977d0bf3 >= 3)
		{
			var_52e339ad = var_52e339ad + (("" + level.var_dbe59aee.size) + "");
		}
		if(isdefined(var_1e686756) == 1 && var_1e686756 != "")
		{
			var_89cff76c = var_89cff76c + (("" + var_1e686756) + "");
		}
		if(isdefined(level.var_ba9b4ed) == 1)
		{
			var_a91ca488 = level.var_ba9b4ed.size;
		}
		row = -4;
		if(is_true(level.var_17e6189d.var_2dd09170))
		{
			mapname = tolower(getdvarstring(#"hash_3b7b241b78207c96"));
			mapname = function_8cb4e540(mapname, 24);
			function_d34c1a24(0, row, mapname);
		}
		row = -3;
		if(is_true(level.var_17e6189d.var_8c37ff34))
		{
			skipto = function_bdd32fcc();
			if(skipto == "")
			{
				skipto = "";
			}
			skipto = function_8cb4e540(skipto, 24);
			function_d34c1a24(0, row, skipto);
		}
		row = -2;
		if(is_true(level.var_17e6189d.var_8c37ff34))
		{
			player = function_2b2b83dc()[0];
			trigger = player.var_9a8a4923;
			trigger_name = function_ea2f17d1(trigger.script_ambientroom, "");
			trigger_name = function_8cb4e540(trigger_name, 24);
			function_d34c1a24(0, row, trigger_name);
		}
		row = 0;
		if(is_true(level.var_17e6189d.var_2dd09170))
		{
			function_d34c1a24(0, row, "" + var_a00ac395);
			return;
		}
		row++;
		if(is_true(level.var_17e6189d.var_8c37ff34))
		{
			function_d34c1a24(0, row, "" + var_a00ac395);
		}
		row++;
		function_d34c1a24(0, row, "" + var_a91ca488);
		row++;
		if(var_977d0bf3 >= 3)
		{
			function_d34c1a24(0, row, "" + var_56ac818e);
			row++;
			function_d34c1a24(0, row, "" + var_da38b6bb);
			row++;
			var_7661af9a = "";
			if(isdefined(level.var_dbe59aee) == 1 && level.var_dbe59aee.size > 0)
			{
				var_7661af9a = var_7661af9a + level.var_dbe59aee.size;
			}
			else
			{
				var_7661af9a = var_7661af9a + "";
			}
			if(isdefined(var_1e686756) == 1 && var_1e686756 != "")
			{
				var_7661af9a = var_7661af9a + (("" + var_89cff76c) + "");
			}
			function_d34c1a24(0, row, "" + var_7661af9a);
			row++;
		}
	#/
}

/*
	Name: function_94f79425
	Namespace: snd
	Checksum: 0x2E5EA95C
	Offset: 0x23D0
	Size: 0x224
	Parameters: 1
	Flags: Private
*/
function private function_94f79425(var_977d0bf3)
{
	/#
		if(isdefined(var_977d0bf3) == 1 && var_977d0bf3 < 1)
		{
			return;
		}
		if(getdvar(#"createfx", "") != "")
		{
			if(isdefined(level.var_b7d2deb) == 1 && level.var_b7d2deb.size > 0)
			{
				return;
			}
		}
		else
		{
			while(isdefined(level.createfx) == 0)
			{
				waitframe(1);
			}
		}
		while(isdefined(level.createfxent) == 0)
		{
			waitframe(1);
		}
		level.var_b7d2deb = [];
		level.var_c8afcee6 = 0;
		level.var_eb0e2b51 = 0;
		foreach(ent in level.createfxent)
		{
			if(isdefined(ent.v[#"type"]) == 0)
			{
				continue;
			}
			if(ent.v[#"type"] == "")
			{
				level.var_c8afcee6++;
				level.var_b7d2deb[level.var_b7d2deb.size] = ent;
			}
			if(ent.v[#"type"] == "")
			{
				level.var_eb0e2b51++;
				level.var_b7d2deb[level.var_b7d2deb.size] = ent;
			}
		}
	#/
}

/*
	Name: function_fcbbe789
	Namespace: snd
	Checksum: 0xC7B0C601
	Offset: 0x2600
	Size: 0x5A2
	Parameters: 2
	Flags: Private
*/
function private function_fcbbe789(key, value)
{
	/#
		var_76519319 = function_7a600918(key) || isstring(key);
		var_9cb80f5f = isdefined(value);
		if(function_81fac19d(!var_76519319, ""))
		{
			return;
		}
		if(function_81fac19d(!var_9cb80f5f, ""))
		{
			return;
		}
		switch(key)
		{
			default:
			{
				break;
			}
			case "hash_7bf92664f192f2a2":
			case "hash_7bf92664f192f2a2":
			{
				level.var_17e6189d._debug.debuglevel = int(value);
				break;
			}
			case "hash_7f77282fd4f2f35c":
			case "hash_7f77282fd4f2f35c":
			{
				level.var_17e6189d._debug.filter = "" + value;
				break;
			}
			case "hash_52bc4ee11d186c55":
			case "hash_52bc4ee11d186c55":
			{
				level.var_17e6189d._debug.hud_x = int(value);
				break;
			}
			case "hash_52bc4de11d186aa2":
			case "hash_52bc4de11d186aa2":
			{
				level.var_17e6189d._debug.hud_y = int(value);
				break;
			}
			case "hash_4b427a4d65f4f4b0":
			case "hash_4b427a4d65f4f4b0":
			{
				level.var_17e6189d._debug.var_2e1c6bb5 = int(value);
				break;
			}
			case "hash_182296346d138cf8":
			case "hash_182296346d138cf8":
			{
				level.var_17e6189d._debug.var_29cb2b81 = float(value);
				break;
			}
			case "hash_3b9f89c8082a9915":
			case "hash_3b9f89c8082a9915":
			{
				if(isstring(value))
				{
				}
				else if(isvec(value))
				{
					level.var_17e6189d._debug.var_87b166bf = value;
				}
				break;
			}
			case "hash_3944b771315157c1":
			case "hash_3944b771315157c1":
			{
				level.var_17e6189d._debug.var_2d81109e = float(value);
				break;
			}
			case "hash_28da12ba1bad355a":
			case "hash_28da12ba1bad355a":
			{
				level.var_17e6189d._debug.var_2751db2e = int(value);
				break;
			}
			case "hash_7fb5d688966509c9":
			case "hash_7fb5d688966509c9":
			{
				level.var_17e6189d._debug.distance_max = int(value);
				break;
			}
			case "hash_4a9b448151bd0fa9":
			case "hash_4a9b448151bd0fa9":
			{
				level.var_17e6189d._debug.dot = float(value);
				break;
			}
			case "hash_579325eaa87b4d2f":
			case "hash_579325eaa87b4d2f":
			{
				level.var_17e6189d._debug.var_797d43c2 = int(value);
				break;
			}
			case "hash_35a6f662245752fa":
			case "hash_35a6f662245752fa":
			{
				level.var_17e6189d._debug.var_77da0ec2 = int(value);
				break;
			}
			case "hash_5ba24ffba2d85322":
			case "hash_5ba24ffba2d85322":
			{
				level.var_17e6189d._debug.var_4c5d0455 = float(value);
				break;
			}
			case "hash_3d649e7c9abdc358":
			case "hash_3d649e7c9abdc358":
			{
				level.var_17e6189d._debug.var_4b824b64 = int(value);
				break;
			}
		}
	#/
}

/*
	Name: function_a3f5c17f
	Namespace: snd
	Checksum: 0x5AA6FA37
	Offset: 0x2BB0
	Size: 0x12C
	Parameters: 1
	Flags: Private
*/
function private function_a3f5c17f(p)
{
	/#
		var_cf07c027 = isstruct(p);
		var_76519319 = function_7a600918(p.name) || isstring(p.name);
		var_9cb80f5f = isdefined(p.value);
		var_aa7a0fd6 = var_cf07c027 && var_76519319 && var_9cb80f5f;
		if(function_81fac19d(!var_aa7a0fd6, ""))
		{
			/#
				if(function_f984063f())
				{
					debugbreak();
				}
			#/
			return;
		}
		function_fcbbe789(p.name, p.value);
	#/
}

/*
	Name: function_926b63ee
	Namespace: snd
	Checksum: 0xEFE3387F
	Offset: 0x2CE8
	Size: 0x614
	Parameters: 0
	Flags: Private
*/
function private function_926b63ee()
{
	/#
		var_11ea799a = -480;
		var_39fdd05 = -272;
		if(ispc())
		{
			var_11ea799a = -444;
			var_39fdd05 = -248;
		}
		waitforplayers();
		level.var_17e6189d._debug = spawnstruct();
		level.var_17e6189d._debug.debuglevel = 0;
		level.var_17e6189d._debug.filter = "";
		level.var_17e6189d._debug.hud_x = var_11ea799a;
		level.var_17e6189d._debug.hud_y = var_39fdd05;
		level.var_17e6189d._debug.var_2e1c6bb5 = 12;
		level.var_17e6189d._debug.var_29cb2b81 = 0.666;
		level.var_17e6189d._debug.var_87b166bf = (0.5, 1, 0.666);
		level.var_17e6189d._debug.var_2d81109e = 0.72974;
		level.var_17e6189d._debug.var_2751db2e = 5;
		level.var_17e6189d._debug.distance_max = 0;
		level.var_17e6189d._debug.dot = 0.99;
		level.var_17e6189d._debug.var_797d43c2 = 0;
		level.var_17e6189d._debug.var_77da0ec2 = 0;
		level.var_17e6189d._debug.var_4c5d0455 = 0.1;
		level.var_17e6189d._debug.var_4b824b64 = 5;
		util::init_dvar("", level.var_17e6189d._debug.debuglevel, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.filter, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.hud_x, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.hud_y, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.var_2e1c6bb5, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.var_29cb2b81, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.var_87b166bf, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.var_2d81109e, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.var_2751db2e, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.distance_max, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.dot, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.var_797d43c2, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.var_77da0ec2, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.var_4c5d0455, &function_a3f5c17f);
		util::init_dvar("", level.var_17e6189d._debug.var_4b824b64, &function_a3f5c17f);
	#/
}

/*
	Name: function_222f3594
	Namespace: snd
	Checksum: 0xF74FA21A
	Offset: 0x3308
	Size: 0xA6
	Parameters: 0
	Flags: Private
*/
function private function_222f3594()
{
	/#
		level notify(#"hash_1b2711bf69eca1e2");
		level endon(#"hash_1b2711bf69eca1e2");
		waitforplayers();
		while(true)
		{
			var_977d0bf3 = function_95c9af4b();
			if(var_977d0bf3 > 0)
			{
				function_c5ac5c05(var_977d0bf3);
				function_3d58f598(var_977d0bf3);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_29bb1234
	Namespace: snd
	Checksum: 0xEA4E2688
	Offset: 0x33B8
	Size: 0x86
	Parameters: 2
	Flags: Private
*/
function private function_29bb1234(key, value)
{
	/#
		if(value != "" && isstring(value) == 1)
		{
			function_81fac19d(1, ("" + value) + "");
			level notify(value);
		}
		return "";
	#/
}

/*
	Name: function_fa2bfbd1
	Namespace: snd
	Checksum: 0x99E3DA70
	Offset: 0x3448
	Size: 0x43E
	Parameters: 0
	Flags: Private
*/
function private function_fa2bfbd1()
{
	/#
		player = self;
		player endon(#"death");
		player endon(#"hash_1c8039ff7519235");
		while(!function_3132f113(player))
		{
			var_5e193409 = function_827811b5();
			var_9e35ce44 = var_5e193409[0] * 0.5;
			var_749dfb19 = var_5e193409[1] * 0.5;
			eyeorigin = player function_efda2d6d();
			eyeangles = player function_3d31768f();
			eyeforward = anglestoforward(eyeangles);
			var_3d66bc25 = anglestoright(eyeangles);
			traceend = eyeorigin + (eyeforward * 262144);
			trace = bullettrace(eyeorigin, traceend, 1, player);
			if(isdefined(trace) == 1 && isdefined(trace[#"position"]) == 1 && trace[#"position"] != eyeorigin)
			{
				pos = trace[#"position"];
				surfacetype = trace[#"surfacetype"];
				dist = distance(pos, eyeorigin);
				fontscale = 1.5;
				var_d2376cf8 = ((((("" + pos[0]) + "") + pos[1]) + "") + pos[2]) + "";
				var_3518873e = (1 * fontscale) * 24;
				function_65bb0ccd(var_d2376cf8, var_9e35ce44, var_749dfb19 + var_3518873e, fontscale, "", (1, 1, 1), 0.8542482, (0, 0, 0), 0.72974, (1, 1, 1), 0.72974);
				diststring = "" + dist;
				var_3518873e = (2 * fontscale) * 24;
				function_65bb0ccd(diststring, var_9e35ce44, var_749dfb19 + var_3518873e, fontscale, "", (1, 1, 1), 0.8542482, (0, 0, 0), 0.72974, (1, 1, 1), 0.72974);
				if(isdefined(surfacetype) == 1)
				{
					var_674c09af = ("" + surfacetype) + "";
					var_3518873e = (3 * fontscale) * 24;
					function_65bb0ccd(var_674c09af, var_9e35ce44, var_749dfb19 + var_3518873e, fontscale, "", (1, 1, 1), 0.8542482, (0, 0, 0), 0.72974, (1, 1, 1), 0.72974);
				}
				function_81183b3(pos, 4, (0, 0, 0), (1, 1, 1), 1, 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_53489ad
	Namespace: snd
	Checksum: 0x93BAB07F
	Offset: 0x3890
	Size: 0x138
	Parameters: 2
	Flags: Private
*/
function private function_53489ad(key, value)
{
	/#
		if(is_true(level.var_17e6189d.var_8c37ff34))
		{
			var_89b1fb20 = int(value);
			waitforplayers();
			players = function_2b2b83dc();
			foreach(player in players)
			{
				if(var_89b1fb20 > 0)
				{
					player thread function_fa2bfbd1();
					continue;
				}
				player notify(#"hash_1c8039ff7519235");
			}
		}
		return value;
	#/
}

/*
	Name: function_27e49109
	Namespace: snd
	Checksum: 0x77D6B39D
	Offset: 0x39D8
	Size: 0x97A
	Parameters: 1
	Flags: Private
*/
function private function_27e49109(distance)
{
	/#
		player = self;
		player notify(#"hash_4d6bc2c72c2fe097");
		player endon(#"hash_4d6bc2c72c2fe097");
		player endon(#"death");
		if(!isdefined(distance))
		{
			distance = 2400;
		}
		while(!function_3132f113(player))
		{
			scale = -1 * level.var_17e6189d._debug.var_29cb2b81;
			var_edbb6afa = 6 * level.var_17e6189d._debug.var_29cb2b81;
			var_f2d189e2 = player function_efda2d6d();
			playerangles = player function_3d31768f();
			playerforward = anglestoforward(playerangles);
			playerfov = player function_731299e5();
			ents = [];
			if(is_true(level.var_17e6189d.var_8c37ff34))
			{
				ents = getentitiesinradius(0, var_f2d189e2, distance);
			}
			else
			{
				ents = getentitiesinradius(var_f2d189e2, distance, undefined);
			}
			visibleents = function_ada64c98(ents, var_f2d189e2, playerforward, playerfov, distance);
			foreach(ent in visibleents)
			{
				row = 0;
				if(is_true(level.var_17e6189d.var_2dd09170))
				{
					if(isstring(ent.classname))
					{
						var_9bb18379 = (0, 0, var_edbb6afa * row);
						function_ac033c46("", ent.origin + var_9bb18379, scale, "", vectorscale((1, 1, 1), 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
						function_ac033c46("" + function_ea2f17d1(ent.classname, ""), ent.origin + var_9bb18379, scale, "", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
					}
					if(isstring(ent.targetname))
					{
						row++;
						var_9bb18379 = (0, 0, var_edbb6afa * row);
						function_ac033c46("", ent.origin + var_9bb18379, scale, "", vectorscale((1, 1, 1), 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
						function_ac033c46("" + function_ea2f17d1(ent.targetname, ""), ent.origin + var_9bb18379, scale, "", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
					}
					if(isstring(ent.script_noteworthy))
					{
						row++;
						var_9bb18379 = (0, 0, var_edbb6afa * row);
						function_ac033c46("", ent.origin + var_9bb18379, scale, "", vectorscale((1, 1, 1), 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
						function_ac033c46("" + function_ea2f17d1(ent.script_noteworthy, ""), ent.origin + var_9bb18379, scale, "", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
					}
				}
				row = 3;
				if(is_true(level.var_17e6189d.var_8c37ff34))
				{
					if(isstring(ent.classname))
					{
						function_ac033c46("", ent.origin + var_9bb18379, scale, "", vectorscale((1, 1, 1), 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
						function_ac033c46("" + function_ea2f17d1(ent.classname, ""), ent.origin + var_9bb18379, scale, "", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
					}
					if(isstring(ent.targetname))
					{
						row++;
						var_9bb18379 = (0, 0, var_edbb6afa * row);
						function_ac033c46("", ent.origin + var_9bb18379, scale, "", vectorscale((1, 1, 1), 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
						function_ac033c46("" + function_ea2f17d1(ent.targetname, ""), ent.origin + var_9bb18379, scale, "", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
					}
					if(isstring(ent.script_noteworthy))
					{
						row++;
						var_9bb18379 = (0, 0, var_edbb6afa * row);
						function_ac033c46("", ent.origin + var_9bb18379, scale, "", vectorscale((1, 1, 1), 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
						function_ac033c46("" + function_ea2f17d1(ent.script_noteworthy, ""), ent.origin + var_9bb18379, scale, "", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
					}
				}
				if(is_true(level.var_17e6189d.var_2dd09170))
				{
					function_81183b3(ent.origin, 12, ent.angles, (1, 1, 1), 1, 0);
				}
				if(is_true(level.var_17e6189d.var_8c37ff34))
				{
					function_8aaa798e(ent.origin, ent.angles, 12, 4, (1, 0, 0), 1, 0);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_3261cc72
	Namespace: snd
	Checksum: 0x337EB675
	Offset: 0x4360
	Size: 0x118
	Parameters: 2
	Flags: Private
*/
function private function_3261cc72(key, value)
{
	/#
		waitforplayers();
		players = function_2b2b83dc();
		var_89b1fb20 = int(value);
		foreach(player in players)
		{
			if(var_89b1fb20 > 0)
			{
				player thread function_27e49109(var_89b1fb20);
				continue;
			}
			player notify(#"hash_4d6bc2c72c2fe097");
		}
		return value;
	#/
}

/*
	Name: function_40f589b7
	Namespace: snd
	Checksum: 0x8EB0E3CD
	Offset: 0x4488
	Size: 0x1E6
	Parameters: 0
	Flags: Private
*/
function private function_40f589b7()
{
	/#
		level notify(#"hash_2036f819b394154");
		level endon(#"hash_2036f819b394154");
		while(true)
		{
			var_1790a507 = function_827811b5();
			var_38c41a5e = var_1790a507[0];
			var_c13d121d = var_1790a507[1];
			pos = (var_38c41a5e * 0.5, var_c13d121d * 0.5, 0);
			txt = "";
			skipto = function_bdd32fcc();
			if(is_true(level.var_17e6189d.var_8c37ff34))
			{
				txt = "";
				pos = (var_38c41a5e * 0.5, 31.99999 + (var_c13d121d * 0.5), 0);
			}
			txt = txt + "";
			txt = txt + "";
			if(isdefined(skipto))
			{
				txt = txt + skipto;
			}
			txt = txt + "";
			function_65bb0ccd(txt, pos[0], pos[1], 1.333333, "", (1, 1, 1), 1, (0, 0, 0), 0.72974, (1, 1, 1), 0.72974, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: function_1dddb5c2
	Namespace: snd
	Checksum: 0xB6134329
	Offset: 0x4678
	Size: 0x74
	Parameters: 2
	Flags: Private
*/
function private function_1dddb5c2(key, value)
{
	/#
		var_89b1fb20 = int(value);
		if(var_89b1fb20 > 0)
		{
			level thread function_40f589b7();
		}
		else
		{
			level notify(#"hash_2036f819b394154");
		}
		return value;
	#/
}

