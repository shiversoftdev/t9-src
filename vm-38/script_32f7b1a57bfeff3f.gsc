#using scripts\core_common\lui_shared.csc;

class class_d0a96b4 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_d0a96b4
		Checksum: 0xF58476EA
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_d0a96b4
		Checksum: 0x9604EE4A
		Offset: 0x3D0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_d0a96b4
		Checksum: 0xE9672F07
		Offset: 0x3A0
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
		Namespace: namespace_d0a96b4
		Checksum: 0x343720C7
		Offset: 0x348
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("TerminalKeyboardFrame");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_d0a96b4
		Checksum: 0xA460A7EA
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("TerminalKeyboardFrame");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_d0a96b4
		Checksum: 0xBB37DD6E
		Offset: 0x370
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace namespace_20a120d7;

/*
	Name: function_3d08d8b4
	Namespace: namespace_20a120d7
	Checksum: 0x8B0BC77D
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3d08d8b4()
{
	level notify(822706876);
}

/*
	Name: register
	Namespace: namespace_20a120d7
	Checksum: 0xB7073EAE
	Offset: 0xD0
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_d0a96b4();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_39033eb84c2631a5"]))
	{
		level.var_ae746e8f[#"hash_39033eb84c2631a5"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_39033eb84c2631a5"]))
	{
		level.var_ae746e8f[#"hash_39033eb84c2631a5"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_39033eb84c2631a5"]))
	{
		level.var_ae746e8f[#"hash_39033eb84c2631a5"] = array(level.var_ae746e8f[#"hash_39033eb84c2631a5"]);
	}
	level.var_ae746e8f[#"hash_39033eb84c2631a5"][level.var_ae746e8f[#"hash_39033eb84c2631a5"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_20a120d7
	Checksum: 0x3BC80F5E
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_d0a96b4();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_20a120d7
	Checksum: 0xB035C16B
	Offset: 0x288
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
	Namespace: namespace_20a120d7
	Checksum: 0x8A5D773E
	Offset: 0x2B0
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
	Namespace: namespace_20a120d7
	Checksum: 0xEAA27B4E
	Offset: 0x2D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

