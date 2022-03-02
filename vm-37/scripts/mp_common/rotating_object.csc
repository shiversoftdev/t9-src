#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace rotating_object;

/*
	Name: function_89f2df9
	Namespace: rotating_object
	Checksum: 0x7B376012
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"rotating_object", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: rotating_object
	Checksum: 0x859E5161
	Offset: 0xF0
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
	Checksum: 0xCBF0B992
	Offset: 0x120
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
	Checksum: 0x6E12190F
	Offset: 0x188
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

