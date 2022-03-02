#using scripts\core_common\flag_shared.csc;

#namespace namespace_b0722f43;

/*
	Name: function_750a5033
	Namespace: namespace_b0722f43
	Checksum: 0xA57881C1
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_750a5033()
{
	level notify(225912368);
}

/*
	Name: __init__
	Namespace: namespace_b0722f43
	Checksum: 0xAEC9E306
	Offset: 0x90
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	level.var_f726653d = [];
	level.var_ee110db8 = [];
	level.var_93c59949 = [];
	level.var_1d777960 = [];
	level.var_bf9b06d3 = [];
	level.var_8d50adaa = [];
}

/*
	Name: function_59c1a869
	Namespace: namespace_b0722f43
	Checksum: 0x71971C09
	Offset: 0xE8
	Size: 0xBE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_59c1a869(&var_8dd0b014, var_d1c21f6f, var_b06dd57e)
{
	if(!function_7a600918(var_d1c21f6f) || !function_7a600918(var_b06dd57e))
	{
		/#
			assert(0);
		#/
		return;
	}
	/#
		assert(!isdefined(var_8dd0b014[var_d1c21f6f]));
	#/
	if(isdefined(var_8dd0b014[var_d1c21f6f]))
	{
		return;
	}
	/#
		function_d50342ad(var_b06dd57e);
	#/
	var_8dd0b014[var_d1c21f6f] = var_b06dd57e;
}

/*
	Name: function_41015db1
	Namespace: namespace_b0722f43
	Checksum: 0xFF6BA27A
	Offset: 0x1B0
	Size: 0xDE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_41015db1(&var_8dd0b014, itemname, var_44ed74a7)
{
	if(!function_7a600918(itemname) || !function_7a600918(var_44ed74a7))
	{
		/#
			assert(0);
		#/
		return;
	}
	/#
		assert(!isdefined(var_8dd0b014[itemname]));
	#/
	if(isdefined(var_8dd0b014[itemname]))
	{
		return;
	}
	if(var_44ed74a7 == #"")
	{
		var_44ed74a7 = "";
	}
	/#
		function_cd5f2152(var_44ed74a7);
	#/
	var_8dd0b014[itemname] = var_44ed74a7;
}

/*
	Name: function_bbc0b67f
	Namespace: namespace_b0722f43
	Checksum: 0x48DBAD24
	Offset: 0x298
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
	Namespace: namespace_b0722f43
	Checksum: 0x582F75A7
	Offset: 0x300
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
	Namespace: namespace_b0722f43
	Checksum: 0x1FAE110F
	Offset: 0x330
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
	Namespace: namespace_b0722f43
	Checksum: 0x16C0A045
	Offset: 0x360
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_6991057(var_d1c21f6f, var_b06dd57e)
{
	function_59c1a869(level.var_ee110db8, var_d1c21f6f, var_b06dd57e);
}

/*
	Name: function_6da5e673
	Namespace: namespace_b0722f43
	Checksum: 0x1AF9A941
	Offset: 0x3A0
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_6da5e673(itemname, var_44ed74a7)
{
	function_41015db1(level.var_f726653d, itemname, var_44ed74a7);
}

/*
	Name: function_636d607c
	Namespace: namespace_b0722f43
	Checksum: 0xFDA678E6
	Offset: 0x3E0
	Size: 0x11E
	Parameters: 3
	Flags: Linked
*/
function function_636d607c(origin, targetname, angles)
{
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	if(!isvec(origin) || !isvec(angles) || !function_7a600918(targetname))
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
	Namespace: namespace_b0722f43
	Checksum: 0xCE5374E9
	Offset: 0x508
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
	if(!function_7a600918(var_cf456610) || !function_7a600918(var_2ab9d3bd) || !isint(var_6647c284))
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
	Namespace: namespace_b0722f43
	Checksum: 0xC4484528
	Offset: 0x620
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
	if(!function_7a600918(var_cf456610) || !function_7a600918(var_2ab9d3bd) || !isint(var_6647c284))
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
	Name: function_63bfe27
	Namespace: namespace_b0722f43
	Checksum: 0x5D92FD38
	Offset: 0x750
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_63bfe27(itemname)
{
	if(!function_7a600918(itemname))
	{
		/#
			assert(0);
		#/
		return;
	}
	level.var_f726653d[itemname] = "";
}

/*
	Name: function_a997e342
	Namespace: namespace_b0722f43
	Checksum: 0x27D6E58A
	Offset: 0x7B0
	Size: 0xE4
	Parameters: 2
	Flags: Linked
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

