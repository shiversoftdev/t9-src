#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_61e6d095;

/*
	Name: function_5bc1034d
	Namespace: namespace_61e6d095
	Checksum: 0xE7CA00CB
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5bc1034d()
{
	level notify(-2017420250);
}

/*
	Name: __init__system__
	Namespace: namespace_61e6d095
	Checksum: 0x71DB657E
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7f2a4dd4a17f2f59", &preload, undefined, undefined, undefined);
}

/*
	Name: preload
	Namespace: namespace_61e6d095
	Checksum: 0x6B3CE8CB
	Offset: 0x158
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private preload()
{
	callback::add_callback(#"on_player_spawned", &on_player_spawn);
}

/*
	Name: on_player_spawn
	Namespace: namespace_61e6d095
	Checksum: 0xD98161D0
	Offset: 0x198
	Size: 0x210
	Parameters: 1
	Flags: Linked
*/
function on_player_spawn(localclientnum)
{
	self endon(#"death");
	inputs = [];
	inputs[#"ui_confirm"] = "confirm";
	inputs[#"hash_3c27402259e4c18e"] = "cancel";
	inputs[#"hash_278b9a3955f6e5a"] = "alt1";
	inputs[#"hash_278b8a3955f6ca7"] = "alt2";
	inputs[#"ui_navup"] = "navup";
	inputs[#"ui_navdown"] = "navdown";
	inputs[#"ui_navleft"] = "navleft";
	inputs[#"ui_navright"] = "navright";
	inputs[#"ui_prevtab"] = "prevtab";
	inputs[#"ui_nexttab"] = "nexttab";
	inputs[#"hash_5686e6f2a8315663"] = "backspace";
	foreach(value in inputs)
	{
		self flag::clear(key);
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_74c593238b792d40");
		self childthread flag::set_for_time(0.05, waitresult.param1);
	}
}

/*
	Name: function_affb1af1
	Namespace: namespace_61e6d095
	Checksum: 0x95AECBF3
	Offset: 0x3B0
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_affb1af1()
{
	return self flag::get(#"ui_confirm");
}

/*
	Name: function_57fbd346
	Namespace: namespace_61e6d095
	Checksum: 0x5B902006
	Offset: 0x3E0
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_57fbd346()
{
	return self flag::get(#"hash_3c27402259e4c18e");
}

/*
	Name: function_e4d62f9a
	Namespace: namespace_61e6d095
	Checksum: 0x9CF3BD48
	Offset: 0x410
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_e4d62f9a()
{
	return self flag::get(#"hash_278b9a3955f6e5a");
}

/*
	Name: function_728aec47
	Namespace: namespace_61e6d095
	Checksum: 0x10DDBC8D
	Offset: 0x440
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_728aec47()
{
	return self flag::get(#"hash_278b8a3955f6ca7");
}

/*
	Name: function_aef1e8c3
	Namespace: namespace_61e6d095
	Checksum: 0x3676FE52
	Offset: 0x470
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_aef1e8c3()
{
	return self flag::get(#"ui_navup");
}

/*
	Name: function_9975a94d
	Namespace: namespace_61e6d095
	Checksum: 0x7900061B
	Offset: 0x4A0
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_9975a94d()
{
	return self flag::get(#"ui_navdown");
}

/*
	Name: function_c2d8a326
	Namespace: namespace_61e6d095
	Checksum: 0xA62506FA
	Offset: 0x4D0
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_c2d8a326()
{
	return self flag::get(#"ui_navleft");
}

/*
	Name: function_3d680c10
	Namespace: namespace_61e6d095
	Checksum: 0x11214767
	Offset: 0x500
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_3d680c10()
{
	return self flag::get(#"ui_navright");
}

/*
	Name: function_d0beaa6e
	Namespace: namespace_61e6d095
	Checksum: 0x292EC35B
	Offset: 0x530
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
	Checksum: 0x950B774A
	Offset: 0x560
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
	Checksum: 0xC3B4B8DE
	Offset: 0x590
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
	Checksum: 0xCC2FF21C
	Offset: 0x5C0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function function_9c365c3b()
{
	return function_cf2348e7(function_90d058e8(#"hash_15588744d5c5bb0f"));
}

/*
	Name: function_6cbc939b
	Namespace: namespace_61e6d095
	Checksum: 0x7FF9DB0C
	Offset: 0x600
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
	Checksum: 0xCDCDF6A0
	Offset: 0x640
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
	Checksum: 0xEDED9713
	Offset: 0x798
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
	Checksum: 0x68C3FCD
	Offset: 0x7D8
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
	Checksum: 0xCE4C8440
	Offset: 0x818
	Size: 0x4A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c63f7472(model)
{
	var_68abddbb = getuimodel(model, #"amount");
	return getuimodelvalue(var_68abddbb);
}

