#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cstim_count : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cstim_count
		Checksum: 0x94C99E74
		Offset: 0x1D8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cstim_count
		Checksum: 0x7824DAA3
		Offset: 0x310
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cstim_count
		Checksum: 0xF05F24AF
		Offset: 0x248
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
		Namespace: cstim_count
		Checksum: 0x91E89886
		Offset: 0x290
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_stim_count
		Namespace: cstim_count
		Checksum: 0x45FB2823
		Offset: 0x2C0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_stim_count(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "stim_count", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cstim_count
		Checksum: 0x584BD58
		Offset: 0x1F8
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("stim_count");
		cluielem::add_clientfield("stim_count", 1, 4, "int", 0);
	}

}

#namespace stim_count;

/*
	Name: function_a70bef79
	Namespace: stim_count
	Checksum: 0x2E8835F4
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a70bef79()
{
	level notify(829160349);
}

/*
	Name: register
	Namespace: stim_count
	Checksum: 0x22DE328E
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cstim_count();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: stim_count
	Checksum: 0xA4DF70D2
	Offset: 0x118
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Namespace: stim_count
	Checksum: 0x2FDF789
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
	Namespace: stim_count
	Checksum: 0xE6010A6A
	Offset: 0x180
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_stim_count
	Namespace: stim_count
	Checksum: 0xF1D2D20D
	Offset: 0x1A8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_stim_count(player, value)
{
	[[ self ]]->set_stim_count(player, value);
}

