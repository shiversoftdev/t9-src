#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace spike_charge_siegebot;

/*
	Name: function_d3b4a0c
	Namespace: spike_charge_siegebot
	Checksum: 0xD61FF99A
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d3b4a0c()
{
	level notify(308549157);
}

/*
	Name: function_89f2df9
	Namespace: spike_charge_siegebot
	Checksum: 0x305D749A
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"spike_charge_siegebot", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: spike_charge_siegebot
	Checksum: 0x7B4EDC6D
	Offset: 0x108
	Size: 0x11C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level._effect[#"spike_charge_siegebot_light"] = #"light/fx_light_red_spike_charge_os";
	callback::add_weapon_type(#"spike_charge_siegebot", &spawned);
	callback::add_weapon_type(#"spike_charge_siegebot_theia", &spawned);
	callback::add_weapon_type(#"siegebot_launcher_turret", &spawned);
	callback::add_weapon_type(#"siegebot_launcher_turret_theia", &spawned);
	callback::add_weapon_type(#"siegebot_javelin_turret", &spawned);
}

/*
	Name: spawned
	Namespace: spike_charge_siegebot
	Checksum: 0xBCD7A46F
	Offset: 0x230
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function spawned(localclientnum)
{
	self thread fx_think(localclientnum);
}

/*
	Name: fx_think
	Namespace: spike_charge_siegebot
	Checksum: 0x7BC9DC3A
	Offset: 0x260
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
		self playsound(localclientnum, #"wpn_semtex_alert");
		util::server_wait(localclientnum, interval, 0.01, "player_switch");
		self util::waittill_dobj(localclientnum);
		interval = math::clamp(interval / 1.2, 0.08, 0.3);
	}
}

/*
	Name: start_light_fx
	Namespace: spike_charge_siegebot
	Checksum: 0xEA860954
	Offset: 0x3A0
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function start_light_fx(localclientnum)
{
	self.fx = util::playfxontag(localclientnum, level._effect[#"spike_charge_siegebot_light"], self, "tag_fx");
}

/*
	Name: stop_light_fx
	Namespace: spike_charge_siegebot
	Checksum: 0x914C8C43
	Offset: 0x3F8
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

