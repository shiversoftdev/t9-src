#using scripts\core_common\scene_shared.gsc;

#namespace flowgraph_scene;

/*
	Name: playscenefunc
	Namespace: flowgraph_scene
	Checksum: 0xB0D0AE9B
	Offset: 0x68
	Size: 0x84
	Parameters: 4
	Flags: None
*/
function playscenefunc(x, e_entity, sb_name, b_thread)
{
	target = e_entity;
	if(!isdefined(target))
	{
		target = level;
	}
	if(b_thread)
	{
		target thread scene::play(sb_name);
	}
	else
	{
		target scene::play(sb_name);
	}
}

