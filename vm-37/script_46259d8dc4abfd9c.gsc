#using scripts\core_common\math_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace explosive_bolt;

/*
	Name: main
	Namespace: explosive_bolt
	Checksum: 0x20E82C53
	Offset: 0xA0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function main()
{
	level._effect[#"crossbow_light"] = #"weapon/fx8_equip_light_os";
}

/*
	Name: spawned
	Namespace: explosive_bolt
	Checksum: 0x131A8F77
	Offset: 0xD8
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
	Namespace: explosive_bolt
	Checksum: 0x2D4773E6
	Offset: 0x120
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
	Namespace: explosive_bolt
	Checksum: 0xB74DBFCD
	Offset: 0x260
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function start_light_fx(localclientnum)
{
	self.fx = util::playfxontag(localclientnum, level._effect[#"crossbow_light"], self, "tag_origin");
}

/*
	Name: stop_light_fx
	Namespace: explosive_bolt
	Checksum: 0x565C35A3
	Offset: 0x2B8
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
	Namespace: explosive_bolt
	Checksum: 0xC167A3AC
	Offset: 0x310
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function fullscreen_fx(localclientnum)
{
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

