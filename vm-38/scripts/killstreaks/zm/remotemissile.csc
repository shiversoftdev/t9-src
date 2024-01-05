#using scripts\core_common\system_shared.csc;
#using script_57f0934f7e3e3b54;
#using scripts\killstreaks\remotemissile_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace remotemissile;

/*
	Name: function_a57dbe4
	Namespace: remotemissile
	Checksum: 0x94810BF2
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a57dbe4()
{
	level notify(970995487);
}

/*
	Name: __init__system__
	Namespace: remotemissile
	Checksum: 0x81C2DE74
	Offset: 0xC0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"remotemissile", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: remotemissile
	Checksum: 0xD463F1B
	Offset: 0x110
	Size: 0x11C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "" + #"hash_59ec82b1a72deb72", 1, 1, "int", &function_c668b489, 0, 0);
	clientfield::register("toplayer", "" + #"hash_7bdbbf163a28169", 6000, 1, "int", &function_3815e8dc, 0, 1);
	clientfield::register("toplayer", "" + #"hash_4241f7b51f8c144", 8000, 1, "int", &function_73155fe5, 0, 0);
	init_shared();
}

/*
	Name: function_c668b489
	Namespace: remotemissile
	Checksum: 0x338C0004
	Offset: 0x238
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_c668b489(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		function_3385d776(#"hash_320dd60f8482919f");
		function_3385d776(#"hash_55c5552fc2e0f419");
	}
	else
	{
		function_c22a1ca2(#"hash_320dd60f8482919f");
		function_c22a1ca2(#"hash_55c5552fc2e0f419");
	}
}

/*
	Name: function_3815e8dc
	Namespace: remotemissile
	Checksum: 0x1DFEBBFD
	Offset: 0x310
	Size: 0x3C
	Parameters: 7
	Flags: Linked
*/
function function_3815e8dc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

/*
	Name: function_73155fe5
	Namespace: remotemissile
	Checksum: 0xF0028CFA
	Offset: 0x358
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_73155fe5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(level.var_a396a670 === 1)
	{
		self function_4fe8eba6(bwastimejump);
	}
	if(level.var_a7c8e7d7 === 1)
	{
		self killstreaks::function_d79281c4(bwastimejump);
	}
}

/*
	Name: function_4fe8eba6
	Namespace: remotemissile
	Checksum: 0x1C5C32EE
	Offset: 0x3F0
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4fe8eba6(newval)
{
	if(newval)
	{
		fov = getdvarfloat(#"cg_fov", 80);
		if(fov > 110)
		{
			var_a0a59056 = 21;
		}
		else
		{
			if(fov > 93)
			{
				var_a0a59056 = 20;
			}
			else if(fov > 85)
			{
				var_a0a59056 = 19;
			}
		}
		if(isdefined(var_a0a59056))
		{
			self function_49cdf043(var_a0a59056, 0);
		}
	}
	else
	{
		self function_9298adaf(0);
	}
}

