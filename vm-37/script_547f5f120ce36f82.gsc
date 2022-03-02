#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_302a48fc : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_302a48fc
		Checksum: 0x768751FE
		Offset: 0x210
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
		Checksum: 0xA1F37DAD
		Offset: 0x3C0
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
		Checksum: 0x16C1F545
		Offset: 0x2A8
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
		Checksum: 0xE6A8E480
		Offset: 0x2F0
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
		Checksum: 0xA1B9E170
		Offset: 0x230
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
		Checksum: 0x982E6844
		Offset: 0x370
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
		Checksum: 0xFB795CE7
		Offset: 0x320
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
	Name: register
	Namespace: vip_notify_text
	Checksum: 0xBF0F668C
	Offset: 0xE0
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
	Checksum: 0x9E0FBA10
	Offset: 0x120
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
	Checksum: 0x43870681
	Offset: 0x160
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
	Checksum: 0xB2A10D20
	Offset: 0x188
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
	Checksum: 0x1AF71100
	Offset: 0x1B0
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
	Checksum: 0x2CC0B50B
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_aa5c711d(player, value)
{
	[[ self ]]->function_aa5c711d(player, value);
}

