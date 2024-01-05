#using scripts\core_common\flag_shared.csc;

#namespace item_world_fixup;

/*
	Name: __init__
	Namespace: item_world_fixup
	Checksum: 0x8EB260C9
	Offset: 0x70
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	level.itemreplacement = [];
	level.var_ee110db8 = [];
	level.var_93c59949 = [];
	level.var_1d777960 = [];
	level.var_bf9b06d3 = [];
	level.var_8d50adaa = [];
}

/*
	Name: function_59c1a869
	Namespace: item_world_fixup
	Checksum: 0xAD962A96
	Offset: 0xC8
	Size: 0xBE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_59c1a869(&replacementarray, var_d1c21f6f, var_b06dd57e)
{
	if(!ishash(var_d1c21f6f) || !ishash(var_b06dd57e))
	{
		/#
			assert(0);
		#/
		return;
	}
	/#
		assert(!isdefined(replacementarray[var_d1c21f6f]));
	#/
	if(isdefined(replacementarray[var_d1c21f6f]))
	{
		return;
	}
	/#
		function_d50342ad(var_b06dd57e);
	#/
	replacementarray[var_d1c21f6f] = var_b06dd57e;
}

/*
	Name: function_41015db1
	Namespace: item_world_fixup
	Checksum: 0x315E4B0
	Offset: 0x190
	Size: 0xDE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_41015db1(&replacementarray, itemname, replacementitemname)
{
	if(!ishash(itemname) || !ishash(replacementitemname))
	{
		/#
			assert(0);
		#/
		return;
	}
	/#
		assert(!isdefined(replacementarray[itemname]));
	#/
	if(isdefined(replacementarray[itemname]))
	{
		return;
	}
	if(replacementitemname == #"")
	{
		replacementitemname = "";
	}
	/#
		function_cd5f2152(replacementitemname);
	#/
	replacementarray[itemname] = replacementitemname;
}

/*
	Name: function_bbc0b67f
	Namespace: item_world_fixup
	Checksum: 0x4E2BC112
	Offset: 0x278
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_bbc0b67f()
{
	flag = #"hash_67b445a4b1d59922";
	if(level flag::get(flag))
	{
		/#
			assert(0, "");
		#/
		return false;
	}
	return true;
}

/*
	Name: function_cd5f2152
	Namespace: item_world_fixup
	Checksum: 0xAA4BF72B
	Offset: 0x2E0
	Size: 0x22
	Parameters: 1
	Flags: Private
*/
function private function_cd5f2152(itemname)
{
	/#
		if(itemname == "")
		{
			return;
		}
	#/
}

/*
	Name: function_d50342ad
	Namespace: item_world_fixup
	Checksum: 0x7FD3E7A8
	Offset: 0x310
	Size: 0x22
	Parameters: 1
	Flags: Private
*/
function private function_d50342ad(var_d1c21f6f)
{
	/#
		if(var_d1c21f6f == "")
		{
			return;
		}
	#/
}

/*
	Name: function_6991057
	Namespace: item_world_fixup
	Checksum: 0xFA3A25AA
	Offset: 0x340
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_6991057(var_d1c21f6f, var_b06dd57e)
{
	function_59c1a869(level.var_ee110db8, var_d1c21f6f, var_b06dd57e);
}

/*
	Name: add_item_replacement
	Namespace: item_world_fixup
	Checksum: 0x8627EC8F
	Offset: 0x380
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function add_item_replacement(itemname, replacementitemname)
{
	function_41015db1(level.itemreplacement, itemname, replacementitemname);
}

/*
	Name: add_spawn_point
	Namespace: item_world_fixup
	Checksum: 0x71D075AF
	Offset: 0x3C0
	Size: 0x11E
	Parameters: 3
	Flags: None
*/
function add_spawn_point(origin, targetname, angles)
{
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	if(!isvec(origin) || !isvec(angles) || !ishash(targetname))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isdefined(level.var_1d777960[targetname]))
	{
		level.var_1d777960[targetname] = array();
	}
	var_3cc38ddd = level.var_1d777960[targetname].size;
	level.var_1d777960[targetname][var_3cc38ddd] = {#angles:angles, #origin:origin};
}

/*
	Name: function_e70fa91c
	Namespace: item_world_fixup
	Checksum: 0xD6B7023E
	Offset: 0x4E8
	Size: 0x10E
	Parameters: 3
	Flags: None
*/
function function_e70fa91c(var_cf456610, var_2ab9d3bd, var_6647c284)
{
	if(!isdefined(var_6647c284))
	{
		var_6647c284 = -1;
	}
	if(!ishash(var_cf456610) || !ishash(var_2ab9d3bd) || !isint(var_6647c284))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isdefined(level.var_93c59949[var_cf456610]))
	{
		level.var_93c59949[var_cf456610] = [];
	}
	var_f532cd9f = level.var_93c59949[var_cf456610].size;
	level.var_93c59949[var_cf456610][var_f532cd9f] = {#count:var_6647c284, #replacement:var_2ab9d3bd};
}

/*
	Name: function_2749fcc3
	Namespace: item_world_fixup
	Checksum: 0x9EC5328B
	Offset: 0x600
	Size: 0x126
	Parameters: 4
	Flags: None
*/
function function_2749fcc3(var_89b7987e, var_cf456610, var_2ab9d3bd, var_6647c284)
{
	if(!isdefined(var_6647c284))
	{
		var_6647c284 = 1;
	}
	if(!ishash(var_cf456610) || !ishash(var_2ab9d3bd) || !isint(var_6647c284))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isdefined(level.var_93c59949[var_cf456610]))
	{
		level.var_93c59949[var_cf456610] = [];
	}
	var_f532cd9f = level.var_93c59949[var_cf456610].size;
	level.var_93c59949[var_cf456610][var_f532cd9f] = {#hash_52a66db0:var_89b7987e, #count:var_6647c284, #replacement:var_2ab9d3bd};
}

/*
	Name: remove_item
	Namespace: item_world_fixup
	Checksum: 0x9CE6FCE1
	Offset: 0x730
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function remove_item(itemname)
{
	if(!ishash(itemname))
	{
		/#
			assert(0);
		#/
		return;
	}
	level.itemreplacement[itemname] = "";
}

/*
	Name: function_a997e342
	Namespace: item_world_fixup
	Checksum: 0xB2727E2
	Offset: 0x790
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function function_a997e342(origin, radius)
{
	if(!isvec(origin) || (!isfloat(radius) && !isint(radius)))
	{
		/#
			assert(0);
		#/
		return;
	}
	level.var_bf9b06d3[level.var_bf9b06d3.size] = origin;
	level.var_8d50adaa[level.var_8d50adaa.size] = radius;
	/#
		assert(level.var_bf9b06d3.size == level.var_8d50adaa.size);
	#/
}

