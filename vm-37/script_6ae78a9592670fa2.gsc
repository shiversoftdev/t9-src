#using scripts\core_common\lui_shared.csc;

class cmulti_stage_target_lockon : cluielem
{

	/*
		Name: constructor
		Namespace: cmulti_stage_target_lockon
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
		Namespace: cmulti_stage_target_lockon
		Checksum: 0xCE724089
		Offset: 0x550
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cmulti_stage_target_lockon
		Checksum: 0x5C169F4B
		Offset: 0x4B0
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
		Namespace: cmulti_stage_target_lockon
		Checksum: 0x23ABFFF5
		Offset: 0x420
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("multi_stage_target_lockon");
	}

	/*
		Name: setup_clientfields
		Namespace: cmulti_stage_target_lockon
		Checksum: 0x98BF84A7
		Offset: 0x398
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_5a7b4b38, var_29786c92)
	{
		cluielem::setup_clientfields("multi_stage_target_lockon");
		cluielem::add_clientfield("entNum", 1, 6, "int", var_5a7b4b38);
		cluielem::add_clientfield("targetState", 1, 3, "int", var_29786c92);
	}

	/*
		Name: set_entnum
		Namespace: cmulti_stage_target_lockon
		Checksum: 0x70C48F59
		Offset: 0x4E0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_entnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "entNum", value);
	}

	/*
		Name: set_targetstate
		Namespace: cmulti_stage_target_lockon
		Checksum: 0xEE176643
		Offset: 0x518
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_targetstate(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "targetState", value);
	}

	/*
		Name: function_fa582112
		Namespace: cmulti_stage_target_lockon
		Checksum: 0x1B74EB94
		Offset: 0x448
		Size: 0x5C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "entNum", 0);
		[[ self ]]->set_data(localclientnum, "targetState", 0);
	}

}

#namespace multi_stage_target_lockon;

/*
	Name: register
	Namespace: multi_stage_target_lockon
	Checksum: 0xD2A8389F
	Offset: 0xD8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_5a7b4b38, var_29786c92)
{
	elem = new cmulti_stage_target_lockon();
	[[ elem ]]->setup_clientfields(var_5a7b4b38, var_29786c92);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"multi_stage_target_lockon"]))
	{
		level.var_ae746e8f[#"multi_stage_target_lockon"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"multi_stage_target_lockon"]))
	{
		level.var_ae746e8f[#"multi_stage_target_lockon"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"multi_stage_target_lockon"]))
	{
		level.var_ae746e8f[#"multi_stage_target_lockon"] = array(level.var_ae746e8f[#"multi_stage_target_lockon"]);
	}
	level.var_ae746e8f[#"multi_stage_target_lockon"][level.var_ae746e8f[#"multi_stage_target_lockon"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: multi_stage_target_lockon
	Checksum: 0x21DF8AC0
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cmulti_stage_target_lockon();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: multi_stage_target_lockon
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
	Namespace: multi_stage_target_lockon
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
	Namespace: multi_stage_target_lockon
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
	Name: set_entnum
	Namespace: multi_stage_target_lockon
	Checksum: 0xAA638A1A
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entnum(localclientnum, value)
{
	[[ self ]]->set_entnum(localclientnum, value);
}

/*
	Name: set_targetstate
	Namespace: multi_stage_target_lockon
	Checksum: 0x42418E37
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_targetstate(localclientnum, value)
{
	[[ self ]]->set_targetstate(localclientnum, value);
}

