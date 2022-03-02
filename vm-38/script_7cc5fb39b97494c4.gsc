#using script_7bafaa95bb1b427e;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

class class_9e71c1a2 
{
	var var_b5a03b21;
	var var_a4ea555f;
	var var_63e8057;
	var var_884c51e;
	var var_6697e3b5;
	var var_7529951f;
	var var_fcc5a4dd;
	var var_d411c5b6;
	var var_bb0d53c3;
	var m_s_bundle;
	var var_2be76207;
	var var_678a6f36;
	var var_8b53fab0;
	var var_1c4a269e;
	var var_7f74e09b;
	var var_8ddd8026;
	var var_b4563cfa;
	var var_43773582;
	var var_3e29294f;

	/*
		Name: constructor
		Namespace: namespace_9e71c1a2
		Checksum: 0x25FE25F5
		Offset: 0x2AA8
		Size: 0xC2
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.m_a_callbacks = [];
		self.var_63e8057 = [];
		self.var_884c51e = [];
		self.var_6697e3b5 = [];
		self.var_bb0d53c3 = [];
		self.var_a4ea555f = [];
		self.var_1d21e4f3[#"allies"] = 0;
		self.var_1d21e4f3[#"axis"] = 0;
		self.var_1c4a269e = 0;
		self.var_7529951f = 0;
		self.var_fcc5a4dd = 0;
		self.var_678a6f36 = 0;
		self.var_d411c5b6 = 1;
		self.var_8ddd8026 = 1;
	}

	/*
		Name: destructor
		Namespace: namespace_9e71c1a2
		Checksum: 0x80F724D1
		Offset: 0x2B78
		Size: 0x4
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_70bcd27
		Namespace: namespace_9e71c1a2
		Checksum: 0x91AFE298
		Offset: 0x2D10
		Size: 0x2D0
		Parameters: 2
		Flags: Linked
	*/
	function function_70bcd27(s_minigame, s_bundle)
	{
		self.m_s_bundle = s_bundle;
		self.var_b5a03b21 = s_minigame;
		var_b5a03b21.var_ff3c99c5 = self;
		self.m_str_identifier = s_minigame.str_identifier;
		self.var_2be76207 = util::get_team_mapping(s_minigame.script_team);
		self.var_9e3fdeff = s_minigame.script_difficulty;
		switch(tolower(s_minigame.var_4e0f62f3))
		{
			case "open":
			{
				self.var_8b53fab0 = 0;
				break;
			}
			case "exclusive":
			{
				self.var_8b53fab0 = 1;
				break;
			}
			case "hash_65a466c611c44a94":
			{
				self.var_8b53fab0 = 2;
				break;
			}
		}
		self.var_6dfc35a = (isdefined(s_minigame.var_3b6bc456) ? s_minigame.var_3b6bc456 : 0);
		if(is_true(s_minigame.var_a92a2cc0))
		{
			self.var_fcc5a4dd = 1;
		}
		if(isdefined(var_b5a03b21.var_5ebe1cc1))
		{
			self.var_d411c5b6 = var_b5a03b21.var_5ebe1cc1;
		}
		self.var_678a6f36 = is_true(s_minigame.var_3093fd62);
		if(isdefined(s_minigame.target))
		{
			a_s_targets = struct::get_array(s_minigame.target);
			foreach(s_target in a_s_targets)
			{
				if(s_target scene::function_9503138e())
				{
					if(!isdefined(var_a4ea555f))
					{
						self.var_a4ea555f = [];
					}
					else if(!isarray(var_a4ea555f))
					{
						self.var_a4ea555f = array(var_a4ea555f);
					}
					self.var_a4ea555f[var_a4ea555f.size] = s_target;
				}
			}
		}
	}

	/*
		Name: function_1633032e
		Namespace: namespace_9e71c1a2
		Checksum: 0x8B00FBD7
		Offset: 0x4C10
		Size: 0x9C
		Parameters: 3
		Flags: Linked
	*/
	function function_1633032e(e_player, var_e992b321, b_success)
	{
		if(scene::function_9730988a(var_e992b321.var_f8f0466c.scriptbundlename, "fail") && !b_success)
		{
			var_e992b321.var_f8f0466c scene::play("fail", e_player);
		}
		else
		{
			var_e992b321.var_f8f0466c scene::play("stop", e_player);
		}
	}

