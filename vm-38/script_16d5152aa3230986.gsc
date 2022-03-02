#using scripts\core_common\lui_shared.csc;

class class_a5d10b03 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_a5d10b03
		Checksum: 0x32030C36
		Offset: 0x2F8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_a5d10b03
		Checksum: 0xF8EC7C3A
		Offset: 0x3C8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_a5d10b03
		Checksum: 0x986DF31B
		Offset: 0x398
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
		Namespace: namespace_a5d10b03
		Checksum: 0x909E9EB7
		Offset: 0x340
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("cp_killcam");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a5d10b03
		Checksum: 0xAB8374E
		Offset: 0x318
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("cp_killcam");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_a5d10b03
		Checksum: 0xE84C49C8
		Offset: 0x368
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace cp_killcam;

/*
	Name: function_d1788081
	Namespace: cp_killcam
	Checksum: 0x5D821D98
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d1788081()
{
	level notify(1220890009);
}

/*
	Name: register
	Namespace: cp_killcam
	Checksum: 0xE8C616CE
	Offset: 0xC8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_a5d10b03();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"cp_killcam"]))
	{
		level.var_ae746e8f[#"cp_killcam"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"cp_killcam"]))
	{
		level.var_ae746e8f[#"cp_killcam"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"cp_killcam"]))
	{
		level.var_ae746e8f[#"cp_killcam"] = array(level.var_ae746e8f[#"cp_killcam"]);
	}
	level.var_ae746e8f[#"cp_killcam"][level.var_ae746e8f[#"cp_killcam"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: cp_killcam
	Checksum: 0x914B7F0F
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5c1bb138()
{
	elem = new class_a5d10b03();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: cp_killcam
	Checksum: 0xEB7BA0EC
	Offset: 0x280
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: cp_killcam
	Checksum: 0x3C077B77
	Offset: 0x2A8
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: cp_killcam
	Checksum: 0xB115C4C7
	Offset: 0x2D0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

