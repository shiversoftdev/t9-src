#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace battletracks;

/*
	Name: function_22f4d615
	Namespace: battletracks
	Checksum: 0xA68B21F2
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_22f4d615()
{
	level notify(643592300);
}

/*
	Name: function_89f2df9
	Namespace: battletracks
	Checksum: 0x3994545D
	Offset: 0xD0
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
	Checksum: 0x632F519
	Offset: 0x118
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
	Checksum: 0x898433B9
	Offset: 0x158
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
	Checksum: 0x35E4C3DA
	Offset: 0x210
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
	Checksum: 0x65362D09
	Offset: 0x2A8
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
	Checksum: 0x4B554A66
	Offset: 0x460
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
	Checksum: 0xC4F91465
	Offset: 0x490
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
	Checksum: 0x440EC197
	Offset: 0x508
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
	Checksum: 0x2FA7617D
	Offset: 0x558
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
	Checksum: 0xB169790B
	Offset: 0x610
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
	Checksum: 0xFA4AA246
	Offset: 0x698
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
						if(isdefined(var_3ee3065f) && isdefined(var_3ee3065f.var_921a9ffa))
						{
							vehicle.var_23944654 = var_3ee3065f.var_921a9ffa;
							vehicle playsoundwithnotify(vehicle.var_23944654, "battletrack_complete");
							vehicle clientfield::set("battletrack_active", 1);
						}
					}
				}
			}
		}
	}
}

