#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace dropkick;

/*
	Name: main
	Namespace: dropkick
	Checksum: 0xF4449715
	Offset: 0x88
	Size: 0x64
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("world", "" + #"hash_69d32ac298f2aa22", 1, 2, "int", &function_311e397d, 0, 0);
}

/*
	Name: function_311e397d
	Namespace: dropkick
	Checksum: 0xE7FA45AC
	Offset: 0xF8
	Size: 0x124
	Parameters: 7
	Flags: None
*/
function function_311e397d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1 && level.var_67c8b45f !== 1)
	{
		level.var_67c8b45f = 1;
		level thread function_df0960d3(fieldname);
		level thread function_ef284b9c(fieldname);
		level thread function_efd48790(fieldname);
	}
	else
	{
		if(bwastimejump == 2 && level.var_67c8b45f === 1)
		{
			level.var_67c8b45f = 0;
			function_e8a68a06(fieldname);
		}
		else if(bwastimejump == 3)
		{
			level thread function_81e1cce7(fieldname);
		}
	}
}

/*
	Name: function_df0960d3
	Namespace: dropkick
	Checksum: 0x391CEC31
	Offset: 0x228
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private function_df0960d3(localclientnum)
{
	wait(2);
	if(level.var_67c8b45f === 0)
	{
		return;
	}
	function_a837926b(localclientnum, #"hash_72d5d84c9d0b25c");
}

/*
	Name: function_ef284b9c
	Namespace: dropkick
	Checksum: 0x5E516C81
	Offset: 0x280
	Size: 0xA4
	Parameters: 1
	Flags: Private
*/
function private function_ef284b9c(localclientnum)
{
	wait(3.4);
	if(level.var_67c8b45f === 0)
	{
		return;
	}
	function_a837926b(localclientnum, #"hash_69a53e8913317ecf");
	duration = 6;
	wait(duration);
	if(function_148ccc79(localclientnum, #"hash_69a53e8913317ecf"))
	{
		function_24cd4cfb(localclientnum, #"hash_69a53e8913317ecf");
	}
}

/*
	Name: function_efd48790
	Namespace: dropkick
	Checksum: 0x6728911F
	Offset: 0x330
	Size: 0x134
	Parameters: 1
	Flags: Private
*/
function private function_efd48790(localclientnum)
{
	wait(3.4);
	if(level.var_67c8b45f === 0)
	{
		return;
	}
	player = function_27673a7(localclientnum);
	player util::waittill_dobj(localclientnum);
	if(!isdefined(player) || level.var_67c8b45f === 0)
	{
		return;
	}
	level.var_abfcab7a = playtagfxset(localclientnum, #"hash_43b0b641e68b206b", player);
	var_68a17fa6 = 6.6;
	wait(var_68a17fa6);
	player = function_27673a7(localclientnum);
	player util::waittill_dobj(localclientnum);
	if(!isdefined(player) || level.var_67c8b45f === 0)
	{
		return;
	}
	level.var_2efb73eb = playtagfxset(localclientnum, #"hash_499afd296acad28c", player);
}

/*
	Name: function_81e1cce7
	Namespace: dropkick
	Checksum: 0x7167C0E9
	Offset: 0x470
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_81e1cce7(localclientnum)
{
	function_a837926b(localclientnum, #"hash_65e918e7c65c396b");
}

/*
	Name: function_e8a68a06
	Namespace: dropkick
	Checksum: 0xFD5A8045
	Offset: 0x4A8
	Size: 0x1C0
	Parameters: 1
	Flags: Private
*/
function private function_e8a68a06(localclientnum)
{
	wait(0.3);
	if(function_148ccc79(localclientnum, #"hash_72d5d84c9d0b25c"))
	{
		codestoppostfxbundlelocal(localclientnum, #"hash_72d5d84c9d0b25c");
	}
	if(function_148ccc79(localclientnum, #"hash_69a53e8913317ecf"))
	{
		codestoppostfxbundlelocal(localclientnum, #"hash_69a53e8913317ecf");
	}
	if(isdefined(level.var_abfcab7a))
	{
		foreach(var_65837411 in level.var_abfcab7a)
		{
			stopfx(localclientnum, var_65837411);
		}
	}
	if(isdefined(level.var_2efb73eb))
	{
		foreach(var_65837411 in level.var_2efb73eb)
		{
			stopfx(localclientnum, var_65837411);
		}
	}
}

