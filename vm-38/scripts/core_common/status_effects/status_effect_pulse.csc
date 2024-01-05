#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\audio_shared.csc;

#namespace status_effect_pulse;

/*
	Name: function_64eb8c97
	Namespace: status_effect_pulse
	Checksum: 0x7654E2F
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_64eb8c97()
{
	level notify(1456516121);
}

/*
	Name: __init__system__
	Namespace: status_effect_pulse
	Checksum: 0xF0728B50
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_pulse", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_pulse
	Checksum: 0x756EFEFA
	Offset: 0x118
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "pulsed", 1, 1, "int", &on_pulsed_change, 0, 0);
}

/*
	Name: on_pulsed_change
	Namespace: status_effect_pulse
	Checksum: 0xFB3DE864
	Offset: 0x170
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function on_pulsed_change(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	localplayer = function_5c10bd79(binitialsnap);
	if(bwastimejump == 1)
	{
		self start_pulse_effects(localplayer);
	}
	else
	{
		self stop_pulse_effects(localplayer, fieldname);
	}
}

/*
	Name: start_pulse_effects
	Namespace: status_effect_pulse
	Checksum: 0x9A6ABCE8
	Offset: 0x220
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function start_pulse_effects(localplayer, bwastimejump)
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
	Name: stop_pulse_effects
	Namespace: status_effect_pulse
	Checksum: 0x80D97974
	Offset: 0x298
	Size: 0x84
	Parameters: 3
	Flags: Linked
*/
function stop_pulse_effects(localplayer, oldval, bwastimejump)
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

