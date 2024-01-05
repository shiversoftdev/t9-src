#using script_680dddbda86931fa;
#using script_101d8280497ff416;
#using scripts\core_common\struct.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_f0884ae5;

/*
	Name: setup
	Namespace: namespace_f0884ae5
	Checksum: 0xF484A891
	Offset: 0x80
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function setup(localclientnum, var_582cb7bb)
{
	if(!item_world_util::use_item_spawns())
	{
		return;
	}
	level.var_8c615e33 = [];
	function_1f4464c0(var_582cb7bb);
	/#
		println("" + var_582cb7bb);
	#/
	namespace_65181344::setup_groups();
}

