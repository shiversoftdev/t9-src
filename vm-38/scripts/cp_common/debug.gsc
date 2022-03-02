#using script_5dfa1afaab9c1935;
#using script_5f2ba47ebe695e43;
#using script_6809bf766eba194a;
#using scripts\core_common\ai_puppeteer_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\colors_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\debug_menu.gsc;
#using scripts\cp_common\util.gsc;

#namespace debug;

/*
	Name: function_e534247d
	Namespace: debug
	Checksum: 0xBACBBFCD
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e534247d()
{
	level notify(1563474109);
}

/*
	Name: function_89f2df9
	Namespace: debug
	Checksum: 0xF638F740
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	/#
		system::register(#"debug_script", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: debug
	Checksum: 0xDFD613DC
	Offset: 0x138
	Size: 0xA4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		level.animsound_hudlimit = 14;
		level.debugteamcolors = [];
		level.debugteamcolors[#"axis"] = (1, 0, 0);
		level.debugteamcolors[#"allies"] = (0, 1, 0);
		level.debugteamcolors[#"team3"] = (1, 1, 0);
		level.debugteamcolors[#"neutral"] = (1, 1, 1);
		thread debugdvars();
		thread engagement_distance_debug_toggle();
	#/
}

/*
	Name: drawenttag
	Namespace: debug
	Checksum: 0x6C65ECFB
	Offset: 0x1E8
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function drawenttag(num)
{
	/#
		ai = getaiarray();
		for(i = 0; i < ai.size; i++)
		{
			if(ai[i] getentnum() != num)
			{
				continue;
			}
			ai[i] thread dragtaguntildeath(getdvarstring(#"debug_tag"));
		}
		/#
			setdvar(#"debug_enttag", "");
		#/
	#/
}

/*
	Name: drawtag
	Namespace: debug
	Checksum: 0xDE33971
	Offset: 0x2D0
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function drawtag(tag, opcolor)
{
	/#
		org = self gettagorigin(tag);
		ang = self gettagangles(tag);
		drawarrow(org, ang, opcolor);
	#/
}

/*
	Name: draworgforever
	Namespace: debug
	Checksum: 0x5F335D46
	Offset: 0x348
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function draworgforever(opcolor)
{
	/#
		for(;;)
		{
			drawarrow(self.origin, self.angles, opcolor);
			waitframe(1);
		}
	#/
}

/*
	Name: drawarrowforever
	Namespace: debug
	Checksum: 0xA9408F47
	Offset: 0x390
	Size: 0x3E
	Parameters: 2
	Flags: None
*/
function drawarrowforever(org, ang)
{
	/#
		for(;;)
		{
			drawarrow(org, ang);
			waitframe(1);
		}
	#/
}

/*
	Name: draworiginforever
	Namespace: debug
	Checksum: 0x427B3423
	Offset: 0x3D8
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function draworiginforever()
{
	/#
		for(;;)
		{
			drawarrow(self.origin, self.angles);
			waitframe(1);
		}
	#/
}

/*
	Name: drawarrow
	Namespace: debug
	Checksum: 0xA1B507B9
	Offset: 0x418
	Size: 0x2DC
	Parameters: 6
	Flags: None
*/
function drawarrow(org, ang, opcolor, var_40dcdbad, var_6e4eeae5, var_5f9d71c2)
{
	/#
		if(!isdefined(var_40dcdbad))
		{
			var_40dcdbad = 1;
		}
		if(!isdefined(var_6e4eeae5))
		{
			var_6e4eeae5 = 50;
		}
		if(!isdefined(var_5f9d71c2))
		{
			var_5f9d71c2 = 1;
		}
		forward = anglestoforward(ang);
		forwardfar = vectorscale(forward, var_6e4eeae5);
		forwardclose = vectorscale(forward, var_6e4eeae5 * 0.8);
		right = anglestoright(ang);
		leftdraw = vectorscale(right, var_6e4eeae5 * -0.2);
		rightdraw = vectorscale(right, var_6e4eeae5 * 0.2);
		up = anglestoup(ang);
		right = vectorscale(right, var_6e4eeae5);
		up = vectorscale(up, var_6e4eeae5);
		red = (0.9, 0.2, 0.2);
		green = (0.2, 0.9, 0.2);
		blue = (0.2, 0.2, 0.9);
		if(isdefined(opcolor))
		{
			red = opcolor;
			green = opcolor;
			blue = opcolor;
		}
		if(is_true(var_40dcdbad))
		{
			line(org, org + forwardfar, red, 0.9);
		}
		line(org + forwardfar, (org + forwardclose) + rightdraw, red, 0.9);
		line(org + forwardfar, (org + forwardclose) + leftdraw, red, 0.9);
		if(is_true(var_5f9d71c2))
		{
			line(org, org + right, blue, 0.9);
			line(org, org + up, green, 0.9);
		}
	#/
}

/*
	Name: drawplayerviewforever
	Namespace: debug
	Checksum: 0xC85885DD
	Offset: 0x700
	Size: 0x56
	Parameters: 0
	Flags: None
*/
function drawplayerviewforever()
{
	/#
		for(;;)
		{
			drawarrow(level.player.origin, level.player getplayerangles(), (1, 1, 1));
			waitframe(1);
		}
	#/
}

