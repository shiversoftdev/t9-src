#using scripts\core_common\lui_shared.gsc;

class class_98cc868d : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_98cc868d
		Checksum: 0x1578E2B9
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
		Namespace: namespace_98cc868d
		Checksum: 0x862047D4
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
		Namespace: namespace_98cc868d
		Checksum: 0x245EE05C
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
		Namespace: namespace_98cc868d
		Checksum: 0xB48039D9
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
		Namespace: namespace_98cc868d
		Checksum: 0xB45E01A6
		Offset: 0x1C0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("pitch_and_yaw_meters");
	}

}

#namespace pitch_and_yaw_meters;

/*
	Name: function_77665ff2
	Namespace: pitch_and_yaw_meters
	Checksum: 0x76F3D7BF
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_77665ff2()
{
	level notify(1956901613);
}

/*
	Name: register
	Namespace: pitch_and_yaw_meters
	Checksum: 0xB1E1A349
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_98cc868d();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: pitch_and_yaw_meters
	Checksum: 0x3A6790E3
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
	Namespace: pitch_and_yaw_meters
	Checksum: 0x2AD0B106
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
	Namespace: pitch_and_yaw_meters
	Checksum: 0x1E0592EA
	Offset: 0x178
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

