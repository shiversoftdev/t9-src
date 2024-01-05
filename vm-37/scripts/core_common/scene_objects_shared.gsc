#using scripts\core_common\scene_vehicle_shared.gsc;
#using scripts\core_common\scene_model_shared.gsc;
#using scripts\core_common\scene_actor_shared.gsc;
#using scripts\core_common\scene_player_shared.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\teleport_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;

class csceneobject 
{
	var _s;
	var _e;
	var _o_scene;
	var var_55b4f21e;
	var _str_shot;
	var var_35ec7ac3;
	var _scene_object;
	var _n_ent_num;
	var m_tag;
	var var_f4b34dc1;
	var m_align;
	var _str_name;
	var current_playing_anim;
	var _str_team;
	var _func_get;
	var _str_current_anim;
	var var_4da22aea;
	var _b_first_frame;
	var var_84ca3312;
	var _n_blend;
	var _b_active_anim;
	var var_1f97724a;
	var var_acbd43ee;
	var var_efc540b6;
	var var_2a306f8a;

	/*
		Name: constructor
		Namespace: csceneobject
		Checksum: 0x1E9CD3C8
		Offset: 0x8E0
		Size: 0x36
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self._b_first_frame = 0;
		self._b_active_anim = 0;
		self._n_blend = 0;
		self.var_84ca3312 = "linear";
	}

	/*
		Name: destructor
		Namespace: csceneobject
		Checksum: 0x402BDD7A
		Offset: 0x920
		Size: 0x24
		Parameters: 0
		Flags: Linked, 16
	*/
	destructor()
	{
		/#
			log("");
		#/
	}

	/*
		Name: is_actor
		Namespace: csceneobject
		Checksum: 0xEB722D9
		Offset: 0x9020
		Size: 0x46
		Parameters: 0
		Flags: Linked
	*/
	function is_actor()
	{
		return _s.type === "actor" && !is_true(_s.var_615b1f16);
	}

	/*
		Name: in_a_different_scene
		Namespace: csceneobject
		Checksum: 0x48D90D28
		Offset: 0x91E8
		Size: 0x4A
		Parameters: 0
		Flags: Linked
	*/
	function in_a_different_scene()
	{
		return isdefined(_e) && isdefined(_e.current_scene) && _e.current_scene != _o_scene._str_name;
	}

