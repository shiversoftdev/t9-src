#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_7fdfcd5b;

/*
	Name: function_86bd7962
	Namespace: namespace_7fdfcd5b
	Checksum: 0xEEBD3886
	Offset: 0x250
	Size: 0x484
	Parameters: 3
	Flags: Linked
*/
function function_86bd7962(player, spot, mg)
{
	if(!isdefined(mg))
	{
		mg = 1;
	}
	if(!isdefined(spot))
	{
		spot = player.origin;
	}
	if(mg)
	{
		sentry = level.doa.pickups.var_ef3f4447 spawner::spawn(1, "zombietron_sentry_spawner");
	}
	else
	{
		sentry = level.doa.pickups.var_9eec57e8 spawner::spawn(1, "zombietron_grenade_spawner");
	}
	faketarget = namespace_ec06fe4a::function_e22ae9b3(sentry.origin);
	if(!isdefined(sentry))
	{
		return;
	}
	sentry endon(#"death");
	team = player.team;
	sentry.ismissile = !mg;
	sentry.faketarget = faketarget;
	if(isdefined(sentry.faketarget))
	{
		sentry.faketarget thread namespace_ec06fe4a::function_d55f042c(sentry, "death");
	}
	sentry.origin = spot + vectorscale((0, 0, 1), 2200);
	sentry.angles = (player.angles[0], player.angles[1], 0);
	sentry.weapon = sentry seatgetweapon(0);
	sentry turretsetontargettolerance(0, 10);
	sentry namespace_83eb6304::function_3ecfde67("player_trail_" + player.doa.color);
	sentry thread namespace_ec06fe4a::function_1a117d29(spot, 0.5);
	sentry waittill(#"movedone");
	sentry.angles = (sentry.angles[0], sentry.angles[1], 0);
	sentry.owner = player;
	sentry.ignoreme = 1;
	sentry.takedamage = 0;
	sentry setteam(team);
	sentry notsolid();
	sentry namespace_83eb6304::function_3ecfde67("turret_impact");
	sentry namespace_e32bb68::function_3a59ec34("evt_doa_pickup_sentry_land");
	sentry thread function_229ed59f();
	sentry thread function_5945a362();
	physicsexplosionsphere(spot, 200, 128, 2);
	playrumbleonposition("grenade_rumble", spot);
	timeout = (mg ? 40 : 20);
	timeout = player doa_fate::function_4808b985(timeout);
	level waittilltimeout(timeout, #"round_over", #"game_over");
	sentry notify(#"hash_1cccdf220a51b30d");
	sentry namespace_e32bb68::function_3a59ec34("evt_doa_pickup_sentry_takeoff");
	sentry namespace_83eb6304::function_3ecfde67("turret_impact");
	sentry thread namespace_ec06fe4a::function_1a117d29(sentry.origin + vectorscale((0, 0, 1), 2200), 0.5);
	sentry waittill(#"movedone");
	sentry delete();
}

/*
	Name: function_b44f2805
	Namespace: namespace_7fdfcd5b
	Checksum: 0x4136EFC3
	Offset: 0x6E0
	Size: 0xD8
	Parameters: 0
	Flags: Linked
*/
function function_b44f2805()
{
	self endon(#"death");
	while(isdefined(self.faketarget))
	{
		if(isdefined(self.favoriteenemy))
		{
			if(is_true(self.ismissile))
			{
				self.faketarget.origin = (self.origin + ((self.favoriteenemy.origin - self.origin) * 0.5)) + vectorscale((0, 0, 1), 1000);
			}
			else
			{
				self.faketarget.origin = self.favoriteenemy.origin + vectorscale((0, 0, 1), 30);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_229ed59f
	Namespace: namespace_7fdfcd5b
	Checksum: 0x9152B369
	Offset: 0x7C0
	Size: 0x230
	Parameters: 0
	Flags: Linked
*/
function function_229ed59f()
{
	self endon(#"death", #"hash_1cccdf220a51b30d");
	self thread function_b44f2805();
	while(self.health > 0)
	{
		distsq = undefined;
		if(isdefined(self.favoriteenemy))
		{
			distsq = distancesquared(self.origin, self.favoriteenemy.origin);
		}
		if(!isdefined(distsq) || distsq > sqr(200))
		{
			lastenemy = self.favoriteenemy;
			if(isdefined(self.owner) && distancesquared(self.origin, self.owner.origin) < sqr(700))
			{
				self.favoriteenemy = self.owner namespace_ec06fe4a::getclosestenemy();
			}
			else
			{
				self.favoriteenemy = namespace_ec06fe4a::getclosestenemy();
			}
		}
		if(lastenemy !== self.favoriteenemy)
		{
			self.hasseenfavoriteenemy = 0;
			self.var_43a5ac40 = 0;
		}
		if(!isdefined(self.favoriteenemy))
		{
			self turretsettargetangles(0, (0, 0, 0));
		}
		else
		{
			if(isdefined(self.faketarget))
			{
				self turretsettarget(0, self.faketarget.origin);
			}
			else
			{
				self turretsettarget(0, self.favoriteenemy.origin + vectorscale((0, 0, 1), 30));
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_5945a362
	Namespace: namespace_7fdfcd5b
	Checksum: 0xAEF34B3F
	Offset: 0x9F8
	Size: 0x5FC
	Parameters: 0
	Flags: Linked
*/
function function_5945a362()
{
	self endon(#"death", #"hash_1cccdf220a51b30d");
	if(!isdefined(self.hasseenfavoriteenemy))
	{
		self.hasseenfavoriteenemy = 0;
	}
	if(!isdefined(self.var_43a5ac40))
	{
		self.var_43a5ac40 = 0;
	}
	wait(1.5);
	while(self.health > 0)
	{
		wait(0.25);
		if(isalive(self.favoriteenemy))
		{
			v_origin = self gettagorigin("tag_flash");
			v_angles = self gettagangles("tag_flash");
			forward = anglestoforward(v_angles);
			enemyorigin = (self.favoriteenemy.origin[0], self.favoriteenemy.origin[1], v_origin[2]);
			if(!is_true(self.ismissile))
			{
				distsq = distancesquared(enemyorigin, v_origin);
				if(distsq > sqr(512))
				{
					var_fd809cca = 0.96;
				}
				else
				{
					if(distsq > sqr(256))
					{
						var_fd809cca = 0.93;
					}
					else
					{
						if(distsq > sqr(128))
						{
							var_fd809cca = 0.9;
						}
						else
						{
							var_fd809cca = 0.8;
						}
					}
				}
				to_obj = vectornormalize(enemyorigin - v_origin);
				dot = vectordot(to_obj, forward);
				if(dot < var_fd809cca)
				{
					continue;
				}
				time = gettime();
				if(self.var_43a5ac40 < time)
				{
					if(self cansee(self.favoriteenemy) == 0)
					{
						self.var_43a5ac40 = time + 100;
						self.hasseenfavoriteenemy = 0;
						continue;
					}
					else
					{
						self.hasseenfavoriteenemy = 1;
						self.var_43a5ac40 = time + 6000;
					}
				}
				else
				{
					continue;
				}
			}
			else
			{
				to_obj = vectornormalize(enemyorigin - v_origin);
				dot = vectordot(to_obj, forward);
				if(dot < 0.7)
				{
					continue;
				}
			}
			if(isdefined(self.faketarget))
			{
				self turretsettarget(0, self.faketarget.origin);
			}
			else
			{
				self turretsettarget(0, self.favoriteenemy.origin + vectorscale((0, 0, 1), 30));
			}
			firetime = randomfloatrange(3, 6);
			expiretime = gettime() + (firetime * 1000);
			enemy = self.favoriteenemy;
			if(isdefined(self.faketarget))
			{
				enemy = self.faketarget;
				enemy.var_c80846be = self.favoriteenemy;
			}
			if(!is_true(self.ismissile))
			{
				while(gettime() < expiretime)
				{
					waitframe(1);
					v_origin = self gettagorigin("tag_flash");
					v_origin = (v_origin[0], v_origin[1], 0);
					v_angles = self gettagangles("tag_flash");
					forward = anglestoforward(v_angles);
					enemyorigin = (enemy.origin[0], enemy.origin[1], 0);
					to_obj = vectornormalize(enemyorigin - v_origin);
					dot = vectordot(to_obj, forward);
					if(dot < 0.85)
					{
						continue;
					}
					for(rounds = 30; rounds; rounds--)
					{
						self fireweapon(0, enemy, vectorscale((0, 0, 1), 30), self.owner);
						waitframe(1);
					}
				}
			}
			else
			{
				while(gettime() < expiretime)
				{
					if(!isdefined(self.favoriteenemy))
					{
						break;
					}
					self thread function_aa217b6c(enemy);
					wait(randomfloatrange(0.1, 0.45));
				}
			}
			wait(1);
		}
	}
}

/*
	Name: function_aa217b6c
	Namespace: namespace_7fdfcd5b
	Checksum: 0x25DBED5E
	Offset: 0x1000
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function function_aa217b6c(enemy)
{
	if(!isdefined(enemy))
	{
		return;
	}
	if(!isdefined(level.doa.var_23e902a0))
	{
		level.doa.var_23e902a0 = getweapon("zombietron_missile_turret_weapon");
	}
	v_dir = vectornormalize(enemy.origin - self.origin);
	var_a64609fe = v_dir * 200;
	missile = self magicmissile(level.doa.var_23e902a0, self gettagorigin("tag_flash"), var_a64609fe, enemy);
	self namespace_83eb6304::function_3ecfde67("muzzleFlash_md");
	self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_missileturret_fire");
	wait(randomfloatrange(0.5, 0.8));
	if(isdefined(missile) && isdefined(enemy.var_c80846be))
	{
		missile missile_settarget(enemy.var_c80846be);
	}
}

