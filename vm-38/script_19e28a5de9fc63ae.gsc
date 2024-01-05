#using scripts\core_common\lui_shared.csc;

class cfail_screen : cluielem
{

	/*
		Name: constructor
		Namespace: cfail_screen
		Checksum: 0xDC4084E4
		Offset: 0x2F8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cfail_screen
		Checksum: 0xCB392D6D
		Offset: 0x3C8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cfail_screen
		Checksum: 0x6BBE1073
		Offset: 0x398
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
		Namespace: cfail_screen
		Checksum: 0x1C8CEAA7
		Offset: 0x340
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("fail_screen");
	}

	/*
		Name: setup_clientfields
		Namespace: cfail_screen
		Checksum: 0xD6F94C2A
		Offset: 0x318
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("fail_screen");
	}

	/*
		Name: function_fa582112
		Namespace: cfail_screen
		Checksum: 0x1D2B076A
		Offset: 0x368
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
	}

}

#namespace fail_screen;

/*
	Name: function_df79df2c
	Namespace: fail_screen
	Checksum: 0xD7C82873
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_df79df2c()
{
	level notify(-730113334);
}

/*
	Name: register
	Namespace: fail_screen
	Checksum: 0x7EBF6A82
	Offset: 0xC8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cfail_screen();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"fail_screen"]))
	{
		level.var_ae746e8f[#"fail_screen"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"fail_screen"]))
	{
		level.var_ae746e8f[#"fail_screen"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"fail_screen"]))
	{
		level.var_ae746e8f[#"fail_screen"] = array(level.var_ae746e8f[#"fail_screen"]);
	}
	level.var_ae746e8f[#"fail_screen"][level.var_ae746e8f[#"fail_screen"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: fail_screen
	Checksum: 0x1A2B0FFD
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cfail_screen();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: fail_screen
	Checksum: 0xDC8037A3
	Offset: 0x280
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
	Namespace: fail_screen
	Checksum: 0x9A28CCE
	Offset: 0x2A8
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
	Namespace: fail_screen
	Checksum: 0x9AC1CC48
	Offset: 0x2D0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

