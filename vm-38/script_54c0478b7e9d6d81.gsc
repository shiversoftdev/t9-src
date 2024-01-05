#using scripts\core_common\system_shared.csc;

#namespace gadget_clone_render;

/*
	Name: function_d2ce2abd
	Namespace: gadget_clone_render
	Checksum: 0xBD16CE36
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d2ce2abd()
{
	level notify(-409764678);
}

/*
	Name: __init__system__
	Namespace: gadget_clone_render
	Checksum: 0xC5C5DDA8
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"gadget_clone_render", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: gadget_clone_render
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: transition_shader
	Namespace: gadget_clone_render
	Checksum: 0xA8832F75
	Offset: 0xF8
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function transition_shader(localclientnum)
{
	self endon(#"death");
	self endon(#"clone_shader_off");
	rampinshader = 0;
	while(rampinshader < 1)
	{
		if(isdefined(self))
		{
			self mapshaderconstant(localclientnum, 0, "scriptVector3", 1, rampinshader, 0, 0.04);
		}
		rampinshader = rampinshader + 0.04;
		waitframe(1);
	}
}

