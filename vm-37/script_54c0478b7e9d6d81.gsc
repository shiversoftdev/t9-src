#using scripts\core_common\system_shared.csc;

#namespace gadget_clone_render;

/*
	Name: function_89f2df9
	Namespace: gadget_clone_render
	Checksum: 0xBADDC6B6
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"gadget_clone_render", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: gadget_clone_render
	Checksum: 0x80F724D1
	Offset: 0xC8
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
	Checksum: 0x5A727019
	Offset: 0xD8
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

