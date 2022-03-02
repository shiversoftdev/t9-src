#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace supplypod;

/*
	Name: function_89f2df9
	Namespace: supplypod
	Checksum: 0xCDF73DF9
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"supplypod", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: supplypod
	Checksum: 0xE624BB6
	Offset: 0x100
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
	Checksum: 0xD71224E6
	Offset: 0x158
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

