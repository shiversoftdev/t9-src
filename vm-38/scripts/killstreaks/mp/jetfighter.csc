#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace jetfighter;

/*
	Name: function_4fba5a44
	Namespace: jetfighter
	Checksum: 0x236EF026
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4fba5a44()
{
	level notify(-1389970608);
}

/*
	Name: __init__system__
	Namespace: jetfighter
	Checksum: 0x1E4BE3A4
	Offset: 0x108
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"jetfighter", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: jetfighter
	Checksum: 0xB4823C84
	Offset: 0x158
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "jetfighter_contrail", 1, 1, "int", &jetfighter_contrail, 0, 0);
	level.var_852b61e4 = getscriptbundle("killstreak_jetfighter");
}

/*
	Name: jetfighter_contrail
	Namespace: jetfighter
	Checksum: 0x7888861E
	Offset: 0x1D0
	Size: 0x20C
	Parameters: 7
	Flags: Linked
*/
function jetfighter_contrail(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	util::waittill_dobj(fieldname);
	if(bwastimejump)
	{
		self.fx = util::playfxontag(fieldname, level.var_852b61e4.var_dcbb40c5, self, level.var_852b61e4.var_d678978c);
		self.fx = util::playfxontag(fieldname, level.var_852b61e4.var_2375a152, self, level.var_852b61e4.var_e5082065);
		self renderoverridebundle::function_f4eab437(fieldname, 1, #"rob_sonar_set_enemy");
		localplayer = function_5c10bd79(fieldname);
		self function_1f0c7136(2);
		if(localplayer hasperk(fieldname, #"specialty_showscorestreakicons") || self.team == localplayer.team)
		{
			self setcompassicon(level.var_852b61e4.var_cb98fbf7);
			self function_5e00861(level.var_852b61e4.var_c3e4af00);
			var_b13727dd = getgametypesetting("compassAnchorScorestreakIcons");
			self function_dce2238(var_b13727dd);
		}
	}
}

