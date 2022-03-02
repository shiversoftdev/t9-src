#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;

#namespace mini_turret;

/*
	Name: function_89f2df9
	Namespace: mini_turret
	Checksum: 0x87F8E81
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"mini_turret", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: mini_turret
	Checksum: 0xFD3D3B6A
	Offset: 0x108
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "mini_turret_open", 1, 1, "int", &turret_open, 0, 0);
}

/*
	Name: turret_open
	Namespace: mini_turret
	Checksum: 0x1782B7C9
	Offset: 0x160
	Size: 0xBC
	Parameters: 7
	Flags: None
*/
function turret_open(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!bwastimejump)
	{
		return;
	}
	self util::waittill_dobj(fieldname);
	if(isdefined(self))
	{
		self useanimtree("generic");
		self setanimrestart(#"o_turret_mini_deploy", 1, 0, 1);
	}
}

