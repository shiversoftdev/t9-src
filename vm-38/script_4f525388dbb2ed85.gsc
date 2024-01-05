#using script_35ae72be7b4fec10;
#using script_3dc93ca9902a9cda;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_d395170f;

/*
	Name: function_2d5134d3
	Namespace: namespace_d395170f
	Checksum: 0x3C64FB6
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2d5134d3()
{
	level notify(-312530187);
}

/*
	Name: __init__system__
	Namespace: namespace_d395170f
	Checksum: 0x3908F5F2
	Offset: 0xC0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_1a7d629e99e37eda", &function_c7f33cce, &function_fa076c68, undefined, undefined);
}

/*
	Name: function_c7f33cce
	Namespace: namespace_d395170f
	Checksum: 0x12FB60FD
	Offset: 0x118
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c7f33cce()
{
	function_ad272ef4();
	function_90ceecf8();
	function_7c9b0132();
}

/*
	Name: function_fa076c68
	Namespace: namespace_d395170f
	Checksum: 0x80F724D1
	Offset: 0x158
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fa076c68()
{
}

/*
	Name: function_ad272ef4
	Namespace: namespace_d395170f
	Checksum: 0x95C1FBC7
	Offset: 0x168
	Size: 0xBA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ad272ef4()
{
	if(!isdefined(level._fx))
	{
		level._fx = {};
	}
	if(!isdefined(level._fx.var_7b96a5ce))
	{
		level._fx.var_7b96a5ce = {};
	}
	if(!isdefined(level._fx.var_7b96a5ce.data))
	{
		level._fx.var_7b96a5ce.data = [];
	}
	if(!isdefined(level._fx.var_7b96a5ce.input))
	{
		level._fx.var_7b96a5ce.input = {};
	}
}

/*
	Name: function_7c9b0132
	Namespace: namespace_d395170f
	Checksum: 0xE3778B1E
	Offset: 0x230
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7c9b0132()
{
	/#
		function_5ac4dc99(#"hash_1614a5a56768d221", 0);
		function_cd140ee9(#"hash_1614a5a56768d221", &function_2c3c4513);
		function_5ac4dc99(#"hash_1c94e0c8a0d5dd72", 100);
	#/
}

/*
	Name: function_90ceecf8
	Namespace: namespace_d395170f
	Checksum: 0x586BB3E2
	Offset: 0x2C0
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_90ceecf8()
{
	callback::on_spawned(&_on_player_spawned);
}

/*
	Name: _on_player_spawned
	Namespace: namespace_d395170f
	Checksum: 0x3372EDD3
	Offset: 0x2F0
	Size: 0x52
	Parameters: 1
	Flags: Linked, Private
*/
function private _on_player_spawned(localclientnum)
{
	if(!isdefined(level._fx))
	{
		level._fx = {};
	}
	if(!isdefined(level._fx.player))
	{
		level._fx.player = self;
	}
}

