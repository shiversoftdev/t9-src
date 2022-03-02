#using scripts\core_common\lui_shared.gsc;

class class_a5d10b03 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_a5d10b03
		Checksum: 0x4F5EDDEA
		Offset: 0x178
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_a5d10b03
		Checksum: 0xF3AA983C
		Offset: 0x238
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_a5d10b03
		Checksum: 0xB84F09F6
		Offset: 0x1C0
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
		Namespace: namespace_a5d10b03
		Checksum: 0x8C1FE4A5
		Offset: 0x208
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
		Namespace: namespace_a5d10b03
		Checksum: 0x846EBFB3
		Offset: 0x198
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("cp_killcam");
	}

}

#namespace cp_killcam;

/*
	Name: register
	Namespace: cp_killcam
	Checksum: 0x6AF468F5
	Offset: 0xA8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_a5d10b03();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: cp_killcam
	Checksum: 0xAAD9FD56
	Offset: 0xE8
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
	Namespace: cp_killcam
	Checksum: 0xD115B182
	Offset: 0x128
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
	Namespace: cp_killcam
	Checksum: 0x853CA0D4
	Offset: 0x150
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

