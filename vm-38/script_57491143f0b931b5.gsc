#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cseeker_mine_prompt : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cseeker_mine_prompt
		Checksum: 0x2C28BEC9
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
		Namespace: cseeker_mine_prompt
		Checksum: 0x56918045
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
		Namespace: cseeker_mine_prompt
		Checksum: 0xD118D251
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: cseeker_mine_prompt
		Checksum: 0x87639077
		Offset: 0x310
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
		Checksum: 0xF08385BB
		Offset: 0x250
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
		Checksum: 0xE511E991
		Offset: 0x340
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
		Checksum: 0x21D324AC
		Offset: 0x390
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
	Name: function_9822b7a5
	Namespace: seeker_mine_prompt
	Checksum: 0x7CCF3361
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9822b7a5()
{
	level notify(1389296098);
}

/*
	Name: register
	Namespace: seeker_mine_prompt
	Checksum: 0x81CB9CB0
	Offset: 0x100
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
	Checksum: 0x83B95F3F
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
	Namespace: seeker_mine_prompt
	Checksum: 0xDE74B2A0
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
	Namespace: seeker_mine_prompt
	Checksum: 0x686D9D85
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
	Name: set_progress
	Namespace: seeker_mine_prompt
	Checksum: 0xE7D8672B
	Offset: 0x1D0
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
	Checksum: 0xAB9F95EA
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_promptstate(player, value)
{
	[[ self ]]->set_promptstate(player, value);
}

