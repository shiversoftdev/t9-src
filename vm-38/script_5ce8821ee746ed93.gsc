#using scripts\core_common\lui_shared.gsc;

class csuccess_screen : cluielem
{

	/*
		Name: constructor
		Namespace: csuccess_screen
		Checksum: 0x680BE4E1
		Offset: 0x198
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: csuccess_screen
		Checksum: 0xA8DAA590
		Offset: 0x258
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: csuccess_screen
		Checksum: 0x55526F87
		Offset: 0x1E0
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: csuccess_screen
		Checksum: 0xB2D9649
		Offset: 0x228
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: csuccess_screen
		Checksum: 0xB439A2BF
		Offset: 0x1B8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("success_screen");
	}

}

#namespace success_screen;

/*
	Name: function_38b31273
	Namespace: success_screen
	Checksum: 0xDB8D9427
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_38b31273()
{
	level notify(-1472740074);
}

/*
	Name: register
	Namespace: success_screen
	Checksum: 0xC3779865
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new csuccess_screen();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: success_screen
	Checksum: 0x40D59CB0
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
	Namespace: success_screen
	Checksum: 0x6221B1B7
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
	Namespace: success_screen
	Checksum: 0xD7920DB2
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

