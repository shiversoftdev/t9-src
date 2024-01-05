#using scripts\core_common\lui_shared.csc;

class cmulti_stage_target_lockon : cluielem
{

	/*
		Name: constructor
		Namespace: cmulti_stage_target_lockon
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
		Namespace: cmulti_stage_target_lockon
		Checksum: 0xD88C065
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
		Namespace: cmulti_stage_target_lockon
		Checksum: 0x937D5049
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
		Namespace: cmulti_stage_target_lockon
		Checksum: 0xEE876AC
		Offset: 0x440
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
		Checksum: 0x22170E32
		Offset: 0x3B8
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
		Checksum: 0xC0E33A95
		Offset: 0x500
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
		Checksum: 0xAD92902C
		Offset: 0x538
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
		Checksum: 0xEF55D824
		Offset: 0x468
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
	Name: function_8e7d9db3
	Namespace: multi_stage_target_lockon
	Checksum: 0xC4ADB3C1
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8e7d9db3()
{
	level notify(-1237686118);
}

/*
	Name: register
	Namespace: multi_stage_target_lockon
	Checksum: 0xBEF26D36
	Offset: 0xF8
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
	Checksum: 0x1BBB880E
	Offset: 0x280
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
	Namespace: multi_stage_target_lockon
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
	Namespace: multi_stage_target_lockon
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
	Name: set_entnum
	Namespace: multi_stage_target_lockon
	Checksum: 0x1182FCA5
	Offset: 0x338
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
	Checksum: 0x99C5FA56
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_targetstate(localclientnum, value)
{
	[[ self ]]->set_targetstate(localclientnum, value);
}

