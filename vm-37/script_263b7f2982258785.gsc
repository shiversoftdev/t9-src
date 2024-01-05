#using script_43ca6411ae7bac76;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace dialogue;

/*
	Name: queue
	Namespace: dialogue
	Checksum: 0x2382A812
	Offset: 0xC0
	Size: 0x17C
	Parameters: 3
	Flags: None
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
	Checksum: 0x44EAF63E
	Offset: 0x248
	Size: 0x56
	Parameters: 0
	Flags: None
*/
function function_47b06180()
{
	if(isscriptfunctionptr(level.var_4ceaaaf5))
	{
		self thread [[level.var_4ceaaaf5]]();
		return;
	}
	self util::function_f78e220a();
	self notify(#"cancel speaking");
}

/*
	Name: radio
	Namespace: dialogue
	Checksum: 0x51700392
	Offset: 0x2A8
	Size: 0x23C
	Parameters: 4
	Flags: None
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
	Checksum: 0x402B62F5
	Offset: 0x4F0
	Size: 0x114
	Parameters: 0
	Flags: None
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
	Checksum: 0x21921A81
	Offset: 0x610
	Size: 0x44
	Parameters: 0
	Flags: Private
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
	Checksum: 0x49DA740A
	Offset: 0x660
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
	Checksum: 0x2C41238A
	Offset: 0x6B0
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
	Checksum: 0xB4263296
	Offset: 0x710
	Size: 0x44
	Parameters: 3
	Flags: None
*/
function player_say(alias, timeout, var_bcc3bb15)
{
	function_3a8bd5a3(alias, 0, undefined, undefined, undefined, timeout, var_bcc3bb15);
}

/*
	Name: function_3a8bd5a3
	Namespace: dialogue
	Checksum: 0x2E83FA81
	Offset: 0x760
	Size: 0xFC
	Parameters: 7
	Flags: None
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
	Checksum: 0xFF261282
	Offset: 0x868
	Size: 0xEC
	Parameters: 0
	Flags: None
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
	Checksum: 0x6587433A
	Offset: 0x960
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
	Checksum: 0x780724E
	Offset: 0x9B0
	Size: 0x364
	Parameters: 5
	Flags: Private
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
	Checksum: 0xD82A9883
	Offset: 0xD20
	Size: 0xF2
	Parameters: 2
	Flags: None
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
	Checksum: 0x24C8DFA3
	Offset: 0xE20
	Size: 0x7C
	Parameters: 1
	Flags: Private
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
	Checksum: 0xDB611688
	Offset: 0xEA8
	Size: 0x54
	Parameters: 0
	Flags: Private
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
	Checksum: 0xFC7D783B
	Offset: 0xF08
	Size: 0xA6
	Parameters: 0
	Flags: Private
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
	Checksum: 0xB2F120B1
	Offset: 0xFB8
	Size: 0xB6
	Parameters: 0
	Flags: Private
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