	/*
		Name: function_9a43e31
		Namespace: csceneobject
		Checksum: 0xE5A03775
		Offset: 0x61D0
		Size: 0x546
		Parameters: 3
		Flags: Linked
	*/
	function function_9a43e31(player, var_6410e385, b_camera)
	{
		if(!isdefined(b_camera))
		{
			b_camera = 0;
		}
		if(isdefined(player))
		{
			/#
				var_cd31cd6a = getdvarstring(#"hash_575aeb603638c901", "");
				if(isdefined(player.var_96494502) || var_cd31cd6a != "")
				{
					weapon = (isdefined(player.var_96494502) ? player.var_96494502 : getweapon(var_cd31cd6a));
				}
			#/
			if(!isdefined(weapon))
			{
				if(isdefined(player.var_777951c))
				{
					weapon = player.var_777951c;
				}
				else if(isplayer(player))
				{
					weapon = player getcurrentweapon();
				}
				if(!isdefined(weapon))
				{
					return var_6410e385;
				}
			}
			if(isplayer(player))
			{
				str_gender = player getplayergendertype();
			}
			else
			{
				str_gender = player.str_gender;
			}
			var_c4a23d1d = function_5b2306f5(weapon, str_gender, b_camera);
			if(isdefined(var_c4a23d1d))
			{
				return var_c4a23d1d;
			}
			if(b_camera)
			{
				if(!isdefined(weapon))
				{
					return var_6410e385;
				}
				if(weapons::ispunch(weapon))
				{
					var_c4a23d1d = var_55b4f21e.var_93cee122;
				}
				else
				{
					if(weapons::isnonbarehandsmelee(weapon))
					{
						var_c4a23d1d = var_55b4f21e.var_cc0769ae;
					}
					else
					{
						if(is_true(weapon.isrocketlauncher))
						{
							var_c4a23d1d = var_55b4f21e.var_30d1fd4b;
						}
						else if(weapons::ispistol(weapon))
						{
							var_c4a23d1d = var_55b4f21e.var_7118e947;
						}
					}
				}
			}
			else
			{
				if(weapons::ispunch(weapon))
				{
					if(str_gender === "female")
					{
						var_c4a23d1d = (isdefined(var_55b4f21e.var_8cf3a21a) ? var_55b4f21e.var_8cf3a21a : var_55b4f21e.var_a190f06e);
					}
					else
					{
						var_c4a23d1d = var_55b4f21e.var_a190f06e;
					}
				}
				else
				{
					if(weapons::isnonbarehandsmelee(weapon))
					{
						if(str_gender === "female")
						{
							var_c4a23d1d = (isdefined(var_55b4f21e.var_3be9d7cf) ? var_55b4f21e.var_3be9d7cf : var_55b4f21e.var_bb64ee8c);
						}
						else
						{
							var_c4a23d1d = var_55b4f21e.var_bb64ee8c;
						}
					}
					else
					{
						if(is_true(weapon.isrocketlauncher))
						{
							if(str_gender === "female")
							{
								var_c4a23d1d = (isdefined(var_55b4f21e.var_dee605a0) ? var_55b4f21e.var_dee605a0 : var_55b4f21e.var_51c09589);
							}
							else
							{
								var_c4a23d1d = var_55b4f21e.var_51c09589;
							}
						}
						else if(weapons::ispistol(weapon, 1))
						{
							if(str_gender === "female")
							{
								var_c4a23d1d = (isdefined(var_55b4f21e.var_91ecd04) ? var_55b4f21e.var_91ecd04 : var_55b4f21e.var_389b3f9b);
							}
							else
							{
								var_c4a23d1d = var_55b4f21e.var_389b3f9b;
							}
						}
					}
				}
				if(str_gender === "female")
				{
					var_c4a23d1d = (isdefined(var_c4a23d1d) ? var_c4a23d1d : var_55b4f21e.var_1f836d8f);
				}
			}
		}
		if(!sessionmodeiscampaigngame() && is_true(weapon.isdualwield) && player haspart("tag_weapon_left") && !b_camera)
		{
			player.var_dd38a3bc = 1;
		}
		return (isdefined(var_c4a23d1d) ? var_c4a23d1d : var_6410e385);
	}

	/*
		Name: function_d09b043
		Namespace: csceneobject
		Checksum: 0x80F724D1
		Offset: 0x1DC0
		Size: 0x4
		Parameters: 0
		Flags: Linked
	*/
	function function_d09b043()
	{
	}

	/*
		Name: function_ee94f77
		Namespace: csceneobject
		Checksum: 0xEE9383F7
		Offset: 0x35A8
		Size: 0x34
		Parameters: 0
		Flags: Linked
	*/
	function function_ee94f77()
	{
		function_dd4f74e1();
		function_587971b6();
		function_ebbbd00d();
	}

	/*
		Name: function_1205d1f0
		Namespace: csceneobject
		Checksum: 0x73B7E75
		Offset: 0x5350
		Size: 0xCE
		Parameters: 0
		Flags: Linked
	*/
	function function_1205d1f0()
	{
		if(isdefined(_e.var_5b7900ec))
		{
			var_50b24637 = 0;
			foreach(var_74f5d118 in _e.var_5b7900ec)
			{
				if(var_74f5d118)
				{
					var_50b24637++;
					if(var_50b24637 == _e.var_5b7900ec.size)
					{
						return true;
					}
				}
			}
		}
		return false;
	}

	/*
		Name: function_128f0294
		Namespace: csceneobject
		Checksum: 0x545C178B
		Offset: 0x5C00
		Size: 0x224
		Parameters: 2
		Flags: Linked
	*/
	function function_128f0294(s_shot, var_37fa9b04)
	{
		str_mod = var_37fa9b04.mod;
		switch(str_mod)
		{
			case "mod_rifle_bullet":
			case "mod_pistol_bullet":
			{
				if(is_true(s_shot.var_163ca9fa) || is_true(s_shot.var_b3dddfd3))
				{
					return true;
				}
				break;
			}
			case "mod_explosive":
			case "mod_grenade":
			case "mod_grenade_splash":
			{
				if(is_true(s_shot.var_dbd0fa6f) || is_true(s_shot.var_b3dddfd3))
				{
					return true;
				}
				break;
			}
			case "mod_projectile":
			case "mod_projectile_splash":
			{
				if(is_true(s_shot.var_650063ca) || is_true(s_shot.var_b3dddfd3))
				{
					return true;
				}
				break;
			}
			case "mod_melee_weapon_butt":
			case "mod_melee":
			{
				if(is_true(s_shot.var_efd784b6) || is_true(s_shot.var_b3dddfd3))
				{
					return true;
				}
				break;
			}
			default:
			{
				if(is_true(s_shot.var_b3dddfd3))
				{
					return true;
				}
			}
		}
		return false;
	}

	/*
		Name: function_14f96d6b
		Namespace: csceneobject
		Checksum: 0x581614BA
		Offset: 0x4AD0
		Size: 0x32C
		Parameters: 0
		Flags: Linked
	*/
	function function_14f96d6b()
	{
		_e endoncallback(&function_20f309bf, #"delete", #"scene_stop", #"stop_tracking_damage_scene_ent");
		_o_scene endon(#"scene_done", #"scene_stop", #"hash_42da41892ac54794");
		_e setcandamage(1);
		function_23575fad();
		_o_scene.var_2bc31f02 = 1;
		foreach(s_shot in _s.shots)
		{
			if(s_shot.name === "init")
			{
				_e.var_5b7900ec[s_shot.name] = 1;
				continue;
			}
			if(function_f12c5e67(s_shot))
			{
				_e.var_5b7900ec[s_shot.name] = 0;
			}
		}
		if(is_true(_s.var_2baad8fc))
		{
			_e util::function_5d36c37a();
		}
		while(true)
		{
			flag::set(#"waiting_for_damage");
			var_37fa9b04 = undefined;
			var_37fa9b04 = _e waittill(#"damage", #"death");
			if(!isdefined(_e))
			{
				return;
			}
			if(isdefined(_e.n_health))
			{
				waittillframeend();
			}
			foreach(s_shot in _s.shots)
			{
				function_72f549e0(s_shot, var_37fa9b04);
			}
			if(is_true(_e.var_4819ae76))
			{
				return;
			}
		}
	}

	/*
		Name: _spawn_ent
		Namespace: csceneobject
		Checksum: 0x80F724D1
		Offset: 0x8998
		Size: 0x4
		Parameters: 0
		Flags: Linked
	*/
	function _spawn_ent()
	{
	}

	/*
		Name: error
		Namespace: csceneobject
		Checksum: 0xD803C429
		Offset: 0x9A78
		Size: 0x178
		Parameters: 2
		Flags: Linked
	*/
	function error(condition, str_msg)
	{
		if(condition)
		{
			/#
				loc_00009B08:
				str_msg = (((("" + function_9e72a96(_o_scene._str_name)) + "") + (isdefined(_str_shot) ? "" + _str_shot : (isdefined("") ? "" + "" : "")) + "") + (isdefined(_s.name) ? "" + _s.name : (isdefined("") ? "" + "" : "")) + "") + str_msg;
			#/
			if(is_true(_o_scene._b_testing))
			{
				/#
					scene::error_on_screen(str_msg);
				#/
			}
			else
			{
				/#
					assertmsg(str_msg);
				#/
			}
			thread [[ _o_scene ]]->on_error();
			return true;
		}
		return false;
	}

	/*
		Name: cleanup
		Namespace: csceneobject
		Checksum: 0x3D23111A
		Offset: 0x4000
		Size: 0x314
		Parameters: 0
		Flags: Linked
	*/
	function cleanup()
	{
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				printtoprightln("" + (isdefined(_s.name) ? _s.name : _s.model));
			}
		#/
		function_fda037ff();
		if(flag::get(_str_shot + "active") && !flag::get(#"waiting_for_damage"))
		{
			b_finished = flag::get(_str_shot + "finished");
			b_stopped = flag::get(_str_shot + "stopped");
			if(isdefined(_e) && !isplayer(_e))
			{
				_e sethighdetail(0);
				function_638ad737(_str_shot);
			}
			if(is_true(_e.var_dd38a3bc) && _e haspart("tag_weapon_left"))
			{
				_e.var_dd38a3bc = undefined;
			}
			[[ self ]]->_cleanup();
			if(isdefined(_e) && !isplayer(_e))
			{
				_e._scene_object = undefined;
				_e.current_scene = undefined;
				_e.anim_debug_name = undefined;
				_e flag::clear(#"scene");
			}
			if(is_alive())
			{
				if(isactor(_e) && isdefined(var_35ec7ac3))
				{
					_e function_941131ef(var_35ec7ac3);
				}
				[[ self ]]->_reset_values();
			}
		}
		flag::clear(_str_shot + "active");
	}

	/*
		Name: function_1e19d813
		Namespace: csceneobject
		Checksum: 0x396D10B1
		Offset: 0x24E0
		Size: 0x304
		Parameters: 0
		Flags: Linked
	*/
	function function_1e19d813()
	{
		if(isdefined(_o_scene._e_root))
		{
			_o_scene._e_root notify(#"hash_4e8860ad89fcf927", {#str_scene:_o_scene._str_name, #hash_fbd6d50c:_e});
		}
		if(isdefined(_o_scene._e_root) && isdefined(_o_scene._e_root.target))
		{
			var_c17a3b30 = getnode(_o_scene._e_root.target, "targetname");
			if(isdefined(var_c17a3b30) && is_true(var_c17a3b30.var_514e7397))
			{
				var_c17a3b30.var_31c05612 = 1;
			}
		}
		if(is_true(_s.var_d318cc2c))
		{
			if(isdefined(_o_scene._e_root) && isdefined(_o_scene._e_root.scene_played))
			{
				foreach(str_shot in _o_scene.var_5a2219f0)
				{
					_o_scene._e_root.scene_played[str_shot] = 1;
				}
			}
			if(isdefined(_o_scene._a_objects))
			{
				foreach(obj in _o_scene._a_objects)
				{
					if(isdefined(obj._e) && obj._s.type === "prop")
					{
						obj._e animation::stop();
						[[ obj ]]->function_2f4c1d30(obj._e);
					}
				}
			}
			thread [[ _o_scene ]]->stop();
		}
	}

	/*
		Name: function_2035b6d6
		Namespace: csceneobject
		Checksum: 0x4C00F9F9
		Offset: 0x4668
		Size: 0xD4
		Parameters: 1
		Flags: Linked
	*/
	function function_2035b6d6(_e)
	{
		_e notify(#"cleanupdelete");
		_e endon(#"death", #"preparedelete", #"cleanupdelete");
		s_waitresult = undefined;
		s_waitresult = _o_scene waittilltimeout(0.15, #"hash_60adeaccbb565546", #"scene_stop", #"scene_done", #"scene_skip_completed");
		_e thread scene::synced_delete(_o_scene._str_name);
	}

	/*
		Name: function_209522a0
		Namespace: csceneobject
		Checksum: 0x1BD05385
		Offset: 0x8EE0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_209522a0()
	{
		return _s.type === "playeroutfit";
	}

	/*
		Name: _cleanup
		Namespace: csceneobject
		Checksum: 0x80F724D1
		Offset: 0x4748
		Size: 0x4
		Parameters: 0
		Flags: Linked
	*/
	function _cleanup()
	{
	}

	/*
		Name: function_20f309bf
		Namespace: csceneobject
		Checksum: 0x6C431491
		Offset: 0x4E08
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_20f309bf(str_notify)
	{
		if(str_notify == "stop_tracking_damage_scene_ent" || str_notify == "delete")
		{
			if(isdefined(_scene_object))
			{
				self.var_4819ae76 = 1;
				self.health = 0;
				_scene_object thread function_ea176ba9();
			}
		}
	}

	/*
		Name: _play_anim
		Namespace: csceneobject
		Checksum: 0xAA17C711
		Offset: 0x7B60
		Size: 0x78C
		Parameters: 7
		Flags: Linked
	*/
	function _play_anim(animation, n_rate, n_blend, var_b2e32ae2, n_time, var_7d32b2c6, paused)
	{
		n_lerp = (isdefined(var_7d32b2c6) ? var_7d32b2c6 : get_lerp_time());
		if(_e.scene_spawned === _o_scene._s.name || _o_scene._s scene::is_igc())
		{
			if(n_lerp == 0)
			{
				_e dontinterpolate();
			}
			_e flag::set(#"hash_7cddd51e45d3ff3e");
		}
		function_a04fb5f4();
		if(!([[ _o_scene ]]->has_next_shot()) && !function_27898329(animation))
		{
			n_blend_out = (isai(_e) ? 0.2 : 0);
		}
		else
		{
			n_blend_out = 0;
		}
		if(is_true(_s.diewhenfinished) || is_true(var_55b4f21e.diewhenfinished))
		{
			n_blend_out = 0;
		}
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				printtoprightln((("" + (isdefined(_s.name) ? _s.name : _s.model)) + "") + function_9e72a96(animation));
			}
			if(getdvarint(#"debug_scene_skip", 0) > 0)
			{
				if(!isdefined(level.animation_played))
				{
					level.animation_played = [];
					animation_played_name = ((isdefined(_s.name) ? _s.name : _s.model) + "") + animation;
					if(!isdefined(level.animation_played))
					{
						level.animation_played = [];
					}
					else if(!isarray(level.animation_played))
					{
						level.animation_played = array(level.animation_played);
					}
					level.animation_played[level.animation_played.size] = animation_played_name;
				}
			}
		#/
		self.current_playing_anim[_n_ent_num] = animation;
		if(is_skipping_scene() && n_rate != 0)
		{
			thread skip_scene_shot_animations();
		}
		[[ self ]]->on_play_anim(_e);
		if(is_true(_s.var_69aabff2))
		{
			b_unlink_after_completed = 0;
		}
		if(function_5c2a9efa())
		{
			if(isactor(_e) && isassetloaded("xanim", "chicken_dance_placeholder_loop"))
			{
				_e thread animation::play(animation, _e, m_tag, n_rate, n_blend, n_blend_out, n_lerp, n_time, _s.showweaponinfirstperson);
			}
			function_5c082667();
		}
		else
		{
			if(is_true(_s.issiege))
			{
				_e animation::play_siege(animation, n_rate);
			}
			else
			{
				_e animation::play(animation, m_align, m_tag, n_rate, n_blend, n_blend_out, n_lerp, n_time, _s.showweaponinfirstperson, b_unlink_after_completed, var_f4b34dc1, paused, undefined, var_b2e32ae2, _s.showviewmodel);
				self.var_f4b34dc1 = undefined;
			}
		}
		if(!isdefined(_e) || !_e isplayinganimscripted())
		{
			self.current_playing_anim[_n_ent_num] = undefined;
		}
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				log((toupper(_s.type) + "") + function_9e72a96(animation) + "");
				printtoprightln((("" + (isdefined(_s.name) ? _s.name : _s.model)) + "") + function_9e72a96(animation));
			}
			if(getdvarint(#"debug_scene_skip", 0) > 0)
			{
				if(isdefined(level.animation_played))
				{
					for(i = 0; i < level.animation_played.size; i++)
					{
						animation_played_name = ((isdefined(_s.name) ? _s.name : _s.model) + "") + animation;
						if(level.animation_played[i] == animation_played_name)
						{
							arrayremovevalue(level.animation_played, animation_played_name);
							i--;
							continue;
						}
					}
				}
			}
		#/
	}

	/*
		Name: set_objective
		Namespace: csceneobject
		Checksum: 0x364A31AA
		Offset: 0x5F88
		Size: 0xDE
		Parameters: 0
		Flags: Linked
	*/
	function set_objective()
	{
		if(is_true(_e.var_7a450023))
		{
			return;
		}
		if(!isdefined(_e.script_objective))
		{
			if(isdefined(_o_scene._e_root) && isdefined(_o_scene._e_root.script_objective))
			{
				_e.script_objective = _o_scene._e_root.script_objective;
			}
			else if(isdefined(_o_scene._s.script_objective))
			{
				_e.script_objective = _o_scene._s.script_objective;
			}
		}
	}

	/*
		Name: function_23575fad
		Namespace: csceneobject
		Checksum: 0xDFC39C5E
		Offset: 0x58B0
		Size: 0x25E
		Parameters: 0
		Flags: Linked
	*/
	function function_23575fad()
	{
		if(isdefined(_s.var_873368a8))
		{
			_e.script_health = _s.var_873368a8;
			if(isdefined(_e.n_health))
			{
				_e.n_health = _s.var_873368a8;
				_e.var_f2ca854b = _e.n_health;
				if(!isdefined(_e.maxhealth))
				{
					_e.maxhealth = _e.n_health;
				}
			}
			else
			{
				_e.health = _s.var_873368a8;
				if(!isdefined(_e.maxhealth))
				{
					_e.maxhealth = _e.health;
				}
			}
		}
		if(isdefined(_o_scene._e_root) && isdefined(_o_scene._e_root.script_health))
		{
			_e.script_health = _o_scene._e_root.script_health;
			if(isdefined(_e.n_health))
			{
				_e.n_health = _e.script_health;
				_e.var_f2ca854b = _e.script_health;
				_e.maxhealth = _e.n_health;
			}
			else
			{
				_e.health = _e.script_health;
				_e.maxhealth = _e.health;
			}
		}
		if(!isdefined(_e.maxhealth))
		{
			_e.maxhealth = _e.health;
		}
	}

	/*
		Name: restore_saved_ent
		Namespace: csceneobject
		Checksum: 0x6A6569F0
		Offset: 0x5EC8
		Size: 0xB6
		Parameters: 0
		Flags: Linked
	*/
	function restore_saved_ent()
	{
		if(isdefined(_o_scene._e_root) && isdefined(_o_scene._e_root.scene_ents) && !is_true(_o_scene._e_root.var_146935c1))
		{
			if(isdefined(_o_scene._e_root.scene_ents[_str_name]))
			{
				self._e = _o_scene._e_root.scene_ents[_str_name];
			}
		}
	}

	/*
		Name: function_24f8cfb5
		Namespace: csceneobject
		Checksum: 0x8B869751
		Offset: 0x21A0
		Size: 0x3E
		Parameters: 1
		Flags: Linked
	*/
	function function_24f8cfb5(str_shot)
	{
		return str_shot === _o_scene.var_232738b3 && _o_scene._str_mode !== "init";
	}

	/*
		Name: function_27898329
		Namespace: csceneobject
		Checksum: 0xF2D01DA9
		Offset: 0x20A0
		Size: 0xF6
		Parameters: 1
		Flags: Linked
	*/
	function function_27898329(str_current_anim)
	{
		if(isarray(var_55b4f21e.entry) && var_55b4f21e.entry.size > 1)
		{
			for(i = 0; i < var_55b4f21e.entry.size; i++)
			{
				if(var_55b4f21e.entry[i].anim === str_current_anim && isdefined(var_55b4f21e.entry[i + 1]) && isdefined(var_55b4f21e.entry[i + 1].anim))
				{
					return true;
				}
			}
		}
		return false;
	}

	/*
		Name: skip_animation_on_server
		Namespace: csceneobject
		Checksum: 0x341FCF35
		Offset: 0x96B0
		Size: 0x204
		Parameters: 0
		Flags: Linked
	*/
	function skip_animation_on_server()
	{
		if(isdefined(current_playing_anim[_n_ent_num]))
		{
			if(is_shared_player())
			{
				foreach(player in [[_func_get]](_str_team))
				{
					/#
						if(getdvarint(#"debug_scene_skip", 0) > 0)
						{
							printtoprightln((("" + current_playing_anim[player getentitynumber()]) + "") + gettime(), vectorscale((1, 1, 1), 0.8));
						}
					#/
					skip_anim_on_server(player, current_playing_anim[player getentitynumber()]);
				}
			}
			else
			{
				/#
					printtoprightln((("" + current_playing_anim[_n_ent_num]) + "") + gettime(), vectorscale((1, 1, 1), 0.8));
				#/
				if(getdvarint(#"debug_scene_skip", 0) > 0)
				{
				}
				skip_anim_on_server(_e, current_playing_anim[_n_ent_num]);
			}
		}
	}

	/*
		Name: run_wait
		Namespace: csceneobject
		Checksum: 0x1A1A8926
		Offset: 0x3990
		Size: 0x7C
		Parameters: 1
		Flags: Linked
	*/
	function run_wait(wait_time)
	{
		wait_start_time = 0;
		while(wait_start_time < wait_time && !is_skipping_scene())
		{
			wait_start_time = wait_start_time + (float(function_60d95f53()) / 1000);
			waitframe(1);
		}
	}

	/*
		Name: is_alive
		Namespace: csceneobject
		Checksum: 0x5280D41E
		Offset: 0x8CD0
		Size: 0xA6
		Parameters: 0
		Flags: Linked
	*/
	function is_alive()
	{
		if(is_true(function_4de466fd()))
		{
			return 1;
		}
		return isdefined(_e) && (!isai(_e) || isalive(_e)) && !is_true(_e.isdying);
	}

	/*
		Name: function_2f4c1d30
		Namespace: csceneobject
		Checksum: 0x51CC2322
		Offset: 0x27F0
		Size: 0xD4
		Parameters: 1
		Flags: Linked
	*/
	function function_2f4c1d30(ent)
	{
		if(!isdefined(ent))
		{
			ent = _e;
		}
		v_force = ((isdefined(_s.var_9ecb812d) ? _s.var_9ecb812d : 0), (isdefined(_s.var_7bd2bb58) ? _s.var_7bd2bb58 : 0), (isdefined(_s.var_6e141fdb) ? _s.var_6e141fdb : 0));
		if(v_force != (0, 0, 0))
		{
			ent physicslaunch(ent.origin, v_force);
		}
	}

	/*
		Name: function_376c9d87
		Namespace: csceneobject
		Checksum: 0x32048B7
		Offset: 0x6070
		Size: 0x102
		Parameters: 3
		Flags: Linked
	*/
	function function_376c9d87(var_ec50a0d3, n_movement, player)
	{
		if(player adsbuttonpressed())
		{
			return _str_current_anim;
		}
		if(var_ec50a0d3.var_9532f6db == "move_up" || var_ec50a0d3.var_9532f6db == "move_right")
		{
			if(n_movement >= 0)
			{
				return _str_current_anim;
			}
			return var_55b4f21e.var_33a3e73c;
		}
		if(var_ec50a0d3.var_9532f6db == "move_down" || var_ec50a0d3.var_9532f6db == "move_left")
		{
			if(n_movement <= 0)
			{
				return _str_current_anim;
			}
			return var_55b4f21e.var_33a3e73c;
		}
		return _str_current_anim;
	}

	/*
		Name: function_37c00617
		Namespace: csceneobject
		Checksum: 0xD2ED3E3D
		Offset: 0x3820
		Size: 0xC8
		Parameters: 0
		Flags: Linked
	*/
	function function_37c00617()
	{
		if(isdefined(_o_scene._a_objects))
		{
			foreach(obj in _o_scene._a_objects)
			{
				if(isdefined(obj) && [[ obj ]]->is_player())
				{
					obj flag::wait_till_clear("camera_playing");
				}
			}
		}
	}

	/*
		Name: function_3919a776
		Namespace: csceneobject
		Checksum: 0xEFD0A805
		Offset: 0x8DD0
		Size: 0x72
		Parameters: 0
		Flags: Linked
	*/
	function function_3919a776()
	{
		if(_o_scene._str_mode === "init" && (is_true(_s.var_686939) || is_true(_s.var_f9a5853f)))
		{
			return true;
		}
		return false;
	}

	/*
		Name: animation_lookup
		Namespace: csceneobject
		Checksum: 0x2F8D9875
		Offset: 0x68F8
		Size: 0x20
		Parameters: 3
		Flags: Linked
	*/
	function animation_lookup(animation, ent, b_camera)
	{
		return b_camera;
	}

	/*
		Name: function_3e22944e
		Namespace: csceneobject
		Checksum: 0x337D551C
		Offset: 0x8C98
		Size: 0x2C
		Parameters: 0
		Flags: Linked
	*/
	function function_3e22944e()
	{
		return _o_scene._e_root.var_1505fed6[_s.name];
	}

	/*
		Name: function_47bd9bac
		Namespace: csceneobject
		Checksum: 0x91B15984
		Offset: 0x3BC0
		Size: 0x1A4
		Parameters: 2
		Flags: Linked
	*/
	function function_47bd9bac(actor, str_shot)
	{
		/#
			assert(isactor(actor));
		#/
		/#
			assert(isstring(str_shot));
		#/
		actor endon(#"death");
		str_animation = get_animation_name(str_shot);
		n_shot = get_shot(str_shot);
		s_shot = _s.shots[n_shot];
		if(!isdefined(s_shot))
		{
			return;
		}
		disablearrivals = is_true(_s.disablearrivalinreach) || is_true(s_shot.var_1956ecbb);
		if(s_shot.var_ea2f9e66 === "moving")
		{
			disablearrivals = 1;
		}
		s_align = function_bc0facbb();
		actor animation::reach(str_animation, s_align.ent, s_align.tag, disablearrivals, undefined, s_shot.var_8d3cc141);
	}

	/*
		Name: function_48382a1c
		Namespace: csceneobject
		Checksum: 0xC2A320DA
		Offset: 0x8C68
		Size: 0x22
		Parameters: 0
		Flags: Linked
	*/
	function function_48382a1c()
	{
		return is_true(_s.var_50f52c5b);
	}

	/*
		Name: function_4b3d4226
		Namespace: csceneobject
		Checksum: 0xCF4370D0
		Offset: 0x18E8
		Size: 0x2FC
		Parameters: 0
		Flags: Linked
	*/
	function function_4b3d4226()
	{
		if(!isdefined(var_55b4f21e))
		{
			return;
		}
		if(!isdefined(_e))
		{
			return;
		}
		if(is_true(var_55b4f21e.preparedelete) && !isplayer(_e))
		{
			_e notify(#"preparedelete");
			_e scene::synced_delete(_o_scene._str_name);
			return;
		}
		if(is_true(_s.var_e2360d85))
		{
			_e setforcenocull();
		}
		if(is_true(_s.touchtriggers))
		{
			_e function_64df4ea3(1);
		}
		if(is_true(var_55b4f21e.var_7e4647c3) && _str_shot != "init")
		{
			_e.scene_orig_origin = _e.origin;
			_e connectpaths();
		}
		else if(is_true(var_55b4f21e.var_6d2f3193))
		{
			_e disconnectpaths(2, 1);
		}
		if(is_true(var_55b4f21e.preparehide))
		{
			_e notify(#"preparehide");
			_e val::set(#"scene", "hide", 2);
		}
		else if(is_true(var_55b4f21e.prepareshow) || (is_true(_o_scene._b_testing) && scene::function_6a0b0afe(_o_scene._str_mode)))
		{
			_e notify(#"prepareshow");
			_e val::reset(#"scene", "hide");
		}
	}

	/*
		Name: function_4de466fd
		Namespace: csceneobject
		Checksum: 0xC4D88848
		Offset: 0x8D80
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function function_4de466fd()
	{
		return is_true(_s.ignorealivecheck) || is_true(_e.ignorealivecheck);
	}

	/*
		Name: set_ent_val
		Namespace: csceneobject
		Checksum: 0xB259086A
		Offset: 0x950
		Size: 0x74
		Parameters: 3
		Flags: Linked
	*/
	function set_ent_val(str_key, value, ent)
	{
		if(!isdefined(ent))
		{
			ent = _e;
		}
		if(isdefined(ent))
		{
			ent val::set((_o_scene._str_name + ":") + _str_shot, str_key, value);
		}
	}

	/*
		Name: function_527113ae
		Namespace: csceneobject
		Checksum: 0xBB495F73
		Offset: 0x8F30
		Size: 0x2E
		Parameters: 0
		Flags: Linked
	*/
	function function_527113ae()
	{
		return is_player() && !is_shared_player();
	}

	/*
		Name: _set_values
		Namespace: csceneobject
		Checksum: 0x3B1DDE5
		Offset: 0xA48
		Size: 0x9C
		Parameters: 1
		Flags: Linked
	*/
	function _set_values(ent)
	{
		if(!isdefined(ent))
		{
			ent = _e;
		}
		set_ent_val("takedamage", is_true(_s.takedamage), ent);
		set_ent_val("allowdeath", is_true(_s.allowdeath), ent);
	}

	/*
		Name: function_587971b6
		Namespace: csceneobject
		Checksum: 0x8B9C4DF5
		Offset: 0x3688
		Size: 0x6E
		Parameters: 0
		Flags: Linked
	*/
	function function_587971b6()
	{
		self._n_blend = (isdefined(var_55b4f21e.blend) ? var_55b4f21e.blend : 0);
		self.var_84ca3312 = (isdefined(var_55b4f21e.var_d6272917) ? var_55b4f21e.var_d6272917 : "linear");
	}

	/*
		Name: function_595c601b
		Namespace: csceneobject
		Checksum: 0xCCEE1D24
		Offset: 0x2030
		Size: 0x68
		Parameters: 0
		Flags: Linked
	*/
	function function_595c601b()
	{
		if(isarray(var_55b4f21e.entry) && var_55b4f21e.entry.size > 1)
		{
			if(isdefined(var_4da22aea) && var_4da22aea > 0)
			{
				return false;
			}
		}
		return true;
	}

	/*
		Name: function_5b2306f5
		Namespace: csceneobject
		Checksum: 0xBBEC77D6
		Offset: 0x6720
		Size: 0x1D0
		Parameters: 3
		Flags: Linked
	*/
	function function_5b2306f5(weapon, str_gender, b_camera)
	{
		if(!isdefined(b_camera))
		{
			b_camera = 0;
		}
		if(isdefined(var_55b4f21e.var_37f7b010))
		{
			var_eadfb674 = getscriptbundle(var_55b4f21e.var_37f7b010);
		}
		if(isarray(var_eadfb674.var_37f7b010) && var_eadfb674.var_37f7b010.size)
		{
			foreach(var_de282754 in var_eadfb674.var_37f7b010)
			{
				if(b_camera)
				{
					if(isdefined(var_de282754.camera) && weapon.name === var_de282754.weapon && (!isdefined(var_de282754.gender) || str_gender === var_de282754.gender))
					{
						return var_de282754.camera;
					}
					continue;
				}
				if(isdefined(var_de282754.animation) && weapon.name === var_de282754.weapon && (!isdefined(var_de282754.gender) || str_gender === var_de282754.gender))
				{
					return var_de282754.animation;
				}
			}
		}
	}

	/*
		Name: get_lerp_time
		Namespace: csceneobject
		Checksum: 0x49121329
		Offset: 0x8B48
		Size: 0x58
		Parameters: 0
		Flags: Linked
	*/
	function get_lerp_time()
	{
		n_lerp_time = (isdefined(var_55b4f21e.lerptime) ? var_55b4f21e.lerptime : _s.lerptime);
		return true;
	}

	/*
		Name: function_5c082667
		Namespace: csceneobject
		Checksum: 0x4B8D596F
		Offset: 0x82F8
		Size: 0x2FC
		Parameters: 0
		Flags: Linked
	*/
	function function_5c082667()
	{
		s_start_spot = function_3e22944e();
		if(!isdefined(s_start_spot.target))
		{
			_e waittill(#"player_downed", #"death", #"scene_stop");
			return;
		}
		_e endon(#"death", #"scene_stop");
		s_current_struct = struct::get(s_start_spot.target);
		n_move_time = (isdefined(s_start_spot.script_float) ? s_start_spot.script_float : 1);
		while(isdefined(s_current_struct))
		{
			if(!isdefined(_e.var_645ab05a))
			{
				_e.var_acbd43ee = util::spawn_model("tag_origin", _e.origin, _e.angles);
				_e linkto(_e.var_acbd43ee);
				_e thread function_98561e95();
			}
			_e.var_acbd43ee moveto(s_current_struct.origin, n_move_time);
			_e.var_acbd43ee rotateto(s_current_struct.angles, n_move_time);
			_e.var_acbd43ee waittill(#"movedone");
			if(isdefined(s_current_struct.script_float))
			{
				n_move_time = s_current_struct.script_float;
			}
			else
			{
				n_move_time = 1;
			}
			if(isdefined(s_current_struct.target))
			{
				s_current_struct = struct::get(s_current_struct.target);
			}
			else
			{
				s_current_struct = undefined;
			}
		}
		if(isdefined(_e.var_acbd43ee))
		{
			_e.var_acbd43ee delete();
		}
		_e unlink();
		_e animation::stop();
		_e notify(#"hash_456b12fb28128d17");
	}

	/*
		Name: function_5c2a9efa
		Namespace: csceneobject
		Checksum: 0xAC421100
		Offset: 0x8BA8
		Size: 0xB8
		Parameters: 0
		Flags: Linked
	*/
	function function_5c2a9efa()
	{
		if(isdefined(_o_scene._e_root) && isdefined(_o_scene._e_root.var_1505fed6))
		{
			a_str_keys = getarraykeys(_o_scene._e_root.var_1505fed6);
			if(isdefined(_s.name) && isinarray(a_str_keys, hash(_s.name)))
			{
				return true;
			}
		}
		return false;
	}

	/*
		Name: scene_reach
		Namespace: csceneobject
		Checksum: 0x4E5AAF53
		Offset: 0x3A18
		Size: 0x19C
		Parameters: 0
		Flags: Linked
	*/
	function scene_reach()
	{
		if(!isactor(_e) && !isbot(_e))
		{
			return;
		}
		b_do_reach = is_true(_s.doreach) || is_true(var_55b4f21e.var_a8e01b92) || is_true(var_55b4f21e.var_1956ecbb) && (!is_true(_o_scene._b_testing) || getdvarint(#"scene_test_with_reach", 0));
		if(b_do_reach)
		{
			self val::reset(#"scene", "hide");
			function_47bd9bac(_e, var_55b4f21e.name);
			function_9e4b3920();
		}
		flag::set(_str_shot + "ready");
	}

	/*
		Name: function_638ad737
		Namespace: csceneobject
		Checksum: 0x6BAB5E13
		Offset: 0x28D0
		Size: 0x184
		Parameters: 1
		Flags: Linked
	*/
	function function_638ad737(str_shot)
	{
		if(isdefined(_e) && !isplayer(_e) && !is_true(_e.isdying) && is_true(_s.deletewhenfinished))
		{
			if(str_shot != "init" && function_b260bdcc(str_shot) && !function_b52254e6() && !_b_first_frame)
			{
				_e thread scene::synced_delete(_o_scene._str_name);
			}
			else if(str_shot != "init" && function_b52254e6() && is_true(_o_scene.var_d84cc502))
			{
				_e thread scene::synced_delete(_o_scene._str_name);
			}
		}
	}

	/*
		Name: in_this_scene
		Namespace: csceneobject
		Checksum: 0x14BC1988
		Offset: 0x90C0
		Size: 0x120
		Parameters: 1
		Flags: Linked
	*/
	function in_this_scene(ent)
	{
		foreach(obj in _o_scene._a_objects)
		{
			if(isplayer(ent))
			{
				if(is_shared_player())
				{
					return false;
				}
				if(function_527113ae() && !function_71b7c9e3(ent))
				{
					return false;
				}
				if(obj._e === ent)
				{
					return true;
				}
				continue;
			}
			if(obj._e === ent)
			{
				return true;
			}
		}
		return false;
	}

	/*
		Name: skip_animation_on_client
		Namespace: csceneobject
		Checksum: 0xA814700E
		Offset: 0x9498
		Size: 0x20C
		Parameters: 0
		Flags: Linked
	*/
	function skip_animation_on_client()
	{
		if(isdefined(current_playing_anim[_n_ent_num]))
		{
			if(is_shared_player())
			{
				foreach(player in [[_func_get]](_str_team))
				{
					/#
						if(getdvarint(#"debug_scene_skip", 0) > 0)
						{
							printtoprightln((("" + current_playing_anim[player getentitynumber()]) + "") + gettime(), vectorscale((1, 1, 1), 0.8));
						}
					#/
					skip_anim_on_client(player, current_playing_anim[player getentitynumber()]);
				}
			}
			else
			{
				/#
					printtoprightln((("" + current_playing_anim[_n_ent_num]) + "") + gettime(), vectorscale((1, 1, 1), 0.8));
				#/
				if(getdvarint(#"debug_scene_skip", 0) > 0)
				{
				}
				skip_anim_on_client(_e, current_playing_anim[_n_ent_num]);
			}
			return true;
		}
		return false;
	}

	/*
		Name: function_71b7c9e3
		Namespace: csceneobject
		Checksum: 0x7F0A9A26
		Offset: 0x8F68
		Size: 0xB0
		Parameters: 1
		Flags: Linked
	*/
	function function_71b7c9e3(player)
	{
		foreach(obj in _o_scene._a_objects)
		{
			if(obj._e === player && [[ obj ]]->function_527113ae())
			{
				return true;
			}
		}
		return false;
	}

	/*
		Name: function_72f549e0
		Namespace: csceneobject
		Checksum: 0xAB17DDFD
		Offset: 0x4E80
		Size: 0x4C4
		Parameters: 2
		Flags: Linked
	*/
	function function_72f549e0(s_shot, var_37fa9b04)
	{
		if(!isdefined(_e))
		{
			return false;
		}
		if(is_true(_e.var_5b7900ec[s_shot.name]))
		{
			return false;
		}
		if(!function_128f0294(s_shot, var_37fa9b04))
		{
			return false;
		}
		var_f506eca3 = 0;
		if(!isdefined(s_shot.damagethreshold) && !is_true(s_shot.var_132c9791))
		{
			var_f506eca3 = 1;
		}
		if(var_f506eca3)
		{
			var_f2059ab8 = 0;
			var_520e99b5 = 0;
		}
		else
		{
			if(is_true(s_shot.var_132c9791))
			{
				s_shot.damagethreshold = 0;
			}
			if(isdefined(_e.n_health))
			{
				n_current_health = _e.n_health;
			}
			else
			{
				n_current_health = _e.health;
			}
			if(n_current_health <= 0)
			{
				n_current_health = 0;
			}
			if(isdefined(_e.var_f2ca854b))
			{
				var_f2ca854b = _e.var_f2ca854b;
			}
			else
			{
				var_f2ca854b = _e.maxhealth;
			}
			var_f2059ab8 = n_current_health / var_f2ca854b;
			var_520e99b5 = s_shot.damagethreshold;
		}
		if(!is_true(_s.var_a1c5c678))
		{
			b_dead = var_f2059ab8 <= 0;
			if(isdefined(var_37fa9b04.attacker))
			{
				var_37fa9b04.attacker util::show_hit_marker(b_dead);
			}
		}
		if(var_f2059ab8 <= var_520e99b5)
		{
			_e.var_68ade67d = 1;
			_e notify(#"hash_4d265bbfcf0b6b4b", {#hash_d2b5cb6a:var_520e99b5, #hash_859dbb7c:var_f2059ab8, #hash_37fa9b04:var_37fa9b04, #str_scene:_o_scene._str_name, #str_shot:s_shot.name});
			level notify(#"hash_4d265bbfcf0b6b4b", {#hash_d2b5cb6a:var_520e99b5, #hash_859dbb7c:var_f2059ab8, #hash_37fa9b04:var_37fa9b04, #str_scene:_o_scene._str_name, #str_shot:s_shot.name, #hash_f2dfc31f:_e});
			if(isdefined(_o_scene._e_root))
			{
				_o_scene._e_root notify(#"hash_4d265bbfcf0b6b4b", {#hash_d2b5cb6a:var_520e99b5, #hash_859dbb7c:var_f2059ab8, #hash_37fa9b04:var_37fa9b04, #str_scene:_o_scene._str_name, #str_shot:s_shot.name, #hash_f2dfc31f:_e});
			}
			_e.var_5b7900ec[s_shot.name] = 1;
			thread [[ _o_scene ]]->play(s_shot.name, undefined, undefined, "single");
			if(function_1205d1f0())
			{
				_e setcandamage(0);
				thread function_b485ee21(s_shot, var_37fa9b04);
			}
			return true;
		}
		return false;
	}

	/*
		Name: function_730a4c60
		Namespace: csceneobject
		Checksum: 0x83C95626
		Offset: 0x22D8
		Size: 0x9C
		Parameters: 1
		Flags: Linked
	*/
	function function_730a4c60(str_shot)
	{
		foreach(s_shot in _s.shots)
		{
			if(str_shot === s_shot.name)
			{
				return s_shot;
			}
		}
		return undefined;
	}

	/*
		Name: skip_scene
		Namespace: csceneobject
		Checksum: 0xA7D57EAE
		Offset: 0x9930
		Size: 0x2C
		Parameters: 1
		Flags: Linked
	*/
	function skip_scene(b_wait_one_frame)
	{
		if(isdefined(b_wait_one_frame))
		{
			waitframe(1);
		}
		skip_scene_shot_animations();
	}

	/*
		Name: warning
		Namespace: csceneobject
		Checksum: 0xCD2BD6D3
		Offset: 0x9BF8
		Size: 0xC4
		Parameters: 2
		Flags: Linked
	*/
	function warning(condition, str_msg)
	{
		if(condition)
		{
			str_msg = ((("[ " + _o_scene._str_name) + " ] ") + (isdefined(_s.name) ? "" + _s.name : (isdefined("no name") ? "" + "no name" : "")) + ": ") + str_msg;
			/#
				scene::warning_on_screen(str_msg);
			#/
			return true;
		}
		return false;
	}

	/*
		Name: skip_scene_shot_animations
		Namespace: csceneobject
		Checksum: 0x7C58815C
		Offset: 0x98C0
		Size: 0x66
		Parameters: 0
		Flags: Linked
	*/
	function skip_scene_shot_animations()
	{
		if(isdefined(current_playing_anim) && isdefined(current_playing_anim[_n_ent_num]))
		{
			if(skip_animation_on_client())
			{
				waitframe(1);
			}
			skip_animation_on_server();
		}
		self notify(#"skip_camera_anims");
	}

	/*
		Name: play_anim
		Namespace: csceneobject
		Checksum: 0xAD8F34D8
		Offset: 0x6920
		Size: 0x752
		Parameters: 4
		Flags: Linked
	*/
	function play_anim(animation, b_camera_anim, var_e052b59a, n_start_time)
	{
		if(!isdefined(b_camera_anim))
		{
			b_camera_anim = 0;
		}
		if(!isdefined(var_e052b59a))
		{
			var_e052b59a = 0;
		}
		if(!isdefined(n_start_time))
		{
			n_start_time = 0;
		}
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				if(isdefined(_s.name))
				{
					printtoprightln("" + _s.name);
				}
				else
				{
					printtoprightln("" + _s.model);
				}
			}
		#/
		if(_b_first_frame || var_e052b59a)
		{
			n_rate = 0;
		}
		else
		{
			n_rate = 1;
		}
		if(n_rate > 0)
		{
			_o_scene flag::wait_till(_str_shot + "go");
		}
		if(!is_shared_player())
		{
			animation = [[ self ]]->animation_lookup(animation, undefined, b_camera_anim);
		}
		if(b_camera_anim)
		{
			_str_camera = animation;
		}
		else
		{
			self._str_current_anim = animation;
		}
		if(_should_skip_anim(animation))
		{
			return;
		}
		if(function_b52254e6() && !function_f12c5e67(var_55b4f21e) && _o_scene._str_mode !== "init")
		{
			_e notify(#"stop_tracking_damage_scene_ent");
		}
		if(is_alive())
		{
			update_alignment();
			n_time = n_start_time;
			if(n_time != 0)
			{
				n_time = [[ _o_scene ]]->get_anim_relative_start_time(animation, n_time, b_camera_anim);
			}
			if(scene::function_a63b9bca(_o_scene._str_name))
			{
				n_time = 0.99;
				_o_scene.n_start_time = 0.99;
			}
			if(isactor(_e) && isdefined(var_55b4f21e.var_bd5fe690) && _e ai::has_behavior_attribute("demeanor"))
			{
				_e ai::set_behavior_attribute("demeanor", var_55b4f21e.var_bd5fe690);
			}
			if(isactor(_e))
			{
				self.var_35ec7ac3 = _e function_941131ef(0);
			}
			if(function_5c2a9efa())
			{
				[[ self ]]->_play_anim(animation, n_rate, _n_blend, var_84ca3312, n_time);
				self._b_active_anim = 0;
				_dynamic_paths();
			}
			else
			{
				if(var_e052b59a)
				{
					flag::set(#"scene_interactive_shot_active");
					n_rate = 0;
					n_time = 0;
					thread [[ self ]]->_play_anim(animation, n_rate, _n_blend, var_84ca3312, n_time);
					self._b_active_anim = 1;
				}
				else
				{
					if(b_camera_anim)
					{
						thread [[ self ]]->play_camera(_str_camera, n_time);
					}
					else
					{
						if(_b_first_frame)
						{
							thread [[ self ]]->_play_anim(animation, n_rate, _n_blend, var_84ca3312, n_time);
							self._b_active_anim = 1;
						}
						else
						{
							if(isanimlooping(animation))
							{
								if(_str_shot === "init" || scene::function_6a0b0afe(_o_scene._str_mode))
								{
									thread [[ self ]]->_play_anim(animation, n_rate, _n_blend, var_84ca3312, n_time);
									self._b_active_anim = 1;
								}
								else
								{
									if(function_b260bdcc(_str_shot))
									{
										if(isdefined(_o_scene._e_root))
										{
											_o_scene._e_root notify(#"scene_done", {#str_scenedef:_o_scene._str_name});
										}
										_e notify(#"scene_done", {#str_scenedef:_o_scene._str_name});
									}
									[[ self ]]->_play_anim(animation, n_rate, _n_blend, var_84ca3312, n_time);
									self._b_active_anim = 0;
								}
							}
							else
							{
								[[ self ]]->_play_anim(animation, n_rate, _n_blend, var_84ca3312, n_time);
								self._b_active_anim = 0;
								_dynamic_paths();
							}
						}
					}
				}
			}
			if(is_alive() && isactor(_e))
			{
				if(!_b_active_anim)
				{
					_e function_941131ef(var_35ec7ac3);
					self.var_35ec7ac3 = undefined;
				}
				if(isdefined(var_55b4f21e.var_2d86d11f))
				{
					var_179fae19 = _e function_8536906e(var_55b4f21e.var_2d86d11f);
					_e asmrequestsubstate(var_179fae19);
					_e function_af554597(animation);
				}
			}
			_blend = 0;
		}
	}

	/*
		Name: _stop
		Namespace: csceneobject
		Checksum: 0xB701866F
		Offset: 0x3F68
		Size: 0x8C
		Parameters: 1
		Flags: Linked
	*/
	function _stop(b_dont_clear_anim)
	{
		if(!isdefined(b_dont_clear_anim))
		{
			b_dont_clear_anim = 0;
		}
		if(isalive(_e))
		{
			_e notify(#"scene_stop");
			if(!b_dont_clear_anim)
			{
				_e animation::stop(0.2);
				function_2f4c1d30(_e);
			}
		}
	}

	/*
		Name: function_8536906e
		Namespace: csceneobject
		Checksum: 0x94985DD
		Offset: 0x7080
		Size: 0x1F6
		Parameters: 1
		Flags: Linked
	*/
	function function_8536906e(var_2d86d11f)
	{
		if(!isdefined(level.var_66c9b8dc))
		{
			level.var_66c9b8dc = [];
			level.var_66c9b8dc[#"moving"][#"patrol"] = "move@patrol";
			level.var_66c9b8dc[#"moving"][#"alert"] = "move@alert";
			level.var_66c9b8dc[#"moving"][#"cqb"] = "move@cqb_locomotion";
			level.var_66c9b8dc[#"moving"][#"combat"] = "move@locomotion";
			level.var_66c9b8dc[#"idle"][#"patrol"] = "idle@patrol";
			level.var_66c9b8dc[#"idle"][#"alert"] = "idle@alert";
			level.var_66c9b8dc[#"idle"][#"cqb"] = "idle@exposed";
			level.var_66c9b8dc[#"idle"][#"combat"] = "idle@exposed";
		}
		if(ai::has_behavior_attribute("demeanor"))
		{
			var_5207b7a8 = ai::get_behavior_attribute("demeanor");
			return level.var_66c9b8dc[var_2d86d11f][var_5207b7a8];
		}
		return "idle@exposed";
	}

	/*
		Name: _prepare
		Namespace: csceneobject
		Checksum: 0x300CD5EE
		Offset: 0x1BF0
		Size: 0x1C4
		Parameters: 0
		Flags: Linked
	*/
	function _prepare()
	{
		if(issentient(_e))
		{
			if(is_true(_s.overrideaicharacter))
			{
				_e detachall();
				_e setmodel(_s.model);
			}
		}
		else if(_s.type === "actor")
		{
			if(!error(_e.classname !== "script_model", "makeFakeAI must be applied to a script_model"))
			{
				_e makefakeai();
			}
			if(!is_true(_s.removeweapon) && !is_true(_s.hideweapon))
			{
				_e animation::attach_weapon(getweapon(#"ar_accurate_t9"));
			}
		}
		set_objective();
		if(is_true(_s.dynamicpaths))
		{
			_e disconnectpaths(2);
		}
	}

	/*
		Name: stop
		Namespace: csceneobject
		Checksum: 0xCB760408
		Offset: 0x3E40
		Size: 0x11C
		Parameters: 2
		Flags: Linked
	*/
	function stop(b_clear, b_dont_clear_anim)
	{
		if(!isdefined(b_clear))
		{
			b_clear = 0;
		}
		if(!isdefined(b_dont_clear_anim))
		{
			b_dont_clear_anim = 0;
		}
		self notify(#"new_shot");
		if(isdefined(_str_shot))
		{
			flag::set(_str_shot + "stopped");
			if(b_clear)
			{
				if(isdefined(_e))
				{
					_e notify(#"scene_stop");
					if(isplayer(_e))
					{
						[[ self ]]->_stop(b_dont_clear_anim);
					}
					else
					{
						_e delete();
					}
				}
			}
			else
			{
				[[ self ]]->_stop(b_dont_clear_anim);
			}
			cleanup();
		}
	}

	/*
		Name: spawn
		Namespace: csceneobject
		Checksum: 0x803F5D24
		Offset: 0xC60
		Size: 0x37C
		Parameters: 0
		Flags: Linked
	*/
	function spawn()
	{
		self endon(#"new_shot");
		b_skip = !function_e0df299e(_str_shot) && _o_scene._str_mode !== "init" && !scene::function_6a0b0afe(_o_scene._str_mode) && _str_shot !== "init" && !is_player() && !function_48382a1c();
		b_skip = b_skip || function_3919a776();
		b_skip = b_skip || is_true(var_1f97724a);
		b_skip = b_skip || (is_actor() || is_vehicle() && issubstr(_o_scene._str_mode, "noai"));
		b_skip = b_skip || (is_player() && issubstr(_o_scene._str_mode, "noplayers"));
		b_skip = b_skip || (is_player() && !function_209522a0() && !function_e0df299e(_str_shot) && _o_scene._str_mode !== "init" && scene::function_6a0b0afe(_o_scene._str_mode));
		if(!b_skip)
		{
			[[ self ]]->_spawn();
			error(!is_true(_s.nospawn) && (!isdefined(_e) || isspawner(_e)), "Object failed to spawn or doesn't exist.");
			[[ _o_scene ]]->assign_ent(self, _e);
			if(isdefined(_e))
			{
				prepare();
			}
			else if(is_true(_s.nospawn))
			{
				flag::set(_str_shot + "stopped");
			}
		}
		else
		{
			cleanup();
		}
	}

	/*
		Name: update_alignment
		Namespace: csceneobject
		Checksum: 0x973C7AEB
		Offset: 0x7280
		Size: 0x4E6
		Parameters: 0
		Flags: Linked
	*/
	function update_alignment()
	{
		s_align = function_bc0facbb();
		self.m_align = s_align.ent;
		self.m_tag = s_align.tag;
		var_2dd2901f = ((isdefined(_o_scene._s.var_922b4fc5) ? _o_scene._s.var_922b4fc5 : 0), (isdefined(_o_scene._s.var_3e692842) ? _o_scene._s.var_3e692842 : 0), (isdefined(_o_scene._s.var_be60a82b) ? _o_scene._s.var_be60a82b : 0));
		var_acf1be3a = ((isdefined(_o_scene._s.var_16999a5d) ? _o_scene._s.var_16999a5d : 0), (isdefined(_o_scene._s.var_29563fd6) ? _o_scene._s.var_29563fd6 : 0), (isdefined(_o_scene._s.var_eb00c330) ? _o_scene._s.var_eb00c330 : 0));
		var_24a7cd13 = ((isdefined(_s.var_922b4fc5) ? _s.var_922b4fc5 : 0), (isdefined(_s.var_3e692842) ? _s.var_3e692842 : 0), (isdefined(_s.var_be60a82b) ? _s.var_be60a82b : 0));
		var_75cdf4bd = ((isdefined(_s.var_16999a5d) ? _s.var_16999a5d : 0), (isdefined(_s.var_29563fd6) ? _s.var_29563fd6 : 0), (isdefined(_s.var_eb00c330) ? _s.var_eb00c330 : 0));
		var_2a3b0294 = ((isdefined(var_55b4f21e.var_922b4fc5) ? var_55b4f21e.var_922b4fc5 : 0), (isdefined(var_55b4f21e.var_3e692842) ? var_55b4f21e.var_3e692842 : 0), (isdefined(var_55b4f21e.var_be60a82b) ? var_55b4f21e.var_be60a82b : 0));
		var_f3bd6699 = ((isdefined(var_55b4f21e.var_16999a5d) ? var_55b4f21e.var_16999a5d : 0), (isdefined(var_55b4f21e.var_29563fd6) ? var_55b4f21e.var_29563fd6 : 0), (isdefined(var_55b4f21e.var_eb00c330) ? var_55b4f21e.var_eb00c330 : 0));
		var_d3c21d73 = (var_2dd2901f + var_2a3b0294) + var_24a7cd13;
		v_ang_offset = (var_acf1be3a + var_f3bd6699) + var_75cdf4bd;
		if(m_align == level)
		{
			self.m_align = (0, 0, 0) + var_d3c21d73;
			self.m_tag = (0, 0, 0) + v_ang_offset;
		}
		else if(!isentity(m_align) && (var_d3c21d73 != (0, 0, 0) || v_ang_offset != (0, 0, 0)))
		{
			v_pos = m_align.origin + var_d3c21d73;
			v_ang = m_align.angles + v_ang_offset;
			self.m_align = {#angles:v_ang, #origin:v_pos};
		}
	}

	/*
		Name: first_init
		Namespace: csceneobject
		Checksum: 0xB3B2E823
		Offset: 0xB80
		Size: 0xD4
		Parameters: 2
		Flags: Linked
	*/
	function first_init(s_objdef, o_scene)
	{
		self._s = s_objdef;
		self._o_scene = o_scene;
		_assign_unique_name();
		if(isdefined(_s.team))
		{
			self._str_team = util::get_team_mapping(_s.team);
		}
		if(is_true(_s.var_1af33af1) && !isdefined(_o_scene.var_58e5d094))
		{
			_o_scene.var_58e5d094 = self;
		}
		return self;
	}

	/*
		Name: _dynamic_paths
		Namespace: csceneobject
		Checksum: 0x94C69E58
		Offset: 0x38F0
		Size: 0x94
		Parameters: 0
		Flags: Linked
	*/
	function _dynamic_paths()
	{
		if(isdefined(_e) && is_true(_s.dynamicpaths))
		{
			if(distance2dsquared(_e.origin, _e.scene_orig_origin) > 4)
			{
				_e disconnectpaths(2, 0);
			}
		}
	}

	/*
		Name: function_98561e95
		Namespace: csceneobject
		Checksum: 0xA3C36DF
		Offset: 0x8600
		Size: 0x6C
		Parameters: 0
		Flags: Linked
	*/
	function function_98561e95()
	{
		self endon(#"hash_456b12fb28128d17");
		var_9f5994d7 = var_acbd43ee;
		self waittill(#"death", #"scene_stop");
		if(isdefined(var_9f5994d7))
		{
			var_9f5994d7 delete();
		}
	}

	/*
		Name: function_9960f8f0
		Namespace: csceneobject
		Checksum: 0xAF07C8EB
		Offset: 0x4560
		Size: 0xFC
		Parameters: 1
		Flags: Linked
	*/
	function function_9960f8f0(_e)
	{
		_e notify(#"cleanuphide");
		_e endon(#"death", #"prepareshow", #"preparehide", #"cleanuphide");
		if(_o_scene._str_mode !== "init")
		{
			_o_scene waittilltimeout(0.15, #"hash_60adeaccbb565546", #"scene_stop", #"scene_done", #"scene_skip_completed");
		}
		_e val::set(#"scene", "hide", 2);
	}

	/*
		Name: function_9a6b1e3f
		Namespace: csceneobject
		Checksum: 0x615B27AB
		Offset: 0x9098
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_9a6b1e3f()
	{
		return _s.type === "prop";
	}

	/*
		Name: is_shared_player
		Namespace: csceneobject
		Checksum: 0x9C4226BE
		Offset: 0x8F08
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function is_shared_player()
	{
		return _s.type === "sharedplayer";
	}

	/*
		Name: prepare
		Namespace: csceneobject
		Checksum: 0x4E86502A
		Offset: 0x1190
		Size: 0x750
		Parameters: 0
		Flags: Linked
	*/
	function prepare()
	{
		_e endon(#"death");
		if(isdefined(_e._scene_object) && _e._scene_object != self)
		{
			[[ _e._scene_object ]]->cleanup();
		}
		var_800abfab = function_527113ae() && isplayer(_e) && (!isalive(_e) || _e.sessionstate === "spectator") && (sessionmodeismultiplayergame() || sessionmodeiswarzonegame());
		if(!is_alive() || var_800abfab)
		{
			if(var_800abfab)
			{
				self._n_ent_num = _e getentitynumber();
				cleanup();
			}
			return;
		}
		self._n_ent_num = _e getentitynumber();
		if(_e.health < 1)
		{
			_e.health = 1;
		}
		/#
			log(_str_shot);
		#/
		_e._scene_object = self;
		self.var_55b4f21e = function_730a4c60(_str_shot);
		if(is_true(_s.dynamicpaths) && _str_shot != "init")
		{
			_e.scene_orig_origin = _e.origin;
			_e connectpaths();
		}
		if(!isai(_e) && !isplayer(_e))
		{
			if(!is_player())
			{
				if(isdefined(var_55b4f21e))
				{
					var_55b4f21e.devstate = undefined;
				}
				if(is_player_model())
				{
					scene::prepare_player_model_anim(_e);
				}
				else
				{
					scene::prepare_generic_model_anim(_e);
				}
			}
		}
		if(!is_player())
		{
			[[ self ]]->_set_values();
			_e.anim_debug_name = _s.name;
			_e.current_scene = _o_scene._str_name;
			_e flag::set(#"scene");
		}
		if(_e.classname == "script_model")
		{
			if(isdefined(_o_scene._e_root.modelscale))
			{
				_e setscale(_o_scene._e_root.modelscale);
			}
		}
		if(is_true(_s.takedamage))
		{
			foreach(s_shot in _s.shots)
			{
				if(function_9a6b1e3f() && function_f12c5e67(s_shot) && !function_b52254e6())
				{
					self.var_2a306f8a = 1;
					_e.var_2a306f8a = 1;
					thread function_14f96d6b();
					break;
				}
			}
		}
		if([[ _o_scene ]]->function_9c8ba4a0())
		{
			if(!isplayer(_e))
			{
				_e sethighdetail(1);
			}
		}
		[[ self ]]->_prepare();
		if(is_true(_s.allowdeath))
		{
			thread [[ self ]]->function_d09b043();
		}
		if(function_5c2a9efa())
		{
			s_start_spot = function_3e22944e();
			if(isplayer(_e))
			{
				_e setorigin(s_start_spot.origin);
				_e setplayerangles(s_start_spot.angles);
			}
			else
			{
				if(isactor(_e))
				{
					_e forceteleport(s_start_spot.origin, s_start_spot.angles);
				}
				else
				{
					_e.origin = s_start_spot.origin;
					_e.angles = s_start_spot.angles;
				}
			}
		}
		function_4b3d4226();
		scene_reach();
		flag::set(_str_shot + "ready");
		flag::clear(_str_shot + "finished");
		return true;
	}

	/*
		Name: function_9e4b3920
		Namespace: csceneobject
		Checksum: 0x455AAA5E
		Offset: 0x3D70
		Size: 0xC4
		Parameters: 0
		Flags: Linked
	*/
	function function_9e4b3920()
	{
		if(isdefined(_e) && (isbot(_e) || isai(_e)))
		{
			if(isbot(_e))
			{
				_e setgoal(_e.origin, 1);
			}
			else
			{
				_e setgoal(_e.origin, 1);
			}
		}
	}

	/*
		Name: function_9ec459a2
		Namespace: csceneobject
		Checksum: 0x4C6267E7
		Offset: 0x23D8
		Size: 0x4C
		Parameters: 0
		Flags: Linked
	*/
	function function_9ec459a2()
	{
		if(isdefined(var_55b4f21e.var_64c0ee5a) && isdefined(_e))
		{
			_e setmodel(var_55b4f21e.var_64c0ee5a);
		}
	}

	/*
		Name: get_shot
		Namespace: csceneobject
		Checksum: 0xCB558CFC
		Offset: 0x2230
		Size: 0x9C
		Parameters: 1
		Flags: Linked
	*/
	function get_shot(str_shot)
	{
		foreach(n_shot, s_shot in _s.shots)
		{
			if(str_shot === s_shot.name)
			{
				return n_shot;
			}
		}
		return undefined;
	}

	/*
		Name: function_a04fb5f4
		Namespace: csceneobject
		Checksum: 0xDC40338C
		Offset: 0x7770
		Size: 0x3E4
		Parameters: 0
		Flags: Linked
	*/
	function function_a04fb5f4()
	{
		if(_o_scene._s scene::is_igc() || [[ _o_scene ]]->has_player())
		{
			if(function_527113ae())
			{
				if(is_true(_s.var_8a65366f))
				{
					_e setvisibletoall();
				}
				else if(!is_true(_s.var_186d089d))
				{
					if(sessionmodeismultiplayergame() && (_e.team == #"allies" || _e.team == #"axis"))
					{
						_e setvisibletoallexceptteam(util::getotherteam(_e.team));
					}
					else
					{
						_e setvisibletoteam(_e.team);
					}
				}
			}
			else if(!isplayer(_e))
			{
				_e setinvisibletoall();
				if(_o_scene._str_team === "any" || is_true(_o_scene._b_testing) || is_true(_s.var_8a65366f))
				{
					_e setvisibletoall();
				}
				else
				{
					if(isarray(level.teams) && isdefined(_o_scene._str_team) && isinarray(getarraykeys(level.teams), hash(_o_scene._str_team)))
					{
						if(sessionmodeismultiplayergame() && (_o_scene._str_team == #"allies" || _o_scene._str_team == #"axis"))
						{
							_e setvisibletoallexceptteam(util::getotherteam(_o_scene._str_team));
						}
						else
						{
							_e setvisibletoteam(_o_scene._str_team);
						}
					}
					else
					{
						_e setvisibletoall();
					}
				}
			}
			/#
				if(getdvarint(#"hash_7cf2c603fbde6a8e", 0))
				{
					_e setvisibletoall();
				}
			#/
		}
	}

	/*
		Name: function_a808aac7
		Namespace: csceneobject
		Checksum: 0x4D9BE975
		Offset: 0x6180
		Size: 0x42
		Parameters: 0
		Flags: Linked
	*/
	function function_a808aac7()
	{
		if(isdefined(var_55b4f21e.var_33a3e73c) && var_efc540b6 === var_55b4f21e.var_33a3e73c)
		{
			return true;
		}
		return false;
	}

	/*
		Name: is_vehicle
		Namespace: csceneobject
		Checksum: 0xDEC10C72
		Offset: 0x9070
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function is_vehicle()
	{
		return _s.type === "vehicle";
	}

	/*
		Name: skip_anim_on_server
		Namespace: csceneobject
		Checksum: 0x7818587
		Offset: 0x93D0
		Size: 0xBC
		Parameters: 2
		Flags: Linked
	*/
	function skip_anim_on_server(entity, anim_name)
	{
		if(!isdefined(anim_name))
		{
			return;
		}
		if(!isdefined(entity))
		{
			return;
		}
		if(!entity isplayinganimscripted() || _str_current_anim !== anim_name)
		{
			return;
		}
		if(isanimlooping(anim_name))
		{
			entity animation::stop();
		}
		else
		{
			entity setanimtimebyname(anim_name, 1);
		}
		entity stopsounds();
	}

	/*
		Name: function_b260bdcc
		Namespace: csceneobject
		Checksum: 0x3F3A2907
		Offset: 0x21E8
		Size: 0x3E
		Parameters: 1
		Flags: Linked
	*/
	function function_b260bdcc(str_shot)
	{
		return str_shot === _o_scene.var_355308d8 && _o_scene._str_mode !== "init";
	}

	/*
		Name: function_b485ee21
		Namespace: csceneobject
		Checksum: 0xE4829EB1
		Offset: 0x5608
		Size: 0x2A0
		Parameters: 2
		Flags: Linked
	*/
	function function_b485ee21(s_shot, var_37fa9b04)
	{
		_e notify(#"hash_b02076d93b34558");
		_e endon(#"hash_b02076d93b34558", #"delete", #"scene_stop");
		var_5b7900ec = _e.var_5b7900ec;
		foreach(var_74f5d118 in var_5b7900ec)
		{
			while(!var_74f5d118)
			{
				waitframe(1);
			}
		}
		_e.var_4819ae76 = 1;
		thread function_ea176ba9();
		if(isdefined(_e))
		{
			_e notify(#"hash_18be12558bc58fe", {#hash_5cd2f3ce:_str_name, #hash_37fa9b04:var_37fa9b04, #str_scene:_o_scene._str_name, #str_shot:s_shot.name});
			_e.health = 0;
		}
		if(isdefined(_o_scene._e_root))
		{
			_o_scene._e_root notify(#"hash_5bb6862842cacfe8", {#hash_37fa9b04:var_37fa9b04, #str_shot:s_shot.name, #hash_5cd2f3ce:_str_name, #hash_b551c535:_e});
		}
		level notify(#"hash_4d265bbfcf0b6b4b", {#str_scene:_o_scene._str_name, #str_shot:s_shot.name});
	}

	/*
		Name: function_b52254e6
		Namespace: csceneobject
		Checksum: 0x95D62496
		Offset: 0x5B18
		Size: 0x26
		Parameters: 0
		Flags: Linked
	*/
	function function_b52254e6()
	{
		if(is_true(var_2a306f8a))
		{
			return true;
		}
		return false;
	}

	/*
		Name: get_animation_name
		Namespace: csceneobject
		Checksum: 0xEBF8EAC8
		Offset: 0x1DD0
		Size: 0x144
		Parameters: 2
		Flags: Linked
	*/
	function get_animation_name(_str_shot, var_b8995d3f)
	{
		if(!isdefined(var_b8995d3f))
		{
			var_b8995d3f = 0;
		}
		n_shot = get_shot(_str_shot);
		if(isdefined(n_shot) && isdefined(_s.shots[n_shot].entry))
		{
			foreach(s_entry in _s.shots[n_shot].entry)
			{
				if(isdefined(s_entry.anim))
				{
					if(var_b8995d3f)
					{
						str_animation = s_entry.anim;
					}
					else
					{
						str_animation = [[ self ]]->animation_lookup(s_entry.anim, undefined, 0);
					}
					return str_animation;
				}
			}
		}
	}

	/*
		Name: function_bc0facbb
		Namespace: csceneobject
		Checksum: 0x5C62E06C
		Offset: 0x4758
		Size: 0x36C
		Parameters: 0
		Flags: Linked
	*/
	function function_bc0facbb()
	{
		e_align = undefined;
		if(isdefined(var_55b4f21e.aligntarget) && !is_true(var_55b4f21e.var_ab59a015))
		{
			var_690ec5fb = var_55b4f21e.aligntarget;
			var_139e0bfc = var_55b4f21e.aligntargettag;
		}
		else if(isdefined(_s.aligntarget))
		{
			var_690ec5fb = _s.aligntarget;
			var_139e0bfc = _s.aligntargettag;
		}
		if(isdefined(var_690ec5fb))
		{
			a_scene_ents = [[ _o_scene ]]->get_ents();
			if(isdefined(a_scene_ents[var_690ec5fb]))
			{
				e_align = a_scene_ents[var_690ec5fb];
			}
			else
			{
				e_align = scene::get_existing_ent(var_690ec5fb, 0, 1, _o_scene._str_name);
			}
			if(!isdefined(e_align))
			{
				loc_000048CC:
				loc_000048FC:
				str_msg = ((("Align target '" + (isdefined(var_690ec5fb) ? "" + var_690ec5fb : "")) + "' doesn't exist for scene object ") + (isdefined(_str_name) ? "" + _str_name : "") + " in shot named ") + (isdefined(_str_shot) ? "" + _str_shot : "");
				if(!warning(_o_scene._b_testing, str_msg))
				{
					error(getdvarint(#"scene_align_errors", 1), str_msg);
				}
			}
		}
		if(!isdefined(e_align))
		{
			s_align = [[ _o_scene ]]->function_bc0facbb();
			if(isentity(s_align.ent) && !isdefined(s_align.tag))
			{
				if(isdefined(var_55b4f21e.aligntargettag) && !is_true(var_55b4f21e.var_ab59a015))
				{
					s_align.tag = var_55b4f21e.aligntargettag;
				}
				else
				{
					if(isdefined(_s.aligntargettag))
					{
						s_align.tag = _s.aligntargettag;
					}
					else if(isdefined(_o_scene._s.aligntargettag))
					{
						s_align.tag = _o_scene._s.aligntargettag;
					}
				}
			}
			return s_align;
		}
		return {#tag:var_139e0bfc, #ent:e_align};
	}

	/*
		Name: _should_skip_anim
		Namespace: csceneobject
		Checksum: 0x9E4B31AC
		Offset: 0x9240
		Size: 0x102
		Parameters: 1
		Flags: Linked
	*/
	function _should_skip_anim(animation)
	{
		if(is_true(_s.deletewhenfinished) && is_skipping_scene() && !is_player() && !is_true(_s.keepwhileskipping))
		{
			if(!animhasimportantnotifies(animation))
			{
				if(!isspawner(_e))
				{
					e = scene::get_existing_ent(_str_name, undefined, undefined, _o_scene._str_name);
					if(isdefined(e))
					{
						return false;
					}
				}
				return true;
			}
		}
		return false;
	}

	/*
		Name: play
		Namespace: csceneobject
		Checksum: 0x3010CB6E
		Offset: 0x2A60
		Size: 0xB3E
		Parameters: 2
		Flags: Linked
	*/
	function play(str_shot, n_start_time)
	{
		if(!isdefined(str_shot))
		{
			str_shot = "play";
		}
		n_shot = get_shot(str_shot);
		self.var_4da22aea = undefined;
		if(!isdefined(n_shot) && !has_streamer_hint())
		{
			/#
				if(level flag::get(""))
				{
					var_320710a9 = (((("" + str_shot) + "") + _str_name) + "") + function_9e72a96(_o_scene._str_name);
					iprintln(var_320710a9);
					println(var_320710a9);
				}
			#/
			flag::set(str_shot + "ready");
			flag::set(str_shot + "finished");
			function_638ad737(str_shot);
			return;
		}
		self notify(#"new_shot");
		self endon(#"new_shot");
		flag::set(str_shot + "active");
		if(!isdefined(_o_scene._a_active_shots))
		{
			_o_scene._a_active_shots = [];
		}
		else if(!isarray(_o_scene._a_active_shots))
		{
			_o_scene._a_active_shots = array(_o_scene._a_active_shots);
		}
		if(!isinarray(_o_scene._a_active_shots, str_shot))
		{
			_o_scene._a_active_shots[_o_scene._a_active_shots.size] = str_shot;
		}
		if(isdefined(_str_shot))
		{
			cleanup();
		}
		self._str_shot = str_shot;
		self.var_55b4f21e = _s.shots[n_shot];
		flag::clear(_str_shot + "stopped");
		flag::clear(_str_shot + "finished");
		flag::clear(_str_shot + "ready");
		flag::set(_str_shot + "active");
		spawn();
		function_f0e3e344();
		if(is_true(var_55b4f21e.var_51093f2d))
		{
			waitframe(1);
		}
		else
		{
			if(function_5c2a9efa())
			{
				function_ee94f77();
				play_anim("chicken_dance_placeholder_loop", 0, undefined, n_start_time);
			}
			else
			{
				var_e1c809d = var_55b4f21e.entry;
				function_ee94f77();
				if(is_player())
				{
					var_3f83c458 = array("cameraswitcher", "anim");
				}
				else
				{
					var_3f83c458 = array("anim");
				}
				foreach(str_entry_type in var_3f83c458)
				{
					if(!is_alive() || function_3919a776() || !isarray(var_e1c809d))
					{
						break;
					}
					foreach(s_entry in var_e1c809d)
					{
						entry = s_entry.(str_entry_type);
						if(isdefined(entry))
						{
							switch(str_entry_type)
							{
								case "cameraswitcher":
								{
									/#
										error(!isassetloaded("", entry), ("" + function_9e72a96(entry)) + "");
										error(!isassetloaded("", entry), ("" + entry) + "");
									#/
									if(ishash(entry))
									{
									}
									else
									{
									}
									var_aa49b05f = 1;
									play_anim(entry, 1, undefined, n_start_time);
									break;
								}
								case "anim":
								{
									/#
										error(!isassetloaded("", entry), ("" + function_9e72a96(entry)) + "");
										error(!isassetloaded("", entry), ("" + entry) + "");
										error(!isassetloaded("", entry), ("" + function_9e72a96(entry)) + "");
										error(!isassetloaded("", entry), ("" + entry) + "");
									#/
									if(is_true(_s.issiege))
									{
										if(ishash(entry))
										{
										}
										else
										{
										}
									}
									else
									{
										if(ishash(entry))
										{
										}
										else
										{
										}
									}
									if(!isdefined(var_4da22aea))
									{
										self.var_4da22aea = 0;
									}
									else
									{
										self.var_4da22aea++;
									}
									var_aa49b05f = 1;
									play_anim(entry, 0, is_true(var_55b4f21e.interactiveshot), n_start_time);
									break;
								}
								default:
								{
									/#
										error(1, ("" + str_entry_type) + "");
									#/
								}
							}
						}
					}
				}
				if(!is_true(var_aa49b05f))
				{
					waitframe(1);
					if(function_b260bdcc(_str_shot))
					{
						self._b_active_anim = 0;
					}
				}
				var_aa49b05f = 0;
			}
		}
		function_9ec459a2();
		if(is_player())
		{
			function_37c00617();
		}
		flag::wait_till_clear("scene_interactive_shot_active");
		if(!_o_scene._b_testing)
		{
			flag::wait_till_clear("waiting_for_damage");
		}
		if(is_true(_o_scene.var_2bc31f02) && is_true(_o_scene.var_d84cc502))
		{
			_o_scene flag::set(#"hash_42da41892ac54794");
		}
		if(is_alive())
		{
			flag::set(_str_shot + "finished");
			if(is_true(_s.diewhenfinished) && function_b260bdcc(_str_shot) || is_true(var_55b4f21e.diewhenfinished))
			{
				kill_ent();
			}
		}
		else
		{
			flag::set(_str_shot + "stopped");
		}
		if(!_b_active_anim)
		{
			cleanup();
		}
		self.var_4da22aea = undefined;
	}

	/*
		Name: has_streamer_hint
		Namespace: csceneobject
		Checksum: 0xCC2DEB79
		Offset: 0x2480
		Size: 0x58
		Parameters: 0
		Flags: Linked
	*/
	function has_streamer_hint()
	{
		if(is_player() && isdefined(_o_scene._a_streamer_hint) && isdefined(_o_scene._a_streamer_hint[_str_team]))
		{
			return true;
		}
		return false;
	}

	/*
		Name: function_d2039b28
		Namespace: csceneobject
		Checksum: 0x24FAE5E2
		Offset: 0x8690
		Size: 0x3E
		Parameters: 0
		Flags: Linked
	*/
	function function_d2039b28()
	{
		return (isdefined(_o_scene._e_root.origin) ? _o_scene._e_root.origin : (0, 0, 0));
	}

	/*
		Name: log
		Namespace: csceneobject
		Checksum: 0xDBADD209
		Offset: 0x9998
		Size: 0xD4
		Parameters: 1
		Flags: Linked
	*/
	function log(str_msg)
	{
		/#
			println((((_o_scene._s.type + "") + function_9e72a96(_o_scene._str_name) + "") + (isdefined(_s.name) ? "" + _s.name : (isdefined("") ? "" + "" : "")) + "") + str_msg);
		#/
	}

	/*
		Name: is_player
		Namespace: csceneobject
		Checksum: 0x557A0CE9
		Offset: 0x8E50
		Size: 0x5A
		Parameters: 0
		Flags: Linked
	*/
	function is_player()
	{
		return _s.type === "player" || _s.type === "sharedplayer" || _s.type === "playeroutfit";
	}

	/*
		Name: is_player_model
		Namespace: csceneobject
		Checksum: 0x71264513
		Offset: 0x8EB8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function is_player_model()
	{
		return _s.type === "fakeplayer";
	}

	/*
		Name: spawn_ent
		Namespace: csceneobject
		Checksum: 0x8FFEB045
		Offset: 0x8720
		Size: 0x26C
		Parameters: 0
		Flags: Linked
	*/
	function spawn_ent()
	{
		flag::set(#"spawning");
		b_disable_throttle = is_true(_o_scene._s.dontthrottle);
		if(!b_disable_throttle)
		{
			spawner::global_spawn_throttle();
		}
		if(isspawner(_e) && (is_actor() || is_vehicle()))
		{
			/#
				if(_o_scene._b_testing)
				{
					_e.count++;
				}
			#/
			if(!error(_e.count < 1, "Trying to spawn AI for scene with spawner count < 1"))
			{
				self._e = _e spawner::spawn(1);
			}
		}
		else
		{
			[[ self ]]->_spawn_ent();
		}
		if(!isdefined(_e))
		{
			if(isdefined(_s.model) && isdefined(_o_scene._e_root))
			{
				if(is_player_model())
				{
					self._e = util::spawn_anim_player_model(_s.model, function_d2039b28(), function_f9936b53());
				}
				else
				{
					self._e = util::spawn_anim_model(_s.model, function_d2039b28(), function_f9936b53());
				}
			}
		}
		function_a04fb5f4();
		flag::clear(#"spawning");
	}

	/*
		Name: function_dd4f74e1
		Namespace: csceneobject
		Checksum: 0x44A77DA3
		Offset: 0x35E8
		Size: 0x96
		Parameters: 0
		Flags: Linked
	*/
	function function_dd4f74e1()
	{
		if(is_true(_s.firstframe) && _o_scene._str_mode == "init" && isdefined(_e) && !is_true(_e.var_68ade67d))
		{
			self._b_first_frame = 1;
		}
		else
		{
			self._b_first_frame = 0;
		}
	}

	/*
		Name: function_e0df299e
		Namespace: csceneobject
		Checksum: 0x62B75F75
		Offset: 0x1F20
		Size: 0x106
		Parameters: 1
		Flags: Linked
	*/
	function function_e0df299e(_str_shot)
	{
		n_shot = get_shot(_str_shot);
		if(isdefined(n_shot) && isdefined(_s.shots[n_shot].entry))
		{
			foreach(s_entry in _s.shots[n_shot].entry)
			{
				if(isdefined(s_entry.anim) || isdefined(s_entry.cameraswitcher))
				{
					return true;
				}
			}
		}
		return false;
	}

	/*
		Name: function_e91c94b9
		Namespace: csceneobject
		Checksum: 0x8323A4E5
		Offset: 0x2430
		Size: 0x46
		Parameters: 1
		Flags: Linked
	*/
	function function_e91c94b9(n_shot)
	{
		if(isdefined(n_shot))
		{
			if(is_true(_s.shots[n_shot].interactiveshot))
			{
				return true;
			}
		}
		return false;
	}

	/*
		Name: function_ea176ba9
		Namespace: csceneobject
		Checksum: 0x9ED6F355
		Offset: 0x5428
		Size: 0x1D4
		Parameters: 0
		Flags: Linked
	*/
	function function_ea176ba9()
	{
		var_d705d1a8 = 1;
		if(isdefined(_o_scene._a_objects))
		{
			foreach(o_obj in _o_scene._a_objects)
			{
				if(isdefined(o_obj._e) && !is_true(o_obj._e.var_4819ae76))
				{
					var_d705d1a8 = 0;
					break;
				}
			}
		}
		if(var_d705d1a8)
		{
			_o_scene.var_d84cc502 = 1;
			if(isdefined(_o_scene._a_objects))
			{
				foreach(o_obj in _o_scene._a_objects)
				{
					o_obj flag::clear(#"waiting_for_damage");
				}
			}
			if(isdefined(_o_scene._e_root))
			{
				_o_scene._e_root notify(#"hash_18be12558bc58fe");
			}
		}
	}

	/*
		Name: _spawn
		Namespace: csceneobject
		Checksum: 0x822723FA
		Offset: 0xFE8
		Size: 0x19A
		Parameters: 0
		Flags: Linked
	*/
	function _spawn()
	{
		restore_saved_ent();
		if(!isdefined(_e))
		{
			if(isdefined(_s.name))
			{
				self._e = scene::get_existing_ent(_s.name, undefined, undefined, _o_scene._str_name);
			}
		}
		if(isdefined(_e))
		{
			if(is_true(_e.isdying))
			{
				_e delete();
			}
		}
		if(!isdefined(_e) && (!is_true(_s.nospawn) || is_true(_o_scene._b_testing)) || isspawner(_e))
		{
			spawn_ent();
			if(isdefined(_e))
			{
				_e dontinterpolate();
				_e.scene_spawned = _o_scene._s.name;
			}
		}
	}

	/*
		Name: function_ebbbd00d
		Namespace: csceneobject
		Checksum: 0xCC22F97A
		Offset: 0x3700
		Size: 0x114
		Parameters: 0
		Flags: Linked
	*/
	function function_ebbbd00d()
	{
		if(_b_first_frame)
		{
			return;
		}
		n_spacer_min = var_55b4f21e.spacermin;
		n_spacer_max = var_55b4f21e.spacermax;
		if(isdefined(n_spacer_min) || isdefined(n_spacer_max) && !is_skipping_scene())
		{
			if(isdefined(n_spacer_min) && isdefined(n_spacer_max))
			{
				if(!error(n_spacer_min >= n_spacer_max, "Spacer Min value must be less than Spacer Max value!"))
				{
					run_wait(randomfloatrange(n_spacer_min, n_spacer_max));
				}
			}
			else
			{
				if(isdefined(n_spacer_min))
				{
					run_wait(n_spacer_min);
				}
				else if(isdefined(n_spacer_max))
				{
					run_wait(n_spacer_max);
				}
			}
		}
	}

	/*
		Name: _assign_unique_name
		Namespace: csceneobject
		Checksum: 0xF4CB54EE
		Offset: 0x5E30
		Size: 0x6A
		Parameters: 0
		Flags: Linked
	*/
	function _assign_unique_name()
	{
		if(isdefined(_s.name))
		{
			self._str_name = _s.name;
		}
		else
		{
			self._str_name = (_o_scene._str_name + "_noname") + ([[ _o_scene ]]->get_object_id());
		}
	}

	/*
		Name: function_f0e3e344
		Namespace: csceneobject
		Checksum: 0x5AB7A8F6
		Offset: 0x2380
		Size: 0x4C
		Parameters: 0
		Flags: Linked
	*/
	function function_f0e3e344()
	{
		if(isdefined(var_55b4f21e.var_1c7fbd6b) && isdefined(_e))
		{
			_e setmodel(var_55b4f21e.var_1c7fbd6b);
		}
	}

	/*
		Name: function_f12c5e67
		Namespace: csceneobject
		Checksum: 0xAA9D074
		Offset: 0x5B48
		Size: 0xB0
		Parameters: 1
		Flags: Linked
	*/
	function function_f12c5e67(s_shot)
	{
		if(is_true(s_shot.var_b3dddfd3) || is_true(s_shot.var_163ca9fa) || is_true(s_shot.var_dbd0fa6f) || is_true(s_shot.var_650063ca) || is_true(s_shot.var_efd784b6))
		{
			return true;
		}
		return false;
	}

	/*
		Name: kill_ent
		Namespace: csceneobject
		Checksum: 0x2C4BE7F3
		Offset: 0x89A8
		Size: 0x192
		Parameters: 0
		Flags: Linked
	*/
	function kill_ent()
	{
		if(!isdefined(_e))
		{
			return;
		}
		if(is_true(function_4de466fd()))
		{
			_e.health = 0;
			return;
		}
		if(isarray(level.heroes) && isinarray(level.heroes, _e))
		{
			arrayremovevalue(level.heroes, _e, 1);
			_e notify(#"unmake_hero");
		}
		_e util::stop_magic_bullet_shield();
		_e.var_7136e83 = 1;
		_e.skipdeath = 1;
		_e.allowdeath = 1;
		_e.skipscenedeath = 1;
		_e._scene_object = undefined;
		if(isplayer(_e))
		{
			_e disableinvulnerability();
		}
		_e kill();
		_e.var_7136e83 = undefined;
	}

	/*
		Name: _reset_values
		Namespace: csceneobject
		Checksum: 0x7ADDE215
		Offset: 0xAF0
		Size: 0x84
		Parameters: 1
		Flags: Linked
	*/
	function _reset_values(ent)
	{
		if(!isdefined(ent))
		{
			ent = _e;
		}
		reset_ent_val("takedamage", ent);
		reset_ent_val("ignoreme", ent);
		reset_ent_val("allowdeath", ent);
		reset_ent_val("take_weapons", ent);
	}

	/*
		Name: on_play_anim
		Namespace: csceneobject
		Checksum: 0x348B708E
		Offset: 0x8678
		Size: 0xC
		Parameters: 1
		Flags: Linked
	*/
	function on_play_anim(ent)
	{
	}

	/*
		Name: skip_anim_on_client
		Namespace: csceneobject
		Checksum: 0x76033F77
		Offset: 0x9350
		Size: 0x74
		Parameters: 2
		Flags: Linked
	*/
	function skip_anim_on_client(entity, anim_name)
	{
		if(!isdefined(anim_name))
		{
			return;
		}
		if(!isdefined(entity))
		{
			return;
		}
		if(!entity isplayinganimscripted())
		{
			return;
		}
		if(isanimlooping(anim_name))
		{
			return;
		}
		entity clientfield::increment("player_scene_animation_skip");
	}

	/*
		Name: function_f9936b53
		Namespace: csceneobject
		Checksum: 0xB9A527B0
		Offset: 0x86D8
		Size: 0x3E
		Parameters: 0
		Flags: Linked
	*/
	function function_f9936b53()
	{
		return (isdefined(_o_scene._e_root.angles) ? _o_scene._e_root.angles : (0, 0, 0));
	}

	/*
		Name: reset_ent_val
		Namespace: csceneobject
		Checksum: 0x575F847C
		Offset: 0x9D0
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function reset_ent_val(str_key, ent)
	{
		if(!isdefined(ent))
		{
			ent = _e;
		}
		if(isdefined(ent))
		{
			ent val::reset((_o_scene._str_name + ":") + _str_shot, str_key);
		}
	}

	/*
		Name: get_orig_name
		Namespace: csceneobject
		Checksum: 0x49ABC93F
		Offset: 0x5EA8
		Size: 0x12
		Parameters: 0
		Flags: Linked
	*/
	function get_orig_name()
	{
		return _s.name;
	}

	/*
		Name: function_fda037ff
		Namespace: csceneobject
		Checksum: 0x4D6E2683
		Offset: 0x4320
		Size: 0x234
		Parameters: 0
		Flags: Linked
	*/
	function function_fda037ff()
	{
		if(!isdefined(var_55b4f21e))
		{
			return;
		}
		if(!isdefined(_e))
		{
			return;
		}
		if(is_true(var_55b4f21e.cleanupdelete) && !isplayer(_e))
		{
			thread function_2035b6d6(_e);
			return;
		}
		if(is_true(_s.var_e2360d85))
		{
			_e removeforcenocull();
		}
		if(is_true(_s.touchtriggers))
		{
			_e function_64df4ea3(0);
		}
		if(is_true(var_55b4f21e.var_3ea5d95f) && _str_shot != "init")
		{
			_e connectpaths();
		}
		else if(is_true(var_55b4f21e.var_8645db22))
		{
			_e disconnectpaths(2, 1);
		}
		if(is_true(var_55b4f21e.cleanuphide))
		{
			thread function_9960f8f0(_e);
		}
		else if(is_true(var_55b4f21e.cleanupshow))
		{
			_e notify(#"cleanupshow");
			_e val::reset(#"scene", "hide");
		}
	}

	/*
		Name: is_skipping_scene
		Namespace: csceneobject
		Checksum: 0xF49235F2
		Offset: 0x9968
		Size: 0x22
		Parameters: 0
		Flags: Linked
	*/
	function is_skipping_scene()
	{
		return is_true([[ _o_scene ]]->is_skipping_scene());
	}

}

class cscene 
{
	var _a_objects;
	var _s;
	var _b_testing;
	var _str_name;
	var _a_active_shots;
	var var_2e9fdf35;
	var var_5a2219f0;
	var var_232738b3;
	var scene_skip_completed;
	var n_frame_counter;
	var _e_root;
	var var_486885a7;
	var _str_team;
	var skipping_scene;
	var var_355308d8;
	var _b_stopped;
	var var_a0c66830;
	var b_player_scene;
	var _str_mode;
	var _n_object_id;
	var _a_request_times;
	var _str_notify_name;
	var var_b0ff34ce;
	var var_2bc31f02;
	var var_753367d;
	var scene_stopping;

	/*
		Name: constructor
		Namespace: cscene
		Checksum: 0x2426629A
		Offset: 0xB130
		Size: 0x66
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self._a_objects = [];
		self._b_testing = 0;
		self._n_object_id = 0;
		self._str_mode = "";
		self._a_streamer_hint = [];
		self._a_active_shots = [];
		self._a_request_times = [];
		self._b_stopped = 0;
	}

	/*
		Name: destructor
		Namespace: cscene
		Checksum: 0x7D0CCE4E
		Offset: 0xB1A0
		Size: 0x24
		Parameters: 0
		Flags: Linked, 16
	*/
	destructor()
	{
		/#
			log("");
		#/
	}

	/*
		Name: wait_till_shot_ready
		Namespace: cscene
		Checksum: 0x5B8A0A7B
		Offset: 0x10558
		Size: 0x154
		Parameters: 2
		Flags: Linked
	*/
	function wait_till_shot_ready(str_shot, o_exclude)
	{
		a_objects = [];
		if(isdefined(o_exclude))
		{
			a_objects = array::exclude(_a_objects, o_exclude);
		}
		else
		{
			a_objects = _a_objects;
		}
		if(is_true(_s.igc))
		{
			level flag::increment("waitting_for_igc_ready");
		}
		wait_till_objects_ready(str_shot, a_objects);
		flag::set(str_shot + "ready");
		sync_with_other_scenes(str_shot);
		flag::set(str_shot + "go");
		function_9a5f92e7();
		if(is_true(_s.igc))
		{
			level flag::decrement("waitting_for_igc_ready");
		}
	}

	/*
		Name: _is_ent_player
		Namespace: cscene
		Checksum: 0x58C2B346
		Offset: 0xD308
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function _is_ent_player(ent, str_team)
	{
		return isplayer(ent) && scene::check_team(ent.team, str_team);
	}

	/*
		Name: function_85ed339
		Namespace: cscene
		Checksum: 0xF6853471
		Offset: 0xBEC0
		Size: 0x5E
		Parameters: 1
		Flags: Linked
	*/
	function function_85ed339(s_obj)
	{
		str_type = tolower(s_obj.type);
		if(is_true(s_obj.var_615b1f16))
		{
			str_type = "fakeactor";
		}
		return str_type;
	}

	/*
		Name: _is_ent_vehicle
		Namespace: cscene
		Checksum: 0xF1C00F25
		Offset: 0xD3E8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function _is_ent_vehicle(ent, str_team)
	{
		return isvehicle(str_team) || isvehiclespawner(str_team);
	}

	/*
		Name: get_ents
		Namespace: cscene
		Checksum: 0x3075BA72
		Offset: 0x10228
		Size: 0x122
		Parameters: 0
		Flags: Linked
	*/
	function get_ents()
	{
		a_ents = [];
		if(isdefined(_a_objects))
		{
			foreach(o_obj in _a_objects)
			{
				if(isdefined(o_obj._s.name))
				{
					a_ents[o_obj._s.name] = o_obj._e;
					continue;
				}
				if(!isdefined(a_ents))
				{
					a_ents = [];
				}
				else if(!isarray(a_ents))
				{
					a_ents = array(a_ents);
				}
				a_ents[a_ents.size] = o_obj._e;
			}
		}
		return a_ents;
	}

	/*
		Name: add_to_sync_list
		Namespace: cscene
		Checksum: 0xF310A086
		Offset: 0xC0A8
		Size: 0x170
		Parameters: 1
		Flags: Linked
	*/
	function add_to_sync_list(str_shot)
	{
		if(!isdefined(level.scene_sync_list))
		{
			level.scene_sync_list = [];
		}
		remove_from_sync_list(str_shot);
		s_scene_request = spawnstruct();
		s_scene_request.o_scene = self;
		s_scene_request.str_shot = str_shot;
		if(!isdefined(level.scene_sync_list[get_request_time(str_shot)]))
		{
			level.scene_sync_list[get_request_time(str_shot)] = [];
		}
		else if(!isarray(level.scene_sync_list[get_request_time(str_shot)]))
		{
			level.scene_sync_list[get_request_time(str_shot)] = array(level.scene_sync_list[get_request_time(str_shot)]);
		}
		level.scene_sync_list[get_request_time(str_shot)][level.scene_sync_list[get_request_time(str_shot)].size] = s_scene_request;
		waittillframeend();
	}

	/*
		Name: wait_till_objects_ready
		Namespace: cscene
		Checksum: 0xD783EE21
		Offset: 0x10810
		Size: 0x102
		Parameters: 2
		Flags: Linked
	*/
	function wait_till_objects_ready(str_shot, &array)
	{
		for(i = 0; i < array.size; i++)
		{
			obj = array[i];
			if(isdefined(obj) && !obj flag::get(str_shot + "ready") && obj flag::get(str_shot + "active") && !obj flag::get(str_shot + "stopped"))
			{
				obj waittill(str_shot + "ready", str_shot + "active", str_shot + "stopped");
				i = -1;
			}
		}
	}

	/*
		Name: function_13804c36
		Namespace: cscene
		Checksum: 0xCDC5F94B
		Offset: 0xCF90
		Size: 0x138
		Parameters: 2
		Flags: Linked
	*/
	function function_13804c36(ent, str_obj_name)
	{
		if(ent.script_animname === str_obj_name || (isstring(ent.script_animname) && tolower(ent.script_animname) === str_obj_name))
		{
			return true;
		}
		if(ent.animname === str_obj_name || (isstring(ent.animname) && tolower(ent.animname) === str_obj_name))
		{
			return true;
		}
		if(ent.targetname === str_obj_name || (isstring(ent.targetname) && tolower(ent.targetname) === str_obj_name))
		{
			return true;
		}
		return false;
	}

	/*
		Name: _is_ent_actor
		Namespace: cscene
		Checksum: 0xA2719CED
		Offset: 0xD398
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function _is_ent_actor(ent, str_team)
	{
		return isactor(str_team) || isactorspawner(str_team);
	}

	/*
		Name: error
		Namespace: cscene
		Checksum: 0x8C784C78
		Offset: 0x11BA8
		Size: 0xC4
		Parameters: 2
		Flags: Linked
	*/
	function error(condition, str_msg)
	{
		if(condition)
		{
			if(_b_testing)
			{
				/#
					scene::error_on_screen(str_msg);
				#/
			}
			else
			{
				/#
					assertmsg(((_s.type + "") + function_9e72a96(_str_name) + "") + function_9e72a96(str_msg));
				#/
				/#
				#/
			}
			thread [[ self ]]->on_error();
			return true;
		}
		return false;
	}

	/*
		Name: has_next_shot
		Namespace: cscene
		Checksum: 0xB4E51F60
		Offset: 0xF698
		Size: 0x10A
		Parameters: 1
		Flags: Linked
	*/
	function has_next_shot(str_current_shot)
	{
		if(!isdefined(str_current_shot))
		{
			str_current_shot = _a_active_shots[0];
		}
		if(isdefined(var_2e9fdf35))
		{
			return true;
		}
		if(str_current_shot === "init")
		{
			return false;
		}
		foreach(i, str_shot in var_5a2219f0)
		{
			if(str_shot === str_current_shot && isdefined(var_5a2219f0[i + 1]) && (var_5a2219f0[i + 1]) !== "init")
			{
				return true;
			}
		}
		return false;
	}

	/*
		Name: function_1b4fe4c4
		Namespace: cscene
		Checksum: 0x6744030B
		Offset: 0xF2E0
		Size: 0x198
		Parameters: 0
		Flags: Linked
	*/
	function function_1b4fe4c4()
	{
		if(isarray(_a_objects))
		{
			foreach(object in _a_objects)
			{
				if(isdefined(object.var_55b4f21e.var_39fd697b))
				{
					a_ents = getentarray(object.var_55b4f21e.var_39fd697b, "targetname", 1);
					array::thread_all(a_ents, &val::set, #"script_hide", "hide", 1);
				}
				if(isdefined(object.var_55b4f21e.var_4ceff7a6))
				{
					a_ents = getentarray(object.var_55b4f21e.var_4ceff7a6, "targetname", 1);
					array::thread_all(a_ents, &val::reset, #"script_hide", "hide");
				}
			}
		}
	}

	/*
		Name: function_24f8cfb5
		Namespace: cscene
		Checksum: 0x370145BC
		Offset: 0xBC88
		Size: 0x18
		Parameters: 1
		Flags: Linked
	*/
	function function_24f8cfb5(str_shot)
	{
		return str_shot === var_232738b3;
	}

	/*
		Name: new_object
		Namespace: cscene
		Checksum: 0x8BC69263
		Offset: 0xC340
		Size: 0x1BA
		Parameters: 1
		Flags: Linked
	*/
	function new_object(str_type)
	{
		switch(str_type)
		{
			case "prop":
			{
				return new cscenemodel();
				break;
			}
			case "model":
			{
				return new cscenemodel();
				break;
			}
			case "vehicle":
			{
				return new cscenevehicle();
				break;
			}
			case "actor":
			{
				return new csceneactor();
				break;
			}
			case "fakeactor":
			{
				return new cscenefakeactor();
				break;
			}
			case "playeroutfit":
			{
				return new class_6572d7cd();
				break;
			}
			case "player":
			{
				return new csceneplayer();
				break;
			}
			case "sharedplayer":
			{
				return new cscenesharedplayer();
				break;
			}
			case "fakeplayer":
			{
				return new cscenefakeplayer();
				break;
			}
			default:
			{
				error(0, ("Unsupported object type '" + str_type) + "'.");
			}
		}
	}

	/*
		Name: _assign_ents_by_name
		Namespace: cscene
		Checksum: 0x4FB5D839
		Offset: 0xCBF0
		Size: 0x396
		Parameters: 2
		Flags: Linked
	*/
	function _assign_ents_by_name(&a_objects, &a_ents)
	{
		if(a_ents.size)
		{
			var_90bf7b4c = [];
			foreach(o_obj in a_objects)
			{
				obj_name = (isdefined(o_obj._s.name) ? "" + o_obj._s.name : "");
				if(obj_name != "")
				{
					var_f9347ad1 = undefined;
					foreach(str_name, e_ent in a_ents)
					{
						if(isint(str_name) && obj_name == (isdefined(str_name) ? "" + str_name : "") || (!isint(str_name) && hash(obj_name) == str_name) || function_13804c36(e_ent, obj_name))
						{
							assign_ent(o_obj, e_ent);
							var_f9347ad1 = str_name;
							var_90bf7b4c[var_90bf7b4c.size] = i;
							break;
						}
					}
					if(isdefined(var_f9347ad1))
					{
						arrayremoveindex(a_ents, var_f9347ad1, 1);
					}
				}
			}
			foreach(index in var_90bf7b4c)
			{
				arrayremoveindex(a_objects, index, 1);
			}
			/#
				foreach(i, ent in a_ents)
				{
					error(isstring(i) || ishash(i), ("" + i) + "");
				}
			#/
		}
		return a_ents.size;
	}

	/*
		Name: function_3e22b6ac
		Namespace: cscene
		Checksum: 0x92E22B5
		Offset: 0xF4E8
		Size: 0xC8
		Parameters: 0
		Flags: Linked
	*/
	function function_3e22b6ac()
	{
		if(isdefined(_a_objects))
		{
			foreach(obj in _a_objects)
			{
				if(isdefined(obj._e) && isbot(obj._e))
				{
					obj._e botreleasemanualcontrol();
				}
			}
		}
	}

	/*
		Name: scene_skip_completed
		Namespace: cscene
		Checksum: 0xA3BE8557
		Offset: 0xF670
		Size: 0x1A
		Parameters: 0
		Flags: Linked
	*/
	function scene_skip_completed()
	{
		return is_true(scene_skip_completed);
	}

	/*
		Name: function_4412dc65
		Namespace: cscene
		Checksum: 0x8ADFC2F5
		Offset: 0xB1D0
		Size: 0x5B8
		Parameters: 1
		Flags: Linked
	*/
	function function_4412dc65(str_shot)
	{
		/#
			self notify(#"hash_763a7354c3aaff58");
			self endon(#"scene_done", #"scene_stop", #"scene_skip_completed", #"hash_763a7354c3aaff58");
			if(_b_testing)
			{
				var_82bbc872 = 0;
				var_9d90ef8b = scene::function_12479eba(_str_name);
				a_shots = scene::get_all_shot_names(_str_name, 1);
				foreach(str_shot_name in _s.a_str_shot_names)
				{
					if(str_shot_name != str_shot)
					{
						var_82bbc872 = var_82bbc872 + (ceil(scene::function_8582657c(_s, str_shot_name) * 30));
						continue;
					}
					break;
				}
				self.n_frame_counter = var_82bbc872;
				while(true)
				{
					if(getdvarint(#"hash_67caa056eba27a53", 0) == 0 || !isdefined(_a_objects))
					{
						waitframe(1);
						continue;
					}
					v_pos = (1350, 195, 0);
					var_204b44d3 = var_9d90ef8b * (n_frame_counter / (ceil(var_9d90ef8b * 30)));
					var_962ef8af = (((((("" + n_frame_counter) + "") + (ceil(var_9d90ef8b * 30)) + "") + var_204b44d3) + "") + var_9d90ef8b) + "";
					debug2dtext(v_pos, var_962ef8af, undefined, undefined, undefined, 1, 0.8);
					v_pos = v_pos + (vectorscale((0, 1, 0), 20) * 2);
					foreach(obj in _a_objects)
					{
						if(!isdefined(obj._e) || !isdefined(obj._str_current_anim))
						{
							continue;
						}
						if(str_shot !== obj._str_shot)
						{
							continue;
						}
						animation = obj._str_current_anim;
						if(!isdefined(animation) || !isassetloaded("", animation))
						{
							continue;
						}
						var_13edeb1f = getanimframecount(animation);
						var_7b160393 = ceil(obj._e getanimtime(animation) * var_13edeb1f);
						var_958054e5 = getanimlength(animation);
						var_f667af2f = obj._e getanimtime(animation) * var_958054e5;
						var_2e63fccd = (obj._str_name + "") + function_9e72a96(animation);
						var_1cae5962 = ((((((((("" + str_shot) + "") + var_7b160393) + "") + var_13edeb1f) + "") + var_f667af2f) + "") + var_958054e5) + "";
						debug2dtext(v_pos, var_2e63fccd, undefined, undefined, undefined, 1, 0.8);
						v_pos = v_pos + vectorscale((0, 1, 0), 20);
						debug2dtext(v_pos, var_1cae5962, undefined, undefined, undefined, 1, 0.8);
						v_pos = v_pos + (vectorscale((0, 1, 0), 20) * 1.25);
						self.n_frame_counter = var_82bbc872 + var_7b160393;
					}
					waitframe(1);
				}
			}
		#/
	}

	/*
		Name: sync_with_other_scenes
		Namespace: cscene
		Checksum: 0x5D9CA9FC
		Offset: 0x10A68
		Size: 0x18C
		Parameters: 1
		Flags: Linked
	*/
	function sync_with_other_scenes(str_shot)
	{
		if(!is_true(_s.dontsync) && !is_skipping_scene())
		{
			n_request_time = get_request_time(str_shot);
			if(isdefined(level.scene_sync_list) && isarray(level.scene_sync_list[n_request_time]))
			{
				a_scene_requests = level.scene_sync_list[n_request_time];
				for(i = 0; i < a_scene_requests.size; i++)
				{
					a_scene_request = a_scene_requests[i];
					o_scene = a_scene_request.o_scene;
					str_flag = a_scene_request.str_shot + "ready";
					if(isdefined(a_scene_request) && !is_true(o_scene._s.dontsync) && !o_scene flag::get(str_flag))
					{
						o_scene flag::wait_till(str_flag);
						i = -1;
					}
				}
			}
		}
	}

	/*
		Name: set_request_time
		Namespace: cscene
		Checksum: 0xEDCE78F8
		Offset: 0xC060
		Size: 0x1C
		Parameters: 1
		Flags: Linked
	*/
	function set_request_time(str_shot)
	{
		self._a_request_times[str_shot] = gettime();
	}

	/*
		Name: function_4f12fd77
		Namespace: cscene
		Checksum: 0xB5D559D1
		Offset: 0xBCC8
		Size: 0x1A0
		Parameters: 1
		Flags: Linked
	*/
	function function_4f12fd77(s_obj)
	{
		if(is_player(s_obj) || is_true(s_obj.var_50f52c5b))
		{
			return;
		}
		if(isdefined(s_obj.shots))
		{
			foreach(s_shot in s_obj.shots)
			{
				if(s_shot.name === "init")
				{
					continue;
				}
				if(!isdefined(s_shot.entry) && !isdefined(s_shot.var_1c7fbd6b) && !isdefined(s_shot.var_64c0ee5a) && !isdefined(s_shot.cleanuphide) && !isdefined(s_shot.cleanupshow) && !isdefined(s_shot.cleanupdelete) && !isdefined(s_shot.var_3ea5d95f) && !isdefined(s_shot.var_8645db22))
				{
					arrayremovevalue(s_obj.shots, s_shot, 1);
				}
			}
		}
	}

	/*
		Name: function_558aaa66
		Namespace: cscene
		Checksum: 0x89250F02
		Offset: 0xBF28
		Size: 0x130
		Parameters: 2
		Flags: Linked
	*/
	function function_558aaa66(s_instance, s_obj)
	{
		if(_s.devstate === "placeholder" && isdefined(s_instance.target))
		{
			var_1bdb1cc6 = struct::get_array(s_instance.target, "targetname");
			foreach(struct in var_1bdb1cc6)
			{
				if(isdefined(struct.script_animname) && tolower(struct.script_animname) === tolower(s_obj.name))
				{
					s_obj.var_50f52c5b = 1;
					return struct;
				}
			}
		}
	}

	/*
		Name: _skip_scene
		Namespace: cscene
		Checksum: 0x7C6196AB
		Offset: 0x118E8
		Size: 0xBE
		Parameters: 0
		Flags: Linked
	*/
	function _skip_scene()
	{
		self endon(#"stopped");
		if(isdefined(_a_objects))
		{
			foreach(o_scene_object in _a_objects)
			{
				[[ o_scene_object ]]->skip_scene(1);
			}
		}
		self notify(#"skip_camera_anims");
	}

	/*
		Name: add_object
		Namespace: cscene
		Checksum: 0x7525F425
		Offset: 0x11A88
		Size: 0x74
		Parameters: 1
		Flags: Linked
	*/
	function add_object(o_object)
	{
		if(!isdefined(_a_objects))
		{
			self._a_objects = [];
		}
		else if(!isarray(_a_objects))
		{
			self._a_objects = array(_a_objects);
		}
		self._a_objects[_a_objects.size] = o_object;
	}

	/*
		Name: get_valid_objects
		Namespace: cscene
		Checksum: 0xCE786FDF
		Offset: 0x10C00
		Size: 0xE2
		Parameters: 0
		Flags: Linked
	*/
	function get_valid_objects()
	{
		a_obj = [];
		foreach(obj in _a_objects)
		{
			if([[ obj ]]->is_alive())
			{
				if(!isdefined(a_obj))
				{
					a_obj = [];
				}
				else if(!isarray(a_obj))
				{
					a_obj = array(a_obj);
				}
				a_obj[a_obj.size] = obj;
			}
		}
		return a_obj;
	}

	/*
		Name: on_error
		Namespace: cscene
		Checksum: 0x55D7AC5
		Offset: 0x10CF0
		Size: 0x14
		Parameters: 0
		Flags: Linked
	*/
	function on_error()
	{
		stop();
	}

	/*
		Name: get_root
		Namespace: cscene
		Checksum: 0x9E589430
		Offset: 0x10358
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function get_root()
	{
		return _e_root;
	}

	/*
		Name: remove_object
		Namespace: cscene
		Checksum: 0x85764B57
		Offset: 0x11B08
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function remove_object(o_object)
	{
		arrayremovevalue(_a_objects, o_object);
	}

	/*
		Name: skip_scene
		Namespace: cscene
		Checksum: 0x48FDAFB3
		Offset: 0x10D40
		Size: 0x810
		Parameters: 2
		Flags: Linked
	*/
	function skip_scene(var_11843b70, str_shot)
	{
		if(!isdefined(str_shot))
		{
			str_shot = _a_active_shots[0];
		}
		if(!is_true(var_11843b70) && is_true(_s.disablesceneskipping))
		{
			/#
				if(getdvarint(#"debug_scene_skip", 0) > 0)
				{
					printtoprightln((("" + _s.name) + "") + gettime(), (1, 0, 0));
				}
			#/
			finish_scene_skipping();
			return;
		}
		if(!is_true(var_486885a7))
		{
			self.var_486885a7 = 1;
			_call_shot_funcs("skip_started");
		}
		/#
			if(getdvarint(#"debug_scene_skip", 0) > 0)
			{
				printtoprightln((("" + _s.name) + "") + gettime(), (0, 1, 0));
			}
		#/
		if(!is_true(var_11843b70))
		{
			if(is_skipping_player_scene())
			{
				/#
					if(getdvarint(#"debug_scene_skip", 0) > 0)
					{
						printtoprightln("" + gettime());
					}
				#/
				if(getdvarint(#"scene_skip_no_fade", 0) == 0)
				{
					b_skip_fading = 0;
				}
				else
				{
					b_skip_fading = 1;
				}
				foreach(player in getplayers(_str_team))
				{
					player val::set(#"scene_skip", "freezecontrols", 1);
					player val::set(#"scene_skip", "takedamage", 0);
					player val::set(#"scene_skip", "ignoreme", 1);
					player val::set(#"scene_skip", "ignoreall", 1);
					if(!is_true(b_skip_fading))
					{
						player thread lui::screen_fade_out(0, "black", "scene_system");
					}
				}
				setpauseworld(0);
			}
		}
		if(!function_b260bdcc(str_shot))
		{
			var_f6688aea = 1;
		}
		else
		{
			var_f6688aea = 0;
		}
		flag::wait_till(str_shot + "go");
		/#
			if(getdvarint(#"debug_scene_skip", 0) > 0)
			{
				printtoprightln((("" + _s.name) + "") + gettime(), (0, 0, 1));
			}
		#/
		thread _skip_scene();
		/#
			if(getdvarint(#"debug_scene_skip", 0) > 0)
			{
				printtoprightln("" + gettime(), (0, 1, 0));
			}
		#/
		/#
			if(getdvarint(#"debug_scene_skip", 0) > 0)
			{
				if(isdefined(level.animation_played))
				{
					for(i = 0; i < level.animation_played.size; i++)
					{
						printtoprightln("" + level.animation_played[i], (1, 0, 0), -1);
					}
				}
			}
		#/
		wait_till_shot_finished(str_shot);
		self flag::set(#"shot_skip_completed");
		if(!var_f6688aea)
		{
			if(is_skipping_scene())
			{
				finish_scene_skipping();
			}
			else if(is_true(skipping_scene))
			{
				self.skipping_scene = undefined;
			}
			/#
				if(getdvarint(#"debug_scene_skip", 0) > 0)
				{
					printtoprightln((("" + _s.name) + "") + gettime(), (1, 0.5, 0));
				}
			#/
			_call_shot_funcs("skip_completed");
			if(is_true(_s.var_e3b54868) && !scene::function_46546b5c(_str_name))
			{
				self.var_753367d = 1;
				self notify(#"hash_63783193d9ac5bfc");
				thread play(var_355308d8, undefined, undefined, "single");
			}
			else
			{
				_call_shot_funcs("done");
				flag::set(#"scene_skip_completed");
			}
		}
		else if(is_skipping_player_scene())
		{
			if(_s scene::is_igc())
			{
				foreach(player in getplayers(_str_team))
				{
					player stopsounds();
				}
			}
		}
	}

	/*
		Name: is_looping
		Namespace: cscene
		Checksum: 0xB33E1FA7
		Offset: 0x10528
		Size: 0x22
		Parameters: 0
		Flags: Linked
	*/
	function is_looping()
	{
		return is_true(_s.looping);
	}

	/*
		Name: warning
		Namespace: cscene
		Checksum: 0x19A42E8A
		Offset: 0x11C78
		Size: 0x64
		Parameters: 2
		Flags: Linked
	*/
	function warning(condition, str_msg)
	{
		if(condition)
		{
			if(_b_testing)
			{
				/#
					scene::warning_on_screen((("" + _str_name) + "") + str_msg);
				#/
			}
			return true;
		}
		return false;
	}

	/*
		Name: wait_till_shot_finished
		Namespace: cscene
		Checksum: 0xCF810FFA
		Offset: 0x10920
		Size: 0x2C
		Parameters: 1
		Flags: Linked
	*/
	function wait_till_shot_finished(str_shot)
	{
		wait_till_objects_finished(str_shot, _a_objects);
	}

	/*
		Name: _assign_ents_by_type
		Namespace: cscene
		Checksum: 0x3B8E8C37
		Offset: 0xD0D0
		Size: 0x22E
		Parameters: 5
		Flags: Linked
	*/
	function _assign_ents_by_type(&a_objects, &a_ents, str_type, func_test, str_team)
	{
		if(!error(!isdefined(func_test), "_assign_ents_by_type called without specifying a func_test"))
		{
			if(a_ents.size)
			{
				a_objects_of_type = get_objects(str_type, str_team);
				if(a_objects_of_type.size)
				{
					var_aa70ce62 = [];
					foreach(ent in a_ents)
					{
						if([[func_test]](ent, str_team))
						{
							index = getfirstarraykey(a_objects_of_type);
							obj = array::pop_front(a_objects_of_type);
							if(isdefined(obj))
							{
								assign_ent(obj, ent);
								var_aa70ce62[var_aa70ce62.size] = str_name;
								arrayremoveindex(a_objects, index, 1);
								continue;
							}
							break;
						}
					}
					foreach(key in var_aa70ce62)
					{
						arrayremoveindex(a_ents, key, 1);
					}
				}
			}
		}
		return a_ents.size;
	}

	/*
		Name: stop
		Namespace: cscene
		Checksum: 0x5395D865
		Offset: 0xFBE0
		Size: 0x26A
		Parameters: 2
		Flags: Linked
	*/
	function stop(b_clear, b_finished)
	{
		if(!isdefined(b_clear))
		{
			b_clear = 0;
		}
		if(!isdefined(b_finished))
		{
			b_finished = 0;
		}
		if(_b_stopped || is_skipping_scene())
		{
			return;
		}
		/#
		#/
		self thread sync_with_client_scene("stop", b_clear);
		thread _call_shot_funcs("stop");
		self.scene_stopping = 1;
		if(isdefined(_a_objects) && !b_finished)
		{
			foreach(o_obj in _a_objects)
			{
				if(isdefined(o_obj) && !([[ o_obj ]]->in_a_different_scene()))
				{
					thread [[ o_obj ]]->stop(b_clear);
				}
			}
		}
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				printtoprightln("" + _s.name);
			}
			if(isdefined(_e_root) && isdefined(_e_root.last_scene_state_instance))
			{
				if(!b_finished)
				{
					level.last_scene_state[_str_name] = level.last_scene_state[_str_name] + "";
					_e_root.last_scene_state_instance[_str_name] = _e_root.last_scene_state_instance[_str_name] + "";
				}
				if(!isdefined(_e_root.scriptbundlename))
				{
					_e_root notify(#"stop_debug_display");
				}
			}
		#/
		self._b_stopped = 1;
	}

	/*
		Name: init
		Namespace: cscene
		Checksum: 0x576BA59E
		Offset: 0xB790
		Size: 0x4F0
		Parameters: 5
		Flags: Linked
	*/
	function init(str_scenedef, s_scenedef, e_align, a_ents, b_test_run)
	{
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				printtoprightln("" + str_scenedef);
			}
		#/
		s_scenedef scene::function_585fb738();
		s_scenedef.var_418c40ac = scene::function_c9770402(str_scenedef);
		self.var_355308d8 = s_scenedef.var_418c40ac;
		self.var_232738b3 = scene::function_c3a1b36a(str_scenedef);
		self.var_5a2219f0 = scene::get_all_shot_names(str_scenedef);
		self._s = s_scenedef;
		self._str_name = str_scenedef;
		self._b_testing = b_test_run;
		self._str_team = util::get_team_mapping(_s.team);
		var_2924e369 = util::get_team_mapping("sidea");
		var_3b6e87fc = util::get_team_mapping("sideb");
		self._a_streamer_hint[var_2924e369] = _s.var_a6da2039;
		self._a_streamer_hint[var_3b6e87fc] = _s.var_991a84ba;
		self._str_notify_name = isstring(_s.malebundle) || (ishash(_s.malebundle) ? _s.malebundle : _str_name);
		if(!isdefined(a_ents))
		{
			a_ents = [];
		}
		else if(!isarray(a_ents))
		{
			a_ents = array(a_ents);
		}
		if(!error(a_ents.size > _s.objects.size, "Trying to use more entities than scene supports."))
		{
			self._e_root = e_align;
			a_objs = get_valid_object_defs();
			foreach(s_obj in a_objs)
			{
				s_obj.type = function_85ed339(s_obj);
				if(isdefined(s_obj.name) && _e_root scene::function_9503138e() && isdefined(_e_root.target))
				{
					if(!isdefined(_e_root.var_1505fed6))
					{
						_e_root.var_1505fed6 = [];
					}
					_e_root.var_1505fed6[s_obj.name] = function_558aaa66(_e_root, s_obj);
				}
				function_4f12fd77(s_obj);
				add_object([[ [[ self ]]->new_object(s_obj.type) ]]->first_init(s_obj, self));
			}
			/#
				if(!isdefined(level.last_scene_state))
				{
					level.last_scene_state = [];
				}
				if(!isdefined(_e_root.last_scene_state_instance))
				{
					_e_root.last_scene_state_instance = [];
				}
				if(!isdefined(level.last_scene_state[_str_name]))
				{
					level.last_scene_state[_str_name] = "";
				}
				if(!isdefined(_e_root.last_scene_state_instance[_str_name]))
				{
					_e_root.last_scene_state_instance[_str_name] = "";
				}
			#/
		}
	}

	/*
		Name: is_scene_shared
		Namespace: cscene
		Checksum: 0x28E8DD14
		Offset: 0x10D10
		Size: 0x26
		Parameters: 0
		Flags: Linked
	*/
	function is_scene_shared()
	{
		if(_s scene::is_igc())
		{
			return true;
		}
		return false;
	}

	/*
		Name: function_9a5f92e7
		Namespace: cscene
		Checksum: 0xF7A562E7
		Offset: 0x106B8
		Size: 0x150
		Parameters: 0
		Flags: Linked
	*/
	function function_9a5f92e7()
	{
		foreach(obj in _a_objects)
		{
			if(isdefined(obj._e) && (isbot(obj._e) || isai(obj._e)))
			{
				if(isbot(obj._e))
				{
					obj._e clearforcedgoal();
					obj._e bottakemanualcontrol();
					continue;
				}
				if(issentient(obj._e))
				{
					obj._e clearforcedgoal();
				}
			}
		}
	}

	/*
		Name: function_9c8ba4a0
		Namespace: cscene
		Checksum: 0x8D141AC8
		Offset: 0x119B0
		Size: 0x22
		Parameters: 0
		Flags: Linked
	*/
	function function_9c8ba4a0()
	{
		return is_true(_s.var_5fb58492);
	}

	/*
		Name: assign_ents
		Namespace: cscene
		Checksum: 0x63FC975B
		Offset: 0xC840
		Size: 0x328
		Parameters: 1
		Flags: Linked
	*/
	function assign_ents(a_ents)
	{
		if(!isdefined(a_ents))
		{
			a_ents = [];
		}
		else if(!isarray(a_ents))
		{
			a_ents = array(a_ents);
		}
		arrayremovevalue(a_ents, undefined, 1);
		a_objects = arraycopy(_a_objects);
		if(_assign_ents_by_name(a_objects, a_ents))
		{
			if(_assign_ents_by_type(a_objects, a_ents, array("player", "sharedplayer"), &_is_ent_player, "sidea"))
			{
				if(_assign_ents_by_type(a_objects, a_ents, array("player", "sharedplayer"), &_is_ent_player, "sideb"))
				{
					if(_assign_ents_by_type(a_objects, a_ents, array("player", "sharedplayer"), &_is_ent_player, #"team3"))
					{
						if(_assign_ents_by_type(a_objects, a_ents, array("player", "sharedplayer"), &_is_ent_player))
						{
							if(_assign_ents_by_type(a_objects, a_ents, "actor", &_is_ent_actor))
							{
								if(_assign_ents_by_type(a_objects, a_ents, "fakeactor", &_is_ent_actor))
								{
									if(_assign_ents_by_type(a_objects, a_ents, "fakeplayer", &function_d1827f5c))
									{
										if(_assign_ents_by_type(a_objects, a_ents, "vehicle", &_is_ent_vehicle))
										{
											foreach(e_ent in a_ents)
											{
												o_obj = array::pop(a_objects);
												if(!error(!isdefined(o_obj), "No scene object to assign entity too.  You might have passed in more than the scene supports."))
												{
													assign_ent(o_obj, e_ent);
												}
											}
										}
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
		Name: finish_scene_skipping
		Namespace: cscene
		Checksum: 0x1BC920C0
		Offset: 0x11558
		Size: 0x386
		Parameters: 0
		Flags: Linked
	*/
	function finish_scene_skipping()
	{
		/#
			if(getdvarint(#"debug_scene_skip", 0) > 0)
			{
				printtoprightln("" + gettime(), (1, 0, 0));
			}
		#/
		if(is_skipping_scene())
		{
			/#
				if(getdvarint(#"debug_scene_skip", 0) > 0)
				{
					printtoprightln("" + gettime());
				}
			#/
			if(getdvarint(#"scene_skip_no_fade", 0) == 0)
			{
				b_skip_fading = 0;
			}
			else
			{
				b_skip_fading = 1;
			}
			function_f4b4e39f(0);
			level util::streamer_wait(undefined, undefined, 10);
			foreach(player in getplayers(_str_team))
			{
				player clientfield::increment_to_player("player_scene_skip_completed");
				player val::reset(#"scene_skip", "freezecontrols");
				player val::reset(#"scene_skip", "takedamage");
				player val::reset(#"scene_skip", "ignoreme");
				player val::reset(#"scene_skip", "ignoreall");
				player stopsounds();
			}
			if(!is_true(b_skip_fading))
			{
				if(!is_true(level.level_ending) && is_skipping_player_scene())
				{
					foreach(player in getplayers(_str_team))
					{
						player thread lui::screen_fade_in(1, "black", "scene_system");
					}
				}
			}
			self.b_player_scene = undefined;
			self.skipping_scene = undefined;
			self.scene_skip_completed = 1;
		}
	}

	/*
		Name: sync_with_client_scene
		Namespace: cscene
		Checksum: 0xCC0B8245
		Offset: 0xC690
		Size: 0x1A4
		Parameters: 2
		Flags: Linked
	*/
	function sync_with_client_scene(str_shot, b_test_run)
	{
		if(!isdefined(b_test_run))
		{
			b_test_run = 0;
		}
		if(_s.vmtype === "both" && !_s scene::is_igc())
		{
			self endon(str_shot + "finished");
			flag::wait_till(str_shot + "go");
			n_val = undefined;
			if(b_test_run)
			{
				switch(str_shot)
				{
					case "stop":
					{
						n_val = 3;
						break;
					}
					case "init":
					{
						n_val = 4;
						break;
					}
					default:
					{
						n_val = 5;
						break;
					}
				}
			}
			else
			{
				switch(str_shot)
				{
					case "stop":
					{
						n_val = 0;
						break;
					}
					case "init":
					{
						n_val = 1;
						break;
					}
					default:
					{
						n_val = 2;
						break;
					}
				}
			}
			level clientfield::set(_s.name, n_val);
		}
	}

	/*
		Name: get_anim_relative_start_time
		Namespace: cscene
		Checksum: 0xC9592531
		Offset: 0xD5E8
		Size: 0x136
		Parameters: 3
		Flags: Linked
	*/
	function get_anim_relative_start_time(animation, n_start_time, b_camera_anim)
	{
		if(!isdefined(b_camera_anim))
		{
			b_camera_anim = 0;
		}
		if(!isdefined(var_a0c66830))
		{
			return n_start_time;
		}
		if(b_camera_anim)
		{
			n_anim_length = float(getcamanimtime(animation)) / 1000;
			var_e2483c7 = iscamanimlooping(animation);
		}
		else
		{
			n_anim_length = getanimlength(animation);
			var_e2483c7 = isanimlooping(animation);
		}
		var_68219fcf = (var_a0c66830 / n_anim_length) * n_start_time;
		if(var_e2483c7)
		{
			if(var_68219fcf > 0.95)
			{
				var_68219fcf = 0.95;
			}
		}
		else if(var_68219fcf > 0.99)
		{
			var_68219fcf = 0.99;
		}
		return var_68219fcf;
	}

	/*
		Name: function_ab0c6edb
		Namespace: cscene
		Checksum: 0xB5D2F4F4
		Offset: 0xF480
		Size: 0x5E
		Parameters: 0
		Flags: Linked
	*/
	function function_ab0c6edb()
	{
		self endon(#"death", #"scene_stop", #"scene_done", #"scene_skip_completed");
		waitframe(1);
		self notify(#"hash_60adeaccbb565546");
	}

	/*
		Name: has_init_state
		Namespace: cscene
		Checksum: 0x14B61748
		Offset: 0xFBB8
		Size: 0x1A
		Parameters: 0
		Flags: Linked
	*/
	function has_init_state()
	{
		return scene::has_init_state(_str_name);
	}

	/*
		Name: function_b260bdcc
		Namespace: cscene
		Checksum: 0x276A1EE7
		Offset: 0xBCA8
		Size: 0x18
		Parameters: 1
		Flags: Linked
	*/
	function function_b260bdcc(str_shot)
	{
		return str_shot === var_355308d8;
	}

	/*
		Name: get_valid_object_defs
		Namespace: cscene
		Checksum: 0xE2241A4A
		Offset: 0xC508
		Size: 0x15C
		Parameters: 0
		Flags: Linked
	*/
	function get_valid_object_defs()
	{
		a_obj_defs = [];
		foreach(s_obj in _s.objects)
		{
			if(_s.vmtype !== "client" && s_obj.vmtype !== "client")
			{
				if(isdefined(s_obj.name) || isdefined(s_obj.model) || isdefined(s_obj.initanim) || isdefined(s_obj.mainanim))
				{
					if(!is_true(s_obj.disabled) && scene::function_6f382548(s_obj, _s.name))
					{
						a_obj_defs[a_obj_defs.size] = s_obj;
					}
				}
			}
		}
		return a_obj_defs;
	}

	/*
		Name: get_objects
		Namespace: cscene
		Checksum: 0x4D91529
		Offset: 0xD438
		Size: 0x1A8
		Parameters: 2
		Flags: Linked
	*/
	function get_objects(type, str_team)
	{
		a_ret = [];
		if(isarray(type))
		{
			foreach(obj in _a_objects)
			{
				if(isinarray(type, obj._s.type))
				{
					if(scene::check_team(obj._s.team, str_team))
					{
						a_ret[idx] = obj;
					}
				}
			}
		}
		else
		{
			foreach(obj in _a_objects)
			{
				if(obj._s.type == type)
				{
					if(scene::check_team(obj._s.team, str_team))
					{
						a_ret[idx] = obj;
					}
				}
			}
		}
		return a_ret;
	}

	/*
		Name: is_skipping_player_scene
		Namespace: cscene
		Checksum: 0xDE5AD709
		Offset: 0xF630
		Size: 0x32
		Parameters: 0
		Flags: Linked
	*/
	function is_skipping_player_scene()
	{
		return is_true(b_player_scene) || _str_mode == "skip_scene_player";
	}

	/*
		Name: get_object_id
		Namespace: cscene
		Checksum: 0x89332D83
		Offset: 0xC670
		Size: 0x16
		Parameters: 0
		Flags: Linked
	*/
	function get_object_id()
	{
		self._n_object_id++;
		return _n_object_id;
	}

	/*
		Name: get_request_time
		Namespace: cscene
		Checksum: 0x9DD21032
		Offset: 0xC088
		Size: 0x18
		Parameters: 1
		Flags: Linked
	*/
	function get_request_time(str_shot)
	{
		return _a_request_times[str_shot];
	}

	/*
		Name: function_bc0facbb
		Namespace: cscene
		Checksum: 0x15740D5D
		Offset: 0x10370
		Size: 0x1AC
		Parameters: 0
		Flags: Linked
	*/
	function function_bc0facbb()
	{
		e_align = _e_root;
		if(isdefined(_s.aligntarget))
		{
			e_gdt_align = scene::get_existing_ent(_s.aligntarget, 0, 1, _str_name);
			if(isdefined(e_gdt_align))
			{
				e_align = e_gdt_align;
			}
			var_139e0bfc = _s.aligntargettag;
			if(!isdefined(e_gdt_align))
			{
				str_msg = ("Align target '" + (isdefined(_s.aligntarget) ? "" + _s.aligntarget : "")) + "' doesn't exist for scene.";
				if(!warning(_b_testing, str_msg))
				{
					error(getdvarint(#"scene_align_errors", 1), str_msg);
				}
			}
		}
		else if(isdefined(_e_root) && isdefined(_e_root.e_scene_link))
		{
			e_align = _e_root.e_scene_link;
			var_139e0bfc = "tag_origin";
		}
		return {#tag:var_139e0bfc, #ent:e_align};
	}

	/*
		Name: wait_till_objects_finished
		Namespace: cscene
		Checksum: 0x9A573E20
		Offset: 0x10958
		Size: 0x102
		Parameters: 2
		Flags: Linked
	*/
	function wait_till_objects_finished(str_shot, &array)
	{
		for(i = 0; i < array.size; i++)
		{
			obj = array[i];
			if(isdefined(obj) && !obj flag::get(str_shot + "finished") && obj flag::get(str_shot + "active") && !obj flag::get(str_shot + "stopped"))
			{
				obj waittill(str_shot + "finished", str_shot + "active", str_shot + "stopped");
				i = -1;
			}
		}
	}

	/*
		Name: get_next_shot
		Namespace: cscene
		Checksum: 0x866FCBF5
		Offset: 0xF7B0
		Size: 0xE6
		Parameters: 1
		Flags: Linked
	*/
	function get_next_shot(str_current_shot)
	{
		if(isdefined(var_2e9fdf35))
		{
			var_1a15e649 = var_2e9fdf35;
			self.var_2e9fdf35 = undefined;
			return var_1a15e649;
		}
		foreach(i, str_shot in var_5a2219f0)
		{
			if(str_shot === str_current_shot && isdefined(var_5a2219f0[i + 1]))
			{
				return var_5a2219f0[i + 1];
			}
		}
	}

	/*
		Name: play
		Namespace: cscene
		Checksum: 0x14A062CB
		Offset: 0xD728
		Size: 0x16E6
		Parameters: 4
		Flags: Linked
	*/
	function play(str_shot, a_ents, b_testing, str_mode)
	{
		if(!isdefined(str_shot))
		{
			str_shot = "play";
		}
		if(!isdefined(b_testing))
		{
			b_testing = 0;
		}
		if(!isdefined(str_mode))
		{
			str_mode = "";
		}
		function_2ddeb362((("cScene::play : " + _s.name) + " shot ") + str_shot);
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				printtoprightln("" + _s.name);
			}
		#/
		if(str_mode == "single_loop")
		{
			self notify(#"hash_27297a73bc597607");
		}
		self notify(str_shot + "start");
		self endon(str_shot + "start", #"hash_27297a73bc597607");
		if(_s scene::is_igc())
		{
			function_f4b4e39f(1);
			callback::on_joined_team(&function_e6945023, self);
		}
		if(isdefined(_e_root) && isdefined(_e_root.script_teleport_location))
		{
			_e_root teleport::function_ff8a7a3();
		}
		if(str_mode == "skip_scene")
		{
			thread skip_scene(1, str_shot);
		}
		else if(str_mode == "skip_scene_player")
		{
			self.b_player_scene = 1;
			thread skip_scene(1, str_shot);
		}
		self._b_testing = b_testing;
		self._str_mode = str_mode;
		if(function_b260bdcc(str_shot))
		{
			self notify(#"hash_63783193d9ac5bfc");
		}
		if(is_true(_s.spectateonjoin))
		{
			level.scene_should_spectate_on_hot_join = 1;
		}
		assign_ents(a_ents);
		self thread sync_with_client_scene(str_shot, b_testing);
		if(issubstr(_str_mode, "play_from_time"))
		{
			args = strtok(_str_mode, ":");
			if(isdefined(args[1]))
			{
				var_79584e08 = float(args[1]);
				self.var_a0c66830 = scene::function_8582657c(_s, str_shot);
			}
			self.b_play_from_time = 1;
			if(!scene::function_6a0b0afe(_str_mode))
			{
				self._str_mode = "";
			}
			if(issubstr(args[0], "noai"))
			{
				self._str_mode = _str_mode + "_noai";
			}
			if(issubstr(args[0], "noplayers"))
			{
				self._str_mode = _str_mode + "_noplayers";
			}
		}
		if(!isdefined(level.active_scenes[_str_name]))
		{
			level.active_scenes[_str_name] = [];
		}
		else if(!isarray(level.active_scenes[_str_name]))
		{
			level.active_scenes[_str_name] = array(level.active_scenes[_str_name]);
		}
		if(!isinarray(level.active_scenes[_str_name], _e_root))
		{
			level.active_scenes[_str_name][level.active_scenes[_str_name].size] = _e_root;
		}
		arrayremovevalue(level.active_scenes[_str_name], undefined);
		if(!isdefined(_a_active_shots))
		{
			self._a_active_shots = [];
		}
		else if(!isarray(_a_active_shots))
		{
			self._a_active_shots = array(_a_active_shots);
		}
		if(!isinarray(_a_active_shots, str_shot))
		{
			self._a_active_shots[_a_active_shots.size] = str_shot;
		}
		if(isdefined(_e_root))
		{
			if(!isdefined(_e_root.scenes))
			{
				_e_root.scenes = [];
			}
			else if(!isarray(_e_root.scenes))
			{
				_e_root.scenes = array(_e_root.scenes);
			}
			if(!isinarray(_e_root.scenes, self))
			{
				_e_root.scenes[_e_root.scenes.size] = self;
			}
		}
		flag::clear(str_shot + "ready");
		flag::clear(str_shot + "go");
		flag::clear(str_shot + "finished");
		set_request_time(str_shot);
		if(!is_true(_s.dontsync) && !is_skipping_scene())
		{
			add_to_sync_list(str_shot);
		}
		foreach(o_obj in _a_objects)
		{
			thread [[ o_obj ]]->play(str_shot, var_79584e08);
		}
		/#
			thread function_4412dc65(str_shot);
			level.last_scene_state[_str_name] = str_shot;
			if(isdefined(_e_root) && isdefined(_e_root.last_scene_state_instance))
			{
				_e_root.last_scene_state_instance[_str_name] = str_shot;
				if(!isdefined(level.scene_roots))
				{
					level.scene_roots = [];
				}
				else if(!isarray(level.scene_roots))
				{
					level.scene_roots = array(level.scene_roots);
				}
				if(!isinarray(level.scene_roots, _e_root))
				{
					level.scene_roots[level.scene_roots.size] = _e_root;
				}
			}
		#/
		wait_till_shot_ready(str_shot);
		function_db6a44af();
		self thread function_ab0c6edb();
		remove_from_sync_list(str_shot);
		level flag::set(_str_notify_name + "_ready");
		if(isdefined(_e_root))
		{
			_e_root flag::set(#"scene_ents_ready");
		}
		if(strstartswith(_str_mode, "capture") || (_s scene::is_igc() && scene::function_a4dedc63(1)))
		{
			/#
				depth = getdvarstring(#"hash_3018c0b9207d1c", "");
				fps = getdvarstring(#"hash_51617678bebb961a", "");
				fmt = getdvarstring(#"hash_4bf15ae7a6fbf73c", "");
				if(scene::function_6a0b0afe(_str_mode) || getdvarint(#"hash_6a54249f0cc48945", 0) == 2 || scene::function_24f8cfb5(_str_name, str_shot) || _str_mode === "")
				{
					if(scene::function_6a0b0afe(_str_mode) || getdvarint(#"hash_6a54249f0cc48945", 0) == 2)
					{
						var_3a6bcf6e = (_str_name + "") + str_shot;
					}
					else
					{
						var_3a6bcf6e = _str_name;
					}
					level flag::set(#"scene_menu_disable");
					str_command = (((((((("" + depth) + "") + fps) + "") + fmt) + "") + _str_name) + "") + var_3a6bcf6e;
					adddebugcommand("");
					adddebugcommand(str_command);
				}
			#/
		}
		if(is_true(_s.var_e3b54868) && function_b260bdcc(str_shot) && !scene::function_46546b5c(_str_name))
		{
			if(!is_skipping_scene())
			{
				thread _call_shot_funcs(str_shot, 1);
				self.var_b0ff34ce = undefined;
			}
		}
		else
		{
			thread _call_shot_funcs(str_shot, 1);
		}
		wait_till_shot_finished(str_shot);
		function_1b4fe4c4();
		self.b_play_from_time = undefined;
		if(is_true(_s.spectateonjoin))
		{
			level.scene_should_spectate_on_hot_join = undefined;
		}
		if(!is_true(var_b0ff34ce) && (_str_mode != "init" && (!is_true(var_2bc31f02) && function_b260bdcc(str_shot)) || (is_true(var_2bc31f02) && flag::get(#"hash_42da41892ac54794"))))
		{
			if(!is_skipping_scene())
			{
				thread _call_shot_funcs("done");
			}
			self.var_b0ff34ce = 1;
			if(is_true(var_753367d))
			{
				self flag::set(#"scene_skip_completed");
			}
			if(isdefined(_e_root))
			{
				_e_root notify(#"scene_done", {#scenedef:_str_notify_name});
				_e_root scene::function_6f9a9e07();
			}
		}
		self notify(str_shot);
		if(scene::function_6a0b0afe(_str_mode))
		{
			self notify(#"hash_3168dab591a18b9b");
		}
		if(str_shot != "init" && _str_mode != "init" && !_b_stopped && !is_true(scene_stopping))
		{
			if(is_looping() || _str_mode === "loop" && is_true(var_b0ff34ce) || _str_mode === "single_loop")
			{
				self.var_b0ff34ce = undefined;
				if(has_init_state() && _str_mode !== "single_loop")
				{
					thread play("init", undefined, b_testing, str_mode);
				}
				else if(get_request_time(str_shot) < gettime())
				{
					if(_str_mode === "single_loop")
					{
						var_689ecfec = str_shot;
					}
					else
					{
						var_689ecfec = scene::function_de6a7579(_str_name, str_mode);
					}
					thread play(var_689ecfec, undefined, b_testing, str_mode);
				}
			}
			else if(!scene::function_6a0b0afe(_str_mode))
			{
				thread run_next(str_shot);
			}
		}
		if(is_true(_s.spectateonjoin))
		{
			level.scene_should_spectate_on_hot_join = undefined;
		}
		array::flag_wait_clear(_a_objects, str_shot + "active");
		if(!is_skipping_scene() || (is_skipping_scene() && scene_skip_completed()))
		{
			arrayremovevalue(_a_active_shots, str_shot);
		}
		if(!_a_active_shots.size || (is_skipping_scene() && scene_skip_completed()))
		{
			if(isdefined(level.active_scenes[_str_name]))
			{
				arrayremovevalue(level.active_scenes[_str_name], _e_root);
				arrayremovevalue(level.active_scenes[_str_name], undefined);
				if(level.active_scenes[_str_name].size == 0)
				{
					level.active_scenes[_str_name] = undefined;
				}
				arrayremovevalue(level.active_scenes, undefined, 1);
			}
			if(!isdefined(level.inactive_scenes[_str_name]))
			{
				level.inactive_scenes[_str_name] = [];
			}
			else if(!isarray(level.inactive_scenes[_str_name]))
			{
				level.inactive_scenes[_str_name] = array(level.inactive_scenes[_str_name]);
			}
			if(!isinarray(level.inactive_scenes[_str_name], _e_root))
			{
				level.inactive_scenes[_str_name][level.inactive_scenes[_str_name].size] = _e_root;
			}
			arrayremovevalue(level.inactive_scenes[_str_name], undefined);
			arrayremovevalue(level.inactive_scenes, undefined, 1);
			if(isdefined(_e_root))
			{
				arrayremovevalue(_e_root.scenes, self);
				if(_e_root.scenes.size == 0)
				{
					_e_root.scenes = undefined;
					/#
						arrayremovevalue(level.scene_roots, _e_root);
					#/
				}
				if(isstruct(_e_root) && !isdefined(_e_root.scriptbundlename) && isarray(level.inactive_scenes[_str_name]))
				{
					arrayremovevalue(level.inactive_scenes[_str_name], _e_root);
					if(level.inactive_scenes[_str_name].size == 0)
					{
						level.inactive_scenes[_str_name] = undefined;
					}
				}
			}
			/#
				arrayremovevalue(level.scene_roots, undefined);
			#/
			foreach(obj in _a_objects)
			{
				obj notify(#"death");
			}
			self._a_objects = undefined;
			self.var_58e5d094 = undefined;
			if(isdefined(_s) && _s scene::is_igc())
			{
				function_f4b4e39f(0);
				callback::remove_callback(#"joined_team", &function_e6945023, self);
			}
		}
		/#
			if(strstartswith(_str_mode, "") || (_s scene::is_igc() && scene::function_a4dedc63(1)))
			{
				conv = getdvarstring(#"hash_7b946c8966b56a8e", "");
				if(scene::function_6a0b0afe(_str_mode) || function_b260bdcc(str_shot) || getdvarint(#"hash_6a54249f0cc48945", 0) == 2)
				{
					level flag::clear(#"scene_menu_disable");
					adddebugcommand("" + conv);
				}
			}
		#/
		self notify(#"remove_callbacks");
	}

	/*
		Name: remove_from_sync_list
		Namespace: cscene
		Checksum: 0x19BCE91C
		Offset: 0xC220
		Size: 0x118
		Parameters: 1
		Flags: Linked
	*/
	function remove_from_sync_list(str_shot)
	{
		n_request_time = get_request_time(str_shot);
		if(isdefined(level.scene_sync_list) && isdefined(level.scene_sync_list[n_request_time]))
		{
			for(i = level.scene_sync_list[n_request_time].size - 1; i >= 0; i--)
			{
				s_scene_request = level.scene_sync_list[n_request_time][i];
				if(s_scene_request.o_scene == self && s_scene_request.str_shot == str_shot)
				{
					arrayremoveindex(level.scene_sync_list[n_request_time], i);
				}
			}
			if(!level.scene_sync_list[n_request_time].size)
			{
				level.scene_sync_list[n_request_time] = undefined;
			}
		}
	}

	/*
		Name: run_next
		Namespace: cscene
		Checksum: 0x255F8E82
		Offset: 0xF8A0
		Size: 0x30C
		Parameters: 1
		Flags: Linked
	*/
	function run_next(str_current_shot)
	{
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				printtoprightln("" + gettime());
			}
		#/
		b_run_next_scene = 0;
		if(has_next_shot(str_current_shot))
		{
			if(!_b_stopped && !is_true(scene_stopping))
			{
				var_8b188654 = is_skipping_scene();
				if(var_8b188654)
				{
					var_43cf9254 = 0;
					while(!flag::get(#"shot_skip_completed") || var_43cf9254 > 5)
					{
						var_43cf9254 = var_43cf9254 + (float(function_60d95f53()) / 1000);
						waitframe(1);
					}
					flag::clear(#"shot_skip_completed");
				}
				if(var_8b188654)
				{
					if(is_skipping_player_scene())
					{
						self._str_mode = "skip_scene_player";
					}
					else
					{
						self._str_mode = "skip_scene";
					}
				}
				else
				{
					b_run_next_scene = 1;
				}
				if(has_next_shot(str_current_shot))
				{
					var_1a15e649 = get_next_shot(str_current_shot);
					/#
						if(getdvarint(#"debug_scene_skip", 0) > 0 && is_skipping_scene())
						{
							printtoprightln((("" + str_current_shot) + "") + gettime(), (1, 1, 0));
						}
					#/
					switch(_s.scenetype)
					{
						case "scene":
						{
							thread [[ self ]]->play(var_1a15e649, undefined, _b_testing, _str_mode);
							break;
						}
						default:
						{
							thread [[ self ]]->play(var_1a15e649, undefined, _b_testing, _str_mode);
						}
					}
				}
			}
		}
		else
		{
			_call_shot_funcs("sequence_done");
		}
	}

	/*
		Name: function_d1827f5c
		Namespace: cscene
		Checksum: 0xDD8246D1
		Offset: 0xD360
		Size: 0x2A
		Parameters: 2
		Flags: Linked
	*/
	function function_d1827f5c(ent, str_team)
	{
		return is_true(str_team.var_8323de3e);
	}

	/*
		Name: log
		Namespace: cscene
		Checksum: 0xE366F798
		Offset: 0x11B38
		Size: 0x64
		Parameters: 1
		Flags: Linked
	*/
	function log(str_msg)
	{
		/#
			println(((_s.type + "") + function_9e72a96(_str_name) + "") + str_msg);
		#/
	}

	/*
		Name: has_player
		Namespace: cscene
		Checksum: 0xAC29CF0D
		Offset: 0x119E0
		Size: 0x9A
		Parameters: 0
		Flags: Linked
	*/
	function has_player()
	{
		if(!isdefined(_a_objects))
		{
			return false;
		}
		foreach(obj in _a_objects)
		{
			if([[ obj ]]->is_player())
			{
				return true;
			}
		}
		return false;
	}

	/*
		Name: is_player
		Namespace: cscene
		Checksum: 0x6C2B0779
		Offset: 0xBE70
		Size: 0x46
		Parameters: 1
		Flags: Linked
	*/
	function is_player(s_obj)
	{
		if(s_obj.type === "player" || s_obj.type === "sharedplayer")
		{
			return true;
		}
		return false;
	}

	/*
		Name: function_db6a44af
		Namespace: cscene
		Checksum: 0xA16CCE23
		Offset: 0xF140
		Size: 0x198
		Parameters: 0
		Flags: Linked
	*/
	function function_db6a44af()
	{
		if(isarray(_a_objects))
		{
			foreach(object in _a_objects)
			{
				if(isdefined(object.var_55b4f21e.var_3cd248f5))
				{
					a_ents = getentarray(object.var_55b4f21e.var_3cd248f5, "targetname", 1);
					array::thread_all(a_ents, &val::set, #"script_hide", "hide", 1);
				}
				if(isdefined(object.var_55b4f21e.var_b94164e))
				{
					a_ents = getentarray(object.var_55b4f21e.var_b94164e, "targetname", 1);
					array::thread_all(a_ents, &val::reset, #"script_hide", "hide");
				}
			}
		}
	}

	/*
		Name: function_e6945023
		Namespace: cscene
		Checksum: 0x5F4B8939
		Offset: 0xEE18
		Size: 0x31E
		Parameters: 1
		Flags: Linked
	*/
	function function_e6945023(player)
	{
		if(is_true(level.var_23e297bc))
		{
			return;
		}
		if(scene::check_team(player.team, _str_team))
		{
			foreach(obj in _a_objects)
			{
				if(isplayer(obj._e) && isdefined(obj._e.str_current_anim))
				{
					var_f667af2f = obj._e getanimtime(obj._e.str_current_anim);
					str_shot = obj._str_shot;
					break;
				}
			}
			if(isdefined(str_shot) && isdefined(var_f667af2f))
			{
				foreach(obj in _a_objects)
				{
					if(![[ obj ]]->function_e0df299e(str_shot))
					{
						continue;
					}
					if([[ obj ]]->is_shared_player() || ([[ obj ]]->function_527113ae() && !isplayer(obj._e)))
					{
						player endon(#"disconnect");
						self endon(#"death", #"scene_stop", #"scene_done", #"scene_skip_completed");
						while(player.sessionstate !== "playing")
						{
							waitframe(1);
						}
						if(is_true(obj._e.var_20ed0b0c))
						{
							obj._e delete();
						}
						if(!isdefined(obj._e))
						{
							obj._e = player;
						}
						player dontinterpolate();
						thread [[ obj ]]->play(str_shot, var_f667af2f);
						return;
					}
				}
			}
		}
	}

	/*
		Name: _call_shot_funcs
		Namespace: cscene
		Checksum: 0x1AD57EEB
		Offset: 0xFE58
		Size: 0x3C8
		Parameters: 2
		Flags: Linked
	*/
	function _call_shot_funcs(str_shot, b_waittill_go)
	{
		if(!isdefined(b_waittill_go))
		{
			b_waittill_go = 0;
		}
		self endon(str_shot);
		if(b_waittill_go)
		{
			flag::wait_till(str_shot + "go");
		}
		if(str_shot == "done")
		{
			level notify(_str_notify_name + "_done");
			self notify(#"scene_done");
			function_3e22b6ac();
		}
		if(str_shot == "stop")
		{
			self notify(#"scene_stop");
			function_3e22b6ac();
		}
		level notify((_str_notify_name + "_") + str_shot);
		if(str_shot == "sequence_done")
		{
			if(isdefined(level.scene_sequence_names[_s.name]))
			{
				level notify(level.scene_sequence_names[_s.name] + "_sequence_done");
			}
		}
		if(isdefined(level.scene_funcs) && isdefined(level.scene_funcs[_str_notify_name]) && isdefined(level.scene_funcs[_str_notify_name][str_shot]))
		{
			a_ents = get_ents();
			foreach(handler in level.scene_funcs[_str_notify_name][str_shot])
			{
				if(_str_mode === "init" && handler.size > 2)
				{
					continue;
				}
				func = handler[0];
				args = handler[1];
				util::function_50f54b6f(_e_root, func, a_ents, args);
			}
		}
		if(isdefined(level.var_4247a0d6) && isdefined(level.var_4247a0d6[_str_notify_name]) && isdefined(level.var_4247a0d6[_str_notify_name][str_shot]))
		{
			foreach(handler in level.var_4247a0d6[_str_notify_name][str_shot])
			{
				if(_str_mode === "init" && handler.size > 2)
				{
					continue;
				}
				func = handler[0];
				args = handler[1];
				util::single_thread_argarray(_e_root, func, args);
			}
		}
	}

	/*
		Name: assign_ent
		Namespace: cscene
		Checksum: 0x3ADE1E7F
		Offset: 0xCB70
		Size: 0x78
		Parameters: 2
		Flags: Linked
	*/
	function assign_ent(o_obj, ent)
	{
		o_obj._e = ent;
		if(isdefined(_e_root))
		{
			if(!isdefined(_e_root.scene_ents))
			{
				_e_root.scene_ents = [];
			}
			_e_root.scene_ents[o_obj._str_name] = o_obj._e;
		}
	}

	/*
		Name: is_skipping_scene
		Namespace: cscene
		Checksum: 0x313D5019
		Offset: 0xF5B8
		Size: 0x6E
		Parameters: 0
		Flags: Linked
	*/
	function is_skipping_scene()
	{
		return is_true(skipping_scene) || _str_mode == "skip_scene" || _str_mode == "skip_scene_player" && !is_true(_s.disablesceneskipping);
	}

}

#namespace scene;

/*
	Name: prepare_player_model_anim
	Namespace: scene
	Checksum: 0xBA249549
	Offset: 0x820
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function prepare_player_model_anim(ent)
{
	if(ent.animtree !== "all_player")
	{
		ent useanimtree("all_player");
		ent.animtree = "all_player";
	}
}

/*
	Name: prepare_generic_model_anim
	Namespace: scene
	Checksum: 0x9CCF4867
	Offset: 0x880
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function prepare_generic_model_anim(ent)
{
	if(ent.animtree !== "generic")
	{
		ent useanimtree("generic");
		ent.animtree = "generic";
	}
}

