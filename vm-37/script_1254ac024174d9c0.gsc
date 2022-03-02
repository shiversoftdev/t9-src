#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_pack_a_punch.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_497ab7da;

/*
	Name: function_89f2df9
	Namespace: namespace_497ab7da
	Checksum: 0x8930B245
	Offset: 0x3C8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_42f44652a16988d8", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_497ab7da
	Checksum: 0x6EC029F1
	Offset: 0x410
	Size: 0x1F4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	if(util::function_53bbf9d2() === "zm_red")
	{
		level.var_b5079c7c = array("exp_lgt_ar_accurate_t8", "exp_lgt_ar_fastfire_t8", "exp_lgt_ar_modular_t8", "exp_lgt_ar_stealth_t8", "exp_lgt_bowie", "exp_lgt_lmg_standard_t8", "exp_lgt_pistol_revolver_t8", "exp_lgt_pistol_standard_t8", "exp_lgt_shotgun_pump_t8", "exp_lgt_shotgun_trenchgun_t8", "exp_lgt_smg_accurate_t8", "exp_lgt_smg_fastfire_t8", "exp_lgt_smg_handling_t8", "exp_lgt_smg_standard_t8", "exp_lgt_sniper_quickscope_t8", "exp_lgt_tr_leveraction_t8", "exp_lgt_tr_longburst_t8", "exp_lgt_tr_powersemi_t8");
	}
	else
	{
		level.var_b5079c7c = array("exp_lgt_ar_accurate_t8", "exp_lgt_ar_fastfire_t8", "exp_lgt_ar_modular_t8", "exp_lgt_ar_stealth_t8", "exp_lgt_ar_stealth_t8_2", "exp_lgt_bowie", "exp_lgt_bowie_2", "exp_lgt_lmg_standard_t8", "exp_lgt_pistol_burst_t8", "exp_lgt_pistol_standard_t8", "exp_lgt_shotgun_pump_t8", "exp_lgt_shotgun_trenchgun_t8", "exp_lgt_smg_accurate_t8", "exp_lgt_smg_accurate_t8_2", "exp_lgt_smg_drum_pistol_t8", "exp_lgt_smg_fastfire_t8", "exp_lgt_smg_handling_t8", "exp_lgt_smg_standard_t8", "exp_lgt_sniper_quickscope_t8", "exp_lgt_tr_leveraction_t8", "exp_lgt_tr_longburst_t8", "exp_lgt_tr_powersemi_t8");
	}
	zm_trial::register_challenge(#"hash_347b44dd26e1875", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_497ab7da
	Checksum: 0x37BECB62
	Offset: 0x610
	Size: 0xDC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d1de6a85(var_a29299fb)
{
	if(!is_true(level.var_9d606cae))
	{
		level.var_9d606cae = 1;
		level notify(#"hash_347b44dd26e1875");
		function_6fd56055();
		function_a4284cb4();
		function_47c81160();
		namespace_b22c99a5::function_eea26e56();
		level.var_a29299fb = var_a29299fb;
		if(!isdefined(level.var_a29299fb))
		{
			function_d5e17413();
		}
		namespace_b22c99a5::function_8036c103();
		function_ffdd5310();
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_497ab7da
	Checksum: 0x9EB22429
	Offset: 0x6F8
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9e7b3f4d(round_reset)
{
	/#
		assert(is_true(level.var_9d606cae));
	#/
	if(!round_reset)
	{
		function_fa70c8c4();
		function_c606ef4b();
		function_d7ee2133();
		namespace_b22c99a5::function_ef1fce77();
		function_c348adcc();
		namespace_b22c99a5::function_302c6014();
		level.var_9d606cae = undefined;
		function_c0da518d();
	}
}

/*
	Name: is_active
	Namespace: namespace_497ab7da
	Checksum: 0xD8C8B77E
	Offset: 0x7C8
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_347b44dd26e1875");
	return isdefined(challenge);
}

/*
	Name: function_8327d26e
	Namespace: namespace_497ab7da
	Checksum: 0xEFCC3357
	Offset: 0x808
	Size: 0x176
	Parameters: 0
	Flags: Linked
*/
function function_8327d26e()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	self endon(#"chest_accessed");
	self.var_7672d70d = 0;
	if(isdefined(self.zbarrier))
	{
		self.zbarrier.var_7672d70d = 0;
	}
	level waittill(#"hash_347b44dd26e1875");
	if(level flag::get("moving_chest_now"))
	{
		return;
	}
	self.var_7672d70d = 1;
	if(isdefined(self.zbarrier))
	{
		self.zbarrier.var_7672d70d = 1;
		self.zbarrier notify(#"box_hacked_respin");
		if(isdefined(self.zbarrier.weapon_model))
		{
			self.zbarrier.weapon_model notify(#"kill_weapon_movement");
		}
		if(isdefined(self.zbarrier.weapon_model_dw))
		{
			self.zbarrier.weapon_model_dw notify(#"kill_weapon_movement");
		}
	}
	wait(0.1);
	self notify(#"trigger", {#activator:level});
}

/*
	Name: function_6fd56055
	Namespace: namespace_497ab7da
	Checksum: 0x8112A383
	Offset: 0x988
	Size: 0x2D8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6fd56055()
{
	/#
		assert(isdefined(level._spawned_wallbuys));
	#/
	foreach(wallbuy in level._spawned_wallbuys)
	{
		target_struct = struct::get(wallbuy.target, "targetname");
		if(isdefined(target_struct) && isdefined(target_struct.target))
		{
			wallbuy_fx = getent(target_struct.target, "targetname");
			if(isdefined(wallbuy_fx))
			{
				wallbuy_fx ghost();
			}
		}
		model = struct::get(wallbuy.target, "targetname");
		if(isdefined(model) && isdefined(model.target))
		{
			var_393a819e = getent(model.target, "targetname");
			if(isdefined(var_393a819e))
			{
				var_393a819e ghost();
			}
		}
		if(isdefined(wallbuy.trigger_stub) && isdefined(wallbuy.trigger_stub.clientfieldname))
		{
			/#
				assert(!isdefined(wallbuy.var_d6cca569));
			#/
			wallbuy.var_d6cca569 = level clientfield::get(wallbuy.trigger_stub.clientfieldname);
			level clientfield::set(wallbuy.trigger_stub.clientfieldname, 0);
		}
	}
	foreach(var_2b84085b in level.var_b5079c7c)
	{
		level exploder::exploder(var_2b84085b);
	}
}

/*
	Name: function_fa70c8c4
	Namespace: namespace_497ab7da
	Checksum: 0x648EE9F
	Offset: 0xC68
	Size: 0x2B8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fa70c8c4()
{
	/#
		assert(isdefined(level._spawned_wallbuys));
	#/
	foreach(wallbuy in level._spawned_wallbuys)
	{
		target_struct = struct::get(wallbuy.target, "targetname");
		if(isdefined(target_struct) && isdefined(target_struct.target))
		{
			wallbuy_fx = getent(target_struct.target, "targetname");
			if(isdefined(wallbuy_fx))
			{
				wallbuy_fx show();
			}
		}
		model = struct::get(wallbuy.target, "targetname");
		if(isdefined(model) && isdefined(model.target))
		{
			var_393a819e = getent(model.target, "targetname");
			if(isdefined(var_393a819e))
			{
				var_393a819e show();
			}
		}
		if(isdefined(wallbuy.trigger_stub) && isdefined(wallbuy.trigger_stub.clientfieldname))
		{
			/#
				assert(isdefined(wallbuy.var_d6cca569));
			#/
			level clientfield::set(wallbuy.trigger_stub.clientfieldname, wallbuy.var_d6cca569);
			wallbuy.var_d6cca569 = undefined;
		}
	}
	foreach(var_2b84085b in level.var_b5079c7c)
	{
		level exploder::exploder_stop(var_2b84085b);
	}
}

/*
	Name: _open_arcs
	Namespace: namespace_497ab7da
	Checksum: 0x58E9C7A8
	Offset: 0xF28
	Size: 0x58
	Parameters: 1
	Flags: Linked, Private
*/
function private _open_arcs(blocker)
{
	if(isdefined(blocker.script_noteworthy) && (blocker.script_noteworthy == "electric_door" || blocker.script_noteworthy == "local_electric_door"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_fcf197fa
	Namespace: namespace_497ab7da
	Checksum: 0x45106DD1
	Offset: 0xF88
	Size: 0x26A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_fcf197fa(targetname, show)
{
	blockers = getentarray(targetname, "targetname");
	if(isdefined(blockers))
	{
		foreach(blocker in blockers)
		{
			if(isdefined(blocker.target) && _open_arcs(blocker))
			{
				var_c819ac8 = getentarray(blocker.target, "targetname");
				if(isdefined(var_c819ac8))
				{
					foreach(var_1d6a70e8 in var_c819ac8)
					{
						if(isdefined(var_1d6a70e8.objectid) && !var_1d6a70e8 zm_utility::function_1a4d2910())
						{
							switch(var_1d6a70e8.objectid)
							{
								case "symbol_back_debris":
								case "symbol_front_power":
								case "symbol_back":
								case "symbol_front":
								case "symbol_front_debris":
								case "symbol_back_power":
								{
									if(show)
									{
										var_1d6a70e8 show();
									}
									else
									{
										var_1d6a70e8 ghost();
									}
									break;
								}
								default:
								{
									break;
								}
							}
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_a4284cb4
	Namespace: namespace_497ab7da
	Checksum: 0x4DD7943
	Offset: 0x1200
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a4284cb4()
{
	function_fcf197fa("zombie_door", 0);
	function_fcf197fa("zombie_debris", 0);
}

/*
	Name: function_c606ef4b
	Namespace: namespace_497ab7da
	Checksum: 0xA0A18D5
	Offset: 0x1240
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c606ef4b()
{
	function_fcf197fa("zombie_door", 1);
	function_fcf197fa("zombie_debris", 1);
}

/*
	Name: function_4516d298
	Namespace: namespace_497ab7da
	Checksum: 0xD8A601D3
	Offset: 0x1290
	Size: 0x40
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4516d298()
{
	level endon(#"end_game");
	while(level flag::get("moving_chest_now"))
	{
		waitframe(1);
	}
}

/*
	Name: function_610df6d
	Namespace: namespace_497ab7da
	Checksum: 0x2598982D
	Offset: 0x12D8
	Size: 0x40
	Parameters: 0
	Flags: Linked, Private
*/
function private function_610df6d()
{
	level endon(#"end_game");
	while(is_true(self._box_open))
	{
		waitframe(1);
	}
}

/*
	Name: function_47c81160
	Namespace: namespace_497ab7da
	Checksum: 0xD027983B
	Offset: 0x1320
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private function_47c81160()
{
	function_4516d298();
	if(level.chest_index != -1)
	{
		chest = level.chests[level.chest_index];
		chest function_610df6d();
		chest zm_magicbox::hide_chest(1);
	}
}

/*
	Name: function_d7ee2133
	Namespace: namespace_497ab7da
	Checksum: 0x22D3D0B9
	Offset: 0x13A0
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d7ee2133()
{
	function_4516d298();
	if(level.chest_index != -1)
	{
		chest = level.chests[level.chest_index];
		chest zm_magicbox::show_chest();
	}
}

/*
	Name: function_d5e17413
	Namespace: namespace_497ab7da
	Checksum: 0x425AC6D8
	Offset: 0x1408
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d5e17413()
{
	if(!isdefined(level.var_5bfd847e) || !level flag::exists(level.var_5bfd847e))
	{
		return;
	}
	level clientfield::set("fasttravel_exploder", 0);
}

/*
	Name: function_c348adcc
	Namespace: namespace_497ab7da
	Checksum: 0x173CCA4D
	Offset: 0x1470
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c348adcc()
{
	if(!isdefined(level.var_5bfd847e) || !level flag::exists(level.var_5bfd847e))
	{
		return;
	}
	if(level flag::get(level.var_5bfd847e))
	{
		level clientfield::set("fasttravel_exploder", 1);
	}
}

/*
	Name: function_ffdd5310
	Namespace: namespace_497ab7da
	Checksum: 0x3281F274
	Offset: 0x14F8
	Size: 0xE0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ffdd5310()
{
	var_ec9e2b1d = getentarray("zombie_trap", "targetname");
	str_text = #"hash_55d25caf8f7bbb2f";
	foreach(var_9bda8088 in var_ec9e2b1d)
	{
		var_9bda8088 zm_traps::trap_set_string(str_text);
	}
	level notify(#"hash_3c662e7b29cfc3dd");
}

/*
	Name: function_c0da518d
	Namespace: namespace_497ab7da
	Checksum: 0x1D87F5C9
	Offset: 0x15E0
	Size: 0xE8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c0da518d()
{
	var_ec9e2b1d = getentarray("zombie_trap", "targetname");
	str_text = #"hash_23c1c09e94181fdb";
	foreach(var_9bda8088 in var_ec9e2b1d)
	{
		var_9bda8088 zm_traps::trap_set_string(str_text, var_9bda8088.zombie_cost);
	}
	level notify(#"traps_available");
}

