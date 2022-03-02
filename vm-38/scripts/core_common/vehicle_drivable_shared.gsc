#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_b906365e;

/*
	Name: function_8e91efa4
	Namespace: namespace_b906365e
	Checksum: 0x68D95DE
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8e91efa4()
{
	level notify(1666764443);
}

#namespace vehicle;

/*
	Name: main
	Namespace: vehicle
	Checksum: 0x158A8A2E
	Offset: 0x98
	Size: 0x34
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	add_main_callback("air_vehicle1", &air_vehicle1_initialize);
}

/*
	Name: weapon_switch_watcher
	Namespace: vehicle
	Checksum: 0xC62043E8
	Offset: 0xD8
	Size: 0xFE
	Parameters: 1
	Flags: None
*/
function weapon_switch_watcher(driver)
{
	self endon(#"death");
	driver endon(#"death");
	self endon(#"exit_vehicle");
	while(true)
	{
		if(driver weaponswitchbuttonpressed())
		{
			while(driver weaponswitchbuttonpressed())
			{
				waitframe(1);
			}
			current_weapon = self seatgetweapon(0);
			if(current_weapon == self.first_weapon)
			{
				self setweapon(self.second_weapon);
			}
			else
			{
				self setweapon(self.first_weapon);
			}
		}
		waitframe(1);
	}
}

/*
	Name: air_vehicle1_initialize
	Namespace: vehicle
	Checksum: 0x3F146C0A
	Offset: 0x1E0
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function air_vehicle1_initialize()
{
	self.first_weapon = self seatgetweapon(0);
	self.second_weapon = self seatgetweapon(1);
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"enter_vehicle");
		self thread weapon_switch_watcher(waitresult.player);
	}
}

