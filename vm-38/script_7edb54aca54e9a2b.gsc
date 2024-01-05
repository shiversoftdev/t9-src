#using scripts\core_common\lui_shared.gsc;

class cdebug_center_screen : cluielem
{

	/*
		Name: constructor
		Namespace: cdebug_center_screen
		Checksum: 0x26EA4E8B
		Offset: 0x1A0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cdebug_center_screen
		Checksum: 0x122ED914
		Offset: 0x260
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cdebug_center_screen
		Checksum: 0x514B7CAE
		Offset: 0x1E8
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
		Namespace: cdebug_center_screen
		Checksum: 0x2744138D
		Offset: 0x230
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
		Namespace: cdebug_center_screen
		Checksum: 0xDEFAEFE5
		Offset: 0x1C0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("debug_center_screen");
	}

}

#namespace debug_center_screen;

/*
	Name: function_34b08c3a
	Namespace: debug_center_screen
	Checksum: 0x9E4F1CAC
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_34b08c3a()
{
	level notify(653469148);
}

/*
	Name: register
	Namespace: debug_center_screen
	Checksum: 0xE0B719DF
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cdebug_center_screen();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: debug_center_screen
	Checksum: 0xF79EBB64
	Offset: 0x110
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
	Namespace: debug_center_screen
	Checksum: 0x8223FA61
	Offset: 0x150
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
	Namespace: debug_center_screen
	Checksum: 0xC4970C2C
	Offset: 0x178
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

