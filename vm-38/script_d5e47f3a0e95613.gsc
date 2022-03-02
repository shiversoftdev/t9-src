#using script_340a2e805e35f7a2;
#using script_471b31bd963b388e;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_1d9375fc;

/*
	Name: function_811574eb
	Namespace: namespace_1d9375fc
	Checksum: 0x5760F147
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_811574eb()
{
	level notify(1384151078);
}

#namespace namespace_f0884ae5;

/*
	Name: setup
	Namespace: namespace_f0884ae5
	Checksum: 0x405FBA71
	Offset: 0xA0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function setup(var_582cb7bb)
{
	if(!namespace_ad5a0cd6::use_item_spawns())
	{
		return;
	}
	function_1f4464c0(var_582cb7bb);
	/#
		println("" + var_582cb7bb);
	#/
	namespace_65181344::setup_groups();
}

