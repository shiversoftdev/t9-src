#using scripts\core_common\lui_shared.csc;

class class_a19c3039 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_a19c3039
		Checksum: 0x6847223E
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_a19c3039
		Checksum: 0xD1288E34
		Offset: 0x3D0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_a19c3039
		Checksum: 0x6F7D0D69
		Offset: 0x3A0
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
		Namespace: namespace_a19c3039
		Checksum: 0xF9C8F613
		Offset: 0x348
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("sr_perk_machine_choice");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a19c3039
		Checksum: 0x23DE0498
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("sr_perk_machine_choice");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_a19c3039
		Checksum: 0xBF81C59
		Offset: 0x370
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace sr_perk_machine_choice;

/*
	Name: function_249bd9e7
	Namespace: sr_perk_machine_choice
	Checksum: 0xDB250B66
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_249bd9e7()
{
	level notify(711085007);
}

/*
	Name: register
	Namespace: sr_perk_machine_choice
	Checksum: 0x770955A1
	Offset: 0xD0
	Size: 0x16E
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_a19c3039();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"sr_perk_machine_choice"]))
	{
		level.var_ae746e8f[#"sr_perk_machine_choice"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"sr_perk_machine_choice"]))
	{
		level.var_ae746e8f[#"sr_perk_machine_choice"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"sr_perk_machine_choice"]))
	{
		level.var_ae746e8f[#"sr_perk_machine_choice"] = array(level.var_ae746e8f[#"sr_perk_machine_choice"]);
	}
	level.var_ae746e8f[#"sr_perk_machine_choice"][level.var_ae746e8f[#"sr_perk_machine_choice"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: sr_perk_machine_choice
	Checksum: 0x5257BA30
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_a19c3039();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: sr_perk_machine_choice
	Checksum: 0x4C92B014
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
	Namespace: sr_perk_machine_choice
	Checksum: 0x9DE286F
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
	Namespace: sr_perk_machine_choice
	Checksum: 0xC32F1927
	Offset: 0x2D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

