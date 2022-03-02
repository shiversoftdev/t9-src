#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace repulsor;

/*
	Name: function_26577cec
	Namespace: repulsor
	Checksum: 0x43DB329D
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_26577cec()
{
	level notify(425174518);
}

/*
	Name: function_89f2df9
	Namespace: repulsor
	Checksum: 0xBE4A7885
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"repulsor", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: repulsor
	Checksum: 0x7C28C686
	Offset: 0x110
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
	Checksum: 0x4000254B
	Offset: 0x168
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

