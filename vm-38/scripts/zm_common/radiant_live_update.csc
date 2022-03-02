#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;

#namespace radiant_live_update;

/*
	Name: function_f96fb7e7
	Namespace: radiant_live_update
	Checksum: 0xCC4428F7
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f96fb7e7()
{
	level notify(372945698);
}

#namespace radiant_live_udpate;

/*
	Name: function_89f2df9
	Namespace: radiant_live_udpate
	Checksum: 0x8723621
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	/#
		system::register(#"radiant_live_udpate", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: radiant_live_udpate
	Checksum: 0x3C153BA0
	Offset: 0xD8
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		thread scriptstruct_debug_render();
	#/
}

/*
	Name: scriptstruct_debug_render
	Namespace: radiant_live_udpate
	Checksum: 0x577F7F4A
	Offset: 0x100
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function scriptstruct_debug_render()
{
	/#
		while(true)
		{
			waitresult = undefined;
			waitresult = level waittill(#"liveupdate");
			if(isdefined(waitresult.selected_struct))
			{
				level thread render_struct(waitresult.selected_struct);
			}
			else
			{
				level notify(#"stop_struct_render");
			}
		}
	#/
}

/*
	Name: render_struct
	Namespace: radiant_live_udpate
	Checksum: 0xB360CA52
	Offset: 0x190
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function render_struct(selected_struct)
{
	/#
		self endon(#"stop_struct_render");
		while(isdefined(selected_struct) && isdefined(selected_struct.origin))
		{
			box(selected_struct.origin, vectorscale((-1, -1, -1), 16), vectorscale((1, 1, 1), 16), 0, (1, 0.4, 0.4));
			wait(0.01);
		}
	#/
}

