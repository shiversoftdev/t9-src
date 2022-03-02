#using script_43ca6411ae7bac76;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace dialogue;

/*
	Name: function_e95a9a2b
	Namespace: dialogue
	Checksum: 0xF7E277CD
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e95a9a2b()
{
	level notify(67233989);
}

/*
	Name: queue
	Namespace: dialogue
	Checksum: 0x1AA12232
	Offset: 0xE0
	Size: 0x17C
	Parameters: 3
	Flags: Linked
*/
function queue(alias, timeout, var_bcc3bb15)
{
	/#
		if(getdvarint(#"hash_c994d2af0329db3", 0) != 0)
		{
			var_88f2fd1a = function_9119c373(alias, "");
			if(isstring(var_88f2fd1a) && var_88f2fd1a != "")
			{
				txt = ("" + alias) + "";
				iprintlnbold(txt);
				println(txt);
			}
		}
	#/
	if(isdefined(self))
	{
		if(is_true(var_bcc3bb15))
		{
			self function_47b06180();
		}
		if(!isdefined(timeout))
		{
			self util::function_2bf19e35(&function_8026ba41, alias);
		}
		else
		{
			self util::function_88e346a(timeout, &function_8026ba41, alias);
		}
	}
}

/*
	Name: function_47b06180
	Namespace: dialogue
	Checksum: 0x1E562D07
	Offset: 0x268
	Size: 0x56
	Parameters: 0
	Flags: Linked
*/
function function_47b06180()
{
	if(isscriptfunctionptr(level.var_4ceaaaf5))
	{
		self thread [[level.var_4ceaaaf5]]();
		return;
	}
	self util::function_f78e220a();
	self notify(#"hash_5d02e24cebf138cb");
}

/*
	Name: radio
	Namespace: dialogue
	Checksum: 0x46825204
	Offset: 0x2C8
	Size: 0x23C
	Parameters: 4
	Flags: Linked
*/
function radio(alias, timeout, var_1ccdc84c, var_bcc3bb15)
{
	/#
		if(getdvarint(#"hash_c994d2af0329db3", 0) != 0)
		{
			var_88f2fd1a = function_9119c373(alias, "");
			if(isstring(var_88f2fd1a) && var_88f2fd1a != "")
			{
				txt = ("" + alias) + "";
				iprintlnbold(txt);
				println(txt);
			}
		}
	#/
	if(is_true(var_bcc3bb15))
	{
		self function_9e580f95();
		waitframe(1);
	}
	notifystring = "dialogue::radio " + alias;
	if(isscriptfunctionptr(level.var_94934cfc))
	{
		self [[level.var_94934cfc]](alias, notifystring);
		return;
	}
	player_radio_emitter = self function_dc8dd8fa();
	if(!isdefined(player_radio_emitter))
	{
		return;
	}
	if(is_true(var_1ccdc84c))
	{
		player_radio_emitter sound::play_on_tag(alias, undefined, 1, notifystring);
	}
	else
	{
		if(!isdefined(timeout))
		{
			player_radio_emitter util::function_2bf19e35(&sound::play_on_tag, alias, undefined, 1, notifystring);
		}
		else
		{
			player_radio_emitter util::function_88e346a(timeout, &sound::play_on_tag, alias, undefined, 1, notifystring);
		}
	}
}

/*
	Name: function_9e580f95
	Namespace: dialogue
	Checksum: 0x36CB8744
	Offset: 0x510
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_9e580f95()
{
	if(isscriptfunctionptr(level.var_4ceaaaf5))
	{
		self thread [[level.var_4ceaaaf5]]();
		return;
	}
	player_radio_emitter = self function_dc8dd8fa();
	if(!isdefined(player_radio_emitter))
	{
		return;
	}
	var_90c2cde7 = player_radio_emitter getlinkedchildren(1);
	foreach(ent in var_90c2cde7)
	{
		ent thread function_d708473a();
	}
	player_radio_emitter thread function_d708473a();
}

/*
	Name: function_d708473a
	Namespace: dialogue
	Checksum: 0x7B85B140
	Offset: 0x630
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d708473a()
{
	self endon(#"death");
	self stopsounds();
	waitframe(1);
	self delete();
}

/*
	Name: function_dcdd0cb6
	Namespace: dialogue
	Checksum: 0xD417128A
	Offset: 0x680
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_dcdd0cb6()
{
	player_radio_emitter = self function_dc8dd8fa();
	if(!isdefined(player_radio_emitter))
	{
		return;
	}
	player_radio_emitter util::function_f78e220a();
}

/*
	Name: function_952d1770
	Namespace: dialogue
	Checksum: 0x93166DFB
	Offset: 0x6D0
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_952d1770(alias)
{
	return radio(alias, float(function_60d95f53()) / 1000);
}

/*
	Name: player_say
	Namespace: dialogue
	Checksum: 0xD8016B9D
	Offset: 0x730
	Size: 0x44
	Parameters: 3
	Flags: Linked
*/
function player_say(alias, timeout, var_bcc3bb15)
{
	function_3a8bd5a3(alias, 0, undefined, undefined, undefined, timeout, var_bcc3bb15);
}

/*
	Name: function_3a8bd5a3
	Namespace: dialogue
	Checksum: 0xAC517CF6
	Offset: 0x780
	Size: 0xFC
	Parameters: 7
	Flags: Linked
*/
function function_3a8bd5a3(alias, sounddelay, gestures, var_e01a79b9, targetents, timeout, var_bcc3bb15)
{
	if(is_true(var_bcc3bb15))
	{
		self player_stop();
	}
	player_dialogue_emitter = self function_7ddb5aa3();
	if(!isdefined(player_dialogue_emitter))
	{
		return;
	}
	if(!isdefined(timeout))
	{
		player_dialogue_emitter util::function_2bf19e35(&_play_player_dialogue, alias, sounddelay, gestures, var_e01a79b9, targetents);
	}
	else
	{
		player_dialogue_emitter util::function_88e346a(timeout, &_play_player_dialogue, alias, sounddelay, gestures, var_e01a79b9, targetents);
	}
}

/*
	Name: player_stop
	Namespace: dialogue
	Checksum: 0x358B9E0D
	Offset: 0x888
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function player_stop()
{
	player_dialogue_emitter = self function_7ddb5aa3();
	if(!isdefined(player_dialogue_emitter))
	{
		return;
	}
	var_6ceb99a = player_dialogue_emitter getlinkedchildren(1);
	foreach(ent in var_6ceb99a)
	{
		ent thread function_d708473a();
	}
	player_dialogue_emitter thread function_d708473a();
}

/*
	Name: function_d37e4893
	Namespace: dialogue
	Checksum: 0xB4B1FD53
	Offset: 0x980
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_d37e4893()
{
	player_dialogue_emitter = self function_7ddb5aa3();
	if(!isdefined(player_dialogue_emitter))
	{
		return;
	}
	player_dialogue_emitter util::function_f78e220a();
}

/*
	Name: _play_player_dialogue
	Namespace: dialogue
	Checksum: 0xF440E0C6
	Offset: 0x9D0
	Size: 0x364
	Parameters: 5
	Flags: Linked, Private
*/
function private _play_player_dialogue(alias, sounddelay, gestures, var_e01a79b9, var_9e354358)
{
	if(ai::is_dead_sentient())
	{
		return;
	}
	org = spawn("script_origin", (0, 0, 0));
	org endon(#"death");
	org.origin = self.origin;
	org.angles = self.angles;
	org linkto(self);
	player = self function_bbd6c05b();
	player_dialogue_emitter = self function_7ddb5aa3();
	/#
		if(isdefined(player_dialogue_emitter) && self == player_dialogue_emitter)
		{
			println("" + alias);
		}
	#/
	if(sounddelay > 0)
	{
		org util::delay(sounddelay, undefined, &playsoundwithnotify, alias, "sounddone");
	}
	else
	{
		org playsoundwithnotify(alias, "sounddone");
	}
	if(isdefined(gestures))
	{
		/#
			assert(isdefined(var_e01a79b9), "");
		#/
		if(isarray(gestures))
		{
			/#
				assert(gestures.size == var_e01a79b9.size, "");
			#/
			for(i = 0; i < gestures.size; i++)
			{
				if(isdefined(var_9e354358) && isdefined(var_9e354358[i]))
				{
					player util::delay(var_e01a79b9[i], undefined, &function_ef63262c, gestures[i], var_9e354358[i]);
					continue;
				}
				player util::delay(var_e01a79b9[i], undefined, &function_ef63262c, gestures[i]);
			}
		}
		else
		{
			if(isdefined(var_9e354358))
			{
				player util::delay(var_e01a79b9, undefined, &function_ef63262c, gestures, var_9e354358);
			}
			else
			{
				player util::delay(var_e01a79b9, undefined, &function_ef63262c, gestures);
			}
		}
	}
	if(sounddelay > 0)
	{
		wait(sounddelay);
	}
	if(!isdefined(sound::wait_for_sounddone_or_death(org, player)))
	{
		org stopsounds();
	}
	wait(0.05);
	org delete();
}

/*
	Name: function_ef63262c
	Namespace: dialogue
	Checksum: 0xBBF279E8
	Offset: 0xD40
	Size: 0xF2
	Parameters: 2
	Flags: Linked
*/
function function_ef63262c(var_ee58f129, lookatent)
{
	/#
		assert(self == level.player, "");
	#/
	self endon(#"death");
	var_cdd69f44 = 0;
	blendtime = undefined;
	var_85e88aeb = 0;
	if(isdefined(lookatent) && isentity(lookatent))
	{
		var_cdd69f44 = self playgestureviewmodel(var_ee58f129, lookatent, 1, blendtime);
	}
	else
	{
		var_cdd69f44 = self playgestureviewmodel(var_ee58f129, undefined, 1, blendtime);
	}
	return var_cdd69f44;
}

/*
	Name: function_8026ba41
	Namespace: dialogue
	Checksum: 0x97B4570D
	Offset: 0xE40
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8026ba41(alias)
{
	if(isdefined(getscriptbundle(alias)))
	{
		self thread scene::play(alias, self);
	}
	if(soundexists(alias))
	{
		self face::playfacethread(undefined, alias, 1);
	}
}

/*
	Name: function_bbd6c05b
	Namespace: dialogue
	Checksum: 0x608FF950
	Offset: 0xEC8
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bbd6c05b()
{
	if(isplayer(self))
	{
		return self;
	}
	players = getplayers();
	if(players.size > 0)
	{
		return players[0];
	}
	return undefined;
}

/*
	Name: function_7ddb5aa3
	Namespace: dialogue
	Checksum: 0x8D40AA63
	Offset: 0xF28
	Size: 0xA6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7ddb5aa3()
{
	player = self function_bbd6c05b();
	if(isdefined(player))
	{
		if(!isdefined(player.player_dialogue_emitter))
		{
			ent = spawn("script_origin", player.origin);
			ent linkto(player, "", (0, 0, 0), (0, 0, 0));
			player.player_dialogue_emitter = ent;
		}
		return player.player_dialogue_emitter;
	}
	return undefined;
}

/*
	Name: function_dc8dd8fa
	Namespace: dialogue
	Checksum: 0xF73F9EB9
	Offset: 0xFD8
	Size: 0xB6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_dc8dd8fa()
{
	player = self function_bbd6c05b();
	if(isdefined(player))
	{
		if(!isdefined(player.player_radio_emitter))
		{
			ent = spawn("script_origin", player getplayercamerapos());
			ent linkto(player, "", (0, 0, 0), (0, 0, 0));
			player.player_radio_emitter = ent;
		}
		return player.player_radio_emitter;
	}
	return undefined;
}

