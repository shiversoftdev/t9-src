#using scripts\core_common\util_shared.csc;

#namespace beam_shared;

/*
	Name: function_6dc22e55
	Namespace: beam_shared
	Checksum: 0xCD0A3DE
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6dc22e55()
{
	level notify(-72360785);
}

#namespace beam;

/*
	Name: launch
	Namespace: beam
	Checksum: 0xF9AC3A48
	Offset: 0x98
	Size: 0x1C0
	Parameters: 6
	Flags: Linked
*/
function launch(ent_1, str_tag1, ent_2, str_tag2, str_beam_type, var_ee0708f0)
{
	s_beam = _get_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
	if(!isdefined(s_beam))
	{
		s_beam = _new_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
	}
	if(self == level)
	{
		if(isdefined(level.localplayers))
		{
			foreach(player in level.localplayers)
			{
				if(isdefined(player))
				{
					beam_id = player launch(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
					if(!is_true(var_ee0708f0))
					{
						return beam_id;
					}
				}
			}
		}
	}
	else if(isdefined(s_beam))
	{
		s_beam.beam_id = beamlaunch(self.localclientnum, ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
		self thread _kill_on_ent_death(self.localclientnum, s_beam, ent_1, ent_2);
		return s_beam.beam_id;
	}
}

/*
	Name: function_cfb2f62a
	Namespace: beam
	Checksum: 0xD9A190B
	Offset: 0x260
	Size: 0xE4
	Parameters: 6
	Flags: Linked
*/
function function_cfb2f62a(localclientnum, ent_1, str_tag1, ent_2, str_tag2, str_beam_type)
{
	s_beam = _get_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
	if(!isdefined(s_beam))
	{
		s_beam = _new_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
	}
	if(isdefined(s_beam))
	{
		s_beam.beam_id = beamlaunch(localclientnum, ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
		self thread _kill_on_ent_death(localclientnum, s_beam, ent_1, ent_2);
		return s_beam.beam_id;
	}
	return -1;
}

/*
	Name: kill
	Namespace: beam
	Checksum: 0x20F1B916
	Offset: 0x350
	Size: 0x174
	Parameters: 5
	Flags: Linked
*/
function kill(ent_1, str_tag1, ent_2, str_tag2, str_beam_type)
{
	if(isdefined(self.active_beams))
	{
		s_beam = _get_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
		arrayremovevalue(self.active_beams, s_beam, 0);
	}
	if(self == level)
	{
		if(isdefined(level.localplayers))
		{
			foreach(player in level.localplayers)
			{
				if(isdefined(player))
				{
					player kill(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
				}
			}
		}
	}
	else if(isdefined(s_beam))
	{
		s_beam notify(#"kill");
		beamkill(self.localclientnum, s_beam.beam_id);
	}
}

/*
	Name: function_47deed80
	Namespace: beam
	Checksum: 0xF5B6BC6D
	Offset: 0x4D0
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_47deed80(localclientnum, beam_id)
{
	if(isdefined(level.active_beams))
	{
		s_beam = function_1c0feeb0(beam_id);
		arrayremovevalue(level.active_beams, s_beam, 0);
	}
	if(isdefined(s_beam))
	{
		s_beam notify(#"kill");
		beamkill(localclientnum, s_beam.beam_id);
	}
}

/*
	Name: _new_beam
	Namespace: beam
	Checksum: 0x1A560759
	Offset: 0x578
	Size: 0x108
	Parameters: 5
	Flags: Linked, Private
*/
function private _new_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type)
{
	if(!isdefined(self.active_beams))
	{
		self.active_beams = [];
	}
	s_beam = spawnstruct();
	s_beam.ent_1 = ent_1;
	s_beam.str_tag1 = str_tag1;
	s_beam.ent_2 = ent_2;
	s_beam.str_tag2 = str_tag2;
	s_beam.str_beam_type = str_beam_type;
	if(!isdefined(self.active_beams))
	{
		self.active_beams = [];
	}
	else if(!isarray(self.active_beams))
	{
		self.active_beams = array(self.active_beams);
	}
	self.active_beams[self.active_beams.size] = s_beam;
	return s_beam;
}

/*
	Name: _get_beam
	Namespace: beam
	Checksum: 0x47E8EF9E
	Offset: 0x688
	Size: 0x110
	Parameters: 5
	Flags: Linked, Private
*/
function private _get_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type)
{
	if(isdefined(self.active_beams))
	{
		foreach(s_beam in self.active_beams)
		{
			if(s_beam.ent_1 === ent_1 && s_beam.str_tag1 === str_tag1 && s_beam.ent_2 === ent_2 && s_beam.str_tag2 === str_tag2 && s_beam.str_beam_type === str_beam_type)
			{
				return s_beam;
			}
		}
	}
}

/*
	Name: function_1c0feeb0
	Namespace: beam
	Checksum: 0x89D0FB1F
	Offset: 0x7A0
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1c0feeb0(beam_id)
{
	if(isdefined(level.active_beams))
	{
		foreach(s_beam in level.active_beams)
		{
			if(s_beam.beam_id === beam_id)
			{
				return s_beam;
			}
		}
	}
}

/*
	Name: _kill_on_ent_death
	Namespace: beam
	Checksum: 0xA7BD36E
	Offset: 0x850
	Size: 0xAC
	Parameters: 4
	Flags: Linked, Private
*/
function private _kill_on_ent_death(localclientnum, s_beam, ent_1, ent_2)
{
	s_beam endon(#"kill");
	util::waittill_any_ents(ent_1, "death", ent_2, "death");
	if(isdefined(self))
	{
		arrayremovevalue(self.active_beams, s_beam, 0);
		beamkill(localclientnum, s_beam.beam_id);
	}
}

