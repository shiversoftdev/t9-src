#using scripts\core_common\lui_shared.csc;

class class_536d73e : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_536d73e
		Checksum: 0xF58476EA
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
		Namespace: namespace_536d73e
		Checksum: 0x9604EE4A
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
		Namespace: namespace_536d73e
		Checksum: 0xE9672F07
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
		Namespace: namespace_536d73e
		Checksum: 0x343720C7
		Offset: 0x340
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DOA_Overworld");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_536d73e
		Checksum: 0xA460A7EA
		Offset: 0x318
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("DOA_Overworld");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_536d73e
		Checksum: 0xBB37DD6E
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

#namespace doa_overworld;

/*
	Name: function_e80640b
	Namespace: doa_overworld
	Checksum: 0xD13D5267
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e80640b()
{
	level notify(737382776);
}

/*
	Name: register
	Namespace: doa_overworld
	Checksum: 0x43FF8D20
	Offset: 0xC8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_536d73e();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"doa_overworld"]))
	{
		level.var_ae746e8f[#"doa_overworld"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"doa_overworld"]))
	{
		level.var_ae746e8f[#"doa_overworld"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"doa_overworld"]))
	{
		level.var_ae746e8f[#"doa_overworld"] = array(level.var_ae746e8f[#"doa_overworld"]);
	}
	level.var_ae746e8f[#"doa_overworld"][level.var_ae746e8f[#"doa_overworld"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: doa_overworld
	Checksum: 0xBB3DA43E
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_536d73e();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: doa_overworld
	Checksum: 0xB035C16B
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
	Namespace: doa_overworld
	Checksum: 0x8A5D773E
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
	Namespace: doa_overworld
	Checksum: 0xEAA27B4E
	Offset: 0x2D0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

