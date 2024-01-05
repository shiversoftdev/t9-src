#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cspectrerisingindicator : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cspectrerisingindicator
		Checksum: 0x186FC38E
		Offset: 0x208
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
		Checksum: 0x747DD658
		Offset: 0x3B8
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
		Checksum: 0xC321DF05
		Offset: 0x2A0
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
		Checksum: 0xB7BB20FE
		Offset: 0x318
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
		Checksum: 0x4B1D06A1
		Offset: 0x2E8
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
		Checksum: 0x62C8EB66
		Offset: 0x368
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
		Checksum: 0x412AE44B
		Offset: 0x228
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
	Name: register
	Namespace: spectrerisingindicator
	Checksum: 0x1111479
	Offset: 0xD8
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
	Checksum: 0x555E5116
	Offset: 0x118
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
	Checksum: 0x2780A85B
	Offset: 0x158
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
	Checksum: 0x5FE370E6
	Offset: 0x180
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
	Checksum: 0x47F7C1A
	Offset: 0x1A8
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
	Checksum: 0x18FE872C
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_isalive(player, value)
{
	[[ self ]]->set_isalive(player, value);
}

