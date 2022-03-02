#using scripts\core_common\lui_shared.csc;

class class_98cc868d : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_98cc868d
		Checksum: 0xBB65DC80
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
		Namespace: namespace_98cc868d
		Checksum: 0x71CD51E9
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
		Namespace: namespace_98cc868d
		Checksum: 0xF54F69E6
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
		Namespace: namespace_98cc868d
		Checksum: 0xE5AF2DF8
		Offset: 0x348
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
		Checksum: 0x3D3893E5
		Offset: 0x320
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
		Checksum: 0x2AB1DBF
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

#namespace pitch_and_yaw_meters;

/*
	Name: function_ac04f379
	Namespace: pitch_and_yaw_meters
	Checksum: 0xF79E827B
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ac04f379()
{
	level notify(1883405350);
}

/*
	Name: register
	Namespace: pitch_and_yaw_meters
	Checksum: 0x8DA2D3F1
	Offset: 0xD0
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
	Checksum: 0xF39ECB5A
	Offset: 0x248
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
	Checksum: 0x558D1EA5
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
	Namespace: pitch_and_yaw_meters
	Checksum: 0x93D9ED5
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
	Namespace: pitch_and_yaw_meters
	Checksum: 0xACF5DAC4
	Offset: 0x2D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

