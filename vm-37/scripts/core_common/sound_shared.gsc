#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace sound;

/*
	Name: loop_fx_sound
	Namespace: sound
	Checksum: 0xD1B4F2BE
	Offset: 0xA0
	Size: 0x94
	Parameters: 3
	Flags: Linked
*/
function loop_fx_sound(alias, origin, ender)
{
	org = spawn("script_origin", (0, 0, 0));
	if(isdefined(ender))
	{
		thread loop_delete(ender, org);
		self endon(ender);
	}
	org.origin = origin;
	org playloopsound(alias);
}

/*
	Name: loop_delete
	Namespace: sound
	Checksum: 0x2C1A42EF
	Offset: 0x140
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function loop_delete(ender, ent)
{
	ent endon(#"death");
	self waittill(ender);
	ent delete();
}

/*
	Name: play_in_space
	Namespace: sound
	Checksum: 0x6503BB16
	Offset: 0x198
	Size: 0xBC
	Parameters: 3
	Flags: Linked
*/
function play_in_space(alias, origin, master)
{
	org = spawn("script_origin", (0, 0, 1));
	if(!isdefined(master))
	{
		master = self.origin;
	}
	org.origin = master;
	org playsoundwithnotify(origin, "sounddone");
	org waittill(#"sounddone");
	if(isdefined(org))
	{
		org deletedelay();
	}
}

/*
	Name: loop_on_tag
	Namespace: sound
	Checksum: 0x56E5EC36
	Offset: 0x260
	Size: 0x14C
	Parameters: 3
	Flags: Linked
*/
function loop_on_tag(alias, tag, bstopsoundondeath)
{
	org = spawn("script_origin", (0, 0, 0));
	org endon(#"death");
	if(!isdefined(bstopsoundondeath))
	{
		bstopsoundondeath = 1;
	}
	if(bstopsoundondeath)
	{
		thread util::delete_on_death(org);
	}
	if(isdefined(tag))
	{
		org linkto(self, tag, (0, 0, 0), (0, 0, 0));
	}
	else
	{
		org.origin = self.origin;
		org.angles = self.angles;
		org linkto(self);
	}
	org playloopsound(alias);
	self waittill("stop sound" + alias);
	org stoploopsound(alias);
	org delete();
}

/*
	Name: play_on_tag
	Namespace: sound
	Checksum: 0x3A1E2C48
	Offset: 0x3B8
	Size: 0x204
	Parameters: 5
	Flags: Linked
*/
function play_on_tag(alias, tag, ends_on_death, var_50bba55f, var_82ea274f)
{
	if(self ai::is_dead_sentient())
	{
		return;
	}
	org = spawn("script_origin", self.origin);
	org endon(#"death");
	thread delete_on_death_wait_sound(org, "sounddone");
	if(isdefined(ends_on_death))
	{
		org linkto(self, ends_on_death, (0, 0, 0), (0, 0, 0));
	}
	else
	{
		org.origin = self.origin;
		org.angles = self.angles;
		org linkto(self);
	}
	/#
		if(self === level.player_radio_emitter)
		{
			println("" + tag);
		}
	#/
	org playsoundwithnotify(tag, "sounddone");
	if(isdefined(var_50bba55f))
	{
		/#
			assert(var_50bba55f, "");
		#/
		if(!isdefined(wait_for_sounddone_or_death(org)))
		{
			org stopsounds();
		}
		waitframe(1);
	}
	else
	{
		org waittill(#"sounddone");
	}
	if(isdefined(var_82ea274f))
	{
		self notify(var_82ea274f);
	}
	org delete();
}

/*
	Name: wait_for_sounddone_or_death
	Namespace: sound
	Checksum: 0x6A1C2577
	Offset: 0x5C8
	Size: 0x60
	Parameters: 2
	Flags: Linked
*/
function wait_for_sounddone_or_death(org, other)
{
	if(isdefined(other))
	{
		other endon(#"death");
	}
	self endon(#"death");
	org waittill(#"sounddone");
	return true;
}

/*
	Name: delete_on_death_wait_sound
	Namespace: sound
	Checksum: 0x19B57FFD
	Offset: 0x630
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function delete_on_death_wait_sound(ent, sounddone)
{
	ent endon(#"death");
	self waittill(#"death");
	if(isdefined(ent))
	{
		if(ent iswaitingonsound())
		{
			ent waittill(sounddone);
		}
		ent deletedelay();
	}
}

/*
	Name: play_on_entity
	Namespace: sound
	Checksum: 0x4D75A3B9
	Offset: 0x6B8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function play_on_entity(alias)
{
	play_on_tag(alias);
}

/*
	Name: stop_loop_on_entity
	Namespace: sound
	Checksum: 0x4E0E7128
	Offset: 0x6E8
	Size: 0x20
	Parameters: 1
	Flags: None
*/
function stop_loop_on_entity(alias)
{
	self notify("stop sound" + alias);
}

/*
	Name: loop_on_entity
	Namespace: sound
	Checksum: 0xE2B0E7BF
	Offset: 0x710
	Size: 0x144
	Parameters: 2
	Flags: None
*/
function loop_on_entity(alias, offset)
{
	org = spawn("script_origin", (0, 0, 0));
	org endon(#"death");
	thread util::delete_on_death(org);
	if(isdefined(offset))
	{
		org.origin = self.origin + offset;
		org.angles = self.angles;
		org linkto(self);
	}
	else
	{
		org.origin = self.origin;
		org.angles = self.angles;
		org linkto(self);
	}
	org playloopsound(alias);
	self waittill("stop sound" + alias);
	org stoploopsound(0.1);
	org delete();
}

/*
	Name: loop_in_space
	Namespace: sound
	Checksum: 0xC5031E71
	Offset: 0x860
	Size: 0xBC
	Parameters: 3
	Flags: None
*/
function loop_in_space(alias, origin, ender)
{
	org = spawn("script_origin", (0, 0, 1));
	if(!isdefined(origin))
	{
		origin = self.origin;
	}
	org.origin = origin;
	org playloopsound(alias);
	level waittill(ender);
	org stoploopsound();
	wait(0.1);
	org delete();
}

/*
	Name: delete_on_death_wait
	Namespace: sound
	Checksum: 0x6EA667B4
	Offset: 0x928
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function delete_on_death_wait(ent, sounddone)
{
	sounddone endon(#"death");
	self waittill(#"death");
	if(isdefined(sounddone))
	{
		sounddone delete();
	}
}

/*
	Name: play_on_players
	Namespace: sound
	Checksum: 0x494173C9
	Offset: 0x990
	Size: 0x174
	Parameters: 2
	Flags: None
*/
function play_on_players(sound, team)
{
	/#
		assert(isdefined(level.players));
	#/
	if(level.splitscreen)
	{
		if(isdefined(level.players[0]))
		{
			level.players[0] playlocalsound(sound);
		}
	}
	else
	{
		if(isdefined(team))
		{
			for(i = 0; i < level.players.size; i++)
			{
				player = level.players[i];
				if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == team)
				{
					player playlocalsound(sound);
				}
			}
		}
		else
		{
			for(i = 0; i < level.players.size; i++)
			{
				level.players[i] playlocalsound(sound);
			}
		}
	}
}

