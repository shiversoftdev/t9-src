#using scripts\core_common\util_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\flag_shared.csc;

#namespace codcaster;

/*
	Name: function_154d9633
	Namespace: codcaster
	Checksum: 0x6E50B392
	Offset: 0x1D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_154d9633()
{
	level notify(-1784295172);
}

/*
	Name: function_b8fe9b52
	Namespace: codcaster
	Checksum: 0x7B201EED
	Offset: 0x1F0
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
	Checksum: 0xC4AE7B84
	Offset: 0x220
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
	Checksum: 0xA12C9518
	Offset: 0x268
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
	Checksum: 0x5A3D84F5
	Offset: 0x2B0
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
	Checksum: 0x1FE959C3
	Offset: 0x2F8
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
	Checksum: 0x5A1962DD
	Offset: 0x340
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
	Checksum: 0xC7961100
	Offset: 0x390
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
	Checksum: 0x402F0724
	Offset: 0x418
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
	Checksum: 0xE7812C27
	Offset: 0x4F8
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
	Checksum: 0x29EDE6D1
	Offset: 0x598
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
	Checksum: 0x4A32020A
	Offset: 0x668
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
	Checksum: 0x37BB839E
	Offset: 0x6E0
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
	Checksum: 0xAF1F8BE9
	Offset: 0x700
	Size: 0x3F0
	Parameters: 1
	Flags: Linked, Private
*/
function private codcaster_monitor_xray_change(localclientnum)
{
	level notify("codcaster_monitor_xray_change" + localclientnum);
	level endon("codcaster_monitor_xray_change" + localclientnum);
	level.var_6a64742e = 1;
	localplayer = function_5c10bd79(localclientnum);
	lastteam = localplayer.team;
	var_f4e066d = 0;
	var_fb32b8ee = 0;
	var_adcf5c30 = 0;
	var_9c1f6f = 0;
	var_894a233a = 0;
	var_f0868cc0 = 0;
	var_22aac170 = 0;
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
		var_86a34b38 = function_b3cde530(localclientnum, localplayer getentitynumber());
		needupdate = team != lastteam || var_52fe6881 != var_f4e066d || var_6f36c5bc != var_fb32b8ee || var_349e9a55 != var_adcf5c30 || var_2db6105b != var_894a233a || var_50b78b20 != var_9c1f6f || var_920aadd7 != var_f0868cc0 || var_86a34b38 != var_22aac170;
		if(needupdate || level.var_6a64742e)
		{
			level.var_6a64742e = 0;
			lastteam = team;
			var_f4e066d = var_52fe6881;
			var_fb32b8ee = var_6f36c5bc;
			var_adcf5c30 = var_349e9a55;
			var_894a233a = var_2db6105b;
			var_9c1f6f = var_50b78b20;
			var_f0868cc0 = var_920aadd7;
			var_22aac170 = var_86a34b38;
			self function_1cc61419(localclientnum, [2:var_349e9a55, 1:var_6f36c5bc, 0:var_52fe6881]);
		}
	}
}

/*
	Name: function_1cc61419
	Namespace: codcaster
	Checksum: 0x61433ADF
	Offset: 0xAF8
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
		robkey = array[1];
		rob = array[2];
		team = array[3];
		entity function_89106df8(localclientnum, robkey, rob, team, settings);
	}
}

/*
	Name: function_471909d9
	Namespace: codcaster
	Checksum: 0xEDE06D7F
	Offset: 0x10E0
	Size: 0x2C0
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
		if(var_8ee5246c == entity && !function_c955fbd1(localclientnum) && !function_b3cde530(localclientnum, entity getentitynumber()))
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
	Checksum: 0x8082479B
	Offset: 0x13A8
	Size: 0x244
	Parameters: 5
	Flags: Linked
*/
function function_89106df8(localclientnum, robkey, rob, var_4724c867, settings)
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
	self renderoverridebundle::function_c8d97b8e(localclientnum, #"hash_7e51b929877df918", robkey);
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
	Checksum: 0xEC44236A
	Offset: 0x15F8
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
	Checksum: 0x628ED5C5
	Offset: 0x1658
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
	Checksum: 0xD08F5089
	Offset: 0x16E0
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
	var_1762ffa playrenderoverridebundle(rob);
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
	Checksum: 0xB8127EF
	Offset: 0x1968
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_425a51a2(var_5854d8e)
{
	if(var_5854d8e function_d2503806(var_5854d8e.rob))
	{
		var_5854d8e stoprenderoverridebundle(var_5854d8e.rob);
	}
	var_5854d8e delete();
}

/*
	Name: function_35248a94
	Namespace: codcaster
	Checksum: 0x3666CF85
	Offset: 0x19D8
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
	Checksum: 0x5F415D2F
	Offset: 0x1A50
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
	Checksum: 0xD3605BE1
	Offset: 0x1EC0
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

