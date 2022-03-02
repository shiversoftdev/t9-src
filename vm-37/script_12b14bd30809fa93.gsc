#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace status_effect_pulse;

/*
	Name: function_89f2df9
	Namespace: status_effect_pulse
	Checksum: 0x7EC92C0B
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"status_effect_pulse", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_pulse
	Checksum: 0x160CCF69
	Offset: 0xF8
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
	Checksum: 0xD5ED4715
	Offset: 0x150
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
	Checksum: 0x4EC8DCA
	Offset: 0x200
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
	Checksum: 0xE1F33A8
	Offset: 0x278
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

