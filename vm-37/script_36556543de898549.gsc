#using scripts\core_common\lui_shared.csc;

class cseeker_mine_prompt : cluielem
{

	/*
		Name: constructor
		Namespace: cseeker_mine_prompt
		Checksum: 0x2EE5231B
		Offset: 0x378
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
		Checksum: 0xCE724089
		Offset: 0x558
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
		Checksum: 0x5C169F4B
		Offset: 0x4B8
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
		Checksum: 0x6AFF355C
		Offset: 0x420
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
		Checksum: 0x7D4729D5
		Offset: 0x398
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
		Checksum: 0x5C87A9FD
		Offset: 0x4E8
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
		Checksum: 0xB609CF6B
		Offset: 0x520
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
		Checksum: 0x3BFAF4A9
		Offset: 0x448
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
	Name: register
	Namespace: seeker_mine_prompt
	Checksum: 0x3073CDB4
	Offset: 0xD8
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
	Checksum: 0x66D94F10
	Offset: 0x260
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
	Checksum: 0x2452FC06
	Offset: 0x2A0
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
	Checksum: 0xFE1506A9
	Offset: 0x2C8
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
	Checksum: 0xC80CA57E
	Offset: 0x2F0
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
	Checksum: 0xCD8F608
	Offset: 0x318
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
	Checksum: 0x8FAABCDB
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_promptstate(localclientnum, value)
{
	[[ self ]]->set_promptstate(localclientnum, value);
}

