#using script_35ae72be7b4fec10;
#using script_4937c6974f43bb71;
#using script_7d0013bbc05623b9;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\cp_common\objectives.gsc;

#namespace namespace_fe8e9929;

/*
	Name: function_7f860155
	Namespace: namespace_fe8e9929
	Checksum: 0x91DB9766
	Offset: 0x200
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7f860155()
{
	level notify(1221728095);
}

/*
	Name: function_89f2df9
	Namespace: namespace_fe8e9929
	Checksum: 0xC3E2E290
	Offset: 0x220
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register("hint_tutorial", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_fe8e9929
	Checksum: 0x3824418C
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "hint_pause_state", 1, 1, "int");
}

/*
	Name: function_4c2d4fc4
	Namespace: namespace_fe8e9929
	Checksum: 0xBCFA7DF5
	Offset: 0x2A0
	Size: 0x454
	Parameters: 9
	Flags: Linked
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
	self notify("401d877bc28daf47");
	self endon("401d877bc28daf47");
	player = self;
	if(!isplayer(player))
	{
		player = getplayers()[0];
	}
	player endon(#"death");
	if(namespace_61e6d095::exists(#"hash_66c6997fe4c5ccf"))
	{
		player function_9f427d88(0);
		waitframe(1);
	}
	if(!namespace_61e6d095::exists(#"hash_66c6997fe4c5ccf"))
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
			level prompts::function_86eedc();
		}
		namespace_61e6d095::create(#"hash_66c6997fe4c5ccf", var_48bf6e66);
		namespace_61e6d095::function_46df0bc7(#"hash_66c6997fe4c5ccf", 100);
	}
	if(isdefined(var_572eedec))
	{
		function_142b2d59(var_572eedec);
	}
	namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "description", message);
	namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "title", title);
	namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "demoWidgeType", var_9696a2d);
	namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "callToAction", var_db331a85);
	namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "type", type);
	namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "delayAndFadeTime", -1);
	namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "pause", 0);
	if(type == 1)
	{
		namespace_82bfe441::fade(1, "FadeImmediate");
	}
	namespace_61e6d095::function_d3c3e5c3(#"hash_66c6997fe4c5ccf", [2:#"computer", 1:#"dialog_tree", 0:#"hash_ee64d6a280a2e42"]);
	level.var_940e0c3e = type;
	level.var_5f632232 = message;
	if(isdefined(var_c18a5a8b) || isdefined(var_9763e3fa))
	{
		player thread function_9f427d88(var_c18a5a8b, var_9763e3fa);
	}
}

/*
	Name: function_f0104b5
	Namespace: namespace_fe8e9929
	Checksum: 0x325A2633
	Offset: 0x700
	Size: 0x144
	Parameters: 4
	Flags: Linked
*/
function function_f0104b5(var_572eedec, var_86f04d40, var_71902fbb, var_cb93cf14)
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
	if(!isdefined(var_71902fbb))
	{
		var_71902fbb = [];
	}
	else if(!isarray(var_71902fbb))
	{
		var_71902fbb = array(var_71902fbb);
	}
	var_fab78b18 = {#hash_cb93cf14:var_cb93cf14, #hash_88c2ece:arraycopy(var_71902fbb), #options:arraycopy(var_572eedec), #title:var_86f04d40};
	return var_fab78b18;
}

