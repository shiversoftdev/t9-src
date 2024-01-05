#using scripts\core_common\scene_shared.csc;

#namespace flowgraph_scene;

/*
	Name: function_8786daff
	Namespace: flowgraph_scene
	Checksum: 0xCEFB78C2
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8786daff()
{
	level notify(-617460652);
}

/*
	Name: playscenefunc
	Namespace: flowgraph_scene
	Checksum: 0xF04B6A8D
	Offset: 0x88
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

