#using script_6b979561d0e05f38;
#using script_85cd2e9a28ea8a1;
#using script_198f1b397865a5ad;
#using script_5552bd756afee443;
#using script_3dc93ca9902a9cda;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace snd;

/*
	Name: function_4047919b
	Namespace: snd
	Checksum: 0x3ED5D77D
	Offset: 0x280
	Size: 0x19A
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_4047919b()
{
	if(!isdefined(level._snd))
	{
		level._snd = spawnstruct();
		level._snd.var_2dd09170 = 1;
		level._snd._callbacks = [];
		level._snd.var_3cc765a3 = [];
		level._snd.var_92f63ad0 = [];
		level._snd.var_d37e94ca = #"hash_72d0c119f969b755";
		level._snd.var_90903fc0 = 0;
		level._snd._callbacks[#"player_view"] = &function_9d361345;
		level._snd._callbacks[#"player_angles"] = &function_d33afb70;
		level._snd._callbacks[#"player_fov"] = &function_51436f04;
	}
	util::registerclientsys("clientSoundCommand");
	function_3ffa0089();
	/#
		function_ce893a25();
	#/
	waittillframeend();
	level._snd.var_a203d643 = 1;
}

/*
	Name: function_7db65a93
	Namespace: snd
	Checksum: 0xBE5ECAB2
	Offset: 0x428
	Size: 0x248
	Parameters: 2
	Flags: None
*/
function function_7db65a93(msg, players)
{
	var_9077d19c = isstring(msg) && msg.size > 0 || ishash(msg);
	if(function_81fac19d(!var_9077d19c, "snd_client_msg must be a string or hash"))
	{
		return;
	}
	/#
		assert(var_9077d19c);
	#/
	state = "";
	if(ishash(msg))
	{
		state = "# " + msg;
	}
	else if(isstring(msg))
	{
		if(function_81fac19d(msg.size > 16, ("snd: client_msg > 16 chars ") + function_783b69(msg, "'")))
		{
			/#
				if(function_f984063f())
				{
					debugbreak();
				}
			#/
		}
		state = "M " + msg;
	}
	players = function_ea2f17d1(players, function_2b2b83dc());
	foreach(player in function_f218bff5(players))
	{
		util::setclientsysstate("clientSoundCommand", state, player);
	}
}

/*
	Name: function_b23661d5
	Namespace: snd
	Checksum: 0x437E8B2A
	Offset: 0x678
	Size: 0x1C8
	Parameters: 2
	Flags: None
*/
function function_b23661d5(ent, targetname)
{
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
	players = function_2b2b83dc();
	foreach(player in players)
	{
		util::setclientsysstate("clientSoundCommand", state, player);
	}
}

/*
	Name: function_eaf46c57
	Namespace: snd
	Checksum: 0x55CB806E
	Offset: 0x848
	Size: 0x21C
	Parameters: 2
	Flags: None
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
	players = function_2b2b83dc();
	if(var_3dd9dcff)
	{
		state = state + (" " + soundalias);
	}
	foreach(player in players)
	{
		util::setclientsysstate("clientSoundCommand", state, player);
	}
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
	Checksum: 0x3145D862
	Offset: 0xA70
	Size: 0x188
	Parameters: 4
	Flags: None
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
		level._snd.var_92f63ad0[ent.soundkey] = ent;
	}
}

/*
	Name: function_85daf9f0
	Namespace: namespace_afa8e18b
	Checksum: 0x60C798
	Offset: 0xC00
	Size: 0x206
	Parameters: 4
	Flags: None
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
		ent setmodel("tag_origin");
	}
	else
	{
		ent = spawn("script_origin", spawnorigin);
	}
	/#
		assert(isdefined(ent), "");
	#/
	ent.var_90c86b97 = var_605838f4;
	ent.soundtype = #"hash_72d0c119f969b755";
	ent.soundkey = ent getentitynumber();
	ent.targetname = "snd " + soundalias;
	return ent;
}

/*
	Name: function_6ac5b570
	Namespace: namespace_afa8e18b
	Checksum: 0xF101570F
	Offset: 0xE10
	Size: 0x174
	Parameters: 1
	Flags: None
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
			level._snd.var_92f63ad0[ent.soundkey] = undefined;
		}
		waittillframeend();
		ent delete();
	}
}

/*
	Name: function_2dde45d9
	Namespace: namespace_afa8e18b
	Checksum: 0xC1C4BD7B
	Offset: 0xF90
	Size: 0x312
	Parameters: 4
	Flags: None
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
			if(isdefined(ent.var_90c86b97) && isdefined(level._snd.var_c7f0039))
			{
				waitframe(1);
				ent [[level._snd.var_c7f0039]](soundalias);
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
	Checksum: 0x552351C4
	Offset: 0x12B0
	Size: 0x19C
	Parameters: 2
	Flags: None
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
	Checksum: 0x60181DB9
	Offset: 0x1458
	Size: 0xA4
	Parameters: 2
	Flags: Private
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
	Checksum: 0x771E09E5
	Offset: 0x1508
	Size: 0x64
	Parameters: 1
	Flags: Private
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
	Checksum: 0x5522A8D3
	Offset: 0x1578
	Size: 0x44
	Parameters: 4
	Flags: None
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
	Checksum: 0x909BDB11
	Offset: 0x15C8
	Size: 0x46
	Parameters: 4
	Flags: None
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
	Checksum: 0x205CCF58
	Offset: 0x1618
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
	Checksum: 0xDB368129
	Offset: 0x1650
	Size: 0x44
	Parameters: 4
	Flags: None
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
	Checksum: 0x827D6270
	Offset: 0x16A0
	Size: 0x34
	Parameters: 2
	Flags: None
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
	Checksum: 0x31B64248
	Offset: 0x16E0
	Size: 0x32
	Parameters: 0
	Flags: Private
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
	Checksum: 0x6250B039
	Offset: 0x1720
	Size: 0x32
	Parameters: 0
	Flags: Private
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
	Checksum: 0x5EE51366
	Offset: 0x1760
	Size: 0x42
	Parameters: 0
	Flags: Private
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
	Checksum: 0x7CD7B554
	Offset: 0x17B0
	Size: 0x34
	Parameters: 1
	Flags: Private
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
	Checksum: 0x8344BC25
	Offset: 0x17F0
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
	Checksum: 0x42941BA2
	Offset: 0x1920
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
	Checksum: 0x24514425
	Offset: 0x1970
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
	Checksum: 0x84EB3FE3
	Offset: 0x1A40
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_4264ab7c(soundalias)
{
	ent = function_7f94241b(self);
	function_eaf46c57(ent);
}

