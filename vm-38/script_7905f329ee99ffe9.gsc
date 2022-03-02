#using scripts\core_common\lui_shared.csc;

class class_c3742963 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_c3742963
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
		Namespace: namespace_c3742963
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
		Namespace: namespace_c3742963
		Checksum: 0xFA05E85E
		Offset: 0x4D0
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
		Namespace: namespace_c3742963
		Checksum: 0x9B84CCE1
		Offset: 0x440
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("consequences_notification");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_c3742963
		Checksum: 0x4A534592
		Offset: 0x3B8
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_6ad1a3bb, var_b8233aa2)
	{
		namespace_6aaccc24::setup_clientfields("consequences_notification");
		namespace_6aaccc24::function_da693cbe("visible", 1, 1, "int", var_6ad1a3bb);
		namespace_6aaccc24::function_da693cbe("content_index", 1, 4, "int", var_b8233aa2);
	}

	/*
		Name: function_afdd9f65
		Namespace: namespace_c3742963
		Checksum: 0x1C9AFCD8
		Offset: 0x538
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_afdd9f65(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "content_index", value);
	}

	/*
		Name: set_visible
		Namespace: namespace_c3742963
		Checksum: 0x1AADBC89
		Offset: 0x500
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_visible(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "visible", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_c3742963
		Checksum: 0xD9B789AA
		Offset: 0x468
		Size: 0x5C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "visible", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "content_index", 0);
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
	elem = new class_c3742963();
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
	Name: function_5c1bb138
	Namespace: consequences_notification
	Checksum: 0x2CCA6B68
	Offset: 0x280
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_c3742963();
	[[ elem ]]->function_5c1bb138();
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
	Name: function_afdd9f65
	Namespace: consequences_notification
	Checksum: 0x277B375A
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_afdd9f65(localclientnum, value)
{
	[[ self ]]->function_afdd9f65(localclientnum, value);
}

