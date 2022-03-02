#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace battletracks;

/*
	Name: function_89f2df9
	Namespace: battletracks
	Checksum: 0x96BBF329
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"battletracks", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: battletracks
	Checksum: 0xAD5EF3F7
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "battletrack_active", 1, 1, "int");
}

/*
	Name: function_860f46d6
	Namespace: battletracks
	Checksum: 0x11FA7B51
	Offset: 0x138
	Size: 0xAC
	Parameters: 1
	Flags: Private, Event
*/
event private function_860f46d6(eventstruct)
{
	if(isplayer(self))
	{
		vehicle = self getvehicleoccupied();
		if(eventstruct.seat_index == 0 || (isdefined(vehicle.var_260e3593) && vehicle.var_260e3593 == eventstruct.seat_index))
		{
			vehicle function_fe45d0ae();
			self function_afb0648d(vehicle);
		}
	}
}

/*
	Name: function_c8e0f88d
	Namespace: battletracks
	Checksum: 0xD782ECC4
	Offset: 0x1F0
	Size: 0x8C
	Parameters: 1
	Flags: Private, Event
*/
event private function_c8e0f88d(eventstruct)
{
	if(isplayer(self))
	{
		if(eventstruct.seat_index == 0 || (isdefined(eventstruct.vehicle.var_260e3593) && eventstruct.vehicle.var_260e3593 == eventstruct.seat_index))
		{
			eventstruct.vehicle function_982d5b1();
		}
	}
}

/*
	Name: function_63d4043f
	Namespace: battletracks
	Checksum: 0x4EFD9185
	Offset: 0x288
	Size: 0x1AC
	Parameters: 1
	Flags: Private, Event
*/
event private function_63d4043f(eventstruct)
{
	if(isplayer(self))
	{
		if(eventstruct.seat_index == 0 || (isdefined(eventstruct.vehicle.var_260e3593) && eventstruct.vehicle.var_260e3593 == eventstruct.seat_index))
		{
			if(!(eventstruct.var_21911287 == 0 || (isdefined(eventstruct.vehicle.var_260e3593) && eventstruct.vehicle.var_260e3593 == eventstruct.var_21911287)))
			{
				eventstruct.vehicle function_fe45d0ae();
				self function_afb0648d(eventstruct.vehicle);
			}
		}
		else if(eventstruct.var_21911287 == 0 || (isdefined(eventstruct.vehicle.var_260e3593) && eventstruct.vehicle.var_260e3593 == eventstruct.var_21911287))
		{
			if(!(eventstruct.seat_index == 0 || (isdefined(eventstruct.vehicle.var_260e3593) && eventstruct.vehicle.var_260e3593 == eventstruct.seat_index)))
			{
				eventstruct.vehicle function_982d5b1();
			}
		}
	}
}

/*
	Name: function_c5f9a554
	Namespace: battletracks
	Checksum: 0x9ACB34CD
	Offset: 0x440
	Size: 0x24
	Parameters: 1
	Flags: Private, Event
*/
event private function_c5f9a554(eventstruct)
{
	self function_fe45d0ae();
}

/*
	Name: function_35559816
	Namespace: battletracks
	Checksum: 0x263348D2
	Offset: 0x470
	Size: 0x6C
	Parameters: 1
	Flags: Private, Event
*/
event private function_35559816(eventstruct)
{
	if(isvehicle(eventstruct.vehicle))
	{
		if(isdefined(self.var_23944654))
		{
			eventstruct.vehicle function_fe45d0ae();
		}
		else
		{
			self function_afb0648d(eventstruct.vehicle);
		}
	}
}

/*
	Name: function_29e6e4b2
	Namespace: battletracks
	Checksum: 0x1299835E
	Offset: 0x4E8
	Size: 0x44
	Parameters: 1
	Flags: Private, Event
*/
event private function_29e6e4b2(eventstruct)
{
	if(isvehicle(eventstruct.vehicle))
	{
		self function_afb0648d(eventstruct.vehicle);
	}
}

/*
	Name: function_982d5b1
	Namespace: battletracks
	Checksum: 0x8C73D998
	Offset: 0x538
	Size: 0xAE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_982d5b1()
{
	if(!sessionmodeiscampaigngame())
	{
		self endon(#"death");
		self endon(#"hash_10f5e7a492971517");
		wait(getdvarint(#"hash_69d64509de665052", 5));
		if(isdefined(self.var_23944654))
		{
			self clientfield::set("battletrack_active", 0);
			self stopsound(self.var_23944654);
			self.var_23944654 = undefined;
		}
	}
}

/*
	Name: function_fe45d0ae
	Namespace: battletracks
	Checksum: 0x2184D2E3
	Offset: 0x5F0
	Size: 0x7E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fe45d0ae()
{
	if(!sessionmodeiscampaigngame())
	{
		self notify(#"hash_10f5e7a492971517");
		if(isdefined(self.var_23944654))
		{
			self clientfield::set("battletrack_active", 0);
			self stopsound(self.var_23944654);
			self.var_23944654 = undefined;
		}
	}
}

/*
	Name: function_afb0648d
	Namespace: battletracks
	Checksum: 0x6514A50
	Offset: 0x678
	Size: 0x1AC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_afb0648d(vehicle)
{
	if(!sessionmodeiscampaigngame())
	{
		if(self isinvehicle())
		{
			vehicle function_fe45d0ae();
			vehicle.var_23944654 = undefined;
			if(isdefined(vehicle.var_13c5ef5f))
			{
				var_e273c985 = self function_18df0fba(vehicle.var_13c5ef5f);
				var_45750595 = getscriptbundle(var_e273c985);
				if(isdefined(var_45750595))
				{
					if(!isdefined(self.var_7b87b98c))
					{
						self.var_7b87b98c = 0;
					}
					else
					{
						self.var_7b87b98c = (self.var_7b87b98c + 1) % var_45750595.musictrack.size;
					}
					track_name = var_45750595.musictrack[self.var_7b87b98c].track;
					if(isdefined(track_name))
					{
						var_3ee3065f = getscriptbundle(track_name);
						if(isdefined(var_3ee3065f) && isdefined(var_3ee3065f.soundalias))
						{
							vehicle.var_23944654 = var_3ee3065f.soundalias;
							vehicle playsoundwithnotify(vehicle.var_23944654, "battletrack_complete");
							vehicle clientfield::set("battletrack_active", 1);
						}
					}
				}
			}
		}
	}
}

