#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_c097de49;

/*
	Name: function_5e7b8ce0
	Namespace: namespace_c097de49
	Checksum: 0x6E1BD226
	Offset: 0x228
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5e7b8ce0()
{
	level notify(241235664);
}

/*
	Name: init
	Namespace: namespace_c097de49
	Checksum: 0x8D838EA7
	Offset: 0x248
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level thread function_1493eabf();
	level thread function_d8392499();
	level thread function_12b1d8eb();
	util::register_system(#"hash_34557cea0a4ddd45", &function_ff96a7fd);
}

/*
	Name: function_2f3017ad
	Namespace: namespace_c097de49
	Checksum: 0xDCBA45E7
	Offset: 0x2D0
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
	Name: function_ff96a7fd
	Namespace: namespace_c097de49
	Checksum: 0x98F6F66D
	Offset: 0x350
	Size: 0xBC
	Parameters: 3
	Flags: Linked
*/
function function_ff96a7fd(clientnum, state, oldstate)
{
	if(!isdefined(level.var_cc140ec8))
	{
		level.var_cc140ec8 = 1;
	}
	if(isdefined(oldstate))
	{
		if(oldstate === "disable")
		{
			if(level.var_cc140ec8)
			{
				level.var_cc140ec8 = 0;
				function_b6407dd4(0);
			}
		}
		else if(!level.var_cc140ec8)
		{
			level.var_cc140ec8 = 1;
			function_b6407dd4(1);
		}
	}
}

/*
	Name: function_21fee83f
	Namespace: namespace_c097de49
	Checksum: 0xF6DB5785
	Offset: 0x418
	Size: 0x214
	Parameters: 1
	Flags: Linked
*/
function function_21fee83f(var_c4f44e2)
{
	self notify("958231ac47716ba");
	self endon("958231ac47716ba");
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
			if(var_c4f44e2 === 1)
			{
				function_672403ca("mute_underscore_aboveground", 5, 1);
				function_672403ca("mute_underscore_belowground", 5, 0);
			}
			else if(var_c4f44e2 === 4)
			{
				function_672403ca("mute_underscore_aboveground", 5, 1);
				function_672403ca("mute_underscore_belowground", 5, 1);
			}
		}
	}
}

