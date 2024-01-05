#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\killstreaks\zm\airsupport.csc;
#using script_1568a517f901b845;

#namespace napalm_strike;

/*
	Name: function_c3a55f2f
	Namespace: napalm_strike
	Checksum: 0xD40AC803
	Offset: 0x160
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c3a55f2f()
{
	level notify(612737115);
}

/*
	Name: __init__system__
	Namespace: napalm_strike
	Checksum: 0x84DB1E18
	Offset: 0x180
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"napalm_strike", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: napalm_strike
	Checksum: 0x30382F07
	Offset: 0x1D0
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared("killstreak_napalm_strike" + "_zm");
	clientfield::register("scriptmover", "napalm_strike_marker_on", 1, 2, "int", &napalm_strike_marker_on, 0, 0);
	namespace_bf7415ae::function_fc85e1a("napalm_strike", &function_85f3e359, &function_e72f1d06, &show_marker, &function_4362abef);
}

/*
	Name: napalm_strike_marker_on
	Namespace: napalm_strike
	Checksum: 0xA17F0732
	Offset: 0x2A8
	Size: 0x1C4
	Parameters: 7
	Flags: Linked
*/
function napalm_strike_marker_on(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		namespace_bf7415ae::function_9cb260fd(fieldname, "napalm_strike", self);
	}
	else
	{
		if(bwastimejump == 2)
		{
			player = function_27673a7(fieldname);
			if(isplayer(player) && isdefined(self.var_595cc3a1))
			{
				self notify(#"hash_6cb3344e363fe563");
				player postfx::function_c8b5f318("pstfx_napalm_strike_bundle", #"hash_1dc8a3cb360b2900" + self.var_595cc3a1, 4);
				if(isdefined(self.markerfx))
				{
					stopfx(fieldname, self.markerfx);
				}
				player function_f43fb0d3(self);
				self.markerfx = function_239993de(fieldname, "sr/fx9_kill_streak_marker_activate", self, "tag_origin");
			}
		}
		else
		{
			namespace_bf7415ae::function_f06fadf2(fieldname, "napalm_strike", self);
			if(isdefined(self.markerfx))
			{
				stopfx(fieldname, self.markerfx);
			}
		}
	}
}

/*
	Name: function_85f3e359
	Namespace: napalm_strike
	Checksum: 0xD26E05D3
	Offset: 0x478
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_85f3e359(localclientnum)
{
	player = function_27673a7(localclientnum);
	if(isplayer(player) && !player function_d2cb869e("pstfx_napalm_strike_bundle"))
	{
		player codeplaypostfxbundle("pstfx_napalm_strike_bundle");
	}
}

/*
	Name: function_e72f1d06
	Namespace: napalm_strike
	Checksum: 0xD2EF7412
	Offset: 0x508
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_e72f1d06(localclientnum)
{
	player = function_27673a7(localclientnum);
	if(isplayer(player) && player function_d2cb869e("pstfx_napalm_strike_bundle"))
	{
		player codestoppostfxbundle("pstfx_napalm_strike_bundle");
	}
}

/*
	Name: show_marker
	Namespace: napalm_strike
	Checksum: 0x9D60BF9D
	Offset: 0x598
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function show_marker(localclientnum, marker)
{
	level thread function_6a08eb03(localclientnum, marker);
	player = function_27673a7(localclientnum);
	if(isplayer(player))
	{
		player postfx::function_c8b5f318("pstfx_napalm_strike_bundle", #"hash_1dc8a3cb360b2900" + marker.var_595cc3a1, 4);
		player postfx::function_c8b5f318("pstfx_napalm_strike_bundle", #"hash_3930a65cbb342a89" + marker.var_595cc3a1, 290);
	}
}

/*
	Name: function_4362abef
	Namespace: napalm_strike
	Checksum: 0xEB51956
	Offset: 0x680
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_4362abef(localclientnum, marker)
{
	level notify(#"hash_14d956289c0e8ff0" + marker.var_595cc3a1);
	player = function_27673a7(localclientnum);
	if(isplayer(player))
	{
		player postfx::function_c8b5f318("pstfx_napalm_strike_bundle", #"hash_1dc8a3cb360b2900" + marker.var_595cc3a1, 0);
	}
}

/*
	Name: function_f43fb0d3
	Namespace: napalm_strike
	Checksum: 0xC72BF362
	Offset: 0x728
	Size: 0x114
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f43fb0d3(marker)
{
	if(isdefined(marker.origin) && isdefined(marker.var_595cc3a1))
	{
		viewpos = marker.origin;
		var_c3515577 = anglestoright((0, marker.angles[1], 0));
		viewangle = vectortoangles(var_c3515577);
		self function_116b95e5("pstfx_napalm_strike_bundle", "Position " + marker.var_595cc3a1, viewpos[0], viewpos[1], viewpos[2]);
		self function_116b95e5("pstfx_napalm_strike_bundle", "Rotation Angle " + marker.var_595cc3a1, viewangle[1]);
	}
}

/*
	Name: function_6a08eb03
	Namespace: napalm_strike
	Checksum: 0x4F7E5DBD
	Offset: 0x848
	Size: 0xC6
	Parameters: 2
	Flags: Linked
*/
function function_6a08eb03(localclientnum, marker)
{
	level endon(#"end_game", #"hash_14d956289c0e8ff0" + marker.var_595cc3a1);
	marker endon(#"death", #"hash_5b54de1881a4b84e");
	while(true)
	{
		player = function_27673a7(localclientnum);
		if(isplayer(player))
		{
			player function_f43fb0d3(marker);
		}
		waitframe(1);
	}
}

