#using script_40fc784c60f9fa7b;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_b51b47cd;

/*
	Name: function_d11142ec
	Namespace: namespace_b51b47cd
	Checksum: 0x5F654AE2
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d11142ec()
{
	level notify(964629110);
}

/*
	Name: function_89f2df9
	Namespace: namespace_b51b47cd
	Checksum: 0x29A0D620
	Offset: 0xD0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1aa3be97c5bfcefa", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_b51b47cd
	Checksum: 0xFFCCDEFB
	Offset: 0x120
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_motorcycle_2wd", &function_9835edf5);
}

/*
	Name: function_9835edf5
	Namespace: namespace_b51b47cd
	Checksum: 0xEB5E320E
	Offset: 0x158
	Size: 0x134
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9835edf5()
{
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_d0a9a026);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_e1f72671);
	callback::function_d8abfc3d(#"hash_2c1cafe2a67dfef8", &function_177abcbb);
	callback::function_d8abfc3d(#"hash_551381cffdc79048", &function_8ba31952);
	self.var_d6691161 = 200;
	self.var_5002d77c = 0.6;
	self.var_a195943 = 1;
	self vehicle::toggle_control_bone_group(1, 1);
	self player_vehicle::function_cc30c4bb(#"hash_22c22a196fd2cc77", 6);
}

/*
	Name: function_e1f72671
	Namespace: namespace_b51b47cd
	Checksum: 0x8A42AABA
	Offset: 0x298
	Size: 0x1A4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e1f72671(params)
{
	occupants = self getvehoccupants();
	if(!isdefined(occupants) || occupants.size == 0)
	{
		self notify(#"hash_7d134b21d3606f90");
		if(lengthsquared(self.velocity) > sqr(200))
		{
			var_6ceae60 = vectorscale((0, -1, 0), 5);
			var_99d6b963 = rotatepoint(var_6ceae60, self.angles);
			var_63c1fd8 = (-25 + randomfloat(30), 0, -22 + randomfloat(5));
			self launchvehicle(var_99d6b963, var_63c1fd8, 1, 1);
		}
		else
		{
			self vehicle::toggle_control_bone_group(1, 1);
		}
	}
	else if(isdefined(occupants) && occupants.size >= 0 && params.eventstruct.seat_index === 0)
	{
		function_164c8246();
	}
}

/*
	Name: function_d0a9a026
	Namespace: namespace_b51b47cd
	Checksum: 0x12B18010
	Offset: 0x448
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d0a9a026(params)
{
	if(params.eventstruct.seat_index === 0)
	{
		function_8892a46e();
	}
}

/*
	Name: function_177abcbb
	Namespace: namespace_b51b47cd
	Checksum: 0xD2FAEB79
	Offset: 0x490
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_177abcbb(params)
{
	if(isalive(self))
	{
		eventstruct = params.eventstruct;
		if(eventstruct.seat_index === 6 || eventstruct.var_21911287 === 6)
		{
			return;
		}
		if(eventstruct.seat_index === 0)
		{
			function_8892a46e();
		}
		else
		{
			function_164c8246();
		}
	}
}

/*
	Name: function_8892a46e
	Namespace: namespace_b51b47cd
	Checksum: 0xABE2327A
	Offset: 0x540
	Size: 0x4E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8892a46e()
{
	self launchvehicle((0, 0, 0), (0, 0, 0), 0, 2);
	self vehicle::toggle_control_bone_group(1, 0);
	self notify(#"hash_7d134b21d3606f90");
}

/*
	Name: function_164c8246
	Namespace: namespace_b51b47cd
	Checksum: 0x6FBED8E2
	Offset: 0x598
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_164c8246()
{
	if(lengthsquared(self.velocity) > sqr(200))
	{
		self thread function_45cb4291();
	}
	else
	{
		self vehicle::toggle_control_bone_group(1, 1);
	}
}

/*
	Name: function_45cb4291
	Namespace: namespace_b51b47cd
	Checksum: 0xCC7F545
	Offset: 0x610
	Size: 0xC0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_45cb4291()
{
	self notify("3997562ce637574e");
	self endon("3997562ce637574e");
	self endon(#"death", #"hash_7d134b21d3606f90");
	while(true)
	{
		wait(1);
		if(isalive(self))
		{
			if(lengthsquared(self.velocity) <= sqr(200))
			{
				self vehicle::toggle_control_bone_group(1, 1);
				return;
			}
		}
		else
		{
			return;
		}
	}
}

/*
	Name: function_8ba31952
	Namespace: namespace_b51b47cd
	Checksum: 0xAAA4F637
	Offset: 0x6D8
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8ba31952(params)
{
	if(!isalive(self))
	{
		return;
	}
	occupants = self getvehoccupants();
	if(!isdefined(occupants) || occupants.size == 0)
	{
		self launchvehicle((0, 0, 0), (0, 0, 0), 0, 1);
	}
}

