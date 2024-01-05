#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\trigger_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using script_59f62971655f7103;
#using scripts\core_common\battlechatter.csc;
#using scripts\core_common\array_shared.csc;

#namespace audio_shared;

/*
	Name: function_a239a68f
	Namespace: audio_shared
	Checksum: 0x6E0F1959
	Offset: 0x5C8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a239a68f()
{
	level notify(2100223550);
}

#namespace audio;

/*
	Name: __init__system__
	Namespace: audio
	Checksum: 0x3613576
	Offset: 0x5E8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"audio", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: audio
	Checksum: 0xAF48A5A6
	Offset: 0x630
	Size: 0x184
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	snd_snapshot_init();
	callback::on_localclient_connect(&player_init);
	callback::on_localplayer_spawned(&local_player_spawn);
	callback::on_localplayer_spawned(&sndsprintbreath);
	callback::on_localplayer_spawned(&function_aa906715);
	callback::function_2870abef(&function_45e99595);
	callback::function_b27200db(&function_bc0a8bd8);
	level thread register_clientfields();
	level thread sndkillcam();
	setsoundcontext("plr_impact", "flesh");
	util::register_system(#"duckcmd", &function_c037c7cd);
	level.var_4fe1773a = getdvarint(#"hash_287dc342cd15a144", 1);
}

/*
	Name: function_d3790fe
	Namespace: audio
	Checksum: 0xC128509C
	Offset: 0x7C0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_d3790fe()
{
	function_62ff8d93(1);
	level.var_4fe1773a = 1;
}

/*
	Name: function_21f8b7c3
	Namespace: audio
	Checksum: 0x7192FAC6
	Offset: 0x7F8
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_21f8b7c3()
{
	function_62ff8d93(0);
	level.var_4fe1773a = 0;
}

/*
	Name: function_843dc46a
	Namespace: audio
	Checksum: 0x500D2454
	Offset: 0x828
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_843dc46a()
{
	setdvar(#"hash_59c2aaedc958314d", 1);
}

/*
	Name: function_a022576e
	Namespace: audio
	Checksum: 0x12B3796D
	Offset: 0x860
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_a022576e()
{
	setdvar(#"hash_59c2aaedc958314d", 2);
}

/*
	Name: register_clientfields
	Namespace: audio
	Checksum: 0xE441BF0F
	Offset: 0x898
	Size: 0x43C
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("world", "sndMatchSnapshot", 1, 2, "int", &sndmatchsnapshot, 1, 0);
	clientfield::register("scriptmover", "sndRattle", 1, 1, "counter", &sndrattle_server, 1, 0);
	clientfield::register("allplayers", "sndRattle", 1, 1, "counter", &sndrattle_server, 1, 0);
	clientfield::register("toplayer", "sndMelee", 1, 1, "int", &weapon_butt_sounds, 1, 1);
	clientfield::register("vehicle", "sndSwitchVehicleContext", 1, 3, "int", &sndswitchvehiclecontext, 0, 0);
	clientfield::register("toplayer", "sndCCHacking", 1, 2, "int", &sndcchacking, 1, 1);
	clientfield::register("toplayer", "sndTacRig", 1, 1, "int", &sndtacrig, 0, 1);
	clientfield::register("toplayer", "sndLevelStartSnapOff", 1, 1, "int", &sndlevelstartsnapoff, 0, 1);
	clientfield::register("world", "sndIGCsnapshot", 1, 4, "int", &sndigcsnapshot, 1, 0);
	clientfield::register("world", "sndChyronLoop", 1, 1, "int", &sndchyronloop, 0, 0);
	clientfield::register("world", "sndZMBFadeIn", 1, 1, "int", &sndzmbfadein, 1, 0);
	clientfield::register("world", "sndDeactivateSquadSpawnMusic", 1, 1, "int", &snddeactivatesquadspawnmusic, 0, 0);
	clientfield::register("toplayer", "sndVehicleDamageAlarm", 1, 1, "counter", &sndvehicledamagealarm, 0, 0);
	clientfield::register("toplayer", "sndCriticalHealth", 1, 1, "int", &sndcriticalhealth, 0, 1);
	clientfield::register("toplayer", "sndLastStand", 1, 1, "int", &sndlaststand, 0, 0);
}

/*
	Name: local_player_spawn
	Namespace: audio
	Checksum: 0x790EBA5B
	Offset: 0xCE0
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function local_player_spawn(localclientnum)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	if(!sessionmodeismultiplayergame() && !sessionmodeiswarzonegame())
	{
		self thread sndmusicdeathwatcher();
	}
	self thread snd_underwater(localclientnum);
	self thread clientvoicesetup(localclientnum);
}

/*
	Name: player_init
	Namespace: audio
	Checksum: 0xC87D9FAF
	Offset: 0xD88
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function player_init(localclientnum)
{
	if(issplitscreenhost(localclientnum))
	{
		level thread bump_trigger_start(localclientnum);
		level thread init_audio_triggers(localclientnum);
		startsoundrandoms(localclientnum);
		startsoundloops();
		startlineemitters();
		startrattles();
	}
}

/*
	Name: snddeactivatesquadspawnmusic
	Namespace: audio
	Checksum: 0x3108AB1D
	Offset: 0xE30
	Size: 0x54
	Parameters: 7
	Flags: Linked
*/
function snddeactivatesquadspawnmusic(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level.var_acf54eb7 = 1;
	}
}

/*
	Name: function_45e99595
	Namespace: audio
	Checksum: 0x1D45DDD0
	Offset: 0xE90
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_45e99595(localclientnum)
{
	if(!isdefined(self.var_ef6eb2d4))
	{
		self.var_ef6eb2d4 = self battlechatter::get_player_dialog_alias("exertMantLight");
	}
	if(isdefined(self.var_ef6eb2d4) && soundexists(self.var_ef6eb2d4))
	{
		self playsound(0, self.var_ef6eb2d4);
	}
}

/*
	Name: function_bc0a8bd8
	Namespace: audio
	Checksum: 0x8BA9B4A0
	Offset: 0xF20
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_bc0a8bd8(localclientnum)
{
	if(!isdefined(self.var_3991ee40))
	{
		self.var_3991ee40 = self battlechatter::get_player_dialog_alias("exertMantHeavy");
	}
	if(isdefined(self.var_3991ee40) && soundexists(self.var_3991ee40))
	{
		self playsound(0, self.var_3991ee40);
	}
}

/*
	Name: function_c037c7cd
	Namespace: audio
	Checksum: 0xD44C9520
	Offset: 0xFB0
	Size: 0x34
	Parameters: 3
	Flags: Linked
*/
function function_c037c7cd(clientnum, state, oldstate)
{
	snd_set_snapshot(oldstate);
}

