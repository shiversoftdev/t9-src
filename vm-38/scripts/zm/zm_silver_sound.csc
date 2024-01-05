#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_f172695e;

/*
	Name: function_f2a8c8c9
	Namespace: namespace_f172695e
	Checksum: 0x641492C2
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f2a8c8c9()
{
	level notify(376812822);
}

/*
	Name: init
	Namespace: namespace_f172695e
	Checksum: 0xF8B85815
	Offset: 0x170
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level thread function_91c6e82a();
	level thread function_12b1d8eb();
	level thread function_1493eabf();
}

/*
	Name: function_12b1d8eb
	Namespace: namespace_f172695e
	Checksum: 0x41294A64
	Offset: 0x1C8
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_12b1d8eb()
{
	wait(1);
	audio::playloopat("mus_underscore_aboveground_loop_0", (0, 0, 0));
	audio::playloopat("mus_underscore_belowground_loop_0", (0, 0, 0));
	audio::playloopat(#"amb_computer", (156, 2017, -211));
	function_5ea2c6e3("mute_underscore_aboveground", 0);
	function_5ea2c6e3("mute_underscore_belowground", 0);
	level waittill(#"end_game");
	audio::stoploopat("mus_underscore_aboveground_loop_0", (0, 0, 0));
	audio::stoploopat("mus_underscore_belowground_loop_0", (0, 0, 0));
}

/*
	Name: startzmbspawnersoundloops
	Namespace: namespace_f172695e
	Checksum: 0x8C16BD56
	Offset: 0x2D0
	Size: 0x16C
	Parameters: 0
	Flags: None
*/
function startzmbspawnersoundloops()
{
	loopers = struct::get_array("spawn_location", "script_noteworthy");
	if(isdefined(loopers) && loopers.size > 0)
	{
		delay = 0;
		/#
			if(getdvarint(#"debug_audio", 0) > 0)
			{
				println(("" + loopers.size) + "");
			}
		#/
		for(i = 0; i < loopers.size; i++)
		{
			if(isdefined(loopers[i].script_sound))
			{
				continue;
			}
			loopers[i] thread soundloopthink();
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
	Name: soundloopthink
	Namespace: namespace_f172695e
	Checksum: 0xF5109C88
	Offset: 0x448
	Size: 0x18A
	Parameters: 0
	Flags: Linked
*/
function soundloopthink()
{
	if(!isdefined(self.origin))
	{
		return;
	}
	if(!isdefined(self.script_sound))
	{
		self.script_sound = "zmb_spawn_walla";
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
		soundloopemitter(self.script_sound, self.origin + vectorscale((0, 0, 1), 60));
	}
	if(notifyname != "")
	{
		for(;;)
		{
			level waittill(notifyname);
			if(started)
			{
				soundstoploopemitter(self.script_sound, self.origin + vectorscale((0, 0, 1), 60));
			}
			else
			{
				soundloopemitter(self.script_sound, self.origin + vectorscale((0, 0, 1), 60));
			}
			started = !started;
		}
	}
}

/*
	Name: function_91c6e82a
	Namespace: namespace_f172695e
	Checksum: 0x81F24ABA
	Offset: 0x5E0
	Size: 0x194
	Parameters: 0
	Flags: Linked
*/
function function_91c6e82a()
{
	level waittill(#"power_on");
	playsound(0, #"hash_507a8d3d4874b9ca", (984, -658, -207));
	wait(0.25);
	playsound(0, #"hash_61832f7330aa03c", (524, -84, -268));
	playsound(0, #"hash_129c564608f837b6", (524, -84, -268));
	wait(0.1);
	playsound(0, #"hash_487cbd8d6e939533", (524, -84, -268));
	wait(0.4);
	playsound(0, #"hash_43dad678bc35ddb7", (524, -84, -268));
	wait(0.5);
	playsound(0, #"hash_43dad678bc35ddb7", (-744, -1392, -322));
	wait(0.5);
	playsound(0, #"hash_43dad678bc35ddb7", (1641, 970, -360));
}

/*
	Name: function_2f3017ad
	Namespace: namespace_f172695e
	Checksum: 0x60FB945E
	Offset: 0x780
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_2f3017ad(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		function_21fee83f(bwasdemojump);
	}
	else
	{
		function_21fee83f(0);
	}
}

/*
	Name: function_21fee83f
	Namespace: namespace_f172695e
	Checksum: 0xF08C1A0E
	Offset: 0x800
	Size: 0x1BC
	Parameters: 1
	Flags: Linked
*/
function function_21fee83f(var_c4f44e2)
{
	self notify("348fa2cacc8e985f");
	self endon("348fa2cacc8e985f");
	if(!isdefined(level.var_4157094))
	{
		level.var_4157094 = 0;
	}
	if(!isdefined(level.var_c5cba082))
	{
		level.var_c5cba082 = 0;
	}
	if(var_c4f44e2 === 2)
	{
		function_672403ca("mute_underscore_aboveground", 1, 1);
		function_672403ca("mute_underscore_belowground", 1, 1);
		level.var_c5cba082 = 1;
		return;
	}
	n_start_delay = 0;
	if(var_c4f44e2 === 3)
	{
		level.var_c5cba082 = 0;
		var_c4f44e2 = level.var_4157094;
		n_start_delay = 4;
	}
	level.var_4157094 = var_c4f44e2;
	if(!level.var_c5cba082)
	{
		if(n_start_delay > 0)
		{
			wait(n_start_delay);
		}
		if(var_c4f44e2 === 0)
		{
			function_672403ca("mute_underscore_aboveground", 5, 0);
			function_672403ca("mute_underscore_belowground", 5, 1);
		}
		else
		{
			function_672403ca("mute_underscore_aboveground", 5, 1);
			function_672403ca("mute_underscore_belowground", 5, 0);
		}
	}
}

/*
	Name: function_1493eabf
	Namespace: namespace_f172695e
	Checksum: 0x6DE6DDD1
	Offset: 0x9C8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_1493eabf()
{
	level waittill(#"hash_2ccb1e2f5d9ce793");
	function_2cca7b47(0, #"hash_5051ce8d9655aa52");
}

