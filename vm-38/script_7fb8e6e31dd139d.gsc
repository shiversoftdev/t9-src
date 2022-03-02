#using scripts\core_common\lui_shared.gsc;

class class_73eecff9 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_73eecff9
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
		Namespace: namespace_73eecff9
		Checksum: 0x2F08521D
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
		Namespace: namespace_73eecff9
		Checksum: 0x8396E5C8
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_73eecff9
		Checksum: 0x2CF7C006
		Offset: 0x230
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
		Namespace: namespace_73eecff9
		Checksum: 0x331EF22D
		Offset: 0x1C0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("mp_prop_controls");
	}

}

#namespace mp_prop_controls;

/*
	Name: function_cd384ab9
	Namespace: mp_prop_controls
	Checksum: 0xA749D14D
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cd384ab9()
{
	level notify(2067581863);
}

/*
	Name: register
	Namespace: mp_prop_controls
	Checksum: 0xD6EB1C39
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_73eecff9();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_prop_controls
	Checksum: 0x22B7D0A0
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
	Namespace: mp_prop_controls
	Checksum: 0xBEEC1AC2
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
	Namespace: mp_prop_controls
	Checksum: 0xD0CA6291
	Offset: 0x178
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

