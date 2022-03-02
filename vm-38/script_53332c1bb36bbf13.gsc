#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace recon_plane;

/*
	Name: function_dbd42922
	Namespace: recon_plane
	Checksum: 0xC334598A
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dbd42922()
{
	level notify(1098336684);
}

/*
	Name: function_89f2df9
	Namespace: recon_plane
	Checksum: 0xB0E45C56
	Offset: 0x150
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"recon_plane", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: recon_plane
	Checksum: 0x7EBA145A
	Offset: 0x1A0
	Size: 0x160
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "recon_plane", 1, 1, "int", &function_1f842f91, 0, 0);
	clientfield::register("scriptmover", "recon_plane_reveal", 1, 1, "int", &recon_plane_reveal, 0, 0);
	clientfield::register("scriptmover", "recon_plane_damage_fx", 1, 2, "int", &function_24cfeb4b, 0, 0);
	callback::on_localclient_connect(&player_init);
	bundlename = "killstreak_recon_plane";
	if(function_f99d2668())
	{
		bundlename = bundlename + "_wz";
	}
	level.var_d9ef3e7c = getscriptbundle(bundlename);
	level.var_d84f0c02 = [];
}

/*
	Name: player_init
	Namespace: recon_plane
	Checksum: 0x53BE41FE
	Offset: 0x308
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function player_init(localclientnum)
{
	self thread function_31a1aa18(localclientnum);
}

/*
	Name: function_6a7f9809
	Namespace: recon_plane
	Checksum: 0x1AF578C5
	Offset: 0x338
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_6a7f9809()
{
	self endon(#"death");
	level waittill(#"hash_67a5748755bfcfb0");
	if(isdefined(self))
	{
		self function_811196d1(1);
	}
}

/*
	Name: function_1f842f91
	Namespace: recon_plane
	Checksum: 0x89304E42
	Offset: 0x390
	Size: 0x1FC
	Parameters: 7
	Flags: Linked
*/
function function_1f842f91(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(!isdefined(self.killstreakbundle))
	{
		self.killstreakbundle = level.var_d9ef3e7c;
	}
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump == 1)
	{
		self function_1f0c7136(2);
		var_2c9baa0c = level.var_d9ef3e7c.var_7249d50f;
		if(isdefined(var_2c9baa0c) && var_2c9baa0c > 0)
		{
			self function_5db470de(fieldname, var_2c9baa0c);
			if(!self function_ca024039())
			{
				self.var_2695439d = self playloopsound(#"hash_539cae233d8f2036", 1);
			}
			self thread function_4ee8c344(fieldname);
			self setcompassicon(self.killstreakbundle.var_cb98fbf7);
			self function_dce2238(1);
			self function_8e04481f();
			self function_27351ff6();
			level notify(#"hash_67a5748755bfcfb0");
			self thread function_6a7f9809();
		}
	}
}

/*
	Name: function_4ee8c344
	Namespace: recon_plane
	Checksum: 0x558C4EE5
	Offset: 0x598
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4ee8c344(localclientnum)
{
	entnum = self getentitynumber();
	self waittill(#"death");
	if(isdefined(self.var_2695439d))
	{
		self stoploopsound(self.var_2695439d);
	}
	function_fb25716d(localclientnum, entnum);
}

/*
	Name: function_31a1aa18
	Namespace: recon_plane
	Checksum: 0x22E2578F
	Offset: 0x628
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_31a1aa18(localclientnum)
{
	level waittill(#"game_ended");
	function_c18242d9(localclientnum);
}

/*
	Name: recon_plane_reveal
	Namespace: recon_plane
	Checksum: 0xCDB20D4F
	Offset: 0x670
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function recon_plane_reveal(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(self function_ca024039())
		{
			entnum = self getentitynumber();
			function_947d2fc2(fieldname, entnum, level.var_d9ef3e7c.var_e77ca4a1);
			self thread function_af19a98(fieldname, entnum);
		}
		else
		{
			level.var_d84f0c02[level.var_d84f0c02.size] = self;
			self thread function_6f689c85(fieldname);
		}
	}
}

/*
	Name: function_6f689c85
	Namespace: recon_plane
	Checksum: 0x679AFE4C
	Offset: 0x768
	Size: 0x28E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6f689c85(localclientnum)
{
	self notify("2af01c1ea30ce119");
	self endon("2af01c1ea30ce119");
	var_c2b8dfe0 = sqr((isdefined(level.var_d9ef3e7c.var_e77ca4a1) ? level.var_d9ef3e7c.var_e77ca4a1 : 0) / 2);
	arrayremovevalue(level.var_d84f0c02, undefined);
	while(level.var_d84f0c02.size)
	{
		player = function_27673a7(localclientnum);
		playerinrange = 0;
		if(isalive(player))
		{
			foreach(var_82d4c496 in level.var_d84f0c02)
			{
				if(distance2dsquared(player.origin, var_82d4c496.origin) <= var_c2b8dfe0)
				{
					playerinrange = 1;
					break;
				}
			}
		}
		if(playerinrange)
		{
			if(!isdefined(player.var_59f39e8a))
			{
				player.var_59f39e8a = player playloopsound(#"hash_4665942676cd6feb");
			}
		}
		else if(isdefined(player.var_59f39e8a))
		{
			player stoploopsound(player.var_59f39e8a);
			player.var_59f39e8a = undefined;
		}
		wait(0.25);
		arrayremovevalue(level.var_d84f0c02, undefined);
	}
	player = function_27673a7(localclientnum);
	if(isdefined(player.var_59f39e8a))
	{
		player stoploopsound(player.var_59f39e8a);
		player.var_59f39e8a = undefined;
	}
}

/*
	Name: function_af19a98
	Namespace: recon_plane
	Checksum: 0xA634BA18
	Offset: 0xA00
	Size: 0x44
	Parameters: 2
	Flags: Linked, Private
*/
function private function_af19a98(localclientnum, entnum)
{
	self waittill(#"death");
	function_1e5c5bb9(localclientnum, entnum);
}

/*
	Name: function_24cfeb4b
	Namespace: recon_plane
	Checksum: 0x6379F8C1
	Offset: 0xA50
	Size: 0xBC
	Parameters: 7
	Flags: Linked
*/
function function_24cfeb4b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		util::playfxontag(fieldname, level.var_d9ef3e7c.fxlowhealth, self, "tag_fx_engine_exhaust_back");
	}
	else if(bwastimejump == 2)
	{
		util::playfxontag(fieldname, level.var_d9ef3e7c.var_277154f7, self, "tag_fx_engine_exhaust_back");
	}
}

