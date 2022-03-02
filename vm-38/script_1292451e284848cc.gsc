#using script_198f1b397865a5ad;
#using script_3dc93ca9902a9cda;
#using script_5552bd756afee443;
#using script_6b979561d0e05f38;
#using script_85cd2e9a28ea8a1;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace snd;

/*
	Name: function_d09f6d78
	Namespace: snd
	Checksum: 0xE1975939
	Offset: 0x340
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d09f6d78()
{
	level notify(1945196525);
}

/*
	Name: function_4047919b
	Namespace: snd
	Checksum: 0xA8A981FC
	Offset: 0x360
	Size: 0x25A
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_4047919b()
{
	if(!isdefined(level.var_17e6189d))
	{
		level.var_17e6189d = spawnstruct();
		level.var_17e6189d.var_2dd09170 = 1;
		level.var_17e6189d._callbacks = [];
		level.var_17e6189d.var_3cc765a3 = [];
		level.var_17e6189d.var_92f63ad0 = [];
		level.var_17e6189d.var_d37e94ca = #"hash_72d0c119f969b755";
		level.var_17e6189d.var_90903fc0 = 0;
		level.var_17e6189d._callbacks[#"player_view"] = &function_9d361345;
		level.var_17e6189d._callbacks[#"player_angles"] = &function_d33afb70;
		level.var_17e6189d._callbacks[#"player_fov"] = &function_51436f04;
	}
	util::registerclientsys("clientSoundCommand");
	clientfield::register("actor", "clientFieldSndTargetActor", 1, 11, "int");
	clientfield::register("allplayers", "clientFieldSndTargetPlayer", 1, 11, "int");
	clientfield::register("vehicle", "clientFieldSndTargetVehicle", 1, 11, "int");
	clientfield::register("scriptmover", "clientFieldSndTargetScriptMover", 1, 11, "int");
	function_3ffa0089();
	/#
		level thread function_ce893a25();
	#/
	waittillframeend();
	level.var_17e6189d.var_a203d643 = 1;
}

/*
	Name: function_7db65a93
	Namespace: snd
	Checksum: 0xF18EC1BE
	Offset: 0x5C8
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_7db65a93(msg, players)
{
	level thread function_a74b8be1(msg, players);
}

/*
	Name: function_a74b8be1
	Namespace: snd
	Checksum: 0xC2F3B3DD
	Offset: 0x608
	Size: 0x1AC
	Parameters: 2
	Flags: Linked
*/
function function_a74b8be1(msg, players)
{
	waitforplayers();
	var_9077d19c = isstring(players) && players.size > 0 || function_7a600918(players);
	if(function_81fac19d(!var_9077d19c, "snd_client_msg must be a string or hash"))
	{
		return;
	}
	/#
		assert(var_9077d19c);
	#/
	state = "";
	if(function_7a600918(players))
	{
		state = "# " + players;
	}
	else if(isstring(players))
	{
		if(function_81fac19d(players.size > 16, ("snd: client_msg > 16 chars ") + function_783b69(players, "'")))
		{
			/#
				if(function_f984063f())
				{
					debugbreak();
				}
			#/
		}
		state = "M " + players;
	}
	util::setclientsysstate("clientSoundCommand", state);
}

