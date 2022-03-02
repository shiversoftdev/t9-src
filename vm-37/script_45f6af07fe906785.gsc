#using scripts\core_common\lui_shared.csc;

class class_e22be003 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_e22be003
		Checksum: 0xDE687CD8
		Offset: 0x528
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_e22be003
		Checksum: 0x198BB85E
		Offset: 0xAF0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_e22be003
		Checksum: 0x2D32541D
		Offset: 0x840
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_2a0b1f84
		Namespace: namespace_e22be003
		Checksum: 0xC26713A
		Offset: 0x950
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_2a0b1f84(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "score3Points", value);
	}

	/*
		Name: function_4b3ad4c4
		Namespace: namespace_e22be003
		Checksum: 0x34776AE8
		Offset: 0x8A8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_4b3ad4c4(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "scorePoints", value);
	}

	/*
		Name: function_4b560c24
		Namespace: namespace_e22be003
		Checksum: 0x48E21398
		Offset: 0x870
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_4b560c24(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "scoreText", value);
	}

	/*
		Name: function_4bfdafeb
		Namespace: namespace_e22be003
		Checksum: 0x585097F1
		Offset: 0xA78
		Size: 0x6C
		Parameters: 1
		Flags: None
	*/
	function function_4bfdafeb(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "moveorb");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "moveorb", new_val);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_e22be003
		Checksum: 0x3016AACE
		Offset: 0x6F0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("mp_gamemode_onslaught_score_msg");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_e22be003
		Checksum: 0x2D6BBC06
		Offset: 0x548
		Size: 0x19C
		Parameters: 8
		Flags: None
	*/
	function setup_clientfields(var_ae3230db, var_3b37d9b6, var_edd1ee8c, var_215262d5, var_964ac54, var_a286206c, var_aaae2990, var_43f41525)
	{
		namespace_6aaccc24::setup_clientfields("mp_gamemode_onslaught_score_msg");
		namespace_6aaccc24::function_dcb34c80("string", "scoreText", 1);
		namespace_6aaccc24::function_da693cbe("scorePoints", 1, 11, "int", var_edd1ee8c);
		namespace_6aaccc24::function_dcb34c80("string", "score2Text", 1);
		namespace_6aaccc24::function_da693cbe("score2Points", 1, 11, "int", var_215262d5);
		namespace_6aaccc24::function_da693cbe("score3Points", 1, 8, "int", var_964ac54);
		namespace_6aaccc24::function_da693cbe("powerup", 1, 1, "counter", var_a286206c);
		namespace_6aaccc24::function_da693cbe("lowpower", 1, 1, "counter", var_aaae2990);
		namespace_6aaccc24::function_da693cbe("moveorb", 1, 1, "counter", var_43f41525);
	}

	/*
		Name: function_94b2b0bd
		Namespace: namespace_e22be003
		Checksum: 0xCAB85A52
		Offset: 0x988
		Size: 0x6C
		Parameters: 1
		Flags: None
	*/
	function function_94b2b0bd(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "powerup");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "powerup", new_val);
	}

	/*
		Name: function_955431ec
		Namespace: namespace_e22be003
		Checksum: 0x8F606696
		Offset: 0x918
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_955431ec(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "score2Points", value);
	}

	/*
		Name: function_d74c17ab
		Namespace: namespace_e22be003
		Checksum: 0x1E219D3E
		Offset: 0xA00
		Size: 0x6C
		Parameters: 1
		Flags: None
	*/
	function function_d74c17ab(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "lowpower");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "lowpower", new_val);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_e22be003
		Checksum: 0x26DB4532
		Offset: 0x718
		Size: 0x120
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "scoreText", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "scorePoints", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "score2Text", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "score2Points", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "score3Points", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "powerup", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "lowpower", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "moveorb", 0);
	}

	/*
		Name: function_fc075317
		Namespace: namespace_e22be003
		Checksum: 0x669C0C0A
		Offset: 0x8E0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_fc075317(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "score2Text", value);
	}

}

#namespace mp_gamemode_onslaught_score_msg;

/*
	Name: register
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0xCDB5530F
	Offset: 0x140
	Size: 0x1BE
	Parameters: 8
	Flags: None
*/
function register(var_ae3230db, var_3b37d9b6, var_edd1ee8c, var_215262d5, var_964ac54, var_a286206c, var_aaae2990, var_43f41525)
{
	elem = new class_e22be003();
	[[ elem ]]->setup_clientfields(var_ae3230db, var_3b37d9b6, var_edd1ee8c, var_215262d5, var_964ac54, var_a286206c, var_aaae2990, var_43f41525);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_gamemode_onslaught_score_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_score_msg"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_gamemode_onslaught_score_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_score_msg"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_gamemode_onslaught_score_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_score_msg"] = array(level.var_ae746e8f[#"mp_gamemode_onslaught_score_msg"]);
	}
	level.var_ae746e8f[#"mp_gamemode_onslaught_score_msg"][level.var_ae746e8f[#"mp_gamemode_onslaught_score_msg"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x58340DBC
	Offset: 0x308
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_e22be003();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x6FA091F9
	Offset: 0x348
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
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x29032769
	Offset: 0x370
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
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x77CE0824
	Offset: 0x398
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_4b560c24
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x31106368
	Offset: 0x3C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4b560c24(localclientnum, value)
{
	[[ self ]]->function_4b560c24(localclientnum, value);
}

/*
	Name: function_4b3ad4c4
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x1D0E04DB
	Offset: 0x3F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4b3ad4c4(localclientnum, value)
{
	[[ self ]]->function_4b3ad4c4(localclientnum, value);
}

/*
	Name: function_fc075317
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0xE0AB86BE
	Offset: 0x420
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fc075317(localclientnum, value)
{
	[[ self ]]->function_fc075317(localclientnum, value);
}

/*
	Name: function_955431ec
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0xCCCE72F9
	Offset: 0x450
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_955431ec(localclientnum, value)
{
	[[ self ]]->function_955431ec(localclientnum, value);
}

/*
	Name: function_2a0b1f84
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0xCFB2FD2
	Offset: 0x480
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2a0b1f84(localclientnum, value)
{
	[[ self ]]->function_2a0b1f84(localclientnum, value);
}

/*
	Name: function_94b2b0bd
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x39AA5FF1
	Offset: 0x4B0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_94b2b0bd(localclientnum)
{
	[[ self ]]->function_94b2b0bd(localclientnum);
}

/*
	Name: function_d74c17ab
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x2CC19413
	Offset: 0x4D8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_d74c17ab(localclientnum)
{
	[[ self ]]->function_d74c17ab(localclientnum);
}

/*
	Name: function_4bfdafeb
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x9817CF7D
	Offset: 0x500
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_4bfdafeb(localclientnum)
{
	[[ self ]]->function_4bfdafeb(localclientnum);
}

