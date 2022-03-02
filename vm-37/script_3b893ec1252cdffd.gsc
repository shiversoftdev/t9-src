#using scripts\core_common\lui_shared.csc;

class class_536d73e : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_536d73e
		Checksum: 0x7C638A2B
		Offset: 0x2D8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_536d73e
		Checksum: 0xCE97CD0C
		Offset: 0x3A8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_536d73e
		Checksum: 0x6078E44F
		Offset: 0x378
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_536d73e
		Checksum: 0xAD290318
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("DOA_Overworld");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_536d73e
		Checksum: 0x2D544A0F
		Offset: 0x2F8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("DOA_Overworld");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_536d73e
		Checksum: 0xA9F94B3B
		Offset: 0x348
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace doa_overworld;

/*
	Name: register
	Namespace: doa_overworld
	Checksum: 0xDFFC8696
	Offset: 0xA8
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
	Name: function_5c1bb138
	Namespace: doa_overworld
	Checksum: 0x291A068A
	Offset: 0x220
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5c1bb138()
{
	elem = new class_536d73e();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: doa_overworld
	Checksum: 0xC89C55D6
	Offset: 0x260
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: doa_overworld
	Checksum: 0x6B0A46F8
	Offset: 0x288
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: doa_overworld
	Checksum: 0x88771CC9
	Offset: 0x2B0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

