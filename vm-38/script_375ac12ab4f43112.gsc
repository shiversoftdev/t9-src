#using scripts\core_common\lui_shared.gsc;

class class_a5d10b03 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_a5d10b03
		Checksum: 0xFB3B6A6B
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
		Namespace: namespace_a5d10b03
		Checksum: 0x41E0C06D
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
		Namespace: namespace_a5d10b03
		Checksum: 0xAE0F72A2
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_a5d10b03
		Checksum: 0xB3CE6D90
		Offset: 0x228
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
		Checksum: 0x7681AA50
		Offset: 0x1B8
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
	Name: function_173ae588
	Namespace: cp_killcam
	Checksum: 0xE4592456
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_173ae588()
{
	level notify(523704293);
}

/*
	Name: register
	Namespace: cp_killcam
	Checksum: 0x5AE13C78
	Offset: 0xC8
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
	Checksum: 0xAA4B8EB3
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
	Namespace: cp_killcam
	Checksum: 0xF8A9CA82
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
	Namespace: cp_killcam
	Checksum: 0xA2C3BD60
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

