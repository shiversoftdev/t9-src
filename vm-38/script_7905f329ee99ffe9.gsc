#using scripts\core_common\lui_shared.csc;

class cconsequences_notification : cluielem
{

	/*
		Name: constructor
		Namespace: cconsequences_notification
		Checksum: 0x1E1925B6
		Offset: 0x398
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cconsequences_notification
		Checksum: 0x39638178
		Offset: 0x570
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cconsequences_notification
		Checksum: 0xFA05E85E
		Offset: 0x4D0
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
		Namespace: cconsequences_notification
		Checksum: 0x9B84CCE1
		Offset: 0x440
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("consequences_notification");
	}

	/*
		Name: setup_clientfields
		Namespace: cconsequences_notification
		Checksum: 0x4A534592
		Offset: 0x3B8
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_6ad1a3bb, var_b8233aa2)
	{
		cluielem::setup_clientfields("consequences_notification");
		cluielem::add_clientfield("visible", 1, 1, "int", var_6ad1a3bb);
		cluielem::add_clientfield("content_index", 1, 4, "int", var_b8233aa2);
	}

	/*
		Name: set_content_index
		Namespace: cconsequences_notification
		Checksum: 0x1C9AFCD8
		Offset: 0x538
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_content_index(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "content_index", value);
	}

	/*
		Name: set_visible
		Namespace: cconsequences_notification
		Checksum: 0x1AADBC89
		Offset: 0x500
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_visible(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "visible", value);
	}

	/*
		Name: function_fa582112
		Namespace: cconsequences_notification
		Checksum: 0xD9B789AA
		Offset: 0x468
		Size: 0x5C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "visible", 0);
		[[ self ]]->set_data(localclientnum, "content_index", 0);
	}

}

#namespace consequences_notification;

/*
	Name: function_36509825
	Namespace: consequences_notification
	Checksum: 0x3512BFD
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_36509825()
{
	level notify(2063022085);
}

/*
	Name: register
	Namespace: consequences_notification
	Checksum: 0xBC5FFDCC
	Offset: 0xF8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_6ad1a3bb, var_b8233aa2)
{
	elem = new cconsequences_notification();
	[[ elem ]]->setup_clientfields(var_6ad1a3bb, var_b8233aa2);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"consequences_notification"]))
	{
		level.var_ae746e8f[#"consequences_notification"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"consequences_notification"]))
	{
		level.var_ae746e8f[#"consequences_notification"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"consequences_notification"]))
	{
		level.var_ae746e8f[#"consequences_notification"] = array(level.var_ae746e8f[#"consequences_notification"]);
	}
	level.var_ae746e8f[#"consequences_notification"][level.var_ae746e8f[#"consequences_notification"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: consequences_notification
	Checksum: 0x2CCA6B68
	Offset: 0x280
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cconsequences_notification();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: consequences_notification
	Checksum: 0x30C153CC
	Offset: 0x2C0
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
	Namespace: consequences_notification
	Checksum: 0x5DBF26A
	Offset: 0x2E8
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
	Namespace: consequences_notification
	Checksum: 0xF8480F91
	Offset: 0x310
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_visible
	Namespace: consequences_notification
	Checksum: 0x130742C3
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_visible(localclientnum, value)
{
	[[ self ]]->set_visible(localclientnum, value);
}

/*
	Name: set_content_index
	Namespace: consequences_notification
	Checksum: 0x277B375A
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_content_index(localclientnum, value)
{
	[[ self ]]->set_content_index(localclientnum, value);
}

