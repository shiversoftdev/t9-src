#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace player_vehicle;

/*
	Name: function_89f2df9
	Namespace: player_vehicle
	Checksum: 0x1293CD17
	Offset: 0x1E8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"player_vehicle", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player_vehicle
	Checksum: 0xEA122467
	Offset: 0x230
	Size: 0x1F4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_vehicle_spawned(&on_vehicle_spawned);
	clientfield::register("vehicle", "overheat_fx", 1, 1, "int", &function_ed50d3e0, 0, 0);
	clientfield::register("vehicle", "overheat_fx1", 1, 1, "int", &function_b7f86930, 0, 0);
	clientfield::register("vehicle", "overheat_fx2", 1, 1, "int", &function_4b2a0f55, 0, 0);
	clientfield::register("vehicle", "overheat_fx3", 1, 1, "int", &function_a2943e68, 0, 0);
	clientfield::register("vehicle", "overheat_fx4", 1, 1, "int", &function_a64f45de, 0, 0);
	clientfield::register("toplayer", "toggle_vehicle_sensor", 1, 1, "int", &function_12d038ac, 0, 0);
	callback::on_localplayer_spawned(&on_localplayer_spawned);
}

/*
	Name: on_vehicle_spawned
	Namespace: player_vehicle
	Checksum: 0x8679EDC3
	Offset: 0x430
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_vehicle_spawned(localclientnum)
{
	if(!is_true(self.var_46439e18))
	{
		return;
	}
	self function_4edde887(localclientnum);
}

/*
	Name: function_4edde887
	Namespace: player_vehicle
	Checksum: 0x36853912
	Offset: 0x478
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4edde887(localclientnum)
{
	if(self function_b835102b() && !self.vehicleclass === "boat" && !self.vehicleclass === "helicopter" && !self.vehicleclass === "plane")
	{
		self function_3f24c5a(1);
	}
	self.var_ba36f5d = &function_ba36f5d;
	self function_1f0c7136(3);
}

/*
	Name: on_localplayer_spawned
	Namespace: player_vehicle
	Checksum: 0x6C5F2310
	Offset: 0x540
	Size: 0x3A
	Parameters: 1
	Flags: Linked, Private
*/
function private on_localplayer_spawned(localclientnum)
{
	if(self function_21c0fa55())
	{
		self.var_53204996 = &function_3ec2efae;
	}
}

/*
	Name: function_12d038ac
	Namespace: player_vehicle
	Checksum: 0xD43FA1D
	Offset: 0x588
	Size: 0xAC
	Parameters: 7
	Flags: Linked, Private
*/
function private function_12d038ac(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(isdefined(self.var_e29b96d2))
		{
			self.var_e29b96d2 delete();
		}
		self thread function_54e9d3c4(fieldname);
	}
	else if(isdefined(self.var_e29b96d2))
	{
		self.var_e29b96d2 delete();
	}
}

