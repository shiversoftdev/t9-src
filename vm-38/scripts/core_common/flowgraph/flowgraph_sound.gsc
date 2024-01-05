#namespace flowgraph_sound;

/*
	Name: function_9d1b2ea5
	Namespace: flowgraph_sound
	Checksum: 0x4E60399B
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9d1b2ea5()
{
	level notify(-1799117524);
}

/*
	Name: playsoundaliasatposition
	Namespace: flowgraph_sound
	Checksum: 0xACDD87BA
	Offset: 0x80
	Size: 0x38
	Parameters: 3
	Flags: None
*/
function playsoundaliasatposition(x, snd_name, v_position)
{
	playsoundatposition(snd_name, v_position);
	return true;
}

