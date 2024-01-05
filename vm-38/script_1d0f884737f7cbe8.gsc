#using scripts\core_common\lui_shared.gsc;

class clui_napalm_strike : cluielem
{

	/*
		Name: constructor
		Namespace: clui_napalm_strike
		Checksum: 0x88FC4B08
		Offset: 0x1A0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: clui_napalm_strike
		Checksum: 0x61AE0512
		Offset: 0x260
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: clui_napalm_strike
		Checksum: 0x3AED3C6B
		Offset: 0x1E8
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
		Namespace: clui_napalm_strike
		Checksum: 0x56CA8646
		Offset: 0x230
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
		Namespace: clui_napalm_strike
		Checksum: 0xA0495291
		Offset: 0x1C0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("lui_napalm_strike");
	}

}

#namespace lui_napalm_strike;

/*
	Name: function_5be85e35
	Namespace: lui_napalm_strike
	Checksum: 0xCC7CFD8A
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5be85e35()
{
	level notify(-521615871);
}

/*
	Name: register
	Namespace: lui_napalm_strike
	Checksum: 0x5C9B3CE2
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new clui_napalm_strike();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: lui_napalm_strike
	Checksum: 0xA4DF70D2
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
	Namespace: lui_napalm_strike
	Checksum: 0x2FDF789
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
	Namespace: lui_napalm_strike
	Checksum: 0xE6010A6A
	Offset: 0x178
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

