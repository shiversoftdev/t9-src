#using scripts\core_common\math_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\audio_shared.csc;

#namespace empgrenade;

/*
	Name: __init__system__
	Namespace: empgrenade
	Checksum: 0xE2CD43C6
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"empgrenade", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: empgrenade
	Checksum: 0xCFA36D0
	Offset: 0x148
	Size: 0xB4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "empd", 1, 1, "int", &onempchanged, 0, 1);
	clientfield::register("toplayer", "empd_monitor_distance", 1, 1, "int", &onempmonitordistancechanged, 0, 0);
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: onempchanged
	Namespace: empgrenade
	Checksum: 0x7792C952
	Offset: 0x208
	Size: 0xD4
	Parameters: 7
	Flags: None
*/
function onempchanged(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	localplayer = function_5c10bd79(binitialsnap);
	if(bwastimejump == 1)
	{
		self startempeffects(localplayer);
	}
	else
	{
		already_distance_monitored = localplayer clientfield::get_to_player("empd_monitor_distance") == 1;
		if(!already_distance_monitored)
		{
			self stopempeffects(localplayer, fieldname);
		}
	}
}

/*
	Name: startempeffects
	Namespace: empgrenade
	Checksum: 0xCFBE977C
	Offset: 0x2E8
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function startempeffects(localplayer, bwastimejump)
{
	if(!isdefined(bwastimejump))
	{
		bwastimejump = 0;
	}
	if(!bwastimejump)
	{
		playsound(0, #"mpl_plr_emp_activate", (0, 0, 0));
	}
	audio::playloopat("mpl_plr_emp_looper", (0, 0, 0));
}

/*
	Name: stopempeffects
	Namespace: empgrenade
	Checksum: 0xFFCDC4BE
	Offset: 0x360
	Size: 0x84
	Parameters: 3
	Flags: None
*/
function stopempeffects(localplayer, oldval, bwastimejump)
{
	if(!isdefined(bwastimejump))
	{
		bwastimejump = 0;
	}
	if(oldval != 0 && !bwastimejump)
	{
		playsound(0, #"mpl_plr_emp_deactivate", (0, 0, 0));
	}
	audio::stoploopat("mpl_plr_emp_looper", (0, 0, 0));
}

/*
	Name: on_player_spawned
	Namespace: empgrenade
	Checksum: 0x9AF9CAB6
	Offset: 0x3F0
	Size: 0x120
	Parameters: 1
	Flags: None
*/
function on_player_spawned(localclientnum)
{
	self endon(#"disconnect");
	localplayer = function_5c10bd79(localclientnum);
	if(localplayer != self)
	{
		return;
	}
	curval = localplayer clientfield::get_to_player("empd_monitor_distance");
	inkillcam = function_1cbf351b(localclientnum);
	if(curval > 0 && localplayer isempjammed())
	{
		startempeffects(localplayer, inkillcam);
		localplayer monitordistance(localclientnum);
	}
	else
	{
		stopempeffects(localplayer, 0, 1);
		localplayer notify(#"end_emp_monitor_distance");
	}
}

/*
	Name: onempmonitordistancechanged
	Namespace: empgrenade
	Checksum: 0x85CFBFAC
	Offset: 0x518
	Size: 0xD0
	Parameters: 7
	Flags: None
*/
function onempmonitordistancechanged(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	localplayer = function_5c10bd79(bnewent);
	if(fieldname == 1)
	{
		startempeffects(localplayer, bwastimejump);
		localplayer monitordistance(bnewent);
	}
	else
	{
		stopempeffects(localplayer, binitialsnap, bwastimejump);
		localplayer notify(#"end_emp_monitor_distance");
	}
}

/*
	Name: monitordistance
	Namespace: empgrenade
	Checksum: 0x95276375
	Offset: 0x5F0
	Size: 0x318
	Parameters: 1
	Flags: None
*/
function monitordistance(localclientnum)
{
	localplayer = self;
	localplayer endon(#"death");
	localplayer endon(#"end_emp_monitor_distance");
	localplayer endon(#"team_changed");
	if(localplayer isempjammed() == 0)
	{
		return;
	}
	distance_to_closest_enemy_emp_ui_model = getuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "distanceToClosestEnemyEmpKillstreak");
	new_distance = 0;
	max_static_value = getdvarfloat(#"ks_emp_fullscreen_maxstaticvalue", 0);
	min_static_value = getdvarfloat(#"ks_emp_fullscreen_minstaticvalue", 0);
	min_radius_max_static = getdvarfloat(#"ks_emp_fullscreen_minradiusmaxstatic", 0);
	max_radius_min_static = getdvarfloat(#"ks_emp_fullscreen_maxradiusminstatic", 0);
	if(isdefined(distance_to_closest_enemy_emp_ui_model))
	{
		while(true)
		{
			/#
				max_static_value = getdvarfloat(#"ks_emp_fullscreen_maxstaticvalue", 0);
				min_static_value = getdvarfloat(#"ks_emp_fullscreen_minstaticvalue", 0);
				min_radius_max_static = getdvarfloat(#"ks_emp_fullscreen_minradiusmaxstatic", 0);
				max_radius_min_static = getdvarfloat(#"ks_emp_fullscreen_maxradiusminstatic", 0);
			#/
			new_distance = getuimodelvalue(distance_to_closest_enemy_emp_ui_model);
			range = max_radius_min_static - min_radius_max_static;
			current_static_value = max_static_value - (range <= 0 ? max_static_value : (new_distance - min_radius_max_static) / range);
			current_static_value = math::clamp(current_static_value, min_static_value, max_static_value);
			emp_grenaded = localplayer clientfield::get_to_player("empd") == 1;
			if(emp_grenaded && current_static_value < 1)
			{
				current_static_value = 1;
			}
			wait(0.1);
		}
	}
}

