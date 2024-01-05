#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_6b71c9befed901f2;
#using script_75c3996cce8959f7;
#using script_71603a58e2da0698;
#using script_30c7fb449869910;
#using script_1b2f6ef7778cf920;
#using script_771f5bff431d8d57;
#using script_42cbbdcd1e160063;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using script_18910f59cc847b42;
#using scripts\core_common\struct.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_ac2a80f5;

/*
	Name: init
	Namespace: namespace_ac2a80f5
	Checksum: 0x71696B
	Offset: 0x178
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_32d5e898();
}

/*
	Name: function_32d5e898
	Namespace: namespace_ac2a80f5
	Checksum: 0x40120D40
	Offset: 0x198
	Size: 0x130
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
	var_634814ee = 1;
	if(getlocalplayers().size > 1)
	{
		namespace_4dae815d::function_e1887b0f(1);
		var_634814ee = 3;
	}
	foreach(player in getlocalplayers())
	{
		if(isdefined(player) && isdefined(player.doa))
		{
			player.doa.var_10752c35 = var_634814ee;
		}
		player function_278f20a3(vectorscale((1, 0, 0), 75), function_ccf8a968(1));
	}
}

/*
	Name: function_57ce3201
	Namespace: namespace_ac2a80f5
	Checksum: 0xF2B04AF0
	Offset: 0x2D0
	Size: 0x130
	Parameters: 1
	Flags: Linked
*/
function function_57ce3201(localclientnum)
{
	if(isbot(self))
	{
		return;
	}
	self endon(#"disconnect");
	self notify("24bafc24006015e6");
	self endon("24bafc24006015e6");
	while(true)
	{
		level waittill(#"hash_743e9066181c346e");
		if(isdefined(localclientnum) && isdefined(self.doa) && isdefined(self.doa.var_10752c35))
		{
			if(self.doa.var_10752c35 == 2 && !function_32cb6463(localclientnum))
			{
				var_69c3bd16 = self function_1d5dc8d2(localclientnum, self.doa.var_10752c35);
				self changecamera(localclientnum, var_69c3bd16);
			}
		}
	}
}

/*
	Name: function_278f20a3
	Namespace: namespace_ac2a80f5
	Checksum: 0xD792B5A7
	Offset: 0x408
	Size: 0x194
	Parameters: 3
	Flags: Linked
*/
function function_278f20a3(angles, min_dist, max_dist)
{
	if(!isdefined(max_dist))
	{
		max_dist = 0;
	}
	if(!isdefined(self) || !isdefined(self.doa))
	{
		return;
	}
	if(isdefined(self.doa.var_67c3a8db))
	{
		angles = self.doa.var_67c3a8db;
	}
	if(isdefined(angles))
	{
		vectornormalize(angles);
		self.doa.camera_angles = angles;
		self.doa.var_be529a4e = anglestoforward(angles) * -1;
		self.doa.var_7dd1941e = anglestoup(angles);
	}
	if(min_dist < 1)
	{
		min_dist = 1;
	}
	self.doa.var_f793b3d3 = min_dist;
	self.doa.var_878bf427 = max_dist;
	if(!isdefined(self.var_2d592f5b))
	{
		self.var_2d592f5b = self.doa.camera_angles;
	}
	namespace_1e25ad94::debugmsg((("++++++++++++++++++++++++ Player ") + self getentitynumber() + " camera yaw angles are: ") + self.doa.camera_angles);
}

/*
	Name: function_7dd474a0
	Namespace: namespace_ac2a80f5
	Checksum: 0x484F7915
	Offset: 0x5A8
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function function_7dd474a0(localclientnum, delta_time)
{
	player = level.localplayers[0];
	cam_pos = player.origin + vectorscale((0, 0, 1), 600);
	player camerasetposition(cam_pos);
	player camerasetlookat(player.doa.camera_angles);
}

/*
	Name: function_14f1aa2b
	Namespace: namespace_ac2a80f5
	Checksum: 0x9789AFCA
	Offset: 0x648
	Size: 0xC3E
	Parameters: 2
	Flags: Linked
*/
function function_14f1aa2b(localclientnum, delta_time)
{
	if(!isdefined(level.localplayers) || level.localplayers.size == 0)
	{
		return;
	}
	localplayer = function_5c10bd79(localclientnum);
	if(!isdefined(localplayer) || !isdefined(localplayer.doa))
	{
		return;
	}
	if(level.localplayers.size > 1)
	{
		if(level.doa.var_91f2835f == 1 && localclientnum > 0)
		{
			var_b2b025b1 = level.localplayers[0];
			if(isdefined(var_b2b025b1) && isdefined(var_b2b025b1.doa) && isdefined(var_b2b025b1.var_45c6f27d))
			{
				cam_pos = var_b2b025b1.var_45c6f27d;
				angles = var_b2b025b1.var_2d592f5b;
				zoffset = 0;
				if(isdefined(var_b2b025b1.doa.var_c544c883))
				{
					zoffset = var_b2b025b1.doa.var_c544c883;
				}
				localplayer camerasetposition(cam_pos + (0, 0, zoffset));
				localplayer camerasetlookat(angles);
				localplayer.var_45c6f27d = cam_pos;
				localplayer.var_2d592f5b = angles;
			}
			return;
		}
	}
	if(level.localplayers.size > 1)
	{
		if(level.doa.var_91f2835f == 1 && (localplayer.doa.var_10752c35 != 3 && localplayer.doa.var_10752c35 != 6))
		{
			localplayer.doa.var_10752c35 = 3;
		}
	}
	var_10752c35 = localplayer.doa.var_10752c35;
	if(var_10752c35 == 6)
	{
		/#
			assert(isdefined(level.doa.var_b73cc08));
		#/
		cam_pos = level.doa.var_b73cc08.origin;
		angles = level.doa.var_b73cc08.angles;
		localplayer camerasetposition(cam_pos);
		localplayer camerasetlookat(angles);
		localplayer.var_45c6f27d = cam_pos;
		localplayer.var_2d592f5b = angles;
		return;
	}
	players = level.localplayers;
	angles = localplayer.doa.camera_angles;
	var_be529a4e = localplayer.doa.var_be529a4e;
	var_7dd1941e = localplayer.doa.var_7dd1941e;
	var_8cc62135 = localplayer.origin;
	vehicle = getplayervehicle(localplayer);
	if(isdefined(vehicle))
	{
		var_8cc62135 = vehicle.origin;
	}
	if(var_10752c35 == 3)
	{
		if(level.localplayers.size > 1)
		{
			mins = vectorscale((1, 1, 1), 1000000);
			maxs = vectorscale((-1, -1, -1), 1000000);
			if(level.doa.world_state == 0 && isdefined(level.doa.current_arena))
			{
				mins = function_2d9b1c4e(level.doa.current_arena.origin, mins);
				maxs = function_663f7227(level.doa.current_arena.origin, maxs);
			}
			foreach(player in getlocalplayers())
			{
				mins = function_2d9b1c4e(player.origin, mins);
				maxs = function_663f7227(player.origin, maxs);
			}
			dims = maxs - mins;
			var_8cc62135 = (mins + maxs) * 0.5;
		}
		else if(isdefined(level.doa.current_arena))
		{
			var_e7993c63 = level.doa.current_arena.origin - localplayer.origin;
			var_8cc62135 = localplayer.origin + (var_e7993c63 * 0.25);
		}
	}
	if(is_true(level.var_fb0679ad))
	{
		center = var_8cc62135;
		cam_pos = center;
		var_91e98520 = center;
		cam_pos = (localplayer.origin[0], localplayer.origin[1], localplayer.origin[2]);
		facing = anglestoforward(localplayer getplayerangles());
		var_91e98520 = (cam_pos + (facing * (130 + (abs(facing[0] * 30))))) + (localplayer getvelocity() * 0.5);
		if(isdefined(level.var_145dec4f))
		{
			var_55e8085c = 3;
			dir = var_91e98520 - level.var_145dec4f;
			if(lengthsquared(dir) < 1000000)
			{
				var_91e98520 = level.var_145dec4f + ((dir * var_55e8085c) * delta_time);
				cam_pos = var_91e98520;
			}
		}
		level.var_145dec4f = var_91e98520;
	}
	cam_pos = var_8cc62135;
	cam_pos = cam_pos + (var_be529a4e * localplayer.doa.var_f793b3d3);
	cam_pos = cam_pos + (var_7dd1941e * -20);
	if(level.localplayers.size > 1 && var_10752c35 == 3 && isdefined(level.doa.current_arena))
	{
		var_8172ec08 = 200;
		var_cfa24a5 = 1800;
		var_8d932466 = 450;
		var_5bdd9694 = abs(dims[1]);
		var_189a34e8 = 0;
		if(var_5bdd9694 > var_8172ec08)
		{
			var_189a34e8 = (var_5bdd9694 - var_8172ec08) / (var_cfa24a5 - var_8172ec08);
		}
		var_5c03fa4 = 50;
		var_d946d37e = 500;
		var_49a6f227 = abs(dims[0]);
		var_2280804 = 0;
		if(var_49a6f227 > var_5c03fa4)
		{
			var_2280804 = (var_49a6f227 - var_5c03fa4) / (var_d946d37e - var_5c03fa4);
			frac = math::clamp(var_2280804, 0, 1);
			var_53cfe241 = level.doa.current_arena.origin[1];
			new_y = cam_pos[1] + ((var_53cfe241 - cam_pos[1]) * frac);
			cam_pos = (cam_pos[0], new_y, cam_pos[2]);
		}
		t = var_189a34e8;
		if(var_2280804 > t)
		{
			t = var_2280804;
		}
		var_fa5416a8 = var_8d932466;
		var_c9fdfd75 = 200;
		if(!isdefined(level.var_6a822745))
		{
			level.var_6a822745 = var_c9fdfd75;
		}
		var_fa5416a8 = var_fa5416a8 - var_c9fdfd75;
		if(t > 1)
		{
			var_c9fdfd75 = var_c9fdfd75 * t;
		}
		level.var_6a822745 = level.var_6a822745 + (((var_c9fdfd75 - level.var_6a822745) * 3) * delta_time);
		cam_pos = cam_pos + (var_be529a4e * var_c9fdfd75);
		var_fa5416a8 = var_fa5416a8 * t;
		var_fa5416a8 = math::clamp(var_fa5416a8, 0, var_8d932466);
		if(!isdefined(level.var_fa5416a8))
		{
			level.var_fa5416a8 = var_fa5416a8;
		}
		level.var_fa5416a8 = level.var_fa5416a8 + (((var_fa5416a8 - level.var_fa5416a8) * 2) * delta_time);
		cam_pos = cam_pos + (var_be529a4e * level.var_fa5416a8);
	}
	if(isdefined(localplayer.var_45c6f27d))
	{
		var_55e8085c = 2;
		dir = cam_pos - localplayer.var_45c6f27d;
		if(lengthsquared(dir) < 1000000)
		{
			cam_pos = localplayer.var_45c6f27d + ((dir * var_55e8085c) * delta_time);
		}
	}
	localplayer.var_ca14ee83 = angles;
	if(isdefined(localplayer.var_2d592f5b))
	{
		var_55e8085c = 3;
		dir = angles - localplayer.var_2d592f5b;
		angles = localplayer.var_2d592f5b + ((dir * var_55e8085c) * delta_time);
	}
	zoffset = 0;
	if(isdefined(localplayer.doa.var_c544c883))
	{
		zoffset = localplayer.doa.var_c544c883;
	}
	if(cam_pos[2] > 3800)
	{
		cam_pos = (cam_pos[0], cam_pos[1], 3800);
	}
	localplayer camerasetposition(cam_pos + (0, 0, zoffset));
	localplayer camerasetlookat(angles);
	localplayer.var_45c6f27d = cam_pos;
	localplayer.var_2d592f5b = angles;
}

/*
	Name: function_2d9b1c4e
	Namespace: namespace_ac2a80f5
	Checksum: 0x30437581
	Offset: 0x1290
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function function_2d9b1c4e(vec, mins)
{
	if(vec[0] < mins[0])
	{
		mins = (vec[0], mins[1], mins[2]);
	}
	if(vec[1] < mins[1])
	{
		mins = (mins[0], vec[1], mins[2]);
	}
	if(vec[2] < mins[2])
	{
		mins = (mins[0], mins[1], vec[2]);
	}
	return mins;
}

/*
	Name: function_663f7227
	Namespace: namespace_ac2a80f5
	Checksum: 0xC20512DA
	Offset: 0x1340
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function function_663f7227(vec, maxs)
{
	if(vec[0] > maxs[0])
	{
		maxs = (vec[0], maxs[1], maxs[2]);
	}
	if(vec[1] > maxs[1])
	{
		maxs = (maxs[0], vec[1], maxs[2]);
	}
	if(vec[2] > maxs[2])
	{
		maxs = (maxs[0], maxs[1], vec[2]);
	}
	return maxs;
}

/*
	Name: changecamera
	Namespace: namespace_ac2a80f5
	Checksum: 0xD04ADB90
	Offset: 0x13F0
	Size: 0x374
	Parameters: 2
	Flags: Linked
*/
function changecamera(localclientnum, mode)
{
	self.doa.var_10752c35 = mode;
	/#
		assert(isdefined(self.doa.var_10752c35));
	#/
	self cameraforcedisablescriptcam(0);
	if(is_true(level.doa.var_dec041f5))
	{
		self.doa.var_10752c35 = 6;
	}
	else
	{
		if(level.localplayers.size > 1)
		{
			if(self.doa.var_10752c35 == 3 && level.doa.var_91f2835f != 1)
			{
				namespace_4dae815d::function_e1887b0f(1);
			}
			if(self.doa.var_10752c35 == 4 && level.doa.var_91f2835f != 0)
			{
				namespace_4dae815d::function_e1887b0f(0);
			}
			return;
		}
		if(self.doa.var_10752c35 == 5)
		{
			self cameraforcedisablescriptcam(1);
		}
	}
	height = function_ccf8a968(self.doa.var_10752c35);
	if(isdefined(level.doa.current_arena) && isdefined(level.doa.current_arena.camera_max_height))
	{
		if(height > level.doa.current_arena.camera_max_height)
		{
			height = level.doa.current_arena.camera_max_height;
		}
	}
	if(level.doa.world_state == 0)
	{
		/#
			assert(isdefined(isdefined(level.doa.current_arena)));
		#/
		normalangle = level.doa.current_arena.var_13ea8aea;
		var_1d83376c = level.doa.current_arena.var_46f3a17d;
	}
	else
	{
		normalangle = vectorscale((1, 0, 0), 75);
		var_1d83376c = (75, 180, 0);
	}
	if(is_true(self.doa.var_71122e79))
	{
		self function_278f20a3(var_1d83376c, height);
	}
	else
	{
		self function_278f20a3(normalangle, height);
	}
	/#
		namespace_1e25ad94::debugmsg((("" + self getentitynumber()) + "") + self.doa.var_10752c35);
	#/
}

/*
	Name: function_1d5dc8d2
	Namespace: namespace_ac2a80f5
	Checksum: 0xD8EF4F38
	Offset: 0x1770
	Size: 0x194
	Parameters: 2
	Flags: Linked
*/
function function_1d5dc8d2(localclientnum, var_545466e8)
{
	if(isdefined(level.doa.var_dbdc241e))
	{
		return level.doa.var_dbdc241e;
	}
	if(level.localplayers.size > 1)
	{
		if(level.doa.var_91f2835f == 0 && namespace_4dae815d::function_abcdf17f())
		{
			return 4;
		}
		if(level.doa.var_91f2835f == 1)
		{
			return 4;
		}
		return 3;
	}
	var_545466e8++;
	var_c0547bf3 = 2;
	if(level.doa.world_state == 0)
	{
		var_c0547bf3 = 3;
	}
	if(isdefined(level.doa.var_182fb75a) || (isdefined(level.doa.var_938e4f08) && level.doa.var_938e4f08 != 0))
	{
		var_c0547bf3 = 2;
	}
	if(var_545466e8 > var_c0547bf3)
	{
		var_545466e8 = 0;
	}
	if(var_545466e8 == 2 && !function_32cb6463(localclientnum))
	{
		if(var_545466e8 < var_c0547bf3)
		{
			var_545466e8++;
		}
		else
		{
			var_545466e8 = 0;
		}
	}
	return var_545466e8;
}

/*
	Name: function_ccf8a968
	Namespace: namespace_ac2a80f5
	Checksum: 0x944BA673
	Offset: 0x1910
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_ccf8a968(var_545466e8)
{
	if(!isdefined(var_545466e8))
	{
		return 700;
	}
	switch(var_545466e8)
	{
		case 0:
		{
			return 400;
		}
		case 1:
		case 3:
		{
			return 700;
		}
		case 2:
		{
			return 1000;
		}
		case 7:
		{
			return 800;
		}
		default:
		{
			return 700;
		}
	}
}

/*
	Name: function_f7736714
	Namespace: namespace_ac2a80f5
	Checksum: 0x2D188CAD
	Offset: 0x19C8
	Size: 0x58
	Parameters: 2
	Flags: Linked
*/
function function_f7736714(localclientnum, var_10752c35)
{
	if(var_10752c35 == 2 && !function_32cb6463(localclientnum))
	{
		return self function_1d5dc8d2(localclientnum, var_10752c35);
	}
	return var_10752c35;
}

