#using scripts\core_common\lui_shared.csc;

class class_b9aee0cd : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_b9aee0cd
		Checksum: 0x742D7204
		Offset: 0x420
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_b9aee0cd
		Checksum: 0x113A0025
		Offset: 0x710
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_b9aee0cd
		Checksum: 0x4F3ABC8E
		Offset: 0x600
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_21eb67aa
		Namespace: namespace_b9aee0cd
		Checksum: 0xBEE36A78
		Offset: 0x6A0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_21eb67aa(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "minutes", value);
	}

	/*
		Name: function_28ccc05d
		Namespace: namespace_b9aee0cd
		Checksum: 0x4A3464A4
		Offset: 0x6D8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_28ccc05d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "title", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_b9aee0cd
		Checksum: 0x811C8E2A
		Offset: 0x528
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_arcade_timer");
	}

	/*
		Name: function_7954feaf
		Namespace: namespace_b9aee0cd
		Checksum: 0x9997BC27
		Offset: 0x630
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_7954feaf(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showzero", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_b9aee0cd
		Checksum: 0x68EF222F
		Offset: 0x440
		Size: 0xDC
		Parameters: 4
		Flags: None
	*/
	function setup_clientfields(var_8fd8bfaa, var_b1de907e, var_359a4d9a, var_395b3059)
	{
		namespace_6aaccc24::setup_clientfields("zm_arcade_timer");
		namespace_6aaccc24::function_da693cbe("showzero", 1, 1, "int", var_b1de907e);
		namespace_6aaccc24::function_da693cbe("seconds", 1, 6, "int", var_359a4d9a);
		namespace_6aaccc24::function_da693cbe("minutes", 1, 4, "int", var_395b3059);
		namespace_6aaccc24::function_dcb34c80("string", "title", 1);
	}

	/*
		Name: function_c48569e7
		Namespace: namespace_b9aee0cd
		Checksum: 0x512BDFED
		Offset: 0x668
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_c48569e7(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "seconds", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_b9aee0cd
		Checksum: 0xC0C55129
		Offset: 0x550
		Size: 0xA4
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "showzero", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "seconds", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "minutes", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "title", #"");
	}

}

#namespace zm_arcade_timer;

/*
	Name: function_90dbacb0
	Namespace: zm_arcade_timer
	Checksum: 0xAD36E0F3
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_90dbacb0()
{
	level notify(1228955577);
}

/*
	Name: register
	Namespace: zm_arcade_timer
	Checksum: 0xD82A9EA8
	Offset: 0x108
	Size: 0x196
	Parameters: 4
	Flags: None
*/
function register(var_8fd8bfaa, var_b1de907e, var_359a4d9a, var_395b3059)
{
	elem = new class_b9aee0cd();
	[[ elem ]]->setup_clientfields(var_8fd8bfaa, var_b1de907e, var_359a4d9a, var_395b3059);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_arcade_timer"]))
	{
		level.var_ae746e8f[#"zm_arcade_timer"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_arcade_timer"]))
	{
		level.var_ae746e8f[#"zm_arcade_timer"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_arcade_timer"]))
	{
		level.var_ae746e8f[#"zm_arcade_timer"] = array(level.var_ae746e8f[#"zm_arcade_timer"]);
	}
	level.var_ae746e8f[#"zm_arcade_timer"][level.var_ae746e8f[#"zm_arcade_timer"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_arcade_timer
	Checksum: 0x38043210
	Offset: 0x2A8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_b9aee0cd();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_arcade_timer
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
	Namespace: zm_arcade_timer
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
	Namespace: zm_arcade_timer
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
	Name: function_7954feaf
	Namespace: zm_arcade_timer
	Checksum: 0xCD74FC5A
	Offset: 0x360
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7954feaf(localclientnum, value)
{
	[[ self ]]->function_7954feaf(localclientnum, value);
}

/*
	Name: function_c48569e7
	Namespace: zm_arcade_timer
	Checksum: 0x32A1C5A1
	Offset: 0x390
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c48569e7(localclientnum, value)
{
	[[ self ]]->function_c48569e7(localclientnum, value);
}

/*
	Name: function_21eb67aa
	Namespace: zm_arcade_timer
	Checksum: 0x2BCCABD5
	Offset: 0x3C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_21eb67aa(localclientnum, value)
{
	[[ self ]]->function_21eb67aa(localclientnum, value);
}

/*
	Name: function_28ccc05d
	Namespace: zm_arcade_timer
	Checksum: 0x1251DB7B
	Offset: 0x3F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_28ccc05d(localclientnum, value)
{
	[[ self ]]->function_28ccc05d(localclientnum, value);
}

