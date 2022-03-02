#using script_3c362258ff800237;
#using scripts\core_common\system_shared.csc;

#namespace namespace_a476311c;

/*
	Name: function_835cde8b
	Namespace: namespace_a476311c
	Checksum: 0x3C64153A
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_835cde8b()
{
	level notify(2076777881);
}

/*
	Name: function_89f2df9
	Namespace: namespace_a476311c
	Checksum: 0x5EEC2CB7
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7ceb08aa364e4596", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_a476311c
	Checksum: 0xA258D993
	Offset: 0xD8
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_250115340b2e27a5", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_a476311c
	Checksum: 0x2C0829F1
	Offset: 0x140
	Size: 0x2C
	Parameters: 2
	Flags: Private
*/
function private function_d1de6a85(local_client_num, params)
{
	level.var_7db2b064 = &function_ecc5a0b9;
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_a476311c
	Checksum: 0xE1D22BD1
	Offset: 0x178
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(local_client_num)
{
	level.var_7db2b064 = undefined;
}

/*
	Name: is_active
	Namespace: namespace_a476311c
	Checksum: 0x2C70C1B
	Offset: 0x198
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_250115340b2e27a5");
	return isdefined(challenge);
}

/*
	Name: function_ecc5a0b9
	Namespace: namespace_a476311c
	Checksum: 0x7640DF8F
	Offset: 0x1D8
	Size: 0x44
	Parameters: 3
	Flags: Private
*/
function private function_ecc5a0b9(local_client_num, player, damage)
{
	if(int(damage) <= 1)
	{
		return true;
	}
	return false;
}