/*
	Name: function_142b2d59
	Namespace: namespace_fe8e9929
	Checksum: 0x5FC3F6FC
	Offset: 0x850
	Size: 0x204
	Parameters: 1
	Flags: Linked, Private
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
	player = getplayers()[0];
	for(line_num = 0; line_num < var_572eedec.size; line_num++)
	{
		data = var_572eedec[line_num];
		title = data.title;
		options = data.options;
		var_88c2ece = data.var_88c2ece;
		var_cb93cf14 = data.var_cb93cf14;
		/#
			assert(isarray(options), "");
		#/
		namespace_61e6d095::function_f2a9266(#"hash_66c6997fe4c5ccf", line_num, "text", title);
		if(!player flag::get(var_cb93cf14) || !isdefined(var_88c2ece))
		{
			namespace_61e6d095::function_f2a9266(#"hash_66c6997fe4c5ccf", line_num, "button_text", options);
		}
		else
		{
			namespace_61e6d095::function_f2a9266(#"hash_66c6997fe4c5ccf", line_num, "button_text", var_88c2ece);
		}
		if(isdefined(var_cb93cf14) && isdefined(var_88c2ece))
		{
			player thread function_feebc7c2(data, line_num);
		}
	}
}

/*
	Name: function_feebc7c2
	Namespace: namespace_fe8e9929
	Checksum: 0xB07A2BB9
	Offset: 0xA60
	Size: 0x160
	Parameters: 2
	Flags: Linked, Private
*/
function private function_feebc7c2(data, line_num)
{
	self endon(#"death", #"hash_79da7f3e8e35f82d");
	var_6d381b22 = self flag::get(data.var_cb93cf14);
	while(namespace_61e6d095::exists(#"hash_66c6997fe4c5ccf"))
	{
		if(var_6d381b22)
		{
			self flag::wait_till_clear(data.var_cb93cf14);
		}
		else
		{
			self flag::wait_till(data.var_cb93cf14);
		}
		var_6d381b22 = self flag::get(data.var_cb93cf14);
		if(var_6d381b22)
		{
			namespace_61e6d095::function_f2a9266(#"hash_66c6997fe4c5ccf", line_num, "button_text", data.var_88c2ece);
		}
		else
		{
			namespace_61e6d095::function_f2a9266(#"hash_66c6997fe4c5ccf", line_num, "button_text", data.options);
		}
	}
}

/*
	Name: function_df08d48
	Namespace: namespace_fe8e9929
	Checksum: 0xF6DF2D1D
	Offset: 0xBC8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_df08d48(blur_amount)
{
	if(!isdefined(blur_amount))
	{
		blur_amount = 0;
	}
	if(namespace_61e6d095::exists(#"hash_66c6997fe4c5ccf"))
	{
		namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "worldBlurAmount", blur_amount, 1);
	}
}

/*
	Name: pause
	Namespace: namespace_fe8e9929
	Checksum: 0x1808F4D4
	Offset: 0xC40
	Size: 0x49C
	Parameters: 6
	Flags: Linked
*/
function pause(var_1d470cc4, var_63d0d48f, var_29fa9286, var_f191bdbc, var_37e3f2b0, var_415dea5d)
{
	if(!isdefined(var_415dea5d))
	{
		var_415dea5d = 1;
	}
	if(!isdefined(var_1d470cc4))
	{
		var_1d470cc4 = #"hash_3c27402259e4c18e";
	}
	if(!isdefined(var_63d0d48f))
	{
		var_63d0d48f = #"hash_3f87d00d07eb799e";
	}
	if(!isdefined(var_29fa9286))
	{
		var_29fa9286 = 2;
	}
	level prompts::function_86eedc();
	if(is_true(level.gameended) || is_true(level.missionfailed) || level flag::get("restart_checkpoint") || level flag::get("restart_mission"))
	{
		return;
	}
	player = getplayers()[0];
	player endon(#"death");
	level endoncallback(&function_18c01825, #"game_ended", #"mission_failed", #"hash_2bb74762daab3cd", #"hash_6c59cd22afa77403", #"hash_61cee623f93cccdd");
	if(namespace_61e6d095::exists(#"hash_66c6997fe4c5ccf"))
	{
		var_7d86dbf8 = player gamepadusedlast();
		setdvar(#"hash_54488b7c651bd0ec", !var_7d86dbf8);
		namespace_82bfe441::fade(1, "FadeImmediate");
		objectives::function_9dfb43fc();
		namespace_61e6d095::function_73c9a490(#"hash_66c6997fe4c5ccf", 1);
		namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "pausePromptCancelMessage", var_63d0d48f);
		namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "input", var_1d470cc4);
		namespace_61e6d095::function_24e5fa63(#"hash_66c6997fe4c5ccf", var_1d470cc4, 1);
		player thread clientfield::set_to_player("hint_pause_state", 1);
		waitframe(2);
		namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "pause", var_29fa9286);
		player function_df08d48(5);
		selected = undefined;
		selected = level waittill(#"lui_unpause_game");
		player thread flag::set_for_time((float(function_60d95f53()) / 1000) * 2, "was_paused");
		if(isdefined(var_37e3f2b0))
		{
			level notify(var_37e3f2b0);
		}
		if(var_415dea5d)
		{
			player function_df08d48();
		}
		namespace_82bfe441::fade(0, "FadeMedium");
		objectives::function_4279fd02();
		level prompts::function_d675f5a4();
		player function_9f427d88(0, var_f191bdbc);
		player thread clientfield::set_to_player("hint_pause_state", 0);
		setdvar(#"hash_54488b7c651bd0ec", 0);
	}
}

/*
	Name: function_18c01825
	Namespace: namespace_fe8e9929
	Checksum: 0xCC5B830D
	Offset: 0x10E8
	Size: 0xA8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_18c01825(parms)
{
	foreach(player in getplayers())
	{
		if(isdefined(player))
		{
			player thread clientfield::set_to_player("hint_pause_state", 0);
		}
	}
}

/*
	Name: function_9f427d88
	Namespace: namespace_fe8e9929
	Checksum: 0x4288827F
	Offset: 0x1198
	Size: 0x29E
	Parameters: 2
	Flags: Linked
*/
function function_9f427d88(var_67df10fb, var_f191bdbc)
{
	if(!isdefined(var_67df10fb))
	{
		var_67df10fb = 1;
	}
	self notify("dcbd84128869fe1");
	self endon("dcbd84128869fe1");
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
	if(namespace_61e6d095::exists(#"hash_66c6997fe4c5ccf"))
	{
		namespace_61e6d095::function_9ade1d9b(#"hash_66c6997fe4c5ccf", "delayAndFadeTime", var_67df10fb);
	}
	if(var_67df10fb > 0 && reason._notify === #"timeout")
	{
		wait(2);
	}
	if(namespace_61e6d095::exists(#"hash_66c6997fe4c5ccf"))
	{
		namespace_61e6d095::function_73c9a490(#"hash_66c6997fe4c5ccf", 0);
		namespace_61e6d095::remove(#"hash_66c6997fe4c5ccf");
	}
	if(level.var_940e0c3e === 1)
	{
		namespace_82bfe441::fade(0, "FadeMedium");
	}
	level prompts::function_d675f5a4();
	self notify(#"hash_79da7f3e8e35f82d", {#message:level.var_5f632232});
	level.var_940e0c3e = undefined;
	level.var_5f632232 = undefined;
}

/*
	Name: function_57a24ab5
	Namespace: namespace_fe8e9929
	Checksum: 0x85642967
	Offset: 0x1440
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_57a24ab5(visible)
{
	if(namespace_61e6d095::exists(#"hash_66c6997fe4c5ccf"))
	{
		if(is_true(visible))
		{
			namespace_61e6d095::function_f96376c5(#"hash_4672994c342b7571");
		}
		else
		{
			namespace_61e6d095::function_df0d7a85(#"hash_4672994c342b7571", #"hash_66c6997fe4c5ccf");
		}
	}
}

