#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace burnplayer;

/*
	Name: function_8874df3c
	Namespace: burnplayer
	Checksum: 0x4B27C04
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8874df3c()
{
	level notify(664780626);
}

/*
	Name: function_89f2df9
	Namespace: burnplayer
	Checksum: 0x195A3170
	Offset: 0x118
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"burnplayer", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: burnplayer
	Checksum: 0x6696ED1D
	Offset: 0x160
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
	Checksum: 0x191067F5
	Offset: 0x250
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
	Checksum: 0x3844CC0F
	Offset: 0x268
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
	Checksum: 0xC2941F83
	Offset: 0x280
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
	Checksum: 0xF442879
	Offset: 0x320
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
	Checksum: 0xDBA3B020
	Offset: 0x3D0
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
	Checksum: 0xBAA690C3
	Offset: 0x468
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
	Checksum: 0xEC6A34A4
	Offset: 0x4A0
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
	Checksum: 0x3DCEEAB8
	Offset: 0x550
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
	Checksum: 0xCC00BE24
	Offset: 0x578
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
	Checksum: 0x94D0A4E2
	Offset: 0x5F8
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
	Checksum: 0x9CA373BF
	Offset: 0x658
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
	Checksum: 0x1D0E4755
	Offset: 0x708
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
	Checksum: 0xE096FBC8
	Offset: 0x7B0
	Size: 0x19C
	Parameters: 3
	Flags: Linked, Private
*/
function private _burntagson(localclientnum, tags, var_71742e03)
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	self endon(#"burn_off");
	self notify(#"burn_tags_on");
	self endon(#"burn_tags_on");
	if(var_71742e03)
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
	Checksum: 0x5475A48
	Offset: 0x958
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private _burnbody(localclientnum, var_71742e03)
{
	if(!isdefined(var_71742e03))
	{
		var_71742e03 = 0;
	}
	self endon(#"death");
	self thread _burntagson(localclientnum, level.burntags, var_71742e03);
}

/*
	Name: _burntagswatchend
	Namespace: burnplayer
	Checksum: 0xC096AB97
	Offset: 0x9C0
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
	Checksum: 0x192F5E11
	Offset: 0xAC8
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

