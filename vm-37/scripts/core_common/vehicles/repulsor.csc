#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace repulsor;

/*
	Name: __init__system__
	Namespace: repulsor
	Checksum: 0x30F1DFDE
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"repulsor", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: repulsor
	Checksum: 0x1F4AF715
	Offset: 0xF0
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "pulse_fx", 1, 1, "counter", &pulsefxhandler, 0, 0);
}

/*
	Name: pulsefxhandler
	Namespace: repulsor
	Checksum: 0xDF82B004
	Offset: 0x148
	Size: 0x104
	Parameters: 7
	Flags: Linked, Private
*/
function private pulsefxhandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	self endon(#"death");
	if(!isdefined(self))
	{
		return;
	}
	self notify(#"pulsefx");
	self endon(#"pulsefx");
	if(wasdemojump)
	{
		self playsound(0, #"hash_32a17ce5991f5801");
		self mapshaderconstant(fieldname, 0, "scriptVector2", 0, 1);
		wait(1);
	}
	self mapshaderconstant(fieldname, 0, "scriptVector2", 0, 0.2);
}

