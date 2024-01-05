#using scripts\core_common\lui_shared.csc;

class class_302a48fc : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_302a48fc
		Checksum: 0x87CD36D2
		Offset: 0x378
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_302a48fc
		Checksum: 0x69804D56
		Offset: 0x560
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_302a48fc
		Checksum: 0xC12103C3
		Offset: 0x4C0
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
		Namespace: namespace_302a48fc
		Checksum: 0x8AB6182
		Offset: 0x420
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("vip_notify_text");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_302a48fc
		Checksum: 0xD6C7DAB5
		Offset: 0x398
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_42fe6185, alphacallback)
	{
		cluielem::setup_clientfields("vip_notify_text");
		cluielem::function_dcb34c80("string", "vipmessage", 1);
		cluielem::add_clientfield("alpha", 1, 8, "float", alphacallback);
	}

	/*
		Name: set_alpha
		Namespace: namespace_302a48fc
		Checksum: 0xF35A0FDA
		Offset: 0x528
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_alpha(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "alpha", value);
	}

	/*
		Name: set_vipmessage
		Namespace: namespace_302a48fc
		Checksum: 0xCE75A235
		Offset: 0x4F0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_vipmessage(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "vipmessage", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_302a48fc
		Checksum: 0xE697B108
		Offset: 0x448
		Size: 0x70
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "vipmessage", #"");
		[[ self ]]->set_data(localclientnum, "alpha", 0);
	}

}

#namespace vip_notify_text;

/*
	Name: register
	Namespace: vip_notify_text
	Checksum: 0x22C776B3
	Offset: 0xD8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_42fe6185, alphacallback)
{
	elem = new class_302a48fc();
	[[ elem ]]->setup_clientfields(var_42fe6185, alphacallback);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"vip_notify_text"]))
	{
		level.var_ae746e8f[#"vip_notify_text"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"vip_notify_text"]))
	{
		level.var_ae746e8f[#"vip_notify_text"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"vip_notify_text"]))
	{
		level.var_ae746e8f[#"vip_notify_text"] = array(level.var_ae746e8f[#"vip_notify_text"]);
	}
	level.var_ae746e8f[#"vip_notify_text"][level.var_ae746e8f[#"vip_notify_text"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: vip_notify_text
	Checksum: 0xE281E6A1
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_302a48fc();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: vip_notify_text
	Checksum: 0xBA367208
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
	Namespace: vip_notify_text
	Checksum: 0xFDDE7287
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
	Namespace: vip_notify_text
	Checksum: 0xEF5DFC85
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
	Name: set_vipmessage
	Namespace: vip_notify_text
	Checksum: 0x9E7325AE
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_vipmessage(localclientnum, value)
{
	[[ self ]]->set_vipmessage(localclientnum, value);
}

/*
	Name: set_alpha
	Namespace: vip_notify_text
	Checksum: 0x1242B7F9
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_alpha(localclientnum, value)
{
	[[ self ]]->set_alpha(localclientnum, value);
}

