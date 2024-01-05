#using scripts\core_common\lui_shared.gsc;

class class_d0a96b4 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_d0a96b4
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
		Namespace: namespace_d0a96b4
		Checksum: 0x95BBD3FC
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
		Namespace: namespace_d0a96b4
		Checksum: 0x8EFC0DC
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
		Namespace: namespace_d0a96b4
		Checksum: 0x335296BF
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
		Namespace: namespace_d0a96b4
		Checksum: 0xC3C53A14
		Offset: 0x1C0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("TerminalKeyboardFrame");
	}

}

#namespace namespace_20a120d7;

/*
	Name: function_554c14b0
	Namespace: namespace_20a120d7
	Checksum: 0x50B88165
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_554c14b0()
{
	level notify(466023702);
}

/*
	Name: register
	Namespace: namespace_20a120d7
	Checksum: 0x1245B31F
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_d0a96b4();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: namespace_20a120d7
	Checksum: 0x83B95F3F
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
	Namespace: namespace_20a120d7
	Checksum: 0xDE74B2A0
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
	Namespace: namespace_20a120d7
	Checksum: 0x686D9D85
	Offset: 0x178
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

