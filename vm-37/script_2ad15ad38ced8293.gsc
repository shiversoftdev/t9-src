#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_2d7ccca3;

/*
	Name: __init__system__
	Namespace: namespace_2d7ccca3
	Checksum: 0x2FCBBD7D
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3dcfc06bf6bfc5f5", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2d7ccca3
	Checksum: 0xF38D797B
	Offset: 0x110
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register_clientuimodel("hudItems.ammoCooldowns.fieldUpgrade", #"hud_items", [1:#"fieldupgrade", 0:#"hash_2f126bd99a74de8b"], 1, 5, "float", undefined, 0, 0);
	clientfield::register("missile", "fieldUpgradeActive", 1, 1, "int", &function_5fbd38e2, 0, 0);
}

/*
	Name: function_5fbd38e2
	Namespace: namespace_2d7ccca3
	Checksum: 0xB04B6CF8
	Offset: 0x1D8
	Size: 0x64
	Parameters: 7
	Flags: Linked, Private
*/
function private function_5fbd38e2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self function_1f0c7136(1);
	}
}

