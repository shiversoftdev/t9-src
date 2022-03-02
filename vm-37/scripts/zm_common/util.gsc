#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace util;

/*
	Name: brush_delete
	Namespace: util
	Checksum: 0x42FE4E58
	Offset: 0x110
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function brush_delete()
{
	num = self.v[#"exploder"];
	if(isdefined(self.v[#"delay"]))
	{
		wait(self.v[#"delay"]);
	}
	else
	{
		wait(0.05);
	}
	if(!isdefined(self.model))
	{
		return;
	}
	/#
		assert(isdefined(self.model));
	#/
	if(!isdefined(self.v[#"fxid"]) || self.v[#"fxid"] == "No FX")
	{
		self.v[#"exploder"] = undefined;
	}
	waittillframeend();
	self.model delete();
}

/*
	Name: brush_show
	Namespace: util
	Checksum: 0xB7DFD672
	Offset: 0x230
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function brush_show()
{
	if(isdefined(self.v[#"delay"]))
	{
		wait(self.v[#"delay"]);
	}
	/#
		assert(isdefined(self.model));
	#/
	self.model show();
	self.model solid();
}

/*
	Name: brush_throw
	Namespace: util
	Checksum: 0xBC5CE8CE
	Offset: 0x2C8
	Size: 0x21C
	Parameters: 0
	Flags: None
*/
function brush_throw()
{
	if(isdefined(self.v[#"delay"]))
	{
		wait(self.v[#"delay"]);
	}
	ent = undefined;
	if(isdefined(self.v[#"target"]))
	{
		ent = getent(self.v[#"target"], "targetname");
	}
	if(!isdefined(ent))
	{
		self.model delete();
		return;
	}
	self.model show();
	startorg = self.v[#"origin"];
	startang = self.v[#"angles"];
	org = ent.origin;
	temp_vec = org - self.v[#"origin"];
	x = temp_vec[0];
	y = temp_vec[1];
	z = temp_vec[2];
	self.model rotatevelocity((x, y, z), 12);
	self.model movegravity((x, y, z), 12);
	self.v[#"exploder"] = undefined;
	wait(6);
	self.model delete();
}

/*
	Name: playsoundonplayers
	Namespace: util
	Checksum: 0x6A1BF571
	Offset: 0x4F0
	Size: 0x174
	Parameters: 2
	Flags: None
*/
function playsoundonplayers(sound, team)
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

/*
	Name: get_player_height
	Namespace: util
	Checksum: 0x57FC8AA
	Offset: 0x670
	Size: 0xA
	Parameters: 0
	Flags: None
*/
function get_player_height()
{
	return 70;
}

/*
	Name: isbulletimpactmod
	Namespace: util
	Checksum: 0x50AE2F07
	Offset: 0x688
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function isbulletimpactmod(smeansofdeath)
{
	return issubstr(smeansofdeath, "BULLET") || smeansofdeath == "MOD_HEAD_SHOT";
}

/*
	Name: waitrespawnbutton
	Namespace: util
	Checksum: 0x34588DBC
	Offset: 0x6D0
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function waitrespawnbutton()
{
	self endon(#"disconnect", #"end_respawn");
	while(self usebuttonpressed() != 1)
	{
		waitframe(1);
	}
}

/*
	Name: printonteam
	Namespace: util
	Checksum: 0xE9DDBA42
	Offset: 0x728
	Size: 0xD4
	Parameters: 2
	Flags: None
*/
function printonteam(text, team)
{
	/#
		assert(isdefined(level.players));
	#/
	for(i = 0; i < level.players.size; i++)
	{
		player = level.players[i];
		if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == team)
		{
			player iprintln(text);
		}
	}
}

/*
	Name: printboldonteam
	Namespace: util
	Checksum: 0x67D94608
	Offset: 0x808
	Size: 0xD4
	Parameters: 2
	Flags: None
*/
function printboldonteam(text, team)
{
	/#
		assert(isdefined(level.players));
	#/
	for(i = 0; i < level.players.size; i++)
	{
		player = level.players[i];
		if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == team)
		{
			player iprintlnbold(text);
		}
	}
}

/*
	Name: printboldonteamarg
	Namespace: util
	Checksum: 0xDACD081
	Offset: 0x8E8
	Size: 0xDC
	Parameters: 3
	Flags: None
*/
function printboldonteamarg(text, team, arg)
{
	/#
		assert(isdefined(level.players));
	#/
	for(i = 0; i < level.players.size; i++)
	{
		player = level.players[i];
		if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == team)
		{
			player iprintlnbold(text, arg);
		}
	}
}

/*
	Name: printonteamarg
	Namespace: util
	Checksum: 0x9F0FA1E0
	Offset: 0x9D0
	Size: 0x1C
	Parameters: 3
	Flags: None
*/
function printonteamarg(text, team, arg)
{
}

/*
	Name: printonplayers
	Namespace: util
	Checksum: 0xEBA64C94
	Offset: 0x9F8
	Size: 0xD4
	Parameters: 2
	Flags: None
*/
function printonplayers(text, team)
{
	players = level.players;
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(team))
		{
			if(isdefined(players[i].pers[#"team"]) && players[i].pers[#"team"] == team)
			{
				players[i] iprintln(text);
			}
			continue;
		}
		players[i] iprintln(text);
	}
}

/*
	Name: _playlocalsound
	Namespace: util
	Checksum: 0x3B7C4EF9
	Offset: 0xAD8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function _playlocalsound(soundalias)
{
	if(level.splitscreen && !self ishost())
	{
		return;
	}
	self playlocalsound(soundalias);
}

/*
	Name: getotherteam
	Namespace: util
	Checksum: 0x6D897F4A
	Offset: 0xB30
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function getotherteam(team)
{
	if(team == #"allies")
	{
		return #"axis";
	}
	if(team == #"axis")
	{
		return #"allies";
	}
	return #"allies";
}

/*
	Name: getteammask
	Namespace: util
	Checksum: 0x5EB15F19
	Offset: 0xBC8
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function getteammask(team)
{
	if(!level.teambased || !isdefined(team) || !isdefined(level.spawnsystem.ispawn_teammask[team]))
	{
		return level.spawnsystem.ispawn_teammask_free;
	}
	return level.spawnsystem.ispawn_teammask[team];
}

/*
	Name: getotherteamsmask
	Namespace: util
	Checksum: 0x5991FF4C
	Offset: 0xC48
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function getotherteamsmask(skip_team)
{
	mask = 0;
	foreach(_ in level.teams)
	{
		if(team == skip_team)
		{
			continue;
		}
		mask = mask | getteammask(team);
	}
	return mask;
}

/*
	Name: getfx
	Namespace: util
	Checksum: 0x219FEECD
	Offset: 0xD08
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function getfx(fx)
{
	/#
		assert(isdefined(level._effect[fx]), ("" + fx) + "");
	#/
	return level._effect[fx];
}

/*
	Name: isstrstart
	Namespace: util
	Checksum: 0x70F815BA
	Offset: 0xD70
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function isstrstart(string1, substr)
{
	return getsubstr(string1, 0, substr.size) == substr;
}

/*
	Name: iskillstreaksenabled
	Namespace: util
	Checksum: 0x59751AB3
	Offset: 0xDB0
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function iskillstreaksenabled()
{
	return isdefined(level.killstreaksenabled) && level.killstreaksenabled;
}

/*
	Name: getremotename
	Namespace: util
	Checksum: 0x14923398
	Offset: 0xDD8
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function getremotename()
{
	/#
		assert(self isusingremote());
	#/
	return self.usingremote;
}

/*
	Name: setobjectivetext
	Namespace: util
	Checksum: 0xE1A9B4F4
	Offset: 0xE18
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function setobjectivetext(team, text)
{
	game.strings["objective_" + level.teams[team]] = text;
}

/*
	Name: setobjectivescoretext
	Namespace: util
	Checksum: 0x812FE557
	Offset: 0xE58
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function setobjectivescoretext(team, text)
{
	game.strings["objective_score_" + level.teams[team]] = text;
}

/*
	Name: getobjectivetext
	Namespace: util
	Checksum: 0x3F11BBB6
	Offset: 0xE98
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function getobjectivetext(team)
{
	return game.strings["objective_" + level.teams[team]];
}

/*
	Name: getobjectivescoretext
	Namespace: util
	Checksum: 0xE9E45399
	Offset: 0xED0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function getobjectivescoretext(team)
{
	return game.strings["objective_score_" + level.teams[team]];
}

/*
	Name: getobjectivehinttext
	Namespace: util
	Checksum: 0xA698EE24
	Offset: 0xF08
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function getobjectivehinttext(team)
{
	return game.strings["objective_hint_" + level.teams[team]];
}

/*
	Name: registerroundswitch
	Namespace: util
	Checksum: 0x4EE16771
	Offset: 0xF40
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function registerroundswitch(minvalue, maxvalue)
{
	level.roundswitch = math::clamp(getgametypesetting(#"roundswitch"), minvalue, maxvalue);
	level.roundswitchmin = minvalue;
	level.roundswitchmax = maxvalue;
}

/*
	Name: registerroundlimit
	Namespace: util
	Checksum: 0x8774CE2E
	Offset: 0xFC0
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function registerroundlimit(minvalue, maxvalue)
{
	level.roundlimit = math::clamp(getgametypesetting(#"roundlimit"), minvalue, maxvalue);
	level.roundlimitmin = minvalue;
	level.roundlimitmax = maxvalue;
}

/*
	Name: registerroundwinlimit
	Namespace: util
	Checksum: 0xEA056846
	Offset: 0x1040
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function registerroundwinlimit(minvalue, maxvalue)
{
	level.roundwinlimit = math::clamp(getgametypesetting(#"roundwinlimit"), minvalue, maxvalue);
	level.roundwinlimitmin = minvalue;
	level.roundwinlimitmax = maxvalue;
}

/*
	Name: registerscorelimit
	Namespace: util
	Checksum: 0x59766312
	Offset: 0x10C0
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function registerscorelimit(minvalue, maxvalue)
{
	level.scorelimit = math::clamp(getgametypesetting(#"scorelimit"), minvalue, maxvalue);
	level.scorelimitmin = minvalue;
	level.scorelimitmax = maxvalue;
}

/*
	Name: registertimelimit
	Namespace: util
	Checksum: 0x3B555727
	Offset: 0x1140
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function registertimelimit(minvalue, maxvalue)
{
	level.timelimit = math::clamp(getgametypesetting(#"timelimit"), minvalue, maxvalue);
	level.timelimitmin = minvalue;
	level.timelimitmax = maxvalue;
}

/*
	Name: registernumlives
	Namespace: util
	Checksum: 0xC123E42C
	Offset: 0x11C0
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function registernumlives(minvalue, maxvalue)
{
	level.numlives = math::clamp(getgametypesetting(#"playernumlives"), minvalue, maxvalue);
	level.numlivesmin = minvalue;
	level.numlivesmax = maxvalue;
}

/*
	Name: getplayerfromclientnum
	Namespace: util
	Checksum: 0x545275E6
	Offset: 0x1240
	Size: 0x80
	Parameters: 1
	Flags: None
*/
function getplayerfromclientnum(clientnum)
{
	if(clientnum < 0)
	{
		return undefined;
	}
	for(i = 0; i < level.players.size; i++)
	{
		if(level.players[i] getentitynumber() == clientnum)
		{
			return level.players[i];
		}
	}
	return undefined;
}

/*
	Name: ispressbuild
	Namespace: util
	Checksum: 0xE044BF9
	Offset: 0x12C8
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function ispressbuild()
{
	buildtype = getdvarstring(#"buildtype");
	if(isdefined(buildtype) && buildtype == "press")
	{
		return true;
	}
	return false;
}

/*
	Name: isflashbanged
	Namespace: util
	Checksum: 0xCD12BA57
	Offset: 0x1328
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function isflashbanged()
{
	return isdefined(self.flashendtime) && gettime() < self.flashendtime;
}

/*
	Name: domaxdamage
	Namespace: util
	Checksum: 0x5C996737
	Offset: 0x1350
	Size: 0xB4
	Parameters: 5
	Flags: None
*/
function domaxdamage(origin, attacker, inflictor, headshot, mod)
{
	if(isdefined(self.damagedtodeath) && self.damagedtodeath)
	{
		return;
	}
	if(isdefined(self.maxhealth))
	{
		damage = self.maxhealth + 1;
	}
	else
	{
		damage = self.health + 1;
	}
	self.damagedtodeath = 1;
	self dodamage(damage, origin, attacker, inflictor, headshot, mod);
}

/*
	Name: get_array_of_closest
	Namespace: util
	Checksum: 0x67B79DD0
	Offset: 0x1410
	Size: 0x294
	Parameters: 5
	Flags: None
*/
function get_array_of_closest(org, array, excluders, max, maxdist)
{
	if(!isdefined(max))
	{
		max = array.size;
	}
	if(!isdefined(excluders))
	{
		excluders = [];
	}
	maxdists2rd = undefined;
	if(isdefined(maxdist))
	{
		maxdists2rd = maxdist * maxdist;
	}
	dist = [];
	index = [];
	for(i = 0; i < array.size; i++)
	{
		if(!isdefined(array[i]))
		{
			continue;
		}
		if(isinarray(excluders, array[i]))
		{
			continue;
		}
		if(isvec(array[i]))
		{
			length = distancesquared(org, array[i]);
		}
		else
		{
			length = distancesquared(org, array[i].origin);
		}
		if(isdefined(maxdists2rd) && maxdists2rd < length)
		{
			continue;
		}
		dist[dist.size] = length;
		index[index.size] = i;
	}
	for(;;)
	{
		change = 0;
		for(i = 0; i < dist.size - 1; i++)
		{
			if(dist[i] <= (dist[i + 1]))
			{
				continue;
			}
			change = 1;
			temp = dist[i];
			dist[i] = dist[i + 1];
			dist[i + 1] = temp;
			temp = index[i];
			index[i] = index[i + 1];
			index[i + 1] = temp;
		}
		if(!change)
		{
			break;
		}
	}
	newarray = [];
	if(max > dist.size)
	{
		max = dist.size;
	}
	for(i = 0; i < max; i++)
	{
		newarray[i] = array[index[i]];
	}
	return newarray;
}

