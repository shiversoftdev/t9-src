#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\util_shared.csc;

#namespace codcaster;

/*
	Name: function_b8fe9b52
	Namespace: codcaster
	Checksum: 0x15E22CB0
	Offset: 0x1D0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_b8fe9b52(localclientnum)
{
	return function_4e3684f2(localclientnum);
}

/*
	Name: function_45a5c04c
	Namespace: codcaster
	Checksum: 0x58BBF833
	Offset: 0x200
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_45a5c04c(localclientnum)
{
	return function_b8fe9b52(localclientnum) && function_21dc7cf(localclientnum);
}

/*
	Name: function_936862dc
	Namespace: codcaster
	Checksum: 0xF5CA0B66
	Offset: 0x248
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_936862dc(localclientnum)
{
	return function_b8fe9b52(localclientnum) && function_4af9029c(localclientnum);
}

/*
	Name: function_c955fbd1
	Namespace: codcaster
	Checksum: 0x6B528B69
	Offset: 0x290
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_c955fbd1(localclientnum)
{
	return function_b8fe9b52(localclientnum) && function_cd753154(localclientnum);
}

/*
	Name: function_9e39e246
	Namespace: codcaster
	Checksum: 0x51126D6E
	Offset: 0x2D8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_9e39e246(localclientnum)
{
	return function_b8fe9b52(localclientnum) && function_9bfd9a04(localclientnum);
}

/*
	Name: function_39bce377
	Namespace: codcaster
	Checksum: 0x496AEA67
	Offset: 0x320
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_39bce377(localclientnum)
{
	return function_b8fe9b52(localclientnum) && function_aa0b7b86(localclientnum, "codcaster_team_identity");
}

/*
	Name: function_f47e494a
	Namespace: codcaster
	Checksum: 0xB348EA92
	Offset: 0x370
	Size: 0x7A
	Parameters: 3
	Flags: Linked
*/
function function_f47e494a(localclientnum, team, colorindex)
{
	if(team == #"allies")
	{
		return function_aa0b7b86(localclientnum, "codcaster_team1_color" + colorindex);
	}
	return function_aa0b7b86(localclientnum, "codcaster_team2_color" + colorindex);
}

/*
	Name: function_1f84bb65
	Namespace: codcaster
	Checksum: 0x70A6B50E
	Offset: 0x3F8
	Size: 0xD2
	Parameters: 3
	Flags: Linked
*/
function function_1f84bb65(localclientnum, team, colorindex)
{
	if(function_39bce377(localclientnum))
	{
		var_216b0054 = function_f47e494a(localclientnum, team, colorindex);
		teamcolor = (var_216b0054[0] / 255, var_216b0054[1] / 255, var_216b0054[2] / 255);
	}
	else
	{
		if(team == #"neutral")
		{
			team = #"axis";
		}
		teamcolor = getteamcolor(localclientnum, team, colorindex);
	}
	return teamcolor;
}

/*
	Name: is_friendly
	Namespace: codcaster
	Checksum: 0x7BA5B660
	Offset: 0x4D8
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function is_friendly(localclientnum, team)
{
	scorepanel_flipped = function_aa0b7b86(localclientnum, "codcaster_flip_scorepanel");
	if(!isdefined(team))
	{
		team = self.team;
	}
	if(!scorepanel_flipped)
	{
		friendly = team == #"allies";
	}
	else
	{
		friendly = team == #"axis";
	}
	return friendly;
}

/*
	Name: function_57a6b7b0
	Namespace: codcaster
	Checksum: 0x93452ACD
	Offset: 0x578
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_57a6b7b0(localclientnum)
{
	if(game.state == #"postgame")
	{
		return;
	}
	level.isigcactive = 0;
	level waittill(#"localplayer_spawned");
	waitframe(1);
	util::waitforclient(localclientnum);
	if(function_b8fe9b52(localclientnum))
	{
		thread codcaster_monitor_xray_change(localclientnum);
		thread codcaster_monitor_player_pucks(localclientnum);
		thread function_914ef81b(localclientnum);
	}
}

/*
	Name: function_914ef81b
	Namespace: codcaster
	Checksum: 0xAE67A05F
	Offset: 0x648
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_914ef81b(localclientnum)
{
	function_9e0f8f9d(localclientnum);
	level waittill(#"game_ended");
	function_63c282e0(localclientnum);
	function_d0863a11(localclientnum, 0);
}

/*
	Name: function_12acfa84
	Namespace: codcaster
	Checksum: 0x82645689
	Offset: 0x6C0
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_12acfa84()
{
	level.var_6a64742e = 1;
}

/*
	Name: codcaster_monitor_xray_change
	Namespace: codcaster
	Checksum: 0x2B12AD0B
	Offset: 0x6E0
	Size: 0x3A0
	Parameters: 1
	Flags: Linked, Private
*/
function private codcaster_monitor_xray_change(localclientnum)
{
	level notify("codcaster_monitor_xray_change" + localclientnum);
	level endon("codcaster_monitor_xray_change" + localclientnum);
	level.var_6a64742e = 1;
	localplayer = function_5c10bd79(localclientnum);
	var_2c491b2b = localplayer.team;
	var_f4e066d = 0;
	var_fb32b8ee = 0;
	var_adcf5c30 = 0;
	var_9c1f6f = 0;
	var_894a233a = 0;
	var_f0868cc0 = 0;
	var_f4e066d = function_aa0b7b86(localclientnum, "codcaster_xray");
	var_fb32b8ee = function_aa0b7b86(localclientnum, "codcaster_xray_target");
	var_adcf5c30 = function_aa0b7b86(localclientnum, "codcaster_xray_advanced_target");
	while(true)
	{
		waitframe(1);
		localplayer = function_5c10bd79(localclientnum);
		team = localplayer.team;
		if(game.state == #"pregame" || game.state == #"postgame")
		{
			level.var_6a64742e = 1;
			level.isigcactive = isigcactive(localclientnum);
		}
		var_52fe6881 = function_aa0b7b86(localclientnum, "codcaster_xray");
		var_6f36c5bc = function_aa0b7b86(localclientnum, "codcaster_xray_target");
		var_349e9a55 = function_aa0b7b86(localclientnum, "codcaster_xray_advanced_target");
		var_2db6105b = level.gamestarted;
		var_50b78b20 = function_cd753154(localclientnum);
		var_920aadd7 = is_true(level.isigcactive);
		var_504a9922 = team != var_2c491b2b || var_52fe6881 != var_f4e066d || var_6f36c5bc != var_fb32b8ee || var_349e9a55 != var_adcf5c30 || var_2db6105b != var_894a233a || var_50b78b20 != var_9c1f6f || var_920aadd7 != var_f0868cc0;
		if(var_504a9922 || level.var_6a64742e)
		{
			level.var_6a64742e = 0;
			var_2c491b2b = team;
			var_f4e066d = var_52fe6881;
			var_fb32b8ee = var_6f36c5bc;
			var_adcf5c30 = var_349e9a55;
			var_894a233a = var_2db6105b;
			var_9c1f6f = var_50b78b20;
			var_f0868cc0 = var_920aadd7;
			self function_1cc61419(localclientnum, [2:var_349e9a55, 1:var_6f36c5bc, 0:var_52fe6881]);
		}
	}
}

/*
	Name: function_1cc61419
	Namespace: codcaster
	Checksum: 0x713E1A52
	Offset: 0xA88
	Size: 0x5E0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1cc61419(localclientnum, settings)
{
	var_f2a410c9 = [];
	players = getplayers(localclientnum);
	foreach(player in players)
	{
		if(!isalive(player))
		{
			continue;
		}
		if(player is_friendly(localclientnum))
		{
			var_f2a410c9[var_f2a410c9.size] = [3:player.team, 2:#"hash_39109749d54991e4", 1:#"hash_48a9d99bb016fbd3", 0:player];
			continue;
		}
		var_f2a410c9[var_f2a410c9.size] = [3:player.team, 2:#"hash_39109a49d54996fd", 1:#"hash_2fff175ca0ba28b2", 0:player];
	}
	ents = getentarraybytype(localclientnum, 15);
	foreach(entity in ents)
	{
		if(!isdefined(entity.archetype))
		{
			continue;
		}
		if(entity.archetype != #"mp_dog")
		{
			continue;
		}
		if(entity.team != #"allies" && entity.team != #"axis")
		{
			continue;
		}
		if(entity is_friendly(localclientnum))
		{
			var_f2a410c9[var_f2a410c9.size] = [3:entity.team, 2:#"hash_39109749d54991e4", 1:#"hash_2476e7ae62469f70", 0:entity];
			continue;
		}
		var_f2a410c9[var_f2a410c9.size] = [3:entity.team, 2:#"hash_39109a49d54996fd", 1:#"hash_2476eaae6246a489", 0:entity];
	}
	if(isdefined(level.var_e4935474))
	{
		ents = level.var_e4935474;
		foreach(entity in ents)
		{
			ent = getentbynum(localclientnum, entity.var_eec7f99d);
			if(isdefined(ent))
			{
				if(ent is_friendly(localclientnum, entity.var_7c69bb09))
				{
					var_f2a410c9[var_f2a410c9.size] = [3:entity.var_7c69bb09, 2:#"hash_39109749d54991e4", 1:#"hash_2476e7ae62469f70", 0:ent];
					continue;
				}
				var_f2a410c9[var_f2a410c9.size] = [3:entity.var_7c69bb09, 2:#"hash_39109a49d54996fd", 1:#"hash_2476eaae6246a489", 0:ent];
			}
		}
	}
	foreach(array in var_f2a410c9)
	{
		entity = array[0];
		var_c43ac0da = array[1];
		rob = array[2];
		team = array[3];
		entity function_89106df8(localclientnum, var_c43ac0da, rob, team, settings);
	}
}

/*
	Name: function_471909d9
	Namespace: codcaster
	Checksum: 0x894F22A0
	Offset: 0x1070
	Size: 0x290
	Parameters: 4
	Flags: Linked
*/
function function_471909d9(localclientnum, entity, settings, localplayerteam)
{
	if(!isdefined(settings))
	{
		return true;
	}
	var_52fe6881 = settings[0];
	var_6f36c5bc = settings[1];
	var_349e9a55 = settings[2];
	if(!var_52fe6881)
	{
		return false;
	}
	if(isigcactive(localclientnum) || game.state == #"postgame")
	{
		return false;
	}
	if(isplayer(entity))
	{
		var_8ee5246c = function_5c10bd79(localclientnum);
		if(var_8ee5246c == entity && !function_c955fbd1(localclientnum))
		{
			return false;
		}
		if(var_349e9a55 != 1 && var_349e9a55 != 0)
		{
			return false;
		}
		if(!function_9e39e246(localclientnum))
		{
			alliesteam = (is_friendly(localclientnum, #"allies") ? #"allies" : #"axis");
		}
		else
		{
			if(localplayerteam == #"spectator" || localplayerteam == #"allies")
			{
				alliesteam = #"allies";
			}
			else
			{
				alliesteam = #"axis";
			}
		}
		var_3be52391 = util::get_enemy_team(alliesteam);
		if(var_6f36c5bc == 0 || (entity.team == alliesteam && var_6f36c5bc == 1) || (entity.team == var_3be52391 && var_6f36c5bc == 2))
		{
			return true;
		}
	}
	else if(var_349e9a55 == 0 || var_349e9a55 == 2)
	{
		return true;
	}
	return false;
}

/*
	Name: function_89106df8
	Namespace: codcaster
	Checksum: 0x13538FE5
	Offset: 0x1308
	Size: 0x244
	Parameters: 5
	Flags: Linked
*/
function function_89106df8(localclientnum, var_c43ac0da, rob, var_4724c867, settings)
{
	if(!function_b8fe9b52(localclientnum))
	{
		return;
	}
	team = self.team;
	if(isdefined(var_4724c867))
	{
		team = var_4724c867;
	}
	if(team == #"spectator")
	{
		return;
	}
	localplayer = function_5c10bd79(localclientnum);
	localplayerteam = localplayer.team;
	alpha = 1;
	if(!function_471909d9(localclientnum, self, settings, localplayerteam))
	{
		alpha = 0;
	}
	self renderoverridebundle::function_c8d97b8e(localclientnum, #"hash_7e51b929877df918", var_c43ac0da);
	if(!self function_d2503806(rob))
	{
		return;
	}
	teamcolor = function_1f84bb65(localclientnum, team, 3);
	var_592b7729 = (is_friendly(localclientnum, team) ? "_team1" : "_team2");
	if(self postfx::function_556665f2(#"hash_56c4fdb61b420119" + var_592b7729))
	{
		self function_116b95e5(#"hash_56c4fdb61b420119" + var_592b7729, #"color", teamcolor[0], teamcolor[1], teamcolor[2]);
		self function_116b95e5(#"hash_56c4fdb61b420119" + var_592b7729, #"alpha", alpha);
	}
}

/*
	Name: function_6d9b84d9
	Namespace: codcaster
	Checksum: 0xC7046BC7
	Offset: 0x1558
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_6d9b84d9(rob)
{
	if(self flag::exists(#"hash_7e51b929877df918"))
	{
		self renderoverridebundle::stop_bundle(#"hash_7e51b929877df918", rob, 1);
	}
}

/*
	Name: function_7ed4edd3
	Namespace: codcaster
	Checksum: 0xE647F90F
	Offset: 0x15B8
	Size: 0x7A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7ed4edd3(playername)
{
	if(!isdefined(playername))
	{
		return 0;
	}
	if(!isdefined(level.var_f5a7b6e9))
	{
		return 0;
	}
	if(!isdefined(level.var_f5a7b6e9[playername]))
	{
		return 0;
	}
	return level.var_f5a7b6e9[playername] function_d2503806(level.var_f5a7b6e9[playername].rob);
}

/*
	Name: function_995e01b6
	Namespace: codcaster
	Checksum: 0x5166E200
	Offset: 0x1640
	Size: 0x27E
	Parameters: 2
	Flags: Linked
*/
function function_995e01b6(localclientnum, player)
{
	if(!isdefined(player))
	{
		return;
	}
	rob = (player is_friendly(localclientnum) ? #"hash_17daa1d16cd73cd2" : #"hash_17daa0d16cd73b1f");
	postfx = #"hash_2e3ec8882293a18f" + (player is_friendly(localclientnum) ? "_team1" : "_team2");
	var_1762ffa = util::spawn_model(localclientnum, #"hash_445c4aedaf62d3b9", player.origin, player.angles - vectorscale((1, 0, 0), 90));
	teamcolor = function_1f84bb65(localclientnum, player.team, 3);
	if(player function_21c0fa55() && !function_4af9029c(localclientnum))
	{
		var_3a0f5e49 = getdvarfloat(#"hash_595a2f8a298ab607", 1);
		teamcolor = teamcolor * var_3a0f5e49;
	}
	var_1762ffa function_bf9d3071(rob);
	if(var_1762ffa postfx::function_556665f2(postfx))
	{
		var_1762ffa function_116b95e5(postfx, #"color", teamcolor[0], teamcolor[1], teamcolor[2]);
		var_1762ffa function_116b95e5(postfx, #"alpha", 1);
	}
	level.var_f5a7b6e9[player.name] = var_1762ffa;
	level.var_f5a7b6e9[player.name].player = player;
	level.var_f5a7b6e9[player.name].rob = rob;
}

/*
	Name: function_425a51a2
	Namespace: codcaster
	Checksum: 0xFBE1FE7
	Offset: 0x18C8
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_425a51a2(var_5854d8e)
{
	if(var_5854d8e function_d2503806(var_5854d8e.rob))
	{
		var_5854d8e function_5d482e78(var_5854d8e.rob);
	}
	var_5854d8e delete();
}

/*
	Name: function_35248a94
	Namespace: codcaster
	Checksum: 0x2D1B757B
	Offset: 0x1938
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_35248a94(playername)
{
	if(!isdefined(level.var_f5a7b6e9) || !isdefined(level.var_f5a7b6e9[playername]))
	{
		return;
	}
	function_425a51a2(level.var_f5a7b6e9[playername]);
	level.var_f5a7b6e9[playername] = undefined;
}

/*
	Name: codcaster_monitor_player_pucks
	Namespace: codcaster
	Checksum: 0xC733390D
	Offset: 0x19B0
	Size: 0x466
	Parameters: 1
	Flags: Linked, Private
*/
function private codcaster_monitor_player_pucks(localclientnum)
{
	level notify("codcaster_monitor_player_pucks" + localclientnum);
	level endon("codcaster_monitor_player_pucks" + localclientnum);
	while(true)
	{
		waitframe(1);
		var_15dfb7fc = function_4af9029c(localclientnum) && function_aa0b7b86(localclientnum, "codcaster_freecam_pucks");
		var_c36a1b34 = function_21dc7cf(localclientnum) && function_aa0b7b86(localclientnum, "codcaster_aerialcam_pucks");
		var_1aee36ff = level.gamestarted && (var_c36a1b34 || var_15dfb7fc);
		foreach(player in getplayers(localclientnum))
		{
			var_1db99579 = function_7ed4edd3(player.name);
			var_950b4dc5 = isdefined(player) && var_1aee36ff && isalive(player) && !function_3132f113(player);
			if(!var_15dfb7fc && var_1db99579 && player function_21c0fa55() && (!isdefined(level.var_4f107064) || level.var_4f107064 != player.name))
			{
				function_35248a94(level.var_4f107064);
				function_35248a94(player.name);
				level.var_4f107064 = player.name;
			}
			else if(var_15dfb7fc && var_1db99579 && isdefined(level.var_4f107064))
			{
				function_35248a94(level.var_4f107064);
				level.var_4f107064 = undefined;
			}
			if(var_1db99579 && !var_950b4dc5)
			{
				function_35248a94(player.name);
				continue;
			}
			if(!var_1db99579 && var_950b4dc5)
			{
				function_995e01b6(localclientnum, player);
			}
		}
		if(isdefined(level.var_f5a7b6e9))
		{
			foreach(var_5854d8e in level.var_f5a7b6e9)
			{
				if(!isdefined(var_5854d8e))
				{
					continue;
				}
				linkedent = var_5854d8e.player;
				if(!isdefined(linkedent) || function_3132f113(linkedent) || !isalive(linkedent))
				{
					function_425a51a2(var_5854d8e);
					continue;
				}
				angles = linkedent getplayerangles();
				var_5854d8e.angles = (-90, angles[1], 0);
				var_5854d8e.origin = linkedent.origin;
			}
		}
	}
}

/*
	Name: function_773f6e31
	Namespace: codcaster
	Checksum: 0xE3B7C8D1
	Offset: 0x1E20
	Size: 0x2CC
	Parameters: 4
	Flags: None
*/
function function_773f6e31(localclientnum, entity, var_d0ada253, state)
{
	var_be6642de = (1, 1, 1);
	var_b76d5d98 = (0, 0, 0);
	if(state == 1)
	{
		var_be6642de = function_1f84bb65(localclientnum, #"allies", 3);
	}
	else
	{
		if(state == 2)
		{
			var_be6642de = function_1f84bb65(localclientnum, #"axis", 3);
		}
		else if(state == 3)
		{
			var_be6642de = function_1f84bb65(localclientnum, #"allies", 3);
			var_b76d5d98 = function_1f84bb65(localclientnum, #"axis", 3);
		}
	}
	if(isdefined(var_be6642de))
	{
		entity function_78233d29(var_d0ada253, "", #"hash_6be0f6c7665077c7", var_be6642de[0]);
		entity function_78233d29(var_d0ada253, "", #"hash_6be0e1c766505418", var_be6642de[1]);
		entity function_78233d29(var_d0ada253, "", #"hash_6be0e6c766505c97", var_be6642de[2]);
		entity function_78233d29(var_d0ada253, "", #"hash_53eaa05730d4cddf", 1);
	}
	if(isdefined(var_b76d5d98))
	{
		entity function_78233d29(var_d0ada253, "", #"hash_15e64a875216af23", var_b76d5d98[0]);
		entity function_78233d29(var_d0ada253, "", #"hash_15e63d875216990c", var_b76d5d98[1]);
		entity function_78233d29(var_d0ada253, "", #"hash_15e63a87521693f3", var_b76d5d98[2]);
		entity function_78233d29(var_d0ada253, "", #"hash_6ecae9ba3282976b", 1);
	}
	entity function_78233d29(var_d0ada253, "", #"alpha", 1);
}

