#using script_dc59353021baee1;
#using script_746267f0669c40ae;
#using script_683a55734f15d50e;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_6ee927dd468f79b0;
#using script_49f7fe670ba9398e;
#using script_226eec8e867ca977;
#using script_4a247ed69e84b56f;
#using script_16910aff9d97c520;
#using script_17662ff15f00e748;
#using script_79315a6ccf4fce3d;
#using script_60c9f7551ce6c823;
#using script_2050c3ca1efa3116;
#using script_634ae70c663d1cc9;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_50fca1a24ae351;
#using script_48e04a393ec6d855;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_40bb01c9;

/*
	Name: function_53e2723
	Namespace: namespace_40bb01c9
	Checksum: 0xCA5D2FA3
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_53e2723()
{
	level notify(-944955243);
}

/*
	Name: init
	Namespace: namespace_40bb01c9
	Checksum: 0xDB9D9DF4
	Offset: 0x188
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_f5a14209 = [];
}

/*
	Name: function_f69dda63
	Namespace: namespace_40bb01c9
	Checksum: 0x110BD332
	Offset: 0x1A8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_f69dda63()
{
	namespace_268747c0::function_96e2f261(level.doa.var_f5a14209, 1);
}

/*
	Name: function_ddb3fb8f
	Namespace: namespace_40bb01c9
	Checksum: 0xBB0514EF
	Offset: 0x1E0
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function function_ddb3fb8f()
{
	foreach(trap in level.doa.var_f5a14209)
	{
		trap notify(#"hash_3e251384a5400dce", {#hash_760a0807:1});
	}
	level.doa.var_f5a14209 = [];
}

