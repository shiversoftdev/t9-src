#using scripts\core_common\lui_shared.csc;

class class_8a452bea : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_8a452bea
		Checksum: 0xDF0474FC
		Offset: 0x690
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_8a452bea
		Checksum: 0xE0D06EF7
		Offset: 0xD28
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_8a452bea
		Checksum: 0x7052CEC3
		Offset: 0xA90
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_1b05e380
		Namespace: namespace_8a452bea
		Checksum: 0x1D3215BB
		Offset: 0xCF0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_1b05e380(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "active_obj_progress_visibility", value);
	}

	/*
		Name: function_1bd6077e
		Namespace: namespace_8a452bea
		Checksum: 0xD1D8208F
		Offset: 0xCB8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_1bd6077e(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "active_objective_progress", value);
	}

	/*
		Name: function_1f1846cf
		Namespace: namespace_8a452bea
		Checksum: 0xB2EE3133
		Offset: 0xB68
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_1f1846cf(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "fail_fanfare_visibility", value);
	}

	/*
		Name: function_4dfb5783
		Namespace: namespace_8a452bea
		Checksum: 0xD501EDD
		Offset: 0xC48
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_4dfb5783(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "objective_retrieval", value);
	}

	/*
		Name: function_4e0e26c8
		Namespace: namespace_8a452bea
		Checksum: 0xA420C99B
		Offset: 0xAF8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_4e0e26c8(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "objective_prompt_visibility", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_8a452bea
		Checksum: 0x8974EB7D
		Offset: 0x8E8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("prototype_hud");
	}

	/*
		Name: function_7491d6c5
		Namespace: namespace_8a452bea
		Checksum: 0xB9076475
		Offset: 0xBD8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_7491d6c5(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "main_objective_string", value);
	}

	/*
		Name: function_817e4d10
		Namespace: namespace_8a452bea
		Checksum: 0xFA029563
		Offset: 0xC10
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_817e4d10(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "active_obj_visibility", value);
	}

	/*
		Name: function_8c3b3ce6
		Namespace: namespace_8a452bea
		Checksum: 0xEDF639D2
		Offset: 0xBA0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_8c3b3ce6(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "new_obj_fanfare_visibility", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_8a452bea
		Checksum: 0x5FF7DAEF
		Offset: 0x6B0
		Size: 0x22C
		Parameters: 11
		Flags: Linked
	*/
	function setup_clientfields(var_532cdc1a, var_7a99f2e1, var_b5ae72b8, var_2b966169, var_f16d8f66, var_8b49b908, var_e16cbdb9, var_ac373a00, var_a491b704, var_2bc363b1, var_560b5364)
	{
		namespace_6aaccc24::setup_clientfields("prototype_hud");
		namespace_6aaccc24::function_dcb34c80("string", "active_objective_string", 1);
		namespace_6aaccc24::function_da693cbe("objective_prompt_visibility", 1, 1, "int", var_b5ae72b8);
		namespace_6aaccc24::function_da693cbe("fanfare_visibility", 1, 1, "int", var_2b966169);
		namespace_6aaccc24::function_da693cbe("fail_fanfare_visibility", 1, 1, "int", var_f16d8f66);
		namespace_6aaccc24::function_da693cbe("new_obj_fanfare_visibility", 1, 1, "int", var_8b49b908);
		namespace_6aaccc24::function_dcb34c80("string", "main_objective_string", 1);
		namespace_6aaccc24::function_da693cbe("active_obj_visibility", 1, 1, "int", var_e16cbdb9);
		namespace_6aaccc24::function_da693cbe("objective_retrieval", 1, 1, "int", var_ac373a00);
		namespace_6aaccc24::function_da693cbe("show_secure", 1, 1, "int", var_a491b704);
		namespace_6aaccc24::function_da693cbe("active_objective_progress", 1, 6, "float", var_2bc363b1);
		namespace_6aaccc24::function_da693cbe("active_obj_progress_visibility", 1, 1, "int", var_560b5364);
	}

	/*
		Name: function_953da284
		Namespace: namespace_8a452bea
		Checksum: 0xBF22E94F
		Offset: 0xAC0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_953da284(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "active_objective_string", value);
	}

	/*
		Name: function_cbcd8e48
		Namespace: namespace_8a452bea
		Checksum: 0x128FA00C
		Offset: 0xB30
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_cbcd8e48(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "fanfare_visibility", value);
	}

	/*
		Name: function_da4fba84
		Namespace: namespace_8a452bea
		Checksum: 0x3B93976
		Offset: 0xC80
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_da4fba84(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "show_secure", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_8a452bea
		Checksum: 0x60B30D04
		Offset: 0x910
		Size: 0x178
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "active_objective_string", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "objective_prompt_visibility", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "fanfare_visibility", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "fail_fanfare_visibility", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "new_obj_fanfare_visibility", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "main_objective_string", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "active_obj_visibility", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "objective_retrieval", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "show_secure", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "active_objective_progress", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "active_obj_progress_visibility", 0);
	}

}

#namespace prototype_hud;

/*
	Name: register
	Namespace: prototype_hud
	Checksum: 0x27033CB9
	Offset: 0x1E0
	Size: 0x1DE
	Parameters: 11
	Flags: None
*/
function register(var_532cdc1a, var_7a99f2e1, var_b5ae72b8, var_2b966169, var_f16d8f66, var_8b49b908, var_e16cbdb9, var_ac373a00, var_a491b704, var_2bc363b1, var_560b5364)
{
	elem = new class_8a452bea();
	[[ elem ]]->setup_clientfields(var_532cdc1a, var_7a99f2e1, var_b5ae72b8, var_2b966169, var_f16d8f66, var_8b49b908, var_e16cbdb9, var_ac373a00, var_a491b704, var_2bc363b1, var_560b5364);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"prototype_hud"]))
	{
		level.var_ae746e8f[#"prototype_hud"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"prototype_hud"]))
	{
		level.var_ae746e8f[#"prototype_hud"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"prototype_hud"]))
	{
		level.var_ae746e8f[#"prototype_hud"] = array(level.var_ae746e8f[#"prototype_hud"]);
	}
	level.var_ae746e8f[#"prototype_hud"][level.var_ae746e8f[#"prototype_hud"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: prototype_hud
	Checksum: 0xBCD20250
	Offset: 0x3C8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_8a452bea();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: prototype_hud
	Checksum: 0xC54C7E5D
	Offset: 0x408
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
	Namespace: prototype_hud
	Checksum: 0x85744DF7
	Offset: 0x430
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
	Namespace: prototype_hud
	Checksum: 0x92C9CDF
	Offset: 0x458
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_953da284
	Namespace: prototype_hud
	Checksum: 0x699A1D56
	Offset: 0x480
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_953da284(localclientnum, value)
{
	[[ self ]]->function_953da284(localclientnum, value);
}

/*
	Name: function_4e0e26c8
	Namespace: prototype_hud
	Checksum: 0x824F778
	Offset: 0x4B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4e0e26c8(localclientnum, value)
{
	[[ self ]]->function_4e0e26c8(localclientnum, value);
}

/*
	Name: function_cbcd8e48
	Namespace: prototype_hud
	Checksum: 0x3DC5B33C
	Offset: 0x4E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_cbcd8e48(localclientnum, value)
{
	[[ self ]]->function_cbcd8e48(localclientnum, value);
}

/*
	Name: function_1f1846cf
	Namespace: prototype_hud
	Checksum: 0x69B33EDD
	Offset: 0x510
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1f1846cf(localclientnum, value)
{
	[[ self ]]->function_1f1846cf(localclientnum, value);
}

/*
	Name: function_8c3b3ce6
	Namespace: prototype_hud
	Checksum: 0xB9A1FB9B
	Offset: 0x540
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8c3b3ce6(localclientnum, value)
{
	[[ self ]]->function_8c3b3ce6(localclientnum, value);
}

/*
	Name: function_7491d6c5
	Namespace: prototype_hud
	Checksum: 0x64B281F2
	Offset: 0x570
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7491d6c5(localclientnum, value)
{
	[[ self ]]->function_7491d6c5(localclientnum, value);
}

/*
	Name: function_817e4d10
	Namespace: prototype_hud
	Checksum: 0xE22979BD
	Offset: 0x5A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_817e4d10(localclientnum, value)
{
	[[ self ]]->function_817e4d10(localclientnum, value);
}

/*
	Name: function_4dfb5783
	Namespace: prototype_hud
	Checksum: 0xEF461C28
	Offset: 0x5D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4dfb5783(localclientnum, value)
{
	[[ self ]]->function_4dfb5783(localclientnum, value);
}

/*
	Name: function_da4fba84
	Namespace: prototype_hud
	Checksum: 0x457B8CB2
	Offset: 0x600
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_da4fba84(localclientnum, value)
{
	[[ self ]]->function_da4fba84(localclientnum, value);
}

/*
	Name: function_1bd6077e
	Namespace: prototype_hud
	Checksum: 0x24AF5B78
	Offset: 0x630
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1bd6077e(localclientnum, value)
{
	[[ self ]]->function_1bd6077e(localclientnum, value);
}

/*
	Name: function_1b05e380
	Namespace: prototype_hud
	Checksum: 0x2EA96DF7
	Offset: 0x660
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1b05e380(localclientnum, value)
{
	[[ self ]]->function_1b05e380(localclientnum, value);
}

