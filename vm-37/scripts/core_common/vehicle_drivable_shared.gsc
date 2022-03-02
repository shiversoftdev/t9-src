#using scripts\core_common\vehicle_shared.gsc;

#namespace vehicle;

/*
	Name: main
	Namespace: vehicle
	Checksum: 0xB5129D5D
	Offset: 0x78
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
	Checksum: 0x4CB5C657
	Offset: 0xB8
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
	Checksum: 0x60A37BC
	Offset: 0x1C0
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

