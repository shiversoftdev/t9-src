#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_5c5263e2 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_5c5263e2
		Checksum: 0xF481D593
		Offset: 0x2A0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_5c5263e2
		Checksum: 0x43E0F611
		Offset: 0x540
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_5c5263e2
		Checksum: 0xA02F4CCE
		Offset: 0x388
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
		Name: function_46609401
		Namespace: namespace_5c5263e2
		Checksum: 0xBAA7E8FD
		Offset: 0x400
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_46609401(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "player_target_active", value);
	}

	/*
		Name: close
		Namespace: namespace_5c5263e2
		Checksum: 0xFE268E48
		Offset: 0x3D0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_808f0a7c
		Namespace: namespace_5c5263e2
		Checksum: 0xFF632FF5
		Offset: 0x4A0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_808f0a7c(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "extra_target_2", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_5c5263e2
		Checksum: 0x77A243
		Offset: 0x2C0
		Size: 0xBC
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("remote_missile_targets");
		namespace_6aaccc24::function_da693cbe("player_target_active", 1, 16, "int");
		namespace_6aaccc24::function_da693cbe("extra_target_1", 1, 10, "int");
		namespace_6aaccc24::function_da693cbe("extra_target_2", 1, 10, "int");
		namespace_6aaccc24::function_da693cbe("extra_target_3", 1, 10, "int");
	}

	/*
		Name: function_d798388d
		Namespace: namespace_5c5263e2
		Checksum: 0xDE94A27C
		Offset: 0x450
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_d798388d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "extra_target_1", value);
	}

	/*
		Name: function_ec1de198
		Namespace: namespace_5c5263e2
		Checksum: 0x7F61E00
		Offset: 0x4F0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_ec1de198(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "extra_target_3", value);
	}

}

#namespace remote_missile_targets;

/*
	Name: register
	Namespace: remote_missile_targets
	Checksum: 0xFBA6E37E
	Offset: 0x110
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_5c5263e2();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: remote_missile_targets
	Checksum: 0xA54E9789
	Offset: 0x150
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
	Namespace: remote_missile_targets
	Checksum: 0x86736221
	Offset: 0x190
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
	Namespace: remote_missile_targets
	Checksum: 0x7D032A4E
	Offset: 0x1B8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_46609401
	Namespace: remote_missile_targets
	Checksum: 0x44D588F7
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_46609401(player, value)
{
	[[ self ]]->function_46609401(player, value);
}

/*
	Name: function_d798388d
	Namespace: remote_missile_targets
	Checksum: 0x4C48355F
	Offset: 0x210
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_d798388d(player, value)
{
	[[ self ]]->function_d798388d(player, value);
}

/*
	Name: function_808f0a7c
	Namespace: remote_missile_targets
	Checksum: 0xCAE9CFCD
	Offset: 0x240
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_808f0a7c(player, value)
{
	[[ self ]]->function_808f0a7c(player, value);
}

/*
	Name: function_ec1de198
	Namespace: remote_missile_targets
	Checksum: 0x69272AD2
	Offset: 0x270
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ec1de198(player, value)
{
	[[ self ]]->function_ec1de198(player, value);
}

