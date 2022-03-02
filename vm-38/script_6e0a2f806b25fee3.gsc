#using scripts\core_common\lui_shared.csc;

class class_44eccfcc : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_44eccfcc
		Checksum: 0x5E50A76D
		Offset: 0x338
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_44eccfcc
		Checksum: 0x339DE60F
		Offset: 0x488
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_44eccfcc
		Checksum: 0x417F4CCE
		Offset: 0x420
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
		Namespace: namespace_44eccfcc
		Checksum: 0x148641E6
		Offset: 0x3B0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("stim_count");
	}

	/*
		Name: function_6eef7f4f
		Namespace: namespace_44eccfcc
		Checksum: 0x112F9112
		Offset: 0x450
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_6eef7f4f(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "stim_count", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_44eccfcc
		Checksum: 0xF2D9FEBC
		Offset: 0x358
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_ce21941e)
	{
		namespace_6aaccc24::setup_clientfields("stim_count");
		namespace_6aaccc24::function_da693cbe("stim_count", 1, 4, "int", var_ce21941e);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_44eccfcc
		Checksum: 0xE1BB4100
		Offset: 0x3D8
		Size: 0x40
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "stim_count", 0);
	}

}

#namespace stim_count;

/*
	Name: function_eecb95b9
	Namespace: stim_count
	Checksum: 0x88969D09
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eecb95b9()
{
	level notify(1900106514);
}

/*
	Name: register
	Namespace: stim_count
	Checksum: 0x26A5BACD
	Offset: 0xD0
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_ce21941e)
{
	elem = new class_44eccfcc();
	[[ elem ]]->setup_clientfields(var_ce21941e);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"stim_count"]))
	{
		level.var_ae746e8f[#"stim_count"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"stim_count"]))
	{
		level.var_ae746e8f[#"stim_count"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"stim_count"]))
	{
		level.var_ae746e8f[#"stim_count"] = array(level.var_ae746e8f[#"stim_count"]);
	}
	level.var_ae746e8f[#"stim_count"][level.var_ae746e8f[#"stim_count"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: stim_count
	Checksum: 0x46CF1619
	Offset: 0x250
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_44eccfcc();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: stim_count
	Checksum: 0x4DA297E1
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
	Namespace: stim_count
	Checksum: 0xC510C8A8
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
	Namespace: stim_count
	Checksum: 0xE65CAC88
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
	Name: function_6eef7f4f
	Namespace: stim_count
	Checksum: 0xCAFD7303
	Offset: 0x308
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6eef7f4f(localclientnum, value)
{
	[[ self ]]->function_6eef7f4f(localclientnum, value);
}