/*
	Name: snddoublejump_watcher
	Namespace: audio
	Checksum: 0xC8B4A09D
	Offset: 0xFF0
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function snddoublejump_watcher()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"doublejump_start");
		trace = tracepoint(self.origin, self.origin - vectorscale((0, 0, 1), 100000));
		trace_surface_type = trace[#"surfacetype"];
		trace_origin = trace[#"position"];
		if(!isdefined(trace) || !isdefined(trace_origin))
		{
			continue;
		}
		if(!isdefined(trace_surface_type))
		{
			trace_surface_type = "default";
		}
		playsound(0, #"veh_jetpack_surface_" + trace_surface_type, trace_origin);
	}
}

/*
	Name: clientvoicesetup
	Namespace: audio
	Checksum: 0x839D52AF
	Offset: 0x1100
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function clientvoicesetup(localclientnum)
{
	self endon(#"death");
	if(isdefined(level.clientvoicesetup))
	{
		[[level.clientvoicesetup]](localclientnum);
		return;
	}
	self thread sndvonotify("playerbreathinsound", "exert_sniper_hold");
	self thread sndvonotify("playerbreathoutsound", "exert_sniper_exhale");
	self thread sndvonotify("playerbreathgaspsound", "exert_sniper_gasp");
}

/*
	Name: sndvonotify
	Namespace: audio
	Checksum: 0xDE0E80DB
	Offset: 0x11C8
	Size: 0xD8
	Parameters: 2
	Flags: Linked
*/
function sndvonotify(notifystring, dialog)
{
	self endon(#"death");
	for(;;)
	{
		self waittill(notifystring);
		if(!isdefined(self.voiceprefix))
		{
			bundle = self getmpdialogname();
			playerbundle = getscriptbundle(bundle);
			if(!isdefined(playerbundle.voiceprefix))
			{
				continue;
			}
			self.voiceprefix = playerbundle.voiceprefix;
		}
		soundalias = self.voiceprefix + dialog;
		self playsound(0, soundalias);
	}
}

/*
	Name: snd_snapshot_init
	Namespace: audio
	Checksum: 0xC1E9D905
	Offset: 0x12A8
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function snd_snapshot_init()
{
	level._sndactivesnapshot = "default";
	level._sndnextsnapshot = "default";
	if(!util::is_frontend_map())
	{
		if(sessionmodeiscampaigngame() && !function_22a92b8b() && !function_c9705ad4())
		{
			level._sndactivesnapshot = "cmn_level_start";
			level._sndnextsnapshot = "cmn_level_start";
			level thread sndlevelstartduck_shutoff();
		}
		if(sessionmodeiszombiesgame())
		{
			level._sndactivesnapshot = "zmb_game_start_nofade";
			level._sndnextsnapshot = "zmb_game_start_nofade";
		}
	}
	setgroupsnapshot(level._sndactivesnapshot);
	thread snd_snapshot_think();
}

/*
	Name: sndlevelstartduck_shutoff
	Namespace: audio
	Checksum: 0xD554663
	Offset: 0x13D0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function sndlevelstartduck_shutoff()
{
	level waittill(#"sndlevelstartduck_shutoff");
	snd_set_snapshot("default");
}

/*
	Name: function_22a92b8b
	Namespace: audio
	Checksum: 0x9CC386A8
	Offset: 0x1410
	Size: 0xFE
	Parameters: 0
	Flags: Linked
*/
function function_22a92b8b()
{
	ignore = 1;
	mapname = util::get_map_name();
	switch(mapname)
	{
		case "hash_15642edd0e4376f1":
		case "hash_5562580f1b903614":
		case "hash_65a6e39408662d48":
		case "hash_68bac554964f4148":
		case "hash_7bdf016123a0147b":
		{
			ignore = 0;
			break;
		}
	}
	gametype = hash(util::get_game_type());
	switch(gametype)
	{
		case "download":
		{
			ignore = 1;
			break;
		}
	}
	return ignore;
}

/*
	Name: function_c9705ad4
	Namespace: audio
	Checksum: 0x11DBF498
	Offset: 0x1518
	Size: 0x86
	Parameters: 0
	Flags: Linked
*/
function function_c9705ad4()
{
	ignore = 1;
	gametype = hash(util::get_game_type());
	switch(gametype)
	{
		case "coop":
		case "pvp":
		{
			ignore = 0;
			break;
		}
	}
	return ignore;
}

/*
	Name: snd_set_snapshot
	Namespace: audio
	Checksum: 0xC71EAD14
	Offset: 0x15A8
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function snd_set_snapshot(state)
{
	level._sndnextsnapshot = state;
	/#
		println(("" + state) + "");
	#/
	level notify(#"new_bus");
}

/*
	Name: snd_snapshot_think
	Namespace: audio
	Checksum: 0x50284580
	Offset: 0x1610
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function snd_snapshot_think()
{
	for(;;)
	{
		if(level._sndactivesnapshot == level._sndnextsnapshot)
		{
			level waittill(#"new_bus");
		}
		if(level._sndactivesnapshot == level._sndnextsnapshot)
		{
			continue;
		}
		/#
			assert(isdefined(level._sndnextsnapshot));
		#/
		/#
			assert(isdefined(level._sndactivesnapshot));
		#/
		setgroupsnapshot(level._sndnextsnapshot);
		level._sndactivesnapshot = level._sndnextsnapshot;
	}
}

/*
	Name: soundrandom_thread
	Namespace: audio
	Checksum: 0x2503BC3A
	Offset: 0x16E0
	Size: 0x210
	Parameters: 2
	Flags: Linked
*/
function soundrandom_thread(localclientnum, randsound)
{
	if(!isdefined(randsound.script_wait_min))
	{
		randsound.script_wait_min = 1;
	}
	if(!isdefined(randsound.script_wait_max))
	{
		randsound.script_wait_max = 3;
	}
	notify_name = undefined;
	if(isdefined(randsound.script_string))
	{
		notify_name = randsound.script_string;
	}
	if(!isdefined(notify_name) && isdefined(randsound.script_sound))
	{
		createsoundrandom(randsound.origin, randsound.script_sound, randsound.script_wait_min, randsound.script_wait_max);
		return;
	}
	randsound.playing = 1;
	if(isdefined(randsound.script_int))
	{
		randsound.playing = randsound.script_int != 0;
	}
	level thread soundrandom_notifywait(notify_name, randsound);
	while(true)
	{
		wait(randomfloatrange(randsound.script_wait_min, randsound.script_wait_max));
		if(isdefined(randsound.script_sound) && is_true(randsound.playing))
		{
			playsound(localclientnum, randsound.script_sound, randsound.origin);
		}
		/#
			if(getdvarint(#"debug_audio", 0) > 0)
			{
				print3d(randsound.origin, function_9e72a96(randsound.script_sound), vectorscale((0, 1, 0), 0.8), 1, 3, 45);
			}
		#/
	}
}

/*
	Name: soundrandom_notifywait
	Namespace: audio
	Checksum: 0x93764A29
	Offset: 0x18F8
	Size: 0x66
	Parameters: 2
	Flags: Linked
*/
function soundrandom_notifywait(notify_name, randsound)
{
	while(true)
	{
		level waittill(notify_name);
		if(is_true(randsound.playing))
		{
			randsound.playing = 0;
		}
		else
		{
			randsound.playing = 1;
		}
	}
}

/*
	Name: startsoundrandoms
	Namespace: audio
	Checksum: 0x36C242AE
	Offset: 0x1968
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function startsoundrandoms(localclientnum)
{
	level.randoms = struct::get_array("random", "script_label");
	if(isdefined(level.randoms) && level.randoms.size > 0)
	{
		nscriptthreadedrandoms = 0;
		for(i = 0; i < level.randoms.size; i++)
		{
			if(isdefined(level.randoms[i].script_scripted))
			{
				nscriptthreadedrandoms++;
			}
		}
		allocatesoundrandoms(level.randoms.size - nscriptthreadedrandoms);
		for(i = 0; i < level.randoms.size; i++)
		{
			level.randoms[i].angles = undefined;
			thread soundrandom_thread(localclientnum, level.randoms[i]);
		}
	}
}

/*
	Name: soundloopthink
	Namespace: audio
	Checksum: 0x94A56DDC
	Offset: 0x1AA8
	Size: 0x16A
	Parameters: 0
	Flags: Linked
*/
function soundloopthink()
{
	if(!isdefined(self.script_sound))
	{
		return;
	}
	if(!isdefined(self.origin))
	{
		return;
	}
	notifyname = "";
	/#
		assert(isdefined(notifyname));
	#/
	if(isdefined(self.script_string))
	{
		notifyname = self.script_string;
	}
	/#
		assert(isdefined(notifyname));
	#/
	started = 1;
	if(isdefined(self.script_int))
	{
		started = self.script_int != 0;
	}
	if(started)
	{
		soundloopemitter(self.script_sound, self.origin);
	}
	if(notifyname != "")
	{
		for(;;)
		{
			level waittill(notifyname);
			if(started)
			{
				soundstoploopemitter(self.script_sound, self.origin);
				self thread soundloopcheckpointrestore();
			}
			else
			{
				soundloopemitter(self.script_sound, self.origin);
			}
			started = !started;
		}
	}
}

/*
	Name: soundloopcheckpointrestore
	Namespace: audio
	Checksum: 0x995CBA03
	Offset: 0x1C20
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function soundloopcheckpointrestore()
{
	level waittill(#"save_restore");
	soundloopemitter(self.script_sound, self.origin);
}

/*
	Name: soundlinethink
	Namespace: audio
	Checksum: 0x8143927
	Offset: 0x1C68
	Size: 0x17A
	Parameters: 0
	Flags: Linked
*/
function soundlinethink()
{
	if(!isdefined(self.target))
	{
		return;
	}
	target = struct::get(self.target, "targetname");
	if(!isdefined(target))
	{
		return;
	}
	notifyname = "";
	if(isdefined(self.script_string))
	{
		notifyname = self.script_string;
	}
	started = 1;
	if(isdefined(self.script_int))
	{
		started = self.script_int != 0;
	}
	if(started)
	{
		soundlineemitter(self.script_sound, self.origin, target.origin);
	}
	if(notifyname != "")
	{
		for(;;)
		{
			level waittill(notifyname);
			if(started)
			{
				soundstoplineemitter(self.script_sound, self.origin, target.origin);
				self thread soundlinecheckpointrestore(target);
			}
			else
			{
				soundlineemitter(self.script_sound, self.origin, target.origin);
			}
			started = !started;
		}
	}
}

/*
	Name: soundlinecheckpointrestore
	Namespace: audio
	Checksum: 0x930923F7
	Offset: 0x1DF0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function soundlinecheckpointrestore(target)
{
	level waittill(#"save_restore");
	soundlineemitter(self.script_sound, self.origin, target.origin);
}

/*
	Name: startsoundloops
	Namespace: audio
	Checksum: 0xC43E1AF8
	Offset: 0x1E48
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function startsoundloops()
{
	level.loopers = struct::get_array("looper", "script_label");
	if(isdefined(level.loopers) && level.loopers.size > 0)
	{
		delay = 0;
		/#
			if(getdvarint(#"debug_audio", 0) > 0)
			{
				println(("" + level.loopers.size) + "");
			}
		#/
		for(i = 0; i < level.loopers.size; i++)
		{
			level.loopers[i].angles = undefined;
			level.loopers[i].script_label = undefined;
			level.loopers[i] thread soundloopthink();
			delay = delay + 1;
			if((delay % 20) == 0)
			{
				waitframe(1);
			}
		}
	}
	else
	{
		/#
			println("");
		#/
		if(getdvarint(#"debug_audio", 0) > 0)
		{
		}
	}
}

/*
	Name: startlineemitters
	Namespace: audio
	Checksum: 0xA9068132
	Offset: 0x1FF8
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function startlineemitters()
{
	level.lineemitters = struct::get_array("line_emitter", "script_label");
	if(isdefined(level.lineemitters) && level.lineemitters.size > 0)
	{
		delay = 0;
		/#
			if(getdvarint(#"debug_audio", 0) > 0)
			{
				println(("" + level.lineemitters.size) + "");
			}
		#/
		for(i = 0; i < level.lineemitters.size; i++)
		{
			level.lineemitters[i].angles = undefined;
			level.lineemitters[i].script_label = undefined;
			level.lineemitters[i] thread soundlinethink();
			delay = delay + 1;
			if((delay % 20) == 0)
			{
				waitframe(1);
			}
		}
	}
	else
	{
		/#
			println("");
		#/
		if(getdvarint(#"debug_audio", 0) > 0)
		{
		}
	}
}

/*
	Name: startrattles
	Namespace: audio
	Checksum: 0xB57D8BFB
	Offset: 0x21A8
	Size: 0x160
	Parameters: 0
	Flags: Linked
*/
function startrattles()
{
	rattles = struct::get_array("sound_rattle", "script_label");
	if(isdefined(rattles))
	{
		/#
			println(("" + rattles.size) + "");
		#/
		delay = 0;
		for(i = 0; i < rattles.size; i++)
		{
			soundrattlesetup(rattles[i].script_sound, rattles[i].origin);
			delay = delay + 1;
			if((delay % 20) == 0)
			{
				waitframe(1);
			}
		}
	}
	foreach(rattle in rattles)
	{
		rattle struct::delete();
	}
}

/*
	Name: init_audio_triggers
	Namespace: audio
	Checksum: 0x8F9E8130
	Offset: 0x2310
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function init_audio_triggers(localclientnum)
{
	util::waitforclient(localclientnum);
	steptrigs = getentarray(localclientnum, "audio_step_trigger", "targetname");
	materialtrigs = getentarray(localclientnum, "audio_material_trigger", "targetname");
	/#
		if(getdvarint(#"debug_audio", 0) > 0)
		{
			println(("" + steptrigs.size) + "");
			println(("" + materialtrigs.size) + "");
		}
	#/
	array::thread_all(steptrigs, &audio_step_trigger, localclientnum);
	array::thread_all(materialtrigs, &audio_material_trigger, localclientnum);
}

/*
	Name: audio_step_trigger
	Namespace: audio
	Checksum: 0xC8C6261E
	Offset: 0x2468
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function audio_step_trigger(localclientnum)
{
	var_887fc615 = self getentitynumber();
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		if(!waitresult.activator trigger::ent_already_in(var_887fc615))
		{
			self thread trigger::function_521edc64(waitresult.activator, &trig_enter_audio_step_trigger, &trig_leave_audio_step_trigger);
		}
		waitframe(1);
	}
}

/*
	Name: audio_material_trigger
	Namespace: audio
	Checksum: 0x57DCBD74
	Offset: 0x2530
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function audio_material_trigger(trig)
{
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		self thread trigger::function_521edc64(waitresult.activator, &trig_enter_audio_material_trigger, &trig_leave_audio_material_trigger);
	}
}

/*
	Name: trig_enter_audio_material_trigger
	Namespace: audio
	Checksum: 0xAE28C8BF
	Offset: 0x25A8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function trig_enter_audio_material_trigger(player)
{
	if(!isdefined(player.inmaterialoverridetrigger))
	{
		player.inmaterialoverridetrigger = 0;
	}
	if(isdefined(self.script_label))
	{
		player.inmaterialoverridetrigger++;
		player.audiomaterialoverride = self.script_label;
		player setmaterialoverride(self.script_label);
	}
}

/*
	Name: trig_leave_audio_material_trigger
	Namespace: audio
	Checksum: 0xE8B86CC5
	Offset: 0x2620
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function trig_leave_audio_material_trigger(player)
{
	if(isdefined(self.script_label))
	{
		player.inmaterialoverridetrigger--;
		/#
			/#
				assert(player.inmaterialoverridetrigger >= 0);
			#/
		#/
		if(player.inmaterialoverridetrigger <= 0)
		{
			player.audiomaterialoverride = undefined;
			player.inmaterialoverridetrigger = 0;
			player clearmaterialoverride();
		}
	}
}

/*
	Name: trig_enter_audio_step_trigger
	Namespace: audio
	Checksum: 0xAED65469
	Offset: 0x26B8
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function trig_enter_audio_step_trigger(trigplayer)
{
	localclientnum = self._localclientnum;
	if(!isdefined(trigplayer.insteptrigger))
	{
		trigplayer.insteptrigger = 0;
	}
	suffix = "_npc";
	if(trigplayer function_21c0fa55())
	{
		suffix = "_plr";
	}
	if(isdefined(self.script_step_alias))
	{
		trigplayer.step_sound = self.script_step_alias;
		trigplayer.insteptrigger = trigplayer.insteptrigger + 1;
		trigplayer setsteptriggersound(self.script_step_alias + suffix);
	}
	if(isdefined(self.script_step_alias_enter) && trigplayer getmovementtype() == "sprint")
	{
		volume = get_vol_from_speed(trigplayer);
		trigplayer playsound(localclientnum, self.script_step_alias_enter + suffix, self.origin, volume);
	}
}

/*
	Name: trig_leave_audio_step_trigger
	Namespace: audio
	Checksum: 0xC15EB76A
	Offset: 0x2800
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function trig_leave_audio_step_trigger(trigplayer)
{
	localclientnum = self._localclientnum;
	suffix = "_npc";
	if(trigplayer function_21c0fa55())
	{
		suffix = "_plr";
	}
	if(isdefined(self.script_step_alias_exit) && trigplayer getmovementtype() == "sprint")
	{
		volume = get_vol_from_speed(trigplayer);
		trigplayer playsound(localclientnum, self.script_step_alias_exit + suffix, self.origin, volume);
	}
	if(isdefined(self.script_step_alias))
	{
		trigplayer.insteptrigger = trigplayer.insteptrigger - 1;
	}
	if(trigplayer.insteptrigger < 0)
	{
		/#
			println("");
		#/
		trigplayer.insteptrigger = 0;
	}
	if(trigplayer.insteptrigger == 0)
	{
		trigplayer.step_sound = "none";
		trigplayer clearsteptriggersound();
	}
}

/*
	Name: bump_trigger_start
	Namespace: audio
	Checksum: 0xF81E82A2
	Offset: 0x2968
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function bump_trigger_start(localclientnum)
{
	bump_trigs = getentarray(localclientnum, "audio_bump_trigger", "targetname");
	for(i = 0; i < bump_trigs.size; i++)
	{
		bump_trigs[i] thread thread_bump_trigger(localclientnum);
	}
}

/*
	Name: thread_bump_trigger
	Namespace: audio
	Checksum: 0x6862F343
	Offset: 0x29F0
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function thread_bump_trigger(localclientnum)
{
	self thread bump_trigger_listener();
	if(!isdefined(self.script_activated))
	{
		self.script_activated = 1;
	}
	self._localclientnum = localclientnum;
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		self thread trigger::function_521edc64(waitresult.activator, &trig_enter_bump, &trig_leave_bump);
	}
}

/*
	Name: trig_enter_bump
	Namespace: audio
	Checksum: 0x7BED4EEF
	Offset: 0x2AA0
	Size: 0x1F4
	Parameters: 1
	Flags: Linked
*/
function trig_enter_bump(ent)
{
	if(!isdefined(ent))
	{
		return;
	}
	if(!isdefined(self.script_bump_volume_threshold))
	{
		self.script_bump_volume_threshold = 0.75;
	}
	localclientnum = self._localclientnum;
	volume = get_vol_from_speed(ent);
	if(!sessionmodeiszombiesgame())
	{
		if(isplayer(ent) && ent hasperk(localclientnum, "specialty_quieter"))
		{
			volume = volume / 2;
		}
	}
	if(isdefined(self.script_bump_alias) && self.script_activated)
	{
		self playsound(localclientnum, self.script_bump_alias, self.origin, volume);
	}
	if(isdefined(self.script_bump_alias_soft) && self.script_bump_volume_threshold > volume && self.script_activated)
	{
		self playsound(localclientnum, self.script_bump_alias_soft, self.origin, volume);
	}
	if(isdefined(self.script_bump_alias_hard) && self.script_bump_volume_threshold <= volume && self.script_activated)
	{
		self playsound(localclientnum, self.script_bump_alias_hard, self.origin, volume);
	}
	if(isdefined(self.script_mantle_alias) && self.script_activated)
	{
		ent thread mantle_wait(self.script_mantle_alias, localclientnum);
	}
}

/*
	Name: mantle_wait
	Namespace: audio
	Checksum: 0xCB93143
	Offset: 0x2CA0
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function mantle_wait(alias, localclientnum)
{
	self endon(#"death");
	self endon(#"left_mantle");
	self waittill(#"traversesound");
	self playsound(localclientnum, alias, self.origin, 1);
}

/*
	Name: trig_leave_bump
	Namespace: audio
	Checksum: 0xFAF503E
	Offset: 0x2D18
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function trig_leave_bump(ent)
{
	wait(1);
	ent notify(#"left_mantle");
}

/*
	Name: bump_trigger_listener
	Namespace: audio
	Checksum: 0xD869868
	Offset: 0x2D48
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function bump_trigger_listener()
{
	if(isdefined(self.script_label))
	{
		level waittill(self.script_label);
		self.script_activated = 0;
	}
}

/*
	Name: scale_speed
	Namespace: audio
	Checksum: 0xA8E7F7DA
	Offset: 0x2D80
	Size: 0xA4
	Parameters: 5
	Flags: Linked
*/
function scale_speed(x1, x2, y1, y2, z)
{
	if(z < x1)
	{
		z = x1;
	}
	if(z > x2)
	{
		z = x2;
	}
	dx = x2 - x1;
	n = (z - x1) / dx;
	dy = y2 - y1;
	w = (n * dy) + y1;
	return w;
}

/*
	Name: get_vol_from_speed
	Namespace: audio
	Checksum: 0x7C885CAF
	Offset: 0x2E30
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function get_vol_from_speed(player)
{
	min_speed = 20;
	max_speed = 200;
	max_vol = 1;
	min_vol = 0.1;
	speed = player getspeed();
	abs_speed = absolute_value(int(speed));
	volume = scale_speed(min_speed, max_speed, min_vol, max_vol, abs_speed);
	return volume;
}

/*
	Name: absolute_value
	Namespace: audio
	Checksum: 0x9D35F819
	Offset: 0x2F08
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function absolute_value(fowd)
{
	if(fowd < 0)
	{
		return fowd * -1;
	}
	return fowd;
}

/*
	Name: closest_point_on_line_to_point
	Namespace: audio
	Checksum: 0x8263E237
	Offset: 0x2F40
	Size: 0x1AE
	Parameters: 3
	Flags: Linked
*/
function closest_point_on_line_to_point(point, linestart, lineend)
{
	self endon(#"end line sound");
	linemagsqrd = lengthsquared(lineend - linestart);
	t = (point[0] - linestart[0]) * (lineend[0] - linestart[0]) + (point[1] - linestart[1]) * (lineend[1] - linestart[1]) + (point[2] - linestart[2]) * (lineend[2] - linestart[2]) / linemagsqrd;
	if(t < 0)
	{
		self.origin = linestart;
	}
	else
	{
		if(t > 1)
		{
			self.origin = lineend;
		}
		else
		{
			start_x = linestart[0] + (t * (lineend[0] - linestart[0]));
			start_y = linestart[1] + (t * (lineend[1] - linestart[1]));
			start_z = linestart[2] + (t * (lineend[2] - linestart[2]));
			self.origin = (start_x, start_y, start_z);
		}
	}
}

/*
	Name: snd_play_auto_fx
	Namespace: audio
	Checksum: 0xD1EBCFF4
	Offset: 0x30F8
	Size: 0x74
	Parameters: 9
	Flags: None
*/
function snd_play_auto_fx(fxid, alias, offsetx, offsety, offsetz, onground, area, threshold, alias_override)
{
	soundplayautofx(fxid, alias, offsetx, offsety, offsetz, onground, area, threshold, alias_override);
}

/*
	Name: snd_print_fx_id
	Namespace: audio
	Checksum: 0xFF1C1DF
	Offset: 0x3178
	Size: 0x74
	Parameters: 3
	Flags: None
*/
function snd_print_fx_id(fxid, type, ent)
{
	/#
		if(getdvarint(#"debug_audio", 0) > 0)
		{
			println((("" + type) + "") + ent);
		}
	#/
}

/*
	Name: debug_line_emitter
	Namespace: audio
	Checksum: 0xDA01421B
	Offset: 0x31F8
	Size: 0x10E
	Parameters: 0
	Flags: None
*/
function debug_line_emitter()
{
	while(true)
	{
		/#
			if(getdvarint(#"debug_audio", 0) > 0)
			{
				line(self.start, self.end, (0, 1, 0));
				print3d(self.start, "", vectorscale((0, 1, 0), 0.8), 1, 3, 1);
				print3d(self.end, "", vectorscale((0, 1, 0), 0.8), 1, 3, 1);
				print3d(self.origin, self.script_sound, vectorscale((0, 1, 0), 0.8), 1, 3, 1);
			}
			waitframe(1);
		#/
	}
}

/*
	Name: move_sound_along_line
	Namespace: audio
	Checksum: 0xC97E428B
	Offset: 0x3310
	Size: 0x100
	Parameters: 0
	Flags: None
*/
function move_sound_along_line()
{
	closest_dist = undefined;
	/#
		self thread debug_line_emitter();
	#/
	while(true)
	{
		self closest_point_on_line_to_point(getlocalclientpos(0), self.start, self.end);
		if(isdefined(self.fake_ent))
		{
			self.fake_ent.origin = self.origin;
		}
		closest_dist = distancesquared(getlocalclientpos(0), self.origin);
		if(closest_dist > 1048576)
		{
			wait(2);
		}
		else
		{
			if(closest_dist > 262144)
			{
				wait(0.2);
			}
			else
			{
				wait(0.05);
			}
		}
	}
}

/*
	Name: playloopat
	Namespace: audio
	Checksum: 0x60ECD1D8
	Offset: 0x3418
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function playloopat(aliasname, origin)
{
	soundloopemitter(aliasname, origin);
}

/*
	Name: stoploopat
	Namespace: audio
	Checksum: 0xD2D82DBD
	Offset: 0x3450
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function stoploopat(aliasname, origin)
{
	soundstoploopemitter(aliasname, origin);
}

/*
	Name: soundwait
	Namespace: audio
	Checksum: 0xCA5CFC82
	Offset: 0x3488
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function soundwait(id)
{
	while(soundplaying(id))
	{
		wait(0.1);
	}
}

/*
	Name: snd_underwater
	Namespace: audio
	Checksum: 0x7A4B1E29
	Offset: 0x34C8
	Size: 0x378
	Parameters: 1
	Flags: Linked
*/
function snd_underwater(localclientnum)
{
	level endon(#"demo_jump");
	self endon(#"death");
	level endon("killcam_begin" + localclientnum);
	level endon("killcam_end" + localclientnum);
	self endon(#"sndenduwwatcher");
	if(!isdefined(level.audiosharedswimming))
	{
		level.audiosharedswimming = 0;
	}
	if(!isdefined(level.audiosharedunderwater))
	{
		level.audiosharedunderwater = 0;
	}
	setsoundcontext("water_global", "over");
	if(level.audiosharedswimming != isswimming(localclientnum))
	{
		level.audiosharedswimming = isswimming(localclientnum);
		if(level.audiosharedswimming)
		{
			swimbegin();
		}
		else
		{
			swimcancel(localclientnum);
		}
	}
	if(level.audiosharedunderwater != isunderwater(localclientnum))
	{
		level.audiosharedunderwater = isunderwater(localclientnum);
		if(level.audiosharedunderwater)
		{
			self underwaterbegin();
		}
		else
		{
			self underwaterend();
		}
	}
	while(true)
	{
		underwaternotify = undefined;
		underwaternotify = self waittill(#"underwater_begin", #"underwater_end", #"swimming_begin", #"swimming_end", #"death", #"sndenduwwatcher");
		if(underwaternotify._notify == "death")
		{
			self underwaterend();
			self swimend(localclientnum);
		}
		if(underwaternotify._notify == "underwater_begin")
		{
			self underwaterbegin();
		}
		else
		{
			if(underwaternotify._notify == "underwater_end")
			{
				self underwaterend();
			}
			else
			{
				if(underwaternotify._notify == "swimming_begin")
				{
					self swimbegin();
				}
				else if(underwaternotify._notify == "swimming_end" && isplayer(self) && isalive(self))
				{
					self swimend(localclientnum);
				}
			}
		}
	}
}

/*
	Name: underwaterbegin
	Namespace: audio
	Checksum: 0x46C138C4
	Offset: 0x3848
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function underwaterbegin()
{
	level.audiosharedunderwater = 1;
	setsoundcontext("water_global", "under");
}

/*
	Name: underwaterend
	Namespace: audio
	Checksum: 0xD0698D38
	Offset: 0x3888
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function underwaterend()
{
	level.audiosharedunderwater = 0;
	setsoundcontext("water_global", "over");
}

/*
	Name: swimbegin
	Namespace: audio
	Checksum: 0xE40E769D
	Offset: 0x38C8
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function swimbegin()
{
	self.audiosharedswimming = 1;
}

/*
	Name: swimend
	Namespace: audio
	Checksum: 0x96B2DC71
	Offset: 0x38E8
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function swimend(localclientnum)
{
	self.audiosharedswimming = 0;
}

/*
	Name: swimcancel
	Namespace: audio
	Checksum: 0x43005979
	Offset: 0x3908
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function swimcancel(localclientnum)
{
	self.audiosharedswimming = 0;
}

/*
	Name: soundplayuidecodeloop
	Namespace: audio
	Checksum: 0xE97C1153
	Offset: 0x3928
	Size: 0xD6
	Parameters: 2
	Flags: Linked
*/
function soundplayuidecodeloop(decodestring, playtimems)
{
	if(!isdefined(level.playinguidecodeloop) || !level.playinguidecodeloop)
	{
		level.playinguidecodeloop = 1;
		fake_ent = spawn(0, (0, 0, 0), "script_origin");
		if(isdefined(fake_ent))
		{
			fake_ent playloopsound(#"uin_notify_data_loop");
			wait(float(playtimems) / 1000);
			fake_ent stopallloopsounds(0);
		}
		level.playinguidecodeloop = undefined;
	}
}

/*
	Name: setcurrentambientstate
	Namespace: audio
	Checksum: 0x7EABE73C
	Offset: 0x3A08
	Size: 0x2C
	Parameters: 5
	Flags: Linked
*/
function setcurrentambientstate(ambientroom, ambientpackage, roomcollidercent, packagecollidercent, defaultroom)
{
}

/*
	Name: sndcriticalhealth
	Namespace: audio
	Checksum: 0xF78CDFF0
	Offset: 0x3A40
	Size: 0x11E
	Parameters: 7
	Flags: Linked
*/
function sndcriticalhealth(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::function_89a98f85();
	if(function_65b9eb0f(fieldname))
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!self function_21c0fa55())
	{
		return;
	}
	if(!isdefined(self.var_2f6077ac))
	{
		self.var_2f6077ac = self.origin;
	}
	if(bwastimejump)
	{
		playsound(fieldname, #"chr_health_lowhealth_enter", (0, 0, 0));
		playloopat("chr_health_lowhealth_loop", self.var_2f6077ac);
	}
	else
	{
		stoploopat("chr_health_lowhealth_loop", self.var_2f6077ac);
		self.var_2f6077ac = undefined;
	}
}

/*
	Name: sndlaststand
	Namespace: audio
	Checksum: 0x9614E3D
	Offset: 0x3B68
	Size: 0x11E
	Parameters: 7
	Flags: Linked
*/
function sndlaststand(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::function_89a98f85();
	if(function_65b9eb0f(fieldname))
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!self function_21c0fa55())
	{
		return;
	}
	if(!isdefined(self.sndlaststand))
	{
		self.sndlaststand = self.origin;
	}
	if(bwastimejump)
	{
		playsound(fieldname, #"chr_health_laststand_enter", (0, 0, 0));
		playloopat("chr_health_laststand_loop", self.sndlaststand);
	}
	else
	{
		stoploopat("chr_health_laststand_loop", self.sndlaststand);
		self.sndlaststand = undefined;
	}
}

/*
	Name: sndtacrig
	Namespace: audio
	Checksum: 0x32C55EEF
	Offset: 0x3C90
	Size: 0x62
	Parameters: 7
	Flags: Linked
*/
function sndtacrig(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.sndtacrigemergencyreserve = 1;
	}
	else
	{
		self.sndtacrigemergencyreserve = 0;
	}
}

/*
	Name: dorattle
	Namespace: audio
	Checksum: 0x931416DD
	Offset: 0x3D00
	Size: 0x64
	Parameters: 3
	Flags: Linked
*/
function dorattle(origin, min, max)
{
	if(isdefined(min) && min > 0)
	{
		if(isdefined(max) && max <= 0)
		{
			max = undefined;
		}
		soundrattle(origin, min, max);
	}
}

/*
	Name: sndrattle_server
	Namespace: audio
	Checksum: 0x9BEF1CF2
	Offset: 0x3D70
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function sndrattle_server(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(isdefined(self.model) && self.model == #"wpn_t7_bouncing_betty_world")
		{
			betty = getweapon(#"bouncingbetty");
			level dorattle(self.origin, betty.soundrattlerangemin, betty.soundrattlerangemax);
		}
		else
		{
			level dorattle(self.origin, 25, 600);
		}
	}
}

/*
	Name: function_b51c1cb9
	Namespace: audio
	Checksum: 0x23D9B5CE
	Offset: 0x3E68
	Size: 0x4C
	Parameters: 1
	Flags: Event
*/
event function_b51c1cb9(eventstruct)
{
	level dorattle(eventstruct.position, eventstruct.weapon.soundrattlerangemin, eventstruct.weapon.soundrattlerangemax);
}

/*
	Name: weapon_butt_sounds
	Namespace: audio
	Checksum: 0xB2DEC522
	Offset: 0x3EC0
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function weapon_butt_sounds(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.meleed = 1;
		level.mysnd = playsound(fieldname, #"chr_melee_tinitus", (0, 0, 0));
	}
	else
	{
		self.meleed = 0;
		if(isdefined(level.mysnd))
		{
			stopsound(level.mysnd);
		}
	}
}

/*
	Name: sndmatchsnapshot
	Namespace: audio
	Checksum: 0xE0F3358F
	Offset: 0x3F80
	Size: 0x114
	Parameters: 7
	Flags: Linked
*/
function sndmatchsnapshot(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(sessionmodeiswarzonegame())
	{
		return;
	}
	if(bwastimejump)
	{
		switch(bwastimejump)
		{
			case 1:
			{
				snd_set_snapshot("mpl_prematch");
				break;
			}
			case 2:
			{
				snd_set_snapshot("mpl_postmatch");
				break;
			}
			case 3:
			{
				snd_set_snapshot("mpl_endmatch");
				break;
			}
		}
	}
	else
	{
		snd_set_snapshot("default");
	}
}

/*
	Name: sndkillcam
	Namespace: audio
	Checksum: 0xE4740B86
	Offset: 0x40A0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function sndkillcam()
{
	level thread sndfinalkillcam_slowdown();
	level thread sndfinalkillcam_deactivate();
}

/*
	Name: snddeath_activate
	Namespace: audio
	Checksum: 0x78A9182B
	Offset: 0x40E0
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function snddeath_activate()
{
	while(true)
	{
		level waittill(#"sndded");
		snd_set_snapshot("mpl_death");
	}
}

/*
	Name: snddeath_deactivate
	Namespace: audio
	Checksum: 0x15589659
	Offset: 0x4128
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function snddeath_deactivate()
{
	while(true)
	{
		level waittill(#"snddede");
		snd_set_snapshot("default");
	}
}

/*
	Name: sndfinalkillcam_activate
	Namespace: audio
	Checksum: 0x55EC0E2
	Offset: 0x4170
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function sndfinalkillcam_activate()
{
	while(true)
	{
		level waittill(#"sndfks");
	}
}

/*
	Name: sndfinalkillcam_slowdown
	Namespace: audio
	Checksum: 0x5079EF99
	Offset: 0x41A0
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function sndfinalkillcam_slowdown()
{
	while(true)
	{
		level waittill(#"sndfksl");
	}
}

/*
	Name: sndfinalkillcam_deactivate
	Namespace: audio
	Checksum: 0x32099F3F
	Offset: 0x41D0
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function sndfinalkillcam_deactivate()
{
	while(true)
	{
		level waittill(#"sndfke");
		snd_set_snapshot("default");
	}
}

/*
	Name: sndswitchvehiclecontext
	Namespace: audio
	Checksum: 0x8DCBAA5F
	Offset: 0x4218
	Size: 0xC4
	Parameters: 7
	Flags: Linked
*/
function sndswitchvehiclecontext(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self))
	{
		return;
	}
	if(self isvehicle() && self function_4add50a7())
	{
		setsoundcontext("plr_impact", "vehicle");
	}
	else
	{
		setsoundcontext("plr_impact", "flesh");
	}
}

/*
	Name: sndmusicdeathwatcher
	Namespace: audio
	Checksum: 0x3B07A594
	Offset: 0x42E8
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function sndmusicdeathwatcher()
{
	self waittill(#"death");
}

/*
	Name: sndcchacking
	Namespace: audio
	Checksum: 0x9EA1DD48
	Offset: 0x4310
	Size: 0x1CC
	Parameters: 7
	Flags: Linked
*/
function sndcchacking(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		switch(bwastimejump)
		{
			case 1:
			{
				playsound(0, #"gdt_cybercore_hack_start_plr", (0, 0, 0));
				self.hsnd = self playloopsound(#"gdt_cybercore_hack_lp_plr", 0.5);
				break;
			}
			case 2:
			{
				playsound(0, #"gdt_cybercore_prime_upg_plr", (0, 0, 0));
				self.hsnd = self playloopsound(#"gdt_cybercore_prime_loop_plr", 0.5);
				break;
			}
		}
	}
	else
	{
		if(isdefined(self.hsnd))
		{
			self stoploopsound(self.hsnd, 0.5);
		}
		if(fieldname == 1)
		{
			playsound(0, #"gdt_cybercore_hack_success_plr", (0, 0, 0));
		}
		else if(fieldname == 2)
		{
			playsound(0, #"gdt_cybercore_activate_fail_plr", (0, 0, 0));
		}
	}
}

/*
	Name: sndigcsnapshot
	Namespace: audio
	Checksum: 0x382F48C4
	Offset: 0x44E8
	Size: 0x184
	Parameters: 7
	Flags: Linked
*/
function sndigcsnapshot(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		switch(bwastimejump)
		{
			case 1:
			{
				snd_set_snapshot("cmn_igc_bg_lower");
				level.sndigcsnapshotoverride = 0;
				break;
			}
			case 2:
			{
				snd_set_snapshot("cmn_igc_amb_silent");
				level.sndigcsnapshotoverride = 1;
				break;
			}
			case 3:
			{
				snd_set_snapshot("cmn_igc_foley_lower");
				level.sndigcsnapshotoverride = 0;
				break;
			}
			case 4:
			{
				snd_set_snapshot("cmn_level_fadeout");
				level.sndigcsnapshotoverride = 0;
				break;
			}
			case 5:
			{
				snd_set_snapshot("cmn_level_fade_immediate");
				level.sndigcsnapshotoverride = 0;
				break;
			}
		}
	}
	else
	{
		level.sndigcsnapshotoverride = 0;
	}
}

/*
	Name: sndlevelstartsnapoff
	Namespace: audio
	Checksum: 0x1C6BCD14
	Offset: 0x4678
	Size: 0x5E
	Parameters: 7
	Flags: Linked
*/
function sndlevelstartsnapoff(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
	}
}

/*
	Name: sndzmbfadein
	Namespace: audio
	Checksum: 0x814C3E1C
	Offset: 0x46E0
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function sndzmbfadein(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		snd_set_snapshot("default");
	}
}

/*
	Name: sndchyronloop
	Namespace: audio
	Checksum: 0x74C5A182
	Offset: 0x4748
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function sndchyronloop(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(level.chyronloop))
		{
			level.chyronloop = spawn(0, (0, 0, 0), "script_origin");
			level.chyronloop playloopsound(#"uin_chyron_loop");
		}
	}
	else if(isdefined(level.chyronloop))
	{
		level.chyronloop delete();
	}
}

/*
	Name: function_aa906715
	Namespace: audio
	Checksum: 0x81510C7
	Offset: 0x4828
	Size: 0x188
	Parameters: 0
	Flags: Linked
*/
function function_aa906715()
{
	self endon(#"death", #"disconnect", #"game_ended");
	if(self function_21c0fa55() && sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		self.var_e4acdf73 = 0;
		var_1b0c36cc = self battlechatter::get_player_dialog_alias("exertGasCough");
		var_7f9cdb4f = self battlechatter::get_player_dialog_alias("exertGasGag");
		var_78ca4238 = self battlechatter::get_player_dialog_alias("exertGasGasp");
		if(!(isdefined(var_1b0c36cc) && (isdefined(var_7f9cdb4f) && isdefined(var_78ca4238))))
		{
			return;
		}
		while(true)
		{
			self waittill(#"hash_59dc3b94303bbeac");
			self thread function_f041ffdb(var_1b0c36cc, var_7f9cdb4f);
			self waittill(#"hash_71bef43cb9e9e9f4");
			self thread function_deedd8d0(var_78ca4238);
			wait(0.1);
		}
	}
}

/*
	Name: function_f041ffdb
	Namespace: audio
	Checksum: 0x37977EFF
	Offset: 0x49B8
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function function_f041ffdb(var_1b0c36cc, var_7f9cdb4f)
{
	self endon(#"death", #"hash_71bef43cb9e9e9f4");
	if(isdefined(self))
	{
		self.var_7c77614c = gettime();
		self thread function_5e73e105(var_1b0c36cc, var_7f9cdb4f);
	}
}

/*
	Name: function_5e73e105
	Namespace: audio
	Checksum: 0xA200DEBB
	Offset: 0x4A28
	Size: 0xF8
	Parameters: 2
	Flags: Linked
*/
function function_5e73e105(var_1b0c36cc, var_7f9cdb4f)
{
	self endon(#"death", #"disconnect", #"game_ended", #"hash_71bef43cb9e9e9f4");
	self.var_e4acdf73 = 1;
	while(true)
	{
		randomchance = randomfloatrange(0, 1);
		if(randomchance < 0.8)
		{
			self playsound(0, var_1b0c36cc);
		}
		else
		{
			self playsound(0, var_7f9cdb4f);
		}
		wait(randomfloatrange(1.5, 3.5));
	}
}

/*
	Name: function_deedd8d0
	Namespace: audio
	Checksum: 0xAAB43D46
	Offset: 0x4B28
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function function_deedd8d0(var_78ca4238)
{
	self endon(#"death", #"hash_59dc3b94303bbeac");
	if(self.var_e4acdf73 && (self.var_7c77614c + (float(3) / 1000)) > gettime())
	{
		self playsound(0, var_78ca4238);
		self.var_e4acdf73 = 0;
	}
}

/*
	Name: sndsprintbreath
	Namespace: audio
	Checksum: 0x342B06A2
	Offset: 0x4BC8
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function sndsprintbreath(localclientnum)
{
	self endon(#"death");
	if(self function_21c0fa55() && sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		self.var_29054134 = 0;
		var_63112f76 = self battlechatter::get_player_dialog_alias("exertBreatheSprinting");
		var_dfb6f570 = self battlechatter::get_player_dialog_alias("exertBreatheSprintingEnd");
		if(!isdefined(var_63112f76) || !isdefined(var_dfb6f570))
		{
			return;
		}
		while(true)
		{
			if(isdefined(self))
			{
				if(self isplayersprinting())
				{
					self thread sndbreathstart(var_63112f76);
					self thread function_ee6d1a7f(var_dfb6f570);
					waitresult = undefined;
					waitresult = self waittill(#"hash_4e899fa9b2775b4d", #"death");
					if(waitresult._notify == "death")
					{
						return;
					}
				}
			}
			wait(0.1);
		}
	}
}

/*
	Name: sndbreathstart
	Namespace: audio
	Checksum: 0xB7AB642C
	Offset: 0x4D60
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function sndbreathstart(sound)
{
	self endon(#"hash_4e899fa9b2775b4d");
	self endon(#"death");
	self waittill(#"hash_1d827c5a5cd4a607");
	if(isdefined(self))
	{
		self thread function_d6bc7279(sound);
	}
}

/*
	Name: function_d6bc7279
	Namespace: audio
	Checksum: 0xE06C2A08
	Offset: 0x4DD0
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_d6bc7279(sound)
{
	self endon(#"death");
	self endon(#"hash_4e899fa9b2775b4d");
	self.var_29054134 = 1;
	while(true)
	{
		self playsound(0, sound);
		wait(2.5);
	}
}

/*
	Name: function_ee6d1a7f
	Namespace: audio
	Checksum: 0xE6F0459A
	Offset: 0x4E40
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function function_ee6d1a7f(sound)
{
	self endon(#"death");
	self waittill(#"hash_4e899fa9b2775b4d");
	if(self.var_29054134)
	{
		self playsound(0, sound);
		self.var_29054134 = 0;
	}
}

/*
	Name: function_5da61577
	Namespace: audio
	Checksum: 0x79014614
	Offset: 0x4EA8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_5da61577(localclientnum)
{
	self endon(#"death");
	if(isdefined(self))
	{
		self thread function_bd07593a();
	}
}

/*
	Name: function_bd07593a
	Namespace: audio
	Checksum: 0xAA6AC8BE
	Offset: 0x4EF0
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_bd07593a()
{
	self endon(#"death");
	while(true)
	{
		if(self util::is_on_side(#"allies"))
		{
			if(self isplayersprinting())
			{
				self playsound(0, #"hash_2dc9c76844261d06");
				wait(1);
			}
			else
			{
				self playsound(0, #"hash_70b507d0e243536d");
				wait(2.5);
			}
		}
		wait(0.1);
	}
}

/*
	Name: sndvehicledamagealarm
	Namespace: audio
	Checksum: 0x16897227
	Offset: 0x4FB0
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function sndvehicledamagealarm(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify(#"sndvehicledamagealarm");
	self thread function_350920b9();
}

/*
	Name: function_350920b9
	Namespace: audio
	Checksum: 0xA69CD5F4
	Offset: 0x5020
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_350920b9()
{
	self endon(#"death");
	self endon(#"disconnect");
	self endon(#"sndvehicledamagealarm");
	if(!isdefined(self.var_5730fa36))
	{
		self.var_5730fa36 = self playloopsound(#"hash_7a6b427867364957");
	}
	wait(2);
	if(isdefined(self.var_5730fa36))
	{
		self stoploopsound(self.var_5730fa36);
		self.var_5730fa36 = undefined;
	}
	self playsound(0, #"hash_26a4334032c725cb");
}

/*
	Name: function_31468a30
	Namespace: audio
	Checksum: 0xA3224525
	Offset: 0x50F0
	Size: 0x164
	Parameters: 1
	Flags: None
*/
function function_31468a30(scriptstruct)
{
	/#
		soundloop = scriptstruct.soundstruct;
		if(isdefined(level.loopers))
		{
			for(i = 0; i < level.loopers.size; i++)
			{
				if(!isdefined(level.loopers[i].script_sound))
				{
					level.loopers[i].origin = soundloop.origin;
					level.loopers[i].script_sound = soundloop.script_sound;
					level.loopers[i] thread soundloopthink();
					return;
				}
			}
			index = level.loopers.size;
			arrayinsert(level.loopers, soundloop, index);
			level.loopers[index].angles = undefined;
			level.loopers[index].script_label = undefined;
			level.loopers[index] thread soundloopthink();
		}
	#/
}

/*
	Name: function_5470fa95
	Namespace: audio
	Checksum: 0x3F477698
	Offset: 0x5260
	Size: 0xC2
	Parameters: 1
	Flags: Event
*/
event function_5470fa95(scriptstruct)
{
	/#
		soundloop = scriptstruct.soundstruct;
		if(isdefined(level.loopers))
		{
			index = scriptstruct.index;
			if(index >= 0 && index < level.loopers.size)
			{
				soundstoploopemitter(soundloop.script_sound, soundloop.origin);
				level.loopers[index].origin = (0, 0, 0);
				level.loopers[index].script_sound = undefined;
			}
		}
	#/
}

/*
	Name: function_3fda4bf4
	Namespace: audio
	Checksum: 0x5FEE8391
	Offset: 0x5330
	Size: 0x15C
	Parameters: 1
	Flags: Event
*/
event function_3fda4bf4(scriptstruct)
{
	/#
		soundloop = scriptstruct.soundstruct;
		if(isdefined(level.loopers) && isdefined(soundloop) && isdefined(soundloop.script_sound) && isdefined(soundloop.script_looping))
		{
			index = scriptstruct.index;
			if(index >= 0 && index < level.loopers.size)
			{
				level.loopers[index].origin = soundloop.origin;
				level.loopers[index].script_sound = soundloop.script_sound;
				level.loopers[index].script_looping = soundloop.script_looping;
				function_f03b7c11(index, level.loopers[index].script_sound, level.loopers[index].origin);
			}
			else if(index == -2)
			{
				function_31468a30(scriptstruct);
			}
		}
	#/
}

/*
	Name: function_882b5910
	Namespace: audio
	Checksum: 0xCC5B331A
	Offset: 0x5498
	Size: 0xB2
	Parameters: 1
	Flags: Event
*/
event function_882b5910(scriptstruct)
{
	/#
		soundloop = scriptstruct.soundstruct;
		level.var_7acea05a = -1;
		if(isdefined(level.loopers))
		{
			for(i = 0; i < level.loopers.size; i++)
			{
				if(distancesquared(level.loopers[i].origin, soundloop.origin) < 1)
				{
					level.var_7acea05a = i;
					return;
				}
			}
		}
	#/
}

/*
	Name: function_4fb7ec9c
	Namespace: audio
	Checksum: 0xCA1DD633
	Offset: 0x5558
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function function_4fb7ec9c(scriptstruct)
{
	/#
		var_2f7118b0 = scriptstruct.soundstruct;
		if(isdefined(level.lineemitters))
		{
			for(i = 0; i < level.lineemitters.size; i++)
			{
				if(!isdefined(level.lineemitters[i].script_sound))
				{
					level.lineemitters[i].origin = var_2f7118b0.origin;
					level.lineemitters[i].script_sound = var_2f7118b0.script_sound;
					level.lineemitters[i].target = var_2f7118b0.target;
					level.lineemitters[i] thread soundlinethink();
					return;
				}
			}
			index = level.lineemitters.size;
			arrayinsert(level.lineemitters, var_2f7118b0, index);
			level.lineemitters[index].angles = undefined;
			level.lineemitters[index].script_label = undefined;
			level.lineemitters[index] thread soundlinethink();
		}
	#/
}

/*
	Name: function_bbc6b84a
	Namespace: audio
	Checksum: 0x5A03B21
	Offset: 0x56E8
	Size: 0x122
	Parameters: 1
	Flags: Event
*/
event function_bbc6b84a(scriptstruct)
{
	/#
		var_2f7118b0 = scriptstruct.soundstruct;
		if(isdefined(level.lineemitters))
		{
			index = scriptstruct.index;
			if(index >= 0 && index < level.lineemitters.size)
			{
				target = struct::get(level.lineemitters[index].target, "");
				soundstoplineemitter(level.lineemitters[index].script_sound, level.lineemitters[index].origin, target.origin);
				level.lineemitters[index].origin = (0, 0, 0);
				level.lineemitters[index].script_sound = undefined;
			}
		}
	#/
}

/*
	Name: function_4910c05b
	Namespace: audio
	Checksum: 0x74DA3567
	Offset: 0x5818
	Size: 0x184
	Parameters: 1
	Flags: Event
*/
event function_4910c05b(scriptstruct)
{
	/#
		var_2f7118b0 = scriptstruct.soundstruct;
		if(isdefined(level.lineemitters) && isdefined(var_2f7118b0))
		{
			index = scriptstruct.index;
			if(index >= 0 && index < level.lineemitters.size)
			{
				level.lineemitters[index].origin = var_2f7118b0.origin;
				level.lineemitters[index].script_sound = var_2f7118b0.script_sound;
				level.lineemitters[index].target = var_2f7118b0.target;
				target = struct::get(level.lineemitters[index].target, "");
				if(isdefined(target))
				{
					function_15b81494(index, level.lineemitters[index].script_sound, level.lineemitters[index].origin, target.origin);
				}
			}
			else if(index == -2)
			{
				function_4fb7ec9c(scriptstruct);
			}
		}
	#/
}

/*
	Name: function_ee6f0c88
	Namespace: audio
	Checksum: 0x74728C26
	Offset: 0x59A8
	Size: 0xB2
	Parameters: 1
	Flags: Event
*/
event function_ee6f0c88(scriptstruct)
{
	/#
		var_2f7118b0 = scriptstruct.soundstruct;
		level.var_7acea05a = -1;
		if(isdefined(level.lineemitters))
		{
			for(i = 0; i < level.lineemitters.size; i++)
			{
				if(distancesquared(level.lineemitters[i].origin, var_2f7118b0.origin) < 1)
				{
					level.var_7acea05a = i;
					return;
				}
			}
		}
	#/
}

/*
	Name: function_abd4ca1
	Namespace: audio
	Checksum: 0xCA1ED5BF
	Offset: 0x5A68
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function function_abd4ca1(scriptstruct)
{
	/#
		var_984110e5 = scriptstruct.soundstruct;
		if(isdefined(level.randoms))
		{
			for(i = 0; i < level.randoms.size; i++)
			{
				if(!isdefined(level.randoms[i].script_sound))
				{
					level.randoms[i].origin = var_984110e5.origin;
					level.randoms[i].script_sound = var_984110e5.script_sound;
					level.randoms[i] thread soundrandom_thread(0, level.randoms[i]);
					return;
				}
			}
			index = level.randoms.size;
			arrayinsert(level.randoms, var_984110e5, index);
			level.randoms[index].angles = undefined;
			level.randoms[index].script_label = undefined;
			level.randoms[index] thread soundrandom_thread(0, level.randoms[index]);
		}
	#/
}

/*
	Name: function_464598c8
	Namespace: audio
	Checksum: 0xA6A81076
	Offset: 0x5BF8
	Size: 0xCE
	Parameters: 1
	Flags: Event
*/
event function_464598c8(scriptstruct)
{
	/#
		var_984110e5 = scriptstruct.soundstruct;
		if(isdefined(level.randoms))
		{
			index = scriptstruct.index;
			if(index >= 0 && index < level.randoms.size)
			{
				function_dac8758d(level.randoms[index].origin);
				level.randoms[index].origin = (0, 0, 0);
				level.randoms[index].script_sound = undefined;
			}
		}
	#/
}

/*
	Name: function_12dface6
	Namespace: audio
	Checksum: 0xEFFEC62D
	Offset: 0x5CD0
	Size: 0x1B4
	Parameters: 1
	Flags: Event
*/
event function_12dface6(scriptstruct)
{
	/#
		var_984110e5 = scriptstruct.soundstruct;
		if(isdefined(level.randoms))
		{
			index = scriptstruct.index;
			neworigin = scriptstruct.neworigin;
			if(index >= 0 && index < level.randoms.size)
			{
				if(isdefined(var_984110e5.script_wait_min))
				{
					level.randoms[index].script_wait_min = var_984110e5.script_wait_min;
				}
				if(isdefined(var_984110e5.script_wait_max))
				{
					level.randoms[index].script_wait_max = var_984110e5.script_wait_max;
				}
				level.randoms[index].script_sound = var_984110e5.script_sound;
				function_12dface6(level.randoms[index].origin, neworigin, level.randoms[index].script_sound, level.randoms[index].script_wait_min, level.randoms[index].script_wait_max);
				level.randoms[index].origin = neworigin;
			}
			else if(index == -2)
			{
				scriptstruct.soundstruct.origin = neworigin;
				function_abd4ca1(scriptstruct);
			}
		}
	#/
}

/*
	Name: function_8673317e
	Namespace: audio
	Checksum: 0xEFE37FC2
	Offset: 0x5E90
	Size: 0xB2
	Parameters: 1
	Flags: Event
*/
event function_8673317e(scriptstruct)
{
	/#
		var_984110e5 = scriptstruct.soundstruct;
		level.var_7acea05a = -1;
		if(isdefined(level.randoms))
		{
			for(i = 0; i < level.randoms.size; i++)
			{
				if(distancesquared(level.randoms[i].origin, var_984110e5.origin) < 1)
				{
					level.var_7acea05a = i;
					return;
				}
			}
		}
	#/
}

