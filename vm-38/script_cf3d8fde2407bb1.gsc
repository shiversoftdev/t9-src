#using scripts\core_common\lui_shared.gsc;

class class_9c58d24e : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_9c58d24e
		Checksum: 0x680BE4E1
		Offset: 0x198
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_9c58d24e
		Checksum: 0xA8DAA590
		Offset: 0x258
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_9c58d24e
		Checksum: 0x55526F87
		Offset: 0x1E0
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_9c58d24e
		Checksum: 0xB2D9649
		Offset: 0x228
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_9c58d24e
		Checksum: 0xB439A2BF
		Offset: 0x1B8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("sr_beacon_menu");
	}

}

#namespace sr_beacon_menu;

/*
	Name: function_cb491f74
	Namespace: sr_beacon_menu
	Checksum: 0xAC24CEE7
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cb491f74()
{
	level notify(-798772028);
}

/*
	Name: register
	Namespace: sr_beacon_menu
	Checksum: 0x4F13716
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_9c58d24e();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: sr_beacon_menu
	Checksum: 0x40D59CB0
	Offset: 0x108
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
	Namespace: sr_beacon_menu
	Checksum: 0x6221B1B7
	Offset: 0x148
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
	Namespace: sr_beacon_menu
	Checksum: 0xD7920DB2
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

