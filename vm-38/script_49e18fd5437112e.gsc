#using script_152c3f4ffef9e588;
#using script_c8d806d2487b617;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace namespace_2b1568cc;

/*
	Name: function_7d91a5
	Namespace: namespace_2b1568cc
	Checksum: 0xC8395442
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7d91a5()
{
	level notify(1826149149);
}

/*
	Name: function_89f2df9
	Namespace: namespace_2b1568cc
	Checksum: 0xA1FDAB78
	Offset: 0xE0
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
	Checksum: 0xB6EFD6E9
	Offset: 0x130
	Size: 0x2C
	Parameters: 0
	Flags: Private
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
	Checksum: 0x80F724D1
	Offset: 0x168
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_d90ea0e7()
{
}

/*
	Name: function_41d40455
	Namespace: namespace_2b1568cc
	Checksum: 0x7DC831A7
	Offset: 0x178
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_41d40455()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_ads", 0);
}

/*
	Name: function_c11b3d17
	Namespace: namespace_2b1568cc
	Checksum: 0xF1BAABC5
	Offset: 0x1B0
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_c11b3d17()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_ads", 1);
}

/*
	Name: function_b3c2eb77
	Namespace: namespace_2b1568cc
	Checksum: 0xB1FBA5DB
	Offset: 0x1F0
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_b3c2eb77()
{
	self val::set(#"hash_668c27c4f08f8d26", "health_regen", 0);
}

/*
	Name: function_b375f04e
	Namespace: namespace_2b1568cc
	Checksum: 0x570F750C
	Offset: 0x228
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_b375f04e()
{
	self val::set(#"hash_668c27c4f08f8d26", "health_regen", 1);
}

/*
	Name: function_3df85b7
	Namespace: namespace_2b1568cc
	Checksum: 0x55400A8C
	Offset: 0x268
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_3df85b7()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_melee", 0);
}

/*
	Name: function_3213dd79
	Namespace: namespace_2b1568cc
	Checksum: 0x6582A310
	Offset: 0x2A0
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_3213dd79()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_melee", 1);
}

/*
	Name: function_e1e646f0
	Namespace: namespace_2b1568cc
	Checksum: 0x8562DB82
	Offset: 0x2E0
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_e1e646f0()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_sprint", 0);
}

/*
	Name: function_a6beb2ea
	Namespace: namespace_2b1568cc
	Checksum: 0x147C4127
	Offset: 0x318
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_a6beb2ea()
{
	self val::set(#"hash_668c27c4f08f8d26", "allow_sprint", 1);
}

