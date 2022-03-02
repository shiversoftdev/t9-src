#using script_3626f1b2cf51a99c;
#using script_52da18c20f45c56a;
#using script_5431e074c1428743;
#using script_59f07c660e6710a5;
#using script_7d0013bbc05623b9;
#using script_9bfd3d8a6a89e5e;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\doors_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\bb.gsc;
#using scripts\cp_common\util.gsc;

#namespace namespace_e1cd3aae;

/*
	Name: function_89f2df9
	Namespace: namespace_e1cd3aae
	Checksum: 0x91CD2090
	Offset: 0x4A8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_63ef0cf11243d45a", &function_70a657d8, undefined, undefined, #"hash_7ee44bf733d7a7ac");
}

/*
	Name: function_70a657d8
	Namespace: namespace_e1cd3aae
	Checksum: 0xF2187889
	Offset: 0x4F8
	Size: 0x254
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.body_shield.var_30c92ca9))
	{
		level.body_shield.var_30c92ca9 = 1;
		animation::add_global_notetrack_handler("contact", &function_faf4a34d, 0);
		animation::add_global_notetrack_handler("slomo", &bullet_time_start, 0);
		animation::add_global_notetrack_handler("hide", &function_85d6c09b, 0);
		animation::add_global_notetrack_handler("grenade_detonate", &grenade_explode, 0);
		animation::add_global_notetrack_handler("push_enable", &function_9c87450d, 0);
		animation::add_global_notetrack_handler("push_disable", &function_39a3991b, 0);
		animation::add_global_notetrack_handler("camera_unlink", &function_a3d6cc6, 0);
		actions::function_9ddfe2d("body_shield_grenade", &function_dcc1570d, "body_shield");
		actions::function_9ddfe2d("body_shield_kill", &function_a471f3b0, "body_shield");
		actions::function_b1543a9d("body_shield_grenade", "td_anims_body_shield_grenade");
		actions::function_b1543a9d("body_shield_kill", "td_anims_body_shield_kill");
		actions::function_b1543a9d("body_shield_push", "td_anims_body_shield_push");
		level.var_c9e10637 = [];
		level.var_c9e10637[#"frag"] = "body_shield_grenade";
		level.var_c9e10637[#"stance"] = "body_shield_kill";
	}
}

/*
	Name: function_dcc1570d
	Namespace: namespace_e1cd3aae
	Checksum: 0xE75802BC
	Offset: 0x758
	Size: 0xAE
	Parameters: 1
	Flags: None
*/
function function_dcc1570d(action)
{
	self endon(action.ender);
	while(true)
	{
		if(is_true(self actions::function_83bde308(action, "frag")))
		{
			if(self function_5ebe8eba(action.name))
			{
				self thread function_5053f358(action, self.takedown.body);
				return true;
			}
		}
		waitframe(1);
	}
	return false;
}

/*
	Name: function_a471f3b0
	Namespace: namespace_e1cd3aae
	Checksum: 0xE05BF38
	Offset: 0x810
	Size: 0x146
	Parameters: 1
	Flags: None
*/
function function_a471f3b0(action)
{
	self endon(action.ender);
	self thread function_b6bc0788(action);
	if(isdefined(self.takedown.body))
	{
		self.takedown.body thread function_dc160233(action);
	}
	while(true)
	{
		if(is_true(self actions::function_83bde308(action, "stance")))
		{
			var_9a585e5c = isdefined(self.var_f467e5b0.var_c4e66a91);
			self actions::function_8488e359();
			if(var_9a585e5c || self function_5ebe8eba(action.name))
			{
				self thread function_6c9ddc07(action, self.takedown.body);
				return true;
			}
		}
		waitframe(1);
	}
	return false;
}

