#using script_28e27ee9b45fd02d;
#using script_47aae961bc2a5bac;
#using script_31671175564a93b7;
#using script_1cd690a97dfca36e;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace snd;

/*
	Name: function_4047919b
	Namespace: snd
	Checksum: 0x52F45941
	Offset: 0x3B8
	Size: 0x2FA
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_4047919b()
{
	if(!isdefined(level._snd))
	{
		level._snd = spawnstruct();
		level._snd.var_8c37ff34 = 1;
		level._snd._callbacks = [];
		level._snd.var_3cc765a3 = [];
		level._snd.var_92f63ad0 = [];
		level._snd.var_d37e94ca = #"hash_26f47d82e3ac7591";
		level._snd.var_90903fc0 = 0;
		level._snd._callbacks[#"hash_48cf16f271a9efa6"] = &function_6f94855d;
		level._snd._callbacks[#"hash_2e4f12f2aa75ce4a"] = &function_679011ab;
		level._snd._callbacks[#"hash_1e1ac3f40eb876c"] = &function_7308d4d0;
		level._snd._callbacks[#"hash_54be783edee16780"] = &function_a43df3ac;
		level._snd._callbacks[#"player_view"] = &function_959bbfdb;
		level._snd._callbacks[#"player_angles"] = &function_2c0c5fbc;
		level._snd._callbacks[#"player_fov"] = &function_bf76eea3;
	}
	util::register_system("clientSoundCommand", &function_8610d024);
	function_3ffa0089();
	/#
		function_ce893a25();
		dvar("", "", &function_360bb421);
		dvar("", "", &function_360bb421);
		dvar("", "", &function_360bb421);
	#/
	waittillframeend();
	level._snd.var_a203d643 = 1;
}

/*
	Name: function_8610d024
	Namespace: snd
	Checksum: 0xBC7910D2
	Offset: 0x6C0
	Size: 0x212
	Parameters: 2
	Flags: Private
*/
function private function_8610d024(localclientnum, _cmd)
{
	waitforplayers();
	player = function_a8210e43(localclientnum);
	args = strtok(_cmd, " ");
	waittillframeend();
	if(!isdefined(player))
	{
		return;
	}
	if(isarray(args) && args.size >= 2)
	{
		cmd = args[0];
		switch(cmd)
		{
			case "#":
			case "m":
			{
				function_21d71e38(player, cmd, args);
				break;
			}
			case "t":
			{
				function_6d366059(player, cmd, args);
				break;
			}
			case "v":
			{
				function_cc4bf5ee(player, cmd, args);
				break;
			}
			default:
			{
				/#
					function_81fac19d(function_d78e3644(), ("" + cmd) + "");
				#/
				break;
			}
		}
	}
	if(isscriptfunctionptr(level._snd._callbacks[#"clientsoundcommand"]))
	{
		[[level._snd._callbacks[#"clientsoundcommand"]]](localclientnum, _cmd);
	}
}

/*
	Name: function_21d71e38
	Namespace: snd
	Checksum: 0x48303DE
	Offset: 0x8E0
	Size: 0x22A
	Parameters: 3
	Flags: Private
*/
function private function_21d71e38(player, cmd, args)
{
	/#
		assert(isplayer(player));
	#/
	/#
		assert(isdefined(player.localclientnum));
	#/
	/#
		assert(isstring(cmd) && (cmd == "" || cmd == ""));
	#/
	/#
		assert(isarray(args) && args.size >= 2);
	#/
	if(function_81fac19d(!isscriptfunctionptr(level._snd._callbacks[#"hash_42c86668831b6304"]), "snd: client msg without initialization"))
	{
		return;
	}
	msg = undefined;
	if(cmd == "#")
	{
		msg = function_35dccf3f(args[1]);
	}
	else if(cmd == "M")
	{
		msg = args[1];
	}
	var_65cde9d7 = isstring(msg) || ishash(msg);
	if(function_81fac19d(!var_65cde9d7, "snd: invalid client msg"))
	{
		return;
	}
	level thread [[level._snd._callbacks[#"hash_42c86668831b6304"]]](player, msg);
}

/*
	Name: function_6d366059
	Namespace: snd
	Checksum: 0xE13D30DC
	Offset: 0xB18
	Size: 0x2F4
	Parameters: 3
	Flags: Private
*/
function private function_6d366059(player, cmd, args)
{
	/#
		assert(isplayer(player));
	#/
	/#
		assert(isdefined(player.localclientnum));
	#/
	/#
		assert(isstring(cmd) && cmd == "");
	#/
	/#
		assert(isarray(args));
	#/
	if(function_81fac19d(!isscriptfunctionptr(level._snd._callbacks[#"hash_52e784c98bdc27b5"]), "snd: client targetname without initialization"))
	{
	}
	else
	{
		var_1ef003e2 = int(args[1]);
		targetname = string(args[2]);
		if(args.size > 3)
		{
			for(i = 3; i < args.size; i++)
			{
				targetname = targetname + (" " + string(args[i]));
			}
		}
		ent = undefined;
		framecount = 0;
		while(true)
		{
			ent = getentbynum(player.localclientnum, var_1ef003e2);
			if(isentity(ent))
			{
				ent.targetname = targetname;
				ent thread [[level._snd._callbacks[#"hash_52e784c98bdc27b5"]]](ent, targetname);
				break;
			}
			framecount++;
			if(function_81fac19d((framecount % 60) == 0, ((("snd: client targetname not found '" + targetname) + "' (") + var_1ef003e2) + ")"))
			{
				if(function_81fac19d((framecount % 1800) == 0, ((("snd: client targetname ABORTED '" + targetname) + "' (") + var_1ef003e2) + ")"))
				{
					break;
				}
			}
			waitframe(1);
		}
	}
}

/*
	Name: function_cc4bf5ee
	Namespace: snd
	Checksum: 0xCADD4092
	Offset: 0xE18
	Size: 0x544
	Parameters: 3
	Flags: Private
*/
function private function_cc4bf5ee(player, cmd, args)
{
	/#
		assert(isplayer(player));
	#/
	/#
		assert(isdefined(player.localclientnum));
	#/
	/#
		assert(isstring(cmd) && cmd == "");
	#/
	/#
		assert(isarray(args));
	#/
	var_e1fb96c7 = isdefined(level._snd._callbacks[#"hash_bf7e51bf6046b77"]) && isscriptfunctionptr(level._snd._callbacks[#"hash_bf7e51bf6046b77"]);
	entitynumber = int(args[1]);
	soundalias = undefined;
	if(args.size >= 3 && isdefined(args[2]))
	{
		soundalias = string(args[2]);
	}
	if(args.size > 3)
	{
		/#
			assert(isstring(soundalias));
		#/
		for(i = 3; i < args.size; i++)
		{
			soundalias = soundalias + (" " + string(args[i]));
		}
	}
	ent = undefined;
	framecount = 0;
	while(true)
	{
		ent = getentbynum(player.localclientnum, entitynumber);
		if(isentity(ent))
		{
			if(var_e1fb96c7)
			{
				ent thread [[level._snd._callbacks[#"hash_bf7e51bf6046b77"]]](ent, soundalias);
			}
			else
			{
				var_90709302 = isdefined(soundalias);
				var_2115c64c = function_a6779cbd(ent.var_6d22c36f);
				if(var_90709302)
				{
					if(!isarray(ent.var_bfe14559))
					{
						ent.var_bfe14559 = [0:soundalias];
					}
					else
					{
						ent.var_bfe14559[ent.var_bfe14559.size] = soundalias;
					}
				}
				if(var_2115c64c && !var_90709302)
				{
					stop(ent.var_6d22c36f);
					ent.var_bfe14559 = undefined;
					ent.var_6d22c36f = undefined;
				}
				if(!isdefined(ent.var_6d22c36f))
				{
					while(isarray(ent.var_bfe14559))
					{
						alias = ent.var_bfe14559[0];
						arrayremoveindex(ent.var_bfe14559, 0, 0);
						ent.var_6d22c36f = play(alias, [1:"j_head", 0:ent]);
						function_2fdc4fb(ent.var_6d22c36f);
						wait(0.666);
						if(isarray(ent.var_bfe14559) && ent.var_bfe14559.size == 0)
						{
							ent.var_bfe14559 = undefined;
						}
						if(isdefined(ent))
						{
							ent.var_6d22c36f = undefined;
						}
					}
				}
			}
			break;
		}
		framecount++;
		if(function_81fac19d((framecount % 60) == 0, ((("snd: client voice entity not found '" + soundalias) + "' (") + entitynumber) + ")"))
		{
			if(function_81fac19d((framecount % 1800) == 0, ((("snd: client soundalias ABORTED '" + soundalias) + "' (") + entitynumber) + ")"))
			{
				break;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_d4ec748e
	Namespace: snd
	Checksum: 0xD598E2CB
	Offset: 0x1368
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_d4ec748e(callback)
{
	if(function_81fac19d(!isscriptfunctionptr(callback), "snd_client_msg_init: invalid function"))
	{
		/#
			if(function_f984063f())
			{
				debugbreak();
			}
		#/
		return;
	}
	level._snd._callbacks[#"hash_42c86668831b6304"] = callback;
}

/*
	Name: function_ce78b33b
	Namespace: snd
	Checksum: 0x6A15BA68
	Offset: 0x1408
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_ce78b33b(callback)
{
	if(function_81fac19d(!isscriptfunctionptr(callback), "snd_client_targetname_init: invalid function"))
	{
		/#
			if(function_f984063f())
			{
				debugbreak();
			}
		#/
		return;
	}
	level._snd._callbacks[#"hash_52e784c98bdc27b5"] = callback;
}

#namespace namespace_afa8e18b;

/*
	Name: function_2761fc04
	Namespace: namespace_afa8e18b
	Checksum: 0x74D10271
	Offset: 0x14A8
	Size: 0x1B0
	Parameters: 4
	Flags: None
*/
function function_2761fc04(ent, var_1d25915, var_605838f4, var_e330010e)
{
	/#
		assert(isdefined(ent), "");
	#/
	/#
		assert(isdefined(ent.soundkey), "");
	#/
	if(isdefined(var_605838f4))
	{
		var_e330010e = var_605838f4 snd::function_bf7c949(var_e330010e);
		var_386560b8 = (0, 0, 0);
		var_f1088ee4 = (0, 0, 0);
		if(isdefined(var_1d25915))
		{
			var_386560b8 = var_1d25915;
		}
		/#
			assert(isdefined(var_e330010e), "");
		#/
		if(isstring(var_e330010e) && var_e330010e != "" && var_e330010e != "tag_origin")
		{
			ent linkto(var_605838f4, var_e330010e);
		}
		else
		{
			ent linkto(var_605838f4);
		}
		if(!isarray(var_605838f4.var_a415b6d6))
		{
			var_605838f4.var_a415b6d6 = [];
		}
		var_605838f4.var_a415b6d6[ent.soundkey] = ent;
	}
	else
	{
		level._snd.var_92f63ad0[ent.soundkey] = ent;
	}
}

/*
	Name: function_5275752c
	Namespace: namespace_afa8e18b
	Checksum: 0xD0F5A602
	Offset: 0x1660
	Size: 0x246
	Parameters: 4
	Flags: None
*/
function function_5275752c(soundalias, var_1d25915, var_605838f4, var_e330010e)
{
	ent = undefined;
	spawnorigin = undefined;
	if(isdefined(var_605838f4) && isdefined(var_e330010e) && isdefined(var_1d25915))
	{
		spawnorigin = var_605838f4 gettagorigin(var_e330010e);
		spawnorigin = spawnorigin + var_1d25915;
	}
	else
	{
		if(isdefined(var_605838f4) && isdefined(var_e330010e))
		{
			spawnorigin = var_605838f4 gettagorigin(var_e330010e);
		}
		else
		{
			if(isdefined(var_605838f4) && isdefined(var_1d25915))
			{
				spawnorigin = var_605838f4.origin;
				spawnorigin = spawnorigin + var_1d25915;
			}
			else
			{
				if(isdefined(var_605838f4))
				{
					spawnorigin = var_605838f4.origin;
				}
				else
				{
					if(!isdefined(var_605838f4) && !isdefined(var_1d25915))
					{
						var_3692a397 = vectorscale((0, 0, -1), 32768);
						spawnorigin = var_3692a397;
					}
					else
					{
						spawnorigin = var_1d25915;
					}
				}
			}
		}
	}
	/#
		assert(isdefined(spawnorigin));
	#/
	ent = undefined;
	if(isdefined(var_605838f4))
	{
		ent = spawn(0, spawnorigin, "script_model");
		ent setmodel("tag_origin");
	}
	else
	{
		ent = spawn(0, spawnorigin, "script_origin");
	}
	/#
		assert(isdefined(ent), "");
	#/
	ent.var_90c86b97 = var_605838f4;
	ent.soundtype = #"hash_26f47d82e3ac7591";
	ent.soundkey = ent getentitynumber();
	ent.targetname = "snd " + soundalias;
	return ent;
}

/*
	Name: function_bdc44456
	Namespace: namespace_afa8e18b
	Checksum: 0x540A07E8
	Offset: 0x18B0
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_bdc44456(ent)
{
	if(snd::function_81fac19d(!isdefined(ent) || function_3132f113(ent), "snd: free on deleted entity!"))
	{
		/#
			if(snd::function_f984063f())
			{
				debugbreak();
			}
		#/
	}
	else
	{
		if(isdefined(ent.var_90c86b97) && isarray(ent.var_90c86b97.var_a415b6d6))
		{
			var_605838f4 = ent.var_90c86b97;
			var_5244aa9 = isdefined(var_605838f4.var_a415b6d6[ent.soundkey]);
			if(var_5244aa9 == 1)
			{
				var_605838f4.var_a415b6d6[ent.soundkey] = undefined;
			}
			else
			{
				/#
					debugbreak();
				#/
				if(snd::function_f984063f())
				{
				}
			}
		}
		else
		{
			level._snd.var_92f63ad0[ent.soundkey] = undefined;
		}
		waittillframeend();
		ent delete();
	}
}

/*
	Name: function_bb749fc3
	Namespace: namespace_afa8e18b
	Checksum: 0x60AF0DD3
	Offset: 0x1A30
	Size: 0x27E
	Parameters: 4
	Flags: None
*/
function function_bb749fc3(var_afe43979, soundalias, var_99e65ecf, delaytime)
{
	ent = var_afe43979;
	var_fe3be304 = undefined;
	ent endon(#"death");
	/#
		assert(isdefined(ent));
	#/
	/#
		assert(isstring(soundalias) || ishash(soundalias));
	#/
	var_fe3be304 = 1;
	if(!isdefined(var_99e65ecf) && isdefined(var_fe3be304))
	{
		var_99e65ecf = var_fe3be304;
	}
	if(snd::function_4e1ee82e() == 0)
	{
		var_cd7344db = !isdefined(delaytime) || (snd::isnumber(delaytime) && delaytime == 0);
		if(snd::function_81fac19d(var_cd7344db, "snd: delayed due to first frame!"))
		{
			delaytime = 0.05;
		}
	}
	if(snd::isnumber(delaytime) && delaytime > 0)
	{
		wait(delaytime);
	}
	soundhandle = -1;
	/#
		assert(soundexists(soundalias), "" + soundalias);
	#/
	if(soundislooping(soundalias) == 1)
	{
		soundhandle = ent playloopsound(soundalias);
	}
	else
	{
		var_42be2e20 = "sounddone";
		soundhandle = ent playsound(0, soundalias);
		ent.soundhandle = soundhandle;
		ent thread function_297cdf07(var_42be2e20, soundhandle);
	}
	ent.soundalias = soundalias;
	ent.soundhandle = soundhandle;
}

/*
	Name: function_273d939b
	Namespace: namespace_afa8e18b
	Checksum: 0xD70E4DAA
	Offset: 0x1CB8
	Size: 0x18C
	Parameters: 2
	Flags: None
*/
function function_273d939b(var_afe43979, var_24ea4e17)
{
	var_afe43979 endon(#"death");
	ent = var_afe43979;
	if(snd::function_81fac19d(!isdefined(ent) || function_3132f113(ent), "snd: stop on deleted entity!"))
	{
		/#
			if(snd::function_f984063f())
			{
				debugbreak();
			}
		#/
	}
	else
	{
		soundalias = ent.soundalias;
		if(isstring(soundalias))
		{
			if(is_true(soundislooping(soundalias)))
			{
				ent stoploopsound(ent.soundhandle, var_24ea4e17);
			}
			else
			{
				ent stopsounds();
				stopsound(ent.soundhandle);
			}
			waitframe(1);
			ent.soundalias = undefined;
			ent.soundhandle = undefined;
		}
		ent.soundtype = undefined;
		function_bdc44456(ent);
	}
}

/*
	Name: function_5834ae26
	Namespace: namespace_afa8e18b
	Checksum: 0xD2FB1E8C
	Offset: 0x1E50
	Size: 0xA4
	Parameters: 2
	Flags: Private
*/
function private function_5834ae26(soundalias, done)
{
	ent = self;
	ent endon(#"death");
	waittime = soundgetplaybacktime(soundalias);
	waittime = waittime * 1.25;
	waittime = waittime / 1000;
	wait(waittime);
	ent notify(done, ent.soundalias);
	function_bdc44456(ent);
}

/*
	Name: function_7b0e43ab
	Namespace: namespace_afa8e18b
	Checksum: 0xE3FA6A01
	Offset: 0x1F00
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private function_7b0e43ab(done)
{
	ent = self;
	ent endon(#"death");
	ent waittill(done);
	ent notify(done, ent.soundalias);
	function_bdc44456(ent);
}

/*
	Name: function_297cdf07
	Namespace: namespace_afa8e18b
	Checksum: 0x2A831471
	Offset: 0x1F70
	Size: 0x7C
	Parameters: 2
	Flags: Private
*/
function private function_297cdf07(done, soundhandle)
{
	ent = self;
	ent endon(#"death");
	while(soundplaying(soundhandle))
	{
		waitframe(1);
	}
	ent notify(done, ent.soundalias);
	function_bdc44456(ent);
}

/*
	Name: function_b5959278
	Namespace: namespace_afa8e18b
	Checksum: 0x8B515C70
	Offset: 0x1FF8
	Size: 0x44
	Parameters: 4
	Flags: None
*/
function function_b5959278(ent, var_1d25915, var_605838f4, var_e330010e)
{
	/#
		assert(0, "");
	#/
}

/*
	Name: function_85daf9f0
	Namespace: namespace_afa8e18b
	Checksum: 0xCA1FC07C
	Offset: 0x2048
	Size: 0x46
	Parameters: 4
	Flags: None
*/
function function_85daf9f0(soundalias, var_1d25915, var_605838f4, var_e330010e)
{
	/#
		assert(0, "");
	#/
	return undefined;
}

/*
	Name: function_6ac5b570
	Namespace: namespace_afa8e18b
	Checksum: 0xFD330AA9
	Offset: 0x2098
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_6ac5b570(ent)
{
	/#
		assert(0, "");
	#/
}

/*
	Name: function_2dde45d9
	Namespace: namespace_afa8e18b
	Checksum: 0x71A62F9C
	Offset: 0x20D0
	Size: 0x44
	Parameters: 4
	Flags: None
*/
function function_2dde45d9(var_afe43979, soundalias, var_99e65ecf, delaytime)
{
	/#
		assert(0, "");
	#/
}

/*
	Name: function_9f156b27
	Namespace: namespace_afa8e18b
	Checksum: 0xC697965E
	Offset: 0x2120
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_9f156b27(var_afe43979, var_24ea4e17)
{
	/#
		assert(0, "");
	#/
}

#namespace snd;

/*
	Name: function_3323ac64
	Namespace: snd
	Checksum: 0x1CC4BFAF
	Offset: 0x2160
	Size: 0xCC
	Parameters: 1
	Flags: Private
*/
function private function_3323ac64(var_afe43979)
{
	if(isdefined(var_afe43979) == 1 && function_3132f113(var_afe43979) == 0 && isdefined(var_afe43979.var_aceb47b0) == 0)
	{
		var_afe43979.var_aceb47b0 = spawnstruct();
		var_afe43979.var_aceb47b0.volume = 1;
		var_afe43979.var_aceb47b0.pitch = 1;
		var_afe43979.var_aceb47b0.threads = [];
		function_f2a84378(var_afe43979, function_6cfa7975());
	}
}

/*
	Name: function_5803da43
	Namespace: snd
	Checksum: 0x6A147C09
	Offset: 0x2238
	Size: 0x8C
	Parameters: 3
	Flags: Private
*/
function private function_5803da43(sound, volume, time)
{
	if(isdefined(sound) && isdefined(sound.soundhandle))
	{
		if(time > 0)
		{
			time = 1 / time;
		}
		setsoundvolumerate(sound.soundhandle, time);
		setsoundvolume(sound.soundhandle, volume);
	}
}

/*
	Name: function_d7b79aea
	Namespace: snd
	Checksum: 0xB6C38FD2
	Offset: 0x22D0
	Size: 0x8C
	Parameters: 3
	Flags: Private
*/
function private function_d7b79aea(sound, pitch, time)
{
	if(isdefined(sound) && isdefined(sound.soundhandle))
	{
		if(time > 0)
		{
			time = 1 / time;
		}
		setsoundpitchrate(sound.soundhandle, time);
		setsoundpitch(sound.soundhandle, pitch);
	}
}

/*
	Name: function_d72fc2b9
	Namespace: snd
	Checksum: 0xDB2E9193
	Offset: 0x2368
	Size: 0xF2
	Parameters: 3
	Flags: Private
*/
function private function_d72fc2b9(var_afe43979, value, var_9cecf99a)
{
	if(function_3132f113(var_afe43979) == 1 || isdefined(var_afe43979) == 0)
	{
		return;
	}
	function_3323ac64(var_afe43979);
	/#
		assert(isdefined(var_afe43979.var_aceb47b0) == 1);
	#/
	if(isdefined(var_9cecf99a) == 1)
	{
		if(var_9cecf99a == (&function_5803da43))
		{
			var_afe43979.var_aceb47b0.volume = value;
		}
		else if(var_9cecf99a == (&function_d7b79aea))
		{
			var_afe43979.var_aceb47b0.pitch = value;
		}
	}
}

/*
	Name: function_2530f85d
	Namespace: snd
	Checksum: 0xF897ECC4
	Offset: 0x2468
	Size: 0x9E
	Parameters: 2
	Flags: Private
*/
function private function_2530f85d(var_afe43979, var_9cecf99a)
{
	/#
		assert(isdefined(var_afe43979));
	#/
	if(isdefined(var_afe43979.var_aceb47b0) == 1)
	{
		if(var_9cecf99a == (&function_5803da43))
		{
			return var_afe43979.var_aceb47b0.volume;
		}
		if(var_9cecf99a == (&function_d7b79aea))
		{
			return var_afe43979.var_aceb47b0.pitch;
		}
	}
	return undefined;
}

/*
	Name: function_6c660df4
	Namespace: snd
	Checksum: 0x96F5791C
	Offset: 0x2510
	Size: 0x15E
	Parameters: 1
	Flags: Private
*/
function private function_6c660df4(var_9cecf99a)
{
	var_5a2568f4 = 0;
	var_257087e9 = undefined;
	self endon(#"death");
	self waittill(#"hash_2178ab9046055607");
	/#
		assert(isdefined(var_9cecf99a) == 1, "");
	#/
	if(var_9cecf99a == (&function_5803da43))
	{
		self.var_aceb47b0.var_6d865326 = undefined;
		var_257087e9 = "volume";
	}
	if(var_9cecf99a == (&function_d7b79aea))
	{
		self.var_aceb47b0.var_a1666553 = undefined;
		var_257087e9 = "pitch";
	}
	/#
		assert(isdefined(var_257087e9) == 1);
	#/
	self.var_aceb47b0.threads[var_257087e9] = undefined;
	if(isdefined(self.var_aceb47b0.var_6d865326) == 0 && isdefined(self.var_aceb47b0.var_a1666553) == 0)
	{
		self.var_aceb47b0.var_e5dc3452 = undefined;
	}
	self notify("snd_stop_scale_" + var_257087e9);
	waittillframeend();
}

/*
	Name: function_48e190dd
	Namespace: snd
	Checksum: 0x5D9F48B1
	Offset: 0x2678
	Size: 0x762
	Parameters: 5
	Flags: Private
*/
function private function_48e190dd(curve, scale, time, var_9cecf99a, callbackfunc)
{
	self endon(#"death", #"disconnect");
	/#
		assert(isdefined(self.var_aceb47b0) == 1);
	#/
	/#
		assert(isdefined(self.var_aceb47b0.threads) == 1);
	#/
	/#
		assert(isdefined(var_9cecf99a) == 1);
	#/
	/#
		assert(time > 0);
	#/
	var_7c87e4f1 = function_fc955f31(curve);
	/#
		assert(var_7c87e4f1 > 0, "");
	#/
	frametime = float(function_6cfa7975());
	var_dbc35c6c = function_a18ae88f(float(time), frametime);
	time = (float(time) + frametime) - var_dbc35c6c;
	timeinterval = float(time) / float(var_7c87e4f1);
	var_aeb0a629 = function_a18ae88f(timeinterval, frametime);
	timeinterval = (timeinterval + frametime) - var_aeb0a629;
	timeinterval = max(timeinterval, frametime);
	var_a7ce73cd = int((timeinterval * 1000) + 0.5);
	timems = int((time * 1000) + 0.5);
	var_5bd40646 = int(0);
	if(isdefined(self.var_aceb47b0.var_e5dc3452) == 1)
	{
		var_e971cedf = 0;
		if(isdefined(self.var_aceb47b0.var_6d865326) == 1 && var_9cecf99a == (&function_5803da43) || (isdefined(self.var_aceb47b0.var_a1666553) == 1 && var_9cecf99a == (&function_d7b79aea)))
		{
			var_e971cedf = 1;
		}
		if(var_e971cedf == 1)
		{
			self notify(#"hash_2178ab9046055607");
			waittillframeend();
			self notify(#"hash_6e1c0f8335cc603c");
		}
	}
	var_45dc = function_2530f85d(self, var_9cecf99a);
	var_71659f7c = 0;
	if(var_45dc > scale)
	{
		var_71659f7c = 1;
	}
	while(isdefined(self.soundalias) == 0)
	{
		waitframe(1);
	}
	waittillframeend();
	self thread function_6c660df4(var_9cecf99a);
	self.var_aceb47b0.var_e5dc3452 = 1;
	var_257087e9 = undefined;
	if(var_9cecf99a == (&function_5803da43))
	{
		self.var_aceb47b0.var_6d865326 = 1;
		var_257087e9 = "volume";
	}
	if(var_9cecf99a == (&function_d7b79aea))
	{
		self.var_aceb47b0.var_a1666553 = 1;
		var_257087e9 = "pitch";
	}
	/#
		assert(isdefined(var_257087e9) == 1);
	#/
	self.var_aceb47b0.threads[var_257087e9] = 1;
	self endon("snd_stop_scale_" + var_257087e9);
	while(var_5bd40646 < timems && isdefined(self) == 1 && isdefined(self.var_aceb47b0.threads[var_257087e9]) == 1)
	{
		remainingtime = (timems - var_5bd40646) * 0.001;
		if(isdefined(self.var_aceb47b0.waitinterval) == 1)
		{
			timeinterval = max(self.var_aceb47b0.waitinterval, frametime);
		}
		waittime = min(timeinterval, remainingtime);
		var_5bd40646 = var_5bd40646 + (int((waittime * 1000) + 0.5));
		timefrac = float(var_5bd40646) / float(timems);
		var_91b884ae = 1;
		if(var_71659f7c > 0)
		{
			timefrac = math::clamp(1 - timefrac, 0, 1);
			var_642b24ce = function_b918d683(timefrac, curve);
			var_91b884ae = lerpfloat(scale, var_45dc, var_642b24ce);
		}
		else
		{
			var_642b24ce = function_b918d683(timefrac, curve);
			var_91b884ae = lerpfloat(var_45dc, scale, var_642b24ce);
		}
		/#
		#/
		[[var_9cecf99a]](self, var_91b884ae, waittime);
		wait(waittime);
		if(isdefined(self) == 1 && function_3132f113(self) == 0)
		{
			function_d72fc2b9(self, var_91b884ae, var_9cecf99a);
		}
	}
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self) == 1)
	{
		self notify(#"hash_2178ab9046055607", var_9cecf99a);
	}
	if(isdefined(callbackfunc) == 1)
	{
		self [[callbackfunc]]();
	}
}

/*
	Name: function_f2a84378
	Namespace: snd
	Checksum: 0x7E2DC04F
	Offset: 0x2DE8
	Size: 0xAA
	Parameters: 2
	Flags: None
*/
function function_f2a84378(var_afe43979, waitinterval)
{
	/#
		assert(isdefined(var_afe43979) == 1);
	#/
	function_3323ac64(var_afe43979);
	/#
		assert(isdefined(var_afe43979.var_aceb47b0) == 1);
	#/
	var_afe43979.var_aceb47b0.waitinterval = max(waitinterval, function_6cfa7975());
}

/*
	Name: function_5db87276
	Namespace: snd
	Checksum: 0xCFE3EC13
	Offset: 0x2EA0
	Size: 0x478
	Parameters: 6
	Flags: None
*/
function function_5db87276(var_afe43979, var_a31cb1fb, value, time, curve, callbackfunc)
{
	var_43b6ef7d = 0.00390625;
	var_16f452ed = 2;
	var_7a9a68cb = 0;
	var_69111be2 = 4;
	if(function_81fac19d(isdefined(var_afe43979) == 0, "snd_scale: called on undefined entity"))
	{
		return;
	}
	if(function_81fac19d(function_3132f113(var_afe43979) == 1, "snd_scale: called on removed entity"))
	{
		return;
	}
	/#
		assert(isdefined(var_afe43979) == 1, "");
	#/
	/#
		assert(function_3132f113(var_afe43979) == 0, "");
	#/
	/#
		assert(isdefined(value) == 1);
	#/
	function_3323ac64(var_afe43979);
	var_e127d44f = value;
	var_9cecf99a = undefined;
	var_257087e9 = undefined;
	switch(var_a31cb1fb)
	{
		case "volume":
		case "volume":
		case "v":
		case "v":
		case "vol":
		case "vol":
		{
			curve = function_ea2f17d1(curve, "easeout");
			var_9cecf99a = &function_5803da43;
			var_257087e9 = "volume";
			var_e127d44f = math::clamp(value, var_7a9a68cb, var_69111be2);
			function_81fac19d(value != var_e127d44f, ("snd_scale: clamped volume " + value) + (" -> ") + var_e127d44f);
			break;
		}
		case "p":
		case "p":
		case "pitch":
		case "pitch":
		{
			curve = function_ea2f17d1(curve, "linear");
			var_9cecf99a = &function_d7b79aea;
			var_257087e9 = "pitch";
			var_e127d44f = math::clamp(value, var_43b6ef7d, var_16f452ed);
			function_81fac19d(value != var_e127d44f, ("snd_scale: clamped pitch " + value) + (" -> ") + var_e127d44f);
			break;
		}
	}
	/#
		assert(isdefined(var_afe43979) == 1);
	#/
	if(isdefined(time) == 0 || time == 0)
	{
		[[var_9cecf99a]](var_afe43979, var_e127d44f, 0);
		function_d72fc2b9(var_afe43979, var_e127d44f, var_9cecf99a);
		var_afe43979 notify(#"hash_2178ab9046055607", var_9cecf99a);
		var_afe43979 notify(#"hash_6e1c0f8335cc603c");
		var_afe43979 notify("snd_stop_scale_" + var_257087e9);
		return;
	}
	var_afe43979 thread function_48e190dd(curve, var_e127d44f, time, var_9cecf99a, callbackfunc);
	if(var_9cecf99a == (&function_5803da43))
	{
		var_afe43979 notify(#"hash_501fa67f084af993");
	}
}

/*
	Name: function_a43df3ac
	Namespace: snd
	Checksum: 0x1B57FD5F
	Offset: 0x3320
	Size: 0x54
	Parameters: 5
	Flags: None
*/
function function_a43df3ac(var_afe43979, volume, time, curve, callbackfunc)
{
	function_5db87276(var_afe43979, "volume", volume, time, curve, callbackfunc);
}

/*
	Name: function_679011ab
	Namespace: snd
	Checksum: 0xD105A062
	Offset: 0x3380
	Size: 0x54
	Parameters: 5
	Flags: None
*/
function function_679011ab(var_afe43979, pitch, time, curve, callbackfunc)
{
	function_5db87276(var_afe43979, "pitch", pitch, time, curve, callbackfunc);
}

/*
	Name: function_7308d4d0
	Namespace: snd
	Checksum: 0xD393D910
	Offset: 0x33E0
	Size: 0xBA
	Parameters: 1
	Flags: None
*/
function function_7308d4d0(var_afe43979)
{
	if(function_81fac19d(isdefined(var_afe43979) == 0, "snd_scale: called on undefined entity"))
	{
		return 0;
	}
	if(function_81fac19d(function_3132f113(var_afe43979) == 1, "snd_scale: called on removed entity"))
	{
		return 0;
	}
	/#
		assert(isdefined(var_afe43979) == 1);
	#/
	return function_2530f85d(var_afe43979, &function_5803da43);
}

/*
	Name: function_6f94855d
	Namespace: snd
	Checksum: 0xD1BFE69
	Offset: 0x34A8
	Size: 0xBA
	Parameters: 1
	Flags: None
*/
function function_6f94855d(var_afe43979)
{
	if(function_81fac19d(isdefined(var_afe43979) == 0, "snd_scale: called on undefined entity"))
	{
		return 0;
	}
	if(function_81fac19d(function_3132f113(var_afe43979) == 1, "snd_scale: called on removed entity"))
	{
		return 0;
	}
	/#
		assert(isdefined(var_afe43979) == 1);
	#/
	return function_2530f85d(var_afe43979, &function_d7b79aea);
}

/*
	Name: function_959bbfdb
	Namespace: snd
	Checksum: 0xC408E3B6
	Offset: 0x3570
	Size: 0x32
	Parameters: 0
	Flags: Private
*/
function private function_959bbfdb()
{
	player = self;
	vieworigin = player getcampos();
	return vieworigin;
}

/*
	Name: function_2c0c5fbc
	Namespace: snd
	Checksum: 0xBDB13048
	Offset: 0x35B0
	Size: 0x32
	Parameters: 0
	Flags: Private
*/
function private function_2c0c5fbc()
{
	player = self;
	viewangles = player getcamangles();
	return viewangles;
}

/*
	Name: function_bf76eea3
	Namespace: snd
	Checksum: 0x21EF1474
	Offset: 0x35F0
	Size: 0x32
	Parameters: 0
	Flags: Private
*/
function private function_bf76eea3()
{
	player = self;
	fov = player function_9169401e();
	return fov;
}

/*
	Name: function_360bb421
	Namespace: snd
	Checksum: 0x5DF997D8
	Offset: 0x3630
	Size: 0x314
	Parameters: 2
	Flags: Private
*/
function private function_360bb421(key, value)
{
	/#
		values = strtok(value, "");
		if(isarray(values) && values.size > 0)
		{
			var_864d2972 = values[0];
			var_83833f = function_ea2f17d1(values[1], "");
			var_23614cc2 = function_ea2f17d1(values[2], 0);
			if(key == "")
			{
				iprintlnbold((((("" + "") + var_864d2972) + "") + var_83833f) + "");
				setsoundcontext(var_864d2972, var_83833f);
			}
			else
			{
				if(key == "")
				{
					iprintlnbold((((("" + "") + var_864d2972) + "") + var_83833f) + "");
					foreach(player in function_2b2b83dc())
					{
						player setsoundentcontext(var_864d2972, var_83833f);
					}
				}
				else if(key == "")
				{
					iprintlnbold((((("" + "") + var_864d2972) + "") + var_83833f) + "");
					foreach(ent in getentarray(0))
					{
						ent setsoundentcontext(var_864d2972, var_83833f);
					}
				}
			}
		}
		return value;
	#/
}

