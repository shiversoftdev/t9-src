#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_302a48fc : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_302a48fc
		Checksum: 0x9F56F53C
		Offset: 0x230
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_302a48fc
		Checksum: 0xA02D9667
		Offset: 0x3E0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_302a48fc
		Checksum: 0x7619B44C
		Offset: 0x2C8
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
		Namespace: namespace_302a48fc
		Checksum: 0x46DE8545
		Offset: 0x310
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
		Namespace: namespace_302a48fc
		Checksum: 0xE16BF71A
		Offset: 0x250
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("vip_notify_text");
		namespace_6aaccc24::function_dcb34c80("string", "vipmessage", 1);
		namespace_6aaccc24::function_da693cbe("alpha", 1, 8, "float");
	}

	/*
		Name: function_aa5c711d
		Namespace: namespace_302a48fc
		Checksum: 0x118F27F9
		Offset: 0x390
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_aa5c711d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "alpha", value);
	}

	/*
		Name: function_d01a102c
		Namespace: namespace_302a48fc
		Checksum: 0xD14571ED
		Offset: 0x340
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_d01a102c(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "vipmessage", value);
	}

}

#namespace vip_notify_text;

/*
	Name: function_a1c43c8f
	Namespace: vip_notify_text
	Checksum: 0xA24CAA74
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a1c43c8f()
{
	level notify(1492521645);
}

/*
	Name: register
	Namespace: vip_notify_text
	Checksum: 0x8653F2F9
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_302a48fc();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: vip_notify_text
	Checksum: 0xA4DF70D2
	Offset: 0x140
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
	Namespace: vip_notify_text
	Checksum: 0x2FDF789
	Offset: 0x180
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
	Namespace: vip_notify_text
	Checksum: 0xE6010A6A
	Offset: 0x1A8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_d01a102c
	Namespace: vip_notify_text
	Checksum: 0x38E07786
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d01a102c(player, value)
{
	[[ self ]]->function_d01a102c(player, value);
}

/*
	Name: function_aa5c711d
	Namespace: vip_notify_text
	Checksum: 0xEB4BA0B
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_aa5c711d(player, value)
{
	[[ self ]]->function_aa5c711d(player, value);
}

