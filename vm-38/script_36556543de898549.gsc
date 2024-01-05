#using scripts\core_common\lui_shared.csc;

class cseeker_mine_prompt : cluielem
{

	/*
		Name: constructor
		Namespace: cseeker_mine_prompt
		Checksum: 0xB776CD1A
		Offset: 0x398
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
		Checksum: 0xD88C065
		Offset: 0x578
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
		Checksum: 0x937D5049
		Offset: 0x4D8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: cseeker_mine_prompt
		Checksum: 0xA76C33
		Offset: 0x440
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("seeker_mine_prompt");
	}

	/*
		Name: setup_clientfields
		Namespace: cseeker_mine_prompt
		Checksum: 0xFA2128E8
		Offset: 0x3B8
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_afaddf7a, var_ca3086f0)
	{
		cluielem::setup_clientfields("seeker_mine_prompt");
		cluielem::add_clientfield("progress", 1, 5, "float", var_afaddf7a);
		cluielem::add_clientfield("promptState", 1, 2, "int", var_ca3086f0);
	}

	/*
		Name: set_progress
		Namespace: cseeker_mine_prompt
		Checksum: 0xECA01C31
		Offset: 0x508
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_progress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "progress", value);
	}

	/*
		Name: set_promptstate
		Namespace: cseeker_mine_prompt
		Checksum: 0xF58C3904
		Offset: 0x540
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_promptstate(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "promptState", value);
	}

	/*
		Name: function_fa582112
		Namespace: cseeker_mine_prompt
		Checksum: 0xCEE6291E
		Offset: 0x468
		Size: 0x64
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "progress", 0);
		[[ self ]]->set_data(localclientnum, "promptState", 0);
	}

}

#namespace seeker_mine_prompt;

/*
	Name: function_a5e5e1c9
	Namespace: seeker_mine_prompt
	Checksum: 0x6B301FB2
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a5e5e1c9()
{
	level notify(-490628782);
}

/*
	Name: register
	Namespace: seeker_mine_prompt
	Checksum: 0xEA5AF425
	Offset: 0xF8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_afaddf7a, var_ca3086f0)
{
	elem = new cseeker_mine_prompt();
	[[ elem ]]->setup_clientfields(var_afaddf7a, var_ca3086f0);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"seeker_mine_prompt"]))
	{
		level.var_ae746e8f[#"seeker_mine_prompt"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"seeker_mine_prompt"]))
	{
		level.var_ae746e8f[#"seeker_mine_prompt"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"seeker_mine_prompt"]))
	{
		level.var_ae746e8f[#"seeker_mine_prompt"] = array(level.var_ae746e8f[#"seeker_mine_prompt"]);
	}
	level.var_ae746e8f[#"seeker_mine_prompt"][level.var_ae746e8f[#"seeker_mine_prompt"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: seeker_mine_prompt
	Checksum: 0x93199B89
	Offset: 0x280
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cseeker_mine_prompt();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: seeker_mine_prompt
	Checksum: 0x73AC483
	Offset: 0x2C0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: seeker_mine_prompt
	Checksum: 0x307E05D3
	Offset: 0x2E8
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
	Checksum: 0xD39C071E
	Offset: 0x310
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_progress
	Namespace: seeker_mine_prompt
	Checksum: 0x2412093C
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progress(localclientnum, value)
{
	[[ self ]]->set_progress(localclientnum, value);
}

/*
	Name: set_promptstate
	Namespace: seeker_mine_prompt
	Checksum: 0xC5C169A3
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_promptstate(localclientnum, value)
{
	[[ self ]]->set_promptstate(localclientnum, value);
}

