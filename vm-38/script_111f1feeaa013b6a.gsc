#using scripts\core_common\lui_shared.csc;

class class_81599b35 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_81599b35
		Checksum: 0x26E17531
		Offset: 0x2F8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_81599b35
		Checksum: 0xBFC01C44
		Offset: 0x3C8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_81599b35
		Checksum: 0x4B0E20F4
		Offset: 0x398
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
		Namespace: namespace_81599b35
		Checksum: 0xE0F80EA9
		Offset: 0x340
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("BountyHunterBuy");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_81599b35
		Checksum: 0x64E42663
		Offset: 0x318
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("BountyHunterBuy");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_81599b35
		Checksum: 0xA42DB578
		Offset: 0x368
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace bountyhunterbuy;

/*
	Name: function_ab238524
	Namespace: bountyhunterbuy
	Checksum: 0x62625ED3
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ab238524()
{
	level notify(727646002);
}

/*
	Name: register
	Namespace: bountyhunterbuy
	Checksum: 0x4991C046
	Offset: 0xC8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_81599b35();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"bountyhunterbuy"]))
	{
		level.var_ae746e8f[#"bountyhunterbuy"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"bountyhunterbuy"]))
	{
		level.var_ae746e8f[#"bountyhunterbuy"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"bountyhunterbuy"]))
	{
		level.var_ae746e8f[#"bountyhunterbuy"] = array(level.var_ae746e8f[#"bountyhunterbuy"]);
	}
	level.var_ae746e8f[#"bountyhunterbuy"][level.var_ae746e8f[#"bountyhunterbuy"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: bountyhunterbuy
	Checksum: 0x26BEC83B
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_81599b35();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: bountyhunterbuy
	Checksum: 0xB727132C
	Offset: 0x280
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
	Namespace: bountyhunterbuy
	Checksum: 0x145E7A8E
	Offset: 0x2A8
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
	Namespace: bountyhunterbuy
	Checksum: 0xC3C0519B
	Offset: 0x2D0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

