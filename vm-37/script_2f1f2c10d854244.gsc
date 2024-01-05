#using scripts\core_common\lui_shared.csc;

class cmulti_stage_friendly_lockon : cluielem
{

	/*
		Name: constructor
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0xD444D2CE
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
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0xBDB561EA
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
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0x69DC604E
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
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0x85CBB6EF
		Offset: 0x420
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("multi_stage_friendly_lockon");
	}

	/*
		Name: setup_clientfields
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0x9930CDD
		Offset: 0x398
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_5a7b4b38, var_29786c92)
	{
		cluielem::setup_clientfields("multi_stage_friendly_lockon");
		cluielem::add_clientfield("entNum", 1, 10, "int", var_5a7b4b38);
		cluielem::add_clientfield("targetState", 1, 3, "int", var_29786c92);
	}

	/*
		Name: set_entnum
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0x9E87E225
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
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0xCAC42EA4
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
		Namespace: cmulti_stage_friendly_lockon
		Checksum: 0x905135D0
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

#namespace multi_stage_friendly_lockon;

/*
	Name: register
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x8D6D9DB9
	Offset: 0xD8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_5a7b4b38, var_29786c92)
{
	elem = new cmulti_stage_friendly_lockon();
	[[ elem ]]->setup_clientfields(var_5a7b4b38, var_29786c92);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"multi_stage_friendly_lockon"]))
	{
		level.var_ae746e8f[#"multi_stage_friendly_lockon"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"multi_stage_friendly_lockon"]))
	{
		level.var_ae746e8f[#"multi_stage_friendly_lockon"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"multi_stage_friendly_lockon"]))
	{
		level.var_ae746e8f[#"multi_stage_friendly_lockon"] = array(level.var_ae746e8f[#"multi_stage_friendly_lockon"]);
	}
	level.var_ae746e8f[#"multi_stage_friendly_lockon"][level.var_ae746e8f[#"multi_stage_friendly_lockon"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x153F1750
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cmulti_stage_friendly_lockon();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x4F0ADB9F
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xCDB1A4BB
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x72821333
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xCFAFB215
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xC62E9204
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_targetstate(localclientnum, value)
{
	[[ self ]]->set_targetstate(localclientnum, value);
}

