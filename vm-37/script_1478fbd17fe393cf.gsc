#using script_4937c6974f43bb71;
#using script_7d0013bbc05623b9;
#using script_35ae72be7b4fec10;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;

#namespace hint_tutorial;

/*
	Name: function_4c2d4fc4
	Namespace: hint_tutorial
	Checksum: 0x6457D4F7
	Offset: 0x190
	Size: 0x38C
	Parameters: 9
	Flags: None
*/
function function_4c2d4fc4(message, title, var_9696a2d, var_db331a85, type, var_c18a5a8b, var_9763e3fa, var_ad825676, var_572eedec)
{
	if(!isdefined(title))
	{
		title = #"";
	}
	if(!isdefined(var_9696a2d))
	{
		var_9696a2d = 0;
	}
	if(!isdefined(var_db331a85))
	{
		var_db331a85 = #"";
	}
	if(!isdefined(type))
	{
		type = 0;
	}
	if(!isdefined(var_ad825676))
	{
		var_ad825676 = 1;
	}
	self notify("211227b31e0a7a6a");
	self endon("211227b31e0a7a6a");
	self endon(#"death");
	if(namespace_61e6d095::exists(#"hint_tutorial"))
	{
		function_9f427d88(0);
		waitframe(1);
	}
	if(!namespace_61e6d095::exists(#"hint_tutorial"))
	{
		var_48bf6e66 = #"hash_775d3d8906586398";
		if(type == 2)
		{
			var_48bf6e66 = #"hash_30386b6ca189daa3";
		}
		else if(type > 2)
		{
			var_48bf6e66 = #"hash_77649627c20d31b1";
		}
		if(var_ad825676)
		{
			prompts::function_86eedc();
		}
		namespace_61e6d095::create(#"hint_tutorial", var_48bf6e66);
	}
	if(isdefined(var_572eedec))
	{
		function_142b2d59(var_572eedec);
	}
	namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "description", message);
	namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "title", title);
	namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "demoWidgeType", var_9696a2d);
	namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "callToAction", var_db331a85);
	namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "type", type);
	namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "delayAndFadeTime", -1);
	namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "pause", 0);
	if(type == 1)
	{
		namespace_82bfe441::fade(1, "FadeImmediate");
	}
	level.var_940e0c3e = type;
	level.var_5f632232 = message;
	if(isdefined(var_c18a5a8b) || isdefined(var_9763e3fa))
	{
		self thread function_9f427d88(var_c18a5a8b, var_9763e3fa);
	}
}

