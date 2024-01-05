#using script_1dbd20131a363d8;
#using script_113dd7f0ea2a1d4f;
#using script_215d7818c548cb51;
#using script_12538a87a80a2978;
#using script_4163291d6e693552;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_1029986e2bc8ca8e;
#using script_27347f09888ad15;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using script_340a2e805e35f7a2;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_24fd6413;

/*
	Name: function_b57c5b6b
	Namespace: namespace_24fd6413
	Checksum: 0xBBCDACF5
	Offset: 0x678
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b57c5b6b()
{
	level notify(-1537478767);
}

/*
	Name: main
	Namespace: namespace_24fd6413
	Checksum: 0x3699CDFA
	Offset: 0x698
	Size: 0x1E4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("scriptmover", "" + #"hash_502be00d1af105e9", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_771abe419eda7442", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_76d1986dfad6a190", 1, 2, "int");
	clientfield::register("scriptmover", "" + #"hash_11838968b17d8418", 1, 1, "int");
	clientfield::register("actor", "" + #"zombie_soul", 1, 1, "int");
	level.sr_objective_secure_hud = sr_objective_secure_hud::register();
	objective_manager::function_b3464a7c(#"secure", &init, &function_fb9dff2f, #"secure", #"hash_2764807c1ab1eabd", #"hash_bdf13864e52da12", 8, #"hash_582ab7cd393c5d47");
}

/*
	Name: init
	Namespace: namespace_24fd6413
	Checksum: 0x7251C54E
	Offset: 0x888
	Size: 0x744
	Parameters: 1
	Flags: None
*/
function init(instance)
{
	instance.var_42dcbe3d = instance.var_fe2612fe[#"transmitter"];
	instance.var_eff5bd11 = instance.var_fe2612fe[#"boundary"];
	instance.a_s_spawnpts = instance.var_fe2612fe[#"spawn_pt"];
	instance.a_s_rewards = instance.var_fe2612fe[#"reward"];
	foreach(model in instance.a_models)
	{
		if(model.model === #"hash_38cf6d433834d7c5")
		{
			instance.var_4a416ea9 = model;
		}
		if(model.model === #"hash_35683f67bd38dc11")
		{
			instance.var_2972bc14 = model;
		}
	}
	for(i = 0; i < instance.var_42dcbe3d.size; i++)
	{
		v_org = instance.var_42dcbe3d[i].origin;
		if(instance.var_42dcbe3d[i].script_int === 0)
		{
			v_offset = vectorscale((0, 0, 1), 1000);
		}
		else
		{
			v_offset = (0, 0, 0);
		}
		v_start = v_org;
		var_954ec1b6 = util::spawn_model(#"hash_91bd6c685ca0c64", v_start, instance.var_42dcbe3d[i].angles);
		var_954ec1b6.var_526e7ad6 = util::spawn_model(#"hash_2eb7d391abf00e32", v_start, instance.var_42dcbe3d[i].angles);
		instance.a_models[instance.a_models.size] = var_954ec1b6;
		var_954ec1b6 hide();
		var_954ec1b6.var_526e7ad6 hide();
		var_954ec1b6.var_848c555f = v_org;
		var_954ec1b6.n_id = instance.var_42dcbe3d[i].script_int;
		var_954ec1b6.targetname = "drop_pod";
		var_954ec1b6.a_s_spawnpts = [];
		var_954ec1b6.var_eff5bd11 = [];
		var_954ec1b6.n_active = 0;
		foreach(var_c309b891 in instance.var_eff5bd11)
		{
			if(var_c309b891.script_int === var_954ec1b6.n_id)
			{
				var_954ec1b6.var_c309b891 = var_c309b891;
			}
		}
		foreach(s_spawnpt in instance.a_s_spawnpts)
		{
			if(s_spawnpt.script_int === var_954ec1b6.n_id)
			{
				var_954ec1b6.a_s_spawnpts[var_954ec1b6.a_s_spawnpts.size] = s_spawnpt;
			}
		}
		foreach(s_reward in instance.a_s_rewards)
		{
			if(s_reward.script_int === var_954ec1b6.n_id)
			{
				var_954ec1b6.s_reward = s_reward;
			}
		}
		var_954ec1b6.n_total = 0;
		var_954ec1b6.n_kills = 0;
		var_954ec1b6 thread function_a55dd0a0(instance);
		var_954ec1b6 thread function_f919d221(instance);
		var_954ec1b6 thread function_d35b3d1f(instance);
		var_954ec1b6 thread function_a39f5f0(instance);
		var_954ec1b6 thread function_b076be86(instance);
		var_954ec1b6 thread function_5efbdd83(instance);
		var_954ec1b6 thread function_1ee78771(instance);
		var_954ec1b6 thread function_75eea0d2(instance);
		var_954ec1b6 thread function_b70e2a37();
		var_954ec1b6 thread function_7cfc417a(instance);
		var_954ec1b6 thread function_f62e3f66(instance);
		var_954ec1b6 thread function_c93067d3(instance);
	}
	instance.var_7a9e6505 = 1;
	instance.var_bf0352e0 = namespace_7589cf5c::function_8ab565fc();
	instance.var_ce59b674 = namespace_7589cf5c::function_4bd02b61();
	instance.var_5b071610 = 0;
	instance.var_4fff464f = 0;
	instance.var_f63c851c = 0;
	instance.var_bf189694 = getentarray("drop_pod", "targetname");
	instance thread function_a6619053();
	instance thread function_1d405fe5();
	instance thread namespace_7589cf5c::vo_start("objectiveSecureAnnounce", "objectiveSecureAnnounceResponse");
	instance thread function_338034b3();
	instance thread function_1a2e6a13();
	level.var_acd0f67e = 6;
	showmiscmodels("secure_corpses");
}

/*
	Name: function_738f5215
	Namespace: namespace_24fd6413
	Checksum: 0xD016F19D
	Offset: 0xFD8
	Size: 0x1D4
	Parameters: 0
	Flags: None
*/
function function_738f5215()
{
	self endon(#"objective_ended");
	var_35dfb407 = 0;
	while(!var_35dfb407)
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(distance2dsquared(player.origin, self.var_4a416ea9.origin) <= 1000000)
			{
				if(player util::is_looking_at(self.var_4a416ea9, 0.7, 0) || player util::is_looking_at(self.origin, 0.7, 1) || distance2dsquared(player.origin, self.var_4a416ea9.origin) <= 250000)
				{
					var_35dfb407 = 1;
					break;
				}
			}
		}
		wait(0.5);
	}
	level namespace_7589cf5c::play_vo("objectiveSecureApproach");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveSecureApproachResponse");
}

/*
	Name: function_17f1d0f3
	Namespace: namespace_24fd6413
	Checksum: 0x76D8EBEB
	Offset: 0x11B8
	Size: 0x27A
	Parameters: 0
	Flags: None
*/
function function_17f1d0f3()
{
	switch(level.var_b48509f9)
	{
		case 1:
		case 2:
		{
			self.var_5e36739b = undefined;
			break;
		}
		case 3:
		case 4:
		{
			self.var_5e36739b = [2:#"hash_4f87aa2a203d37d0", 1:#"spawner_bo5_mimic", 0:#"hash_1aff4b71635bda08"];
			break;
		}
		case 5:
		{
			self.var_5e36739b = [3:#"spawner_zm_steiner", 2:#"hash_4f87aa2a203d37d0", 1:#"spawner_bo5_mimic", 0:#"hash_1aff4b71635bda08"];
			break;
		}
		default:
		{
			self.var_5e36739b = [4:#"spawner_zm_steiner", 3:#"hash_4f87aa2a203d37d0", 2:#"spawner_bo5_mimic", 1:#"hash_704a090ff9fcffd0", 0:#"hash_1aff4b71635bda08"];
			break;
		}
	}
	self.var_2133c784 = 0;
	n_players = getplayers().size;
	switch(n_players)
	{
		case 1:
		case 2:
		{
			self.var_61c57c53 = 1;
			break;
		}
		case 3:
		case 4:
		{
			self.var_61c57c53 = 2;
			break;
		}
	}
}

/*
	Name: special_spawn
	Namespace: namespace_24fd6413
	Checksum: 0x73F6E33E
	Offset: 0x1440
	Size: 0xD6
	Parameters: 0
	Flags: None
*/
function special_spawn()
{
	if(level.var_b48509f9 < 3)
	{
		return;
	}
	wait(function_21a3a673(5, 10));
	if(math::cointoss(self.var_7db605a0))
	{
		if(self.var_2133c784 < self.var_61c57c53)
		{
			s_spawnpt = array::random(self.var_75d7aa63);
			self function_d2ee3e36(s_spawnpt);
		}
	}
	else
	{
		self.var_7db605a0 = self.var_7db605a0 + 25;
		if(self.var_7db605a0 >= 100)
		{
			self.var_7db605a0 = 25;
		}
	}
}

/*
	Name: function_d2ee3e36
	Namespace: namespace_24fd6413
	Checksum: 0x7905EC47
	Offset: 0x1520
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_d2ee3e36(s_spawnpt)
{
	self endon(#"objective_ended");
	level flag::wait_till("spawn_zombies");
	var_7ecdee63 = array::random(self.var_5e36739b);
	ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, s_spawnpt.origin, s_spawnpt.angles, "defend_zombie");
	wait(0.1);
	if(isdefined(ai_spawned))
	{
		self.var_2133c784++;
		ai_spawned thread zombie_attack();
	}
}

/*
	Name: function_1a2e6a13
	Namespace: namespace_24fd6413
	Checksum: 0xCBF011F5
	Offset: 0x15F8
	Size: 0x284
	Parameters: 0
	Flags: None
*/
function function_1a2e6a13()
{
	foreach(model in self.a_models)
	{
		if(model.model === #"hash_38cf6d433834d7c5")
		{
			var_4a416ea9 = model;
		}
	}
	var_b98dc7c6 = util::spawn_model("p9_sur_computer_console_hvt_01_screen_missile_in_act", var_4a416ea9.origin, var_4a416ea9.angles);
	if(isdefined(var_b98dc7c6))
	{
		if(!isdefined(self.a_models))
		{
			self.a_models = [];
		}
		else if(!isarray(self.a_models))
		{
			self.a_models = array(self.a_models);
		}
		self.a_models[self.a_models.size] = var_b98dc7c6;
	}
	var_6ee5c0f2 = util::spawn_model("p9_sur_computer_console_hvt_01_screen_missile_act", var_4a416ea9.origin, var_4a416ea9.angles);
	if(isdefined(var_6ee5c0f2))
	{
		if(!isdefined(self.a_models))
		{
			self.a_models = [];
		}
		else if(!isarray(self.a_models))
		{
			self.a_models = array(self.a_models);
		}
		self.a_models[self.a_models.size] = var_6ee5c0f2;
		var_6ee5c0f2 hide();
	}
	self waittill(#"hash_20dcff0079f189f3");
	if(isdefined(var_b98dc7c6))
	{
		var_b98dc7c6 delete();
	}
	if(isdefined(var_6ee5c0f2))
	{
		var_6ee5c0f2 show();
	}
	self waittill(#"objective_ended");
	if(isdefined(var_6ee5c0f2))
	{
		var_6ee5c0f2 delete();
	}
}

/*
	Name: function_8b062964
	Namespace: namespace_24fd6413
	Checksum: 0xC3697B6C
	Offset: 0x1888
	Size: 0xEE
	Parameters: 0
	Flags: None
*/
function function_8b062964()
{
	self endon(#"objective_ended");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveSecureStart");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveSecureStartSequence2");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveSecureStartSequence3");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveSecureStartSequence4");
	wait(3.5);
	level namespace_7589cf5c::play_vo("objectiveSecureDescent");
	self notify(#"summon");
}

/*
	Name: function_c93067d3
	Namespace: namespace_24fd6413
	Checksum: 0x5F8A496C
	Offset: 0x1980
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_c93067d3(instance)
{
	self endon(#"death");
	self waittill(#"cleared");
	self namespace_7589cf5c::play_vo(#"hash_27ee249325063d0d");
	self.var_8ccbea19 = 1;
	self namespace_7589cf5c::play_vo(#"hash_31677d777eaf5f36");
	wait(0.5);
	self namespace_7589cf5c::play_vo(#"hash_362e7fbf86ce0b41");
	wait(1);
	if(instance.var_f63c851c < 2)
	{
		level thread namespace_7589cf5c::play_vo("objectiveSecureEssenceConversionEndResponse");
	}
}

/*
	Name: function_f62e3f66
	Namespace: namespace_24fd6413
	Checksum: 0x117E21A9
	Offset: 0x1A70
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_f62e3f66(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	self waittill(#"perimeter");
	self thread function_dc79011b(instance);
}

/*
	Name: function_dc79011b
	Namespace: namespace_24fd6413
	Checksum: 0x96281FE8
	Offset: 0x1AE0
	Size: 0x1F4
	Parameters: 1
	Flags: None
*/
function function_dc79011b(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	while(true)
	{
		foreach(zombie in function_a38db454(self.origin, self.var_75833abc))
		{
			if(zombie.aitype === #"hash_1aff4b71635bda08" || zombie.archetype === #"zombie" && !isdefined(zombie.is_marked))
			{
				zombie.e_marker = util::spawn_model("tag_origin", zombie gettagorigin("J_Spine4"));
				if(isdefined(zombie.e_marker))
				{
					zombie.e_marker linkto(zombie, "J_Spine4");
					zombie.e_marker clientfield::set("" + #"hash_11838968b17d8418", 1);
					zombie.is_marked = 1;
					zombie thread function_60b78908(instance);
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_60b78908
	Namespace: namespace_24fd6413
	Checksum: 0x7BB40DC5
	Offset: 0x1CE0
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function function_60b78908(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	self.var_5ea363c = array::get_all_closest(self.origin, instance.var_bf189694)[0];
	while(true)
	{
		if(distance2dsquared(self.origin, self.var_5ea363c.origin) > sqr(self.var_5ea363c.var_75833abc) || is_true(self.var_5ea363c.b_cleared))
		{
			if(isdefined(self.e_marker))
			{
				self.e_marker delete();
				self.is_marked = undefined;
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_a55dd0a0
	Namespace: namespace_24fd6413
	Checksum: 0x39A8DC7E
	Offset: 0x1E08
	Size: 0x2B4
	Parameters: 1
	Flags: None
*/
function function_a55dd0a0(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death", #"landed");
	self waittill(#"arriving");
	a_players = getplayers();
	while(true)
	{
		foreach(player in a_players)
		{
			if(zm_utility::is_player_valid(player))
			{
				n_distsq = distance2dsquared(self.var_848c555f, player.origin);
				if(n_distsq <= sqr(50) && is_true(self.var_e52440b6))
				{
					player dodamage(player.health + 999, self.var_848c555f, undefined, undefined, undefined, "MOD_CRUSH");
					player playrumbleonentity("damage_heavy");
					continue;
				}
				if(n_distsq <= sqr(400))
				{
					player dodamage(2, self.var_848c555f, undefined, undefined, undefined, "MOD_BURNED");
					player playrumbleonentity("damage_light");
					continue;
				}
				if(n_distsq <= sqr(700))
				{
					if(!isdefined(player.var_aef8b7b4))
					{
						player.var_aef8b7b4 = 1;
						player thread zm_vo::function_7622cb70("objectiveSecureDescentWarning", 0, 1);
					}
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_f11f6b22
	Namespace: namespace_24fd6413
	Checksum: 0xB0096D2F
	Offset: 0x20C8
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_f11f6b22(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death", #"arriving");
	while(true)
	{
		if(self.origin[2] <= (self.var_848c555f[2] + 800))
		{
			self thread function_7ac4b826(instance);
			self notify(#"arriving");
		}
		wait(0.1);
	}
}

/*
	Name: function_7ac4b826
	Namespace: namespace_24fd6413
	Checksum: 0xAEDAE89
	Offset: 0x2180
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_7ac4b826(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death", #"landing");
	while(true)
	{
		if(self.origin[2] <= (self.var_848c555f[2] + 72))
		{
			self.var_e52440b6 = 1;
			self notify(#"landing");
		}
		wait(0.1);
	}
}

/*
	Name: function_338034b3
	Namespace: namespace_24fd6413
	Checksum: 0x3BD8E12F
	Offset: 0x2230
	Size: 0x1CC
	Parameters: 0
	Flags: None
*/
function function_338034b3()
{
	self endon(#"objective_ended");
	self.starttrigger triggerenable(0);
	t_start = spawn("trigger_radius_use", self.var_4a416ea9.origin + vectorscale((0, 0, 1), 24), 0, 96, 96, 1);
	t_start triggerignoreteam();
	t_start setcursorhint("HINT_NOICON");
	t_start sethintstring(#"hash_263f26fcd49be105");
	t_start usetriggerrequirelookat(1);
	s_result = undefined;
	s_result = t_start waittill(#"trigger");
	t_start delete();
	objective_setvisibletoall(self.var_e55c8b4e);
	self.starttrigger triggerenable(1);
	self.starttrigger useby(s_result.activator);
	wait(0.5);
	self.var_2972bc14 scene::play(#"hash_695c8fcfe6831ff3", "Shot 1", self.var_2972bc14);
}

/*
	Name: function_f919d221
	Namespace: namespace_24fd6413
	Checksum: 0x94A080B2
	Offset: 0x2408
	Size: 0x14C
	Parameters: 1
	Flags: None
*/
function function_f919d221(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	self function_41b29ff0(#"hash_4de038bb5090f659");
	instance waittill(#"summon");
	self thread rocket_fx(instance);
	self show();
	self.var_526e7ad6 show();
	self clientfield::set("" + #"hash_76d1986dfad6a190", 1);
	self.var_526e7ad6 thread scene::play(#"hash_54b16c2f17d788a9", "descend", self.var_526e7ad6);
	self scene::play(#"hash_3a3c231fd53c103a", "descend", self);
}

/*
	Name: rocket_fx
	Namespace: namespace_24fd6413
	Checksum: 0x7BA4ABBC
	Offset: 0x2560
	Size: 0x14C
	Parameters: 1
	Flags: None
*/
function rocket_fx(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	wait(4);
	self clientfield::set("" + #"hash_76d1986dfad6a190", 3);
	wait(1);
	self thread function_f11f6b22(instance);
	wait(4);
	self notify(#"arriving");
	wait(1.5);
	self notify(#"landed");
	wait(1.5);
	self clientfield::set("" + #"hash_76d1986dfad6a190", 0);
	self stopanimscripted();
	self function_e44defaa((0, 0, 0));
	self playrumbleonentity("sr_transmitter_impact");
}

/*
	Name: function_75eea0d2
	Namespace: namespace_24fd6413
	Checksum: 0x11E4B032
	Offset: 0x26B8
	Size: 0x652
	Parameters: 1
	Flags: None
*/
function function_75eea0d2(instance)
{
	self endon(#"secured", #"death", #"cleared");
	instance endon(#"objective_ended");
	self.var_2c27b95c = 0;
	self waittill(#"ready");
	n_total = self function_37a785fb(0);
	self.n_kills_required = self function_1172db0d();
	self.var_75833abc = 400;
	self.var_dc652bc6 = 0;
	self.var_bcaab03b = 0;
	self.var_116c0db1 = 0;
	self.var_db94b70a = 0;
	self.var_2493681a = 0;
	self.var_90627599 = 0;
	self.b_cleared = 0;
	self.b_start = 0;
	while(true)
	{
		self waittill(#"capture");
		self.var_2c27b95c = self.n_kills / self.n_kills_required;
		if(self.var_2c27b95c >= 0.85 && !self.var_90627599)
		{
			self.var_90627599 = 1;
			namespace_85745671::function_b70e2a37(self);
			wait(0.1);
			self.var_526e7ad6 scene::play(#"hash_54b16c2f17d788a9", "05_rise", self.var_526e7ad6);
			self.var_526e7ad6 thread scene::play(#"hash_54b16c2f17d788a9", "05_loop", self.var_526e7ad6);
			self thread function_b5770dda(instance, 2);
		}
		else
		{
			if(self.var_2c27b95c >= 0.75 && !self.var_dc652bc6)
			{
				self.var_dc652bc6 = 1;
				self thread namespace_7589cf5c::play_vo(#"hash_19f9b6f3e6d0208e");
				self.var_526e7ad6 scene::play(#"hash_54b16c2f17d788a9", "04_rise", self.var_526e7ad6);
				self.var_526e7ad6 thread scene::play(#"hash_54b16c2f17d788a9", "04_loop", self.var_526e7ad6);
			}
			else
			{
				if(self.var_2c27b95c >= 0.5 && !self.var_bcaab03b)
				{
					self.var_bcaab03b = 1;
					self thread namespace_7589cf5c::play_vo(#"hash_76f74fa6577f4a21");
					self.var_526e7ad6 scene::play(#"hash_54b16c2f17d788a9", "03_rise", self.var_526e7ad6);
					self.var_526e7ad6 thread scene::play(#"hash_54b16c2f17d788a9", "03_loop", self.var_526e7ad6);
				}
				else
				{
					if(self.var_2c27b95c >= 0.4 && !self.var_db94b70a)
					{
						self.var_db94b70a = 1;
						namespace_85745671::function_b70e2a37(self);
						wait(0.1);
						self thread function_b5770dda(instance, 3);
					}
					else
					{
						if(self.var_2c27b95c >= 0.25 && !self.var_2493681a)
						{
							self.var_2493681a = 1;
							self thread namespace_7589cf5c::play_vo(#"hash_318cb0d5fb2585c1");
							self.var_526e7ad6 scene::play(#"hash_54b16c2f17d788a9", "02_rise", self.var_526e7ad6);
							self.var_526e7ad6 thread scene::play(#"hash_54b16c2f17d788a9", "02_loop", self.var_526e7ad6);
						}
						else if(self.var_2c27b95c >= 0.1 && !self.b_start)
						{
							self.b_start = 1;
							self.var_526e7ad6 scene::play(#"hash_54b16c2f17d788a9", "01_rise", self.var_526e7ad6);
							self.var_526e7ad6 thread scene::play(#"hash_54b16c2f17d788a9", "01_loop", self.var_526e7ad6);
						}
					}
				}
			}
		}
		if(self.var_2c27b95c >= 0.5 && !is_true(self.var_41763f62))
		{
			instance notify(#"hash_3167f3403f1172ad");
			self.var_41763f62 = 1;
		}
		if(self.n_total >= n_total || self.n_kills >= self.n_kills_required)
		{
			if(!is_true(self.var_41763f62))
			{
				instance notify(#"hash_3167f3403f1172ad");
			}
			self.b_cleared = 1;
			self notify(#"cleared");
		}
	}
}

/*
	Name: function_a39f5f0
	Namespace: namespace_24fd6413
	Checksum: 0xBC48B9E1
	Offset: 0x2D18
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_a39f5f0(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	self waittill(#"ready");
	while(true)
	{
		self.var_210e22a1 = 0;
		foreach(player in getplayers())
		{
			if(distance2dsquared(self.origin, player.origin) <= sqr(2000))
			{
				self.var_210e22a1 = 1;
			}
		}
		if(self.var_210e22a1 || is_true(self.b_forced))
		{
			self thread function_9761554f(instance);
			break;
		}
		wait(1);
	}
}

/*
	Name: function_b076be86
	Namespace: namespace_24fd6413
	Checksum: 0x12EB4030
	Offset: 0x2E98
	Size: 0x610
	Parameters: 1
	Flags: None
*/
function function_b076be86(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	self waittill(#"ready");
	while(true)
	{
		self.var_210e22a1 = 0;
		foreach(player in getplayers())
		{
			if(distance2dsquared(self.origin, player.origin) <= sqr(1000))
			{
				self.var_210e22a1 = 1;
			}
		}
		if(self.var_210e22a1 || is_true(self.b_forced))
		{
			self thread function_4c664c70(instance);
			self clientfield::increment("" + #"hash_771abe419eda7442");
			if(!instance.var_5b071610)
			{
				instance.var_5b071610 = 1;
			}
			foreach(player in getplayers())
			{
				if(distance2dsquared(self.origin, player.origin) <= sqr(1000) && isalive(player))
				{
					player thread zm_vo::function_c4303dda(#"hash_733d9e62eeb7efdb");
				}
			}
			wait(4);
			self notify(#"perimeter");
			self.var_48ab101 = util::spawn_model(#"hash_340adc3d8bcc33d2", self.var_c309b891.origin, self.var_c309b891.angles);
			wait(0.1);
			self.var_48ab101 setscale(0.8);
			foreach(player in getplayers())
			{
				if(distance2dsquared(self.origin, player.origin) <= sqr(1000) && isalive(player))
				{
					player thread zm_vo::function_c4303dda(#"hash_21a2a9746be5c204");
				}
			}
			wait(3);
			foreach(player in getplayers())
			{
				if(distance2dsquared(self.origin, player.origin) <= sqr(1000) && isalive(player))
				{
					player thread zm_vo::function_7622cb70("objectiveSecureStartSequence3", 0, 1);
				}
			}
			wait(3);
			foreach(player in getplayers())
			{
				if(distance2dsquared(self.origin, player.origin) <= sqr(1000) && isalive(player))
				{
					player thread zm_vo::function_7622cb70("objectiveSecureStartSequence4", 0, 1);
				}
			}
			break;
		}
		wait(1);
	}
}

/*
	Name: function_1d405fe5
	Namespace: namespace_24fd6413
	Checksum: 0xCE528D81
	Offset: 0x34B0
	Size: 0x168
	Parameters: 0
	Flags: None
*/
function function_1d405fe5()
{
	self endon(#"objective_ended");
	self waittill(#"hash_20dcff0079f189f3");
	self thread function_55ea0c81(self.n_timeout);
	var_bf189694 = array::randomize(self.var_bf189694);
	while(true)
	{
		self waittill(#"hash_3167f3403f1172ad");
		if(!is_true(var_bf189694[0].b_attacked) && !is_true(var_bf189694[0].var_210e22a1))
		{
			var_bf189694[0].b_forced = 1;
		}
		else if(!is_true(var_bf189694[1].b_attacked) && !is_true(var_bf189694[1].var_210e22a1))
		{
			var_bf189694[1].b_forced = 1;
		}
		self thread function_55ea0c81(self.n_timeout);
	}
}

/*
	Name: function_55ea0c81
	Namespace: namespace_24fd6413
	Checksum: 0x21344DB8
	Offset: 0x3620
	Size: 0x6E
	Parameters: 1
	Flags: None
*/
function function_55ea0c81(n_time)
{
	self notify("79f2ce6410587ee6");
	self endon("79f2ce6410587ee6");
	self endon(#"objective_ended", #"hash_3167f3403f1172ad", #"start_attack");
	wait(n_time);
	self notify(#"hash_3167f3403f1172ad");
}

/*
	Name: function_9761554f
	Namespace: namespace_24fd6413
	Checksum: 0xB84989A9
	Offset: 0x3698
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function function_9761554f(instance)
{
	instance endon(#"objective_ended");
	self.b_attacked = 1;
	for(i = 0; i < 2; i++)
	{
		level flag::wait_till("spawn_zombies");
		ai_zombie = self function_536798ae();
		wait(0.1);
		if(isdefined(ai_zombie))
		{
			self.n_active++;
			self.n_total++;
			ai_zombie.var_ce72b8cb = self;
			self thread zombie_death_watcher(instance, ai_zombie);
			ai_zombie thread zombie_attack();
			ai_zombie callback::function_d8abfc3d(#"on_ai_killed", &on_ai_killed);
			namespace_85745671::function_744beb04(ai_zombie);
		}
	}
}

/*
	Name: function_536798ae
	Namespace: namespace_24fd6413
	Checksum: 0xA3F54795
	Offset: 0x37E0
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function function_536798ae()
{
	self endon(#"death");
	s_pt = array::random(self.a_s_spawnpts);
	if(isdefined(s_pt))
	{
		a_s_pts = namespace_85745671::function_e4791424(s_pt.origin, 8, 80, 80);
	}
	if(isdefined(a_s_pts))
	{
		s_point = array::random(a_s_pts);
	}
	if(isdefined(s_point))
	{
		ai_spawned = namespace_85745671::function_9d3ad056(#"hash_7cba8a05511ceedf", s_point.origin, s_point.angles, "droppod_zombie");
		if(isdefined(ai_spawned))
		{
			ai_spawned.b_ignore_cleanup = 1;
			ai_spawned.var_ce72b8cb = self;
			return ai_spawned;
		}
	}
}

/*
	Name: function_311b330e
	Namespace: namespace_24fd6413
	Checksum: 0xFF3EE4DC
	Offset: 0x38F8
	Size: 0x25C
	Parameters: 1
	Flags: None
*/
function function_311b330e(instance)
{
	instance endon(#"objective_ended");
	n_spawns = int(function_37a785fb(1) * 0.5);
	while(true)
	{
		self.var_35dfb407 = 0;
		foreach(player in getplayers())
		{
			if(distance2dsquared(self.origin, player.origin) <= sqr(3200))
			{
				self.var_35dfb407 = 1;
			}
		}
		if(self.var_35dfb407)
		{
			break;
		}
		wait(0.1);
	}
	for(i = 0; i < n_spawns; i++)
	{
		ai_zombie = self function_536798ae();
		wait(0.1);
		if(isdefined(ai_zombie))
		{
			self.n_active++;
			self thread zombie_death_watcher(instance, ai_zombie);
			ai_zombie.var_ce72b8cb = self;
			ai_zombie.var_3be28c89 = 1;
			ai_zombie callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
			ai_zombie callback::function_d8abfc3d(#"on_ai_killed", &on_ai_killed);
			ai_zombie thread function_7dbe9585();
		}
	}
}

/*
	Name: function_7dbe9585
	Namespace: namespace_24fd6413
	Checksum: 0xF74ACDD6
	Offset: 0x3B60
	Size: 0xB6
	Parameters: 0
	Flags: None
*/
function function_7dbe9585()
{
	self endon(#"death");
	while(true)
	{
		if(isdefined(self.var_b238ef38))
		{
			self.var_b238ef38 = undefined;
		}
		if(!isdefined(self.favoriteenemy))
		{
			player = array::random(getplayers());
			if(isalive(player))
			{
				awareness::function_c241ef9a(self, player, 15);
			}
		}
		wait(1);
	}
}

/*
	Name: function_4c664c70
	Namespace: namespace_24fd6413
	Checksum: 0x89E8385D
	Offset: 0x3C20
	Size: 0x1E8
	Parameters: 1
	Flags: None
*/
function function_4c664c70(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death", #"cleared");
	instance notify(#"start_attack");
	self.b_attacked = 1;
	instance.var_155bbc44 = 0;
	self playsound(#"hash_52a4865a418218f0");
	n_active = self function_53e21154();
	n_total = self function_37a785fb(0);
	while(true)
	{
		level flag::wait_till("spawn_zombies");
		if(self.n_active <= n_active && self.n_total < n_total)
		{
			ai_zombie = self function_88a7c00a(instance);
			wait(0.1);
			if(isdefined(ai_zombie))
			{
				self.n_active++;
				self.n_total++;
				self thread zombie_death_watcher(instance, ai_zombie);
				ai_zombie.var_ce72b8cb = self;
				ai_zombie thread zombie_attack();
				ai_zombie callback::function_d8abfc3d(#"on_ai_killed", &on_ai_killed);
			}
		}
		wait(0.1);
	}
}

/*
	Name: zombie_death_watcher
	Namespace: namespace_24fd6413
	Checksum: 0xA7831846
	Offset: 0x3E10
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function zombie_death_watcher(instance, ai_zombie)
{
	instance endon(#"objective_ended");
	ai_zombie waittill(#"death");
	if(self.n_active)
	{
		self.n_active--;
	}
	if(ai_zombie.aitype === #"hash_1aff4b71635bda08")
	{
		instance.var_155bbc44--;
	}
}

/*
	Name: zombie_attack
	Namespace: namespace_24fd6413
	Checksum: 0x1C74D795
	Offset: 0x3EA0
	Size: 0x1A0
	Parameters: 0
	Flags: None
*/
function zombie_attack()
{
	self endon(#"death");
	if(isdefined(self.var_ce72b8cb))
	{
		self.var_ce72b8cb endon(#"death");
	}
	self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
	while(true)
	{
		a_players = getplayers();
		if(isdefined(self.var_ce72b8cb))
		{
			player = awareness::function_d7fedde2(self);
			namespace_85745671::function_744beb04(self);
			if(isdefined(self.var_ce72b8cb) && !isdefined(self.is_attacking) && isalive(self) && !isdefined(self.var_b238ef38) && isdefined(player) && distance2dsquared(self.var_ce72b8cb.origin, player.origin) <= sqr(2000))
			{
				self.is_attacking = 1;
				awareness::function_c241ef9a(self, player, 15);
			}
		}
		wait(2);
	}
}

/*
	Name: function_fd68cae4
	Namespace: namespace_24fd6413
	Checksum: 0xCB5B5AC3
	Offset: 0x4048
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_fd68cae4()
{
	self endon(#"death");
	if(isdefined(self.var_ce72b8cb))
	{
		self.var_ce72b8cb endon(#"death");
	}
	if(self.archetype === #"zombie")
	{
		self namespace_85745671::function_9758722("sprint");
	}
}

/*
	Name: function_88a7c00a
	Namespace: namespace_24fd6413
	Checksum: 0x5F52CA26
	Offset: 0x40C8
	Size: 0x2F0
	Parameters: 1
	Flags: None
*/
function function_88a7c00a(instance)
{
	self endon(#"death", #"cleared");
	switch(level.var_b48509f9)
	{
		case 1:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_6492a8cee5b15113");
			break;
		}
		case 2:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_6492a9cee5b152c6");
			break;
		}
		case 3:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_6492aacee5b15479");
			break;
		}
		case 4:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_6492abcee5b1562c");
			break;
		}
		case 5:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_6492accee5b157df");
			break;
		}
		default:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_6492adcee5b15992");
			break;
		}
	}
	var_7ecdee63 = var_6017f33e.var_990b33df;
	a_s_pts = namespace_85745671::function_e4791424(array::random(self.a_s_spawnpts).origin, 8, 80, 300);
	if(!isdefined(a_s_pts) || a_s_pts.size === 0)
	{
		return;
	}
	var_3955def4 = array::random(a_s_pts).origin;
	if(isdefined(var_3955def4))
	{
		ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, var_3955def4, self.angles, "droppod_zombie");
	}
	wait(0.1);
	if(isdefined(ai_spawned))
	{
		if(ai_spawned.aitype === #"hash_7a8b592728eec95d")
		{
			ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_dog_killed);
		}
		ai_spawned.b_ignore_cleanup = 1;
		return ai_spawned;
	}
}

/*
	Name: function_c9277739
	Namespace: namespace_24fd6413
	Checksum: 0x3F29EF1
	Offset: 0x43C0
	Size: 0x12E
	Parameters: 1
	Flags: None
*/
function function_c9277739(a_s_pts)
{
	for(i = 0; i < a_s_pts.size; i++)
	{
		a_s_pts[i].b_cansee = 0;
		foreach(player in getplayers())
		{
			if(player util::is_player_looking_at(a_s_pts[i].origin, 0.8, 1, player))
			{
				a_s_pts[i].b_cansee = 1;
			}
		}
		if(!a_s_pts[i].b_cansee)
		{
			v_point = a_s_pts[i].origin;
			return v_point;
		}
	}
	return undefined;
}

/*
	Name: function_1172db0d
	Namespace: namespace_24fd6413
	Checksum: 0x4161348B
	Offset: 0x44F8
	Size: 0x9E
	Parameters: 0
	Flags: None
*/
function function_1172db0d()
{
	switch(getplayers().size)
	{
		case 1:
		{
			n_kills = 16;
			break;
		}
		case 2:
		{
			n_kills = 20;
			break;
		}
		case 3:
		{
			n_kills = 24;
			break;
		}
		case 4:
		{
			n_kills = 32;
			break;
		}
	}
	return n_kills;
}

/*
	Name: function_53e21154
	Namespace: namespace_24fd6413
	Checksum: 0x3A565C25
	Offset: 0x45A0
	Size: 0x9E
	Parameters: 0
	Flags: None
*/
function function_53e21154()
{
	switch(getplayers().size)
	{
		case 1:
		{
			n_spawns = 5;
			break;
		}
		case 2:
		{
			n_spawns = 8;
			break;
		}
		case 3:
		{
			n_spawns = 11;
			break;
		}
		case 4:
		{
			n_spawns = 14;
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_37a785fb
	Namespace: namespace_24fd6413
	Checksum: 0x8AB32FE5
	Offset: 0x4648
	Size: 0x196
	Parameters: 1
	Flags: None
*/
function function_37a785fb(b_active)
{
	self endon(#"death");
	switch(getplayers().size)
	{
		case 1:
		{
			if(b_active)
			{
				n_spawns = min(4 + level.var_b48509f9, 10);
			}
			else
			{
				n_spawns = 48;
			}
			break;
		}
		case 2:
		{
			if(b_active)
			{
				n_spawns = min(7 + level.var_b48509f9, 12);
			}
			else
			{
				n_spawns = 60;
			}
			break;
		}
		case 3:
		{
			if(b_active)
			{
				n_spawns = min(11 + level.var_b48509f9, 15);
			}
			else
			{
				n_spawns = 72;
			}
			break;
		}
		case 4:
		{
			if(b_active)
			{
				n_spawns = min(15 + level.var_b48509f9, 20);
			}
			else
			{
				n_spawns = 96;
			}
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_36585ff1
	Namespace: namespace_24fd6413
	Checksum: 0x684BE860
	Offset: 0x47E8
	Size: 0x9E
	Parameters: 0
	Flags: None
*/
function function_36585ff1()
{
	switch(getplayers().size)
	{
		case 1:
		{
			n_timeout = 75;
			break;
		}
		case 2:
		{
			n_timeout = 60;
			break;
		}
		case 3:
		{
			n_timeout = 45;
			break;
		}
		case 4:
		{
			n_timeout = 30;
			break;
		}
	}
	return n_timeout;
}

/*
	Name: function_a6619053
	Namespace: namespace_24fd6413
	Checksum: 0x5C5B0237
	Offset: 0x4890
	Size: 0xE8
	Parameters: 0
	Flags: None
*/
function function_a6619053()
{
	self endon(#"objective_ended");
	self waittill(#"hash_20dcff0079f189f3");
	while(true)
	{
		if(self.var_f63c851c == 2)
		{
			wait(2.5);
			level thread namespace_7589cf5c::play_vo("objectiveSecureEndSuccess");
			wait(4);
			level thread namespace_7589cf5c::play_vo("objectiveSecureEndSuccessResponse");
			namespace_7589cf5c::function_3899cfea();
			level flag::set(#"hash_1460b3afd614fb6c");
			objective_manager::objective_ended(self);
		}
		wait(0.5);
	}
}

/*
	Name: function_5efbdd83
	Namespace: namespace_24fd6413
	Checksum: 0xDBC7DECC
	Offset: 0x4980
	Size: 0x6DC
	Parameters: 1
	Flags: None
*/
function function_5efbdd83(instance)
{
	self endon(#"death");
	self waittill(#"landed");
	if(!isdefined(instance.var_f059ae2a))
	{
		instance.var_f059ae2a = 1;
		level thread namespace_7589cf5c::play_vo("objectiveSecureDescentEnd");
	}
	self thread function_311b330e(instance);
	self thread function_b5770dda(instance, 4);
	self disconnectpaths();
	self.mdl_fx = util::spawn_model("tag_origin", self.origin + vectorscale((0, 0, 1), 152));
	wait(0.1);
	instance.a_models[instance.a_models.size] = self.mdl_fx;
	self.is_active = 1;
	self.var_8ccbea19 = 0;
	self notify(#"ready");
	self waittill(#"cleared");
	self thread function_be75ebf0();
	self.is_cleared = 1;
	self clientfield::increment("" + #"hash_3eeee7f3f5bdb9ff");
	wait(0.1);
	self.var_fcd0c6d7 = 1;
	if(!isdefined(self.var_fcd0c6d7))
	{
		self thread function_311b330e();
	}
	namespace_85745671::function_b70e2a37(self);
	self playrumblelooponentity("sr_payload_portal_rumble");
	if(isdefined(self.var_48ab101))
	{
		self thread function_cf89aec();
	}
	while(!self.var_8ccbea19)
	{
		wait(0.1);
	}
	self.mdl_fx moveto(self.origin, 2);
	self.mdl_fx waittill(#"movedone");
	self stoprumble("sr_payload_portal_rumble");
	wait(0.1);
	self playrumbleonentity("sr_transmitter_clear");
	self clientfield::increment("" + #"hash_502be00d1af105e9");
	waitframe(1);
	self function_c6f443c5();
	wait(0.5);
	self.var_526e7ad6 scene::play(#"hash_54b16c2f17d788a9", "drain", self.var_526e7ad6);
	self.mdl_fx delete();
	waitframe(1);
	level scoreevents::doscoreeventcallback("scoreEventSR", {#allplayers:1, #scoreevent:"secure_transmitter_secured_zm"});
	if(isdefined(self.health) && isdefined(self.max_health) && (self.health / self.max_health) >= 0.8)
	{
		level scoreevents::doscoreeventcallback("scoreEventSR", {#location:self.origin, #nearbyplayers:1, #scoreevent:"secure_pristine_zm"});
	}
	foreach(player in getplayers())
	{
		if(!level.sr_objective_secure_hud sr_objective_secure_hud::is_open(player))
		{
			level.sr_objective_secure_hud sr_objective_secure_hud::open(player);
		}
		switch(self.n_id)
		{
			case 0:
			{
				level.sr_objective_secure_hud sr_objective_secure_hud::set_objectivewhitea(player, 1);
				break;
			}
			case 1:
			{
				level.sr_objective_secure_hud sr_objective_secure_hud::set_objectivewhiteb(player, 1);
				break;
			}
		}
	}
	self.var_526e7ad6 thread scene::play(#"hash_54b16c2f17d788a9", "doors_open", self.var_526e7ad6);
	self thread scene::play(#"hash_3a3c231fd53c103a", "doors_open", self);
	dropstruct = {#hash_738dfc81:1, #angles:self.angles, #origin:self.origin + vectorscale((0, 0, 1), 37)};
	dropstruct namespace_65181344::function_fd87c780(#"hash_7a046d913a142a88", 1, 0);
	instance.var_f63c851c++;
	if(instance.var_f63c851c > 1 && !instance.var_4fff464f)
	{
		instance.var_4fff464f = 1;
		namespace_cda50904::function_a92a93e9(self.s_reward.origin, self.s_reward.angles);
	}
}

/*
	Name: function_be75ebf0
	Namespace: namespace_24fd6413
	Checksum: 0x7F579288
	Offset: 0x5068
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_be75ebf0()
{
	self endon(#"death");
	self.var_526e7ad6 scene::play(#"hash_54b16c2f17d788a9", "06_rise", self.var_526e7ad6);
	self.var_526e7ad6 thread scene::play(#"hash_54b16c2f17d788a9", "06_loop", self.var_526e7ad6);
}

/*
	Name: function_cf89aec
	Namespace: namespace_24fd6413
	Checksum: 0xE9D7D243
	Offset: 0x5100
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_cf89aec()
{
	self endon(#"death");
	self.var_48ab101 endon(#"death");
	n_scale = 0.75;
	while(true)
	{
		self.var_48ab101 setscale(n_scale);
		self.var_48ab101 movez(2, 0.05);
		n_scale = n_scale - 0.01;
		if(n_scale <= 0.1)
		{
			break;
		}
		wait(0.05);
	}
	self.var_48ab101 delete();
	if(isdefined(self.t_proximity))
	{
		self.t_proximity delete();
	}
}

/*
	Name: function_71e7b72b
	Namespace: namespace_24fd6413
	Checksum: 0x993A76AC
	Offset: 0x5208
	Size: 0x140
	Parameters: 0
	Flags: None
*/
function function_71e7b72b()
{
	foreach(player in getplayers())
	{
		player thread namespace_77bd50da::function_cc8342e0(#"hash_763038398b0e6b59", 4);
	}
	wait(4.5);
	foreach(player in getplayers())
	{
		player thread namespace_77bd50da::function_cc8342e0(#"hash_113ad5247404dc08", 3);
	}
}

/*
	Name: function_b5770dda
	Namespace: namespace_24fd6413
	Checksum: 0x65818229
	Offset: 0x5350
	Size: 0xD8
	Parameters: 2
	Flags: None
*/
function function_b5770dda(instance, var_c2323ea4)
{
	instance endon(#"objective_ended");
	slots = namespace_85745671::function_bdb2b85b(self, self.origin + vectorscale((0, 0, 1), 16), self.angles, 42, var_c2323ea4, 16);
	if(!isdefined(slots) || slots.size <= 0)
	{
		return;
	}
	self.var_b79a8ac7 = {#slots:slots, #hash_f019ea1a:2000};
	level.attackables[level.attackables.size] = self;
}

/*
	Name: function_d35b3d1f
	Namespace: namespace_24fd6413
	Checksum: 0xF8203C8B
	Offset: 0x5430
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_d35b3d1f(instance)
{
	instance endon(#"objective_ended");
	instance waittill(#"summon");
	self.var_2edbcbd0 = util::spawn_model("tag_origin", self.origin + vectorscale((0, 0, 1), 162));
	self.var_2edbcbd0 linkto(self);
	self.str_obj = function_c607df95(instance);
	self.n_objective_id = zm_utility::function_f5a222a8(self.str_obj, self.var_2edbcbd0);
	self waittill(#"cleared");
	objective_setinvisibletoall(self.n_objective_id);
}

/*
	Name: function_c607df95
	Namespace: namespace_24fd6413
	Checksum: 0x94CE02E
	Offset: 0x5540
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function function_c607df95(instance)
{
	switch(self.n_id)
	{
		case 0:
		{
			str_obj = #"hash_123b41efdf89a905";
			break;
		}
		case 1:
		{
			str_obj = #"hash_123b3eefdf89a3ec";
			break;
		}
	}
	return str_obj;
}

/*
	Name: function_b70e2a37
	Namespace: namespace_24fd6413
	Checksum: 0x48929EA9
	Offset: 0x55C8
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_b70e2a37()
{
	self waittill(#"death", #"destroyed", #"secured");
	if(isdefined(self.mdl_gameobject))
	{
		self.mdl_gameobject gameobjects::destroy_object(1, 1);
	}
	if(isdefined(self.n_objective_id))
	{
		objective_delete(self.n_objective_id);
	}
	namespace_85745671::function_b70e2a37(self);
	if(isdefined(self.var_2edbcbd0))
	{
		self.var_2edbcbd0 delete();
	}
}

/*
	Name: function_7cfc417a
	Namespace: namespace_24fd6413
	Checksum: 0x9C9031B2
	Offset: 0x56A8
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_7cfc417a(instance)
{
	instance waittill(#"objective_ended");
	namespace_85745671::function_b70e2a37(self);
	if(!instance.success)
	{
		self notify(#"destroyed");
		self thread function_84ccd16c();
	}
	else
	{
		self notify(#"secured");
		if(isdefined(self.var_48ab101))
		{
			self.var_48ab101 delete();
		}
	}
}

/*
	Name: function_f5087df2
	Namespace: namespace_24fd6413
	Checksum: 0xDFA28286
	Offset: 0x5768
	Size: 0xF0
	Parameters: 0
	Flags: None
*/
function function_f5087df2()
{
	self waittill(#"objective_ended");
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 0);
		if(level.sr_objective_secure_hud sr_objective_secure_hud::is_open(player))
		{
			level.sr_objective_secure_hud sr_objective_secure_hud::close(player);
		}
	}
}

/*
	Name: function_84ccd16c
	Namespace: namespace_24fd6413
	Checksum: 0xFC03D365
	Offset: 0x5860
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_84ccd16c()
{
	self clientfield::set("" + #"hash_74d70bb7fe52c00", 1);
	self playrumbleonentity("sr_prototype_generator_explosion");
	self playsound(#"hash_877884cc0c69c6");
	wait(0.1);
	if(isdefined(self.mdl_fx))
	{
		self.mdl_fx delete();
	}
	if(isdefined(self.var_48ab101))
	{
		self.var_48ab101 delete();
	}
	self delete();
}

/*
	Name: function_18caf292
	Namespace: namespace_24fd6413
	Checksum: 0x66EF7606
	Offset: 0x5950
	Size: 0x186
	Parameters: 2
	Flags: None
*/
function function_18caf292(n_id, var_c3a3ae13)
{
	foreach(player in getplayers())
	{
		if(!level.sr_objective_secure_hud sr_objective_secure_hud::is_open(player))
		{
			level.sr_objective_secure_hud sr_objective_secure_hud::open(player);
		}
		switch(n_id)
		{
			case 0:
			{
				level.sr_objective_secure_hud sr_objective_secure_hud::set_progfraca(player, var_c3a3ae13);
				level.sr_objective_secure_hud sr_objective_secure_hud::set_objectivewhitea(player, 0);
				break;
			}
			case 1:
			{
				level.sr_objective_secure_hud sr_objective_secure_hud::set_progfracb(player, var_c3a3ae13);
				level.sr_objective_secure_hud sr_objective_secure_hud::set_objectivewhiteb(player, 0);
				break;
			}
		}
	}
}

/*
	Name: function_1ee78771
	Namespace: namespace_24fd6413
	Checksum: 0xD9F38B2C
	Offset: 0x5AE0
	Size: 0x3B4
	Parameters: 1
	Flags: None
*/
function function_1ee78771(instance)
{
	instance endon(#"objective_ended");
	self endon(#"secured");
	self val::set("drop", "takedamage", 0);
	self waittill(#"landed");
	self val::reset("drop", "takedamage");
	self.is_damaged = 0;
	switch(getplayers().size)
	{
		case 1:
		{
			self.health = 4000;
			self.max_health = 4000;
			break;
		}
		case 2:
		{
			self.health = 3750;
			self.max_health = 3750;
			break;
		}
		case 3:
		{
			self.health = 3250;
			self.max_health = 3250;
			break;
		}
		case 4:
		{
			self.health = 2500;
			self.max_health = 2500;
			break;
		}
	}
	n_start_health = self.health;
	self val::set("droppod", "takedamage", 1);
	var_526e7ad6 = self.var_526e7ad6;
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"damage");
		if(isdefined(s_result.attacker) && isplayer(s_result.attacker))
		{
			if(isdefined(s_result.amount))
			{
				self.health = self.health + s_result.amount;
			}
		}
		else
		{
			self playsound(#"hash_1ddeb8af5a217a6e");
			if(!self.is_damaged)
			{
				self thread function_814c0e69(instance);
			}
			n_dmg = instance.var_ce59b674 - s_result.amount;
			if(n_dmg > 0)
			{
				self dodamage(n_dmg, self.origin, undefined, undefined, undefined, "MOD_MELEE");
			}
		}
		var_c3a3ae13 = self.health / n_start_health;
		if(var_c3a3ae13 < 0)
		{
			var_c3a3ae13 = 0;
		}
		self clientfield::increment("" + #"hash_18bcf106c476dfeb");
		function_18caf292(self.n_id, var_c3a3ae13);
		if(self.health <= 1)
		{
			var_526e7ad6 delete();
			break;
		}
	}
	self notify(#"destroyed");
	instance notify(#"destroyed");
	objective_manager::objective_ended(instance, 0);
}

/*
	Name: on_dog_killed
	Namespace: namespace_24fd6413
	Checksum: 0xB8586874
	Offset: 0x5EA0
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function on_dog_killed(params)
{
	var_bf189694 = getentarray("drop_pod", "targetname");
	var_954ec1b6 = array::get_all_closest(self.origin, var_bf189694)[0];
	if(self.aitype === #"hash_7a8b592728eec95d" && isdefined(var_954ec1b6))
	{
		if(isdefined(self) && distance2dsquared(self.origin, var_954ec1b6.origin) <= sqr(200))
		{
			n_dmg = level.var_7d45d0d4.var_3385b421.var_bf0352e0;
			var_954ec1b6 dodamage(n_dmg, var_954ec1b6.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
		}
	}
}

/*
	Name: function_814c0e69
	Namespace: namespace_24fd6413
	Checksum: 0xA0B3BF46
	Offset: 0x5FC8
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function function_814c0e69(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	n_inc = 0;
	self.is_damaged = 1;
	while(n_inc < 3)
	{
		self playsound(#"hash_2847596f1017cb69");
		wait(0.5);
		n_inc++;
	}
	wait(0.5);
	self.is_damaged = 0;
}

/*
	Name: function_fb9dff2f
	Namespace: namespace_24fd6413
	Checksum: 0xFBD1B82
	Offset: 0x6070
	Size: 0x358
	Parameters: 2
	Flags: None
*/
function function_fb9dff2f(instance, activator)
{
	if(isplayer(activator))
	{
		instance.n_timeout = function_36585ff1();
		instance notify(#"hash_20dcff0079f189f3");
		instance thread function_8b062964();
		instance thread function_f5087df2();
		instance thread function_17f1d0f3();
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::set_main_objective_string(player, #"hash_691ec119979cba95");
		}
		wait(6);
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_691ec119979cba95");
			level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
			if(!level.sr_objective_secure_hud sr_objective_secure_hud::is_open(player))
			{
				level.sr_objective_secure_hud sr_objective_secure_hud::open(player);
			}
			level.sr_objective_secure_hud sr_objective_secure_hud::set_progfraca(player, 1);
			level.sr_objective_secure_hud sr_objective_secure_hud::set_progfracb(player, 1);
		}
		while(true)
		{
			if(is_true(instance.var_5b071610))
			{
				break;
			}
			wait(1);
		}
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_1201ff20897597a2");
		}
	}
}

/*
	Name: on_ai_killed
	Namespace: namespace_24fd6413
	Checksum: 0x20E60B45
	Offset: 0x63D0
	Size: 0x1E0
	Parameters: 1
	Flags: None
*/
function on_ai_killed(params)
{
	if(self.aitype !== #"hash_7a8b592728eec95d" && self.aitype !== #"hash_12a17ab3df5889eb")
	{
		var_bf189694 = getentarray("drop_pod", "targetname");
		var_954ec1b6 = array::get_all_closest(self.origin, var_bf189694)[0];
		if(isdefined(self) && isdefined(var_954ec1b6) && isdefined(var_954ec1b6.var_48ab101) && !is_true(var_954ec1b6.var_fcd0c6d7) && distance2dsquared(self.origin, var_954ec1b6.origin) <= sqr(var_954ec1b6.var_75833abc) && is_true(var_954ec1b6.is_active) && !is_true(var_954ec1b6.is_cleared))
		{
			var_954ec1b6.n_kills++;
			if(isdefined(self.e_marker))
			{
				self.e_marker delete();
			}
			self clientfield::set("" + #"zombie_soul", 1);
			wait(0.95);
			if(isdefined(var_954ec1b6))
			{
				var_954ec1b6 notify(#"capture");
			}
		}
	}
}

/*
	Name: function_b769e108
	Namespace: namespace_24fd6413
	Checksum: 0xE3575DAA
	Offset: 0x65B8
	Size: 0x32E
	Parameters: 1
	Flags: None
*/
function function_b769e108(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	a_zombies = function_a38db454(self.origin, 1000);
	foreach(zombie in a_zombies)
	{
		if(zombie.archetype === #"zombie")
		{
			zombie.knockdown = 1;
			zombie.knockdown_type = "knockdown_shoved";
			zombie_to_target = self.origin - zombie.origin;
			zombie_to_target_2d = vectornormalize((zombie_to_target[0], zombie_to_target[1], 0));
			zombie_forward = anglestoforward(zombie.angles);
			zombie_forward_2d = vectornormalize((zombie_forward[0], zombie_forward[1], 0));
			zombie_right = anglestoright(zombie.angles);
			zombie_right_2d = vectornormalize((zombie_right[0], zombie_right[1], 0));
			dot = vectordot(zombie_to_target_2d, zombie_forward_2d);
			if(dot >= 0.5)
			{
				zombie.knockdown_direction = "front";
				zombie.getup_direction = "getup_back";
				continue;
			}
			if(dot < 0.5 && dot > -0.5)
			{
				dot = vectordot(zombie_to_target_2d, zombie_right_2d);
				if(dot > 0)
				{
					zombie.knockdown_direction = "right";
					if(math::cointoss())
					{
						zombie.getup_direction = "getup_back";
					}
					else
					{
						zombie.getup_direction = "getup_belly";
					}
				}
				else
				{
					zombie.knockdown_direction = "left";
					zombie.getup_direction = "getup_belly";
				}
				continue;
			}
			zombie.knockdown_direction = "back";
			zombie.getup_direction = "getup_belly";
		}
	}
}

/*
	Name: function_c6f443c5
	Namespace: namespace_24fd6413
	Checksum: 0x719A5124
	Offset: 0x68F0
	Size: 0xD8
	Parameters: 0
	Flags: None
*/
function function_c6f443c5()
{
	self endon(#"death");
	a_zombies = function_a38db454(self.origin, 2500);
	foreach(zombie in a_zombies)
	{
		if(isalive(zombie))
		{
			self thread function_912eedf3(zombie);
		}
	}
}

/*
	Name: function_912eedf3
	Namespace: namespace_24fd6413
	Checksum: 0xF9FD93D
	Offset: 0x69D0
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_912eedf3(zombie)
{
	self endon(#"death");
	zombie endon(#"death");
	if(isdefined(zombie) && !is_true(zombie.var_a950813d))
	{
		v_dir = vectornormalize(zombie.origin - self.origin);
		v_launch = (v_dir * randomintrange(250, 350)) + vectorscale((0, 0, 1), 450);
		zombie.allowdeath = 1;
		if(!zombie isragdoll())
		{
			zombie startragdoll();
			waitframe(2);
			zombie launchragdoll(v_launch);
		}
		zombie kill();
	}
}

/*
	Name: zombie_count
	Namespace: namespace_24fd6413
	Checksum: 0xC42633E0
	Offset: 0x6B10
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function zombie_count()
{
	self waittill(#"objective_ended");
	iprintlnbold("Zombies Spawned: " + level.var_da90ed03);
}

/*
	Name: function_9574beec
	Namespace: namespace_24fd6413
	Checksum: 0xA3CCA115
	Offset: 0x6B58
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function function_9574beec()
{
	level.var_da90ed03++;
}

