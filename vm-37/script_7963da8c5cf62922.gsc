#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_51e5626e : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_51e5626e
		Checksum: 0xB09D89E
		Offset: 0x1C8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_51e5626e
		Checksum: 0xCF7B22A9
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_51e5626e
		Checksum: 0xF400424F
		Offset: 0x238
		Size: 0x3C
		Parameters: 2
		Flags: None
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
		Checksum: 0xC0D8907
		Offset: 0x280
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_7a690474
		Namespace: namespace_51e5626e
		Checksum: 0x537E5619
		Offset: 0x2B0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_7a690474(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "messagebox", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_51e5626e
		Checksum: 0xD6A20612
		Offset: 0x1E8
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("sr_message_box");
		namespace_6aaccc24::function_dcb34c80("string", "messagebox", 1);
	}

}

#namespace sr_message_box;

/*
	Name: register
	Namespace: sr_message_box
	Checksum: 0xDC42E06E
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: None
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
	Checksum: 0x34E39DA0
	Offset: 0x108
	Size: 0x38
	Parameters: 2
	Flags: None
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
	Checksum: 0x74CB4E3A
	Offset: 0x148
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: sr_message_box
	Checksum: 0xA9AD379B
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_7a690474
	Namespace: sr_message_box
	Checksum: 0x628FD362
	Offset: 0x198
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7a690474(player, value)
{
	[[ self ]]->function_7a690474(player, value);
}

