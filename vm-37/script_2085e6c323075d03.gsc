#using scripts\core_common\math_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace sticky_grenade;

/*
	Name: function_89f2df9
	Namespace: sticky_grenade
	Checksum: 0xCC71579E
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"sticky_grenade", undefined, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_8ac3bea9
	Namespace: sticky_grenade
	Checksum: 0xEAED1DB0
	Offset: 0xF0
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	level._effect[#"hash_378b08f9ecc6d430"] = #"weapon/fx8_equip_light_os";
}

/*
	Name: spawned
	Namespace: sticky_grenade
	Checksum: 0x6AA078E2
	Offset: 0x128
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function spawned(localclientnum)
{
	if(self isgrenadedud())
	{
		return;
	}
	self thread fx_think(localclientnum);
}

/*
	Name: fx_think
	Namespace: sticky_grenade
	Checksum: 0x71912C18
	Offset: 0x170
	Size: 0x132
	Parameters: 1
	Flags: None
*/
function fx_think(localclientnum)
{
	self notify(#"light_disable");
	self endon(#"death");
	self endon(#"light_disable");
	self util::waittill_dobj(localclientnum);
	interval = 0.3;
	for(;;)
	{
		self stop_light_fx(localclientnum);
		self start_light_fx(localclientnum);
		self fullscreen_fx(localclientnum);
		self playsound(localclientnum, #"wpn_semtex_alert");
		util::server_wait(localclientnum, interval, 0.01, "player_switch");
		interval = math::clamp(interval / 1.2, 0.08, 0.3);
	}
}

/*
	Name: start_light_fx
	Namespace: sticky_grenade
	Checksum: 0x1A79538B
	Offset: 0x2B0
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function start_light_fx(localclientnum)
{
	self.fx = util::playfxontag(localclientnum, level._effect[#"hash_378b08f9ecc6d430"], self, "tag_fx");
}

/*
	Name: stop_light_fx
	Namespace: sticky_grenade
	Checksum: 0xBC523A21
	Offset: 0x308
	Size: 0x4E
	Parameters: 1
	Flags: None
*/
function stop_light_fx(localclientnum)
{
	if(isdefined(self.fx) && self.fx != 0)
	{
		stopfx(localclientnum, self.fx);
		self.fx = undefined;
	}
}

/*
	Name: fullscreen_fx
	Namespace: sticky_grenade
	Checksum: 0x137F78D0
	Offset: 0x360
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function fullscreen_fx(localclientnum)
{
	if(function_1cbf351b(localclientnum))
	{
		return;
	}
	if(util::is_player_view_linked_to_entity(localclientnum))
	{
		return;
	}
	if(self function_e9fc6a64())
	{
		return;
	}
	parent = self getparententity();
	if(isdefined(parent) && parent function_21c0fa55())
	{
		parent playrumbleonentity(localclientnum, "buzz_high");
	}
}

