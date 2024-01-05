#using scripts\core_common\lui_shared.csc;

class cinsertion_passenger_count : cluielem
{

	/*
		Name: constructor
		Namespace: cinsertion_passenger_count
		Checksum: 0x5E50A76D
		Offset: 0x350
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cinsertion_passenger_count
		Checksum: 0x339DE60F
		Offset: 0x4A0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cinsertion_passenger_count
		Checksum: 0x417F4CCE
		Offset: 0x438
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
		Namespace: cinsertion_passenger_count
		Checksum: 0x148641E6
		Offset: 0x3C8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("insertion_passenger_count");
	}

	/*
		Name: setup_clientfields
		Namespace: cinsertion_passenger_count
		Checksum: 0xEAFAE332
		Offset: 0x370
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_fbcc4763)
	{
		cluielem::setup_clientfields("insertion_passenger_count");
		cluielem::add_clientfield("count", 1, 7, "int", var_fbcc4763);
	}

	/*
		Name: set_count
		Namespace: cinsertion_passenger_count
		Checksum: 0xB58457C0
		Offset: 0x468
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "count", value);
	}

	/*
		Name: function_fa582112
		Namespace: cinsertion_passenger_count
		Checksum: 0x451087D2
		Offset: 0x3F0
		Size: 0x40
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "count", 0);
	}

}

#namespace insertion_passenger_count;

/*
	Name: function_3f248e68
	Namespace: insertion_passenger_count
	Checksum: 0x68AFD0E3
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3f248e68()
{
	level notify(-542870290);
}

/*
	Name: register
	Namespace: insertion_passenger_count
	Checksum: 0x3F1D3FCC
	Offset: 0xE8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_fbcc4763)
{
	elem = new cinsertion_passenger_count();
	[[ elem ]]->setup_clientfields(var_fbcc4763);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"insertion_passenger_count"]))
	{
		level.var_ae746e8f[#"insertion_passenger_count"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"insertion_passenger_count"]))
	{
		level.var_ae746e8f[#"insertion_passenger_count"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"insertion_passenger_count"]))
	{
		level.var_ae746e8f[#"insertion_passenger_count"] = array(level.var_ae746e8f[#"insertion_passenger_count"]);
	}
	level.var_ae746e8f[#"insertion_passenger_count"][level.var_ae746e8f[#"insertion_passenger_count"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: insertion_passenger_count
	Checksum: 0xFF73BDE7
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cinsertion_passenger_count();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: insertion_passenger_count
	Checksum: 0x4DA297E1
	Offset: 0x2A8
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
	Namespace: insertion_passenger_count
	Checksum: 0xC510C8A8
	Offset: 0x2D0
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
	Namespace: insertion_passenger_count
	Checksum: 0xE65CAC88
	Offset: 0x2F8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_count
	Namespace: insertion_passenger_count
	Checksum: 0xC2F8A816
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_count(localclientnum, value)
{
	[[ self ]]->set_count(localclientnum, value);
}

