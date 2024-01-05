#using scripts\core_common\system_shared.csc;

#namespace hud_message;

/*
	Name: __init__system__
	Namespace: hud_message
	Checksum: 0x65AE2AD7
	Offset: 0x68
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hud_message", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: hud_message
	Checksum: 0x80F724D1
	Offset: 0xB0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_65299180
	Namespace: hud_message
	Checksum: 0xE20A499A
	Offset: 0xC0
	Size: 0x114
	Parameters: 3
	Flags: Linked
*/
function function_65299180(localclientnum, var_e69b15f0, var_ba0dbe09)
{
	var_683a6ce = function_1df4c3b0(localclientnum, #"script_notify");
	for(i = 0; i < var_ba0dbe09.size; i++)
	{
		setuimodelvalue(getuimodel(var_683a6ce, #"arg" + (i + 1)), var_ba0dbe09[i]);
	}
	setuimodelvalue(getuimodel(var_683a6ce, #"numargs"), var_ba0dbe09.size);
	if(!setuimodelvalue(var_683a6ce, var_e69b15f0))
	{
		forcenotifyuimodel(var_683a6ce);
	}
}

/*
	Name: setlowermessage
	Namespace: hud_message
	Checksum: 0x6713D9EA
	Offset: 0x1E0
	Size: 0xAC
	Parameters: 3
	Flags: Linked
*/
function setlowermessage(localclientnum, text, time)
{
	if(isdefined(time) && time > 0)
	{
		function_65299180(localclientnum, #"hash_424b9c54c8bf7a82", [1:int(time), 0:text]);
	}
	else
	{
		function_65299180(localclientnum, #"hash_424b9c54c8bf7a82", [0:text]);
	}
}

/*
	Name: clearlowermessage
	Namespace: hud_message
	Checksum: 0xB31FD9D8
	Offset: 0x298
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function clearlowermessage(localclientnum)
{
	function_65299180(localclientnum, #"hash_6b9a1c6794314120", []);
}

