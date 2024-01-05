#using script_dc59353021baee1;
#using script_746267f0669c40ae;
#using script_77357b2d180aa2b8;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_48e04a393ec6d855;
#using script_50fca1a24ae351;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_5849a337;

/*
	Name: function_947491c1
	Namespace: namespace_5849a337
	Checksum: 0xCC7B159A
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_947491c1()
{
	level notify(-429753495);
}

/*
	Name: init
	Namespace: namespace_5849a337
	Checksum: 0x80F724D1
	Offset: 0x138
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: function_2d3e0ee4
	Namespace: namespace_5849a337
	Checksum: 0x5388BFC0
	Offset: 0x148
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function function_2d3e0ee4()
{
	foreach(door in level.doa.var_a8a563fc)
	{
		if(isdefined(door.model))
		{
			door.model delete();
		}
	}
	level.doa.var_a8a563fc = [];
}

/*
	Name: function_fabbde0d
	Namespace: namespace_5849a337
	Checksum: 0xA893064E
	Offset: 0x210
	Size: 0x13E
	Parameters: 0
	Flags: Linked
*/
function function_fabbde0d()
{
	foreach(door in level.doa.var_a8a563fc)
	{
		var_c9d9522c = (isdefined(door.model) ? door.model : door.script_string);
		/#
			assert(isdefined(var_c9d9522c));
		#/
		model = namespace_f63bdb08::function_2a1e5c1f(door.origin, door.angles, var_c9d9522c, undefined, 1, 2, door.script_parameters);
		if(isdefined(door.model))
		{
			door.model delete();
		}
		door.model = model;
	}
}

