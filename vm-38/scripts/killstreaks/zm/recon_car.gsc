#using scripts\weapons\deployable.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreak_vehicle.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\killstreaks\remote_weapons.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_detect.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace recon_car;

/*
	Name: function_6d4c3af9
	Namespace: recon_car
	Checksum: 0x31B54FB7
	Offset: 0x1B8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6d4c3af9()
{
	level notify(84107083);
}

/*
	Name: __init__system__
	Namespace: recon_car
	Checksum: 0xED508D7C
	Offset: 0x1D8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register("recon_car", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: recon_car
	Checksum: 0x1DD79475
	Offset: 0x220
	Size: 0xCC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_bced5d3c = [];
	if(!is_true(getgametypesetting(#"hash_45aec06707484fef")))
	{
		return false;
	}
	killstreak_detect::init_shared();
	remote_weapons::init_shared();
	killstreaks::function_b5b6ef3e(&init_killstreak);
	clientfield::register("vehicle", "" + #"hash_5b4b44738e08c9b9", 28000, 1, "counter");
}

/*
	Name: init_killstreak
	Namespace: recon_car
	Checksum: 0x40571BE
	Offset: 0x2F8
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function init_killstreak()
{
	bundle = getscriptbundle("killstreak_recon_car_zm");
	killstreak_vehicle::init_killstreak(bundle);
	deployable::register_deployable(getweapon(#"hash_3c8b385a76cbfe83"), &function_b5006cfa, undefined, undefined, #"hash_37605398dce96965");
	vehicle::add_main_callback("vehicle_t9_rcxd_racing_zm", &function_d1661ada);
}

/*
	Name: function_b5006cfa
	Namespace: recon_car
	Checksum: 0x83F1AAD2
	Offset: 0x3B8
	Size: 0x9E
	Parameters: 3
	Flags: None
*/
function function_b5006cfa(v_origin, v_angles, player)
{
	if(zm_utility::is_classic())
	{
		if(zm_utility::check_point_in_playable_area(player) && zm_utility::check_point_in_enabled_zone(player) && ispointonnavmesh(player))
		{
			return true;
		}
	}
	else if(ispointonnavmesh(player))
	{
		return true;
	}
	return false;
}

/*
	Name: function_d1661ada
	Namespace: recon_car
	Checksum: 0xD00E6CF0
	Offset: 0x460
	Size: 0x2DC
	Parameters: 0
	Flags: None
*/
function function_d1661ada()
{
	self killstreak_vehicle::init_vehicle(&function_d4789bf5);
	self util::make_sentient();
	self.var_7d4f75e = 1;
	self.ignore_death_jolt = 1;
	self.var_92043a49 = 1;
	self.var_20c65a3e = 0;
	self.var_f3c54d1d = 20;
	self disabledriverfiring(1);
	self.var_c1524340 = &function_584fb7a3;
	if(!isdefined(level.var_bced5d3c))
	{
		level.var_bced5d3c = [];
	}
	else if(!isarray(level.var_bced5d3c))
	{
		level.var_bced5d3c = array(level.var_bced5d3c);
	}
	if(!isinarray(level.var_bced5d3c, self))
	{
		level.var_bced5d3c[level.var_bced5d3c.size] = self;
	}
	self.var_a6ab9a09 = 1;
	self.var_5ab0177c = 1;
	bundle = killstreaks::get_script_bundle("recon_car");
	if(is_true(bundle.var_dad2e3a2))
	{
		self.predictedcollisiontime = 0.1;
		self thread function_819fff9d();
	}
	if(isdefined(bundle.var_1c30ba81))
	{
		self.var_a0f50ca8 = &function_2087b17f;
	}
	self.var_62b033f0 = &function_76817ccc;
	self thread function_f3170551();
	self thread function_5d0ef633();
	self thread function_3f390797();
	self thread function_fdcfd41d();
	while(!isplayer(self.owner) && isalive(self))
	{
		waitframe(1);
	}
	if(isplayer(self.owner))
	{
		self.owner thread function_48170f5e(self);
	}
}

