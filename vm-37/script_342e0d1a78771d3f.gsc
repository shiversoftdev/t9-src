#using scripts\core_common\lui_shared.gsc;

class class_24ac3512 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_24ac3512
		Checksum: 0x6BF102F0
		Offset: 0x278
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_24ac3512
		Checksum: 0x3EE994A2
		Offset: 0x4F0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_24ac3512
		Checksum: 0x17A73751
		Offset: 0x2C0
		Size: 0x3C
		Parameters: 2
		Flags: Linked
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_2ecbc83c
		Namespace: namespace_24ac3512
		Checksum: 0xD72391F5
		Offset: 0x390
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function function_2ecbc83c(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 2, value, 0);
	}

	/*
		Name: function_3b7b386a
		Namespace: namespace_24ac3512
		Checksum: 0xA11ACECD
		Offset: 0x338
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function function_3b7b386a(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 1, value, 0);
	}

	/*
		Name: function_505f092a
		Namespace: namespace_24ac3512
		Checksum: 0x5F05BF2
		Offset: 0x3E8
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function function_505f092a(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 3, value, 0);
	}

	/*
		Name: close
		Namespace: namespace_24ac3512
		Checksum: 0x1D97147
		Offset: 0x308
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_7c227f6d
		Namespace: namespace_24ac3512
		Checksum: 0xB1F5B8BD
		Offset: 0x498
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function function_7c227f6d(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 5, value, 0);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_24ac3512
		Checksum: 0x1F2AA3D6
		Offset: 0x298
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("remote_missile_target_lockon");
	}

	/*
		Name: function_b9d6aaa7
		Namespace: namespace_24ac3512
		Checksum: 0xEE777903
		Offset: 0x440
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function function_b9d6aaa7(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 4, value, 0);
	}

}

#namespace remote_missile_target_lockon;

/*
	Name: register
	Namespace: remote_missile_target_lockon
	Checksum: 0xE687D4D
	Offset: 0xB8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_24ac3512();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: remote_missile_target_lockon
	Checksum: 0x52224920
	Offset: 0xF8
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: remote_missile_target_lockon
	Checksum: 0x753C763F
	Offset: 0x138
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: remote_missile_target_lockon
	Checksum: 0xEFF97288
	Offset: 0x160
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_3b7b386a
	Namespace: remote_missile_target_lockon
	Checksum: 0x36F6BD51
	Offset: 0x188
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_3b7b386a(player, value)
{
	[[ self ]]->function_3b7b386a(player, value);
}

/*
	Name: function_2ecbc83c
	Namespace: remote_missile_target_lockon
	Checksum: 0x6450FD06
	Offset: 0x1B8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_2ecbc83c(player, value)
{
	[[ self ]]->function_2ecbc83c(player, value);
}

/*
	Name: function_505f092a
	Namespace: remote_missile_target_lockon
	Checksum: 0xAF34ADBB
	Offset: 0x1E8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_505f092a(player, value)
{
	[[ self ]]->function_505f092a(player, value);
}

/*
	Name: function_b9d6aaa7
	Namespace: remote_missile_target_lockon
	Checksum: 0x3DF6040D
	Offset: 0x218
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_b9d6aaa7(player, value)
{
	[[ self ]]->function_b9d6aaa7(player, value);
}

/*
	Name: function_7c227f6d
	Namespace: remote_missile_target_lockon
	Checksum: 0xBBA4B9A1
	Offset: 0x248
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_7c227f6d(player, value)
{
	[[ self ]]->function_7c227f6d(player, value);
}

