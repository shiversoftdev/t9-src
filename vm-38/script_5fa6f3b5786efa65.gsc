#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_350cffecd05ef6cf;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_6b6510e124bad778;
#using script_74a56359b7d02ab6;
#using script_76983b49bef66b2e;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_1174089d;

/*
	Name: function_b6a4c07b
	Namespace: namespace_1174089d
	Checksum: 0x7EDA9C60
	Offset: 0x2E8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b6a4c07b()
{
	level notify(700963799);
}

#namespace namespace_6d0b8a1a;

/*
	Name: function_44cc3493
	Namespace: namespace_6d0b8a1a
	Checksum: 0x592F4CCC
	Offset: 0x308
	Size: 0x3B2
	Parameters: 2
	Flags: Linked
*/
function function_44cc3493(var_2177e1d4, player)
{
	if(!isdefined(var_2177e1d4))
	{
		var_2177e1d4 = 2;
	}
	self endon(#"death");
	level endon(#"game_over");
	while(var_2177e1d4 > 0)
	{
		var_77e4cc0b = arraysortclosest(getaiteamarray(#"axis"), self.origin);
		potentials = [];
		foreach(guy in var_77e4cc0b)
		{
			if(is_true(guy.var_85a0c6e6))
			{
				continue;
			}
			if(!isdefined(potentials))
			{
				potentials = [];
			}
			else if(!isarray(potentials))
			{
				potentials = array(potentials);
			}
			potentials[potentials.size] = guy;
		}
		foreach(guy in potentials)
		{
			if(isdefined(guy))
			{
				if(is_true(guy.boss))
				{
					continue;
				}
				if(is_true(guy.var_85a0c6e6))
				{
					continue;
				}
				if(is_true(guy.tesla_death))
				{
					continue;
				}
				in_view = util::within_fov(self.origin, self.angles, guy.origin, 0.9);
				if(!in_view)
				{
					continue;
				}
				self namespace_83eb6304::function_3ecfde67("teleporter_disabled");
				var_2177e1d4--;
				guy.var_85a0c6e6 = 1;
				self.org.origin = self.origin + vectorscale((0, 0, 1), 40);
				self.org namespace_83eb6304::function_3ecfde67("tesla_trail");
				self.org moveto(guy.origin + vectorscale((0, 0, 1), 40), 0.4);
				wait(0.4);
				self.org namespace_83eb6304::turnofffx("tesla_trail");
				level thread namespace_9038b9d9::function_8d45f3be(guy, player);
				wait(randomfloatrange(0.4, 2));
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_465aaf09
	Namespace: namespace_6d0b8a1a
	Checksum: 0xEC9CE33F
	Offset: 0x6C8
	Size: 0x47E
	Parameters: 2
	Flags: Linked
*/
function function_465aaf09(player, origin)
{
	if(is_true(level.doa.var_41adf604))
	{
		return;
	}
	if(isdefined(level.doa.var_54c5c3e6))
	{
		return;
	}
	hitp = namespace_ec06fe4a::function_65ee50ba(origin);
	origin = (origin[0], origin[1], hitp[2]);
	var_c95d22c = namespace_ec06fe4a::function_e22ae9b3(origin + vectorscale((0, 0, 1), 12), "zombietron_arcademachine", player.angles + vectorscale((0, 1, 0), 180), "zombietron_arcademachine");
	if(!isdefined(var_c95d22c))
	{
		return;
	}
	var_c95d22c endon(#"death");
	var_c95d22c.org = namespace_ec06fe4a::function_e22ae9b3(origin + vectorscale((0, 0, 1), 12), "tag_origin", (0, 0, 0), "zombietron_arcademachine_org");
	if(!isdefined(var_c95d22c.org))
	{
		var_c95d22c delete();
		return;
	}
	var_c95d22c.org thread namespace_ec06fe4a::function_d55f042c(var_c95d22c, "death");
	var_c95d22c thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
	var_c95d22c thread namespace_ec06fe4a::function_d55f042c(level, "exit_taken");
	var_c95d22c thread namespace_ec06fe4a::function_d55f042c(level, "arena_completed");
	rooms = array("slideways", "slideways2", "slideways3");
	level.doa.var_848746c8 = rooms[randomint(rooms.size)];
	level.doa.var_54c5c3e6 = var_c95d22c;
	var_c95d22c namespace_e32bb68::function_3a59ec34("evt_doa_pickup_arcade_active_lp");
	var_c95d22c thread namespace_ec06fe4a::function_2d920b3c(1, 0);
	timeout = gettime() + 30000;
	while(timeout > gettime())
	{
		if(level flag::get("doa_round_over"))
		{
			break;
		}
		wait(randomfloatrange(1, 4));
		var_c95d22c namespace_83eb6304::function_3ecfde67("lightningStrike");
		var_c95d22c namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
		var_c95d22c thread function_44cc3493(randomintrange(1, 5), player);
	}
	var_c95d22c namespace_83eb6304::function_3ecfde67("arcade_spark");
	var_c95d22c notify(#"hash_7bf2519960a3852a");
	var_c95d22c namespace_83eb6304::function_3ecfde67("wild_portal_radial_burst");
	var_c95d22c namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_wilds_burst");
	var_c95d22c namespace_83eb6304::function_3ecfde67("turret_impact");
	var_c95d22c namespace_e32bb68::function_3a59ec34("evt_doa_pickup_sentry_land");
	var_c95d22c moveto(var_c95d22c.origin + vectorscale((0, 0, 1), 3000), 1);
	wait(1);
	var_c95d22c.org delete();
	var_c95d22c delete();
	level.doa.var_54c5c3e6 = undefined;
}

