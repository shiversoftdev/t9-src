#using scripts\weapons\weaponobjects.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace spycraft;

/*
	Name: __init__system__
	Namespace: spycraft
	Checksum: 0x1B6A559
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"spycraft", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: spycraft
	Checksum: 0x187E28DA
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	register_clientfields();
}

/*
	Name: register_clientfields
	Namespace: spycraft
	Checksum: 0x27766483
	Offset: 0x108
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private register_clientfields()
{
	clientfield::register("vehicle", "" + #"hash_2d5a2cd7892a4fdc", 1, 1, "counter", &function_a874e85b, 0, 0);
	clientfield::register("missile", "" + #"hash_2d5a2cd7892a4fdc", 1, 1, "counter", &function_a874e85b, 0, 0);
}

/*
	Name: function_a874e85b
	Namespace: spycraft
	Checksum: 0xA1D45670
	Offset: 0x1C8
	Size: 0x54
	Parameters: 7
	Flags: Linked
*/
function function_a874e85b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self weaponobjects::updateenemyequipment(bwastimejump);
}

