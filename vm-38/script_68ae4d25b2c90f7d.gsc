#using script_4e53735256f112ac;
#using script_d67878983e3d7c;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_32e85820;

/*
	Name: function_320429
	Namespace: namespace_32e85820
	Checksum: 0x9E363B
	Offset: 0x298
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_320429()
{
	level notify(465030369);
}

/*
	Name: function_89f2df9
	Namespace: namespace_32e85820
	Checksum: 0xFF02FBD8
	Offset: 0x2B8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_36a2cb0be45d9374", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_32e85820
	Checksum: 0xCA6C58CA
	Offset: 0x308
	Size: 0x124
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "fx_heal_aoe_pillar_clientfield", 1, 1, "counter", &function_76b749e1, 1, 0);
	clientfield::register("toplayer", "fx_heal_aoe_player_clientfield", 1, 1, "counter", &function_813dcaec, 1, 0);
	clientfield::register("scriptmover", "fx_heal_aoe_bubble_clientfield", 1, 1, "int", &function_4d38c566, 1, 0);
	clientfield::register("scriptmover", "fx_heal_aoe_bubble_beam_clientfield", 1, 1, "int", &function_456c29d0, 1, 0);
}

/*
	Name: function_456c29d0
	Namespace: namespace_32e85820
	Checksum: 0x24B6D573
	Offset: 0x438
	Size: 0x3C
	Parameters: 7
	Flags: Linked
*/
function function_456c29d0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

/*
	Name: function_4d38c566
	Namespace: namespace_32e85820
	Checksum: 0xD50258B0
	Offset: 0x480
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_4d38c566(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self endon(#"death");
		self util::waittill_dobj(fieldname);
		self.var_e648d182 = self playloopsound(#"hash_498aaf1c4d21c2c7");
		function_239993de(fieldname, "zm_weapons/fx9_fld_healing_aura_lvl5_3p", self, "tag_origin");
		self thread function_93b178ae();
	}
}

/*
	Name: function_813dcaec
	Namespace: namespace_32e85820
	Checksum: 0x868EC4CB
	Offset: 0x558
	Size: 0x12C
	Parameters: 7
	Flags: Linked
*/
function function_813dcaec(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(bwastimejump);
	if(isplayer(self) && isalive(self))
	{
		function_239993de(bwastimejump, "zm_weapons/fx9_fld_healing_aura_pulse_tgt", self, "j_spine4");
		playviewmodelfx(bwastimejump, "zm_weapons/fx9_fld_healing_aura_pulse_arm_le_1p", "j_elbow_le");
		playviewmodelfx(bwastimejump, "zm_weapons/fx9_fld_healing_aura_pulse_arm_ri_1p", "j_elbow_ri");
		self postfx::playpostfxbundle(#"hash_1b37bf385d33fa57");
	}
}

/*
	Name: function_76b749e1
	Namespace: namespace_32e85820
	Checksum: 0x125DAEBD
	Offset: 0x690
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function function_76b749e1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(bwastimejump);
	if(isplayer(self) && isalive(self))
	{
		function_239993de(bwastimejump, "zm_weapons/fx9_fld_healing_aura_lvl0_3p", self, "tag_origin");
		self thread function_a1ae5a24();
	}
}

/*
	Name: function_a1ae5a24
	Namespace: namespace_32e85820
	Checksum: 0x3864938D
	Offset: 0x770
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_a1ae5a24()
{
	level endon(#"game_ended");
	self endon(#"death");
	wait(1);
	self delete();
}

/*
	Name: function_93b178ae
	Namespace: namespace_32e85820
	Checksum: 0x28E627B7
	Offset: 0x7C8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_93b178ae()
{
	level endon(#"game_ended");
	self endon(#"death");
	wait(10);
	self delete();
}

/*
	Name: function_a4b3da97
	Namespace: namespace_32e85820
	Checksum: 0x1C6D4681
	Offset: 0x820
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_a4b3da97(trace)
{
	if(trace[#"fraction"] < 1)
	{
		return false;
	}
	return true;
}

/*
	Name: function_952f1795
	Namespace: namespace_32e85820
	Checksum: 0xE44A6BCF
	Offset: 0x858
	Size: 0x1AA
	Parameters: 1
	Flags: None
*/
function function_952f1795(localclientnum)
{
	self endon(#"death");
	while(true)
	{
		foreach(player in getplayers(localclientnum))
		{
			if(distance2d(self.origin, player.origin) < 64)
			{
				var_6e75c10a = "beam9_zm_fld_healing_aura_pulse";
				pos = self.origin;
				var_ccfd8635 = player.origin;
				trace = beamtrace(pos, var_ccfd8635, 1, self, 1);
				if(self function_a4b3da97(trace))
				{
					beam_id = self beam::launch(self, "tag_origin", player, "j_spine4", var_6e75c10a);
					level thread function_d7031739(localclientnum, beam_id);
				}
			}
		}
		wait(1);
	}
}

/*
	Name: function_d7031739
	Namespace: namespace_32e85820
	Checksum: 0x54716541
	Offset: 0xA10
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_d7031739(localclientnum, var_2bd718aa)
{
	level endon(#"game_ended");
	wait(1);
	beam::function_47deed80(localclientnum, var_2bd718aa);
}

