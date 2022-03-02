#using scripts\core_common\struct.gsc;

#namespace namespace_f9b02f80;

/*
	Name: function_196f2c38
	Namespace: namespace_f9b02f80
	Checksum: 0xAD876C87
	Offset: 0xD8
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
	Checksum: 0x2B926AF8
	Offset: 0x180
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
	Checksum: 0x37D76DA6
	Offset: 0x2A0
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
	Checksum: 0xC9219959
	Offset: 0x378
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
	Checksum: 0xF859D39C
	Offset: 0x400
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
	Checksum: 0xF87BAF9
	Offset: 0x478
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
	Checksum: 0x654CCF0C
	Offset: 0x4C8
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
	Checksum: 0xABDB8AFE
	Offset: 0x518
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
	Checksum: 0xEC900400
	Offset: 0x578
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
	Checksum: 0x6C471F24
	Offset: 0x5D8
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
	Checksum: 0xE68DDA29
	Offset: 0x648
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
	Checksum: 0x3833D946
	Offset: 0x6B8
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
	Checksum: 0x5A243A7C
	Offset: 0x700
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
	Checksum: 0xC1300904
	Offset: 0x748
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
	Checksum: 0x2E430803
	Offset: 0x790
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
	Checksum: 0xF00BFFED
	Offset: 0x7E0
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
	Checksum: 0x758B9C06
	Offset: 0x830
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
	Checksum: 0x3BC1A25C
	Offset: 0x888
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
	Checksum: 0xAD2BEB80
	Offset: 0x8D8
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
	Checksum: 0x3A82D405
	Offset: 0x920
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
	Checksum: 0x135D0C07
	Offset: 0xAF8
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
	Checksum: 0xA876797D
	Offset: 0xB58
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
	Checksum: 0x7A66C325
	Offset: 0xB90
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
	Checksum: 0x88EC3F3B
	Offset: 0xBE8
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

