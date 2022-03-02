#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;

#namespace multi_extracam;

/*
	Name: function_e78171e9
	Namespace: multi_extracam
	Checksum: 0x274D5549
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e78171e9()
{
	level notify(1755119095);
}

/*
	Name: function_89f2df9
	Namespace: multi_extracam
	Checksum: 0xB9EE34D7
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"multi_extracam", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: multi_extracam
	Checksum: 0x9245FF0
	Offset: 0x120
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_localclient_connect(&multi_extracam_init);
}

/*
	Name: multi_extracam_init
	Namespace: multi_extracam
	Checksum: 0xBB438448
	Offset: 0x150
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function multi_extracam_init(localclientnum)
{
	triggers = getentarray(localclientnum, "multicam_enable", "targetname");
	for(i = 1; i <= 4; i++)
	{
		camerastruct = struct::get("extracam" + i, "targetname");
		if(isdefined(camerastruct))
		{
			camera_ent = spawn(localclientnum, camerastruct.origin, "script_origin");
			camera_ent.angles = camerastruct.angles;
			width = (isdefined(camerastruct.extracam_width) ? camerastruct.extracam_width : -1);
			height = (isdefined(camerastruct.extracam_height) ? camerastruct.extracam_height : -1);
			camera_ent setextracam(i - 1, width, height);
		}
	}
}

