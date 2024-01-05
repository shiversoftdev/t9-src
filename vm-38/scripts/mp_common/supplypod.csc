#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace supplypod;

/*
	Name: function_591a2756
	Namespace: supplypod
	Checksum: 0x4A3E0938
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_591a2756()
{
	level notify(-1337738943);
}

/*
	Name: __init__system__
	Namespace: supplypod
	Checksum: 0x3A5E43A3
	Offset: 0xD0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"supplypod", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: supplypod
	Checksum: 0x4AAB6045
	Offset: 0x120
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "supplypod_placed", 1, 1, "int", &supplypod_placed, 0, 0);
}

/*
	Name: supplypod_placed
	Namespace: supplypod
	Checksum: 0xF4A6D3F0
	Offset: 0x178
	Size: 0xA4
	Parameters: 7
	Flags: Linked, Private
*/
function private supplypod_placed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(bwastimejump);
	if(!isdefined(self))
	{
		return;
	}
	self function_1f0c7136(4);
	self useanimtree("generic");
}