/*
	Name: function_12b1d8eb
	Namespace: namespace_c097de49
	Checksum: 0x6C6CCA49
	Offset: 0x638
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_12b1d8eb()
{
	function_5ea2c6e3("mute_underscore_aboveground", 0);
	function_5ea2c6e3("mute_underscore_belowground", 0);
	util::waitforclient(0);
	wait(10);
	audio::playloopat("mus_underscore_aboveground_loop_0", (0, 0, 0));
	audio::playloopat("mus_underscore_belowground_loop_0", (1, 1, 1));
	level waittill(#"end_game");
	audio::stoploopat("mus_underscore_aboveground_loop_0", (0, 0, 0));
	audio::stoploopat("mus_underscore_belowground_loop_0", (1, 1, 1));
}

/*
	Name: function_1493eabf
	Namespace: namespace_c097de49
	Checksum: 0x1E03322E
	Offset: 0x728
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_1493eabf()
{
	level waittill(#"hash_2ccb1e2f5d9ce793");
	function_2cca7b47(0, #"hash_5c660362994b51ad");
}

/*
	Name: function_d8392499
	Namespace: namespace_c097de49
	Checksum: 0xB96788AC
	Offset: 0x770
	Size: 0x2B4
	Parameters: 0
	Flags: Linked
*/
function function_d8392499()
{
	util::waitforclient(0);
	var_c4e62be5 = spawn(0, (6573, 6267, 7742), "script_origin");
	var_c4e62be5 function_9974c822("zmb_tungsten_portal");
	var_c4e62be5 playloopsound(#"hash_7caec96b396c14c5");
	var_c4e62be5 setforcenocull();
	soundloopemitter(#"hash_3990cd4e6ed8ede1", (3545, 8279, -336));
	soundloopemitter(#"hash_5c289c9099eaf1c2", (3563, 1785, -290));
	soundloopemitter(#"hash_7c1b5a05e3094db2", (3484, 2094, -338));
	soundloopemitter(#"hash_7c1b5a05e3094db2", (3577, 2091, -264));
	soundloopemitter(#"hash_7c1b5a05e3094db2", (3732, 1790, -253));
	soundloopemitter(#"hash_7c1b5a05e3094db2", (2382, 1314, -222));
	soundloopemitter(#"hash_7c1b5a05e3094db2", (2777, 1105, -221));
	soundloopemitter(#"hash_7c1b5a05e3094db2", (2777, 951, -221));
	soundloopemitter(#"hash_7c1b5a05e3094db2", (2559, 1316, -222));
	soundloopemitter(#"hash_7c1b5a05e3094db2", (2578, 672, -222));
	soundloopemitter(#"hash_7c1b5a05e3094db2", (2367, 672, -225));
}

/*
	Name: function_933f292d
	Namespace: namespace_c097de49
	Checksum: 0xD537E46
	Offset: 0xA30
	Size: 0x812
	Parameters: 7
	Flags: Linked
*/
function function_933f292d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 1:
		{
			playsound(fieldname, #"hash_d8b240f851233e4", (1748, 1710, -263));
			soundloopemitter(#"hash_d3e38e2cdff435c", (1748, 1710, -263));
			break;
		}
		case 2:
		{
			playsound(fieldname, #"hash_4d517729f59c8e61", (3481, 1700, -287));
			break;
		}
		case 3:
		{
			soundlineemitter(#"hash_217e7b2f3a7fb948", (5123, 3650, -243), (5807, 3649, -243));
			var_c7c6ccec = (5420, 4087, -75);
			soundloopemitter(#"hash_1a2ebdbaf9f4ebea", var_c7c6ccec);
			playsound(fieldname, #"hash_311090818d1a7b66", var_c7c6ccec);
			soundloopemitter(#"hash_de383039c33a4a", var_c7c6ccec);
			var_4083c07b = [3:(5644, 4180, -1), 2:(5667, 3896, -1), 1:(5186, 4002, -2), 0:(5202, 4273, 1)];
			foreach(location in var_4083c07b)
			{
				playsound(fieldname, #"hash_1f8772e2696eb83e", location);
				soundloopemitter(#"hash_4ce12f8cb3254542", location);
				wait(randomfloatrange(0.05, 0.3));
			}
			break;
		}
		case 4:
		{
			soundstoplineemitter(#"hash_217e7b2f3a7fb948", (5123, 3650, -243), (5807, 3649, -243));
			var_c7c6ccec = (5420, 4087, -75);
			soundstoploopemitter(#"hash_1a2ebdbaf9f4ebea", var_c7c6ccec);
			playsound(fieldname, #"hash_3f8768d683b8eace", var_c7c6ccec);
			soundstoploopemitter(#"hash_de383039c33a4a", var_c7c6ccec);
			var_4083c07b = [3:(5644, 4180, -1), 2:(5667, 3896, -1), 1:(5186, 4002, -2), 0:(5202, 4273, 1)];
			foreach(location in var_4083c07b)
			{
				playsound(fieldname, #"hash_6e16e98f86fc6546", location);
				soundstoploopemitter(#"hash_4ce12f8cb3254542", location);
			}
			break;
		}
		case 5:
		{
			function_5ea2c6e3("zmb_tungsten_bossfight", 5, 1);
			function_ed62c9c2("zmb_tungsten_escort", 4);
			break;
		}
		case 6:
		{
			function_ed62c9c2("zmb_tungsten_bossfight", 5);
			function_ed62c9c2("zmb_tungsten_boss_outro", 5);
			function_ed62c9c2("zmb_tungsten_boss_outro_igc", 2);
			soundstoploopemitter(#"hash_75e463968d66b62f", (8399, 1766, -387));
			break;
		}
		case 7:
		{
			playsound(fieldname, #"hash_418285810ee4b665", (0, 0, 0));
			soundloopemitter("zmb_mq_boss_intermission_blackscreen_lp", (0, 0, 0));
			function_5ea2c6e3("zmb_tungsten_intermission", 2, 1);
			break;
		}
		case 8:
		{
			playsound(fieldname, #"hash_541ffb94c24dbf12", (0, 0, 0));
			soundstoploopemitter("zmb_mq_boss_intermission_blackscreen_lp", (0, 0, 0));
			soundloopemitter("zmb_mq_boss_intermission_bg_lp", (0, 0, 0));
			break;
		}
		case 9:
		{
			soundstoploopemitter("zmb_mq_boss_intermission_bg_lp", (0, 0, 0));
			function_ed62c9c2("zmb_tungsten_intermission", 0.1);
			break;
		}
		case 10:
		{
			function_5ea2c6e3("zmb_tungsten_boss_outro", 2, 1);
			break;
		}
		case 13:
		{
			function_5ea2c6e3("zmb_tungsten_boss_outro_igc", 0.5, 1);
			function_ed62c9c2("zmb_tungsten_boss_outro", 2);
			break;
		}
		case 11:
		{
			level.var_21ece77b = 1;
			level.var_4ac6cdf7 = 1;
			break;
		}
		case 12:
		{
			function_5ea2c6e3("zmb_tungsten_escort", 4, 1);
			break;
		}
	}
}

