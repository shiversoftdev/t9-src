#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace burnplayer;

/*
	Name: __init__system__
	Namespace: burnplayer
	Checksum: 0x1B10AE66
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"burnplayer", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: burnplayer
	Checksum: 0x42D5988
	Offset: 0x140
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "burn", 1, 1, "int", &burning_callback, 0, 1);
	clientfield::register("playercorpse", "burned_effect", 1, 1, "int", &burning_corpse_callback, 0, 1);
	loadeffects();
	callback::on_localplayer_spawned(&on_localplayer_spawned);
	callback::on_localclient_connect(&on_local_client_connect);
}

/*
	Name: loadeffects
	Namespace: burnplayer
	Checksum: 0xDBB05E8A
	Offset: 0x230
	Size: 0x10
	Parameters: 0
	Flags: Linked
*/
function loadeffects()
{
	level.burntags = [];
}

/*
	Name: on_local_client_connect
	Namespace: burnplayer
	Checksum: 0x7BBBACE1
	Offset: 0x248
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function on_local_client_connect(localclientnum)
{
}

/*
	Name: on_localplayer_spawned
	Namespace: burnplayer
	Checksum: 0x42373CC2
	Offset: 0x260
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function on_localplayer_spawned(localclientnum)
{
	if(self function_21c0fa55() && self clientfield::get("burn") == 0 && self postfx::function_556665f2(#"pstfx_burn_loop"))
	{
		self postfx::stoppostfxbundle(#"pstfx_burn_loop");
	}
}

/*
	Name: burning_callback
	Namespace: burnplayer
	Checksum: 0x4684C622
	Offset: 0x300
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function burning_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_a6cb96f(fieldname);
		self function_adae7d84(fieldname);
	}
	else
	{
		self function_8227cec3(fieldname);
		self function_68a11df6(fieldname);
	}
}

/*
	Name: burning_corpse_callback
	Namespace: burnplayer
	Checksum: 0x34252B80
	Offset: 0x3B0
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function burning_corpse_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self set_corpse_burning(fieldname);
	}
	else
	{
		self function_8227cec3(fieldname);
		self function_68a11df6(fieldname);
	}
}

/*
	Name: set_corpse_burning
	Namespace: burnplayer
	Checksum: 0xC37DCB90
	Offset: 0x448
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function set_corpse_burning(localclientnum)
{
	self thread _burnbody(localclientnum, 1);
}

/*
	Name: function_8227cec3
	Namespace: burnplayer
	Checksum: 0xAC391B67
	Offset: 0x480
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function function_8227cec3(localclientnum)
{
	if(self function_21c0fa55())
	{
		if(self postfx::function_556665f2(#"pstfx_burn_loop"))
		{
			self postfx::stoppostfxbundle(#"pstfx_burn_loop");
		}
		if(is_true(self.var_bd048859))
		{
			self playsound(0, #"hash_41520794c2fd8aa");
			self.var_bd048859 = 0;
		}
	}
}

/*
	Name: function_68a11df6
	Namespace: burnplayer
	Checksum: 0x4C193364
	Offset: 0x530
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_68a11df6(localclientnum)
{
	self notify(#"burn_off");
}

/*
	Name: function_a6cb96f
	Namespace: burnplayer
	Checksum: 0x8834C9A7
	Offset: 0x558
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_a6cb96f(localclientnum)
{
	if(self function_21c0fa55() && !isthirdperson(localclientnum) && !self isremotecontrolling(localclientnum))
	{
		self thread burn_on_postfx();
	}
}

/*
	Name: function_adae7d84
	Namespace: burnplayer
	Checksum: 0x2D29885B
	Offset: 0x5D8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_adae7d84(localclientnum)
{
	if(!self function_21c0fa55() || isthirdperson(localclientnum))
	{
		self thread _burnbody(localclientnum);
	}
}

/*
	Name: burn_on_postfx
	Namespace: burnplayer
	Checksum: 0x4B75FEC8
	Offset: 0x638
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function burn_on_postfx()
{
	self endon(#"burn_off");
	self endon(#"death");
	self notify(#"burn_on_postfx");
	self endon(#"burn_on_postfx");
	self playsound(0, #"hash_791f349cb716e078");
	self.var_bd048859 = 1;
	self thread postfx::playpostfxbundle(#"pstfx_burn_loop");
}

/*
	Name: _burntag
	Namespace: burnplayer
	Checksum: 0x7B589F72
	Offset: 0x6E8
	Size: 0x9C
	Parameters: 3
	Flags: Linked, Private
*/
function private _burntag(localclientnum, tag, postfix)
{
	if(isdefined(self) && self hasdobj(localclientnum))
	{
		fxname = ("burn_" + tag) + postfix;
		if(isdefined(level._effect[fxname]))
		{
			return util::playfxontag(localclientnum, level._effect[fxname], self, tag);
		}
	}
}

/*
	Name: _burntagson
	Namespace: burnplayer
	Checksum: 0x7293F806
	Offset: 0x790
	Size: 0x19C
	Parameters: 3
	Flags: Linked, Private
*/
function private _burntagson(localclientnum, tags, use_tagfxset)
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	self endon(#"burn_off");
	self notify(#"burn_tags_on");
	self endon(#"burn_tags_on");
	if(use_tagfxset)
	{
		self util::waittill_dobj(localclientnum);
		activefx = playtagfxset(localclientnum, "weapon_hero_molotov_fire_3p", self);
	}
	else
	{
		activefx = [];
		for(i = 0; i < tags.size; i++)
		{
			activefx[activefx.size] = self _burntag(localclientnum, tags[i], "_loop");
		}
	}
	playsound(0, #"chr_ignite", self.origin);
	burnsound = self playloopsound(#"chr_burn_loop_overlay", 0.5);
	self thread _burntagswatchend(localclientnum, activefx, burnsound);
	self thread _burntagswatchclear(localclientnum, activefx, burnsound);
}

/*
	Name: _burnbody
	Namespace: burnplayer
	Checksum: 0x9EC614D3
	Offset: 0x938
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private _burnbody(localclientnum, use_tagfxset)
{
	if(!isdefined(use_tagfxset))
	{
		use_tagfxset = 0;
	}
	self endon(#"death");
	self thread _burntagson(localclientnum, level.burntags, use_tagfxset);
}

/*
	Name: _burntagswatchend
	Namespace: burnplayer
	Checksum: 0xAB1379CD
	Offset: 0x9A0
	Size: 0x100
	Parameters: 3
	Flags: Linked, Private
*/
function private _burntagswatchend(localclientnum, fxarray, burnsound)
{
	self waittill(#"burn_off", #"death");
	if(isdefined(self) && isdefined(burnsound))
	{
		self stoploopsound(burnsound, 1);
	}
	if(isdefined(fxarray))
	{
		foreach(fx in fxarray)
		{
			stopfx(localclientnum, fx);
		}
	}
}

/*
	Name: _burntagswatchclear
	Namespace: burnplayer
	Checksum: 0xB26E6A7C
	Offset: 0xAA8
	Size: 0xE8
	Parameters: 3
	Flags: Linked, Private
*/
function private _burntagswatchclear(localclientnum, fxarray, burnsound)
{
	self endon(#"burn_off");
	self waittill(#"death");
	if(isdefined(burnsound))
	{
		stopsound(burnsound);
	}
	if(isdefined(fxarray))
	{
		foreach(fx in fxarray)
		{
			stopfx(localclientnum, fx);
		}
	}
}