/*
	Name: function_b23661d5
	Namespace: snd
	Checksum: 0xD19ADAFD
	Offset: 0x7C0
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_b23661d5(ent, targetname)
{
	level thread function_5018393e(ent, targetname);
}

/*
	Name: function_5018393e
	Namespace: snd
	Checksum: 0xDF0C5637
	Offset: 0x800
	Size: 0x1A4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5018393e(ent, targetname)
{
	waitforplayers();
	var_4ddd6e88 = isentity(ent);
	if(function_81fac19d(!var_4ddd6e88, "snd_client_targetname is not an entity"))
	{
		return;
	}
	/#
		assert(var_4ddd6e88);
	#/
	targetname = function_ea2f17d1(targetname, ent.targetname);
	if(function_81fac19d(!isdefined(targetname), "snd_client_targetname targetname is undefined"))
	{
		return;
	}
	/#
		assert(isdefined(targetname));
	#/
	entitynumber = ent getentitynumber();
	state = (("T " + entitynumber) + " ") + targetname;
	fieldname = function_9d83cae7(ent);
	util::setclientsysstate("clientSoundCommand", state);
	ent clientfield::set(fieldname, entitynumber);
	level thread function_b2f22cd6(ent, state, fieldname);
}

/*
	Name: function_9d83cae7
	Namespace: snd
	Checksum: 0xDB74EA88
	Offset: 0x9B0
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9d83cae7(ent)
{
	fieldname = "clientFieldSndTargetScriptMover";
	if(isactor(ent))
	{
		fieldname = "clientFieldSndTargetActor";
	}
	else
	{
		if(isplayer(ent))
		{
			fieldname = "clientFieldSndTargetPlayer";
		}
		else
		{
			if(isvehicle(ent))
			{
				fieldname = "clientFieldSndTargetVehicle";
			}
			else
			{
				fieldname = "clientFieldSndTargetScriptMover";
			}
		}
	}
	return fieldname;
}

/*
	Name: function_b2f22cd6
	Namespace: snd
	Checksum: 0x217FCAEB
	Offset: 0xA60
	Size: 0xD4
	Parameters: 4
	Flags: Linked, Private
*/
function private function_b2f22cd6(ent, state, fieldname, var_792fc52c)
{
	/#
		assert(isstring(state));
	#/
	/#
		assert(isstring(fieldname));
	#/
	var_792fc52c = function_ea2f17d1(var_792fc52c, 3);
	wait(var_792fc52c);
	if(isdefined(ent))
	{
		util::setclientsysstate("clientSoundCommand", state);
		ent clientfield::set(fieldname, 0);
	}
}

/*
	Name: function_eaf46c57
	Namespace: snd
	Checksum: 0x673941B1
	Offset: 0xB40
	Size: 0x194
	Parameters: 2
	Flags: Linked
*/
function function_eaf46c57(ent, soundalias)
{
	var_4ddd6e88 = isentity(ent);
	if(function_81fac19d(!var_4ddd6e88, "snd client_vo was not given an entity"))
	{
		return 0;
	}
	/#
		assert(var_4ddd6e88);
	#/
	var_3dd9dcff = soundexists(soundalias);
	if(function_81fac19d(isdefined(soundalias) && !var_3dd9dcff, "snd client_vo alias does not exist: " + soundalias))
	{
		return 0;
	}
	entitynumber = ent getentitynumber();
	state = "V " + entitynumber;
	if(var_3dd9dcff)
	{
		state = state + (" " + soundalias);
	}
	util::setclientsysstate("clientSoundCommand", state);
	waittime = 0;
	if(var_3dd9dcff)
	{
		waittime = soundgetplaybacktime(soundalias);
		waittime = waittime / 1000;
	}
	return waittime;
}

#namespace namespace_afa8e18b;

/*
	Name: function_b5959278
	Namespace: namespace_afa8e18b
	Checksum: 0x2DF6CE2
	Offset: 0xCE0
	Size: 0x188
	Parameters: 4
	Flags: Linked
*/
function function_b5959278(ent, var_1d25915, var_605838f4, var_e330010e)
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
		if(var_e330010e == "tag_origin")
		{
			var_e330010e = "";
		}
		ent enablelinkto();
		ent linkto(var_605838f4, var_e330010e, var_386560b8, var_f1088ee4);
		if(!isarray(var_605838f4.var_a415b6d6))
		{
			var_605838f4.var_a415b6d6 = [];
		}
		var_605838f4.var_a415b6d6[ent.soundkey] = ent;
	}
	else
	{
		level.var_17e6189d.var_92f63ad0[ent.soundkey] = ent;
	}
}

/*
	Name: function_85daf9f0
	Namespace: namespace_afa8e18b
	Checksum: 0xC1CBD763
	Offset: 0xE70
	Size: 0x236
	Parameters: 4
	Flags: Linked
*/
function function_85daf9f0(soundalias, var_1d25915, var_605838f4, var_e330010e)
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
	/#
		assert(isdefined(spawnorigin));
	#/
	ent = undefined;
	if(isdefined(var_605838f4))
	{
		ent = spawn("script_model", spawnorigin);
		if(isentity(ent))
		{
			ent setmodel("tag_origin");
		}
	}
	else
	{
		ent = spawn("script_origin", spawnorigin);
	}
	/#
		assert(isdefined(ent), "");
	#/
	if(isentity(ent))
	{
		ent.var_90c86b97 = var_605838f4;
		ent.soundtype = #"hash_72d0c119f969b755";
		ent.soundkey = ent getentitynumber();
		ent.targetname = "snd " + soundalias;
	}
	return ent;
}

