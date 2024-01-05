#namespace gun;

/*
	Name: function_f0eb1f28
	Namespace: gun
	Checksum: 0x68CAB3B7
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f0eb1f28()
{
	level notify(-661833558);
}

/*
	Name: main
	Namespace: gun
	Checksum: 0x990283FF
	Offset: 0x80
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.isgungame = 1;
	setdvar(#"hash_137c8b2b96ac6c72", 0.2);
	setdvar(#"compassradarpingfadetime", 0.75);
}

