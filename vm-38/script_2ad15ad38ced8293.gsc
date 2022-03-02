#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_2d7ccca3;

/*
	Name: function_74a00533
	Namespace: namespace_2d7ccca3
	Checksum: 0xCF46D34
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_74a00533()
{
	level notify(1519286725);
}

/*
	Name: function_89f2df9
	Namespace: namespace_2d7ccca3
	Checksum: 0x80E41A09
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3dcfc06bf6bfc5f5", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2d7ccca3
	Checksum: 0xD9FB9DD8
	Offset: 0x130
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::function_a8bbc967("hudItems.ammoCooldowns.fieldUpgrade", #"hud_items", [1:#"fieldupgrade", 0:#"hash_2f126bd99a74de8b"], 1, 5, "float", undefined, 0, 0);
	clientfield::register("missile", "fieldUpgradeActive", 1, 1, "int", &function_5fbd38e2, 0, 0);
}

/*
	Name: function_5fbd38e2
	Namespace: namespace_2d7ccca3
	Checksum: 0x25153585
	Offset: 0x1F8
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

