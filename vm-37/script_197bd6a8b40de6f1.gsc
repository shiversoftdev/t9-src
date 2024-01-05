#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\struct.csc;

#namespace siegebot;

/*
	Name: main
	Namespace: siegebot
	Checksum: 0x1B7AE7D0
	Offset: 0x80
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
	Checksum: 0xCA6D2E4B
	Offset: 0xB8
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

