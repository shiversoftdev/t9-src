#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cspectrerisingindicator : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cspectrerisingindicator
		Checksum: 0x2C28BEC9
		Offset: 0x228
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cspectrerisingindicator
		Checksum: 0x56918045
		Offset: 0x3D8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cspectrerisingindicator
		Checksum: 0xD118D251
		Offset: 0x2C0
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
		Name: set_clientnum
		Namespace: cspectrerisingindicator
		Checksum: 0x4DB10819
		Offset: 0x338
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_clientnum(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "clientnum", value);
	}

	/*
		Name: close
		Namespace: cspectrerisingindicator
		Checksum: 0x87639077
		Offset: 0x308
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_isalive
		Namespace: cspectrerisingindicator
		Checksum: 0x5FAB6C0A
		Offset: 0x388
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_isalive(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "isAlive", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cspectrerisingindicator
		Checksum: 0x483C392F
		Offset: 0x248
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("SpectreRisingIndicator");
		cluielem::add_clientfield("clientnum", 1, 7, "int");
		cluielem::add_clientfield("isAlive", 1, 1, "int");
	}

}

#namespace spectrerisingindicator;

/*
	Name: function_b2a67533
	Namespace: spectrerisingindicator
	Checksum: 0x4013234B
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b2a67533()
{
	level notify(-212074111);
}

/*
	Name: register
	Namespace: spectrerisingindicator
	Checksum: 0x3C5AA280
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cspectrerisingindicator();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: spectrerisingindicator
	Checksum: 0x83B95F3F
	Offset: 0x138
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
	Namespace: spectrerisingindicator
	Checksum: 0xDE74B2A0
	Offset: 0x178
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
	Namespace: spectrerisingindicator
	Checksum: 0x686D9D85
	Offset: 0x1A0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_clientnum
	Namespace: spectrerisingindicator
	Checksum: 0x359B0EE8
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clientnum(player, value)
{
	[[ self ]]->set_clientnum(player, value);
}

/*
	Name: set_isalive
	Namespace: spectrerisingindicator
	Checksum: 0x2BF44E53
	Offset: 0x1F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_isalive(player, value)
{
	[[ self ]]->set_isalive(player, value);
}

