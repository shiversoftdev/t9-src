#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace water_surface;

/*
	Name: function_89f2df9
	Namespace: water_surface
	Checksum: 0x5027AB50
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"water_surface", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: water_surface
	Checksum: 0x9A1F3C31
	Offset: 0xF0
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level._effect[#"water_player_jump_out"] = #"player/fx_plyr_water_jump_out_splash_1p";
	level._effect[#"hash_1e7095084eda811c"] = #"hash_123c2521c68b2167";
	if(is_true(level.disablewatersurfacefx))
	{
		return;
	}
	callback::on_localplayer_spawned(&localplayer_spawned);
}

/*
	Name: localplayer_spawned
	Namespace: water_surface
	Checksum: 0xF43656D1
	Offset: 0x190
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function localplayer_spawned(localclientnum)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	if(is_true(level.disablewatersurfacefx))
	{
		return;
	}
	self thread underwaterwatchbegin();
	self thread underwaterwatchend();
}

/*
	Name: underwaterwatchbegin
	Namespace: water_surface
	Checksum: 0xB461E77E
	Offset: 0x210
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function underwaterwatchbegin()
{
	self notify(#"underwaterwatchbegin");
	self endon(#"underwaterwatchbegin");
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"underwater_begin");
		if(waitresult.is_teleported)
		{
		}
		else
		{
			self thread underwaterbegin();
		}
	}
}

/*
	Name: underwaterwatchend
	Namespace: water_surface
	Checksum: 0x7B8613E9
	Offset: 0x2A8
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function underwaterwatchend()
{
	self notify(#"underwaterwatchend");
	self endon(#"underwaterwatchend");
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"underwater_end");
		if(waitresult.is_teleported)
		{
		}
		else
		{
			self thread underwaterend();
		}
	}
}

/*
	Name: underwaterbegin
	Namespace: water_surface
	Checksum: 0x90D1ED9A
	Offset: 0x340
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function underwaterbegin()
{
	self notify(#"water_surface_underwater_begin");
	self endon(#"water_surface_underwater_begin");
	self endon(#"death");
	localclientnum = self getlocalclientnumber();
	if(islocalclientdead(localclientnum) == 0 && !is_true(self.topdowncamera))
	{
		self.var_733dd716 = playfxoncamera(localclientnum, level._effect[#"hash_1e7095084eda811c"], (0, 0, 0), (1, 0, 0), (0, 0, 1));
		if(!isdefined(self.playingpostfxbundle) || self.playingpostfxbundle != "pstfx_watertransition")
		{
			self thread postfx::playpostfxbundle(#"pstfx_watertransition");
		}
	}
}

/*
	Name: underwaterend
	Namespace: water_surface
	Checksum: 0xCFA57CC9
	Offset: 0x468
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function underwaterend()
{
	self notify(#"water_surface_underwater_end");
	self endon(#"water_surface_underwater_end");
	self endon(#"death");
	localclientnum = self getlocalclientnumber();
	if(islocalclientdead(localclientnum) == 0 && !is_true(self.topdowncamera))
	{
		if(!isdefined(self.playingpostfxbundle) || self.playingpostfxbundle != "pstfx_water_t_out")
		{
			self thread postfx::playpostfxbundle(#"pstfx_water_t_out");
		}
	}
}

/*
	Name: startwaterdive
	Namespace: water_surface
	Checksum: 0x80F724D1
	Offset: 0x550
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function startwaterdive()
{
}

/*
	Name: startwatersheeting
	Namespace: water_surface
	Checksum: 0x22A002EF
	Offset: 0x560
	Size: 0x38
	Parameters: 0
	Flags: None
*/
function startwatersheeting()
{
	self notify(#"startwatersheeting_singleton");
	self endon(#"startwatersheeting_singleton");
	self endon(#"death");
}

/*
	Name: stop_player_fx
	Namespace: water_surface
	Checksum: 0xB9D64828
	Offset: 0x5A0
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function stop_player_fx(localclient)
{
	if(isdefined(localclient.firstperson_water_fx))
	{
		localclientnum = localclient getlocalclientnumber();
		stopfx(localclientnum, localclient.firstperson_water_fx);
		localclient.firstperson_water_fx = undefined;
	}
	if(isdefined(localclient.var_733dd716))
	{
		localclientnum = localclient getlocalclientnumber();
		stopfx(localclientnum, localclient.var_733dd716);
		localclient.var_733dd716 = undefined;
	}
}

