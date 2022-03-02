#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_59ff1d6c;

/*
	Name: function_d776b402
	Namespace: namespace_59ff1d6c
	Checksum: 0x292D24B2
	Offset: 0xE0
	Size: 0x4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_d776b402()
{
}

/*
	Name: function_ecc5a0b9
	Namespace: namespace_59ff1d6c
	Checksum: 0xFCF01FF9
	Offset: 0x228
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
	Namespace: namespace_59ff1d6c
	Checksum: 0xB28B494B
	Offset: 0x278
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

