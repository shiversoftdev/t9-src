#using scripts\core_common\lui_shared.csc;

class class_616a42d0 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_616a42d0
		Checksum: 0x4D8CCE20
		Offset: 0x348
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_616a42d0
		Checksum: 0xB408ECE7
		Offset: 0x4A0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_616a42d0
		Checksum: 0x3EB10922
		Offset: 0x438
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
		Namespace: namespace_616a42d0
		Checksum: 0xB732F866
		Offset: 0x3C0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_build_progress");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_616a42d0
		Checksum: 0xF50DC720
		Offset: 0x368
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_afaddf7a)
	{
		namespace_6aaccc24::setup_clientfields("zm_build_progress");
		namespace_6aaccc24::function_da693cbe("progress", 1, 6, "float", var_afaddf7a);
	}

	/*
		Name: function_affe8f61
		Namespace: namespace_616a42d0
		Checksum: 0xC2527994
		Offset: 0x468
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_affe8f61(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "progress", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_616a42d0
		Checksum: 0x6130205E
		Offset: 0x3E8
		Size: 0x48
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "progress", 0);
	}

}

#namespace zm_build_progress;

/*
	Name: function_2daaded4
	Namespace: zm_build_progress
	Checksum: 0xD91281B3
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2daaded4()
{
	level notify(935550989);
}

/*
	Name: register
	Namespace: zm_build_progress
	Checksum: 0xD2173CF8
	Offset: 0xE0
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function register(var_afaddf7a)
{
	elem = new class_616a42d0();
	[[ elem ]]->setup_clientfields(var_afaddf7a);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_build_progress"]))
	{
		level.var_ae746e8f[#"zm_build_progress"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_build_progress"]))
	{
		level.var_ae746e8f[#"zm_build_progress"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_build_progress"]))
	{
		level.var_ae746e8f[#"zm_build_progress"] = array(level.var_ae746e8f[#"zm_build_progress"]);
	}
	level.var_ae746e8f[#"zm_build_progress"][level.var_ae746e8f[#"zm_build_progress"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_build_progress
	Checksum: 0xA379ACA6
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_616a42d0();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_build_progress
	Checksum: 0xAB7C1ABF
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
	Namespace: zm_build_progress
	Checksum: 0x2C2BB37
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
	Namespace: zm_build_progress
	Checksum: 0x71B19878
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
	Name: function_affe8f61
	Namespace: zm_build_progress
	Checksum: 0xB5792CEF
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_affe8f61(localclientnum, value)
{
	[[ self ]]->function_affe8f61(localclientnum, value);
}

