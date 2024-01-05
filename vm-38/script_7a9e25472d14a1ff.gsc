#using script_164a456ce05c3483;
#using script_47851dbeea22fe66;
#using script_1ee011cd0961afd7;
#using script_5f20d3b434d24884;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_2a5bf5b4a00cee0d;
#using script_17dcb1172e441bf6;
#using script_4d85e8de54b02198;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai\blackboard_vehicle.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\statemachine_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using script_59f07c660e6710a5;
#using script_7b7ed6e4bc963a51;
#using script_522aeb6ae906391e;
#using script_3aa0f32b70d4f7cb;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_8c89a9e9;

/*
	Name: function_863ebb13
	Namespace: namespace_8c89a9e9
	Checksum: 0x41BB6F4E
	Offset: 0x258
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_863ebb13()
{
	level notify(-1435799969);
}

/*
	Name: init
	Namespace: namespace_8c89a9e9
	Checksum: 0x460FAC2D
	Offset: 0x278
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_250e9486::function_252dff4d("ghost_zombie", 5, &function_5836955d, undefined, 25);
}

/*
	Name: function_5836955d
	Namespace: namespace_8c89a9e9
	Checksum: 0xE28B5425
	Offset: 0x2B8
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function function_5836955d()
{
	namespace_250e9486::function_25b2c8a9();
	self.zombie_move_speed = "sprint";
	self.doa.var_74e4ded8 = 1;
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
	self.maxhealth = 100;
	self.health = self.maxhealth;
	self.animrate = 1.15;
	self asmsetanimationrate(self.animrate);
	self.no_ragdoll = 1;
	self.var_1c8b76d3 = 1;
	self.no_gib = 1;
	self.var_af545843 = 1;
	self.var_abe67a20 = 1;
	self.var_bbdaef90 = 1;
	self setavoidancemask("avoid none");
	self collidewithactors(0);
	self setplayercollision(0);
	self.overrideactordamage = &function_b8c581fb;
	self thread function_d8e8920a();
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_ghost_spawn");
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_ghost_lp");
}

/*
	Name: function_b8c581fb
	Namespace: namespace_8c89a9e9
	Checksum: 0xD6E5F2C0
	Offset: 0x468
	Size: 0x140
	Parameters: 13
	Flags: Linked, Private
*/
function private function_b8c581fb(inflictor, attacker, damage, flags, meansofdamage, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(modelindex >= self.health)
	{
		self.takedamage = 0;
		self namespace_ec06fe4a::function_8c808737();
		self notsolid();
		orb = namespace_ec06fe4a::function_e22ae9b3(self.origin);
		if(isdefined(orb))
		{
			orb thread namespace_ec06fe4a::function_52afe5df(1);
			orb namespace_83eb6304::function_3ecfde67("electrical_explo");
			orb namespace_e32bb68::function_3a59ec34("zmb_doa_ai_ghost_explo");
		}
	}
	return modelindex;
}

/*
	Name: function_d8e8920a
	Namespace: namespace_8c89a9e9
	Checksum: 0x6E12F72A
	Offset: 0x5B0
	Size: 0x2DA
	Parameters: 0
	Flags: Linked
*/
function function_d8e8920a()
{
	self endon(#"death");
	if(!isdefined(level.doa.var_39e3fa99))
	{
		return;
	}
	while(true)
	{
		wait(1 + randomint(9));
		if(isdefined(self.enemy))
		{
			var_6e3ad56b = self.enemy.origin;
			if(isplayer(self.enemy))
			{
				velocity = self.enemy getvelocity();
				velocity = (velocity[0], velocity[1], 0);
				if(length(velocity) >= 0)
				{
					var_6e3ad56b = var_6e3ad56b + vectorscale(velocity, 1.8);
				}
			}
			dest = getrandomnavpoint(var_6e3ad56b, 20, self getpathfindingradius());
			if(isdefined(dest))
			{
				spot = dest;
			}
			else
			{
				continue;
			}
			self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_ghost_warp_out");
			self namespace_83eb6304::function_3ecfde67("ethereal_vapors");
			self.ignoreall = 1;
			self setgoal(self.origin);
			angles = self.enemy.angles + vectorscale((0, 1, 0), 180);
			self clearenemy();
			self.takedamage = 0;
			self namespace_ec06fe4a::function_8c808737();
			self forceteleport(spot, angles);
			wait(0.3);
			self.takedamage = 1;
			self namespace_ec06fe4a::function_4f72130c();
			self namespace_83eb6304::function_3ecfde67("ethereal_vapors");
			self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_ghost_warp_in");
			wait(0.5);
			self.ignoreall = 0;
			wait(4 + randomint(6));
		}
	}
}

