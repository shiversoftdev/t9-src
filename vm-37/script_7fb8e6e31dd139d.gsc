#using scripts\core_common\lui_shared.gsc;

class cmp_prop_controls : cluielem
{

	/*
		Name: constructor
		Namespace: cmp_prop_controls
		Checksum: 0x81539047
		Offset: 0x180
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cmp_prop_controls
		Checksum: 0xF3AA983C
		Offset: 0x240
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cmp_prop_controls
		Checksum: 0x465DF9E1
		Offset: 0x1C8
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
		Namespace: cmp_prop_controls
		Checksum: 0x6C5969CF
		Offset: 0x210
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
		Namespace: cmp_prop_controls
		Checksum: 0x7202E5B7
		Offset: 0x1A0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("mp_prop_controls");
	}

}

#namespace mp_prop_controls;

/*
	Name: register
	Namespace: mp_prop_controls
	Checksum: 0xD72CA189
	Offset: 0xB0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cmp_prop_controls();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_prop_controls
	Checksum: 0xB2724536
	Offset: 0xF0
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
	Checksum: 0xA6D7C1EF
	Offset: 0x130
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
	Checksum: 0x3D187C10
	Offset: 0x158
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

