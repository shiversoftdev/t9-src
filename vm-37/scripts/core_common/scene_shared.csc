#using script_33134801f28aa031;
#using script_48adcbbbccee5e60;
#using script_64914218f744517b;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\scene_debug_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\scriptbundle_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

class csceneplayer : cscriptbundleobjectbase, csceneobject
{
	var var_8bba7189;
	var var_55b4f21e;
	var _n_clientnum;
	var _o_scene;
	var _str_shot;
	var _e_array;

	/*
		Name: constructor
		Namespace: csceneplayer
		Checksum: 0x584FA0D5
		Offset: 0x1130
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8, 128
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: csceneplayer
		Checksum: 0x231D22B3
		Offset: 0x1150
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_35a524cf
		Namespace: csceneplayer
		Checksum: 0x79912784
		Offset: 0xB08
		Size: 0x310
		Parameters: 4
		Flags: Linked
	*/
	function function_35a524cf(clientnum, animation, n_start_time, params)
	{
		if(!isdefined(n_start_time))
		{
			n_start_time = 0;
		}
		if(is_true(var_8bba7189))
		{
			return;
		}
		animation = csceneobject::function_9a43e31(clientnum, animation, 1);
		var_8395d6f1 = csceneobject::get_lerp_time(params, 1);
		var_8395d6f1 = int(var_8395d6f1 * 1000);
		s_align = csceneobject::function_bc0facbb(clientnum);
		align = s_align.ent;
		tag = s_align.tag;
		if(align == level)
		{
			v_pos = (0, 0, 0);
			v_ang = (0, 0, 0);
		}
		else
		{
			if(isentity(align))
			{
				/#
					loc_00000C90:
					assert(isdefined(align.model), (("" + (isdefined(animation) ? animation : "")) + "") + (isdefined(tag) ? tag : "") + "");
				#/
				v_pos = align;
				v_ang = (isdefined(tag) ? tag : "tag_origin");
			}
			else
			{
				v_pos = align.origin;
				v_ang = align.angles;
			}
		}
		var_380af598 = (isdefined(var_55b4f21e.cameraswitchername) ? var_55b4f21e.cameraswitchername : "");
		var_57949b2d = n_start_time * getcamanimtime(animation);
		var_473877de = getservertime(clientnum) - var_57949b2d;
		if(isdefined(var_55b4f21e.var_ffc10b65))
		{
			var_94f3822c = getent(clientnum, var_55b4f21e.var_ffc10b65, "targetname");
		}
		playmaincamxcam(clientnum, animation, var_8395d6f1, var_380af598, "", v_pos, v_ang, var_94f3822c, undefined, undefined, int(var_473877de));
		[[ self ]]->wait_for_camera(animation, var_57949b2d);
	}

