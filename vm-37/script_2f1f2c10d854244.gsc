#using scripts\core_common\lui_shared.csc;

class class_2347be59 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_2347be59
		Checksum: 0xD444D2CE
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
		Namespace: namespace_2347be59
		Checksum: 0xBDB561EA
		Offset: 0x550
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
		Checksum: 0x69DC604E
		Offset: 0x4B0
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
		Checksum: 0x85CBB6EF
		Offset: 0x420
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
		Checksum: 0x9930CDD
		Offset: 0x398
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
		Checksum: 0x9E87E225
		Offset: 0x4E0
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
		Checksum: 0xCAC42EA4
		Offset: 0x518
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
		Checksum: 0x905135D0
		Offset: 0x448
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
	Name: register
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x8D6D9DB9
	Offset: 0xD8
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
	Checksum: 0x153F1750
	Offset: 0x260
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
	Checksum: 0x4F0ADB9F
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xCDB1A4BB
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x72821333
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
	Name: function_c8350e33
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xCFAFB215
	Offset: 0x318
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
	Checksum: 0xC62E9204
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f1e8a488(localclientnum, value)
{
	[[ self ]]->function_f1e8a488(localclientnum, value);
}

