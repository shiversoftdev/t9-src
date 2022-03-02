#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace sticky_grenade;

/*
	Name: function_89f2df9
	Namespace: sticky_grenade
	Checksum: 0x28DF08D9
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"spike_charge", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: sticky_grenade
	Checksum: 0x2F332378
	Offset: 0xF0
	Size: 0xBC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level._effect[#"spike_light"] = #"weapon/fx_light_spike_launcher";
	callback::add_weapon_type(#"spike_launcher", &spawned);
	callback::add_weapon_type(#"spike_launcher_cpzm", &spawned);
	callback::add_weapon_type(#"spike_charge", &spawned_spike_charge);
}

/*
	Name: spawned
	Namespace: sticky_grenade
	Checksum: 0x95D7FF9E
	Offset: 0x1B8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function spawned(localclientnum)
{
	self thread fx_think(localclientnum);
}

/*
	Name: spawned_spike_charge
	Namespace: sticky_grenade
	Checksum: 0xBC961B4A
	Offset: 0x1E8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function spawned_spike_charge(localclientnum)
{
	self thread fx_think(localclientnum);
	self thread spike_detonation(localclientnum);
}

/*
	Name: fx_think
	Namespace: sticky_grenade
	Checksum: 0x4AB4CDAF
	Offset: 0x230
	Size: 0x10A
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
		util::server_wait(localclientnum, interval, 0.01, "player_switch");
		self util::waittill_dobj(localclientnum);
		interval = math::clamp(interval / 1.2, 0.08, 0.3);
	}
}

/*
	Name: start_light_fx
	Namespace: sticky_grenade
	Checksum: 0x797CA89F
	Offset: 0x348
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function start_light_fx(localclientnum)
{
	self.fx = util::playfxontag(localclientnum, level._effect[#"spike_light"], self, "tag_fx");
}

/*
	Name: stop_light_fx
	Namespace: sticky_grenade
	Checksum: 0xB6528EF5
	Offset: 0x3A0
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
	Name: spike_detonation
	Namespace: sticky_grenade
	Checksum: 0xC1C40F90
	Offset: 0x3F8
	Size: 0x114
	Parameters: 1
	Flags: None
*/
function spike_detonation(localclientnum)
{
	spike_position = self.origin;
	while(isdefined(self))
	{
		waitframe(1);
	}
	if(!isigcactive(localclientnum))
	{
		player = function_5c10bd79(localclientnum);
		explosion_distance = distancesquared(spike_position, player.origin);
		if(explosion_distance <= sqr(450))
		{
			player thread postfx::playpostfxbundle(#"pstfx_dust_chalk");
		}
		if(explosion_distance <= sqr(300))
		{
			player thread postfx::playpostfxbundle(#"pstfx_dust_concrete");
		}
	}
}

