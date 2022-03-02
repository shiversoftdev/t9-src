#using scripts\core_common\array_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace zm_audio;

/*
	Name: function_89f2df9
	Namespace: zm_audio
	Checksum: 0xF736F7B1
	Offset: 0x280
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_audio", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_audio
	Checksum: 0xF7CAE96C
	Offset: 0x2C8
	Size: 0x1E4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "charindex", 1, 4, "int", &charindex_cb, 0, 1);
	clientfield::register("toplayer", "isspeaking", 1, 1, "int", &isspeaking_cb, 0, 1);
	if(!isdefined(level.exert_sounds))
	{
		level.exert_sounds = [];
	}
	level.exert_sounds[0][#"playerbreathinsound"] = "vox_exert_generic_inhale";
	level.exert_sounds[0][#"playerbreathoutsound"] = "vox_exert_generic_exhale";
	level.exert_sounds[0][#"playerbreathgaspsound"] = "vox_exert_generic_exhale";
	level.exert_sounds[0][#"falldamage"] = "vox_exert_generic_pain";
	level.exert_sounds[0][#"mantlesoundplayer"] = "vox_exert_generic_mantle";
	level.exert_sounds[0][#"meleeswipesoundplayer"] = "vox_exert_generic_knifeswipe";
	level.exert_sounds[0][#"dtplandsoundplayer"] = "vox_exert_generic_pain";
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: zm_audio
	Checksum: 0x5F4222D4
	Offset: 0x4B8
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function on_player_spawned(localclientnum)
{
}

/*
	Name: delay_set_exert_id
	Namespace: zm_audio
	Checksum: 0x92B354F5
	Offset: 0x4D0
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function delay_set_exert_id(newval)
{
	self endon(#"death");
	self endon(#"sndendexertoverride");
	wait(0.5);
	self.player_exert_id = newval;
}

/*
	Name: charindex_cb
	Namespace: zm_audio
	Checksum: 0x1993C173
	Offset: 0x520
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function charindex_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!bwastimejump)
	{
		self.player_exert_id = fieldname;
		self.var_164a7bad = 1;
		self notify(#"sndendexertoverride");
	}
	else if(!isdefined(self.var_164a7bad))
	{
		self.var_164a7bad = 1;
		self thread delay_set_exert_id(fieldname);
	}
}

/*
	Name: isspeaking_cb
	Namespace: zm_audio
	Checksum: 0x7F21DE28
	Offset: 0x5D0
	Size: 0x62
	Parameters: 7
	Flags: Linked
*/
function isspeaking_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!bwastimejump)
	{
		self.isspeaking = fieldname;
	}
	else
	{
		self.isspeaking = 0;
	}
}

/*
	Name: zmbmuslooper
	Namespace: zm_audio
	Checksum: 0x86197F87
	Offset: 0x640
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function zmbmuslooper()
{
	ent = spawn(0, (0, 0, 0), "script_origin");
	playsound(0, #"mus_zmb_gamemode_start", (0, 0, 0));
	wait(10);
	ent playloopsound(#"mus_zmb_gamemode_loop", 0.05);
	ent thread waitfor_music_stop();
}

/*
	Name: waitfor_music_stop
	Namespace: zm_audio
	Checksum: 0x3B747300
	Offset: 0x6E8
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function waitfor_music_stop()
{
	level waittill(#"stpm");
	self stopallloopsounds(0.1);
	playsound(0, #"mus_zmb_gamemode_end", (0, 0, 0));
	wait(1);
	self delete();
}

/*
	Name: playerfalldamagesound
	Namespace: zm_audio
	Checksum: 0xE73D1E9A
	Offset: 0x770
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function playerfalldamagesound(client_num, firstperson)
{
	self playerexert(firstperson, "falldamage");
}

/*
	Name: clientvoicesetup
	Namespace: zm_audio
	Checksum: 0x1CEC6C54
	Offset: 0x7B0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function clientvoicesetup()
{
	localclientnum = self getlocalclientnumber();
	self thread audio_player_connect(localclientnum);
}

/*
	Name: audio_player_connect
	Namespace: zm_audio
	Checksum: 0x8A241AEF
	Offset: 0x7F8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function audio_player_connect(localclientnum)
{
	var_3d2dc382 = array("playerbreathinsound", "playerbreathoutsound", "playerbreathgaspsound", "mantlesoundplayer", "meleeswipesoundplayer");
	self thread sndvonotifyplain(localclientnum, var_3d2dc382);
	self thread sndvonotifydtp(localclientnum, "dtplandsoundplayer");
}

/*
	Name: sndvonotifyplain
	Namespace: zm_audio
	Checksum: 0xB247E0E7
	Offset: 0x890
	Size: 0xA8
	Parameters: 2
	Flags: Linked
*/
function sndvonotifyplain(localclientnum, var_3d2dc382)
{
	self notify("68e9879d130dec7b");
	self endon("68e9879d130dec7b");
	self endon(#"death");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(var_3d2dc382);
		if(is_true(self.is_player_zombie))
		{
			continue;
		}
		self playerexert(localclientnum, s_result._notify);
	}
}

