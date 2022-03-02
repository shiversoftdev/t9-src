#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_8c34ca59 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_8c34ca59
		Checksum: 0x186FC38E
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
		Namespace: namespace_8c34ca59
		Checksum: 0x747DD658
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
		Namespace: namespace_8c34ca59
		Checksum: 0xC321DF05
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
		Namespace: namespace_8c34ca59
		Checksum: 0x4B1D06A1
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
		Namespace: namespace_8c34ca59
		Checksum: 0xF99558DF
		Offset: 0x230
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("seeker_mine_prompt");
		namespace_6aaccc24::function_da693cbe("progress", 1, 5, "float");
		namespace_6aaccc24::function_da693cbe("promptState", 1, 2, "int");
	}

	/*
		Name: function_affe8f61
		Namespace: namespace_8c34ca59
		Checksum: 0x1F1BC176
		Offset: 0x320
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_affe8f61(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progress", value);
	}

	/*
		Name: function_c719cfea
		Namespace: namespace_8c34ca59
		Checksum: 0x1CB0A3C0
		Offset: 0x370
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_c719cfea(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "promptState", value);
	}

}

#namespace seeker_mine_prompt;

/*
	Name: register
	Namespace: seeker_mine_prompt
	Checksum: 0xBC802A49
	Offset: 0xE0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_8c34ca59();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: seeker_mine_prompt
	Checksum: 0x555E5116
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
	Namespace: seeker_mine_prompt
	Checksum: 0x2780A85B
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
	Namespace: seeker_mine_prompt
	Checksum: 0x5FE370E6
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
	Name: function_affe8f61
	Namespace: seeker_mine_prompt
	Checksum: 0xD63C15D9
	Offset: 0x1B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_affe8f61(player, value)
{
	[[ self ]]->function_affe8f61(player, value);
}

/*
	Name: function_c719cfea
	Namespace: seeker_mine_prompt
	Checksum: 0x98955C95
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c719cfea(player, value)
{
	[[ self ]]->function_c719cfea(player, value);
}