/*
	Name: function_2c3c4513
	Namespace: namespace_d395170f
	Checksum: 0x875540FE
	Offset: 0x350
	Size: 0x1DC
	Parameters: 1
	Flags: Private
*/
function private function_2c3c4513(parms)
{
	/#
		if(parms.value == 1)
		{
			setdvar(#"hash_1ccb34f428b1a279", 0);
			level._fx.player val::set(#"hash_2636d41164c271c", "", 0);
			level._fx.player val::set(#"hash_2636d41164c271c", "", 1);
			level._fx.player val::set(#"hash_2636d41164c271c", "", 1);
			level._fx.player val::set(#"hash_2636d41164c271c", "", 1);
			adddebugcommand("");
			adddebugcommand("");
			function_28539d53();
		}
		else
		{
			function_7e383fce();
			adddebugcommand("");
			level._fx.player val::reset_all(#"hash_2636d41164c271c");
		}
	#/
}

/*
	Name: function_28539d53
	Namespace: namespace_d395170f
	Checksum: 0x839B265A
	Offset: 0x538
	Size: 0x7A4
	Parameters: 0
	Flags: Private
*/
function private function_28539d53()
{
	/#
		if(!isdefined(level._fx.var_7b96a5ce))
		{
			level._fx.var_7b96a5ce = {};
		}
		if(!isdefined(level._fx.var_7b96a5ce.var_fb619bb2))
		{
			level._fx.var_7b96a5ce.var_fb619bb2 = 1;
		}
		if(!isdefined(level._fx.var_7b96a5ce.data))
		{
			level._fx.var_7b96a5ce.data = [];
		}
		if(!isdefined(level._fx.var_7b96a5ce.input))
		{
			level._fx.var_7b96a5ce.input = {};
		}
		data = [];
		data[0] = function_7f9a08f5("", 0, 0, 10000, &function_3fbf6d4d);
		data[1] = function_7f9a08f5("", 1, 0.1, 999, &function_8e3051ee);
		data[2] = function_7f9a08f5("", 0, -1, 999, &function_5cc62c3a);
		data[3] = function_7f9a08f5("", -1, -1, 999, &function_41f9427c);
		data[4] = function_7f9a08f5("", 1, 0, 100, &function_640e61ea);
		data[5] = function_7f9a08f5("", 5, 0, 100, undefined);
		data[6] = function_7f9a08f5("", 0, 0, 100, &function_640e61ea);
		data[7] = function_7f9a08f5("", 0, 0, 100, undefined);
		data[8] = function_7f9a08f5("", 0, 0, 100, &function_640e61ea);
		data[9] = function_7f9a08f5("", 0, 0, 100, undefined);
		data[10] = function_7f9a08f5("", 2, 0.1, 100, undefined);
		level._fx.var_7b96a5ce.data = data;
		namespace_61e6d095::create(#"hash_579637b8c2a4ab78", #"hash_758c0eb59e11c69d");
		if(namespace_61e6d095::exists(#"hash_579637b8c2a4ab78"))
		{
			namespace_61e6d095::function_9ade1d9b(#"hash_579637b8c2a4ab78", "", int(level._fx.var_7b96a5ce.var_fb619bb2));
			for(i = 0; i < level._fx.var_7b96a5ce.data.size; i++)
			{
				namespace_61e6d095::set_count(#"hash_579637b8c2a4ab78", i);
				namespace_61e6d095::function_f2a9266(#"hash_579637b8c2a4ab78", i, "", 0);
				namespace_61e6d095::function_f2a9266(#"hash_579637b8c2a4ab78", i, "", 0);
				namespace_61e6d095::function_f2a9266(#"hash_579637b8c2a4ab78", i, "", level._fx.var_7b96a5ce.data[i].name);
				namespace_61e6d095::function_f2a9266(#"hash_579637b8c2a4ab78", i, "", string(level._fx.var_7b96a5ce.data[i].value, 1));
				_set_value(i, level._fx.var_7b96a5ce.data[i].value, 1);
			}
			function_d885deda(0);
			level thread function_f46326c5();
			buttons = [];
			buttons[buttons.size] = "";
			buttons[buttons.size] = "";
			buttons[buttons.size] = "";
			buttons[buttons.size] = "";
			buttons[buttons.size] = "";
			buttons[buttons.size] = "";
			buttons[buttons.size] = "";
			buttons[buttons.size] = "";
			buttons[buttons.size] = "";
			level._fx.player thread function_5402d440(level._fx.var_7b96a5ce.input, buttons);
			level._fx.player thread function_a11a465a(level._fx.var_7b96a5ce.input);
		}
	#/
}

/*
	Name: function_7e383fce
	Namespace: namespace_d395170f
	Checksum: 0x42A3EB18
	Offset: 0xCE8
	Size: 0xBE
	Parameters: 0
	Flags: Private
*/
function private function_7e383fce()
{
	/#
		level notify(#"hash_47e0ed0d8fb144dc");
		if(namespace_61e6d095::exists(#"hash_579637b8c2a4ab78"))
		{
			namespace_61e6d095::remove(#"hash_579637b8c2a4ab78");
		}
		if(isdefined(level._fx.var_7b96a5ce.var_4f5ffab2))
		{
			level._fx.var_7b96a5ce.var_4f5ffab2 delete();
		}
		level._fx.var_7b96a5ce = undefined;
	#/
}

/*
	Name: function_7f9a08f5
	Namespace: namespace_d395170f
	Checksum: 0x5CFE01F5
	Offset: 0xDB0
	Size: 0x9A
	Parameters: 5
	Flags: Private
*/
function private function_7f9a08f5(name, value, min, max, func)
{
	/#
		if(!isdefined(func))
		{
			func = undefined;
		}
		struct = {};
		struct.name = name;
		struct.value = value;
		struct.min = min;
		struct.max = max;
		struct.func = func;
		struct.var_c588e13c = 0;
		return struct;
	#/
}

/*
	Name: function_5402d440
	Namespace: namespace_d395170f
	Checksum: 0x2BC5201B
	Offset: 0xE58
	Size: 0x17A
	Parameters: 2
	Flags: Private
*/
function private function_5402d440(input, buttons)
{
	/#
		self notify("");
		self endon("");
		level endon(#"hash_47e0ed0d8fb144dc");
		while(true)
		{
			foreach(button in buttons)
			{
				input.(button + "") = input.(button);
				input.(button) = self buttonpressed(button);
				if(input.(button) && !isdefined(input.(button + "")))
				{
					input.(button + "") = gettime();
				}
				if(!input.(button))
				{
					input.(button + "") = undefined;
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_a11a465a
	Namespace: namespace_d395170f
	Checksum: 0x591739EC
	Offset: 0xFE0
	Size: 0x44C
	Parameters: 1
	Flags: Private
*/
function private function_a11a465a(input)
{
	/#
		self notify("");
		self endon("");
		level endon(#"hash_47e0ed0d8fb144dc");
		while(true)
		{
			selection = (isdefined(level._fx.var_7b96a5ce.selection) ? level._fx.var_7b96a5ce.selection : 0);
			current_time = gettime();
			var_5b49269e = getdvarint(#"hash_1c94e0c8a0d5dd72", 100);
			increment = 1;
			var_6738a51d = level._fx.var_7b96a5ce.data[1].value * 1000;
			if(input.button_ltrig)
			{
				increment = 0.1;
			}
			if(input.button_rtrig)
			{
				increment = 10;
			}
			if(input.button_ltrig && input.button_rtrig)
			{
				increment = 100;
			}
			if(input.dpad_left && !input.var_16788062 || (isdefined(input.dpad_left_pressed) && (current_time - input.dpad_left_pressed) > var_5b49269e))
			{
				selection--;
				function_d885deda(selection);
				input.dpad_left_pressed = current_time + var_5b49269e;
			}
			if(input.dpad_right && !input.var_66d92101 || (isdefined(input.dpad_right_pressed) && (current_time - input.dpad_right_pressed) > var_5b49269e))
			{
				selection++;
				function_d885deda(selection);
				input.dpad_right_pressed = current_time + var_5b49269e;
			}
			if(input.dpad_up && !input.var_df3d5273 || (isdefined(input.dpad_up_pressed) && (current_time - input.dpad_up_pressed) > var_5b49269e))
			{
				function_b9049406(selection, increment);
			}
			if(input.dpad_down && !input.var_8a047c03 || (isdefined(input.dpad_down_pressed) && (current_time - input.dpad_down_pressed) > var_5b49269e))
			{
				function_b9049406(selection, increment * -1);
			}
			if(input.button_x && !input.var_961b2129 || (isdefined(input.var_eaa99449) && (current_time - input.var_eaa99449) > var_5b49269e))
			{
				function_137a0af2();
				input.var_eaa99449 = current_time + var_5b49269e;
			}
			if(input.button_y && !input.var_d356f692 || (isdefined(input.var_6a06b2b8) && (current_time - input.var_6a06b2b8) > (var_5b49269e + var_6738a51d)))
			{
				function_8cd46b76();
				input.var_6a06b2b8 = (current_time + var_5b49269e) + var_6738a51d;
			}
			if(input.button_rstick && !input.var_d03fde02 || (isdefined(input.var_9c4f3609) && (current_time - input.var_9c4f3609) > var_5b49269e))
			{
				function_10175386();
				input.var_9c4f3609 = current_time + var_5b49269e;
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_d885deda
	Namespace: namespace_d395170f
	Checksum: 0xEA37683
	Offset: 0x1438
	Size: 0x152
	Parameters: 1
	Flags: Private
*/
function private function_d885deda(selection)
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		if(isdefined(level._fx.var_7b96a5ce.selection))
		{
			namespace_61e6d095::function_f2a9266(#"hash_579637b8c2a4ab78", level._fx.var_7b96a5ce.selection, "", 0);
		}
		if(selection < 0)
		{
			selection = level._fx.var_7b96a5ce.data.size - 1;
		}
		if(selection >= level._fx.var_7b96a5ce.data.size)
		{
			selection = 0;
		}
		snd::play("", level._fx.player);
		namespace_61e6d095::function_f2a9266(#"hash_579637b8c2a4ab78", selection, "", 1);
		level._fx.var_7b96a5ce.selection = selection;
	#/
}

/*
	Name: _set_value
	Namespace: namespace_d395170f
	Checksum: 0xF5C3E12C
	Offset: 0x1598
	Size: 0x18E
	Parameters: 3
	Flags: Private
*/
function private _set_value(index, newval, force_update)
{
	/#
		if(!isdefined(force_update))
		{
			force_update = 0;
		}
		level endon(#"hash_47e0ed0d8fb144dc");
		selected = level._fx.var_7b96a5ce.data[index];
		newval = _validate_value(index, newval);
		if(newval != selected.value || is_true(force_update))
		{
			if(is_false(force_update))
			{
				snd::play("", level._fx.player);
			}
			var_cb9bc389 = (isdefined(selected.var_cb9bc389) ? selected.var_cb9bc389 : string(newval, 1));
			namespace_61e6d095::function_f2a9266(#"hash_579637b8c2a4ab78", index, "", var_cb9bc389);
			level._fx.var_7b96a5ce.data[index].value = newval;
		}
	#/
}

/*
	Name: _validate_value
	Namespace: namespace_d395170f
	Checksum: 0x94527007
	Offset: 0x1730
	Size: 0x11C
	Parameters: 2
	Flags: Private
*/
function private _validate_value(index, newval)
{
	/#
		if(isdefined(level._fx.var_7b96a5ce.data[index].func))
		{
			newval = [[level._fx.var_7b96a5ce.data[index].func]](index, newval);
		}
		else
		{
			newval = function_1ee8f56b(newval, level._fx.var_7b96a5ce.data[index].min, level._fx.var_7b96a5ce.data[index].max);
		}
		return (round(newval * pow(10, 1))) / pow(10, 1);
	#/
}

/*
	Name: function_b9049406
	Namespace: namespace_d395170f
	Checksum: 0x942C9788
	Offset: 0x1858
	Size: 0x74
	Parameters: 3
	Flags: Private
*/
function private function_b9049406(index, increment, force_update)
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		_set_value(increment, level._fx.var_7b96a5ce.data[increment].value + force_update);
	#/
}

/*
	Name: function_8cd46b76
	Namespace: namespace_d395170f
	Checksum: 0x79409A10
	Offset: 0x18D8
	Size: 0x33C
	Parameters: 0
	Flags: Private
*/
function private function_8cd46b76()
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		if(!isdefined(level._fx.var_7b96a5ce.var_4f5ffab2))
		{
			function_137a0af2();
		}
		var_4f5ffab2 = level._fx.var_7b96a5ce.var_4f5ffab2.origin;
		radius = level._fx.var_7b96a5ce.data[0].value;
		duration = level._fx.var_7b96a5ce.data[1].value;
		rampup = level._fx.var_7b96a5ce.data[2].value;
		var_83ccc1d1 = level._fx.var_7b96a5ce.data[3].value;
		var_3f56d066 = level._fx.var_7b96a5ce.data[4].value;
		var_e0be7076 = level._fx.var_7b96a5ce.data[5].value;
		var_1ccf696c = level._fx.var_7b96a5ce.data[6].value;
		var_38fcd26f = level._fx.var_7b96a5ce.data[7].value;
		var_1ef3c0f = level._fx.var_7b96a5ce.data[8].value;
		var_74e9b7eb = level._fx.var_7b96a5ce.data[9].value;
		exponent = level._fx.var_7b96a5ce.data[10].value;
		screenshake(var_4f5ffab2, var_3f56d066, var_1ccf696c, var_1ef3c0f, duration, rampup, var_83ccc1d1, radius, var_e0be7076, var_38fcd26f, var_74e9b7eb, exponent);
		function_4e1b4554(var_4f5ffab2, var_3f56d066, var_1ccf696c, var_1ef3c0f, duration, rampup, var_83ccc1d1, radius, var_e0be7076, var_38fcd26f, var_74e9b7eb, exponent);
		if(is_true(level._fx.var_7b96a5ce.var_fb619bb2))
		{
			physicsexplosionsphere(var_4f5ffab2, int(radius), 0, 1);
		}
	#/
}

/*
	Name: function_137a0af2
	Namespace: namespace_d395170f
	Checksum: 0x50E7D5A
	Offset: 0x1C20
	Size: 0x1B2
	Parameters: 0
	Flags: Private
*/
function private function_137a0af2()
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		start = level._fx.player geteye();
		end = start + (anglestoforward(level._fx.player getplayerangles()) * 1000);
		trace = bullettrace(start, end, 1, level._fx.player);
		if(isdefined(trace[#"position"]))
		{
			if(isdefined(level._fx.var_7b96a5ce.var_4f5ffab2))
			{
				level._fx.var_7b96a5ce.var_4f5ffab2.origin = trace[#"position"];
				level._fx.var_7b96a5ce.var_4f5ffab2.angles = trace[#"normal"];
			}
			else
			{
				level._fx.var_7b96a5ce.var_4f5ffab2 = util::spawn_model("", trace[#"position"], trace[#"normal"]);
			}
		}
	#/
}

/*
	Name: function_10175386
	Namespace: namespace_d395170f
	Checksum: 0xF5690DB9
	Offset: 0x1DE0
	Size: 0xA4
	Parameters: 0
	Flags: Private
*/
function private function_10175386()
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		level._fx.var_7b96a5ce.var_fb619bb2 = !level._fx.var_7b96a5ce.var_fb619bb2;
		namespace_61e6d095::function_9ade1d9b(#"hash_579637b8c2a4ab78", "", int(level._fx.var_7b96a5ce.var_fb619bb2));
	#/
}

/*
	Name: function_f46326c5
	Namespace: namespace_d395170f
	Checksum: 0xDCC33F34
	Offset: 0x1E90
	Size: 0x186
	Parameters: 0
	Flags: Private
*/
function private function_f46326c5()
{
	/#
		self notify("");
		self endon("");
		level endon(#"hash_47e0ed0d8fb144dc");
		while(true)
		{
			if(isdefined(level._fx.var_7b96a5ce.var_4f5ffab2))
			{
				box(level._fx.var_7b96a5ce.var_4f5ffab2.origin, vectorscale((-1, -1, -1), 10), vectorscale((1, 1, 1), 10), 0, (0, 0, 0), 1, 0, 1);
				function_b95b9a60(level._fx.var_7b96a5ce.var_4f5ffab2.origin, level._fx.var_7b96a5ce.data[0].value, (1, 1, 1), 1, 0, 32, 1);
				debugstar(level._fx.var_7b96a5ce.var_4f5ffab2.origin, 1, (1, 0.65, 0), "", 0.5);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_4e1b4554
	Namespace: namespace_d395170f
	Checksum: 0x548C3232
	Offset: 0x2020
	Size: 0x1BC
	Parameters: 12
	Flags: Private
*/
function private function_4e1b4554(origin, var_3f56d066, var_1ccf696c, var_1ef3c0f, duration, rampup, var_83ccc1d1, radius, var_e0be7076, var_38fcd26f, var_74e9b7eb, exponent)
{
	/#
		header = "";
		footer = "";
		comma = "";
		output = ("" + origin) + "";
		output = output + (var_3f56d066 + comma);
		output = output + (var_1ccf696c + comma);
		output = output + (var_1ef3c0f + comma);
		output = output + (duration + comma);
		output = output + (rampup + comma);
		output = output + (var_83ccc1d1 + comma);
		output = output + (radius + comma);
		output = output + (var_e0be7076 + comma);
		output = output + (var_38fcd26f + comma);
		output = output + (var_74e9b7eb + comma);
		output = output + (exponent + "");
		println(header);
		println(output);
		println(footer);
	#/
}

/*
	Name: function_fdbd2395
	Namespace: namespace_d395170f
	Checksum: 0xFD70A6F5
	Offset: 0x21E8
	Size: 0x114
	Parameters: 2
	Flags: Private
*/
function private function_fdbd2395(var_15065e92, message)
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		snd::play("", level._fx.player);
		if(isarray(var_15065e92))
		{
			foreach(val in var_15065e92)
			{
				level thread function_c6c530d1(val, message);
			}
			return;
		}
		level thread function_c6c530d1(var_15065e92, message);
	#/
}

/*
	Name: function_c6c530d1
	Namespace: namespace_d395170f
	Checksum: 0xD21C072C
	Offset: 0x2308
	Size: 0x19E
	Parameters: 2
	Flags: Private
*/
function private function_c6c530d1(badval, message)
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		if(is_true(level._fx.var_7b96a5ce.data[badval].var_c588e13c))
		{
			return;
		}
		namespace_61e6d095::function_f2a9266(#"hash_579637b8c2a4ab78", badval, "", 1);
		namespace_61e6d095::function_f2a9266(#"hash_579637b8c2a4ab78", badval, "", message);
		level._fx.var_7b96a5ce.data[badval].var_c588e13c = 1;
		wait(1);
		namespace_61e6d095::function_f2a9266(#"hash_579637b8c2a4ab78", badval, "", 0);
		namespace_61e6d095::function_f2a9266(#"hash_579637b8c2a4ab78", badval, "", level._fx.var_7b96a5ce.data[badval].name);
		level._fx.var_7b96a5ce.data[badval].var_c588e13c = 0;
	#/
}

/*
	Name: function_1ee8f56b
	Namespace: namespace_d395170f
	Checksum: 0x9D46300F
	Offset: 0x24B0
	Size: 0x8A
	Parameters: 3
	Flags: Private
*/
function private function_1ee8f56b(value, min, max)
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		if(value < min || value > max)
		{
			snd::play("", level._fx.player);
		}
		return math::clamp(value, min, max);
	#/
}

/*
	Name: function_3fbf6d4d
	Namespace: namespace_d395170f
	Checksum: 0x3B4C5FDF
	Offset: 0x2548
	Size: 0xF2
	Parameters: 2
	Flags: Private
*/
function private function_3fbf6d4d(selection, newval)
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		newval = function_1ee8f56b(newval, level._fx.var_7b96a5ce.data[selection].min, level._fx.var_7b96a5ce.data[selection].max);
		if(newval == 0)
		{
			level._fx.var_7b96a5ce.data[selection].var_cb9bc389 = "";
		}
		else
		{
			level._fx.var_7b96a5ce.data[selection].var_cb9bc389 = undefined;
		}
		return newval;
	#/
}

/*
	Name: function_8e3051ee
	Namespace: namespace_d395170f
	Checksum: 0x62CDAA2E
	Offset: 0x2648
	Size: 0x12A
	Parameters: 2
	Flags: Private
*/
function private function_8e3051ee(selection, newval)
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		duration = level._fx.var_7b96a5ce.data[selection];
		var_a944706 = level._fx.var_7b96a5ce.data[2].value + level._fx.var_7b96a5ce.data[3].value;
		increment = newval - selection;
		if(var_a944706 > newval)
		{
			function_fdbd2395([1:3, 0:2], "");
			newval = var_a944706;
		}
		return function_1ee8f56b(newval, duration.min, duration.max);
	#/
}

/*
	Name: function_5cc62c3a
	Namespace: namespace_d395170f
	Checksum: 0x4C591F97
	Offset: 0x2780
	Size: 0x17A
	Parameters: 2
	Flags: Private
*/
function private function_5cc62c3a(selection, newval)
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		rampup = level._fx.var_7b96a5ce.data[selection];
		var_83ccc1d1 = level._fx.var_7b96a5ce.data[3];
		duration = level._fx.var_7b96a5ce.data[1];
		var_a944706 = math::clamp(newval, 0, rampup.max) + math::clamp(var_83ccc1d1.value, 0, var_83ccc1d1.max);
		if(var_a944706 > duration.value)
		{
			function_fdbd2395([1:3, 0:1], "");
			newval = rampup.value;
		}
		return function_1ee8f56b(newval, rampup.min, rampup.max);
	#/
}

/*
	Name: function_41f9427c
	Namespace: namespace_d395170f
	Checksum: 0x4812763C
	Offset: 0x2908
	Size: 0x17A
	Parameters: 2
	Flags: Private
*/
function private function_41f9427c(selection, newval)
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		rampup = level._fx.var_7b96a5ce.data[2];
		var_83ccc1d1 = level._fx.var_7b96a5ce.data[selection];
		duration = level._fx.var_7b96a5ce.data[1];
		var_a944706 = math::clamp(newval, 0, var_83ccc1d1.max) + math::clamp(rampup.value, 0, rampup.max);
		if(var_a944706 > duration.value)
		{
			function_fdbd2395([1:2, 0:1], "");
			newval = var_83ccc1d1.value;
		}
		return function_1ee8f56b(newval, var_83ccc1d1.min, var_83ccc1d1.max);
	#/
}

/*
	Name: function_640e61ea
	Namespace: namespace_d395170f
	Checksum: 0x2A51F01B
	Offset: 0x2A90
	Size: 0x202
	Parameters: 2
	Flags: Private
*/
function private function_640e61ea(selection, newval)
{
	/#
		level endon(#"hash_47e0ed0d8fb144dc");
		selected = level._fx.var_7b96a5ce.data[selection];
		var_3f56d066 = (selection == 4 ? newval : level._fx.var_7b96a5ce.data[4].value);
		var_1ccf696c = (selection == 6 ? newval : level._fx.var_7b96a5ce.data[6].value);
		var_1ef3c0f = (selection == 8 ? newval : level._fx.var_7b96a5ce.data[8].value);
		if(var_3f56d066 == 0 && var_1ccf696c == 0 && var_1ef3c0f == 0)
		{
			var_15065e92 = [];
			var_15065e92[var_15065e92.size] = 4;
			var_15065e92[var_15065e92.size] = 6;
			var_15065e92[var_15065e92.size] = 8;
			var_15065e92 = array::exclude(var_15065e92, selection);
			function_fdbd2395(var_15065e92, "");
			newval = selected.value;
		}
		return function_1ee8f56b(newval, selected.min, selected.max);
	#/
}