/*
	Name: function_6ac5b570
	Namespace: namespace_afa8e18b
	Checksum: 0xF8F0C9DC
	Offset: 0x10B0
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function function_6ac5b570(ent)
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
			level.var_17e6189d.var_92f63ad0[ent.soundkey] = undefined;
		}
		waittillframeend();
		ent delete();
	}
}

/*
	Name: function_2dde45d9
	Namespace: namespace_afa8e18b
	Checksum: 0xCF51D0AB
	Offset: 0x1230
	Size: 0x312
	Parameters: 4
	Flags: Linked
*/
function function_2dde45d9(var_afe43979, soundalias, var_99e65ecf, delaytime)
{
	ent = var_afe43979;
	var_fe3be304 = undefined;
	ent endon(#"death");
	/#
		assert(isdefined(ent));
	#/
	/#
		assert(isstring(soundalias));
	#/
	var_fe3be304 = snd::function_92d3587(ent);
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
	/#
		assert(soundexists(soundalias), "" + soundalias);
	#/
	if(soundislooping(soundalias) == 1)
	{
		ent playloopsound(soundalias);
	}
	else
	{
		var_42be2e20 = "sounddone";
		if(sessionmodeiscampaigngame())
		{
			ent playsound(soundalias);
			var_ef1f34f = 1;
			if(var_ef1f34f)
			{
				ent thread function_94954510(soundalias, var_42be2e20);
			}
			else
			{
				ent thread function_bd8d70b0(var_42be2e20);
			}
		}
		else
		{
			if(isdefined(ent.var_90c86b97) && isdefined(level.var_17e6189d.var_c7f0039))
			{
				waitframe(1);
				ent [[level.var_17e6189d.var_c7f0039]](soundalias);
			}
			else
			{
				ent playsound(soundalias);
			}
			ent thread function_94954510(soundalias, var_42be2e20);
		}
	}
	ent.soundalias = soundalias;
}

/*
	Name: function_9f156b27
	Namespace: namespace_afa8e18b
	Checksum: 0xBED162B8
	Offset: 0x1550
	Size: 0x19C
	Parameters: 2
	Flags: Linked
*/
function function_9f156b27(var_afe43979, var_24ea4e17)
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
		var_24ea4e17 = snd::function_ea2f17d1(var_24ea4e17, 0);
		if(isstring(soundalias))
		{
			if(is_true(soundislooping(soundalias)))
			{
				ent stoploopsound(var_24ea4e17);
			}
			else
			{
				ent stopsounds();
				ent stopsound(ent.soundalias);
			}
			waitframe(1);
			ent.soundalias = undefined;
		}
		ent.soundtype = undefined;
		function_6ac5b570(ent);
	}
}

/*
	Name: function_94954510
	Namespace: namespace_afa8e18b
	Checksum: 0x668C523E
	Offset: 0x16F8
	Size: 0xA4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_94954510(soundalias, done)
{
	ent = self;
	ent endon(#"death");
	waittime = soundgetplaybacktime(soundalias);
	waittime = waittime + 250;
	waittime = waittime / 1000;
	wait(waittime);
	ent notify(done, ent.soundalias);
	function_6ac5b570(ent);
}

/*
	Name: function_bd8d70b0
	Namespace: namespace_afa8e18b
	Checksum: 0xF8C00C11
	Offset: 0x17A8
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bd8d70b0(done)
{
	ent = self;
	ent endon(#"death");
	ent waittill(done);
	ent notify(done, ent.soundalias);
	function_6ac5b570(ent);
}

/*
	Name: function_2761fc04
	Namespace: namespace_afa8e18b
	Checksum: 0x830690B0
	Offset: 0x1818
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function function_2761fc04(ent, var_1d25915, var_605838f4, var_e330010e)
{
	/#
		assert(0, "");
	#/
}

/*
	Name: function_5275752c
	Namespace: namespace_afa8e18b
	Checksum: 0xB6D987F
	Offset: 0x1868
	Size: 0x46
	Parameters: 4
	Flags: Linked
*/
function function_5275752c(soundalias, var_1d25915, var_605838f4, var_e330010e)
{
	/#
		assert(0, "");
	#/
	return undefined;
}

