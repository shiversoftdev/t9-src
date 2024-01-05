#using scripts\core_common\lui_shared.csc;

class csr_message_box : cluielem
{

	/*
		Name: constructor
		Namespace: csr_message_box
		Checksum: 0x4D8CCE20
		Offset: 0x348
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: csr_message_box
		Checksum: 0x8E54A456
		Offset: 0x4A8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: csr_message_box
		Checksum: 0xFA7DD94A
		Offset: 0x440
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: csr_message_box
		Checksum: 0x5D2D3ED5
		Offset: 0x3C0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("sr_message_box");
	}

	/*
		Name: set_messagebox
		Namespace: csr_message_box
		Checksum: 0xC655DBC9
		Offset: 0x470
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_messagebox(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "messagebox", value);
	}

	/*
		Name: setup_clientfields
		Namespace: csr_message_box
		Checksum: 0x287AE7D7
		Offset: 0x368
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_50fe5991)
	{
		cluielem::setup_clientfields("sr_message_box");
		cluielem::function_dcb34c80("string", "messagebox", 1);
	}

	/*
		Name: function_fa582112
		Namespace: csr_message_box
		Checksum: 0xB2E61558
		Offset: 0x3E8
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "messagebox", #"");
	}

}

#namespace sr_message_box;

/*
	Name: function_8d8b21ed
	Namespace: sr_message_box
	Checksum: 0xC6F0D8F3
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8d8b21ed()
{
	level notify(704797317);
}

/*
	Name: register
	Namespace: sr_message_box
	Checksum: 0x81F7165E
	Offset: 0xE0
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function register(var_50fe5991)
{
	elem = new csr_message_box();
	[[ elem ]]->setup_clientfields(var_50fe5991);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"sr_message_box"]))
	{
		level.var_ae746e8f[#"sr_message_box"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"sr_message_box"]))
	{
		level.var_ae746e8f[#"sr_message_box"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"sr_message_box"]))
	{
		level.var_ae746e8f[#"sr_message_box"] = array(level.var_ae746e8f[#"sr_message_box"]);
	}
	level.var_ae746e8f[#"sr_message_box"][level.var_ae746e8f[#"sr_message_box"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: sr_message_box
	Checksum: 0x4D077C00
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new csr_message_box();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: sr_message_box
	Checksum: 0xAB7C1ABF
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
	Namespace: sr_message_box
	Checksum: 0x2C2BB37
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
	Namespace: sr_message_box
	Checksum: 0x71B19878
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
	Name: set_messagebox
	Namespace: sr_message_box
	Checksum: 0x4A457B7A
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_messagebox(localclientnum, value)
{
	[[ self ]]->set_messagebox(localclientnum, value);
}

