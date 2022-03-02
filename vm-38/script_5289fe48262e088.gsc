#using script_4eecbd20dc9a462c;
#using script_57f0934f7e3e3b54;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace chopper_gunner;

/*
	Name: function_7a36c55f
	Namespace: chopper_gunner
	Checksum: 0x3713C23C
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7a36c55f()
{
	level notify(498302416);
}

/*
	Name: function_89f2df9
	Namespace: chopper_gunner
	Checksum: 0xA108665F
	Offset: 0xD0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"chopper_gunner", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: chopper_gunner
	Checksum: 0x70FE7C0C
	Offset: 0x120
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	namespace_e8c18978::function_70a657d8();
	clientfield::register("vehicle", "" + #"hash_164696e86d29988d", 1, 1, "int", &function_d4e58332, 0, 0);
	clientfield::register("toplayer", "" + #"hash_dae8b06d746fac5", 8000, 1, "int", &function_99879bf2, 0, 0);
}

/*
	Name: function_d4e58332
	Namespace: chopper_gunner
	Checksum: 0x97C59FB4
	Offset: 0x1F0
	Size: 0x64
	Parameters: 7
	Flags: Linked, Private
*/
function private function_d4e58332(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self thread scene::stop(#"chopper_gunner_door_open_client");
	}
}

/*
	Name: function_99879bf2
	Namespace: chopper_gunner
	Checksum: 0x74658D25
	Offset: 0x260
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_99879bf2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(level.var_a7c8e7d7 === 1)
	{
		self killstreaks::function_d79281c4(bwastimejump);
	}
}

