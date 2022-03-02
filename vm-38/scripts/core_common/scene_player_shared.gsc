#using script_18f0d22c75b141a7;
#using script_24c15fbbb838c794;
#using script_256b8879317373de;
#using script_5399f402045d7abd;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_objects_shared.gsc;
#using scripts\core_common\scene_player_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;

class csceneplayer : csceneobject
{
	var _s;
	var var_55b4f21e;
	var _o_scene;
	var _e;
	var _func_get;
	var _str_camera;
	var _n_ent_num;
	var var_f4b34dc1;
	var m_tag;
	var m_align;
	var _str_shot;
	var _n_streamer_req;
	var var_a3cc5416;
	var var_efc540b6;
	var _str_current_anim;
	var _str_team;

	/*
		Name: constructor
		Namespace: csceneplayer
		Checksum: 0x2DE6E30
		Offset: 0x3D0
		Size: 0x4E
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self._func_get = &scene::function_3d35d3ca;
		self._func_get_active = &scene::function_e941ea66;
		self._n_streamer_req = -1;
	}

	/*
		Name: destructor
		Namespace: csceneplayer
		Checksum: 0x8B7713B1
		Offset: 0x85E0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_607d830
		Namespace: csceneplayer
		Checksum: 0x301271ED
		Offset: 0x1DA0
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function function_607d830()
	{
		return is_true(_s.hidestowedweapon) || is_true(var_55b4f21e.hidestowedweapon);
	}

	/*
		Name: function_d09b043
		Namespace: csceneplayer
		Checksum: 0xC5805F79
		Offset: 0xA30
		Size: 0x11C
		Parameters: 0
		Flags: Linked
	*/
	function function_d09b043()
	{
		if(is_true(var_55b4f21e.var_1bc28a87))
		{
			return;
		}
		self notify(#"hash_30095f69ee804b7e");
		self endon(#"hash_30095f69ee804b7e");
		_o_scene endon(#"scene_done", #"scene_stop", #"scene_skip_completed", #"hash_3168dab591a18b9b");
		var_be17187b = undefined;
		var_be17187b = _e waittill(#"death");
		self.var_1f97724a = 1;
		_e notify(#"hash_6e7fd8207fd988c6", {#str_scene:_o_scene._str_name});
		csceneobject::function_1e19d813();
	}

	/*
		Name: function_d0cf938
		Namespace: csceneplayer
		Checksum: 0x4C016AD1
		Offset: 0x5558
		Size: 0xD0
		Parameters: 2
		Flags: Linked
	*/
	function function_d0cf938(player, b_enable)
	{
		if(!isdefined(b_enable))
		{
			b_enable = 1;
		}
		player endon(#"hash_1aa7e630a34bee50");
		if(b_enable)
		{
			while(isalive(player))
			{
				player playrumbleonentity("damage_heavy");
				wait(0.1);
			}
			player stoprumble("damage_heavy");
		}
		else
		{
			player stoprumble("damage_heavy");
			player notify(#"hash_1aa7e630a34bee50");
		}
	}

	/*
		Name: function_f85ac52
		Namespace: csceneplayer
		Checksum: 0x4FF4CF4E
		Offset: 0x79F8
		Size: 0x80
		Parameters: 1
		Flags: Linked
	*/
	function function_f85ac52(player)
	{
		var_82e125b6 = (isdefined(var_55b4f21e.extracamindex) ? var_55b4f21e.extracamindex : _s.extracamindex);
		if(isdefined(var_82e125b6))
		{
			var_e5489dff = int(var_82e125b6) - 1;
		}
		return var_e5489dff;
	}

	/*
		Name: function_1db23c62
		Namespace: csceneplayer
		Checksum: 0x40E4E127
		Offset: 0x1D50
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function function_1db23c62()
	{
		return is_true(_s.var_1a95895f) || is_true(var_55b4f21e.var_1a95895f);
	}

	/*
		Name: _cleanup
		Namespace: csceneplayer
		Checksum: 0x71643C3D
		Offset: 0x67A8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function _cleanup()
	{
		_cleanup_player(_e);
	}

	/*
		Name: play_camera
		Namespace: csceneplayer
		Checksum: 0x7E344416
		Offset: 0x73E0
		Size: 0x2DE
		Parameters: 2
		Flags: Linked
	*/
	function play_camera(animation, n_start_time)
	{
		if(!isdefined(n_start_time))
		{
			n_start_time = 0;
		}
		flag::set(#"camera_playing");
		if(csceneobject::is_shared_player())
		{
			a_players = [[_func_get]](_o_scene._str_team);
			if(!a_players.size && is_true(_o_scene._b_testing))
			{
				str_enemy_team = util::get_enemy_team(_o_scene._str_team);
				a_players = [[_func_get]](str_enemy_team);
			}
			foreach(player in a_players)
			{
				self._str_camera = [[ self ]]->animation_lookup(animation, player, 1);
				player.var_36fa161e = _str_camera;
				thread play_camera_on_player(player, n_start_time);
			}
			if(isdefined(_str_camera))
			{
				wait_for_camera(_str_camera, n_start_time);
			}
		}
		else
		{
			self._str_camera = [[ self ]]->animation_lookup(animation, _e, 1);
			_e.var_36fa161e = _str_camera;
			thread play_camera_on_player(_e, n_start_time);
			wait_for_camera(_str_camera, n_start_time);
		}
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				csceneobject::log(((toupper(_s.type) + "") + _str_camera) + "");
			}
		#/
		flag::clear(#"camera_playing");
		self._str_camera = undefined;
	}

	/*
		Name: _play_anim
		Namespace: csceneplayer
		Checksum: 0xA811FEF3
		Offset: 0x5E18
		Size: 0x70C
		Parameters: 7
		Flags: Linked
	*/
	function _play_anim(animation, n_rate, n_blend, var_b2e32ae2, n_time, var_7d32b2c6, paused)
	{
		player = _e;
		n_lerp = (isdefined(var_7d32b2c6) ? var_7d32b2c6 : csceneobject::get_lerp_time());
		if(_o_scene._s scene::is_igc())
		{
			if(n_lerp == 0)
			{
				player dontinterpolate();
			}
			player flag::set(#"hash_7cddd51e45d3ff3e");
		}
		csceneobject::function_a04fb5f4();
		if(!function_6c1c67c1() && isplayer(player))
		{
			endcamanimscripted(player);
			if(csceneobject::function_595c601b())
			{
				n_camera_tween = get_camera_tween();
				if(n_camera_tween > 0)
				{
					var_186edacf = function_7d78187b();
					player startcameratween(n_camera_tween, 0, var_186edacf);
				}
			}
		}
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				printtoprightln((("" + (isdefined(_s.name) ? _s.name : _s.model)) + "") + animation);
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
		if(csceneobject::is_skipping_scene() && n_rate != 0)
		{
			thread csceneobject::skip_scene_shot_animations();
		}
		on_play_anim(player);
		if(is_true(_s.var_69aabff2))
		{
			b_unlink_after_completed = 0;
		}
		if(csceneobject::function_5c2a9efa())
		{
			csceneobject::function_5c082667();
		}
		else
		{
			if(isdefined(player.var_d43badce))
			{
				player.var_d43badce animation::play(animation, m_align, m_tag, n_rate, n_blend, 0, n_lerp, n_time, _s.showweaponinfirstperson, b_unlink_after_completed, var_f4b34dc1, paused, undefined, var_b2e32ae2);
			}
			else
			{
				player animation::play(animation, m_align, m_tag, n_rate, n_blend, 0, n_lerp, n_time, _s.showweaponinfirstperson, b_unlink_after_completed, var_f4b34dc1, paused, undefined, var_b2e32ae2, _s.showviewmodel);
			}
			self.var_f4b34dc1 = undefined;
		}
		if(isdefined(player))
		{
			player flag::clear(#"hash_7cddd51e45d3ff3e");
		}
		if(!isdefined(player) || !player isplayinganimscripted())
		{
			self.current_playing_anim[_n_ent_num] = undefined;
		}
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				csceneobject::log((toupper(_s.type) + "") + function_9e72a96(animation) + "");
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
		Name: function_31a89cb0
		Namespace: csceneplayer
		Checksum: 0x614EF1A2
		Offset: 0x5480
		Size: 0xD0
		Parameters: 2
		Flags: Linked
	*/
	function function_31a89cb0(player, b_enable)
	{
		if(!isdefined(b_enable))
		{
			b_enable = 1;
		}
		player endon(#"hash_3fdc27904c7ef691");
		if(b_enable)
		{
			while(isalive(player))
			{
				player playrumbleonentity("damage_light");
				wait(0.3);
			}
			player stoprumble("damage_light");
		}
		else
		{
			player stoprumble("damage_light");
			player notify(#"hash_3fdc27904c7ef691");
		}
	}

	/*
		Name: function_39ab0a6a
		Namespace: csceneplayer
		Checksum: 0x4346F3A
		Offset: 0x2620
		Size: 0x14C
		Parameters: 2
		Flags: Linked
	*/
	function function_39ab0a6a(player, params)
	{
		if(player === _e && player::is_valid_weapon(params.weapon) && isdefined(player.str_current_anim) && player getcurrentweapon() != params.weapon)
		{
			str_new_anim = csceneobject::function_9a43e31(player, csceneobject::get_animation_name(_str_shot, 1), 0);
			if(str_new_anim != player.str_current_anim)
			{
				n_current_time = player getanimtime(player.str_current_anim);
				if(function_6c1c67c1())
				{
					thread csceneobject::play_anim(str_new_anim, 0, 0, n_current_time);
				}
				else
				{
					player.str_current_anim = str_new_anim;
					thread csceneobject::play(_str_shot, n_current_time);
				}
			}
		}
	}

	/*
		Name: animation_lookup
		Namespace: csceneplayer
		Checksum: 0x234F6356
		Offset: 0x7BF0
		Size: 0x3FA
		Parameters: 3
		Flags: Linked
	*/
	function animation_lookup(animation, ent, b_camera)
	{
		if(!isdefined(ent))
		{
			ent = _e;
		}
		if(!isdefined(b_camera))
		{
			b_camera = 0;
		}
		if(isdefined(_o_scene.var_58e5d094) && !b_camera)
		{
			if(self === _o_scene.var_58e5d094 && isarray(_o_scene._a_objects))
			{
				foreach(obj in _o_scene._a_objects)
				{
					if(obj != self && [[ obj ]]->function_527113ae() && isdefined(obj._e))
					{
						var_65cfb30b = [[ obj ]]->get_animation_name(_str_shot, 1);
						var_65cfb30b = [[ obj ]]->function_9a43e31(ent, var_65cfb30b);
						self.var_f4b34dc1[obj._e getentitynumber()] = var_65cfb30b;
					}
				}
			}
			var_9defbbb0 = [[ _o_scene.var_58e5d094 ]]->get_animation_name(_str_shot, 1);
			var_9defbbb0 = [[ _o_scene.var_58e5d094 ]]->function_9a43e31(ent, var_9defbbb0);
			self.var_f4b34dc1[ent getentitynumber()] = var_9defbbb0;
			if(is_true(_s.var_186d089d) && isarray(_o_scene._a_objects))
			{
				foreach(obj in _o_scene._a_objects)
				{
					if(obj != self && [[ obj ]]->function_527113ae() && isplayer(obj._e) && isplayer(ent) && !is_true(obj._s.var_186d089d))
					{
						var_a2265eca = [[ obj ]]->get_animation_name(_str_shot, 1);
						var_8d34c269 = csceneobject::get_animation_name(_str_shot, 1);
						if(var_8d34c269 === var_a2265eca)
						{
							obj._e setinvisibletoplayer(ent);
							ent setinvisibletoplayer(obj._e);
						}
					}
				}
			}
		}
		animation = csceneobject::function_9a43e31(ent, animation, b_camera);
		return animation;
	}

	/*
		Name: function_509b9f47
		Namespace: csceneplayer
		Checksum: 0x3C5C6C27
		Offset: 0x6F28
		Size: 0x14C
		Parameters: 1
		Flags: Linked
	*/
	function function_509b9f47(player)
	{
		if(!isplayer(player))
		{
			return;
		}
		player notify(#"hash_375ad02201949a8d");
		player endon(#"camanimscripted", #"hash_375ad02201949a8d", #"disconnect");
		if(!scene::function_6a0b0afe(_o_scene._str_mode))
		{
			_o_scene waittilltimeout(0.1, #"scene_done", #"scene_stop", #"scene_skip_completed");
		}
		function_52b00538(player);
		/#
			if(is_true(_o_scene._b_testing))
			{
				p_host = util::gethostplayer();
				function_52b00538(p_host);
			}
		#/
	}

	/*
		Name: function_52b00538
		Namespace: csceneplayer
		Checksum: 0x2259CF94
		Offset: 0x7A80
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function function_52b00538(player)
	{
		if(isplayer(player))
		{
			endcamanimscripted(player);
		}
	}

	/*
		Name: _set_values
		Namespace: csceneplayer
		Checksum: 0xA54E65C
		Offset: 0xB58
		Size: 0x22C
		Parameters: 1
		Flags: Linked
	*/
	function _set_values(ent)
	{
		if(!isdefined(ent))
		{
			ent = _e;
		}
		if(!is_true(_s.takedamage) && !sessionmodeismultiplayergame() && !function_f99d2668() && !sessionmodeiszombiesgame())
		{
			ent setnormalhealth(1);
		}
		if(is_true(ent.takedamage) && !ent getinvulnerability() && !sessionmodeismultiplayergame() && !function_f99d2668())
		{
			csceneobject::set_ent_val("takedamage", is_true(_s.takedamage), ent);
		}
		csceneobject::set_ent_val("ignoreme", !is_true(_s.takedamage), ent);
		if(!sessionmodeismultiplayergame() && !function_f99d2668())
		{
			csceneobject::set_ent_val("allowdeath", is_true(_s.allowdeath), ent);
			csceneobject::set_ent_val("take_weapons", is_true(_s.removeweapon), ent);
		}
	}

	/*
		Name: destroy_dev_info
		Namespace: csceneplayer
		Checksum: 0x5D4DA7DF
		Offset: 0x8528
		Size: 0xAC
		Parameters: 0
		Flags: Linked
	*/
	function destroy_dev_info()
	{
		/#
			if(isdefined(level.hud_scene_dev_info1))
			{
				level.hud_scene_dev_info1 destroy();
			}
			if(isdefined(level.hud_scene_dev_info2))
			{
				level.hud_scene_dev_info2 destroy();
			}
			if(isdefined(level.hud_scene_dev_info3))
			{
				level.hud_scene_dev_info3 destroy();
			}
			if(isdefined(level.var_6e7be24a))
			{
				level.var_6e7be24a destroy();
			}
		#/
	}

	/*
		Name: wait_for_camera
		Namespace: csceneplayer
		Checksum: 0x1912E343
		Offset: 0x7188
		Size: 0xBC
		Parameters: 2
		Flags: Linked
	*/
	function wait_for_camera(str_cam, n_start_time)
	{
		self endon(#"skip_camera_anims", _str_shot + "active");
		if(iscamanimlooping(str_cam))
		{
			level waittill(#"forever");
		}
		else
		{
			var_d4594f1 = float(getcamanimtime(str_cam)) / 1000;
			scene::wait_server_time(var_d4594f1, n_start_time);
		}
	}

	/*
		Name: _cleanup_player
		Namespace: csceneplayer
		Checksum: 0xE447176A
		Offset: 0x67D0
		Size: 0x5EC
		Parameters: 1
		Flags: Linked
	*/
	function _cleanup_player(player)
	{
		if(!isdefined(player))
		{
			return;
		}
		if(csceneobject::function_527113ae() && player flag::get(#"shared_igc"))
		{
			return;
		}
		if(csceneobject::is_shared_player() && player flag::get(#"hash_7cddd51e45d3ff3e"))
		{
			return;
		}
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				printtoprightln("");
			}
		#/
		player notify(#"hash_7ba9e3058f933eb");
		player.var_c3a79d20 = undefined;
		player.scene_set_visible_time = level.time;
		player setvisibletoall();
		player val::reset(#"scene", "hide");
		player flag::clear(#"shared_igc");
		player flag::clear(#"scene");
		player flag::clear(#"hash_33908195984d5565");
		player._scene_object = undefined;
		player.anim_debug_name = undefined;
		player.current_scene = undefined;
		player.scene_takedamage = undefined;
		player._scene_old_gun_removed = undefined;
		if(isplayer(player) && (csceneobject::function_b260bdcc(_str_shot) || scene::function_6a0b0afe(_o_scene._str_mode) || is_true(_o_scene.scene_stopping)))
		{
			player scene::set_igc_active(0);
			player notify(#"hash_684b272680aa2ed", {#str_scene:_o_scene._str_name});
			player thread scene::scene_enable_player_stuff(_o_scene._s, _s, _o_scene._e_root);
			var_700fed0d = player getentitynumber() + 2;
			player util::delay_network_frames(var_700fed0d, "disconnect", &clientfield::set_to_player, "postfx_cateye", 0);
		}
		n_camera_tween_out = get_camera_tween_out();
		if(isplayer(player))
		{
			if(n_camera_tween_out > 0)
			{
				var_519966 = function_e1ac7b9a();
				player startcameratween(n_camera_tween_out, 0, var_519966);
			}
			player val::reset("scene_system_stance", "allow_stand");
			player val::reset("scene_system_stance", "allow_crouch");
			player val::reset("scene_system_stance", "allow_prone");
			if(_o_scene._s scene::is_igc())
			{
				player util::function_7f49ffb7(-1);
			}
		}
		player sethighdetail(0);
		[[ self ]]->_reset_values(player);
		function_d3541c6f(player);
		thread function_6e4dc270(player);
		thread function_509b9f47(player);
		function_894716e2(player);
		if(isdefined(player.var_d43badce))
		{
			player.var_d43badce delete();
		}
		if(is_true(player.var_20ed0b0c) && (csceneobject::function_b260bdcc(_str_shot) || scene::function_6a0b0afe(_o_scene._str_mode) || is_true(_o_scene.scene_stopping)))
		{
			player delete();
		}
		/#
			if(player === level.host)
			{
				player util::delay(0.5, "", &destroy_dev_info);
			}
		#/
	}

	/*
		Name: display_dev_info
		Namespace: csceneplayer
		Checksum: 0xEF048D49
		Offset: 0x7FF8
		Size: 0x524
		Parameters: 0
		Flags: Linked
	*/
	function display_dev_info()
	{
		/#
			if(isstring(_o_scene._s.devstate) && getdvarint(#"scr_show_shot_info_for_igcs", 0))
			{
				if(!isdefined(level.hud_scene_dev_info1))
				{
					level.hud_scene_dev_info1 = newdebughudelem();
				}
				level.hud_scene_dev_info1.alignx = "";
				level.hud_scene_dev_info1.aligny = "";
				level.hud_scene_dev_info1.horzalign = "";
				level.hud_scene_dev_info1.y = 400;
				level.hud_scene_dev_info1.fontscale = 1.3;
				level.hud_scene_dev_info1.color = (0.4392157, 0.5019608, 0.5647059);
				level.hud_scene_dev_info1 settext("" + toupper(function_9e72a96(_o_scene._str_name)));
				if(!isdefined(level.hud_scene_dev_info2))
				{
					level.hud_scene_dev_info2 = newdebughudelem();
				}
				level.hud_scene_dev_info2.alignx = "";
				level.hud_scene_dev_info2.aligny = "";
				level.hud_scene_dev_info2.horzalign = "";
				level.hud_scene_dev_info2.y = 420;
				level.hud_scene_dev_info2.fontscale = 1.3;
				level.hud_scene_dev_info2.color = (0.4392157, 0.5019608, 0.5647059);
				level.hud_scene_dev_info2 settext("" + function_9e72a96(_str_shot));
				if(!isdefined(level.hud_scene_dev_info3))
				{
					level.hud_scene_dev_info3 = newdebughudelem();
				}
				level.hud_scene_dev_info3.alignx = "";
				level.hud_scene_dev_info3.aligny = "";
				level.hud_scene_dev_info3.horzalign = "";
				level.hud_scene_dev_info3.y = 440;
				level.hud_scene_dev_info3.fontscale = 1.3;
				level.hud_scene_dev_info3.color = (0.4392157, 0.5019608, 0.5647059);
				var_208dd9f0 = (isdefined(var_55b4f21e.devstate) ? var_55b4f21e.devstate : _o_scene._s.devstate);
				level.hud_scene_dev_info3 settext("" + function_9e72a96(var_208dd9f0));
				if(!isdefined(level.var_6e7be24a))
				{
					level.var_6e7be24a = newdebughudelem();
				}
				level.var_6e7be24a.alignx = "";
				level.var_6e7be24a.aligny = "";
				level.var_6e7be24a.horzalign = "";
				level.var_6e7be24a.y = 460;
				level.var_6e7be24a.fontscale = 1.3;
				level.var_6e7be24a.color = (0.4392157, 0.5019608, 0.5647059);
				if(!isdefined(_o_scene.var_9d90ef8b))
				{
					_o_scene.var_9d90ef8b = scene::function_12479eba(_o_scene._str_name);
				}
				level.var_6e7be24a settext(("" + _o_scene.var_9d90ef8b) + "");
			}
			else
			{
				destroy_dev_info();
			}
		#/
	}

	/*
		Name: function_6c1c67c1
		Namespace: csceneplayer
		Checksum: 0x35E0A46C
		Offset: 0x7AC8
		Size: 0x120
		Parameters: 0
		Flags: Linked
	*/
	function function_6c1c67c1()
	{
		if(csceneobject::is_shared_player())
		{
			if(isdefined(_str_camera))
			{
				return true;
			}
		}
		else if(csceneobject::function_527113ae())
		{
			if(isdefined(_str_camera))
			{
				return true;
			}
			if(isdefined(_o_scene._a_objects))
			{
				foreach(obj in _o_scene._a_objects)
				{
					if(obj._s.type === "sharedplayer" && [[ obj ]]->function_6c1c67c1())
					{
						return true;
					}
				}
			}
		}
		return false;
	}

	/*
		Name: function_6e4dc270
		Namespace: csceneplayer
		Checksum: 0x5F7CCA8
		Offset: 0x7080
		Size: 0xFA
		Parameters: 1
		Flags: Linked
	*/
	function function_6e4dc270(player)
	{
		if(!isplayer(player))
		{
			return;
		}
		player endon(#"new_shot", #"disconnect");
		_o_scene waittilltimeout(0.1, #"scene_done", #"scene_stop", #"scene_skip_completed");
		if(_n_streamer_req != -1)
		{
			player playerstreamerrequest("clear", player.var_231881b1[_o_scene._str_name]);
			player.var_16672042[_o_scene._str_name] = -1;
		}
		player.streamer_hint_playing = undefined;
	}

	/*
		Name: function_762978f8
		Namespace: csceneplayer
		Checksum: 0xB9095B13
		Offset: 0x4758
		Size: 0x5D2
		Parameters: 3
		Flags: Linked
	*/
	function function_762978f8(player, var_ec50a0d3, var_966ea21d)
	{
		if(isbot(player) && function_c503dca9(player, var_ec50a0d3))
		{
			if(player scene::function_268bfc72() && var_966ea21d)
			{
				if(player flag::get(#"hash_6ce14241f77af1e7"))
				{
					return "combat";
				}
				if(var_ec50a0d3.var_9532f6db == "move_up" || var_ec50a0d3.var_9532f6db == "move_right")
				{
					if(player scene::function_6d361d2d())
					{
						return -1;
					}
					return 1;
				}
				if(var_ec50a0d3.var_9532f6db == "move_down" || var_ec50a0d3.var_9532f6db == "move_left")
				{
					if(player scene::function_6d361d2d())
					{
						return 1;
					}
					return -1;
				}
				if(player scene::function_6d361d2d())
				{
					return 0;
				}
				return 1;
			}
			if(var_ec50a0d3.var_9532f6db == "move_up" || var_ec50a0d3.var_9532f6db == "move_right" || var_ec50a0d3.var_9532f6db == "move_down" || var_ec50a0d3.var_9532f6db == "move_left")
			{
				return 0;
			}
			return 0;
		}
		if(!level.interactive_shot interactive_shot::is_open(player))
		{
			return 0;
		}
		if(player flag::get(#"hash_6ce14241f77af1e7") && !is_true(var_ec50a0d3.var_441cbab8) && var_966ea21d)
		{
			return "combat";
		}
		switch(var_ec50a0d3.var_9532f6db)
		{
			case "move_up":
			case "move_down":
			{
				v_movement = player getnormalizedmovement();
				return v_movement[0];
			}
			case "move_right":
			case "move_left":
			{
				v_movement = player getnormalizedmovement();
				return v_movement[1];
			}
			case "jump":
			{
				return (player actionbuttonpressed() ? 1 : 0);
				break;
			}
			case "stance":
			{
				return (player stancebuttonpressed() ? 1 : 0);
				break;
			}
			case "use":
			{
				return (player usebuttonpressed() ? 1 : 0);
				break;
			}
			case "weapon_switch":
			{
				return (player weaponswitchbuttonpressed() ? 1 : 0);
				break;
			}
			case "sprint":
			{
				return (player sprintbuttonpressed() ? 1 : 0);
				break;
			}
			case "melee":
			{
				return (player meleebuttonpressed() ? 1 : 0);
				break;
			}
			case "attack":
			{
				return (var_966ea21d ? 1 : 0);
				break;
			}
			case "dpad_up":
			{
				return (player actionslotonebuttonpressed() ? 1 : 0);
				break;
			}
			case "dpad_down":
			{
				return (player actionslottwobuttonpressed() ? 1 : 0);
				break;
			}
			case "dpad_left":
			{
				return (player actionslotthreebuttonpressed() ? 1 : 0);
				break;
			}
			case "dpad_right":
			{
				return (player actionslotfourbuttonpressed() ? 1 : 0);
				break;
			}
			default:
			{
				v_movement = player getnormalizedmovement();
				return v_movement[0];
			}
		}
	}

	/*
		Name: function_7d761e79
		Namespace: csceneplayer
		Checksum: 0xA804484E
		Offset: 0x2FC8
		Size: 0x14C8
		Parameters: 1
		Flags: Linked
	*/
	function function_7d761e79(player)
	{
		if(!isplayer(player))
		{
			return;
		}
		player notify(#"hash_7ba9e3058f933eb");
		player endon(#"hash_7ba9e3058f933eb", #"death");
		b_movement = 1;
		var_1c45c7f8 = 0;
		var_966ea21d = 0;
		var_a3cc5416 = (isdefined(var_a3cc5416) ? var_a3cc5416 : 0.0001);
		self.var_a3cc5416 = undefined;
		var_ec50a0d3 = _s.shots[csceneobject::get_shot(_str_shot)];
		player flag::set(#"hash_33908195984d5565");
		player.player_anim_look_enabled = 1;
		player.player_anim_clamp_right = (isdefined(player.player_anim_clamp_right) ? player.player_anim_clamp_right : 75);
		player.player_anim_clamp_left = (isdefined(player.player_anim_clamp_left) ? player.player_anim_clamp_left : 75);
		player.player_anim_clamp_top = (isdefined(player.player_anim_clamp_top) ? player.player_anim_clamp_top : 180);
		player.player_anim_clamp_bottom = (isdefined(player.player_anim_clamp_bottom) ? player.player_anim_clamp_bottom : 60);
		player.var_c3a79d20 = 1;
		thread function_bd3a7030(player, var_ec50a0d3.var_9532f6db);
		self._str_current_anim = csceneobject::get_animation_name(_str_shot);
		while(true)
		{
			result = function_762978f8(player, var_ec50a0d3, var_966ea21d);
			if(result === "combat")
			{
				n_movement = undefined;
				b_pressed = undefined;
			}
			else
			{
				if(isfloat(result))
				{
					n_movement = result;
					b_pressed = undefined;
					if(abs(n_movement) < 0.5)
					{
						n_movement = 0;
					}
				}
				else
				{
					n_movement = undefined;
					b_pressed = result;
				}
			}
			foreach(o_obj in _o_scene._a_objects)
			{
				o_obj.var_efc540b6 = [[ o_obj ]]->function_376c9d87(var_ec50a0d3, n_movement, player);
				if(!isdefined(o_obj.var_efc540b6))
				{
					o_obj.var_efc540b6 = (isdefined(o_obj._str_current_anim) ? o_obj._str_current_anim : csceneobject::get_animation_name(_str_shot));
					if(o_obj === self)
					{
						var_f2b99dab = 1;
					}
				}
			}
			/#
				assert(isdefined(var_efc540b6), "");
			#/
			if(is_true(var_ec50a0d3.var_769fadce))
			{
				var_4a92a676 = getanimlength(_str_current_anim);
				var_7a496fd5 = (isdefined(var_ec50a0d3.var_3ee70278) ? var_ec50a0d3.var_3ee70278 : var_4a92a676 / 2);
				var_7a496fd5 = math::clamp(var_7a496fd5, 0, var_4a92a676);
				var_33d5f97d = var_4a92a676;
				var_1d3b9f6c = 0;
				foreach(o_obj in _o_scene._a_objects)
				{
					thread [[ o_obj ]]->_play_anim(o_obj._str_current_anim, 1, 0.2, undefined, 0);
				}
				thread function_31a89cb0(player, 1);
				while(var_7a496fd5 > 0)
				{
					var_7a496fd5 = var_7a496fd5 - (float(function_60d95f53()) / 1000);
					var_33d5f97d = var_33d5f97d - (float(function_60d95f53()) / 1000);
					b_result = function_762978f8(player, var_ec50a0d3, var_966ea21d);
					if(b_result)
					{
						var_1d3b9f6c = 1;
						player notify(#"hash_feb654ece8faa3d");
						while(var_7a496fd5 > 0)
						{
							waitframe(1);
							var_7a496fd5 = var_7a496fd5 - (float(function_60d95f53()) / 1000);
						}
						function_a27af0ae(player);
						var_a3cc5416 = 1;
						break;
					}
					waitframe(1);
				}
				if(!var_1d3b9f6c)
				{
					thread function_31a89cb0(player, 0);
					thread function_d0cf938(player, 1);
					while(var_33d5f97d > 0)
					{
						var_33d5f97d = var_33d5f97d - (float(function_60d95f53()) / 1000);
						b_result = function_762978f8(player, var_ec50a0d3, var_966ea21d);
						if(b_result)
						{
							var_1d3b9f6c = 1;
							player notify(#"hash_feb654ece8faa3d");
							while(var_33d5f97d > 0)
							{
								waitframe(1);
								var_33d5f97d = var_33d5f97d - (float(function_60d95f53()) / 1000);
							}
							function_ef1eb90b(player);
							var_a3cc5416 = 1;
							break;
						}
						waitframe(1);
					}
				}
				if(!var_1d3b9f6c)
				{
					thread function_9a7dd9f2(player);
					return;
				}
			}
			else
			{
				if(result === "combat" && !is_true(var_ec50a0d3.var_441cbab8))
				{
					if(isarray(player.var_8826a030) && player.var_8826a030.size)
					{
						var_c09527fe = arraygetclosest(player.origin, player.var_8826a030);
						v_to_target = var_c09527fe.origin - player.origin;
						v_to_target = vectornormalize(v_to_target);
						var_59c304d1 = vectortoangles(v_to_target);
					}
					else
					{
						var_59c304d1 = player getplayerangles();
					}
					var_1cd52bd9 = player.origin;
					player animation::stop(0);
					util::wait_network_frame();
					var_208325df = 0;
					if(isdefined(var_55b4f21e.var_f251a00e))
					{
						/#
							assert(isassetloaded("", var_55b4f21e.var_f251a00e), ("" + var_55b4f21e.var_f251a00e) + "");
						#/
						var_208325df = player gestures::function_b204f6e3(var_55b4f21e.var_f251a00e, undefined, 0, 0);
					}
					e_player_link = util::spawn_model("tag_origin", var_1cd52bd9, var_59c304d1);
					thread function_8966b27e(player, e_player_link);
					if(isanimlooping(var_efc540b6))
					{
						var_912e843b = util::spawn_player_clone(player, var_efc540b6, csceneobject::function_bc0facbb().ent, 1);
						var_912e843b setinvisibletoplayer(player);
						player setinvisibletoall();
					}
					player notify(#"hash_feb654ece8faa3d");
					while(player flag::get(#"hash_6ce14241f77af1e7"))
					{
						waitframe(1);
					}
					if(var_208325df)
					{
						player stopgestureviewmodel(var_55b4f21e.var_f251a00e, 1);
					}
					if(isdefined(e_player_link))
					{
						e_player_link delete();
					}
					if(isdefined(var_912e843b))
					{
						var_912e843b delete();
					}
					player setvisibletoall();
					foreach(o_obj in _o_scene._a_objects)
					{
						thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0.2, var_a3cc5416, 0, 1);
					}
				}
				else
				{
					if(is_true(b_pressed) && function_c503dca9(player, var_ec50a0d3))
					{
						player notify(#"hash_feb654ece8faa3d");
						foreach(o_obj in _o_scene._a_objects)
						{
							if(isdefined(o_obj) && o_obj != self && isdefined(o_obj.var_efc540b6) && !var_1c45c7f8)
							{
								thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0.2, var_a3cc5416);
							}
						}
						if(!var_1c45c7f8)
						{
							if(isanimlooping(var_efc540b6))
							{
								thread _play_anim(var_efc540b6, 1, 0.2, 0);
							}
							else
							{
								_play_anim(var_efc540b6, 1, 0.2, 0);
							}
						}
						var_a3cc5416 = 1;
					}
					else
					{
						if(is_true(var_f2b99dab) || (n_movement === 0 && b_movement) || (!isdefined(n_movement) && !is_true(b_pressed)))
						{
							b_movement = 0;
							var_f2b99dab = undefined;
							foreach(o_obj in _o_scene._a_objects)
							{
								if(isanimlooping(o_obj.var_efc540b6) && !var_1c45c7f8)
								{
									var_1c45c7f8 = 1;
									thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0.2);
									continue;
								}
								if(!isanimlooping(o_obj.var_efc540b6))
								{
									thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0, undefined, var_a3cc5416, undefined, 1);
								}
							}
							var_966ea21d = 1;
						}
						else if(isdefined(n_movement) && n_movement != 0)
						{
							b_movement = 1;
							n_anim_length = getanimlength(_str_current_anim);
							var_5df5e79a = abs(n_movement);
							n_update_time = (float(function_60d95f53()) / 1000) / n_anim_length;
							var_ea474464 = math::clamp(var_5df5e79a, 1, 1);
							if(csceneobject::function_a808aac7())
							{
								var_a3cc5416 = var_a3cc5416 - (n_update_time * var_ea474464);
								var_f667af2f = 1 - var_a3cc5416;
							}
							else
							{
								var_a3cc5416 = var_a3cc5416 + (n_update_time * var_ea474464);
								var_f667af2f = var_a3cc5416;
							}
							var_f667af2f = math::clamp(var_f667af2f, 0, 1);
							if(var_a3cc5416 <= 0 && csceneobject::function_a808aac7())
							{
								var_f2b99dab = 1;
							}
							else
							{
								if(animhasnotetrack(var_efc540b6, "interactive_shot_marker"))
								{
									var_36e740de = getnotetracktimes(var_efc540b6, "interactive_shot_marker");
									foreach(n_time in var_36e740de)
									{
										if(n_time > var_f667af2f)
										{
											var_b97b91e4 = n_time;
											break;
										}
									}
								}
								if(isdefined(var_b97b91e4))
								{
									while(var_f667af2f <= var_b97b91e4)
									{
										foreach(o_obj in _o_scene._a_objects)
										{
											thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0, undefined, var_f667af2f);
										}
										waitframe(1);
										var_a3cc5416 = var_a3cc5416 + (n_update_time * var_ea474464);
										var_f667af2f = var_a3cc5416;
									}
									var_b97b91e4 = undefined;
								}
								else
								{
									foreach(o_obj in _o_scene._a_objects)
									{
										thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0, undefined, var_f667af2f);
									}
								}
							}
						}
					}
				}
			}
			if(var_a3cc5416 >= 1 || (var_a3cc5416 <= 0 && csceneobject::function_a808aac7()))
			{
				if(csceneobject::function_a808aac7())
				{
					var_778409ab = csceneobject::get_shot(_str_shot);
					if(var_778409ab > 0 && isdefined(_s.shots[var_778409ab - 1]) && csceneobject::function_e91c94b9(var_778409ab - 1) && !is_true(_s.shots[var_778409ab - 1].var_751fe16b))
					{
						self.var_a3cc5416 = 1;
						_o_scene.var_2e9fdf35 = _s.shots[var_778409ab - 1].name;
						waitframe(1);
					}
					else
					{
						var_a3cc5416 = math::clamp(var_a3cc5416, 0, 1);
						waitframe(1);
						continue;
					}
				}
				foreach(o_obj in _o_scene._a_objects)
				{
					o_obj._b_active_anim = 0;
					o_obj flag::clear(#"scene_interactive_shot_active");
				}
				return;
			}
			var_a3cc5416 = math::clamp(var_a3cc5416, 0, 1);
			waitframe(1);
		}
	}

	/*
		Name: function_7d78187b
		Namespace: csceneplayer
		Checksum: 0x148422FD
		Offset: 0x72B0
		Size: 0x5C
		Parameters: 0
		Flags: Linked
	*/
	function function_7d78187b()
	{
		show_player = (isdefined(var_55b4f21e.var_9503db49) ? var_55b4f21e.var_9503db49 : _s.var_9503db49);
		return true;
	}

	/*
		Name: function_7efadfe8
		Namespace: csceneplayer
		Checksum: 0x581E4CB5
		Offset: 0x2B90
		Size: 0x2CE
		Parameters: 1
		Flags: Linked
	*/
	function function_7efadfe8(player)
	{
		if(!isplayer(player))
		{
			return;
		}
		player.player_anim_look_enabled = !is_true(_s.lockview);
		player.var_6f570bef = (isdefined(_s.var_a8972ec6) ? _s.var_a8972ec6 : 0);
		player.var_fcbf7c5a = (isdefined(_s.var_e8846003) ? _s.var_e8846003 : 0);
		player.player_anim_clamp_right = (isdefined((isdefined(var_55b4f21e.viewclampright) ? var_55b4f21e.viewclampright : _s.viewclampright)) ? (isdefined(var_55b4f21e.viewclampright) ? var_55b4f21e.viewclampright : _s.viewclampright) : 0);
		player.player_anim_clamp_left = (isdefined((isdefined(var_55b4f21e.viewclampleft) ? var_55b4f21e.viewclampleft : _s.viewclampleft)) ? (isdefined(var_55b4f21e.viewclampleft) ? var_55b4f21e.viewclampleft : _s.viewclampleft) : 0);
		player.player_anim_clamp_top = (isdefined((isdefined(var_55b4f21e.viewclamptop) ? var_55b4f21e.viewclamptop : _s.viewclamptop)) ? (isdefined(var_55b4f21e.viewclamptop) ? var_55b4f21e.viewclamptop : _s.viewclamptop) : 0);
		player.player_anim_clamp_bottom = (isdefined((isdefined(var_55b4f21e.viewclampbottom) ? var_55b4f21e.viewclampbottom : _s.viewclampbottom)) ? (isdefined(var_55b4f21e.viewclampbottom) ? var_55b4f21e.viewclampbottom : _s.viewclampbottom) : 0);
	}

	/*
		Name: set_player_stance
		Namespace: csceneplayer
		Checksum: 0x80155F38
		Offset: 0x65C8
		Size: 0x1D4
		Parameters: 1
		Flags: Linked
	*/
	function set_player_stance(player)
	{
		if(!isplayer(player))
		{
			return;
		}
		if(_s.playerstance === "crouch")
		{
			player val::set("scene_system_stance", "allow_stand", 0);
			player val::set("scene_system_stance", "allow_crouch", 1);
			player val::set("scene_system_stance", "allow_prone", 0);
		}
		else
		{
			if(_s.playerstance === "prone")
			{
				player val::set("scene_system_stance", "allow_stand", 0);
				player val::set("scene_system_stance", "allow_crouch", 0);
				player val::set("scene_system_stance", "allow_prone", 1);
			}
			else
			{
				player val::set("scene_system_stance", "allow_stand", 1);
				player val::set("scene_system_stance", "allow_crouch", 0);
				player val::set("scene_system_stance", "allow_prone", 0);
			}
		}
	}

	/*
		Name: _stop
		Namespace: csceneplayer
		Checksum: 0xDCFBC90
		Offset: 0x490
		Size: 0x164
		Parameters: 2
		Flags: Linked
	*/
	function _stop(b_dont_clear_anim, b_finished)
	{
		if(isalive(_e))
		{
			_e notify(#"scene_stop");
			_e notify(#"hash_7ba9e3058f933eb");
			function_52b00538(_e);
			_e flag::clear(#"hash_7cddd51e45d3ff3e");
			if(!is_true(_s.diewhenfinished) || !b_finished)
			{
				_e animation::stop(0.2);
			}
			_e thread scene::scene_enable_player_stuff(_o_scene._s, _s, _o_scene._e_root);
		}
		if(is_true(_e.var_20ed0b0c))
		{
			_e delete();
		}
	}

	/*
		Name: function_894716e2
		Namespace: csceneplayer
		Checksum: 0x463D53D2
		Offset: 0x6DC8
		Size: 0x152
		Parameters: 1
		Flags: Linked
	*/
	function function_894716e2(player)
	{
		if(!isplayer(player) || isbot(player))
		{
			return;
		}
		if(isdefined(var_55b4f21e.var_6eb7f9a0))
		{
			switch(var_55b4f21e.var_6eb7f9a0)
			{
				case "bank1":
				{
					player clientfield::set_to_player("player_pbg_bank_scene_system", 0);
					break;
				}
				case "bank2":
				{
					player clientfield::set_to_player("player_pbg_bank_scene_system", 1);
					break;
				}
				case "hash_5d9e7981e1527c4c":
				{
					player clientfield::set_to_player("player_pbg_bank_scene_system", 2);
					break;
				}
				case "hash_5d9e7881e1527a99":
				{
					player clientfield::set_to_player("player_pbg_bank_scene_system", 3);
					break;
				}
			}
		}
	}

	/*
		Name: function_8966b27e
		Namespace: csceneplayer
		Checksum: 0x31F3FFA1
		Offset: 0x1DF0
		Size: 0x13C
		Parameters: 4
		Flags: Linked
	*/
	function function_8966b27e(player, linkto, tag, var_79f81c6c)
	{
		if(!isdefined(var_79f81c6c))
		{
			var_79f81c6c = 0;
		}
		player endon(#"death");
		linkto endon(#"death");
		lerp_time = csceneobject::get_lerp_time();
		if(lerp_time > 0)
		{
			player playerlinktoblend(linkto, tag, lerp_time, lerp_time * 0.5, 0, lerp_time, lerp_time * 0.5, 0, player.var_6f570bef);
			wait(lerp_time);
		}
		if(var_79f81c6c)
		{
			linkto show();
		}
		player playerlinktodelta(linkto, tag, 1, player.player_anim_clamp_right, player.player_anim_clamp_left, player.player_anim_clamp_top, player.player_anim_clamp_bottom, 1, 1, player.var_6f570bef);
	}

	/*
		Name: _prepare
		Namespace: csceneplayer
		Checksum: 0xF606D10D
		Offset: 0xEB0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function _prepare()
	{
		_prepare_player(_e);
	}

	/*
		Name: function_9339d69d
		Namespace: csceneplayer
		Checksum: 0xA6D794FF
		Offset: 0x2370
		Size: 0x2A4
		Parameters: 1
		Flags: Linked
	*/
	function function_9339d69d(player)
	{
		if(is_true(_s.firstweaponraise) && !csceneobject::function_27898329(_str_current_anim) && (csceneobject::function_b260bdcc(_str_shot) || scene::function_6a0b0afe(_o_scene._str_mode)))
		{
			self notify("37d7a7d909283c6b");
			self endon("37d7a7d909283c6b");
			player endon(#"disconnect");
			if(isdefined(_str_current_anim))
			{
				n_anim_length = getanimlength(_str_current_anim);
			}
			else
			{
				if(isdefined(_str_camera))
				{
					n_anim_length = float(getcamanimtime(_str_camera)) / 1000;
				}
				else
				{
					n_anim_length = 0;
				}
			}
			n_wait = max(n_anim_length - 0.5, 0);
			_o_scene waittilltimeout(n_wait, #"scene_done", #"scene_stop", #"scene_skip_completed", #"hash_3168dab591a18b9b");
			var_9f11cc78 = player getcurrentweapon();
			if(var_9f11cc78 === player.var_777951c || var_9f11cc78 === player.var_96494502)
			{
				player shoulddoinitialweaponraise(var_9f11cc78, 1);
				var_9f11cc78 = player loadout::function_18a77b37("primary");
				if(!isdefined(var_9f11cc78) || var_9f11cc78 == level.weaponnone)
				{
					var_9f11cc78 = player loadout::function_18a77b37("secondary");
				}
			}
			if(isdefined(var_9f11cc78))
			{
				player shoulddoinitialweaponraise(var_9f11cc78, 1);
			}
		}
	}

	/*
		Name: first_init
		Namespace: csceneplayer
		Checksum: 0x50A6AB98
		Offset: 0x428
		Size: 0x5A
		Parameters: 2
		Flags: Linked
	*/
	function first_init(s_objdef, o_scene)
	{
		if(isdefined(o_scene._str_team))
		{
			s_objdef.team = o_scene._str_team;
		}
		s_objdef.nospawn = 1;
		return csceneobject::first_init(s_objdef, o_scene);
	}

	/*
		Name: revive_player
		Namespace: csceneplayer
		Checksum: 0x8F928317
		Offset: 0x6530
		Size: 0x90
		Parameters: 1
		Flags: Linked
	*/
	function revive_player(player)
	{
		if(level.gameended || !isplayer(player))
		{
			return;
		}
		if(player.sessionstate === "spectator")
		{
			player thread [[level.spawnplayer]]();
		}
		else if(player laststand::player_is_in_laststand())
		{
			player notify(#"auto_revive");
		}
	}

	/*
		Name: function_9a7dd9f2
		Namespace: csceneplayer
		Checksum: 0x94E7F25F
		Offset: 0x59A8
		Size: 0x258
		Parameters: 1
		Flags: Linked
	*/
	function function_9a7dd9f2(player)
	{
		player notify(#"hash_feb654ece8faa3d");
		thread function_31a89cb0(player, 0);
		thread function_d0cf938(player, 0);
		foreach(o_obj in _o_scene._a_objects)
		{
			if(isdefined(o_obj))
			{
				var_17c01da9 = o_obj._s.shots[csceneobject::get_shot(_str_shot)];
				if(o_obj != self && isdefined(var_17c01da9.lvlstart_stomach_))
				{
					thread [[ o_obj ]]->_play_anim(var_17c01da9.lvlstart_stomach_, 1, 0.2, undefined, 0, 0);
				}
			}
		}
		var_609ac4c9 = _s.shots[csceneobject::get_shot(_str_shot)];
		if(isdefined(var_609ac4c9.lvlstart_stomach_))
		{
			_play_anim(var_609ac4c9.lvlstart_stomach_, 1, 0.2, undefined, 0, 0);
		}
		_reset_values();
		if(isplayer(player))
		{
			player scene::set_igc_active(0);
			player notify(#"hash_684b272680aa2ed", {#str_scene:_o_scene._str_name});
		}
		player kill();
		[[ _o_scene ]]->stop();
	}

	/*
		Name: play_camera_on_player
		Namespace: csceneplayer
		Checksum: 0xAE1A9607
		Offset: 0x76C8
		Size: 0x168
		Parameters: 2
		Flags: Linked
	*/
	function play_camera_on_player(player, n_start_time)
	{
		if(!isplayer(player) || (!scene::check_team(player.team, _str_team) && !is_true(_o_scene._b_testing)))
		{
			return;
		}
		csceneobject::update_alignment();
		v_origin = (isdefined(m_align.origin) ? m_align.origin : (0, 0, 0));
		v_angles = (isdefined(m_align.angles) ? m_align.angles : (0, 0, 0));
		self thread _camanimscripted(player, (isdefined(player.var_36fa161e) ? player.var_36fa161e : _str_camera), v_origin, v_angles, n_start_time);
		player.var_36fa161e = undefined;
		[[ self ]]->on_play_anim(player);
	}

	/*
		Name: _prepare_player
		Namespace: csceneplayer
		Checksum: 0xE8A9C7C7
		Offset: 0xED8
		Size: 0xE70
		Parameters: 1
		Flags: Linked
	*/
	function _prepare_player(player)
	{
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				printtoprightln("");
			}
		#/
		player endon(#"death");
		player notify(#"new_shot");
		var_2bb59a6a = csceneobject::function_24f8cfb5(_str_shot) || is_true(_o_scene.b_play_from_time);
		function_dd8a2de2(player);
		if(player.current_scene === _o_scene._str_name)
		{
			return false;
		}
		/#
			if(player === level.host && scene::check_team(player.team, _str_team))
			{
				display_dev_info();
			}
		#/
		if(isplayer(player) && !is_true(_s.showhud) && !is_true(_s.allowdeath) && !player scene::is_igc_active())
		{
			player scene::set_igc_active(1);
			player notify(#"hash_57d4f53c12705eac", {#str_scene:_o_scene._str_name});
		}
		[[ self ]]->_set_values(player);
		player sethighdetail(1);
		if(player.team === #"allies" || player.team === #"axis")
		{
			str_streamer_hint = _o_scene._a_streamer_hint[player.team];
		}
		else
		{
			str_streamer_hint = _o_scene._a_streamer_hint[util::get_team_mapping(#"sidea")];
		}
		if(isdefined(str_streamer_hint) && isplayer(player))
		{
			if(!isdefined(player.var_231881b1))
			{
				player.var_231881b1 = [];
			}
			if(!isdefined(player.var_16672042))
			{
				player.var_16672042 = [];
			}
			if(isdefined(player.var_16672042[_o_scene._str_name]) && player.var_16672042[_o_scene._str_name] != -1)
			{
				self._n_streamer_req = player.var_16672042[_o_scene._str_name];
			}
			else if(_n_streamer_req == -1)
			{
				self._n_streamer_req = player playerstreamerrequest("set", str_streamer_hint);
				player.var_231881b1[_o_scene._str_name] = str_streamer_hint;
				player.var_16672042[_o_scene._str_name] = _n_streamer_req;
			}
			if(var_2bb59a6a && _n_streamer_req != -1)
			{
				if(!is_true(level.scene_streamer_ignore[_o_scene._s.name]))
				{
					if(!is_true(_o_scene._s.ignorestreamer) && !is_true(_o_scene._b_testing) && !scene::function_46546b5c(_o_scene._s.name))
					{
						self endon(#"new_shot");
						level util::streamer_wait(undefined, 0, getdvarint(#"hash_47b7504d8ac8d477", 30), player.team, _o_scene._str_name);
					}
				}
			}
		}
		if(player flag::get(#"mobile_armory_in_use") && isplayer(player))
		{
			player flag::set(#"cancel_mobile_armory");
			player closemenu("mobile_armory_loadout");
			params = {#intpayload:0, #response:"cancel", #menu:"mobile_armory_loadout"};
			player notify(#"menuresponse", params);
			player callback::callback(#"hash_4e1a50a35ec44bcc", params);
		}
		if(player flag::get(#"mobile_armory_begin_use") && isplayer(player))
		{
			player val::reset(#"hash_7d805ac79a31898e", "disable_weapons");
			player flag::clear(#"mobile_armory_begin_use");
		}
		if(getdvarint(#"scene_hide_player", 0))
		{
			player val::set(#"scene", "hide");
		}
		player._scene_object = self;
		player.current_scene = _o_scene._str_name;
		player.var_e3d6d713 = player.current_scene;
		player.anim_debug_name = _s.name;
		/#
			if(csceneobject::function_209522a0() && isplayer(player))
			{
				if(isdefined(_s.model))
				{
					var_be7bc546 = currentsessionmode();
					var_123ebd30 = getallcharacterbodies(var_be7bc546);
					var_ca47355c = 0;
					foreach(var_2074c3ff in var_123ebd30)
					{
						var_b744a7ed = function_d299ef16(var_2074c3ff, var_be7bc546);
						for(var_6e0e2531 = 0; var_6e0e2531 < var_b744a7ed; var_6e0e2531++)
						{
							var_322595c6 = function_d7c3cf6c(var_2074c3ff, var_6e0e2531, var_be7bc546);
							if(var_322595c6.var_3cf2d21 === _s.model)
							{
								player setcharacterbodytype(var_2074c3ff);
								player function_8fd843dd(var_6e0e2531);
								if(isdefined(_s.var_a5617859) && isarray(var_322595c6.presets))
								{
									var_a919ac81 = strtok(_s.var_a5617859, "");
									foreach(var_a343b02b, var_47fc7c6f in var_322595c6.presets)
									{
										if(!is_true(var_47fc7c6f.isvalid))
										{
											continue;
										}
										if(isdefined(var_a919ac81[1]) && int(var_a919ac81[1]) === var_a343b02b)
										{
											player function_fbc5a093(var_a343b02b);
											break;
										}
									}
								}
								var_ca47355c = 1;
								break;
							}
						}
						if(var_ca47355c)
						{
							break;
						}
					}
				}
			}
		#/
		if(isplayer(player) && [[ _o_scene ]]->is_scene_shared() && (var_2bb59a6a || scene::function_46546b5c(_o_scene._str_name)) && !csceneobject::is_skipping_scene())
		{
			player thread scene::function_a4ad0308(_o_scene);
			if(var_2bb59a6a && getdvarint(#"hash_44f3b54c25dfae3b", 0))
			{
				player clientfield::set_to_player("postfx_cateye", 1);
			}
		}
		revive_player(player);
		player thread util::function_419f0c21();
		if(isdefined(player.hijacked_vehicle_entity))
		{
			player.hijacked_vehicle_entity delete();
		}
		else if(isalive(player) && !is_true(_s.var_5829ce6b) && isplayer(player) && player isinvehicle())
		{
			vh_occupied = player getvehicleoccupied();
			n_seat = vh_occupied getoccupantseat(player);
			vh_occupied usevehicle(player, n_seat);
		}
		if(_o_scene._s scene::is_igc() && isplayer(player))
		{
			player thread scene::scene_disable_player_stuff(_o_scene._s, _s);
			player util::function_7f49ffb7(6);
		}
		function_7efadfe8(player);
		function_d46ffe56(player);
		set_player_stance(player);
		player flag::set(#"scene");
		if(is_true(var_55b4f21e.var_3a0a7985) && isplayer(player))
		{
			function_a2a183e7(player, var_55b4f21e.var_6d62f1ae);
		}
		if(is_true(_s.var_186d089d))
		{
			player setinvisibletoall();
			player setvisibletoplayer(player);
		}
		waittillframeend();
		if(is_true(var_55b4f21e.var_1bc28a87) && isplayer(player))
		{
			thread function_7d761e79(player);
		}
		player notify(#"scene_ready");
	}

	/*
		Name: function_a27af0ae
		Namespace: csceneplayer
		Checksum: 0xFBBFE017
		Offset: 0x5630
		Size: 0x1BC
		Parameters: 1
		Flags: Linked
	*/
	function function_a27af0ae(player)
	{
		player notify(#"hash_feb654ece8faa3d");
		thread function_31a89cb0(player, 0);
		thread function_d0cf938(player, 0);
		foreach(o_obj in _o_scene._a_objects)
		{
			if(isdefined(o_obj))
			{
				var_17c01da9 = o_obj._s.shots[csceneobject::get_shot(_str_shot)];
				if(o_obj != self && isdefined(var_17c01da9.var_5bb36583))
				{
					thread [[ o_obj ]]->_play_anim(var_17c01da9.var_5bb36583, 1, 0.2, undefined, 0, 0);
				}
			}
		}
		var_609ac4c9 = _s.shots[csceneobject::get_shot(_str_shot)];
		if(isdefined(var_609ac4c9.var_5bb36583))
		{
			_play_anim(var_609ac4c9.var_5bb36583, 1, 0.2, undefined, 0, 0);
		}
	}

	/*
		Name: function_a2a183e7
		Namespace: csceneplayer
		Checksum: 0x14D67F67
		Offset: 0x1F38
		Size: 0xEC
		Parameters: 2
		Flags: Linked
	*/
	function function_a2a183e7(player, var_79f81c6c)
	{
		if(!isdefined(var_79f81c6c))
		{
			var_79f81c6c = 0;
		}
		player.var_d43badce = util::spawn_player_clone(player);
		player.var_d43badce.anim_debug_name = player.name + " clone";
		player.var_d43badce hide();
		tag = "tag_player";
		if(!is_true(player.var_d43badce haspart(tag)))
		{
			tag = "tag_origin";
		}
		thread function_8966b27e(player, player.var_d43badce, tag, var_79f81c6c);
	}

	/*
		Name: function_bd3a7030
		Namespace: csceneplayer
		Checksum: 0xCD63CE88
		Offset: 0x4D38
		Size: 0x150
		Parameters: 2
		Flags: Linked
	*/
	function function_bd3a7030(player, var_a0332034)
	{
		if(!level.interactive_shot interactive_shot::is_open(player))
		{
			level.interactive_shot interactive_shot::open(player);
		}
		thread function_d4446494(player);
		player notify(#"hash_940a817baf9765e", {#str_input:var_a0332034});
		var_be17187b = undefined;
		var_be17187b = player waittill(#"hash_7ba9e3058f933eb", #"hash_feb654ece8faa3d", #"death");
		if(isdefined(player) && level.interactive_shot interactive_shot::is_open(player))
		{
			level.interactive_shot interactive_shot::close(player);
		}
		if(var_be17187b._notify == "death")
		{
			[[ _o_scene ]]->stop();
		}
	}

	/*
		Name: function_c26a4e8b
		Namespace: csceneplayer
		Checksum: 0xE46B9F5
		Offset: 0x2B08
		Size: 0x7C
		Parameters: 2
		Flags: Linked
	*/
	function function_c26a4e8b(player, b_enable)
	{
		if(b_enable)
		{
			if(is_true(player.var_313437ff))
			{
				player.var_313437ff = undefined;
				player weapons::force_stowed_weapon_update();
			}
		}
		else
		{
			player.var_313437ff = 1;
			player clearstowedweapon();
		}
	}

	/*
		Name: _camanimscripted
		Namespace: csceneplayer
		Checksum: 0xF63822A8
		Offset: 0x7838
		Size: 0x1B4
		Parameters: 5
		Flags: Linked
	*/
	function _camanimscripted(player, var_ef4c0f91, v_origin, v_angles, n_start_time)
	{
		if(!isdefined(n_start_time))
		{
			n_start_time = 0;
		}
		player notify(#"camanimscripted");
		player endon(#"camanimscripted", #"disconnect");
		if(_o_scene._s scene::is_igc())
		{
			player thread scene::scene_disable_player_stuff(_o_scene._s, _s);
		}
		var_57949b2d = getcamanimtime(var_ef4c0f91) * n_start_time;
		var_41193b94 = int(gettime() - var_57949b2d);
		n_lerp_time = csceneobject::get_lerp_time();
		n_lerp_time = int(n_lerp_time * 1000);
		player dontinterpolate();
		camanimscripted(player, var_ef4c0f91, var_41193b94, v_origin, v_angles, n_lerp_time);
		wait_for_camera(var_ef4c0f91, n_start_time);
		player dontinterpolate();
	}

	/*
		Name: function_c503dca9
		Namespace: csceneplayer
		Checksum: 0x2C79A995
		Offset: 0x4498
		Size: 0x2B6
		Parameters: 2
		Flags: Linked
	*/
	function function_c503dca9(player, var_ec50a0d3)
	{
		a_players = array::exclude(getplayers(), player);
		foreach(player_other in a_players)
		{
			n_height_diff = abs(player_other.origin[2] - player.origin[2]);
			if(distancesquared(player.origin, player_other.origin) < 16384)
			{
				if(var_ec50a0d3.var_9532f6db == "move_up" && player.origin[2] < player_other.origin[2])
				{
					return false;
				}
				if(var_ec50a0d3.var_9532f6db == "move_down" && player.origin[2] > player_other.origin[2])
				{
					return false;
				}
				var_b52c361d = 0;
				var_55d77e67 = 0;
				var_9d0b2a04 = vectordot(anglestoright(player.angles), vectornormalize(player.origin - player_other.origin));
				if(var_9d0b2a04 > 0)
				{
					var_b52c361d = 1;
				}
				else
				{
					var_55d77e67 = 1;
				}
				if(var_ec50a0d3.var_9532f6db == "move_left" && var_b52c361d && n_height_diff < 32)
				{
					return false;
				}
				if(var_ec50a0d3.var_9532f6db == "move_right" && var_55d77e67 && n_height_diff < 32)
				{
					return false;
				}
			}
		}
		return true;
	}

	/*
		Name: function_c7246a4a
		Namespace: csceneplayer
		Checksum: 0x739441FE
		Offset: 0x2778
		Size: 0xBC
		Parameters: 2
		Flags: Linked
	*/
	function function_c7246a4a(player, var_d4c489c0)
	{
		var_29f79831 = player loadout::function_18a77b37(var_d4c489c0);
		var_e4b15461 = player getcurrentweapon();
		if(var_29f79831 != var_e4b15461)
		{
			if(!player hasweapon(var_29f79831, 1))
			{
				player giveweapon(var_29f79831);
				player.var_777951c = var_29f79831;
			}
			player switchtoweaponimmediate(var_29f79831, 1);
		}
	}

	/*
		Name: function_d3541c6f
		Namespace: csceneplayer
		Checksum: 0xED3888FD
		Offset: 0x2840
		Size: 0x2BC
		Parameters: 1
		Flags: Linked
	*/
	function function_d3541c6f(player)
	{
		if(!isplayer(player))
		{
			return;
		}
		player callback::function_52ac9652(#"weapon_change", &function_39ab0a6a, self);
		if(isdefined(player.var_777951c))
		{
			if(!is_true(_s.var_1a95895f) || (is_true(_s.var_1a95895f) && (scene::function_6a0b0afe(_o_scene._str_mode) || scene::function_b260bdcc(_o_scene._str_name, _str_shot) || is_true(_o_scene.scene_stopping))))
			{
				player takeweapon(player.var_777951c);
				player player::switch_to_primary_weapon(1, 1);
				player.var_777951c = undefined;
			}
		}
		/#
			if(isdefined(player.var_96494502) && (scene::function_6a0b0afe(_o_scene._str_mode) || scene::function_b260bdcc(_o_scene._str_name, _str_shot)))
			{
				player takeweapon(player.var_96494502);
				player.var_96494502 = undefined;
			}
		#/
		if(function_607d830())
		{
			function_c26a4e8b(player, 1);
		}
		w_current = player getcurrentweapon();
		if(!is_true(_s.dontreloadammo) && (!isdefined(w_current.var_a2e7031d) || !w_current.var_a2e7031d))
		{
			player player::fill_current_clip();
		}
	}

	/*
		Name: function_d4446494
		Namespace: csceneplayer
		Checksum: 0x57D93B3B
		Offset: 0x4E90
		Size: 0x5E6
		Parameters: 1
		Flags: Linked
	*/
	function function_d4446494(player)
	{
		player endon(#"hash_7ba9e3058f933eb", #"hash_feb654ece8faa3d", #"death");
		while(true)
		{
			var_be17187b = undefined;
			var_be17187b = player waittill(#"hash_940a817baf9765e");
			if(!isdefined(var_be17187b.str_input))
			{
				var_be17187b.str_input = "";
			}
			switch(var_be17187b.str_input)
			{
				case "move_up":
				case "move_down":
				{
					if(var_be17187b.str_input == "move_up")
					{
						if(player gamepadusedlast())
						{
							level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_66ac13c66930481e");
						}
						else
						{
							level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_2e61b9986055044e");
						}
					}
					else
					{
						if(player gamepadusedlast())
						{
							level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_f7f3ef0446b4447");
						}
						else
						{
							level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_63aa233af2b054f1");
						}
					}
					break;
				}
				case "move_right":
				case "move_left":
				{
					if(var_be17187b.str_input == "move_right")
					{
						if(player gamepadusedlast())
						{
							level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_b89e8fe23b5a6ff");
						}
						else
						{
							level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_5cafbb3ef224b89");
						}
					}
					else
					{
						if(player gamepadusedlast())
						{
							level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_43fe6cadb07b27b2");
						}
						else
						{
							level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_121d78dfceea3bf2");
						}
					}
					break;
				}
				case "jump":
				{
					level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_5b57ca9476df902b");
					break;
				}
				case "stance":
				{
					level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_30214ec564c2c09b");
					break;
				}
				case "use":
				{
					level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_1c489083f5cdb3f6");
					break;
				}
				case "weapon_switch":
				{
					level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_5d8ce20bafb14fec");
					break;
				}
				case "sprint":
				{
					if(player gamepadusedlast())
					{
						level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_6b873520c198df93");
					}
					else
					{
						level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_7f72586820c8b86d");
					}
					break;
				}
				case "melee":
				{
					level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_6c4731677fa269b1");
					break;
				}
				case "attack":
				{
					break;
				}
				case "dpad_up":
				{
					level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_327b92f099f4b62e");
					break;
				}
				case "dpad_down":
				{
					level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_51f4288480f483f7");
					break;
				}
				case "dpad_left":
				{
					level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_2f8bb64325eeac62");
					break;
				}
				case "dpad_right":
				{
					level.interactive_shot interactive_shot::function_d5ea17f0(player, #"hash_2c841879f1d933ef");
					break;
				}
				default:
				{
					level.interactive_shot interactive_shot::function_d5ea17f0(player, #"");
					break;
				}
			}
		}
	}

	/*
		Name: function_d46ffe56
		Namespace: csceneplayer
		Checksum: 0x90CBD57D
		Offset: 0x2030
		Size: 0x334
		Parameters: 1
		Flags: Linked
	*/
	function function_d46ffe56(player)
	{
		if(!isplayer(player))
		{
			return;
		}
		var_cd31cd6a = getdvarstring(#"hash_575aeb603638c901", "");
		if(!is_true(_s.removeweapon) || is_true(_s.showweaponinfirstperson) && !is_true(_s.disableprimaryweaponswitch) && var_cd31cd6a == "" && !function_1db23c62())
		{
			player player::switch_to_primary_weapon(1, 1);
		}
		if(function_1db23c62() && var_cd31cd6a == "")
		{
			w_current = player getcurrentweapon();
			var_951894cb = w_current.rootweapon;
			if(isarray(level.var_b6405fbf) && isinarray(level.var_b6405fbf, var_951894cb.name))
			{
				var_9cb7f1a6 = getweapon(#"ar_accurate_t9");
				if(!player hasweapon(var_9cb7f1a6, 1))
				{
					player giveweapon(var_9cb7f1a6);
					player.var_777951c = var_9cb7f1a6;
				}
				player switchtoweaponimmediate(var_9cb7f1a6, 1);
			}
		}
		/#
			if(var_cd31cd6a != "")
			{
				var_8e6a7733 = getweapon(var_cd31cd6a);
				if(!player hasweapon(var_8e6a7733, 1))
				{
					player giveweapon(var_8e6a7733);
					player.var_96494502 = var_8e6a7733;
				}
				player switchtoweaponimmediate(var_8e6a7733, 1);
			}
		#/
		if(function_607d830())
		{
			function_c26a4e8b(player, 0);
		}
		player callback::function_d8abfc3d(#"weapon_change", &function_39ab0a6a, self);
	}

	/*
		Name: function_dd8a2de2
		Namespace: csceneplayer
		Checksum: 0xE1C78575
		Offset: 0x2E68
		Size: 0x152
		Parameters: 1
		Flags: Linked
	*/
	function function_dd8a2de2(player)
	{
		if(!isplayer(player) || isbot(player))
		{
			return;
		}
		if(isdefined(var_55b4f21e.var_143deeac))
		{
			switch(var_55b4f21e.var_143deeac)
			{
				case "bank1":
				{
					player clientfield::set_to_player("player_pbg_bank_scene_system", 0);
					break;
				}
				case "bank2":
				{
					player clientfield::set_to_player("player_pbg_bank_scene_system", 1);
					break;
				}
				case "hash_5d9e7981e1527c4c":
				{
					player clientfield::set_to_player("player_pbg_bank_scene_system", 2);
					break;
				}
				case "hash_5d9e7881e1527a99":
				{
					player clientfield::set_to_player("player_pbg_bank_scene_system", 3);
					break;
				}
			}
		}
	}

	/*
		Name: function_e1ac7b9a
		Namespace: csceneplayer
		Checksum: 0x754C8445
		Offset: 0x7378
		Size: 0x5C
		Parameters: 0
		Flags: Linked
	*/
	function function_e1ac7b9a()
	{
		show_player = (isdefined(var_55b4f21e.var_6454a5aa) ? var_55b4f21e.var_6454a5aa : _s.var_6454a5aa);
		return true;
	}

	/*
		Name: get_camera_tween_out
		Namespace: csceneplayer
		Checksum: 0x6417CCE
		Offset: 0x7318
		Size: 0x58
		Parameters: 0
		Flags: Linked
	*/
	function get_camera_tween_out()
	{
		n_camera_tween_out = (isdefined(var_55b4f21e.cameratweenout) ? var_55b4f21e.cameratweenout : _s.cameratweenout);
		return true;
	}

	/*
		Name: get_camera_tween
		Namespace: csceneplayer
		Checksum: 0x4E5EA0EE
		Offset: 0x7250
		Size: 0x58
		Parameters: 0
		Flags: Linked
	*/
	function get_camera_tween()
	{
		n_camera_tween = (isdefined(var_55b4f21e.cameratween) ? var_55b4f21e.cameratween : _s.cameratween);
		return true;
	}

	/*
		Name: _spawn
		Namespace: csceneplayer
		Checksum: 0x67D5B876
		Offset: 0x600
		Size: 0x422
		Parameters: 0
		Flags: Linked
	*/
	function _spawn()
	{
		/#
			if(is_true(_o_scene._b_testing) && csceneobject::is_player())
			{
				p_host = util::gethostplayer();
				if(!csceneobject::in_this_scene(p_host))
				{
					self._e = p_host;
					return;
				}
			}
		#/
		csceneobject::restore_saved_ent();
		if(!isdefined(_e))
		{
			a_players = [[_func_get]](_str_team);
			/#
				var_a41f3ee5 = getdvarint(#"hash_7ff9a3a022339237", 0);
				if(var_a41f3ee5)
				{
					player = array::pop_front(a_players, 0);
					array::push(a_players, player, var_a41f3ee5);
				}
			#/
			foreach(ent in a_players)
			{
				if(!csceneobject::in_this_scene(ent))
				{
					self._e = ent;
					return;
				}
			}
			if(!isdefined(_e) && is_true(_s.var_9b604b8d))
			{
				a_players = [[_func_get]](_str_team);
				player = array::random(a_players);
				if(isdefined(player))
				{
					self._e = util::spawn_player_clone(player, undefined, undefined, 1);
					_e.var_20ed0b0c = 1;
					current_weapon = player getcurrentweapon();
					var_2506506a = current_weapon.rootweapon;
					if(function_1db23c62() && (isarray(level.var_b6405fbf) && isinarray(level.var_b6405fbf, var_2506506a.name) || current_weapon == level.weaponnone))
					{
						current_weapon = getweapon(#"ar_accurate_t9");
						_e animation::attach_weapon(current_weapon);
						_e.weapon = current_weapon;
					}
					else if(current_weapon == level.weaponnone && isdefined(player.class_num))
					{
						current_weapon = player getloadoutweapon(player.class_num, "primary");
						_e animation::attach_weapon(current_weapon);
						_e.weapon = current_weapon;
					}
					_e.var_777951c = current_weapon;
					_e.str_gender = player getplayergendertype();
				}
			}
		}
	}

	/*
		Name: function_ef1eb90b
		Namespace: csceneplayer
		Checksum: 0x3DC2FA79
		Offset: 0x57F8
		Size: 0x1A4
		Parameters: 1
		Flags: Linked
	*/
	function function_ef1eb90b(player)
	{
		thread function_31a89cb0(player, 0);
		thread function_d0cf938(player, 0);
		foreach(o_obj in _o_scene._a_objects)
		{
			if(isdefined(o_obj))
			{
				var_17c01da9 = o_obj._s.shots[csceneobject::get_shot(_str_shot)];
				if(o_obj != self && isdefined(var_17c01da9.var_c474be53))
				{
					thread [[ o_obj ]]->_play_anim(var_17c01da9.var_c474be53, 1, 0.2, undefined, 0, 0);
				}
			}
		}
		var_609ac4c9 = _s.shots[csceneobject::get_shot(_str_shot)];
		if(isdefined(var_609ac4c9.var_c474be53))
		{
			_play_anim(var_609ac4c9.var_c474be53, 1, 0.2, undefined, 0, 0);
		}
	}

	/*
		Name: _reset_values
		Namespace: csceneplayer
		Checksum: 0x7B427005
		Offset: 0xD90
		Size: 0x114
		Parameters: 1
		Flags: Linked
	*/
	function _reset_values(ent)
	{
		if(!isdefined(ent))
		{
			ent = _e;
		}
		csceneobject::reset_ent_val("takedamage", ent);
		csceneobject::reset_ent_val("ignoreme", ent);
		csceneobject::reset_ent_val("allowdeath", ent);
		csceneobject::reset_ent_val("take_weapons", ent);
		if(isbot(ent) && (csceneobject::function_b260bdcc(_str_shot) || scene::function_6a0b0afe(_o_scene._str_mode) || is_true(_o_scene.scene_stopping)))
		{
			ent botreleasemanualcontrol();
		}
	}

	/*
		Name: on_play_anim
		Namespace: csceneplayer
		Checksum: 0xBC83344D
		Offset: 0x5C08
		Size: 0x204
		Parameters: 1
		Flags: Linked
	*/
	function on_play_anim(player)
	{
		if(!isplayer(player))
		{
			return;
		}
		if(_n_streamer_req != -1 && !csceneobject::is_skipping_scene() && !is_true(player.streamer_hint_playing))
		{
			if(!sessionmodeiscampaigngame() && isarray(player.var_231881b1))
			{
				foreach(str_streamer_hint in player.var_231881b1)
				{
					if(isdefined(str_streamer_hint) && str_streamer_hint !== -1)
					{
						player playerstreamerrequest("clear", str_streamer_hint);
					}
				}
			}
			if(isarray(player.var_231881b1) && isdefined(player.var_231881b1[_o_scene._str_name]))
			{
				player playerstreamerrequest("play", player.var_231881b1[_o_scene._str_name]);
				player.var_16672042[_o_scene._str_name] = -1;
				player.streamer_hint_playing = 1;
			}
		}
		thread function_9339d69d(player);
	}

}

class cscenesharedplayer : csceneobject, csceneplayer
{
	var _str_team;
	var _func_get;
	var m_align;
	var m_tag;
	var _e;
	var _func_get_active;
	var player_animation_notify;
	var _s;
	var _str_current_anim;
	var _o_scene;
	var _str_shot;
	var player_animation;
	var player_start_time;
	var player_time_frac;
	var player_animation_length;
	var current_playing_anim;
	var player_rate;
	var player_tag;
	var player_align;

	/*
		Name: constructor
		Namespace: cscenesharedplayer
		Checksum: 0x47096
		Offset: 0xB3B8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8, 16
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cscenesharedplayer
		Checksum: 0xD4E597C
		Offset: 0xB3D8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: _cleanup
		Namespace: cscenesharedplayer
		Checksum: 0x1169CC51
		Offset: 0xB318
		Size: 0x98
		Parameters: 0
		Flags: Linked
	*/
	function _cleanup()
	{
		foreach(player in [[_func_get]](_str_team))
		{
			csceneplayer::_cleanup_player(player);
		}
	}

	/*
		Name: _play_anim
		Namespace: cscenesharedplayer
		Checksum: 0xDA0051EA
		Offset: 0xA5B0
		Size: 0x3F8
		Parameters: 5
		Flags: Linked
	*/
	function _play_anim(animation, n_rate, n_blend, var_b2e32ae2, n_time)
	{
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				printtoprightln("" + n_blend);
			}
		#/
		self._str_current_anim = n_blend;
		self.player_animation = n_blend;
		self.player_animation_notify = n_blend + "_notify";
		self.player_animation_length = getanimlength(n_blend);
		self.player_align = m_align;
		self.player_tag = m_tag;
		self.player_rate = var_b2e32ae2;
		self.player_time_frac = n_time;
		self.player_start_time = gettime();
		a_players = [[_func_get]](_str_team);
		/#
			if(isdefined(_e) && !isinarray(a_players, _e))
			{
				arrayinsert(a_players, _e, 0);
			}
		#/
		foreach(player in a_players)
		{
			if(player flag::get(#"loadout_given") && player.sessionstate !== "spectator")
			{
				self thread _play_shared_player_anim_for_player(player);
				continue;
			}
			if(is_true(player.initialloadoutgiven))
			{
				csceneplayer::revive_player(player);
			}
		}
		[[ self ]]->_set_visibility();
		waittillframeend();
		do
		{
			b_playing = 0;
			foreach(player in [[_func_get_active]](_str_team))
			{
				if(isdefined(player) && player flag::get(player_animation_notify))
				{
					b_playing = 1;
					player flag::wait_till_clear(player_animation_notify);
					break;
				}
			}
		}
		while(b_playing);
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				csceneobject::log(((toupper(_s.type) + "") + _str_current_anim) + "");
			}
		#/
		thread [[ _o_scene ]]->_call_shot_funcs("players_done");
	}

	/*
		Name: _set_visibility
		Namespace: cscenesharedplayer
		Checksum: 0x9C92808
		Offset: 0xB128
		Size: 0xE0
		Parameters: 0
		Flags: Linked
	*/
	function _set_visibility()
	{
		a_players = [[_func_get]](_str_team);
		foreach(player in a_players)
		{
			player show();
			if(!player flag::get(#"hash_7cddd51e45d3ff3e"))
			{
				player setinvisibletoall();
			}
		}
	}

	/*
		Name: _stop
		Namespace: cscenesharedplayer
		Checksum: 0xC19D564B
		Offset: 0xB210
		Size: 0x100
		Parameters: 2
		Flags: Linked
	*/
	function _stop(b_dont_clear_anim, b_finished)
	{
		foreach(player in [[_func_get]](_str_team))
		{
			csceneplayer::function_52b00538(player);
			player animation::stop();
			player thread scene::scene_enable_player_stuff(_o_scene._s, _s, _o_scene._e_root);
		}
	}

	/*
		Name: _prepare
		Namespace: cscenesharedplayer
		Checksum: 0x83FE8D3B
		Offset: 0xA4B8
		Size: 0xEC
		Parameters: 0
		Flags: Linked
	*/
	function _prepare()
	{
		if(!csceneobject::function_e0df299e(_str_shot))
		{
			return;
		}
		a_players = [[_func_get]](_str_team);
		foreach(ent in a_players)
		{
			thread [[ self ]]->_prepare_player(ent);
		}
		[[ self ]]->_set_visibility();
		array::wait_till(a_players, "scene_ready");
	}

	/*
		Name: _play_shared_player_anim_for_player
		Namespace: cscenesharedplayer
		Checksum: 0x4D4E2A42
		Offset: 0xA9B0
		Size: 0x76C
		Parameters: 1
		Flags: Linked
	*/
	function _play_shared_player_anim_for_player(player)
	{
		player endon(#"death");
		if(!scene::check_team(player.team, _str_team))
		{
			return;
		}
		str_animation = player_animation;
		str_animation = [[ self ]]->animation_lookup(str_animation, player);
		csceneplayer::on_play_anim(player);
		/#
		#/
		/#
			if(getdvarint(#"debug_scene", 0) > 0)
			{
				printtoprightln("" + player_animation);
			}
		#/
		player flag::set(#"shared_igc");
		if(player flag::get(player_animation_notify))
		{
			player flag::set(player_animation_notify + "_skip_init_clear");
		}
		player flag::set(player_animation_notify);
		if(isdefined(player getlinkedent()))
		{
			player unlink();
		}
		if(!is_true(_s.disabletransitionin))
		{
			if(player != _e || getdvarint(#"scr_player1_postfx", 0))
			{
				if(!isdefined(player.var_59f4be9a))
				{
					if(!is_true(level.chyron_text_active))
					{
						if(!is_true(player.var_8a1a4ba))
						{
							player.play_scene_transition_effect = 1;
						}
					}
				}
			}
		}
		csceneplayer::_prepare_player(player);
		n_time_passed = (float(gettime() - player_start_time)) / 1000;
		n_start_time = player_time_frac * player_animation_length;
		n_time_left = (player_animation_length - n_time_passed) - n_start_time;
		n_time_frac = 1 - (n_time_left / player_animation_length);
		if(isdefined(_e) && player != _e)
		{
			player dontinterpolate();
			player setorigin(_e.origin);
			if(!isbot(player))
			{
				player setplayerangles(_e getplayerangles());
			}
		}
		n_lerp = csceneobject::get_lerp_time();
		if(!csceneplayer::function_6c1c67c1())
		{
			csceneplayer::function_52b00538(player);
			if(csceneobject::function_595c601b())
			{
				n_camera_tween = csceneplayer::get_camera_tween();
				if(n_camera_tween > 0)
				{
					var_186edacf = csceneplayer::function_7d78187b();
					player startcameratween(n_camera_tween, 0, var_186edacf);
				}
			}
		}
		if(n_time_frac < 1)
		{
			/#
				if(getdvarint(#"scene_hide_player", 0) > 0)
				{
					player val::set(#"scene", "");
				}
				if(getdvarint(#"debug_scene", 0) > 0)
				{
					printtoprightln((("" + _s.name) + "") + player_animation);
				}
			#/
			player_num = player getentitynumber();
			if(!isdefined(current_playing_anim))
			{
				self.current_playing_anim[player_num] = [];
			}
			self.current_playing_anim[player_num] = str_animation;
			if(csceneobject::is_skipping_scene())
			{
				thread csceneobject::skip_scene(1);
			}
			if(csceneobject::function_5c2a9efa())
			{
				player val::set(#"hash_268db5647c547679", "freezecontrols", 1);
				csceneobject::function_5c082667();
				player val::reset(#"hash_268db5647c547679", "freezecontrols");
			}
			else
			{
				player animation::play(str_animation, player_align, player_tag, player_rate, 0, 0, n_lerp, n_time_frac, _s.showweaponinfirstperson, undefined, undefined, undefined, undefined, undefined, _s.showviewmodel);
			}
			if(!player flag::get(player_animation_notify + "_skip_init_clear"))
			{
				player flag::clear(player_animation_notify);
			}
			else
			{
				player flag::clear(player_animation_notify + "_skip_init_clear");
			}
			if(!player isplayinganimscripted())
			{
				self.current_playing_anim[player_num] = undefined;
			}
			/#
				if(getdvarint(#"debug_scene", 0) > 0)
				{
					printtoprightln((("" + _s.name) + "") + function_9e72a96(player_animation));
				}
			#/
		}
	}

}

class cscenefakeplayer : csceneobject
{
	var _s;
	var _e;
	var _o_scene;
	var _str_shot;

	/*
		Name: constructor
		Namespace: cscenefakeplayer
		Checksum: 0x69051721
		Offset: 0xD840
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8, 16
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cscenefakeplayer
		Checksum: 0xF00BB7F0
		Offset: 0xD860
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: _spawn_ent
		Namespace: cscenefakeplayer
		Checksum: 0x8886626
		Offset: 0xD430
		Size: 0x92
		Parameters: 0
		Flags: Linked
	*/
	function _spawn_ent()
	{
		if(is_true(_s.var_671e284a))
		{
			a_players = getplayers();
			player = array::random(a_players);
			if(isdefined(player))
			{
				self._e = util::spawn_player_clone(player, undefined, undefined, 1);
			}
		}
	}

	/*
		Name: animation_lookup
		Namespace: cscenefakeplayer
		Checksum: 0x23C54C9A
		Offset: 0xD588
		Size: 0x2AA
		Parameters: 3
		Flags: Linked
	*/
	function animation_lookup(animation, ent, b_camera)
	{
		if(!isdefined(b_camera))
		{
			b_camera = _e;
		}
		if(isweapon(b_camera.weapon) && !isdefined(b_camera.var_777951c))
		{
			b_camera.var_777951c = b_camera.weapon;
		}
		if(isdefined(_o_scene.var_58e5d094) && isplayer(b_camera.var_1ff8de20))
		{
			if(self === _o_scene.var_58e5d094 && isarray(_o_scene._a_objects))
			{
				foreach(obj in _o_scene._a_objects)
				{
					if(obj != self && [[ obj ]]->is_player_model() && isplayer(obj._e.var_1ff8de20))
					{
						var_65cfb30b = [[ obj ]]->get_animation_name(_str_shot, 1);
						var_65cfb30b = [[ obj ]]->function_9a43e31(b_camera, var_65cfb30b);
						self.var_f4b34dc1[obj._e.var_1ff8de20 getentitynumber()] = var_65cfb30b;
					}
				}
			}
			var_9defbbb0 = [[ _o_scene.var_58e5d094 ]]->get_animation_name(_str_shot, 1);
			var_9defbbb0 = [[ _o_scene.var_58e5d094 ]]->function_9a43e31(b_camera, var_9defbbb0);
			self.var_f4b34dc1[b_camera.var_1ff8de20 getentitynumber()] = var_9defbbb0;
		}
		ent = csceneobject::function_9a43e31(b_camera, ent);
		return ent;
	}

	/*
		Name: _prepare
		Namespace: cscenefakeplayer
		Checksum: 0xC5E7C10F
		Offset: 0xD4D0
		Size: 0xAC
		Parameters: 0
		Flags: Linked
	*/
	function _prepare()
	{
		/#
			var_cd31cd6a = getdvarstring(#"hash_575aeb603638c901", "");
			if(isdefined(_e) && var_cd31cd6a != "")
			{
				weapon = getweapon(var_cd31cd6a);
				_e animation::attach_weapon(weapon);
			}
		#/
		csceneobject::_prepare();
	}

}

class class_6572d7cd : csceneobject, csceneplayer
{

	/*
		Name: constructor
		Namespace: namespace_6572d7cd
		Checksum: 0x71588307
		Offset: 0xEDD8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8, 16
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_6572d7cd
		Checksum: 0x1FB63B85
		Offset: 0xEDF8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

}

#namespace scene_player_shared;

/*
	Name: function_69ae32bf
	Namespace: scene_player_shared
	Checksum: 0xF11FC1B7
	Offset: 0x3B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_69ae32bf()
{
	level notify(1511503206);
}

