#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\struct.csc;

#namespace siegebot;

/*
	Name: function_c0792c62
	Namespace: siegebot
	Checksum: 0x27538BA9
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c0792c62()
{
	level notify(6566505);
}

/*
	Name: main
	Namespace: siegebot
	Checksum: 0x9F60A833
	Offset: 0xA0
	Size: 0x2C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	vehicle::add_vehicletype_callback("siegebot", &_setup_);
}

/*
	Name: _setup_
	Namespace: siegebot
	Checksum: 0xE16A79A
	Offset: 0xD8
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function _setup_(localclientnum)
{
	if(isdefined(self.scriptbundlesettings))
	{
		settings = getscriptbundle(self.scriptbundlesettings);
	}
	if(!isdefined(settings))
	{
		return;
	}
}

