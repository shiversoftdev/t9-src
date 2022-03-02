#using script_1cc417743d7c262d;
#using script_4721de209091b1a6;
#using scripts\core_common\battlechatter.gsc;

#namespace namespace_f9b02f80;

/*
	Name: init
	Namespace: namespace_f9b02f80
	Checksum: 0x1B702DF0
	Offset: 0x100
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.play_killstreak_firewall_being_hacked_dialog = &function_427f6a2e;
	level.play_killstreak_firewall_hacked_dialog = &function_6fa91236;
	level.play_killstreak_being_hacked_dialog = &function_1cd175ba;
	level.play_killstreak_hacked_dialog = &function_520a5752;
	level.play_killstreak_start_dialog = &function_7bed52a;
	level.play_pilot_dialog_on_owner = &function_9716fce9;
	level.play_pilot_dialog = &function_f6370f75;
	level.play_destroyed_dialog_on_owner = &function_6a5cc212;
	level.play_taacom_dialog_response_on_owner = &function_3cf68327;
	level.play_taacom_dialog = &function_3d6e0cd9;
	level.var_514f9d20 = &function_b11487a4;
	level.var_992ad5b3 = &function_a7a52384;
	level.var_6d7da491 = &function_d49b5eff;
	level.var_9f8e080d = &function_ed335136;
}

/*
	Name: function_427f6a2e
	Namespace: namespace_f9b02f80
	Checksum: 0x77ADDCD9
	Offset: 0x260
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_427f6a2e(killstreaktype, killstreakid)
{
	if(self killstreak_dialog_queued("firewallBeingHacked", killstreaktype, killstreakid))
	{
		return;
	}
	self globallogic_audio::play_taacom_dialog("firewallBeingHacked", killstreaktype, killstreakid);
}

/*
	Name: function_6fa91236
	Namespace: namespace_f9b02f80
	Checksum: 0xCCB4E8CC
	Offset: 0x2C8
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6fa91236(killstreaktype, killstreakid)
{
	if(self killstreak_dialog_queued("firewallHacked", killstreaktype, killstreakid))
	{
		return;
	}
	self globallogic_audio::play_taacom_dialog("firewallHacked", killstreaktype, killstreakid);
}

/*
	Name: function_1cd175ba
	Namespace: namespace_f9b02f80
	Checksum: 0x5E12F7C2
	Offset: 0x330
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1cd175ba(killstreaktype, killstreakid)
{
	if(self killstreak_dialog_queued("beingHacked", killstreaktype, killstreakid))
	{
		return;
	}
	self globallogic_audio::play_taacom_dialog("beingHacked", killstreaktype, killstreakid);
}

/*
	Name: function_520a5752
	Namespace: namespace_f9b02f80
	Checksum: 0x7B680C1A
	Offset: 0x398
	Size: 0x13C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_520a5752(killstreaktype, killstreakid, hacker)
{
	self globallogic_audio::flush_killstreak_dialog_on_player(killstreakid);
	self globallogic_audio::play_taacom_dialog("hacked", killstreaktype);
	if(level.teambased)
	{
		globallogic_audio::function_b4319f8e(level.killstreaks[killstreaktype].script_bundle.var_335def6c, self.team, self);
		globallogic_audio::leader_dialog_for_other_teams(level.killstreaks[killstreaktype].script_bundle.var_7a502c34, self.team, undefined, killstreakid);
	}
	else
	{
		self globallogic_audio::leader_dialog_on_player(level.killstreaks[killstreaktype].script_bundle.var_335def6c);
		hacker globallogic_audio::leader_dialog_on_player(level.killstreaks[killstreaktype].script_bundle.var_7a502c34);
	}
}

/*
	Name: function_7bed52a
	Namespace: namespace_f9b02f80
	Checksum: 0x8A4AD958
	Offset: 0x4E0
	Size: 0x2A0
	Parameters: 3
	Flags: Linked, Private
*/
function private function_7bed52a(killstreaktype, team, killstreakid)
{
	if(!isdefined(killstreaktype) || !isdefined(killstreakid))
	{
		return;
	}
	self notify("killstreak_start_" + killstreaktype);
	self notify("killstreak_start_inventory_" + killstreaktype);
	scriptbundle = level.killstreaks[killstreaktype].script_bundle;
	dialogkey = scriptbundle.var_2451b1f2;
	if(level.teambased)
	{
		if(!isdefined(self.currentkillstreakdialog))
		{
			self thread battlechatter::function_fff18afc(scriptbundle.var_c236921c, scriptbundle.var_f5871fe4);
		}
		if(isdefined(level.killstreakrules[killstreaktype]) && level.killstreakrules[killstreaktype].curteam[team] > 1)
		{
			dialogkey = scriptbundle.var_7742570a;
		}
	}
	else
	{
		if(!isdefined(self.currentkillstreakdialog) && isdefined(scriptbundle.var_c236921c))
		{
			self thread battlechatter::function_576ff6fe(killstreaktype);
		}
		if(isdefined(level.killstreakrules[killstreaktype]) && level.killstreakrules[killstreaktype].cur > 1)
		{
			dialogkey = scriptbundle.var_7742570a;
		}
	}
	if(!isdefined(scriptbundle.var_e23aed46) || scriptbundle.var_e23aed46 <= 0)
	{
		globallogic_audio::leader_dialog_for_other_teams(dialogkey, team, undefined, killstreakid);
	}
	else
	{
		foreach(currentteam, _ in level.teams)
		{
			if(currentteam != team)
			{
				players = getplayers(currentteam, self.origin, scriptbundle.var_e23aed46);
				globallogic_audio::function_61e17de0(dialogkey, players, undefined, killstreakid);
			}
		}
	}
}

