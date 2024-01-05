#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_61e6d095;

/*
	Name: __init__system__
	Namespace: namespace_61e6d095
	Checksum: 0xFF60C225
	Offset: 0xF0
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
	Checksum: 0x80CE3E62
	Offset: 0x138
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private preload()
{
	callback::add_callback(#"on_player_spawned", &on_player_spawn);
}

/*
	Name: on_player_spawn
	Namespace: namespace_61e6d095
	Checksum: 0xAB4A0ACA
	Offset: 0x178
	Size: 0x210
	Parameters: 1
	Flags: None
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
	Checksum: 0xF8DF2007
	Offset: 0x390
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
	Checksum: 0x1F4AFEF5
	Offset: 0x3C0
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
	Checksum: 0x55531C61
	Offset: 0x3F0
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
	Checksum: 0x291E1806
	Offset: 0x420
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
	Checksum: 0xB86905A4
	Offset: 0x450
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
	Checksum: 0x2688A6A4
	Offset: 0x480
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
	Checksum: 0xE8537047
	Offset: 0x4B0
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
	Checksum: 0x110FE642
	Offset: 0x4E0
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
	Checksum: 0x6D9E1F9F
	Offset: 0x510
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
	Checksum: 0xE5C19871
	Offset: 0x540
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
	Checksum: 0x4D25D5BB
	Offset: 0x570
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
	Checksum: 0x648C36EA
	Offset: 0x5A0
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
	Checksum: 0x927F121B
	Offset: 0x5E0
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
	Checksum: 0x239C947C
	Offset: 0x620
	Size: 0x14C
	Parameters: 1
	Flags: Private
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
	Checksum: 0x1938169F
	Offset: 0x778
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
	Checksum: 0x413B24EE
	Offset: 0x7B8
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
	Checksum: 0x144AA9C4
	Offset: 0x7F8
	Size: 0x4A
	Parameters: 1
	Flags: Private
*/
function private function_c63f7472(model)
{
	var_68abddbb = getuimodel(model, #"amount");
	return getuimodelvalue(var_68abddbb);
}

