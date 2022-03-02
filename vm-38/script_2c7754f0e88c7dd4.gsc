#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1b01e95a6b5270fd;
#using script_1b905a8474ed2a62;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_3aa0f32b70d4f7cb;
#using script_47851dbeea22fe66;
#using script_4d85e8de54b02198;
#using script_4f3bff1bf61c555d;
#using script_522aeb6ae906391e;
#using script_5701633066d199f2;
#using script_59f07c660e6710a5;
#using script_5f20d3b434d24884;
#using script_774302f762d76254;
#using script_7b7ed6e4bc963a51;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\statemachine_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_a0fa2b5;

/*
	Name: function_c9eac404
	Namespace: namespace_a0fa2b5
	Checksum: 0xCE27D41B
	Offset: 0x308
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c9eac404()
{
	level notify(1064989021);
}

/*
	Name: init
	Namespace: namespace_a0fa2b5
	Checksum: 0x420CBD58
	Offset: 0x328
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_250e9486::function_252dff4d("meatball_large", 9, &function_d240d5de, &function_41157a40, 41);
	namespace_250e9486::function_252dff4d("meatball_medium", 10, &function_d240d5de, &function_41157a40);
	namespace_250e9486::function_252dff4d("meatball_small", 11, &function_d240d5de, &function_41157a40);
}

/*
	Name: function_fd051611
	Namespace: namespace_a0fa2b5
	Checksum: 0xF47606D2
	Offset: 0x3E8
	Size: 0x234
	Parameters: 1
	Flags: Linked
*/
function function_fd051611(s_params)
{
	enemy = self.favoriteenemy;
	origin = self.origin;
	angles = self.angles;
	if(self.vehicletype == #"spawner_zombietron_veh_meatball")
	{
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_meatball_lrg_death");
		if(!isdefined(level.doa.var_e37e1100))
		{
			level.doa.var_e37e1100 = doa_enemy::function_d7c5adee("meatball_medium");
		}
		def = level.doa.var_e37e1100;
	}
	else
	{
		if(self.vehicletype == #"spawner_zombietron_veh_meatball_med")
		{
			self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_meatball_med_death");
			if(!isdefined(level.doa.var_77c6357f))
			{
				level.doa.var_77c6357f = doa_enemy::function_d7c5adee("meatball_small");
			}
			def = level.doa.var_77c6357f;
		}
		else
		{
			self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_meatball_sml_death");
		}
	}
	if(isdefined(def))
	{
		ai1 = doa_enemy::function_db55a448(def, origin, enemy);
		ai2 = doa_enemy::function_db55a448(def, origin + vectorscale((0, 1, 0), 20), enemy);
		if(isdefined(ai1))
		{
			ai1 namespace_83eb6304::function_3ecfde67("demon_burst");
		}
		if(isdefined(ai2))
		{
			ai2 namespace_83eb6304::function_3ecfde67("demon_burst");
		}
	}
}

/*
	Name: function_d240d5de
	Namespace: namespace_a0fa2b5
	Checksum: 0x109DD523
	Offset: 0x628
	Size: 0x4CC
	Parameters: 0
	Flags: Linked
*/
function function_d240d5de()
{
	self useanimtree("generic");
	self namespace_ec06fe4a::function_8c808737();
	self callback::function_d8abfc3d(#"on_vehicle_killed", &function_fd051611);
	namespace_250e9486::function_25b2c8a9();
	initblackboard();
	self.b_ignore_cleanup = 1;
	self.var_5dd07a80 = 1;
	self.var_232915af = 1;
	self.var_68139d12 = 1;
	self.nodamagefeedback = 1;
	self vehicle::friendly_fire_shield();
	self enableaimassist();
	self setneargoalnotifydist(60);
	self setdrawinfrared(1);
	self solid();
	self.fovcosine = 0;
	self.fovcosinebusy = 0;
	/#
		assert(isdefined(self.scriptbundlesettings));
	#/
	self.settings = getscriptbundle(self.scriptbundlesettings);
	self.var_651e2d9b = 0.4;
	self.goalradius = 512;
	self.goalheight = 100;
	self.var_ec0d66ce = 0.5 * (self.settings.engagementdistmin + self.settings.engagementdistmax);
	self.var_ff6d7c88 = sqr(self.var_ec0d66ce);
	self thread vehicle_ai::nudge_collision();
	self.health = 3000;
	self.maxhealth = 3000;
	self.var_f7f65924 = 5;
	self.damage_on_death = 0;
	target_set(self);
	var_64ae47e = "zmb_doa_ai_meatball_lrg_spawn";
	var_9c464736 = "zmb_doa_ai_meatball_lrg_lp";
	if(isdefined(self.script_noteworthy))
	{
		switch(self.script_noteworthy)
		{
			case "meatball_large":
			{
				var_64ae47e = "zmb_doa_ai_meatball_lrg_spawn";
				var_9c464736 = "zmb_doa_ai_meatball_lrg_lp";
				self.var_8de8630 = sqr(50);
				break;
			}
			case "meatball_medium":
			{
				var_64ae47e = "zmb_doa_ai_meatball_med_spawn";
				var_9c464736 = "zmb_doa_ai_meatball_med_lp";
				self.var_8de8630 = sqr(40);
				break;
			}
			case "meatball_small":
			{
				var_64ae47e = "zmb_doa_ai_meatball_sml_spawn";
				var_9c464736 = "zmb_doa_ai_meatball_sml_lp";
				self.var_8de8630 = sqr(30);
				break;
			}
		}
	}
	self namespace_e32bb68::function_3a59ec34(var_64ae47e);
	self namespace_e32bb68::function_3a59ec34(var_9c464736);
	self thread proximitykill();
	if(isdefined(level.doa.var_a598a835))
	{
		self.spawnloc = [[level.doa.var_a598a835]]();
	}
	if(namespace_4dae815d::function_59a9cf1d() != 5)
	{
		if(self.vehicletype == #"spawner_zombietron_veh_meatball")
		{
			self thread namespace_250e9486::function_e10af211((isdefined(self.spawnloc) ? self.spawnloc.origin : undefined), "gem_trail_red", undefined, 1, 1);
		}
		self thread namespace_ec06fe4a::function_570729f0(60);
	}
	if(namespace_4dae815d::function_59a9cf1d() == 5)
	{
		/#
			self thread function_839fc28e();
		#/
	}
}

/*
	Name: proximitykill
	Namespace: namespace_a0fa2b5
	Checksum: 0xB8F5FFBD
	Offset: 0xB00
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function proximitykill()
{
	self notify("385444419fcf4ecd");
	self endon("385444419fcf4ecd");
	self endon(#"death");
	while(true)
	{
		if(isdefined(self.favoriteenemy))
		{
			distsq = distancesquared(self.origin, self.favoriteenemy.origin);
			if(distsq <= self.var_8de8630)
			{
				self.favoriteenemy dodamage(25, self.origin, self, undefined, "MOD_IMPACT");
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_839fc28e
	Namespace: namespace_a0fa2b5
	Checksum: 0xF02E72FA
	Offset: 0xBD0
	Size: 0x66
	Parameters: 0
	Flags: None
*/
function function_839fc28e()
{
	/#
		self endon(#"death");
		while(true)
		{
			line(self.origin, self.origin + vectorscale((0, 0, 1), 1000), (1, 0, 0), 1, 0, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: function_41157a40
	Namespace: namespace_a0fa2b5
	Checksum: 0x9BCED045
	Offset: 0xC40
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_41157a40()
{
	self endon(#"death");
	self thread function_49fbe60a();
	while(!self.var_c0bd8c06)
	{
		wait(1);
		namespace_250e9486::function_c1f37cab();
	}
	self thread namespace_ec06fe4a::function_570729f0(0.1);
}

/*
	Name: initblackboard
	Namespace: namespace_a0fa2b5
	Checksum: 0x7D4A4A23
	Offset: 0xCB8
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private initblackboard()
{
	self.__blackboard = undefined;
	blackboard::createblackboardforentity(self);
	self blackboard::registervehicleblackboardattributes();
	ai::createinterfaceforentity(self);
}

/*
	Name: function_49fbe60a
	Namespace: namespace_a0fa2b5
	Checksum: 0x4D497C87
	Offset: 0xD18
	Size: 0x70
	Parameters: 0
	Flags: Linked, Private
*/
function private function_49fbe60a()
{
	self endon(#"death");
	while(true)
	{
		if(is_true(self.ignoreall))
		{
			wait(0.5);
			continue;
		}
		self namespace_250e9486::function_4b49bf0d();
		wait(0.5);
	}
}

