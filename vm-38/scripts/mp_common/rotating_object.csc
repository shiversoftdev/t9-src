#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace rotating_object;

/*
	Name: function_24635049
	Namespace: rotating_object
	Checksum: 0x9ADF0FB9
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_24635049()
{
	level notify(-191156946);
}

/*
	Name: __init__system__
	Namespace: rotating_object
	Checksum: 0xD418C766
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"rotating_object", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: rotating_object
	Checksum: 0x98A31556
	Offset: 0x110
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_localclient_connect(&init);
}

/*
	Name: init
	Namespace: rotating_object
	Checksum: 0xD8C10C4B
	Offset: 0x140
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function init(localclientnum)
{
	rotating_objects = getentarray(localclientnum, "rotating_object", "targetname");
	array::thread_all(rotating_objects, &rotating_object_think);
}

/*
	Name: rotating_object_think
	Namespace: rotating_object
	Checksum: 0xE27600BC
	Offset: 0x1A8
	Size: 0x1FA
	Parameters: 0
	Flags: Linked
*/
function rotating_object_think()
{
	self endon(#"death");
	util::waitforallclients();
	util::function_89a98f85();
	axis = "yaw";
	direction = 360;
	revolutions = 100;
	rotate_time = 12;
	if(isdefined(self.script_noteworthy))
	{
		axis = self.script_noteworthy;
	}
	if(isdefined(self.script_float))
	{
		rotate_time = self.script_float;
	}
	if(rotate_time == 0)
	{
		rotate_time = 12;
	}
	if(rotate_time < 0)
	{
		direction = direction * -1;
		rotate_time = rotate_time * -1;
	}
	angles = self.angles;
	while(true)
	{
		switch(axis)
		{
			case "roll":
			{
				self rotateroll(direction * revolutions, rotate_time * revolutions);
				break;
			}
			case "pitch":
			{
				self rotatepitch(direction * revolutions, rotate_time * revolutions);
				break;
			}
			case "yaw":
			default:
			{
				self rotateyaw(direction * revolutions, rotate_time * revolutions);
				break;
			}
		}
		self waittill(#"rotatedone");
		self.angles = angles;
	}
}

