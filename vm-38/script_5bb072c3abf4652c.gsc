#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_1cc417743d7c262d;
#using script_396f7d71538c9677;
#using script_3f27a7b2232674db;
#using script_437ce686d29bb81b;
#using script_58c342edd81589fb;
#using script_6021ce59143452c3;
#using script_6ce38ab036223e6e;
#using script_b52a163973f339f;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_vo;

/*
	Name: function_8c300116
	Namespace: zm_vo
	Checksum: 0x845A156A
	Offset: 0x1E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8c300116()
{
	level notify(1833536498);
}

/*
	Name: function_89f2df9
	Namespace: zm_vo
	Checksum: 0x3AECB04F
	Offset: 0x200
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_vo", &function_70a657d8, &function_8ac3bea9, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: zm_vo
	Checksum: 0x6F9C5C0A
	Offset: 0x260
	Size: 0x214
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_98eae67a = [];
	level.var_5388c8f9 = [];
	level.var_62281818 = [];
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	callback::function_10a4dd0a(&function_10a4dd0a);
	callback::function_20263b9e(&function_20263b9e);
	callback::function_f77ced93(&function_d773f2e);
	level.var_3602c1be = &function_b47e0399;
	level.var_4edd846 = &function_d1711916;
	level.var_3727097e = &function_58a8c5ba;
	level.var_9f234058 = &function_e5ba46e0;
	level.var_28ebc1e8 = 1;
	level.play_killstreak_start_dialog = &function_7bed52a;
	level.play_taacom_dialog_response_on_owner = &function_3cf68327;
	level.play_taacom_dialog = &function_3d6e0cd9;
	level.play_pilot_dialog_on_owner = &function_9716fce9;
	level.play_pilot_dialog = &function_f6370f75;
	function_318f41b6();
	level.a_speakers = getscriptbundle(#"hash_3a33b384e9a87b15");
	clientfield::function_a8bbc967("zm_hud.commander_speaking", 1, 5, "int", 0);
}

/*
	Name: function_318f41b6
	Namespace: zm_vo
	Checksum: 0x222E5EEA
	Offset: 0x480
	Size: 0x2FC
	Parameters: 0
	Flags: Linked
*/
function function_318f41b6()
{
	if(isdefined(level.var_74f5c47d))
	{
		[[level.var_74f5c47d]]();
	}
	else
	{
		function_2cf4b07f(#"full_ammo", #"hash_15cb79e906605461");
		function_2cf4b07f(#"double_points", #"hash_64189f4639819331");
		function_2cf4b07f(#"insta_kill", #"hash_5075330907645a15");
		function_2cf4b07f(#"fire_sale", #"hash_3ed5fa07d17a7cc2");
		function_2cf4b07f(#"carpenter", #"hash_42d85f0b6534d522");
		function_2cf4b07f(#"nuke", #"hash_3245913d882a8c0e");
		function_2cf4b07f(#"bonus_points_team", #"hash_78c9bfab1a9278bd");
		function_2cf4b07f(#"bonus_points_player", #"hash_78c9bfab1a9278bd");
		function_2cf4b07f(#"bonus_points_player_shared", #"hash_78c9bfab1a9278bd");
		function_2cf4b07f(#"hero_weapon_power", #"hash_3228b9bb6d91f7c6");
		function_2cf4b07f(#"free_perk", #"hash_796989b8ef666e16");
		function_2cf4b07f(#"hash_4f352102512cc494", #"hash_69fb2ede79df7f3a");
		function_2cf4b07f(#"dogstart", #"hash_28b132dc4f25cf4c");
		function_2cf4b07f(#"boxmove", #"hash_69675122993fc5ca");
		function_2cf4b07f(#"game_over", #"hash_3f1eca72dab56b29");
	}
}

/*
	Name: function_8ac3bea9
	Namespace: zm_vo
	Checksum: 0x80F724D1
	Offset: 0x788
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: on_player_connect
	Namespace: zm_vo
	Checksum: 0x73A136CF
	Offset: 0x798
	Size: 0x3E
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_connect()
{
	self.isspeaking = 0;
	self.playleaderdialog = 1;
	self.n_vo_priority = 0;
	self.var_671911e9 = [];
	self.var_29e6a032 = [];
}

/*
	Name: on_player_spawned
	Namespace: zm_vo
	Checksum: 0x5C338158
	Offset: 0x7E0
	Size: 0xE
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_spawned()
{
	self.isspeaking = 0;
}

/*
	Name: function_d773f2e
	Namespace: zm_vo
	Checksum: 0xC809B7DA
	Offset: 0x7F8
	Size: 0x23E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d773f2e(params)
{
	if(!isplayer(self) || params.weapon === level.weaponnone || function_d122265c(self) || self scene::is_igc_active() || !self function_2d3f319c())
	{
		return;
	}
	switch(params.weapon.name)
	{
		case "ray_gun_mk2":
		case "ray_gun":
		{
			var_64edfc97 = #"hash_47911e56b3253861";
			break;
		}
		case "hash_5bd48d860ebd5a41":
		{
			var_64edfc97 = #"hash_6d5b8296c64bfe35";
			break;
		}
		case "hash_3fa91d1674123e09":
		case "hash_5dd5741f21fd680d":
		case "hash_655d944e437c3d5b":
		case "hash_6e0b27b854e591a3":
		case "hash_72796957033e2e4a":
		{
			var_64edfc97 = #"hash_763fd19c812336";
			break;
		}
		case "sig_bow_flame":
		{
			return;
		}
		case "hero_flamethrower":
		{
			return;
		}
		case "hero_annihilator":
		{
			return;
		}
		case "sig_lmg":
		{
			return;
		}
		case "hero_pineapplegun":
		{
			return;
		}
		default:
		{
			if(zm_weapons::is_wonder_weapon(params.weapon))
			{
				var_64edfc97 = #"hash_5c81d3724f900e7";
			}
			break;
		}
	}
	if(isdefined(var_64edfc97))
	{
		self thread function_d342796e(var_64edfc97);
		self.var_f502715d = gettime();
	}
}

/*
	Name: function_20263b9e
	Namespace: zm_vo
	Checksum: 0xCB10ECC2
	Offset: 0xA40
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_20263b9e(params)
{
	if(params.weapon.name === #"cymbal_monkey")
	{
		params.projectile thread function_1084cf1d();
	}
}

/*
	Name: function_1084cf1d
	Namespace: zm_vo
	Checksum: 0x8806A888
	Offset: 0xA98
	Size: 0x194
	Parameters: 0
	Flags: Linked
*/
function function_1084cf1d()
{
	var_bdd70f6a = self.var_bdd70f6a;
	if(!isdefined(var_bdd70f6a))
	{
		return;
	}
	self endon(#"death");
	var_bdd70f6a endon(#"death");
	n_index = function_21a3a673(0, 3);
	var_64edfc97 = #"hash_1df2b33f0eb8bf56" + n_index;
	var_bdd70f6a playsound(var_64edfc97);
	var_be17187b = undefined;
	var_be17187b = self waittill(#"stationary");
	v_origin = var_bdd70f6a.origin;
	var_bdd70f6a stopsound(var_64edfc97);
	n_index = function_21a3a673(0, 3);
	var_64edfc97 = #"hash_35fa8d80060451c1" + n_index;
	var_bdd70f6a playsoundwithnotify(var_64edfc97, "sounddone");
	wait(5);
	n_index = function_21a3a673(0, 11);
	var_64edfc97 = #"hash_73e4d6659cb4dda3" + n_index;
	playsoundatposition(var_64edfc97, v_origin);
}

/*
	Name: function_10a4dd0a
	Namespace: zm_vo
	Checksum: 0xF366BAE5
	Offset: 0xC38
	Size: 0x62C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_10a4dd0a(params)
{
	item = params.item;
	if(!isplayer(self) || function_d122265c(self) || self scene::is_igc_active() || !level flag::get("start_zombie_round_logic") || is_true(item.var_99628f67))
	{
		return;
	}
	weapon = namespace_a0d533d1::function_2b83d3ff(item);
	if(item.var_a6762160.name === #"hash_2cdb76a587cf7a3b" && is_true(item.var_14948fd))
	{
		var_64edfc97 = #"hash_761fd0a07d2e04f";
	}
	else if(isdefined(item) && isdefined(weapon))
	{
		switch(item.var_a6762160.itemtype)
		{
			case "scorestreak":
			{
				if(is_true(item.var_14948fd))
				{
					if(weapon.name == #"chopper_gunner" || weapon.name == #"hash_472e993181f32a0")
					{
						var_64edfc97 = #"hash_1451a78cbf91a4e3";
					}
					else
					{
						if(weapon.name == #"ultimate_turret")
						{
							var_64edfc97 = #"hash_61917b06ef391bae";
						}
						else
						{
							var_64edfc97 = #"hash_6b760a9e97d27ca3";
						}
					}
					item.var_14948fd = undefined;
					n_timeout = 3;
				}
				break;
			}
			case "tactical":
			case "equipment":
			{
				if(is_true(item.var_14948fd))
				{
					var_64edfc97 = #"hash_7ae658278829f860";
					item.var_14948fd = undefined;
				}
				n_timeout = 3;
				break;
			}
			case "weapon":
			{
				if(is_true(item.var_5b4ae99d))
				{
				}
				else
				{
					if(function_5fef4201(weapon) || weapon.name === #"hash_5bd48d860ebd5a41" || weapon.name === #"hash_ac86d29509a8939")
					{
						if(self function_2d3f319c())
						{
							var_64edfc97 = #"hash_62aba8e16a728e4";
							self.var_f502715d = gettime();
						}
					}
					else if(self function_99262cf3())
					{
						self.var_ce67a5b1 = gettime();
						if(is_true(item.var_14948fd) || is_true(item.wallbuy_weapon) || is_true(item.var_519e776c))
						{
							switch(weapon.weapclass)
							{
								case "mg":
								{
									var_64edfc97 = #"hash_52e3a2e29f0f0544";
									break;
								}
								case "spread":
								{
									var_64edfc97 = #"hash_245da60fd43ac21a";
									break;
								}
								case "pistol":
								{
									if(weapon.name == #"ray_gun" || weapon.name == #"ray_gun_mk2")
									{
										if(self function_2d3f319c())
										{
											var_64edfc97 = #"hash_56d268fc5786455e";
											self.var_f502715d = gettime();
										}
									}
									else
									{
										var_64edfc97 = #"hash_e36abf6446d1c67";
									}
									break;
								}
								case "rocketlauncher":
								{
									var_64edfc97 = #"hash_1f9d617af9161090";
									break;
								}
								case "smg":
								{
									var_64edfc97 = #"hash_103dc1e2c2034ff1";
									break;
								}
								case "rifle":
								{
									if(weapon.issniperweapon)
									{
										var_64edfc97 = #"hash_6f77ec873d50a5a3";
									}
									else
									{
										if(zm_weapons::function_eb0b9fc3(weapon))
										{
											var_64edfc97 = #"hash_65a5f39e9b407c79";
										}
										else
										{
											var_64edfc97 = #"hash_17608d93085cc567";
										}
									}
									break;
								}
								default:
								{
									var_64edfc97 = #"hash_54d519e96ca368ad";
									break;
								}
							}
						}
						else
						{
							var_64edfc97 = #"hash_54d519e96ca368ad";
						}
						n_timeout = 3;
					}
				}
				break;
			}
			default:
			{
				break;
			}
		}
	}
	if(isdefined(var_64edfc97))
	{
		self thread function_d342796e(var_64edfc97, 0.75, undefined, undefined, undefined, n_timeout);
	}
}

/*
	Name: function_5fef4201
	Namespace: zm_vo
	Checksum: 0x90C9E1C4
	Offset: 0x1270
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_5fef4201(weapon)
{
	if(isdefined(weapon))
	{
		w_root = zm_weapons::function_386dacbc(weapon);
		switch(w_root.name)
		{
			case "hash_3fa91d1674123e09":
			case "hash_5dd5741f21fd680d":
			case "hash_655d944e437c3d5b":
			case "hash_6e0b27b854e591a3":
			case "hash_72796957033e2e4a":
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_2d3f319c
	Namespace: zm_vo
	Checksum: 0xCFAA4C76
	Offset: 0x1320
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_2d3f319c()
{
	var_19a9f270 = int(45 * 1000);
	if(isdefined(self.var_f502715d) && (self.var_f502715d + var_19a9f270) > gettime())
	{
		return false;
	}
	return true;
}

/*
	Name: function_99262cf3
	Namespace: zm_vo
	Checksum: 0x9DE7420D
	Offset: 0x1388
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_99262cf3()
{
	var_19a9f270 = int(3 * 1000);
	if(isdefined(self.var_ce67a5b1) && (self.var_ce67a5b1 + var_19a9f270) > gettime())
	{
		return false;
	}
	return true;
}

/*
	Name: function_d1711916
	Namespace: zm_vo
	Checksum: 0xECCE210B
	Offset: 0x13F0
	Size: 0x792
	Parameters: 2
	Flags: Linked
*/
function function_d1711916(var_332276f2, dialogkey)
{
	switch(dialogkey)
	{
		case "hash_1561254978f7d1ed":
		{
			return var_332276f2.var_a18357b0;
		}
		case "hash_d6e9cf445a840a":
		{
			return var_332276f2.var_7197146;
		}
		case "hash_4d97a2cf6c712d4e":
		{
			return var_332276f2.var_b75d6820;
		}
		case "hash_7e2f32f691207aca":
		{
			return var_332276f2.var_c6a87967;
		}
		case "hash_56bc9b3d6947b8b6":
		{
			return var_332276f2.var_2a0d1f09;
		}
		case "hash_7344811e7fc98f06":
		{
			return var_332276f2.var_f14b4110;
		}
		case "hash_28808125fce8c8e7":
		{
			return var_332276f2.var_2ede36b7;
		}
		case "hash_4bd8ffae8d5281c9":
		{
			return var_332276f2.var_a7cd67b9;
		}
		case "hash_3449e69a233e305f":
		{
			return var_332276f2.var_79d2f568;
		}
		case "hash_3449e19a233e27e0":
		{
			return var_332276f2.var_30a9e317;
		}
		case "hash_343f749a23351a24":
		{
			return var_332276f2.var_8c5b9bd9;
		}
		case "hash_343f719a2335150b":
		{
			return var_332276f2.var_e70f5143;
		}
		case "hash_406609dcd40a348e":
		{
			return var_332276f2.var_b63eeb6b;
		}
		case "hash_31d075ffaf2c230a":
		{
			return var_332276f2.var_3a42c1d5;
		}
		case "hash_68d4ef9c937aa223":
		{
			return var_332276f2.var_113e7d50;
		}
		case "hash_6b704db2e152d216":
		{
			return var_332276f2.var_546b28ea;
		}
		case "hash_3e454dbd28a162b0":
		{
			return var_332276f2.var_c00403c2;
		}
		case "hash_2af4d13403d833e5":
		{
			return var_332276f2.var_730dde6b;
		}
		case "hash_2d45724fc1a86740":
		{
			return var_332276f2.var_f306595c;
		}
		case "hash_684963f03f8a86a5":
		{
			return var_332276f2.var_9ff5cdcc;
		}
		case "hash_5dc5c0d8c259c02d":
		{
			return var_332276f2.var_72e8c256;
		}
		case "hash_35b4f1037b7d4ed1":
		{
			return var_332276f2.var_f122552;
		}
		case "hash_394f4a59df1d0c17":
		{
			return var_332276f2.var_dfbf98e1;
		}
		case "hash_7e50fb36129dc24b":
		{
			return var_332276f2.var_bf6e4ac;
		}
		case "hash_7ae658278829f860":
		{
			return var_332276f2.var_2cecf015;
		}
		case "hash_761fd0a07d2e04f":
		{
			return var_332276f2.var_66209010;
		}
		case "hash_1451a78cbf91a4e3":
		{
			return var_332276f2.var_f4cd0e25;
		}
		case "hash_61917b06ef391bae":
		{
			return var_332276f2.var_87c03899;
		}
		case "hash_6b760a9e97d27ca3":
		{
			return var_332276f2.var_b4d315f0;
		}
		case "hash_17608d93085cc567":
		{
			return var_332276f2.var_d6081434;
		}
		case "hash_54d519e96ca368ad":
		{
			return var_332276f2.var_93a555d;
		}
		case "hash_1f9d617af9161090":
		{
			return var_332276f2.var_6d143dab;
		}
		case "hash_52e3a2e29f0f0544":
		{
			return var_332276f2.var_11bab4ea;
		}
		case "hash_e36abf6446d1c67":
		{
			return var_332276f2.var_d3bc2ad1;
		}
		case "hash_245da60fd43ac21a":
		{
			return var_332276f2.var_3f0128df;
		}
		case "hash_103dc1e2c2034ff1":
		{
			return var_332276f2.var_ff9ef39;
		}
		case "hash_6f77ec873d50a5a3":
		{
			return var_332276f2.var_33d6065e;
		}
		case "hash_65a5f39e9b407c79":
		{
			return var_332276f2.var_ae6aac16;
		}
		case "hash_56d268fc5786455e":
		{
			return var_332276f2.var_63cacd8;
		}
		case "hash_62aba8e16a728e4":
		{
			return var_332276f2.var_981c7b13;
		}
		case "hash_97e18b450a8ee6c":
		{
			return var_332276f2.var_4167c49f;
		}
		case "hash_3db45a32611292d9":
		{
			return var_332276f2.var_2bd61d23;
		}
		case "hash_3db46b326112afbc":
		{
			return var_332276f2.var_8fc7e499;
		}
		case "hash_290cd5d81be48f4e":
		{
			return var_332276f2.var_7b9a379a;
		}
		case "hash_28201f7edff3dce6":
		{
			return var_332276f2.var_e656ac85;
		}
		case "hash_17f91747a02fd957":
		{
			return var_332276f2.var_ee428cd2;
		}
		case "hash_15ca4dea4f166f7f":
		{
			return var_332276f2.var_1a961cee;
		}
		case "hash_6c397b7fc04e50e8":
		{
			return var_332276f2.var_d8459fc5;
		}
		case "hash_7dcb4fc78a4f1b59":
		{
			return var_332276f2.var_9b022db3;
		}
		case "hash_5cf6ca680b92367e":
		{
			return var_332276f2.var_97b15249;
		}
		case "hash_24cdd0678cac5169":
		{
			return var_332276f2.var_a359c69c;
		}
		case "hash_792e587a5f0a0c6e":
		{
			return var_332276f2.var_e0da7061;
		}
		case "hash_4e60623e376d0aaf":
		{
			return var_332276f2.var_cb9bea7e;
		}
		case "hash_5931f6d8a41cbb82":
		{
			return var_332276f2.var_4ffec500;
		}
		case "hash_7beb683fd1b089cb":
		{
			return var_332276f2.var_535a32a5;
		}
		case "hash_48b9fc7637fbd1bd":
		{
			return var_332276f2.var_ade00a2;
		}
		case "hash_64548a5004b0f44a":
		{
			return var_332276f2.var_805c2248;
		}
		case "hash_41278a4ac5aae0af":
		{
			return var_332276f2.var_7d24c591;
		}
		case "hash_6f557d811bbead82":
		{
			return var_332276f2.var_c9f0371e;
		}
		case "hash_6eb2904c5fee5fcb":
		{
			return var_332276f2.var_712ac879;
		}
		case "hash_12c12be7b517df26":
		{
			return var_332276f2.var_4b8f6dd6;
		}
		case "hash_578c414ebe6e097":
		{
			return var_332276f2.var_1591b920;
		}
		case "hash_47911e56b3253861":
		{
			return var_332276f2.var_7c47cc4f;
		}
		case "hash_763fd19c812336":
		{
			return var_332276f2.var_c097847f;
		}
		case "hash_6d5b8296c64bfe35":
		{
			return var_332276f2.var_4d7d1d3a;
		}
		case "hash_523f5d72ee488db1":
		{
			return var_332276f2.var_a7daf1b2;
		}
		case "hash_361fef4fda618ebe":
		{
			return var_332276f2.var_5bf416db;
		}
		case "hash_5c81d3724f900e7":
		{
			return var_332276f2.var_673f0ab3;
		}
	}
}

/*
	Name: function_58a8c5ba
	Namespace: zm_vo
	Checksum: 0x1DF9916A
	Offset: 0x1B90
	Size: 0x5BA
	Parameters: 2
	Flags: Linked
*/
function function_58a8c5ba(var_a6e45682, dialogkey)
{
	switch(dialogkey)
	{
		case "infil":
		{
			return var_a6e45682.infil;
		}
		case "matchstart":
		{
			return var_a6e45682.matchstart;
		}
		case "hash_1c2b56fb48ce36fa":
		{
			return var_a6e45682.var_5293f361;
		}
		case "hash_2e572ea9ea88569e":
		{
			return var_a6e45682.var_4b86718f;
		}
		case "hash_5575881191efb302":
		{
			return var_a6e45682.var_d67228c2;
		}
		case "hash_2788496d7ed6f0ef":
		{
			return var_a6e45682.var_540835ef;
		}
		case "hash_2a4c39d0533e577d":
		{
			return var_a6e45682.var_b1a8e60d;
		}
		case "hash_684b542bf103e4fe":
		{
			return var_a6e45682.var_9a18d1d3;
		}
		case "hash_42e688981c992280":
		{
			return var_a6e45682.var_50041482;
		}
		case "hash_4e85c1603ed42114":
		{
			return var_a6e45682.var_3df5fd3f;
		}
		case "hash_362860f460a29841":
		{
			return var_a6e45682.var_5f3898a;
		}
		case "hash_6fdeb623f1cd8f6":
		{
			return var_a6e45682.var_af695653;
		}
		case "hash_3c826fece0b3646c":
		{
			return var_a6e45682.var_cd47f341;
		}
		case "hash_785b3e9905f6511d":
		{
			return var_a6e45682.var_53b98c2c;
		}
		case "hash_2aeb990c0cb76e97":
		{
			return var_a6e45682.var_b8155728;
		}
		case "hash_eab292e698335c7":
		{
			return var_a6e45682.var_64248d62;
		}
		case "hash_6779beacf80a7a26":
		{
			return var_a6e45682.var_36c4edc0;
		}
		case "hash_2bfa170c2577a2c0":
		{
			return var_a6e45682.var_3c57a507;
		}
		case "hash_2c86ec42e4ab7ef6":
		{
			return var_a6e45682.var_35526bc7;
		}
		case "hash_1224d15cf609ed6":
		{
			return var_a6e45682.var_75de98a4;
		}
		case "hash_26e569fb2e7fabe":
		{
			return var_a6e45682.var_746b6118;
		}
		case "hash_477a4a51045495a0":
		{
			return var_a6e45682.var_7f50ff2b;
		}
		case "hash_1f327a042fd14498":
		{
			return var_a6e45682.var_d17a7aac;
		}
		case "hash_7ca80ff4ecb29f8e":
		{
			return var_a6e45682.var_4dc2d12;
		}
		case "hash_37fac4fc5c027a69":
		{
			return var_a6e45682.var_2536fc80;
		}
		case "hash_55bd8afbd48fb16e":
		{
			return var_a6e45682.var_43be8abf;
		}
		case "hash_534a8eea154bbf18":
		{
			return var_a6e45682.var_f23e58fa;
		}
		case "hash_514a3b399c691364":
		{
			return var_a6e45682.var_6b494f06;
		}
		case "hash_2e75932f6eedc934":
		{
			return var_a6e45682.var_b4cbe0e0;
		}
		case "hash_22531ed3b67a2a77":
		{
			return var_a6e45682.var_dec4416b;
		}
		case "hash_482f677bdbe28fd1":
		{
			return var_a6e45682.var_8ef0b73a;
		}
		case "hash_83f9a444e5f5963":
		{
			return var_a6e45682.var_e2a2bb;
		}
		case "hash_586699a0dc62b981":
		{
			return var_a6e45682.var_9a3a8c93;
		}
		case "hash_42f1b5c3d59fbf0a":
		{
			return var_a6e45682.var_bfc2fbeb;
		}
		case "hash_205bd9ab112c7e72":
		{
			return var_a6e45682.var_79951514;
		}
		case "hash_263284c7ccc07c65":
		{
			return var_a6e45682.var_a3feb2e;
		}
		case "hash_d07111edd47d48a":
		{
			return var_a6e45682.var_ed343aa5;
		}
		case "hash_975d0221956f8f4":
		{
			return var_a6e45682.var_eb37efcf;
		}
		case "hash_63463edb7e5128b3":
		{
			return var_a6e45682.var_1847b839;
		}
		case "hash_140a9f2e67162f40":
		{
			return var_a6e45682.var_d9989472;
		}
		case "hash_1ffed3b42df38982":
		{
			return var_a6e45682.var_36bea653;
		}
		case "hash_2e89349dbd0dbb5":
		{
			return var_a6e45682.var_d835a4e3;
		}
		case "hash_2d2935b9cdc13daf":
		{
			return var_a6e45682.var_97f92556;
		}
		case "hash_4a68eed43b098642":
		{
			return var_a6e45682.var_efdc0a35;
		}
		case "hash_4ef115d1ada77e7b":
		{
			return var_a6e45682.var_e5965f9c;
		}
		case "hash_411d9a48c548a4d9":
		{
			return var_a6e45682.var_7d58145e;
		}
		case "hash_2d7f2a7573effefe":
		{
			return var_a6e45682.var_780ba2c7;
		}
		case "hash_63f0b3b1943eee31":
		{
			return var_a6e45682.var_1e118e22;
		}
		case "hash_1c5310467e0fb853":
		{
			return var_a6e45682.var_f36c899d;
		}
		case "hash_37c63a4c4a4e8184":
		{
			return var_a6e45682.var_e0617250;
		}
		case "hash_7883b5e08d03e814":
		{
			return var_a6e45682.var_2cd13102;
		}
	}
}

/*
	Name: function_e5ba46e0
	Namespace: zm_vo
	Checksum: 0x72FB86EE
	Offset: 0x2158
	Size: 0x5BA
	Parameters: 2
	Flags: Linked
*/
function function_e5ba46e0(var_a6e45682, dialogkey)
{
	switch(dialogkey)
	{
		case "hash_536a2c98440e4182":
		{
			return var_a6e45682.var_cffcf9ba;
		}
		case "hash_73cc12d03789ad3f":
		{
			return var_a6e45682.var_41c83546;
		}
		case "hash_50ec2bacc50d8363":
		{
			return var_a6e45682.var_fd1d8944;
		}
		case "hash_410d84fbae567967":
		{
			return var_a6e45682.var_c653c561;
		}
		case "hash_14f76b27d54494b":
		{
			return var_a6e45682.var_613e6426;
		}
		case "hash_804a63ecb41614":
		{
			return var_a6e45682.var_d151963a;
		}
		case "hash_31288740d17d78d2":
		{
			return var_a6e45682.var_5686ab6c;
		}
		case "hash_221eb61e78fea147":
		{
			return var_a6e45682.var_1e94b3c6;
		}
		case "hash_5dcf562ff3f5cc61":
		{
			return var_a6e45682.var_8f0b8b61;
		}
		case "hash_126c527875ac2725":
		{
			return var_a6e45682.var_20a8f9b4;
		}
		case "hash_4ec8db10c8c4d7e6":
		{
			return var_a6e45682.var_2dec4f66;
		}
		case "hash_377f1b72d8b2059f":
		{
			return var_a6e45682.var_397b5d17;
		}
		case "hash_44b56c4f38f7a3d":
		{
			return var_a6e45682.var_6daff7ef;
		}
		case "hash_29a97799810191f2":
		{
			return var_a6e45682.var_252cce96;
		}
		case "hash_38a21b9cce47391c":
		{
			return var_a6e45682.var_5206420d;
		}
		case "hash_399fbba4d9cee56c":
		{
			return var_a6e45682.var_f4d5d9ae;
		}
		case "hash_39bd346fa50b356f":
		{
			return var_a6e45682.var_77f75a13;
		}
		case "hash_2c29d5e7d1b21ca1":
		{
			return var_a6e45682.var_ffd45054;
		}
		case "hash_23a67f3c7ed2779f":
		{
			return var_a6e45682.var_53ef4307;
		}
		case "hash_54a6f55a5cb443ff":
		{
			return var_a6e45682.var_d2395646;
		}
		case "hash_330e06d2732bf307":
		{
			return var_a6e45682.var_72d40b0a;
		}
		case "hash_7b6f43280f5fc701":
		{
			return var_a6e45682.var_7f6a4590;
		}
		case "hash_19781c91142b66b9":
		{
			return var_a6e45682.var_e5d58bf8;
		}
		case "hash_c662fbf1fce1777":
		{
			return var_a6e45682.var_ad909ba2;
		}
		case "hash_6b68eeb911f07ece":
		{
			return var_a6e45682.var_93c5c4b3;
		}
		case "hash_6a290793842890d7":
		{
			return var_a6e45682.var_6765ed01;
		}
		case "hash_53ec390fc9a8b639":
		{
			return var_a6e45682.var_d6770e90;
		}
		case "hash_27a62b517cc8c55":
		{
			return var_a6e45682.var_293214d9;
		}
		case "hash_5a475357d9efcbc5":
		{
			return var_a6e45682.var_16e8ad6f;
		}
		case "hash_4f0b86cd5b9bf77c":
		{
			return var_a6e45682.var_a0eda6f3;
		}
		case "hash_1440fff0c80bfb96":
		{
			return var_a6e45682.var_a1e29b0e;
		}
		case "hash_5ae7ce1fcd2554b8":
		{
			return var_a6e45682.var_f34c57;
		}
		case "hash_5a1f8d481d0cb526":
		{
			return var_a6e45682.var_36736399;
		}
		case "hash_2ba0db40dddbef93":
		{
			return var_a6e45682.var_3c069068;
		}
		case "hash_5deb9fb0966dbadb":
		{
			return var_a6e45682.var_5b48a348;
		}
		case "hash_ddeeb5d7ab7d53a":
		{
			return var_a6e45682.var_522f1f4c;
		}
		case "hash_70ffa115c0f25013":
		{
			return var_a6e45682.var_f7fac7c7;
		}
		case "hash_502241ddc21df285":
		{
			return var_a6e45682.var_6eeaa2d;
		}
		case "hash_5972f731c699ad68":
		{
			return var_a6e45682.var_293a08a0;
		}
		case "hash_2e8af7e400912221":
		{
			return var_a6e45682.var_963b68c8;
		}
		case "hash_e18650567a2accb":
		{
			return var_a6e45682.var_3654aec5;
		}
		case "hash_621cf38b396dae6a":
		{
			return var_a6e45682.var_dca1309e;
		}
		case "hash_5d49718d002bc0d4":
		{
			return var_a6e45682.var_e12c80fc;
		}
		case "hash_25a861604ea5bc8b":
		{
			return var_a6e45682.var_acc1056c;
		}
		case "hash_1791f8a4a5744090":
		{
			return var_a6e45682.var_596a17f7;
		}
		case "hash_5a5dfc9395514a5e":
		{
			return var_a6e45682.var_9b5581c0;
		}
		case "hash_47e1c08d6f5e6f47":
		{
			return var_a6e45682.var_c549da4;
		}
		case "hash_1ffc49ef5d4c176":
		{
			return var_a6e45682.var_ca2b01a7;
		}
		case "hash_2c11c1da3045be88":
		{
			return var_a6e45682.var_dfdffcd;
		}
		case "hash_7d5ab9e9713ab0f5":
		{
			return var_a6e45682.var_9e7d6ed9;
		}
		case "hash_1d290eb8175cbc25":
		{
			return var_a6e45682.var_f4b88602;
		}
	}
}

/*
	Name: vo_clear
	Namespace: zm_vo
	Checksum: 0xB8036F1
	Offset: 0x2720
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function vo_clear(str_endon)
{
	self thread function_ccc44d3e(str_endon);
}

/*
	Name: function_ccc44d3e
	Namespace: zm_vo
	Checksum: 0xAEEB8DF3
	Offset: 0x2750
	Size: 0x180
	Parameters: 1
	Flags: Linked
*/
function function_ccc44d3e(str_endon)
{
	if(isdefined(str_endon) && isdefined(self.str_vo_being_spoken))
	{
		/#
			if(getdvarint(#"hash_1a8d23951f456372", 0))
			{
				iprintlnbold("");
				println("");
			}
		#/
		self stopsound(self.str_vo_being_spoken);
	}
	if(isplayer(self))
	{
		self clientfield::set_to_player("isspeaking", 0);
	}
	self.str_vo_being_spoken = "";
	self.n_vo_priority = 0;
	self.isspeaking = 0;
	self.playingdialog = 0;
	self.var_5b6ebfd0 = 0;
	self.var_472e3448 = undefined;
	self.last_vo_played_time = gettime();
	arrayremovevalue(level.var_62281818, self);
	zm_audio::sndvoxoverride(0);
	self notify(#"done_speaking");
	self notify(#"vo_clear");
}

/*
	Name: is_player_valid
	Namespace: zm_vo
	Checksum: 0x742902E2
	Offset: 0x28D8
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function is_player_valid(e_player)
{
	return zm_utility::is_player_valid(e_player, 0, 0, 0);
}

/*
	Name: function_347f7d34
	Namespace: zm_vo
	Checksum: 0x58D29197
	Offset: 0x2910
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function function_347f7d34()
{
	a_valid_players = [];
	foreach(player in getplayers())
	{
		if(zm_utility::is_player_valid(player))
		{
			if(!isdefined(a_valid_players))
			{
				a_valid_players = [];
			}
			else if(!isarray(a_valid_players))
			{
				a_valid_players = array(a_valid_players);
			}
			a_valid_players[a_valid_players.size] = player;
		}
	}
	return a_valid_players;
}

/*
	Name: function_2ee2ece4
	Namespace: zm_vo
	Checksum: 0xD7D71B0E
	Offset: 0x2A10
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function function_2ee2ece4(var_79dbc69)
{
	if(!isdefined(var_79dbc69))
	{
		var_79dbc69 = 1;
	}
	while(true)
	{
		a_valid_players = function_347f7d34();
		if(a_valid_players.size >= var_79dbc69)
		{
			break;
		}
		waitframe(5);
	}
	return a_valid_players;
}

/*
	Name: function_8abe0568
	Namespace: zm_vo
	Checksum: 0xC16CF022
	Offset: 0x2A78
	Size: 0x4CE
	Parameters: 5
	Flags: Linked
*/
function function_8abe0568(str_type, n_delay, str_sound, b_wait_if_busy, var_92885147)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 0;
	}
	if(!isdefined(var_92885147))
	{
		var_92885147 = 0;
	}
	if(isdefined(level.var_bec5bf67))
	{
		b_exit = self [[level.var_bec5bf67]](str_type);
		if(b_exit)
		{
			return;
		}
	}
	if(!isdefined(str_sound))
	{
		str_sound = function_1eac234a(str_type);
		if(!isdefined(str_sound))
		{
			return;
		}
	}
	n_wait = float(max((isdefined(soundgetplaybacktime(str_sound)) ? soundgetplaybacktime(str_sound) : 500), 500)) / 1000;
	n_wait = max(n_wait - 2, 2.5);
	if(isdefined(n_delay))
	{
		wait(n_delay);
	}
	if(isplayer(self))
	{
		player = self;
		player endon(#"disconnect");
		if(!isdefined(player.var_85ea4daf))
		{
			player.var_85ea4daf = [];
		}
		if(var_92885147)
		{
			arrayinsert(player.var_85ea4daf, str_sound, 0);
		}
		else
		{
			if(!isdefined(player.var_85ea4daf))
			{
				player.var_85ea4daf = [];
			}
			else if(!isarray(player.var_85ea4daf))
			{
				player.var_85ea4daf = array(player.var_85ea4daf);
			}
			player.var_85ea4daf[player.var_85ea4daf.size] = str_sound;
		}
		if(is_true(player.zmannouncertalking) && (b_wait_if_busy || var_92885147))
		{
			do
			{
				player waittill(#"hash_26a44682c9fd6f62");
			}
			while(isdefined(player.var_85ea4daf[0]) && player.var_85ea4daf[0] != str_sound);
		}
		if(function_a076708f(str_type))
		{
			player.zmannouncertalking = 1;
			/#
				if(getdvarint(#"hash_1a8d23951f456372", 0))
				{
					if(!soundexists(str_sound))
					{
						var_2dbe34fe = ("" + "") + function_9e72a96(str_sound) + "";
						iprintlnbold(var_2dbe34fe);
						println(var_2dbe34fe);
					}
				}
			#/
			if(isdefined(level.var_14fa5e76[str_type]))
			{
				self.var_7d8fdfe9[str_type] = gettime();
			}
			player playlocalsound(str_sound);
			wait(n_wait);
			player.zmannouncertalking = undefined;
			player notify(#"hash_26a44682c9fd6f62", {#str_sound:str_sound, #str_type:str_type});
		}
		arrayremovevalue(player.var_85ea4daf, str_sound);
	}
	else
	{
		foreach(player in getplayers())
		{
			player thread function_8abe0568(str_type, undefined, str_sound, b_wait_if_busy, var_92885147);
		}
		wait(n_wait);
	}
}

/*
	Name: function_47cf6c76
	Namespace: zm_vo
	Checksum: 0x8C39D840
	Offset: 0x2F50
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_47cf6c76(str_type, n_time)
{
	if(!isdefined(n_time))
	{
		n_time = 45;
	}
	level.var_14fa5e76[str_type] = n_time;
}

/*
	Name: function_a076708f
	Namespace: zm_vo
	Checksum: 0xD876CF1A
	Offset: 0x2F90
	Size: 0x9E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a076708f(str_type)
{
	if(is_true(self.zmannouncertalking))
	{
		return false;
	}
	if(isdefined(level.var_14fa5e76[str_type]) && isdefined(self.var_7d8fdfe9[str_type]) && (self.var_7d8fdfe9[str_type] + (int(level.var_14fa5e76[str_type] * 1000))) >= gettime())
	{
		return false;
	}
	return true;
}

/*
	Name: function_1eac234a
	Namespace: zm_vo
	Checksum: 0xA29AB5E5
	Offset: 0x3038
	Size: 0xF0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1eac234a(str_type)
{
	if(isdefined(level.var_9182a974[str_type]))
	{
		str_alias = function_d3fc42dc(level.var_9182a974[str_type]);
	}
	else
	{
		/#
			iprintlnbold(("" + function_9e72a96(str_type)) + "");
			println(("" + function_9e72a96(str_type)) + "");
		#/
		if(getdvarint(#"hash_1a8d23951f456372", 0))
		{
		}
	}
	return str_alias;
}

/*
	Name: function_2cf4b07f
	Namespace: zm_vo
	Checksum: 0x6558F2B6
	Offset: 0x3130
	Size: 0x24
	Parameters: 2
	Flags: Linked
*/
function function_2cf4b07f(str_type, str_alias)
{
	level.var_9182a974[str_type] = str_alias;
}

/*
	Name: function_b47e0399
	Namespace: zm_vo
	Checksum: 0xA7C12D13
	Offset: 0x3160
	Size: 0x134
	Parameters: 5
	Flags: Linked
*/
function function_b47e0399(var_7382ea8b, attacker, weapon, victim, einflictor)
{
	if(weapon === #"hash_1561254978f7d1ed" || weapon === #"hash_d6e9cf445a840a")
	{
		if(zm_weapons::is_wonder_weapon(einflictor))
		{
			return;
		}
	}
	if(isdefined(weapon))
	{
		var_ba7af842 = function_384269f(weapon);
		if(var_ba7af842)
		{
			if(isdefined(level.var_644df7b4) && gettime() < level.var_644df7b4)
			{
				return;
			}
			level.var_644df7b4 = gettime() + (int(10 * 1000));
		}
		n_timeout = (var_ba7af842 ? undefined : 30);
		victim function_d342796e(weapon, 0, 0, 1, var_ba7af842, n_timeout);
	}
}

/*
	Name: function_384269f
	Namespace: zm_vo
	Checksum: 0xA40C4525
	Offset: 0x32A0
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function function_384269f(var_7382ea8b)
{
	switch(var_7382ea8b)
	{
		case "hash_3309edb01ae003":
		case "hash_24466af289df811d":
		case "hash_272cfd998024e239":
		case "hash_28808125fce8c8e7":
		case "hash_2af4d13403d833e5":
		case "hash_2af4d13403d833e5":
		case "hash_2d45724fc1a86740":
		case "hash_31d075ffaf2c230a":
		case "hash_343f719a2335150b":
		case "hash_343f749a23351a24":
		case "hash_3449e19a233e27e0":
		case "hash_3449e69a233e305f":
		case "hash_37d1e1b4e8cb9e5d":
		case "hash_394f4a59df1d0c17":
		case "hash_3e454dbd28a162b0":
		case "hash_406609dcd40a348e":
		case "hash_4bd8ffae8d5281c9":
		case "hash_5dc5c0d8c259c02d":
		case "hash_62579373c5d67ce0":
		case "hash_66ac46319a38f1d7":
		case "hash_684963f03f8a86a5":
		case "hash_68d4ef9c937aa223":
		case "hash_6b704db2e152d216":
		case "hash_78d72a691611038f":
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_d342796e
	Namespace: zm_vo
	Checksum: 0x1830E7B1
	Offset: 0x3450
	Size: 0x564
	Parameters: 6
	Flags: Linked
*/
function function_d342796e(var_7382ea8b, n_delay, var_67fee570, var_299a320, var_b9582129, n_timeout)
{
	if(!isdefined(var_67fee570))
	{
		var_67fee570 = 0;
	}
	if(!isdefined(var_299a320))
	{
		var_299a320 = 1;
	}
	if(!isdefined(var_b9582129))
	{
		var_b9582129 = 0;
	}
	self endoncallback(&vo_clear, #"death");
	if(isplayer(self) && isdefined(var_7382ea8b))
	{
		if(!zm_utility::is_player_valid(self, 0, var_67fee570, 0) || is_true(self.dontspeak))
		{
			return;
		}
		str_vo_alias = battlechatter::get_player_dialog_alias(var_7382ea8b);
		if(!isdefined(str_vo_alias))
		{
			/#
				if(getdvarint(#"hash_1a8d23951f456372", 0))
				{
					iprintlnbold((("" + function_9e72a96(var_7382ea8b)) + "") + function_9e72a96(self getmpdialogname()) + "");
					println((("" + function_9e72a96(var_7382ea8b)) + "") + function_9e72a96(self getmpdialogname()) + "");
				}
			#/
			return;
		}
		if(isdefined(n_delay) && n_delay > 0)
		{
			wait(n_delay);
		}
		if(isdefined(n_timeout))
		{
			if(isdefined(self.var_c93d56b6[var_7382ea8b]))
			{
				if(gettime() >= self.var_c93d56b6[var_7382ea8b])
				{
					self.var_c93d56b6[var_7382ea8b] = gettime() + (int(n_timeout * 1000));
				}
				else
				{
					return;
				}
			}
			else if(!isdefined(self.var_c93d56b6[var_7382ea8b]))
			{
				self.var_c93d56b6[var_7382ea8b] = gettime() + (int(n_timeout * 1000));
			}
		}
		dialogflags = 0;
		if(var_299a320)
		{
			dialogflags = dialogflags | 2;
		}
		if(var_b9582129)
		{
			dialogflags = dialogflags | 4;
		}
		self.isspeaking = 1;
		self.var_5b6ebfd0 = !var_299a320;
		self.str_vo_being_spoken = str_vo_alias;
		if(!isdefined(level.var_62281818))
		{
			level.var_62281818 = [];
		}
		else if(!isarray(level.var_62281818))
		{
			level.var_62281818 = array(level.var_62281818);
		}
		level.var_62281818[level.var_62281818.size] = self;
		var_2690dae = float(max((isdefined(soundgetplaybacktime(str_vo_alias)) ? soundgetplaybacktime(str_vo_alias) : 500), 500)) / 1000;
		/#
			if(getdvarint(#"hash_1a8d23951f456372", 0))
			{
				iprintlnbold((("" + function_9e72a96(str_vo_alias)) + "") + function_9e72a96(self getmpdialogname()) + "");
				println((("" + function_9e72a96(str_vo_alias)) + "") + function_9e72a96(self getmpdialogname()) + "");
			}
		#/
		self battlechatter::function_a48c33ff(str_vo_alias, dialogflags);
		var_be17187b = undefined;
		var_be17187b = self waittilltimeout(var_2690dae, #"done_speaking");
		self vo_clear();
	}
}

/*
	Name: function_7622cb70
	Namespace: zm_vo
	Checksum: 0x1E7D249B
	Offset: 0x39C0
	Size: 0x117C
	Parameters: 5
	Flags: Linked
*/
function function_7622cb70(var_b58a6345, n_delay, b_wait_if_busy, var_54c38d65, var_92885147)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 1;
	}
	if(!isdefined(var_92885147))
	{
		var_92885147 = 0;
	}
	self endon(#"death");
	self endoncallback(&function_58f7f768, #"hash_1ca30bf3bc01d214");
	if(!isdefined(var_b58a6345))
	{
		return;
	}
	if(isdefined(n_delay))
	{
		wait(n_delay);
	}
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(var_54c38d65))
	{
		if(!isdefined(var_54c38d65))
		{
			var_54c38d65 = [];
		}
		else if(!isarray(var_54c38d65))
		{
			var_54c38d65 = array(var_54c38d65);
		}
		if(level flag::get_any(var_54c38d65))
		{
			return;
		}
		level endoncallback(&function_58f7f768, var_54c38d65);
	}
	if(isplayer(self))
	{
		if(!var_92885147 && (function_d122265c(self) || function_c10c4064(self)))
		{
			if(b_wait_if_busy)
			{
				do
				{
					waitframe(1);
				}
				while(function_d122265c(self) || function_c10c4064(self));
			}
			else
			{
				return;
			}
		}
		str_vo_alias = self globallogic_audio::get_commander_dialog_alias(var_b58a6345);
		var_b4dd2e62 = self globallogic_audio::function_2523d20f(var_b58a6345);
	}
	else
	{
		players = function_a1ef346b();
		var_adc203cc = 0;
		foreach(player in players)
		{
			if(function_d122265c(player) || function_c10c4064(player))
			{
				var_adc203cc = 1;
				break;
			}
		}
		if(var_adc203cc)
		{
			if(b_wait_if_busy)
			{
				while(true)
				{
					var_adc203cc = 0;
					players = function_a1ef346b();
					foreach(player in players)
					{
						if(function_d122265c(player) || function_c10c4064(player))
						{
							var_adc203cc = 1;
							break;
						}
					}
					if(!var_adc203cc)
					{
						break;
					}
					waitframe(1);
				}
			}
			else
			{
				return;
			}
		}
		player = getplayers()[0];
		if(isplayer(player))
		{
			str_vo_alias = player globallogic_audio::get_commander_dialog_alias(var_b58a6345);
			var_b4dd2e62 = player globallogic_audio::function_2523d20f(var_b58a6345);
		}
		else
		{
			return;
		}
	}
	if(!isdefined(var_b4dd2e62))
	{
		var_b4dd2e62 = #"";
	}
	if(isdefined(str_vo_alias))
	{
		str_vo_alias = function_d3fc42dc(str_vo_alias);
		if(!isdefined(str_vo_alias))
		{
			return;
		}
		var_2690dae = float(max((isdefined(soundgetplaybacktime(str_vo_alias)) ? soundgetplaybacktime(str_vo_alias) : 500), 500)) / 1000;
		if(isplayer(self))
		{
			self thread globallogic_audio::leader_dialog_on_player(var_b58a6345, undefined, undefined, undefined, undefined, str_vo_alias);
			if(!isdefined(self.var_671911e9))
			{
				self.var_671911e9 = [];
			}
			else if(!isarray(self.var_671911e9))
			{
				self.var_671911e9 = array(self.var_671911e9);
			}
			self.var_671911e9[self.var_671911e9.size] = str_vo_alias;
			if(!isdefined(self.var_29e6a032))
			{
				self.var_29e6a032 = [];
			}
			else if(!isarray(self.var_29e6a032))
			{
				self.var_29e6a032 = array(self.var_29e6a032);
			}
			self.var_29e6a032[self.var_29e6a032.size] = var_b4dd2e62;
			self function_730589a6();
			self.dontspeak = 1;
			self thread function_68f1f3a6(str_vo_alias, var_b4dd2e62, self, var_2690dae);
			var_be17187b = undefined;
			var_be17187b = self waittilltimeout(var_2690dae, #"death", #"hash_73f839d8939452ad");
			arrayremovevalue(self.var_671911e9, str_vo_alias);
			arrayremovevalue(self.var_29e6a032, var_b4dd2e62);
			self function_730589a6();
			self.dontspeak = 0;
			self notify(str_vo_alias + "_end_vo_say_commander_line");
		}
		else
		{
			a_players = function_a1ef346b();
			level globallogic_audio::function_61e17de0(var_b58a6345, a_players, undefined, undefined, undefined, str_vo_alias);
			foreach(player in a_players)
			{
				if(!isdefined(player.var_671911e9))
				{
					player.var_671911e9 = [];
				}
				else if(!isarray(player.var_671911e9))
				{
					player.var_671911e9 = array(player.var_671911e9);
				}
				player.var_671911e9[player.var_671911e9.size] = str_vo_alias;
				if(!isdefined(player.var_29e6a032))
				{
					player.var_29e6a032 = [];
				}
				else if(!isarray(player.var_29e6a032))
				{
					player.var_29e6a032 = array(player.var_29e6a032);
				}
				player.var_29e6a032[player.var_29e6a032.size] = var_b4dd2e62;
				player function_730589a6();
				player.dontspeak = 1;
			}
			self thread function_68f1f3a6(str_vo_alias, var_b4dd2e62, a_players, var_2690dae);
			array::wait_till(a_players, [1:#"hash_73f839d8939452ad", 0:"death"], var_2690dae);
			foreach(player in a_players)
			{
				if(isdefined(player))
				{
					arrayremovevalue(player.var_671911e9, str_vo_alias);
					arrayremovevalue(player.var_29e6a032, var_b4dd2e62);
					player function_730589a6();
					player.dontspeak = 0;
				}
			}
			self notify(str_vo_alias + "_end_vo_say_commander_line");
		}
	}
	else
	{
		if(isplayer(self))
		{
			str_bundle = self.pers[level.var_7ee6af9f];
		}
		else
		{
			str_bundle = (isdefined(level.var_e2f95698) ? level.var_e2f95698 : getplayers()[0].pers[level.var_7ee6af9f]);
		}
		var_a6e45682 = getscriptbundle(str_bundle);
		if(isarray(var_a6e45682.conversations))
		{
			foreach(var_395a2c28 in var_a6e45682.conversations)
			{
				if(var_395a2c28.var_f34d52cb === var_b58a6345)
				{
					var_d8d8b84c = var_395a2c28;
					break;
				}
			}
		}
		if(!isdefined(var_d8d8b84c))
		{
			return;
		}
		if(isarray(var_d8d8b84c.var_aa02f35a) && var_d8d8b84c.var_aa02f35a.size)
		{
			var_ce5964ab = [];
			if(var_d8d8b84c.var_824bf975 === #"hash_74fb6372a49c7727")
			{
				var_73a92203 = array::random(var_d8d8b84c.var_aa02f35a);
				level.var_f6ea0657 = 1;
				if(isarray(level.var_a43447e4))
				{
					foreach(var_5c5fbd97 in level.var_a43447e4)
					{
						if(!isdefined(var_ce5964ab))
						{
							var_ce5964ab = [];
						}
						else if(!isarray(var_ce5964ab))
						{
							var_ce5964ab = array(var_ce5964ab);
						}
						if(!isinarray(var_ce5964ab, var_5c5fbd97))
						{
							var_ce5964ab[var_ce5964ab.size] = var_5c5fbd97;
						}
					}
				}
				self function_f2efbd1c(var_73a92203.var_46bd7973, var_73a92203.var_aebcb4b1, var_73a92203.var_f35c5951, undefined, var_ce5964ab);
			}
			else
			{
				if(var_d8d8b84c.var_824bf975 === #"timeline")
				{
					foreach(var_73a92203 in var_d8d8b84c.var_aa02f35a)
					{
						if(index == (var_d8d8b84c.var_aa02f35a.size - 1))
						{
							level.var_f6ea0657 = 1;
							if(isdefined(level.var_a43447e4))
							{
								foreach(var_5c5fbd97 in level.var_a43447e4)
								{
									if(!isdefined(var_ce5964ab))
									{
										var_ce5964ab = [];
									}
									else if(!isarray(var_ce5964ab))
									{
										var_ce5964ab = array(var_ce5964ab);
									}
									if(!isinarray(var_ce5964ab, var_5c5fbd97))
									{
										var_ce5964ab[var_ce5964ab.size] = var_5c5fbd97;
									}
								}
							}
							self function_f2efbd1c(var_73a92203.var_46bd7973, var_73a92203.var_aebcb4b1, var_73a92203.var_f35c5951, undefined, var_ce5964ab);
							continue;
						}
						level.var_f6ea0657 = 1;
						if(isdefined(level.var_a43447e4))
						{
							foreach(var_5c5fbd97 in level.var_a43447e4)
							{
								if(!isdefined(var_ce5964ab))
								{
									var_ce5964ab = [];
								}
								else if(!isarray(var_ce5964ab))
								{
									var_ce5964ab = array(var_ce5964ab);
								}
								if(!isinarray(var_ce5964ab, var_5c5fbd97))
								{
									var_ce5964ab[var_ce5964ab.size] = var_5c5fbd97;
								}
							}
						}
						self thread function_f2efbd1c(var_73a92203.var_46bd7973, var_73a92203.var_aebcb4b1, var_73a92203.var_f35c5951, undefined, var_ce5964ab);
					}
				}
				else
				{
					foreach(var_73a92203 in var_d8d8b84c.var_aa02f35a)
					{
						level.var_f6ea0657 = 1;
						if(isdefined(level.var_a43447e4))
						{
							foreach(var_5c5fbd97 in level.var_a43447e4)
							{
								if(!isdefined(var_ce5964ab))
								{
									var_ce5964ab = [];
								}
								else if(!isarray(var_ce5964ab))
								{
									var_ce5964ab = array(var_ce5964ab);
								}
								if(!isinarray(var_ce5964ab, var_5c5fbd97))
								{
									var_ce5964ab[var_ce5964ab.size] = var_5c5fbd97;
								}
							}
						}
						self function_f2efbd1c(var_73a92203.var_46bd7973, var_73a92203.var_aebcb4b1, undefined, var_73a92203.var_f35c5951, var_ce5964ab);
					}
				}
			}
			level.var_f6ea0657 = 0;
		}
	}
}

/*
	Name: function_730589a6
	Namespace: zm_vo
	Checksum: 0xC1751F5B
	Offset: 0x4B48
	Size: 0x114
	Parameters: 1
	Flags: Linked, Private
*/
function private function_730589a6(var_b4dd2e62)
{
	var_b4dd2e62 = self.var_29e6a032[self.var_29e6a032.size - 1];
	n_index = function_cb39455f(var_b4dd2e62);
	/#
		str_message = ((("" + n_index) + "") + (isdefined(var_b4dd2e62) ? var_b4dd2e62 : "") + "") + self getentitynumber();
		if(getdvarint(#"hash_1a8d23951f456372", 0))
		{
			iprintlnbold(str_message);
			println(str_message);
		}
	#/
	self clientfield::set_player_uimodel("zm_hud.commander_speaking", n_index);
}

/*
	Name: function_f2efbd1c
	Namespace: zm_vo
	Checksum: 0xBA610937
	Offset: 0x4C68
	Size: 0x63C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_f2efbd1c(var_64edfc97, var_b4dd2e62, var_dcfc156f, var_c736b731, var_ce5964ab)
{
	if(!isdefined(var_c736b731))
	{
		var_c736b731 = 0;
	}
	level endon(#"end_game");
	if(!isdefined(var_64edfc97))
	{
		return;
	}
	if(!isdefined(var_b4dd2e62))
	{
		var_b4dd2e62 = #"";
	}
	if(isdefined(var_dcfc156f))
	{
		wait(var_dcfc156f);
	}
	if(isplayer(self))
	{
		self endon(#"disconnect");
		if(isarray(var_ce5964ab))
		{
			if(isinarray(var_ce5964ab, self))
			{
				return;
			}
		}
		a_players = array(self);
	}
	else
	{
		a_players = getplayers();
		if(isarray(var_ce5964ab))
		{
			a_players = array::exclude(a_players, var_ce5964ab);
			if(a_players.size == 0)
			{
				return;
			}
		}
	}
	var_a44937e5 = var_64edfc97;
	var_64edfc97 = function_d3fc42dc(var_a44937e5);
	if(!isdefined(var_64edfc97))
	{
		/#
			if(getdvarint(#"hash_1a8d23951f456372", 0))
			{
				iprintlnbold(("" + function_9e72a96(var_a44937e5)) + "");
				println(("" + function_9e72a96(var_a44937e5)) + "");
			}
		#/
		return;
	}
	/#
		str_bundle = (isdefined(level.var_e2f95698) ? level.var_e2f95698 : a_players[0].pers[level.var_7ee6af9f]);
		if(getdvarint(#"hash_1a8d23951f456372", 0))
		{
			iprintlnbold((function_9e72a96(str_bundle) + "") + function_9e72a96(var_a44937e5));
			println((function_9e72a96(str_bundle) + "") + function_9e72a96(var_a44937e5));
		}
	#/
	foreach(player in a_players)
	{
		player playlocalsound(var_64edfc97);
		if(!isdefined(player.var_671911e9))
		{
			player.var_671911e9 = [];
		}
		else if(!isarray(player.var_671911e9))
		{
			player.var_671911e9 = array(player.var_671911e9);
		}
		player.var_671911e9[player.var_671911e9.size] = var_64edfc97;
		if(!isdefined(player.var_29e6a032))
		{
			player.var_29e6a032 = [];
		}
		else if(!isarray(player.var_29e6a032))
		{
			player.var_29e6a032 = array(player.var_29e6a032);
		}
		player.var_29e6a032[player.var_29e6a032.size] = var_b4dd2e62;
		player function_730589a6();
		player.dontspeak = 1;
	}
	var_2690dae = float(max((isdefined(soundgetplaybacktime(var_64edfc97)) ? soundgetplaybacktime(var_64edfc97) : 500), 500)) / 1000;
	self thread function_68f1f3a6(var_64edfc97, var_b4dd2e62, a_players, var_2690dae + var_c736b731);
	wait(var_2690dae + var_c736b731);
	foreach(player in a_players)
	{
		if(isdefined(player))
		{
			arrayremovevalue(player.var_671911e9, var_64edfc97);
			arrayremovevalue(player.var_29e6a032, var_b4dd2e62);
			player function_730589a6();
			player.dontspeak = 0;
			player notify(#"hash_73f839d8939452ad");
		}
	}
	self notify(var_64edfc97 + "_end_vo_say_commander_line");
}

/*
	Name: function_68f1f3a6
	Namespace: zm_vo
	Checksum: 0x1F2010DD
	Offset: 0x52B0
	Size: 0x1AC
	Parameters: 4
	Flags: Linked
*/
function function_68f1f3a6(var_64edfc97, var_b4dd2e62, a_players, n_wait)
{
	if(!isdefined(a_players))
	{
		a_players = [];
	}
	else if(!isarray(a_players))
	{
		a_players = array(a_players);
	}
	self endon(var_64edfc97 + "_end_vo_say_commander_line");
	self waittilltimeout(n_wait + (float(function_60d95f53()) / 1000), #"hash_1ca30bf3bc01d214");
	foreach(player in a_players)
	{
		if(isdefined(player))
		{
			arrayremovevalue(player.var_671911e9, var_64edfc97);
			arrayremovevalue(player.var_29e6a032, var_b4dd2e62);
			player function_730589a6();
			player.dontspeak = 0;
			player notify(#"hash_73f839d8939452ad");
		}
	}
}

/*
	Name: function_1ac9c00e
	Namespace: zm_vo
	Checksum: 0x428358CA
	Offset: 0x5468
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_1ac9c00e(var_4dbbc41f)
{
	self endon(#"death");
	for(i = 0; i < var_4dbbc41f.size; i++)
	{
		self function_d6f8bbd9(var_4dbbc41f[i]);
	}
}

/*
	Name: function_58f7f768
	Namespace: zm_vo
	Checksum: 0xE7097EB7
	Offset: 0x54D0
	Size: 0xE0
	Parameters: 1
	Flags: Linked
*/
function function_58f7f768(str_notify)
{
	if(isplayer(self))
	{
		self function_604084ea();
	}
	else
	{
		players = getplayers();
		foreach(player in players)
		{
			player function_604084ea();
		}
	}
}

/*
	Name: function_604084ea
	Namespace: zm_vo
	Checksum: 0x110F17A
	Offset: 0x55B8
	Size: 0xE6
	Parameters: 0
	Flags: Linked
*/
function function_604084ea()
{
	foreach(vo in self.var_671911e9)
	{
		self stopsound(vo);
	}
	self.var_671911e9 = [];
	self.var_29e6a032 = [];
	self function_730589a6();
	self.dontspeak = 0;
	self globallogic_audio::flush_dialog_on_player();
	self notify(#"hash_73f839d8939452ad");
}

/*
	Name: function_c4303dda
	Namespace: zm_vo
	Checksum: 0xBD50BF34
	Offset: 0x56A8
	Size: 0x344
	Parameters: 3
	Flags: Linked
*/
function function_c4303dda(str_vo_alias, n_delay, b_wait_if_busy)
{
	self endoncallback(&vo_clear, #"death");
	var_d9dd4565 = str_vo_alias;
	str_vo_alias = function_d3fc42dc(var_d9dd4565);
	if(!isdefined(str_vo_alias))
	{
		/#
			if(getdvarint(#"hash_1a8d23951f456372", 0))
			{
				iprintlnbold(("" + function_9e72a96(var_d9dd4565)) + "");
				println(("" + function_9e72a96(var_d9dd4565)) + "");
			}
		#/
		return;
	}
	if(isdefined(n_delay))
	{
		wait(n_delay);
	}
	if(isplayer(self))
	{
		if(function_d122265c(self) || function_c10c4064(self))
		{
			if(is_true(b_wait_if_busy))
			{
				do
				{
					waitframe(1);
				}
				while(function_d122265c(self) || function_c10c4064(self));
			}
			else if(is_false(b_wait_if_busy))
			{
				return;
			}
		}
	}
	else
	{
		return;
	}
	/#
		if(getdvarint(#"hash_1a8d23951f456372", 0))
		{
			iprintlnbold("" + function_9e72a96(str_vo_alias));
			println("" + function_9e72a96(str_vo_alias));
		}
	#/
	self.str_vo_being_spoken = str_vo_alias;
	self.isspeaking = 1;
	self playlocalsound(str_vo_alias);
	var_2690dae = float(max((isdefined(soundgetplaybacktime(str_vo_alias)) ? soundgetplaybacktime(str_vo_alias) : 500), 500)) / 1000;
	/#
		iprintlnbold(("" + var_2690dae) + "");
	#/
	wait(var_2690dae);
	self vo_clear();
}

/*
	Name: function_d6f8bbd9
	Namespace: zm_vo
	Checksum: 0xFD13AB2
	Offset: 0x59F8
	Size: 0x46C
	Parameters: 4
	Flags: Linked
*/
function function_d6f8bbd9(str_vo_alias, n_delay, a_players, b_wait_if_busy)
{
	self endoncallback(&vo_clear, #"death");
	if(!isentity(self) && isdefined(a_players))
	{
		if(!isdefined(a_players))
		{
			a_players = [];
		}
		else if(!isarray(a_players))
		{
			a_players = array(a_players);
		}
		foreach(player in a_players)
		{
			if(isalive(player))
			{
				player thread function_c4303dda(str_vo_alias, n_delay, b_wait_if_busy);
			}
		}
	}
	else
	{
		var_d9dd4565 = str_vo_alias;
		str_vo_alias = function_d3fc42dc(var_d9dd4565);
		if(!isdefined(str_vo_alias))
		{
			/#
				if(getdvarint(#"hash_1a8d23951f456372", 0))
				{
					iprintlnbold(("" + function_9e72a96(var_d9dd4565)) + "");
					println(("" + function_9e72a96(var_d9dd4565)) + "");
				}
			#/
			return;
		}
		if(isdefined(n_delay))
		{
			wait(n_delay);
		}
		/#
			if(getdvarint(#"hash_1a8d23951f456372", 0))
			{
				iprintlnbold("" + function_9e72a96(str_vo_alias));
				println("" + function_9e72a96(str_vo_alias));
			}
		#/
		self.str_vo_being_spoken = str_vo_alias;
		self.isspeaking = 1;
		if(isdefined(a_players))
		{
			if(!isdefined(a_players))
			{
				a_players = [];
			}
			else if(!isarray(a_players))
			{
				a_players = array(a_players);
			}
			foreach(player in a_players)
			{
				self playsoundtoplayer(str_vo_alias, player);
			}
		}
		else
		{
			self playsound(str_vo_alias);
		}
	}
	var_2690dae = float(max((isdefined(soundgetplaybacktime(str_vo_alias)) ? soundgetplaybacktime(str_vo_alias) : 500), 500)) / 1000;
	/#
		iprintlnbold(("" + var_2690dae) + "");
	#/
	wait(var_2690dae);
	self vo_clear();
}

/*
	Name: function_d3fc42dc
	Namespace: zm_vo
	Checksum: 0xBFF44DC7
	Offset: 0x5E70
	Size: 0x4A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d3fc42dc(str_vo_alias)
{
	var_db4208eb = zm_audio::get_valid_lines(str_vo_alias);
	str_vo_alias = array::random(var_db4208eb);
	return str_vo_alias;
}

/*
	Name: function_45e29f06
	Namespace: zm_vo
	Checksum: 0xDA353AF7
	Offset: 0x5EC8
	Size: 0xAA
	Parameters: 0
	Flags: None
*/
function function_45e29f06()
{
	var_5eb47b1d = function_a1ef346b();
	foreach(player in var_5eb47b1d)
	{
		if(function_d122265c(player))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_d122265c
	Namespace: zm_vo
	Checksum: 0xC0C35F41
	Offset: 0x5F80
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function function_d122265c(e_player)
{
	if(!isdefined(e_player) && isplayer(self))
	{
		e_player = self;
	}
	if(isalive(e_player) && is_true(e_player.isspeaking))
	{
		return true;
	}
	return false;
}

/*
	Name: function_c10c4064
	Namespace: zm_vo
	Checksum: 0x2C5E3CF
	Offset: 0x6000
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function function_c10c4064(e_player)
{
	if(!isdefined(e_player) && isplayer(self))
	{
		e_player = self;
	}
	if(isalive(e_player) && isarray(e_player.var_671911e9) && e_player.var_671911e9.size)
	{
		return true;
	}
	return false;
}

/*
	Name: function_a2bd5a0c
	Namespace: zm_vo
	Checksum: 0x78BE481B
	Offset: 0x6098
	Size: 0x3E
	Parameters: 7
	Flags: None
*/
function function_a2bd5a0c(var_cadd3b0c, n_delay, b_wait_if_busy, n_priority, var_34e7887, var_d7714e4e, var_67fee570)
{
	return false;
}

/*
	Name: function_8e0f4696
	Namespace: zm_vo
	Checksum: 0x6C4698D9
	Offset: 0x60E0
	Size: 0x46
	Parameters: 8
	Flags: Linked
*/
function function_8e0f4696(str_vo_alias, n_delay, b_wait_if_busy, n_priority, var_34e7887, var_d7714e4e, var_9c64da7c, var_67fee570)
{
	return false;
}

/*
	Name: function_cf1e151c
	Namespace: zm_vo
	Checksum: 0x8D9D94B0
	Offset: 0x6130
	Size: 0x4C
	Parameters: 5
	Flags: None
*/
function function_cf1e151c(var_3608d414, var_604e94aa, b_wait_if_busy, n_priority, var_34e7887)
{
	if(!isdefined(var_34e7887))
	{
		var_34e7887 = [];
	}
	b_played = 0;
	return b_played;
}

/*
	Name: function_7e4562d7
	Namespace: zm_vo
	Checksum: 0xBF730F11
	Offset: 0x6188
	Size: 0x6A
	Parameters: 7
	Flags: None
*/
function function_7e4562d7(var_3505e2ee, var_604e94aa, b_wait_if_busy, n_priority, var_34e7887, var_39ed8245, var_dcc9a85f)
{
	if(!isdefined(var_dcc9a85f))
	{
		var_dcc9a85f = [];
	}
	b_played = 0;
	var_cd5bda0c = [];
	return b_played;
}

/*
	Name: function_57b8cd17
	Namespace: zm_vo
	Checksum: 0x9CAD8BC5
	Offset: 0x6200
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_57b8cd17()
{
	if(isdefined(self.str_vo_being_spoken) && self.str_vo_being_spoken != "")
	{
		if(isplayer(self))
		{
			self battlechatter::stop_dialog(self.str_vo_being_spoken);
		}
		else
		{
			self stopsound(self.str_vo_being_spoken);
		}
	}
	vo_clear();
}

/*
	Name: function_3c173d37
	Namespace: zm_vo
	Checksum: 0x7DE0E054
	Offset: 0x6298
	Size: 0x110
	Parameters: 2
	Flags: None
*/
function function_3c173d37(v_pos, n_range)
{
	if(!isdefined(n_range))
	{
		n_range = 1000;
	}
	level notify(#"hash_1ca30bf3bc01d214");
	foreach(player in getplayers())
	{
		if(!isdefined(v_pos) || distancesquared(player.origin, v_pos) <= (n_range * n_range))
		{
			player function_604084ea();
			player function_57b8cd17();
		}
	}
}

/*
	Name: function_82f9bc9f
	Namespace: zm_vo
	Checksum: 0x27C68914
	Offset: 0x63B0
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function function_82f9bc9f()
{
	return "NONE";
}

/*
	Name: function_cb39455f
	Namespace: zm_vo
	Checksum: 0x615A5AA7
	Offset: 0x63C8
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_cb39455f(speaker)
{
	if(!isdefined(speaker) || speaker == #"" || !isdefined(level.a_speakers))
	{
		return 0;
	}
	for(i = 0; i < level.a_speakers.dialogspeakers.size; i++)
	{
		if(speaker === level.a_speakers.dialogspeakers[i].speaker)
		{
			return i + 1;
		}
	}
	return 0;
}

/*
	Name: function_7bed52a
	Namespace: zm_vo
	Checksum: 0x6E0F8968
	Offset: 0x6480
	Size: 0x2A0
	Parameters: 3
	Flags: Linked, Private
*/
function private function_7bed52a(killstreaktype, team, killstreakid)
{
	if(!isdefined(killstreaktype) || !isdefined(killstreakid))
	{
		return;
	}
	self notify("killstreak_start_" + killstreaktype);
	self notify("killstreak_start_inventory_" + killstreaktype);
	scriptbundle = level.killstreaks[killstreaktype].script_bundle;
	dialogkey = scriptbundle.var_2451b1f2;
	if(level.teambased)
	{
		if(!isdefined(self.currentkillstreakdialog))
		{
			self thread battlechatter::function_fff18afc(scriptbundle.var_c236921c, scriptbundle.var_f5871fe4);
		}
		if(isdefined(level.killstreakrules[killstreaktype]) && level.killstreakrules[killstreaktype].curteam[team] > 1)
		{
			dialogkey = scriptbundle.var_7742570a;
		}
	}
	else
	{
		if(!isdefined(self.currentkillstreakdialog) && isdefined(scriptbundle.var_c236921c))
		{
			self thread battlechatter::function_576ff6fe(killstreaktype);
		}
		if(isdefined(level.killstreakrules[killstreaktype]) && level.killstreakrules[killstreaktype].cur > 1)
		{
			dialogkey = scriptbundle.var_7742570a;
		}
	}
	if(!isdefined(scriptbundle.var_e23aed46) || scriptbundle.var_e23aed46 <= 0)
	{
		globallogic_audio::leader_dialog_for_other_teams(dialogkey, team, undefined, killstreakid);
	}
	else
	{
		foreach(currentteam, _ in level.teams)
		{
			if(currentteam != team)
			{
				players = getplayers(currentteam, self.origin, scriptbundle.var_e23aed46);
				globallogic_audio::function_61e17de0(dialogkey, players, undefined, killstreakid);
			}
		}
	}
}

/*
	Name: function_3d6e0cd9
	Namespace: zm_vo
	Checksum: 0x6B3ADFE6
	Offset: 0x6728
	Size: 0x74
	Parameters: 7
	Flags: Linked, Private
*/
function private function_3d6e0cd9(dialogkey, killstreaktype, killstreakid, var_46bd7973, var_8a6b001a, weapon, priority)
{
	if(namespace_cf6efd05::function_85b812c9())
	{
		return;
	}
	self globallogic_audio::play_taacom_dialog(dialogkey, killstreaktype, killstreakid, var_46bd7973, var_8a6b001a, weapon, priority);
}

/*
	Name: function_3cf68327
	Namespace: zm_vo
	Checksum: 0x47061429
	Offset: 0x67A8
	Size: 0xB4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_3cf68327(dialogkey, killstreaktype, killstreakid)
{
	/#
		assert(isdefined(dialogkey));
	#/
	/#
		assert(isdefined(killstreaktype));
	#/
	if(!isdefined(self.owner) || !isdefined(self.team) || self.team != self.owner.team)
	{
		return;
	}
	self.owner play_taacom_dialog_response(dialogkey, killstreaktype, killstreakid, self.pilotindex);
}

/*
	Name: play_taacom_dialog_response
	Namespace: zm_vo
	Checksum: 0x1FEA36DB
	Offset: 0x6868
	Size: 0x7C
	Parameters: 4
	Flags: Linked
*/
function play_taacom_dialog_response(dialogkey, killstreaktype, killstreakid, pilotindex)
{
	/#
		assert(isdefined(dialogkey));
	#/
	/#
		assert(isdefined(killstreaktype));
	#/
	if(!isdefined(pilotindex))
	{
		return;
	}
	self play_taacom_dialog(dialogkey + pilotindex, killstreaktype, killstreakid);
}

/*
	Name: play_taacom_dialog
	Namespace: zm_vo
	Checksum: 0xE48267B8
	Offset: 0x68F0
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function play_taacom_dialog(dialogkey, killstreaktype, killstreakid, var_46bd7973, var_8a6b001a, weapon, priority)
{
	if(isdefined(level.play_taacom_dialog))
	{
		self [[level.play_taacom_dialog]](dialogkey, killstreaktype, killstreakid, var_46bd7973, var_8a6b001a, weapon, priority);
	}
}

/*
	Name: play_pilot_dialog
	Namespace: zm_vo
	Checksum: 0xD1A0B96
	Offset: 0x6968
	Size: 0x50
	Parameters: 4
	Flags: Linked
*/
function play_pilot_dialog(dialogkey, killstreaktype, killstreakid, pilotindex)
{
	if(isdefined(level.play_pilot_dialog))
	{
		self [[level.play_pilot_dialog]](dialogkey, killstreaktype, killstreakid, pilotindex);
	}
}

/*
	Name: function_9716fce9
	Namespace: zm_vo
	Checksum: 0x853001AF
	Offset: 0x69C0
	Size: 0xCC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_9716fce9(dialogkey, killstreaktype, killstreakid)
{
	if(!isdefined(self.owner) || !isdefined(self.owner.team) || !isdefined(self.team) || self.team != self.owner.team)
	{
		return;
	}
	if(dialogkey === "timecheck" && is_true(self.completely_shutdown))
	{
		return;
	}
	self.owner play_pilot_dialog(dialogkey, killstreaktype, killstreakid, self.pilotindex);
}

/*
	Name: function_f6370f75
	Namespace: zm_vo
	Checksum: 0xB255022
	Offset: 0x6A98
	Size: 0x5C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_f6370f75(dialogkey, killstreaktype, killstreakid, pilotindex)
{
	if(!isdefined(killstreaktype) || !isdefined(pilotindex))
	{
		return;
	}
	self globallogic_audio::killstreak_dialog_on_player(dialogkey, killstreaktype, killstreakid, pilotindex);
}

