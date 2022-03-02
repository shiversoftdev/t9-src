#using scripts\core_common\lui_shared.csc;

class class_98cc868d : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_98cc868d
		Checksum: 0x5C6AB231
		Offset: 0x2E0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_98cc868d
		Checksum: 0x80766766
		Offset: 0x3B0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_98cc868d
		Checksum: 0xCEEF7441
		Offset: 0x380
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
		Namespace: namespace_98cc868d
		Checksum: 0x617C8470
		Offset: 0x328
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("pitch_and_yaw_meters");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_98cc868d
		Checksum: 0xADB8C0C5
		Offset: 0x300
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("pitch_and_yaw_meters");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_98cc868d
		Checksum: 0xD81F24F4
		Offset: 0x350
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace pitch_and_yaw_meters;

/*
	Name: register
	Namespace: pitch_and_yaw_meters
	Checksum: 0xFF503212
	Offset: 0xB0
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_98cc868d();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"pitch_and_yaw_meters"]))
	{
		level.var_ae746e8f[#"pitch_and_yaw_meters"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"pitch_and_yaw_meters"]))
	{
		level.var_ae746e8f[#"pitch_and_yaw_meters"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"pitch_and_yaw_meters"]))
	{
		level.var_ae746e8f[#"pitch_and_yaw_meters"] = array(level.var_ae746e8f[#"pitch_and_yaw_meters"]);
	}
	level.var_ae746e8f[#"pitch_and_yaw_meters"][level.var_ae746e8f[#"pitch_and_yaw_meters"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: pitch_and_yaw_meters
	Checksum: 0x217BEB73
	Offset: 0x228
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_98cc868d();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: pitch_and_yaw_meters
	Checksum: 0x28694F0D
	Offset: 0x268
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
	Namespace: pitch_and_yaw_meters
	Checksum: 0xEFA602C
	Offset: 0x290
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
	Namespace: pitch_and_yaw_meters
	Checksum: 0x8CF1D0B9
	Offset: 0x2B8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

