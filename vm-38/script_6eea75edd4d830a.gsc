#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using script_37f9ff47f340fbe8;

#namespace easing;

/*
	Name: function_b5255aac
	Namespace: easing
	Checksum: 0xD7400F18
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b5255aac()
{
	level notify(1911753308);
}

/*
	Name: function_86ac55c5
	Namespace: easing
	Checksum: 0xEDD3C79C
	Offset: 0x120
	Size: 0xA4
	Parameters: 8
	Flags: None
*/
function function_86ac55c5(dvar, var_c7ec7d60, value, time, var_4ca73085, var_7cbb9c6a, var_1e24f51b, var_33ce6852)
{
	self thread function_d4a4a726(getdvarfloat(dvar), value, time, &function_8ff186e5, var_4ca73085, "ease_dvar_" + dvar, "ease_dvar_" + dvar, var_7cbb9c6a, var_1e24f51b, var_33ce6852, dvar, var_c7ec7d60);
}

/*
	Name: ease_origin
	Namespace: easing
	Checksum: 0xD0722E04
	Offset: 0x1D0
	Size: 0x18C
	Parameters: 8
	Flags: None
*/
function ease_origin(target, time, var_4ca73085, axis, additive, var_7cbb9c6a, var_1e24f51b, var_33ce6852)
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
	self thread function_d4a4a726(start_value, target, time, callback, var_4ca73085, "ease_origin", endons, var_7cbb9c6a, var_1e24f51b, var_33ce6852, axis);
}

/*
	Name: ease_angles
	Namespace: easing
	Checksum: 0x65315644
	Offset: 0x368
	Size: 0x18C
	Parameters: 8
	Flags: None
*/
function ease_angles(target, time, var_4ca73085, axis, additive, var_7cbb9c6a, var_1e24f51b, var_33ce6852)
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
	self thread function_d4a4a726(start_value, target, time, callback, var_4ca73085, "ease_angles", endons, var_7cbb9c6a, var_1e24f51b, var_33ce6852, axis);
}

/*
	Name: function_d4a4a726
	Namespace: easing
	Checksum: 0x9ADF1B30
	Offset: 0x500
	Size: 0x4FE
	Parameters: 11
	Flags: Variadic
*/
function function_d4a4a726(start_value, target_value, time, callback_func, var_4ca73085, notifies, endons, var_7cbb9c6a, var_1e24f51b, var_33ce6852, ...)
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
		cur_time = cur_time + (float(function_60d95f53()) / 1000);
	}
	var_b3160f0.var_872a88cd = target_value;
	var_b3160f0.delta = var_b3160f0.target_value - var_88a4b08c;
	var_b3160f0.var_37e98bce = 1;
	util::function_50f54b6f(self, callback_func, var_b3160f0, vararg);
	if(isdefined(self))
	{
		self notify(#"hash_133229f708f5d10", {#hash_4ca73085:var_4ca73085, #callback_func:callback_func, #time:time, #target_value:target_value, #start_value:start_value});
	}
}

