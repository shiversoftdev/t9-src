#using scripts\core_common\lui_shared.gsc;

class cfail_screen : cluielem
{

	/*
		Name: constructor
		Namespace: cfail_screen
		Checksum: 0x26EA4E8B
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
		Namespace: cfail_screen
		Checksum: 0x122ED914
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
		Namespace: cfail_screen
		Checksum: 0x514B7CAE
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
		Namespace: cfail_screen
		Checksum: 0x2744138D
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
		Namespace: cfail_screen
		Checksum: 0xDEFAEFE5
		Offset: 0x1B8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("fail_screen");
	}

}

#namespace fail_screen;

/*
	Name: function_df1518b7
	Namespace: fail_screen
	Checksum: 0xA09044BE
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_df1518b7()
{
	level notify(1928634164);
}

/*
	Name: register
	Namespace: fail_screen
	Checksum: 0x554D4038
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cfail_screen();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: fail_screen
	Checksum: 0xF79EBB64
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
	Namespace: fail_screen
	Checksum: 0x8223FA61
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
	Namespace: fail_screen
	Checksum: 0xC4970C2C
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

