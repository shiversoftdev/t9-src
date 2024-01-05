#using scripts\cp_common\bb.gsc;
#using script_2d443451ce681a;
#using script_7d0013bbc05623b9;
#using script_9bfd3d8a6a89e5e;
#using script_5431e074c1428743;
#using script_52da18c20f45c56a;
#using script_3626f1b2cf51a99c;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_5f6e61d9;

/*
	Name: function_701e4487
	Namespace: namespace_5f6e61d9
	Checksum: 0x59CFAE8B
	Offset: 0x338
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_701e4487()
{
	level notify(1227981890);
}

/*
	Name: __init__system__
	Namespace: namespace_5f6e61d9
	Checksum: 0xF38128EE
	Offset: 0x358
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_32009cf32baa31d1", &function_70a657d8, undefined, undefined, #"hash_7e93e9089f28804f");
}

/*
	Name: function_70a657d8
	Namespace: namespace_5f6e61d9
	Checksum: 0xFFE66C80
	Offset: 0x3A8
	Size: 0x184
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	animation::add_global_notetrack_handler("hide_victim", &function_8f7ba6c3, 0);
	animation::add_global_notetrack_handler("pickup", &function_ebce8b6, 0);
	animation::add_global_notetrack_handler("bodycarry_drop", &function_ff5c9214, 0);
	animation::add_global_notetrack_handler("start_bodyshield_gesture", &start_bodyshield_gesture, 0);
	setsaveddvar(#"ai_corpsesynch", 1);
	actions::function_9ddfe2d("body_carry", &function_c3475251, "takedown");
	actions::function_9ddfe2d("body_pickup", &function_b9c74598, undefined, "_never_");
	actions::function_b1543a9d("body_carry", "td_anims_body_carry");
	level callback::function_30c3f95d(&function_30c3f95d);
	level.var_3ba48663 = &ai::set_corpse_entity;
}

/*
	Name: function_30c3f95d
	Namespace: namespace_5f6e61d9
	Checksum: 0x45A10B6B
	Offset: 0x538
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_30c3f95d(parm)
{
	corpse = self;
	if(isdefined(parm.original.var_b9c0ade5))
	{
		corpse.var_b9c0ade5 = parm.original.var_b9c0ade5;
	}
	corpse setcontents(0);
	corpse.var_a08ba405 = parm.original.var_a08ba405;
	corpse thread function_c74e98cb();
}

/*
	Name: player_init
	Namespace: namespace_5f6e61d9
	Checksum: 0x725EA3B7
	Offset: 0x5D8
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function player_init()
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.var_9ebbaa46))
	{
		self.var_9ebbaa46 = spawnstruct();
		self.var_9ebbaa46.victim = undefined;
		self.var_9ebbaa46.active = undefined;
		self.var_9ebbaa46.var_87788f85 = undefined;
	}
}

/*
	Name: function_c3475251
	Namespace: namespace_5f6e61d9
	Checksum: 0x9BAC2208
	Offset: 0x668
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_c3475251(action)
{
	/#
		assert(isplayer(self));
	#/
	self endon(action.ender);
	self player_init();
	if(is_true(self actions::function_83bde308(action, "use", #"carry_body")))
	{
		self thread function_b8268bd6(action, self.var_edbc8698);
		return true;
	}
	return false;
}

/*
	Name: function_b9c74598
	Namespace: namespace_5f6e61d9
	Checksum: 0x5A4AF75C
	Offset: 0x738
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function function_b9c74598(action)
{
	/#
		assert(isplayer(self));
	#/
	self endon(action.ender);
	self player_init();
	self waittill(#"body_pickup");
	return true;
}

/*
	Name: function_c74e98cb
	Namespace: namespace_5f6e61d9
	Checksum: 0x55FAF85F
	Offset: 0x7B8
	Size: 0x276
	Parameters: 2
	Flags: Linked
*/
function function_c74e98cb(var_4aed6923, tag)
{
	if(!isdefined(var_4aed6923))
	{
		var_4aed6923 = 0;
	}
	self endon(#"death", #"entitydeleted");
	util::wait_network_frame();
	if(!isdefined(tag) && (is_true(var_4aed6923) || isdefined(self.var_a08ba405)))
	{
		tag = "j_spinelower";
	}
	button = #"use";
	var_70ddc449 = 18;
	if(is_true(self.var_b9c0ade5))
	{
		var_70ddc449 = 100;
	}
	self prompts::create(button, undefined, undefined, undefined, undefined, undefined, tag);
	self prompts::function_263320e2(button, #"hash_2112f5e24ce2de54");
	self prompts::function_5fe46a16(button, 50 + var_70ddc449);
	self prompts::function_68782902(button, 68);
	self prompts::function_b95d71cd(button, 20);
	self prompts::function_2bd2431a(button, 0);
	self prompts::function_a4a9acfc(button, &function_ffb1d92f);
	self prompts::function_75d5e526(button, &function_9ccb0bfc);
	self prompts::function_44d7831a(button, 0);
	self prompts::function_92127496(1, !is_true(self.var_b9c0ade5));
	self prompts::function_dcf99fad(button, 0, self.var_a08ba405);
	self notify(#"hash_3da14a3508f6e057");
}

/*
	Name: function_c4fe1ef2
	Namespace: namespace_5f6e61d9
	Checksum: 0x9CF98568
	Offset: 0xA38
	Size: 0x138
	Parameters: 0
	Flags: Linked
*/
function function_c4fe1ef2()
{
	player = self;
	if(!isplayer(player))
	{
		player = getplayers()[0];
	}
	player.var_ca6b6423 = undefined;
	setdvar(#"scr_door_player_gestures", 1);
	if(!is_true(player flag::get("body_carry")))
	{
		return false;
	}
	if(is_true(player.var_f467e5b0.var_36a4a92c))
	{
		return false;
	}
	if(!isdefined(player))
	{
		return false;
	}
	if(is_true(player.var_9ebbaa46.var_87788f85))
	{
		return false;
	}
	player.var_ca6b6423 = 1;
	setdvar(#"scr_door_player_gestures", 0);
	return true;
}

/*
	Name: function_ffb1d92f
	Namespace: namespace_5f6e61d9
	Checksum: 0xE69774D7
	Offset: 0xB78
	Size: 0x176
	Parameters: 0
	Flags: Linked
*/
function function_ffb1d92f()
{
	player = getplayers()[0];
	if(!isdefined(player))
	{
		return false;
	}
	if(level flag::get("no_corpse_pickup") || isdefined(player getlinkedent()))
	{
		return false;
	}
	if(player namespace_594b67e::function_a06867b0(player getcurrentweapon()))
	{
		return false;
	}
	if(is_true(player flag::get("body_carry")))
	{
		return false;
	}
	if(is_true(player flag::get("body_pickup")))
	{
		return false;
	}
	if(!level flag::get("stealth_enabled") || level flag::get("stealth_spotted"))
	{
		return false;
	}
	if(player isswitchingweapons())
	{
		return false;
	}
	return true;
}

/*
	Name: function_9ccb0bfc
	Namespace: namespace_5f6e61d9
	Checksum: 0x2696F79C
	Offset: 0xCF8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_9ccb0bfc(var_248cbbcf)
{
	var_248cbbcf.player thread function_b8268bd6("body_pickup", self, undefined, 1);
}

/*
	Name: function_5654f611
	Namespace: namespace_5f6e61d9
	Checksum: 0x5F8DFF18
	Offset: 0xD38
	Size: 0x2B6
	Parameters: 1
	Flags: Linked
*/
function function_5654f611(body)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isentity(body));
	#/
	var_46abe989 = body.origin;
	if(!isai(body))
	{
		var_46abe989 = body getcorpsephysicsorigin();
	}
	result = {};
	if(isdefined(body.var_3e95b88f.prompts[#"use"]) && isdefined(body.var_3e95b88f.prompts[#"use"].tag))
	{
		var_46abe989 = body gettagorigin(body.var_3e95b88f.prompts[#"use"].tag);
	}
	result.base_origin = var_46abe989;
	result.origin = vectorlerp(self.origin, var_46abe989, 0.5);
	result.origin = (result.origin[0], result.origin[1], self.origin[2]);
	result.angles = (0, vectortoyaw(result.origin - self.origin), 0);
	traceorigin = playerphysicstrace(self.origin, result.origin);
	/#
		if(distancesquared(traceorigin, result.origin) > 0.0001)
		{
			delta = traceorigin - result.origin;
			iprintlnbold(((((("" + delta[0]) + "") + delta[1]) + "") + delta[2]) + "");
		}
	#/
	result.origin = traceorigin;
	return result;
}

/*
	Name: function_b8268bd6
	Namespace: namespace_5f6e61d9
	Checksum: 0x778871A7
	Offset: 0xFF8
	Size: 0x474
	Parameters: 4
	Flags: Linked
*/
function function_b8268bd6(action, victim, var_7318f7f0, var_65ff9d5a)
{
	self notify("421a6bca2547c56f");
	self endon("421a6bca2547c56f");
	self endoncallback(&function_39f2df3d, action.ender, #"hash_750a24acc68f40a1");
	bb::logplayermapnotification("body_pickup", self);
	self flag::set("body_pickup");
	self flag::set("in_action");
	self.var_9ebbaa46.active = 1;
	self.var_9ebbaa46.victim = victim;
	scene_root = spawnstruct();
	if(is_true(var_65ff9d5a))
	{
		bodymodel = self function_32d8a3e0(self.var_9ebbaa46.victim);
		var_6fbe856d = self function_5654f611(self.var_9ebbaa46.victim);
		self.takedown.body = bodymodel;
		scene = "bodycarry_pickup";
		if(var_6fbe856d.base_origin[2] - self.origin[2] > 20)
		{
			scene = "bodycarry_pickup_high";
		}
		scene_root.origin = var_6fbe856d.origin;
		scene_root.angles = var_6fbe856d.angles;
		if(isdefined(self.var_9ebbaa46.var_e0a97ac8))
		{
			scene_root = self.var_9ebbaa46.var_e0a97ac8;
		}
		if(isdefined(var_7318f7f0))
		{
			scene = var_7318f7f0;
		}
		override = self actions::function_abaa32c(action);
		if(isdefined(self.var_9ebbaa46.var_2e2edc53))
		{
			scene = self.var_9ebbaa46.var_2e2edc53;
			self.takedown.body.var_41c4e6d6 = 1;
			self val::set(#"hash_61125ef3dde6089f", "disable_weapons", 1);
		}
		else
		{
			self.takedown.body hide();
			self namespace_594b67e::function_3ceda691("ges_body_carry_pickup_finish", undefined, 1, 0);
		}
		scene_root namespace_594b67e::scene_play((isdefined(override.scene) ? override.scene : scene), self, self.takedown.body);
	}
	else
	{
		self namespace_594b67e::function_464d0412(undefined, undefined, undefined, 2);
		self.takedown.body = self.var_9ebbaa46.victim;
		self.takedown.body function_d374e33d();
		if(isdefined(self.takedown.body))
		{
			self.takedown.body thread namespace_594b67e::function_3f4de57b("body_carry" + "_enter");
		}
		if(isdefined(self.var_6639d45b))
		{
			self.var_6639d45b namespace_594b67e::function_3f4de57b("body_carry" + "_enter");
		}
		self thread function_ebce8b6([#"victim":self.takedown.body, #"player":self]);
	}
}

/*
	Name: function_8f7ba6c3
	Namespace: namespace_5f6e61d9
	Checksum: 0xEE687095
	Offset: 0x1478
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_8f7ba6c3(a_ents)
{
	if(isdefined(self.var_9ebbaa46.victim))
	{
		self.var_9ebbaa46.victim hide();
	}
}

/*
	Name: function_ebce8b6
	Namespace: namespace_5f6e61d9
	Checksum: 0x80E521EF
	Offset: 0x14C8
	Size: 0x3D6
	Parameters: 1
	Flags: Linked
*/
function function_ebce8b6(a_ents)
{
	player = getplayers()[0];
	if(is_true(player.takedown.body.var_41c4e6d6))
	{
		player val::reset_all(#"hash_61125ef3dde6089f");
		waitframe(1);
		player start_bodyshield_gesture();
	}
	override = player actions::function_abaa32c("body_carry");
	anim_name = (isdefined(override.anim_name) ? override.anim_name : "body_carry");
	if(isdefined(player.var_9ebbaa46.victim) && player.var_9ebbaa46.victim !== player.takedown.body)
	{
		player.var_9ebbaa46.victim delete();
	}
	player.takedown.body show();
	player.takedown.body namespace_594b67e::function_b82cae8f(2);
	player namespace_594b67e::function_464d0412(undefined, undefined, undefined, 2);
	player namespace_594b67e::function_2795d678(1, 1, 0, 0, [1:"cinematicmotion_body_carry_ads", 0:"cinematicmotion_body_carry"]);
	player thread function_9abb3f03(player.takedown.body);
	player playrumbleonentity(#"reload_medium");
	player util::delay(0.55, undefined, &playrumbleonentity, #"reload_large");
	if(!is_true(player.takedown.body.var_41c4e6d6))
	{
		if(isdefined(player.takedown.body))
		{
			player.takedown.body thread namespace_594b67e::function_3f4de57b(anim_name + "_pickup_finish");
		}
		if(isdefined(player.var_6639d45b))
		{
			player.var_6639d45b namespace_594b67e::function_3f4de57b(anim_name + "_pickup_finish");
		}
	}
	player flag::set("body_carry");
	player flag::clear("body_pickup");
	player thread function_e3789852(player.takedown.body);
	player thread function_f1aa7603(player.takedown.body);
	player.takedown.body.var_41c4e6d6 = undefined;
}

/*
	Name: function_e3789852
	Namespace: namespace_5f6e61d9
	Checksum: 0x79065048
	Offset: 0x18A8
	Size: 0xC6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e3789852(victim)
{
	self notify("61ce5061c1e4aeb3");
	self endon("61ce5061c1e4aeb3");
	/#
		assert(isplayer(self));
	#/
	self endon(#"death", #"hash_7c3b085512be9978");
	util::waittill_any_ents(level, "no_corpse_pickup", level, "drop_corpse", level, "prompts_disabled", self, "prompts_disabled");
	self notify(#"hash_4dff86580406a1af");
}

/*
	Name: function_f1aa7603
	Namespace: namespace_5f6e61d9
	Checksum: 0x3DDE32E6
	Offset: 0x1978
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f1aa7603(victim)
{
	self notify("12028de136f92897");
	self endon("12028de136f92897");
	/#
		assert(isplayer(self));
	#/
	self endon(#"hash_7c3b085512be9978");
	self waittill(#"death", #"hash_2b62b2990144ebf6");
	if(isentity(self.takedown.body))
	{
		self.takedown.body hide();
	}
}

/*
	Name: function_32d8a3e0
	Namespace: namespace_5f6e61d9
	Checksum: 0xDBEAE9E2
	Offset: 0x1A50
	Size: 0x1A0
	Parameters: 1
	Flags: Linked
*/
function function_32d8a3e0(victim)
{
	bodymodel = util::spawn_model(victim.aitype, victim.origin, victim.angles);
	bodymodel setmodel(victim.model);
	bodymodel.modelname = victim.model;
	bodymodel.ai_type = victim.aitype;
	bodymodel.var_b9c0ade5 = victim.var_b9c0ade5;
	bodymodel.animname = "generic";
	bodymodel.var_5b22d53 = 0;
	bodymodel detachall();
	for(i = 0; i < victim getattachsize(); i++)
	{
		bodymodel.attach_model[i] = victim getattachmodelname(i);
		bodymodel.attach_tag[i] = victim getattachtagname(i);
		bodymodel attach(bodymodel.attach_model[i], bodymodel.attach_tag[i]);
	}
	bodymodel function_d374e33d();
	bodymodel notsolid();
	return bodymodel;
}

/*
	Name: function_9abb3f03
	Namespace: namespace_5f6e61d9
	Checksum: 0xE75A3EB1
	Offset: 0x1BF8
	Size: 0x19C
	Parameters: 1
	Flags: Linked
*/
function function_9abb3f03(victim)
{
	button = #"stance";
	self prompts::create(button);
	self prompts::function_263320e2(button, #"hash_137214393a59c3a");
	self prompts::function_cd2391cb(button, "body_drop");
	self prompts::function_a4a9acfc(button, &function_c4fe1ef2);
	self prompts::function_8f5eb0a6(button, 0);
	self prompts::function_d03d79d6(button, 0);
	self prompts::function_3171730f(button, #"actions");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"body_drop", #"hash_4dff86580406a1af");
		if(!self function_c4fe1ef2() && waitresult._notify === "body_drop")
		{
			continue;
		}
		break;
	}
	self body_drop(victim);
}

/*
	Name: body_drop
	Namespace: namespace_5f6e61d9
	Checksum: 0xDAB0E4E8
	Offset: 0x1DA0
	Size: 0x484
	Parameters: 1
	Flags: Linked
*/
function body_drop(victim)
{
	self notify(#"hash_7c3b085512be9978");
	self prompts::remove(#"stance");
	self notify(#"hash_6e2a24679f8eca8e");
	bb::logplayermapnotification("body_drop", self);
	self namespace_594b67e::function_3ceda691("ges_body_carry_exit");
	override = self actions::function_abaa32c("body_carry");
	anim_name = (isdefined(override.anim_name) ? override.anim_name : "body_carry");
	if(isdefined(self.var_9ebbaa46.var_ea195798))
	{
		self val::set(#"hash_61125ef3dde6089f", "disable_weapons", 1);
		var_6407b282 = util::spawn_model(victim.model, victim.origin, victim.angles);
		for(i = 0; i < victim getattachsize(); i++)
		{
			var_6407b282 attach(victim getattachmodelname(i), victim getattachtagname(i), 1);
		}
		victim util::delay(0.1, undefined, &delete);
		victim = var_6407b282;
		self.var_9ebbaa46.var_d4f8dcdf namespace_594b67e::scene_play(self.var_9ebbaa46.var_ea195798, self, victim);
		self val::reset_all(#"hash_61125ef3dde6089f");
	}
	else
	{
		self playrumbleonentity(#"reload_small");
		self util::delay(0.55, undefined, &playrumbleonentity, #"reload_medium");
		var_a200b680 = self getplayerangles()[0];
		if(var_a200b680 <= -15 && !self namespace_594b67e::function_fdff1cf3())
		{
			self val::set(#"hash_bfef6b25e738297", "freezecontrols_allowlook", 1);
			self function_305446bc(-20);
		}
		else if(var_a200b680 >= 60 && !self namespace_594b67e::function_fdff1cf3(-30))
		{
			self val::set(#"hash_bfef6b25e738297", "freezecontrols_allowlook", 1);
			self function_305446bc(30);
		}
		if(isdefined(victim))
		{
			victim thread namespace_594b67e::function_3f4de57b(anim_name + "_drop");
		}
		if(isdefined(self.var_6639d45b))
		{
			self.var_6639d45b show();
			self.var_6639d45b namespace_594b67e::function_3f4de57b(anim_name + "_drop");
		}
		self val::reset_all(#"hash_bfef6b25e738297");
	}
	self thread function_ff5c9214([#"victim":victim, #"player":self]);
}

/*
	Name: function_305446bc
	Namespace: namespace_5f6e61d9
	Checksum: 0x77344D8E
	Offset: 0x2230
	Size: 0xEC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_305446bc(forward)
{
	if(!isdefined(forward))
	{
		forward = 20;
	}
	/#
		assert(isplayer(self));
	#/
	offset = vectorscale((0, 0, 1), 8);
	new_origin = playerphysicstrace(self.origin + offset, (self.origin + (anglestoforward(self.angles) * forward)) + offset);
	new_origin = playerphysicstrace(new_origin, new_origin - offset);
	self setorigin(new_origin);
}

/*
	Name: function_ff5c9214
	Namespace: namespace_5f6e61d9
	Checksum: 0xE85F8936
	Offset: 0x2328
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_ff5c9214(a_ents)
{
	self actions::function_942d9213();
	player = getplayers()[0];
	victim = a_ents[#"victim"];
	player namespace_594b67e::function_2795d678(0);
	if(isdefined(victim) && !iscorpse(victim))
	{
		victim namespace_594b67e::become_corpse();
	}
	player.var_9ebbaa46.active = undefined;
	player notify(#"hash_51c6ae96a7e40432");
	player flag::clear("body_carry");
	player flag::clear("body_pickup");
	player flag::clear("in_action");
	prompts::function_398ab9eb();
}

/*
	Name: start_bodyshield_gesture
	Namespace: namespace_5f6e61d9
	Checksum: 0x48E5F8E9
	Offset: 0x2478
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function start_bodyshield_gesture(a_ents)
{
	getplayers()[0] thread namespace_6cecf2d8::function_756e29bb(level.var_f467e5b0.actions[#"body_carry"], "body_carry", undefined, undefined, undefined, 0);
}

/*
	Name: function_39f2df3d
	Namespace: namespace_5f6e61d9
	Checksum: 0x4C5D6F21
	Offset: 0x24E8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_39f2df3d(notifyhash)
{
	self namespace_594b67e::function_2795d678(0);
	self.var_9ebbaa46.active = undefined;
	self actions::function_942d9213();
}

/*
	Name: function_145a8b5a
	Namespace: namespace_5f6e61d9
	Checksum: 0xD5469843
	Offset: 0x2538
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function function_145a8b5a(b_disable)
{
	if(!isdefined(b_disable))
	{
		b_disable = 1;
	}
	self.var_9ebbaa46.var_87788f85 = (b_disable ? 1 : undefined);
}

/*
	Name: function_cad84e26
	Namespace: namespace_5f6e61d9
	Checksum: 0x57B55BB
	Offset: 0x2580
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function function_cad84e26()
{
	if(is_true(self.var_9ebbaa46.active))
	{
		return true;
	}
	return false;
}

/*
	Name: function_694887dc
	Namespace: namespace_5f6e61d9
	Checksum: 0xE0C07543
	Offset: 0x25B8
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function function_694887dc(var_2e2edc53, var_e0a97ac8)
{
	if(!isdefined(var_e0a97ac8))
	{
		var_e0a97ac8 = level;
	}
	if(isdefined(var_2e2edc53))
	{
		self.var_9ebbaa46.var_2e2edc53 = var_2e2edc53;
		self.var_9ebbaa46.var_e0a97ac8 = var_e0a97ac8;
		scene::add_scene_func(var_2e2edc53, &function_ebce8b6, "done");
	}
}

/*
	Name: function_461dbe2a
	Namespace: namespace_5f6e61d9
	Checksum: 0x2899148
	Offset: 0x2640
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function function_461dbe2a()
{
	if(isdefined(self.var_9ebbaa46.var_2e2edc53))
	{
		self.var_9ebbaa46.var_2e2edc53 = undefined;
		self.var_9ebbaa46.var_e0a97ac8 = undefined;
	}
}

/*
	Name: function_d0cb2574
	Namespace: namespace_5f6e61d9
	Checksum: 0x2E5EB5DB
	Offset: 0x2680
	Size: 0x52
	Parameters: 2
	Flags: None
*/
function function_d0cb2574(var_ea195798, var_d4f8dcdf)
{
	if(!isdefined(var_d4f8dcdf))
	{
		var_d4f8dcdf = level;
	}
	if(isdefined(var_ea195798))
	{
		self.var_9ebbaa46.var_ea195798 = var_ea195798;
		self.var_9ebbaa46.var_d4f8dcdf = var_d4f8dcdf;
	}
}

/*
	Name: function_b5b485f1
	Namespace: namespace_5f6e61d9
	Checksum: 0x9AD116A6
	Offset: 0x26E0
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function function_b5b485f1()
{
	if(isdefined(self.var_9ebbaa46.var_ea195798))
	{
		self.var_9ebbaa46.var_ea195798 = undefined;
		self.var_9ebbaa46.var_d4f8dcdf = undefined;
	}
}

