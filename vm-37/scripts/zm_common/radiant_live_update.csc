#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace radiant_live_udpate;

/*
	Name: __init__system__
	Namespace: radiant_live_udpate
	Checksum: 0xEF565BBB
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	/#
		system::register(#"radiant_live_udpate", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: radiant_live_udpate
	Checksum: 0xC53710FE
	Offset: 0xB8
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
	Checksum: 0x49BAB402
	Offset: 0xE0
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
	Checksum: 0xC21845B2
	Offset: 0x170
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

