#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace potm_shared;

/*
	Name: function_43e43d9e
	Namespace: potm_shared
	Checksum: 0x12156CA6
	Offset: 0x230
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_43e43d9e()
{
	level notify(-2078973275);
}

#namespace potm;

/*
	Name: __init__system__
	Namespace: potm
	Checksum: 0x67EBFD5A
	Offset: 0x250
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"potm", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: potm
	Checksum: 0x5AD982C4
	Offset: 0x298
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.potm_enabled = 1;
	callback::on_start_gametype(&init);
	level.var_abb3fd2 = &event_bookmark;
}

/*
	Name: function_d71338e4
	Namespace: potm
	Checksum: 0x690115CA
	Offset: 0x2F0
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_d71338e4()
{
	if(isdefined(game.var_5d3e5c4e))
	{
		return;
	}
	game.var_92c9543b = function_ba563f48();
	game.var_b9a7e65f = 0;
	for(i = 0; i < game.var_92c9543b.size; i++)
	{
		info = game.var_92c9543b[i];
		if(info.secondsbefore > game.var_b9a7e65f)
		{
			game.var_b9a7e65f = info.secondsbefore;
		}
	}
	game.var_5d3e5c4e = 1;
}

/*
	Name: init
	Namespace: potm
	Checksum: 0x42A1C9FD
	Offset: 0x3B8
	Size: 0x48C
	Parameters: 0
	Flags: Linked, Private
*/
function private init()
{
	if(!isdefined(game.var_ab39640b))
	{
		game.potm_enabled = getgametypesetting(#"allowplayofthematch");
		if(!game.potm_enabled)
		{
			level.var_abb3fd2 = undefined;
			return;
		}
		game.potm_max_events = getgametypesetting(#"maxplayofthematchevents");
		game.var_c7a2645f = getgametypesetting(#"hash_567db38226658dbf");
		game.var_3a859f59 = getgametypesetting(#"hash_62a4fd40810cb61");
		game.var_94fe2d81 = getgametypesetting(#"hash_4a6ef8940f4cbb83");
		game.var_659f084a = getgametypesetting(#"hash_6881c7cab0dcef39");
		game.var_50b05a28 = getgametypesetting(#"hash_7c0dcff6ffb1e348");
		game.var_6bd02863 = getgametypesetting(#"hash_4f4a73f236278ba8");
		game.var_691bbcd2 = getgametypesetting(#"hash_7c0acf14fb1f4080");
		function_f6b119c7();
		game.var_c7826a3f = getgametypesetting(#"hash_6269eb986d22cd37");
		game.var_b924522a = getgametypesetting(#"hash_6e2abf2cc40e03f1");
		game.var_aafe322f = [];
		game.var_12ffe1e3 = [];
		game.potmevents = [];
		game.var_8ea529d1 = #"potm";
		/#
			debuginit();
		#/
		if(sessionmodeismultiplayergame())
		{
			game.var_4afb166c = &function_e6c9822f;
			game.var_2e431430 = &function_20422a1a;
			game.var_94f3e5d2 = &function_c65274ed;
			game.var_321b0d80 = &function_43690387;
			game.var_5028ba3c = function_f2f9ce22();
			game.var_701e85bf = 1;
			game.var_8581b2bd = 1;
		}
		else
		{
			if(sessionmodeiszombiesgame())
			{
				game.var_4afb166c = &function_5570c594;
				game.var_2e431430 = &function_34576c1;
				game.var_94f3e5d2 = &function_d34511e6;
				game.var_321b0d80 = undefined;
				game.var_8581b2bd = 0;
			}
			else
			{
				game.var_4afb166c = &function_3ca7924f;
				game.var_2e431430 = &function_d46f78f8;
				game.var_94f3e5d2 = &function_66bbf824;
				game.var_321b0d80 = undefined;
				game.var_701e85bf = 1;
				game.var_8581b2bd = 0;
			}
		}
		game.var_fc393bcd = [];
		game.var_b2ee45db = [];
		game.var_ab39640b = 1;
		game.var_1d3545e = undefined;
	}
	else
	{
		function_1cffcfda();
	}
	function_d71338e4();
	game.var_fb8365e0 = util::getroundsplayed();
	level.var_e99fd3d1 = 0;
	thread function_bc21fc81();
	if(isdefined(game.var_1d3545e))
	{
		[[game.var_1d3545e]]();
	}
}

/*
	Name: forceinit
	Namespace: potm
	Checksum: 0x5D952F3B
	Offset: 0x850
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function forceinit()
{
	game.var_ab39640b = undefined;
	init();
}

/*
	Name: isenabled
	Namespace: potm
	Checksum: 0xC94A6815
	Offset: 0x880
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function isenabled()
{
	return isdefined(game.potm_enabled) && game.potm_enabled;
}

/*
	Name: function_1cffcfda
	Namespace: potm
	Checksum: 0x49AE6AF
	Offset: 0x8A8
	Size: 0x60
	Parameters: 0
	Flags: Linked
*/
function function_1cffcfda()
{
	if(!isenabled())
	{
		return;
	}
	for(eventindex = 0; eventindex < game.potmevents.size; eventindex++)
	{
		removepotmevent(eventindex);
	}
	game.potmevents = [];
}

/*
	Name: function_3438c1f4
	Namespace: potm
	Checksum: 0x2A9CDF73
	Offset: 0x910
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_3438c1f4()
{
	if(!isenabled())
	{
		return;
	}
	game.potm_max_events = getgametypesetting(#"maxplayofthematchevents");
}

/*
	Name: function_80cdf4b2
	Namespace: potm
	Checksum: 0x949441DA
	Offset: 0x960
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_80cdf4b2(maxevents)
{
	if(!isenabled() || !isdefined(game.potm_max_events))
	{
		return;
	}
	if(maxevents < getgametypesetting(#"maxplayofthematchevents"))
	{
		game.potm_max_events = maxevents;
	}
}

/*
	Name: function_f6b119c7
	Namespace: potm
	Checksum: 0x306028CB
	Offset: 0x9D8
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function function_f6b119c7()
{
	if(!isenabled())
	{
		return;
	}
	game.var_701e85bf = !game.var_50b05a28;
}

/*
	Name: function_734a7d24
	Namespace: potm
	Checksum: 0x283D143D
	Offset: 0xA10
	Size: 0x30
	Parameters: 1
	Flags: None
*/
function function_734a7d24(var_ad074e3a)
{
	if(!isenabled())
	{
		return;
	}
	game.var_701e85bf = var_ad074e3a;
}

/*
	Name: function_ec01de3
	Namespace: potm
	Checksum: 0xC487243F
	Offset: 0xA48
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_ec01de3()
{
	if(!isenabled())
	{
		return false;
	}
	return true;
}

/*
	Name: function_ec9661b4
	Namespace: potm
	Checksum: 0x9E9DA2BE
	Offset: 0xA70
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ec9661b4(clientent)
{
	if(!isdefined(clientent))
	{
		return "N/A";
	}
	if(isdefined(clientent.name))
	{
		return clientent.name;
	}
	var_80c2e8e0 = clientent getentitynumber();
	return (("N/A [") + var_80c2e8e0) + "]";
}

/*
	Name: function_c7e98e25
	Namespace: potm
	Checksum: 0xB7F5CDC6
	Offset: 0xAE8
	Size: 0x21A
	Parameters: 1
	Flags: Linked
*/
function function_c7e98e25(var_6060b78c)
{
	var_ba8bdc4c = var_6060b78c.var_ba8bdc4c;
	var_1be0f2c3 = "N/A";
	if(!isdefined(var_ba8bdc4c))
	{
		return var_1be0f2c3;
	}
	if(!isdefined(var_ba8bdc4c.var_61d85ed2))
	{
		if(isdefined(var_6060b78c.clientnum))
		{
			foreach(player in level.players)
			{
				if(player getentitynumber() == var_6060b78c.clientnum)
				{
					var_1be0f2c3 = function_ec9661b4(player);
					var_1be0f2c3 = var_1be0f2c3 + (" (KillcamParams: N/A)");
				}
			}
		}
		return var_1be0f2c3;
	}
	var_61d85ed2 = var_ba8bdc4c.var_61d85ed2;
	attackername = "N/A";
	spectatorclientnum = "N/A";
	if(isdefined(var_61d85ed2.attacker) && isdefined(var_61d85ed2.attacker.name))
	{
		attackername = var_61d85ed2.attacker.name;
	}
	var_1be0f2c3 = ((attackername + " {") + spectatorclientnum) + "}";
	if(isdefined(var_61d85ed2.weapon))
	{
		var_1be0f2c3 = var_1be0f2c3 + (" Weapon: " + var_61d85ed2.weapon.name);
	}
	if(isdefined(var_61d85ed2.meansofdeath))
	{
		var_1be0f2c3 = var_1be0f2c3 + (" MoD: " + var_61d85ed2.meansofdeath);
	}
	return var_1be0f2c3;
}

/*
	Name: function_b5433e55
	Namespace: potm
	Checksum: 0x4232D9BE
	Offset: 0xD10
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function function_b5433e55(bookmark)
{
	if(!game.var_8581b2bd)
	{
		return;
	}
	var_cef89b92 = {};
	var_cef89b92.round = game.var_fb8365e0;
	var_cef89b92.name = bookmark.var_65e76577;
	var_cef89b92.time = bookmark.time;
	var_cef89b92.isfirstperson = bookmark.isfirstperson;
	var_cef89b92.infoindex = bookmark.var_900768bc.index;
	var_cef89b92.var_fddbd3ce = bookmark.var_900768bc.id;
	var_cef89b92.mainclientnum = bookmark.mainclientnum;
	var_cef89b92.var_9b2cab54 = function_ec9661b4(bookmark.var_81538b15);
	var_cef89b92.otherclientnum = bookmark.otherclientnum;
	var_cef89b92.var_3b8a36fd = function_ec9661b4(bookmark.var_f28fb772);
	var_cef89b92.scoreaddition = bookmark.scoreaddition;
	var_cef89b92.scoremultiplier = bookmark.scoremultiplier;
	var_cef89b92.scoreeventpriority = bookmark.scoreeventpriority;
	var_cef89b92.inflictorentnum = bookmark.inflictorentnum;
	var_cef89b92.inflictorenttype = bookmark.inflictorenttype;
	var_cef89b92.overrideentitycamera = bookmark.overrideentitycamera;
	var_cef89b92.tableindex = bookmark.eventdata.tableindex;
	var_cef89b92.event_info = bookmark.eventdata.event_info;
	function_92d1707f(#"hash_4782850b19da4089", var_cef89b92);
}

/*
	Name: function_b5633c73
	Namespace: potm
	Checksum: 0x1485DBE8
	Offset: 0xEC8
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function function_b5633c73(var_6060b78c)
{
	if(!game.var_8581b2bd)
	{
		return;
	}
	if(!isdefined(var_6060b78c) || !isdefined(var_6060b78c.var_ba8bdc4c))
	{
		return;
	}
	duration = var_6060b78c.var_ba8bdc4c.endtime - var_6060b78c.var_ba8bdc4c.starttime;
	var_dd06123 = {};
	var_dd06123.round = game.var_fb8365e0;
	var_dd06123.clientnum = var_6060b78c.clientnum;
	var_dd06123.infoindex = var_6060b78c.var_ba8bdc4c.infoindex;
	var_dd06123.var_fddbd3ce = var_6060b78c.var_ba8bdc4c.var_f130571c;
	var_dd06123.isfirstperson = var_6060b78c.var_ba8bdc4c.var_1be950f5;
	var_dd06123.starttime = var_6060b78c.var_ba8bdc4c.starttime;
	var_dd06123.endtime = var_6060b78c.var_ba8bdc4c.endtime;
	var_dd06123.duration = duration;
	var_dd06123.priority = int(var_6060b78c.var_ba8bdc4c.priority);
	var_dd06123.var_dc3eafbf = var_6060b78c.var_e567d17;
	var_dd06123.var_61d85ed2 = function_c7e98e25(var_6060b78c);
	function_92d1707f(#"hash_83a3293e7437420", var_dd06123);
}

/*
	Name: post_round_potm
	Namespace: potm
	Checksum: 0x9F9FE930
	Offset: 0x1060
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function post_round_potm()
{
	if(!function_ec01de3())
	{
		/#
			println("");
		#/
		return;
	}
	/#
		println("");
	#/
	level function_b6a5e7fa();
}

/*
	Name: function_b0bc26b3
	Namespace: potm
	Checksum: 0x100BF88A
	Offset: 0x10D8
	Size: 0x176
	Parameters: 2
	Flags: Linked
*/
function function_b0bc26b3(deathtime, starttime)
{
	self endon(#"disconnect", #"end_killcam");
	var_a7e16ed3 = deathtime - starttime;
	waitbeforedeath = 1;
	timetowait = max(0, (float(var_a7e16ed3) / 1000) - waitbeforedeath);
	game.var_a1e9e96a = gettime() + (timetowait * 1000);
	wait(timetowait);
	util::setclientsysstate("levelNotify", "sndFKsl");
	self playlocalsound(#"hash_2b537a3a26b6b64a");
	setslowmotion(1, 0.25, waitbeforedeath);
	wait(waitbeforedeath);
	self playlocalsound(#"hash_6cc0ea056038c67c");
	setslowmotion(0.25, 1, 1);
	game.var_a1e9e96a = undefined;
}

/*
	Name: function_f909006c
	Namespace: potm
	Checksum: 0x56B90B93
	Offset: 0x1258
	Size: 0x46C
	Parameters: 1
	Flags: Linked
*/
function function_f909006c(var_ba8bdc4c)
{
	self endon(#"disconnect", #"end_killcam");
	if(!isdefined(var_ba8bdc4c.var_b86d6c40))
	{
		return;
	}
	if(var_ba8bdc4c.var_b86d6c40.size <= 0)
	{
		return;
	}
	currenttime = gettime();
	starttime = var_ba8bdc4c.starttime;
	var_dcbc5c97 = arraycopy(var_ba8bdc4c.var_b86d6c40);
	luinotifyevent(#"clear_notification_queue");
	while(true)
	{
		waitframe(1);
		if(var_dcbc5c97.size <= 0)
		{
			break;
		}
		index = 0;
		timeelapsed = gettime() - currenttime;
		do
		{
			var_e0aa3530 = var_dcbc5c97[index];
			if(var_e0aa3530.time - starttime < timeelapsed)
			{
				if(var_e0aa3530.var_65e76577 == #"medal")
				{
					var_b9a3e1a0 = {};
					var_b9a3e1a0.medal_index = var_e0aa3530.eventdata.tableindex;
					if(isdefined(var_b9a3e1a0.medal_index))
					{
						luinotifyevent(#"medal_received", 1, var_b9a3e1a0.medal_index);
					}
				}
				else
				{
					if(var_e0aa3530.var_65e76577 == #"score_event")
					{
						if(isdefined(var_e0aa3530.eventdata.event_info))
						{
							label = rank::getscoreinfolabel(var_e0aa3530.eventdata.event_info);
							score = rank::getscoreinfovalue(var_e0aa3530.eventdata.event_info);
							combatefficiencyscore = rank::function_4587103(var_e0aa3530.eventdata.event_info);
							eventindex = level.scoreinfo[var_e0aa3530.eventdata.event_info][#"row"];
						}
						else
						{
							label = var_e0aa3530.eventdata.label;
							score = var_e0aa3530.eventdata.score;
							combatefficiencyscore = var_e0aa3530.eventdata.combatefficiencyscore;
							eventindex = var_e0aa3530.eventdata.eventindex;
						}
						if(!isdefined(label))
						{
							label = #"hash_480234a872bd64ac";
						}
						if(!isdefined(score))
						{
							score = 0;
						}
						if(!isdefined(combatefficiencyscore))
						{
							combatefficiencyscore = 0;
						}
						if(!isdefined(eventindex))
						{
							eventindex = 1;
						}
						luinotifyevent(#"score_event", 4, label, score, combatefficiencyscore, eventindex);
					}
					else if(var_e0aa3530.var_65e76577 == #"hash_4aa652796cc3e19")
					{
						label = var_e0aa3530.eventdata.label;
						score = var_e0aa3530.eventdata.score;
						tier = var_e0aa3530.eventdata.tier;
						if(!isdefined(label))
						{
							label = #"hash_480234a872bd64ac";
						}
						if(!isdefined(score))
						{
							score = 0;
						}
						if(!isdefined(tier))
						{
							tier = 0;
						}
						luinotifyevent(#"hash_4aa652796cc3e19", 3, label, score, tier);
					}
				}
				array::pop(var_dcbc5c97, index, 0);
			}
			else
			{
				index++;
			}
		}
		while(index < var_dcbc5c97.size);
	}
}

/*
	Name: play_potm_on_player_internal
	Namespace: potm
	Checksum: 0xF61BC4DB
	Offset: 0x16D0
	Size: 0x556
	Parameters: 1
	Flags: Linked, Private
*/
function private play_potm_on_player_internal(event)
{
	var_61d85ed2 = event.var_ba8bdc4c.var_61d85ed2;
	var_f92eaa56 = isdefined(var_61d85ed2);
	if(var_f92eaa56)
	{
		var_900768bc = function_876f528(event.var_ba8bdc4c.infoindex);
		killcamentitystarttime = killcam::get_killcam_entity_info_starttime(var_61d85ed2.killcam_entity_info);
		killcamoffset = (float(gettime() - event.var_ba8bdc4c.starttime)) / 1000;
		killcamlength = ((float(event.var_ba8bdc4c.endtime - event.var_ba8bdc4c.starttime)) / 1000) - 0.05;
		killcamstarttime = event.var_ba8bdc4c.starttime;
		spectatorclient = var_61d85ed2.spectatorclientnum;
		var_1c66b97d = var_61d85ed2.var_1c66b97d;
		targetentityindex = var_61d85ed2.targetentityindex;
		offsettime = var_61d85ed2.offsettime;
	}
	else
	{
		var_900768bc = function_876f528(event.var_ba8bdc4c.infoindex);
		killcamoffset = (float(gettime() - event.var_ba8bdc4c.starttime)) / 1000;
		killcamlength = (float(event.var_ba8bdc4c.endtime - event.var_ba8bdc4c.starttime)) / 1000;
		spectatorclient = event.clientnum;
		var_1c66b97d = event.clientxuid;
		targetentityindex = -1;
		offsettime = 0;
	}
	self notify(#"begin_killcam", {#start_time:gettime()});
	self.sessionstate = "spectator";
	self.spectatorclient = spectatorclient;
	self.var_1c66b97d = var_1c66b97d;
	self.killcamentity = -1;
	if(var_f92eaa56)
	{
		self thread killcam::set_killcam_entities(var_61d85ed2.killcam_entity_info, killcamstarttime);
		self.killcamweapon = var_61d85ed2.weapon;
		self.killcammod = var_61d85ed2.meansofdeath;
	}
	self.killcamtargetentity = targetentityindex;
	self.archivetime = killcamoffset;
	self.killcamlength = killcamlength;
	self.psoffsettime = offsettime;
	foreach(team, _ in level.teams)
	{
		self allowspectateteam(team, 1);
	}
	self allowspectateteam("freelook", 1);
	self allowspectateteam(#"none", 1);
	self callback::function_d8abfc3d(#"on_end_game", &killcam::function_f5f2d8e6);
	waitframe(1);
	self thread killcam::check_for_abrupt_end();
	self.killcam = 1;
	self thread killcam::wait_killcam_time();
	if(var_f92eaa56)
	{
		if(game.var_701e85bf)
		{
			self thread function_b0bc26b3(var_61d85ed2.deathtime, killcamstarttime);
		}
	}
	else if(isdefined(var_900768bc))
	{
		if(game.var_701e85bf)
		{
			self thread function_b0bc26b3(event.var_ba8bdc4c.endtime - var_900768bc.secondsafter, event.var_ba8bdc4c.starttime);
		}
	}
	self waittill(#"end_killcam");
	self.sessionstate = "dead";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.spectatekillcam = 0;
}

/*
	Name: play_potm_on_player
	Namespace: potm
	Checksum: 0xDFC6D0B3
	Offset: 0x1C30
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private play_potm_on_player(event)
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	if(isdefined(game.var_321b0d80))
	{
		self [[game.var_321b0d80]](event.clientxuid);
	}
	play_potm_on_player_internal(event);
	self val::set(#"potm", "freezecontrols");
	self killcam::end(1);
}

/*
	Name: function_afe21831
	Namespace: potm
	Checksum: 0xB4B9F90C
	Offset: 0x1CF0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_afe21831()
{
	if(!isenabled())
	{
		return 0;
	}
	return game.potmevents.size;
}

/*
	Name: function_cd1447ce
	Namespace: potm
	Checksum: 0x6B48DBD7
	Offset: 0x1D20
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function function_cd1447ce()
{
	self endon(#"disconnect");
	level endon(#"game_ended", #"potm_finished");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		if(menu == "PlayOfTheMatchWidget")
		{
			if(isplayer(self) && response == "voteSkip")
			{
				self.var_3211ad9b = 1;
				self clientfield::set_player_uimodel("hudItems.voteKillcamSkip", 1);
				return;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_a76f0a49
	Namespace: potm
	Checksum: 0xA59EA749
	Offset: 0x1E28
	Size: 0x31E
	Parameters: 0
	Flags: Linked
*/
function function_a76f0a49()
{
	level endon(#"game_ended", #"potm_finished");
	numplayers = 0;
	foreach(player in level.players)
	{
		if(!isbot(player))
		{
			numplayers++;
		}
	}
	var_a818d531 = numplayers;
	foreach(player in level.players)
	{
		player clientfield::set_player_uimodel("hudItems.voteRequired", var_a818d531);
	}
	while(true)
	{
		var_927f9075 = 0;
		foreach(player in level.players)
		{
			if(isdefined(player.var_3211ad9b) && player.var_3211ad9b)
			{
				var_927f9075++;
			}
		}
		foreach(player in level.players)
		{
			player clientfield::set_player_uimodel("hudItems.voteCommitted", var_927f9075);
		}
		waitframe(1);
		if(var_927f9075 >= var_a818d531)
		{
			foreach(player in level.players)
			{
				player killcam::function_875fc588();
			}
			return;
		}
	}
}

/*
	Name: function_449c210c
	Namespace: potm
	Checksum: 0x14F63C33
	Offset: 0x2150
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_449c210c()
{
	foreach(player in level.players)
	{
		player.var_3211ad9b = 0;
		player clientfield::set_player_uimodel("hudItems.voteKillcamSkip", 0);
		if(!isbot(player))
		{
			player thread function_cd1447ce();
		}
	}
	level thread function_a76f0a49();
}

/*
	Name: function_65839288
	Namespace: potm
	Checksum: 0x5D4FF099
	Offset: 0x2240
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_65839288(event)
{
	if(!isdefined(event.var_ba8bdc4c.var_c79756c4))
	{
		return;
	}
	/#
		println(((("" + event.var_ba8bdc4c.var_c79756c4) + "") + event.var_ba8bdc4c.var_ccfb7703) + "");
	#/
	level util::create_streamer_hint(event.var_ba8bdc4c.var_c79756c4, event.var_ba8bdc4c.var_ccfb7703, 0.9);
}

/*
	Name: function_caf394b8
	Namespace: potm
	Checksum: 0x9BCCB28
	Offset: 0x2308
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_caf394b8(duration)
{
	if(!isdefined(game.var_a1e9e96a))
	{
		return true;
	}
	if(gettime() + duration < game.var_a1e9e96a)
	{
		return true;
	}
	return false;
}

/*
	Name: function_60211cf4
	Namespace: potm
	Checksum: 0xEECA5E9A
	Offset: 0x2350
	Size: 0x4D2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_60211cf4(sequence)
{
	level endon(#"potm_finished", #"game_ended");
	/#
		assert(sequence.params.events.size > 0);
	#/
	starttimescale = 1;
	var_4aa538e6 = 0;
	currenttime = gettime();
	var_aa5d1f5b = 0;
	currenttimescale = starttimescale;
	if(isdefined(sequence.var_aa5d1f5b))
	{
		var_aa5d1f5b = sequence.var_aa5d1f5b;
	}
	do
	{
		event = sequence.params.events[var_4aa538e6];
		processevent = 1;
		if(var_aa5d1f5b > 0)
		{
			if(var_aa5d1f5b >= event.duration)
			{
				var_aa5d1f5b = var_aa5d1f5b - event.duration;
				processevent = 0;
			}
			else
			{
				event.duration = event.duration - var_aa5d1f5b;
				var_aa5d1f5b = 0;
			}
		}
		if(event.luievent != "")
		{
			luinotifyevent(event.luievent);
		}
		if(processevent)
		{
			foreach(player in level.players)
			{
				cmd = 1;
				if(var_4aa538e6 == 0 && game.var_142de1de == 0)
				{
					goto_btapi_refillammoifneededservice = [[game.var_94f3e5d2]]();
				}
				else
				{
					goto_btapi_refillammoifneededservice = 0;
				}
				if(goto_btapi_refillammoifneededservice > 0)
				{
					cmd = cmd | 4;
				}
				if(isdefined(sequence.var_50c26ba) && sequence.var_50c26ba > 0)
				{
					var_fa042c40 = sequence.var_50c26ba;
					/#
						println(("" + var_fa042c40) + "");
					#/
				}
				else
				{
					if(isdefined(sequence.inflictorentnum))
					{
						var_fa042c40 = sequence.inflictorentnum;
						/#
							println(("" + var_fa042c40) + "");
						#/
					}
					else
					{
						/#
							println("");
						#/
						var_fa042c40 = 0;
					}
				}
				player function_705598e4(cmd, sequence.infoindex, sequence.var_9806ad5a, var_4aa538e6, sequence.params.events[var_4aa538e6].var_c7fdcb01, goto_btapi_refillammoifneededservice, var_fa042c40);
			}
			game.var_142de1de = 0;
			if(var_4aa538e6 > 0)
			{
				starttimescale = sequence.params.events[var_4aa538e6 - 1].timescale;
			}
			else
			{
				starttimescale = 1;
			}
			currenttimescale = event.timescale;
			if(function_caf394b8(event.duration))
			{
				setslowmotion(starttimescale, currenttimescale, event.duration);
			}
			wait(event.duration);
		}
		var_4aa538e6++;
	}
	while(var_4aa538e6 < sequence.params.events.size);
	if(function_caf394b8(0))
	{
		setslowmotion(currenttimescale, 1, 0);
	}
	timeelapsed = (float(gettime() - currenttime)) / 1000;
	if(sequence.duration > timeelapsed)
	{
		wait(sequence.duration - timeelapsed);
	}
}

/*
	Name: function_e6934aaa
	Namespace: potm
	Checksum: 0xDC1A1F99
	Offset: 0x2830
	Size: 0x90
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e6934aaa()
{
	foreach(player in level.players)
	{
		player function_eb0dd56(0);
	}
}

/*
	Name: function_404ffafb
	Namespace: potm
	Checksum: 0x7F1099CA
	Offset: 0x28C8
	Size: 0x8E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_404ffafb(var_353e7913, var_550d79fc, var_19e3f5ac)
{
	var_6e17bdac = {};
	var_6e17bdac.starttime = var_550d79fc;
	var_6e17bdac.endtime = var_19e3f5ac;
	var_6e17bdac.duration = (float(var_6e17bdac.endtime - var_6e17bdac.starttime)) / 1000;
	var_6e17bdac.var_cef682cb = 1;
	return var_6e17bdac;
}

/*
	Name: function_2c7586e6
	Namespace: potm
	Checksum: 0xBCA0AE1B
	Offset: 0x2960
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2c7586e6(str_notify)
{
	luinotifyevent(#"hash_5bcad2526c42e308");
}

/*
	Name: function_b1b3bfc5
	Namespace: potm
	Checksum: 0x806869B9
	Offset: 0x2998
	Size: 0xA34
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b1b3bfc5(event, var_50c26ba)
{
	level endoncallback(&function_2c7586e6, #"potm_finished", #"game_ended");
	if(!game.var_50b05a28)
	{
		return;
	}
	if(!isdefined(event.var_ba8bdc4c.var_ccda367c) || event.var_ba8bdc4c.var_ccda367c.size <= 0)
	{
		return;
	}
	artillery_mus_crowd_bossbattle = event.var_ba8bdc4c.var_ccda367c;
	var_353e7913 = [];
	var_550d79fc = undefined;
	var_5d6aaf90 = 0;
	isintro = 1;
	do
	{
		var_a73108fa = artillery_mus_crowd_bossbattle[var_5d6aaf90];
		infoindex = var_a73108fa.infoindex;
		var_900768bc = function_876f528(infoindex);
		result = function_211b7237(infoindex, isintro);
		if(isdefined(result))
		{
			params = function_66aa4b70(infoindex, result.var_9806ad5a);
			if(isdefined(params))
			{
				sequence = {};
				duration = 0;
				foreach(var_67d7854 in params.events)
				{
					duration = duration + abs(var_67d7854.duration);
				}
				duration = duration * 1000;
				if(isintro)
				{
					sequence.starttime = event.var_ba8bdc4c.starttime;
				}
				else
				{
					/#
						assert(params.events.size > 0);
					#/
					var_d0382a1f = params.events[0].lerp_duration;
					var_fe39cea0 = params.events[0].duration;
					if(var_d0382a1f < 0)
					{
						var_fe39cea0 = var_fe39cea0 + var_d0382a1f;
					}
					if(var_fe39cea0 < 0)
					{
						sequence.starttime = var_a73108fa.time + (var_fe39cea0 * 1000);
						if(params.events.size <= 1)
						{
							params.events[0].duration = abs(var_fe39cea0);
						}
						else
						{
							var_bbc632fa = var_fe39cea0;
							for(eventindex = 1; eventindex < params.events.size; eventindex++)
							{
								var_7acd420d = params.events[eventindex].lerp_duration;
								if(var_7acd420d < 0)
								{
									params.events[eventindex - 1].duration = abs((var_bbc632fa - params.events[eventindex].duration) - var_7acd420d);
									var_bbc632fa = params.events[eventindex].duration + var_7acd420d;
									continue;
								}
								params.events[eventindex - 1].duration = abs(var_bbc632fa - params.events[eventindex].duration);
								var_bbc632fa = params.events[eventindex].duration;
							}
							params.events[params.events.size - 1].duration = 0;
						}
					}
					else
					{
						sequence.starttime = var_a73108fa.time;
						if(var_d0382a1f < 0)
						{
							sequence.starttime = var_a73108fa.time + (var_d0382a1f * 1000);
						}
					}
				}
				sequence.var_50c26ba = var_50c26ba;
				sequence.mainclientnum = var_a73108fa.mainclientnum;
				sequence.otherclientnum = var_a73108fa.otherclientnum;
				sequence.inflictorentnum = var_a73108fa.inflictorentnum;
				/#
					println(("" + sequence.var_50c26ba) + "");
				#/
				sequence.endtime = min(sequence.starttime + duration, event.var_ba8bdc4c.endtime);
				sequence.params = params;
				sequence.isintro = isintro;
				sequence.infoindex = infoindex;
				sequence.var_9806ad5a = result.var_9806ad5a;
				sequence.duration = (float(sequence.endtime - sequence.starttime)) / 1000;
				addsequence = 1;
				if(isdefined(var_550d79fc))
				{
					if(var_550d79fc >= sequence.starttime)
					{
						if(var_550d79fc >= sequence.endtime)
						{
							addsequence = 0;
							/#
								println(((((((((((((((((("" + var_5d6aaf90) + "") + var_550d79fc) + "") + sequence.starttime) + "") + var_353e7913.size) + "") + sequence.starttime) + "") + sequence.endtime) + "") + infoindex) + "") + isintro) + "") + result.var_9806ad5a) + "");
							#/
						}
						else
						{
							sequence.var_aa5d1f5b = (float(var_550d79fc - sequence.starttime)) / 1000;
						}
					}
					else
					{
						var_6e17bdac = function_404ffafb(var_353e7913, var_550d79fc, sequence.starttime);
						/#
							println(((((("" + var_353e7913.size) + "") + var_6e17bdac.starttime) + "") + var_6e17bdac.endtime) + "");
						#/
						array::add(var_353e7913, var_6e17bdac);
					}
				}
				if(addsequence)
				{
					/#
						println(((((((((((("" + var_353e7913.size) + "") + sequence.starttime) + "") + sequence.endtime) + "") + infoindex) + "") + isintro) + "") + result.var_9806ad5a) + "");
					#/
					var_550d79fc = sequence.endtime;
					array::add(var_353e7913, sequence);
				}
			}
		}
		if(isintro)
		{
			else
			{
			}
			isintro = 0;
		}
		else
		{
			var_5d6aaf90++;
		}
	}
	while(var_5d6aaf90 < artillery_mus_crowd_bossbattle.size);
	if(isdefined(var_550d79fc) && var_550d79fc < event.var_ba8bdc4c.endtime)
	{
		var_6e17bdac = function_404ffafb(var_353e7913, var_550d79fc, event.var_ba8bdc4c.endtime);
		/#
			println(((((("" + var_353e7913.size) + "") + var_6e17bdac.starttime) + "") + var_6e17bdac.endtime) + "");
		#/
		array::add(var_353e7913, var_6e17bdac);
	}
	foreach(sequence in var_353e7913)
	{
		if(isdefined(sequence.var_cef682cb) && sequence.var_cef682cb == 1)
		{
			wait(sequence.duration);
			continue;
		}
		function_60211cf4(sequence);
	}
	function_e6934aaa();
	function_2c7586e6();
}

/*
	Name: function_a85adb2c
	Namespace: potm
	Checksum: 0x847FC97B
	Offset: 0x33D8
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a85adb2c(delta)
{
	self endon(#"end_killcam", #"hash_17418db31d60118f");
	time = gettime();
	delta = delta - 300;
	if(delta > 0)
	{
		wait(float(delta) / 1000);
	}
	luinotifyevent(#"post_potm_transition");
}

/*
	Name: play_potm
	Namespace: potm
	Checksum: 0xBBE24CAF
	Offset: 0x3478
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function play_potm(var_a7f35e6d)
{
	if(isdefined(level.var_869c7fba) && level.var_869c7fba)
	{
		return;
	}
	level.var_869c7fba = 1;
	/#
		println("");
	#/
	level waittill(#"play_potm");
	function_b6a5e7fa(var_a7f35e6d);
}

/*
	Name: function_b6a5e7fa
	Namespace: potm
	Checksum: 0x6F61EC12
	Offset: 0x3510
	Size: 0x99C
	Parameters: 1
	Flags: Linked
*/
function function_b6a5e7fa(var_a7f35e6d)
{
	if(!isdefined(var_a7f35e6d))
	{
		var_a7f35e6d = 1;
	}
	function_bbbd20cc(1);
	function_f19228da();
	if(game.potmevents.size == 0)
	{
		/#
			println("");
		#/
		level notify(#"potm_finished");
		/#
			println("");
		#/
		level.var_869c7fba = 0;
		return;
	}
	if(isdefined(game.potmevents[0]) && isdefined(game.potmevents[0].clientnum))
	{
		luinotifyevent(#"potm_client", 1, game.potmevents[0].clientnum);
	}
	level function_65839288(game.potmevents[0]);
	setslowmotion(1, 1, 0);
	level.infinalkillcam = 1;
	if(util::waslastround())
	{
		setmatchflag("round_end_killcam", 0);
	}
	visionsetnaked("default", 0);
	setmatchflag("potm", 1);
	luinotifyevent(#"potm_fadeout");
	level notify(#"pre_potm");
	wait(0.25);
	exit = 0;
	count = 0;
	game.var_142de1de = 1;
	while(!exit && count < var_a7f35e6d)
	{
		/#
			println(("" + count) + "");
		#/
		for(eventindex = 0; eventindex < game.potmevents.size && !exit; eventindex++)
		{
			event = game.potmevents[eventindex];
			var_50c26ba = 0;
			if(isdefined(event.var_ba8bdc4c.var_61d85ed2))
			{
				var_61d85ed2 = event.var_ba8bdc4c.var_61d85ed2;
				if(!isdefined(var_61d85ed2.targetentityindex))
				{
					continue;
				}
				else
				{
					var_50c26ba = var_61d85ed2.targetentityindex;
				}
				attacker = var_61d85ed2.attacker;
				if(isdefined(attacker) && isdefined(attacker.archetype) && attacker.archetype == "mannequin")
				{
					continue;
				}
			}
			/#
				println(((("" + eventindex) + "") + game.potmevents.size) + "");
			#/
			level function_65839288(event);
			startplayofthematch(eventindex);
			thread function_b1b3bfc5(event, var_50c26ba);
			level.var_5e18ae78 = eventindex;
			level notify(#"potm_selected");
			foreach(player in level.players)
			{
				player setclientuivisibilityflag("hud_visible", 1);
			}
			waitframe(1);
			thread function_a85adb2c(event.var_ba8bdc4c.endtime - event.var_ba8bdc4c.starttime);
			level notify(#"hash_4ead2cd3fa59f29b");
			function_a714a888(event.var_ba8bdc4c);
			function_fff1ad7e(event.clientxuid);
			level thread function_f909006c(event.var_ba8bdc4c);
			if(isdefined(event.clientnum))
			{
				player = getentbynum(event.clientnum);
				if(isplayer(player))
				{
					player stats::function_dad108fa(#"featured_in_best_play", 1);
				}
			}
			for(index = 0; index < level.players.size; index++)
			{
				player = level.players[index];
				if(!player function_8b1a219a())
				{
					player closeingamemenu();
				}
				player thread play_potm_on_player(event);
			}
			wait(0.1);
			luinotifyevent(#"potm_fadein");
			while(killcam::are_any_players_watching() && !exit)
			{
				for(index = 0; index < level.players.size; index++)
				{
					player = level.players[index];
					if(game.var_6bd02863)
					{
						if(player jumpbuttonpressed())
						{
							exit = 1;
							/#
								println("");
							#/
						}
					}
				}
				waitframe(1);
			}
		}
		count++;
	}
	foreach(player in level.players)
	{
		player unlink(1);
	}
	util::wait_network_frame();
	util::setclientsysstate("levelNotify", "sndFKe");
	if(exit)
	{
		self notify(#"hash_17418db31d60118f");
		luinotifyevent(#"post_potm_transition");
		wait(0.3);
	}
	foreach(player in level.players)
	{
		player killcam::spawn_end_of_final_killcam();
		if(game.var_50b05a28)
		{
			player function_eb0dd56(0);
		}
	}
	stopplayofthematch();
	setmatchflag("potm", 0);
	luinotifyevent(#"potm_client", 1, -1);
	luinotifyevent(#"clear_notification_queue");
	level.infinalkillcam = 0;
	level notify(#"potm_finished");
	level.var_869c7fba = 0;
	level.var_5e18ae78 = undefined;
	/#
		println("");
	#/
}

/*
	Name: function_ede9fbc1
	Namespace: potm
	Checksum: 0x6D767498
	Offset: 0x3EB8
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_ede9fbc1()
{
	self.sessionstate = "playing";
	self.spectatorclient = -1;
	self function_223716c();
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.spectatekillcam = 0;
	self function_223716c();
	self val::reset(#"potm", "freezecontrols");
	self val::reset(#"spectate", "freezecontrols");
	self freezecontrols(0);
}

/*
	Name: function_d1cb3471
	Namespace: potm
	Checksum: 0x54FCA973
	Offset: 0x3FA8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_d1cb3471()
{
}

/*
	Name: waitthennotifyplaypotm
	Namespace: potm
	Checksum: 0xCFEBE62F
	Offset: 0x4020
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private waitthennotifyplaypotm()
{
	/#
		setdvar(#"scr_force_potm", 0);
		setdvar(#"hash_2428eb9c3d05eee0", 0);
		level function_b6a5e7fa(1);
	#/
}

/*
	Name: function_797778b5
	Namespace: potm
	Checksum: 0xBB9213AE
	Offset: 0x4090
	Size: 0xA6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_797778b5()
{
	var_6fa74f86 = -1;
	for(i = 0; i < game.potmevents.size; i++)
	{
		event = game.potmevents[i];
		if(var_6fa74f86 < 0 || event.var_ba8bdc4c.priority < game.potmevents[var_6fa74f86].var_ba8bdc4c.priority)
		{
			var_6fa74f86 = i;
		}
	}
	return var_6fa74f86;
}

/*
	Name: function_a0b212
	Namespace: potm
	Checksum: 0xF4C711F5
	Offset: 0x4140
	Size: 0x144
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a0b212(var_6fa74f86)
{
	/#
		assert(var_6fa74f86 >= 0, "");
	#/
	/#
		assert(var_6fa74f86 < game.potmevents.size);
	#/
	if(removepotmevent(var_6fa74f86))
	{
		/#
			println(((("" + var_6fa74f86) + "") + game.potmevents[var_6fa74f86].var_ba8bdc4c.priority) + "");
		#/
		array::pop(game.potmevents, var_6fa74f86, 0);
	}
	else
	{
		/#
			println(((("" + var_6fa74f86) + "") + game.potmevents[var_6fa74f86].var_ba8bdc4c.priority) + "");
		#/
	}
}

/*
	Name: function_f19228da
	Namespace: potm
	Checksum: 0x31B64464
	Offset: 0x4290
	Size: 0x4B4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f19228da()
{
	if(game.var_12ffe1e3.size <= 0)
	{
		return;
	}
	if(is_true(level.infinalkillcam))
	{
		return;
	}
	level.var_e99fd3d1 = 1;
	for(i = 0; i < game.var_12ffe1e3.size; i++)
	{
		item = game.var_12ffe1e3[i];
		if(!isdefined(item.var_ba8bdc4c) || !isdefined(item.var_ba8bdc4c.priority))
		{
			/#
				println("");
			#/
			continue;
		}
		if(!isdefined(item.var_ba8bdc4c.starttime) || !isdefined(item.var_ba8bdc4c.endtime))
		{
			continue;
		}
		var_a0b212 = 0;
		var_6fa74f86 = -1;
		var_42f86adc = function_8c9585ea(item.var_ba8bdc4c.endtime - item.var_ba8bdc4c.starttime);
		if(game.potmevents.size >= game.potm_max_events || !var_42f86adc)
		{
			if(game.potmevents.size <= 0)
			{
				/#
					println("");
				#/
				continue;
			}
			var_6fa74f86 = function_797778b5();
			/#
				assert(var_6fa74f86 >= 0, "");
			#/
			/#
				assert(var_6fa74f86 < game.potmevents.size);
			#/
			if(isdefined(game.potmevents[var_6fa74f86]) && isdefined(game.potmevents[var_6fa74f86].var_ba8bdc4c) && isdefined(game.potmevents[var_6fa74f86].var_ba8bdc4c.priority) && game.potmevents[var_6fa74f86].var_ba8bdc4c.priority > item.var_ba8bdc4c.priority)
			{
				continue;
			}
			if(!var_42f86adc)
			{
				/#
					println("");
				#/
				function_a0b212(var_6fa74f86);
			}
			else
			{
				var_a0b212 = 1;
			}
		}
		if(addpotmevent(item.var_ba8bdc4c.starttime, item.var_ba8bdc4c.endtime, item.clientnum))
		{
			/#
				println(("" + game.var_12ffe1e3[i].var_ba8bdc4c.priority) + "");
			#/
			array::push(game.potmevents, game.var_12ffe1e3[i], game.potmevents.size);
			/#
				if(getdvarint(#"scr_potm_debug_print", 0) == 1)
				{
					printplayofthematchdebuginformation(item.var_ba8bdc4c.starttime, item.var_ba8bdc4c.endtime);
				}
			#/
			if(var_a0b212 == 1)
			{
				function_a0b212(var_6fa74f86);
			}
		}
		else
		{
			/#
				println(("" + game.var_12ffe1e3[i].var_ba8bdc4c.priority) + "");
			#/
		}
		/#
			updatedebugmenudata(1);
		#/
	}
	level.var_e99fd3d1 = 0;
	game.var_12ffe1e3 = [];
}

/*
	Name: function_bc21fc81
	Namespace: potm
	Checksum: 0x6A4977
	Offset: 0x4750
	Size: 0x38
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bc21fc81()
{
	while(true)
	{
		waitframe(1);
		function_bbbd20cc(0);
		function_f19228da();
	}
}

/*
	Name: function_43690387
	Namespace: potm
	Checksum: 0xEE8B4F05
	Offset: 0x4790
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43690387(xuid)
{
	if(!level.rankedmatch)
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	if(!isdefined(xuid))
	{
		return;
	}
	if(self getxuid() == xuid)
	{
		self stats::set_stat(#"hash_151429c0411edbfb", 0);
	}
	else
	{
		self stats::inc_stat(#"hash_151429c0411edbfb", 1);
	}
}

/*
	Name: function_2da4a527
	Namespace: potm
	Checksum: 0xB0DF258B
	Offset: 0x4840
	Size: 0xE2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2da4a527()
{
	if(isdefined(game.var_5028ba3c) && !level.rankedmatch && isplayer(self))
	{
		var_ac5cbd49 = self stats::get_stat(#"hash_151429c0411edbfb");
		for(i = game.var_5028ba3c.size - 1; i >= 0; i--)
		{
			if(var_ac5cbd49 >= game.var_5028ba3c[i].var_58e4affc)
			{
				return game.var_5028ba3c[i].boost;
			}
		}
	}
	return function_d46f78f8();
}

/*
	Name: function_fff1ad7e
	Namespace: potm
	Checksum: 0x5ABD4953
	Offset: 0x4930
	Size: 0x13C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fff1ad7e(var_740b4e7b)
{
	foundplayer = 0;
	foreach(var_e705c59f in game.var_b2ee45db)
	{
		if(var_e705c59f.xuid == var_740b4e7b)
		{
			var_e705c59f.weight = game.var_c7826a3f;
			foundplayer = 1;
			continue;
		}
		var_e705c59f.weight = min(var_e705c59f.weight + game.var_b924522a, 1);
	}
	if(!foundplayer)
	{
		array::add(game.var_b2ee45db, {#weight:game.var_c7826a3f, #xuid:var_740b4e7b}, 0);
	}
}

/*
	Name: function_b83114d9
	Namespace: potm
	Checksum: 0x629FA4BA
	Offset: 0x4A78
	Size: 0xF2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b83114d9()
{
	if(!isplayer(self))
	{
		return function_d46f78f8();
	}
	xuid = self getxuid();
	foreach(var_e705c59f in game.var_b2ee45db)
	{
		if(var_e705c59f.xuid == xuid)
		{
			return var_e705c59f.weight;
		}
	}
	return function_d46f78f8();
}

/*
	Name: function_a714a888
	Namespace: potm
	Checksum: 0x11B0678E
	Offset: 0x4B78
	Size: 0xC8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a714a888(var_ba8bdc4c)
{
	if(!isdefined(var_ba8bdc4c.var_ccda367c))
	{
		return;
	}
	if(var_ba8bdc4c.var_ccda367c.size <= 0)
	{
		return;
	}
	foreach(details in var_ba8bdc4c.var_ccda367c)
	{
		array::add(game.var_fc393bcd, details.infoindex, 0);
	}
}

/*
	Name: function_f2d75983
	Namespace: potm
	Checksum: 0x63973AF7
	Offset: 0x4C48
	Size: 0xAA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f2d75983(var_900768bc)
{
	foreach(var_3cf71079 in game.var_fc393bcd)
	{
		if(var_900768bc.index == var_3cf71079)
		{
			return var_900768bc.var_54a85e75;
		}
	}
	return function_d46f78f8();
}

/*
	Name: function_3ca7924f
	Namespace: potm
	Checksum: 0x8FE1FCD7
	Offset: 0x4D00
	Size: 0x12
	Parameters: 1
	Flags: Linked
*/
function function_3ca7924f(var_900768bc)
{
	return 0;
}

/*
	Name: function_d46f78f8
	Namespace: potm
	Checksum: 0xB263C57
	Offset: 0x4D20
	Size: 0x1A
	Parameters: 2
	Flags: Linked
*/
function function_d46f78f8(var_900768bc, var_81538b15)
{
	return 1;
}

/*
	Name: function_e6c9822f
	Namespace: potm
	Checksum: 0x4B5D8D7B
	Offset: 0x4D48
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_e6c9822f(var_900768bc)
{
	return function_3ca7924f(var_900768bc);
}

/*
	Name: function_20422a1a
	Namespace: potm
	Checksum: 0x8402C917
	Offset: 0x4D78
	Size: 0xBC
	Parameters: 2
	Flags: Linked
*/
function function_20422a1a(var_900768bc, var_81538b15)
{
	multiplier = function_d46f78f8();
	if(game.roundsplayed > 0)
	{
		var_a8f06888 = function_f2d75983(var_900768bc);
		multiplier = multiplier * var_a8f06888;
	}
	var_1ef31b3 = var_81538b15 function_2da4a527();
	multiplier = multiplier * var_1ef31b3;
	var_ecac7086 = var_81538b15 function_b83114d9();
	multiplier = multiplier * var_ecac7086;
	return multiplier;
}

/*
	Name: function_5570c594
	Namespace: potm
	Checksum: 0xD29E61BB
	Offset: 0x4E40
	Size: 0x20
	Parameters: 1
	Flags: Linked
*/
function function_5570c594(var_900768bc)
{
	return var_900768bc.var_912b5565 * level.round_number;
}

/*
	Name: function_34576c1
	Namespace: potm
	Checksum: 0x53CF80CC
	Offset: 0x4E68
	Size: 0x2A
	Parameters: 2
	Flags: Linked
*/
function function_34576c1(var_900768bc, var_81538b15)
{
	return function_d46f78f8(var_81538b15);
}

/*
	Name: function_e81fe19d
	Namespace: potm
	Checksum: 0xEAE1425B
	Offset: 0x4EA0
	Size: 0x31C
	Parameters: 1
	Flags: Private
*/
function private function_e81fe19d(bookmark)
{
	/#
		var_567b8be5 = (("" + bookmark.var_65e76577) + "") + bookmark.time;
		if(isdefined(bookmark.var_900768bc))
		{
			var_567b8be5 = var_567b8be5 + ((("" + bookmark.var_900768bc.index) + "") + bookmark.var_900768bc.id);
		}
		if(isdefined(bookmark.isfirstperson))
		{
			var_567b8be5 = var_567b8be5 + ("" + bookmark.isfirstperson);
		}
		if(isdefined(bookmark.var_81538b15))
		{
			var_567b8be5 = var_567b8be5 + ("" + function_ec9661b4(bookmark.var_81538b15));
		}
		if(isdefined(bookmark.var_f28fb772))
		{
			var_567b8be5 = var_567b8be5 + ("" + function_ec9661b4(bookmark.var_f28fb772));
		}
		if(isdefined(bookmark.scoreaddition))
		{
			var_567b8be5 = var_567b8be5 + ("" + bookmark.scoreaddition);
		}
		if(isdefined(bookmark.scoremultiplier))
		{
			var_567b8be5 = var_567b8be5 + ("" + bookmark.scoremultiplier);
		}
		if(isdefined(bookmark.scoreeventpriority))
		{
			var_567b8be5 = var_567b8be5 + ("" + bookmark.scoreeventpriority);
		}
		if(isdefined(bookmark.var_50d1e41a) && bookmark.var_50d1e41a.size > 0)
		{
			var_567b8be5 = var_567b8be5 + "";
			foreach(var_df1ff5a in bookmark.var_50d1e41a)
			{
				var_567b8be5 = var_567b8be5 + ("" + var_df1ff5a);
			}
		}
		if(isdefined(bookmark.overrideentitycamera))
		{
			var_567b8be5 = var_567b8be5 + ("" + bookmark.overrideentitycamera);
		}
		if(isdefined(bookmark.eventdata.tableindex))
		{
			var_567b8be5 = var_567b8be5 + ("" + bookmark.eventdata.tableindex);
		}
		if(isdefined(bookmark.eventdata.event_info))
		{
			var_567b8be5 = var_567b8be5 + ("" + bookmark.eventdata.event_info);
		}
		println(var_567b8be5 + "");
	#/
}

/*
	Name: function_5b1e9ed4
	Namespace: potm
	Checksum: 0x45943E7F
	Offset: 0x51C8
	Size: 0x7A0
	Parameters: 10
	Flags: Linked
*/
function function_5b1e9ed4(modulename, var_65e76577, time, var_81538b15, var_f28fb772, scoreeventpriority, einflictor, var_50d1e41a, overrideentitycamera, eventdata)
{
	if(level.potm_enabled !== 1)
	{
		return;
	}
	var_7491f0eb = 0;
	if(modulename == #"potm")
	{
		var_7491f0eb = 1;
	}
	if(isdefined(einflictor))
	{
		inflictorenttype = einflictor getentitytype();
	}
	else
	{
		inflictorenttype = 0;
	}
	if(!isdefined(var_50d1e41a) || var_50d1e41a.size <= 0)
	{
		var_50d1e41a = [];
		array::add(var_50d1e41a, #"");
	}
	/#
		var_6f810a5 = "";
		foreach(var_df1ff5a in var_50d1e41a)
		{
			var_6f810a5 = var_6f810a5 + ("" + var_df1ff5a);
		}
	#/
	var_900768bc = function_79c0d595(var_65e76577, inflictorenttype, var_50d1e41a);
	if(!isdefined(var_900768bc))
	{
		/#
			println(((((((function_9e72a96(modulename) + "") + var_65e76577) + "") + inflictorenttype) + "") + var_6f810a5) + "");
		#/
		return undefined;
	}
	if(var_7491f0eb && isdefined(var_81538b15) && isplayer(var_81538b15) && !isalive(var_81538b15))
	{
		/#
			println((((((((function_9e72a96(modulename) + "") + var_65e76577) + "") + inflictorenttype) + "") + var_6f810a5) + "") + var_81538b15 getentitynumber() + "");
		#/
		return undefined;
	}
	if(is_true(level.infinalkillcam))
	{
		/#
			println(((((((function_9e72a96(modulename) + "") + var_65e76577) + "") + inflictorenttype) + "") + var_6f810a5) + "");
		#/
		return undefined;
	}
	bookmark = spawnstruct();
	bookmark.var_65e76577 = var_65e76577;
	bookmark.time = time;
	bookmark.var_81538b15 = var_81538b15;
	if(isdefined(var_81538b15))
	{
		bookmark.mainclientnum = var_81538b15 getentitynumber();
		if(isplayer(var_81538b15))
		{
			bookmark.var_ea3fa3e = var_81538b15 getxuid();
		}
		else
		{
			bookmark.var_ea3fa3e = 0;
		}
	}
	else
	{
		bookmark.mainclientnum = -1;
		bookmark.var_ea3fa3e = 0;
	}
	if(isdefined(var_f28fb772))
	{
		bookmark.var_f28fb772 = var_f28fb772;
		bookmark.otherclientnum = var_f28fb772 getentitynumber();
		if(isplayer(var_f28fb772))
		{
			bookmark.var_6ae7938a = var_f28fb772 getxuid();
		}
		else
		{
			bookmark.var_6ae7938a = 0;
		}
	}
	else
	{
		bookmark.otherclientnum = -1;
		bookmark.var_6ae7938a = 0;
	}
	if(isdefined(einflictor))
	{
		bookmark.inflictorentnum = einflictor getentitynumber();
		bookmark.inflictorenttype = inflictorenttype;
		if(isdefined(einflictor.birthtime))
		{
			bookmark.var_5f0256c4 = einflictor.birthtime;
		}
		else
		{
			bookmark.var_5f0256c4 = 0;
		}
	}
	else
	{
		bookmark.inflictorentnum = -1;
		bookmark.inflictorenttype = inflictorenttype;
		bookmark.var_5f0256c4 = 0;
	}
	bookmark.var_50d1e41a = var_50d1e41a;
	if(isdefined(eventdata))
	{
		bookmark.eventdata = eventdata;
	}
	else
	{
		bookmark.eventdata = {};
		bookmark.eventdata.tableindex = 0;
		bookmark.eventdata.event_info = #"";
	}
	if(isdefined(scoreeventpriority))
	{
		bookmark.scoreeventpriority = scoreeventpriority;
	}
	else
	{
		bookmark.scoreeventpriority = 0;
	}
	if(var_7491f0eb)
	{
		bookmark.scoreaddition = [[game.var_4afb166c]](var_900768bc);
		bookmark.scoremultiplier = [[game.var_2e431430]](var_900768bc, var_81538b15);
		if(var_900768bc.var_10400a6f)
		{
			var_6060b78c = function_4a28cb83(bookmark.mainclientnum);
			if(!isdefined(var_6060b78c))
			{
				/#
					println(("" + bookmark.var_65e76577) + "");
				#/
				return undefined;
			}
			if(!isdefined(var_6060b78c.var_ba8bdc4c) || !isdefined(var_6060b78c.var_ba8bdc4c.infoindex))
			{
				/#
					println(("" + bookmark.var_65e76577) + "");
				#/
				return undefined;
			}
			bookmark.isfirstperson = function_876f528(var_6060b78c.var_ba8bdc4c.infoindex).isfirstperson;
		}
		else
		{
			bookmark.isfirstperson = var_900768bc.isfirstperson;
			if(isdefined(overrideentitycamera) && overrideentitycamera == 1)
			{
				bookmark.isfirstperson = 1;
			}
		}
	}
	bookmark.var_900768bc = var_900768bc;
	if(var_7491f0eb)
	{
		/#
			function_e81fe19d(bookmark);
		#/
		function_b5433e55(bookmark);
	}
	return bookmark;
}

/*
	Name: function_775b9ad1
	Namespace: potm
	Checksum: 0x30B2AD88
	Offset: 0x5970
	Size: 0x80
	Parameters: 2
	Flags: Linked
*/
function function_775b9ad1(weapon, meansofdeath)
{
	var_50d1e41a = [];
	if(isdefined(weapon))
	{
		array::add(var_50d1e41a, weapon.name);
	}
	if(isdefined(meansofdeath))
	{
		array::add(var_50d1e41a, hash(meansofdeath));
	}
	return var_50d1e41a;
}

/*
	Name: function_5523a49a
	Namespace: potm
	Checksum: 0x74431FCC
	Offset: 0x59F8
	Size: 0x2CA
	Parameters: 14
	Flags: Linked
*/
function function_5523a49a(var_65e76577, spectatorclientnum, var_1c66b97d, targetentity, killcam_entity_info, weapon, meansofdeath, deathtime, deathtimeoffset, offsettime, perks, killstreaks, attacker, einflictor)
{
	if(!isenabled())
	{
		return;
	}
	if(isdefined(einflictor))
	{
		inflictorenttype = einflictor getentitytype();
	}
	else
	{
		inflictorenttype = -1;
	}
	var_50d1e41a = function_775b9ad1(weapon, meansofdeath);
	var_900768bc = function_79c0d595(var_65e76577, inflictorenttype, var_50d1e41a);
	if(!isdefined(var_900768bc))
	{
		return;
	}
	var_4acb70d6 = function_4f69bbd(spectatorclientnum, var_1c66b97d, var_900768bc.isfirstperson, 0);
	if(!isdefined(var_4acb70d6))
	{
		return;
	}
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2 = {};
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.spectatorclientnum = spectatorclientnum;
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.var_1c66b97d = var_1c66b97d;
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.targetentityindex = targetentity getentitynumber();
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.killcam_entity_info = killcam_entity_info;
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.weapon = weapon;
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.meansofdeath = meansofdeath;
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.deathtime = deathtime;
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.deathtimeoffset = deathtimeoffset;
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.offsettime = offsettime;
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.perks = perks;
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.killstreaks = killstreaks;
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.attacker = attacker;
	var_4acb70d6.var_ba8bdc4c.var_61d85ed2.inflictor = einflictor;
}

/*
	Name: kill_bookmark
	Namespace: potm
	Checksum: 0x7A3E899D
	Offset: 0x5CD0
	Size: 0x17C
	Parameters: 5
	Flags: Linked
*/
function kill_bookmark(var_81538b15, var_f28fb772, einflictor, var_50d1e41a, overrideentitycamera)
{
	if(!isenabled())
	{
		return;
	}
	if(!game.var_659f084a && isbot(var_81538b15))
	{
		return;
	}
	if(game.var_691bbcd2)
	{
		/#
			println("");
		#/
		return;
	}
	mainclientnum = var_81538b15 getentitynumber();
	if(!game.var_659f084a && mainclientnum >= level.players.size)
	{
		/#
			println(((("" + mainclientnum) + "") + level.players.size) + "");
		#/
		return;
	}
	bookmark = function_5b1e9ed4(game.var_8ea529d1, #"kill", gettime(), var_81538b15, var_f28fb772, 0, einflictor, var_50d1e41a, overrideentitycamera);
	function_47a69b74(bookmark);
}

/*
	Name: function_66d09fea
	Namespace: potm
	Checksum: 0x87B651DF
	Offset: 0x5E58
	Size: 0x194
	Parameters: 6
	Flags: None
*/
function function_66d09fea(var_65e76577, var_81538b15, var_f28fb772, einflictor, var_50d1e41a, overrideentitycamera)
{
	if(!isenabled())
	{
		return;
	}
	if(!game.var_659f084a && isbot(var_81538b15))
	{
		return;
	}
	if(game.var_691bbcd2)
	{
		/#
			println(function_9e72a96(game.var_8ea529d1) + "");
		#/
		return;
	}
	mainclientnum = var_81538b15 getentitynumber();
	if(!game.var_659f084a && mainclientnum >= level.players.size)
	{
		/#
			println(((("" + mainclientnum) + "") + level.players.size) + "");
		#/
		return;
	}
	bookmark = function_5b1e9ed4(game.var_8ea529d1, var_65e76577, gettime(), var_81538b15, var_f28fb772, 0, einflictor, var_50d1e41a, overrideentitycamera);
	function_47a69b74(bookmark);
}

/*
	Name: function_651a5f4
	Namespace: potm
	Checksum: 0x9673E9CE
	Offset: 0x5FF8
	Size: 0x144
	Parameters: 2
	Flags: None
*/
function function_651a5f4(var_81538b15, einflictor)
{
	if(!isdefined(einflictor))
	{
		einflictor = var_81538b15;
	}
	if(!isenabled())
	{
		return;
	}
	if(!game.var_659f084a && isbot(var_81538b15))
	{
		return;
	}
	mainclientnum = var_81538b15 getentitynumber();
	if(!game.var_659f084a && mainclientnum >= level.players.size)
	{
		/#
			println(((("" + mainclientnum) + "") + level.players.size) + "");
		#/
		return;
	}
	bookmark = function_5b1e9ed4(game.var_8ea529d1, #"object_destroy", gettime(), var_81538b15, undefined, 0, einflictor);
	function_47a69b74(bookmark);
}

/*
	Name: event_bookmark
	Namespace: potm
	Checksum: 0x3FE1EECC
	Offset: 0x6148
	Size: 0xC4
	Parameters: 5
	Flags: Linked
*/
function event_bookmark(var_65e76577, time, var_81538b15, scoreeventpriority, eventdata)
{
	if(!isenabled())
	{
		return;
	}
	if(!isdefined(var_81538b15))
	{
		return;
	}
	if(!game.var_659f084a && isbot(var_81538b15))
	{
		return;
	}
	bookmark = function_5b1e9ed4(game.var_8ea529d1, var_65e76577, time, var_81538b15, undefined, scoreeventpriority, undefined, undefined, 0, eventdata);
	function_47a69b74(bookmark);
}

/*
	Name: function_d6b60141
	Namespace: potm
	Checksum: 0x8EED0319
	Offset: 0x6218
	Size: 0xAC
	Parameters: 6
	Flags: None
*/
function function_d6b60141(event_name, client, label, score, combatefficiencyscore, eventindex)
{
	if(!isenabled())
	{
		return;
	}
	/#
	#/
	eventdata = {};
	eventdata.label = label;
	eventdata.score = score;
	eventdata.combatefficiencyscore = combatefficiencyscore;
	eventdata.eventindex = eventindex;
	event_bookmark(event_name, gettime(), client, 0, eventdata);
}

/*
	Name: function_bcad6f70
	Namespace: potm
	Checksum: 0x21A69344
	Offset: 0x62D0
	Size: 0x94
	Parameters: 5
	Flags: None
*/
function function_bcad6f70(event_name, client, label, score, tier)
{
	if(!isenabled())
	{
		return;
	}
	eventdata = {};
	eventdata.label = label;
	eventdata.score = score;
	eventdata.tier = tier;
	event_bookmark(event_name, gettime(), client, 0, eventdata);
}

/*
	Name: bookmark
	Namespace: potm
	Checksum: 0x4CC1992A
	Offset: 0x6370
	Size: 0xB4
	Parameters: 5
	Flags: Linked
*/
function bookmark(var_65e76577, time, var_81538b15, var_f28fb772, scoreeventpriority)
{
	if(!isenabled())
	{
		return;
	}
	if(!isdefined(var_81538b15))
	{
		return;
	}
	if(!game.var_659f084a && isbot(var_81538b15))
	{
		return;
	}
	bookmark = function_5b1e9ed4(game.var_8ea529d1, var_65e76577, time, var_81538b15, var_f28fb772, scoreeventpriority);
	function_47a69b74(bookmark);
}

/*
	Name: function_79c0d595
	Namespace: potm
	Checksum: 0x3CD12910
	Offset: 0x6430
	Size: 0x24E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_79c0d595(var_65e76577, etype, var_50d1e41a)
{
	result = undefined;
	var_bee9d27f = 0;
	var_91d32f1 = 0;
	for(i = 0; i < game.var_92c9543b.size; i++)
	{
		info = game.var_92c9543b[i];
		if(info.var_65e76577 == var_65e76577 && (!info.var_339c3400 || (isdefined(info.etype) && info.etype == etype)))
		{
			foreach(var_df1ff5a in var_50d1e41a)
			{
				if(info.var_4e86a573 == var_df1ff5a)
				{
					if(info.var_38446242 == level.var_837aa533)
					{
						return info;
					}
					if(info.var_38446242 == #"")
					{
						result = info;
						var_bee9d27f = 1;
					}
				}
			}
			if(!var_bee9d27f)
			{
				if(info.var_4e86a573 == #"" && info.var_38446242 == level.var_837aa533)
				{
					result = info;
					var_91d32f1 = 1;
					continue;
				}
				if(!var_91d32f1 && info.var_4e86a573 == #"" && info.var_38446242 == #"")
				{
					result = info;
				}
			}
		}
	}
	return result;
}

/*
	Name: function_876f528
	Namespace: potm
	Checksum: 0xC6CBC183
	Offset: 0x6688
	Size: 0xA0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_876f528(infoindex)
{
	/#
		assert(infoindex < game.var_92c9543b.size);
	#/
	if(infoindex >= game.var_92c9543b.size)
	{
		/#
			println(((("" + infoindex) + "") + game.var_92c9543b.size) + "");
		#/
		return undefined;
	}
	return game.var_92c9543b[infoindex];
}

/*
	Name: function_e38a52f0
	Namespace: potm
	Checksum: 0x88FF1BE9
	Offset: 0x6730
	Size: 0x6C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e38a52f0(clientnum, bookmark)
{
	if(bookmark.var_65e76577 == #"player_revived")
	{
		return bookmark.mainclientnum == clientnum || bookmark.otherclientnum == clientnum;
	}
	return bookmark.mainclientnum == clientnum;
}

/*
	Name: function_a8295237
	Namespace: potm
	Checksum: 0x19CBA9D3
	Offset: 0x67A8
	Size: 0xCA
	Parameters: 3
	Flags: Linked, Private
*/
function private function_a8295237(bookmark, var_6060b78c, var_c3d39fa)
{
	if(var_6060b78c.var_ba8bdc4c.endtime < bookmark.time - (bookmark.var_900768bc.secondsbefore + var_c3d39fa))
	{
		return false;
	}
	if(game.var_c7a2645f > 0 && ((bookmark.time + bookmark.var_900768bc.secondsafter) - var_6060b78c.var_ba8bdc4c.starttime) > (int(game.var_c7a2645f * 1000)))
	{
		return false;
	}
	return true;
}

/*
	Name: function_cbc0ec1c
	Namespace: potm
	Checksum: 0xF2477B2E
	Offset: 0x6880
	Size: 0xAE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_cbc0ec1c(bookmark, var_6060b78c)
{
	if(!isdefined(bookmark.var_81538b15))
	{
		/#
			println(("" + bookmark.var_65e76577) + "");
		#/
		return;
	}
	if(isdefined(var_6060b78c.var_ba8bdc4c.streamerhint))
	{
		return;
	}
	var_6060b78c.var_ba8bdc4c.var_c79756c4 = bookmark.var_81538b15.origin;
	var_6060b78c.var_ba8bdc4c.var_ccfb7703 = bookmark.var_81538b15.angles;
}

/*
	Name: function_d832ee94
	Namespace: potm
	Checksum: 0xEA2B5D89
	Offset: 0x6938
	Size: 0x1F4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d832ee94(var_6060b78c, bookmark)
{
	if(bookmark.var_65e76577 != #"medal" && bookmark.var_65e76577 != #"score_event" && bookmark.var_65e76577 != #"hash_4aa652796cc3e19")
	{
		return;
	}
	if(!isdefined(bookmark.var_81538b15))
	{
		if(isdefined(bookmark.eventdata.event_info))
		{
			/#
				println(((((("" + bookmark.var_65e76577) + "") + bookmark.eventdata.tableindex) + "") + bookmark.eventdata.event_info) + "");
			#/
		}
		else
		{
			/#
				println(("" + bookmark.var_65e76577) + "");
			#/
		}
		return;
	}
	if(!isdefined(var_6060b78c.var_ba8bdc4c.var_b86d6c40))
	{
		var_6060b78c.var_ba8bdc4c.var_b86d6c40 = [];
	}
	var_e0aa3530 = {};
	var_e0aa3530.var_65e76577 = bookmark.var_65e76577;
	var_e0aa3530.time = bookmark.time + 50;
	var_e0aa3530.player = bookmark.var_81538b15;
	var_e0aa3530.eventdata = bookmark.eventdata;
	array::push(var_6060b78c.var_ba8bdc4c.var_b86d6c40, var_e0aa3530, var_6060b78c.var_ba8bdc4c.var_b86d6c40.size);
}

/*
	Name: function_c03e8a9d
	Namespace: potm
	Checksum: 0xA53693F
	Offset: 0x6B38
	Size: 0xEC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c03e8a9d(bookmark, var_6060b78c)
{
	if(!isdefined(var_6060b78c.var_ba8bdc4c.var_ccda367c))
	{
		var_6060b78c.var_ba8bdc4c.var_ccda367c = [];
	}
	var_ccda367c = {};
	var_ccda367c.var_65e76577 = bookmark.var_65e76577;
	var_ccda367c.time = bookmark.time;
	var_ccda367c.infoindex = bookmark.var_900768bc.index;
	var_ccda367c.inflictorentnum = bookmark.inflictorentnum;
	var_ccda367c.mainclientnum = bookmark.mainclientnum;
	var_ccda367c.otherclientnum = bookmark.otherclientnum;
	array::push(var_6060b78c.var_ba8bdc4c.var_ccda367c, var_ccda367c, var_6060b78c.var_ba8bdc4c.var_ccda367c.size);
}

/*
	Name: function_a273a8ff
	Namespace: potm
	Checksum: 0x323946E1
	Offset: 0x6C30
	Size: 0xF4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a273a8ff(bookmark, var_e567d17)
{
	if(var_e567d17 < 1)
	{
		var_4e28bc2b = bookmark.var_900768bc.var_25ceff27;
	}
	else
	{
		var_4e28bc2b = bookmark.var_900768bc.prioritystackfactor + bookmark.var_900768bc.var_25ceff27;
	}
	if(bookmark.var_900768bc.var_10400a6f)
	{
		var_12058023 = var_4e28bc2b * bookmark.scoreeventpriority;
	}
	else
	{
		var_12058023 = 0;
		if(var_e567d17 >= 1)
		{
			var_12058023 = var_12058023 + (var_e567d17 * var_4e28bc2b);
		}
		else
		{
			var_12058023 = var_12058023 + var_4e28bc2b;
		}
	}
	var_12058023 = var_12058023 + bookmark.scoreaddition;
	var_12058023 = var_12058023 * bookmark.scoremultiplier;
	return var_12058023;
}

/*
	Name: function_1dd2e5ca
	Namespace: potm
	Checksum: 0x1D2F2D0
	Offset: 0x6D30
	Size: 0x4BC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1dd2e5ca(bookmark, var_6060b78c)
{
	if(var_6060b78c.var_3444056b)
	{
		if(bookmark.var_900768bc.var_10400a6f && function_e38a52f0(var_6060b78c.clientnum, bookmark) && var_6060b78c.var_ba8bdc4c.endtime >= (bookmark.time - bookmark.var_900768bc.secondsbefore))
		{
			var_6060b78c.var_ba8bdc4c.priority = var_6060b78c.var_ba8bdc4c.priority + function_a273a8ff(bookmark, var_6060b78c.var_e567d17);
			var_6060b78c.updatetime = gettime();
			function_d832ee94(var_6060b78c, bookmark);
		}
		else if(!bookmark.var_900768bc.var_10400a6f && function_e38a52f0(var_6060b78c.clientnum, bookmark))
		{
			var_c3d39fa = function_3aa16058(var_6060b78c);
			if(function_a8295237(bookmark, var_6060b78c, var_c3d39fa))
			{
				var_6060b78c.var_ba8bdc4c.endtime = bookmark.time + bookmark.var_900768bc.secondsafter;
				var_6060b78c.var_ba8bdc4c.priority = var_6060b78c.var_ba8bdc4c.priority + function_a273a8ff(bookmark, var_6060b78c.var_e567d17);
				var_6060b78c.var_e567d17++;
				var_6060b78c.updatetime = gettime();
				function_c03e8a9d(bookmark, var_6060b78c);
			}
			else
			{
				clientnum = var_6060b78c.clientnum;
				clientxuid = var_6060b78c.clientxuid;
				function_9ad04689(var_6060b78c);
				function_1cc3b6fd(var_6060b78c);
				var_6060b78c = function_929d9485(clientnum, clientxuid);
			}
		}
	}
	if(!var_6060b78c.var_3444056b)
	{
		if(!bookmark.var_900768bc.var_10400a6f && function_e38a52f0(var_6060b78c.clientnum, bookmark))
		{
			last_spawn_time = 0;
			if(isdefined(bookmark.var_81538b15) && isdefined(bookmark.var_81538b15.lastspawntime))
			{
				last_spawn_time = bookmark.var_81538b15.lastspawntime;
			}
			var_6060b78c.var_ba8bdc4c.starttime = int(max(last_spawn_time, bookmark.time - bookmark.var_900768bc.secondsbefore));
			var_6060b78c.var_ba8bdc4c.endtime = bookmark.time + bookmark.var_900768bc.secondsafter;
			if(var_6060b78c.var_ba8bdc4c.endtime <= var_6060b78c.var_ba8bdc4c.starttime)
			{
				function_1cc3b6fd(var_6060b78c);
				return;
			}
			var_6060b78c.var_ba8bdc4c.priority = var_6060b78c.var_ba8bdc4c.priority + function_a273a8ff(bookmark, var_6060b78c.var_e567d17);
			var_6060b78c.var_ba8bdc4c.infoindex = bookmark.var_900768bc.index;
			var_6060b78c.var_ba8bdc4c.var_f130571c = bookmark.var_900768bc.id;
			var_6060b78c.var_ba8bdc4c.var_1be950f5 = 1;
			var_6060b78c.var_ba8bdc4c.var_61d85ed2 = bookmark.var_61d85ed2;
			var_6060b78c.var_e567d17 = 1;
			var_6060b78c.var_3444056b = 1;
			var_6060b78c.updatetime = gettime();
			function_c03e8a9d(bookmark, var_6060b78c);
			function_cbc0ec1c(bookmark, var_6060b78c);
		}
	}
}

/*
	Name: function_abd02279
	Namespace: potm
	Checksum: 0x7F36E3FB
	Offset: 0x71F8
	Size: 0x524
	Parameters: 2
	Flags: Linked, Private
*/
function private function_abd02279(bookmark, var_6060b78c)
{
	if(var_6060b78c.var_3444056b)
	{
		if(bookmark.var_900768bc.var_10400a6f && function_e38a52f0(var_6060b78c.clientnum, bookmark) && var_6060b78c.var_ba8bdc4c.endtime >= (bookmark.time - bookmark.var_900768bc.secondsbefore))
		{
			var_6060b78c.var_ba8bdc4c.priority = var_6060b78c.var_ba8bdc4c.priority + function_a273a8ff(bookmark, var_6060b78c.var_e567d17);
			var_6060b78c.updatetime = gettime();
			function_d832ee94(var_6060b78c, bookmark);
		}
		else if(!bookmark.var_900768bc.var_10400a6f && (function_e38a52f0(var_6060b78c.clientnum, bookmark) && bookmark.otherclientnum != bookmark.mainclientnum))
		{
			inflictorentnum = -1;
			if(isdefined(var_6060b78c.var_ba8bdc4c.var_61d85ed2) && isdefined(var_6060b78c.var_ba8bdc4c.var_61d85ed2.inflictor))
			{
				inflictorentnum = var_6060b78c.var_ba8bdc4c.var_61d85ed2.inflictor getentitynumber();
			}
			if(inflictorentnum == bookmark.inflictorentnum && (abs((var_6060b78c.var_ba8bdc4c.starttime + bookmark.var_900768bc.secondsbefore) - bookmark.time)) <= 500)
			{
				var_6060b78c.var_e567d17++;
				var_6060b78c.var_ba8bdc4c.priority = var_6060b78c.var_ba8bdc4c.priority + function_a273a8ff(bookmark, var_6060b78c.var_e567d17);
				var_6060b78c.updatetime = gettime();
				function_c03e8a9d(bookmark, var_6060b78c);
			}
			else
			{
				clientnum = var_6060b78c.clientnum;
				clientxuid = var_6060b78c.clientxuid;
				function_9ad04689(var_6060b78c);
				function_1cc3b6fd(var_6060b78c);
				var_6060b78c = function_929d9485(clientnum, clientxuid);
			}
		}
	}
	if(!var_6060b78c.var_3444056b)
	{
		if(!bookmark.var_900768bc.var_10400a6f && (function_e38a52f0(var_6060b78c.clientnum, bookmark) && bookmark.otherclientnum != bookmark.mainclientnum))
		{
			last_spawn_time = 0;
			if(isdefined(bookmark.var_81538b15) && isdefined(bookmark.var_81538b15.lastspawntime))
			{
				last_spawn_time = bookmark.var_81538b15.lastspawntime;
			}
			var_6060b78c.var_ba8bdc4c.starttime = int(max(last_spawn_time, bookmark.time - bookmark.var_900768bc.secondsbefore));
			var_6060b78c.var_ba8bdc4c.endtime = bookmark.time + bookmark.var_900768bc.secondsafter;
			var_6060b78c.var_ba8bdc4c.var_61d85ed2 = bookmark.var_61d85ed2;
			var_6060b78c.var_ba8bdc4c.priority = var_6060b78c.var_ba8bdc4c.priority + function_a273a8ff(bookmark, var_6060b78c.var_e567d17);
			var_6060b78c.var_ba8bdc4c.infoindex = bookmark.var_900768bc.index;
			var_6060b78c.var_ba8bdc4c.var_f130571c = bookmark.var_900768bc.id;
			var_6060b78c.var_ba8bdc4c.var_1be950f5 = 0;
			var_6060b78c.var_e567d17 = 1;
			var_6060b78c.var_3444056b = 1;
			var_6060b78c.updatetime = gettime();
			function_c03e8a9d(bookmark, var_6060b78c);
			function_cbc0ec1c(bookmark, var_6060b78c);
		}
	}
}

/*
	Name: function_13d710eb
	Namespace: potm
	Checksum: 0xAF488E01
	Offset: 0x7728
	Size: 0xFC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_13d710eb(bookmark, var_6060b78c)
{
	if(!var_6060b78c.var_3444056b)
	{
		return;
	}
	if(bookmark.time < var_6060b78c.var_ba8bdc4c.endtime)
	{
		var_6060b78c.var_ba8bdc4c.endtime = bookmark.time;
		var_6060b78c.var_ba8bdc4c.priority = var_6060b78c.var_ba8bdc4c.priority - (bookmark.var_900768bc.var_25ceff27 / 2);
	}
	if((var_6060b78c.var_ba8bdc4c.endtime - var_6060b78c.var_ba8bdc4c.starttime) >= 1000)
	{
		clientnum = var_6060b78c.clientnum;
		function_9ad04689(var_6060b78c);
	}
	function_1cc3b6fd(var_6060b78c);
}

/*
	Name: function_9ad04689
	Namespace: potm
	Checksum: 0x4D9E1CAE
	Offset: 0x7830
	Size: 0x12C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9ad04689(var_6060b78c)
{
	/#
		assert(level.var_e99fd3d1 == 0);
	#/
	if(!isdefined(var_6060b78c.var_ba8bdc4c) || var_6060b78c.var_ba8bdc4c.priority <= 0)
	{
		return;
	}
	if(is_true(level.infinalkillcam))
	{
		/#
			println("");
		#/
		return;
	}
	if(var_6060b78c.var_ba8bdc4c.endtime > gettime())
	{
		/#
			println("");
		#/
		var_6060b78c.var_ba8bdc4c.endtime = gettime() - 100;
	}
	array::push(game.var_12ffe1e3, var_6060b78c, game.var_12ffe1e3.size);
	function_b5633c73(var_6060b78c);
}

/*
	Name: function_929d9485
	Namespace: potm
	Checksum: 0x595813F6
	Offset: 0x7968
	Size: 0xB0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_929d9485(clientnum, clientxuid)
{
	var_6060b78c = spawnstruct();
	var_6060b78c.var_3444056b = 0;
	var_6060b78c.clientnum = clientnum;
	var_6060b78c.clientxuid = clientxuid;
	var_6060b78c.var_e567d17 = 0;
	var_6060b78c.var_ba8bdc4c = {};
	var_6060b78c.var_ba8bdc4c.priority = 0;
	array::push(game.var_aafe322f, var_6060b78c, game.var_aafe322f.size);
	return var_6060b78c;
}

/*
	Name: function_1cc3b6fd
	Namespace: potm
	Checksum: 0x47EEB35D
	Offset: 0x7A20
	Size: 0x6E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1cc3b6fd(var_6060b78c)
{
	for(i = 0; i < game.var_aafe322f.size; i++)
	{
		if(var_6060b78c == game.var_aafe322f[i])
		{
			array::pop(game.var_aafe322f, i, 0);
			return;
		}
	}
}

/*
	Name: function_4a28cb83
	Namespace: potm
	Checksum: 0x9E7AEAE3
	Offset: 0x7A98
	Size: 0xE4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4a28cb83(clientnum)
{
	index = undefined;
	for(i = 0; i < game.var_aafe322f.size; i++)
	{
		var_ad2d5156 = game.var_aafe322f[i];
		if(!var_ad2d5156.var_3444056b)
		{
			continue;
		}
		if(var_ad2d5156.clientnum != clientnum)
		{
			continue;
		}
		if(isdefined(index))
		{
			if(var_ad2d5156.updatetime > game.var_aafe322f[index].updatetime)
			{
				index = i;
			}
			continue;
		}
		index = i;
	}
	if(isdefined(index))
	{
		return game.var_aafe322f[index];
	}
	return undefined;
}

/*
	Name: function_4f69bbd
	Namespace: potm
	Checksum: 0xD87D2921
	Offset: 0x7B88
	Size: 0x11A
	Parameters: 4
	Flags: Linked, Private
*/
function private function_4f69bbd(clientnum, clientxuid, isfirstperson, b_add)
{
	for(i = 0; i < game.var_aafe322f.size; i++)
	{
		var_ad2d5156 = game.var_aafe322f[i];
		if(!var_ad2d5156.var_3444056b)
		{
			continue;
		}
		if(var_ad2d5156.clientnum != clientnum)
		{
			continue;
		}
		if(isdefined(isfirstperson))
		{
			if(isdefined(var_ad2d5156.var_ba8bdc4c.infoindex) && game.var_92c9543b[var_ad2d5156.var_ba8bdc4c.infoindex].isfirstperson == isfirstperson)
			{
				return var_ad2d5156;
			}
			continue;
			continue;
		}
		return var_ad2d5156;
	}
	if(b_add)
	{
		return function_929d9485(clientnum, clientxuid);
	}
	return undefined;
}

/*
	Name: function_3aa16058
	Namespace: potm
	Checksum: 0x1ADF64A0
	Offset: 0x7CB0
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3aa16058(var_6060b78c)
{
	var_c3d39fa = 0;
	if(!var_6060b78c.var_3444056b)
	{
		return var_c3d39fa;
	}
	if(!var_6060b78c.var_ba8bdc4c.var_1be950f5)
	{
		return 1;
	}
	var_c3d39fa = min(var_6060b78c.var_e567d17 * game.var_3a859f59, game.var_94fe2d81);
	return int(var_c3d39fa * 1000);
}

/*
	Name: function_bbbd20cc
	Namespace: potm
	Checksum: 0x4AA02970
	Offset: 0x7D50
	Size: 0x13C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bbbd20cc(var_fee35d3a)
{
	var_3fea636b = [];
	for(i = 0; i < game.var_aafe322f.size; i++)
	{
		var_ad2d5156 = game.var_aafe322f[i];
		thresholdtime = function_3aa16058(var_ad2d5156) + game.var_b9a7e65f;
		if(var_fee35d3a || (var_ad2d5156.var_3444056b && (gettime() - var_ad2d5156.var_ba8bdc4c.endtime) >= thresholdtime))
		{
			function_9ad04689(var_ad2d5156);
			array::push(var_3fea636b, i, var_3fea636b.size);
		}
	}
	for(j = var_3fea636b.size - 1; j >= 0; j--)
	{
		function_1cc3b6fd(game.var_aafe322f[var_3fea636b[j]]);
	}
}

/*
	Name: function_47a69b74
	Namespace: potm
	Checksum: 0x4E908314
	Offset: 0x7E98
	Size: 0x174
	Parameters: 1
	Flags: Linked, Private
*/
function private function_47a69b74(bookmark)
{
	if(!isdefined(bookmark))
	{
		return;
	}
	if(bookmark.var_900768bc.var_9a63503d)
	{
		do
		{
			var_6060b78c = function_4f69bbd(bookmark.otherclientnum, bookmark.var_6ae7938a, undefined, 0);
			if(!isdefined(var_6060b78c))
			{
				break;
			}
			function_13d710eb(bookmark, var_6060b78c);
		}
		while(1);
	}
	if(bookmark.var_900768bc.var_10400a6f)
	{
		var_6060b78c = function_4a28cb83(bookmark.mainclientnum);
		if(!isdefined(var_6060b78c))
		{
			/#
				println(("" + bookmark.var_65e76577) + "");
			#/
			return;
		}
	}
	else
	{
		var_6060b78c = function_4f69bbd(bookmark.mainclientnum, bookmark.var_ea3fa3e, bookmark.isfirstperson, 1);
	}
	if(bookmark.isfirstperson)
	{
		function_1dd2e5ca(bookmark, var_6060b78c);
	}
	else
	{
		function_abd02279(bookmark, var_6060b78c);
	}
}

/*
	Name: function_d34511e6
	Namespace: potm
	Checksum: 0x5253F05B
	Offset: 0x8018
	Size: 0x8
	Parameters: 0
	Flags: Linked
*/
function function_d34511e6()
{
	return true;
}

/*
	Name: function_66bbf824
	Namespace: potm
	Checksum: 0x43A7D45E
	Offset: 0x8028
	Size: 0x6
	Parameters: 0
	Flags: Linked
*/
function function_66bbf824()
{
	return false;
}

/*
	Name: function_c65274ed
	Namespace: potm
	Checksum: 0x6DB3D33D
	Offset: 0x8038
	Size: 0x6
	Parameters: 0
	Flags: Linked
*/
function function_c65274ed()
{
	return false;
}

/*
	Name: debuginit
	Namespace: potm
	Checksum: 0xE6CBD433
	Offset: 0x8048
	Size: 0x8C
	Parameters: 0
	Flags: Private
*/
function private debuginit()
{
	/#
		if(!isenabled())
		{
			return;
		}
		setdvar(#"scr_potm_debug", 0);
		setdvar(#"scr_potm_debug_print", 0);
		setdvar(#"scr_potm_debug_event_num", 1);
	#/
}

/*
	Name: updatedebugmenudata
	Namespace: potm
	Checksum: 0xA2EF43AE
	Offset: 0x80E0
	Size: 0x44C
	Parameters: 1
	Flags: Private
*/
function private updatedebugmenudata(forceupdate)
{
	/#
		self endon(#"disconnect");
		level endon(#"game_ended");
		if(!isdefined(level.potmdebugmenu))
		{
			return;
		}
		hostplayer = util::gethostplayer();
		menu = level.potmdebugmenu;
		debugeventnum = getdvarint(#"scr_potm_debug_event_num", 0);
		oldestarchivetime = getearliestarchiveclientinfotime();
		hostplayer setluimenudata(menu, #"oldestarchivetime", oldestarchivetime);
		if(isdefined(level.potmdebugeventnum) && level.potmdebugeventnum == debugeventnum && !forceupdate)
		{
			return;
		}
		level.potmdebugeventnum = debugeventnum;
		infoindex = #"n/a";
		starttime = -1;
		endtime = -1;
		duration = -1;
		priority = -1;
		var_e567d17 = 0;
		var_1be0f2c3 = "";
		var_4775155a = "";
		if(debugeventnum - 1 < game.potmevents.size)
		{
			event = game.potmevents[debugeventnum - 1];
			infoindex = event.var_ba8bdc4c.infoindex;
			starttime = event.var_ba8bdc4c.starttime;
			endtime = event.var_ba8bdc4c.endtime;
			duration = endtime - starttime;
			priority = event.var_ba8bdc4c.priority;
			var_e567d17 = event.var_e567d17;
			var_1be0f2c3 = function_c7e98e25(event);
		}
		hostplayer setluimenudata(menu, #"count", game.potmevents.size);
		hostplayer setluimenudata(menu, #"eventnum", int(debugeventnum));
		hostplayer setluimenudata(menu, #"eventinfoindex", infoindex);
		hostplayer setluimenudata(menu, #"eventstarttime", int(starttime));
		hostplayer setluimenudata(menu, #"eventendtime", int(endtime));
		hostplayer setluimenudata(menu, #"eventduration", int(duration));
		hostplayer setluimenudata(menu, #"scoreeventpriority", int(priority));
		hostplayer setluimenudata(menu, #"hash_752b983964003a68", int(var_e567d17));
		hostplayer setluimenudata(menu, #"hash_5935b658727b020c", var_1be0f2c3);
		hostplayer setluimenudata(menu, #"hash_33d80b75d9c6d88d", var_4775155a);
	#/
}

/*
	Name: updatedebugmenustate
	Namespace: potm
	Checksum: 0xB42ACD47
	Offset: 0x8538
	Size: 0xD8
	Parameters: 0
	Flags: Private
*/
function private updatedebugmenustate()
{
	/#
		player = util::gethostplayer();
		if(getdvarint(#"scr_potm_debug", 0) == 1)
		{
			if(!isdefined(level.potmdebugmenu) && isdefined(player))
			{
				level.potmdebugmenu = player openluimenu("");
				return true;
			}
		}
		else if(isdefined(level.potmdebugmenu))
		{
			player closeluimenu(level.potmdebugmenu);
			level.potmdebugmenu = undefined;
		}
		return false;
	#/
}

/*
	Name: debugupdate
	Namespace: potm
	Checksum: 0xA4F8999E
	Offset: 0x8620
	Size: 0x224
	Parameters: 0
	Flags: None
*/
function debugupdate()
{
	/#
		if(!isenabled())
		{
			return;
		}
		result = updatedebugmenustate();
		updatedebugmenudata(result);
		if(getdvarint(#"scr_force_potm", 0) == 1)
		{
			level thread waitthennotifyplaypotm();
		}
		if(getdvarint(#"hash_2428eb9c3d05eee0", 0) == 1)
		{
			level thread waitthennotifyplaypotm();
		}
		if(getdvarint(#"hash_198be770b0735f93", 0) == 1)
		{
			foreach(player in level.players)
			{
				player.sessionstate = "";
				player.spectatorclient = -1;
				player.var_1c66b97d = 0;
				player.killcamentity = -1;
				player.archivetime = 0;
				player.psoffsettime = 0;
				player.spectatekillcam = 0;
				player function_223716c();
				player val::reset(#"potm", "");
			}
			setdvar(#"hash_198be770b0735f93", 0);
		}
	#/
}

