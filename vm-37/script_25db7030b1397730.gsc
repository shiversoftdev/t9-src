#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class ccp_chyron : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: ccp_chyron
		Checksum: 0x9C597585
		Offset: 0x2E8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: ccp_chyron
		Checksum: 0x61ACBAEE
		Offset: 0x678
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_line3
		Namespace: ccp_chyron
		Checksum: 0x94F34700
		Offset: 0x538
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_line3(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "line3", value);
	}

	/*
		Name: open
		Namespace: ccp_chyron
		Checksum: 0x85FC6ADA
		Offset: 0x420
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
		Name: set_line2
		Namespace: ccp_chyron
		Checksum: 0x5C8A5260
		Offset: 0x4E8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_line2(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "line2", value);
	}

	/*
		Name: set_line5
		Namespace: ccp_chyron
		Checksum: 0xB1CB39D0
		Offset: 0x5D8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_line5(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "line5", value);
	}

	/*
		Name: set_line1
		Namespace: ccp_chyron
		Checksum: 0x1AF76EF
		Offset: 0x498
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_line1(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "line1", value);
	}

	/*
		Name: close
		Namespace: ccp_chyron
		Checksum: 0x81696403
		Offset: 0x468
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_index
		Namespace: ccp_chyron
		Checksum: 0xAE861A3
		Offset: 0x628
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_index(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "index", value);
	}

	/*
		Name: setup_clientfields
		Namespace: ccp_chyron
		Checksum: 0xF66FD3A2
		Offset: 0x308
		Size: 0x10C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("cp_chyron");
		cluielem::function_dcb34c80("string", "line1", 1);
		cluielem::function_dcb34c80("string", "line2", 1);
		cluielem::function_dcb34c80("string", "line3", 1);
		cluielem::function_dcb34c80("string", "line4", 1);
		cluielem::function_dcb34c80("string", "line5", 1);
		cluielem::add_clientfield("index", 1, 4, "int");
	}

	/*
		Name: set_line4
		Namespace: ccp_chyron
		Checksum: 0x8CD13930
		Offset: 0x588
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_line4(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "line4", value);
	}

}

#namespace cp_chyron;

/*
	Name: register
	Namespace: cp_chyron
	Checksum: 0x33280B88
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new ccp_chyron();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: cp_chyron
	Checksum: 0xB2724536
	Offset: 0x138
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
	Namespace: cp_chyron
	Checksum: 0xA6D7C1EF
	Offset: 0x178
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
	Namespace: cp_chyron
	Checksum: 0x3D187C10
	Offset: 0x1A0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_line1
	Namespace: cp_chyron
	Checksum: 0x3F30FE55
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_line1(player, value)
{
	[[ self ]]->set_line1(player, value);
}

/*
	Name: set_line2
	Namespace: cp_chyron
	Checksum: 0x1BA3903D
	Offset: 0x1F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_line2(player, value)
{
	[[ self ]]->set_line2(player, value);
}

/*
	Name: set_line3
	Namespace: cp_chyron
	Checksum: 0x3B05C35F
	Offset: 0x228
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_line3(player, value)
{
	[[ self ]]->set_line3(player, value);
}

/*
	Name: set_line4
	Namespace: cp_chyron
	Checksum: 0xE2E88131
	Offset: 0x258
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_line4(player, value)
{
	[[ self ]]->set_line4(player, value);
}

/*
	Name: set_line5
	Namespace: cp_chyron
	Checksum: 0x2B4264F0
	Offset: 0x288
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_line5(player, value)
{
	[[ self ]]->set_line5(player, value);
}

/*
	Name: set_index
	Namespace: cp_chyron
	Checksum: 0x4D0CFE4
	Offset: 0x2B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_index(player, value)
{
	[[ self ]]->set_index(player, value);
}

