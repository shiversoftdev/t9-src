#using script_3728b3b9606c4299;
#using script_57c900a7e39234be;
#using script_6c8abe14025b47c4;
#using script_751513c609504a42;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace player_vtol;

/*
	Name: function_89f2df9
	Namespace: player_vtol
	Checksum: 0x5A98B101
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"player_vtol", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player_vtol
	Checksum: 0xC5E9EEF6
	Offset: 0x120
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_vtol", &function_1b39ded0);
}

/*
	Name: function_1b39ded0
	Namespace: player_vtol
	Checksum: 0xB7CDF95
	Offset: 0x158
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_1b39ded0()
{
	self function_803e9bf3(1);
	self.numflares = 1;
	self.var_fc0dee44 = 10000;
	bundle = killstreaks::get_script_bundle("hoverjet");
	self thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(bundle, "death", "dodge_missile", 1);
	self.var_51e39f11 = [];
	self thread function_7d2e878c();
	self thread function_fcc7ca52();
	self thread namespace_14c38db0::function_7e1a12ce(self.var_fc0dee44);
}

/*
	Name: function_fcc7ca52
	Namespace: player_vtol
	Checksum: 0xB6A60974
	Offset: 0x240
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function function_fcc7ca52()
{
	self endon(#"death");
	for(;;)
	{
		params = undefined;
		params = self waittill(#"gunner_weapon_fired");
		if(params.gunner_index === 1)
		{
			self turretsettarget(2, self turretgettarget(1));
			self fireweapon(2, undefined, undefined, self);
		}
	}
}

/*
	Name: function_49e8c140
	Namespace: player_vtol
	Checksum: 0x3E8AA1E4
	Offset: 0x2F0
	Size: 0x12C
	Parameters: 0
	Flags: Event
*/
event function_49e8c140()
{
	if(target_istarget(self))
	{
		target_remove(self);
	}
	foreach(missile in self.var_51e39f11)
	{
		if(isdefined(missile))
		{
			missile missile_settarget(undefined);
		}
	}
	self.var_51e39f11 = [];
	self notify(#"hash_48ff18e546254ecb");
	bundle = killstreaks::get_script_bundle("hoverjet");
	self thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(bundle, "death", "dodge_missile", 1);
}

/*
	Name: function_9d2a2309
	Namespace: player_vtol
	Checksum: 0xAA5C5CCF
	Offset: 0x428
	Size: 0x1C
	Parameters: 0
	Flags: Event
*/
event function_9d2a2309()
{
	target_set(self);
}

/*
	Name: function_7d2e878c
	Namespace: player_vtol
	Checksum: 0x9C2765CB
	Offset: 0x450
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_7d2e878c()
{
	level endon(#"game_ended");
	self endon(#"death");
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"stinger_fired_at_me");
		if(!isdefined(self.var_51e39f11))
		{
			self.var_51e39f11 = [];
		}
		else if(!isarray(self.var_51e39f11))
		{
			self.var_51e39f11 = array(self.var_51e39f11);
		}
		self.var_51e39f11[self.var_51e39f11.size] = waitresult.projectile;
	}
}

/*
	Name: function_ff2361d1
	Namespace: player_vtol
	Checksum: 0x48AF86C6
	Offset: 0x520
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_ff2361d1(target)
{
	self waittill(#"death");
	if(isdefined(target) && isdefined(target.var_51e39f11))
	{
		arrayremovevalue(target.var_51e39f11, self);
	}
}

