#using script_3dc93ca9902a9cda;
#using scripts\cp_common\bb.gsc;
#using script_267e1d16ae28392b;
#using script_7d0013bbc05623b9;
#using script_3d18e87594285298;
#using script_52da18c20f45c56a;
#using script_5431e074c1428743;
#using script_3626f1b2cf51a99c;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_6cecf2d8;

/*
	Name: __init__system__
	Namespace: namespace_6cecf2d8
	Checksum: 0x4316789D
	Offset: 0x3C0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7ee44bf733d7a7ac", &function_70a657d8, undefined, undefined, #"hash_7e93e9089f28804f");
}

/*
	Name: function_70a657d8
	Namespace: namespace_6cecf2d8
	Checksum: 0xD36A94F7
	Offset: 0x410
	Size: 0xAC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.body_shield))
	{
		level.body_shield = spawnstruct();
		actions::function_9ddfe2d("body_shield", &function_53e50b40, "takedown", "grab");
		actions::function_b1543a9d("body_shield", "td_anims_body_shield");
		animation::add_global_notetrack_handler("start_bodyshield_gesture", &function_89295627, 0);
	}
}

/*
	Name: function_53e50b40
	Namespace: namespace_6cecf2d8
	Checksum: 0x986F42A5
	Offset: 0x4C8
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function function_53e50b40(action)
{
	self endon(action.ender);
	if(is_true(self actions::function_83bde308(action)))
	{
		if(self.takedown.var_67582ca5.var_f467e5b0.enabled[#"body_shield"] === 0)
		{
			return false;
		}
		self thread function_e3e4c03c(action, self.takedown.var_67582ca5);
		self.takedown.var_67582ca5 = undefined;
		return true;
	}
	return false;
}

/*
	Name: function_e3e4c03c
	Namespace: namespace_6cecf2d8
	Checksum: 0xD48301C1
	Offset: 0x598
	Size: 0x694
	Parameters: 2
	Flags: None
*/
function function_e3e4c03c(action, body)
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(action))
	{
		action = level.var_f467e5b0.actions[#"body_shield"];
	}
	if(isalive(body))
	{
		if(body scene::function_c935c42())
		{
			[[ body._scene_object._o_scene ]]->stop();
		}
		body stopanimscripted();
	}
	if(!isalive(body))
	{
		self actions::function_942d9213();
		return;
	}
	bb::logplayermapnotification("bodyshield_grab", self);
	var_2dcf841c = self actions::function_abaa32c("body_shield");
	if(!isdefined(var_2dcf841c))
	{
		var_2dcf841c = namespace_9c83b58d::function_3c43bd2a(action, body, self);
	}
	if(!isdefined(var_2dcf841c.scene))
	{
		return;
	}
	self thread function_257c21b5(action);
	self flag::set("body_shield_active");
	self flag::set("body_shield_gun_up");
	self.var_d3b4e4f4 = &function_fc288808;
	self.var_852e84c9 = &actions::function_e972f9a5;
	if(!isdefined(self.takedown))
	{
		self.takedown = spawnstruct();
	}
	self.takedown.body_shield = spawnstruct();
	self.takedown.body_shield.model = body.model;
	self.takedown.body_shield.classname = body.classname;
	self.takedown.body_shield.spawner = body.spawner;
	self.takedown.body_shield.weapons = body.weapons;
	self.takedown.body_shield.aitype = body.aitype;
	self.takedown.body_shield.health = 70;
	self.takedown.body_shield.healthmax = self.takedown.body_shield.health;
	self.takedown.body_shield.var_70faf312 = self.takedown.body_shield.health;
	self.takedown.body_shield.var_ea2da6bc = gettime();
	if(isai(body))
	{
		self.takedown.body_shield.actor = body;
		body notify(#"takedown_executed");
	}
	for(i = 0; i < body getattachsize(); i++)
	{
		self.takedown.body_shield.attach_model[i] = body getattachmodelname(i);
		self.takedown.body_shield.attach_tag[i] = body getattachtagname(i);
	}
	self notify(#"stop_disable_weapons_offscreen");
	self namespace_594b67e::allow_weapon(0);
	self.takedown.body = body;
	scene_root = (isdefined(var_2dcf841c.scene_root) ? var_2dcf841c.scene_root : self namespace_9c83b58d::function_5169db86());
	if(!isdefined(self.takedown.body.animname))
	{
		self.takedown.body.animname = "generic";
	}
	self.takedown.body.var_69defa17 = 1;
	self.takedown.body show();
	self.takedown.body util::delay(0.2, undefined, &prompts::function_ee7adae5, #"actions");
	self util::delay(0.5, undefined, &function_40622d99);
	self util::delay(0.2, undefined, &val::set, #"action", "takedamage", 0);
	scene_root namespace_594b67e::scene_play(var_2dcf841c.scene, self, body);
	self thread namespace_594b67e::function_d76eed10(action);
	self namespace_594b67e::function_464d0412();
	if(body !== self.takedown.body)
	{
		body delete();
	}
	self.in_melee_death = undefined;
	self thread function_a8501d78(action);
}

/*
	Name: function_40622d99
	Namespace: namespace_6cecf2d8
	Checksum: 0x54007A1A
	Offset: 0xC38
	Size: 0xEC
	Parameters: 0
	Flags: Private
*/
function private function_40622d99()
{
	/#
		assert(isplayer(self));
	#/
	self endon(#"death", #"disconnect");
	var_62ba1300 = self namespace_594b67e::function_1a2a3654();
	if(var_62ba1300 !== self getcurrentweapon())
	{
		self switchtoweaponimmediate(var_62ba1300);
		while(self getcurrentweapon() !== var_62ba1300)
		{
			waitframe(1);
		}
		self namespace_594b67e::function_3ceda691(self.var_621f8539, undefined, undefined, undefined, undefined, 1);
	}
}

/*
	Name: function_ead8fde7
	Namespace: namespace_6cecf2d8
	Checksum: 0xBA9B2ECC
	Offset: 0xD30
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function function_ead8fde7(active)
{
	self.var_108942e2 = (is_true(active) ? 1 : undefined);
}

/*
	Name: function_fc288808
	Namespace: namespace_6cecf2d8
	Checksum: 0x5898DB87
	Offset: 0xD78
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_fc288808(quick)
{
	if(self flag::get("body_shield_gun_up"))
	{
		self namespace_594b67e::allow_weapon(1, 1, self namespace_594b67e::function_98f117ad("ges_body_shield"));
	}
	else
	{
		self namespace_594b67e::allow_weapon(1, 1);
	}
}

/*
	Name: function_a8501d78
	Namespace: namespace_6cecf2d8
	Checksum: 0xD59B3181
	Offset: 0xE08
	Size: 0x34C
	Parameters: 1
	Flags: None
*/
function function_a8501d78(action)
{
	self endon(action.ender);
	/#
		assert(isplayer(self));
	#/
	self flag::clear("body_shield_gun_up");
	self namespace_594b67e::function_e2fcacb2(3);
	achievements::function_533e57d6(self, 1);
	override = self actions::function_abaa32c("body_shield");
	var_df227d8a = actions::function_1028d928(action.name, "a");
	if(var_df227d8a)
	{
		self childthread namespace_e1cd3aae::function_d521a78f();
	}
	self function_ead8fde7(action.name == "body_shield");
	self val::set(#"action", "takedamage", 1);
	self namespace_594b67e::allow_weapon(1);
	self namespace_594b67e::function_2795d678(1, 1, 0, 0, [1:"cinematicmotion_body_shield_ads", 0:"cinematicmotion_body_shield"]);
	self.takedown.body_shield.actor namespace_594b67e::function_35d0bd11(1);
	self.takedown.body show();
	self.takedown.body linkto(self, "tag_origin", vectorscale((-1, 0, 0), 1000), (0, 0, 0));
	self.takedown.body namespace_594b67e::function_b82cae8f(1);
	self thread function_756e29bb(action, (isdefined(override.anim_name) ? override.anim_name : action.anim_name));
	self.takedown.scene_root = undefined;
	self childthread function_c6059aa(action);
	self childthread function_c13ab5c7(action);
	self childthread function_7acc6ae7(action);
	self childthread function_e98922fb(action);
	if(var_df227d8a)
	{
		self util::delay(0.2, undefined, &actions::function_3af7d065, 1);
	}
}

/*
	Name: function_89295627
	Namespace: namespace_6cecf2d8
	Checksum: 0xD1A528BF
	Offset: 0x1160
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_89295627()
{
	player = getplayers()[0];
}

/*
	Name: function_756e29bb
	Namespace: namespace_6cecf2d8
	Checksum: 0x1388907F
	Offset: 0x1190
	Size: 0x4C0
	Parameters: 6
	Flags: None
*/
function function_756e29bb(action, anim_name, var_c09e9b1c, var_d60fb210, var_2e7da7fb, var_7369af2b)
{
	self notify("106adabc0e6e600b");
	self endon("106adabc0e6e600b");
	self endoncallback(&function_d6fbc26, action.ender, #"hash_6e2a24679f8eca8e");
	if(isdefined(var_d60fb210))
	{
		self endon(var_d60fb210);
	}
	self.var_de5476af = undefined;
	self.var_a7f1f0d6 = undefined;
	transtime = (isdefined(var_7369af2b) ? var_7369af2b : 0.05);
	weapon = self getcurrentweapon();
	var_36a368e3 = "ges_body_shield";
	if(isdefined(var_c09e9b1c))
	{
		var_36a368e3 = var_c09e9b1c;
	}
	gesture = self namespace_594b67e::function_98f117ad(var_36a368e3);
	var_991552e7 = self namespace_594b67e::function_98f117ad(var_36a368e3, "ads");
	firstframe = 1;
	self thread namespace_594b67e::function_6e8e5902(action.ender);
	self childthread function_2513e926(action);
	if(!is_true(var_2e7da7fb))
	{
		self childthread function_80f856a8(action, anim_name, var_7369af2b);
	}
	self childthread function_8ebed231(action);
	while(true)
	{
		adspressed = self namespace_594b67e::function_29fd0abd();
		iswalking = self namespace_594b67e::is_walking();
		doreload = self function_1dcff2c3(weapon);
		if(!doreload && (adspressed !== self.var_de5476af || iswalking !== self.var_a7f1f0d6))
		{
			var_adb7de30 = undefined;
			if(adspressed !== self.var_de5476af)
			{
				if(adspressed)
				{
					self namespace_594b67e::function_3ceda691(var_991552e7, undefined, 1, transtime);
					self.takedown.gesture = var_991552e7;
					if(isdefined(self.var_de5476af))
					{
						var_adb7de30 = "_ads_in";
					}
				}
				else
				{
					self namespace_594b67e::function_3ceda691(gesture, undefined, 1, transtime);
					self.takedown.gesture = gesture;
					if(isdefined(self.var_de5476af))
					{
						var_adb7de30 = "_ads_out";
					}
				}
			}
			self.var_de5476af = adspressed;
			self.var_a7f1f0d6 = iswalking;
			if(!is_true(var_2e7da7fb))
			{
				transtime = 0.2;
				if(firstframe)
				{
					firstframe = 0;
					waitframe(1);
					continue;
				}
				if(isdefined(var_adb7de30))
				{
					if(isdefined(self.takedown.body))
					{
						self.takedown.body thread namespace_594b67e::function_3f4de57b(anim_name + var_adb7de30);
					}
					if(isdefined(self.var_6639d45b))
					{
						if(doreload)
						{
							self.var_6639d45b thread namespace_594b67e::function_3f4de57b(anim_name + var_adb7de30);
						}
						else
						{
							self.var_6639d45b namespace_594b67e::function_3f4de57b(anim_name + var_adb7de30);
						}
					}
					self.var_a7f1f0d6 = undefined;
				}
			}
		}
		if(doreload)
		{
			self function_501ef65d(weapon);
			self namespace_594b67e::gesture_stop(var_991552e7, 0, 1);
			self namespace_594b67e::gesture_stop(gesture, 0, 1);
			self.var_de5476af = undefined;
			self.var_a7f1f0d6 = undefined;
		}
		waitframe(1);
	}
}

/*
	Name: function_2513e926
	Namespace: namespace_6cecf2d8
	Checksum: 0x23049157
	Offset: 0x1658
	Size: 0x46
	Parameters: 1
	Flags: None
*/
function function_2513e926(action)
{
	while(true)
	{
		self thread namespace_594b67e::function_1c2992ed(self namespace_594b67e::function_29fd0abd());
		waitframe(1);
	}
}

/*
	Name: function_80f856a8
	Namespace: namespace_6cecf2d8
	Checksum: 0x45D89DD4
	Offset: 0x16A8
	Size: 0xFC
	Parameters: 3
	Flags: None
*/
function function_80f856a8(action, anim_name, var_7369af2b)
{
	firstframe = 1;
	while(true)
	{
		loop_anim = namespace_594b67e::function_47ffa6b8(var_7369af2b);
		if(!isdefined(self.var_6639d45b.var_3f4de57b))
		{
			blendtime = (firstframe ? 0 : undefined);
			if(isdefined(self.takedown.body))
			{
				self.takedown.body thread namespace_594b67e::function_d621e6d6(loop_anim, blendtime);
			}
			if(isdefined(self.var_6639d45b))
			{
				self.var_6639d45b thread namespace_594b67e::function_d621e6d6(loop_anim, blendtime);
			}
		}
		firstframe = 0;
		waitframe(1);
	}
}

/*
	Name: function_d6fbc26
	Namespace: namespace_6cecf2d8
	Checksum: 0x38DCECF4
	Offset: 0x17B0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_d6fbc26(params)
{
	self thread namespace_594b67e::function_1c2992ed(0);
}

/*
	Name: function_8ebed231
	Namespace: namespace_6cecf2d8
	Checksum: 0x3425F4E3
	Offset: 0x17E0
	Size: 0x13E
	Parameters: 1
	Flags: None
*/
function function_8ebed231(action)
{
	visible = 1;
	while(true)
	{
		var_2d6631c2 = 1;
		if(self flag::get("snipercam"))
		{
			var_2d6631c2 = 0;
		}
		if(var_2d6631c2 != visible)
		{
			if(var_2d6631c2)
			{
				if(isdefined(self.takedown.body))
				{
					self.takedown.body show();
				}
				if(isdefined(self.var_6639d45b))
				{
					self.var_6639d45b show();
				}
			}
			else
			{
				if(isdefined(self.takedown.body))
				{
					self.takedown.body hide();
				}
				if(isdefined(self.var_6639d45b))
				{
					self.var_6639d45b hide();
				}
			}
			visible = var_2d6631c2;
		}
		waitframe(1);
	}
}

/*
	Name: function_501ef65d
	Namespace: namespace_6cecf2d8
	Checksum: 0xDE87C08F
	Offset: 0x1928
	Size: 0x2B4
	Parameters: 1
	Flags: None
*/
function function_501ef65d(weapon)
{
	self namespace_594b67e::allow_weapon(0, undefined, "ges_body_shield_reload");
	ammo_in_stock = self getweaponammostock(weapon);
	ammo_in_clip = self getweaponammoclip(weapon);
	wait(0.5);
	switch(weapon.weapclass)
	{
		case "pistol":
		{
			snd::play("fly_bodyshield_reload_pistol");
			wait(0.5);
			break;
		}
		case "smg":
		{
			snd::play("fly_bodyshield_reload_smg");
			wait(0.7);
			break;
		}
		case "rifle":
		{
			snd::play("fly_bodyshield_reload_rifle");
			wait(0.7);
			break;
		}
		case "sniper":
		{
			snd::play("fly_bodyshield_reload_smg");
			wait(1);
			break;
		}
		case "shotgun":
		{
			snd::play("fly_bodyshield_reload_shotgun");
			wait(1);
			break;
		}
		default:
		{
			snd::play("fly_bodyshield_reload_lmg");
			wait(2);
			break;
		}
	}
	delta = min(ammo_in_stock, weapon.clipsize - ammo_in_clip);
	if(self hasweapon(weapon))
	{
		self setweaponammoclip(weapon, int(ammo_in_clip + delta));
		self setweaponammostock(weapon, int(ammo_in_stock - delta));
	}
	self namespace_594b67e::allow_weapon(1);
}

/*
	Name: function_1dcff2c3
	Namespace: namespace_6cecf2d8
	Checksum: 0x481E3A43
	Offset: 0x1BE8
	Size: 0x1E8
	Parameters: 1
	Flags: None
*/
function function_1dcff2c3(weapon)
{
	if(!isdefined(self.takedown.var_6cf436f))
	{
		self.takedown.var_6cf436f = 0;
	}
	clip_size = weapon.clipsize;
	ammo_in_clip = self getweaponammoclip(weapon);
	ammo_in_stock = self getweaponammostock(weapon);
	var_b8b29a85 = ammo_in_stock > 0 && ammo_in_clip < clip_size;
	self.takedown.var_6bd335ce = var_b8b29a85 && ammo_in_clip < (clip_size * 0.33);
	if(ammo_in_clip == 0)
	{
		self.takedown.var_6cf436f = self.takedown.var_6cf436f + (float(function_60d95f53()) / 1000);
	}
	else
	{
		self.takedown.var_6cf436f = 0;
	}
	doreload = var_b8b29a85 && (self.takedown.var_6cf436f > 0.2 || self reloadbuttonpressed());
	if((isdefined(weapon.maxammo) ? weapon.maxammo : 0) > 0 && ammo_in_stock == 0 && ammo_in_clip == 0)
	{
		self actions::function_8488e359("stance");
	}
	return doreload;
}

/*
	Name: function_f6dd3d45
	Namespace: namespace_6cecf2d8
	Checksum: 0x5FABC83B
	Offset: 0x1DD8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_f6dd3d45(var_248cbbcf)
{
	return isdefined(self.takedown.var_6bd335ce) && is_true(self.takedown.var_6bd335ce);
}

/*
	Name: function_9c53ef0a
	Namespace: namespace_6cecf2d8
	Checksum: 0x3D75F422
	Offset: 0x1E28
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_9c53ef0a()
{
	self function_f077863a("ges_body_shield_rifle");
	self function_f077863a("ges_body_shield_rifle_ads");
	self function_f077863a("ges_body_shield_rpg_ads");
	self notify(#"hash_6e2a24679f8eca8e");
	self namespace_594b67e::gesture_stop();
}

/*
	Name: function_257c21b5
	Namespace: namespace_6cecf2d8
	Checksum: 0x518BE39F
	Offset: 0x1EC0
	Size: 0x156
	Parameters: 2
	Flags: None
*/
function function_257c21b5(action, immediate)
{
	self endon(#"hash_28d504c4e7c5eef0");
	if(!is_true(immediate))
	{
		self waittill(action.ender);
	}
	self prompts::remove(#"reload");
	self function_ead8fde7(0);
	self.var_de5476af = undefined;
	self.var_a7f1f0d6 = undefined;
	self function_9c53ef0a();
	self val::reset_all(#"action");
	self namespace_594b67e::function_e2fcacb2(3);
	self flag::clear("body_shield_active");
	self.in_melee_death = undefined;
	if(is_true(action.var_43769020))
	{
		namespace_594b67e::function_3fbe0931(action);
	}
	self notify(#"hash_28d504c4e7c5eef0");
}

/*
	Name: function_f077863a
	Namespace: namespace_6cecf2d8
	Checksum: 0xA7ED9CF5
	Offset: 0x2020
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_f077863a(gesture)
{
	if(isdefined(self.takedown.var_b8302c5e) && self.takedown.var_b8302c5e == gesture)
	{
		self.takedown.var_b8302c5e = undefined;
		return;
	}
	self namespace_594b67e::gesture_stop(gesture, 0.01, 1);
}

/*
	Name: function_7acc6ae7
	Namespace: namespace_6cecf2d8
	Checksum: 0xEAAFB023
	Offset: 0x20A0
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_7acc6ae7(action)
{
	self endon(action.ender, #"hash_2d036a7855e382b1");
	self waittill(#"death", #"hash_2b62b2990144ebf6");
	if(isdefined(self.takedown.body))
	{
		self.takedown.body hide();
	}
	self namespace_594b67e::function_76e2ec80();
}

/*
	Name: function_c13ab5c7
	Namespace: namespace_6cecf2d8
	Checksum: 0x752A4375
	Offset: 0x2148
	Size: 0x300
	Parameters: 1
	Flags: None
*/
function function_c13ab5c7(action)
{
	self endon(action.ender, #"hash_2d036a7855e382b1");
	while(true)
	{
		result = undefined;
		result = self waittill(#"body_shield_damage");
		min_time = 2;
		var_365d33af = 300;
		var_6f8dfb10 = self.takedown.body_shield.healthmax / min_time;
		var_7ac1bcf6 = var_6f8dfb10 / (1000 / float(var_365d33af));
		new_health = self.takedown.body_shield.health - result.idamage;
		new_health = max(new_health, self.takedown.body_shield.var_70faf312 - var_7ac1bcf6);
		if(gettime() - self.takedown.body_shield.var_ea2da6bc > var_365d33af)
		{
			self.takedown.body_shield.var_70faf312 = new_health;
			self.takedown.body_shield.var_ea2da6bc = gettime();
		}
		self.takedown.body_shield.var_13356219 = 1;
		self.takedown.body_shield.health = new_health;
		self notify(#"hash_3cc22522d66c35f8");
		playfx("blood/fx9_takedowns_blood_bdyshld_impact_rnr", result.vpoint, anglestoforward(self.angles), anglestoup(self.angles));
		screenshake(self.origin, randomintrange(1, 2), 0, 0, 0.5, 0, 0.5, 0, 5, 0, 0, 2);
		snd::play("evt_sys_cp_bodyshield_impact", level.player);
		thread function_a74e8dd3();
		if(self.takedown.body_shield.health <= 0)
		{
			self notify(#"hash_244459f2eb8f0a38");
			return;
		}
		self childthread namespace_594b67e::function_aee5f6a6("body_shield");
	}
}

/*
	Name: function_e98922fb
	Namespace: namespace_6cecf2d8
	Checksum: 0x424CD1CF
	Offset: 0x2450
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function function_e98922fb(action)
{
	self endon(action.ender, #"hash_2d036a7855e382b1");
	wait(5);
	while(true)
	{
		result = undefined;
		result = self waittilltimeout(1, #"body_shield_damage");
		if(result._notify != "body_shield_damage")
		{
			self.takedown.body_shield.health = self.takedown.body_shield.health - 7;
			self.takedown.body_shield.var_70faf312 = self.takedown.body_shield.health;
			self.takedown.body_shield.var_ea2da6bc = gettime();
			self notify(#"hash_3cc22522d66c35f8");
			if(self.takedown.body_shield.health <= 0)
			{
				self notify(#"hash_244459f2eb8f0a38");
				return;
			}
		}
	}
}

/*
	Name: function_bec58af5
	Namespace: namespace_6cecf2d8
	Checksum: 0xC923719E
	Offset: 0x2598
	Size: 0x9A
	Parameters: 0
	Flags: None
*/
function function_bec58af5()
{
	/#
		assert(isplayer(self));
	#/
	if(isdefined(self.takedown.body_shield) && isdefined(self.takedown.body_shield.actor))
	{
		self.takedown.body_shield.actor delete();
		self.takedown.body_shield.actor = undefined;
	}
}

/*
	Name: function_9fa1a484
	Namespace: namespace_6cecf2d8
	Checksum: 0x6B5069DE
	Offset: 0x2640
	Size: 0xAA
	Parameters: 0
	Flags: None
*/
function function_9fa1a484()
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.takedown.body_shield.actor))
	{
		return;
	}
	if(!self flag::get("body_shield_active"))
	{
		return;
	}
	self.takedown.body_shield.actor delete();
	self waittill(#"hash_2a87a221154d292");
}

/*
	Name: function_b25119b6
	Namespace: namespace_6cecf2d8
	Checksum: 0xEC6179E5
	Offset: 0x26F8
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_b25119b6(action)
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.takedown.body_shield))
	{
		return;
	}
	if(!self flag::get("body_shield_active"))
	{
		return;
	}
	self function_bec58af5();
	self function_257c21b5(action, 1);
	self.takedown.body delete();
	self.takedown.body = undefined;
	self namespace_594b67e::function_2795d678(0);
	self actions::function_942d9213();
}

/*
	Name: function_c6059aa
	Namespace: namespace_6cecf2d8
	Checksum: 0x6E096EBF
	Offset: 0x2800
	Size: 0xEE
	Parameters: 1
	Flags: None
*/
function function_c6059aa(action)
{
	self endon(#"death", action.ender);
	self prompts::function_82cf95d9(#"hash_24279f7ed6cd096c");
	while(true)
	{
		var_4109ff8e = self.takedown.body_shield.health / self.takedown.body_shield.healthmax;
		self prompts::function_b1cfa4bc(var_4109ff8e);
		if(var_4109ff8e <= 0)
		{
			self prompts::function_82cf95d9(#"hash_61bd6e94a9b1f44e");
			break;
		}
		self waittill(#"hash_3cc22522d66c35f8");
	}
}

/*
	Name: function_a74e8dd3
	Namespace: namespace_6cecf2d8
	Checksum: 0xAFF56EA0
	Offset: 0x28F8
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_a74e8dd3()
{
	waittime = randomfloatrange(0.2, 0.6);
	wait(waittime);
	snd::play("evt_sys_cp_bodyshield_impact_gore", level.player);
}