/*
	Name: function_bdc44456
	Namespace: namespace_afa8e18b
	Checksum: 0x9ABCDF92
	Offset: 0x18B8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_bdc44456(ent)
{
	/#
		assert(0, "");
	#/
}

/*
	Name: function_bb749fc3
	Namespace: namespace_afa8e18b
	Checksum: 0x43729F9E
	Offset: 0x18F0
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function function_bb749fc3(var_afe43979, soundalias, var_99e65ecf, delaytime)
{
	/#
		assert(0, "");
	#/
}

/*
	Name: function_273d939b
	Namespace: namespace_afa8e18b
	Checksum: 0x13F2D605
	Offset: 0x1940
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_273d939b(var_afe43979, var_24ea4e17)
{
	/#
		assert(0, "");
	#/
}

#namespace snd;

/*
	Name: function_9d361345
	Namespace: snd
	Checksum: 0x5F971630
	Offset: 0x1980
	Size: 0x32
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9d361345()
{
	player = self;
	vieworigin = player getplayercamerapos();
	return vieworigin;
}

/*
	Name: function_d33afb70
	Namespace: snd
	Checksum: 0x10A9F94D
	Offset: 0x19C0
	Size: 0x32
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d33afb70()
{
	player = self;
	viewangles = player getplayerangles();
	return viewangles;
}

/*
	Name: function_51436f04
	Namespace: snd
	Checksum: 0x689DA006
	Offset: 0x1A00
	Size: 0x42
	Parameters: 0
	Flags: Linked, Private
*/
function private function_51436f04()
{
	player = self;
	fov = getdvarfloat(#"cg_fov", 65);
	return fov;
}

/*
	Name: function_7f94241b
	Namespace: snd
	Checksum: 0xEDF053DE
	Offset: 0x1A50
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7f94241b(ent)
{
	if(ent == level)
	{
		ent = function_da785aa8()[0];
	}
	return ent;
}

/*
	Name: function_13246855
	Namespace: snd
	Checksum: 0xD8ED1A2B
	Offset: 0x1A90
	Size: 0x126
	Parameters: 3
	Flags: None
*/
function function_13246855(soundalias, notifystring, player_or_team)
{
	ent = function_7f94241b(self);
	if(!isentity(ent) || (issentient(ent) && !isalive(ent)))
	{
		return;
	}
	ent endon(#"death");
	snd = play(notifystring, [1:"j_head", 0:ent]);
	function_f4f3a2a(snd, ent);
	if(isdefined(player_or_team))
	{
		function_2fdc4fb(snd);
		ent notify(player_or_team);
	}
}

/*
	Name: function_fb9b8ef4
	Namespace: snd
	Checksum: 0xA8C2EB34
	Offset: 0x1BC0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_fb9b8ef4(soundalias)
{
	ent = function_7f94241b(self);
	function_1ac5032(soundalias, ent);
}

/*
	Name: function_aeea7f5e
	Namespace: snd
	Checksum: 0x4A80FF69
	Offset: 0x1C10
	Size: 0xC4
	Parameters: 3
	Flags: None
*/
function function_aeea7f5e(soundalias, notifystring, player_or_team)
{
	ent = function_7f94241b(self);
	if(!isentity(ent) || (issentient(ent) && !isalive(ent)))
	{
		return;
	}
	waittime = function_eaf46c57(ent, notifystring);
	if(isdefined(player_or_team))
	{
		wait(waittime);
		self notify(player_or_team);
	}
}

/*
	Name: function_4264ab7c
	Namespace: snd
	Checksum: 0xFA45C263
	Offset: 0x1CE0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_4264ab7c(soundalias)
{
	ent = function_7f94241b(self);
	function_eaf46c57(ent);
}

