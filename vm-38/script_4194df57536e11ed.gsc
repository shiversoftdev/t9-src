#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_f4d68515 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_f4d68515
		Checksum: 0x7DB406EC
		Offset: 0x1E8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_f4d68515
		Checksum: 0xE4393D0
		Offset: 0x320
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_f4d68515
		Checksum: 0xFC149B61
		Offset: 0x258
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
		Name: function_2eb3f6e8
		Namespace: namespace_f4d68515
		Checksum: 0x898BC677
		Offset: 0x2D0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_2eb3f6e8(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "developer_mode", value);
	}

	/*
		Name: close
		Namespace: namespace_f4d68515
		Checksum: 0x613304B5
		Offset: 0x2A0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_f4d68515
		Checksum: 0x222E88B3
		Offset: 0x208
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("initial_black");
		namespace_6aaccc24::function_da693cbe("developer_mode", 1, 1, "int");
	}

}

#namespace initial_black;

/*
	Name: function_27fcd669
	Namespace: initial_black
	Checksum: 0x94BF819F
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_27fcd669()
{
	level notify(993259374);
}

/*
	Name: register
	Namespace: initial_black
	Checksum: 0xC02A33F3
	Offset: 0xE8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_f4d68515();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: initial_black
	Checksum: 0x40D59CB0
	Offset: 0x128
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
	Namespace: initial_black
	Checksum: 0x6221B1B7
	Offset: 0x168
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
	Namespace: initial_black
	Checksum: 0xD7920DB2
	Offset: 0x190
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_2eb3f6e8
	Namespace: initial_black
	Checksum: 0xC9C00836
	Offset: 0x1B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2eb3f6e8(player, value)
{
	[[ self ]]->function_2eb3f6e8(player, value);
}