/*
	Name: function_b6bc0788
	Namespace: namespace_e1cd3aae
	Checksum: 0x5A28181A
	Offset: 0x960
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_b6bc0788(action)
{
	self waittill(#"hash_244459f2eb8f0a38");
	self.takedown.body_shield.drop = "dead";
	self actions::function_8488e359("stance");
}

/*
	Name: function_dc160233
	Namespace: namespace_e1cd3aae
	Checksum: 0xFA2F0AD9
	Offset: 0x9C8
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_dc160233(action)
{
	if(is_true(self.var_d5bd339b))
	{
		wait(0.2);
	}
	else
	{
		self waittill(#"hash_7884feb21ff33557");
		self.var_d5bd339b = 1;
	}
	player = getplayers()[0];
	if(!isalive(self))
	{
		player.takedown.body_shield.drop = "dead";
	}
	player actions::function_8488e359("stance");
}

/*
	Name: function_faf4a34d
	Namespace: namespace_e1cd3aae
	Checksum: 0x14ADCB13
	Offset: 0xAA0
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_faf4a34d(guy)
{
	player = getplayers()[0];
	victim = (isdefined(player.takedown.var_198a4d10) ? player.takedown.var_198a4d10 : self);
	if(isactor(victim))
	{
		victim animmode("gravity");
	}
	player val::set(#"action", "takedamage", 0);
	player util::delay(0.5, undefined, &val::set, #"action", "takedamage", 1);
	player playrumbleonentity("damage_heavy");
}

/*
	Name: bullet_time_start
	Namespace: namespace_e1cd3aae
	Checksum: 0x4D88EEC3
	Offset: 0xBE0
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function bullet_time_start(guy)
{
	player = getplayers()[0];
	if(player.var_2cb06cc6.name == "body_shield_grenade")
	{
		return;
	}
	level.fnasmsoldiergetpainweaponsize = &function_5c01c962;
	player util::function_5045bb33(4, 0.25);
	level.fnasmsoldiergetpainweaponsize = undefined;
}

/*
	Name: function_5c01c962
	Namespace: namespace_e1cd3aae
	Checksum: 0xF1AB9C7E
	Offset: 0xC88
	Size: 0x12
	Parameters: 1
	Flags: None
*/
function function_5c01c962(size)
{
	return "_lg";
}

