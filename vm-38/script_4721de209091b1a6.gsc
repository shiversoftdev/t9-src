#using scripts\core_common\struct.gsc;

#namespace namespace_f9b02f80;

/*
	Name: function_75314d8
	Namespace: namespace_f9b02f80
	Checksum: 0xB7877D8C
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_75314d8()
{
	level notify(779934512);
}

/*
	Name: function_196f2c38
	Namespace: namespace_f9b02f80
	Checksum: 0x66D6F82A
	Offset: 0xF8
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function function_196f2c38()
{
	level.play_killstreak_firewall_being_hacked_dialog = undefined;
	level.play_killstreak_firewall_hacked_dialog = undefined;
	level.play_killstreak_being_hacked_dialog = undefined;
	level.play_killstreak_hacked_dialog = undefined;
	level.play_pilot_dialog_on_owner = undefined;
	level.play_pilot_dialog = undefined;
	level.play_taacom_dialog_response_on_owner = undefined;
	level.play_taacom_dialog = undefined;
	level.var_daaa6db3 = undefined;
	level.var_514f9d20 = undefined;
	level.var_992ad5b3 = undefined;
	level.var_6d7da491 = undefined;
	level.var_9f8e080d = undefined;
}

/*
	Name: killstreak_dialog_queued
	Namespace: namespace_f9b02f80
	Checksum: 0x7CFA46C7
	Offset: 0x1A0
	Size: 0x112
	Parameters: 3
	Flags: Linked
*/
function killstreak_dialog_queued(dialogkey, killstreaktype, killstreakid)
{
	if(!isdefined(dialogkey) || !isdefined(killstreaktype))
	{
		return;
	}
	if(isdefined(self.currentkillstreakdialog))
	{
		if(dialogkey === self.currentkillstreakdialog.dialogkey && killstreaktype === self.currentkillstreakdialog.killstreaktype && killstreakid === self.currentkillstreakdialog.killstreakid)
		{
			return true;
		}
	}
	for(i = 0; i < self.killstreakdialogqueue.size; i++)
	{
		if(dialogkey === self.killstreakdialogqueue[i].dialogkey && killstreaktype === self.killstreakdialogqueue[i].killstreaktype && killstreaktype === self.killstreakdialogqueue[i].killstreaktype)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: play_killstreak_ready_dialog
	Namespace: namespace_f9b02f80
	Checksum: 0xE14091BB
	Offset: 0x2C0
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function play_killstreak_ready_dialog(killstreaktype, taacomwaittime)
{
	self notify("killstreak_ready_" + killstreaktype);
	self endon(#"death", "killstreak_start_" + killstreaktype, "killstreak_ready_" + killstreaktype);
	level endon(#"game_ended");
	if(isdefined(level.gameended) && level.gameended)
	{
		return;
	}
	if(killstreak_dialog_queued("ready", killstreaktype))
	{
		return;
	}
	if(isdefined(taacomwaittime))
	{
		wait(taacomwaittime);
	}
	self play_taacom_dialog("ready", killstreaktype);
}

/*
	Name: play_taacom_dialog_response
	Namespace: namespace_f9b02f80
	Checksum: 0x43C028F2
	Offset: 0x398
	Size: 0x7C
	Parameters: 4
	Flags: Linked
*/
function play_taacom_dialog_response(dialogkey, killstreaktype, killstreakid, pilotindex)
{
	/#
		assert(isdefined(dialogkey));
	#/
	/#
		assert(isdefined(killstreaktype));
	#/
	if(!isdefined(pilotindex))
	{
		return;
	}
	self play_taacom_dialog(dialogkey + pilotindex, killstreaktype, killstreakid);
}

/*
	Name: play_taacom_dialog
	Namespace: namespace_f9b02f80
	Checksum: 0xB61125E1
	Offset: 0x420
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function play_taacom_dialog(dialogkey, killstreaktype, killstreakid, var_46bd7973, var_8a6b001a, weapon, priority)
{
	if(isdefined(level.play_taacom_dialog))
	{
		self [[level.play_taacom_dialog]](dialogkey, killstreaktype, killstreakid, var_46bd7973, var_8a6b001a, weapon, priority);
	}
}

/*
	Name: function_daaa6db3
	Namespace: namespace_f9b02f80
	Checksum: 0x628767D7
	Offset: 0x498
	Size: 0x44
	Parameters: 3
	Flags: None
*/
function function_daaa6db3(weapon, var_df17fa82, var_53c10ed8)
{
	if(isdefined(level.var_daaa6db3))
	{
		self [[level.var_daaa6db3]](weapon, var_df17fa82, var_53c10ed8);
	}
}

/*
	Name: play_taacom_dialog_response_on_owner
	Namespace: namespace_f9b02f80
	Checksum: 0x15EA122C
	Offset: 0x4E8
	Size: 0x44
	Parameters: 3
	Flags: Linked
*/
function play_taacom_dialog_response_on_owner(dialogkey, killstreaktype, killstreakid)
{
	if(isdefined(level.play_taacom_dialog_response_on_owner))
	{
		self [[level.play_taacom_dialog_response_on_owner]](dialogkey, killstreaktype, killstreakid);
	}
}

/*
	Name: leader_dialog_for_other_teams
	Namespace: namespace_f9b02f80
	Checksum: 0xDA26BF6B
	Offset: 0x538
	Size: 0x58
	Parameters: 5
	Flags: None
*/
function leader_dialog_for_other_teams(dialogkey, skipteam, objectivekey, killstreakid, dialogbufferkey)
{
	if(isdefined(level.var_9f8e080d))
	{
		[[level.var_9f8e080d]](dialogkey, skipteam, objectivekey, killstreakid, dialogbufferkey);
	}
}

/*
	Name: leader_dialog
	Namespace: namespace_f9b02f80
	Checksum: 0x4523008B
	Offset: 0x598
	Size: 0x58
	Parameters: 5
	Flags: None
*/
function leader_dialog(dialogkey, team, objectivekey, killstreakid, dialogbufferkey)
{
	if(isdefined(level.var_514f9d20))
	{
		[[level.var_514f9d20]](dialogkey, team, objectivekey, killstreakid, dialogbufferkey);
	}
}

/*
	Name: function_b4319f8e
	Namespace: namespace_f9b02f80
	Checksum: 0xBD7A35CE
	Offset: 0x5F8
	Size: 0x64
	Parameters: 6
	Flags: None
*/
function function_b4319f8e(dialogkey, team, exclusion, objectivekey, killstreakid, dialogbufferkey)
{
	if(isdefined(level.var_992ad5b3))
	{
		[[level.var_992ad5b3]](dialogkey, team, exclusion, objectivekey, killstreakid, dialogbufferkey);
	}
}

/*
	Name: function_248fc9f7
	Namespace: namespace_f9b02f80
	Checksum: 0xB8141CF0
	Offset: 0x668
	Size: 0x64
	Parameters: 6
	Flags: None
*/
function function_248fc9f7(dialogkey, team, exclusions, objectivekey, killstreakid, dialogbufferkey)
{
	if(isdefined(level.var_6d7da491))
	{
		[[level.var_6d7da491]](dialogkey, team, exclusions, objectivekey, killstreakid, dialogbufferkey);
	}
}

/*
	Name: play_killstreak_firewall_being_hacked_dialog
	Namespace: namespace_f9b02f80
	Checksum: 0xD7C98A5E
	Offset: 0x6D8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function play_killstreak_firewall_being_hacked_dialog(killstreaktype, killstreakid)
{
	if(isdefined(level.play_killstreak_firewall_being_hacked_dialog))
	{
		self [[level.play_killstreak_firewall_being_hacked_dialog]](killstreaktype, killstreakid);
	}
}

/*
	Name: play_killstreak_firewall_hacked_dialog
	Namespace: namespace_f9b02f80
	Checksum: 0x59DAF57F
	Offset: 0x720
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function play_killstreak_firewall_hacked_dialog(killstreaktype, killstreakid)
{
	if(isdefined(level.play_killstreak_firewall_hacked_dialog))
	{
		self [[level.play_killstreak_firewall_hacked_dialog]](killstreaktype, killstreakid);
	}
}

/*
	Name: play_killstreak_being_hacked_dialog
	Namespace: namespace_f9b02f80
	Checksum: 0x9032971C
	Offset: 0x768
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function play_killstreak_being_hacked_dialog(killstreaktype, killstreakid)
{
	if(isdefined(level.play_killstreak_being_hacked_dialog))
	{
		self [[level.play_killstreak_being_hacked_dialog]](killstreaktype, killstreakid);
	}
}

/*
	Name: play_killstreak_hacked_dialog
	Namespace: namespace_f9b02f80
	Checksum: 0xBDA802D5
	Offset: 0x7B0
	Size: 0x44
	Parameters: 3
	Flags: None
*/
function play_killstreak_hacked_dialog(killstreaktype, killstreakid, hacker)
{
	if(isdefined(level.play_killstreak_hacked_dialog))
	{
		self [[level.play_killstreak_hacked_dialog]](killstreaktype, killstreakid, hacker);
	}
}

/*
	Name: play_killstreak_start_dialog
	Namespace: namespace_f9b02f80
	Checksum: 0x907658DE
	Offset: 0x800
	Size: 0x44
	Parameters: 3
	Flags: Linked
*/
function play_killstreak_start_dialog(hardpointtype, team, killstreak_id)
{
	if(isdefined(level.play_killstreak_start_dialog))
	{
		self [[level.play_killstreak_start_dialog]](hardpointtype, team, killstreak_id);
	}
}

/*
	Name: play_pilot_dialog
	Namespace: namespace_f9b02f80
	Checksum: 0x83282755
	Offset: 0x850
	Size: 0x50
	Parameters: 4
	Flags: Linked
*/
function play_pilot_dialog(dialogkey, killstreaktype, killstreakid, pilotindex)
{
	if(isdefined(level.play_pilot_dialog))
	{
		self [[level.play_pilot_dialog]](dialogkey, killstreaktype, killstreakid, pilotindex);
	}
}

/*
	Name: play_pilot_dialog_on_owner
	Namespace: namespace_f9b02f80
	Checksum: 0x13C25E38
	Offset: 0x8A8
	Size: 0x44
	Parameters: 3
	Flags: Linked
*/
function play_pilot_dialog_on_owner(dialogkey, killstreaktype, killstreakid)
{
	if(isdefined(level.play_pilot_dialog_on_owner))
	{
		self [[level.play_pilot_dialog_on_owner]](dialogkey, killstreaktype, killstreakid);
	}
}

/*
	Name: play_destroyed_dialog_on_owner
	Namespace: namespace_f9b02f80
	Checksum: 0xED639306
	Offset: 0x8F8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function play_destroyed_dialog_on_owner(killstreaktype, killstreakid)
{
	if(isdefined(level.play_destroyed_dialog_on_owner))
	{
		self [[level.play_destroyed_dialog_on_owner]](killstreaktype, killstreakid);
	}
}

/*
	Name: function_1110a5de
	Namespace: namespace_f9b02f80
	Checksum: 0xBC9A5C1A
	Offset: 0x940
	Size: 0x1CC
	Parameters: 1
	Flags: Linked
*/
function function_1110a5de(killstreaktype)
{
	/#
		assert(isdefined(killstreaktype), "");
	#/
	/#
		assert(isdefined(level.killstreaks[killstreaktype]), "");
	#/
	pilotdialogarraykey = level.killstreaks[killstreaktype].script_bundle.var_b7bd2ff9;
	if(isdefined(pilotdialogarraykey))
	{
		taacombundles = getscriptbundles("mpdialog_taacom");
		foreach(bundle in taacombundles)
		{
			if(!isdefined(bundle.pilotbundles))
			{
				bundle.pilotbundles = [];
			}
			bundle.pilotbundles[killstreaktype] = [];
			i = 0;
			field = pilotdialogarraykey + i;
			fieldvalue = bundle.(field);
			while(isdefined(fieldvalue))
			{
				bundle.pilotbundles[killstreaktype][i] = fieldvalue;
				i++;
				field = pilotdialogarraykey + i;
				fieldvalue = bundle.(field);
			}
		}
		level.tacombundles = taacombundles;
	}
}

/*
	Name: get_killstreak_inform_dialog
	Namespace: namespace_f9b02f80
	Checksum: 0x65A11931
	Offset: 0xB18
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function get_killstreak_inform_dialog(killstreaktype)
{
	if(isdefined(level.killstreaks[killstreaktype].script_bundle.var_5fbfc70d))
	{
		return level.killstreaks[killstreaktype].script_bundle.var_5fbfc70d;
	}
	return "";
}

/*
	Name: get_mpdialog_tacom_bundle
	Namespace: namespace_f9b02f80
	Checksum: 0xE825C2DB
	Offset: 0xB78
	Size: 0x30
	Parameters: 1
	Flags: Linked
*/
function get_mpdialog_tacom_bundle(name)
{
	if(!isdefined(level.tacombundles))
	{
		return undefined;
	}
	return level.tacombundles[name];
}

/*
	Name: function_d2219b7d
	Namespace: namespace_f9b02f80
	Checksum: 0x45CCE7E6
	Offset: 0xBB0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_d2219b7d(type)
{
	self play_pilot_dialog_on_owner("timeout", type);
	self play_taacom_dialog_response_on_owner("timeoutConfirmed", type);
}

/*
	Name: get_random_pilot_index
	Namespace: namespace_f9b02f80
	Checksum: 0x5B52C96A
	Offset: 0xC08
	Size: 0xDA
	Parameters: 1
	Flags: Linked
*/
function get_random_pilot_index(killstreaktype)
{
	if(!isdefined(killstreaktype))
	{
		return undefined;
	}
	if(!isdefined(self.pers[level.var_bc01f047]))
	{
		return undefined;
	}
	taacombundle = get_mpdialog_tacom_bundle(self.pers[level.var_bc01f047]);
	if(!isdefined(taacombundle) || !isdefined(taacombundle.pilotbundles))
	{
		return undefined;
	}
	if(!isdefined(taacombundle.pilotbundles[killstreaktype]))
	{
		return undefined;
	}
	numpilots = taacombundle.pilotbundles[killstreaktype].size;
	if(numpilots <= 0)
	{
		return undefined;
	}
	return randomint(numpilots);
}

