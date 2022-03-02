#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

class class_d5e68311 
{
	var var_f141235b;
	var var_e7fdf736;
	var var_ec13f56d;
	var var_884ed4f;
	var var_2d9de19e;
	var var_4fc15b0b;
	var var_450307dc;
	var var_fef76413;
	var var_e1c25a48;
	var var_3d18872;
	var var_21ab02f3;
	var var_e93e3086;
	var var_2df3d617;
	var var_89c30c57;
	var var_b228f30;
	var var_76c10824;

	/*
		Name: constructor
		Namespace: namespace_d5e68311
		Checksum: 0x3B2B9246
		Offset: 0xD8
		Size: 0xD6
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_f141235b = 0;
		self.var_884ed4f = undefined;
		self.var_e93e3086 = (15, -3, 0);
		self.var_3d18872 = (0, 0, 0);
		self.var_2df3d617 = (0, 0, 0);
		self.var_21ab02f3 = (0, 0, 0);
		self.var_4fc15b0b = (15, -3, 0);
		self.var_2d9de19e = (0, 0, 0);
		self.var_450307dc = "";
		self.var_fef76413 = 0;
		self.var_76c10824 = 1;
		self.var_b228f30 = 0;
		self.var_89c30c57 = 0;
		self.var_ec13f56d = 1;
		self.var_e7fdf736 = 5;
		self.var_e1c25a48 = 0;
	}

	/*
		Name: destructor
		Namespace: namespace_d5e68311
		Checksum: 0x80F724D1
		Offset: 0xB00
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_7c6cd9d
		Namespace: namespace_d5e68311
		Checksum: 0x8AE4E480
		Offset: 0x990
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_7c6cd9d()
	{
		return var_f141235b;
	}

	/*
		Name: function_13f1dc62
		Namespace: namespace_d5e68311
		Checksum: 0x633C1B07
		Offset: 0xAC0
		Size: 0x34
		Parameters: 0
		Flags: Linked
	*/
	function function_13f1dc62()
	{
		return {#max:var_e7fdf736, #enabled:var_ec13f56d};
	}

	/*
		Name: update_settings
		Namespace: namespace_d5e68311
		Checksum: 0x566853E9
		Offset: 0x228
		Size: 0xDC
		Parameters: 4
		Flags: Linked
	*/
	function update_settings(var_4ce74bd9, var_40779d0d, var_447b7d9b, var_4c987939)
	{
		if(!isdefined(var_4ce74bd9))
		{
			var_4ce74bd9 = (15, -3, 0);
		}
		if(!isdefined(var_40779d0d))
		{
			var_40779d0d = (0, 0, 0);
		}
		if(!isdefined(var_447b7d9b))
		{
			var_447b7d9b = 1;
		}
		if(!isdefined(var_4c987939))
		{
			var_4c987939 = 1;
		}
		self.var_e93e3086 = var_4ce74bd9;
		self.var_3d18872 = var_40779d0d;
		self.var_76c10824 = var_447b7d9b;
		self.var_ec13f56d = var_4c987939;
		if(isdefined(var_884ed4f))
		{
			reset_position();
			set_position(var_4fc15b0b, var_2d9de19e);
		}
	}

	/*
		Name: function_2e49d5cb
		Namespace: namespace_d5e68311
		Checksum: 0xC3501B93
		Offset: 0x310
		Size: 0x3DC
		Parameters: 2
		Flags: Linked
	*/
	function function_2e49d5cb(var_53008658, is_hidden)
	{
		if(!isdefined(var_53008658))
		{
			var_53008658 = "";
		}
		if(!isdefined(is_hidden))
		{
			is_hidden = 0;
		}
		var_38d97d58 = getscriptbundle(var_53008658);
		if(!isdefined(var_38d97d58))
		{
			var_38d97d58 = {};
		}
		model_name = (isdefined(var_38d97d58.uimodel) ? var_38d97d58.uimodel : "");
		var_4efbbcfe = (isdefined(var_38d97d58.var_4efbbcfe) ? var_38d97d58.var_4efbbcfe : 0);
		var_4138e7ed = (isdefined(var_38d97d58.var_4138e7ed) ? var_38d97d58.var_4138e7ed : 0);
		var_53be913a = (isdefined(var_38d97d58.var_53be913a) ? var_38d97d58.var_53be913a : 5);
		positionoffset = ((isdefined(var_38d97d58.var_d5122ada) ? var_38d97d58.var_d5122ada : 0), (isdefined(var_38d97d58.var_1769dd84) ? var_38d97d58.var_1769dd84 : 0), (isdefined(var_38d97d58.var_c2ab113) ? var_38d97d58.var_c2ab113 : 0));
		angleoffset = ((isdefined(var_38d97d58.var_83f65202) ? var_38d97d58.var_83f65202 : 0), (isdefined(var_38d97d58.var_b1e8fdfd) ? var_38d97d58.var_b1e8fdfd : 0), (isdefined(var_38d97d58.var_ce8030c8) ? var_38d97d58.var_ce8030c8 : 0));
		if(var_450307dc == model_name)
		{
			return;
		}
		self.var_450307dc = model_name;
		self.var_b228f30 = var_4efbbcfe;
		self.var_89c30c57 = var_4138e7ed;
		self.var_e7fdf736 = var_53be913a;
		self.var_2df3d617 = positionoffset;
		self.var_21ab02f3 = angleoffset;
		self.var_e1c25a48 = is_hidden;
		reset_position();
		if(model_name != "")
		{
			if(!isdefined(var_884ed4f))
			{
				self.var_884ed4f = spawn(var_f141235b, (0, 0, 0), "script_model");
			}
			var_884ed4f setmodel(model_name);
			set_position(var_4fc15b0b, var_2d9de19e);
			self.var_fef76413 = 1;
		}
		else if(is_true(var_fef76413))
		{
			var_884ed4f unlinkfromcamera();
			self.var_fef76413 = 0;
			var_884ed4f delete();
		}
		if(isdefined(var_884ed4f))
		{
			if(is_hidden)
			{
				var_884ed4f function_bf9d3071(#"hash_1d4878635b5ea5a3");
			}
			else
			{
				var_884ed4f function_5d482e78(#"hash_1d4878635b5ea5a3");
			}
		}
	}

	/*
		Name: function_2e66587b
		Namespace: namespace_d5e68311
		Checksum: 0xB84EC6F3
		Offset: 0x7F0
		Size: 0x2A
		Parameters: 1
		Flags: Linked
	*/
	function function_2e66587b(var_4c987939)
	{
		if(!isdefined(var_4c987939))
		{
			var_4c987939 = 1;
		}
		self.var_ec13f56d = var_4c987939;
	}

	/*
		Name: reset
		Namespace: namespace_d5e68311
		Checksum: 0x2F0A1A5B
		Offset: 0x6F8
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function reset()
	{
		self.var_f141235b = 0;
		function_2e49d5cb();
		function_56293490();
		reset_position();
	}

	/*
		Name: function_56293490
		Namespace: namespace_d5e68311
		Checksum: 0x3BED1E88
		Offset: 0x918
		Size: 0x26
		Parameters: 0
		Flags: Linked
	*/
	function function_56293490()
	{
		self.var_e93e3086 = (15, -3, 0);
		self.var_3d18872 = (0, 0, 0);
	}

	/*
		Name: is_hidden
		Namespace: namespace_d5e68311
		Checksum: 0xF703DF90
		Offset: 0xA40
		Size: 0x1A
		Parameters: 0
		Flags: Linked
	*/
	function is_hidden()
	{
		return is_true(var_e1c25a48);
	}

	/*
		Name: function_62571daf
		Namespace: namespace_d5e68311
		Checksum: 0x9199B819
		Offset: 0x9C8
		Size: 0x14
		Parameters: 0
		Flags: Linked
	*/
	function function_62571daf()
	{
		return var_3d18872 + var_21ab02f3;
	}

	/*
		Name: function_6e7ad37e
		Namespace: namespace_d5e68311
		Checksum: 0x3DA75F53
		Offset: 0x9A8
		Size: 0x14
		Parameters: 0
		Flags: Linked
	*/
	function function_6e7ad37e()
	{
		return var_e93e3086 + var_2df3d617;
	}

	/*
		Name: function_75aa931a
		Namespace: namespace_d5e68311
		Checksum: 0x369A2EA6
		Offset: 0xA18
		Size: 0x1A
		Parameters: 0
		Flags: Linked
	*/
	function function_75aa931a()
	{
		return is_true(var_fef76413);
	}

	/*
		Name: function_77f3574b
		Namespace: namespace_d5e68311
		Checksum: 0x8B117B6B
		Offset: 0x828
		Size: 0x32
		Parameters: 1
		Flags: Linked
	*/
	function function_77f3574b(var_4ce74bd9)
	{
		if(!isdefined(var_4ce74bd9))
		{
			var_4ce74bd9 = (15, -3, 0);
		}
		self.var_e93e3086 = var_4ce74bd9;
	}

	/*
		Name: function_811485db
		Namespace: namespace_d5e68311
		Checksum: 0x85399952
		Offset: 0x748
		Size: 0x62
		Parameters: 1
		Flags: Linked
	*/
	function function_811485db(local_client_num)
	{
		if(!isdefined(local_client_num))
		{
			local_client_num = 0;
		}
		/#
			assert(local_client_num >= 0 && local_client_num < getmaxlocalclients());
		#/
		self.var_f141235b = local_client_num;
	}

	/*
		Name: function_99803944
		Namespace: namespace_d5e68311
		Checksum: 0xA5B55613
		Offset: 0xA00
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_99803944()
	{
		return var_2d9de19e;
	}

	/*
		Name: set_defaults
		Namespace: namespace_d5e68311
		Checksum: 0x46F3864B
		Offset: 0x1B8
		Size: 0x64
		Parameters: 5
		Flags: Linked
	*/
	function set_defaults(local_client_num, var_4ce74bd9, var_40779d0d, var_447b7d9b, var_4c987939)
	{
		if(!isdefined(local_client_num))
		{
			local_client_num = 0;
		}
		self.var_f141235b = local_client_num;
		update_settings(var_4ce74bd9, var_40779d0d, var_447b7d9b, var_4c987939);
	}

	/*
		Name: set_position
		Namespace: namespace_d5e68311
		Checksum: 0xB28E028E
		Offset: 0x8A0
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function set_position(origin, angle)
	{
		if(isdefined(origin))
		{
			self.var_4fc15b0b = origin;
		}
		if(isdefined(angle))
		{
			self.var_2d9de19e = angle;
		}
		var_884ed4f linktocamera(4, var_4fc15b0b, var_2d9de19e);
	}

	/*
		Name: function_d5f29651
		Namespace: namespace_d5e68311
		Checksum: 0xFEAC4457
		Offset: 0x868
		Size: 0x2A
		Parameters: 1
		Flags: Linked
	*/
	function function_d5f29651(var_40779d0d)
	{
		if(!isdefined(var_40779d0d))
		{
			var_40779d0d = (0, 0, 0);
		}
		self.var_3d18872 = var_40779d0d;
	}

	/*
		Name: function_e3f38520
		Namespace: namespace_d5e68311
		Checksum: 0x6190798C
		Offset: 0x7B8
		Size: 0x2A
		Parameters: 1
		Flags: Linked
	*/
	function function_e3f38520(var_447b7d9b)
	{
		if(!isdefined(var_447b7d9b))
		{
			var_447b7d9b = 1;
		}
		self.var_76c10824 = var_447b7d9b;
	}

	/*
		Name: get_origin
		Namespace: namespace_d5e68311
		Checksum: 0x621ED3EE
		Offset: 0x9E8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function get_origin()
	{
		return var_4fc15b0b;
	}

	/*
		Name: reset_position
		Namespace: namespace_d5e68311
		Checksum: 0x3DA8D980
		Offset: 0x948
		Size: 0x3A
		Parameters: 0
		Flags: Linked
	*/
	function reset_position()
	{
		self.var_4fc15b0b = var_e93e3086 + var_2df3d617;
		self.var_2d9de19e = var_3d18872 + var_21ab02f3;
	}

	/*
		Name: function_fbdfd5f9
		Namespace: namespace_d5e68311
		Checksum: 0xFAC4EFED
		Offset: 0xA68
		Size: 0x4C
		Parameters: 0
		Flags: Linked
	*/
	function function_fbdfd5f9()
	{
		return {#hash_8d3781b5:var_89c30c57, #hash_71fe4b43:var_b228f30, #enabled:var_76c10824};
	}

}

#namespace namespace_a9076ee3;

/*
	Name: function_89f2df9
	Namespace: namespace_a9076ee3
	Checksum: 0x5E057872
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_19a39574bfda1b56", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: string_to_vector
	Namespace: namespace_a9076ee3
	Checksum: 0x7FB4DC84
	Offset: 0xF88
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function string_to_vector(var_56c2f5d3)
{
	components = [];
	components = strtok(var_56c2f5d3, ",");
	if(!isdefined(components[0]))
	{
		components[0] = 0;
	}
	if(!isdefined(components[1]))
	{
		components[1] = 0;
	}
	if(!isdefined(components[2]))
	{
		components[2] = 0;
	}
	return (int(components[0]), int(components[1]), int(components[2]));
}

/*
	Name: function_70a657d8
	Namespace: namespace_a9076ee3
	Checksum: 0xE6D5D05B
	Offset: 0x1060
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	var_5d7dbefc = new class_d5e68311();
	level.var_5d7dbefc = var_5d7dbefc;
	level thread function_3adc69b0();
}

/*
	Name: function_3adc69b0
	Namespace: namespace_a9076ee3
	Checksum: 0x826D3CDD
	Offset: 0x10B0
	Size: 0x296
	Parameters: 0
	Flags: Linked
*/
function function_3adc69b0()
{
	level endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_75c7d1b212499a1b");
		switch(waitresult.event_name)
		{
			case "start":
			{
				if(isdefined(waitresult.origin) && isstring(waitresult.origin))
				{
					waitresult.origin = string_to_vector(waitresult.origin);
				}
				if(isdefined(waitresult.angle) && isstring(waitresult.angle))
				{
					waitresult.angle = string_to_vector(waitresult.angle);
				}
				function_98095ab5(waitresult.local_client_num, waitresult.origin, waitresult.angle, waitresult.var_447b7d9b, waitresult.var_4c987939);
				break;
			}
			case "hash_76650d44ad5ebc06":
			{
				function_159ea549(waitresult.var_53008658, waitresult.is_hidden);
				break;
			}
			case "update_settings":
			{
				if(isdefined(waitresult.origin) && isstring(waitresult.origin))
				{
					waitresult.origin = string_to_vector(waitresult.origin);
				}
				if(isdefined(waitresult.angle) && isstring(waitresult.angle))
				{
					waitresult.angle = string_to_vector(waitresult.angle);
				}
				function_24de0369(waitresult.origin, waitresult.angle, waitresult.var_447b7d9b, waitresult.var_4c987939);
				break;
			}
			case "stop":
			{
				function_fdff8886();
				break;
			}
		}
	}
}

/*
	Name: function_98095ab5
	Namespace: namespace_a9076ee3
	Checksum: 0x3286B55
	Offset: 0x1350
	Size: 0x74
	Parameters: 5
	Flags: Linked
*/
function function_98095ab5(local_client_num, origin, angle, var_447b7d9b, var_4c987939)
{
	level notify(#"hash_44d89707d01c9949");
	[[ level.var_5d7dbefc ]]->set_defaults(local_client_num, origin, angle, var_447b7d9b, var_4c987939);
	level thread function_aab851cf();
}

/*
	Name: function_159ea549
	Namespace: namespace_a9076ee3
	Checksum: 0x282CC9B6
	Offset: 0x13D0
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function function_159ea549(var_53008658, is_hidden)
{
	[[ level.var_5d7dbefc ]]->function_2e49d5cb(var_53008658, is_hidden);
}

/*
	Name: function_24de0369
	Namespace: namespace_a9076ee3
	Checksum: 0x81B722F1
	Offset: 0x1408
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function function_24de0369(origin, angle, var_447b7d9b, var_4c987939)
{
	[[ level.var_5d7dbefc ]]->update_settings(origin, angle, var_447b7d9b, var_4c987939);
}

/*
	Name: function_fdff8886
	Namespace: namespace_a9076ee3
	Checksum: 0x63363535
	Offset: 0x1458
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_fdff8886()
{
	level notify(#"hash_553672f4d62ba043");
	[[ level.var_5d7dbefc ]]->reset();
}

/*
	Name: function_5fb947f1
	Namespace: namespace_a9076ee3
	Checksum: 0xB53807F6
	Offset: 0x1490
	Size: 0xD8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5fb947f1(localclientnum)
{
	input = (0, 0, 0);
	if(gamepadusedlast(localclientnum))
	{
		var_89c3fd26 = util::function_11f127f0(localclientnum);
		var_fc5fe2b2 = util::function_b5338ccb(var_89c3fd26.x, 0.2);
		var_a7ae3950 = util::function_b5338ccb(var_89c3fd26.y, 0.2);
		input = (var_fc5fe2b2, var_a7ae3950, 0);
	}
	else
	{
		input = function_6593be12(localclientnum) * (1, -1, 0);
	}
	return input;
}

/*
	Name: function_58df12d3
	Namespace: namespace_a9076ee3
	Checksum: 0x101C84E1
	Offset: 0x1570
	Size: 0xFE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_58df12d3(localclientnum)
{
	input = 0;
	if(gamepadusedlast(localclientnum))
	{
		var_43bc2604 = util::function_57f1ac46(localclientnum);
		var_b16a628 = util::function_f35576c(localclientnum);
		input = var_43bc2604 - var_b16a628;
	}
	else
	{
		player = function_5c10bd79(localclientnum);
		input = getdvarfloat(#"hash_5dd7d8a561f705fe", 1) * (isdefined(player.var_5b9b8e89) ? player.var_5b9b8e89 : 0);
		player.var_5b9b8e89 = 0;
	}
	return input;
}

/*
	Name: function_78e6ae5d
	Namespace: namespace_a9076ee3
	Checksum: 0xC4EB20DD
	Offset: 0x1678
	Size: 0x96
	Parameters: 0
	Flags: Linked, Private
*/
function private function_78e6ae5d()
{
	while(isdefined(self))
	{
		result = undefined;
		result = level waittill(#"hash_68828ba5cef2341e");
		if(isdefined(result.param1))
		{
			player = function_5c10bd79([[ self ]]->function_7c6cd9d());
			player.var_5b9b8e89 = int(result.param1);
		}
	}
}

/*
	Name: function_aab851cf
	Namespace: namespace_a9076ee3
	Checksum: 0x12DDD8B1
	Offset: 0x1718
	Size: 0x502
	Parameters: 0
	Flags: Linked, Private
*/
function private function_aab851cf()
{
	level endon(#"disconnect", #"hash_44d89707d01c9949", #"hash_553672f4d62ba043");
	level.var_5d7dbefc thread function_78e6ae5d();
	while(isdefined(level.var_5d7dbefc))
	{
		var_4ce74bd9 = [[ level.var_5d7dbefc ]]->function_6e7ad37e();
		var_40779d0d = [[ level.var_5d7dbefc ]]->function_62571daf();
		if(![[ level.var_5d7dbefc ]]->function_75aa931a())
		{
			waitframe(1);
			continue;
		}
		local_client_num = [[ level.var_5d7dbefc ]]->function_7c6cd9d();
		player = function_5c10bd79(local_client_num);
		time = player getclienttime();
		waitframe(1);
		player = function_5c10bd79(local_client_num);
		delta_time = (player getclienttime() - time) / 1000;
		var_59ab9a62 = [[ level.var_5d7dbefc ]]->function_fbdfd5f9();
		var_20eb713c = [[ level.var_5d7dbefc ]]->function_13f1dc62();
		v_origin = [[ level.var_5d7dbefc ]]->get_origin();
		v_angle = [[ level.var_5d7dbefc ]]->function_99803944();
		var_dbceb0e1 = 0;
		if(is_true(var_59ab9a62.enabled) && !([[ level.var_5d7dbefc ]]->is_hidden()))
		{
			var_1b56e5cf = function_5fb947f1(local_client_num);
			if(var_1b56e5cf != (0, 0, 0))
			{
				var_dbceb0e1 = 1;
				angle_offset = (var_1b56e5cf * 60) * delta_time;
				yaw = angle_offset[0];
				pitch = angle_offset[1];
				v_angle = v_angle + (pitch, yaw, 0);
				var_3faba1b8 = v_angle[1];
				var_8e72201d = v_angle[0];
				if(isdefined(var_59ab9a62.var_71fe4b43) && var_59ab9a62.var_71fe4b43 !== 0)
				{
					if(var_3faba1b8 < var_59ab9a62.var_71fe4b43 * -1)
					{
						var_3faba1b8 = var_59ab9a62.var_71fe4b43 * -1;
					}
					else if(var_3faba1b8 > var_59ab9a62.var_71fe4b43)
					{
						var_3faba1b8 = var_59ab9a62.var_71fe4b43;
					}
				}
				if(isdefined(var_59ab9a62.var_8d3781b5) && var_59ab9a62.var_8d3781b5 !== 0)
				{
					if(var_8e72201d < var_59ab9a62.var_8d3781b5 * -1)
					{
						var_8e72201d = var_59ab9a62.var_8d3781b5 * -1;
					}
					else if(var_8e72201d > var_59ab9a62.var_8d3781b5)
					{
						var_8e72201d = var_59ab9a62.var_8d3781b5;
					}
				}
				v_angle = (var_8e72201d, var_3faba1b8, 0);
			}
		}
		if(is_true(var_20eb713c.enabled) && !([[ level.var_5d7dbefc ]]->is_hidden()))
		{
			var_a23c6f11 = function_58df12d3(local_client_num);
			if(var_a23c6f11 != 0)
			{
				var_dbceb0e1 = 1;
				zoom_speed = 6;
				dist = v_origin[0] + ((var_a23c6f11 * zoom_speed) * delta_time);
				min_distance = var_4ce74bd9[0] - var_20eb713c.max;
				max_distance = var_4ce74bd9[0];
				if(dist < min_distance)
				{
					dist = min_distance;
				}
				else if(dist > max_distance)
				{
					dist = max_distance;
				}
				v_origin = (dist, v_origin[1], v_origin[2]);
			}
		}
		if(var_dbceb0e1 == 1)
		{
			[[ level.var_5d7dbefc ]]->set_position(v_origin, v_angle);
		}
		time = player getclienttime();
	}
}