/*
	Name: function_f0104b5
	Namespace: hint_tutorial
	Checksum: 0x430C2559
	Offset: 0x528
	Size: 0xB4
	Parameters: 2
	Flags: None
*/
function function_f0104b5(var_572eedec, var_86f04d40)
{
	if(!isdefined(var_86f04d40))
	{
		var_86f04d40 = #"";
	}
	if(!isdefined(var_572eedec))
	{
		var_572eedec = [];
	}
	else if(!isarray(var_572eedec))
	{
		var_572eedec = array(var_572eedec);
	}
	var_fab78b18 = {#options:arraycopy(var_572eedec), #title:var_86f04d40};
	return var_fab78b18;
}

/*
	Name: function_142b2d59
	Namespace: hint_tutorial
	Checksum: 0x9BDE6E70
	Offset: 0x5E8
	Size: 0x13C
	Parameters: 1
	Flags: Private
*/
function private function_142b2d59(var_572eedec)
{
	if(!isdefined(var_572eedec))
	{
		var_572eedec = [];
	}
	else if(!isarray(var_572eedec))
	{
		var_572eedec = array(var_572eedec);
	}
	for(line_num = 0; line_num < var_572eedec.size; line_num++)
	{
		data = var_572eedec[line_num];
		title = data.title;
		options = data.options;
		/#
			assert(isarray(options), "");
		#/
		namespace_61e6d095::function_f2a9266(#"hint_tutorial", line_num, "text", title);
		namespace_61e6d095::function_f2a9266(#"hint_tutorial", line_num, "button_text", options);
	}
}

/*
	Name: function_df08d48
	Namespace: hint_tutorial
	Checksum: 0xC09EC7D9
	Offset: 0x730
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_df08d48(blur_amount)
{
	if(!isdefined(blur_amount))
	{
		blur_amount = 0;
	}
	if(namespace_61e6d095::exists(#"hint_tutorial"))
	{
		namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "worldBlurAmount", blur_amount, 1, 0, 0, 1);
	}
}

/*
	Name: pause
	Namespace: hint_tutorial
	Checksum: 0x10B73836
	Offset: 0x7B0
	Size: 0x19C
	Parameters: 5
	Flags: None
*/
function pause(var_1d470cc4, var_63d0d48f, var_29fa9286, var_f191bdbc, var_37e3f2b0)
{
	if(!isdefined(var_1d470cc4))
	{
		var_1d470cc4 = "#ui_cancel;+activate";
	}
	if(!isdefined(var_63d0d48f))
	{
		var_63d0d48f = #"hash_3f87d00d07eb799e";
	}
	if(!isdefined(var_29fa9286))
	{
		var_29fa9286 = 2;
	}
	if(namespace_61e6d095::exists(#"hint_tutorial"))
	{
		namespace_61e6d095::function_73c9a490(#"hint_tutorial", 1);
		namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "pausePromptCancelMessage", var_63d0d48f);
		namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "input", var_1d470cc4);
		namespace_61e6d095::function_24e5fa63(#"hint_tutorial", var_1d470cc4, 1);
		namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "pause", var_29fa9286);
		selected = undefined;
		selected = level waittill(#"lui_unpause_game");
		if(isdefined(var_37e3f2b0))
		{
			level notify(var_37e3f2b0);
		}
		function_9f427d88(0, var_f191bdbc);
	}
}

/*
	Name: function_9f427d88
	Namespace: hint_tutorial
	Checksum: 0x1B97216D
	Offset: 0x958
	Size: 0x296
	Parameters: 2
	Flags: None
*/
function function_9f427d88(var_67df10fb, var_f191bdbc)
{
	if(!isdefined(var_67df10fb))
	{
		var_67df10fb = 1;
	}
	self notify("2f793a9b807dc3f2");
	self endon("2f793a9b807dc3f2");
	self endon(#"death");
	if(!isdefined(var_f191bdbc))
	{
		var_f191bdbc = [];
	}
	else if(!isarray(var_f191bdbc))
	{
		var_f191bdbc = array(var_f191bdbc);
	}
	reason = undefined;
	if(var_67df10fb >= (float(function_60d95f53()) / 1000))
	{
		if(var_f191bdbc.size > 0)
		{
			reason = undefined;
			reason = self waittilltimeout(var_67df10fb, var_f191bdbc);
		}
		else
		{
			wait(var_67df10fb);
		}
	}
	else if(var_f191bdbc.size > 0)
	{
		self waittill(var_f191bdbc);
		var_67df10fb = 0;
	}
	if(namespace_61e6d095::exists(#"hint_tutorial"))
	{
		namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "delayAndFadeTime", var_67df10fb);
	}
	if(var_67df10fb > 0 && reason._notify === #"timeout")
	{
		wait(2);
	}
	if(namespace_61e6d095::exists(#"hint_tutorial"))
	{
		namespace_61e6d095::function_73c9a490(#"hint_tutorial", 0);
		namespace_61e6d095::remove(#"hint_tutorial");
	}
	if(level.var_940e0c3e === 1)
	{
		namespace_82bfe441::fade(0, "FadeMedium");
	}
	prompts::function_d675f5a4();
	self notify(#"hash_79da7f3e8e35f82d", {#message:level.var_5f632232});
	level.var_940e0c3e = undefined;
	level.var_5f632232 = undefined;
}

/*
	Name: function_57a24ab5
	Namespace: hint_tutorial
	Checksum: 0xF2C11952
	Offset: 0xBF8
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_57a24ab5(visible)
{
	if(namespace_61e6d095::exists(#"hint_tutorial"))
	{
		if(is_true(visible))
		{
			namespace_61e6d095::function_f96376c5(#"hash_4672994c342b7571");
		}
		else
		{
			namespace_61e6d095::function_df0d7a85(#"hash_4672994c342b7571", #"hint_tutorial");
		}
	}
}

