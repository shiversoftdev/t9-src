#namespace namespace_eb06e24d;

/*
	Name: function_b7835160
	Namespace: namespace_eb06e24d
	Checksum: 0xFC09E64
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b7835160()
{
	level notify(566464353);
}

/*
	Name: function_d0ac8d8
	Namespace: namespace_eb06e24d
	Checksum: 0x7EE10776
	Offset: 0x80
	Size: 0x86
	Parameters: 0
	Flags: Linked
*/
function function_d0ac8d8()
{
	if(!isdefined(level.var_aadba305))
	{
		level.var_aadba305 = (isdefined(getscriptbundlelist(#"hash_4c4900fca46d6c74")) ? getscriptbundlelist(#"hash_4c4900fca46d6c74") : array());
	}
	return level.var_aadba305;
}

/*
	Name: function_3045dd71
	Namespace: namespace_eb06e24d
	Checksum: 0xB3A13DBD
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_3045dd71()
{
	return function_d0ac8d8().size;
}

/*
	Name: function_550c6257
	Namespace: namespace_eb06e24d
	Checksum: 0x4450308E
	Offset: 0x130
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_550c6257(var_ff60755f)
{
	var_f51354c7 = function_d0ac8d8();
	/#
		assert(var_f51354c7.size > 0);
	#/
	/#
		assert(isdefined(var_f51354c7[0]));
	#/
	if(var_ff60755f < 0 || var_ff60755f >= var_f51354c7.size || !isdefined(var_f51354c7[var_ff60755f]))
	{
		var_ff60755f = 0;
	}
	return getscriptbundle(var_f51354c7[var_ff60755f]);
}

/*
	Name: function_83a2cad4
	Namespace: namespace_eb06e24d
	Checksum: 0x7BE40B4
	Offset: 0x1E8
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_83a2cad4(index)
{
	kit = function_550c6257(index);
	return getscriptbundle(kit.parachute);
}

/*
	Name: function_aa3a05b1
	Namespace: namespace_eb06e24d
	Checksum: 0x1C555BE4
	Offset: 0x240
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_aa3a05b1(index)
{
	kit = function_550c6257(index);
	return getscriptbundle(kit.wingsuit);
}

/*
	Name: function_6452f9c5
	Namespace: namespace_eb06e24d
	Checksum: 0xA2EB71F3
	Offset: 0x298
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_6452f9c5(index)
{
	kit = function_550c6257(index);
	return getscriptbundle(kit.var_4fa85a25);
}

/*
	Name: function_c72eb508
	Namespace: namespace_eb06e24d
	Checksum: 0xC17EF9F3
	Offset: 0x2F0
	Size: 0x7A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c72eb508()
{
	if(isdefined(self.var_9f20891))
	{
		return self.var_9f20891;
	}
	count = function_3045dd71();
	self.var_9f20891 = function_d59c2d03(count, level.item_spawn_seed + self getentitynumber());
	return self.var_9f20891;
}

/*
	Name: function_37ae175b
	Namespace: namespace_eb06e24d
	Checksum: 0x2587061B
	Offset: 0x378
	Size: 0x152
	Parameters: 1
	Flags: Linked, Private
*/
function private function_37ae175b(type)
{
	/#
		if(getdvarint(#"hash_9003cbb3abd93b7", 0) != 0)
		{
			count = function_3045dd71();
			return int(max(0, min(count, getdvarint(#"hash_9003cbb3abd93b7", 0) - 1)));
		}
		if(getdvarint(#"hash_6c79f9280f28fabe", 0) != 0)
		{
			return self function_c72eb508();
		}
	#/
	if(isbot(self))
	{
		return self function_c72eb508();
	}
	var_5c27e968 = self function_7d5a3c48(currentsessionmode(), type);
	return var_5c27e968;
}

/*
	Name: function_fc6b6f3b
	Namespace: namespace_eb06e24d
	Checksum: 0x35F78C05
	Offset: 0x4D8
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function function_fc6b6f3b()
{
	return function_83a2cad4(self function_37ae175b(0));
}

/*
	Name: function_4a22ec61
	Namespace: namespace_eb06e24d
	Checksum: 0xF8C11F27
	Offset: 0x510
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function function_4a22ec61()
{
	return function_550c6257(self function_37ae175b(0));
}

/*
	Name: function_c772633d
	Namespace: namespace_eb06e24d
	Checksum: 0xBA7F209A
	Offset: 0x548
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function function_c772633d()
{
	return function_aa3a05b1(self function_37ae175b(2));
}

/*
	Name: function_3c54cdb1
	Namespace: namespace_eb06e24d
	Checksum: 0xCEE3A2AB
	Offset: 0x580
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function function_3c54cdb1()
{
	return function_550c6257(self function_37ae175b(2));
}

/*
	Name: get_trailfx
	Namespace: namespace_eb06e24d
	Checksum: 0x7F416C2
	Offset: 0x5B8
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function get_trailfx()
{
	return function_6452f9c5(self function_37ae175b(1));
}

/*
	Name: function_4a39b434
	Namespace: namespace_eb06e24d
	Checksum: 0xAAB928E7
	Offset: 0x5F0
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function function_4a39b434()
{
	return function_550c6257(self function_37ae175b(1));
}

