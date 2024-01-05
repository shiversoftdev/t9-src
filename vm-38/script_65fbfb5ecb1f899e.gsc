#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using script_140d5347de8af85c;

#namespace easing;

/*
	Name: function_bc05a478
	Namespace: easing
	Checksum: 0x2C8CC628
	Offset: 0x1C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bc05a478()
{
	level notify(2070905795);
}

/*
	Name: function_a037b7c9
	Namespace: easing
	Checksum: 0xA152FB5D
	Offset: 0x1E0
	Size: 0xAC
	Parameters: 8
	Flags: None
*/
function function_a037b7c9(localclientnum, ui_model, value, time, var_4ca73085, var_7cbb9c6a, var_1e24f51b, var_33ce6852)
{
	self thread function_d4a4a726(localclientnum, getuimodelvalue(ui_model), value, time, &function_3d07aeab, var_4ca73085, "ease_uimodel_" + ui_model, "ease_uimodel_" + ui_model, var_7cbb9c6a, var_1e24f51b, var_33ce6852, ui_model);
}

/*
	Name: ease_camera_position
	Namespace: easing
	Checksum: 0x68839D3C
	Offset: 0x298
	Size: 0xEC
	Parameters: 7
	Flags: None
*/
function ease_camera_position(start, target, time, var_4ca73085, var_7cbb9c6a, var_1e24f51b, var_33ce6852)
{
	/#
		assert(self isplayer());
	#/
	if(!isdefined(start))
	{
		start = self getcampos();
	}
	localclientnum = self getlocalclientnumber();
	self thread function_d4a4a726(localclientnum, start, target, time, &function_5b854508, var_4ca73085, "ease_camera_position", "ease_camera_position", var_7cbb9c6a, var_1e24f51b, var_33ce6852);
}

/*
	Name: ease_camera_angles
	Namespace: easing
	Checksum: 0xAB47AAB8
	Offset: 0x390
	Size: 0x124
	Parameters: 7
	Flags: None
*/
function ease_camera_angles(start, target, time, var_4ca73085, var_7cbb9c6a, var_1e24f51b, var_33ce6852)
{
	/#
		assert(self isplayer());
	#/
	if(!isdefined(start))
	{
		start = self getcamangles();
	}
	start = angleclamp180(start);
	target = start + (angleclamp180(target - start));
	localclientnum = self getlocalclientnumber();
	self thread function_d4a4a726(localclientnum, start, target, time, &function_d4923609, var_4ca73085, "ease_camera_angles", "ease_camera_angles", var_7cbb9c6a, var_1e24f51b, var_33ce6852);
}

