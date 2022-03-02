#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace rotating_object;

/*
	Name: function_89f2df9
	Namespace: rotating_object
	Checksum: 0x7B376012
	Offset: 0xB0
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
	Checksum: 0x82CE6A84
	Offset: 0xF8
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_localclient_connect(&main);
}

/*
	Name: main
	Namespace: rotating_object
	Checksum: 0xCBF0B992
	Offset: 0x128
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function main(localclientnum)
{
	rotating_objects = getentarray(localclientnum, "rotating_object", "targetname");
	array::thread_all(rotating_objects, &rotating_object_think);
}

/*
	Name: rotating_object_think
	Namespace: rotating_object
	Checksum: 0x248421FC
	Offset: 0x190
	Size: 0x1EA
	Parameters: 0
	Flags: None
*/
function rotating_object_think()
{
	self endon(#"death");
	util::waitforallclients();
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