/*
	Name: function_6a5cc212
	Namespace: namespace_f9b02f80
	Checksum: 0x4887F2AA
	Offset: 0x788
	Size: 0x8C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6a5cc212(killstreaktype, killstreakid)
{
	if(!isdefined(self.owner) || !isdefined(self.team) || self.team != self.owner.team)
	{
		return;
	}
	self.owner globallogic_audio::flush_killstreak_dialog_on_player(killstreakid);
	self.owner globallogic_audio::play_taacom_dialog("destroyed", killstreaktype);
}

/*
	Name: function_9716fce9
	Namespace: namespace_f9b02f80
	Checksum: 0xD5826B08
	Offset: 0x820
	Size: 0x9C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_9716fce9(dialogkey, killstreaktype, killstreakid)
{
	if(!isdefined(self.owner) || !isdefined(self.owner.team) || !isdefined(self.team) || self.team != self.owner.team)
	{
		return;
	}
	self.owner play_pilot_dialog(dialogkey, killstreaktype, killstreakid, self.pilotindex);
}

/*
	Name: function_f6370f75
	Namespace: namespace_f9b02f80
	Checksum: 0x4F96DABD
	Offset: 0x8C8
	Size: 0x5C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_f6370f75(dialogkey, killstreaktype, killstreakid, pilotindex)
{
	if(!isdefined(killstreaktype) || !isdefined(pilotindex))
	{
		return;
	}
	self globallogic_audio::killstreak_dialog_on_player(dialogkey, killstreaktype, killstreakid, pilotindex);
}

/*
	Name: function_3d6e0cd9
	Namespace: namespace_f9b02f80
	Checksum: 0x4E3F67D6
	Offset: 0x930
	Size: 0x5C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_3d6e0cd9(dialogkey, killstreaktype, killstreakid, var_46bd7973, var_8a6b001a, weapon, priority)
{
	self globallogic_audio::play_taacom_dialog(dialogkey, killstreaktype, killstreakid, var_46bd7973, var_8a6b001a, weapon, priority);
}

/*
	Name: function_3cf68327
	Namespace: namespace_f9b02f80
	Checksum: 0x8753E482
	Offset: 0x998
	Size: 0xB4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_3cf68327(dialogkey, killstreaktype, killstreakid)
{
	/#
		assert(isdefined(dialogkey));
	#/
	/#
		assert(isdefined(killstreaktype));
	#/
	if(!isdefined(self.owner) || !isdefined(self.team) || self.team != self.owner.team)
	{
		return;
	}
	self.owner play_taacom_dialog_response(dialogkey, killstreaktype, killstreakid, self.pilotindex);
}

/*
	Name: function_ed335136
	Namespace: namespace_f9b02f80
	Checksum: 0x898DB900
	Offset: 0xA58
	Size: 0x4C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_ed335136(dialogkey, skipteam, objectivekey, killstreakid, dialogbufferkey)
{
	globallogic_audio::leader_dialog_for_other_teams(dialogkey, skipteam, objectivekey, killstreakid, dialogbufferkey);
}

/*
	Name: function_b11487a4
	Namespace: namespace_f9b02f80
	Checksum: 0x55F773F2
	Offset: 0xAB0
	Size: 0x4C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_b11487a4(dialogkey, team, objectivekey, killstreakid, dialogbufferkey)
{
	globallogic_audio::leader_dialog(dialogkey, team, objectivekey, killstreakid, dialogbufferkey);
}

/*
	Name: function_a7a52384
	Namespace: namespace_f9b02f80
	Checksum: 0x645FBB78
	Offset: 0xB08
	Size: 0x54
	Parameters: 6
	Flags: Linked, Private
*/
function private function_a7a52384(dialogkey, team, exclusion, objectivekey, killstreakid, dialogbufferkey)
{
	globallogic_audio::function_b4319f8e(dialogkey, team, exclusion, objectivekey, killstreakid, dialogbufferkey);
}

/*
	Name: function_d49b5eff
	Namespace: namespace_f9b02f80
	Checksum: 0x8E6A6188
	Offset: 0xB68
	Size: 0x54
	Parameters: 6
	Flags: Linked, Private
*/
function private function_d49b5eff(dialogkey, team, exclusions, objectivekey, killstreakid, dialogbufferkey)
{
	globallogic_audio::function_248fc9f7(dialogkey, team, exclusions, objectivekey, killstreakid, dialogbufferkey);
}

