#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_51e5626e : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_51e5626e
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
		Namespace: namespace_51e5626e
		Checksum: 0x58A24760
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
		Namespace: namespace_51e5626e
		Checksum: 0x128C7998
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
		Name: close
		Namespace: namespace_51e5626e
		Checksum: 0x2666162D
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
		Name: function_7a690474
		Namespace: namespace_51e5626e
		Checksum: 0x1DE1202E
		Offset: 0x2D0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_7a690474(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "messagebox", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_51e5626e
		Checksum: 0xE9984F38
		Offset: 0x208
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("sr_message_box");
		namespace_6aaccc24::function_dcb34c80("string", "messagebox", 1);
	}

}

#namespace sr_message_box;

/*
	Name: function_206836a6
	Namespace: sr_message_box
	Checksum: 0x1946BDAC
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_206836a6()
{
	level notify(263633702);
}

/*
	Name: register
	Namespace: sr_message_box
	Checksum: 0x2BEBA907
	Offset: 0xE8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_51e5626e();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: sr_message_box
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
	Namespace: sr_message_box
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
	Namespace: sr_message_box
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
	Name: function_7a690474
	Namespace: sr_message_box
	Checksum: 0x3C38D43A
	Offset: 0x1B8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_7a690474(player, value)
{
	[[ self ]]->function_7a690474(player, value);
}

