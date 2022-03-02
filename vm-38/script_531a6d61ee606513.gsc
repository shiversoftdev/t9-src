#using scripts\core_common\lui_shared.gsc;

class class_eaf2482a : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_eaf2482a
		Checksum: 0x26EA4E8B
		Offset: 0x1A8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_eaf2482a
		Checksum: 0x122ED914
		Offset: 0x268
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_eaf2482a
		Checksum: 0x514B7CAE
		Offset: 0x1F0
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
		Namespace: namespace_eaf2482a
		Checksum: 0x2744138D
		Offset: 0x238
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_eaf2482a
		Checksum: 0xDEFAEFE5
		Offset: 0x1C8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_gold_align_satellite_hud");
	}

}

#namespace namespace_2d060063;

/*
	Name: function_65612597
	Namespace: namespace_2d060063
	Checksum: 0xBE231EFD
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_65612597()
{
	level notify(1274129205);
}

/*
	Name: register
	Namespace: namespace_2d060063
	Checksum: 0xD8A8740B
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_eaf2482a();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: namespace_2d060063
	Checksum: 0xF79EBB64
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
	Namespace: namespace_2d060063
	Checksum: 0x8223FA61
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
	Namespace: namespace_2d060063
	Checksum: 0xC4970C2C
	Offset: 0x180
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

