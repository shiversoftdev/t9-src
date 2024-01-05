#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cseeker_mine_prompt : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cseeker_mine_prompt
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
		Namespace: cseeker_mine_prompt
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
		Namespace: cseeker_mine_prompt
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: cseeker_mine_prompt
		Checksum: 0x4B1D06A1
		Offset: 0x2F0
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
		Namespace: cseeker_mine_prompt
		Checksum: 0xF99558DF
		Offset: 0x230
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("seeker_mine_prompt");
		cluielem::add_clientfield("progress", 1, 5, "float");
		cluielem::add_clientfield("promptState", 1, 2, "int");
	}

	/*
		Name: set_progress
		Namespace: cseeker_mine_prompt
		Checksum: 0x1F1BC176
		Offset: 0x320
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_progress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progress", value);
	}

	/*
		Name: set_promptstate
		Namespace: cseeker_mine_prompt
		Checksum: 0x1CB0A3C0
		Offset: 0x370
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_promptstate(player, value)
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
	elem = new cseeker_mine_prompt();
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
	Name: set_progress
	Namespace: seeker_mine_prompt
	Checksum: 0xD63C15D9
	Offset: 0x1B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progress(player, value)
{
	[[ self ]]->set_progress(player, value);
}

/*
	Name: set_promptstate
	Namespace: seeker_mine_prompt
	Checksum: 0x98955C95
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_promptstate(player, value)
{
	[[ self ]]->set_promptstate(player, value);
}

