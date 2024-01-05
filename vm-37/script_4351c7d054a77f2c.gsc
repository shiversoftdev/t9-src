#using scripts\core_common\lui_shared.csc;

class cspectrerisingindicator : cluielem
{

	/*
		Name: constructor
		Namespace: cspectrerisingindicator
		Checksum: 0x2EE5231B
		Offset: 0x370
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cspectrerisingindicator
		Checksum: 0xB346BBB4
		Offset: 0x548
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cspectrerisingindicator
		Checksum: 0x56446C04
		Offset: 0x4A8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_clientnum
		Namespace: cspectrerisingindicator
		Checksum: 0x62D0AC17
		Offset: 0x4D8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_clientnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "clientnum", value);
	}

	/*
		Name: register_clientside
		Namespace: cspectrerisingindicator
		Checksum: 0x6AFF355C
		Offset: 0x418
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("SpectreRisingIndicator");
	}

	/*
		Name: set_isalive
		Namespace: cspectrerisingindicator
		Checksum: 0xF7B78509
		Offset: 0x510
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_isalive(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "isAlive", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cspectrerisingindicator
		Checksum: 0xA5C7B0AA
		Offset: 0x390
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_c05c67e2, var_f25b9f45)
	{
		cluielem::setup_clientfields("SpectreRisingIndicator");
		cluielem::add_clientfield("clientnum", 1, 7, "int", var_c05c67e2);
		cluielem::add_clientfield("isAlive", 1, 1, "int", var_f25b9f45);
	}

	/*
		Name: function_fa582112
		Namespace: cspectrerisingindicator
		Checksum: 0xAB3C65CC
		Offset: 0x440
		Size: 0x5C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "clientnum", 0);
		[[ self ]]->set_data(localclientnum, "isAlive", 0);
	}

}

#namespace spectrerisingindicator;

/*
	Name: register
	Namespace: spectrerisingindicator
	Checksum: 0x4897D6C5
	Offset: 0xD0
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_c05c67e2, var_f25b9f45)
{
	elem = new cspectrerisingindicator();
	[[ elem ]]->setup_clientfields(var_c05c67e2, var_f25b9f45);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"spectrerisingindicator"]))
	{
		level.var_ae746e8f[#"spectrerisingindicator"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"spectrerisingindicator"]))
	{
		level.var_ae746e8f[#"spectrerisingindicator"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"spectrerisingindicator"]))
	{
		level.var_ae746e8f[#"spectrerisingindicator"] = array(level.var_ae746e8f[#"spectrerisingindicator"]);
	}
	level.var_ae746e8f[#"spectrerisingindicator"][level.var_ae746e8f[#"spectrerisingindicator"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: spectrerisingindicator
	Checksum: 0xDB487120
	Offset: 0x258
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cspectrerisingindicator();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: spectrerisingindicator
	Checksum: 0x2452FC06
	Offset: 0x298
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
	Namespace: spectrerisingindicator
	Checksum: 0xFE1506A9
	Offset: 0x2C0
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
	Namespace: spectrerisingindicator
	Checksum: 0xC80CA57E
	Offset: 0x2E8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_clientnum
	Namespace: spectrerisingindicator
	Checksum: 0xDE9B9FCB
	Offset: 0x310
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clientnum(localclientnum, value)
{
	[[ self ]]->set_clientnum(localclientnum, value);
}

/*
	Name: set_isalive
	Namespace: spectrerisingindicator
	Checksum: 0xFC16762
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_isalive(localclientnum, value)
{
	[[ self ]]->set_isalive(localclientnum, value);
}