/*
	Name: function_fdcfd41d
	Namespace: recon_car
	Checksum: 0xAE1AEA2E
	Offset: 0x748
	Size: 0x1F6
	Parameters: 0
	Flags: None
*/
function function_fdcfd41d()
{
	self endon(#"death", #"shutdown");
	while(true)
	{
		var_d39fdf94 = getaiarchetypearray(#"hulk");
		var_d39fdf94 = arraysortclosest(var_d39fdf94, self.origin, undefined, 0, 1000);
		foreach(var_a0b59f75 in var_d39fdf94)
		{
			if(isalive(var_a0b59f75))
			{
				var_a3a77704 = var_a0b59f75 gettagorigin("j_ball_le");
				var_feafc7a2 = var_a0b59f75 gettagorigin("j_ball_ri");
				if(isdefined(var_a3a77704) && distancesquared(self.origin, var_a3a77704) <= 2025 || (isdefined(var_feafc7a2) && distancesquared(self.origin, var_feafc7a2) <= 2025))
				{
					self notify(#"veh_predictedcollision", {#target:var_a0b59f75});
					return;
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_48170f5e
	Namespace: recon_car
	Checksum: 0x7D6A9D3C
	Offset: 0x948
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_48170f5e(vehicle)
{
	level endon(#"end_game");
	self endon(#"disconnect");
	self val::set(#"recon_car", "ignoreme", 1);
	self val::set(#"recon_car", "takedamage", 0);
	vehicle waittill(#"death", #"shutdown");
	if(isplayer(self))
	{
		self sethintstring("");
	}
	wait(2);
	if(isplayer(self))
	{
		self val::reset(#"recon_car", "ignoreme");
		self val::reset(#"recon_car", "takedamage");
	}
}

/*
	Name: function_3f390797
	Namespace: recon_car
	Checksum: 0xA845EC3D
	Offset: 0xAA8
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_3f390797()
{
	self endon(#"death", #"shutdown");
	level waittill(#"hash_345e9169ebba28fb");
	self.selfdestruct = 1;
	self killstreak_vehicle::function_822e1f64();
}

/*
	Name: function_5d0ef633
	Namespace: recon_car
	Checksum: 0x68503166
	Offset: 0xB10
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function function_5d0ef633()
{
	self endon(#"death", #"shutdown");
	while(true)
	{
		wait(1.5);
		if(isdefined(self.owner))
		{
			self function_86e8d9af();
		}
	}
}

/*
	Name: function_86e8d9af
	Namespace: recon_car
	Checksum: 0x77BB7F16
	Offset: 0xB78
	Size: 0x284
	Parameters: 1
	Flags: None
*/
function function_86e8d9af(n_radius)
{
	if(!isdefined(n_radius))
	{
		n_radius = 200;
	}
	self endon(#"death", #"shutdown");
	if(self.vehicletype === "vehicle_t9_rcxd_racing_mq")
	{
		self notify(#"hash_2eef2b24309bc112");
	}
	self clientfield::increment("" + #"hash_5b4b44738e08c9b9");
	a_zombies = self.owner getenemiesinradius(self.origin, n_radius);
	foreach(ai_zombie in a_zombies)
	{
		if(isalive(ai_zombie))
		{
			if(ai_zombie.var_6f84b820 === #"normal")
			{
				v_dir = vectornormalize(ai_zombie.origin - self.origin);
				v_launch = (v_dir * randomintrange(80, 100)) + vectorscale((0, 0, 1), 150);
				ai_zombie zm_utility::function_ffc279(v_launch, self.owner, ai_zombie.health, self.weapon);
				continue;
			}
			ai_zombie thread ai::stun();
		}
	}
	self radiusdamage(self.origin, n_radius, self.radiusdamagemax, self.radiusdamagemin, self.owner, "MOD_UNKNOWN", self.weapon);
	glassradiusdamage(self.origin, n_radius, self.radiusdamagemax, self.radiusdamagemin, "MOD_UNKNOWN");
}

/*
	Name: function_584fb7a3
	Namespace: recon_car
	Checksum: 0x3F9B19B4
	Offset: 0xE08
	Size: 0xEC
	Parameters: 0
	Flags: Private
*/
function private function_584fb7a3()
{
	vehicle = self;
	vehicle endon(#"death");
	if(!is_true(vehicle.remote_weapon_end))
	{
		vehicle waittill(#"remote_weapon_end", #"hash_59b25025ce93a142");
	}
	attacker = (isdefined(vehicle.owner) ? vehicle.owner : undefined);
	vehicle dodamage(vehicle.health + 1, vehicle.origin + vectorscale((0, 0, 1), 10), attacker, attacker, "none", "MOD_EXPLOSIVE", 8192);
}

/*
	Name: function_d4789bf5
	Namespace: recon_car
	Checksum: 0x7E615610
	Offset: 0xF00
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function function_d4789bf5()
{
	self.var_99c7a1bc = self.weapon;
}

/*
	Name: function_819fff9d
	Namespace: recon_car
	Checksum: 0x853E913C
	Offset: 0xF20
	Size: 0x128
	Parameters: 0
	Flags: None
*/
function function_819fff9d()
{
	self endon(#"death");
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"veh_predictedcollision");
		if(isplayer(waitresult.target) || isai(waitresult.target) && util::function_fbce7263(self.team, waitresult.target.team))
		{
			if(isdefined(self.owner) && isdefined(self.var_22a05c26.var_d3413870))
			{
				self.owner killstreaks::function_e9873ef7(self.var_22a05c26.var_d3413870, self.killstreak_id, #"hash_20e53d0989f408e6");
			}
			self killstreak_vehicle::function_1f46c433();
		}
	}
}

/*
	Name: function_f3170551
	Namespace: recon_car
	Checksum: 0x2F65D9DA
	Offset: 0x1050
	Size: 0x128
	Parameters: 0
	Flags: None
*/
function function_f3170551()
{
	self endon(#"death");
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"veh_landed");
		bundle = killstreaks::get_script_bundle("recon_car");
		if(isdefined(bundle.var_b771831a))
		{
			a_trace = groundtrace(self.origin + vectorscale((0, 0, 1), 70), self.origin + (vectorscale((0, 0, -1), 100)), 0, self);
			str_fx = self getfxfromsurfacetable(bundle.var_b771831a, a_trace[#"surfacetype"]);
			playfx(str_fx, a_trace[#"position"], (0, 0, 1));
		}
	}
}

/*
	Name: function_2087b17f
	Namespace: recon_car
	Checksum: 0xB5D53DD1
	Offset: 0x1180
	Size: 0x164
	Parameters: 0
	Flags: None
*/
function function_2087b17f()
{
	bundle = killstreaks::get_script_bundle("recon_car");
	arrayremovevalue(level.var_bced5d3c, self);
	trace = groundtrace(self.origin + vectorscale((0, 0, 1), 70), self.origin + (vectorscale((0, 0, -1), 100)), 0, self);
	explosionfx = self getfxfromsurfacetable(bundle.var_1c30ba81, trace[#"surfacetype"]);
	if(isdefined(explosionfx))
	{
		fxorigin = self gettagorigin("tag_body");
		if(!isdefined(fxorigin))
		{
			fxorigin = self.origin;
		}
		playfx(explosionfx, fxorigin, (0, 0, 1));
	}
	playsoundatposition(#"hash_7723f91638b2361f", self.origin + vectorscale((0, 0, 1), 25));
}

/*
	Name: function_76817ccc
	Namespace: recon_car
	Checksum: 0x72617E0F
	Offset: 0x12F0
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_76817ccc()
{
	if(isdefined(self.owner) && isdefined(self.var_22a05c26.var_d3413870))
	{
		self.owner killstreaks::function_e9873ef7(self.var_22a05c26.var_d3413870, self.killstreak_id, #"hash_b7109f8dd0ceb9");
	}
}

/*
	Name: function_8030f1bd
	Namespace: recon_car
	Checksum: 0xC371F080
	Offset: 0x1360
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function function_8030f1bd(zombie)
{
	arrayremovevalue(level.var_bced5d3c, undefined);
	if(level.var_bced5d3c.size > 0)
	{
		var_3e90a437 = arraygetclosest(zombie.origin, level.var_bced5d3c, 1000);
	}
	return var_3e90a437;
}

