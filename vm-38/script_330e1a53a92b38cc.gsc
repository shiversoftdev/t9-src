#using scripts\core_common\lui_shared.csc;

class class_3cdd43e2 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_3cdd43e2
		Checksum: 0x19639139
		Offset: 0x3F0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_3cdd43e2
		Checksum: 0x5CBF7D2D
		Offset: 0x660
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_3cdd43e2
		Checksum: 0x2C85D256
		Offset: 0x588
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_3b7b386a
		Namespace: namespace_3cdd43e2
		Checksum: 0x2928DED9
		Offset: 0x5B8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_3b7b386a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "clientnum", value);
	}

	/*
		Name: function_4b3fb8b8
		Namespace: namespace_3cdd43e2
		Checksum: 0x10C0B6BE
		Offset: 0x628
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_4b3fb8b8(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "reviveProgress", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_3cdd43e2
		Checksum: 0xF5E69579
		Offset: 0x4D0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("mp_revive_prompt");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_3cdd43e2
		Checksum: 0xEDC1A32F
		Offset: 0x410
		Size: 0xB4
		Parameters: 4
		Flags: None
	*/
	function setup_clientfields(var_c05c67e2, var_afaddf7a, var_d65e5a18, var_f228b5fa)
	{
		namespace_6aaccc24::setup_clientfields("mp_revive_prompt");
		namespace_6aaccc24::function_da693cbe("clientnum", 1, 7, "int", var_afaddf7a);
		namespace_6aaccc24::function_da693cbe("progress", 1, 5, "float", var_d65e5a18);
		namespace_6aaccc24::function_da693cbe("reviveProgress", 1, 5, "float", var_f228b5fa);
	}

	/*
		Name: function_affe8f61
		Namespace: namespace_3cdd43e2
		Checksum: 0xA82BFF24
		Offset: 0x5F0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_affe8f61(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "progress", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_3cdd43e2
		Checksum: 0x1CFB25E1
		Offset: 0x4F8
		Size: 0x88
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "clientnum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "progress", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "reviveProgress", 0);
	}

}

#namespace mp_revive_prompt;

/*
	Name: function_4a4ba3f0
	Namespace: mp_revive_prompt
	Checksum: 0x2759B7E8
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4a4ba3f0()
{
	level notify(2105912675);
}

/*
	Name: register
	Namespace: mp_revive_prompt
	Checksum: 0x5DCCF323
	Offset: 0x108
	Size: 0x196
	Parameters: 4
	Flags: None
*/
function register(var_c05c67e2, var_afaddf7a, var_d65e5a18, var_f228b5fa)
{
	elem = new class_3cdd43e2();
	[[ elem ]]->setup_clientfields(var_c05c67e2, var_afaddf7a, var_d65e5a18, var_f228b5fa);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_revive_prompt"]))
	{
		level.var_ae746e8f[#"mp_revive_prompt"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_revive_prompt"]))
	{
		level.var_ae746e8f[#"mp_revive_prompt"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_revive_prompt"]))
	{
		level.var_ae746e8f[#"mp_revive_prompt"] = array(level.var_ae746e8f[#"mp_revive_prompt"]);
	}
	level.var_ae746e8f[#"mp_revive_prompt"][level.var_ae746e8f[#"mp_revive_prompt"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: mp_revive_prompt
	Checksum: 0xC272010F
	Offset: 0x2A8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_3cdd43e2();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: mp_revive_prompt
	Checksum: 0x2E334AF
	Offset: 0x2E8
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
	Namespace: mp_revive_prompt
	Checksum: 0x571D34BF
	Offset: 0x310
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
	Namespace: mp_revive_prompt
	Checksum: 0xD4D680BC
	Offset: 0x338
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_3b7b386a
	Namespace: mp_revive_prompt
	Checksum: 0x8436A372
	Offset: 0x360
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3b7b386a(localclientnum, value)
{
	[[ self ]]->function_3b7b386a(localclientnum, value);
}

/*
	Name: function_affe8f61
	Namespace: mp_revive_prompt
	Checksum: 0x4882618F
	Offset: 0x390
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_affe8f61(localclientnum, value)
{
	[[ self ]]->function_affe8f61(localclientnum, value);
}

/*
	Name: function_4b3fb8b8
	Namespace: mp_revive_prompt
	Checksum: 0x12F4DFFA
	Offset: 0x3C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4b3fb8b8(localclientnum, value)
{
	[[ self ]]->function_4b3fb8b8(localclientnum, value);
}

