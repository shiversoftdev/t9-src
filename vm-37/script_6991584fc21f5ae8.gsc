#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_fd95a9c : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_fd95a9c
		Checksum: 0x3F1F16BB
		Offset: 0x208
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_fd95a9c
		Checksum: 0x8EECD3C5
		Offset: 0x3B8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_fd95a9c
		Checksum: 0xC0DA9E11
		Offset: 0x2A0
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
		Name: set_confirmbtn
		Namespace: namespace_fd95a9c
		Checksum: 0x60701E6
		Offset: 0x368
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_confirmbtn(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "confirmBtn", value);
	}

	/*
		Name: close
		Namespace: namespace_fd95a9c
		Checksum: 0x428A687D
		Offset: 0x2E8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_textboxhint
		Namespace: namespace_fd95a9c
		Checksum: 0x7F649EC8
		Offset: 0x318
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_textboxhint(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "textBoxHint", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_fd95a9c
		Checksum: 0xA272E7FA
		Offset: 0x228
		Size: 0x6C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("DOA_KeyTrade");
		cluielem::function_dcb34c80("string", "textBoxHint", 1);
		cluielem::function_dcb34c80("string", "confirmBtn", 1);
	}

}

#namespace doa_keytrade;

/*
	Name: register
	Namespace: doa_keytrade
	Checksum: 0x4897CA86
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_fd95a9c();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: doa_keytrade
	Checksum: 0xA54E9789
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
	Namespace: doa_keytrade
	Checksum: 0x86736221
	Offset: 0x158
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: doa_keytrade
	Checksum: 0x7D032A4E
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
	Name: set_textboxhint
	Namespace: doa_keytrade
	Checksum: 0x9577DFE
	Offset: 0x1A8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_textboxhint(player, value)
{
	[[ self ]]->set_textboxhint(player, value);
}

/*
	Name: set_confirmbtn
	Namespace: doa_keytrade
	Checksum: 0xC98639D1
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_confirmbtn(player, value)
{
	[[ self ]]->set_confirmbtn(player, value);
}

