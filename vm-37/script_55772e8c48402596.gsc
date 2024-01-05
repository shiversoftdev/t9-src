#using scripts\core_common\lui_shared.csc;

class csr_message_box : cluielem
{

	/*
		Name: constructor
		Namespace: csr_message_box
		Checksum: 0x8B23F4C
		Offset: 0x328
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: csr_message_box
		Checksum: 0x8A460354
		Offset: 0x488
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: csr_message_box
		Checksum: 0x7705ECE4
		Offset: 0x420
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: csr_message_box
		Checksum: 0xC6264817
		Offset: 0x3A0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("sr_message_box");
	}

	/*
		Name: set_messagebox
		Namespace: csr_message_box
		Checksum: 0x7E527D55
		Offset: 0x450
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_messagebox(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "messagebox", value);
	}

	/*
		Name: setup_clientfields
		Namespace: csr_message_box
		Checksum: 0x2CBB48C3
		Offset: 0x348
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_50fe5991)
	{
		cluielem::setup_clientfields("sr_message_box");
		cluielem::function_dcb34c80("string", "messagebox", 1);
	}

	/*
		Name: function_fa582112
		Namespace: csr_message_box
		Checksum: 0x9EC4DC03
		Offset: 0x3C8
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "messagebox", #"");
	}

}

#namespace sr_message_box;

/*
	Name: register
	Namespace: sr_message_box
	Checksum: 0x75BA5192
	Offset: 0xC0
	Size: 0x176
	Parameters: 1
	Flags: None
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
	Checksum: 0xFCF0EDC0
	Offset: 0x240
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
	Checksum: 0xA013B51C
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
	Namespace: sr_message_box
	Checksum: 0x26818F9B
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
	Namespace: sr_message_box
	Checksum: 0x4631A662
	Offset: 0x2D0
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
	Checksum: 0xC88C1164
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_messagebox(localclientnum, value)
{
	[[ self ]]->set_messagebox(localclientnum, value);
}

