#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_df0379b2;

/*
	Name: function_7257608d
	Namespace: namespace_df0379b2
	Checksum: 0x993BD066
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7257608d()
{
	level notify(887884285);
}

#namespace zm_custom;

/*
	Name: function_d776b402
	Namespace: zm_custom
	Checksum: 0x69B38C3D
	Offset: 0x100
	Size: 0x4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_d776b402()
{
}

/*
	Name: function_ecc5a0b9
	Namespace: zm_custom
	Checksum: 0xA81CFAEC
	Offset: 0x248
	Size: 0x44
	Parameters: 3
	Flags: Linked, Private
*/
function private function_ecc5a0b9(local_client_num, player, damage)
{
	if(int(damage) == 5)
	{
		return true;
	}
	return false;
}

/*
	Name: function_901b751c
	Namespace: zm_custom
	Checksum: 0xE889370C
	Offset: 0x298
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_901b751c(var_c9db62d5)
{
	if(var_c9db62d5 === "")
	{
		return undefined;
	}
	setting = getgametypesetting(var_c9db62d5);
	/#
		assert(isdefined(setting), ("" + var_c9db62d5) + "");
	#/
	return setting;
}

