#using scripts\core_common\lui_shared.gsc;

class class_8019ebdc : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_8019ebdc
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
		Namespace: namespace_8019ebdc
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
		Namespace: namespace_8019ebdc
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_8019ebdc
		Checksum: 0x335296BF
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
		Namespace: namespace_8019ebdc
		Checksum: 0xC3C53A14
		Offset: 0x1C0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("mobile_armory_loadout");
	}

}

#namespace mobile_armory_loadout;

/*
	Name: function_ff2bd667
	Namespace: mobile_armory_loadout
	Checksum: 0x46594A84
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ff2bd667()
{
	level notify(634748573);
}

/*
	Name: register
	Namespace: mobile_armory_loadout
	Checksum: 0x7EAEFF3C
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_8019ebdc();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mobile_armory_loadout
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
	Namespace: mobile_armory_loadout
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
	Namespace: mobile_armory_loadout
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

