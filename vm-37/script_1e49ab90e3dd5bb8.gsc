#using scripts\core_common\lui_shared.csc;

class cblackseajetskideployprompt : cluielem
{

	/*
		Name: constructor
		Namespace: cblackseajetskideployprompt
		Checksum: 0xD524E6C9
		Offset: 0x338
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cblackseajetskideployprompt
		Checksum: 0x297A5532
		Offset: 0x490
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cblackseajetskideployprompt
		Checksum: 0xF7BE7806
		Offset: 0x428
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_deployprogress
		Namespace: cblackseajetskideployprompt
		Checksum: 0x9A41AF48
		Offset: 0x458
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_deployprogress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "deployProgress", value);
	}

	/*
		Name: register_clientside
		Namespace: cblackseajetskideployprompt
		Checksum: 0xA07BE86A
		Offset: 0x3B0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("BlackSeaJetskiDeployPrompt");
	}

	/*
		Name: setup_clientfields
		Namespace: cblackseajetskideployprompt
		Checksum: 0xB80E6C2E
		Offset: 0x358
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_8c9ddf96)
	{
		cluielem::setup_clientfields("BlackSeaJetskiDeployPrompt");
		cluielem::add_clientfield("deployProgress", 1, 5, "float", var_8c9ddf96);
	}

	/*
		Name: function_fa582112
		Namespace: cblackseajetskideployprompt
		Checksum: 0x9C18D245
		Offset: 0x3D8
		Size: 0x48
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "deployProgress", 0);
	}

}

#namespace blackseajetskideployprompt;

/*
	Name: register
	Namespace: blackseajetskideployprompt
	Checksum: 0x87641505
	Offset: 0xD0
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_8c9ddf96)
{
	elem = new cblackseajetskideployprompt();
	[[ elem ]]->setup_clientfields(var_8c9ddf96);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"blackseajetskideployprompt"]))
	{
		level.var_ae746e8f[#"blackseajetskideployprompt"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"blackseajetskideployprompt"]))
	{
		level.var_ae746e8f[#"blackseajetskideployprompt"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"blackseajetskideployprompt"]))
	{
		level.var_ae746e8f[#"blackseajetskideployprompt"] = array(level.var_ae746e8f[#"blackseajetskideployprompt"]);
	}
	level.var_ae746e8f[#"blackseajetskideployprompt"][level.var_ae746e8f[#"blackseajetskideployprompt"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: blackseajetskideployprompt
	Checksum: 0xF4329E61
	Offset: 0x250
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cblackseajetskideployprompt();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: blackseajetskideployprompt
	Checksum: 0x92080EC4
	Offset: 0x290
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
	Namespace: blackseajetskideployprompt
	Checksum: 0x31E063E4
	Offset: 0x2B8
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
	Checksum: 0x3BA37A4B
	Offset: 0x2E0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_deployprogress
	Namespace: blackseajetskideployprompt
	Checksum: 0x8B9D3D38
	Offset: 0x308
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_deployprogress(localclientnum, value)
{
	[[ self ]]->set_deployprogress(localclientnum, value);
}

