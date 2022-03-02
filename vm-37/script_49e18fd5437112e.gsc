#using script_152c3f4ffef9e588;
#using script_c8d806d2487b617;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace namespace_2b1568cc;

/*
	Name: function_89f2df9
	Namespace: namespace_2b1568cc
	Checksum: 0x65BF7097
	Offset: 0xC0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_380b7703a79220e8", &function_70a657d8, undefined, undefined, #"radiation");
}

/*
	Name: function_70a657d8
	Namespace: namespace_2b1568cc
	Checksum: 0xB1634F8B
	Offset: 0x110
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	function_d90ea0e7();
}

/*
	Name: function_d90ea0e7
	Namespace: namespace_2b1568cc
	Checksum: 0xB4A0AFE4
	Offset: 0x148
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_d90ea0e7()
{
	radiation::function_d90ea0e7(#"hash_668c27c4f08f8d26", &function_41d40455, &function_c11b3d17);
	radiation::function_d90ea0e7(#"hash_3d2df04e4fff88fc", &function_b3c2eb77, &function_b375f04e);
	radiation::function_d90ea0e7(#"hash_552b16be317b93d0", &function_3df85b7, &function_3213dd79);
	radiation::function_d90ea0e7(#"hash_4ae21267c92fe408", &function_e1e646f0, &function_a6beb2ea);
}

/*
	Name: function_41d40455
	Namespace: namespace_2b1568cc
	Checksum: 0xA8E13214
	Offset: 0x258
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_41d40455()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_ads", 0);
}

/*
	Name: function_c11b3d17
	Namespace: namespace_2b1568cc
	Checksum: 0x95214658
	Offset: 0x290
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c11b3d17()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_ads", 1);
}

/*
	Name: function_b3c2eb77
	Namespace: namespace_2b1568cc
	Checksum: 0x5B720ADA
	Offset: 0x2D0
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b3c2eb77()
{
	self val::set(#"hash_668c27c4f08f8d26", "health_regen", 0);
}

/*
	Name: function_b375f04e
	Namespace: namespace_2b1568cc
	Checksum: 0x8F6AF329
	Offset: 0x308
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b375f04e()
{
	self val::set(#"hash_668c27c4f08f8d26", "health_regen", 1);
}

/*
	Name: function_3df85b7
	Namespace: namespace_2b1568cc
	Checksum: 0xD7AFC1FF
	Offset: 0x348
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3df85b7()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_melee", 0);
}

/*
	Name: function_3213dd79
	Namespace: namespace_2b1568cc
	Checksum: 0x6105EAC4
	Offset: 0x380
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3213dd79()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_melee", 1);
}

/*
	Name: function_e1e646f0
	Namespace: namespace_2b1568cc
	Checksum: 0x6C1BF483
	Offset: 0x3C0
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e1e646f0()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_sprint", 0);
}

/*
	Name: function_a6beb2ea
	Namespace: namespace_2b1568cc
	Checksum: 0x2CE03094
	Offset: 0x3F8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a6beb2ea()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_sprint", 1);
}

