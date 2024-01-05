#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace spike_charge;

/*
	Name: function_b9b5ab66
	Namespace: spike_charge
	Checksum: 0x6A3F1B7E
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b9b5ab66()
{
	level notify(-122899997);
}

#namespace sticky_grenade;

/*
	Name: __init__system__
	Namespace: sticky_grenade
	Checksum: 0xA664AF82
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"spike_charge", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: sticky_grenade
	Checksum: 0xEBCF4B9A
	Offset: 0x110
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
	Checksum: 0x25F5ADE5
	Offset: 0x1D8
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
	Checksum: 0xED83B1F8
	Offset: 0x208
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
	Checksum: 0x38841168
	Offset: 0x250
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
	Checksum: 0x721A4620
	Offset: 0x368
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
	Checksum: 0xCDDC0C7F
	Offset: 0x3C0
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
	Checksum: 0xC9A1E5AA
	Offset: 0x418
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

