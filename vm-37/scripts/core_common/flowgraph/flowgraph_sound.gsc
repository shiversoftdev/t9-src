#namespace flowgraph_sound;

/*
	Name: playsoundaliasatposition
	Namespace: flowgraph_sound
	Checksum: 0x8306CD85
	Offset: 0x60
	Size: 0x38
	Parameters: 3
	Flags: None
*/
function playsoundaliasatposition(x, snd_name, v_position)
{
	playsoundatposition(snd_name, v_position);
	return true;
}