	/*
		Name: function_225651c4
		Namespace: namespace_9e71c1a2
		Checksum: 0xE20470DF
		Offset: 0x3D30
		Size: 0xB6
		Parameters: 1
		Flags: Linked
	*/
	function function_225651c4(var_e992b321)
	{
		self endon(#"interact", #"disabled");
		var_e992b321.mdl_gameobject endon(#"death");
		var_29b8f3d0 = undefined;
		var_29b8f3d0 = var_e992b321.mdl_gameobject waittill(#"gameobject_end_use_player");
		self notify(#"interact", {#hash_e992b321:var_e992b321, #e_player:var_29b8f3d0.player});
	}

	/*
		Name: function_27940f1f
		Namespace: namespace_9e71c1a2
		Checksum: 0xC9F9B492
		Offset: 0x2BB0
		Size: 0xC
		Parameters: 1
		Flags: Linked
	*/
	function function_27940f1f(team)
	{
	}

	/*
		Name: function_2e32e924
		Namespace: namespace_9e71c1a2
		Checksum: 0x661EA13
		Offset: 0x5CC0
		Size: 0x15C
		Parameters: 1
		Flags: Linked
	*/
	function function_2e32e924(e_player)
	{
		if(isdefined(e_player))
		{
			arrayremovevalue(var_63e8057, undefined);
			if(isinarray(var_884c51e, e_player))
			{
				arrayremovevalue(var_884c51e, e_player, 0);
			}
			if(!var_b5a03b21 flag::get("enabled"))
			{
				if(!isdefined(var_6697e3b5))
				{
					self.var_6697e3b5 = [];
				}
				else if(!isarray(var_6697e3b5))
				{
					self.var_6697e3b5 = array(var_6697e3b5);
				}
				if(!isinarray(var_6697e3b5, e_player))
				{
					self.var_6697e3b5[var_6697e3b5.size] = e_player;
				}
			}
			if(var_63e8057.size == 1 && isdefined(var_63e8057[0].mdl_gameobject))
			{
				var_63e8057[0].mdl_gameobject gameobjects::show_waypoint(e_player);
			}
		}
	}

	/*
		Name: _init
		Namespace: namespace_9e71c1a2
		Checksum: 0x80F724D1
		Offset: 0x2B88
		Size: 0x4
		Parameters: 0
		Flags: Linked
	*/
	function _init()
	{
	}

	/*
		Name: function_37b8d51b
		Namespace: namespace_9e71c1a2
		Checksum: 0xDA06CD86
		Offset: 0x4CB8
		Size: 0x90
		Parameters: 1
		Flags: Linked
	*/
	function function_37b8d51b(e_player)
	{
		if(!var_b5a03b21 flag::get("enabled"))
		{
			return false;
		}
		if(!isalive(e_player))
		{
			return false;
		}
		if(e_player laststand::player_is_in_laststand())
		{
			return false;
		}
		if(!var_7529951f && self function_d04f90d8(e_player))
		{
			return false;
		}
		return true;
	}

	/*
		Name: function_422aeb75
		Namespace: namespace_9e71c1a2
		Checksum: 0x3C7B38B4
		Offset: 0x4950
		Size: 0x2B6
		Parameters: 3
		Flags: Linked
	*/
	function function_422aeb75(e_player, var_e992b321, b_success)
	{
		if(isdefined(e_player))
		{
			[[ self ]]->_stop(e_player);
			if(var_fcc5a4dd && isdefined(var_e992b321.mdl_gameobject))
			{
				var_e992b321.mdl_gameobject gameobjects::show_waypoint(e_player);
				n_objective_id = var_e992b321.mdl_gameobject.objectiveid;
				objective_clearplayerusing(n_objective_id, e_player);
				objective_setgamemodeflags(n_objective_id, 0);
				objective_clearentity(n_objective_id);
			}
			e_player val::reset(#"minigame", "freezecontrols");
			e_player val::reset(#"minigame", "freezecontrols_allowlook");
			gameobjects::remove_player_use_modifiers(e_player);
			e_player endon(#"death");
			if(var_d411c5b6)
			{
				function_dd517e14(e_player, undefined);
				e_player weapons::function_d571ac59();
				if(self function_bb600dc2(e_player, b_success))
				{
					e_player waittill(#"weapon_change_complete", #"death");
				}
			}
			else
			{
				if(isdefined(var_e992b321.var_f8f0466c) && isalive(e_player) && !e_player inlaststand())
				{
					if(is_true(var_b5a03b21.var_b0dfc0a2))
					{
						self thread function_1633032e(e_player, var_e992b321, b_success);
					}
					else
					{
						self function_1633032e(e_player, var_e992b321, b_success);
					}
				}
				else if(e_player inlaststand())
				{
					var_e992b321.var_f8f0466c scene::stop();
				}
			}
			e_player.var_f4f7edb2 = undefined;
		}
	}

	/*
		Name: function_49c02476
		Namespace: namespace_9e71c1a2
		Checksum: 0xE0CF708F
		Offset: 0x5B48
		Size: 0x170
		Parameters: 1
		Flags: Linked
	*/
	function function_49c02476(e_player)
	{
		if(isdefined(e_player))
		{
			if(isinarray(var_6697e3b5, e_player))
			{
				arrayremovevalue(var_6697e3b5, e_player, 0);
			}
			if(!isdefined(var_884c51e))
			{
				self.var_884c51e = [];
			}
			else if(!isarray(var_884c51e))
			{
				self.var_884c51e = array(var_884c51e);
			}
			if(!isinarray(var_884c51e, e_player))
			{
				self.var_884c51e[var_884c51e.size] = e_player;
			}
			foreach(var_e992b321 in var_63e8057)
			{
				if(isdefined(var_e992b321) && isdefined(var_e992b321.mdl_gameobject))
				{
					var_e992b321.mdl_gameobject gameobjects::hide_waypoint(e_player);
				}
			}
		}
	}

	/*
		Name: reset
		Namespace: namespace_9e71c1a2
		Checksum: 0x18629097
		Offset: 0x5988
		Size: 0x64
		Parameters: 1
		Flags: Linked
	*/
	function reset(str_team)
	{
		arrayremovevalue(var_bb0d53c3, str_team);
		if(!var_bb0d53c3.size)
		{
			var_b5a03b21 flag::clear("playing");
		}
		[[ self ]]->function_27940f1f(str_team);
	}

	/*
		Name: show_tutorial_text
		Namespace: namespace_9e71c1a2
		Checksum: 0xE4671A2A
		Offset: 0x4370
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function show_tutorial_text(e_player)
	{
		if(isfunctionptr(level.var_84bcc5b0))
		{
			e_player [[level.var_84bcc5b0]](self);
		}
	}

	/*
		Name: _fail
		Namespace: namespace_9e71c1a2
		Checksum: 0x5C7F1DCD
		Offset: 0x2C28
		Size: 0xC
		Parameters: 1
		Flags: Linked
	*/
	function _fail(e_player)
	{
	}

	/*
		Name: _update
		Namespace: namespace_9e71c1a2
		Checksum: 0x5744022A
		Offset: 0x2BE0
		Size: 0xC
		Parameters: 1
		Flags: Linked
	*/
	function _update(e_player)
	{
	}

	/*
		Name: function_673813fe
		Namespace: namespace_9e71c1a2
		Checksum: 0xC2259FA4
		Offset: 0x43B8
		Size: 0x38
		Parameters: 1
		Flags: Linked
	*/
	function function_673813fe(e_player)
	{
		if(isfunctionptr(level.var_e30ae574))
		{
			e_player [[level.var_e30ae574]]();
		}
	}

	/*
		Name: function_699f084d
		Namespace: namespace_9e71c1a2
		Checksum: 0x960FD86B
		Offset: 0x5208
		Size: 0xB8
		Parameters: 0
		Flags: Linked
	*/
	function function_699f084d()
	{
		if(is_true(var_b5a03b21.var_459e9174))
		{
			self function_c6a410ce();
		}
		while(true)
		{
			s_notify = undefined;
			s_notify = var_b5a03b21 waittill(#"hash_58b8542ed702b2a5");
			if(s_notify.var_36c9fd16)
			{
				self function_c6a410ce();
			}
			else
			{
				var_63e8057[0] gameobjects::hide_waypoint();
			}
		}
	}

	/*
		Name: function_70a50147
		Namespace: namespace_9e71c1a2
		Checksum: 0x6038521A
		Offset: 0x5E28
		Size: 0xA0
		Parameters: 1
		Flags: Linked
	*/
	function function_70a50147(str_team)
	{
		foreach(e_player in getplayers(str_team))
		{
			self function_49c02476(e_player);
		}
	}

	/*
		Name: _start
		Namespace: namespace_9e71c1a2
		Checksum: 0x323B2371
		Offset: 0x2B98
		Size: 0xC
		Parameters: 1
		Flags: Linked
	*/
	function _start(e_player)
	{
	}

	/*
		Name: disable
		Namespace: namespace_9e71c1a2
		Checksum: 0x5D2F69C2
		Offset: 0x5890
		Size: 0xF0
		Parameters: 0
		Flags: Linked
	*/
	function disable()
	{
		var_b5a03b21 flag::clear("enabled");
		self notify(#"disabled");
		var_b5a03b21 notify(#"disabled");
		foreach(var_e992b321 in var_63e8057)
		{
			if(isdefined(var_e992b321) && isdefined(var_e992b321.mdl_gameobject))
			{
				var_e992b321.mdl_gameobject gameobjects::disable_object();
			}
		}
	}

	/*
		Name: failure
		Namespace: namespace_9e71c1a2
		Checksum: 0x52E17F13
		Offset: 0x3838
		Size: 0x154
		Parameters: 2
		Flags: Linked
	*/
	function failure(var_f8d01c02, e_player)
	{
		var_b5a03b21 flag::set("fail");
		foreach(var_e992b321 in var_63e8057)
		{
			if(isdefined(var_e992b321) && isdefined(var_e992b321.mdl_gameobject))
			{
				var_e992b321.mdl_gameobject gameobjects::enable_object();
			}
		}
		[[ self ]]->_fail(e_player);
		self function_dc915c86(#"hash_6856d0c15df481c5", e_player);
		if(is_true(var_b5a03b21.var_8f001ddb))
		{
			self thread clean_up(0, 0, var_f8d01c02);
			return true;
		}
		return false;
	}

	/*
		Name: clean_up
		Namespace: namespace_9e71c1a2
		Checksum: 0x142AE797
		Offset: 0x53D0
		Size: 0x2A2
		Parameters: 3
		Flags: Linked
	*/
	function clean_up(var_a6bdeb0a, b_success, var_f8d01c02)
	{
		var_b5a03b21 flag::set("complete");
		self disable();
		if(!sessionmodeiscampaigngame() || !isdefined(level.var_3626dfc))
		{
			foreach(var_e992b321 in var_63e8057)
			{
				if(isdefined(var_e992b321))
				{
					if(isdefined(var_e992b321.mdl_gameobject))
					{
						var_e992b321.mdl_gameobject gameobjects::destroy_object(1);
					}
					if(isstruct(var_e992b321) && var_e992b321 != var_b5a03b21)
					{
						var_e992b321 struct::delete();
					}
				}
			}
		}
		else
		{
			foreach(var_e992b321 in var_63e8057)
			{
				ent = var_e992b321;
				if(isdefined(var_e992b321.ent))
				{
					ent = var_e992b321.ent;
				}
				if(isentity(ent))
				{
					var_e992b321 thread [[level.var_3626dfc]](#"use");
					if(isdefined(ent.var_645eee83))
					{
						ent.var_645eee83 = undefined;
					}
					if(isdefined(ent.var_e992b321))
					{
						ent.var_e992b321 = undefined;
					}
				}
				if(isstruct(var_e992b321) && var_e992b321 != var_b5a03b21)
				{
					var_e992b321 struct::delete();
				}
			}
		}
		self.var_63e8057 = [];
	}

	/*
		Name: _stop
		Namespace: namespace_9e71c1a2
		Checksum: 0xB0833E20
		Offset: 0x2BF8
		Size: 0xC
		Parameters: 1
		Flags: Linked
	*/
	function _stop(e_player)
	{
	}

	/*
		Name: function_8650ea49
		Namespace: namespace_9e71c1a2
		Checksum: 0x53DE078D
		Offset: 0x2FE8
		Size: 0x6A8
		Parameters: 1
		Flags: Linked
	*/
	function function_8650ea49(s_minigame)
	{
		if(isdefined(var_b5a03b21.script_minigame_interact))
		{
			var_f7e61134 = getentarray(var_b5a03b21.script_minigame_interact, "script_minigame_interact");
			var_4d8ab49e = struct::get_array(var_b5a03b21.script_minigame_interact, "script_minigame_interact");
			var_4d8ab49e = array::filter(var_4d8ab49e, 0, &minigame::function_ad13b048);
			self.var_63e8057 = arraycombine(var_f7e61134, var_4d8ab49e, 0, 0);
		}
		else
		{
			self.var_63e8057 = array(var_b5a03b21);
		}
		if(isdefined(var_b5a03b21.script_gameobject))
		{
			var_5f7d7d0d = var_b5a03b21.script_gameobject;
		}
		else
		{
			var_5f7d7d0d = m_s_bundle.gameobject;
		}
		str_objective = undefined;
		if(isdefined(var_b5a03b21.var_17afe51d))
		{
			str_objective = var_b5a03b21.var_17afe51d;
		}
		if(var_2be76207 == #"any")
		{
			str_gameobject_team = #"any";
		}
		else
		{
			if(var_678a6f36)
			{
				str_gameobject_team = var_2be76207;
			}
			else
			{
				str_gameobject_team = util::get_enemy_team(var_2be76207);
			}
		}
		if(!sessionmodeiscampaigngame() || !isdefined(level.var_6a7fb742))
		{
			foreach(var_e992b321 in var_63e8057)
			{
				var_e992b321.var_3093fd62 = var_678a6f36;
				var_e992b321 gameobjects::init_game_objects(var_5f7d7d0d, str_gameobject_team, undefined, undefined, undefined, str_objective);
				if(!var_678a6f36 && var_2be76207 != #"any")
				{
					var_e992b321.mdl_gameobject gameobjects::allow_use(#"hash_33c49a99551acae7");
					var_e992b321.mdl_gameobject gameobjects::set_visible(#"hash_33c49a99551acae7");
				}
				var_e992b321.mdl_gameobject.s_minigame = var_b5a03b21;
				var_e992b321.mdl_gameobject.b_reusable = 1;
				var_e992b321.mdl_gameobject.b_auto_reenable = 0;
				var_e992b321.mdl_gameobject gameobjects::disable_object();
				if(isdefined(var_b5a03b21.var_4cd30731))
				{
					var_e992b321 gameobjects::set_key_object(var_b5a03b21.var_4cd30731);
					if(is_true(var_b5a03b21.var_91fc94c1))
					{
						var_e992b321 gameobjects::function_e7e3d146();
					}
				}
			}
			if(var_63e8057.size > 1)
			{
				self thread function_a5f97adb();
			}
		}
		else
		{
			foreach(var_e992b321 in var_63e8057)
			{
				ent = var_e992b321;
				if(isdefined(var_e992b321.ent))
				{
					ent = var_e992b321.ent;
				}
				if(isentity(ent))
				{
					bundle = getscriptbundle(var_5f7d7d0d);
					image = undefined;
					if(isdefined(bundle.objective))
					{
						image = function_b91948e(bundle.objective);
						if(image == #"")
						{
							image = undefined;
						}
					}
					var_4d98c3ce = bundle.str_hint;
					var_de6f0004 = (isdefined(bundle.n_trigger_use_time) ? bundle.n_trigger_use_time : 0);
					ent.var_645eee83 = self;
					ent.var_e992b321 = var_e992b321;
					ent thread [[level.var_6a7fb742]](#"use", {#hash_67eb3347:&minigame::function_eb28f36, #hash_c9643122:1, #complete_callback:&minigame::function_76974d96, #hash_531201f1:&minigame::function_cc2939a2, #hash_be77841a:0, #hash_de6f0004:var_de6f0004, #hash_87c991f3:40, #hash_754bedbb:0, #offset:var_e992b321.local_offset, #hash_71b9f0c0:200, #image:image, #hash_4d98c3ce:var_4d98c3ce});
				}
			}
		}
	}

	/*
		Name: run
		Namespace: namespace_9e71c1a2
		Checksum: 0x8A185143
		Offset: 0x2C78
		Size: 0x8C
		Parameters: 2
		Flags: Linked
	*/
	function run(s_minigame, s_bundle)
	{
		self function_70bcd27(s_minigame, s_bundle);
		self function_8650ea49(s_bundle);
		[[ self ]]->_init();
		if(is_true(var_b5a03b21.script_enable_on_start))
		{
			self thread enable();
		}
	}

	/*
		Name: function_89999e9c
		Namespace: namespace_9e71c1a2
		Checksum: 0xF812EDCF
		Offset: 0x2C58
		Size: 0x14
		Parameters: 2
		Flags: Linked
	*/
	function function_89999e9c(player, stream)
	{
	}

	/*
		Name: wait_for_completion
		Namespace: namespace_9e71c1a2
		Checksum: 0xB827DA30
		Offset: 0x4D98
		Size: 0x46
		Parameters: 1
		Flags: Linked
	*/
	function wait_for_completion(var_f8d01c02)
	{
		s_result = undefined;
		s_result = self waittill(#"complete", "complete_" + var_f8d01c02);
		return s_result.b_success;
	}

	/*
		Name: function_91ef58fb
		Namespace: namespace_9e71c1a2
		Checksum: 0x397C2ACF
		Offset: 0x2C40
		Size: 0xC
		Parameters: 1
		Flags: Linked
	*/
	function function_91ef58fb(var_f8d01c02)
	{
	}

	/*
		Name: can_use
		Namespace: namespace_9e71c1a2
		Checksum: 0x6714E4DF
		Offset: 0x3DF0
		Size: 0xE8
		Parameters: 1
		Flags: Linked
	*/
	function can_use(e_player)
	{
		if(!var_b5a03b21 flag::get("enabled"))
		{
			return false;
		}
		if(!isalive(e_player) || is_true(e_player.var_f4f7edb2) || e_player scene::is_igc_active())
		{
			return false;
		}
		if(var_8b53fab0 == 2 && isinarray(var_bb0d53c3, e_player.team))
		{
			return false;
		}
		if(e_player getstance() == "prone")
		{
			return false;
		}
		return true;
	}

	/*
		Name: complete
		Namespace: namespace_9e71c1a2
		Checksum: 0x624352A3
		Offset: 0x5A40
		Size: 0x100
		Parameters: 3
		Flags: Linked
	*/
	function complete(e_player, b_success, team)
	{
		if(var_8b53fab0 == 2 && isdefined(team))
		{
			str_notify = "complete_" + team;
		}
		else
		{
			str_notify = "complete";
		}
		if(b_success && isdefined(team))
		{
			self.var_1d21e4f3[team] = 1;
		}
		self notify(str_notify, {#b_success:b_success});
		level notify(#"hash_3a50173c7262e762", {#team:team, #b_success:b_success, #minigame:self, #e_player:e_player});
	}

	/*
		Name: function_97132cce
		Namespace: namespace_9e71c1a2
		Checksum: 0xE2F4D382
		Offset: 0x46C0
		Size: 0x284
		Parameters: 2
		Flags: Linked
	*/
	function function_97132cce(e_player, var_e992b321)
	{
		if(isdefined(e_player))
		{
			gameobjects::apply_player_use_modifiers(e_player);
			e_player.var_f4f7edb2 = 1;
			e_player.var_97c1c267 = var_b5a03b21;
			var_b5a03b21.last_player = e_player;
			if(is_true(var_1c4a269e))
			{
				e_player val::set(#"minigame", "freezecontrols");
			}
			else
			{
				e_player val::set(#"minigame", "freezecontrols_allowlook");
			}
			if(isdefined(var_e992b321.script_minigame_scene))
			{
				if(!isdefined(var_e992b321.var_f8f0466c))
				{
					var_a64cfd9c = struct::get_script_bundle_instances("scene", array(var_e992b321.script_minigame_scene, "script_minigame_scene"));
					/#
						assert(var_a64cfd9c.size == 1, "");
					#/
					var_e992b321.var_f8f0466c = var_a64cfd9c[0];
				}
				var_21f2d623 = "start";
				if(scene::function_9730988a(var_e992b321.var_f8f0466c.scriptbundlename, "restart"))
				{
					if(is_true(var_e992b321.var_f8f0466c.var_575fa471))
					{
						var_21f2d623 = "restart";
					}
					else
					{
						var_e992b321.var_f8f0466c.var_575fa471 = 1;
					}
				}
				var_e992b321.var_f8f0466c thread scene::play(var_21f2d623, e_player);
				e_player waittilltimeout(15, #"weapon_change_complete", #"hash_8e3165e139c9b54");
			}
			else if(var_d411c5b6)
			{
				function_dd517e14(e_player, m_s_bundle.weapon, 1);
			}
			[[ self ]]->_start(e_player);
		}
	}

	/*
		Name: function_97aa68af
		Namespace: namespace_9e71c1a2
		Checksum: 0xE52BFECF
		Offset: 0x3998
		Size: 0x390
		Parameters: 0
		Flags: Linked
	*/
	function function_97aa68af()
	{
		self endon(#"disabled");
		var_b90f0ac2 = undefined;
		while(true)
		{
			foreach(var_e992b321 in var_63e8057)
			{
				if(isdefined(var_e992b321) && isdefined(var_e992b321.mdl_gameobject))
				{
					b_show_objective = !isdefined(var_b90f0ac2) || var_e992b321.mdl_gameobject !== var_b90f0ac2 || !var_fcc5a4dd;
					var_b90f0ac2 = undefined;
					var_e992b321.mdl_gameobject gameobjects::enable_object(undefined, b_show_objective);
					self thread function_225651c4(var_e992b321);
				}
			}
			var_29b8f3d0 = undefined;
			var_29b8f3d0 = self waittill(#"interact");
			e_player = var_29b8f3d0.e_player;
			var_67f3d9ac = var_29b8f3d0.var_e992b321;
			var_67f3d9ac.var_1754f288 = 1;
			var_b90f0ac2 = var_67f3d9ac.mdl_gameobject;
			foreach(var_e992b321 in var_63e8057)
			{
				if(isdefined(var_e992b321) && isdefined(var_e992b321.mdl_gameobject))
				{
					var_ffd61eb5 = var_e992b321 !== var_67f3d9ac || !var_fcc5a4dd;
					var_e992b321.mdl_gameobject gameobjects::disable_object(undefined, var_ffd61eb5);
				}
			}
			if(var_fcc5a4dd)
			{
				var_67f3d9ac.mdl_gameobject gameobjects::hide_waypoint(e_player);
				n_objective_id = var_67f3d9ac.mdl_gameobject.objectiveid;
				self.var_3e29294f = objective_team(n_objective_id);
				objective_setplayerusing(n_objective_id, e_player);
				objective_setteam(n_objective_id, e_player.team);
				objective_setgamemodeflags(n_objective_id, 1);
				objective_onentity(n_objective_id, e_player);
			}
			var_f8d01c02 = e_player.team;
			if(self can_use(e_player))
			{
				self thread function_e43bda22(e_player, var_f8d01c02, var_67f3d9ac);
				if(var_8b53fab0 == 1)
				{
					self wait_for_completion(var_f8d01c02);
				}
			}
		}
	}

	/*
		Name: function_9e6bea30
		Namespace: namespace_9e71c1a2
		Checksum: 0x8F323656
		Offset: 0x5ED0
		Size: 0xA0
		Parameters: 1
		Flags: Linked
	*/
	function function_9e6bea30(str_team)
	{
		foreach(e_player in getplayers(str_team))
		{
			self function_2e32e924(e_player);
		}
	}

	/*
		Name: success
		Namespace: namespace_9e71c1a2
		Checksum: 0xF9B9CB92
		Offset: 0x3698
		Size: 0x196
		Parameters: 2
		Flags: Linked
	*/
	function success(var_f8d01c02, e_player)
	{
		var_b5a03b21 flag::set("success");
		if(isdefined(var_b5a03b21.script_flag_set))
		{
			util::function_aebdb74f(var_b5a03b21.script_flag_set);
		}
		if(!is_true(var_7f74e09b))
		{
			foreach(s_scene in var_a4ea555f)
			{
				s_scene thread scene::play();
			}
		}
		[[ self ]]->_success(e_player);
		self function_dc915c86(#"hash_46eb32e6146cbc38", e_player);
		if(is_true(var_b5a03b21.script_delete))
		{
			self thread clean_up(0, 1, var_f8d01c02);
			return true;
		}
		self.var_1d21e4f3[var_f8d01c02] = 0;
		return false;
	}

	/*
		Name: function_a466ed26
		Namespace: namespace_9e71c1a2
		Checksum: 0x2468AA09
		Offset: 0x2BC8
		Size: 0xC
		Parameters: 1
		Flags: Linked
	*/
	function function_a466ed26(e_player)
	{
	}

	/*
		Name: function_a5f97adb
		Namespace: namespace_9e71c1a2
		Checksum: 0xCD709F1B
		Offset: 0x4E50
		Size: 0x3B0
		Parameters: 0
		Flags: Linked
	*/
	function function_a5f97adb()
	{
		var_27e76749 = 0;
		while(true)
		{
			if(isdefined(var_b5a03b21.var_4cd30731) && is_true(var_b5a03b21.var_4cd30731.var_3a8907ff))
			{
				if(!is_true(var_b5a03b21.var_459e9174) && !var_27e76749)
				{
					var_27e76749 = 1;
				}
				else if(is_true(var_b5a03b21.var_459e9174) && var_27e76749)
				{
					var_27e76749 = 0;
				}
			}
			foreach(e_player in getplayers(var_2be76207))
			{
				if(isinarray(var_884c51e, e_player))
				{
					continue;
				}
				if(!var_b5a03b21 flag::get("enabled") && !isinarray(var_6697e3b5, e_player))
				{
					continue;
				}
				if(var_b5a03b21 flag::get("playing"))
				{
					foreach(var_e992b321 in var_63e8057)
					{
						if(is_true(var_e992b321.var_1754f288))
						{
							var_e992b321.mdl_gameobject gameobjects::show_waypoint(e_player);
							continue;
						}
						var_e992b321.mdl_gameobject gameobjects::hide_waypoint(e_player);
					}
					continue;
				}
				var_dbfda451 = array::get_all_closest(e_player.origin, var_63e8057);
				if(!var_27e76749)
				{
					var_1bfdf9f9 = array::pop_front(var_dbfda451, 0).mdl_gameobject;
					var_1bfdf9f9 gameobjects::show_waypoint(e_player);
				}
				foreach(var_e992b321 in var_dbfda451)
				{
					var_e992b321.mdl_gameobject gameobjects::hide_waypoint(e_player);
				}
			}
			wait(0.25);
		}
	}

	/*
		Name: function_bb600dc2
		Namespace: namespace_9e71c1a2
		Checksum: 0x1C14DEBF
		Offset: 0x4DE8
		Size: 0x5C
		Parameters: 2
		Flags: Linked
	*/
	function function_bb600dc2(e_player, b_success)
	{
		if(!isalive(e_player) || e_player inlaststand() || !b_success)
		{
			return false;
		}
		return true;
	}

	/*
		Name: enable
		Namespace: namespace_9e71c1a2
		Checksum: 0x3A9A3D1E
		Offset: 0x5680
		Size: 0x204
		Parameters: 0
		Flags: Linked
	*/
	function enable()
	{
		if(var_b5a03b21 flag::get("enabled"))
		{
			return;
		}
		if(is_true(var_8ddd8026))
		{
			self.var_8ddd8026 = undefined;
			var_b5a03b21 util::function_fb80e9ca();
		}
		self reset();
		level flag::wait_till("all_players_connected");
		var_b5a03b21 flag::set("enabled");
		self thread function_97aa68af();
		foreach(var_e992b321 in var_63e8057)
		{
			if(isdefined(var_e992b321) && isdefined(var_e992b321.mdl_gameobject))
			{
				var_e992b321.mdl_gameobject gameobjects::enable_object();
			}
		}
		if(var_63e8057.size == 1)
		{
			if(isdefined(var_b5a03b21.var_4cd30731) && is_true(var_b5a03b21.var_4cd30731.var_3a8907ff))
			{
				self thread function_699f084d();
			}
			else
			{
				self function_c6a410ce();
			}
		}
	}

	/*
		Name: function_c6a410ce
		Namespace: namespace_9e71c1a2
		Checksum: 0x860B07AC
		Offset: 0x52C8
		Size: 0x100
		Parameters: 0
		Flags: Linked
	*/
	function function_c6a410ce()
	{
		if(var_678a6f36)
		{
			var_d045c932 = #"any";
		}
		else
		{
			var_d045c932 = var_2be76207;
		}
		var_6678b09c = getplayers(var_d045c932);
		var_6678b09c = array::exclude(var_6678b09c, var_884c51e);
		foreach(e_player in var_6678b09c)
		{
			var_63e8057[0] gameobjects::show_waypoint(e_player);
		}
	}

	/*
		Name: function_c72c3d4c
		Namespace: namespace_9e71c1a2
		Checksum: 0x3F49DB19
		Offset: 0x43F8
		Size: 0x12C
		Parameters: 2
		Flags: Linked
	*/
	function function_c72c3d4c(e_player, var_f8d01c02)
	{
		self endon(#"complete", "complete" + var_f8d01c02);
		waitframe(1);
		while(self function_37b8d51b(e_player) && e_player isswitchingweapons())
		{
			waitframe(1);
		}
		[[ self ]]->function_a466ed26(e_player);
		while(self function_37b8d51b(e_player))
		{
			[[ self ]]->_update(e_player);
			waitframe(1);
		}
		function_d04f90d8(e_player);
		b_success = [[ self ]]->function_91ef58fb(var_f8d01c02);
		if(b_success)
		{
			self complete(e_player, 1, var_f8d01c02);
			return;
		}
		self complete(e_player, 0, var_f8d01c02);
	}

	/*
		Name: function_c8ad03f4
		Namespace: namespace_9e71c1a2
		Checksum: 0xC421E8D9
		Offset: 0x4210
		Size: 0x158
		Parameters: 1
		Flags: Linked
	*/
	function function_c8ad03f4(e_player)
	{
		e_player endon(#"disconnect");
		if(!isdefined(e_player.var_ff7ce13b))
		{
			e_player.var_ff7ce13b = [];
		}
		if(!isdefined(e_player.var_ff7ce13b[m_s_bundle.type]))
		{
			e_player.var_ff7ce13b[m_s_bundle.type] = 0;
		}
		if(!e_player.var_ff7ce13b[m_s_bundle.type] && isdefined(var_b4563cfa))
		{
			show_tutorial_text(e_player);
			var_be17187b = undefined;
			var_be17187b = e_player waittill(#"minigame_tutorial_complete", #"hash_226f6717c97d10d6", #"death", #"entering_last_stand");
			function_673813fe(e_player);
			if(var_be17187b._notify === "minigame_tutorial_complete")
			{
				e_player.var_ff7ce13b[m_s_bundle.type] = 1;
			}
		}
	}

	/*
		Name: function_d04f90d8
		Namespace: namespace_9e71c1a2
		Checksum: 0x9F7D3796
		Offset: 0x4D50
		Size: 0x40
		Parameters: 1
		Flags: Linked
	*/
	function function_d04f90d8(e_player)
	{
		if(e_player stancebuttonpressed())
		{
			e_player notify(#"hash_226f6717c97d10d6");
			return true;
		}
		return false;
	}

	/*
		Name: function_dc915c86
		Namespace: namespace_9e71c1a2
		Checksum: 0x6200E0D9
		Offset: 0x5F78
		Size: 0x148
		Parameters: 2
		Flags: Linked, Variadic
	*/
	function function_dc915c86(var_f0539892, ...)
	{
		if(isdefined(var_b5a03b21.var_bb0149e5) && isdefined(var_b5a03b21.var_bb0149e5[var_f0539892]))
		{
			foreach(s_callback in var_b5a03b21.var_bb0149e5[var_f0539892])
			{
				a_args = arraycombine(vararg, s_callback.params, 1, 0);
				if(s_callback.b_thread)
				{
					util::single_thread_argarray(var_b5a03b21, s_callback.func, a_args);
					continue;
				}
				util::single_func_argarray(var_b5a03b21, s_callback.func, a_args);
			}
		}
	}

	/*
		Name: function_dd517e14
		Namespace: namespace_9e71c1a2
		Checksum: 0x7C600998
		Offset: 0x4530
		Size: 0x184
		Parameters: 3
		Flags: Linked
	*/
	function function_dd517e14(e_player, weapon, var_e689a5b8)
	{
		if(isdefined(var_43773582))
		{
			if(var_43773582 === weapon)
			{
				return;
			}
			e_player takeweapon(var_43773582);
		}
		self.var_43773582 = weapon;
		if(!isdefined(level.var_f425c7f3))
		{
			level.var_f425c7f3 = [];
		}
		else if(!isarray(level.var_f425c7f3))
		{
			level.var_f425c7f3 = array(level.var_f425c7f3);
		}
		if(!isinarray(level.var_f425c7f3, weapon))
		{
			level.var_f425c7f3[level.var_f425c7f3.size] = weapon;
		}
		if(isdefined(weapon))
		{
			e_player giveweapon(weapon);
			e_player switchtoweapon(weapon, 1);
			if(is_true(var_e689a5b8))
			{
				e_player endon(#"death");
				e_player waittill(#"weapon_change_complete");
			}
		}
	}

	/*
		Name: function_e25c39ec
		Namespace: namespace_9e71c1a2
		Checksum: 0xBC7A3288
		Offset: 0x59F8
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function function_e25c39ec(e_player)
	{
		if(isdefined(var_63e8057[0]))
		{
			var_63e8057[0] gameobjects::function_f4ccb04c(e_player);
		}
	}

	/*
		Name: _success
		Namespace: namespace_9e71c1a2
		Checksum: 0x7F1ECA91
		Offset: 0x2C10
		Size: 0xC
		Parameters: 1
		Flags: Linked
	*/
	function _success(e_player)
	{
	}

	/*
		Name: function_e43bda22
		Namespace: namespace_9e71c1a2
		Checksum: 0xD3DEC5E2
		Offset: 0x3EE0
		Size: 0x324
		Parameters: 3
		Flags: Linked
	*/
	function function_e43bda22(e_player, var_f8d01c02, var_e992b321)
	{
		var_b5a03b21 flag::set("playing");
		var_b5a03b21 flag::clear("success");
		var_b5a03b21 flag::clear("fail");
		if(isdefined(var_b5a03b21.var_fff2f8a8))
		{
			util::function_aebdb74f(var_b5a03b21.var_fff2f8a8);
		}
		if(!isdefined(var_bb0d53c3))
		{
			self.var_bb0d53c3 = [];
		}
		else if(!isarray(var_bb0d53c3))
		{
			self.var_bb0d53c3 = array(var_bb0d53c3);
		}
		if(!isinarray(var_bb0d53c3, var_f8d01c02))
		{
			self.var_bb0d53c3[var_bb0d53c3.size] = var_f8d01c02;
		}
		self function_49c02476(e_player);
		self function_dc915c86(#"hash_49f6733137002be7", e_player);
		if(isbot(e_player))
		{
			e_player thread minigame::function_ab30c8b9(var_b5a03b21);
		}
		self function_97132cce(e_player, var_e992b321);
		self thread function_c8ad03f4(e_player);
		self thread function_c72c3d4c(e_player, var_f8d01c02);
		b_success = self wait_for_completion(var_f8d01c02);
		var_b5a03b21 flag::clear("playing");
		var_e992b321.var_1754f288 = undefined;
		if(isdefined(var_3e29294f))
		{
			if(isdefined(var_e992b321.mdl_gameobject))
			{
				objective_setteam(var_e992b321.mdl_gameobject.objectiveid, var_3e29294f);
			}
			self.var_3e29294f = undefined;
		}
		self function_422aeb75(e_player, var_e992b321, b_success);
		if(b_success)
		{
			b_delete = self success(var_f8d01c02, e_player);
		}
		else
		{
			b_delete = self failure(var_f8d01c02, e_player);
		}
		if(b_delete)
		{
			return;
		}
		self reset(var_f8d01c02);
		self function_2e32e924(e_player);
	}

}

#namespace namespace_435e13ec;

/*
	Name: function_45753f17
	Namespace: namespace_435e13ec
	Checksum: 0x6A6FECAA
	Offset: 0x268
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_45753f17()
{
	level notify(1080006987);
}

#namespace minigame;

/*
	Name: function_e0a8e4ba
	Namespace: minigame
	Checksum: 0x92098603
	Offset: 0x288
	Size: 0x22C
	Parameters: 1
	Flags: Linked, Private, Event
*/
event private function_e0a8e4ba(struct)
{
	foreach(k in [0:"script_minigame_interact"])
	{
		if(!isdefined(level.var_41204f29))
		{
			level.var_41204f29 = [];
		}
		else if(!isarray(level.var_41204f29))
		{
			level.var_41204f29 = array(level.var_41204f29);
		}
		if(!isinarray(level.var_41204f29, tolower(k)))
		{
			level.var_41204f29[level.var_41204f29.size] = tolower(k);
		}
	}
	level.var_5e990e96 = arraycopy(level.var_41204f29);
	if(isdefined(level.struct))
	{
		temp = arraycopy(level.struct);
		level.struct = [];
		foreach(struct in temp)
		{
			struct::init(struct);
		}
	}
	function_6c07201b("CreateStruct", &function_e0a8e4ba);
}

/*
	Name: function_89f2df9
	Namespace: minigame
	Checksum: 0x15AAB6DB
	Offset: 0x4C0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register("minigames", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: minigame
	Checksum: 0xDCE31ADB
	Offset: 0x510
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_b6bac679))
	{
		level.var_b6bac679 = [];
	}
	if(!isdefined(level.var_1e600ced))
	{
		level.var_1e600ced = [];
	}
	if(!isdefined(level.var_f425c7f3))
	{
		level.var_f425c7f3 = [];
	}
	function_71699fe2();
	serverfield::register("minigame_progress", 1, 3, "int", &function_98fbeac1);
}

/*
	Name: function_8ac3bea9
	Namespace: minigame
	Checksum: 0x13626655
	Offset: 0x5C0
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	function_e6adabd1();
	function_374e4d47();
}

/*
	Name: function_fef35085
	Namespace: minigame
	Checksum: 0x45D34511
	Offset: 0x5F0
	Size: 0x10A
	Parameters: 1
	Flags: None
*/
function function_fef35085(kvp)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		[[ s_minigame.var_ff3c99c5 ]]->clean_up(1);
		s_minigame.var_ff3c99c5 = undefined;
	}
}

/*
	Name: function_903cc131
	Namespace: minigame
	Checksum: 0x62007264
	Offset: 0x708
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function function_903cc131(kvp, e_player)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		[[ s_minigame.var_ff3c99c5 ]]->function_e25c39ec(e_player);
	}
}

/*
	Name: function_c09ff52
	Namespace: minigame
	Checksum: 0xDAA4DB5E
	Offset: 0x818
	Size: 0x114
	Parameters: 3
	Flags: Linked
*/
function function_c09ff52(kvp, team, e_player)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		[[ s_minigame.var_ff3c99c5 ]]->complete(e_player, 0, team);
	}
}

/*
	Name: function_d6209a68
	Namespace: minigame
	Checksum: 0xD479D103
	Offset: 0x938
	Size: 0x114
	Parameters: 3
	Flags: Linked
*/
function function_d6209a68(kvp, team, e_player)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		[[ s_minigame.var_ff3c99c5 ]]->complete(e_player, 1, team);
	}
}

/*
	Name: function_9f42562e
	Namespace: minigame
	Checksum: 0x1EAF548B
	Offset: 0xA58
	Size: 0x124
	Parameters: 2
	Flags: None
*/
function function_9f42562e(kvp, b_success)
{
	var_b6bac679 = self function_358b4546(b_success);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete") || !s_minigame flag::get("enabled"))
		{
			continue;
		}
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		[[ s_minigame.var_ff3c99c5 ]]->disable();
	}
}

/*
	Name: function_fa6cc037
	Namespace: minigame
	Checksum: 0x8B3D9D70
	Offset: 0xB88
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_fa6cc037(kvp)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete") || s_minigame flag::get("enabled"))
		{
			continue;
		}
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		[[ s_minigame.var_ff3c99c5 ]]->enable();
	}
}

/*
	Name: function_15491eef
	Namespace: minigame
	Checksum: 0x11F48443
	Offset: 0xCB0
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function function_15491eef(kvp, team)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		[[ s_minigame.var_ff3c99c5 ]]->reset(team);
	}
}

/*
	Name: function_f214347f
	Namespace: minigame
	Checksum: 0xE9846AE8
	Offset: 0xDC0
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function function_f214347f(kvp, e_player)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		[[ s_minigame.var_ff3c99c5 ]]->function_49c02476(e_player);
	}
}

/*
	Name: function_326c59f1
	Namespace: minigame
	Checksum: 0xE78A4068
	Offset: 0xED0
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function function_326c59f1(kvp, e_player)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		[[ s_minigame.var_ff3c99c5 ]]->function_2e32e924(e_player);
	}
}

/*
	Name: function_382e90e0
	Namespace: minigame
	Checksum: 0x16DD2458
	Offset: 0xFE0
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function function_382e90e0(kvp, str_team)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		[[ s_minigame.var_ff3c99c5 ]]->function_70a50147(str_team);
	}
}

/*
	Name: function_1d72032b
	Namespace: minigame
	Checksum: 0x1E51891F
	Offset: 0x10F0
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function function_1d72032b(kvp, str_team)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		[[ s_minigame.var_ff3c99c5 ]]->function_9e6bea30(str_team);
	}
}

/*
	Name: function_eced5dc3
	Namespace: minigame
	Checksum: 0x6D0F20BD
	Offset: 0x1200
	Size: 0x25A
	Parameters: 4
	Flags: Variadic
*/
function function_eced5dc3(kvp, var_72b833ec, b_thread, ...)
{
	if(!isdefined(b_thread))
	{
		b_thread = 0;
	}
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(!isdefined(s_minigame.var_bb0149e5))
		{
			s_minigame.var_bb0149e5 = [];
		}
		if(!isdefined(s_minigame.var_bb0149e5[#"hash_49f6733137002be7"]))
		{
			s_minigame.var_bb0149e5[#"hash_49f6733137002be7"] = [];
		}
		var_1c8482a6 = {#params:vararg, #b_thread:b_thread, #func:var_72b833ec};
		if(!isdefined(s_minigame.var_bb0149e5[#"hash_49f6733137002be7"]))
		{
			s_minigame.var_bb0149e5[#"hash_49f6733137002be7"] = [];
		}
		else if(!isarray(s_minigame.var_bb0149e5[#"hash_49f6733137002be7"]))
		{
			s_minigame.var_bb0149e5[#"hash_49f6733137002be7"] = array(s_minigame.var_bb0149e5[#"hash_49f6733137002be7"]);
		}
		if(!isinarray(s_minigame.var_bb0149e5[#"hash_49f6733137002be7"], var_1c8482a6))
		{
			s_minigame.var_bb0149e5[#"hash_49f6733137002be7"][s_minigame.var_bb0149e5[#"hash_49f6733137002be7"].size] = var_1c8482a6;
		}
	}
}

/*
	Name: function_b4d0d537
	Namespace: minigame
	Checksum: 0x2C32163B
	Offset: 0x1468
	Size: 0x25A
	Parameters: 4
	Flags: Variadic
*/
function function_b4d0d537(kvp, var_248486f4, b_thread, ...)
{
	if(!isdefined(b_thread))
	{
		b_thread = 0;
	}
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(!isdefined(s_minigame.var_bb0149e5))
		{
			s_minigame.var_bb0149e5 = [];
		}
		if(!isdefined(s_minigame.var_bb0149e5[#"hash_46eb32e6146cbc38"]))
		{
			s_minigame.var_bb0149e5[#"hash_46eb32e6146cbc38"] = [];
		}
		var_89d033d3 = {#params:vararg, #b_thread:b_thread, #func:var_248486f4};
		if(!isdefined(s_minigame.var_bb0149e5[#"hash_46eb32e6146cbc38"]))
		{
			s_minigame.var_bb0149e5[#"hash_46eb32e6146cbc38"] = [];
		}
		else if(!isarray(s_minigame.var_bb0149e5[#"hash_46eb32e6146cbc38"]))
		{
			s_minigame.var_bb0149e5[#"hash_46eb32e6146cbc38"] = array(s_minigame.var_bb0149e5[#"hash_46eb32e6146cbc38"]);
		}
		if(!isinarray(s_minigame.var_bb0149e5[#"hash_46eb32e6146cbc38"], var_89d033d3))
		{
			s_minigame.var_bb0149e5[#"hash_46eb32e6146cbc38"][s_minigame.var_bb0149e5[#"hash_46eb32e6146cbc38"].size] = var_89d033d3;
		}
	}
}

/*
	Name: function_a8acdae1
	Namespace: minigame
	Checksum: 0xEC661FFD
	Offset: 0x16D0
	Size: 0x25A
	Parameters: 4
	Flags: Variadic
*/
function function_a8acdae1(kvp, var_1ea9b69a, b_thread, ...)
{
	if(!isdefined(b_thread))
	{
		b_thread = 0;
	}
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(!isdefined(s_minigame.var_bb0149e5))
		{
			s_minigame.var_bb0149e5 = [];
		}
		if(!isdefined(s_minigame.var_bb0149e5[#"hash_6856d0c15df481c5"]))
		{
			s_minigame.var_bb0149e5[#"hash_6856d0c15df481c5"] = [];
		}
		var_dfab6f1b = {#params:vararg, #b_thread:b_thread, #func:var_1ea9b69a};
		if(!isdefined(s_minigame.var_bb0149e5[#"hash_6856d0c15df481c5"]))
		{
			s_minigame.var_bb0149e5[#"hash_6856d0c15df481c5"] = [];
		}
		else if(!isarray(s_minigame.var_bb0149e5[#"hash_6856d0c15df481c5"]))
		{
			s_minigame.var_bb0149e5[#"hash_6856d0c15df481c5"] = array(s_minigame.var_bb0149e5[#"hash_6856d0c15df481c5"]);
		}
		if(!isinarray(s_minigame.var_bb0149e5[#"hash_6856d0c15df481c5"], var_dfab6f1b))
		{
			s_minigame.var_bb0149e5[#"hash_6856d0c15df481c5"][s_minigame.var_bb0149e5[#"hash_6856d0c15df481c5"].size] = var_dfab6f1b;
		}
	}
}

/*
	Name: function_7dc9b185
	Namespace: minigame
	Checksum: 0x4780DC8F
	Offset: 0x1938
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_7dc9b185(str_type)
{
	if(!isdefined(str_type))
	{
		str_type = undefined;
	}
	if(isdefined(str_type))
	{
		var_b6bac679 = level.var_1e600ced[str_type];
	}
	else
	{
		var_b6bac679 = level.var_b6bac679;
	}
	if(isdefined(self) && isdefined(var_b6bac679) && isinarray(var_b6bac679, self))
	{
		return true;
	}
	return false;
}

/*
	Name: function_ee73e88e
	Namespace: minigame
	Checksum: 0x9E270521
	Offset: 0x19C8
	Size: 0xDA
	Parameters: 2
	Flags: None
*/
function function_ee73e88e(var_4ebba909, kvp)
{
	var_b6bac679 = [];
	if(isdefined(var_4ebba909))
	{
		var_b6bac679 = level.var_1e600ced[var_4ebba909];
	}
	else
	{
		var_b6bac679 = level.var_b6bac679;
	}
	if(var_b6bac679.size > 0 && isdefined(kvp))
	{
		if(isarray(kvp))
		{
			str_value = kvp[0];
			str_key = kvp[1];
		}
		else
		{
			str_value = kvp;
			str_key = "targetname";
		}
		var_b6bac679 = function_7b8e26b3(var_b6bac679, str_value, str_key);
	}
	return var_b6bac679;
}

/*
	Name: function_7afabfe2
	Namespace: minigame
	Checksum: 0x14725028
	Offset: 0x1AB0
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function function_7afabfe2(kvp)
{
	var_b6bac679 = self function_358b4546(kvp);
	/#
		assert(var_b6bac679.size == 1, "");
	#/
	var_e323b7eb = var_b6bac679;
	var_aec49411 = getfirstarraykey(var_e323b7eb);
	if(isdefined(var_aec49411))
	{
		var_88a3b521 = getarraykeyindex(var_aec49411);
		s_minigame = getarrayvalue(var_aec49411);
		var_d7b532f7 = getnextarraykey(var_aec49411);
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		return s_minigame.var_ff3c99c5.var_8b53fab0;
	}
}

/*
	Name: function_839316c5
	Namespace: minigame
	Checksum: 0x743E7097
	Offset: 0x1BB8
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_839316c5(kvp)
{
	var_b6bac679 = self function_358b4546(kvp);
	/#
		assert(var_b6bac679.size == 1, "");
	#/
	var_762bfb59 = var_b6bac679;
	var_cfd3d43b = getfirstarraykey(var_762bfb59);
	if(isdefined(var_cfd3d43b))
	{
		var_682908d = getarraykeyindex(var_cfd3d43b);
		s_minigame = getarrayvalue(var_cfd3d43b);
		var_af45ee8d = getnextarraykey(var_cfd3d43b);
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		return s_minigame.var_ff3c99c5.var_9e3fdeff;
	}
}

/*
	Name: function_7dcd3a3b
	Namespace: minigame
	Checksum: 0x55365721
	Offset: 0x1CC0
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_7dcd3a3b(kvp)
{
	var_b6bac679 = self function_358b4546(kvp);
	/#
		assert(var_b6bac679.size == 1, "");
	#/
	var_c2d9760b = var_b6bac679;
	var_c4030fed = getfirstarraykey(var_c2d9760b);
	if(isdefined(var_c4030fed))
	{
		var_135f2902 = getarraykeyindex(var_c4030fed);
		s_minigame = getarrayvalue(var_c4030fed);
		var_69f44fa9 = getnextarraykey(var_c4030fed);
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		return s_minigame.var_ff3c99c5.var_6dfc35a;
	}
}

/*
	Name: function_6f5dfae7
	Namespace: minigame
	Checksum: 0xFD12D1C4
	Offset: 0x1DC8
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_6f5dfae7(kvp)
{
	var_b6bac679 = self function_358b4546(kvp);
	/#
		assert(var_b6bac679.size == 1, "");
	#/
	var_dee5a487 = var_b6bac679;
	var_16e733c0 = getfirstarraykey(var_dee5a487);
	if(isdefined(var_16e733c0))
	{
		var_d587b45c = getarraykeyindex(var_16e733c0);
		s_minigame = getarrayvalue(var_16e733c0);
		var_17b32d98 = getnextarraykey(var_16e733c0);
		/#
			assert(isdefined(s_minigame.var_ff3c99c5), "");
		#/
		return s_minigame.var_ff3c99c5.var_63e8057;
	}
}

/*
	Name: function_c68ebedc
	Namespace: minigame
	Checksum: 0x3D7EBCE4
	Offset: 0x1ED0
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_c68ebedc(kvp)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		s_minigame flag::wait_till("success");
	}
}

/*
	Name: function_b3798a53
	Namespace: minigame
	Checksum: 0x7559FE19
	Offset: 0x1FB0
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_b3798a53(kvp)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		s_minigame flag::wait_till("fail");
	}
}

/*
	Name: function_3c605058
	Namespace: minigame
	Checksum: 0x74155F7B
	Offset: 0x2090
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_3c605058(kvp)
{
	var_b6bac679 = self function_358b4546(kvp);
	foreach(s_minigame in var_b6bac679)
	{
		if(s_minigame flag::get("complete"))
		{
			continue;
		}
		s_minigame flag::wait_till("playing");
	}
}

/*
	Name: function_63673f23
	Namespace: minigame
	Checksum: 0x4FE77B8F
	Offset: 0x2170
	Size: 0x1AE
	Parameters: 2
	Flags: Linked
*/
function function_63673f23(s_minigame, str_type)
{
	if(!isdefined(level.var_b6bac679))
	{
		level.var_b6bac679 = [];
	}
	else if(!isarray(level.var_b6bac679))
	{
		level.var_b6bac679 = array(level.var_b6bac679);
	}
	level.var_b6bac679[level.var_b6bac679.size] = s_minigame;
	if(!isdefined(level.var_1e600ced[str_type]))
	{
		level.var_1e600ced[str_type] = [];
	}
	else if(!isarray(level.var_1e600ced[str_type]))
	{
		level.var_1e600ced[str_type] = array(level.var_1e600ced[str_type]);
	}
	level.var_1e600ced[str_type][level.var_1e600ced[str_type].size] = s_minigame;
	s_minigame init_flags();
	if(isdefined(s_minigame.targetname))
	{
		s_minigame.str_identifier = (s_minigame.targetname + "_") + level.var_1e600ced[str_type].size;
	}
	else
	{
		s_minigame.str_identifier = (str_type + "_") + level.var_1e600ced[str_type].size;
	}
}

/*
	Name: function_71699fe2
	Namespace: minigame
	Checksum: 0x1F49F50E
	Offset: 0x2328
	Size: 0x13C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_71699fe2()
{
	foreach(str_type in array("threerings", "hackdoor", "spinners", "cryptopad", "lockpick"))
	{
		foreach(s_minigame in struct::get_script_bundle_instances("minigame_" + str_type))
		{
			function_63673f23(s_minigame, str_type);
		}
	}
}

/*
	Name: init_flags
	Namespace: minigame
	Checksum: 0x55A36A00
	Offset: 0x2470
	Size: 0x11C
	Parameters: 0
	Flags: Linked, Private
*/
function private init_flags()
{
	self flag::init("playing");
	self flag::init("enabled");
	self flag::init("success");
	self flag::init("fail");
	self flag::init("complete");
	if(isdefined(self.script_flag_true))
	{
		util::create_flags_and_return_tokens(self.script_flag_true);
	}
	if(isdefined(self.var_fff2f8a8))
	{
		util::create_flags_and_return_tokens(self.var_fff2f8a8);
	}
	if(isdefined(self.script_flag_set))
	{
		util::create_flags_and_return_tokens(self.script_flag_set);
	}
}

/*
	Name: function_e6adabd1
	Namespace: minigame
	Checksum: 0x40D55DFA
	Offset: 0x2598
	Size: 0xF4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e6adabd1()
{
	waittillframeend();
	foreach(s_minigame in level.var_b6bac679)
	{
		s_bundle = getscriptbundle(s_minigame.scriptbundlename);
		var_ff3c99c5 = [[level.class_factory[s_bundle.type]]]();
		[[ var_ff3c99c5 ]]->run(s_minigame, s_bundle);
	}
	level flag::set(#"hash_ead1c2fc78eb61c");
}

/*
	Name: function_374e4d47
	Namespace: minigame
	Checksum: 0xCC44E251
	Offset: 0x2698
	Size: 0x1A0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_374e4d47()
{
	foreach(var_7418aa09 in trigger::get_all())
	{
		var_178e6cb5 = [];
		foreach(s_minigame in level.var_b6bac679)
		{
			if(isdefined(var_7418aa09) && isdefined(var_7418aa09.target) && var_7418aa09.target === s_minigame.targetname)
			{
				if(!isdefined(var_178e6cb5))
				{
					var_178e6cb5 = [];
				}
				else if(!isarray(var_178e6cb5))
				{
					var_178e6cb5 = array(var_178e6cb5);
				}
				var_178e6cb5[var_178e6cb5.size] = s_minigame;
			}
		}
		if(var_178e6cb5.size)
		{
			var_7418aa09 thread function_cfb72f6(var_178e6cb5);
		}
	}
}

/*
	Name: function_cfb72f6
	Namespace: minigame
	Checksum: 0xFE429ABD
	Offset: 0x2840
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cfb72f6(var_178e6cb5)
{
	self endon(#"death");
	self trigger::wait_till();
	var_178e6cb5 function_fa6cc037();
}

/*
	Name: function_ab30c8b9
	Namespace: minigame
	Checksum: 0xFE181DB
	Offset: 0x2898
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ab30c8b9(s_minigame)
{
	self endon(#"death", #"entering_last_stand");
	level endon(#"game_ended");
	var_d5d783f8 = [4:12, 3:10, 2:8, 1:6];
	playtime = var_d5d783f8[s_minigame.var_ff3c99c5.var_9e3fdeff];
	playtime = playtime + (randomfloatrange(-1, 1));
	wait(playtime);
	if(isdefined(s_minigame))
	{
		team = (s_minigame function_7afabfe2() == 2 ? self.team : undefined);
		s_minigame function_d6209a68(undefined, team, self);
	}
}

/*
	Name: function_cc2939a2
	Namespace: minigame
	Checksum: 0x7CB52CEB
	Offset: 0x29C8
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_cc2939a2(var_248cbbcf)
{
	if(isdefined(self.var_645eee83))
	{
		return [[ self.var_645eee83 ]]->can_use(var_248cbbcf.player);
	}
	return 0;
}

/*
	Name: function_76974d96
	Namespace: minigame
	Checksum: 0x9482655D
	Offset: 0x2A08
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_76974d96(var_248cbbcf)
{
	if(isdefined(self.var_645eee83))
	{
		thread [[ self.var_645eee83 ]]->function_e43bda22(var_248cbbcf.player, var_248cbbcf.player getteam(), self.var_e992b321);
	}
}

/*
	Name: function_eb28f36
	Namespace: minigame
	Checksum: 0x5E9EDAF3
	Offset: 0x2A68
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function function_eb28f36(var_248cbbcf)
{
	if(isdefined(self.var_645eee83))
	{
		thread [[ self.var_645eee83 ]]->function_89999e9c(var_248cbbcf.player, 1);
	}
}

/*
	Name: function_358b4546
	Namespace: minigame
	Checksum: 0xFE82C1B0
	Offset: 0x69C0
	Size: 0x148
	Parameters: 2
	Flags: Linked, Private
*/
function private function_358b4546(kvp, str_type)
{
	if(!isdefined(str_type))
	{
		str_type = undefined;
	}
	var_b6bac679 = [];
	if(isdefined(kvp))
	{
		if(isarray(kvp))
		{
			str_value = kvp[0];
			str_key = kvp[1];
		}
		else
		{
			str_value = kvp;
			str_key = "targetname";
		}
		var_b6bac679 = struct::get_array(str_value, str_key);
	}
	else
	{
		var_b6bac679 = self;
		if(!isdefined(var_b6bac679))
		{
			var_b6bac679 = [];
		}
		else if(!isarray(var_b6bac679))
		{
			var_b6bac679 = array(var_b6bac679);
		}
	}
	var_b6bac679 = array::filter(var_b6bac679, 0, &function_e154102f, str_type);
	/#
		assert(var_b6bac679.size, "");
	#/
	return var_b6bac679;
}

/*
	Name: function_e154102f
	Namespace: minigame
	Checksum: 0x633511A
	Offset: 0x6B10
	Size: 0x2A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e154102f(var_ac1d69cd, str_type)
{
	return var_ac1d69cd function_7dc9b185(str_type);
}

/*
	Name: function_ad13b048
	Namespace: minigame
	Checksum: 0xA635155B
	Offset: 0x6B48
	Size: 0x2C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ad13b048(var_ac1d69cd, str_type)
{
	return !var_ac1d69cd function_7dc9b185(str_type);
}

/*
	Name: function_27a6b226
	Namespace: minigame
	Checksum: 0xF8FE5221
	Offset: 0x6B80
	Size: 0x44
	Parameters: 4
	Flags: None
*/
function function_27a6b226(var_92e792ba, var_72b833ec, var_248486f4, var_1ea9b69a)
{
	/#
		assert("");
	#/
}

/*
	Name: function_7a0057f8
	Namespace: minigame
	Checksum: 0x142B89C5
	Offset: 0x6BD0
	Size: 0x5C
	Parameters: 7
	Flags: None
*/
function function_7a0057f8(dud, var_e66d95c, var_208a7da3, var_e71d96e, var_20b57df5, var_ecf31671, var_c722cad1)
{
	/#
		assert("");
	#/
}

/*
	Name: function_98fbeac1
	Namespace: minigame
	Checksum: 0x7BDFA47C
	Offset: 0x6C38
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function function_98fbeac1(oldval, newval)
{
	e_player = self;
	if(is_true(e_player.var_f4f7edb2) && e_player == e_player.var_97c1c267.last_player)
	{
		s_minigame = e_player.var_97c1c267;
		var_847964c = float(newval) / (float(8 - 1));
		s_minigame.var_ff3c99c5 notify(#"minigame_progress", {#hash_477d921d:var_847964c, #minigame:e_player.var_97c1c267, #e_player:e_player});
	}
}

