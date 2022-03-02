#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_6b831806 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_6b831806
		Checksum: 0x98395614
		Offset: 0x1D8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_6b831806
		Checksum: 0xC42AC60D
		Offset: 0x310
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_6b831806
		Checksum: 0xDFBBA459
		Offset: 0x248
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
		Name: function_26d9350e
		Namespace: namespace_6b831806
		Checksum: 0x24C20A87
		Offset: 0x2C0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_26d9350e(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "deployProgress", value);
	}

	/*
		Name: close
		Namespace: namespace_6b831806
		Checksum: 0xF9619DC5
		Offset: 0x290
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
		Namespace: namespace_6b831806
		Checksum: 0x32DD98BA
		Offset: 0x1F8
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("BlackSeaJetskiDeployPrompt");
		namespace_6aaccc24::function_da693cbe("deployProgress", 1, 5, "float");
	}

}

#namespace blackseajetskideployprompt;

/*
	Name: register
	Namespace: blackseajetskideployprompt
	Checksum: 0x31190987
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_6b831806();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: blackseajetskideployprompt
	Checksum: 0x555E5116
	Offset: 0x118
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
	Namespace: blackseajetskideployprompt
	Checksum: 0x2780A85B
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
	Namespace: blackseajetskideployprompt
	Checksum: 0x5FE370E6
	Offset: 0x180
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_26d9350e
	Namespace: blackseajetskideployprompt
	Checksum: 0xFDAD504D
	Offset: 0x1A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_26d9350e(player, value)
{
	[[ self ]]->function_26d9350e(player, value);
}