/*
	Name: drawtagforever
	Namespace: debug
	Checksum: 0xE76F7353
	Offset: 0x760
	Size: 0x4E
	Parameters: 2
	Flags: None
*/
function drawtagforever(tag, opcolor)
{
	/#
		self endon(#"death");
		for(;;)
		{
			drawtag(tag, opcolor);
			waitframe(1);
		}
	#/
}

/*
	Name: dragtaguntildeath
	Namespace: debug
	Checksum: 0x12622944
	Offset: 0x7B8
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function dragtaguntildeath(tag)
{
	/#
		for(;;)
		{
			if(!isdefined(self.origin))
			{
				break;
			}
			drawtag(tag);
			waitframe(1);
		}
	#/
}

/*
	Name: viewtag
	Namespace: debug
	Checksum: 0xEC0281FA
	Offset: 0x800
	Size: 0xEC
	Parameters: 2
	Flags: None
*/
function viewtag(type, tag)
{
	/#
		if(type == "")
		{
			ai = getaiarray();
			for(i = 0; i < ai.size; i++)
			{
				ai[i] drawtag(tag);
			}
		}
		else
		{
			vehicle = getentarray("", "");
			for(i = 0; i < vehicle.size; i++)
			{
				vehicle[i] drawtag(tag);
			}
		}
	#/
}

/*
	Name: removeactivespawner
	Namespace: debug
	Checksum: 0x5F9AEF20
	Offset: 0x8F8
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function removeactivespawner(spawner)
{
	/#
		newspawners = [];
		for(p = 0; p < level.activenodes.size; p++)
		{
			if(level.activenodes[p] == spawner)
			{
				continue;
			}
			newspawners[newspawners.size] = level.activenodes[p];
		}
		level.activenodes = newspawners;
	#/
}

/*
	Name: createline
	Namespace: debug
	Checksum: 0x9A0652EA
	Offset: 0x990
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function createline(org)
{
	/#
		for(;;)
		{
			line(org + vectorscale((0, 0, 1), 35), org, (0.2, 0.5, 0.8), 0.5);
			waitframe(1);
		}
	#/
}

/*
	Name: createlineconstantly
	Namespace: debug
	Checksum: 0xF480D9A5
	Offset: 0x9F8
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function createlineconstantly(ent)
{
	/#
		org = undefined;
		while(isalive(ent))
		{
			org = ent.origin;
			waitframe(1);
		}
		for(;;)
		{
			line(org + vectorscale((0, 0, 1), 35), org, (1, 0.2, 0.1), 0.5);
			waitframe(1);
		}
	#/
}

/*
	Name: debugmisstime
	Namespace: debug
	Checksum: 0x736D7160
	Offset: 0xAA0
	Size: 0x126
	Parameters: 0
	Flags: None
*/
function debugmisstime()
{
	/#
		self notify(#"stopdebugmisstime");
		self endon(#"stopdebugmisstime", #"death");
		for(;;)
		{
			if(self.a.misstime <= 0)
			{
				print3d(self gettagorigin("") + vectorscale((0, 0, 1), 15), "", (0.3, 1, 1), 1);
			}
			else
			{
				print3d(self gettagorigin("") + vectorscale((0, 0, 1), 15), self.a.misstime / 20, (0.3, 1, 1), 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: debugmisstimeoff
	Namespace: debug
	Checksum: 0x9B901963
	Offset: 0xBD0
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function debugmisstimeoff()
{
	/#
		self notify(#"stopdebugmisstime");
	#/
}

/*
	Name: setemptydvar
	Namespace: debug
	Checksum: 0x6F67913B
	Offset: 0xBF8
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function setemptydvar(dvar, setting)
{
	/#
		/#
			if(getdvarstring(dvar) == "")
			{
				setdvar(dvar, setting);
			}
		#/
	#/
}

/*
	Name: debugjump
	Namespace: debug
	Checksum: 0x99F65B26
	Offset: 0xC60
	Size: 0xD6
	Parameters: 1
	Flags: None
*/
function debugjump(num)
{
	/#
		ai = getaiarray();
		for(i = 0; i < ai.size; i++)
		{
			if(ai[i] getentnum() != num)
			{
				continue;
			}
			players = getplayers();
			line(players[0].origin, ai[i].origin, (0.2, 0.3, 1));
			return;
		}
	#/
}

/*
	Name: debugdvars
	Namespace: debug
	Checksum: 0x1E341FE5
	Offset: 0xD40
	Size: 0x153E
	Parameters: 0
	Flags: None
*/
function debugdvars()
{
	/#
		if(getdvarstring(#"level_transition_test") == "")
		{
			setdvar(#"level_transition_test", "");
		}
		if(getdvarstring(#"level_completeall") == "")
		{
			setdvar(#"level_completeall", "");
		}
		if(getdvarstring(#"level_clear_all") == "")
		{
			setdvar(#"level_clear_all", "");
		}
		setemptydvar("", "");
		if(getdvarstring(#"debug_lookangle") == "")
		{
			setdvar(#"debug_lookangle", "");
		}
		if(getdvarstring(#"debug_grenademiss") == "")
		{
			setdvar(#"debug_grenademiss", "");
		}
		if(getdvarstring(#"debug_dotshow") == "")
		{
			setdvar(#"debug_dotshow", "");
		}
		if(getdvarstring(#"debug_replayenemypos") == "")
		{
			setdvar(#"debug_replayenemypos", "");
		}
		if(getdvarstring(#"debug_tag") == "")
		{
			setdvar(#"debug_tag", "");
		}
		if(getdvarstring(#"debug_chatlook") == "")
		{
			setdvar(#"debug_chatlook", "");
		}
		if(getdvarstring(#"debug_vehicletag") == "")
		{
			setdvar(#"debug_vehicletag", "");
		}
		if(getdvarstring(#"debug_goalradius") == "")
		{
			setdvar(#"debug_goalradius", "");
		}
		if(getdvarstring(#"hash_400262ff40d7af83") == "")
		{
			setdvar(#"hash_400262ff40d7af83", "");
		}
		if(getdvarstring(#"debug_health") == "")
		{
			setdvar(#"debug_health", "");
		}
		if(getdvarstring(#"debug_engagedist") == "")
		{
			setdvar(#"debug_engagedist", "");
		}
		if(getdvarstring(#"debug_animreach") == "")
		{
			setdvar(#"debug_animreach", "");
		}
		if(getdvarstring(#"debug_hatmodel") == "")
		{
			setdvar(#"debug_hatmodel", "");
		}
		if(getdvarstring(#"hash_15af95544805e487") == "")
		{
			setdvar(#"hash_15af95544805e487", "");
		}
		level.debug_badpath = 0;
		if(getdvarstring(#"debug_badpath") == "")
		{
			setdvar(#"debug_badpath", "");
		}
		if(getdvarstring(#"anim_lastsightpos") == "")
		{
			setdvar(#"debug_lastsightpos", "");
		}
		if(getdvarstring(#"debug_dog_sound") == "")
		{
			setdvar(#"debug_dog_sound", "");
		}
		if(getdvarstring(#"debug_nuke") == "")
		{
			setdvar(#"debug_nuke", "");
		}
		if(getdvarstring(#"debug_deathents") == "")
		{
			setdvar(#"debug_deathents", "");
		}
		if(getdvarstring(#"debug_jump") == "")
		{
			setdvar(#"debug_jump", "");
		}
		if(getdvarstring(#"debug_hurt") == "")
		{
			setdvar(#"debug_hurt", "");
		}
		if(getdvarstring(#"animsound") == "")
		{
			setdvar(#"animsound", "");
		}
		if(getdvarstring(#"tag") == "")
		{
			setdvar(#"tag", "");
		}
		for(i = 1; i <= level.animsound_hudlimit; i++)
		{
			if((getdvarstring("" + i)) == "")
			{
				setdvar("" + i, "");
			}
		}
		if(getdvarstring(#"animsound_save") == "")
		{
			setdvar(#"animsound_save", "");
		}
		if(getdvarstring(#"debug_depth") == "")
		{
			setdvar(#"debug_depth", "");
		}
		if(getdvarstring(#"debug_ik") == "")
		{
			setdvar(#"debug_ik", 0);
			setdvar(#"debug_head_ik", 0);
			setdvar(#"debug_leg_ik", 0);
		}
		if(getdvarstring(#"debug_dynamic_ai_spawning") == "")
		{
			setdvar(#"debug_dynamic_ai_spawning", 0);
		}
		level.last_threat_debug = -23430;
		if(getdvarstring(#"debug_threat") == "")
		{
			setdvar(#"debug_threat", "");
		}
		waittillframeend();
		if(getdvarstring(#"debug_character_count") == "")
		{
			setdvar(#"debug_character_count", "");
		}
		noanimscripts = getdvarstring(#"debug_noanimscripts") == "";
		for(;;)
		{
			if(getdvarint(#"hash_328d096ed229649d", 0) == 1)
			{
				level thread function_f48a99b9();
			}
			if(getdvarstring(#"debug_tag") != "")
			{
				thread viewtag("", getdvarstring(#"debug_tag"));
				if(getdvarint(#"debug_enttag", 0) > 0)
				{
					thread drawenttag(getdvarint(#"debug_enttag", 0));
				}
			}
			if(getdvarstring(#"debug_goalradius") == "")
			{
				level thread debug_goalradius();
			}
			if(getdvarstring(#"hash_400262ff40d7af83") == "")
			{
				level thread function_3a215729();
			}
			if(getdvarstring(#"debug_health") == "")
			{
				level thread debug_health();
			}
			if(getdvarstring(#"debug_engagedist") == "")
			{
				level thread debug_engagedist();
			}
			if(getdvarstring(#"debug_vehicletag") != "")
			{
				thread viewtag("", getdvarstring(#"debug_vehicletag"));
			}
			thread debug_animsound();
			if(getdvarstring(#"tag") != "")
			{
				thread debug_animsoundtagselected();
			}
			for(i = 1; i <= level.animsound_hudlimit; i++)
			{
				if((getdvarstring("" + i)) != "")
				{
					thread debug_animsoundtag(i);
				}
			}
			if(getdvarstring(#"animsound_save") != "")
			{
				thread debug_animsoundsave();
			}
			if(getdvarstring(#"debug_nuke") != "")
			{
				thread debug_nuke();
			}
			if(getdvarstring(#"debug_misstime") == "")
			{
				setdvar(#"debug_misstime", "");
				array::thread_all(getaiarray(), &debugmisstime);
			}
			else if(getdvarstring(#"debug_misstime") == "")
			{
				setdvar(#"debug_misstime", "");
				array::thread_all(getaiarray(), &debugmisstimeoff);
			}
			if(getdvarstring(#"debug_deathents") == "")
			{
				thread deathspawnerpreview();
			}
			if(getdvarstring(#"debug_hurt") == "")
			{
				setdvar(#"debug_hurt", "");
				players = getplayers();
				for(i = 0; i < players.size; i++)
				{
					players[i] dodamage(50, (324234, 3423423, 2323));
				}
			}
			if(getdvarstring(#"debug_hurt") == "")
			{
				setdvar(#"debug_hurt", "");
				players = getplayers();
				for(i = 0; i < players.size; i++)
				{
					players[i] dodamage(50, (324234, 3423423, 2323));
				}
			}
			if(getdvarstring(#"debug_depth") == "")
			{
				thread fogcheck();
			}
			if(getdvarstring(#"debug_threat") != "" && getdvarstring(#"debug_threat") != "")
			{
				debugthreat();
			}
			level.debug_badpath = getdvarstring(#"debug_badpath") == "";
			if(!noanimscripts && getdvarstring(#"debug_noanimscripts") == "")
			{
				noanimscripts = 1;
			}
			if(noanimscripts && getdvarstring(#"debug_noanimscripts") == "")
			{
				level.animation.defaultexception = &util::void;
				level.animation notify(#"hash_1c96242baab724dd");
				noanimscripts = 0;
			}
			if(getdvarint(#"debug_dynamic_ai_spawning", 0) == 1 && (!isdefined(level.spawn_anywhere_active) || level.spawn_anywhere_active == 0))
			{
				level.spawn_anywhere_active = 1;
				thread dynamic_ai_spawner();
			}
			else if(getdvarint(#"debug_dynamic_ai_spawning", 0) == 0 && isdefined(level.spawn_anywhere_active) && level.spawn_anywhere_active == 1)
			{
				level.spawn_anywhere_active = 0;
				level notify(#"hash_34e65f3c6ffc6a39");
			}
			debug_ik_on_actors();
			waitframe(1);
		}
	#/
}

/*
	Name: debug_ik_on_actors
	Namespace: debug
	Checksum: 0x37B78C31
	Offset: 0x2288
	Size: 0x190
	Parameters: 0
	Flags: None
*/
function debug_ik_on_actors()
{
	/#
		toggleon = getdvarint(#"debug_ik", 0);
		if(!toggleon)
		{
			return;
		}
		togglelegik = getdvarint(#"debug_leg_ik", 0);
		toggleheadik = getdvarint(#"debug_head_ik", 0);
		ais = getactorarray();
		foreach(ai in ais)
		{
			if(togglelegik)
			{
				ai.enableterrainik = 1;
			}
			else
			{
				ai.enableterrainik = 0;
			}
			if(toggleheadik)
			{
				ai lookatentity(level.players[0]);
				continue;
			}
			ai lookatentity();
		}
	#/
}

/*
	Name: showdebugtrace
	Namespace: debug
	Checksum: 0xA304BE47
	Offset: 0x2420
	Size: 0x168
	Parameters: 0
	Flags: None
*/
function showdebugtrace()
{
	/#
		startoverride = undefined;
		endoverride = undefined;
		startoverride = (15.1859, -12.2822, 4.071);
		endoverride = (947.2, -10918, 64.9514);
		/#
			assert(!isdefined(level.traceend));
		#/
		for(;;)
		{
			players = getplayers();
			waitframe(1);
			start = startoverride;
			end = endoverride;
			if(!isdefined(startoverride))
			{
				start = level.tracestart;
			}
			if(!isdefined(endoverride))
			{
				end = players[0] geteye();
			}
			trace = bullettrace(start, end, 0, undefined);
			line(start, trace[#"position"], (0.9, 0.5, 0.8), 0.5);
		}
	#/
}

/*
	Name: hatmodel
	Namespace: debug
	Checksum: 0x50A675A1
	Offset: 0x2590
	Size: 0x1AE
	Parameters: 0
	Flags: None
*/
function hatmodel()
{
	/#
		for(;;)
		{
			if(getdvarstring(#"debug_hatmodel") == "")
			{
				return;
			}
			nohat = [];
			ai = getaiarray();
			for(i = 0; i < ai.size; i++)
			{
				if(isdefined(ai[i].hatmodel))
				{
					continue;
				}
				alreadyknown = 0;
				for(p = 0; p < nohat.size; p++)
				{
					if(nohat[p] != ai[i].classname)
					{
						continue;
					}
					alreadyknown = 1;
					break;
				}
				if(!alreadyknown)
				{
					nohat[nohat.size] = ai[i].classname;
				}
			}
			if(nohat.size)
			{
				println("");
				println("");
				for(i = 0; i < nohat.size; i++)
				{
					println("", nohat[i]);
				}
				println("");
			}
			wait(15);
		}
	#/
}

/*
	Name: debug_nuke
	Namespace: debug
	Checksum: 0x10AAF7E6
	Offset: 0x2748
	Size: 0x2D4
	Parameters: 0
	Flags: None
*/
function debug_nuke()
{
	/#
		player = util::gethostplayer();
		dvar = getdvarstring(#"debug_nuke");
		if(dvar == "")
		{
			ai = getaiteamarray(util::get_enemy_team(player.team), #"team3");
			for(i = 0; i < ai.size; i++)
			{
				ignore = 0;
				classname = ai[i].classname;
				if(isdefined(classname) && (issubstr(classname, "") || issubstr(classname, "") || issubstr(classname, "")))
				{
					ignore = 1;
				}
				if(!ignore)
				{
					ai[i] dodamage(ai[i].health, (0, 0, 0), player);
				}
			}
		}
		else
		{
			if(dvar == "")
			{
				ai = getaiteamarray(util::get_enemy_team(player.team));
				for(i = 0; i < ai.size; i++)
				{
					ai[i] dodamage(ai[i].health, (0, 0, 0), player);
				}
			}
			else if(dvar == "")
			{
				ai = getaispeciesarray(util::get_enemy_team(player.team), "");
				for(i = 0; i < ai.size; i++)
				{
					ai[i] dodamage(ai[i].health, (0, 0, 0), player);
				}
			}
		}
		setdvar(#"debug_nuke", "");
	#/
}

/*
	Name: debug_misstime
	Namespace: debug
	Checksum: 0x820CCF8F
	Offset: 0x2A28
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function debug_misstime()
{
	/#
	#/
}

/*
	Name: freeplayer
	Namespace: debug
	Checksum: 0x91011A70
	Offset: 0x2A38
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function freeplayer()
{
	/#
		setdvar(#"cl_freemove", 0);
	#/
}

/*
	Name: deathspawnerpreview
	Namespace: debug
	Checksum: 0x7E2171A2
	Offset: 0x2A70
	Size: 0x13C
	Parameters: 0
	Flags: None
*/
function deathspawnerpreview()
{
	/#
		waittillframeend();
		for(i = 0; i < 50; i++)
		{
			if(!isdefined(level.deathspawnerents[i]))
			{
				continue;
			}
			array = level.deathspawnerents[i];
			for(p = 0; p < array.size; p++)
			{
				ent = array[p];
				if(isdefined(ent.truecount))
				{
					print3d(ent.origin, (i + "") + ent.truecount, (0, 0.8, 0.6), 5);
					continue;
				}
				print3d(ent.origin, (i + "") + "", (0, 0.8, 0.6), 5);
			}
		}
	#/
}

/*
	Name: getchains
	Namespace: debug
	Checksum: 0x7DE02C71
	Offset: 0x2BB8
	Size: 0x88
	Parameters: 0
	Flags: None
*/
function getchains()
{
	/#
		chainarray = [];
		chainarray = getentarray("", "");
		array = [];
		for(i = 0; i < chainarray.size; i++)
		{
			array[i] = chainarray[i] getchain();
		}
		return array;
	#/
}

/*
	Name: getchain
	Namespace: debug
	Checksum: 0xA03E8BD2
	Offset: 0x2C50
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function getchain()
{
	/#
		array = [];
		ent = self;
		while(isdefined(ent))
		{
			array[array.size] = ent;
			if(!isdefined(ent) || !isdefined(ent.target))
			{
				break;
			}
			ent = getent(ent.target, "");
			if(isdefined(ent) && ent == array[0])
			{
				array[array.size] = ent;
				break;
			}
		}
		originarray = [];
		for(i = 0; i < array.size; i++)
		{
			originarray[i] = array[i].origin;
		}
		return originarray;
	#/
}

/*
	Name: vecscale
	Namespace: debug
	Checksum: 0x642FD014
	Offset: 0x2D50
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function vecscale(vec, scalar)
{
	/#
		return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
	#/
}

/*
	Name: islookingatorigin
	Namespace: debug
	Checksum: 0x92B83D4A
	Offset: 0x2DA0
	Size: 0x10A
	Parameters: 1
	Flags: None
*/
function islookingatorigin(origin)
{
	/#
		normalvec = vectornormalize(origin - self getshootatpos());
		veccomp = vectornormalize((origin - vectorscale((0, 0, 1), 24)) - self getshootatpos());
		insidedot = vectordot(normalvec, veccomp);
		anglevec = anglestoforward(self getplayerangles());
		vectordot = vectordot(anglevec, normalvec);
		if(vectordot > insidedot)
		{
			return true;
		}
		return false;
	#/
}

/*
	Name: fogcheck
	Namespace: debug
	Checksum: 0x32AE73BF
	Offset: 0x2EB8
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function fogcheck()
{
	/#
		close = getdvarint(#"depth_close", 0);
		far = getdvarint(#"depth_far", 1500);
		setexpfog(close, far, 1, 1, 1, 0);
	#/
}

/*
	Name: debugthreat
	Namespace: debug
	Checksum: 0x7AD4DAEC
	Offset: 0x2F50
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function debugthreat()
{
	/#
		level.last_threat_debug = gettime();
		thread debugthreatcalc();
	#/
}

/*
	Name: debugthreatcalc
	Namespace: debug
	Checksum: 0xBF8380CD
	Offset: 0x2F80
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function debugthreatcalc()
{
	/#
		ai = getaiarray();
		entnum = getdvarstring(#"debug_threat");
		entity = undefined;
		players = getplayers();
		if(entnum == 0)
		{
			entity = players[0];
		}
		else
		{
			for(i = 0; i < ai.size; i++)
			{
				if(entnum != ai[i] getentnum())
				{
					continue;
				}
				entity = ai[i];
				break;
			}
		}
		if(!isalive(entity))
		{
			return;
		}
		entitygroup = entity getthreatbiasgroup();
		array::thread_all(ai, &displaythreat, entity, entitygroup);
		players[0] thread displaythreat(entity, entitygroup);
	#/
}

/*
	Name: displaythreat
	Namespace: debug
	Checksum: 0xD7D1C4B1
	Offset: 0x30E8
	Size: 0x37A
	Parameters: 2
	Flags: None
*/
function displaythreat(entity, entitygroup)
{
	/#
		self endon(#"death");
		if(self.team == entity.team)
		{
			return;
		}
		selfthreat = 0;
		selfthreat = selfthreat + self.threatbias;
		threat = 0;
		threat = threat + entity.threatbias;
		mygroup = undefined;
		if(isdefined(entitygroup))
		{
			mygroup = self getthreatbiasgroup();
			if(isdefined(mygroup))
			{
				threat = threat + getthreatbias(entitygroup, mygroup);
				selfthreat = selfthreat + getthreatbias(mygroup, entitygroup);
			}
		}
		if(entity.ignoreme || threat < 900000)
		{
			threat = "";
		}
		if(self.ignoreme || selfthreat < 900000)
		{
			selfthreat = "";
		}
		players = getplayers();
		col = (1, 0.5, 0.2);
		col2 = (0.2, 0.5, 1);
		pacifist = self != players[0] && self.pacifist;
		for(i = 0; i <= 20; i++)
		{
			print3d(self.origin + vectorscale((0, 0, 1), 65), "", col, 3);
			print3d(self.origin + vectorscale((0, 0, 1), 50), threat, col, 5);
			if(isdefined(entitygroup))
			{
				print3d(self.origin + vectorscale((0, 0, 1), 35), entitygroup, col, 2);
			}
			print3d(self.origin + vectorscale((0, 0, 1), 15), "", col2, 3);
			print3d(self.origin + (0, 0, 0), selfthreat, col2, 5);
			if(isdefined(mygroup))
			{
				print3d(self.origin + (vectorscale((0, 0, -1), 15)), mygroup, col2, 2);
			}
			if(pacifist)
			{
				print3d(self.origin + vectorscale((0, 0, 1), 25), "", col2, 5);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: init_animsounds
	Namespace: debug
	Checksum: 0x7A253BE2
	Offset: 0x3470
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function init_animsounds()
{
	/#
		level.animsounds = [];
		level.animsound_aliases = [];
		waittillframeend();
		waittillframeend();
		animnames = getarraykeys(level.scr_notetrack);
		for(i = 0; i < animnames.size; i++)
		{
			init_notetracks_for_animname(animnames[i]);
		}
		animnames = getarraykeys(level.scr_animsound);
		for(i = 0; i < animnames.size; i++)
		{
			init_animsounds_for_animname(animnames[i]);
		}
	#/
}

/*
	Name: init_notetracks_for_animname
	Namespace: debug
	Checksum: 0xA31202CE
	Offset: 0x3540
	Size: 0x156
	Parameters: 1
	Flags: None
*/
function init_notetracks_for_animname(animname)
{
	/#
		foreach(v in level.scr_notetrack[animname])
		{
			soundalias = v[#"sound"];
			if(!isdefined(soundalias))
			{
				continue;
			}
			anime = v[#"anime"];
			notetrack = v[#"notetrack"];
			level.animsound_aliases[animname][anime][notetrack][#"soundalias"] = soundalias;
			if(isdefined(v[#"created_by_animsound"]))
			{
				level.animsound_aliases[animname][anime][notetrack][#"created_by_animsound"] = 1;
			}
		}
	#/
}

/*
	Name: init_animsounds_for_animname
	Namespace: debug
	Checksum: 0x97B84A59
	Offset: 0x36A0
	Size: 0xFE
	Parameters: 1
	Flags: None
*/
function init_animsounds_for_animname(animname)
{
	/#
		animes = getarraykeys(level.scr_animsound[animname]);
		for(i = 0; i < animes.size; i++)
		{
			anime = animes[i];
			soundalias = level.scr_animsound[animname][anime];
			level.animsound_aliases[animname][anime]["" + anime][#"soundalias"] = soundalias;
			level.animsound_aliases[animname][anime]["" + anime][#"created_by_animsound"] = 1;
		}
	#/
}

/*
	Name: add_hud_line
	Namespace: debug
	Checksum: 0x3256372
	Offset: 0x37A8
	Size: 0xB8
	Parameters: 3
	Flags: None
*/
function add_hud_line(x, y, msg)
{
	/#
		hudelm = newdebughudelem();
		hudelm.alignx = "";
		hudelm.aligny = "";
		hudelm.x = x;
		hudelm.y = y;
		hudelm.alpha = 1;
		hudelm.fontscale = 1;
		hudelm.label = msg;
		level.animsound_hud_extralines[level.animsound_hud_extralines.size] = hudelm;
		return hudelm;
	#/
}

/*
	Name: debug_animsound
	Namespace: debug
	Checksum: 0xD3E20562
	Offset: 0x3870
	Size: 0x8B4
	Parameters: 0
	Flags: None
*/
function debug_animsound()
{
	/#
		enabled = getdvarstring(#"animsound") == "";
		if(!isdefined(level.animsound_hud))
		{
			if(!enabled)
			{
				return;
			}
			level.animsound_selected = 0;
			level.animsound_input = "";
			level.animsound_hud = [];
			level.animsound_hud_timer = [];
			level.animsound_hud_alias = [];
			level.animsound_hud_extralines = [];
			level.animsound_locked = 0;
			level.animsound_locked_pressed = 0;
			level.animsound_hud_animname = add_hud_line(-30, 180, "");
			level.animsound_hud_anime = add_hud_line(100, 180, "");
			add_hud_line(10, 190, "");
			add_hud_line(-30, 190, "");
			add_hud_line(-30, 160, "");
			add_hud_line(-30, 150, "");
			add_hud_line(-30, 140, "");
			level.animsound_hud_locked = add_hud_line(-30, 170, "");
			level.animsound_hud_locked.alpha = 0;
			for(i = 0; i < level.animsound_hudlimit; i++)
			{
				hudelm = newdebughudelem();
				hudelm.alignx = "";
				hudelm.aligny = "";
				hudelm.x = 10;
				hudelm.y = 200 + (i * 10);
				hudelm.alpha = 1;
				hudelm.fontscale = 1;
				hudelm.label = "";
				level.animsound_hud[level.animsound_hud.size] = hudelm;
				hudelm = newdebughudelem();
				hudelm.alignx = "";
				hudelm.aligny = "";
				hudelm.x = -10;
				hudelm.y = 200 + (i * 10);
				hudelm.alpha = 1;
				hudelm.fontscale = 1;
				hudelm.label = "";
				level.animsound_hud_timer[level.animsound_hud_timer.size] = hudelm;
				hudelm = newdebughudelem();
				hudelm.alignx = "";
				hudelm.aligny = "";
				hudelm.x = 210;
				hudelm.y = 200 + (i * 10);
				hudelm.alpha = 1;
				hudelm.fontscale = 1;
				hudelm.label = "";
				level.animsound_hud_alias[level.animsound_hud_alias.size] = hudelm;
			}
			level.animsound_hud[0].color = (1, 1, 0);
			level.animsound_hud_timer[0].color = (1, 1, 0);
		}
		else if(!enabled)
		{
			for(i = 0; i < level.animsound_hudlimit; i++)
			{
				level.animsound_hud[i] destroy();
				level.animsound_hud_timer[i] destroy();
				level.animsound_hud_alias[i] destroy();
			}
			for(i = 0; i < level.animsound_hud_extralines.size; i++)
			{
				level.animsound_hud_extralines[i] destroy();
			}
			level.animsound_hud = undefined;
			level.animsound_hud_timer = undefined;
			level.animsound_hud_alias = undefined;
			level.animsound_hud_extralines = undefined;
			level.animsounds = undefined;
			return;
		}
		if(!isdefined(level.animsound_tagged))
		{
			level.animsound_locked = 0;
		}
		if(level.animsound_locked)
		{
			level.animsound_hud_locked.alpha = 1;
		}
		else
		{
			level.animsound_hud_locked.alpha = 0;
		}
		if(!isdefined(level.animsounds))
		{
			init_animsounds();
		}
		level.animsounds_thisframe = [];
		arrayremovevalue(level.animsounds, undefined);
		array::thread_all(level.animsounds, &display_animsound);
		players = getplayers();
		if(level.animsound_locked)
		{
			for(i = 0; i < level.animsounds_thisframe.size; i++)
			{
				animsound = level.animsounds_thisframe[i];
				animsound.animsound_color = vectorscale((1, 1, 1), 0.5);
			}
		}
		else if(players.size > 0)
		{
			dot = 0.85;
			forward = anglestoforward(players[0] getplayerangles());
			for(i = 0; i < level.animsounds_thisframe.size; i++)
			{
				animsound = level.animsounds_thisframe[i];
				animsound.animsound_color = (0.25, 1, 0.5);
				difference = vectornormalize((animsound.origin + vectorscale((0, 0, 1), 40)) - (players[0].origin + vectorscale((0, 0, 1), 55)));
				newdot = vectordot(forward, difference);
				if(newdot < dot)
				{
					continue;
				}
				dot = newdot;
				level.animsound_tagged = animsound;
			}
		}
		if(isdefined(level.animsound_tagged))
		{
			level.animsound_tagged.animsound_color = (1, 1, 0);
		}
		is_tagged = isdefined(level.animsound_tagged);
		for(i = 0; i < level.animsounds_thisframe.size; i++)
		{
			animsound = level.animsounds_thisframe[i];
			msg = "";
			if(level.animsound_locked)
			{
				msg = "";
			}
			print3d(animsound.origin + vectorscale((0, 0, 1), 40), msg + animsound.animsounds.size, animsound.animsound_color, 1, 1);
		}
		if(is_tagged)
		{
			draw_animsounds_in_hud();
		}
	#/
}

/*
	Name: draw_animsounds_in_hud
	Namespace: debug
	Checksum: 0x2C944A76
	Offset: 0x4130
	Size: 0x62C
	Parameters: 0
	Flags: None
*/
function draw_animsounds_in_hud()
{
	/#
		guy = level.animsound_tagged;
		animsounds = guy.animsounds;
		animname = "";
		if(isdefined(guy.animname))
		{
			animname = guy.animname;
		}
		level.animsound_hud_animname.label = "" + animname;
		players = getplayers();
		if(players[0] buttonpressed(""))
		{
			if(!level.animsound_locked_pressed)
			{
				level.animsound_locked = !level.animsound_locked;
				level.animsound_locked_pressed = 1;
			}
		}
		else
		{
			level.animsound_locked_pressed = 0;
		}
		if(players[0] buttonpressed(""))
		{
			if(level.animsound_input != "")
			{
				level.animsound_selected--;
			}
			level.animsound_input = "";
		}
		else
		{
			if(players[0] buttonpressed(""))
			{
				if(level.animsound_input != "")
				{
					level.animsound_selected++;
				}
				level.animsound_input = "";
			}
			else
			{
				level.animsound_input = "";
			}
		}
		for(i = 0; i < level.animsound_hudlimit; i++)
		{
			hudelm = level.animsound_hud[i];
			hudelm.label = "";
			hudelm.color = (1, 1, 1);
			hudelm = level.animsound_hud_timer[i];
			hudelm.label = "";
			hudelm.color = (1, 1, 1);
			hudelm = level.animsound_hud_alias[i];
			hudelm.label = "";
			hudelm.color = (1, 1, 1);
		}
		keys = getarraykeys(animsounds);
		highest = -1;
		for(i = 0; i < keys.size; i++)
		{
			if(keys[i] > highest)
			{
				highest = keys[i];
			}
		}
		if(highest == -1)
		{
			return;
		}
		if(level.animsound_selected > highest)
		{
			level.animsound_selected = highest;
		}
		if(level.animsound_selected < 0)
		{
			level.animsound_selected = 0;
		}
		for(;;)
		{
			if(isdefined(animsounds[level.animsound_selected]))
			{
				break;
			}
			level.animsound_selected--;
			if(level.animsound_selected < 0)
			{
				level.animsound_selected = highest;
			}
		}
		level.animsound_hud_anime.label = "" + animsounds[level.animsound_selected].anime;
		level.animsound_hud[level.animsound_selected].color = (1, 1, 0);
		level.animsound_hud_timer[level.animsound_selected].color = (1, 1, 0);
		level.animsound_hud_alias[level.animsound_selected].color = (1, 1, 0);
		time = gettime();
		for(i = 0; i < keys.size; i++)
		{
			key = keys[i];
			animsound = animsounds[key];
			hudelm = level.animsound_hud[key];
			soundalias = get_alias_from_stored(animsound);
			hudelm.label = ((key + 1) + "") + animsound.notetrack;
			hudelm = level.animsound_hud_timer[key];
			hudelm.label = int((time - (animsound.end_time - 60000)) * 0.001);
			if(isdefined(soundalias))
			{
				hudelm = level.animsound_hud_alias[key];
				hudelm.label = soundalias;
				if(!is_from_animsound(animsound.animname, animsound.anime, animsound.notetrack))
				{
					hudelm.color = vectorscale((1, 1, 1), 0.7);
				}
			}
		}
		players = getplayers();
		if(players[0] buttonpressed(""))
		{
			animsound = animsounds[level.animsound_selected];
			soundalias = get_alias_from_stored(animsound);
			if(!isdefined(soundalias))
			{
				return;
			}
			if(!is_from_animsound(animsound.animname, animsound.anime, animsound.notetrack))
			{
				return;
			}
			level.animsound_aliases[animsound.animname][animsound.anime][animsound.notetrack] = undefined;
			debug_animsoundsave();
		}
	#/
}

/*
	Name: get_alias_from_stored
	Namespace: debug
	Checksum: 0x1ECEC534
	Offset: 0x4768
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function get_alias_from_stored(animsound)
{
	/#
		if(!isdefined(level.animsound_aliases[animsound.animname]))
		{
			return;
		}
		if(!isdefined(level.animsound_aliases[animsound.animname][animsound.anime]))
		{
			return;
		}
		if(!isdefined(level.animsound_aliases[animsound.animname][animsound.anime][animsound.notetrack]))
		{
			return;
		}
		return level.animsound_aliases[animsound.animname][animsound.anime][animsound.notetrack][#"soundalias"];
	#/
}

/*
	Name: is_from_animsound
	Namespace: debug
	Checksum: 0x6517E1E3
	Offset: 0x4828
	Size: 0x44
	Parameters: 3
	Flags: None
*/
function is_from_animsound(animname, anime, notetrack)
{
	/#
		return isdefined(level.animsound_aliases[animname][anime][notetrack][#"created_by_animsound"]);
	#/
}

/*
	Name: display_animsound
	Namespace: debug
	Checksum: 0x4BD0D348
	Offset: 0x4878
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function display_animsound()
{
	/#
		players = getplayers();
		if(distance(players[0].origin, self.origin) > 1500)
		{
			return;
		}
		level.animsounds_thisframe[level.animsounds_thisframe.size] = self;
	#/
}

/*
	Name: debug_animsoundtag
	Namespace: debug
	Checksum: 0x3A7C762E
	Offset: 0x48F0
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function debug_animsoundtag(tagnum)
{
	/#
		tag = getdvarstring("" + tagnum);
		if(tag == "")
		{
			iprintlnbold("");
			return;
		}
		tag_sound(tag, tagnum - 1);
		setdvar(#"tag" + tagnum, "");
	#/
}

/*
	Name: debug_animsoundtagselected
	Namespace: debug
	Checksum: 0xECBE2F3C
	Offset: 0x49B8
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function debug_animsoundtagselected()
{
	/#
		tag = getdvarstring(#"tag");
		if(tag == "")
		{
			iprintlnbold("");
			return;
		}
		tag_sound(tag, level.animsound_selected);
		setdvar(#"tag", "");
	#/
}

/*
	Name: tag_sound
	Namespace: debug
	Checksum: 0xED123A82
	Offset: 0x4A70
	Size: 0x14C
	Parameters: 2
	Flags: None
*/
function tag_sound(tag, tagnum)
{
	/#
		if(!isdefined(level.animsound_tagged))
		{
			return;
		}
		if(!isdefined(level.animsound_tagged.animsounds[tagnum]))
		{
			return;
		}
		animsound = level.animsound_tagged.animsounds[tagnum];
		soundalias = get_alias_from_stored(animsound);
		if(!isdefined(soundalias) || is_from_animsound(animsound.animname, animsound.anime, animsound.notetrack))
		{
			level.animsound_aliases[animsound.animname][animsound.anime][animsound.notetrack][#"soundalias"] = tag;
			level.animsound_aliases[animsound.animname][animsound.anime][animsound.notetrack][#"created_by_animsound"] = 1;
			debug_animsoundsave();
		}
	#/
}

/*
	Name: debug_animsoundsave
	Namespace: debug
	Checksum: 0x180C421F
	Offset: 0x4BC8
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function debug_animsoundsave()
{
	/#
		filename = ("" + level.script) + "";
		file = openfile(filename, "");
		if(file == -1)
		{
			iprintlnbold(("" + filename) + "");
			return;
		}
		iprintlnbold("" + filename);
		print_aliases_to_file(file);
		saved = closefile(file);
		setdvar(#"animsound_save", "");
	#/
}

/*
	Name: print_aliases_to_file
	Namespace: debug
	Checksum: 0x4FEC750A
	Offset: 0x4CE0
	Size: 0x454
	Parameters: 1
	Flags: None
*/
function print_aliases_to_file(file)
{
	/#
		tab = "";
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, tab + "");
		fprintln(file, tab + "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, "");
		fprintln(file, tab + "");
		animnames = getarraykeys(level.animsound_aliases);
		for(i = 0; i < animnames.size; i++)
		{
			animes = getarraykeys(level.animsound_aliases[animnames[i]]);
			for(p = 0; p < animes.size; p++)
			{
				anime = animes[p];
				notetracks = getarraykeys(level.animsound_aliases[animnames[i]][anime]);
				for(z = 0; z < notetracks.size; z++)
				{
					notetrack = notetracks[z];
					if(!is_from_animsound(animnames[i], anime, notetrack))
					{
						continue;
					}
					alias = level.animsound_aliases[animnames[i]][anime][notetrack][#"soundalias"];
					if(notetrack == ("" + anime))
					{
						fprintln(file, (((tab + "") + tostr(animnames[i]) + "") + tostr(anime) + "") + tostr(alias) + "");
					}
					else
					{
						fprintln(file, ((((tab + "") + tostr(animnames[i]) + "") + tostr(anime) + "") + tostr(notetrack) + "") + tostr(alias) + "");
					}
					println((("" + alias) + "") + notetrack);
				}
			}
		}
		fprintln(file, "");
	#/
}

/*
	Name: function_f48a99b9
	Namespace: debug
	Checksum: 0x91C8F22F
	Offset: 0x5140
	Size: 0x2FC
	Parameters: 0
	Flags: None
*/
function function_f48a99b9()
{
	/#
		setdvar(#"hash_328d096ed229649d", 0);
		if(!isdefined(level.a_npcdeaths) || getdvarint(#"enablenpcdeathtracking", 0) != 1)
		{
			return;
		}
		players = getplayers();
		filename = ((("" + level.savename) + "") + players[0].playername) + "";
		/#
			file = openfile(filename, "");
			if(file == -1)
			{
				iprintlnbold(("" + filename) + "");
				return;
			}
			if(isdefined(level.current_skipto))
			{
				fprintln(file, ("" + level.current_skipto) + "");
			}
			else
			{
				fprintln(file, "");
			}
			if(level.a_npcdeaths.size <= 0)
			{
				fprintln(file, "");
			}
			foreach(deadnpctypecount in level.a_npcdeaths)
			{
				fprintln(file, (((((deadnpctypecount.strscoretype + "") + deadnpctypecount.icount) + "") + deadnpctypecount.ikilledbyplayercount) + "") + deadnpctypecount.ixpvaluesum);
			}
			fprintln(file, "");
			iprintlnbold("" + filename);
			saved = closefile(file);
		#/
		level.a_npcdeaths = [];
	#/
}

/*
	Name: tostr
	Namespace: debug
	Checksum: 0xC4BD0071
	Offset: 0x5448
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function tostr(str)
{
	/#
		newstr = "";
		for(i = 0; i < str.size; i++)
		{
			if(str[i] == "")
			{
				newstr = newstr + "";
				newstr = newstr + "";
				continue;
			}
			newstr = newstr + str[i];
		}
		newstr = newstr + "";
		return newstr;
	#/
}

/*
	Name: new_hud
	Namespace: debug
	Checksum: 0xBA229DB3
	Offset: 0x54F0
	Size: 0xC2
	Parameters: 5
	Flags: None
*/
function new_hud(hud_name, msg, x, y, scale)
{
	/#
		if(!isdefined(level.hud_array))
		{
			level.hud_array = [];
		}
		if(!isdefined(level.hud_array[hud_name]))
		{
			level.hud_array[hud_name] = [];
		}
		hud = debug_menu::set_hudelem(msg, x, y, scale);
		level.hud_array[hud_name][level.hud_array[hud_name].size] = hud;
		return hud;
	#/
}

/*
	Name: debug_show_viewpos
	Namespace: debug
	Checksum: 0xDC38CC91
	Offset: 0x55C0
	Size: 0x464
	Parameters: 0
	Flags: None
*/
function debug_show_viewpos()
{
	/#
		hud_title = newdebughudelem();
		hud_title.x = 10;
		hud_title.y = 300;
		hud_title.alpha = 0;
		hud_title.alignx = "";
		hud_title.fontscale = 1.2;
		hud_title settext(#"hash_59d12e465ccbab9a");
		x_pos = hud_title.x + 50;
		hud_x = newdebughudelem();
		hud_x.x = x_pos;
		hud_x.y = 300;
		hud_x.alpha = 0;
		hud_x.alignx = "";
		hud_x.fontscale = 1.2;
		hud_x setvalue(0);
		hud_y = newdebughudelem();
		hud_y.x = 10;
		hud_y.y = 300;
		hud_y.alpha = 0;
		hud_y.alignx = "";
		hud_y.fontscale = 1.2;
		hud_y setvalue(0);
		hud_z = newdebughudelem();
		hud_z.x = 10;
		hud_z.y = 300;
		hud_z.alpha = 0;
		hud_z.alignx = "";
		hud_z.fontscale = 1.2;
		hud_z setvalue(0);
		setdvar(#"debug_show_viewpos", 0);
		players = getplayers();
		while(true)
		{
			if(getdvarint(#"debug_show_viewpos", 0) > 0)
			{
				hud_title.alpha = 1;
				hud_x.alpha = 1;
				hud_y.alpha = 1;
				hud_z.alpha = 1;
				x = players[0].origin[0];
				y = players[0].origin[1];
				z = players[0].origin[2];
				spacing1 = ((2 + number_before_decimal(x)) * 8) + 10;
				spacing2 = ((2 + number_before_decimal(y)) * 8) + 10;
				hud_y.x = x_pos + spacing1;
				hud_z.x = (x_pos + spacing1) + spacing2;
				hud_x setvalue(round_to(x, 100));
				hud_y setvalue(round_to(y, 100));
				hud_z setvalue(round_to(z, 100));
			}
			else
			{
				hud_title.alpha = 0;
				hud_x.alpha = 0;
				hud_y.alpha = 0;
				hud_z.alpha = 0;
			}
			wait(0.5);
		}
	#/
}

/*
	Name: number_before_decimal
	Namespace: debug
	Checksum: 0xE0277241
	Offset: 0x5A30
	Size: 0x78
	Parameters: 1
	Flags: None
*/
function number_before_decimal(num)
{
	/#
		abs_num = abs(num);
		count = 0;
		while(true)
		{
			abs_num = abs_num * 0.1;
			count = count + 1;
			if(abs_num < 1)
			{
				return count;
			}
		}
	#/
}

/*
	Name: round_to
	Namespace: debug
	Checksum: 0x119E5348
	Offset: 0x5AB0
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function round_to(val, num)
{
	/#
		return (int(val * num)) / num;
	#/
}

/*
	Name: get_playerone
	Namespace: debug
	Checksum: 0xC4510E08
	Offset: 0x5AF8
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function get_playerone()
{
	/#
		return level.players[0];
	#/
}

/*
	Name: engagement_distance_debug_toggle
	Namespace: debug
	Checksum: 0xDFB2260
	Offset: 0x5B18
	Size: 0x14C
	Parameters: 0
	Flags: None
*/
function engagement_distance_debug_toggle()
{
	/#
		level endon(#"kill_engage_dist_debug_toggle_watcher");
		laststate = getdvarint(#"debug_engage_dists", 0);
		while(true)
		{
			currentstate = getdvarint(#"debug_engage_dists", 0);
			if(dvar_turned_on(currentstate) && !dvar_turned_on(laststate))
			{
				weapon_engage_dists_init();
				thread debug_realtime_engage_dist();
				thread debug_ai_engage_dist();
				laststate = currentstate;
			}
			else if(!dvar_turned_on(currentstate) && dvar_turned_on(laststate))
			{
				level notify(#"kill_all_engage_dist_debug");
				laststate = currentstate;
			}
			wait(0.3);
		}
	#/
}

/*
	Name: dvar_turned_on
	Namespace: debug
	Checksum: 0x51052030
	Offset: 0x5C70
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function dvar_turned_on(val)
{
	/#
		if(val <= 0)
		{
			return false;
		}
		return true;
	#/
}

/*
	Name: engagement_distance_debug_init
	Namespace: debug
	Checksum: 0x3885CC43
	Offset: 0x5CA8
	Size: 0x328
	Parameters: 1
	Flags: None
*/
function engagement_distance_debug_init(player)
{
	/#
		level.realtimeengagedist = newdebughudelem(player);
		level.realtimeengagedist.alignx = "";
		level.realtimeengagedist.fontscale = 1.5;
		level.realtimeengagedist.x = -50;
		level.realtimeengagedist.y = 250;
		level.realtimeengagedist.color = (1, 1, 1);
		level.realtimeengagedist settext("");
		xpos = 157;
		level.realtimeengagedist_value = newdebughudelem(player);
		level.realtimeengagedist_value.alignx = "";
		level.realtimeengagedist_value.fontscale = 1.5;
		level.realtimeengagedist_value.x = xpos;
		level.realtimeengagedist_value.y = 250;
		level.realtimeengagedist_value.color = (1, 1, 1);
		level.realtimeengagedist_value setvalue(0);
		xpos = xpos + 37;
		level.realtimeengagedist_middle = newdebughudelem(player);
		level.realtimeengagedist_middle.alignx = "";
		level.realtimeengagedist_middle.fontscale = 1.5;
		level.realtimeengagedist_middle.x = xpos;
		level.realtimeengagedist_middle.y = 250;
		level.realtimeengagedist_middle.color = (1, 1, 1);
		level.realtimeengagedist_middle settext("");
		xpos = xpos + 105;
		level.realtimeengagedist_offvalue = newdebughudelem(player);
		level.realtimeengagedist_offvalue.alignx = "";
		level.realtimeengagedist_offvalue.fontscale = 1.5;
		level.realtimeengagedist_offvalue.x = xpos;
		level.realtimeengagedist_offvalue.y = 250;
		level.realtimeengagedist_offvalue.color = (1, 1, 1);
		level.realtimeengagedist_offvalue setvalue(0);
		hudobjarray = [];
		hudobjarray[0] = level.realtimeengagedist;
		hudobjarray[1] = level.realtimeengagedist_value;
		hudobjarray[2] = level.realtimeengagedist_middle;
		hudobjarray[3] = level.realtimeengagedist_offvalue;
		return hudobjarray;
	#/
}

/*
	Name: engage_dist_debug_hud_destroy
	Namespace: debug
	Checksum: 0xE70B209F
	Offset: 0x5FE0
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function engage_dist_debug_hud_destroy(hudarray, killnotify)
{
	/#
		level waittill(killnotify);
		for(i = 0; i < hudarray.size; i++)
		{
			hudarray[i] destroy();
		}
	#/
}

/*
	Name: weapon_engage_dists_init
	Namespace: debug
	Checksum: 0xD31E35E9
	Offset: 0x6048
	Size: 0x284
	Parameters: 0
	Flags: None
*/
function weapon_engage_dists_init()
{
	/#
		level.engagedists = [];
		genericpistol = spawnstruct();
		genericpistol.engagedistmin = 125;
		genericpistol.engagedistoptimal = 400;
		genericpistol.engagedistmulligan = 100;
		genericpistol.engagedistmax = 600;
		shotty = spawnstruct();
		shotty.engagedistmin = 0;
		shotty.engagedistoptimal = 300;
		shotty.engagedistmulligan = 100;
		shotty.engagedistmax = 600;
		genericsmg = spawnstruct();
		genericsmg.engagedistmin = 100;
		genericsmg.engagedistoptimal = 500;
		genericsmg.engagedistmulligan = 150;
		genericsmg.engagedistmax = 1000;
		genericriflesa = spawnstruct();
		genericriflesa.engagedistmin = 325;
		genericriflesa.engagedistoptimal = 800;
		genericriflesa.engagedistmulligan = 300;
		genericriflesa.engagedistmax = 1600;
		generichmg = spawnstruct();
		generichmg.engagedistmin = 500;
		generichmg.engagedistoptimal = 700;
		generichmg.engagedistmulligan = 300;
		generichmg.engagedistmax = 1400;
		genericsniper = spawnstruct();
		genericsniper.engagedistmin = 950;
		genericsniper.engagedistoptimal = 2000;
		genericsniper.engagedistmulligan = 500;
		genericsniper.engagedistmax = 3000;
		engage_dists_add("", genericpistol);
		engage_dists_add("", genericsmg);
		engage_dists_add("", shotty);
		engage_dists_add("", generichmg);
		engage_dists_add("", genericriflesa);
		level thread engage_dists_watcher();
	#/
}

/*
	Name: engage_dists_add
	Namespace: debug
	Checksum: 0xA6362F55
	Offset: 0x62D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function engage_dists_add(weaponname, values)
{
	/#
		level.engagedists[weaponname] = values;
	#/
}

/*
	Name: get_engage_dists
	Namespace: debug
	Checksum: 0xDEE91EB6
	Offset: 0x6308
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function get_engage_dists(weapon)
{
	/#
		if(isdefined(level.engagedists[weapon]))
		{
			return level.engagedists[weapon];
		}
		return undefined;
	#/
}

/*
	Name: engage_dists_watcher
	Namespace: debug
	Checksum: 0x9C5BBD18
	Offset: 0x6350
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function engage_dists_watcher()
{
	/#
		level endon(#"kill_all_engage_dist_debug", #"kill_engage_dists_watcher");
		while(true)
		{
			player = get_playerone();
			playerweapon = player getcurrentweapon();
			if(!isdefined(player.lastweapon))
			{
				player.lastweapon = playerweapon;
			}
			else if(player.lastweapon == playerweapon)
			{
				waitframe(1);
				continue;
			}
			values = get_engage_dists(playerweapon.weapclass);
			if(isdefined(values))
			{
				level.weaponengagedistvalues = values;
			}
			else
			{
				level.weaponengagedistvalues = undefined;
			}
			player.lastweapon = playerweapon;
			waitframe(1);
		}
	#/
}

/*
	Name: debug_realtime_engage_dist
	Namespace: debug
	Checksum: 0x94EC43C2
	Offset: 0x6460
	Size: 0x42E
	Parameters: 0
	Flags: None
*/
function debug_realtime_engage_dist()
{
	/#
		level endon(#"kill_all_engage_dist_debug", #"kill_realtime_engagement_distance_debug");
		player = get_playerone();
		hudobjarray = engagement_distance_debug_init(player);
		level thread engage_dist_debug_hud_destroy(hudobjarray, "");
		level.debugrtengagedistcolor = (0, 1, 0);
		while(true)
		{
			lasttracepos = (0, 0, 0);
			direction = player getplayerangles();
			direction_vec = anglestoforward(direction);
			eye = player geteye();
			trace = bullettrace(eye, eye + vectorscale(direction_vec, 10000), 1, player);
			tracepoint = trace[#"position"];
			tracenormal = trace[#"normal"];
			tracedist = int(distance(eye, tracepoint));
			if(tracepoint != lasttracepos)
			{
				lasttracepos = tracepoint;
				if(!isdefined(level.weaponengagedistvalues))
				{
					hudobj_changecolor(hudobjarray, (1, 1, 1));
					hudobjarray engagedist_hud_changetext("", tracedist);
				}
				else
				{
					engagedistmin = level.weaponengagedistvalues.engagedistmin;
					engagedistoptimal = level.weaponengagedistvalues.engagedistoptimal;
					engagedistmulligan = level.weaponengagedistvalues.engagedistmulligan;
					engagedistmax = level.weaponengagedistvalues.engagedistmax;
					if(tracedist >= engagedistmin && tracedist <= engagedistmax)
					{
						if(tracedist >= (engagedistoptimal - engagedistmulligan) && tracedist <= (engagedistoptimal + engagedistmulligan))
						{
							hudobjarray engagedist_hud_changetext("", tracedist);
							hudobj_changecolor(hudobjarray, (0, 1, 0));
						}
						else
						{
							hudobjarray engagedist_hud_changetext("", tracedist);
							hudobj_changecolor(hudobjarray, (1, 1, 0));
						}
					}
					else
					{
						if(tracedist < engagedistmin)
						{
							hudobj_changecolor(hudobjarray, (1, 0, 0));
							hudobjarray engagedist_hud_changetext("", tracedist);
						}
						else if(tracedist > engagedistmax)
						{
							hudobj_changecolor(hudobjarray, (1, 0, 0));
							hudobjarray engagedist_hud_changetext("", tracedist);
						}
					}
				}
			}
			thread util::function_6844bea4(1, 5, 0.05, level.debugrtengagedistcolor, tracepoint, tracenormal);
			thread util::function_6844bea4(1, 1, 0.05, level.debugrtengagedistcolor, tracepoint, tracenormal);
			waitframe(1);
		}
	#/
}

/*
	Name: hudobj_changecolor
	Namespace: debug
	Checksum: 0xC68DB50F
	Offset: 0x6898
	Size: 0x78
	Parameters: 2
	Flags: None
*/
function hudobj_changecolor(hudobjarray, newcolor)
{
	/#
		for(i = 0; i < hudobjarray.size; i++)
		{
			hudobj = hudobjarray[i];
			if(hudobj.color != newcolor)
			{
				hudobj.color = newcolor;
				level.debugrtengagedistcolor = newcolor;
			}
		}
	#/
}

/*
	Name: engagedist_hud_changetext
	Namespace: debug
	Checksum: 0xC909B92E
	Offset: 0x6918
	Size: 0x2EC
	Parameters: 2
	Flags: None
*/
function engagedist_hud_changetext(engagedisttype, units)
{
	/#
		if(!isdefined(level.lastdisttype))
		{
			level.lastdisttype = "";
		}
		if(engagedisttype == "")
		{
			self[1] setvalue(units);
			self[2] settext("");
			self[3].alpha = 0;
		}
		else
		{
			if(engagedisttype == "")
			{
				self[1] setvalue(units);
				self[2] settext("");
				self[3].alpha = 0;
			}
			else
			{
				if(engagedisttype == "")
				{
					amountunder = level.weaponengagedistvalues.engagedistmin - units;
					self[1] setvalue(units);
					self[3] setvalue(amountunder);
					self[3].alpha = 1;
					if(level.lastdisttype != engagedisttype)
					{
						self[2] settext("");
					}
				}
				else
				{
					if(engagedisttype == "")
					{
						amountover = units - level.weaponengagedistvalues.engagedistmax;
						self[1] setvalue(units);
						self[3] setvalue(amountover);
						self[3].alpha = 1;
						if(level.lastdisttype != engagedisttype)
						{
							self[2] settext("");
						}
					}
					else if(engagedisttype == "")
					{
						self[1] setvalue(units);
						self[2] settext("");
						self[3].alpha = 0;
					}
				}
			}
		}
		level.lastdisttype = engagedisttype;
	#/
}

/*
	Name: debug_ai_engage_dist
	Namespace: debug
	Checksum: 0x8FC879E7
	Offset: 0x6C10
	Size: 0x2F6
	Parameters: 0
	Flags: None
*/
function debug_ai_engage_dist()
{
	/#
		level endon(#"kill_all_engage_dist_debug", #"kill_ai_engagement_distance_debug");
		player = get_playerone();
		while(true)
		{
			axis = getaiteamarray(#"axis");
			if(isdefined(axis) && axis.size > 0)
			{
				playereye = player geteye();
				for(i = 0; i < axis.size; i++)
				{
					ai = axis[i];
					aieye = ai geteye();
					if(sighttracepassed(playereye, aieye, 0, player) && !isvehicle(ai))
					{
						dist = distance(playereye, aieye);
						drawcolor = (1, 1, 1);
						drawstring = "";
						engagedistmin = ai.engagemindist;
						engagedistfalloffmin = ai.engageminfalloffdist;
						engagedistfalloffmax = ai.engagemaxfalloffdist;
						engagedistmax = ai.engagemaxdist;
						if(dist >= engagedistmin && dist <= engagedistmax)
						{
							drawcolor = (0, 1, 0);
							drawstring = "";
						}
						else
						{
							if(dist < engagedistmin && dist >= engagedistfalloffmin)
							{
								drawcolor = (1, 1, 0);
								drawstring = "";
							}
							else
							{
								if(dist > engagedistmax && dist <= engagedistfalloffmax)
								{
									drawcolor = (1, 1, 0);
									drawstring = "";
								}
								else
								{
									if(dist > engagedistfalloffmax)
									{
										drawcolor = (1, 0, 0);
										drawstring = "";
									}
									else if(dist < engagedistfalloffmin)
									{
										drawcolor = (1, 0, 0);
										drawstring = "";
									}
								}
							}
						}
						scale = dist / 1000;
						print3d(ai.origin + vectorscale((0, 0, 1), 67), (drawstring + "") + dist, drawcolor, 1, scale);
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: dynamic_ai_spawner
	Namespace: debug
	Checksum: 0xBD9EEC2F
	Offset: 0x6F10
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function dynamic_ai_spawner()
{
	/#
		if(!isdefined(level.debug_dynamic_ai_spawner))
		{
			dynamic_ai_spawner_find_spawners();
			level.debug_dynamic_ai_spawner = 1;
		}
		getplayers()[0] thread spawn_guy_placement();
		level waittill(#"hash_34e65f3c6ffc6a39");
		if(isdefined(level.dynamic_spawn_hud))
		{
			level.dynamic_spawn_hud destroy();
		}
		if(isdefined(level.dynamic_spawn_dummy_model))
		{
			level.dynamic_spawn_dummy_model delete();
		}
	#/
}

/*
	Name: dynamic_ai_spawner_find_spawners
	Namespace: debug
	Checksum: 0xD04E19A3
	Offset: 0x6FE8
	Size: 0x1A8
	Parameters: 0
	Flags: None
*/
function dynamic_ai_spawner_find_spawners()
{
	/#
		spawners = getspawnerarray();
		level.aitypes = [];
		level.aitype_index = 0;
		var_362d54a0 = [];
		foreach(spawner in spawners)
		{
			if(!isdefined(var_362d54a0[spawner.classname]))
			{
				var_362d54a0[spawner.classname] = 1;
				struct = spawnstruct();
				classname = spawner.classname;
				vehicletype = spawner.vehicletype;
				if(issubstr(classname, ""))
				{
					struct.radius = 64;
					struct.isvehicle = 0;
					classname = getsubstr(classname, 6);
				}
				else
				{
					continue;
				}
				struct.classname = classname;
				level.aitypes[level.aitypes.size] = struct;
			}
		}
	#/
}

/*
	Name: spawn_guy_placement
	Namespace: debug
	Checksum: 0xD22B68EB
	Offset: 0x7198
	Size: 0x726
	Parameters: 0
	Flags: None
*/
function spawn_guy_placement()
{
	/#
		level endon(#"hash_34e65f3c6ffc6a39");
		/#
			assert(isdefined(level.aitypes) && level.aitypes.size > 0, "");
		#/
		level.dynamic_spawn_hud = newdebughudelem(getplayers()[0]);
		level.dynamic_spawn_hud.alignx = "";
		level.dynamic_spawn_hud.x = 0;
		level.dynamic_spawn_hud.y = 245;
		level.dynamic_spawn_hud.fontscale = 1.5;
		level.dynamic_spawn_hud settext("");
		level.dynamic_spawn_dummy_model = spawn("", (0, 0, 0));
		wait(0.1);
		while(true)
		{
			direction = self getplayerangles();
			direction_vec = anglestoforward(direction);
			eye = self geteye();
			trace_dist = 4000;
			trace = bullettrace(eye, eye + vectorscale(direction_vec, trace_dist), 0, level.dynamic_spawn_dummy_model);
			dist = distance(eye, trace[#"position"]);
			position = eye + (vectorscale(direction_vec, dist - level.aitypes[level.aitype_index].radius));
			origin = position;
			angles = self.angles + vectorscale((0, 1, 0), 180);
			level.dynamic_spawn_dummy_model.origin = position;
			level.dynamic_spawn_dummy_model.angles = angles;
			level.dynamic_spawn_hud settext((((("" + (level.aitype_index + 1)) + "") + level.aitypes.size) + "") + level.aitypes[level.aitype_index].classname);
			level.dynamic_spawn_dummy_model detachall();
			level.dynamic_spawn_dummy_model setmodel(level.aitypes[level.aitype_index].classname);
			level.dynamic_spawn_dummy_model show();
			level.dynamic_spawn_dummy_model notsolid();
			if(self usebuttonpressed() || self buttonpressed(""))
			{
				level.dynamic_spawn_dummy_model hide();
				if(level.aitypes[level.aitype_index].isvehicle)
				{
					spawn = spawnvehicle(level.aitypes[level.aitype_index].classname, origin, angles, "");
				}
				else
				{
					spawn = spawnactor(level.aitypes[level.aitype_index].classname, origin, angles, "", 1);
				}
				var_ec8949ef = getdvarint(#"debug_dynamic_ai_ignoreme", 0);
				var_a127c98a = getdvarint(#"debug_dynamic_ai_ignoreall", 0);
				spawn.pacifist = getdvarint(#"debug_dynamic_ai_pacifist", 0);
				spawn val::set(#"spawn_guy_placement", "", var_ec8949ef);
				spawn val::set(#"spawn_guy_placement", "", var_a127c98a);
				spawn.fixednode = 0;
				wait(0.3);
			}
			else
			{
				if(self buttonpressed("") || self buttonpressed(""))
				{
					level.dynamic_spawn_dummy_model hide();
					level.aitype_index++;
					if(level.aitype_index >= level.aitypes.size)
					{
						level.aitype_index = 0;
					}
					wait(0.3);
				}
				else
				{
					if(self buttonpressed("") || self buttonpressed(""))
					{
						level.dynamic_spawn_dummy_model hide();
						level.aitype_index--;
						if(level.aitype_index < 0)
						{
							level.aitype_index = level.aitypes.size - 1;
						}
						wait(0.3);
					}
					else if(self buttonpressed("") || self buttonpressed(""))
					{
						setdvar(#"debug_dynamic_ai_spawning", 0);
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: display_module_text
	Namespace: debug
	Checksum: 0x793D1A80
	Offset: 0x78C8
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function display_module_text()
{
	/#
		wait(1);
		iprintlnbold(("" + level.script) + "");
	#/
}

/*
	Name: debug_goalradius
	Namespace: debug
	Checksum: 0x75A9B7B
	Offset: 0x7910
	Size: 0x1E4
	Parameters: 0
	Flags: None
*/
function debug_goalradius()
{
	/#
		guys = getaiarray();
		for(i = 0; i < guys.size; i++)
		{
			if(guys[i].team == #"axis")
			{
				print3d(guys[i].origin + vectorscale((0, 0, 1), 70), (isdefined(guys[i].goalradius) ? "" + guys[i].goalradius : ""), i, (1, 0, 0), 1, 1);
				record3dtext("" + guys[i].goalradius, guys[i].origin + vectorscale((0, 0, 1), 70), (1, 0, 0), "");
				continue;
			}
			print3d(guys[i].origin + vectorscale((0, 0, 1), 70), (isdefined(guys[i].goalradius) ? "" + guys[i].goalradius : ""), i, (0, 1, 0), 1, 1);
			record3dtext("" + guys[i].goalradius, guys[i].origin + vectorscale((0, 0, 1), 70), (0, 1, 0), "");
		}
	#/
}

/*
	Name: function_3a215729
	Namespace: debug
	Checksum: 0x435A1030
	Offset: 0x7B00
	Size: 0x1C0
	Parameters: 0
	Flags: None
*/
function function_3a215729()
{
	/#
		guys = getaiarray();
		foreach(guy in guys)
		{
			recordcircle(guy.origin, sqrt(guy.maxsightdistsqrd), (1, 1, 0), "");
		}
		foreach(player in level.players)
		{
			record3dtext((isdefined(player.maxvisibledist) ? "" + player.maxvisibledist : ""), player.origin, (1, 0, 0), "");
			recordcircle(player.origin, player.maxvisibledist, (1, 0, 0), "");
		}
	#/
}

/*
	Name: debug_health
	Namespace: debug
	Checksum: 0x751AFDB4
	Offset: 0x7CC8
	Size: 0x2C4
	Parameters: 0
	Flags: None
*/
function debug_health()
{
	/#
		v_print_pos = (0, 0, 0);
		guys = getaiarray();
		for(i = 0; i < guys.size; i++)
		{
			if(isdefined(guys[i] gettagorigin("")))
			{
				v_print_pos = guys[i] gettagorigin("") + vectorscale((0, 0, 1), 15);
			}
			else
			{
				v_print_pos = guys[i] getorigin() + vectorscale((0, 0, 1), 70);
			}
			print3d(v_print_pos, (isdefined(guys[i].health) ? "" + guys[i].health : ""), i, level.debugteamcolors[guys[i].team], 1);
			recordenttext((isdefined(guys[i].health) ? "" + guys[i].health : ""), i, guys[i], level.debugteamcolors[guys[i].team]);
		}
		vehicles = getvehiclearray();
		for(i = 0; i < vehicles.size; i++)
		{
			recordenttext((isdefined(vehicles[i].health) ? "" + vehicles[i].health : ""), i, vehicles[i], level.debugteamcolors[vehicles[i].team]);
		}
		if(isdefined(level.player))
		{
			recordenttext((isdefined(level.player.health) ? "" + level.player.health : ""), level.player, level.debugteamcolors[#"allies"], "");
		}
	#/
}

/*
	Name: debug_engagedist
	Namespace: debug
	Checksum: 0x7F7D8162
	Offset: 0x7F98
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function debug_engagedist()
{
	/#
		guys = getaiarray();
		for(i = 0; i < guys.size; i++)
		{
			diststring = (((((guys[i].engageminfalloffdist + "") + guys[i].engagemindist) + "") + guys[i].engagemaxdist) + "") + guys[i].engagemaxfalloffdist;
			recordenttext(diststring, guys[i], level.debugteamcolors[guys[i].team], "");
		}
	#/
}

/*
	Name: debug_sphere
	Namespace: debug
	Checksum: 0xCD0DB45
	Offset: 0x8088
	Size: 0xB4
	Parameters: 5
	Flags: None
*/
function debug_sphere(origin, radius, color, alpha, time)
{
	/#
		if(!isdefined(time))
		{
			time = 1000;
		}
		if(!isdefined(color))
		{
			color = (1, 1, 1);
		}
		sides = int(10 * (1 + (int(radius) % 100)));
		sphere(origin, radius, color, alpha, 1, sides, time);
	#/
}

