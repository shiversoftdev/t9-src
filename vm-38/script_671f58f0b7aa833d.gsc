#using script_35ae72be7b4fec10;
#using script_3dc93ca9902a9cda;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace namespace_9fe28d6e;

/*
	Name: function_d3f5d197
	Namespace: namespace_9fe28d6e
	Checksum: 0xBA436B42
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d3f5d197()
{
	level notify(613409347);
}

/*
	Name: function_89f2df9
	Namespace: namespace_9fe28d6e
	Checksum: 0xAD3D5F5
	Offset: 0x100
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_38469cb55dd6355a", &function_c7f33cce, &function_fa076c68, undefined, undefined);
}

/*
	Name: function_c7f33cce
	Namespace: namespace_9fe28d6e
	Checksum: 0xBA7A07EE
	Offset: 0x158
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
	Namespace: namespace_9fe28d6e
	Checksum: 0x80F724D1
	Offset: 0x198
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fa076c68()
{
}

/*
	Name: function_ad272ef4
	Namespace: namespace_9fe28d6e
	Checksum: 0xC3A9A02E
	Offset: 0x1A8
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
	if(!isdefined(level._fx.var_de0019ea))
	{
		level._fx.var_de0019ea = {};
	}
	if(!isdefined(level._fx.var_de0019ea.data))
	{
		level._fx.var_de0019ea.data = [];
	}
	if(!isdefined(level._fx.var_de0019ea.input))
	{
		level._fx.var_de0019ea.input = {};
	}
}

/*
	Name: function_7c9b0132
	Namespace: namespace_9fe28d6e
	Checksum: 0x1C622E04
	Offset: 0x270
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7c9b0132()
{
	/#
		function_5ac4dc99(#"hash_1ccb34f428b1a279", 0);
		function_cd140ee9(#"hash_1ccb34f428b1a279", &function_93945397);
		function_5ac4dc99(#"hash_6d342deda30a228a", 100);
		function_5ac4dc99(#"hash_79ddea850d94a804", 0.5);
	#/
}

/*
	Name: function_90ceecf8
	Namespace: namespace_9fe28d6e
	Checksum: 0xC262374C
	Offset: 0x328
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_90ceecf8()
{
	callback::on_spawned(&function_e4a4b07b);
}

/*
	Name: function_e4a4b07b
	Namespace: namespace_9fe28d6e
	Checksum: 0x32F22BD2
	Offset: 0x358
	Size: 0x52
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e4a4b07b(localclientnum)
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
	Name: function_93945397
	Namespace: namespace_9fe28d6e
	Checksum: 0x1D712B23
	Offset: 0x3B8
	Size: 0x1DC
	Parameters: 1
	Flags: Private
*/
function private function_93945397(parms)
{
	/#
		if(parms.value == 1)
		{
			setdvar(#"hash_1614a5a56768d221", 0);
			level._fx.player val::set(#"hash_36c3761ec21ee4ac", "", 0);
			level._fx.player val::set(#"hash_36c3761ec21ee4ac", "", 1);
			level._fx.player val::set(#"hash_36c3761ec21ee4ac", "", 1);
			level._fx.player val::set(#"hash_36c3761ec21ee4ac", "", 1);
			adddebugcommand("");
			adddebugcommand("");
			function_8af93a7();
		}
		else
		{
			function_263df0ea();
			adddebugcommand("");
			level._fx.player val::reset_all(#"hash_36c3761ec21ee4ac");
		}
	#/
}

/*
	Name: function_8af93a7
	Namespace: namespace_9fe28d6e
	Checksum: 0x621C7883
	Offset: 0x5A0
	Size: 0x21C
	Parameters: 0
	Flags: Private
*/
function private function_8af93a7()
{
	/#
		namespace_61e6d095::create(#"hash_2f8c229e8241a3a0", #"hash_355d1782cf92b25");
		if(namespace_61e6d095::exists(#"hash_2f8c229e8241a3a0"))
		{
			if(!isdefined(level._fx.var_de0019ea))
			{
				level._fx.var_de0019ea = {};
			}
			if(!isdefined(level._fx.var_de0019ea.data))
			{
				level._fx.var_de0019ea.data = [];
			}
			if(!isdefined(level._fx.var_de0019ea.input))
			{
				level._fx.var_de0019ea.input = {};
			}
			level._fx.var_de0019ea.var_bebc9d74 = 0;
			level thread function_56e7d0e3();
			function_d885deda(0);
			level thread function_2e225b16();
			buttons = [];
			buttons[buttons.size] = "";
			buttons[buttons.size] = "";
			buttons[buttons.size] = "";
			level._fx.player thread function_5402d440(level._fx.var_de0019ea.input, buttons);
			level._fx.player thread function_a11a465a(level._fx.var_de0019ea.input);
		}
	#/
}

/*
	Name: function_56e7d0e3
	Namespace: namespace_9fe28d6e
	Checksum: 0xF4E0FCE7
	Offset: 0x7C8
	Size: 0x418
	Parameters: 0
	Flags: Private
*/
function private function_56e7d0e3()
{
	/#
		self notify("");
		self endon("");
		level endon(#"hash_d28501bd896672c");
		while(true)
		{
			if(namespace_61e6d095::exists(#"hash_2f8c229e8241a3a0"))
			{
				for(i = 0; i < level._fx.var_de0019ea.var_bebc9d74; i++)
				{
					namespace_61e6d095::function_7239e030(#"hash_2f8c229e8241a3a0", i);
				}
				count = 0;
				foreach(entry in level._fx.var_de0019ea.data)
				{
					namespace_61e6d095::set_count(#"hash_2f8c229e8241a3a0", count);
					namespace_61e6d095::function_f2a9266(#"hash_2f8c229e8241a3a0", count, "", entry.var_c6bf081d);
					namespace_61e6d095::function_f2a9266(#"hash_2f8c229e8241a3a0", count, "", entry.is_active);
					namespace_61e6d095::function_f2a9266(#"hash_2f8c229e8241a3a0", count, "", entry.var_dd94a1e3);
					namespace_61e6d095::function_f2a9266(#"hash_2f8c229e8241a3a0", count, "", entry.locations.size);
					namespace_61e6d095::function_f2a9266(#"hash_2f8c229e8241a3a0", count, "", string(float(entry.distance.min), 1));
					namespace_61e6d095::function_f2a9266(#"hash_2f8c229e8241a3a0", count, "", string(float(entry.distance.max), 1));
					namespace_61e6d095::function_f2a9266(#"hash_2f8c229e8241a3a0", count, "", string(float(entry.delay.min), 1));
					namespace_61e6d095::function_f2a9266(#"hash_2f8c229e8241a3a0", count, "", string(float(entry.delay.max), 1));
					count++;
				}
				level._fx.var_de0019ea.var_bebc9d74 = count;
			}
			level waittill(#"hash_51a762912b76bdc1");
		}
	#/
}

/*
	Name: function_263df0ea
	Namespace: namespace_9fe28d6e
	Checksum: 0xA3D66232
	Offset: 0xBE8
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private function_263df0ea()
{
	/#
		level notify(#"hash_d28501bd896672c");
		if(namespace_61e6d095::exists(#"hash_2f8c229e8241a3a0"))
		{
			namespace_61e6d095::remove(#"hash_2f8c229e8241a3a0");
		}
	#/
}

/*
	Name: function_5402d440
	Namespace: namespace_9fe28d6e
	Checksum: 0x8A6DD4E
	Offset: 0xC58
	Size: 0x15A
	Parameters: 2
	Flags: Private
*/
function private function_5402d440(input, buttons)
{
	/#
		level endon(#"hash_d28501bd896672c");
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
	Namespace: namespace_9fe28d6e
	Checksum: 0x95D187DA
	Offset: 0xDC0
	Size: 0x224
	Parameters: 1
	Flags: Private
*/
function private function_a11a465a(input)
{
	/#
		self notify("");
		self endon("");
		level endon(#"hash_d28501bd896672c");
		while(true)
		{
			selection = (isdefined(level._fx.var_de0019ea.selection) ? level._fx.var_de0019ea.selection : 0);
			current_time = gettime();
			var_5b49269e = getdvarint(#"hash_6d342deda30a228a", 100);
			if(input.dpad_up && !input.var_df3d5273 || (isdefined(input.dpad_up_pressed) && (current_time - input.dpad_up_pressed) > var_5b49269e))
			{
				selection--;
				function_d885deda(selection);
				input.dpad_up_pressed = current_time + var_5b49269e;
			}
			if(input.dpad_down && !input.var_8a047c03 || (isdefined(input.dpad_down_pressed) && (current_time - input.dpad_down_pressed) > var_5b49269e))
			{
				selection++;
				function_d885deda(selection);
				input.dpad_down_pressed = current_time + var_5b49269e;
			}
			if(input.button_y && !input.var_d356f692 || (isdefined(input.var_6a06b2b8) && (current_time - input.var_6a06b2b8) > var_5b49269e))
			{
				toggle(function_be6420e7(selection));
				input.var_6a06b2b8 = current_time + var_5b49269e;
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_d885deda
	Namespace: namespace_9fe28d6e
	Checksum: 0x147E50E
	Offset: 0xFF0
	Size: 0x1DA
	Parameters: 1
	Flags: Private
*/
function private function_d885deda(selection)
{
	/#
		level endon(#"hash_d28501bd896672c");
		if(isdefined(level._fx.var_de0019ea.selection))
		{
			level._fx.var_de0019ea.data[function_be6420e7(level._fx.var_de0019ea.selection)].var_c6bf081d = 0;
			namespace_61e6d095::function_f2a9266(#"hash_2f8c229e8241a3a0", level._fx.var_de0019ea.selection, "", 0);
		}
		if(selection < 0)
		{
			selection = level._fx.var_de0019ea.data.size - 1;
		}
		if(selection >= level._fx.var_de0019ea.data.size)
		{
			selection = 0;
		}
		snd::play("", level._fx.player);
		level._fx.var_de0019ea.data[function_be6420e7(selection)].var_c6bf081d = 1;
		namespace_61e6d095::function_f2a9266(#"hash_2f8c229e8241a3a0", selection, "", 1);
		level._fx.var_de0019ea.selection = selection;
	#/
}

/*
	Name: function_2e225b16
	Namespace: namespace_9fe28d6e
	Checksum: 0xD110BE15
	Offset: 0x11D8
	Size: 0x2BE
	Parameters: 0
	Flags: Private
*/
function private function_2e225b16()
{
	/#
		self notify("");
		self endon("");
		level endon(#"hash_d28501bd896672c");
		while(true)
		{
			if(isdefined(level._fx.var_de0019ea.selection))
			{
				selection = level._fx.var_de0019ea.selection;
				var_dd94a1e3 = function_be6420e7(selection);
				locations = level._fx.var_de0019ea.data[var_dd94a1e3].locations;
				distance = level._fx.var_de0019ea.data[var_dd94a1e3].distance;
				for(i = 0; i < locations.size; i++)
				{
					box(locations[i].origin, vectorscale((-1, -1, -1), 5), vectorscale((1, 1, 1), 5), locations[i].angles, (0, 0, 0), 1, 0, 1);
					debugaxis(locations[i].origin, locations[i].angles, 16, 1, 0, 1);
					if(function_1913c46(locations[i]))
					{
						circle(locations[i].origin, locations[i].var_c9dbde14, (1, 0.65, 0), 0, 1, 1);
					}
					if(isdefined(level._fx.player.origin))
					{
						circle(level._fx.player.origin, distance.min, (0, 1, 0), 0, 1, 1);
						circle(level._fx.player.origin, distance.max, (1, 0, 0), 0, 1, 1);
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_be6420e7
	Namespace: namespace_9fe28d6e
	Checksum: 0xE5F077C0
	Offset: 0x14A0
	Size: 0xB6
	Parameters: 1
	Flags: Private
*/
function private function_be6420e7(selection)
{
	count = 0;
	foreach(entry in level._fx.var_de0019ea.data)
	{
		if(count == selection)
		{
			return entry.var_dd94a1e3;
		}
		count++;
	}
	return undefined;
}

/*
	Name: function_20e12458
	Namespace: namespace_9fe28d6e
	Checksum: 0x6718497D
	Offset: 0x1560
	Size: 0xC4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_20e12458(location, dist_min, dist_max)
{
	if(!isdefined(level._fx.player.origin))
	{
		return false;
	}
	dist_sqr = distance2dsquared(level._fx.player.origin, location.origin);
	return true;
}

/*
	Name: function_4c6d8fd3
	Namespace: namespace_9fe28d6e
	Checksum: 0x742E070A
	Offset: 0x1630
	Size: 0x82
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4c6d8fd3(location, fov)
{
	if(!isdefined(level._fx.player.origin))
	{
		return 0;
	}
	return util::within_fov(level._fx.player.origin, level._fx.player.angles, location.origin, fov);
}

/*
	Name: function_1913c46
	Namespace: namespace_9fe28d6e
	Checksum: 0x88C7146F
	Offset: 0x16C0
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1913c46(location)
{
	if(!isdefined(level._fx.player))
	{
		return false;
	}
	enemies = [];
	if(isdefined(location.var_c9dbde14) && location.var_c9dbde14 > 0)
	{
		enemies = level._fx.player function_bdda420f(location.origin, location.var_c9dbde14);
	}
	return true;
}

/*
	Name: _update
	Namespace: namespace_9fe28d6e
	Checksum: 0xC3EB75B9
	Offset: 0x1770
	Size: 0x506
	Parameters: 1
	Flags: Linked, Private
*/
function private _update(var_dd94a1e3)
{
	level endon("stop_ambientwar_" + var_dd94a1e3);
	delay = level._fx.var_de0019ea.data[var_dd94a1e3].delay;
	distance = level._fx.var_de0019ea.data[var_dd94a1e3].distance;
	locations = level._fx.var_de0019ea.data[var_dd94a1e3].locations;
	effects = level._fx.var_de0019ea.data[var_dd94a1e3].effects;
	if(locations.size <= 0)
	{
		return;
	}
	if(!isdefined(effects) || effects.size <= 0)
	{
		for(i = 0; i < locations.size; i++)
		{
			if(!isdefined(locations[i].var_b17f3758))
			{
				arrayremoveindex(effects, i, 1);
			}
		}
		arrayremovevalue(locations, undefined);
	}
	while(locations.size > 0)
	{
		effect = undefined;
		var_f16d4896 = randomintrange(0, locations.size);
		var_5fd45f33 = locations[var_f16d4896];
		var_bba7d11f = function_4c6d8fd3(var_5fd45f33, 0.5);
		in_range = function_20e12458(var_5fd45f33, distance.min, distance.max);
		var_1bd0dc4d = function_1913c46(var_5fd45f33);
		if(is_true(var_bba7d11f) && is_true(in_range) && is_false(var_1bd0dc4d))
		{
			if(isdefined(var_5fd45f33.var_b17f3758) && var_5fd45f33.var_b17f3758 != "")
			{
				effect = var_5fd45f33.var_b17f3758;
			}
			else
			{
				effect = effects[randomintrange(0, effects.size)];
			}
			if(isdefined(effect))
			{
				playfx(effect, var_5fd45f33.origin, anglestoforward(var_5fd45f33.angles), anglestoup(var_5fd45f33.angles));
				/#
					if(getdvarint(#"hash_1ccb34f428b1a279", 0) && function_be6420e7(level._fx.var_de0019ea.selection) == var_dd94a1e3)
					{
						display_time = getdvarfloat(#"hash_79ddea850d94a804", 0.5) / (float(function_60d95f53()) / 1000);
						start = var_5fd45f33.origin + vectorscale((0, 0, 1), 20);
						end = var_5fd45f33.origin + vectorscale((0, 0, 1), 100);
						str = (isdefined(var_5fd45f33.var_b17f3758) ? "" + effect : effect);
						line(start, end, (1, 0.65, 0), 1, 0, int(display_time));
						print3d(end, str, (1, 1, 1), 1, 0.5, int(display_time), 0);
					}
				#/
				wait(randomfloatrange(delay.min, delay.max));
			}
		}
		waitframe(1);
	}
}

/*
	Name: create
	Namespace: namespace_9fe28d6e
	Checksum: 0x70A0EE61
	Offset: 0x1C80
	Size: 0x1B8
	Parameters: 6
	Flags: None
*/
function create(var_dd94a1e3, var_6f2c5280, min_delay, max_delay, min_dist, max_dist)
{
	if(!isdefined(var_6f2c5280))
	{
		var_6f2c5280 = undefined;
	}
	if(!isdefined(min_delay))
	{
		min_delay = 0.5;
	}
	if(!isdefined(max_delay))
	{
		max_delay = 1.5;
	}
	if(!isdefined(min_dist))
	{
		min_dist = 100;
	}
	if(!isdefined(max_dist))
	{
		max_dist = 1000;
	}
	delay = {};
	delay.min = min_delay;
	delay.max = max_delay;
	distance = {};
	distance.min = min_dist;
	distance.max = max_dist;
	struct = {};
	struct.var_c6bf081d = 0;
	struct.is_active = 0;
	struct.var_dd94a1e3 = var_dd94a1e3;
	struct.locations = struct::get_array(var_dd94a1e3, "vfx_ambientwar_group_id");
	struct.effects = var_6f2c5280;
	struct.distance = distance;
	struct.delay = delay;
	if(isdefined(level._fx.var_de0019ea.data[var_dd94a1e3]))
	{
		return;
	}
	level._fx.var_de0019ea.data[var_dd94a1e3] = struct;
	/#
		level notify(#"hash_51a762912b76bdc1");
	#/
}

/*
	Name: start
	Namespace: namespace_9fe28d6e
	Checksum: 0x1EC9F1E0
	Offset: 0x1E40
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function start(var_dd94a1e3)
{
	if(isdefined(level._fx.var_de0019ea.data[var_dd94a1e3]))
	{
		level._fx.var_de0019ea.data[var_dd94a1e3].is_active = 1;
		level thread _update(var_dd94a1e3);
		/#
			level notify(#"hash_51a762912b76bdc1");
		#/
	}
}

/*
	Name: stop
	Namespace: namespace_9fe28d6e
	Checksum: 0x856E69E7
	Offset: 0x1ED8
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function stop(var_dd94a1e3)
{
	if(isdefined(level._fx.var_de0019ea.data[var_dd94a1e3]))
	{
		level notify("stop_ambientwar_" + var_dd94a1e3);
		level._fx.var_de0019ea.data[var_dd94a1e3].is_active = 0;
		/#
			level notify(#"hash_51a762912b76bdc1");
		#/
	}
}

/*
	Name: remove
	Namespace: namespace_9fe28d6e
	Checksum: 0x80C5B1DB
	Offset: 0x1F68
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function remove(var_dd94a1e3)
{
	if(isdefined(level._fx.var_de0019ea.data[var_dd94a1e3]))
	{
		stop(var_dd94a1e3);
		level._fx.var_de0019ea.data[var_dd94a1e3] = undefined;
		arrayremovevalue(level._fx.var_de0019ea.data, undefined);
		/#
			level notify(#"hash_51a762912b76bdc1");
		#/
	}
}

/*
	Name: toggle
	Namespace: namespace_9fe28d6e
	Checksum: 0x95C4B62C
	Offset: 0x2020
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function toggle(var_dd94a1e3)
{
	if(isdefined(level._fx.var_de0019ea.data[var_dd94a1e3]))
	{
		if(is_true(level._fx.var_de0019ea.data[var_dd94a1e3].is_active))
		{
			stop(var_dd94a1e3);
		}
		else
		{
			start(var_dd94a1e3);
		}
		/#
			level notify(#"hash_51a762912b76bdc1");
		#/
	}
}