/*
	Name: function_f95cb457
	Namespace: easing
	Checksum: 0x743C2EB9
	Offset: 0x4C0
	Size: 0x264
	Parameters: 9
	Flags: None
*/
function function_f95cb457(start, target, time, var_4ca73085, var_7cbb9c6a, var_1e24f51b, var_33ce6852, min, max)
{
	/#
		assert(self isplayer());
	#/
	/#
		assert(target > 0);
	#/
	if(!isdefined(start) && var_4ca73085 == #"linear")
	{
		self function_49cdf043(math::clamp(target, (isdefined(min) ? min : 1E-05), (isdefined(max) ? max : 2147483647)), time);
	}
	else
	{
		var_aca17b66 = self function_82f1cbd2();
		if(!isdefined(start))
		{
			start = var_aca17b66;
		}
		if(getdvarint(#"hash_32f02866d46e6e7b", 0))
		{
			var_18b7d7a4 = self function_838f0a04();
			delta = var_18b7d7a4 - getdvarfloat(#"cg_focallength", var_18b7d7a4);
			if(abs(delta) > 0.001)
			{
				start = start - delta;
			}
		}
		localclientnum = self getlocalclientnumber();
		self thread function_d4a4a726(localclientnum, start, target, time, &function_c426caa9, var_4ca73085, "ease_camera_lens_focal_length", [1:"deactivate_camera_lens_overrides", 0:"ease_camera_lens_focal_length"], var_7cbb9c6a, var_1e24f51b, var_33ce6852, min, max);
	}
}

/*
	Name: function_b6f1c993
	Namespace: easing
	Checksum: 0xF67FBAEA
	Offset: 0x730
	Size: 0x134
	Parameters: 9
	Flags: None
*/
function function_b6f1c993(start, target, time, var_4ca73085, var_7cbb9c6a, var_1e24f51b, var_33ce6852, min, max)
{
	/#
		assert(self isplayer());
	#/
	/#
		assert(target > 0);
	#/
	if(!isdefined(start))
	{
		start = self function_78bf7752();
	}
	localclientnum = self getlocalclientnumber();
	self thread function_d4a4a726(localclientnum, start, target, time, &function_dd427b21, var_4ca73085, "ease_camera_lens_focal_distance", [1:"deactivate_camera_lens_overrides", 0:"ease_camera_lens_focal_distance"], var_7cbb9c6a, var_1e24f51b, var_33ce6852, min, max);
}

/*
	Name: function_136edb11
	Namespace: easing
	Checksum: 0x405ABE27
	Offset: 0x870
	Size: 0x134
	Parameters: 9
	Flags: None
*/
function function_136edb11(start, target, time, var_4ca73085, var_7cbb9c6a, var_1e24f51b, var_33ce6852, min, max)
{
	/#
		assert(self isplayer());
	#/
	/#
		assert(target > 0);
	#/
	if(!isdefined(start))
	{
		start = self function_28aef982();
	}
	localclientnum = self getlocalclientnumber();
	self thread function_d4a4a726(localclientnum, start, target, time, &function_9f966a98, var_4ca73085, "ease_camera_lens_fstop", [1:"deactivate_camera_lens_overrides", 0:"ease_camera_lens_fstop"], var_7cbb9c6a, var_1e24f51b, var_33ce6852, min, max);
}

/*
	Name: function_86ac55c5
	Namespace: easing
	Checksum: 0x4669F651
	Offset: 0x9B0
	Size: 0xB4
	Parameters: 9
	Flags: None
*/
function function_86ac55c5(localclientnum, dvar, var_c7ec7d60, value, time, var_4ca73085, var_7cbb9c6a, var_1e24f51b, var_33ce6852)
{
	self thread function_d4a4a726(localclientnum, getdvarfloat(dvar), value, time, &function_8ff186e5, var_4ca73085, "ease_dvar_" + dvar, "ease_dvar_" + dvar, var_7cbb9c6a, var_1e24f51b, var_33ce6852, dvar, var_c7ec7d60);
}

/*
	Name: ease_origin
	Namespace: easing
	Checksum: 0x268C1DB2
	Offset: 0xA70
	Size: 0x194
	Parameters: 9
	Flags: None
*/
function ease_origin(localclientnum, target, time, var_4ca73085, axis, additive, var_7cbb9c6a, var_1e24f51b, var_33ce6852)
{
	/#
		assert(self != level);
	#/
	endons = undefined;
	callback = &function_54354e4e;
	start_value = self.origin;
	if(is_true(additive))
	{
		callback = &function_92b063ff;
	}
	else
	{
		endons = [3:"ease_origin_z", 2:"ease_origin_y", 1:"ease_origin_x", 0:"ease_origin"];
	}
	if(isdefined(axis))
	{
		/#
			assert(axis >= 0 && axis <= 2);
		#/
		start_value = start_value[axis];
	}
	else
	{
		axis = -1;
	}
	self thread function_d4a4a726(localclientnum, start_value, target, time, callback, var_4ca73085, "ease_origin", endons, var_7cbb9c6a, var_1e24f51b, var_33ce6852, axis);
}

/*
	Name: ease_angles
	Namespace: easing
	Checksum: 0xB5EC1658
	Offset: 0xC10
	Size: 0x194
	Parameters: 9
	Flags: None
*/
function ease_angles(localclientnum, target, time, var_4ca73085, axis, additive, var_7cbb9c6a, var_1e24f51b, var_33ce6852)
{
	/#
		assert(self != level);
	#/
	endons = undefined;
	callback = &function_3b3f9801;
	start_value = self.angles;
	if(is_true(additive))
	{
		callback = &function_faea843b;
	}
	else
	{
		endons = [3:"ease_roll", 2:"ease_yaw", 1:"ease_pitch", 0:"ease_angles"];
	}
	if(isdefined(axis))
	{
		/#
			assert(axis >= 0 && axis <= 2);
		#/
		start_value = start_value[axis];
	}
	else
	{
		axis = -1;
	}
	self thread function_d4a4a726(localclientnum, start_value, target, time, callback, var_4ca73085, "ease_angles", endons, var_7cbb9c6a, var_1e24f51b, var_33ce6852, axis);
}

/*
	Name: function_d4a4a726
	Namespace: easing
	Checksum: 0x9AA330E6
	Offset: 0xDB0
	Size: 0x5BE
	Parameters: 12
	Flags: Variadic
*/
function function_d4a4a726(localclientnum, start_value, target_value, time, callback_func, var_4ca73085, notifies, endons, var_7cbb9c6a, var_1e24f51b, var_33ce6852, ...)
{
	if(!isdefined(var_4ca73085))
	{
		var_4ca73085 = #"linear";
	}
	/#
		assert(isdefined(level.var_b649495c));
	#/
	/#
		assert(isdefined(level.var_b649495c[var_4ca73085]));
	#/
	localplayer = function_5c10bd79(localclientnum);
	if(!isdefined(localplayer))
	{
		return;
	}
	localplayer endon(#"death");
	if(!isdefined(notifies))
	{
		notifies = [];
	}
	else if(!isarray(notifies))
	{
		notifies = array(notifies);
	}
	foreach(notify_str in notifies)
	{
		self notify(notify_str);
	}
	if(isdefined(endons))
	{
		self endon(endons);
	}
	if(!isdefined(var_33ce6852))
	{
		var_33ce6852 = [];
	}
	else if(!isarray(var_33ce6852))
	{
		var_33ce6852 = array(var_33ce6852);
	}
	var_b3160f0 = spawnstruct();
	var_b3160f0.start_value = start_value;
	var_b3160f0.target_value = target_value;
	var_b3160f0.var_872a88cd = start_value;
	var_b3160f0.var_37e98bce = 0;
	var_88a4b08c = var_b3160f0.var_872a88cd;
	last_time = float(localplayer getclienttime()) / 1000;
	cur_time = 0;
	while(cur_time < time)
	{
		var_b3160f0.pct = min(1, cur_time / time);
		var_88a4b08c = var_b3160f0.var_872a88cd;
		switch(var_33ce6852.size)
		{
			case 3:
			{
				var_b3160f0.var_872a88cd = [[level.var_b649495c[var_4ca73085]]](start_value, target_value, var_b3160f0.pct, var_7cbb9c6a, var_1e24f51b, var_33ce6852[0], var_33ce6852[1], var_33ce6852[2]);
				break;
			}
			case 2:
			{
				var_b3160f0.var_872a88cd = [[level.var_b649495c[var_4ca73085]]](start_value, target_value, var_b3160f0.pct, var_7cbb9c6a, var_1e24f51b, var_33ce6852[0], var_33ce6852[1]);
				break;
			}
			case 1:
			{
				var_b3160f0.var_872a88cd = [[level.var_b649495c[var_4ca73085]]](start_value, target_value, var_b3160f0.pct, var_7cbb9c6a, var_1e24f51b, var_33ce6852[0]);
				break;
			}
			default:
			{
				var_b3160f0.var_872a88cd = [[level.var_b649495c[var_4ca73085]]](start_value, target_value, var_b3160f0.pct, var_7cbb9c6a, var_1e24f51b);
				break;
			}
		}
		var_b3160f0.delta = var_b3160f0.var_872a88cd - var_88a4b08c;
		util::function_50f54b6f(self, callback_func, var_b3160f0, vararg);
		waitframe(1);
		new_time = float(localplayer getclienttime()) / 1000;
		cur_time = cur_time + (new_time - last_time);
		last_time = new_time;
	}
	var_b3160f0.var_872a88cd = target_value;
	var_b3160f0.delta = var_b3160f0.target_value - var_88a4b08c;
	var_b3160f0.var_37e98bce = 1;
	var_b3160f0.localclientnum = localclientnum;
	util::function_50f54b6f(self, callback_func, var_b3160f0, vararg);
	if(isdefined(self))
	{
		self notify(#"hash_133229f708f5d10", {#localclientnum:localclientnum, #hash_4ca73085:var_4ca73085, #callback_func:callback_func, #time:time, #target_value:target_value, #start_value:start_value});
	}
}

/*
	Name: function_3d07aeab
	Namespace: easing
	Checksum: 0x58AE4BAF
	Offset: 0x1378
	Size: 0x34
	Parameters: 2
	Flags: Private
*/
function private function_3d07aeab(var_b3160f0, ui_model)
{
	setuimodelvalue(ui_model, var_b3160f0.var_872a88cd);
}

/*
	Name: function_5b854508
	Namespace: easing
	Checksum: 0x4532D397
	Offset: 0x13B8
	Size: 0x2C
	Parameters: 1
	Flags: Private
*/
function private function_5b854508(var_b3160f0)
{
	self camerasetposition(var_b3160f0.var_872a88cd);
}

/*
	Name: function_d4923609
	Namespace: easing
	Checksum: 0x484DD8BC
	Offset: 0x13F0
	Size: 0x2C
	Parameters: 1
	Flags: Private
*/
function private function_d4923609(var_b3160f0)
{
	self camerasetlookat(var_b3160f0.var_872a88cd);
}

/*
	Name: function_c426caa9
	Namespace: easing
	Checksum: 0xBA0546E6
	Offset: 0x1428
	Size: 0x7C
	Parameters: 3
	Flags: Private
*/
function private function_c426caa9(var_b3160f0, min_val, max_val)
{
	if(!isdefined(min_val))
	{
		min_val = 0.01;
	}
	if(!isdefined(max_val))
	{
		max_val = 2147483647;
	}
	self function_49cdf043(math::clamp(var_b3160f0.var_872a88cd, min_val, max_val), 0);
}

/*
	Name: function_dd427b21
	Namespace: easing
	Checksum: 0x35D4B347
	Offset: 0x14B0
	Size: 0x7C
	Parameters: 3
	Flags: Private
*/
function private function_dd427b21(var_b3160f0, min_val, max_val)
{
	if(!isdefined(min_val))
	{
		min_val = 0.01;
	}
	if(!isdefined(max_val))
	{
		max_val = 2147483647;
	}
	self function_d7be9a9f(math::clamp(var_b3160f0.var_872a88cd, min_val, max_val), 0);
}

/*
	Name: function_9f966a98
	Namespace: easing
	Checksum: 0xBD083057
	Offset: 0x1538
	Size: 0x7C
	Parameters: 3
	Flags: Private
*/
function private function_9f966a98(var_b3160f0, min_val, max_val)
{
	if(!isdefined(min_val))
	{
		min_val = 0.01;
	}
	if(!isdefined(max_val))
	{
		max_val = 2147483647;
	}
	self function_1816c600(math::clamp(var_b3160f0.var_872a88cd, min_val, max_val), 0);
}