/*
	Name: playerexert
	Namespace: zm_audio
	Checksum: 0x539F33D0
	Offset: 0x940
	Size: 0x1CC
	Parameters: 2
	Flags: Linked
*/
function playerexert(localclientnum, exert)
{
	if(isdefined(self.isspeaking) && self.isspeaking == 1)
	{
		return;
	}
	if(is_true(self.beast_mode))
	{
		return;
	}
	if(exert === "meleeswipesoundplayer")
	{
		if(function_42e50d5())
		{
			return;
		}
	}
	id = level.exert_sounds[0][exert];
	if(isarray(level.exert_sounds[0][exert]))
	{
		id = array::random(level.exert_sounds[0][exert]);
	}
	if(isdefined(self.player_exert_id) && isarray(level.exert_sounds) && isarray(level.exert_sounds[self.player_exert_id]))
	{
		if(isarray(level.exert_sounds[self.player_exert_id][exert]))
		{
			id = array::random(level.exert_sounds[self.player_exert_id][exert]);
		}
		else
		{
			id = level.exert_sounds[self.player_exert_id][exert];
		}
	}
	if(isdefined(id))
	{
		self playsound(localclientnum, id);
	}
}

/*
	Name: function_42e50d5
	Namespace: zm_audio
	Checksum: 0x6E04360D
	Offset: 0xB18
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_42e50d5()
{
	if(isdefined(self.weapon))
	{
		switch(self.weapon.name)
		{
			case "hash_50f35c4cfb775a9c":
			case "hash_50f35d4cfb775c4f":
			case "hash_50f35e4cfb775e02":
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: sndvonotifydtp
	Namespace: zm_audio
	Checksum: 0x7EE25551
	Offset: 0xB88
	Size: 0x70
	Parameters: 2
	Flags: Linked
*/
function sndvonotifydtp(localclientnum, notifystring)
{
	self notify("50ec137dd0562c2");
	self endon("50ec137dd0562c2");
	self endon(#"death");
	while(true)
	{
		self waittill(notifystring);
		self playerexert(localclientnum, notifystring);
	}
}

/*
	Name: sndmeleeswipe
	Namespace: zm_audio
	Checksum: 0xE170B350
	Offset: 0xC00
	Size: 0x1D0
	Parameters: 2
	Flags: None
*/
function sndmeleeswipe(localclientnum, notifystring)
{
	self endon(#"death");
	for(;;)
	{
		self waittill(notifystring);
		currentweapon = getcurrentweapon(localclientnum);
		if(is_true(level.sndnomeleeonclient))
		{
			return;
		}
		if(is_true(self.is_player_zombie))
		{
			playsound(0, #"zmb_melee_whoosh_zmb_plr", self.origin);
			continue;
		}
		if(currentweapon.statname === #"bowie_knife")
		{
			playsound(0, #"zmb_bowie_swing_plr", self.origin);
			continue;
		}
		if(currentweapon.name == "spoon_zm_alcatraz")
		{
			playsound(0, #"zmb_spoon_swing_plr", self.origin);
			continue;
		}
		if(currentweapon.name == "spork_zm_alcatraz")
		{
			playsound(0, #"zmb_spork_swing_plr", self.origin);
			continue;
		}
		playsound(0, #"zmb_melee_whoosh_plr", self.origin);
	}
}

/*
	Name: end_gameover_snapshot
	Namespace: zm_audio
	Checksum: 0x93B1AF12
	Offset: 0xDD8
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function end_gameover_snapshot()
{
	level waittill(#"demo_jump", #"demo_player_switch", #"snd_clear_script_duck");
	wait(1);
	audio::snd_set_snapshot("default");
	level thread gameover_snapshot();
}

/*
	Name: gameover_snapshot
	Namespace: zm_audio
	Checksum: 0x2AD52D1D
	Offset: 0xE58
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function gameover_snapshot()
{
	level waittill(#"zesn");
	audio::snd_set_snapshot("zmb_game_over");
	level thread end_gameover_snapshot();
}

/*
	Name: sndzmblaststand
	Namespace: zm_audio
	Checksum: 0xD9016871
	Offset: 0xEB0
	Size: 0x10E
	Parameters: 7
	Flags: None
*/
function sndzmblaststand(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		playsound(fieldname, #"hash_5e980fdf2497d9a1", (0, 0, 0));
		self.var_63de16a = self playloopsound(#"hash_7b41cf42e1b9847b");
		self.inlaststand = 1;
	}
	else if(is_true(self.inlaststand))
	{
		playsound(fieldname, #"hash_1526662237d7780f", (0, 0, 0));
		self stoploopsound(self.var_63de16a);
		self.inlaststand = 0;
	}
}

