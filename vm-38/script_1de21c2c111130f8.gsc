#using script_17469809dc615f2c;
#using script_2893c826e7922f28;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace planemortar;

/*
	Name: function_6208427a
	Namespace: planemortar
	Checksum: 0x44A92E7E
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6208427a()
{
	level notify(2108976936);
}

/*
	Name: function_89f2df9
	Namespace: planemortar
	Checksum: 0x93BFC996
	Offset: 0x188
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"planemortar", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: planemortar
	Checksum: 0x2EB8C8C1
	Offset: 0x1D8
	Size: 0xFC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	clientfield::register("scriptmover", "planemortar_contrail", 1, 1, "int", &planemortar_contrail, 0, 0);
	clientfield::register("scriptmover", "planemortar_marker_on", 1, 2, "int", &planemortar_marker_on, 0, 0);
	namespace_bf7415ae::function_fc85e1a("planemortar", &function_85f3e359, &function_e72f1d06, &function_85734aa, &function_4362abef);
}

/*
	Name: planemortar_contrail
	Namespace: planemortar
	Checksum: 0x378E806C
	Offset: 0x2E0
	Size: 0xF2
	Parameters: 7
	Flags: Linked
*/
function planemortar_contrail(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	params = getscriptbundle("killstreak_planemortar");
	util::waittill_dobj(fieldname);
	if(bwastimejump)
	{
		self.fx = util::playfxontag(fieldname, params.var_dcbb40c5, self, params.var_d678978c);
		self.fx = util::playfxontag(fieldname, params.var_2375a152, self, params.var_e5082065);
	}
}

/*
	Name: planemortar_marker_on
	Namespace: planemortar
	Checksum: 0xD1A28406
	Offset: 0x3E0
	Size: 0x1C4
	Parameters: 7
	Flags: Linked
*/
function planemortar_marker_on(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		namespace_bf7415ae::function_9cb260fd(fieldname, "planemortar", self);
	}
	else
	{
		if(bwastimejump == 2)
		{
			player = function_27673a7(fieldname);
			if(isplayer(player) && isdefined(self.var_595cc3a1))
			{
				self notify(#"hash_6cb3344e363fe563");
				player postfx::function_c8b5f318("pstfx_artillery_strike_bundle", #"hash_1dc8a3cb360b2900" + self.var_595cc3a1, 4);
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
			namespace_bf7415ae::function_f06fadf2(fieldname, "planemortar", self);
			if(isdefined(self.markerfx))
			{
				stopfx(fieldname, self.markerfx);
			}
		}
	}
}

/*
	Name: function_85f3e359
	Namespace: planemortar
	Checksum: 0x82839BF1
	Offset: 0x5B0
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_85f3e359(localclientnum)
{
	player = function_27673a7(localclientnum);
	if(isplayer(player) && !player function_d2cb869e("pstfx_artillery_strike_bundle"))
	{
		player codeplaypostfxbundle("pstfx_artillery_strike_bundle");
	}
}

/*
	Name: function_e72f1d06
	Namespace: planemortar
	Checksum: 0x24C44F5A
	Offset: 0x640
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_e72f1d06(localclientnum)
{
	player = function_27673a7(localclientnum);
	if(isplayer(player) && player function_d2cb869e("pstfx_artillery_strike_bundle"))
	{
		player codestoppostfxbundle("pstfx_artillery_strike_bundle");
	}
}

/*
	Name: function_85734aa
	Namespace: planemortar
	Checksum: 0x91B76D96
	Offset: 0x6D0
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function function_85734aa(localclientnum, marker)
{
	level thread function_6a08eb03(localclientnum, marker);
	player = function_27673a7(localclientnum);
	if(isplayer(player))
	{
		player postfx::function_c8b5f318("pstfx_artillery_strike_bundle", #"hash_1dc8a3cb360b2900" + marker.var_595cc3a1, 4);
		player postfx::function_c8b5f318("pstfx_artillery_strike_bundle", #"hash_3930a65cbb342a89" + marker.var_595cc3a1, 64);
	}
}

/*
	Name: function_4362abef
	Namespace: planemortar
	Checksum: 0x223204C1
	Offset: 0x7B8
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_4362abef(localclientnum, marker)
{
	level notify(#"hash_29465a022d1a0d3d" + marker.var_595cc3a1);
	player = function_27673a7(localclientnum);
	if(isplayer(player))
	{
		player postfx::function_c8b5f318("pstfx_artillery_strike_bundle", #"hash_1dc8a3cb360b2900" + marker.var_595cc3a1, 0);
	}
}

/*
	Name: function_f43fb0d3
	Namespace: planemortar
	Checksum: 0x387DE409
	Offset: 0x860
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f43fb0d3(marker)
{
	if(isdefined(marker.origin) && isdefined(marker.var_595cc3a1))
	{
		viewpos = marker.origin;
		self function_116b95e5("pstfx_artillery_strike_bundle", "Position " + marker.var_595cc3a1, viewpos[0], viewpos[1], viewpos[2]);
	}
}

/*
	Name: function_6a08eb03
	Namespace: planemortar
	Checksum: 0xF43B800C
	Offset: 0x8F0
	Size: 0xC6
	Parameters: 2
	Flags: Linked
*/
function function_6a08eb03(localclientnum, marker)
{
	level endon(#"end_game", #"hash_29465a022d1a0d3d" + marker.var_595cc3a1);
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

