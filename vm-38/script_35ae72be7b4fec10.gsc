#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;

#namespace namespace_61e6d095;

/*
	Name: function_7ecfa4da
	Namespace: namespace_61e6d095
	Checksum: 0xAACB6FF3
	Offset: 0x528
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7ecfa4da()
{
	level notify(389075062);
}

/*
	Name: function_89f2df9
	Namespace: namespace_61e6d095
	Checksum: 0x9E52226F
	Offset: 0x548
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7f2a4dd4a17f2f59", &preload, undefined, undefined, undefined);
}

/*
	Name: preload
	Namespace: namespace_61e6d095
	Checksum: 0xB2B65A3B
	Offset: 0x590
	Size: 0x31C
	Parameters: 0
	Flags: Linked, Private
*/
function private preload()
{
	level.var_61e6d095 = spawnstruct();
	level.var_61e6d095.active = [];
	level.var_61e6d095.hidden = [];
	level.var_61e6d095.var_db65bf2f = [];
	level.var_61e6d095.inputs = [];
	level.var_61e6d095.inputs[#"ui_confirm"] = "confirm";
	level.var_61e6d095.inputs[#"hash_3c27402259e4c18e"] = "cancel";
	level.var_61e6d095.inputs[#"hash_278b9a3955f6e5a"] = "alt1";
	level.var_61e6d095.inputs[#"hash_278b8a3955f6ca7"] = "alt2";
	level.var_61e6d095.inputs[#"ui_navup"] = "navup";
	level.var_61e6d095.inputs[#"ui_navdown"] = "navdown";
	level.var_61e6d095.inputs[#"ui_navleft"] = "navleft";
	level.var_61e6d095.inputs[#"ui_navright"] = "navright";
	level.var_61e6d095.inputs[#"ui_prevtab"] = "prevtab";
	level.var_61e6d095.inputs[#"ui_nexttab"] = "nexttab";
	level.var_61e6d095.inputs[#"hash_5686e6f2a8315663"] = "backspace";
	level.var_61e6d095.var_ebb98e0b = [];
	foreach(key, value in level.var_61e6d095.inputs)
	{
		level.var_61e6d095.var_ebb98e0b[key] = [];
		thread globallogic_ui::function_9ed5232e("ScriptedWidgetData.blockGameInput." + value, 0);
	}
	callback::add_callback(#"on_player_spawned", &on_player_spawn);
}

/*
	Name: on_player_spawn
	Namespace: namespace_61e6d095
	Checksum: 0xBE88C4F5
	Offset: 0x8B8
	Size: 0x170
	Parameters: 0
	Flags: Linked
*/
function on_player_spawn()
{
	self endon(#"death");
	foreach(value in level.var_61e6d095.inputs)
	{
		self flag::clear(key);
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		if(menu == "ScriptedHudWidgetMenu" && isdefined(level.var_61e6d095.inputs[waitresult.response]))
		{
			self thread flag::set_for_time((float(function_60d95f53()) / 1000) * 2, waitresult.response);
		}
	}
}

/*
	Name: function_affb1af1
	Namespace: namespace_61e6d095
	Checksum: 0x95F15426
	Offset: 0xA30
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_affb1af1()
{
	return self flag::get(#"ui_confirm");
}

/*
	Name: function_57fbd346
	Namespace: namespace_61e6d095
	Checksum: 0x511FCEA6
	Offset: 0xA60
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_57fbd346()
{
	return self flag::get(#"hash_3c27402259e4c18e");
}

/*
	Name: function_e4d62f9a
	Namespace: namespace_61e6d095
	Checksum: 0xE775EADC
	Offset: 0xA90
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_e4d62f9a()
{
	return self flag::get(#"hash_278b9a3955f6e5a");
}

/*
	Name: function_728aec47
	Namespace: namespace_61e6d095
	Checksum: 0x6536352A
	Offset: 0xAC0
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_728aec47()
{
	return self flag::get(#"hash_278b8a3955f6ca7");
}

/*
	Name: function_aef1e8c3
	Namespace: namespace_61e6d095
	Checksum: 0xEF03860D
	Offset: 0xAF0
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_aef1e8c3()
{
	return self flag::get(#"ui_navup");
}

/*
	Name: function_9975a94d
	Namespace: namespace_61e6d095
	Checksum: 0xA67D1000
	Offset: 0xB20
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_9975a94d()
{
	return self flag::get(#"ui_navdown");
}

/*
	Name: function_c2d8a326
	Namespace: namespace_61e6d095
	Checksum: 0x920F5C30
	Offset: 0xB50
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_c2d8a326()
{
	return self flag::get(#"ui_navleft");
}

/*
	Name: function_3d680c10
	Namespace: namespace_61e6d095
	Checksum: 0x59B0660C
	Offset: 0xB80
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_3d680c10()
{
	return self flag::get(#"ui_navright");
}

/*
	Name: function_d0beaa6e
	Namespace: namespace_61e6d095
	Checksum: 0xAB91FAC1
	Offset: 0xBB0
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_d0beaa6e()
{
	return self flag::get(#"ui_prevtab");
}

/*
	Name: function_1e9035e9
	Namespace: namespace_61e6d095
	Checksum: 0x6DA62605
	Offset: 0xBE0
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_1e9035e9()
{
	return self flag::get(#"ui_nexttab");
}

/*
	Name: function_57799116
	Namespace: namespace_61e6d095
	Checksum: 0xAD04E269
	Offset: 0xC10
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_57799116()
{
	return self flag::get(#"hash_5686e6f2a8315663");
}

/*
	Name: function_9c365c3b
	Namespace: namespace_61e6d095
	Checksum: 0xEB96D0FA
	Offset: 0xC40
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_9c365c3b()
{
	return function_cf2348e7(function_90d058e8(#"hash_15588744d5c5bb0f"));
}

/*
	Name: function_6cbc939b
	Namespace: namespace_61e6d095
	Checksum: 0x2109000E
	Offset: 0xC80
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function function_6cbc939b()
{
	return function_cf2348e7(function_90d058e8(#"hash_730cd94f8fe3da16"));
}

/*
	Name: function_cf2348e7
	Namespace: namespace_61e6d095
	Checksum: 0x65923B39
	Offset: 0xCC0
	Size: 0x14C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cf2348e7(model)
{
	var_b0672ef2 = getuimodel(model, #"degrees");
	var_9487f37 = getuimodel(model, #"length");
	var_f76e6210 = getuimodel(model, #"x");
	var_f1cc2bf9 = getuimodel(model, #"y");
	return {#y:getuimodelvalue(var_f1cc2bf9), #x:getuimodelvalue(var_f76e6210), #length:getuimodelvalue(var_9487f37), #degrees:getuimodelvalue(var_b0672ef2)};
}

/*
	Name: function_f2b01a83
	Namespace: namespace_61e6d095
	Checksum: 0x767A161F
	Offset: 0xE18
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function function_f2b01a83()
{
	return function_c63f7472(function_90d058e8(#"hash_39502e607f052b14"));
}

/*
	Name: function_f540dc93
	Namespace: namespace_61e6d095
	Checksum: 0xDF97AB43
	Offset: 0xE58
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function function_f540dc93()
{
	return function_c63f7472(function_90d058e8(#"hash_25c2b6d37ccf0023"));
}

/*
	Name: function_c63f7472
	Namespace: namespace_61e6d095
	Checksum: 0x325F21E5
	Offset: 0xE98
	Size: 0x4A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c63f7472(model)
{
	var_68abddbb = getuimodel(model, #"amount");
	return getuimodelvalue(var_68abddbb);
}

/*
	Name: create_waypoint
	Namespace: namespace_61e6d095
	Checksum: 0x5CB562FF
	Offset: 0xEF0
	Size: 0x408
	Parameters: 11
	Flags: None
*/
function create_waypoint(uid, ent, image, text, offset, tag, var_7bd05154, var_754bedbb, clamp, var_577a0c84, progress)
{
	if(!isdefined(uid))
	{
		uid = "waypoint";
	}
	if(!isdefined(var_7bd05154))
	{
		var_7bd05154 = 1;
	}
	if(!isdefined(var_754bedbb))
	{
		var_754bedbb = 1;
	}
	if(!isdefined(clamp))
	{
		clamp = 1;
	}
	if(!isdefined(var_577a0c84))
	{
		var_577a0c84 = 0;
	}
	uid = string(uid) + ent getentitynumber();
	var_8b1805e6 = #"hash_14992af6bd994ba2";
	if(isdefined(progress))
	{
		var_8b1805e6 = #"hash_266631c3a5d0ffdb";
	}
	create(uid, var_8b1805e6);
	function_fbe9f25e(uid);
	if(isdefined(ent))
	{
		function_6e0fad3b(uid, ent);
	}
	if(isdefined(image))
	{
		function_309bf7c2(uid, image);
	}
	if(isdefined(text))
	{
		function_d5ea17f0(uid, text);
		set_flags(uid, 1);
	}
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	if(isdefined(tag))
	{
		origin = ent.origin;
		if(isentity(ent) && is_true(var_754bedbb))
		{
			origin = origin + rotatepoint(ent getboundsmidpoint(), ent.angles);
		}
		offset = (offset + ent gettagorigin(tag)) - origin;
	}
	if(offset[0] != 0)
	{
		function_4d9fbc9d(uid, offset[0]);
	}
	if(offset[1] != 0)
	{
		function_52dbc715(uid, offset[1]);
	}
	if(offset[2] != 0)
	{
		function_60856268(uid, offset[2]);
	}
	if(is_true(clamp))
	{
		function_4ef79fca(uid, clamp);
	}
	if(is_true(var_577a0c84))
	{
		function_eb16868b(uid, var_577a0c84);
	}
	if(isdefined(progress))
	{
		function_b1e6d7a8(uid, progress);
	}
	function_e648abd8(uid, var_754bedbb);
	function_9c3ced73(uid, var_7bd05154);
	set_state(uid, 0);
	ent function_89bba41b(uid, "offset", {#offset:offset});
	ent thread function_9718880e(uid);
	return uid;
}

/*
	Name: create
	Namespace: namespace_61e6d095
	Checksum: 0x2C6E1F27
	Offset: 0x1300
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function create(uid, var_9f5096b8)
{
	level.var_61e6d095.active[uid] = {#time:gettime(), #uid:uid};
	function_3efa2f37(uid, "widgetName", var_9f5096b8);
	function_3efa2f37(uid, "uid", uid);
	thread function_4e406a1a();
	if(should_hide(uid))
	{
		function_3efa2f37(uid, "hide", 1);
	}
}

/*
	Name: remove
	Namespace: namespace_61e6d095
	Checksum: 0x4D16184A
	Offset: 0x13E0
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function remove(uid)
{
	arrayremoveindex(level.var_61e6d095.active, uid, 1);
	function_3abc637f(uid);
	level notify("delete_widget_" + uid);
	function_3efa2f37(uid, "widgetName", #"");
	thread function_4e406a1a();
	thread function_1b4bdb02(uid);
	globallogic_ui::function_2ec075a9(("ScriptedWidgetData.widgetModels" + ".") + uid, 1);
}

/*
	Name: remove_all
	Namespace: namespace_61e6d095
	Checksum: 0x9FFE7371
	Offset: 0x14D0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function remove_all()
{
	level.var_61e6d095.active = [];
	level.var_61e6d095.block_input = [];
	level notify(#"hash_64a3b02565bdf75f");
	thread function_4e406a1a(1);
}

/*
	Name: exists
	Namespace: namespace_61e6d095
	Checksum: 0x1DEA5ED9
	Offset: 0x1530
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function exists(uid)
{
	return isdefined(level.var_61e6d095.active[uid]);
}

/*
	Name: function_70217795
	Namespace: namespace_61e6d095
	Checksum: 0xCAF584E4
	Offset: 0x1560
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function function_70217795(var_d53ecf2)
{
	if(!isdefined(var_d53ecf2))
	{
		var_d53ecf2 = 0;
	}
	/#
		assert(isplayer(self));
	#/
	if(var_d53ecf2 && !self gamepadusedlast())
	{
		return self usebuttonpressed();
	}
	return self function_57fbd346();
}

/*
	Name: function_b0bad5ff
	Namespace: namespace_61e6d095
	Checksum: 0xCB2FCC1
	Offset: 0x1600
	Size: 0x13E
	Parameters: 3
	Flags: Linked
*/
function function_b0bad5ff(endons, var_daf05886, var_d53ecf2)
{
	if(!isdefined(var_d53ecf2))
	{
		var_d53ecf2 = 0;
	}
	/#
		assert(isplayer(self));
	#/
	self endon(#"death");
	if(isdefined(endons))
	{
		self endon(endons);
	}
	if(isdefined(var_daf05886))
	{
		level endon(var_daf05886);
	}
	if(!isdefined(endons))
	{
		endons = [];
	}
	else if(!isarray(endons))
	{
		endons = array(endons);
	}
	endons[endons.size] = "request_menu_exit";
	if(!var_d53ecf2)
	{
		self thread function_4bfa9617(endons, var_daf05886);
	}
	while(!self function_70217795(var_d53ecf2))
	{
		waitframe(1);
	}
	self notify(#"hash_6da7a77674810115");
}

/*
	Name: function_4bfa9617
	Namespace: namespace_61e6d095
	Checksum: 0x3E107DDA
	Offset: 0x1748
	Size: 0xBC
	Parameters: 2
	Flags: Linked
*/
function function_4bfa9617(endons, var_daf05886)
{
	/#
		assert(isplayer(self));
	#/
	var_753c2469 = self flag::get("block_kbm_pause_menu");
	self flag::increment("block_kbm_pause_menu");
	if(!var_753c2469)
	{
		self thread function_d6cfc8e9();
	}
	self thread function_5302a8d6(endons, var_daf05886);
}

/*
	Name: function_d6cfc8e9
	Namespace: namespace_61e6d095
	Checksum: 0x366BA9EC
	Offset: 0x1810
	Size: 0x10C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d6cfc8e9()
{
	self notify("3905ed56f501527e");
	self endon("3905ed56f501527e");
	self endon(#"death");
	var_4cfde9be = 1;
	while(self flag::get("block_kbm_pause_menu"))
	{
		var_7d86dbf8 = self gamepadusedlast();
		if(var_4cfde9be != var_7d86dbf8 || (!var_7d86dbf8 && self flag::get("was_paused")))
		{
			setdvar(#"hash_54488b7c651bd0ec", !var_7d86dbf8);
		}
		var_4cfde9be = var_7d86dbf8;
		waitframe(1);
	}
	setdvar(#"hash_54488b7c651bd0ec", 0);
}

/*
	Name: function_5302a8d6
	Namespace: namespace_61e6d095
	Checksum: 0x26C5C221
	Offset: 0x1928
	Size: 0xFC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5302a8d6(waittills, var_b68dbe65)
{
	if(!isdefined(waittills))
	{
		waittills = [];
	}
	else if(!isarray(waittills))
	{
		waittills = array(waittills);
	}
	waittills[waittills.size] = "death";
	if(isdefined(var_b68dbe65))
	{
		self thread function_18a00acf(var_b68dbe65);
	}
	result = undefined;
	result = self waittill(waittills);
	self flag::decrement("block_kbm_pause_menu");
	if(result._notify == "death")
	{
		setdvar(#"hash_54488b7c651bd0ec", 0);
	}
}

/*
	Name: function_18a00acf
	Namespace: namespace_61e6d095
	Checksum: 0x638BE26A
	Offset: 0x1A30
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_18a00acf(var_b68dbe65)
{
	level waittill(var_b68dbe65);
	self notify(#"hash_6da7a77674810115");
}

/*
	Name: function_24e5fa63
	Namespace: namespace_61e6d095
	Checksum: 0x9E602B18
	Offset: 0x1A68
	Size: 0x138
	Parameters: 3
	Flags: Linked
*/
function function_24e5fa63(uid, inputs, block)
{
	if(!isdefined(block))
	{
		block = 1;
	}
	if(!isdefined(inputs))
	{
		inputs = [];
	}
	else if(!isarray(inputs))
	{
		inputs = array(inputs);
	}
	foreach(input in inputs)
	{
		if(isdefined(level.var_61e6d095.var_ebb98e0b[input]))
		{
			if(block)
			{
				function_78f03fef(uid, input);
				continue;
			}
			function_1b4bdb02(uid, input);
		}
	}
}

/*
	Name: function_e544f756
	Namespace: namespace_61e6d095
	Checksum: 0x51B23C3A
	Offset: 0x1BA8
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_e544f756(uid, block)
{
	if(!isdefined(block))
	{
		block = 1;
	}
	if(block)
	{
		function_78f03fef(uid, #"ui_confirm");
	}
	else
	{
		function_1b4bdb02(uid, #"ui_confirm");
	}
}

/*
	Name: function_29703592
	Namespace: namespace_61e6d095
	Checksum: 0xBA27937
	Offset: 0x1C28
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_29703592(uid, block)
{
	if(!isdefined(block))
	{
		block = 1;
	}
	if(block)
	{
		function_78f03fef(uid, #"hash_3c27402259e4c18e");
	}
	else
	{
		function_1b4bdb02(uid, #"hash_3c27402259e4c18e");
	}
}

/*
	Name: function_61d5ed40
	Namespace: namespace_61e6d095
	Checksum: 0xFC86DEF
	Offset: 0x1CA8
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_61d5ed40(uid, block)
{
	if(!isdefined(block))
	{
		block = 1;
	}
	if(block)
	{
		function_78f03fef(uid, #"hash_278b9a3955f6e5a");
	}
	else
	{
		function_1b4bdb02(uid, #"hash_278b9a3955f6e5a");
	}
}

/*
	Name: function_503549ff
	Namespace: namespace_61e6d095
	Checksum: 0x8E816D3
	Offset: 0x1D28
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_503549ff(uid, block)
{
	if(!isdefined(block))
	{
		block = 1;
	}
	if(block)
	{
		function_78f03fef(uid, #"hash_278b8a3955f6ca7");
	}
	else
	{
		function_1b4bdb02(uid, #"hash_278b8a3955f6ca7");
	}
}

/*
	Name: function_a9d2152c
	Namespace: namespace_61e6d095
	Checksum: 0x19798354
	Offset: 0x1DA8
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_a9d2152c(uid, block)
{
	if(!isdefined(block))
	{
		block = 1;
	}
	if(block)
	{
		function_78f03fef(uid, #"ui_navup");
	}
	else
	{
		function_1b4bdb02(uid, #"ui_navup");
	}
}

/*
	Name: function_cd99f2ab
	Namespace: namespace_61e6d095
	Checksum: 0x3FBB26B2
	Offset: 0x1E28
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_cd99f2ab(uid, block)
{
	if(!isdefined(block))
	{
		block = 1;
	}
	if(block)
	{
		function_78f03fef(uid, #"ui_navdown");
	}
	else
	{
		function_1b4bdb02(uid, #"ui_navdown");
	}
}

/*
	Name: function_46abc17c
	Namespace: namespace_61e6d095
	Checksum: 0x798EAB2A
	Offset: 0x1EA8
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_46abc17c(uid, block)
{
	if(!isdefined(block))
	{
		block = 1;
	}
	if(block)
	{
		function_78f03fef(uid, #"ui_navleft");
	}
	else
	{
		function_1b4bdb02(uid, #"ui_navleft");
	}
}

/*
	Name: function_1eca647
	Namespace: namespace_61e6d095
	Checksum: 0xD624E993
	Offset: 0x1F28
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_1eca647(uid, block)
{
	if(!isdefined(block))
	{
		block = 1;
	}
	if(block)
	{
		function_78f03fef(uid, #"ui_navright");
	}
	else
	{
		function_1b4bdb02(uid, #"ui_navright");
	}
}

/*
	Name: function_37cc0f71
	Namespace: namespace_61e6d095
	Checksum: 0x4BB61E7D
	Offset: 0x1FA8
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_37cc0f71(uid, block)
{
	if(!isdefined(block))
	{
		block = 1;
	}
	if(block)
	{
		function_78f03fef(uid, #"ui_prevtab");
	}
	else
	{
		function_1b4bdb02(uid, #"ui_prevtab");
	}
}

/*
	Name: function_b2bd6ae9
	Namespace: namespace_61e6d095
	Checksum: 0x557EBFEE
	Offset: 0x2028
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_b2bd6ae9(uid, block)
{
	if(!isdefined(block))
	{
		block = 1;
	}
	if(block)
	{
		function_78f03fef(uid, #"ui_nexttab");
	}
	else
	{
		function_1b4bdb02(uid, #"ui_nexttab");
	}
}

/*
	Name: set_x
	Namespace: namespace_61e6d095
	Checksum: 0xA92C3A2C
	Offset: 0x20A8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function set_x(uid, x)
{
	function_3efa2f37(uid, "x", float(x));
}

/*
	Name: set_y
	Namespace: namespace_61e6d095
	Checksum: 0xF51F1E90
	Offset: 0x20F8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function set_y(uid, y)
{
	function_3efa2f37(uid, "y", float(y));
}

/*
	Name: function_8b0b5811
	Namespace: namespace_61e6d095
	Checksum: 0x293A798C
	Offset: 0x2148
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_8b0b5811(uid, width)
{
	function_3efa2f37(uid, "width", float(width));
}

/*
	Name: function_5dbd7024
	Namespace: namespace_61e6d095
	Checksum: 0x5BF03188
	Offset: 0x2198
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_5dbd7024(uid, height)
{
	function_3efa2f37(uid, "height", float(height));
}

/*
	Name: function_33b3b950
	Namespace: namespace_61e6d095
	Checksum: 0x87E8B678
	Offset: 0x21E8
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_33b3b950(uid, var_b83b583)
{
	function_3efa2f37(uid, "ui3dWindow", var_b83b583);
}

/*
	Name: function_aa5c711d
	Namespace: namespace_61e6d095
	Checksum: 0xD37C032C
	Offset: 0x2228
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_aa5c711d(uid, alpha)
{
	function_3efa2f37(uid, "alpha", float(alpha));
}

/*
	Name: function_df0d7a85
	Namespace: namespace_61e6d095
	Checksum: 0xB74F2374
	Offset: 0x2278
	Size: 0x148
	Parameters: 2
	Flags: Linked
*/
function function_df0d7a85(var_a5a2c782, var_59b0e764)
{
	if(!isdefined(var_59b0e764))
	{
		var_59b0e764 = [];
	}
	else if(!isarray(var_59b0e764))
	{
		var_59b0e764 = array(var_59b0e764);
	}
	if(!isdefined(level.var_61e6d095.hidden[var_a5a2c782]))
	{
		level.var_61e6d095.hidden[var_a5a2c782] = [];
	}
	foreach(uid in var_59b0e764)
	{
		level.var_61e6d095.hidden[var_a5a2c782][uid] = uid;
		if(exists(uid))
		{
			function_3efa2f37(uid, "hide", 1);
		}
	}
}

/*
	Name: function_f96376c5
	Namespace: namespace_61e6d095
	Checksum: 0x2CE93C20
	Offset: 0x23C8
	Size: 0x138
	Parameters: 1
	Flags: Linked
*/
function function_f96376c5(var_a5a2c782)
{
	if(isdefined(level.var_61e6d095.hidden[var_a5a2c782]))
	{
		var_59b0e764 = level.var_61e6d095.hidden[var_a5a2c782];
		arrayremoveindex(level.var_61e6d095.hidden, var_a5a2c782, 1);
		foreach(uid in var_59b0e764)
		{
			if(exists(uid) && !should_hide(uid))
			{
				function_3efa2f37(uid, "hide", 0);
			}
		}
	}
}

/*
	Name: function_28027c42
	Namespace: namespace_61e6d095
	Checksum: 0x60B4CAF8
	Offset: 0x2508
	Size: 0x270
	Parameters: 2
	Flags: Linked
*/
function function_28027c42(var_d4d3e35d, var_59b0e764)
{
	if(!isdefined(var_59b0e764))
	{
		var_59b0e764 = [];
	}
	else if(!isarray(var_59b0e764))
	{
		var_59b0e764 = array(var_59b0e764);
	}
	if(!isdefined(level.var_61e6d095.var_db65bf2f[var_d4d3e35d]))
	{
		level.var_61e6d095.var_db65bf2f[var_d4d3e35d] = {};
	}
	if(!isdefined(level.var_61e6d095.var_db65bf2f[var_d4d3e35d].var_59b0e764))
	{
		level.var_61e6d095.var_db65bf2f[var_d4d3e35d].var_59b0e764 = [];
	}
	foreach(uid in var_59b0e764)
	{
		level.var_61e6d095.var_db65bf2f[var_d4d3e35d].var_59b0e764[uid] = uid;
	}
	level.var_61e6d095.var_db65bf2f[var_d4d3e35d].active = 1;
	foreach(var_33b126b0 in level.var_61e6d095.active)
	{
		if(should_hide(var_33b126b0.uid))
		{
			function_3efa2f37(var_33b126b0.uid, "hide", 1);
			continue;
		}
		function_3efa2f37(var_33b126b0.uid, "hide", 0);
	}
}

/*
	Name: function_d3c3e5c3
	Namespace: namespace_61e6d095
	Checksum: 0x14BB923D
	Offset: 0x2780
	Size: 0x20C
	Parameters: 2
	Flags: Linked
*/
function function_d3c3e5c3(uid, var_8e8cbb71)
{
	if(!isdefined(var_8e8cbb71))
	{
		var_8e8cbb71 = [];
	}
	else if(!isarray(var_8e8cbb71))
	{
		var_8e8cbb71 = array(var_8e8cbb71);
	}
	any_active = 0;
	foreach(var_d4d3e35d in var_8e8cbb71)
	{
		if(!isdefined(level.var_61e6d095.var_db65bf2f[var_d4d3e35d]))
		{
			level.var_61e6d095.var_db65bf2f[var_d4d3e35d] = {};
		}
		if(!isdefined(level.var_61e6d095.var_db65bf2f[var_d4d3e35d].var_59b0e764))
		{
			level.var_61e6d095.var_db65bf2f[var_d4d3e35d].var_59b0e764 = [];
		}
		level.var_61e6d095.var_db65bf2f[var_d4d3e35d].var_59b0e764[uid] = uid;
		any_active = any_active || is_true(level.var_61e6d095.var_db65bf2f[var_d4d3e35d].active);
	}
	if(any_active)
	{
		if(should_hide(uid))
		{
			function_3efa2f37(uid, "hide", 1);
		}
		else
		{
			function_3efa2f37(uid, "hide", 0);
		}
	}
}

/*
	Name: function_3abc637f
	Namespace: namespace_61e6d095
	Checksum: 0x98818A2D
	Offset: 0x2998
	Size: 0x264
	Parameters: 2
	Flags: Linked
*/
function function_3abc637f(uid, var_d4d3e35d)
{
	if(isdefined(var_d4d3e35d))
	{
		if(isdefined(level.var_61e6d095.var_db65bf2f[var_d4d3e35d]))
		{
			arrayremoveindex(level.var_61e6d095.var_db65bf2f[var_d4d3e35d].var_59b0e764, uid, 1);
			if(!is_true(level.var_61e6d095.var_db65bf2f[var_d4d3e35d].active) && level.var_61e6d095.var_db65bf2f[var_d4d3e35d].var_59b0e764.size == 0)
			{
				arrayremoveindex(level.var_61e6d095.var_db65bf2f, var_d4d3e35d, 1);
			}
		}
	}
	else
	{
		foreach(ref, exceptions in level.var_61e6d095.var_db65bf2f)
		{
			arrayremoveindex(exceptions.var_59b0e764, uid, 1);
			if(!is_true(exceptions.active) && exceptions.var_59b0e764.size == 0)
			{
				arrayremoveindex(level.var_61e6d095.var_db65bf2f, ref, 1);
			}
		}
	}
	if(isdefined(level.var_61e6d095.active[uid]))
	{
		if(should_hide(uid))
		{
			function_3efa2f37(uid, "hide", 1);
		}
		else
		{
			function_3efa2f37(uid, "hide", 0);
		}
	}
}

/*
	Name: function_4279fd02
	Namespace: namespace_61e6d095
	Checksum: 0x8B2825E0
	Offset: 0x2C08
	Size: 0x130
	Parameters: 1
	Flags: Linked
*/
function function_4279fd02(var_d4d3e35d)
{
	if(isdefined(level.var_61e6d095.var_db65bf2f[var_d4d3e35d]))
	{
		level.var_61e6d095.var_db65bf2f[var_d4d3e35d].active = 0;
		foreach(var_33b126b0 in level.var_61e6d095.active)
		{
			if(should_hide(var_33b126b0.uid))
			{
				function_3efa2f37(var_33b126b0.uid, "hide", 1);
				continue;
			}
			function_3efa2f37(var_33b126b0.uid, "hide", 0);
		}
	}
}

/*
	Name: should_hide
	Namespace: namespace_61e6d095
	Checksum: 0x400BFEFF
	Offset: 0x2D40
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function should_hide(uid)
{
	foreach(var_59b0e764 in level.var_61e6d095.hidden)
	{
		if(isdefined(var_59b0e764[uid]))
		{
			return 1;
		}
	}
	var_bbf85716 = 0;
	if(level.var_61e6d095.var_db65bf2f.size > 0)
	{
		foreach(var_7db9f8e9 in level.var_61e6d095.var_db65bf2f)
		{
			if(is_true(var_7db9f8e9.active))
			{
				var_bbf85716 = 1;
				if(isdefined(var_7db9f8e9.var_59b0e764[uid]))
				{
					return 0;
				}
			}
		}
	}
	return var_bbf85716;
}

/*
	Name: function_73c9a490
	Namespace: namespace_61e6d095
	Checksum: 0x80E60C7B
	Offset: 0x2EC0
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_73c9a490(uid, focus)
{
	function_3efa2f37(uid, "focus", focus);
}

/*
	Name: function_46df0bc7
	Namespace: namespace_61e6d095
	Checksum: 0xB98F4A6
	Offset: 0x2F00
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_46df0bc7(uid, priority)
{
	function_3efa2f37(uid, "priority", priority);
}

/*
	Name: function_bede6f52
	Namespace: namespace_61e6d095
	Checksum: 0xE58B26BA
	Offset: 0x2F40
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function function_bede6f52(uid, scale)
{
	function_3efa2f37(uid, "scale", float(scale));
}

/*
	Name: function_39710437
	Namespace: namespace_61e6d095
	Checksum: 0x3FDC171
	Offset: 0x2F90
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function function_39710437(uid, var_e93ee030)
{
	/#
		assert(var_e93ee030 == "" || var_e93ee030 == "" || var_e93ee030 == "", "");
	#/
	function_3efa2f37(uid, "sizeto", var_e93ee030);
}

/*
	Name: function_d5ea17f0
	Namespace: namespace_61e6d095
	Checksum: 0x33839EBE
	Offset: 0x3020
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_d5ea17f0(uid, text)
{
	function_3efa2f37(uid, "text", text);
}

/*
	Name: function_bfdab223
	Namespace: namespace_61e6d095
	Checksum: 0xA5B4E786
	Offset: 0x3060
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function function_bfdab223(uid, text, var_80d5359e)
{
	if(!isdefined(var_80d5359e))
	{
		var_80d5359e = 0;
	}
	function_3efa2f37(uid, "desc", text, var_80d5359e);
}

/*
	Name: function_e11447eb
	Namespace: namespace_61e6d095
	Checksum: 0x960EE98F
	Offset: 0x30B8
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_e11447eb(uid, button_text)
{
	function_3efa2f37(uid, "button_text", button_text);
}

/*
	Name: function_309bf7c2
	Namespace: namespace_61e6d095
	Checksum: 0x7963F4C6
	Offset: 0x30F8
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_309bf7c2(uid, image)
{
	function_3efa2f37(uid, "image", image);
}

/*
	Name: set_color
	Namespace: namespace_61e6d095
	Checksum: 0xBCB36DCA
	Offset: 0x3138
	Size: 0x64
	Parameters: 4
	Flags: None
*/
function set_color(uid, red, green, blue)
{
	function_3efa2f37(uid, "color", (((red + " ") + green) + " ") + blue);
}

/*
	Name: function_7f9d1ac4
	Namespace: namespace_61e6d095
	Checksum: 0xE90C666
	Offset: 0x31A8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_7f9d1ac4(uid, time)
{
	function_3efa2f37(uid, "time", float(time));
}

/*
	Name: set_timer
	Namespace: namespace_61e6d095
	Checksum: 0x35E77ADD
	Offset: 0x31F8
	Size: 0x13C
	Parameters: 3
	Flags: None
*/
function set_timer(uid, time, countdown)
{
	if(!isdefined(countdown))
	{
		countdown = 1;
	}
	time = int(time * 1000);
	if(countdown)
	{
		function_89bba41b(uid, "timer", {#goal_time:0, #time:time});
	}
	else
	{
		start_time = 0;
		var_f2f8de51 = function_8db2364c(uid, "timer");
		if(isdefined(var_f2f8de51))
		{
			start_time = var_f2f8de51.time;
		}
		function_89bba41b(uid, "timer", {#goal_time:time, #time:start_time});
	}
	thread update_timer(uid);
}

/*
	Name: pause_timer
	Namespace: namespace_61e6d095
	Checksum: 0x9B4223C5
	Offset: 0x3340
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function pause_timer(uid)
{
	var_f2f8de51 = function_8db2364c(uid, "timer");
	if(isdefined(var_f2f8de51))
	{
		var_f2f8de51.paused = 1;
	}
}

/*
	Name: function_f3dcb134
	Namespace: namespace_61e6d095
	Checksum: 0xACBA24D6
	Offset: 0x3398
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_f3dcb134(uid)
{
	var_f2f8de51 = function_8db2364c(uid, "timer");
	if(isdefined(var_f2f8de51))
	{
		var_f2f8de51.paused = 0;
	}
}

/*
	Name: clear_timer
	Namespace: namespace_61e6d095
	Checksum: 0x78982A64
	Offset: 0x33F0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function clear_timer(uid)
{
	function_4ac40e40(uid, "timer");
	function_fbe9f25e(uid, 3);
}

/*
	Name: update_timer
	Namespace: namespace_61e6d095
	Checksum: 0xA7DC48E0
	Offset: 0x3440
	Size: 0x19C
	Parameters: 1
	Flags: Linked, Private
*/
function private update_timer(uid)
{
	level notify("update_timer_" + uid);
	level endon("update_timer_" + uid, "delete_widget_" + uid, "scripted_widget_data_removed_timer_" + uid, #"hash_64a3b02565bdf75f");
	set_flags(uid, 3);
	while(true)
	{
		timer = function_8db2364c(uid, "timer");
		function_7f9d1ac4(uid, timer.time);
		if(!is_true(timer.paused))
		{
			if(timer.goal_time == 0)
			{
				timer.time = int(max(timer.time - function_60d95f53(), timer.goal_time));
			}
			else
			{
				timer.time = int(min(timer.time + function_60d95f53(), timer.goal_time));
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_32545050
	Namespace: namespace_61e6d095
	Checksum: 0x43A3D5E
	Offset: 0x35E8
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_32545050(uid, distance)
{
	function_3efa2f37(uid, "distance", distance);
}

/*
	Name: function_283c7712
	Namespace: namespace_61e6d095
	Checksum: 0x24698621
	Offset: 0x3628
	Size: 0x84
	Parameters: 3
	Flags: None
*/
function function_283c7712(uid, ent, var_7c7535b4)
{
	if(!isdefined(var_7c7535b4))
	{
		var_7c7535b4 = 0.0254;
	}
	function_89bba41b(uid, "distance", {#hash_7c7535b4:var_7c7535b4, #ent:ent});
	thread update_distance(uid);
}

/*
	Name: function_8a843e00
	Namespace: namespace_61e6d095
	Checksum: 0x9B5B74AB
	Offset: 0x36B8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_8a843e00(uid)
{
	function_4ac40e40(uid, "distance");
	function_fbe9f25e(uid, 2);
}

/*
	Name: update_distance
	Namespace: namespace_61e6d095
	Checksum: 0x118673AB
	Offset: 0x3708
	Size: 0x22E
	Parameters: 1
	Flags: Linked, Private
*/
function private update_distance(uid)
{
	level notify("update_distance_" + uid);
	level endon("update_distance_" + uid, "delete_widget_" + uid, "scripted_widget_data_removed_distance_" + uid, #"hash_64a3b02565bdf75f");
	player = getplayers()[0];
	player endon(#"death");
	set_flags(uid, 2);
	offset = self function_8db2364c(uid, "offset");
	if(isdefined(offset))
	{
		offset = offset.offset;
	}
	while(true)
	{
		var_9941a398 = function_8db2364c(uid, "distance");
		ent = var_9941a398.ent;
		player_camera = player getplayercamerapos();
		ent_pos = ent.origin;
		if(isentity(ent))
		{
			ent_pos = ent_pos + rotatepoint(ent getboundsmidpoint(), ent.angles);
		}
		if(isdefined(offset))
		{
			ent_pos = ent_pos + rotatepoint(offset, ent.angles);
		}
		dist = distance(player_camera, ent_pos) * var_9941a398.var_7c7535b4;
		function_32545050(uid, dist);
		waitframe(1);
	}
}

/*
	Name: set_count
	Namespace: namespace_61e6d095
	Checksum: 0xBA55B2E4
	Offset: 0x3940
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function set_count(uid, count, var_80d5359e)
{
	if(!isdefined(var_80d5359e))
	{
		var_80d5359e = 0;
	}
	function_3efa2f37(uid, "count", count, var_80d5359e);
}

/*
	Name: function_b1e6d7a8
	Namespace: namespace_61e6d095
	Checksum: 0xC8970D74
	Offset: 0x3998
	Size: 0x5C
	Parameters: 3
	Flags: Linked
*/
function function_b1e6d7a8(uid, fraction, var_80d5359e)
{
	if(!isdefined(var_80d5359e))
	{
		var_80d5359e = 0;
	}
	function_3efa2f37(uid, "fraction", float(fraction), var_80d5359e);
}

/*
	Name: set_state
	Namespace: namespace_61e6d095
	Checksum: 0xD49FA656
	Offset: 0x3A00
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function set_state(uid, state)
{
	function_3efa2f37(uid, "state", state);
}

/*
	Name: function_f942c3ed
	Namespace: namespace_61e6d095
	Checksum: 0x5166529E
	Offset: 0x3A40
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_f942c3ed(uid, clip)
{
	function_3efa2f37(uid, "clip", clip);
}

/*
	Name: set_flags
	Namespace: namespace_61e6d095
	Checksum: 0x13C3EC62
	Offset: 0x3A80
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function set_flags(uid, flags, var_10e09b46)
{
	if(!isdefined(var_10e09b46))
	{
		var_10e09b46 = 0;
	}
	var_b89f8baa = function_82e355ff(uid, "flags");
	var_c2e076fc = function_bfbe6ac6(flags, var_b89f8baa, var_10e09b46);
	function_3efa2f37(uid, "flags", var_c2e076fc);
}

/*
	Name: function_fbe9f25e
	Namespace: namespace_61e6d095
	Checksum: 0x74A6769B
	Offset: 0x3B18
	Size: 0xB4
	Parameters: 3
	Flags: Linked
*/
function function_fbe9f25e(uid, flags, var_10e09b46)
{
	if(!isdefined(var_10e09b46))
	{
		var_10e09b46 = 0;
	}
	var_b89f8baa = (isdefined(function_82e355ff(uid, "flags")) ? function_82e355ff(uid, "flags") : 0);
	var_c2e076fc = function_1a20b94a(flags, var_b89f8baa, var_10e09b46);
	function_3efa2f37(uid, "flags", var_c2e076fc);
}

/*
	Name: function_d7d2fcce
	Namespace: namespace_61e6d095
	Checksum: 0x7EA3BF4F
	Offset: 0x3BD8
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_d7d2fcce(uid, name, value, var_80d5359e, var_1f7d0ca0, var_7b030046, var_2226bd51)
{
	function_3efa2f37(uid, ("data" + ".") + name, value, var_80d5359e, var_1f7d0ca0, var_7b030046, var_2226bd51);
}

/*
	Name: function_92ba69fa
	Namespace: namespace_61e6d095
	Checksum: 0xD5185788
	Offset: 0x3C58
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_92ba69fa(uid, name)
{
	function_80157d8(uid, ("data" + ".") + name);
}

/*
	Name: function_6b97044d
	Namespace: namespace_61e6d095
	Checksum: 0x623B44C1
	Offset: 0x3CA8
	Size: 0x64
	Parameters: 3
	Flags: Linked
*/
function function_6b97044d(uid, name, var_c15ae58d)
{
	globallogic_ui::function_2ec075a9(((((("ScriptedWidgetData.widgetModels" + ".") + uid) + ".") + "data") + ".") + name, var_c15ae58d);
}

/*
	Name: function_9ade1d9b
	Namespace: namespace_61e6d095
	Checksum: 0x20CEDD0E
	Offset: 0x3D18
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_9ade1d9b(uid, name, value, var_80d5359e, var_1f7d0ca0, var_7b030046, var_2226bd51)
{
	function_3efa2f37(uid, name, value, var_80d5359e, var_1f7d0ca0, var_7b030046, var_2226bd51);
}

/*
	Name: function_f7c4c669
	Namespace: namespace_61e6d095
	Checksum: 0x8C213EA1
	Offset: 0x3D80
	Size: 0x2A
	Parameters: 2
	Flags: Linked
*/
function function_f7c4c669(uid, name)
{
	return function_82e355ff(uid, name);
}

/*
	Name: function_43525bc6
	Namespace: namespace_61e6d095
	Checksum: 0x14110B80
	Offset: 0x3DB8
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function function_43525bc6(uid, name, var_c15ae58d)
{
	globallogic_ui::function_2ec075a9(((("ScriptedWidgetData.widgetModels" + ".") + uid) + ".") + name, var_c15ae58d);
}

/*
	Name: function_330981ed
	Namespace: namespace_61e6d095
	Checksum: 0xDA625D4D
	Offset: 0x3E18
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_330981ed(uid, var_29459a31)
{
	if(!isdefined(var_29459a31))
	{
		var_29459a31 = "list";
	}
	function_3efa2f37(uid, var_29459a31);
	thread function_57d676db(uid, var_29459a31);
}

/*
	Name: function_f2a9266
	Namespace: namespace_61e6d095
	Checksum: 0x68714011
	Offset: 0x3E78
	Size: 0x2DC
	Parameters: 6
	Flags: Linked
*/
function function_f2a9266(uid, index, name, value, var_29459a31, force)
{
	if(!isdefined(var_29459a31))
	{
		var_29459a31 = "list";
	}
	if(isdefined(index) && !isdefined(function_80157d8(uid, (var_29459a31 + ".") + index)))
	{
		function_3efa2f37(uid, (((var_29459a31 + ".") + index) + ".") + "listIndex", index, undefined, undefined, undefined, undefined, var_29459a31);
	}
	if(isarray(value))
	{
		var_d9cf51e8 = var_29459a31;
		if(isdefined(index))
		{
			var_d9cf51e8 = (((var_29459a31 + ".") + index) + ".") + var_29459a31;
		}
		foreach(v in value)
		{
			function_f2a9266(uid, i, name, v, var_d9cf51e8, force);
		}
	}
	else
	{
		if(isstruct(value))
		{
			/#
				assert(isdefined(value.names) && isdefined(value.data), "");
			#/
			foreach(v in value.data)
			{
				function_f2a9266(uid, index, value.names[i], v, var_29459a31, force);
			}
		}
		else
		{
			function_3efa2f37(uid, (((var_29459a31 + ".") + index) + ".") + name, value, force, undefined, undefined, undefined, var_29459a31);
		}
	}
	thread function_57d676db(uid, var_29459a31);
}

/*
	Name: function_ce8141d4
	Namespace: namespace_61e6d095
	Checksum: 0x65E5F149
	Offset: 0x4160
	Size: 0x6A
	Parameters: 4
	Flags: None
*/
function function_ce8141d4(uid, index, name, var_29459a31)
{
	if(!isdefined(var_29459a31))
	{
		var_29459a31 = "list";
	}
	return function_82e355ff(uid, (((var_29459a31 + ".") + index) + ".") + name);
}

/*
	Name: function_9bc1d2f1
	Namespace: namespace_61e6d095
	Checksum: 0xD805B9B
	Offset: 0x41D8
	Size: 0x19C
	Parameters: 6
	Flags: Linked
*/
function function_9bc1d2f1(uid, index, flags, var_10e09b46, model_name, var_29459a31)
{
	if(!isdefined(var_10e09b46))
	{
		var_10e09b46 = 0;
	}
	if(!isdefined(model_name))
	{
		model_name = "flags";
	}
	if(!isdefined(var_29459a31))
	{
		var_29459a31 = "list";
	}
	if(!isdefined(function_80157d8(uid, (var_29459a31 + ".") + index)))
	{
		function_3efa2f37(uid, (((var_29459a31 + ".") + index) + ".") + "listIndex", index, undefined, undefined, undefined, undefined, var_29459a31);
	}
	var_b89f8baa = function_82e355ff(uid, (((var_29459a31 + ".") + index) + ".") + model_name);
	var_c2e076fc = function_bfbe6ac6(flags, var_b89f8baa, var_10e09b46);
	function_3efa2f37(uid, (((var_29459a31 + ".") + index) + ".") + model_name, var_c2e076fc, undefined, undefined, undefined, undefined, var_29459a31);
	thread function_57d676db(uid, var_29459a31);
}

/*
	Name: function_e8c19a33
	Namespace: namespace_61e6d095
	Checksum: 0x313F93C2
	Offset: 0x4380
	Size: 0x19C
	Parameters: 6
	Flags: Linked
*/
function function_e8c19a33(uid, index, flags, var_10e09b46, model_name, var_29459a31)
{
	if(!isdefined(var_10e09b46))
	{
		var_10e09b46 = 0;
	}
	if(!isdefined(model_name))
	{
		model_name = "flags";
	}
	if(!isdefined(var_29459a31))
	{
		var_29459a31 = "list";
	}
	if(!isdefined(function_80157d8(uid, (var_29459a31 + ".") + index)))
	{
		function_3efa2f37(uid, (((var_29459a31 + ".") + index) + ".") + "listIndex", index, undefined, undefined, undefined, undefined, var_29459a31);
	}
	var_b89f8baa = function_82e355ff(uid, (((var_29459a31 + ".") + index) + ".") + model_name);
	var_c2e076fc = function_1a20b94a(flags, var_b89f8baa, var_10e09b46);
	function_3efa2f37(uid, (((var_29459a31 + ".") + index) + ".") + model_name, var_c2e076fc, undefined, undefined, undefined, undefined, var_29459a31);
	thread function_57d676db(uid, var_29459a31);
}

/*
	Name: function_7239e030
	Namespace: namespace_61e6d095
	Checksum: 0xC34C0A11
	Offset: 0x4528
	Size: 0x84
	Parameters: 3
	Flags: Linked
*/
function function_7239e030(uid, index, var_29459a31)
{
	if(!isdefined(var_29459a31))
	{
		var_29459a31 = "list";
	}
	if(globallogic_ui::function_6db5e620(((("ScriptedWidgetData.widgetModels" + ".") + uid) + ".") + var_29459a31, index))
	{
		thread function_57d676db(uid, var_29459a31);
	}
}

/*
	Name: function_cd59371c
	Namespace: namespace_61e6d095
	Checksum: 0xE264CAA8
	Offset: 0x45B8
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function function_cd59371c(uid, index, var_29459a31)
{
	if(!isdefined(var_29459a31))
	{
		var_29459a31 = "list";
	}
	return isdefined(function_80157d8(uid, (var_29459a31 + ".") + index));
}

/*
	Name: function_6e0fad3b
	Namespace: namespace_61e6d095
	Checksum: 0x419EDC9B
	Offset: 0x4618
	Size: 0x154
	Parameters: 2
	Flags: Linked
*/
function function_6e0fad3b(uid, ent)
{
	if(isstruct(ent) || ent.classname === "script_origin")
	{
		function_3efa2f37(uid, "entNum", worldentnumber());
		if(isdefined(self.origin))
		{
			function_4d9fbc9d(uid, ent.origin[0]);
			function_52dbc715(uid, ent.origin[1]);
			function_60856268(uid, ent.origin[2]);
			function_9c3ced73(uid, 1);
		}
	}
	else
	{
		function_3efa2f37(uid, "entNum", ent getentitynumber());
		ent thread delete_on_death(uid);
	}
}

/*
	Name: function_4d9fbc9d
	Namespace: namespace_61e6d095
	Checksum: 0x4F266DFD
	Offset: 0x4778
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_4d9fbc9d(uid, x_offset)
{
	function_3efa2f37(uid, "xOffset", x_offset);
}

/*
	Name: function_52dbc715
	Namespace: namespace_61e6d095
	Checksum: 0xEEAF0428
	Offset: 0x47B8
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_52dbc715(uid, y_offset)
{
	function_3efa2f37(uid, "yOffset", y_offset);
}

/*
	Name: function_60856268
	Namespace: namespace_61e6d095
	Checksum: 0x14AE46CC
	Offset: 0x47F8
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_60856268(uid, z_offset)
{
	function_3efa2f37(uid, "zOffset", z_offset);
}

/*
	Name: function_4ef79fca
	Namespace: namespace_61e6d095
	Checksum: 0x3512B498
	Offset: 0x4838
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_4ef79fca(uid, clamp)
{
	function_3efa2f37(uid, "clamp", clamp);
}

/*
	Name: function_eb16868b
	Namespace: namespace_61e6d095
	Checksum: 0x6C0C1797
	Offset: 0x4878
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_eb16868b(uid, var_9524359a)
{
	function_3efa2f37(uid, "distanceScale", var_9524359a);
}

/*
	Name: function_e648abd8
	Namespace: namespace_61e6d095
	Checksum: 0x5EABCF3
	Offset: 0x48B8
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_e648abd8(uid, var_754bedbb)
{
	function_3efa2f37(uid, "useMidpoint", var_754bedbb);
}

/*
	Name: function_8aa0007
	Namespace: namespace_61e6d095
	Checksum: 0xEEF8675D
	Offset: 0x48F8
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_8aa0007(uid, tag)
{
	function_3efa2f37(uid, "boneTag", tag);
}

/*
	Name: function_9c3ced73
	Namespace: namespace_61e6d095
	Checksum: 0x4DB8B761
	Offset: 0x4938
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_9c3ced73(uid, var_7bd05154)
{
	function_3efa2f37(uid, "useLocalOffset", var_7bd05154);
}

/*
	Name: function_fdb73881
	Namespace: namespace_61e6d095
	Checksum: 0xE91ED63D
	Offset: 0x4978
	Size: 0xD4
	Parameters: 5
	Flags: None
*/
function function_fdb73881(uid, close_dist, far_dist, var_bc8ff11, var_6d219ab3)
{
	if(!isdefined(close_dist))
	{
		close_dist = 500;
	}
	if(!isdefined(far_dist))
	{
		far_dist = 1000;
	}
	if(!isdefined(var_bc8ff11))
	{
		var_bc8ff11 = 1;
	}
	if(!isdefined(var_6d219ab3))
	{
		var_6d219ab3 = 0;
	}
	function_89bba41b(uid, "fade_dist", {#hash_6d219ab3:var_6d219ab3, #hash_bc8ff11:var_bc8ff11, #far_dist:far_dist, #close_dist:close_dist});
}

/*
	Name: function_c3fbdd4
	Namespace: namespace_61e6d095
	Checksum: 0xD926493F
	Offset: 0x4A58
	Size: 0xE4
	Parameters: 6
	Flags: None
*/
function function_c3fbdd4(uid, far_dist, var_3a142f52, var_d7e44381, var_e23f7d1e, var_1f1b932b)
{
	if(!isdefined(far_dist))
	{
		far_dist = 393.7;
	}
	if(!isdefined(var_3a142f52))
	{
		var_3a142f52 = 0;
	}
	if(!isdefined(var_d7e44381))
	{
		var_d7e44381 = 1;
	}
	if(!isdefined(var_e23f7d1e))
	{
		var_e23f7d1e = 2;
	}
	function_89bba41b(uid, "dist_states", {#hash_1f1b932b:var_1f1b932b, #hash_e23f7d1e:var_e23f7d1e, #hash_d7e44381:var_d7e44381, #hash_3a142f52:var_3a142f52, #far_dist:far_dist});
}

/*
	Name: function_d3533603
	Namespace: namespace_61e6d095
	Checksum: 0xB6AD5417
	Offset: 0x4B48
	Size: 0x8C
	Parameters: 3
	Flags: None
*/
function function_d3533603(uid, enable, ignore_ent)
{
	if(enable)
	{
		function_89bba41b(uid, "occlusion", {#ignore_ent:ignore_ent});
	}
	else
	{
		function_4ac40e40(uid, "occlusion");
		function_fbe9f25e(uid, 0);
	}
}

/*
	Name: function_9718880e
	Namespace: namespace_61e6d095
	Checksum: 0x711C083C
	Offset: 0x4BE0
	Size: 0x48E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9718880e(uid)
{
	level endon("delete_widget_" + uid, #"hash_64a3b02565bdf75f");
	level waittill("scripted_widget_data_set_" + uid);
	player = getplayers()[0];
	offset = function_8db2364c(uid, "offset").offset;
	while(isdefined(player))
	{
		dist = undefined;
		alpha = undefined;
		fade_dist = function_8db2364c(uid, "fade_dist");
		occlusion = function_8db2364c(uid, "occlusion");
		dist_states = function_8db2364c(uid, "dist_states");
		player_camera = player getplayercamerapos();
		ent_pos = self.origin;
		if(isentity(self))
		{
			ent_pos = ent_pos + rotatepoint(self getboundsmidpoint(), self.angles);
		}
		if(offset != (0, 0, 0))
		{
			ent_pos = ent_pos + rotatepoint(offset, self.angles);
		}
		if(isdefined(fade_dist))
		{
			if(!isdefined(dist))
			{
				dist = distance(player_camera, ent_pos);
			}
			alpha = lerpfloat(fade_dist.var_bc8ff11, fade_dist.var_6d219ab3, lerpfloat(0, 1, (dist - fade_dist.close_dist) / (fade_dist.far_dist - fade_dist.close_dist)));
		}
		if(isdefined(dist_states))
		{
			if(!isdefined(dist))
			{
				dist = distance(player_camera, ent_pos);
			}
			if(dist > dist_states.far_dist)
			{
				set_state(uid, dist_states.var_3a142f52);
			}
			else if(!is_true(function_82e355ff(uid, "clamped")))
			{
				focused = 0;
				if(isdefined(dist_states.var_1f1b932b))
				{
					player_dir = anglestoforward(player getplayerangles());
					var_52be356a = vectornormalize(ent_pos - player_camera);
					if(vectordot(player_dir, var_52be356a) >= dist_states.var_1f1b932b)
					{
						set_state(uid, dist_states.var_e23f7d1e);
						focused = 1;
					}
				}
				if(!focused)
				{
					set_state(uid, dist_states.var_d7e44381);
				}
			}
		}
		if(isdefined(occlusion) && (!isdefined(alpha) || alpha > 0))
		{
			if(!sighttracepassed(ent_pos, player_camera, 0, self, occlusion.ignore_ent))
			{
				set_flags(uid, 0);
			}
			else
			{
				function_fbe9f25e(uid, 0);
			}
		}
		else if(isdefined(alpha))
		{
			function_aa5c711d(uid, alpha);
		}
		waitframe(1);
	}
}

/*
	Name: function_89bba41b
	Namespace: namespace_61e6d095
	Checksum: 0x1CA19139
	Offset: 0x5078
	Size: 0xA4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_89bba41b(uid, key, data)
{
	if(!isdefined(level.var_2e036148))
	{
		level.var_2e036148 = [];
	}
	if(!isdefined(level.var_2e036148[uid]))
	{
		level.var_2e036148[uid] = [];
	}
	level.var_2e036148[uid][key] = data;
	level notify("scripted_widget_data_set_" + uid);
	level thread function_dc5c6710(uid);
}

/*
	Name: function_8db2364c
	Namespace: namespace_61e6d095
	Checksum: 0x58774CFE
	Offset: 0x5128
	Size: 0x96
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8db2364c(uid, var_14d09bc7)
{
	if(level flag::get("level_restarting"))
	{
		return undefined;
	}
	/#
		assert(isdefined(level.var_2e036148) && isdefined(level.var_2e036148[uid]), "" + uid);
	#/
	return level.var_2e036148[uid][var_14d09bc7];
}

/*
	Name: function_4ac40e40
	Namespace: namespace_61e6d095
	Checksum: 0x147F4952
	Offset: 0x51C8
	Size: 0xBA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4ac40e40(uid, var_14d09bc7)
{
	if(level flag::get("level_restarting"))
	{
		return undefined;
	}
	/#
		assert(isdefined(level.var_2e036148) && isdefined(level.var_2e036148[uid]), "" + uid);
	#/
	level notify((("scripted_widget_data_removed_" + var_14d09bc7) + "_") + uid);
	level.var_2e036148[uid][var_14d09bc7] = undefined;
}

/*
	Name: function_3efa2f37
	Namespace: namespace_61e6d095
	Checksum: 0x41C8D3B0
	Offset: 0x5290
	Size: 0x1EC
	Parameters: 8
	Flags: Linked, Private
*/
function private function_3efa2f37(uid, model, value, var_80d5359e, var_1f7d0ca0, var_7b030046, var_2226bd51, var_29459a31)
{
	if(model != "widgetName")
	{
		if(!exists(uid))
		{
			if(!level flag::get("restoring_ui_models") && !level flag::get("level_restarting"))
			{
				/#
					assertmsg(((("" + model) + "") + uid) + "");
				#/
			}
			return;
		}
	}
	if(isdefined(level.var_61e6d095.active[uid]) && gettime() > level.var_61e6d095.active[uid].time && !isdefined(function_80157d8(uid, model)) && (!isdefined(var_29459a31) || !isdefined(function_80157d8(uid, var_29459a31 + "Update"))))
	{
		thread function_2b815b7(uid);
	}
	globallogic_ui::function_9ed5232e(((("ScriptedWidgetData.widgetModels" + ".") + uid) + ".") + model, value, undefined, var_80d5359e, var_1f7d0ca0, var_7b030046, var_2226bd51);
}

/*
	Name: function_82e355ff
	Namespace: namespace_61e6d095
	Checksum: 0xA12D4D77
	Offset: 0x5488
	Size: 0x4A
	Parameters: 2
	Flags: Linked
*/
function function_82e355ff(uid, model)
{
	return globallogic_ui::function_f053dcd4(((("ScriptedWidgetData.widgetModels" + ".") + uid) + ".") + model);
}

/*
	Name: function_80157d8
	Namespace: namespace_61e6d095
	Checksum: 0x79A454E0
	Offset: 0x54E0
	Size: 0x4A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_80157d8(uid, model)
{
	return globallogic_ui::function_5b3d23d5(((("ScriptedWidgetData.widgetModels" + ".") + uid) + ".") + model);
}

/*
	Name: function_4e406a1a
	Namespace: namespace_61e6d095
	Checksum: 0xEAFD09DF
	Offset: 0x5538
	Size: 0xAC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4e406a1a(reset)
{
	if(!isdefined(reset))
	{
		reset = 0;
	}
	if(level flag::get("level_restarting") && !reset)
	{
		return;
	}
	while(!isdefined(globallogic_ui::function_5b3d23d5("ScriptedWidgetData.update", 0)))
	{
		level endon(#"hash_64a3b02565bdf75f");
		waitframe(1);
	}
	globallogic_ui::function_9ed5232e("ScriptedWidgetData.update", !reset, 0, 1, undefined, undefined, 1, reset);
}

/*
	Name: function_2b815b7
	Namespace: namespace_61e6d095
	Checksum: 0xA253B779
	Offset: 0x55F0
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2b815b7(uid)
{
	level notify("update_widget_subscriptions_" + uid);
	level endon("update_widget_subscriptions_" + uid);
	globallogic_ui::function_9ed5232e(((("ScriptedWidgetData.widgetModels" + ".") + uid) + ".") + "update_subscriptions", 1, undefined, 1, 0, 0, 1);
}

/*
	Name: function_57d676db
	Namespace: namespace_61e6d095
	Checksum: 0x645FB8C3
	Offset: 0x5680
	Size: 0x84
	Parameters: 2
	Flags: Linked, Private
*/
function private function_57d676db(uid, var_29459a31)
{
	if(exists(uid))
	{
		globallogic_ui::function_9ed5232e((((("ScriptedWidgetData.widgetModels" + ".") + uid) + ".") + var_29459a31) + "Update", 1, 0, 1, undefined, undefined, 1);
	}
}

/*
	Name: function_dc5c6710
	Namespace: namespace_61e6d095
	Checksum: 0xEE02968C
	Offset: 0x5710
	Size: 0x78
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dc5c6710(uid)
{
	self notify("cleanup_widget_data_" + uid);
	self endon("cleanup_widget_data_" + uid);
	level waittill("delete_widget_" + uid, #"hash_64a3b02565bdf75f");
	if(isdefined(self.var_2e036148))
	{
		self.var_2e036148[uid] = undefined;
	}
}

/*
	Name: delete_on_death
	Namespace: namespace_61e6d095
	Checksum: 0x41088C09
	Offset: 0x5790
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function delete_on_death(uid)
{
	self notify("delete_on_death_" + uid);
	self endon("delete_on_death_" + uid);
	level endon("delete_widget_" + uid, #"hash_64a3b02565bdf75f");
	self waittill(#"death");
	thread remove(uid);
}

/*
	Name: function_bfbe6ac6
	Namespace: namespace_61e6d095
	Checksum: 0xDC28E0BF
	Offset: 0x5818
	Size: 0x122
	Parameters: 3
	Flags: Linked, Private
*/
function private function_bfbe6ac6(flags, var_b89f8baa, var_10e09b46)
{
	if(!isdefined(var_10e09b46))
	{
		var_10e09b46 = 0;
	}
	var_c2e076fc = flags;
	if(!var_10e09b46)
	{
		if(!isdefined(flags))
		{
			flags = [];
		}
		else if(!isarray(flags))
		{
			flags = array(flags);
		}
		var_c2e076fc = 0;
		foreach(flag in flags)
		{
			var_c2e076fc = var_c2e076fc | (1 << flag);
		}
	}
	if(isdefined(var_b89f8baa))
	{
		var_c2e076fc = var_c2e076fc | var_b89f8baa;
	}
	return var_c2e076fc;
}

/*
	Name: function_1a20b94a
	Namespace: namespace_61e6d095
	Checksum: 0x2CD0854B
	Offset: 0x5948
	Size: 0x124
	Parameters: 3
	Flags: Linked, Private
*/
function private function_1a20b94a(flags, var_b89f8baa, var_10e09b46)
{
	if(!isdefined(var_b89f8baa))
	{
		var_b89f8baa = 0;
	}
	if(!isdefined(var_10e09b46))
	{
		var_10e09b46 = 0;
	}
	var_c2e076fc = var_b89f8baa;
	if(!var_10e09b46)
	{
		if(!isdefined(flags))
		{
			flags = [];
		}
		else if(!isarray(flags))
		{
			flags = array(flags);
		}
		foreach(flag in flags)
		{
			var_c2e076fc = var_c2e076fc & (~(1 << flag));
		}
	}
	else
	{
		var_c2e076fc = var_c2e076fc & (~flags);
	}
	return var_c2e076fc;
}

/*
	Name: function_e13a1a9c
	Namespace: namespace_61e6d095
	Checksum: 0x84FF659B
	Offset: 0x5A78
	Size: 0x47E
	Parameters: 9
	Flags: None
*/
function function_e13a1a9c(var_c035ab4f, var_39359c1e, var_92c0faf8, cancel_callback, var_942056ea, var_daf05886, var_bd8024b5, var_26759105, var_1da0c034)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	/#
		assert(isarray(var_c035ab4f) && var_c035ab4f.size == 2);
	#/
	/#
		assert(!isdefined(var_1da0c034) || (isarray(var_1da0c034) && var_1da0c034.size == 2));
	#/
	if(isdefined(var_daf05886))
	{
		level endon(var_daf05886);
	}
	if(isdefined(var_bd8024b5))
	{
		player endon(var_bd8024b5);
	}
	var_bc6e33ce = [1:0, 0:0];
	var_dd82beda = [1:0, 0:0];
	var_768a0348 = [1:-1, 0:-1];
	var_44b06a67 = (isdefined(var_1da0c034) ? var_1da0c034 : [1:0, 0:0]);
	player function_2947fddf(var_768a0348, var_44b06a67, var_c035ab4f, var_39359c1e, var_942056ea);
	while(true)
	{
		if(isdefined(var_92c0faf8) && self function_affb1af1())
		{
			var_75843d9b = player [[var_92c0faf8]](var_768a0348, var_942056ea);
			if(is_true(var_75843d9b))
			{
				break;
			}
		}
		if(isdefined(cancel_callback) && self function_57fbd346())
		{
			player [[cancel_callback]](var_942056ea);
			break;
		}
		var_e73a18ff = player function_9c365c3b();
		for(var_ea37ba57 = 0; var_ea37ba57 < 2; var_ea37ba57++)
		{
			var_44b06a67[var_ea37ba57] = var_768a0348[var_ea37ba57];
			var_edeb0521 = 0;
			if(var_ea37ba57 == 0)
			{
				var_edeb0521 = var_e73a18ff.y;
			}
			else
			{
				var_edeb0521 = var_e73a18ff.x;
			}
			var_edeb0521 = util::function_b5338ccb(var_edeb0521, 0.2);
			if(var_ea37ba57 == 0)
			{
				var_edeb0521 = var_edeb0521 * -1;
			}
			var_8d765541 = 0;
			if(var_edeb0521 == 0)
			{
				var_8d765541 = function_ec6ae51a(var_ea37ba57);
			}
			else
			{
				if(var_edeb0521 > 0)
				{
					var_8d765541 = 1;
				}
				else
				{
					var_8d765541 = -1;
				}
			}
			if(var_8d765541 == 0)
			{
				var_dd82beda[var_ea37ba57] = 0;
				continue;
			}
			var_691ec9a7 = var_dd82beda[var_ea37ba57] != var_8d765541;
			var_3e9543e8 = !var_691ec9a7 && (gettime() - var_bc6e33ce[var_ea37ba57]) > 250;
			if(var_691ec9a7 || var_3e9543e8)
			{
				var_bc6e33ce[var_ea37ba57] = gettime();
				var_dd82beda[var_ea37ba57] = var_8d765541;
				var_44b06a67[var_ea37ba57] = var_768a0348[var_ea37ba57] + var_8d765541;
				var_44b06a67[var_ea37ba57] = function_d43d9448(var_44b06a67[var_ea37ba57], var_c035ab4f[var_ea37ba57], var_26759105);
			}
		}
		player function_2947fddf(var_768a0348, var_44b06a67, var_c035ab4f, var_39359c1e, var_942056ea, var_26759105);
		waitframe(1);
	}
}

/*
	Name: function_d43d9448
	Namespace: namespace_61e6d095
	Checksum: 0xA311887E
	Offset: 0x5F00
	Size: 0xA6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d43d9448(index, var_8a7846a6, var_26759105)
{
	min = 0;
	max = var_8a7846a6 - 1;
	if(is_true(var_26759105))
	{
		if(index < min)
		{
			index = max;
		}
		else if(index > max)
		{
			index = min;
		}
	}
	else
	{
		if(index < min)
		{
			index = min;
		}
		else if(index > max)
		{
			index = max;
		}
	}
	return index;
}

/*
	Name: function_2947fddf
	Namespace: namespace_61e6d095
	Checksum: 0xC4040F7F
	Offset: 0x5FB0
	Size: 0xEC
	Parameters: 6
	Flags: Linked, Private
*/
function private function_2947fddf(&var_768a0348, var_44b06a67, var_c035ab4f, callback, var_942056ea, var_26759105)
{
	player = self;
	if(var_44b06a67[0] != var_768a0348[0] || var_44b06a67[1] != var_768a0348[1])
	{
		var_14639e4f = player [[callback]](var_768a0348, var_44b06a67, var_942056ea);
		for(var_ea37ba57 = 0; var_ea37ba57 < 2; var_ea37ba57++)
		{
			var_768a0348[var_ea37ba57] = var_44b06a67[var_ea37ba57];
			if(isdefined(var_14639e4f))
			{
				var_768a0348[var_ea37ba57] = function_d43d9448(var_14639e4f[var_ea37ba57], var_c035ab4f[var_ea37ba57], var_26759105);
			}
		}
	}
}

/*
	Name: function_ec6ae51a
	Namespace: namespace_61e6d095
	Checksum: 0x662FB168
	Offset: 0x60A8
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ec6ae51a(var_ea37ba57)
{
	player = self;
	var_8d765541 = 0;
	if(var_ea37ba57 == 0)
	{
		if(function_aef1e8c3() || player function_347b5108())
		{
			var_8d765541 = -1;
		}
		else if(function_9975a94d() || player function_3666f7a1())
		{
			var_8d765541 = 1;
		}
	}
	else if(var_ea37ba57 == 1)
	{
		if(function_3d680c10() || player function_b2121354())
		{
			var_8d765541 = 1;
		}
		else if(function_c2d8a326() || player function_b1caa36a())
		{
			var_8d765541 = -1;
		}
	}
	return var_8d765541;
}

/*
	Name: function_78f03fef
	Namespace: namespace_61e6d095
	Checksum: 0x44BB57C7
	Offset: 0x61D8
	Size: 0x94
	Parameters: 2
	Flags: Linked, Private
*/
function private function_78f03fef(uid, input)
{
	block_input = level.var_61e6d095.var_ebb98e0b[input];
	if(!isinarray(block_input, uid))
	{
		block_input[block_input.size] = uid;
		globallogic_ui::function_9ed5232e("ScriptedWidgetData.blockGameInput." + level.var_61e6d095.inputs[input], 1);
	}
}

/*
	Name: function_1b4bdb02
	Namespace: namespace_61e6d095
	Checksum: 0x41A860F4
	Offset: 0x6278
	Size: 0x190
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1b4bdb02(uid, inputs)
{
	if(isdefined(inputs))
	{
		if(!isdefined(inputs))
		{
			inputs = [];
		}
		else if(!isarray(inputs))
		{
			inputs = array(inputs);
		}
	}
	else
	{
		inputs = getarraykeys(level.var_61e6d095.inputs);
	}
	var_ebb98e0b = level.var_61e6d095.var_ebb98e0b;
	foreach(input in inputs)
	{
		var_ef0e4b33 = var_ebb98e0b[input].size;
		arrayremovevalue(var_ebb98e0b[input], uid, 1);
		if(var_ef0e4b33 && var_ebb98e0b[input].size == 0)
		{
			globallogic_ui::function_9ed5232e("ScriptedWidgetData.blockGameInput." + level.var_61e6d095.inputs[input], 0);
		}
	}
}