/*
	Name: function_54e9d3c4
	Namespace: player_vehicle
	Checksum: 0x6CD24D4D
	Offset: 0x640
	Size: 0x224
	Parameters: 1
	Flags: Linked, Private
*/
function private function_54e9d3c4(localclientnum)
{
	self notify("a0febefad645c24");
	self endon("a0febefad645c24");
	self endon(#"death");
	self endon(#"exit_vehicle");
	vehicle = undefined;
	while(true)
	{
		vehicle = getplayervehicle(self);
		if(isdefined(vehicle))
		{
			break;
		}
		waitframe(1);
	}
	driver = vehicle.owner;
	if(!isdefined(driver) || !isplayer(driver))
	{
		return;
	}
	self.var_e29b96d2 = spawn(localclientnum, vehicle.origin, "script_model", vehicle getentitynumber(), driver.team);
	if(isdefined(self.var_e29b96d2))
	{
		self.var_e29b96d2 setmodel(#"tag_origin");
		self.var_e29b96d2 linkto(vehicle);
		self.var_e29b96d2 setcompassicon("icon_minimap_sensor_dart");
		self.var_e29b96d2 function_811196d1(0);
		self.var_e29b96d2 function_a5edb367(#"neutral");
		self.var_e29b96d2 function_8e04481f();
		self.var_e29b96d2 function_5e00861(0.62);
		self.var_e29b96d2 function_5db470de(localclientnum, 2400, 1);
	}
}

/*
	Name: function_3ec2efae
	Namespace: player_vehicle
	Checksum: 0xA5A079D3
	Offset: 0x870
	Size: 0x156
	Parameters: 1
	Flags: Linked
*/
function function_3ec2efae(localclientnum)
{
	vehicle = getplayervehicle(self);
	if(!isdefined(vehicle) || !vehicle isvehicle())
	{
		return false;
	}
	if(!isdefined(vehicle.owner))
	{
		return false;
	}
	if(util::function_fbce7263(vehicle.owner.team, self.team))
	{
		return false;
	}
	if(!isdefined(vehicle.scriptbundlesettings))
	{
		return false;
	}
	if(!isdefined(vehicle.settings))
	{
		vehicle.settings = getscriptbundle(vehicle.scriptbundlesettings);
	}
	if(isdefined(vehicle.settings) && is_true(vehicle.settings.var_2627e80a))
	{
		var_1861e0b1 = vehicle clientfield::get("toggle_horn_sound");
		if(is_true(var_1861e0b1))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_ba36f5d
	Namespace: player_vehicle
	Checksum: 0x9E7CBD34
	Offset: 0x9D0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_ba36f5d(localclientnum, val)
{
	self setstunned(val);
}

/*
	Name: function_b0d51c9
	Namespace: player_vehicle
	Checksum: 0x44D328BA
	Offset: 0xA08
	Size: 0x10A
	Parameters: 2
	Flags: None
*/
function function_b0d51c9(localclientnum, owner)
{
	curtime = gettime();
	if(curtime < self.var_1a6ef836)
	{
		return self.var_ed40ad25;
	}
	self.var_ed40ad25 = 0;
	if(isdefined(owner))
	{
		self.var_1a6ef836 = curtime + 500;
		cameraangles = owner getcamangles();
		if(isdefined(cameraangles))
		{
			var_742173a2 = anglestoforward(cameraangles);
			var_a181fdc8 = anglestoforward(self.angles);
			dot = vectordot(var_742173a2, var_a181fdc8);
			if(dot > 0.8660254)
			{
				self.var_ed40ad25 = 1;
			}
		}
	}
	return self.var_ed40ad25;
}

/*
	Name: function_1e8ff2f7
	Namespace: player_vehicle
	Checksum: 0xEA1A5599
	Offset: 0xB20
	Size: 0xC2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1e8ff2f7(settings, seat_index)
{
	switch(seat_index)
	{
		case 0:
		{
			return settings.var_e90e82ca;
		}
		case 1:
		{
			return settings.var_87d0163a;
		}
		case 2:
		{
			return settings.var_e207caa8;
		}
		case 3:
		{
			return settings.var_d4412f1b;
		}
		case 4:
		{
			return settings.var_544baf32;
		}
		default:
		{
			return undefined;
		}
	}
}

/*
	Name: function_356e1073
	Namespace: player_vehicle
	Checksum: 0xA6D97E3E
	Offset: 0xBF0
	Size: 0xAA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_356e1073(seat_index)
{
	switch(seat_index)
	{
		case 0:
		{
			return "tag_flash";
		}
		case 1:
		{
			return "tag_gunner_flash1";
		}
		case 2:
		{
			return "tag_gunner_flash2";
		}
		case 3:
		{
			return "tag_gunner_flash3";
		}
		case 4:
		{
			return "tag_gunner_flash4";
		}
		default:
		{
			return undefined;
		}
	}
}

/*
	Name: function_ed50d3e0
	Namespace: player_vehicle
	Checksum: 0x32E20486
	Offset: 0xCA8
	Size: 0x64
	Parameters: 7
	Flags: Linked, Private
*/
function private function_ed50d3e0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_b4806ee(0, localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
}

/*
	Name: function_b7f86930
	Namespace: player_vehicle
	Checksum: 0xCD83BFA5
	Offset: 0xD18
	Size: 0x64
	Parameters: 7
	Flags: Linked, Private
*/
function private function_b7f86930(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_b4806ee(1, localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
}

/*
	Name: function_4b2a0f55
	Namespace: player_vehicle
	Checksum: 0x8256AB0F
	Offset: 0xD88
	Size: 0x64
	Parameters: 7
	Flags: Linked, Private
*/
function private function_4b2a0f55(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_b4806ee(2, localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
}

/*
	Name: function_a2943e68
	Namespace: player_vehicle
	Checksum: 0xC710F193
	Offset: 0xDF8
	Size: 0x64
	Parameters: 7
	Flags: Linked, Private
*/
function private function_a2943e68(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_b4806ee(3, localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
}

/*
	Name: function_a64f45de
	Namespace: player_vehicle
	Checksum: 0xAD9BB3C9
	Offset: 0xE68
	Size: 0x64
	Parameters: 7
	Flags: Linked, Private
*/
function private function_a64f45de(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_b4806ee(4, localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
}

/*
	Name: function_b4806ee
	Namespace: player_vehicle
	Checksum: 0x5EEB90EA
	Offset: 0xED8
	Size: 0x180
	Parameters: 8
	Flags: Linked, Private
*/
function private function_b4806ee(seatindex, localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.settings) && isdefined(self.scriptbundlesettings))
	{
		self.settings = getscriptbundle(self.scriptbundlesettings);
	}
	if(!isdefined(self.settings))
	{
		return;
	}
	if(!isdefined(self.var_500ef685))
	{
		self.var_500ef685 = [];
	}
	if(isdefined(self.var_500ef685[binitialsnap]))
	{
		stopfx(fieldname, self.var_500ef685[binitialsnap]);
		self.var_500ef685[binitialsnap] = undefined;
	}
	if(bwastimejump == 1)
	{
		var_82989abf = function_1e8ff2f7(self.settings, binitialsnap);
		fx_tag = function_356e1073(binitialsnap);
		if(isdefined(var_82989abf) && isdefined(fx_tag))
		{
			self.var_500ef685[binitialsnap] = self util::playfxontag(fieldname, var_82989abf, self, fx_tag);
		}
	}
}