/*
	Name: function_85d6c09b
	Namespace: namespace_e1cd3aae
	Checksum: 0x79BCB046
	Offset: 0xCA8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_85d6c09b(guy)
{
	player = getplayers()[0];
	player namespace_594b67e::function_76e2ec80();
}

/*
	Name: function_d521a78f
	Namespace: namespace_e1cd3aae
	Checksum: 0xD72A8A25
	Offset: 0xCF8
	Size: 0x13C
	Parameters: 0
	Flags: None
*/
function function_d521a78f()
{
	player = self;
	var_248cbbcf = {};
	var_248cbbcf.var_4ac77177 = 0;
	var_248cbbcf.var_de6f0004 = 0;
	var_248cbbcf.var_531201f1 = &function_d2cf74ab;
	var_248cbbcf.var_be77841a = 0;
	var_248cbbcf.groups = [0:#"actions"];
	self prompts::function_c97a48c7(#"stance", var_248cbbcf);
	self prompts::function_263320e2(#"stance", #"hash_738e0cc280f3474f");
	self prompts::function_c97a48c7(#"frag", var_248cbbcf);
	self prompts::function_263320e2(#"frag", #"hash_4ac43752337031be");
	setdvar(#"scr_door_player_gestures", 0);
}

/*
	Name: function_5ebe8eba
	Namespace: namespace_e1cd3aae
	Checksum: 0xDFF635F1
	Offset: 0xE40
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_5ebe8eba(action_name)
{
	if(is_true(self.var_f467e5b0.var_36a4a92c))
	{
		return 0;
	}
	if(!is_true(self.var_f467e5b0.enabled[action_name]))
	{
		return 0;
	}
	override = self actions::function_abaa32c("body_shield");
	if(isdefined(override.disable) && array::contains(override.disable, action_name))
	{
		return 0;
	}
	if(self.takedown.body_shield.health > 0)
	{
		switch(action_name)
		{
			case "body_shield_kill":
			{
				return self namespace_594b67e::function_fdff1cf3();
			}
			case "body_shield_grenade":
			{
				return self namespace_594b67e::function_fdff1cf3() && self function_a02c0e4f(self.var_edbc8698);
			}
		}
	}
	return 0;
}

/*
	Name: function_d2cf74ab
	Namespace: namespace_e1cd3aae
	Checksum: 0x9E0441A5
	Offset: 0xFA8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_d2cf74ab(var_248cbbcf)
{
	action = level.var_c9e10637[var_248cbbcf.prompt];
	return isdefined(action) && self function_5ebe8eba(action);
}

/*
	Name: function_a02c0e4f
	Namespace: namespace_e1cd3aae
	Checksum: 0x692AEA8
	Offset: 0x1000
	Size: 0x38
	Parameters: 1
	Flags: None
*/
function function_a02c0e4f(victim)
{
	/#
		assert(isplayer(self));
	#/
	return true;
}

/*
	Name: function_ecd2291d
	Namespace: namespace_e1cd3aae
	Checksum: 0xBBDF00F6
	Offset: 0x1040
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_ecd2291d()
{
	if(isdefined(self.takedown.gesture))
	{
		self namespace_594b67e::gesture_stop(self.takedown.gesture);
	}
}

/*
	Name: function_849bed38
	Namespace: namespace_e1cd3aae
	Checksum: 0x6C3C4D11
	Offset: 0x1088
	Size: 0x184
	Parameters: 3
	Flags: None
*/
function function_849bed38(link_ents, var_e4df1bec, var_cee46280)
{
	/#
		assert(isplayer(self));
	#/
	waitframe(1);
	pitch = abs(angleclamp180(self getplayerangles()[0]));
	duration = pitch / 180;
	prep = undefined;
	if(pitch > 0)
	{
		prep = util::spawn_model("tag_origin", self.origin, self.angles);
		self playerlinktoblend(prep, "tag_origin", duration, duration * 0.5, duration * 0.5);
	}
	wait(duration + ((float(function_60d95f53()) / 1000) * 2));
	if(isdefined(prep))
	{
		prep delete();
	}
}

/*
	Name: function_5e89af5d
	Namespace: namespace_e1cd3aae
	Checksum: 0xF332F1D4
	Offset: 0x1218
	Size: 0x1DA
	Parameters: 5
	Flags: None
*/
function function_5e89af5d(action, victim, var_17fee02c, var_dfce6e2d, var_f510f19d)
{
	self.takedown.var_b8302c5e = self.takedown.gesture;
	self util::function_5f1df718(#"hash_6c1bcea3b5d8f78f");
	self namespace_594b67e::allow_weapon(0, undefined, var_17fee02c, var_dfce6e2d);
	self val::set(#"action", "freezecontrols", 1);
	self util::delay(0.2, undefined, &val::set, #"action", "takedamage", 0);
	self function_849bed38([1:self.takedown.body, 0:self.var_6639d45b], undefined);
	self namespace_594b67e::function_2795d678(0);
	self util::delay(0.2, undefined, &function_ecd2291d);
	if(!is_true(var_f510f19d))
	{
		self namespace_594b67e::function_9d7828b0(0.5);
	}
	self.takedown.var_198a4d10 = self.takedown.body_shield.actor;
}

/*
	Name: function_8ba805b3
	Namespace: namespace_e1cd3aae
	Checksum: 0x3920C27C
	Offset: 0x1400
	Size: 0x76
	Parameters: 0
	Flags: None
*/
function function_8ba805b3()
{
	self val::reset_all(#"action");
	self namespace_594b67e::allow_weapon(1);
	self.var_d3b4e4f4 = undefined;
	self.var_852e84c9 = undefined;
	prompts::function_398ab9eb();
	self notify(#"hash_2a87a221154d292");
}

/*
	Name: function_5053f358
	Namespace: namespace_e1cd3aae
	Checksum: 0xDA72E9BE
	Offset: 0x1480
	Size: 0x17C
	Parameters: 2
	Flags: None
*/
function function_5053f358(action, body)
{
	self function_5e89af5d(action, body, undefined, 1);
	bb::logplayermapnotification("bodyshield_grenade", self);
	scene = array::random([1:"td_scene_bodyshield_grenade_b", 0:"td_scene_bodyshield_grenade_a"]);
	animation = function_11b042fc(scene, "victim");
	body thread function_17414a13(body);
	var_ae5fe668 = 4;
	start = gettime();
	self function_7ead73b1(action, body, "grenade", scene, "ges_body_shield_to_grenade");
	self function_8ba805b3();
	var_ae5fe668 = var_ae5fe668 - ((float(gettime() - start)) / 1000);
	if(var_ae5fe668 > 0)
	{
		wait(var_ae5fe668);
	}
	thread grenade_explode(body);
}

/*
	Name: function_6c9ddc07
	Namespace: namespace_e1cd3aae
	Checksum: 0x3E0DF62A
	Offset: 0x1608
	Size: 0x1E4
	Parameters: 2
	Flags: None
*/
function function_6c9ddc07(action, body)
{
	if(!isdefined(body))
	{
		body = self.takedown.body;
	}
	var_de098861 = undefined;
	var_6e477ca8 = "td_scene_bodyshield_kill";
	if(self.takedown.body_shield.drop === "dead")
	{
		var_6e477ca8 = "td_scene_bodyshield_drop";
		var_de098861 = "ges_body_shield_rifle_drop";
		bb::logplayermapnotification("bodyshield_drop", self);
		self function_5e89af5d(action, body, undefined, 1, 1);
	}
	else
	{
		bb::logplayermapnotification("bodyshield_kill", self);
		self function_5e89af5d(action, body);
	}
	override = self actions::function_abaa32c("body_shield");
	self function_7ead73b1(action, body, "kill", (isdefined(override.var_4a561920) ? override.var_4a561920 : var_6e477ca8), var_de098861);
	if(isalive(self.takedown.var_198a4d10))
	{
		util::stop_magic_bullet_shield(self.takedown.var_198a4d10);
		self.takedown.var_198a4d10 kill();
	}
	self function_8ba805b3();
}

/*
	Name: function_58980558
	Namespace: namespace_e1cd3aae
	Checksum: 0x93841B55
	Offset: 0x17F8
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function function_58980558(victim)
{
	self notify("52af857b7d7201ad");
	self endon("52af857b7d7201ad");
	if(isactor(victim))
	{
		self thread function_ae4d480a(victim);
	}
	while(isdefined(victim))
	{
		self.takedown.var_e5b7c28e = victim getcorpsephysicsorigin() + (0, 0, 1);
		waitframe(1);
	}
}

/*
	Name: function_ae4d480a
	Namespace: namespace_e1cd3aae
	Checksum: 0xB113D802
	Offset: 0x1890
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_ae4d480a(victim)
{
	victim endon(#"entitydeleted");
	result = undefined;
	result = victim waittill(#"actor_corpse");
	self thread function_58980558(result.corpse);
}

/*
	Name: function_7ead73b1
	Namespace: namespace_e1cd3aae
	Checksum: 0x18BEC365
	Offset: 0x1900
	Size: 0x5B4
	Parameters: 5
	Flags: None
*/
function function_7ead73b1(action, body, var_d1b14335, scene, gesture)
{
	/#
		assert(isplayer(self));
	#/
	waittillframeend();
	player = self;
	self prompts::function_ee7adae5(#"actions");
	player.var_ca6b6423 = undefined;
	setdvar(#"scr_door_player_gestures", 1);
	scene_root = spawnstruct();
	scene_root.origin = self.origin;
	scene_root.angles = self.angles;
	if(!self namespace_594b67e::function_fdff1cf3())
	{
		offset = vectorscale((0, 0, 1), 8);
		scene_root.origin = playerphysicstrace(self.origin + offset, (self.origin + (anglestoforward(self.angles) * -15)) + offset);
		scene_root.origin = playerphysicstrace(scene_root.origin, scene_root.origin - offset);
	}
	self.takedown.victim = [];
	self.takedown.body = undefined;
	self.takedown.body_shield.scene_root = scene_root;
	self.takedown.body_shield.actor unlink();
	self.takedown.body_shield.actor forceteleport(scene_root.origin, scene_root.angles);
	self.takedown.body_shield.actor.health = int(max(1, self.takedown.body_shield.health));
	self.takedown.body_shield.actor.var_c681e4c1 = 1;
	self.takedown.body_shield.actor namespace_594b67e::function_35d0bd11(0);
	self.takedown.body_shield.actor notsolid();
	ai::setaiattribute(self.takedown.body_shield.actor, "useGrenades", 0);
	self thread function_58980558(self.takedown.body_shield.actor);
	self.takedown.body_shield.actor.var_f6639ad8 = function_11b042fc(scene, "victim");
	notes = getnotetracktimes(self.takedown.body_shield.actor.var_f6639ad8, "push_enable");
	self.takedown.body_shield.actor.var_1a1dd1a0 = notes[0];
	if(isdefined(gesture))
	{
		self.var_621f8539 = gesture;
		self thread namespace_594b67e::function_3ceda691(gesture);
	}
	self util::delay(float(function_60d95f53()) / 1000, undefined, &namespace_594b67e::function_76e2ec80);
	scene_root namespace_594b67e::scene_play(scene, self, self.takedown.body_shield.actor);
	self.takedown.body_shield.actor namespace_594b67e::function_b82cae8f(0, 0);
	self namespace_594b67e::function_76e2ec80();
	if(isalive(self.takedown.body_shield.actor))
	{
		self.takedown.body_shield.actor solid();
	}
	self namespace_594b67e::function_2795d678(0);
	self actions::function_942d9213();
	self flag::clear("in_action");
}

/*
	Name: function_11b042fc
	Namespace: namespace_e1cd3aae
	Checksum: 0xAD8EA00C
	Offset: 0x1EC0
	Size: 0x140
	Parameters: 4
	Flags: None
*/
function function_11b042fc(scenename, var_47eb4927, shot, var_dd00fdae)
{
	if(!isdefined(shot))
	{
		shot = 0;
	}
	if(!isdefined(var_dd00fdae))
	{
		var_dd00fdae = 0;
	}
	scene = getscriptbundle(scenename);
	if(isdefined(scene.objects))
	{
		var_61da41d8 = tolower(var_47eb4927);
		foreach(obj in scene.objects)
		{
			if(tolower(obj.name) === var_61da41d8)
			{
				return obj.shots[shot].entry[var_dd00fdae].anim;
			}
		}
	}
}

/*
	Name: function_1058ffa1
	Namespace: namespace_e1cd3aae
	Checksum: 0xFACE87FE
	Offset: 0x2008
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_1058ffa1(guy)
{
	if(!isdefined(guy))
	{
		guy = self;
	}
	/#
		assert(isactor(guy));
	#/
	guy.var_54163419 = util::spawn_model(#"wpn_t9_eqp_grenade_frag_view", guy.origin, guy.angles);
	guy.var_54163419 notsolid();
	guy.var_54163419 linkto(guy, "tag_accessory_left", (0, 0, 0), (0, 0, 0));
	guy callback::function_30c3f95d(&function_6794cd13);
}

/*
	Name: function_17414a13
	Namespace: namespace_e1cd3aae
	Checksum: 0xFDBE63A7
	Offset: 0x20F8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_17414a13(guy)
{
	guy waittill(#"death");
	grenade_drop(guy);
}

/*
	Name: grenade_drop
	Namespace: namespace_e1cd3aae
	Checksum: 0x6CAC0BE4
	Offset: 0x2140
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function grenade_drop(var_5fb1bd74)
{
	if(isdefined(var_5fb1bd74.var_54163419) && isdefined(var_5fb1bd74.var_bc2602c8) && !is_true(var_5fb1bd74.var_54163419.dropped))
	{
		var_5fb1bd74.var_54163419.dropped = 1;
		launchforce = var_5fb1bd74.var_bc2602c8 * 2;
		launchforce = launchforce + (randomfloatrange(-0.5, 0.5), randomfloatrange(-0.5, 0.5), randomfloatrange(-0.5, 0.5));
		launchforce = vectornormalize(launchforce) * 0.1;
		var_5fb1bd74.var_54163419 unlink();
		var_5fb1bd74.var_54163419 physicslaunch(var_5fb1bd74.var_54163419.origin - vectorscale((0, 0, 1), 3), launchforce);
		var_5fb1bd74.var_54163419 thread grenade_explode(var_5fb1bd74, 2);
	}
}

/*
	Name: grenade_explode
	Namespace: namespace_e1cd3aae
	Checksum: 0xD53AC1A9
	Offset: 0x22D0
	Size: 0x19A
	Parameters: 2
	Flags: None
*/
function grenade_explode(var_5fb1bd74, delay)
{
	if(isdefined(var_5fb1bd74.var_54163419))
	{
		grenade = var_5fb1bd74.var_54163419;
		grenade notify(#"grenade_explode");
		grenade endon(#"grenade_explode");
		if(isdefined(delay))
		{
			now = gettime();
			if(!isdefined(grenade.var_be9d05c3))
			{
				grenade.var_be9d05c3 = gettime() + (delay * 1000);
			}
			if((isdefined(grenade.var_be9d05c3) ? grenade.var_be9d05c3 : now) > now)
			{
				wait((float(grenade.var_be9d05c3 - now)) / 1000);
			}
		}
		if(isdefined(grenade))
		{
			origin = grenade.origin;
			grenade delete();
			wpn_grenade = getweapon(#"frag_grenade");
			player = getplayers()[0];
			player.body_shield_grenade = player magicgrenademanualplayer(origin, (0, 0, 0), wpn_grenade, 0);
		}
	}
}

/*
	Name: function_6794cd13
	Namespace: namespace_e1cd3aae
	Checksum: 0x421A1102
	Offset: 0x2478
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_6794cd13(params)
{
	self.var_54163419 = params.original.var_54163419;
	if(isdefined(self.var_54163419) && isdefined(params.original.var_54163419))
	{
		self.var_54163419.var_be9d05c3 = params.original.var_54163419.var_be9d05c3;
	}
	self.var_bc2602c8 = params.original.var_bc2602c8;
	grenade_drop(self);
}

/*
	Name: function_a3d6cc6
	Namespace: namespace_e1cd3aae
	Checksum: 0x58D93030
	Offset: 0x2528
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_a3d6cc6(params)
{
	if(isplayer(self) && isdefined(self.takedown.body_shield.actor))
	{
		self.takedown.body_shield.actor namespace_594b67e::function_b82cae8f(0, 0);
	}
	else if(isactor(self))
	{
		self namespace_594b67e::function_b82cae8f(0, 0);
	}
}

/*
	Name: function_13841987
	Namespace: namespace_e1cd3aae
	Checksum: 0x78A4FEA
	Offset: 0x25D8
	Size: 0x326
	Parameters: 0
	Flags: None
*/
function function_13841987()
{
	self endon(#"death", #"killanimscript");
	if(!isdefined(self.var_f6639ad8))
	{
		/#
			iprintlnbold("");
		#/
		return;
	}
	player = getplayers()[0];
	if(self scene::function_c935c42())
	{
		var_49f0de73 = arraycopy(self._scene_object._o_scene._a_objects);
		foreach(object in var_49f0de73)
		{
			if(object._e !== player && isdefined(object._e._scene_object))
			{
				[[ object._e._scene_object ]]->stop();
			}
			if(isdefined(object._e) && !isactor(object._e) && !isplayer(object._e))
			{
				object._e delete();
			}
		}
	}
	self stopanimscripted();
	self.allowpain = 0;
	self.ignoreme = 1;
	scene_root = player.takedown.body_shield.scene_root;
	self.var_13841987 = 1;
	self orientmode("face default");
	self animmode("nogravity");
	self animation::play(self.var_f6639ad8, scene_root.origin, scene_root.angles, 1, 0, 0, 0, self.var_1a1dd1a0, undefined, undefined, undefined, undefined, "custom");
	if(isalive(self))
	{
		self animmode("zonly_physics");
		self.allowpain = 1;
		self.ignoreme = 0;
		self.var_f6639ad8 = undefined;
		self.in_melee_death = undefined;
	}
}

/*
	Name: function_2d4ccf74
	Namespace: namespace_e1cd3aae
	Checksum: 0x31C7172D
	Offset: 0x2908
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function function_2d4ccf74()
{
	if(isdefined(self) && !isalive(self))
	{
		self startragdoll(1);
	}
	self.var_13841987 = undefined;
}

/*
	Name: function_9c87450d
	Namespace: namespace_e1cd3aae
	Checksum: 0x9354A392
	Offset: 0x2960
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_9c87450d()
{
	if(!is_true(self.var_13841987))
	{
		self function_1058ffa1(self);
		self animcustom(&function_13841987, &function_2d4ccf74);
		self thread function_306feb88();
	}
}

/*
	Name: function_39a3991b
	Namespace: namespace_e1cd3aae
	Checksum: 0x15022354
	Offset: 0x29E8
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function function_39a3991b()
{
	self notify(#"hash_2860a6b03ec878f6");
}

/*
	Name: function_84d08d48
	Namespace: namespace_e1cd3aae
	Checksum: 0xA120C2AF
	Offset: 0x2A08
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_84d08d48(delay)
{
	if(isdefined(delay) && delay > 0)
	{
		wait(delay);
	}
}

/*
	Name: function_bae5ad1b
	Namespace: namespace_e1cd3aae
	Checksum: 0xCE7CA46E
	Offset: 0x2A48
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function function_bae5ad1b()
{
	player = getplayers()[0];
	if(!isai(self))
	{
		return;
	}
	if(!isalive(self))
	{
		return;
	}
	if(self.primaryweapon.name === "#none" || (isdefined(player.takedown.body_shield) && is_true(player.takedown.body_shield.var_13356219)))
	{
		self.forceragdollimmediate = 1;
		self kill(self.origin, player, player);
	}
}

/*
	Name: function_306feb88
	Namespace: namespace_e1cd3aae
	Checksum: 0xAE601E25
	Offset: 0x2B40
	Size: 0xBFA
	Parameters: 1
	Flags: None
*/
function function_306feb88(guy)
{
	if(is_true(self.var_306feb88))
	{
		return;
	}
	self notify(#"hash_2860a6b03ec878f6");
	self.var_306feb88 = 1;
	self endoncallback(&function_e69bc894, #"hash_2860a6b03ec878f6", #"death", #"killanimscript");
	var_afbec8c = self.origin;
	anim_name = undefined;
	player = getplayers()[0];
	player endon(#"disconnect");
	destroyed = [];
	var_29fbf4b0 = max(60, max(80, 32));
	while(true)
	{
		waitframe(1);
		move_delta = self.origin - var_afbec8c;
		move_delta = (move_delta[0], move_delta[1], 0);
		var_afbec8c = self.origin;
		if(lengthsquared(move_delta) < 0.01)
		{
			continue;
		}
		interactables = getentitiesinradius(self.origin, var_29fbf4b0);
		foreach(interact in interactables)
		{
			if(interact === self)
			{
				continue;
			}
			if(isplayer(interact))
			{
				continue;
			}
			if(isdefined(interact.var_f6639ad8))
			{
				continue;
			}
			dir = interact.origin - self.origin;
			dir = vectornormalize((dir[0], dir[1], 0));
			move_dir = vectornormalize(move_delta);
			dot = vectordot(move_dir, dir);
			if(dot < 0)
			{
				continue;
			}
			if(isai(interact))
			{
				if(interact scene::function_c935c42() && !is_true(interact.takedamage))
				{
					continue;
				}
				if(distancesquared(self.origin, interact.origin) > 80 * 80)
				{
					continue;
				}
				if(dot > cos(30) && !is_true(interact.var_bb317c90))
				{
					dot_right = vectordot(vectorcross(move_dir, (0, 0, 1)), dir);
					if(dot_right > 0)
					{
						dir = rotatepoint(move_dir, vectorscale((0, -1, 0), 45));
					}
					else
					{
						dir = rotatepoint(move_dir, vectorscale((0, 1, 0), 45));
					}
					var_ba580a85 = ("body_shield_push" + "_push_") + randomintrange(1, 5);
					interact.var_f6639ad8 = level.var_f467e5b0.anims[#"generic"][var_ba580a85];
					interact.var_475b4bbe = vectortoangles(dir)[1] + 180;
					interact animcustom(&function_adf3cfb0, &function_9e4f9044);
				}
				continue;
			}
			if(isdefined(interact.c_door))
			{
				if(interact.c_door flag::get("locked"))
				{
					continue;
				}
				if(is_true(interact.c_door.var_81f24576))
				{
					continue;
				}
				if(distancesquared(self.origin, interact.origin) > 60 * 60)
				{
					continue;
				}
				interact.c_door thread doors::door_bash_open(player, 1, self.origin);
				continue;
			}
			if(interact.classname === "script_model" && is_true(interact.allowdeath) && !isdefined(destroyed[interact getentitynumber()]))
			{
				if(dot > cos(45))
				{
					pt = (rotatepoint(move_dir, (0, 0, 0) - interact.angles)) * -1;
					test_point = interact getpointinbounds(pt[0], pt[1], pt[2]);
					if(distance2dsquared(self.origin, test_point) < 32 * 32)
					{
						impactpoint = interact.origin + vectorscale((0, 0, 1), 15);
						impactpoint = impactpoint + ((vectornormalize(self.origin - interact.origin)) * 10);
						radiusdamage(impactpoint, 16, interact.health + 1, interact.health, self, "MOD_IMPACT");
						destroyed[interact getentitynumber()] = interact;
					}
				}
			}
		}
		var_c3548f43 = move_delta * 3;
		var_858fa287 = move_delta * 5;
		zoffset = vectorscale((0, 0, 1), 16);
		var_9dade54f = vectorscale((-1, -1, 0), 16);
		var_7179020a = (16, 16, 40);
		mask = (1 | 8) | 2;
		tracestart = self.origin + zoffset;
		traceend = tracestart + var_c3548f43;
		var_ddac030a = tracestart + var_858fa287;
		trace = physicstrace(tracestart, traceend, var_9dade54f, var_7179020a, self, mask);
		movedir = vectornormalize(move_delta);
		facingdir = anglestoforward(self.angles);
		facingdir = vectornormalize((facingdir[0], facingdir[1], 0));
		var_53c12a4 = vectordot(facingdir, movedir);
		self.var_bc2602c8 = movedir;
		anim_name = undefined;
		if(!isdefined(trace[#"entity"]) && trace[#"fraction"] < 1)
		{
			anim_name = ("body_shield_push" + (var_53c12a4 > 0 ? "_bounce_front_" : "_bounce_back_")) + randomintrange(1, 3);
		}
		else if(trace[#"fraction"] >= 1)
		{
			trace = physicstrace(traceend, var_ddac030a, var_9dade54f, var_7179020a, self, mask);
			if(trace[#"fraction"] >= 1)
			{
				tracestart = var_ddac030a;
				traceend = tracestart + (zoffset * -3);
				trace = physicstrace(tracestart, traceend, var_9dade54f, var_7179020a, self, mask);
				if(trace[#"fraction"] >= 1)
				{
					anim_name = "body_shield_push" + (var_53c12a4 > 0 ? "_fall_front" : "_fall_back");
					var_92d26b7c = 1;
					if(abs(var_53c12a4) < 0.7)
					{
						right = vectorcross(movedir, (0, 0, 1));
						var_11edc9c7 = vectordot(facingdir, right);
						anim_name = "body_shield_push" + (var_11edc9c7 < 0 ? "_fall_left" : "_fall_right");
					}
				}
			}
		}
		if(isdefined(anim_name))
		{
			animtoplay = level.var_f467e5b0.anims[#"generic"][anim_name];
			if(isdefined(animtoplay))
			{
				self animscripted(animtoplay, self.origin, self.angles, animtoplay, "custom", undefined, undefined, 0.1);
				wait(getanimlength(animtoplay) - 0.1);
				self.skipdeathanim = 1;
				self kill();
				return;
			}
		}
	}
}

/*
	Name: function_e69bc894
	Namespace: namespace_e1cd3aae
	Checksum: 0x6D60BFF4
	Offset: 0x3748
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function function_e69bc894(guy)
{
	self.var_306feb88 = undefined;
}

/*
	Name: function_adf3cfb0
	Namespace: namespace_e1cd3aae
	Checksum: 0xBD6DA807
	Offset: 0x3768
	Size: 0x13C
	Parameters: 0
	Flags: None
*/
function function_adf3cfb0()
{
	self endoncallback(&function_adf60f68, #"death", #"killanimscript");
	if(!isdefined(self.var_f6639ad8))
	{
		/#
			iprintlnbold("");
		#/
		return;
	}
	self.allowpain = 0;
	self.ignoreme = 1;
	self.var_bb317c90 = 1;
	if(self isragdoll())
	{
		return;
	}
	self orientmode("face angle", self.var_475b4bbe);
	self animmode("gravity");
	self animscripted(self.var_f6639ad8, self.origin, self.angles, self.var_f6639ad8, "custom");
	wait(getanimlength(self.var_f6639ad8));
}

/*
	Name: function_9e4f9044
	Namespace: namespace_e1cd3aae
	Checksum: 0x70A03D21
	Offset: 0x38B0
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function function_9e4f9044()
{
	self.allowpain = 1;
	self.ignoreme = 0;
	self.var_f6639ad8 = undefined;
	self.var_bb317c90 = undefined;
}

/*
	Name: function_adf60f68
	Namespace: namespace_e1cd3aae
	Checksum: 0xC5C25224
	Offset: 0x38E8
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_adf60f68(params)
{
	if(params === #"death")
	{
		self startragdoll();
	}
}

