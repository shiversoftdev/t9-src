#using script_13da4e6b98ca81a1;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\util_shared.csc;

#namespace weaponobjects;

/*
	Name: function_4f4bf239
	Namespace: weaponobjects
	Checksum: 0x5EF94F1C
	Offset: 0x158
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4f4bf239()
{
	level notify(888540586);
}

/*
	Name: init_shared
	Namespace: weaponobjects
	Checksum: 0x2C0ADD0C
	Offset: 0x178
	Size: 0x44C
	Parameters: 2
	Flags: Linked
*/
function init_shared(var_e6fe7a6f, var_4885f19e)
{
	callback::on_localplayer_spawned(&on_localplayer_spawned);
	clientfield::register("toplayer", "proximity_alarm", 1, 3, "int", &proximity_alarm_changed, 0, 1);
	clientfield::register("missile", "retrievable", 1, 1, "int", &retrievable_changed, 0, 1);
	clientfield::register("scriptmover", "retrievable", 1, 1, "int", &retrievable_changed, 0, 0);
	clientfield::register("missile", "enemyequip", 1, 2, "int", &enemyequip_changed, 0, 1);
	clientfield::register("scriptmover", "enemyequip", 1, 2, "int", &enemyequip_changed, 0, 0);
	clientfield::register("missile", "teamequip", 1, 1, "int", &teamequip_changed, 0, 1);
	clientfield::function_a8bbc967("hudItems.proximityAlarm", #"hud_items", #"proximityalarm", 1, 3, "int", undefined, 0, 0);
	clientfield::register("missile", "friendlyequip", 1, 1, "int", &friendly_outline, 0, 1);
	clientfield::register("scriptmover", "friendlyequip", 1, 1, "int", &friendly_outline, 0, 0);
	level._effect[#"powerlight"] = #"weapon/fx8_equip_light_os";
	if(getgametypesetting(#"hash_48670d9509071424") && 0)
	{
		level.var_58253868 = var_e6fe7a6f;
	}
	if(isdefined(var_4885f19e))
	{
		function_6aae3df3(var_4885f19e);
	}
	level.var_420d7d7e = var_4885f19e;
	level.var_4de4699b = #"rob_sonar_set_enemy";
	if(!isdefined(level.retrievable))
	{
		level.retrievable = [];
	}
	if(!isdefined(level.enemyequip))
	{
		level.enemyequip = [];
	}
	if(isdefined(level.var_58253868))
	{
		renderoverridebundle::function_f72f089c(#"hash_66ac79c57723c169", level.var_58253868, &function_6a5648dc, undefined, undefined, 1);
	}
	if(isdefined(level.var_420d7d7e))
	{
		renderoverridebundle::function_f72f089c(#"hash_691f7dc47ae8aa08", level.var_420d7d7e, &function_232f3acf, undefined, level.var_4de4699b, 1);
	}
}

/*
	Name: on_localplayer_spawned
	Namespace: weaponobjects
	Checksum: 0x4864E3A1
	Offset: 0x5D0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function on_localplayer_spawned(local_client_num)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	self thread watch_perks_changed(local_client_num);
}

/*
	Name: proximity_alarm_changed
	Namespace: weaponobjects
	Checksum: 0x95868A9A
	Offset: 0x618
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function proximity_alarm_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	update_sound(bnewent, bwastimejump, fieldname, binitialsnap);
}

/*
	Name: update_sound
	Namespace: weaponobjects
	Checksum: 0x8A691F1C
	Offset: 0x680
	Size: 0xF4
	Parameters: 4
	Flags: Linked
*/
function update_sound(local_client_num, bnewent, newval, oldval)
{
	if(newval == 2)
	{
		if(!isdefined(self._proximity_alarm_snd_ent))
		{
			self._proximity_alarm_snd_ent = spawn(bnewent, self.origin, "script_origin");
			self thread sndproxalert_entcleanup(bnewent, self._proximity_alarm_snd_ent);
		}
	}
	else
	{
		if(newval == 1)
		{
		}
		else if(newval == 0 && isdefined(oldval) && oldval != newval)
		{
			if(isdefined(self._proximity_alarm_snd_ent))
			{
				self._proximity_alarm_snd_ent stopallloopsounds(0.5);
			}
		}
	}
}

/*
	Name: teamequip_changed
	Namespace: weaponobjects
	Checksum: 0x94CFFAB
	Offset: 0x780
	Size: 0x54
	Parameters: 7
	Flags: Linked
*/
function teamequip_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self updateteamequipment(fieldname, bwastimejump);
}

/*
	Name: updateteamequipment
	Namespace: weaponobjects
	Checksum: 0x86D189BA
	Offset: 0x7E0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function updateteamequipment(local_client_num, newval)
{
	self checkteamequipment(newval);
}

/*
	Name: retrievable_changed
	Namespace: weaponobjects
	Checksum: 0x9A9DE724
	Offset: 0x818
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function retrievable_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::add_remove_list(level.retrievable, bwastimejump);
	self updateretrievable(fieldname, bwastimejump);
}

/*
	Name: updateretrievable
	Namespace: weaponobjects
	Checksum: 0x87A2B82E
	Offset: 0x898
	Size: 0x32
	Parameters: 2
	Flags: Linked
*/
function updateretrievable(local_client_num, newval)
{
	if(self function_b9b8fbc7())
	{
	}
}

/*
	Name: function_f89c4b81
	Namespace: weaponobjects
	Checksum: 0x548B7521
	Offset: 0x8D8
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function function_f89c4b81()
{
	if(isdefined(self.weapon) && self.weapon.statname == #"ac130")
	{
		return false;
	}
	if(isdefined(self.weapon) && self.weapon.statname == #"tr_flechette_t8")
	{
		return false;
	}
	return true;
}

/*
	Name: enemyequip_changed
	Namespace: weaponobjects
	Checksum: 0x1BF5D500
	Offset: 0x958
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function enemyequip_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	bwastimejump = bwastimejump != 0;
	if(self function_f89c4b81())
	{
		self util::add_remove_list(level.enemyequip, bwastimejump);
		self updateenemyequipment(fieldname, bwastimejump);
	}
}

/*
	Name: function_6a5648dc
	Namespace: weaponobjects
	Checksum: 0x72B80F90
	Offset: 0x9F8
	Size: 0xD8
	Parameters: 2
	Flags: Linked
*/
function function_6a5648dc(local_client_num, bundle)
{
	if(codcaster::function_b8fe9b52(bundle))
	{
		return true;
	}
	if(!self function_e9fc6a64() || self.team === #"none")
	{
		return false;
	}
	if(is_true(level.vision_pulse[bundle]))
	{
		return false;
	}
	player = function_5c10bd79(bundle);
	if(self == player)
	{
		return false;
	}
	if(player.var_33b61b6f === 1)
	{
		return false;
	}
	return true;
}

/*
	Name: function_232f3acf
	Namespace: weaponobjects
	Checksum: 0x8A99C80B
	Offset: 0xAD8
	Size: 0x17C
	Parameters: 2
	Flags: Linked
*/
function function_232f3acf(local_client_num, bundle)
{
	if(codcaster::function_b8fe9b52(local_client_num))
	{
		return true;
	}
	if(self function_e9fc6a64() && self.team !== #"none")
	{
		return false;
	}
	if(self.var_6abc296 === 1)
	{
		return true;
	}
	type = self.type;
	if(type == "missile" || type == "scriptmover" && self clientfield::get("enemyequip") === 0)
	{
		return false;
	}
	if(function_f99d2668())
	{
		if(function_5778f82(local_client_num, #"specialty_showenemyequipment") && is_true(self.var_f19b4afd))
		{
			return true;
		}
	}
	else
	{
		if(function_5778f82(local_client_num, #"specialty_showenemyequipment"))
		{
			return true;
		}
		bundle.var_1a5b7293 = 1;
	}
	return false;
}

/*
	Name: updateenemyequipment
	Namespace: weaponobjects
	Checksum: 0x9D489425
	Offset: 0xC60
	Size: 0x15C
	Parameters: 2
	Flags: Linked
*/
function updateenemyequipment(local_client_num, newval)
{
	if(codcaster::function_b8fe9b52(newval))
	{
		var_7eda7144 = (self codcaster::is_friendly(newval) ? #"friendly" : #"enemy");
		var_c43ac0da = (self codcaster::is_friendly(newval) ? #"hash_2476e7ae62469f70" : #"hash_2476eaae6246a489");
		self renderoverridebundle::function_c8d97b8e(newval, var_7eda7144, var_c43ac0da);
		return;
	}
	if(isdefined(level.var_58253868))
	{
		self renderoverridebundle::function_c8d97b8e(newval, #"friendly", #"hash_66ac79c57723c169");
	}
	if(isdefined(level.var_420d7d7e))
	{
		self renderoverridebundle::function_c8d97b8e(newval, #"enemy", #"hash_691f7dc47ae8aa08");
	}
}

/*
	Name: friendly_outline
	Namespace: weaponobjects
	Checksum: 0x644EDEB9
	Offset: 0xDC8
	Size: 0x3C
	Parameters: 7
	Flags: Linked
*/
function friendly_outline(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

/*
	Name: watch_perks_changed
	Namespace: weaponobjects
	Checksum: 0xB691A69
	Offset: 0xE10
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function watch_perks_changed(local_client_num)
{
	self notify(#"watch_perks_changed");
	self endon(#"watch_perks_changed");
	self endon(#"death");
	self endon(#"disconnect");
	while(isdefined(self))
	{
		waitframe(1);
		util::clean_deleted(level.retrievable);
		util::clean_deleted(level.enemyequip);
		array::thread_all(level.retrievable, &updateretrievable, local_client_num, 1);
		array::thread_all(level.enemyequip, &updateenemyequipment, local_client_num, 1);
		self waittill(#"perks_changed");
	}
}

/*
	Name: checkteamequipment
	Namespace: weaponobjects
	Checksum: 0xABF523FE
	Offset: 0xF28
	Size: 0x11E
	Parameters: 1
	Flags: Linked
*/
function checkteamequipment(localclientnum)
{
	if(!isdefined(self.owner))
	{
		return;
	}
	if(!isdefined(self.equipmentoldteam))
	{
		self.equipmentoldteam = self.team;
	}
	if(!isdefined(self.equipmentoldownerteam))
	{
		self.equipmentoldownerteam = self.owner.team;
	}
	var_fd9de919 = function_73f4b33(localclientnum);
	if(!isdefined(self.equipmentoldwatcherteam))
	{
		self.equipmentoldwatcherteam = var_fd9de919;
	}
	if(self.equipmentoldteam != self.team || self.equipmentoldownerteam != self.owner.team || self.equipmentoldwatcherteam != var_fd9de919)
	{
		self.equipmentoldteam = self.team;
		self.equipmentoldownerteam = self.owner.team;
		self.equipmentoldwatcherteam = var_fd9de919;
		self notify(#"team_changed");
	}
}

/*
	Name: equipmentteamobject
	Namespace: weaponobjects
	Checksum: 0x328A1E70
	Offset: 0x1050
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function equipmentteamobject(localclientnum)
{
	if(is_true(level.disable_equipment_team_object))
	{
		return;
	}
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	waitframe(1);
	fx_handle = self playflarefx(localclientnum);
	self thread equipmentwatchteamfx(localclientnum, fx_handle);
	self thread equipmentwatchplayerteamchanged(localclientnum, fx_handle);
}

/*
	Name: playflarefx
	Namespace: weaponobjects
	Checksum: 0x663EF556
	Offset: 0x1108
	Size: 0x122
	Parameters: 1
	Flags: Linked
*/
function playflarefx(localclientnum)
{
	self endon(#"death");
	level endon(#"player_switch");
	if(!isdefined(self.var_7701a848))
	{
		self.var_7701a848 = "tag_origin";
	}
	if(!isdefined(self.equipmentfriendfx))
	{
		self.equipmentfriendfx = level._effect[#"powerlightgreen"];
	}
	if(!isdefined(self.equipmentenemyfx))
	{
		self.equipmentenemyfx = level._effect[#"powerlight"];
	}
	if(self function_ca024039())
	{
		fx_handle = util::playfxontag(localclientnum, self.equipmentfriendfx, self, self.var_7701a848);
	}
	else
	{
		fx_handle = util::playfxontag(localclientnum, self.equipmentenemyfx, self, self.var_7701a848);
	}
	return fx_handle;
}

/*
	Name: equipmentwatchteamfx
	Namespace: weaponobjects
	Checksum: 0x21308D56
	Offset: 0x1238
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function equipmentwatchteamfx(localclientnum, fxhandle)
{
	msg = undefined;
	msg = self waittill(#"death", #"team_changed", #"player_switch");
	if(isdefined(fxhandle))
	{
		stopfx(localclientnum, fxhandle);
	}
	waittillframeend();
	if(msg._notify != "death" && isdefined(self))
	{
		self thread equipmentteamobject(localclientnum);
	}
}

/*
	Name: equipmentwatchplayerteamchanged
	Namespace: weaponobjects
	Checksum: 0x97BC7BF2
	Offset: 0x12F8
	Size: 0xEA
	Parameters: 2
	Flags: Linked
*/
function equipmentwatchplayerteamchanged(localclientnum, fxhandle)
{
	self endon(#"death");
	self notify(#"team_changed_watcher");
	self endon(#"team_changed_watcher");
	watcherplayer = function_5c10bd79(fxhandle);
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"team_changed");
		player = function_5c10bd79(waitresult.localclientnum);
		if(watcherplayer == player)
		{
			self notify(#"team_changed");
		}
	}
}

/*
	Name: sndproxalert_entcleanup
	Namespace: weaponobjects
	Checksum: 0xF491B486
	Offset: 0x13F0
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function sndproxalert_entcleanup(localclientnum, ent)
{
	level waittill(#"snddede", #"demo_jump", #"player_switch", #"killcam_begin", #"killcam_end");
	if(isdefined(ent))
	{
		ent stopallloopsounds(0.5);
		ent delete();
	}
}

