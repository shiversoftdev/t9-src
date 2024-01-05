#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace dropkick;

/*
	Name: function_8f6912b9
	Namespace: dropkick
	Checksum: 0xBF1143F
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8f6912b9()
{
	level notify(369269852);
}

/*
	Name: main
	Namespace: dropkick
	Checksum: 0x97F57E5F
	Offset: 0xB0
	Size: 0x84
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("world", "" + #"hash_69d32ac298f2aa22", 1, 2, "int", &function_311e397d, 0, 0);
	callback::function_56df655f(&function_56df655f);
}

/*
	Name: function_311e397d
	Namespace: dropkick
	Checksum: 0xD6740B6
	Offset: 0x140
	Size: 0x12C
	Parameters: 7
	Flags: None
*/
function function_311e397d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1 && level.var_67c8b45f !== 1)
	{
		level.var_67c8b45f = 1;
		level childthread function_df0960d3(fieldname);
		level childthread function_ef284b9c(fieldname);
		level childthread function_efd48790(fieldname);
	}
	else
	{
		if(bwastimejump == 2 && level.var_67c8b45f === 1)
		{
			level.var_67c8b45f = 0;
			function_e8a68a06(fieldname, 0.3);
		}
		else if(bwastimejump == 3)
		{
			level childthread function_81e1cce7(fieldname);
		}
	}
}

/*
	Name: function_df0960d3
	Namespace: dropkick
	Checksum: 0x6C2BC779
	Offset: 0x278
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
	Checksum: 0xC4DA0B0D
	Offset: 0x2D0
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
	Checksum: 0x8779DF79
	Offset: 0x380
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
	Checksum: 0x2E18E1DE
	Offset: 0x4C0
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
	Checksum: 0x3C0A7E99
	Offset: 0x4F8
	Size: 0x1E0
	Parameters: 2
	Flags: Private
*/
function private function_e8a68a06(localclientnum, waittime)
{
	if(isdefined(waittime) && waittime > 0)
	{
		wait(waittime);
	}
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
		foreach(tagfx in level.var_abfcab7a)
		{
			stopfx(localclientnum, tagfx);
		}
	}
	if(isdefined(level.var_2efb73eb))
	{
		foreach(tagfx in level.var_2efb73eb)
		{
			stopfx(localclientnum, tagfx);
		}
	}
}

/*
	Name: function_56df655f
	Namespace: dropkick
	Checksum: 0x4C998C8B
	Offset: 0x6E0
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function function_56df655f(params)
{
	if(gamemodeismode(5) && level.var_67c8b45f === 1)
	{
		function_e8a68a06(params.localclientnum, 0);
		level.var_67c8b45f = 0;
	}
}

