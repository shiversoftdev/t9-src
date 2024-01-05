#using scripts\core_common\lui_shared.csc;

class class_302a48fc : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_302a48fc
		Checksum: 0x1960C899
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
		Namespace: namespace_302a48fc
		Checksum: 0xC81AF1F5
		Offset: 0x580
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
		Checksum: 0x1BE3FF26
		Offset: 0x4E0
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
		Checksum: 0x7B6100C6
		Offset: 0x440
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
		Checksum: 0x9495963B
		Offset: 0x3B8
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
		Checksum: 0x335075BD
		Offset: 0x548
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
		Checksum: 0x9CE4921C
		Offset: 0x510
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
		Checksum: 0x2F1D2A0
		Offset: 0x468
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
	Name: function_b0d0cb22
	Namespace: vip_notify_text
	Checksum: 0x5702F2D5
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b0d0cb22()
{
	level notify(1373082955);
}

/*
	Name: register
	Namespace: vip_notify_text
	Checksum: 0x4E9D231A
	Offset: 0xF8
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
	Checksum: 0xD8E5E46F
	Offset: 0x280
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
	Checksum: 0x238AEE51
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
	Namespace: vip_notify_text
	Checksum: 0x8B7A0CFD
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
	Namespace: vip_notify_text
	Checksum: 0xD6E52D15
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
	Name: set_vipmessage
	Namespace: vip_notify_text
	Checksum: 0x25925311
	Offset: 0x338
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
	Checksum: 0xC9C6C398
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_alpha(localclientnum, value)
{
	[[ self ]]->set_alpha(localclientnum, value);
}

