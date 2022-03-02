#using scripts\core_common\math_shared.gsc;

#namespace face;

/*
	Name: function_45fab078
	Namespace: face
	Checksum: 0x6B42EB9
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_45fab078()
{
	level notify(1165156329);
}

/*
	Name: playfacethread
	Namespace: face
	Checksum: 0x9FDC83C8
	Offset: 0x118
	Size: 0x7BE
	Parameters: 7
	Flags: None
*/
function playfacethread(facialanim, str_script_alias, importance, notifystring, waitornot, timetowait, player_or_team)
{
	self endon(#"death");
	if(!isdefined(notifystring))
	{
		wait(1);
		self notify(timetowait);
		return;
	}
	str_notify_alias = notifystring;
	if(!isdefined(level.numberofimportantpeopletalking))
	{
		level.numberofimportantpeopletalking = 0;
	}
	if(!isdefined(level.talknotifyseed))
	{
		level.talknotifyseed = 0;
	}
	if(!isdefined(timetowait))
	{
		timetowait = "PlayFaceThread " + notifystring;
	}
	if(!isdefined(self.a))
	{
		self.a = spawnstruct();
	}
	if(!isdefined(self.a.facialsounddone))
	{
		self.a.facialsounddone = 1;
	}
	if(!isdefined(self.istalking))
	{
		self.istalking = 0;
	}
	if(self.istalking)
	{
		if(isdefined(self.a.currentdialogimportance))
		{
			if(waitornot < self.a.currentdialogimportance)
			{
				wait(1);
				self notify(timetowait);
				return;
			}
			if(waitornot == self.a.currentdialogimportance)
			{
				if(self.a.facialsoundalias == notifystring)
				{
					return;
				}
				/#
					println((("" + self.a.facialsoundalias) + "") + notifystring);
				#/
				while(self.istalking)
				{
					self waittill(#"hash_53464a658a055815");
				}
			}
		}
		else
		{
			/#
				println((("" + self.a.facialsoundalias) + "") + notifystring);
			#/
			if(isscriptfunctionptr(level.var_4ceaaaf5))
			{
				self thread [[level.var_4ceaaaf5]](self.a.facialsoundalias);
			}
			else
			{
				self stopsound(self.a.facialsoundalias);
			}
			self notify(#"hash_5d02e24cebf138cb");
			while(self.istalking)
			{
				self waittill(#"hash_53464a658a055815");
			}
		}
	}
	/#
		assert(self.a.facialsounddone);
	#/
	/#
		assert(self.a.facialsoundalias == undefined);
	#/
	/#
		assert(self.a.facialsoundnotify == undefined);
	#/
	/#
		assert(self.a.currentdialogimportance == undefined);
	#/
	/#
		assert(!self.istalking);
	#/
	self notify(#"bc_interrupt");
	self.istalking = 1;
	self.a.facialsounddone = 0;
	self.a.facialsoundnotify = timetowait;
	self.a.facialsoundalias = notifystring;
	self.a.currentdialogimportance = waitornot;
	if(waitornot == 1)
	{
		level.numberofimportantpeopletalking = level.numberofimportantpeopletalking + 1;
	}
	/#
		if(level.numberofimportantpeopletalking > 1)
		{
			println("" + notifystring);
		}
	#/
	uniquenotify = (timetowait + " ") + level.talknotifyseed;
	level.talknotifyseed = level.talknotifyseed + 1;
	if(isdefined(level.scr_sound) && isdefined(level.scr_sound[#"generic"]))
	{
		str_vox_file = level.scr_sound[#"generic"][notifystring];
	}
	if(!isdefined(str_vox_file) && soundexists(notifystring))
	{
		str_vox_file = notifystring;
	}
	if(isdefined(str_vox_file))
	{
		if(soundexists(str_vox_file))
		{
			if(isscriptfunctionptr(level.var_94934cfc))
			{
				self thread [[level.var_94934cfc]](str_vox_file, uniquenotify, player_or_team);
			}
			else
			{
				if(isdefined(player_or_team))
				{
					self thread _play_sound_to_player_with_notify(str_vox_file, player_or_team, uniquenotify);
				}
				else
				{
					if(isdefined(self gettagorigin("j_head")))
					{
						self playsoundwithnotify(str_vox_file, uniquenotify, "j_head");
					}
					else
					{
						self playsoundwithnotify(str_vox_file, uniquenotify);
					}
				}
			}
		}
		else
		{
			/#
				println(("" + notifystring) + "");
				self thread _missing_dialog(notifystring, str_vox_file, uniquenotify);
			#/
		}
	}
	else
	{
		self thread _temp_dialog(notifystring, uniquenotify);
	}
	ret = undefined;
	ret = self waittill(#"death", #"hash_5d02e24cebf138cb", uniquenotify);
	if(ret._notify === "cancel speaking" && isdefined(str_vox_file))
	{
		self stopsound(str_vox_file);
	}
	if(waitornot == 1)
	{
		level.numberofimportantpeopletalking = level.numberofimportantpeopletalking - 1;
		level.importantpeopletalkingtime = gettime();
	}
	if(isdefined(self))
	{
		self.istalking = 0;
		self.a.facialsounddone = 1;
		self.a.facialsoundnotify = undefined;
		self.a.facialsoundalias = undefined;
		self.a.currentdialogimportance = undefined;
		self.lastsaytime = gettime();
	}
	self notify(#"hash_53464a658a055815", {#vo_line:str_notify_alias});
	self notify(timetowait);
}

/*
	Name: _play_sound_to_player_with_notify
	Namespace: face
	Checksum: 0x84F3ACDD
	Offset: 0x8E0
	Size: 0xFC
	Parameters: 3
	Flags: Linked
*/
function _play_sound_to_player_with_notify(soundalias, player_or_team, uniquenotify)
{
	self endon(#"death");
	if(isplayer(player_or_team))
	{
		player_or_team endon(#"death");
		self playsoundtoplayer(soundalias, player_or_team);
	}
	else if(isstring(player_or_team))
	{
		self playsoundtoteam(soundalias, player_or_team);
	}
	n_playbacktime = soundgetplaybacktime(soundalias);
	if(n_playbacktime > 0)
	{
		wait(n_playbacktime * 0.001);
	}
	else
	{
		wait(1);
	}
	self notify(uniquenotify);
}

/*
	Name: _temp_dialog
	Namespace: face
	Checksum: 0x956F5AFE
	Offset: 0x9E8
	Size: 0x354
	Parameters: 3
	Flags: Linked, Private
*/
function private _temp_dialog(str_line, uniquenotify, b_missing_vo)
{
	if(!isdefined(b_missing_vo))
	{
		b_missing_vo = 0;
	}
	setdvar(#"bgcache_disablewarninghints", 1);
	if(!b_missing_vo && isdefined(self.propername))
	{
		str_line = (self.propername + ": ") + str_line;
	}
	foreach(player in level.players)
	{
		if(!isdefined(player getluimenu("TempDialog")))
		{
			player openluimenu("TempDialog");
		}
		player setluimenudata(player getluimenu("TempDialog"), #"dialogtext", str_line);
		if(b_missing_vo)
		{
			player setluimenudata(player getluimenu("TempDialog"), #"title", "MISSING VO SOUND");
			continue;
		}
		player setluimenudata(player getluimenu("TempDialog"), #"title", "TEMP VO");
	}
	n_wait_time = (strtok(str_line, " ").size - 1) / 2;
	n_wait_time = math::clamp(n_wait_time, 2, 5);
	self waittilltimeout(n_wait_time, #"death", #"hash_5d02e24cebf138cb");
	foreach(player in level.players)
	{
		if(isdefined(player getluimenu("TempDialog")))
		{
			player closeluimenu(player getluimenu("TempDialog"));
		}
	}
	setdvar(#"bgcache_disablewarninghints", 0);
	self notify(uniquenotify);
}

/*
	Name: _missing_dialog
	Namespace: face
	Checksum: 0x60EDA4
	Offset: 0xD48
	Size: 0x54
	Parameters: 3
	Flags: Private
*/
function private _missing_dialog(str_script_alias, str_vox_file, uniquenotify)
{
	_temp_dialog((("script id: " + str_script_alias) + " sound alias: ") + str_vox_file, uniquenotify, 1);
}