	/*
		Name: initialize
		Namespace: csceneplayer
		Checksum: 0x98B2F3E7
		Offset: 0x8B8
		Size: 0xC4
		Parameters: 0
		Flags: Linked
	*/
	function initialize()
	{
		flag::clear(#"ready");
		flag::clear(#"done");
		flag::clear(#"main_done");
		self notify(#"new_state");
		self endon(#"new_state");
		self notify(#"init");
		waittillframeend();
		if(isdefined(_n_clientnum))
		{
			_spawn(_n_clientnum);
		}
	}

	/*
		Name: wait_for_camera
		Namespace: csceneplayer
		Checksum: 0xF9184C96
		Offset: 0xE20
		Size: 0x11C
		Parameters: 2
		Flags: Linked
	*/
	function wait_for_camera(animation, var_57949b2d)
	{
		if(!isdefined(var_57949b2d))
		{
			var_57949b2d = 0;
		}
		self endon(#"skip_camera_anims");
		flag::set(#"camera_playing");
		/#
			thread function_87208d7e();
		#/
		if(iscamanimlooping(animation))
		{
			self waittill(#"new_state");
		}
		else
		{
			n_cam_time = getcamanimtime(animation) - var_57949b2d;
			self waittilltimeout(float(n_cam_time) / 1000, #"new_state");
		}
		flag::clear(#"camera_playing");
	}

	/*
		Name: function_87208d7e
		Namespace: csceneplayer
		Checksum: 0x103DFD1A
		Offset: 0xF48
		Size: 0x1DA
		Parameters: 0
		Flags: Linked
	*/
	function function_87208d7e()
	{
		/#
			level notify(#"hash_59d906960a825469");
			level endon(#"hash_59d906960a825469");
			self endon(#"new_state");
			_o_scene endon(#"stopped", #"new_state");
			while(true)
			{
				if(!getdvarint(#"scr_show_shot_info_for_igcs", 0) || !isdefined(_o_scene._str_name) || !isdefined(_o_scene._str_shot))
				{
					waitframe(1);
					continue;
				}
				v_pos = (1350, 195, 0);
				var_c74251a4 = scene::function_8582657c(_o_scene._s, _str_shot);
				var_962ef8af = (((((("" + function_9e72a96(_o_scene._str_name)) + "") + _str_shot) + "") + var_c74251a4) + "") + (var_c74251a4 * 30);
				debug2dtext(v_pos, var_962ef8af, undefined, undefined, undefined, 1, 0.8);
				v_pos = v_pos + (vectorscale((0, 1, 0), 20) * 2);
				waitframe(1);
			}
		#/
	}

	/*
		Name: _spawn
		Namespace: csceneplayer
		Checksum: 0xA1CD19C8
		Offset: 0x988
		Size: 0x174
		Parameters: 2
		Flags: Linked
	*/
	function _spawn(clientnum, b_hide)
	{
		if(!isdefined(b_hide))
		{
			b_hide = 1;
		}
		if(isdefined(_e_array[clientnum]))
		{
			var_d3395a10 = 1;
		}
		else
		{
			self._e_array[clientnum] = function_5c10bd79(clientnum);
		}
		if(isdefined(level.var_762a4ab))
		{
			if(!is_true(var_d3395a10))
			{
				self [[level.var_762a4ab]](clientnum);
			}
			if(isdefined(_e_array[clientnum]) && !isplayer(_e_array[clientnum]) && _e_array[clientnum].model !== "" && b_hide && !is_true(_e_array[clientnum].var_463f8196))
			{
				_e_array[clientnum] hide();
			}
		}
		flag::set(#"ready");
	}

}

class csceneobject : cscriptbundleobjectbase
{
	var _n_clientnum;
	var _e_array;
	var _o_scene;
	var _s;
	var var_55b4f21e;
	var m_tag;
	var m_align;
	var _str_name;
	var _str_shot;
	var var_84ca3312;
	var _n_blend;
	var _b_first_frame;
	var _b_spawnonce_used;

	/*
		Name: constructor
		Namespace: csceneobject
		Checksum: 0xF9CC0F6B
		Offset: 0x1C18
		Size: 0x52
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self._b_spawnonce_used = 0;
		self._is_valid = 1;
		self._b_first_frame = 0;
		self._n_blend = 0;
		self.var_84ca3312 = "linear";
	}

	/*
		Name: destructor
		Namespace: csceneobject
		Checksum: 0xAC63CF5A
		Offset: 0x1C78
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16
	*/
	destructor()
	{
	}

	/*
		Name: wait_till_shot_ready
		Namespace: csceneobject
		Checksum: 0x35BC07F7
		Offset: 0x5580
		Size: 0x24
		Parameters: 0
		Flags: Linked
	*/
	function wait_till_shot_ready()
	{
		[[ scene() ]]->wait_till_shot_ready();
	}

	/*
		Name: in_a_different_scene
		Namespace: csceneobject
		Checksum: 0x546FF68E
		Offset: 0x5688
		Size: 0xDA
		Parameters: 0
		Flags: Linked
	*/
	function in_a_different_scene()
	{
		if(isdefined(_n_clientnum))
		{
			if(isdefined(_e_array[_n_clientnum]) && isdefined(_e_array[_n_clientnum].current_scene) && _e_array[_n_clientnum].current_scene != _o_scene._str_name)
			{
				return true;
			}
		}
		else if(isdefined(_e_array[0]) && isdefined(_e_array[0].current_scene) && _e_array[0].current_scene != _o_scene._str_name)
		{
			return true;
		}
		return false;
	}

	/*
		Name: function_9a43e31
		Namespace: csceneobject
		Checksum: 0x8EAAE108
		Offset: 0x4760
		Size: 0x4E2
		Parameters: 3
		Flags: Linked
	*/
	function function_9a43e31(clientnum, var_6410e385, b_camera)
	{
		if(!isdefined(b_camera))
		{
			b_camera = 0;
		}
		if(isdefined(level.var_696537bb) && (_s.type === #"fakeplayer" || _s.type === #"player"))
		{
			weapon = self [[level.var_696537bb]](clientnum, _s.var_1b22ecf4);
		}
		if(isdefined(level.var_29369e8c) && (_s.type === #"fakeplayer" || _s.type === #"player"))
		{
			str_gender = self [[level.var_29369e8c]](clientnum, _s.var_1b22ecf4);
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
			if(!isdefined(weapon))
			{
				if(str_gender === "female")
				{
					return (isdefined(var_55b4f21e.var_1f836d8f) ? var_55b4f21e.var_1f836d8f : var_6410e385);
				}
				return var_6410e385;
			}
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
					else if(weapons::ispistol(weapon))
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
		return (isdefined(var_c4a23d1d) ? var_c4a23d1d : var_6410e385);
	}

	/*
		Name: function_ee94f77
		Namespace: csceneobject
		Checksum: 0xA7778E8C
		Offset: 0x2E00
		Size: 0x54
		Parameters: 2
		Flags: Linked
	*/
	function function_ee94f77(clientnum, params)
	{
		function_dd4f74e1(clientnum);
		function_587971b6(params);
		function_ebbbd00d();
	}

	/*
		Name: function_1263065a
		Namespace: csceneobject
		Checksum: 0x6F89E06
		Offset: 0x24F0
		Size: 0xBA
		Parameters: 1
		Flags: Linked
	*/
	function function_1263065a(n_shot)
	{
		if(!isdefined(n_shot))
		{
			n_shot = 0;
		}
		var_5e0d27b8 = [];
		if(isdefined(_s.shots[n_shot]) && isdefined(_s.shots[n_shot].entry))
		{
			var_5e0d27b8 = getarraykeys(_s.shots[n_shot].entry);
			var_5e0d27b8 = array::sort_by_value(var_5e0d27b8, 1);
		}
		return var_5e0d27b8;
	}

	/*
		Name: _cleanup
		Namespace: csceneobject
		Checksum: 0xC5B60D4B
		Offset: 0x40E0
		Size: 0x192
		Parameters: 1
		Flags: Linked
	*/
	function _cleanup(clientnum)
	{
		if(isdefined(_e_array[clientnum]) && isdefined(_e_array[clientnum].current_scene))
		{
			_e_array[clientnum] flag::clear(_o_scene._str_name);
			_e_array[clientnum] sethighdetail(0);
			if(_e_array[clientnum].current_scene == _o_scene._str_name)
			{
				_e_array[clientnum] flag::clear(#"scene");
				_e_array[clientnum].finished_scene = _o_scene._str_name;
				_e_array[clientnum].current_scene = undefined;
			}
			function_fda037ff(clientnum);
		}
		if(clientnum === _n_clientnum || clientnum == 0)
		{
			if(isdefined(_o_scene) && is_true(_o_scene.scene_stopped))
			{
				self._o_scene = undefined;
			}
		}
	}

	/*
		Name: _play_anim
		Namespace: csceneobject
		Checksum: 0xF1BBA83D
		Offset: 0x4480
		Size: 0x2D2
		Parameters: 9
		Flags: Linked
	*/
	function _play_anim(clientnum, animation, n_rate, n_blend, var_b2e32ae2, str_siege_shot, loop, n_start_time, params)
	{
		if(!isdefined(n_rate))
		{
			n_rate = 1;
		}
		_spawn(clientnum);
		if(is_alive(clientnum, 1))
		{
			if(!is_true(_e_array[clientnum].var_463f8196))
			{
				_e_array[clientnum] show();
			}
			if(is_true(_s.issiege))
			{
				_e_array[clientnum] animation::play_siege(animation, str_siege_shot, n_rate, loop);
			}
			else
			{
				if(is_true(loop) && is_true(_s.var_69db1665))
				{
					n_start_time = undefined;
				}
				util::waitforclient(clientnum);
				animation = function_9a43e31(clientnum, animation);
				n_lerp_time = get_lerp_time(params);
				if(is_true(loop) && is_true(_s.var_9de1f44c))
				{
					_e_array[clientnum] animation::play(animation, _e_array[clientnum], m_tag, n_rate, n_blend, undefined, n_lerp_time, undefined, n_start_time, var_b2e32ae2, clientnum);
				}
				else
				{
					update_alignment(clientnum);
					_e_array[clientnum] animation::play(animation, m_align, m_tag, n_rate, n_blend, undefined, n_lerp_time, undefined, n_start_time, var_b2e32ae2, clientnum);
				}
			}
		}
		else
		{
			/#
				cscriptbundleobjectbase::log(("" + animation) + "");
			#/
		}
		self._is_valid = is_alive(clientnum);
	}

	/*
		Name: restore_saved_ent
		Namespace: csceneobject
		Checksum: 0xE2535EC2
		Offset: 0x1CF8
		Size: 0xC4
		Parameters: 1
		Flags: Linked
	*/
	function restore_saved_ent(clientnum)
	{
		if(isdefined(_o_scene._e_root) && isdefined(_o_scene._e_root.scene_ents) && isdefined(_o_scene._e_root.scene_ents[clientnum]))
		{
			if(isdefined(_o_scene._e_root.scene_ents[clientnum][_str_name]))
			{
				self._e_array[clientnum] = _o_scene._e_root.scene_ents[clientnum][_str_name];
			}
		}
	}

	/*
		Name: run_wait
		Namespace: csceneobject
		Checksum: 0x111739FB
		Offset: 0x25B8
		Size: 0x56
		Parameters: 1
		Flags: Linked
	*/
	function run_wait(wait_time)
	{
		wait_start_time = 0;
		while(wait_start_time < wait_time && !is_skipping_scene())
		{
			wait_start_time = wait_start_time + 0.016;
			waitframe(1);
		}
	}

	/*
		Name: is_alive
		Namespace: csceneobject
		Checksum: 0xA403E52
		Offset: 0x55E0
		Size: 0x9A
		Parameters: 2
		Flags: Linked
	*/
	function is_alive(clientnum, var_7081273e)
	{
		if(!isdefined(var_7081273e))
		{
			var_7081273e = 0;
		}
		if(var_7081273e)
		{
			if(isplayer(_e_array[clientnum]))
			{
				return 0;
			}
			return isdefined(_e_array[clientnum]) && _e_array[clientnum].model !== "";
		}
		return isdefined(_e_array[clientnum]);
	}

	/*
		Name: initialize
		Namespace: csceneobject
		Checksum: 0x43756B92
		Offset: 0x1DC8
		Size: 0x364
		Parameters: 0
		Flags: Linked
	*/
	function initialize()
	{
		flag::clear(#"ready");
		flag::clear(#"done");
		flag::clear(#"main_done");
		self notify(#"new_state");
		self endon(#"new_state");
		self notify(#"init");
		waittillframeend();
		self._str_shot = scene::function_de6a7579(_o_scene._str_name, "init", _o_scene._e_root);
		self.var_55b4f21e = function_730a4c60(_str_shot);
		cscriptbundleobjectbase::error(!isdefined(var_55b4f21e), ("Shot struct is not defined for this object. Check and make sure that \"" + _str_shot) + "\" is a valid shot name for this scene bundle");
		if(isdefined(_n_clientnum))
		{
			_spawn(_n_clientnum, is_true(_s.firstframe) || isdefined(_s.initanim) || isdefined(_s.initanimloop));
		}
		else
		{
			_spawn(0, is_true(_s.firstframe) || isdefined(_s.initanim) || isdefined(_s.initanimloop));
			var_2d560016 = getmaxlocalclients();
			for(clientnum = 1; clientnum < var_2d560016; clientnum++)
			{
				if(isdefined(function_5c10bd79(clientnum)))
				{
					_spawn(clientnum, is_true(_s.firstframe) || isdefined(_s.initanim) || isdefined(_s.initanimloop));
				}
			}
		}
		if(isdefined(_n_clientnum))
		{
			thread initialize_per_client(_n_clientnum);
		}
		else
		{
			for(clientnum = 1; clientnum < getmaxlocalclients(); clientnum++)
			{
				if(isdefined(function_5c10bd79(clientnum)))
				{
					thread initialize_per_client(clientnum);
				}
			}
			initialize_per_client(0);
		}
	}

	/*
		Name: function_4b3d4226
		Namespace: csceneobject
		Checksum: 0x360F6339
		Offset: 0x3EE0
		Size: 0x1F4
		Parameters: 1
		Flags: Linked
	*/
	function function_4b3d4226(clientnum)
	{
		if(!isdefined(_e_array[clientnum]) || !isdefined(var_55b4f21e))
		{
			return;
		}
		if(is_true(var_55b4f21e.var_a4b8685d))
		{
			_e_array[clientnum] delete();
			return;
		}
		if(isdefined(var_55b4f21e.var_3cd248f5))
		{
			a_ents = getentarray(clientnum, var_55b4f21e.var_3cd248f5, "targetname");
			array::run_all(a_ents, &hide);
		}
		else if(isdefined(var_55b4f21e.var_b94164e))
		{
			a_ents = getentarray(clientnum, var_55b4f21e.var_b94164e, "targetname");
			array::run_all(a_ents, &show);
		}
		if(!is_true(_e_array[clientnum].var_463f8196))
		{
			if(is_true(var_55b4f21e.var_562f4281))
			{
				_e_array[clientnum] hide();
			}
			else if(is_true(var_55b4f21e.var_4f4c4730))
			{
				_e_array[clientnum] show();
			}
		}
	}

	/*
		Name: function_54266b24
		Namespace: csceneobject
		Checksum: 0x8AE14955
		Offset: 0x54E0
		Size: 0x98
		Parameters: 0
		Flags: Linked
	*/
	function function_54266b24()
	{
		foreach(obj in _o_scene._a_objects)
		{
			obj flag::wait_till_clear("camera_playing");
		}
	}

	/*
		Name: function_587971b6
		Namespace: csceneobject
		Checksum: 0x54E065F1
		Offset: 0x2EF0
		Size: 0x9E
		Parameters: 1
		Flags: Linked
	*/
	function function_587971b6(params)
	{
		if(isdefined(params.blend))
		{
			self._n_blend = params.blend;
		}
		else
		{
			self._n_blend = (isdefined(var_55b4f21e.blend) ? var_55b4f21e.blend : 0);
		}
		self.var_84ca3312 = (isdefined(var_55b4f21e.var_d6272917) ? var_55b4f21e.var_d6272917 : "linear");
	}

	/*
		Name: function_5b2306f5
		Namespace: csceneobject
		Checksum: 0x2D14D207
		Offset: 0x4C50
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
		Checksum: 0x3C886439
		Offset: 0x3848
		Size: 0xCC
		Parameters: 2
		Flags: Linked
	*/
	function get_lerp_time(params, b_camera)
	{
		if(!isdefined(b_camera))
		{
			b_camera = 0;
		}
		if(b_camera && isdefined(params.var_dcfaf6c7))
		{
			n_lerp_time = params.var_dcfaf6c7;
		}
		else
		{
			if(!b_camera && isdefined(params.var_4f412ea3))
			{
				n_lerp_time = params.var_4f412ea3;
			}
			else
			{
				n_lerp_time = (isdefined(var_55b4f21e.lerptime) ? var_55b4f21e.lerptime : _s.lerptime);
			}
		}
		return true;
	}

	/*
		Name: finish_per_client
		Namespace: csceneobject
		Checksum: 0xB73BF90B
		Offset: 0x31B8
		Size: 0x374
		Parameters: 3
		Flags: Linked
	*/
	function finish_per_client(clientnum, b_clear, b_finished)
	{
		if(!isdefined(b_clear))
		{
			b_clear = 0;
		}
		if(!isdefined(b_finished))
		{
			b_finished = 0;
		}
		if(!is_alive(clientnum))
		{
			_cleanup(clientnum);
			self._e_array[clientnum] = undefined;
			self._is_valid = 0;
		}
		flag::set(#"ready");
		flag::set(#"done");
		if(isdefined(_e_array[clientnum]))
		{
			if(!b_finished)
			{
				_e_array[clientnum] stopsounds();
			}
			if(isdefined(_o_scene) && (isplayer(_e_array[clientnum]) || function_ec3fa8f5()))
			{
				if(scene::function_b260bdcc(_o_scene._str_name, _str_shot, _o_scene._e_root) || scene::function_6a0b0afe(_o_scene._str_mode) || b_clear)
				{
					stopmaincamxcam(clientnum);
				}
			}
			else if(is_alive(clientnum) && (b_finished && is_true(_s.deletewhenfinished) || b_clear))
			{
				_e_array[clientnum] delete();
			}
		}
		else if(_s.type === #"sharedplayer" || _s.type === #"player")
		{
			result = 0;
			if(isdefined(_o_scene) && isdefined(_o_scene._str_name) && isdefined(_o_scene._e_root) && isdefined(_str_shot))
			{
				result = scene::function_b260bdcc(_o_scene._str_name, _str_shot, _o_scene._e_root) || scene::function_6a0b0afe(_o_scene._str_mode);
			}
			if(function_ec3fa8f5() && (result || b_clear))
			{
				stopmaincamxcam(clientnum);
			}
		}
		_cleanup(clientnum);
	}

	/*
		Name: play_per_client
		Namespace: csceneobject
		Checksum: 0xE35F6AC
		Offset: 0x2AC0
		Size: 0x334
		Parameters: 4
		Flags: Linked
	*/
	function play_per_client(clientnum, n_start_time, b_looping, params)
	{
		if(!isdefined(b_looping))
		{
			b_looping = undefined;
		}
		self endon(#"new_state");
		util::waitforclient(clientnum);
		[[ self ]]->_spawn(clientnum);
		n_shot = get_shot(_str_shot);
		var_5e0d27b8 = function_1263065a(n_shot);
		function_ee94f77(clientnum, params);
		var_3f83c458 = array("blend", "cameraswitcher", "anim");
		foreach(str_entry_type in var_3f83c458)
		{
			if(!is_alive(clientnum))
			{
				break;
			}
			foreach(n_entry in var_5e0d27b8)
			{
				entry = get_entry(n_shot, n_entry, str_entry_type);
				if(isdefined(entry))
				{
					switch(str_entry_type)
					{
						case "cameraswitcher":
						{
							thread [[ self ]]->function_35a524cf(clientnum, entry, n_start_time, params);
							break;
						}
						case "anim":
						{
							_play_anim(clientnum, entry, 1, _n_blend, var_84ca3312, _s.mainshot, b_looping, n_start_time, params);
							break;
						}
						case "blend":
						{
							self._n_blend = entry;
							break;
						}
						default:
						{
							cscriptbundleobjectbase::error(1, ("Bad timeline entry type '" + str_entry_type) + "'.");
						}
					}
				}
			}
		}
		function_54266b24();
		thread finish_per_client(clientnum, 0, 1);
	}

	/*
		Name: function_71b06874
		Namespace: csceneobject
		Checksum: 0xEDF829E4
		Offset: 0x2288
		Size: 0x3E
		Parameters: 1
		Flags: Linked
	*/
	function function_71b06874(n_shot)
	{
		if(is_true(_s.shots[n_shot].var_51093f2d))
		{
			return false;
		}
		return true;
	}

	/*
		Name: function_730a4c60
		Namespace: csceneobject
		Checksum: 0x953E1BA8
		Offset: 0x21E0
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
		Name: scene
		Namespace: csceneobject
		Checksum: 0x5B31A040
		Offset: 0x3778
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function scene()
	{
		return _o_scene;
	}

	/*
		Name: _prepare
		Namespace: csceneobject
		Checksum: 0xA1EA558B
		Offset: 0x3CF8
		Size: 0x1DA
		Parameters: 1
		Flags: Linked
	*/
	function _prepare(clientnum)
	{
		self.var_55b4f21e = function_730a4c60(_str_shot);
		if(!is_true(_s.issiege) && _e_array[clientnum].model !== "")
		{
			if(!_e_array[clientnum] hasanimtree())
			{
				_e_array[clientnum] useanimtree("generic");
			}
		}
		_e_array[clientnum].anim_debug_name = _s.name;
		function_4b3d4226(clientnum);
		if(_o_scene._s scene::is_igc())
		{
			_e_array[clientnum] sethighdetail(1);
		}
		_e_array[clientnum] flag::set(#"scene");
		_e_array[clientnum] flag::set(_o_scene._str_name);
		_e_array[clientnum].current_scene = _o_scene._str_name;
		_e_array[clientnum].finished_scene = undefined;
	}

	/*
		Name: initialize_per_client
		Namespace: csceneobject
		Checksum: 0x78103DBF
		Offset: 0x2648
		Size: 0x264
		Parameters: 1
		Flags: Linked
	*/
	function initialize_per_client(clientnum)
	{
		self endon(#"new_state");
		util::waitforclient(clientnum);
		n_shot = get_shot(_str_shot);
		_e_array[clientnum] show();
		function_ee94f77(clientnum);
		if(isdefined(_s.shots) && isdefined(_s.shots[n_shot]) && isarray(_s.shots[n_shot].entry))
		{
			foreach(s_entry in _s.shots[n_shot].entry)
			{
				if(isdefined(s_entry.anim))
				{
					var_ad4f5efa = s_entry.anim;
					if(_b_first_frame)
					{
						_play_anim(clientnum, var_ad4f5efa, 0, undefined, _s.mainshot);
						break;
						continue;
					}
					if(isanimlooping(clientnum, var_ad4f5efa))
					{
						thread _play_anim(clientnum, var_ad4f5efa, 1, undefined, _s.mainshot);
						continue;
					}
					_play_anim(clientnum, var_ad4f5efa, 1, undefined, _s.mainshot);
				}
			}
		}
		flag::set(#"ready");
	}

	/*
		Name: update_alignment
		Namespace: csceneobject
		Checksum: 0x43C2EFB6
		Offset: 0x4E28
		Size: 0x5E6
		Parameters: 1
		Flags: Linked
	*/
	function update_alignment(clientnum)
	{
		s_align = function_bc0facbb(clientnum);
		self.m_align = s_align.ent;
		self.m_tag = s_align.tag;
		var_cd4673f4 = is_true(_s.var_132e5621);
		var_2dd2901f = ((isdefined(_o_scene._s.var_922b4fc5) ? _o_scene._s.var_922b4fc5 : 0), (isdefined(_o_scene._s.var_3e692842) ? _o_scene._s.var_3e692842 : 0), (isdefined(_o_scene._s.var_be60a82b) ? _o_scene._s.var_be60a82b : 0));
		var_acf1be3a = ((isdefined(_o_scene._s.var_16999a5d) ? _o_scene._s.var_16999a5d : 0), (isdefined(_o_scene._s.var_29563fd6) ? _o_scene._s.var_29563fd6 : 0), (isdefined(_o_scene._s.var_eb00c330) ? _o_scene._s.var_eb00c330 : 0));
		var_24a7cd13 = ((isdefined(_s.var_922b4fc5) ? _s.var_922b4fc5 : 0), (isdefined(_s.var_3e692842) ? _s.var_3e692842 : 0), (isdefined(_s.var_be60a82b) ? _s.var_be60a82b : 0));
		var_75cdf4bd = ((isdefined(_s.var_16999a5d) ? _s.var_16999a5d : 0), (isdefined(_s.var_29563fd6) ? _s.var_29563fd6 : 0), (isdefined(_s.var_eb00c330) ? _s.var_eb00c330 : 0));
		var_2a3b0294 = ((isdefined(var_55b4f21e.var_922b4fc5) ? var_55b4f21e.var_922b4fc5 : 0), (isdefined(var_55b4f21e.var_3e692842) ? var_55b4f21e.var_3e692842 : 0), (isdefined(var_55b4f21e.var_be60a82b) ? var_55b4f21e.var_be60a82b : 0));
		var_f3bd6699 = ((isdefined(var_55b4f21e.var_16999a5d) ? var_55b4f21e.var_16999a5d : 0), (isdefined(var_55b4f21e.var_29563fd6) ? var_55b4f21e.var_29563fd6 : 0), (isdefined(var_55b4f21e.var_eb00c330) ? var_55b4f21e.var_eb00c330 : 0));
		if(var_2a3b0294 != (0, 0, 0))
		{
			var_d3c21d73 = var_2a3b0294;
		}
		else
		{
			if(var_24a7cd13 != (0, 0, 0))
			{
				var_d3c21d73 = var_24a7cd13;
			}
			else
			{
				var_d3c21d73 = var_2dd2901f;
			}
		}
		if(var_f3bd6699 != (0, 0, 0))
		{
			v_ang_offset = var_f3bd6699;
		}
		else
		{
			if(var_75cdf4bd != (0, 0, 0))
			{
				v_ang_offset = var_75cdf4bd;
			}
			else
			{
				v_ang_offset = var_acf1be3a;
			}
		}
		if(m_align == level)
		{
			self.m_align = (0, 0, 0) + var_d3c21d73;
			self.m_tag = (0, 0, 0) + v_ang_offset;
		}
		else
		{
			if(var_d3c21d73 != (0, 0, 0) || v_ang_offset != (0, 0, 0))
			{
				v_pos = m_align.origin + var_d3c21d73;
				if(var_cd4673f4)
				{
					v_ang = _e_array[clientnum].angles;
				}
				else
				{
					v_ang = m_align.angles + v_ang_offset;
				}
				self.m_align = {#angles:v_ang, #origin:v_pos};
			}
			else if(var_cd4673f4)
			{
				v_pos = m_align.origin;
				v_ang = _e_array[clientnum].angles;
				self.m_align = {#angles:v_ang, #origin:v_pos};
			}
		}
	}

	/*
		Name: first_init
		Namespace: csceneobject
		Checksum: 0x6EC5AE92
		Offset: 0x1C98
		Size: 0x56
		Parameters: 4
		Flags: Linked
	*/
	function first_init(s_objdef, o_scene, e_ent, localclientnum)
	{
		cscriptbundleobjectbase::init(s_objdef, o_scene, e_ent, localclientnum);
		_assign_unique_name();
		return self;
	}

	/*
		Name: get_shot
		Namespace: csceneobject
		Checksum: 0xBAE2F7A8
		Offset: 0x2138
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
		Name: has_init_state
		Namespace: csceneobject
		Checksum: 0x6817563B
		Offset: 0x55B0
		Size: 0x22
		Parameters: 1
		Flags: Linked
	*/
	function has_init_state(str_scenedef)
	{
		return _s scene::_has_init_state(str_scenedef);
	}

	/*
		Name: function_bc0facbb
		Namespace: csceneobject
		Checksum: 0xD454AB3A
		Offset: 0x3538
		Size: 0x234
		Parameters: 1
		Flags: Linked
	*/
	function function_bc0facbb(clientnum)
	{
		e_align = undefined;
		n_shot = get_shot(_str_shot);
		if(isdefined(n_shot) && isdefined(_s.shots[n_shot].aligntarget))
		{
			var_690ec5fb = _s.shots[n_shot].aligntarget;
			var_139e0bfc = var_55b4f21e.aligntargettag;
		}
		else
		{
			if(isdefined(_s.aligntarget) && _s.aligntarget !== _o_scene._s.aligntarget)
			{
				var_690ec5fb = _s.aligntarget;
				var_139e0bfc = _s.aligntargettag;
			}
			else
			{
				var_139e0bfc = _o_scene._s.aligntargettag;
			}
		}
		if(isdefined(var_690ec5fb))
		{
			a_scene_ents = [[ _o_scene ]]->get_ents();
			if(isdefined(a_scene_ents[clientnum][var_690ec5fb]))
			{
				e_align = a_scene_ents[clientnum][var_690ec5fb];
			}
			else
			{
				e_align = scene::get_existing_ent(clientnum, var_690ec5fb);
			}
			cscriptbundleobjectbase::error(!isdefined(e_align), ("Align target '" + (isdefined(var_690ec5fb) ? "" + var_690ec5fb : "")) + "' doesn't exist for scene object.");
		}
		if(!isdefined(e_align))
		{
			return [[ scene() ]]->function_bc0facbb(clientnum);
		}
		return {#tag:var_139e0bfc, #ent:e_align};
	}

	/*
		Name: get_entry
		Namespace: csceneobject
		Checksum: 0x84F2F2E5
		Offset: 0x22D0
		Size: 0xF2
		Parameters: 3
		Flags: Linked
	*/
	function get_entry(n_shot, n_entry, str_entry_type)
	{
		if(!isdefined(n_shot))
		{
			n_shot = 0;
		}
		if(isdefined(_s.shots[n_shot]) && isdefined(_s.shots[n_shot].entry) && isdefined(_s.shots[n_shot].entry[n_entry]))
		{
			if(isdefined(_s.shots[n_shot].entry[n_entry].(str_entry_type)))
			{
				entry = _s.shots[n_shot].entry[n_entry].(str_entry_type);
			}
		}
		return entry;
	}

	/*
		Name: get_name
		Namespace: csceneobject
		Checksum: 0xF5A7EDE4
		Offset: 0x3810
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function get_name()
	{
		return _str_name;
	}

	/*
		Name: play
		Namespace: csceneobject
		Checksum: 0x4359B5FD
		Offset: 0x28B8
		Size: 0x1FC
		Parameters: 4
		Flags: Linked
	*/
	function play(str_shot, n_start_time, b_looping, params)
	{
		if(!isdefined(str_shot))
		{
			str_shot = "play";
		}
		if(!isdefined(b_looping))
		{
			b_looping = undefined;
		}
		flag::clear(#"ready");
		flag::clear(#"done");
		flag::clear(#"main_done");
		self notify(#"new_state");
		self endon(#"new_state");
		self notify(#"play");
		waittillframeend();
		[[ _o_scene ]]->function_7a1288f1(str_shot);
		self._str_shot = str_shot;
		self.var_55b4f21e = function_730a4c60(_str_shot);
		cscriptbundleobjectbase::error(!isdefined(var_55b4f21e), ("Shot struct is not defined for this object. Check and make sure that \"" + _str_shot) + "\" is a valid shot name for this scene bundle");
		if(isdefined(_n_clientnum))
		{
			play_per_client(_n_clientnum, n_start_time, b_looping, params);
		}
		else
		{
			for(clientnum = 1; clientnum < getmaxlocalclients(); clientnum++)
			{
				if(isdefined(function_5c10bd79(clientnum)))
				{
					thread play_per_client(clientnum, n_start_time, b_looping, params);
				}
			}
			play_per_client(0, n_start_time, b_looping, params);
		}
	}

	/*
		Name: finish
		Namespace: csceneobject
		Checksum: 0x718E8BA7
		Offset: 0x30B8
		Size: 0xF4
		Parameters: 2
		Flags: Linked
	*/
	function finish(b_clear, b_finished)
	{
		if(!isdefined(b_clear))
		{
			b_clear = 0;
		}
		if(!isdefined(b_finished))
		{
			b_finished = 0;
		}
		self notify(#"new_state");
		if(isdefined(_n_clientnum))
		{
			finish_per_client(_n_clientnum, b_clear, b_finished);
		}
		else
		{
			for(clientnum = 1; clientnum < getmaxlocalclients(); clientnum++)
			{
				if(isdefined(function_5c10bd79(clientnum)))
				{
					finish_per_client(clientnum, b_clear, b_finished);
				}
			}
			finish_per_client(0, b_clear, b_finished);
		}
	}

	/*
		Name: function_dc9b0249
		Namespace: csceneobject
		Checksum: 0x7233B034
		Offset: 0x23D0
		Size: 0x118
		Parameters: 2
		Flags: Linked
	*/
	function function_dc9b0249(n_shot, str_entry_type)
	{
		if(!isdefined(n_shot))
		{
			n_shot = 0;
		}
		if(isdefined(_s.shots[n_shot]) && isdefined(_s.shots[n_shot].entry))
		{
			foreach(s_entry in _s.shots[n_shot].entry)
			{
				if(isdefined(s_entry.(str_entry_type)))
				{
					entry = s_entry.(str_entry_type);
					break;
				}
			}
		}
		return entry;
	}

	/*
		Name: function_dd4f74e1
		Namespace: csceneobject
		Checksum: 0x771E20DC
		Offset: 0x2E60
		Size: 0x82
		Parameters: 1
		Flags: Linked
	*/
	function function_dd4f74e1(clientnum)
	{
		if(is_true(_s.firstframe) && _o_scene._str_mode == "init" && isdefined(_e_array[clientnum]))
		{
			self._b_first_frame = 1;
		}
		else
		{
			self._b_first_frame = 0;
		}
	}

	/*
		Name: _spawn
		Namespace: csceneobject
		Checksum: 0x8E28FB64
		Offset: 0x3920
		Size: 0x3CC
		Parameters: 2
		Flags: Linked
	*/
	function _spawn(clientnum, b_hide)
	{
		if(!isdefined(b_hide))
		{
			b_hide = 1;
		}
		restore_saved_ent(clientnum);
		if(!isdefined(_e_array[clientnum]))
		{
			b_allows_multiple = [[ scene() ]]->allows_multiple();
			self._e_array[clientnum] = scene::get_existing_ent(clientnum, _str_name);
			if(!isdefined(_e_array[clientnum]) && isdefined(_s.name) && !b_allows_multiple)
			{
				self._e_array[clientnum] = scene::get_existing_ent(clientnum, _s.name);
			}
			if(!isdefined(_e_array[clientnum]) && !is_true(_s.nospawn) && !_b_spawnonce_used && isdefined(_s.model))
			{
				_e_align = function_bc0facbb(clientnum).ent;
				self._e_array[clientnum] = util::spawn_anim_model(clientnum, _s.model, _e_align.origin, _e_align.angles);
				cscriptbundleobjectbase::error(!isdefined(_e_array[clientnum]), "util::spawn_anim_model returned undefined");
				if(_s.type === #"fakeplayer" || _s.type === #"player")
				{
					_e_array[clientnum] useanimtree("all_player");
					_e_array[clientnum].animtree = "all_player";
				}
				if(isdefined(_e_array[clientnum]))
				{
					if(b_hide && !is_true(_e_array[clientnum].var_463f8196))
					{
						_e_array[clientnum] hide();
					}
					_e_array[clientnum].scene_spawned = _o_scene._s.name;
				}
				else
				{
					cscriptbundleobjectbase::error(!is_true(_s.nospawn), "No entity exists with matching name of scene object.");
				}
			}
		}
		if(isdefined(_e_array[clientnum]))
		{
			[[ _o_scene ]]->assign_ent(self, _e_array[clientnum], clientnum);
			_prepare(clientnum);
		}
		flag::set(#"ready");
	}

	/*
		Name: function_ebbbd00d
		Namespace: csceneobject
		Checksum: 0x16ADF4E2
		Offset: 0x2F98
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
		if(!is_skipping_scene() && (isdefined(n_spacer_min) || isdefined(n_spacer_max)))
		{
			if(isdefined(n_spacer_min) && isdefined(n_spacer_max))
			{
				if(!cscriptbundleobjectbase::error(n_spacer_min >= n_spacer_max, "Spacer Min value must be less than Spacer Max value!"))
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
		Name: function_ec3fa8f5
		Namespace: csceneobject
		Checksum: 0x3C0A3DAD
		Offset: 0x5418
		Size: 0xBC
		Parameters: 0
		Flags: Linked
	*/
	function function_ec3fa8f5()
	{
		if(isarray(var_55b4f21e.entry))
		{
			foreach(s_entry in var_55b4f21e.entry)
			{
				if(s_entry.var_71bac06 === "cameraswitcher")
				{
					return true;
				}
			}
		}
		return false;
	}

	/*
		Name: _assign_unique_name
		Namespace: csceneobject
		Checksum: 0xA982AA4E
		Offset: 0x3790
		Size: 0x76
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
			self._str_name = (_o_scene._str_name + "_noname") + ([[ scene() ]]->get_object_id());
		}
	}

	/*
		Name: get_orig_name
		Namespace: csceneobject
		Checksum: 0xCF52C9D2
		Offset: 0x3828
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
		Checksum: 0x42B7A0D8
		Offset: 0x4280
		Size: 0x1F4
		Parameters: 1
		Flags: Linked
	*/
	function function_fda037ff(clientnum)
	{
		if(!isdefined(_e_array[clientnum]) || !isdefined(var_55b4f21e))
		{
			return;
		}
		if(is_true(var_55b4f21e.var_71ce74a1))
		{
			_e_array[clientnum] delete();
			return;
		}
		if(isdefined(var_55b4f21e.var_39fd697b))
		{
			a_ents = getentarray(clientnum, var_55b4f21e.var_39fd697b, "targetname");
			array::run_all(a_ents, &hide);
		}
		else if(isdefined(var_55b4f21e.var_4ceff7a6))
		{
			a_ents = getentarray(clientnum, var_55b4f21e.var_4ceff7a6, "targetname");
			array::run_all(a_ents, &show);
		}
		if(!is_true(_e_array[clientnum].var_463f8196))
		{
			if(is_true(var_55b4f21e.var_6d848d4b))
			{
				_e_array[clientnum] hide();
			}
			else if(is_true(var_55b4f21e.var_78089fee))
			{
				_e_array[clientnum] show();
			}
		}
	}

	/*
		Name: is_skipping_scene
		Namespace: csceneobject
		Checksum: 0xE2E21606
		Offset: 0x2618
		Size: 0x22
		Parameters: 0
		Flags: Linked
	*/
	function is_skipping_scene()
	{
		return is_true([[ _o_scene ]]->is_skipping_scene());
	}

}

class cscene : cscriptbundlebase
{
	var _a_objects;
	var _s;
	var _str_shot;
	var _str_name;
	var _e_root;
	var _a_active_shots;
	var _n_object_id;
	var var_2e9fdf35;
	var _str_mode;
	var var_b0ff34ce;
	var _testing;
	var skipping_scene;

	/*
		Name: constructor
		Namespace: cscene
		Checksum: 0x8703737E
		Offset: 0x60C8
		Size: 0x3A
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self._n_object_id = 0;
		self._str_mode = "";
		self._a_active_shots = [];
	}

	/*
		Name: destructor
		Namespace: cscene
		Checksum: 0xB8ADD6DF
		Offset: 0x6110
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16
	*/
	destructor()
	{
	}

	/*
		Name: wait_till_shot_ready
		Namespace: cscene
		Checksum: 0x89070B2A
		Offset: 0x84D8
		Size: 0x34
		Parameters: 0
		Flags: Linked
	*/
	function wait_till_shot_ready()
	{
		if(isdefined(_a_objects))
		{
			array::flag_wait(_a_objects, "ready");
		}
	}

	/*
		Name: get_ents
		Namespace: cscene
		Checksum: 0x695F11B
		Offset: 0x81E0
		Size: 0x17A
		Parameters: 0
		Flags: Linked
	*/
	function get_ents()
	{
		a_ents = [];
		for(clientnum = 0; clientnum < getmaxlocalclients(); clientnum++)
		{
			if(isdefined(function_5c10bd79(clientnum)))
			{
				a_ents[clientnum] = [];
				foreach(o_obj in _a_objects)
				{
					ent = [[ o_obj ]]->get_ent(clientnum);
					if(isdefined(o_obj._s.name))
					{
						a_ents[clientnum][o_obj._s.name] = ent;
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
					a_ents[a_ents.size] = ent;
				}
			}
		}
		return a_ents;
	}

	/*
		Name: function_1013fc5b
		Namespace: cscene
		Checksum: 0x8D6040FD
		Offset: 0x6CB8
		Size: 0x2E8
		Parameters: 0
		Flags: Linked
	*/
	function function_1013fc5b()
	{
		if(isstring(_s.cameraswitcher) || function_7a600918(_s.cameraswitcher))
		{
			a_players = getlocalplayers();
			foreach(player in a_players)
			{
				clientnum = player getlocalclientnumber();
				e_align = function_bc0facbb(clientnum).ent;
				v_pos = (isdefined(e_align.origin) ? e_align.origin : (0, 0, 0));
				v_ang = (isdefined(e_align.angles) ? e_align.angles : (0, 0, 0));
				playmaincamxcam(clientnum, _s.cameraswitcher, 0, "", "", v_pos, v_ang);
			}
			if(iscamanimlooping(_s.cameraswitcher))
			{
				self waittill(#"new_state");
			}
			else
			{
				n_cam_time = getcamanimtime(_s.cameraswitcher);
				self waittilltimeout(float(n_cam_time) / 1000, #"new_state");
			}
			a_players = getlocalplayers();
			foreach(player in a_players)
			{
				clientnum = player getlocalclientnumber();
				stopmaincamxcam(clientnum);
			}
		}
	}

	/*
		Name: function_13804c36
		Namespace: cscene
		Checksum: 0xBF647893
		Offset: 0x67B8
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
		Name: new_object
		Namespace: cscene
		Checksum: 0x6C0B1944
		Offset: 0x6130
		Size: 0x192
		Parameters: 1
		Flags: Linked
	*/
	function new_object(str_type)
	{
		switch(str_type)
		{
			case "prop":
			{
				return new csceneobject();
				break;
			}
			case "model":
			{
				return new csceneobject();
				break;
			}
			case "vehicle":
			{
				return new csceneobject();
				break;
			}
			case "actor":
			{
				return new csceneobject();
				break;
			}
			case "fakeactor":
			{
				return new csceneobject();
				break;
			}
			case "player":
			{
				return new csceneplayer();
				break;
			}
			case "sharedplayer":
			{
				return new csceneplayer();
				break;
			}
			case "fakeplayer":
			{
				return new csceneobject();
				break;
			}
			default:
			{
				cscriptbundlebase::error(0, ("Unsupported object type '" + str_type) + "'.");
			}
		}
	}

	/*
		Name: function_2ba44cd0
		Namespace: cscene
		Checksum: 0x5B2EB705
		Offset: 0x7868
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_2ba44cd0()
	{
		return _str_shot;
	}

	/*
		Name: initialize
		Namespace: cscene
		Checksum: 0x2BE3C5CE
		Offset: 0x6B40
		Size: 0x14C
		Parameters: 1
		Flags: Linked
	*/
	function initialize(b_playing)
	{
		if(!isdefined(b_playing))
		{
			b_playing = 0;
		}
		self notify(#"new_state");
		self endon(#"new_state");
		_s scene::function_585fb738();
		if(get_valid_objects().size > 0)
		{
			level flag::set(_str_name + "_initialized");
			self._str_mode = "init";
			foreach(o_obj in _a_objects)
			{
				thread [[ o_obj ]]->initialize();
			}
			if(!b_playing)
			{
				thread _call_state_funcs("init");
			}
		}
	}

	/*
		Name: get_valid_objects
		Namespace: cscene
		Checksum: 0x8768CC15
		Offset: 0x8548
		Size: 0xF2
		Parameters: 0
		Flags: Linked
	*/
	function get_valid_objects()
	{
		a_obj = [];
		foreach(obj in _a_objects)
		{
			if(obj._is_valid && !([[ obj ]]->in_a_different_scene()))
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
		Name: allows_multiple
		Namespace: cscene
		Checksum: 0xA868ADD3
		Offset: 0x8440
		Size: 0x8
		Parameters: 0
		Flags: Linked
	*/
	function allows_multiple()
	{
		return true;
	}

	/*
		Name: on_error
		Namespace: cscene
		Checksum: 0x5C269960
		Offset: 0x8648
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
		Checksum: 0x91DA3EB3
		Offset: 0x8368
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function get_root()
	{
		return _e_root;
	}

	/*
		Name: function_6a55f153
		Namespace: cscene
		Checksum: 0x60E85FEA
		Offset: 0x8518
		Size: 0x24
		Parameters: 0
		Flags: Linked
	*/
	function function_6a55f153()
	{
		array::flag_wait(_a_objects, "done");
	}

	/*
		Name: function_7a1288f1
		Namespace: cscene
		Checksum: 0x2CF3FE8
		Offset: 0x75E0
		Size: 0x110
		Parameters: 1
		Flags: Linked
	*/
	function function_7a1288f1(str_shot)
	{
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
		if(isarray(level.inactive_scenes[_str_name]))
		{
			arrayremovevalue(level.inactive_scenes[_str_name], _e_root);
			if(level.inactive_scenes[_str_name].size == 0)
			{
				level.inactive_scenes[_str_name] = undefined;
			}
		}
	}

	/*
		Name: is_looping
		Namespace: cscene
		Checksum: 0xD523913C
		Offset: 0x8450
		Size: 0x22
		Parameters: 0
		Flags: Linked
	*/
	function is_looping()
	{
		return is_true(_s.looping);
	}

	/*
		Name: stop
		Namespace: cscene
		Checksum: 0xC078584E
		Offset: 0x79D0
		Size: 0x35E
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
		self notify(#"new_state");
		level flag::clear(_str_name + "_playing");
		level flag::clear(_str_name + "_initialized");
		self._str_mode = "";
		thread _call_state_funcs("stop");
		self.scene_stopped = 1;
		foreach(o_obj in _a_objects)
		{
			if(isdefined(o_obj) && !([[ o_obj ]]->in_a_different_scene()))
			{
				thread [[ o_obj ]]->finish(b_clear, b_finished);
			}
		}
		self notify(#"stopped", {#is_finished:b_finished});
		if(isdefined(level.active_scenes[_str_name]))
		{
			arrayremovevalue(level.active_scenes[_str_name], _e_root);
			if(level.active_scenes[_str_name].size == 0)
			{
				level.active_scenes[_str_name] = undefined;
			}
		}
		if(isdefined(_e_root) && isdefined(_e_root.scenes))
		{
			arrayremovevalue(_e_root.scenes, self);
			if(_e_root.scenes.size == 0)
			{
				_e_root.scenes = undefined;
			}
			_e_root notify(#"scene_done", {#scenedef:_str_name});
			if(isdefined(_e_root.scene_played))
			{
				foreach(var_74f5d118 in _e_root.scene_played)
				{
					var_74f5d118 = 1;
				}
			}
		}
		self notify(#"scene_done", {#scenedef:_str_name});
	}

	/*
		Name: init
		Namespace: cscene
		Checksum: 0xB48D950C
		Offset: 0x62D0
		Size: 0x4DC
		Parameters: 5
		Flags: Linked
	*/
	function init(str_scenedef, s_scenedef, e_align, a_ents, b_test_run)
	{
		cscriptbundlebase::init(str_scenedef, s_scenedef, b_test_run);
		if(!isdefined(a_ents))
		{
			a_ents = [];
		}
		else if(!isarray(a_ents))
		{
			a_ents = array(a_ents);
		}
		if(!cscriptbundlebase::error(a_ents.size > _s.objects.size, "Trying to use more entities than scene supports."))
		{
			self._e_root = e_align;
			if(!isdefined(level.inactive_scenes))
			{
				level.inactive_scenes = [];
			}
			if(!isdefined(level.active_scenes[_str_name]))
			{
				level.active_scenes[_str_name] = [];
			}
			else if(!isarray(level.active_scenes[_str_name]))
			{
				level.active_scenes[_str_name] = array(level.active_scenes[_str_name]);
			}
			level.active_scenes[_str_name][level.active_scenes[_str_name].size] = _e_root;
			if(!isdefined(_e_root.scenes))
			{
				_e_root.scenes = [];
			}
			else if(!isarray(_e_root.scenes))
			{
				_e_root.scenes = array(_e_root.scenes);
			}
			_e_root.scenes[_e_root.scenes.size] = self;
			a_objs = get_valid_object_defs();
			foreach(var_8713eed1, e_ent in arraycopy(a_ents))
			{
				foreach(s_obj in arraycopy(a_objs))
				{
					if(s_obj.name === (isdefined(var_8713eed1) ? "" + var_8713eed1 : "") || function_13804c36(e_ent, s_obj.name))
					{
						cscriptbundlebase::add_object([[ [[ self ]]->new_object(s_obj.type) ]]->first_init(s_obj, self, e_ent, _e_root.localclientnum));
						arrayremoveindex(a_ents, var_8713eed1);
						arrayremoveindex(a_objs, i);
						break;
					}
				}
			}
			foreach(s_obj in a_objs)
			{
				cscriptbundlebase::add_object([[ [[ self ]]->new_object(s_obj.type) ]]->first_init(s_obj, self, array::pop(a_ents), _e_root.localclientnum));
			}
			self thread initialize();
		}
	}

	/*
		Name: play_endon
		Namespace: cscene
		Checksum: 0x7D80267F
		Offset: 0x74C0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function play_endon(var_a27f7ab4)
	{
		function_ea4a6812(_str_shot);
	}

	/*
		Name: has_init_state
		Namespace: cscene
		Checksum: 0xBC9B4ED1
		Offset: 0x7D38
		Size: 0xAA
		Parameters: 0
		Flags: Linked
	*/
	function has_init_state()
	{
		b_has_init_state = 0;
		foreach(o_scene_object in _a_objects)
		{
			if([[ o_scene_object ]]->has_init_state(_str_name))
			{
				b_has_init_state = 1;
				break;
			}
		}
		return b_has_init_state;
	}

	/*
		Name: get_valid_object_defs
		Namespace: cscene
		Checksum: 0x87C0B156
		Offset: 0x6998
		Size: 0x19A
		Parameters: 0
		Flags: Linked
	*/
	function get_valid_object_defs()
	{
		a_obj_defs = [];
		foreach(s_obj in _s.objects)
		{
			if(_s.vmtype === "client" || s_obj.vmtype === "client")
			{
				if(isdefined(s_obj.name) || isdefined(s_obj.model) || isdefined(s_obj.initanim) || isdefined(s_obj.mainanim))
				{
					if(!is_true(s_obj.disabled) && scene::function_6f382548(s_obj, _s.name))
					{
						if(!isdefined(a_obj_defs))
						{
							a_obj_defs = [];
						}
						else if(!isarray(a_obj_defs))
						{
							a_obj_defs = array(a_obj_defs);
						}
						a_obj_defs[a_obj_defs.size] = s_obj;
					}
				}
			}
		}
		return a_obj_defs;
	}

	/*
		Name: get_object_id
		Namespace: cscene
		Checksum: 0x643794EB
		Offset: 0x6C98
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
		Name: _call_state_funcs
		Namespace: cscene
		Checksum: 0x6A644C25
		Offset: 0x7DF0
		Size: 0x3E2
		Parameters: 1
		Flags: Linked
	*/
	function _call_state_funcs(str_state)
	{
		self endon(#"stopped");
		wait_till_shot_ready();
		if(str_state == "play")
		{
			waittillframeend();
		}
		level notify((_str_name + "_") + str_state);
		if(isdefined(level.scene_funcs) && isdefined(level.scene_funcs[_str_name]) && isdefined(level.scene_funcs[_str_name][str_state]))
		{
			a_all_ents = get_ents();
			foreach(clientnum, a_ents in a_all_ents)
			{
				foreach(handler in level.scene_funcs[_str_name][str_state])
				{
					func = handler[0];
					args = handler[1];
					switch(args.size)
					{
						case 6:
						{
							_e_root thread [[func]](clientnum, a_ents, args[0], args[1], args[2], args[3], args[4], args[5]);
							break;
						}
						case 5:
						{
							_e_root thread [[func]](clientnum, a_ents, args[0], args[1], args[2], args[3], args[4]);
							break;
						}
						case 4:
						{
							_e_root thread [[func]](clientnum, a_ents, args[0], args[1], args[2], args[3]);
							break;
						}
						case 3:
						{
							_e_root thread [[func]](clientnum, a_ents, args[0], args[1], args[2]);
							break;
						}
						case 2:
						{
							_e_root thread [[func]](clientnum, a_ents, args[0], args[1]);
							break;
						}
						case 1:
						{
							_e_root thread [[func]](clientnum, a_ents, args[0]);
							break;
						}
						case 0:
						{
							_e_root thread [[func]](clientnum, a_ents);
							break;
						}
						default:
						{
							/#
								assertmsg("");
							#/
						}
					}
				}
			}
		}
	}

	/*
		Name: function_bc0facbb
		Namespace: cscene
		Checksum: 0x4FE4DFE3
		Offset: 0x8380
		Size: 0xB4
		Parameters: 1
		Flags: Linked
	*/
	function function_bc0facbb(clientnum)
	{
		e_align = _e_root;
		if(isdefined(_s.aligntarget))
		{
			e_gdt_align = scene::get_existing_ent(clientnum, _s.aligntarget);
			if(isdefined(e_gdt_align))
			{
				e_align = e_gdt_align;
			}
			var_139e0bfc = _s.aligntargettag;
		}
		return {#tag:var_139e0bfc, #ent:e_align};
	}

	/*
		Name: function_c9f40212
		Namespace: cscene
		Checksum: 0x9A3D4669
		Offset: 0x7880
		Size: 0x144
		Parameters: 0
		Flags: Linked
	*/
	function function_c9f40212()
	{
		if(_s.scenetype === "scene")
		{
			if(isdefined(var_2e9fdf35))
			{
				var_1a15e649 = var_2e9fdf35;
				self.var_2e9fdf35 = undefined;
				return var_1a15e649;
			}
			a_shots = scene::get_all_shot_names(_str_name, _e_root);
			foreach(i, str_shot in a_shots)
			{
				if(str_shot === _a_active_shots[0] && isdefined(a_shots[i + 1]))
				{
					return a_shots[i + 1];
				}
			}
		}
		else
		{
		}
	}

	/*
		Name: play
		Namespace: cscene
		Checksum: 0x221D60D9
		Offset: 0x6FA8
		Size: 0x50C
		Parameters: 5
		Flags: Linked
	*/
	function play(str_shot, b_testing, str_mode, b_looping, params)
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
		if(!isdefined(b_looping))
		{
			b_looping = undefined;
		}
		level endon(#"demo_jump");
		self notify(str_shot + "start");
		self endoncallback(&play_endon, str_shot + "start", #"new_state");
		if(issubstr(str_mode, "play_from_time"))
		{
			args = strtok(str_mode, ":");
			if(isdefined(args[1]))
			{
				var_79584e08 = float(args[1]);
			}
		}
		self._testing = b_testing;
		self._str_mode = str_mode;
		self._str_shot = str_shot;
		if(get_valid_objects().size > 0)
		{
			foreach(o_obj in _a_objects)
			{
				thread [[ o_obj ]]->play(str_shot, var_79584e08, b_looping, params);
			}
			self.n_start_time = undefined;
			level flag::set(_str_name + "_playing");
			if(!scene::function_6a0b0afe(_str_mode))
			{
				self._str_mode = "play";
			}
			wait_till_shot_ready();
			function_7a1288f1(str_shot);
			thread function_1013fc5b();
			thread _call_state_funcs(str_shot);
			function_6a55f153();
			array::function_d77ef691(_a_objects, "done", "main_done");
			if(scene::function_b260bdcc(_str_name, str_shot))
			{
				if(isdefined(_e_root))
				{
					_e_root notify(#"scene_done", {#scenedef:_str_name});
				}
				thread _call_state_funcs("done");
				self.var_b0ff34ce = 1;
			}
			if(is_looping() || _str_mode == "loop" && is_true(var_b0ff34ce))
			{
				self.var_b0ff34ce = undefined;
				if(has_init_state())
				{
					level flag::clear(_str_name + "_playing");
					thread initialize();
				}
				else
				{
					level flag::clear(_str_name + "_initialized");
					var_689ecfec = scene::function_de6a7579(_str_name, str_mode, _e_root);
					thread play(var_689ecfec, b_testing, str_mode, 1);
				}
			}
			else
			{
				if(!scene::function_6a0b0afe(_str_mode))
				{
					thread run_next(str_shot);
				}
				else
				{
					thread stop(0, 1);
				}
			}
		}
		else
		{
			thread stop(0, 1);
		}
		function_ea4a6812(str_shot);
	}

	/*
		Name: run_next
		Namespace: cscene
		Checksum: 0x3FA273B9
		Offset: 0x74F0
		Size: 0xE4
		Parameters: 1
		Flags: Linked
	*/
	function run_next(str_current_shot)
	{
		var_1a15e649 = function_c9f40212();
		function_ea4a6812(str_current_shot);
		if(isdefined(var_1a15e649))
		{
			switch(_s.scenetype)
			{
				case "scene":
				{
					thread [[ self ]]->play(var_1a15e649, _testing, _str_mode);
					break;
				}
				default:
				{
					thread [[ self ]]->play(var_1a15e649, _testing, _str_mode);
				}
			}
		}
		else
		{
			thread stop(0, 1);
		}
	}

	/*
		Name: function_ea4a6812
		Namespace: cscene
		Checksum: 0x11BF69E7
		Offset: 0x76F8
		Size: 0x164
		Parameters: 1
		Flags: Linked
	*/
	function function_ea4a6812(str_shot)
	{
		arrayremovevalue(_a_active_shots, str_shot);
		if(_a_active_shots.size == 0)
		{
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
		}
	}

	/*
		Name: assign_ent
		Namespace: cscene
		Checksum: 0x9CA61CA1
		Offset: 0x68F8
		Size: 0x96
		Parameters: 3
		Flags: Linked
	*/
	function assign_ent(o_obj, ent, clientnum)
	{
		if(!isdefined(_e_root.scene_ents))
		{
			_e_root.scene_ents = [];
		}
		if(!isdefined(_e_root.scene_ents[clientnum]))
		{
			_e_root.scene_ents[clientnum] = [];
		}
		_e_root.scene_ents[clientnum][o_obj._str_name] = ent;
	}

	/*
		Name: is_skipping_scene
		Namespace: cscene
		Checksum: 0x27FE9154
		Offset: 0x8480
		Size: 0x4A
		Parameters: 0
		Flags: Linked
	*/
	function is_skipping_scene()
	{
		return is_true(skipping_scene) || _str_mode == "skip_scene" || _str_mode == "skip_scene_player";
	}

}

#namespace scene;

/*
	Name: player_scene_animation_skip
	Namespace: scene
	Checksum: 0xB98745E7
	Offset: 0x6F0
	Size: 0x11C
	Parameters: 7
	Flags: Linked
*/
function player_scene_animation_skip(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	anim_name = self getcurrentanimscriptedname();
	if(isdefined(anim_name) && anim_name != "")
	{
		if(!isanimlooping(bwastimejump, anim_name))
		{
			/#
				if(getdvarint(#"debug_scene_skip", 0) > 0)
				{
					printtoprightln((("" + anim_name) + "") + gettime(), vectorscale((1, 1, 1), 0.6));
				}
			#/
			self setanimtimebyname(anim_name, 1, 1);
		}
	}
}

/*
	Name: player_scene_skip_completed
	Namespace: scene
	Checksum: 0xD4B798EC
	Offset: 0x818
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function player_scene_skip_completed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	flushsubtitles(bwastimejump);
	setdvar(#"r_graphiccontentblur", 0);
	setdvar(#"r_makedark_enable", 0);
}

/*
	Name: get_existing_ent
	Namespace: scene
	Checksum: 0x97E1B9AC
	Offset: 0x8E70
	Size: 0xBA
	Parameters: 2
	Flags: Linked
*/
function get_existing_ent(clientnum, str_name)
{
	e = getent(clientnum, str_name, "animname");
	if(!isdefined(e))
	{
		e = getent(clientnum, str_name, "script_animname");
		if(!isdefined(e))
		{
			e = getent(clientnum, str_name, "targetname");
			if(!isdefined(e))
			{
				e = struct::get(str_name, "targetname");
			}
		}
	}
	return e;
}

/*
	Name: function_89f2df9
	Namespace: scene
	Checksum: 0x67536861
	Offset: 0x8F38
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"scene", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: scene
	Checksum: 0x59250D37
	Offset: 0x8F90
	Size: 0x5A4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.scenedefs = getscriptbundlenames("scene");
	level.active_scenes = [];
	level.var_1e798f4c = [];
	cp_skip_scene_menu::register();
	level.server_scenes = [];
	foreach(str_scenename in level.scenedefs)
	{
		s_scenedef = getscriptbundle(str_scenename);
		if(s_scenedef.vmtype === "server")
		{
			continue;
		}
		s_scenedef.editaction = undefined;
		s_scenedef.newobject = undefined;
		if(s_scenedef is_igc())
		{
			level.server_scenes[s_scenedef.name] = s_scenedef;
			continue;
		}
		if(s_scenedef.vmtype === "both")
		{
			n_clientbits = 3;
			clientfield::register("world", s_scenedef.name, 1, n_clientbits, "int", &cf_server_sync, 0, 0);
		}
	}
	switch(currentsessionmode())
	{
		case 2:
		{
			var_a093876d = 1;
			break;
		}
		case 1:
		{
			var_a093876d = 24;
			break;
		}
		case 0:
		{
			var_a093876d = 4;
			break;
		}
		case 3:
		{
			var_a093876d = 40;
			break;
		}
		default:
		{
			var_a093876d = 24;
			break;
		}
	}
	if(util::function_3f165ee8())
	{
		var_a093876d = 24;
	}
	var_a093876d = int(min(32, var_a093876d));
	clientfield::register("toplayer", "postfx_igc", 1, 2, "counter", &postfx_igc, 0, 0);
	clientfield::register("world", "in_igc", 1, var_a093876d, "int", &in_igc, 0, 0);
	clientfield::register("toplayer", "postfx_cateye", 1, 1, "int", &postfx_cateye, 0, 0);
	clientfield::register("toplayer", "player_scene_skip_completed", 1, 2, "counter", &player_scene_skip_completed, 0, 0);
	clientfield::register("toplayer", "player_pbg_bank_scene_system", 1, getminbitcountfornum(3), "int", &player_pbg_bank_scene_system, 0, 0);
	clientfield::register("allplayers", "player_scene_animation_skip", 1, 2, "counter", &player_scene_animation_skip, 0, 0);
	clientfield::register("actor", "player_scene_animation_skip", 1, 2, "counter", &player_scene_animation_skip, 0, 0);
	clientfield::register("vehicle", "player_scene_animation_skip", 1, 2, "counter", &player_scene_animation_skip, 0, 0);
	clientfield::register("scriptmover", "player_scene_animation_skip", 1, 2, "counter", &player_scene_animation_skip, 0, 0);
	if(sessionmodeiscampaigngame())
	{
		level.interactive_shot = interactive_shot::register();
	}
	callback::on_localclient_shutdown(&on_localplayer_shutdown);
}

/*
	Name: player_pbg_bank_scene_system
	Namespace: scene
	Checksum: 0xE616396C
	Offset: 0x9540
	Size: 0x112
	Parameters: 7
	Flags: Linked
*/
function player_pbg_bank_scene_system(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 0:
		{
			setpbgactivebank(fieldname, 1);
			break;
		}
		case 1:
		{
			setpbgactivebank(fieldname, 2);
			break;
		}
		case 2:
		{
			setpbgactivebank(fieldname, 4);
			break;
		}
		case 3:
		{
			setpbgactivebank(fieldname, 8);
			break;
		}
	}
}

/*
	Name: in_igc
	Namespace: scene
	Checksum: 0xCAABA22
	Offset: 0x9660
	Size: 0x234
	Parameters: 7
	Flags: Linked
*/
function in_igc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	player = function_5c10bd79(fieldname);
	n_entnum = player getentitynumber();
	b_igc_active = 0;
	if(bwastimejump & (1 << n_entnum))
	{
		b_igc_active = 1;
	}
	if(b_igc_active)
	{
		flushsubtitles(fieldname);
	}
	igcactive(fieldname, b_igc_active);
	level notify(#"igc_activated", {#b_active:b_igc_active});
	if(isarray(level.var_25e5c959))
	{
		foreach(var_ed8205c6 in level.var_25e5c959)
		{
			a_players = getplayers(fieldname);
			foreach(player in a_players)
			{
				if(isdefined(player))
				{
					player thread [[var_ed8205c6]](fieldname, b_igc_active);
				}
			}
		}
	}
	/#
	#/
}

/*
	Name: function_2e58158b
	Namespace: scene
	Checksum: 0xACB4F915
	Offset: 0x98A0
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_2e58158b(func_igc)
{
	if(!isdefined(level.var_25e5c959))
	{
		level.var_25e5c959 = [];
	}
	else if(!isarray(level.var_25e5c959))
	{
		level.var_25e5c959 = array(level.var_25e5c959);
	}
	level.var_25e5c959[level.var_25e5c959.size] = func_igc;
}

/*
	Name: function_e78401d1
	Namespace: scene
	Checksum: 0xDAACFF27
	Offset: 0x9930
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_e78401d1(func_igc)
{
	arrayremovevalue(level.var_25e5c959, func_igc);
}

/*
	Name: function_f9036ea7
	Namespace: scene
	Checksum: 0x23F4482C
	Offset: 0x9968
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_f9036ea7(b_enable)
{
	if(!sessionmodeiscampaigngame())
	{
		return;
	}
	if(b_enable)
	{
		if(!is_true(self.var_c7329df1))
		{
			self.var_c7329df1 = 1;
			self postfx::playpostfxbundle("pstfx_catseye_cinematic");
		}
	}
	else if(is_true(self.var_c7329df1))
	{
		self.var_c7329df1 = undefined;
		self postfx::stoppostfxbundle("pstfx_catseye_cinematic");
	}
}

/*
	Name: postfx_cateye
	Namespace: scene
	Checksum: 0x975191B8
	Offset: 0x9A28
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function postfx_cateye(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	player = function_5c10bd79(fieldname);
	level notify(#"sndlevelstartduck_shutoff");
	if(bwastimejump)
	{
		player function_f9036ea7(1);
	}
	else
	{
		player function_f9036ea7(0);
	}
}

/*
	Name: on_localplayer_shutdown
	Namespace: scene
	Checksum: 0xD75DC868
	Offset: 0x9AE8
	Size: 0x82
	Parameters: 1
	Flags: Linked, Private
*/
function private on_localplayer_shutdown(localclientnum)
{
	localplayer = self;
	codelocalplayer = function_5c10bd79(localclientnum);
	if(isdefined(localplayer) && isplayer(localplayer))
	{
		if(isdefined(codelocalplayer))
		{
			if(localplayer == codelocalplayer)
			{
				localplayer.postfx_igc_on = undefined;
				localplayer.pstfx_world_construction = 0;
			}
		}
	}
}

/*
	Name: postfx_igc
	Namespace: scene
	Checksum: 0x8A11363C
	Offset: 0x9B78
	Size: 0x6D6
	Parameters: 7
	Flags: Linked
*/
function postfx_igc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(is_true(self.postfx_igc_on))
	{
		return;
	}
	if(sessionmodeiszombiesgame())
	{
		postfx_igc_zombies(localclientnum);
		return;
	}
	if(newval == 3)
	{
		self thread postfx_igc_short(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
		return;
	}
	self.postfx_igc_on = 1;
	codeimagename = "postfx_igc_image" + localclientnum;
	createscenecodeimage(localclientnum, codeimagename);
	captureframe(localclientnum, codeimagename);
	n_hex = 0;
	b_streamer_wait = 1;
	i = 0;
	while(i < 2000)
	{
		st = float(i) / 1000;
		if(b_streamer_wait && st >= 0.65)
		{
			n_streamer_time_total = 0;
			while(!isstreamerready() && n_streamer_time_total < 5000)
			{
				n_streamer_time = gettime();
				j = int(0.65 * 1000);
				while(j < 1150)
				{
					jt = float(j) / 1000;
					waitframe(1);
					j = j + (int(0.016 * 1000));
				}
				j = int(1.15 * 1000);
				while(j < 650)
				{
					jt = float(j) / 1000;
					waitframe(1);
					j = j - (int(0.016 * 1000));
				}
				n_streamer_time_total = n_streamer_time_total + (gettime() - n_streamer_time);
			}
			b_streamer_wait = 0;
		}
		if(st <= 0.5)
		{
		}
		else if(st > 0.5 && st <= 0.85)
		{
		}
		if(newval == 2)
		{
			else
			{
			}
			if(st > 1 && !is_true(self.pstfx_world_construction))
			{
				self thread postfx::playpostfxbundle(#"pstfx_world_construction");
				self.pstfx_world_construction = 1;
			}
		}
		if(st > 0.5 && st <= 1)
		{
			n_hex = mapfloat(0.5, 1, 0, 1, st);
		}
		else if(st > 1 && st < 1.5)
		{
		}
		if(st > 0.65 && st <= 1.15)
		{
			else
			{
			}
		}
		else if(st > 1.21 && st < 1.5)
		{
		}
		if(st > 1.21 && st <= 1.5)
		{
			else
			{
			}
		}
		else
		{
		}
		if(st > 1 && st <= 1.45)
		{
		}
		else
		{
			if(st > 1.45 && st < 1.75)
			{
			}
			else
			{
			}
		}
		if(st >= 1.75)
		{
			val = 1 - mapfloat(1.75, 2, 0, 1, st);
		}
		if(st >= 1.25)
		{
			val = 1 - mapfloat(1.25, 1.75, 0, 1, st);
		}
		if(st > 1)
		{
			outer_radii = mapfloat(1, 1.5, 0, 2000, st);
		}
		if(st > 1.15 && st < 1.85)
		{
		}
		else
		{
		}
		waitframe(1);
		i = i + (int(0.016 * 1000));
	}
	self.pstfx_world_construction = 0;
	freecodeimage(localclientnum, codeimagename);
	self.postfx_igc_on = undefined;
}

/*
	Name: postfx_igc_zombies
	Namespace: scene
	Checksum: 0x9CC3C9C9
	Offset: 0xA258
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function postfx_igc_zombies(localclientnum)
{
	level lui::screen_fade_out(localclientnum, 0, "black");
	waitframe(1);
	level lui::screen_fade_in(localclientnum, 0.3);
	self.postfx_igc_on = undefined;
}

/*
	Name: postfx_igc_short
	Namespace: scene
	Checksum: 0xFA1E5457
	Offset: 0xA2C8
	Size: 0x196
	Parameters: 7
	Flags: Linked
*/
function postfx_igc_short(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self.postfx_igc_on = 1;
	codeimagename = "postfx_igc_image" + bwastimejump;
	createscenecodeimage(bwastimejump, codeimagename);
	captureframe(bwastimejump, codeimagename);
	b_streamer_wait = 1;
	i = 0;
	while(i < 850)
	{
		st = float(i) / 1000;
		if(st <= 0.5)
		{
		}
		else if(st > 0.5 && st <= 0.85)
		{
		}
		waitframe(1);
		i = i + (int(0.016 * 1000));
	}
	freecodeimage(bwastimejump, codeimagename);
	self.postfx_igc_on = undefined;
}

/*
	Name: cf_server_sync
	Namespace: scene
	Checksum: 0x4A53D25A
	Offset: 0xA468
	Size: 0x1CA
	Parameters: 7
	Flags: Linked
*/
function cf_server_sync(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(fieldname)
	{
		case 0:
		{
			if(is_active(bwastimejump))
			{
				level thread stop(bwastimejump);
			}
			break;
		}
		case 1:
		{
			level thread init(bwastimejump);
			break;
		}
		case 2:
		{
			level thread play(bwastimejump);
			break;
		}
	}
	/#
		switch(fieldname)
		{
			case 3:
			{
				if(is_active(bwastimejump))
				{
					level thread stop(bwastimejump, 1, undefined, undefined, 1);
				}
				break;
			}
			case 4:
			{
				level thread init(bwastimejump, undefined, undefined, 1);
				break;
			}
			case 5:
			{
				level thread play(bwastimejump, undefined, undefined, 1);
				break;
			}
		}
	#/
}

/*
	Name: remove_invalid_scene_objects
	Namespace: scene
	Checksum: 0x944C18DF
	Offset: 0xA640
	Size: 0x150
	Parameters: 1
	Flags: None
*/
function remove_invalid_scene_objects(s_scenedef)
{
	a_invalid_object_indexes = [];
	if(isdefined(s_scenedef.objects))
	{
		foreach(s_object in s_scenedef.objects)
		{
			if(!isdefined(s_object.name) && !isdefined(s_object.model))
			{
				if(!isdefined(a_invalid_object_indexes))
				{
					a_invalid_object_indexes = [];
				}
				else if(!isarray(a_invalid_object_indexes))
				{
					a_invalid_object_indexes = array(a_invalid_object_indexes);
				}
				a_invalid_object_indexes[a_invalid_object_indexes.size] = i;
			}
		}
	}
	for(i = a_invalid_object_indexes.size - 1; i >= 0; i--)
	{
		arrayremoveindex(s_scenedef.objects, a_invalid_object_indexes[i]);
	}
	return s_scenedef;
}

/*
	Name: function_585fb738
	Namespace: scene
	Checksum: 0x997CB70D
	Offset: 0xA798
	Size: 0xCE
	Parameters: 2
	Flags: Linked
*/
function function_585fb738(str_scene, var_79fe29db)
{
	if(isdefined(str_scene))
	{
		s_bundle = getscriptbundle(str_scene);
	}
	else
	{
		s_bundle = self;
		str_scene = s_bundle.name;
	}
	if(is_true(s_bundle.igc))
	{
		return;
	}
	if(function_7aa3d2c6(str_scene) || get_player_count(str_scene) || is_true(var_79fe29db))
	{
		s_bundle.igc = 1;
	}
}

/*
	Name: is_igc
	Namespace: scene
	Checksum: 0xCC813A1E
	Offset: 0xA870
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function is_igc()
{
	return is_true(self.igc);
}

/*
	Name: function_9503138e
	Namespace: scene
	Checksum: 0x70570588
	Offset: 0xA898
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function function_9503138e(object)
{
	if(!isdefined(object))
	{
		object = self;
	}
	if(object.classname === "scriptbundle_scene")
	{
		return true;
	}
	if(object.classname === "scriptbundle_fxanim")
	{
		return true;
	}
	if(object.variantname === "smart_object")
	{
		return true;
	}
	return false;
}

/*
	Name: function_6a0b0afe
	Namespace: scene
	Checksum: 0xD27801C
	Offset: 0xA910
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_6a0b0afe(str_mode)
{
	if(issubstr(str_mode, "single"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_8ac3bea9
	Namespace: scene
	Checksum: 0x3C2F6F8F
	Offset: 0xA950
	Size: 0x538
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	util::waitforallclients();
	if(isdefined(level.disablefxaniminsplitscreencount))
	{
		if(isdefined(level.localplayers))
		{
			if(level.localplayers.size >= level.disablefxaniminsplitscreencount)
			{
				return;
			}
		}
	}
	a_instances = arraycombine(struct::get_array("scriptbundle_scene", "classname"), struct::get_array("scriptbundle_fxanim", "classname"), 0, 0);
	a_instances = arraycombine(a_instances, struct::get_array("smart_object", "variantname"), 0, 0);
	foreach(s_instance in a_instances)
	{
		s_scenedef = getscriptbundle(s_instance.scriptbundlename);
		if(s_scenedef.vmtype !== "client")
		{
			continue;
		}
		if(isdefined(s_instance.scriptgroup_initscenes))
		{
			trigs = getentarray(0, s_instance.scriptgroup_initscenes, "scriptgroup_initscenes");
			if(isdefined(trigs))
			{
				foreach(trig in trigs)
				{
					s_instance thread _trigger_init(trig);
				}
			}
		}
		if(isdefined(s_instance.scriptgroup_playscenes))
		{
			trigs = getentarray(0, s_instance.scriptgroup_playscenes, "scriptgroup_playscenes");
			if(isdefined(trigs))
			{
				foreach(trig in trigs)
				{
					s_instance thread _trigger_play(trig);
				}
			}
		}
		if(isdefined(s_instance.scriptgroup_stopscenes))
		{
			trigs = getentarray(0, s_instance.scriptgroup_stopscenes, "scriptgroup_stopscenes");
			if(isdefined(trigs))
			{
				foreach(trig in trigs)
				{
					s_instance thread _trigger_stop(trig);
				}
			}
		}
	}
	foreach(s_instance in a_instances)
	{
		s_scenedef = get_scenedef(s_instance.scriptbundlename);
		/#
			assert(isdefined(s_scenedef), ((("" + s_instance.origin) + "") + s_instance.scriptbundlename) + "");
		#/
		if(s_scenedef.vmtype === "client")
		{
			if(isdefined(s_instance.spawnflags) && (s_instance.spawnflags & 2) == 2)
			{
				s_instance thread play();
				continue;
			}
			if(isdefined(s_instance.spawnflags) && (s_instance.spawnflags & 1) == 1)
			{
				s_instance thread init();
			}
		}
	}
}

/*
	Name: _trigger_init
	Namespace: scene
	Checksum: 0x3C31E2EA
	Offset: 0xAE90
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function _trigger_init(trig)
{
	trig endon(#"death");
	var_be17187b = undefined;
	var_be17187b = trig waittill(#"trigger");
	a_ents = [];
	if(get_player_count(self.scriptbundlename) > 0)
	{
		if(isplayer(var_be17187b.activator))
		{
			a_ents[0] = var_be17187b.activator;
		}
	}
	self thread init(a_ents);
}

/*
	Name: _trigger_play
	Namespace: scene
	Checksum: 0xBB2D72C2
	Offset: 0xAF50
	Size: 0xE6
	Parameters: 1
	Flags: Linked
*/
function _trigger_play(trig)
{
	trig endon(#"death");
	do
	{
		var_be17187b = undefined;
		var_be17187b = trig waittill(#"trigger");
		a_ents = [];
		if(get_player_count(self.scriptbundlename) > 0)
		{
			if(isplayer(var_be17187b.activator))
			{
				a_ents[0] = var_be17187b.activator;
			}
		}
		self thread play(a_ents);
	}
	while(is_true(get_scenedef(self.scriptbundlename).looping));
}

/*
	Name: _trigger_stop
	Namespace: scene
	Checksum: 0xE66F8C02
	Offset: 0xB040
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function _trigger_stop(trig)
{
	trig endon(#"death");
	trig waittill(#"trigger");
	self thread stop();
}

/*
	Name: add_scene_func
	Namespace: scene
	Checksum: 0xCEA1673A
	Offset: 0xB0A0
	Size: 0x174
	Parameters: 4
	Flags: Linked, Variadic
*/
function add_scene_func(str_scenedef, func, var_e21c4c4c, ...)
{
	if(!isdefined(var_e21c4c4c))
	{
		var_e21c4c4c = "play";
	}
	/#
		/#
			assert(isdefined(getscriptbundle(str_scenedef)), ("" + function_9e72a96(str_scenedef)) + "");
		#/
	#/
	var_e21c4c4c = tolower(var_e21c4c4c);
	if(!isdefined(level.scene_funcs))
	{
		level.scene_funcs = [];
	}
	if(!isdefined(level.scene_funcs[str_scenedef]))
	{
		level.scene_funcs[str_scenedef] = [];
	}
	str_shot = function_c776e5bd(str_scenedef, var_e21c4c4c);
	if(!isdefined(level.scene_funcs[str_scenedef][str_shot]))
	{
		level.scene_funcs[str_scenedef][str_shot] = [];
	}
	array::add(level.scene_funcs[str_scenedef][str_shot], array(func, vararg), 0);
}

/*
	Name: remove_scene_func
	Namespace: scene
	Checksum: 0xFEACA4BA
	Offset: 0xB220
	Size: 0x17C
	Parameters: 3
	Flags: None
*/
function remove_scene_func(str_scenedef, func, var_e21c4c4c)
{
	if(!isdefined(var_e21c4c4c))
	{
		var_e21c4c4c = "play";
	}
	/#
		/#
			assert(isdefined(getscriptbundle(str_scenedef)), ("" + str_scenedef) + "");
		#/
	#/
	var_e21c4c4c = tolower(var_e21c4c4c);
	if(!isdefined(level.scene_funcs))
	{
		level.scene_funcs = [];
	}
	str_shot = function_c776e5bd(str_scenedef, var_e21c4c4c);
	if(isdefined(level.scene_funcs[str_scenedef]) && isdefined(level.scene_funcs[str_scenedef][str_shot]))
	{
		for(i = level.scene_funcs[str_scenedef][str_shot].size - 1; i >= 0; i--)
		{
			if(level.scene_funcs[str_scenedef][str_shot][i][0] == func)
			{
				arrayremoveindex(level.scene_funcs[str_scenedef][str_shot], i);
			}
		}
	}
}

/*
	Name: function_c776e5bd
	Namespace: scene
	Checksum: 0x1411BDB
	Offset: 0xB3A8
	Size: 0x92
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c776e5bd(str_scenedef, str_state)
{
	str_shot = str_state;
	if(str_state == "init")
	{
		str_shot = function_de6a7579(str_scenedef, "init");
	}
	else if(str_state == "play")
	{
		str_shot = function_de6a7579(str_scenedef, "play");
	}
	return str_shot;
}

/*
	Name: spawn
	Namespace: scene
	Checksum: 0x6594C940
	Offset: 0xB448
	Size: 0x168
	Parameters: 5
	Flags: None
*/
function spawn(arg1, arg2, arg3, arg4, b_test_run)
{
	str_scenedef = arg1;
	/#
		assert(isdefined(str_scenedef), "");
	#/
	if(isvec(arg2))
	{
		v_origin = arg2;
		v_angles = arg3;
		a_ents = arg4;
	}
	else
	{
		a_ents = arg2;
		v_origin = arg3;
		v_angles = arg4;
	}
	s_instance = spawnstruct();
	s_instance.origin = (isdefined(v_origin) ? v_origin : (0, 0, 0));
	s_instance.angles = (isdefined(v_angles) ? v_angles : (0, 0, 0));
	s_instance.classname = "scriptbundle_scene";
	s_instance.scriptbundlename = str_scenedef;
	struct::init(s_instance);
	s_instance init(str_scenedef, a_ents, undefined, b_test_run);
	return s_instance;
}

/*
	Name: init
	Namespace: scene
	Checksum: 0xB725A9C1
	Offset: 0xB5B8
	Size: 0x4C
	Parameters: 4
	Flags: Linked
*/
function init(arg1, arg2, arg3, b_test_run)
{
	self thread play(arg1, arg2, arg3, b_test_run, "init");
}

/*
	Name: get_scenedef
	Namespace: scene
	Checksum: 0x59EF6861
	Offset: 0xB610
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function get_scenedef(str_scenedef)
{
	s_scriptbundle = getscriptbundle(str_scenedef);
	/#
		/#
			assert(isdefined(s_scriptbundle) && isdefined(s_scriptbundle.objects), ("" + function_9e72a96(str_scenedef)) + "");
		#/
	#/
	return s_scriptbundle;
}

/*
	Name: get_scenedefs
	Namespace: scene
	Checksum: 0xE97DC2F4
	Offset: 0xB6A0
	Size: 0x13A
	Parameters: 1
	Flags: None
*/
function get_scenedefs(str_type)
{
	if(!isdefined(str_type))
	{
		str_type = "scene";
	}
	a_scenedefs = [];
	foreach(str_scenedef in level.scenedefs)
	{
		s_scenedef = getscriptbundle(str_scenedef);
		if(s_scenedef.scenetype === str_type && s_scenedef.vmtype === "client")
		{
			if(!isdefined(a_scenedefs))
			{
				a_scenedefs = [];
			}
			else if(!isarray(a_scenedefs))
			{
				a_scenedefs = array(a_scenedefs);
			}
			a_scenedefs[a_scenedefs.size] = s_scenedef;
		}
	}
	return a_scenedefs;
}

/*
	Name: function_8d8ec9b5
	Namespace: scene
	Checksum: 0xFB005F63
	Offset: 0xB7E8
	Size: 0xA2
	Parameters: 3
	Flags: None
*/
function function_8d8ec9b5(str_scenedef, var_b5d05f70, s_instance)
{
	if(isdefined(s_instance))
	{
		s_instance.var_b5d05f70 = var_b5d05f70;
		s_instance.var_418c40ac = var_b5d05f70[var_b5d05f70.size - 1];
	}
	else
	{
		s_scenedef = get_scenedef(str_scenedef);
		s_scenedef.var_b5d05f70 = var_b5d05f70;
		level.var_1e798f4c[str_scenedef] = var_b5d05f70;
		s_scenedef.var_418c40ac = var_b5d05f70[var_b5d05f70.size - 1];
	}
}

/*
	Name: get_all_shot_names
	Namespace: scene
	Checksum: 0x127BB112
	Offset: 0xB898
	Size: 0x328
	Parameters: 3
	Flags: Linked
*/
function get_all_shot_names(str_scenedef, s_instance, var_8c4d2266)
{
	if(!isdefined(var_8c4d2266))
	{
		var_8c4d2266 = 0;
	}
	if(isdefined(s_instance) && isdefined(s_instance.var_b5d05f70))
	{
		a_shots = s_instance.var_b5d05f70;
		if(var_8c4d2266)
		{
			arrayremovevalue(a_shots, "init");
		}
		return a_shots;
	}
	if(isdefined(level.var_1e798f4c) && isdefined(level.var_1e798f4c[str_scenedef]))
	{
		a_shots = level.var_1e798f4c[str_scenedef];
		if(var_8c4d2266)
		{
			arrayremovevalue(a_shots, "init");
		}
		return a_shots;
	}
	s_scenedef = get_scenedef(str_scenedef);
	if(isdefined(s_scenedef.var_b5d05f70))
	{
		a_shots = s_scenedef.var_b5d05f70;
		if(var_8c4d2266)
		{
			arrayremovevalue(a_shots, "init");
		}
		return s_scenedef.var_b5d05f70;
	}
	a_shots = [];
	foreach(s_object in s_scenedef.objects)
	{
		if(!is_true(s_object.disabled) && isdefined(s_object.shots))
		{
			foreach(s_shot in s_object.shots)
			{
				if(!isdefined(a_shots))
				{
					a_shots = [];
				}
				else if(!isarray(a_shots))
				{
					a_shots = array(a_shots);
				}
				if(!isinarray(a_shots, s_shot.name))
				{
					a_shots[a_shots.size] = s_shot.name;
				}
			}
		}
	}
	s_scenedef.var_b5d05f70 = a_shots;
	s_scenedef.var_418c40ac = a_shots[a_shots.size - 1];
	if(var_8c4d2266)
	{
		arrayremovevalue(a_shots, "init");
	}
	return a_shots;
}

/*
	Name: function_b260bdcc
	Namespace: scene
	Checksum: 0x76D827F3
	Offset: 0xBBC8
	Size: 0x84
	Parameters: 3
	Flags: Linked
*/
function function_b260bdcc(str_scenedef, str_shot, s_instance)
{
	var_418c40ac = function_c9770402(str_scenedef, s_instance);
	s_scenedef = get_scenedef(str_scenedef);
	if(str_shot !== "init" && str_shot === var_418c40ac)
	{
		return true;
	}
	return false;
}

/*
	Name: function_c9770402
	Namespace: scene
	Checksum: 0xEF7C5BBA
	Offset: 0xBC58
	Size: 0x126
	Parameters: 2
	Flags: Linked
*/
function function_c9770402(str_scenedef, s_instance)
{
	if(isdefined(s_instance) && isdefined(s_instance.var_418c40ac))
	{
		return s_instance.var_418c40ac;
	}
	if(isdefined(level.var_1e798f4c) && isdefined(level.var_1e798f4c[str_scenedef]))
	{
		a_shots = level.var_1e798f4c[str_scenedef];
		return a_shots[a_shots.size - 1];
	}
	s_scenedef = get_scenedef(str_scenedef);
	if(isdefined(s_scenedef.str_final_bundle))
	{
		return s_scenedef.str_final_bundle;
	}
	if(isdefined(s_scenedef.var_418c40ac))
	{
		return s_scenedef.var_418c40ac;
	}
	a_shots = get_all_shot_names(str_scenedef, s_instance);
	s_scenedef.var_418c40ac = a_shots[a_shots.size - 1];
	return a_shots[a_shots.size - 1];
}

/*
	Name: _init_instance
	Namespace: scene
	Checksum: 0x414ECB47
	Offset: 0xBD88
	Size: 0x1D4
	Parameters: 3
	Flags: Linked
*/
function _init_instance(str_scenedef, a_ents, b_test_run)
{
	if(!isdefined(b_test_run))
	{
		b_test_run = 0;
	}
	if(!isdefined(str_scenedef))
	{
		str_scenedef = self.scriptbundlename;
	}
	s_bundle = get_scenedef(str_scenedef);
	if(!isdefined(s_bundle) || !function_6f382548(s_bundle, str_scenedef))
	{
		return;
	}
	/#
		/#
			assert(isdefined(str_scenedef), ("" + (isdefined(self.origin) ? self.origin : "")) + "");
		#/
		/#
			assert(isdefined(s_bundle), ((("" + (isdefined(self.origin) ? self.origin : "")) + "") + str_scenedef) + "");
		#/
	#/
	o_scene = get_active_scene(str_scenedef);
	if(isdefined(o_scene))
	{
		if(isdefined(self.scriptbundlename) && !b_test_run)
		{
			return o_scene;
		}
		thread [[ o_scene ]]->initialize(1);
	}
	else
	{
		o_scene = new cscene();
		[[ o_scene ]]->init(str_scenedef, s_bundle, self, a_ents, b_test_run);
	}
	return o_scene;
}

/*
	Name: function_6f382548
	Namespace: scene
	Checksum: 0xA583D9E9
	Offset: 0xBF68
	Size: 0x1CC
	Parameters: 2
	Flags: Linked
*/
function function_6f382548(struct, str_scene_name)
{
	if(!isdefined(struct.var_87403372) || !(getdvarint(#"splitscreen_playercount", 1) > 1))
	{
		return true;
	}
	if(struct.var_87403372 == 2 && getdvarint(#"splitscreen_playercount", 1) > 1 || (struct.var_87403372 == 3 && getdvarint(#"splitscreen_playercount", 1) > 2) || (struct.var_87403372 == 4 && getdvarint(#"splitscreen_playercount", 1) > 3))
	{
		/#
			if(struct.type === "")
			{
				str_debug = ("" + function_9e72a96(str_scene_name)) + "";
			}
			else
			{
				str_debug = ((("" + function_9e72a96(struct.name)) + "") + str_scene_name) + "";
			}
			println(str_debug);
		#/
		return false;
	}
	return true;
}

/*
	Name: function_de6a7579
	Namespace: scene
	Checksum: 0x1B69592E
	Offset: 0xC140
	Size: 0x10E
	Parameters: 3
	Flags: Linked
*/
function function_de6a7579(str_scenedef, str_mode, s_instance)
{
	a_shots = get_all_shot_names(str_scenedef, s_instance);
	if(a_shots.size == 0)
	{
		return "play";
	}
	if(str_mode !== "init")
	{
		if(a_shots[0] !== "init")
		{
			str_shot = a_shots[0];
		}
		else if(a_shots.size > 1)
		{
			str_shot = a_shots[1];
		}
	}
	else if(str_mode === "init")
	{
		if(isinarray(a_shots, "init"))
		{
			str_shot = "init";
		}
		else
		{
			str_shot = a_shots[0];
		}
	}
	if(!isdefined(str_shot))
	{
		str_shot = "play";
	}
	return str_shot;
}

/*
	Name: play_from_time
	Namespace: scene
	Checksum: 0x43A64628
	Offset: 0xC258
	Size: 0xF4
	Parameters: 7
	Flags: Linked
*/
function play_from_time(arg1, arg2, arg3, n_time, var_c9d6bbb, var_20dda4d1, params)
{
	if(!isdefined(var_c9d6bbb))
	{
		var_c9d6bbb = 1;
	}
	if(!isdefined(var_20dda4d1))
	{
		var_20dda4d1 = 0;
	}
	if(var_c9d6bbb)
	{
		str_mode = "play_from_time_normalized";
	}
	else
	{
		str_mode = "play_from_time_elapsed";
	}
	if(function_d3e3e0c7(arg1) || function_d3e3e0c7(arg2) && var_20dda4d1)
	{
		str_mode = str_mode + "_single";
	}
	play(arg1, arg2, arg3, 0, str_mode, n_time, params);
}

/*
	Name: function_d3e3e0c7
	Namespace: scene
	Checksum: 0x3F5F27BB
	Offset: 0xC358
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function function_d3e3e0c7(arg)
{
	if(isstring(arg) && !isinarray(level.scenedefs, hash(arg)) && !isinarray(array("targetname", "script_noteworthy"), arg))
	{
		return true;
	}
	return false;
}

/*
	Name: function_d1abba8b
	Namespace: scene
	Checksum: 0x6E8460B9
	Offset: 0xC400
	Size: 0x19A
	Parameters: 5
	Flags: Linked
*/
function function_d1abba8b(str_scenedef, str_shot, str_mode, n_time, var_5b51581a)
{
	if(!isdefined(var_5b51581a))
	{
		var_5b51581a = 0;
	}
	var_8b21886e = spawnstruct();
	if(issubstr(str_mode, "play_from_time_normalized"))
	{
		if(var_5b51581a)
		{
			var_8b21886e.var_ef711d04 = str_shot;
			var_8b21886e.var_3486c904 = float(n_time);
			return var_8b21886e;
		}
		var_f3f679dd = float(n_time) * function_12479eba(str_scenedef);
	}
	else if(issubstr(str_mode, "play_from_time_elapsed"))
	{
		if(var_5b51581a)
		{
			var_c74251a4 = function_8582657c(str_scenedef, str_shot);
			var_8b21886e.var_ef711d04 = str_shot;
			var_8b21886e.var_3486c904 = float(n_time) / var_c74251a4;
			return var_8b21886e;
		}
		var_f3f679dd = float(n_time);
	}
	var_8b21886e = function_dde5f483(str_scenedef, var_f3f679dd);
	return var_8b21886e;
}

/*
	Name: function_1eab8670
	Namespace: scene
	Checksum: 0x2E3EF50A
	Offset: 0xC5A8
	Size: 0x21A
	Parameters: 2
	Flags: Linked
*/
function function_1eab8670(obj, str_shot)
{
	var_5a162d58 = 0;
	n_anim_length = 0;
	if(isdefined(obj.shots))
	{
		foreach(s_shot in obj.shots)
		{
			if(is_true(s_shot.var_51093f2d))
			{
				continue;
			}
			if(s_shot.name === str_shot && isdefined(s_shot.entry))
			{
				foreach(s_entry in s_shot.entry)
				{
					if(isdefined(s_entry.cameraswitcher))
					{
						var_5a162d58 = var_5a162d58 + (float(getcamanimtime(s_entry.cameraswitcher)) / 1000);
						continue;
					}
					if(isdefined(s_entry.anim))
					{
						n_anim_length = n_anim_length + getanimlength(s_entry.anim);
					}
				}
				break;
			}
		}
	}
	n_length = max(var_5a162d58, n_anim_length);
	return n_length;
}

/*
	Name: function_dde5f483
	Namespace: scene
	Checksum: 0x4D3567C3
	Offset: 0xC7D0
	Size: 0x23A
	Parameters: 2
	Flags: Linked
*/
function function_dde5f483(str_scenedef, n_elapsed_time)
{
	s_scenedef = get_scenedef(str_scenedef);
	a_shots = get_all_shot_names(str_scenedef, undefined, 1);
	var_7a2504a = 0;
	var_8b21886e = spawnstruct();
	foreach(str_shot in a_shots)
	{
		var_958bccd3 = 0;
		foreach(obj in s_scenedef.objects)
		{
			var_657b76cc = function_1eab8670(obj, str_shot);
			if(var_657b76cc > var_958bccd3)
			{
				var_958bccd3 = var_657b76cc;
			}
		}
		var_219aac3f = var_7a2504a;
		var_68790830 = var_219aac3f + var_958bccd3;
		if(n_elapsed_time >= var_219aac3f && n_elapsed_time < var_68790830)
		{
			var_8b21886e.var_ef711d04 = str_shot;
			var_8b21886e.var_3486c904 = (n_elapsed_time - var_219aac3f) / var_958bccd3;
			return var_8b21886e;
		}
		var_7a2504a = var_7a2504a + var_958bccd3;
	}
	var_8b21886e.var_ef711d04 = a_shots[a_shots.size - 1];
	var_8b21886e.var_3486c904 = 0.9;
	return var_8b21886e;
}

/*
	Name: function_8582657c
	Namespace: scene
	Checksum: 0xFB7A4B8
	Offset: 0xCA18
	Size: 0x126
	Parameters: 2
	Flags: Linked
*/
function function_8582657c(var_b9a72490, str_shot)
{
	if(isstring(var_b9a72490) || function_7a600918(var_b9a72490))
	{
		s_scenedef = get_scenedef(var_b9a72490);
	}
	else
	{
		s_scenedef = var_b9a72490;
	}
	var_a0c66830 = 0;
	foreach(obj in s_scenedef.objects)
	{
		var_657b76cc = function_1eab8670(obj, str_shot);
		if(var_657b76cc > var_a0c66830)
		{
			var_a0c66830 = var_657b76cc;
		}
	}
	return var_a0c66830;
}

/*
	Name: function_12479eba
	Namespace: scene
	Checksum: 0xE8B47638
	Offset: 0xCB48
	Size: 0xF8
	Parameters: 1
	Flags: Linked
*/
function function_12479eba(str_scenedef)
{
	s_scenedef = get_scenedef(str_scenedef);
	a_shots = get_all_shot_names(str_scenedef, undefined, 1);
	var_9d90ef8b = 0;
	foreach(str_shot in a_shots)
	{
		var_9d90ef8b = var_9d90ef8b + function_8582657c(s_scenedef, str_shot);
	}
	return var_9d90ef8b;
}

/*
	Name: function_67e52759
	Namespace: scene
	Checksum: 0x3D540000
	Offset: 0xCC48
	Size: 0xCA
	Parameters: 5
	Flags: None
*/
function function_67e52759(str_scenedef, s_instance, var_8c4d2266, var_47f77330, var_62e8e2f0)
{
	a_shots = get_all_shot_names(str_scenedef, s_instance, var_8c4d2266);
	if(isdefined(var_47f77330) || isdefined(var_62e8e2f0))
	{
		a_shots = array::slice(a_shots, (isdefined(var_47f77330) ? var_47f77330 : 0), (isdefined(var_62e8e2f0) ? var_62e8e2f0 : 2147483647));
	}
	s_shot = array::random(a_shots);
	return s_shot;
}

/*
	Name: play
	Namespace: scene
	Checksum: 0x80595769
	Offset: 0xCD20
	Size: 0x474
	Parameters: 7
	Flags: Linked
*/
function play(arg1, arg2, arg3, b_test_run, str_mode, n_time, params)
{
	if(!isdefined(b_test_run))
	{
		b_test_run = 0;
	}
	if(!isdefined(str_mode))
	{
		str_mode = "";
	}
	s_tracker = spawnstruct();
	s_tracker.n_scene_count = 1;
	if(self == level)
	{
		a_instances = [];
		if(isstring(arg1) || function_7a600918(arg1))
		{
			if(isstring(arg1) && issubstr(arg1, ","))
			{
				a_toks = strtok(arg1, ",");
				str_value = a_toks[0];
				str_key = a_toks[1];
				if(isstring(arg2))
				{
					str_shot = tolower(arg2);
					a_ents = arg3;
					var_5b51581a = 1;
				}
				else
				{
					a_ents = arg2;
				}
			}
			else
			{
				if(isinarray(level.scenedefs, hash(arg1)))
				{
					str_scenedef = arg1;
					var_583db6f0 = 1;
				}
				else
				{
					str_value = arg1;
					str_key = "targetname";
				}
			}
			if(isstring(arg2))
			{
				if(isinarray(array("targetname", "script_noteworthy"), arg2))
				{
					str_key = arg2;
				}
				else
				{
					str_shot = tolower(arg2);
					var_5b51581a = 1;
				}
				a_ents = arg3;
			}
			else
			{
				a_ents = arg2;
			}
			a_instances = _get_scene_instances(str_value, str_key, str_scenedef);
			if(a_instances.size)
			{
				s_tracker.n_scene_count = a_instances.size;
				foreach(s_instance in a_instances)
				{
					if(isdefined(s_instance))
					{
						if(!is_true(var_583db6f0))
						{
							str_scenedef = s_instance.scriptbundlename;
						}
						if(!is_true(var_5b51581a))
						{
							str_shot = function_de6a7579(str_scenedef, str_mode, s_instance);
						}
						else if(!issubstr(str_mode, "play_from_time"))
						{
							str_mode = "single";
						}
						s_instance thread _play_instance(s_tracker, str_scenedef, a_ents, b_test_run, str_shot, str_mode, n_time, var_5b51581a, params);
					}
				}
			}
			else
			{
				_play_on_self(s_tracker, arg1, arg2, arg3, b_test_run, str_mode, n_time, params);
			}
		}
	}
	else
	{
		_play_on_self(s_tracker, arg1, arg2, arg3, b_test_run, str_mode, n_time, params);
	}
	function_c802b491(s_tracker, str_mode);
}

/*
	Name: function_c802b491
	Namespace: scene
	Checksum: 0xE749C9D8
	Offset: 0xD1A0
	Size: 0x84
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c802b491(s_tracker, str_mode)
{
	level endon(#"demo_jump");
	if(s_tracker.n_scene_count > 0 && !is_true(s_tracker.var_93ec5dde) && str_mode !== "init")
	{
		s_tracker waittill(#"scene_done");
	}
}

/*
	Name: function_46546b5c
	Namespace: scene
	Checksum: 0x95111B5C
	Offset: 0xD230
	Size: 0xBA
	Parameters: 2
	Flags: Linked
*/
function function_46546b5c(s_tracker, str_scenedef)
{
	if(getdvarint(#"hash_862358d532e674c", 0) === 1)
	{
		var_41c1a1b7 = getscriptbundle(str_scenedef);
		if(is_true(var_41c1a1b7.var_2af733c9))
		{
			/#
				iprintlnbold("" + str_scenedef);
			#/
			s_tracker.var_93ec5dde = 1;
			return true;
		}
	}
	return false;
}

/*
	Name: _play_on_self
	Namespace: scene
	Checksum: 0xA00F3E53
	Offset: 0xD2F8
	Size: 0x294
	Parameters: 8
	Flags: Linked
*/
function _play_on_self(s_tracker, arg1, arg2, arg3, b_test_run, str_mode, n_time, params)
{
	if(!isdefined(b_test_run))
	{
		b_test_run = 0;
	}
	if(!isdefined(str_mode))
	{
		str_mode = "";
	}
	if(isstring(arg1) || function_7a600918(arg1))
	{
		if(isinarray(level.scenedefs, hash(arg1)))
		{
			str_scenedef = arg1;
			if(isstring(arg2))
			{
				str_shot = arg2;
				a_ents = arg3;
			}
			else
			{
				a_ents = arg2;
			}
		}
		else
		{
			str_shot = arg1;
			a_ents = arg2;
		}
	}
	else
	{
		if(isarray(arg1))
		{
			str_scenedef = self.scriptbundlename;
			a_ents = arg1;
		}
		else
		{
			str_scenedef = self.scriptbundlename;
			if(isstring(arg2))
			{
				str_shot = arg2;
				a_ents = arg3;
			}
		}
	}
	s_tracker.n_scene_count = 1;
	if(!isdefined(str_shot) && isdefined(str_scenedef))
	{
		str_shot = function_de6a7579(str_scenedef, str_mode, self);
	}
	else if(isdefined(str_shot))
	{
		/#
			if(str_mode === "")
			{
				iprintlnbold("");
				println("");
			}
		#/
		if(str_mode !== "init" && !issubstr(str_mode, "play_from_time"))
		{
			str_mode = "single";
		}
		var_5b51581a = 1;
	}
	self thread _play_instance(s_tracker, str_scenedef, a_ents, b_test_run, str_shot, str_mode, n_time, var_5b51581a, params);
}

/*
	Name: _play_instance
	Namespace: scene
	Checksum: 0x25E08C38
	Offset: 0xD598
	Size: 0x3E0
	Parameters: 9
	Flags: Linked
*/
function _play_instance(s_tracker, str_scenedef, a_ents, b_test_run, str_shot, str_mode, n_time, var_5b51581a, params)
{
	if(!isdefined(str_shot))
	{
		str_shot = "play";
	}
	if(!isdefined(str_scenedef))
	{
		str_scenedef = self.scriptbundlename;
	}
	if(isdefined(n_time) && issubstr(str_mode, "play_from_time"))
	{
		var_8b21886e = function_d1abba8b(str_scenedef, str_shot, str_mode, n_time, var_5b51581a);
		str_shot = var_8b21886e.var_ef711d04;
		var_dd2b75b = var_8b21886e.var_3486c904;
		str_mode = str_mode + (":" + var_dd2b75b);
	}
	if(str_mode === "init")
	{
		str_shot = function_de6a7579(str_scenedef, str_mode, self);
	}
	if(function_46546b5c(s_tracker, str_scenedef))
	{
		waitframe(1);
		self notify(#"scene_done");
		return;
	}
	if(self.scriptbundlename === str_scenedef)
	{
		str_scenedef = self.scriptbundlename;
		if(!is_true(self.script_play_multiple))
		{
			if(!isdefined(self.scene_played))
			{
				self.scene_played = [];
			}
			if(is_true(self.scene_played[str_shot]) && !b_test_run)
			{
				waittillframeend();
				while(is_playing(str_scenedef))
				{
					waitframe(1);
				}
				/#
					println(("" + str_scenedef) + "");
				#/
				s_tracker notify(#"scene_done");
				return;
			}
		}
		if(str_mode == "init")
		{
			self.scene_played[str_shot] = 0;
		}
		else
		{
			self.scene_played[str_shot] = 1;
		}
	}
	o_scene = _init_instance(str_scenedef, a_ents, b_test_run);
	/#
		function_8ee42bf(o_scene);
	#/
	if(str_mode != "init")
	{
		if(!is_true(self.var_135bd649))
		{
			util::function_35840de8(self.script_delay);
		}
		if(isdefined(o_scene))
		{
			thread [[ o_scene ]]->play(str_shot, b_test_run, str_mode, undefined, params);
			if(isdefined(o_scene._a_objects) && o_scene._a_objects.size)
			{
				o_scene waittill_instance_scene_done(str_scenedef);
			}
		}
		if(isdefined(self))
		{
			if(isdefined(self.scriptbundlename) && is_true(get_scenedef(self.scriptbundlename).looping))
			{
				self.scene_played[str_shot] = 0;
			}
		}
	}
	/#
		function_8ee42bf(o_scene);
	#/
	s_tracker.n_scene_count--;
	s_tracker notify(#"scene_done");
}

/*
	Name: waittill_instance_scene_done
	Namespace: scene
	Checksum: 0x308CEF77
	Offset: 0xD980
	Size: 0x3A
	Parameters: 1
	Flags: Linked, Private
*/
function private waittill_instance_scene_done(str_scenedef)
{
	level endon(#"demo_jump");
	self waittill(#"scene_done");
}

/*
	Name: stop
	Namespace: scene
	Checksum: 0x174DE8C5
	Offset: 0xD9C8
	Size: 0x2B4
	Parameters: 5
	Flags: Linked
*/
function stop(arg1, arg2, arg3, b_cancel, b_no_assert)
{
	if(!isdefined(b_no_assert))
	{
		b_no_assert = 0;
	}
	if(self == level)
	{
		if(isstring(arg1) || function_7a600918(arg1))
		{
			if(isstring(arg2))
			{
				str_value = arg1;
				str_key = arg2;
				b_clear = arg3;
			}
			else
			{
				str_value = arg1;
				b_clear = arg2;
			}
			if(isdefined(str_key))
			{
				a_instances = struct::get_array(str_value, str_key);
				/#
					/#
						assert(b_no_assert || a_instances.size, ((("" + str_key) + "") + str_value) + "");
					#/
				#/
				str_value = undefined;
			}
			else
			{
				a_instances = struct::get_array(str_value, "targetname");
				if(!a_instances.size)
				{
					a_instances = get_active_scenes(str_value);
				}
				else
				{
					str_value = undefined;
				}
			}
			foreach(s_instance in arraycopy(a_instances))
			{
				if(isdefined(s_instance))
				{
					s_instance _stop_instance(b_clear, str_value, b_cancel);
				}
			}
		}
	}
	else
	{
		if(isstring(arg1) || function_7a600918(arg1))
		{
			_stop_instance(arg2, arg1, b_cancel);
		}
		else
		{
			_stop_instance(arg1, arg2, b_cancel);
		}
	}
}

/*
	Name: _stop_instance
	Namespace: scene
	Checksum: 0xBBE1AE06
	Offset: 0xDC88
	Size: 0x100
	Parameters: 3
	Flags: Linked
*/
function _stop_instance(b_clear, str_scenedef, b_cancel)
{
	if(!isdefined(b_clear))
	{
		b_clear = 0;
	}
	if(!isdefined(b_cancel))
	{
		b_cancel = 0;
	}
	if(isdefined(self.scenes))
	{
		foreach(o_scene in arraycopy(self.scenes))
		{
			str_scene_name = o_scene._str_name;
			if(!isdefined(str_scenedef) || str_scene_name == str_scenedef)
			{
				thread [[ o_scene ]]->stop(b_clear, b_cancel);
			}
		}
	}
}

/*
	Name: cancel
	Namespace: scene
	Checksum: 0xB1211905
	Offset: 0xDD90
	Size: 0x3C
	Parameters: 3
	Flags: Linked
*/
function cancel(arg1, arg2, arg3)
{
	stop(arg1, arg2, arg3, 1);
}

/*
	Name: delete_scene_spawned_ents
	Namespace: scene
	Checksum: 0x45523C9
	Offset: 0xDDD8
	Size: 0x24C
	Parameters: 2
	Flags: None
*/
function delete_scene_spawned_ents(localclientnum, arg1)
{
	if(self == level)
	{
		a_instances = [];
		if(isstring(arg1) || function_7a600918(arg1))
		{
			if(isstring(arg1) && issubstr(arg1, ","))
			{
				a_toks = strtok(arg1, ",");
				str_value = a_toks[0];
				str_key = a_toks[1];
			}
			else
			{
				if(isinarray(level.scenedefs, hash(arg1)))
				{
					str_scenedef = arg1;
				}
				else
				{
					str_value = arg1;
					str_key = "targetname";
				}
			}
			a_instances = _get_scene_instances(str_value, str_key, str_scenedef, 1);
			if(a_instances.size)
			{
				foreach(instance in a_instances)
				{
					instance _delete_scene_spawned_ents(localclientnum, str_scenedef);
				}
			}
		}
	}
	else
	{
		if(isstring(arg1) || function_7a600918(arg1))
		{
			str_scenedef = arg1;
		}
		self _delete_scene_spawned_ents(localclientnum, str_scenedef);
	}
}

/*
	Name: _delete_scene_spawned_ents
	Namespace: scene
	Checksum: 0x71B6726D
	Offset: 0xE030
	Size: 0xF0
	Parameters: 2
	Flags: Linked
*/
function _delete_scene_spawned_ents(localclientnum, str_scene)
{
	if(isarray(self.scene_ents) && isarray(self.scene_ents[str_scene]))
	{
		foreach(ent in self.scene_ents[str_scene])
		{
			if(isdefined(ent) && isdefined(ent.scene_spawned))
			{
				ent delete();
			}
		}
	}
}

/*
	Name: has_init_state
	Namespace: scene
	Checksum: 0x42CA2E56
	Offset: 0xE128
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function has_init_state(str_scenedef)
{
	s_scenedef = get_scenedef(str_scenedef);
	foreach(s_obj in s_scenedef.objects)
	{
		if(!is_true(s_obj.disabled) && s_obj _has_init_state(str_scenedef))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: _has_init_state
	Namespace: scene
	Checksum: 0x324134E6
	Offset: 0xE218
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function _has_init_state(str_scenedef)
{
	return isinarray(get_all_shot_names(str_scenedef), "init") || is_true(self.spawnoninit) || isdefined(self.initanim) || isdefined(self.initanimloop) || is_true(self.firstframe);
}

/*
	Name: get_prop_count
	Namespace: scene
	Checksum: 0x90E8B885
	Offset: 0xE2B0
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function get_prop_count(str_scenedef)
{
	return _get_type_count("prop", str_scenedef);
}

/*
	Name: get_vehicle_count
	Namespace: scene
	Checksum: 0x7C813E6
	Offset: 0xE2E0
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function get_vehicle_count(str_scenedef)
{
	return _get_type_count("vehicle", str_scenedef);
}

/*
	Name: get_actor_count
	Namespace: scene
	Checksum: 0xE908632C
	Offset: 0xE310
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function get_actor_count(str_scenedef)
{
	return _get_type_count("actor", str_scenedef);
}

/*
	Name: function_7aa3d2c6
	Namespace: scene
	Checksum: 0xF23C5681
	Offset: 0xE340
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_7aa3d2c6(str_scenedef)
{
	return _get_type_count("sharedplayer", str_scenedef);
}

/*
	Name: get_player_count
	Namespace: scene
	Checksum: 0xC878CB70
	Offset: 0xE370
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function get_player_count(str_scenedef)
{
	return _get_type_count("player", str_scenedef);
}

/*
	Name: _get_type_count
	Namespace: scene
	Checksum: 0x77976D16
	Offset: 0xE3A0
	Size: 0x11C
	Parameters: 2
	Flags: Linked
*/
function _get_type_count(str_type, str_scenedef)
{
	s_scenedef = (isdefined(str_scenedef) ? get_scenedef(str_scenedef) : get_scenedef(self.scriptbundlename));
	n_count = 0;
	foreach(s_obj in s_scenedef.objects)
	{
		if(isdefined(s_obj.type))
		{
			if(tolower(s_obj.type) == tolower(str_type))
			{
				n_count++;
			}
		}
	}
	return n_count;
}

/*
	Name: is_active
	Namespace: scene
	Checksum: 0x4ECFE9BB
	Offset: 0xE4C8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function is_active(str_scenedef)
{
	if(self == level)
	{
		return get_active_scenes(str_scenedef).size > 0;
	}
	return isdefined(get_active_scene(str_scenedef));
}

/*
	Name: is_playing
	Namespace: scene
	Checksum: 0x2A5561F0
	Offset: 0xE520
	Size: 0x104
	Parameters: 2
	Flags: Linked
*/
function is_playing(str_scenedef, str_shot)
{
	if(self == level)
	{
		if(isarray(level.active_scenes[str_scenedef]) && isdefined(str_shot))
		{
			o_scene = level.active_scenes[str_scenedef][0].scenes[0];
			if(o_scene._str_shot === str_shot)
			{
				return 1;
			}
			return 0;
		}
		return level flag::get(str_scenedef + "_playing");
	}
	if(!isdefined(str_scenedef))
	{
		str_scenedef = self.scriptbundlename;
	}
	o_scene = get_active_scene(str_scenedef);
	if(isdefined(o_scene))
	{
		return o_scene._str_mode === "play";
	}
	return 0;
}

/*
	Name: get_active_scenes
	Namespace: scene
	Checksum: 0x8303BA6D
	Offset: 0xE630
	Size: 0x106
	Parameters: 1
	Flags: Linked
*/
function get_active_scenes(str_scenedef)
{
	if(!isdefined(level.active_scenes))
	{
		level.active_scenes = [];
	}
	if(isdefined(str_scenedef))
	{
		return (isdefined(level.active_scenes[str_scenedef]) ? level.active_scenes[str_scenedef] : []);
	}
	a_active_scenes = [];
	foreach(str_scenedef, _ in level.active_scenes)
	{
		a_active_scenes = arraycombine(a_active_scenes, level.active_scenes[str_scenedef], 0, 0);
	}
	return a_active_scenes;
}

/*
	Name: get_active_scene
	Namespace: scene
	Checksum: 0x5F9D14AB
	Offset: 0xE740
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function get_active_scene(str_scenedef)
{
	if(isdefined(str_scenedef) && isdefined(self.scenes))
	{
		foreach(o_scene in self.scenes)
		{
			if(o_scene._str_name == str_scenedef)
			{
				return o_scene;
			}
		}
	}
}

/*
	Name: is_capture_mode
	Namespace: scene
	Checksum: 0xAAC52888
	Offset: 0xE7F8
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function is_capture_mode()
{
	str_mode = getdvarstring(#"scene_menu_mode", "default");
	if(issubstr(str_mode, "capture"))
	{
		return true;
	}
	return false;
}

/*
	Name: _get_scene_instances
	Namespace: scene
	Checksum: 0x6134788E
	Offset: 0xE868
	Size: 0x19A
	Parameters: 4
	Flags: Linked
*/
function _get_scene_instances(str_value, str_key, str_scenedef, b_include_inactive)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(b_include_inactive))
	{
		b_include_inactive = 0;
	}
	a_instances = [];
	if(isdefined(str_value))
	{
		a_instances = struct::get_array(str_value, str_key);
		/#
			/#
				assert(a_instances.size, ((("" + str_key) + "") + str_value) + "");
			#/
		#/
	}
	if(isdefined(str_scenedef))
	{
		a_instances_by_scenedef = struct::get_array(str_scenedef, "scriptbundlename");
		a_instances = arraycombine(a_instances_by_scenedef, a_instances, 0, 0);
		a_active_instances = get_active_scenes(str_scenedef);
		a_instances = arraycombine(a_active_instances, a_instances, 0, 0);
		if(b_include_inactive)
		{
			a_inactive_instances = get_inactive_scenes(str_scenedef);
			a_instances = arraycombine(a_inactive_instances, a_instances, 0, 0);
		}
	}
	return a_instances;
}

/*
	Name: get_inactive_scenes
	Namespace: scene
	Checksum: 0x3EB354DB
	Offset: 0xEA10
	Size: 0x106
	Parameters: 1
	Flags: Linked
*/
function get_inactive_scenes(str_scenedef)
{
	if(!isdefined(level.inactive_scenes))
	{
		level.inactive_scenes = [];
	}
	if(isdefined(str_scenedef))
	{
		return (isdefined(level.inactive_scenes[str_scenedef]) ? level.inactive_scenes[str_scenedef] : []);
	}
	a_scenes = [];
	foreach(str_scenedef, _ in level.inactive_scenes)
	{
		a_scenes = arraycombine(a_scenes, level.inactive_scenes[str_scenedef], 0, 0);
	}
	return a_scenes;
}

/*
	Name: function_9730988a
	Namespace: scene
	Checksum: 0x5B5593C5
	Offset: 0xEB20
	Size: 0x3A
	Parameters: 2
	Flags: Linked
*/
function function_9730988a(str_scenedef, var_6a688dba)
{
	return isinarray(get_all_shot_names(str_scenedef), var_6a688dba);
}

