#using scripts\core_common\lui_shared.csc;

class class_2347be59 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_2347be59
		Checksum: 0xCA05CB42
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
		Namespace: namespace_2347be59
		Checksum: 0x37D7A643
		Offset: 0x570
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_2347be59
		Checksum: 0x699FB804
		Offset: 0x4D0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_2347be59
		Checksum: 0x942BD949
		Offset: 0x440
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("multi_stage_friendly_lockon");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_2347be59
		Checksum: 0xC517DEC0
		Offset: 0x3B8
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_5a7b4b38, var_29786c92)
	{
		namespace_6aaccc24::setup_clientfields("multi_stage_friendly_lockon");
		namespace_6aaccc24::function_da693cbe("entNum", 1, 10, "int", var_5a7b4b38);
		namespace_6aaccc24::function_da693cbe("targetState", 1, 3, "int", var_29786c92);
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_2347be59
		Checksum: 0xD8595AC6
		Offset: 0x500
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_c8350e33(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "entNum", value);
	}

	/*
		Name: function_f1e8a488
		Namespace: namespace_2347be59
		Checksum: 0x639C25FB
		Offset: 0x538
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_f1e8a488(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "targetState", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_2347be59
		Checksum: 0x4A95CA2F
		Offset: 0x468
		Size: 0x5C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "entNum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "targetState", 0);
	}

}

#namespace multi_stage_friendly_lockon;

/*
	Name: function_f53a507d
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xED4924E9
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f53a507d()
{
	level notify(184008048);
}

/*
	Name: register
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x553939C4
	Offset: 0xF8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_5a7b4b38, var_29786c92)
{
	elem = new class_2347be59();
	[[ elem ]]->setup_clientfields(var_5a7b4b38, var_29786c92);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"multi_stage_friendly_lockon"]))
	{
		level.var_ae746e8f[#"multi_stage_friendly_lockon"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"multi_stage_friendly_lockon"]))
	{
		level.var_ae746e8f[#"multi_stage_friendly_lockon"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"multi_stage_friendly_lockon"]))
	{
		level.var_ae746e8f[#"multi_stage_friendly_lockon"] = array(level.var_ae746e8f[#"multi_stage_friendly_lockon"]);
	}
	level.var_ae746e8f[#"multi_stage_friendly_lockon"][level.var_ae746e8f[#"multi_stage_friendly_lockon"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xADBEACCB
	Offset: 0x280
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_2347be59();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x71F6CE6A
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xF7D0D2ED
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x1D9FE681
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
	Name: function_c8350e33
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x98A4D9CD
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c8350e33(localclientnum, value)
{
	[[ self ]]->function_c8350e33(localclientnum, value);
}

/*
	Name: function_f1e8a488
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x7EE64C09
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f1e8a488(localclientnum, value)
{
	[[ self ]]->function_f1e8a488(localclientnum, value);
}

