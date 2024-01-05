#using scripts\core_common\death_circle.gsc;
#using script_40fc784c60f9fa7b;
#using scripts\core_common\vehicle_shared.gsc;
#using script_1160d62024d6945b;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_c8fb02a7;

/*
	Name: function_9026370c
	Namespace: namespace_c8fb02a7
	Checksum: 0x9E01C993
	Offset: 0x218
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9026370c()
{
	level notify(151652351);
}

/*
	Name: function_a01726dd
	Namespace: namespace_c8fb02a7
	Checksum: 0x892813B2
	Offset: 0x238
	Size: 0x204
	Parameters: 0
	Flags: Linked
*/
function function_a01726dd()
{
	self.var_d6691161 = 3000;
	self.var_5002d77c = 0.7;
	self.var_56b349b4 = 0;
	self.var_cd4099ea = 0;
	self.var_38800c0 = 1;
	self.var_c82ffc5e = 0;
	self.var_d0c7bd52 = 380;
	self.var_f3652bd = "tag_main_rotor";
	self setheliheightcap(1);
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_1435d6c2);
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_6ad9ed56);
	callback::function_d8abfc3d(#"hash_2c1cafe2a67dfef8", &function_6ad9ed56);
	callback::function_d8abfc3d(#"hash_2c1cafe2a67dfef8", &function_b515cb89);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_6258a76c);
	self callback::on_vehicle_collision(&function_adbcb48d);
	self.overridevehiclekilled = &function_f7f4dbf0;
	self thread function_97305c79();
	self thread function_d6742832();
	self thread function_638d1ade();
	self thread function_4f8aa02d();
}

/*
	Name: function_727338d1
	Namespace: namespace_c8fb02a7
	Checksum: 0x29FBD810
	Offset: 0x448
	Size: 0x384
	Parameters: 1
	Flags: Linked, Private
*/
function private function_727338d1(var_7d32de2)
{
	victim = var_7d32de2.activator;
	if(!isplayer(victim))
	{
		return;
	}
	if(victim isinvehicle() && victim getvehicleoccupied().vehicleclass === "helicopter")
	{
		return;
	}
	vehicle = self getlinkedent();
	if(!isdefined(vehicle))
	{
		return;
	}
	var_e5b7c28e = victim.origin + (0, 0, 40);
	rotor_pos = vehicle gettagorigin(vehicle.var_f3652bd);
	/#
		if(getdvarint(#"hash_3b9aedd563f16da4", 0) > 0)
		{
			sphere(rotor_pos, vehicle.var_d0c7bd52, (0, 1, 1), 0.3);
			sphere(var_e5b7c28e, 40, (1, 1, 0), 0.3);
		}
	#/
	if(distancesquared(rotor_pos, var_e5b7c28e) > sqr(40 + vehicle.var_d0c7bd52))
	{
		return;
	}
	var_38609e65 = anglestoup(vehicle getangles());
	/#
		if(getdvarint(#"hash_3b9aedd563f16da4", 0) > 0)
		{
			line(rotor_pos, rotor_pos + (var_38609e65 * 100), (1, 0, 0));
		}
	#/
	projected = vectorprojection(var_e5b7c28e - rotor_pos, var_38609e65);
	if(lengthsquared(projected) > sqr(40))
	{
		return;
	}
	trace = bullettrace(rotor_pos, var_e5b7c28e, 0, vehicle, 1, 1);
	if(trace[#"fraction"] == 1)
	{
		killer = (isdefined(vehicle getseatoccupant(0)) ? vehicle getseatoccupant(0) : vehicle);
		victim.var_f5dc0dbf = 1;
		victim dodamage(victim.health, rotor_pos, killer, vehicle, "", "MOD_CRUSH", 0, vehicle.settings.var_81a2bc21);
	}
}

/*
	Name: function_b5c0079f
	Namespace: namespace_c8fb02a7
	Checksum: 0xD6D79467
	Offset: 0x7D8
	Size: 0x17C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b5c0079f()
{
	rotor_pos = self gettagorigin(self.var_f3652bd);
	if(isdefined(rotor_pos))
	{
		self.var_cb611709 = spawn("trigger_radius", rotor_pos - (0, 0, self.var_d0c7bd52 * 0.5), 0, self.var_d0c7bd52, self.var_d0c7bd52);
		driver = self getseatoccupant(0);
		self.var_cb611709 enablelinkto();
		self.var_cb611709 linkto(self, self.var_f3652bd);
		self.var_cb611709 setexcludeteamfortrigger(driver.team);
		self.var_cb611709 triggerenable(1);
		self.var_cb611709 callback::on_trigger(&function_727338d1);
	}
	else
	{
		/#
			println(("" + self.var_f3652bd) + "");
		#/
	}
}

/*
	Name: function_6ad9ed56
	Namespace: namespace_c8fb02a7
	Checksum: 0x16A65AE2
	Offset: 0x960
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6ad9ed56()
{
	if(getdvarint(#"hash_6e660633f2dbac2a", 1) > 0)
	{
		driver = self getseatoccupant(0);
		if(isdefined(driver) && isplayer(driver))
		{
			self thread player_vehicle::function_d3da7e1e();
		}
	}
}

/*
	Name: function_56ee2902
	Namespace: namespace_c8fb02a7
	Checksum: 0xB5F04875
	Offset: 0x9F0
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_56ee2902(state)
{
	foreach(occupant in self getvehoccupants())
	{
		if(!isplayer(occupant))
		{
			continue;
		}
		occupant clientfield::set_player_uimodel("vehicle.malfunction", state);
	}
}

/*
	Name: function_455f2b9b
	Namespace: namespace_c8fb02a7
	Checksum: 0x9D712290
	Offset: 0xAC0
	Size: 0xCA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_455f2b9b()
{
	self function_803e9bf3(2);
	self setrotorspeed(0.7);
	/#
		if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
		{
			print((("" + self getentnum()) + "") + self getentnum() + "");
		}
	#/
	self.var_38800c0 = 2;
}

/*
	Name: function_2ea47d8
	Namespace: namespace_c8fb02a7
	Checksum: 0xFCA00C27
	Offset: 0xB98
	Size: 0xAA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2ea47d8()
{
	self function_803e9bf3(3);
	self setrotorspeed(0.7);
	/#
		if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
		{
			print(("" + self getentnum()) + "");
		}
	#/
	self.var_38800c0 = 3;
}

/*
	Name: function_b80bf20f
	Namespace: namespace_c8fb02a7
	Checksum: 0x9B38A045
	Offset: 0xC50
	Size: 0xA2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b80bf20f()
{
	self function_803e9bf3(3);
	self setrotorspeed(1);
	/#
		if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
		{
			print(("" + self getentnum()) + "");
		}
	#/
	self.var_38800c0 = 4;
}

/*
	Name: function_a2b127e3
	Namespace: namespace_c8fb02a7
	Checksum: 0xE81008D0
	Offset: 0xD00
	Size: 0xB6
	Parameters: 0
	Flags: Linked
*/
function function_a2b127e3()
{
	self returnplayercontrol();
	self setrotorspeed(1);
	self function_803e9bf3(1);
	/#
		if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
		{
			print(("" + self getentnum()) + "");
		}
	#/
	self.var_38800c0 = 0;
}

/*
	Name: landed_start
	Namespace: namespace_c8fb02a7
	Checksum: 0xCEDDD53E
	Offset: 0xDC0
	Size: 0xBA
	Parameters: 0
	Flags: Linked, Private
*/
function private landed_start()
{
	self takeplayercontrol();
	self function_803e9bf3(0);
	self setrotorspeed(1);
	/#
		if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
		{
			print(("" + self getentnum()) + "");
		}
	#/
	self.var_38800c0 = 1;
}

/*
	Name: function_6aa62d8b
	Namespace: namespace_c8fb02a7
	Checksum: 0x496A9417
	Offset: 0xE88
	Size: 0xBA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6aa62d8b()
{
	self player_vehicle::function_8cf138bb();
	self function_e55e182a();
	self function_803e9bf3(0);
	/#
		if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
		{
			print(("" + self getentnum()) + "");
		}
	#/
	self.var_38800c0 = 5;
}

/*
	Name: function_8b99abde
	Namespace: namespace_c8fb02a7
	Checksum: 0xD1A54B06
	Offset: 0xF50
	Size: 0xBA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8b99abde()
{
	self function_803e9bf3(1);
	self setrotorspeed(1);
	self thread function_7b63d976();
	/#
		if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
		{
			print(("" + self getentnum()) + "");
		}
	#/
	self.var_38800c0 = 6;
}

/*
	Name: function_2a0f9c3c
	Namespace: namespace_c8fb02a7
	Checksum: 0xDC1B03AC
	Offset: 0x1018
	Size: 0xC2
	Parameters: 0
	Flags: Linked
*/
function function_2a0f9c3c()
{
	self takeplayercontrol();
	self function_803e9bf3(3);
	self setrotorspeed(0.7);
	/#
		if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
		{
			print(("" + self getentnum()) + "");
		}
	#/
	self.var_38800c0 = 7;
}

/*
	Name: function_97305c79
	Namespace: namespace_c8fb02a7
	Checksum: 0x4532D98A
	Offset: 0x10E8
	Size: 0x5BE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_97305c79()
{
	self endon(#"death");
	while(isalive(self))
	{
		if(!is_true(self.var_52e23e90) && self.var_38800c0 != 5)
		{
			/#
				if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
				{
					print(("" + self getentnum()) + "");
				}
			#/
			self waittill(#"hash_63016e7b3baecd6b");
		}
		else
		{
			if(self.var_38800c0 == 0)
			{
				self thread function_499252fe();
				/#
					if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
					{
						print(("" + self getentnum()) + "");
					}
				#/
				self waittill(#"hash_2d3ebedb650b9759");
			}
			else
			{
				if(self.var_38800c0 == 1)
				{
					self thread function_1c32d368();
					/#
						if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
						{
							print(("" + self getentnum()) + "");
						}
					#/
					self waittill(#"hash_51cf6123efa445ce");
				}
				else
				{
					if(self.var_38800c0 == 2)
					{
						self thread function_7a66682a();
						self thread function_55a21c7f();
						/#
							if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
							{
								print(("" + self getentnum()) + "");
							}
						#/
						self waittill(#"hash_74bba4f3dddf9fc3");
					}
					else
					{
						if(self.var_38800c0 == 3)
						{
							/#
								if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
								{
									print(("" + self getentnum()) + "");
								}
							#/
							self thread function_637d1595();
							self waittill(#"hash_573e89d990d75799");
						}
						else
						{
							if(self.var_38800c0 == 4)
							{
								self thread function_158a4c05();
								/#
									if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
									{
										print(("" + self getentnum()) + "");
									}
								#/
								self waittill(#"hash_1df27f53ba982860");
							}
							else
							{
								if(self.var_38800c0 == 5)
								{
									/#
										if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
										{
											print(("" + self getentnum()) + "");
										}
									#/
									self waittill(#"hash_b87b2afaca5829c");
								}
								else
								{
									if(self.var_38800c0 == 6)
									{
										self thread function_b2cbe3f8();
										/#
											if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
											{
												print(("" + self getentnum()) + "");
											}
										#/
										self waittill(#"hash_ecab417d1ae9d64");
									}
									else if(self.var_38800c0 == 7)
									{
										/#
											if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
											{
												print(("" + self getentnum()) + "");
											}
										#/
										self waittill(#"hash_453082d0b252c039");
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_d6742832
	Namespace: namespace_c8fb02a7
	Checksum: 0x40F13B04
	Offset: 0x16B0
	Size: 0x1DE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d6742832()
{
	self endon(#"death");
	while(isalive(self))
	{
		if(self.var_c82ffc5e == 0)
		{
			/#
				if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
				{
					print(("" + self getentnum()) + "");
				}
			#/
			self waittill(#"hash_1c3dc90bd345b165");
		}
		else
		{
			if(self.var_c82ffc5e == 1)
			{
				self thread function_a133d262();
				/#
					if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
					{
						print(("" + self getentnum()) + "");
					}
				#/
				self waittill(#"hash_275d130720063641");
			}
			else if(self.var_c82ffc5e == 2)
			{
				/#
					if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
					{
						print(("" + self getentnum()) + "");
					}
				#/
				self waittill(#"hash_b52e63b6ac3646a");
			}
		}
	}
}

/*
	Name: function_638d1ade
	Namespace: namespace_c8fb02a7
	Checksum: 0x8B46BBBC
	Offset: 0x1898
	Size: 0xE8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_638d1ade()
{
	self endon(#"death");
	while(true)
	{
		if(death_circle::is_active())
		{
			if(death_circle::function_f8dae197() <= 4298)
			{
				function_825bbe3f();
			}
			else
			{
				if(death_circle::function_65cb78e7(self.origin) > 0)
				{
					function_c060273d();
				}
				else
				{
					function_586d9fee();
				}
			}
			wait(0.1);
		}
		else
		{
			function_586d9fee();
			wait(2);
		}
	}
}

/*
	Name: function_586d9fee
	Namespace: namespace_c8fb02a7
	Checksum: 0xF04106DD
	Offset: 0x1988
	Size: 0x6E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_586d9fee()
{
	if(self.var_c82ffc5e == 1)
	{
		function_5b6643c1();
		self notify(#"hash_275d130720063641");
	}
	else if(self.var_c82ffc5e == 2)
	{
		function_5b6643c1();
		self notify(#"hash_b52e63b6ac3646a");
	}
}

/*
	Name: function_c060273d
	Namespace: namespace_c8fb02a7
	Checksum: 0xA6C8790C
	Offset: 0x1A00
	Size: 0x36
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c060273d()
{
	if(self.var_c82ffc5e == 0)
	{
		function_3705cb9a();
		self notify(#"hash_1c3dc90bd345b165");
	}
}

/*
	Name: function_825bbe3f
	Namespace: namespace_c8fb02a7
	Checksum: 0x92A206CD
	Offset: 0x1A40
	Size: 0x6E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_825bbe3f()
{
	if(self.var_c82ffc5e == 0)
	{
		function_cfb0d0ad();
		self notify(#"hash_1c3dc90bd345b165");
	}
	else if(self.var_c82ffc5e == 1)
	{
		function_cfb0d0ad();
		self notify(#"hash_275d130720063641");
	}
}

/*
	Name: function_5b6643c1
	Namespace: namespace_c8fb02a7
	Checksum: 0xD80B4768
	Offset: 0x1AB8
	Size: 0x186
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5b6643c1()
{
	self function_56ee2902(0);
	self clientfield::set("update_malfunction", 0);
	self clientfield::set("flickerlights", 3);
	if(!is_true(self.var_52e23e90) && self.var_38800c0 == 5)
	{
		self function_e55e182a();
		self notify(#"hash_b87b2afaca5829c");
	}
	else
	{
		if(self.var_38800c0 == 6)
		{
			function_a2b127e3();
			self notify(#"hash_ecab417d1ae9d64");
		}
		else if(self.var_38800c0 == 7)
		{
			function_a2b127e3();
			self notify(#"hash_453082d0b252c039");
		}
	}
	/#
		if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
		{
			print(("" + self getentnum()) + "");
		}
	#/
	self.var_c82ffc5e = 0;
}

/*
	Name: function_3705cb9a
	Namespace: namespace_c8fb02a7
	Checksum: 0x737E401C
	Offset: 0x1C48
	Size: 0x1A2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3705cb9a()
{
	self function_56ee2902(1);
	self clientfield::set("update_malfunction", 1);
	self clientfield::set("flickerlights", 2);
	if(!is_true(self.var_52e23e90))
	{
		function_6aa62d8b();
		self notify(#"hash_63016e7b3baecd6b");
	}
	else
	{
		if(self.var_38800c0 == 0 && !getdvarint(#"hash_4381be5e131dc9aa", 0))
		{
			function_8b99abde();
			self notify(#"hash_2d3ebedb650b9759");
		}
		else if(self.var_38800c0 == 1)
		{
			function_6aa62d8b();
			self notify(#"hash_51cf6123efa445ce");
		}
	}
	/#
		if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
		{
			print(("" + self getentnum()) + "");
		}
	#/
	self.var_c82ffc5e = 1;
}

/*
	Name: function_cfb0d0ad
	Namespace: namespace_c8fb02a7
	Checksum: 0xE75E287D
	Offset: 0x1DF8
	Size: 0x282
	Parameters: 0
	Flags: Linked, Private
*/
function private function_cfb0d0ad()
{
	self clientfield::set("update_malfunction", 2);
	self clientfield::set("flickerlights", 3);
	self function_56ee2902(2);
	if(!is_true(self.var_52e23e90))
	{
		function_6aa62d8b();
		self notify(#"hash_63016e7b3baecd6b");
	}
	else
	{
		if(self.var_38800c0 == 1)
		{
			function_6aa62d8b();
			self notify(#"hash_51cf6123efa445ce");
		}
		else
		{
			if(self.var_38800c0 == 0 && !getdvarint(#"hash_4381be5e131dc9aa", 0))
			{
				function_2a0f9c3c();
				self notify(#"hash_2d3ebedb650b9759");
			}
			else
			{
				if(self.var_38800c0 == 2)
				{
					function_2a0f9c3c();
					self notify(#"hash_74bba4f3dddf9fc3");
				}
				else
				{
					if(self.var_38800c0 == 3)
					{
						function_2a0f9c3c();
						self notify(#"hash_573e89d990d75799");
					}
					else
					{
						if(self.var_38800c0 == 4)
						{
							function_2a0f9c3c();
							self notify(#"hash_1df27f53ba982860");
						}
						else if(self.var_38800c0 == 6)
						{
							function_2a0f9c3c();
							self notify(#"hash_ecab417d1ae9d64");
						}
					}
				}
			}
		}
	}
	/#
		if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
		{
			print(("" + self getentnum()) + "");
		}
	#/
	self.var_c82ffc5e = 2;
}

/*
	Name: function_a133d262
	Namespace: namespace_c8fb02a7
	Checksum: 0x66077FD6
	Offset: 0x2088
	Size: 0x76
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a133d262()
{
	self notify(#"hash_1707434571fb5e82");
	self endon(#"death", #"hash_275d130720063641", #"hash_1707434571fb5e82");
	waitframe(1);
	wait(30);
	function_cfb0d0ad();
	self notify(#"hash_275d130720063641");
}

/*
	Name: function_82224f4b
	Namespace: namespace_c8fb02a7
	Checksum: 0xB3F3442F
	Offset: 0x2108
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function function_82224f4b(scale)
{
	self notify("6aa6d6495c54ef81");
	self endon("6aa6d6495c54ef81");
	self endon(#"death", #"hash_ecab417d1ae9d64", #"hash_1d3acb3966f46517");
	while(true)
	{
		accel = anglestoup(self.angles) * scale;
		self setphysacceleration((accel[0], accel[1], -200));
		waitframe(1);
	}
}

/*
	Name: function_838515ae
	Namespace: namespace_c8fb02a7
	Checksum: 0xC5816F98
	Offset: 0x21D8
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_838515ae()
{
	self takeplayercontrol();
	self clientfield::set("update_malfunction", 2);
	self setrotorspeed(0.7);
	self clientfield::set("flickerlights", 3);
	self function_56ee2902(2);
	self thread function_82224f4b(1600);
}

/*
	Name: function_7b63d976
	Namespace: namespace_c8fb02a7
	Checksum: 0x1B0061D7
	Offset: 0x2298
	Size: 0x150
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7b63d976()
{
	self endon(#"death", #"hash_ecab417d1ae9d64");
	wait(5);
	self clientfield::set("flickerlights", 2);
	while(true)
	{
		self function_838515ae();
		wait(randomfloatrange(1, 3));
		self notify(#"hash_1d3acb3966f46517");
		self returnplayercontrol();
		self setrotorspeed(1);
		self function_56ee2902(1);
		self clientfield::set("update_malfunction", 1);
		self clientfield::set("flickerlights", 2);
		wait(randomfloatrange(3, 10));
	}
}

/*
	Name: function_54f9ca32
	Namespace: namespace_c8fb02a7
	Checksum: 0xAC797F01
	Offset: 0x23F0
	Size: 0x36
	Parameters: 0
	Flags: Linked, Private
*/
function private function_54f9ca32()
{
	return self.var_38800c0 === 3 || self.var_38800c0 === 4 || self.var_38800c0 === 7;
}

/*
	Name: function_adbcb48d
	Namespace: namespace_c8fb02a7
	Checksum: 0xC6BA38C7
	Offset: 0x2430
	Size: 0x6E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_adbcb48d(params)
{
	if(is_true(self function_54f9ca32()))
	{
		self dodamage(self.health, self.origin, undefined, undefined, "", "MOD_IMPACT");
		return;
	}
}

/*
	Name: function_4f8aa02d
	Namespace: namespace_c8fb02a7
	Checksum: 0x90F8E734
	Offset: 0x24A8
	Size: 0x14A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4f8aa02d()
{
	self endon(#"death");
	while(true)
	{
		waterheight = getwaterheight(self.origin, 100, -10000);
		if(waterheight != -131072)
		{
			var_19dbcac7 = (self.origin[2] + -70) - waterheight;
			if(var_19dbcac7 <= 0)
			{
				self dodamage(self.health, self.origin, undefined, undefined, "", "MOD_IMPACT");
			}
			if(var_19dbcac7 < 1000)
			{
				wait(0.25);
			}
			else
			{
				if(var_19dbcac7 < 2000)
				{
					wait(1);
				}
				else
				{
					time = math::clamp(int(var_19dbcac7 / 1000), 1, 5);
					wait(time);
				}
			}
		}
		else
		{
			wait(2);
		}
	}
}

/*
	Name: function_f7f4dbf0
	Namespace: namespace_c8fb02a7
	Checksum: 0x6362F66E
	Offset: 0x2600
	Size: 0xCC
	Parameters: 8
	Flags: Linked, Private
*/
function private function_f7f4dbf0(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	self function_e55e182a();
	self function_56ee2902(0);
	self clientfield::set("update_malfunction", 0);
	self clientfield::set("flickerlights", 3);
	self function_803e9bf3(0);
}

/*
	Name: function_e55e182a
	Namespace: namespace_c8fb02a7
	Checksum: 0xA9A3EA04
	Offset: 0x26D8
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e55e182a()
{
	self function_803e9bf3(0);
	self.var_38800c0 = 1;
	player_vehicle::turn_off();
	if(isdefined(self.var_cb611709))
	{
		self.var_cb611709 delete();
	}
}

/*
	Name: function_9ffa5fd
	Namespace: namespace_c8fb02a7
	Checksum: 0x7E875564
	Offset: 0x2748
	Size: 0x2A
	Parameters: 2
	Flags: Linked
*/
function function_9ffa5fd(var_92eb9b7d, var_6d872cea)
{
	return self function_47fb62f4(var_92eb9b7d, var_6d872cea);
}

/*
	Name: function_60bfc90
	Namespace: namespace_c8fb02a7
	Checksum: 0xCB84A8DB
	Offset: 0x2780
	Size: 0x9C
	Parameters: 3
	Flags: Linked
*/
function function_60bfc90(player, var_92eb9b7d, var_6d872cea)
{
	self endon(#"death");
	player function_a61cb23e(1);
	var_78efa1b4 = self function_ff1bf59c(var_92eb9b7d, var_6d872cea);
	wait(var_78efa1b4 * 2);
	if(isdefined(player))
	{
		player function_a61cb23e(0);
	}
}

/*
	Name: function_b1088764
	Namespace: namespace_c8fb02a7
	Checksum: 0x40ECA492
	Offset: 0x2828
	Size: 0x74
	Parameters: 3
	Flags: Linked
*/
function function_b1088764(player, var_92eb9b7d, var_6d872cea)
{
	player luinotifyevent(#"quick_fade", 0);
	player luinotifyeventtospectators(#"quick_fade", 0);
	self thread function_60bfc90(player, var_92eb9b7d, var_6d872cea);
}

/*
	Name: function_b515cb89
	Namespace: namespace_c8fb02a7
	Checksum: 0xFDA21A9F
	Offset: 0x28A8
	Size: 0x10C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b515cb89(params)
{
	if(isalive(self))
	{
		if(params.eventstruct.seat_index === 0)
		{
			function_dce84927();
		}
		else if(params.eventstruct.old_seat_index === 0)
		{
			function_d7021cf2();
		}
		if(isdefined(params.player))
		{
			enter_seat = params.eventstruct.seat_index;
			exit_seat = params.eventstruct.old_seat_index;
			if(function_9ffa5fd(exit_seat, enter_seat))
			{
				self function_b1088764(params.player, exit_seat, enter_seat);
			}
		}
	}
}

/*
	Name: function_1435d6c2
	Namespace: namespace_c8fb02a7
	Checksum: 0xDE4475F1
	Offset: 0x29C0
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1435d6c2(params)
{
	if(isalive(self))
	{
		if(params.eventstruct.seat_index === 0)
		{
			function_dce84927();
		}
		if(isdefined(params.player))
		{
			enter_seat = params.eventstruct.seat_index;
			if(function_9ffa5fd(undefined, enter_seat))
			{
				self function_b1088764(params.player, undefined, enter_seat);
			}
		}
	}
}

/*
	Name: function_6258a76c
	Namespace: namespace_c8fb02a7
	Checksum: 0x70493192
	Offset: 0x2A90
	Size: 0xF4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6258a76c(params)
{
	if(isalive(self))
	{
		occupants = self getvehoccupants();
		if(!isdefined(occupants) || !occupants.size)
		{
			if(self.var_38800c0 == 1)
			{
				self function_e55e182a();
				self notify(#"hash_51cf6123efa445ce");
			}
		}
		if(params.eventstruct.seat_index === 0)
		{
			function_d7021cf2();
		}
	}
	if(isdefined(params.player))
	{
		params.player clientfield::set_player_uimodel("vehicle.malfunction", 0);
	}
}

/*
	Name: function_dce84927
	Namespace: namespace_c8fb02a7
	Checksum: 0xF050826D
	Offset: 0x2B90
	Size: 0x1D6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_dce84927()
{
	if(!is_true(self.var_52e23e90))
	{
		params = spawnstruct();
		params.var_30a04b16 = 1;
		player_vehicle::turn_on(params);
		/#
			if(getdvarint(#"hash_26be05fed16f7abd", 0) > 0)
			{
				print(("" + self getentnum()) + "");
			}
		#/
		self.var_38800c0 = 1;
		self.var_cd532f2c = gettime() + 3000;
		if(getdvarint(#"hash_68addfc92e304f21", 1) && is_true(self.var_dc20225f))
		{
			self function_b5c0079f();
		}
		self notify(#"hash_63016e7b3baecd6b");
	}
	else
	{
		if(self.var_38800c0 == 2)
		{
			if(self.var_c82ffc5e == 0)
			{
				function_a2b127e3();
			}
			else
			{
				function_8b99abde();
			}
			self notify(#"hash_74bba4f3dddf9fc3");
		}
		else if(self.var_38800c0 == 3)
		{
			function_b80bf20f();
			self notify(#"hash_573e89d990d75799");
		}
	}
}

/*
	Name: function_d7021cf2
	Namespace: namespace_c8fb02a7
	Checksum: 0xADEA13AC
	Offset: 0x2D70
	Size: 0x96
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d7021cf2()
{
	if(self.var_38800c0 == 0 && !getdvarint(#"hash_4381be5e131dc9aa", 0))
	{
		function_455f2b9b();
		self notify(#"hash_2d3ebedb650b9759");
	}
	else if(self.var_38800c0 == 4)
	{
		function_2ea47d8();
		self notify(#"hash_1df27f53ba982860");
	}
}

/*
	Name: function_1c32d368
	Namespace: namespace_c8fb02a7
	Checksum: 0x7B74D7C8
	Offset: 0x2E10
	Size: 0x184
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1c32d368()
{
	self notify(#"hash_203455df2978ba88");
	self endon(#"death", #"hash_51cf6123efa445ce", #"hash_203455df2978ba88");
	waitframe(1);
	while(true)
	{
		player = self getseatoccupant(0);
		if(isdefined(player) && (!isdefined(self.var_cd532f2c) || (gettime() - self.var_cd532f2c) >= 0))
		{
			self.var_cd532f2c = undefined;
			move = player getnormalizedmovement();
			var_d4865741 = player vehiclemoveupbuttonpressed() || (isdefined(move) && (abs(move[0]) > 0.2 || abs(move[1]) > 0.2));
			if(var_d4865741)
			{
				function_a2b127e3();
				self notify(#"hash_51cf6123efa445ce");
				break;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_499252fe
	Namespace: namespace_c8fb02a7
	Checksum: 0x9DFE2D53
	Offset: 0x2FA0
	Size: 0x1AC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_499252fe()
{
	self notify(#"hash_69e2c4ec2a3d91b4");
	self endon(#"death", #"hash_2d3ebedb650b9759", #"hash_69e2c4ec2a3d91b4");
	waitframe(1);
	while(true)
	{
		player = self getseatoccupant(0);
		if(!isdefined(player) || !player function_6947dde2() || player vehiclemoveupbuttonpressed())
		{
			waitframe(1);
			continue;
		}
		move = player getnormalizedmovement();
		if(isdefined(move) && (abs(move[0]) > 0.2 || abs(move[1]) > 0.2))
		{
			waitframe(1);
			continue;
		}
		if(self function_479389f3() && !getdvarint(#"hash_4381be5e131dc9aa", 0))
		{
			landed_start();
			self notify(#"hash_2d3ebedb650b9759");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_7a66682a
	Namespace: namespace_c8fb02a7
	Checksum: 0x275D1B63
	Offset: 0x3158
	Size: 0xF4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7a66682a()
{
	self notify(#"hash_73b33f91c657e33e");
	self endon(#"death", #"hash_74bba4f3dddf9fc3", #"hash_73b33f91c657e33e");
	waitframe(1);
	while(true)
	{
		if(self function_479389f3())
		{
			occupants = self getvehoccupants();
			if(!isdefined(occupants) || !occupants.size)
			{
				self function_e55e182a();
			}
			else
			{
				landed_start();
			}
			self notify(#"hash_74bba4f3dddf9fc3");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_637d1595
	Namespace: namespace_c8fb02a7
	Checksum: 0x8A71D3F2
	Offset: 0x3258
	Size: 0xF4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_637d1595()
{
	self notify(#"hash_d4c7c76098ff4b8");
	self endon(#"death", #"hash_573e89d990d75799", #"hash_d4c7c76098ff4b8");
	waitframe(1);
	while(true)
	{
		if(self function_479389f3())
		{
			occupants = self getvehoccupants();
			if(!isdefined(occupants) || !occupants.size)
			{
				self function_e55e182a();
			}
			else
			{
				landed_start();
			}
			self notify(#"hash_573e89d990d75799");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_b2cbe3f8
	Namespace: namespace_c8fb02a7
	Checksum: 0xF7503BCC
	Offset: 0x3358
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b2cbe3f8()
{
	self notify(#"hash_5b78f14ae4e8dc43");
	self endon(#"death", #"hash_ecab417d1ae9d64", #"hash_5b78f14ae4e8dc43");
	waitframe(1);
	while(true)
	{
		if(self function_479389f3())
		{
			function_6aa62d8b();
			self notify(#"hash_ecab417d1ae9d64");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_55a21c7f
	Namespace: namespace_c8fb02a7
	Checksum: 0x8254DA7E
	Offset: 0x3408
	Size: 0x76
	Parameters: 0
	Flags: Linked, Private
*/
function private function_55a21c7f()
{
	self notify(#"hash_655e0e5013875cda");
	self endon(#"death", #"hash_74bba4f3dddf9fc3", #"hash_655e0e5013875cda");
	waitframe(1);
	wait(1);
	function_2ea47d8();
	self notify(#"hash_74bba4f3dddf9fc3");
}

/*
	Name: function_158a4c05
	Namespace: namespace_c8fb02a7
	Checksum: 0xEC2D46FC
	Offset: 0x3488
	Size: 0xA6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_158a4c05()
{
	self notify(#"hash_413db73113f75c85");
	self endon(#"death", #"hash_1df27f53ba982860", #"hash_413db73113f75c85");
	waitframe(1);
	wait(0.8);
	if(self.var_c82ffc5e == 0)
	{
		function_a2b127e3();
	}
	else
	{
		function_8b99abde();
	}
	self notify(#"hash_1df27f53ba982860");
}

/*
	Name: function_479389f3
	Namespace: namespace_c8fb02a7
	Checksum: 0x97A2728E
	Offset: 0x3538
	Size: 0x682
	Parameters: 0
	Flags: Linked, Private
*/
function private function_479389f3()
{
	if(self function_5e768331() > 200)
	{
		return false;
	}
	height = self.height;
	/#
		assert(isdefined(self.radius));
	#/
	/#
		assert(isdefined(self.height));
	#/
	var_33a206d0 = [];
	var_33a206d0[#"leftrear"] = self gettagorigin("tag_ground_contact_left_rear");
	var_33a206d0[#"leftmiddle"] = self gettagorigin("tag_ground_contact_left_middle");
	var_33a206d0[#"leftfront"] = self gettagorigin("tag_ground_contact_left_front");
	var_8fc02d3b = [];
	var_8fc02d3b[#"rightrear"] = self gettagorigin("tag_ground_contact_right_rear");
	var_8fc02d3b[#"rightmiddle"] = self gettagorigin("tag_ground_contact_right_middle");
	var_8fc02d3b[#"rightfront"] = self gettagorigin("tag_ground_contact_right_front");
	var_df47b913 = [];
	foreach(tag, origin in var_33a206d0)
	{
		if(!isdefined(origin))
		{
			return false;
		}
		var_df47b913[tag] = physicstrace(origin + vectorscale((0, 0, 1), 25), origin - vectorscale((0, 0, 1), 75), (0, 0, 0), (0, 0, 0), self, 2);
	}
	var_dc8469e2 = [];
	foreach(tag, origin in var_8fc02d3b)
	{
		if(!isdefined(origin))
		{
			return false;
		}
		var_dc8469e2[tag] = physicstrace(origin + vectorscale((0, 0, 1), 25), origin - vectorscale((0, 0, 1), 75), (0, 0, 0), (0, 0, 0), self, 2);
	}
	var_d643c4fc = 0;
	var_e10b67f7 = [];
	var_b0e8278f = (0, 0, 0);
	var_683999d6 = (0, 0, 0);
	var_4c962569 = 0;
	foreach(trace in var_df47b913)
	{
		if(isdefined(trace[#"entity"]))
		{
			var_d643c4fc = 1;
			continue;
		}
		if(trace[#"fraction"] < 1)
		{
			var_b0e8278f = var_b0e8278f + var_33a206d0[tag];
			var_4c962569 = var_4c962569 + (trace[#"position"][2] - var_33a206d0[tag][2]);
			var_683999d6 = var_683999d6 + trace[#"normal"];
			var_e10b67f7[tag] = trace;
		}
	}
	var_d3532cfe = [];
	foreach(trace in var_dc8469e2)
	{
		if(isdefined(trace[#"entity"]))
		{
			var_d643c4fc = 1;
			continue;
		}
		if(trace[#"fraction"] < 1)
		{
			var_b0e8278f = var_b0e8278f + var_8fc02d3b[tag];
			var_4c962569 = var_4c962569 + (trace[#"position"][2] - var_8fc02d3b[tag][2]);
			var_683999d6 = var_683999d6 + trace[#"normal"];
			var_d3532cfe[tag] = trace;
		}
	}
	if(var_e10b67f7.size > 0 || var_d3532cfe.size > 0)
	{
		var_683999d6 = var_683999d6 / (var_d3532cfe.size + var_e10b67f7.size);
		self.var_eb4e4182 = var_683999d6;
	}
	if(var_683999d6[2] < 0.94)
	{
		return false;
	}
	if(var_e10b67f7.size == 0 || var_d3532cfe.size == 0 || (var_d3532cfe.size + var_e10b67f7.size) < 3)
	{
		return false;
	}
	if(var_d643c4fc)
	{
		return false;
	}
	var_4c962569 = var_4c962569 / ((var_d3532cfe.size + var_e10b67f7.size) + 1);
	if(var_4c962569 > 20)
	{
		return false;
	}
	var_b0e8278f = var_b0e8278f / (var_d3532cfe.size + var_e10b67f7.size);
	self.helilandingorigin = var_b0e8278f;
	self.var_6fac6f50 = var_4c962569;
	self.var_67136cb0 = var_683999d6;
	return true;
}

