#using scripts\core_common\scene_actor_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_objects_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

class csceneactor : csceneobject
{
	var _str_shot;
	var _e;
	var _o_scene;
	var var_55b4f21e;
	var m_align;
	var m_tag;
	var _s;
	var _str_team;

	/*
		Name: constructor
		Namespace: csceneactor
		Checksum: 0x549FAA60
		Offset: 0x1B8
		Size: 0x22
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self._b_set_goal = 1;
	}

	/*
		Name: destructor
		Namespace: csceneactor
		Checksum: 0xAC778CF5
		Offset: 0xAD0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: track_goal
		Namespace: csceneactor
		Checksum: 0x270A2C4C
		Offset: 0x550
		Size: 0x5A
		Parameters: 0
		Flags: Linked
	*/
	function track_goal()
	{
		self endon(_str_shot + "active");
		_e endon(#"death");
		_e waittill(#"goal_changed");
		self._b_set_goal = 0;
	}

	/*
		Name: function_d09b043
		Namespace: csceneactor
		Checksum: 0xBE3AE23D
		Offset: 0x6E0
		Size: 0x11C
		Parameters: 0
		Flags: Linked
	*/
	function function_d09b043()
	{
		self notify(#"hash_74f6d3a1ddcff42");
		self endon(#"hash_74f6d3a1ddcff42");
		_o_scene endon(#"scene_done", #"scene_stop", #"scene_skip_completed", #"hash_3168dab591a18b9b");
		s_waitresult = undefined;
		s_waitresult = _e waittill(#"death");
		self.var_1f97724a = 1;
		_e notify(#"hash_6e7fd8207fd988c6", {#str_scene:_o_scene._str_name});
		if(!is_true(_e.skipscenedeath))
		{
			self thread function_15360c8d();
		}
	}

	/*
		Name: function_15360c8d
		Namespace: csceneactor
		Checksum: 0x63033923
		Offset: 0x930
		Size: 0x194
		Parameters: 0
		Flags: Linked
	*/
	function function_15360c8d()
	{
		ent = _e;
		if(isdefined(ent))
		{
			if(isdefined(var_55b4f21e.deathanim) && !is_true(ent.var_67d418))
			{
				ent.var_4a438c2b = 1;
				ent setnormalhealth(1);
				align = m_align;
				if(is_true(var_55b4f21e.var_d49adf2f))
				{
					align = ent;
				}
				ent animation::play(var_55b4f21e.deathanim, align, m_tag, 1, (isdefined(var_55b4f21e.blend) ? var_55b4f21e.blend : 0.2), 0);
				if(isalive(ent))
				{
					ent.var_4a438c2b = 0;
					ent kill();
				}
			}
			else
			{
				ent animation::stop();
				ent startragdoll();
			}
		}
		csceneobject::function_1e19d813();
	}

	/*
		Name: _spawn_ent
		Namespace: csceneactor
		Checksum: 0xE9E8E891
		Offset: 0x1E8
		Size: 0x64
		Parameters: 0
		Flags: Linked
	*/
	function _spawn_ent()
	{
		if(isdefined(_s.model))
		{
			if(isassetloaded("aitype", _s.model))
			{
				function_bc340efa(_s.model);
			}
		}
	}

	/*
		Name: _cleanup
		Namespace: csceneactor
		Checksum: 0xAEDE23D9
		Offset: 0x428
		Size: 0x11C
		Parameters: 0
		Flags: Linked
	*/
	function _cleanup()
	{
		if(isactor(_e) && isalive(_e))
		{
			if(is_true(_s.delaymovementatend))
			{
				_e pathmode("move delayed", 1, randomfloatrange(2, 3));
			}
			else
			{
				_e pathmode("move allowed");
			}
			if(is_true(_s.lookatplayer))
			{
				_e lookatentity();
			}
			_e.var_67d418 = undefined;
			set_goal();
		}
	}

	/*
		Name: _set_values
		Namespace: csceneactor
		Checksum: 0x43B4059
		Offset: 0x808
		Size: 0x11C
		Parameters: 1
		Flags: Linked
	*/
	function _set_values(ent)
	{
		if(!isdefined(ent))
		{
			ent = _e;
		}
		if(!is_true(_s.takedamage))
		{
			csceneobject::set_ent_val("takedamage", 0, ent);
		}
		csceneobject::set_ent_val("ignoreme", !is_true(_s.attackme), ent);
		csceneobject::set_ent_val("allowdeath", is_true(_s.allowdeath), ent);
		csceneobject::set_ent_val("take_weapons", is_true(_s.removeweapon), ent);
	}

	/*
		Name: _prepare
		Namespace: csceneactor
		Checksum: 0x134245DD
		Offset: 0x300
		Size: 0x11C
		Parameters: 0
		Flags: Linked
	*/
	function _prepare()
	{
		if(isactor(_e))
		{
			thread track_goal();
			if(is_true(_s.lookatplayer))
			{
				closest_player = arraygetclosest(_e.origin, function_a1ef346b());
				_e lookatentity(closest_player, 1);
			}
			if(is_true(_s.skipdeathanim))
			{
				_e.var_67d418 = 1;
			}
			self._str_team = _e getteam();
		}
		csceneobject::_prepare();
	}

	/*
		Name: function_bc340efa
		Namespace: csceneactor
		Checksum: 0xF70F80F4
		Offset: 0x258
		Size: 0x9C
		Parameters: 1
		Flags: Linked
	*/
	function function_bc340efa(str_model)
	{
		self._e = spawnactor(str_model, csceneobject::function_d2039b28(), csceneobject::function_f9936b53(), undefined, 1);
		if(!isdefined(_e))
		{
			return;
		}
		self._str_team = _e getteam();
		_e setteam(_str_team);
	}

	/*
		Name: set_goal
		Namespace: csceneactor
		Checksum: 0x33A8F1EC
		Offset: 0x5B8
		Size: 0x11C
		Parameters: 0
		Flags: Linked
	*/
	function set_goal()
	{
		if(!(_e.scene_spawned === _o_scene._s.name && isdefined(_e.target)))
		{
			if(!isdefined(_e.script_forcecolor))
			{
				if(!_e flag::get(#"anim_reach"))
				{
					if(isdefined(_e.scenegoal))
					{
						_e setgoal(_e.scenegoal);
						_e.scenegoal = undefined;
					}
					else if(is_true(_s.var_37ccbf49))
					{
						_e setgoal(_e.origin);
					}
				}
			}
		}
	}

}

class cscenefakeactor : csceneobject, csceneactor
{
	var _e;
	var _s;

	/*
		Name: constructor
		Namespace: cscenefakeactor
		Checksum: 0xE64C638C
		Offset: 0x2430
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8, 16
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cscenefakeactor
		Checksum: 0x87914A9
		Offset: 0x2450
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: _spawn_ent
		Namespace: cscenefakeactor
		Checksum: 0xABD4290D
		Offset: 0x2168
		Size: 0x2BC
		Parameters: 0
		Flags: Linked
	*/
	function _spawn_ent()
	{
		if(isspawner(_e))
		{
			csceneactor::function_bc340efa(_e.aitype);
			if(isdefined(_e) && !isspawner(_e))
			{
				str_model = _e.aitype;
				self._str_team = _e getteam();
				weapon = _e.weapon;
				_e delete();
			}
		}
		else if(isdefined(_s.model))
		{
			if(isassetloaded("aitype", _s.model))
			{
				csceneactor::function_bc340efa(_s.model);
				if(isdefined(_e))
				{
					str_model = _e.aitype;
					self._str_team = _e getteam();
					weapon = _e.weapon;
					_e delete();
				}
			}
			else
			{
				str_model = _s.model;
			}
		}
		if(isdefined(str_model))
		{
			self._e = util::spawn_anim_model(str_model, csceneobject::function_d2039b28(), csceneobject::function_f9936b53());
			_e makefakeai();
			if(!is_true(_s.removeweapon) && !is_true(_s.hideweapon))
			{
				if(isdefined(weapon))
				{
					_e animation::attach_weapon(weapon);
				}
				else
				{
					_e animation::attach_weapon(getweapon(#"ar_accurate_t9"));
				}
			}
		}
	}

}

class cscenecompanion : csceneobject, csceneactor
{
	var _e;
	var _s;
	var _str_shot;
	var _o_scene;

	/*
		Name: constructor
		Namespace: cscenecompanion
		Checksum: 0x5158AF8B
		Offset: 0x4060
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8, 16
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cscenecompanion
		Checksum: 0xF5A10853
		Offset: 0x4080
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: _spawn_ent
		Namespace: cscenecompanion
		Checksum: 0x97090B84
		Offset: 0x3C50
		Size: 0x1E4
		Parameters: 0
		Flags: Linked
	*/
	function _spawn_ent()
	{
		if(isspawner(_e))
		{
			if(!csceneobject::error(_e.count < 1, "Trying to spawn AI for scene with spawner count < 1"))
			{
				self._e = _e spawner::spawn(1);
			}
		}
		else if(isassetloaded("aitype", _s.model))
		{
			self._e = spawnactor(_s.model, csceneobject::function_d2039b28(), csceneobject::function_f9936b53(), _s.name, 1);
		}
		if(!isdefined(_e))
		{
			return;
		}
		self._str_team = _e getteam();
		if(!isdefined(level.heroes))
		{
			level.heroes = [];
		}
		level.heroes[_s.name] = _e;
		_s.(_s.name) = _e;
		_e.animname = _s.name;
		_e.is_hero = 1;
		_e.enableterrainik = 1;
		_e util::magic_bullet_shield();
	}

	/*
		Name: _cleanup
		Namespace: cscenecompanion
		Checksum: 0x73E7DFB9
		Offset: 0x3E40
		Size: 0x7C
		Parameters: 0
		Flags: Linked
	*/
	function _cleanup()
	{
		if(!([[ _o_scene ]]->has_next_shot(_str_shot)) || _o_scene._str_mode === "single")
		{
			_e thread scene::function_37592f67(_o_scene._e_root, _o_scene._s);
		}
	}

	/*
		Name: animation_lookup
		Namespace: cscenecompanion
		Checksum: 0xFE8547C3
		Offset: 0x3F70
		Size: 0xE4
		Parameters: 3
		Flags: Linked
	*/
	function animation_lookup(animation, ent, b_camera)
	{
		if(!isdefined(b_camera))
		{
			b_camera = _e;
		}
		if(isdefined(_s.var_2df1a365))
		{
			n_shot = csceneobject::get_shot(_str_shot);
			var_d57bf586 = b_camera.animname;
			if(isdefined(n_shot) && isdefined(_s.var_2df1a365[n_shot]) && isdefined(_s.var_2df1a365[n_shot][var_d57bf586]))
			{
				return _s.var_2df1a365[n_shot][var_d57bf586].var_554345e4;
			}
		}
		return ent;
	}

	/*
		Name: _stop
		Namespace: cscenecompanion
		Checksum: 0xB61F75F1
		Offset: 0x3EC8
		Size: 0x9C
		Parameters: 1
		Flags: Linked
	*/
	function _stop(b_dont_clear_anim)
	{
		if(isalive(_e))
		{
			_e notify(#"scene_stop");
			if(!b_dont_clear_anim)
			{
				_e animation::stop(0.2);
			}
			_e thread scene::function_37592f67(_o_scene._e_root, _o_scene._s);
		}
	}

	/*
		Name: _spawn
		Namespace: cscenecompanion
		Checksum: 0xC3AE357
		Offset: 0x3B78
		Size: 0xCC
		Parameters: 0
		Flags: Linked
	*/
	function _spawn()
	{
		if(!isdefined(level.heroes))
		{
			level.heroes = [];
		}
		foreach(ent in level.heroes)
		{
			if(!csceneobject::in_this_scene(ent))
			{
				self._e = ent;
				return;
			}
		}
		csceneobject::_spawn();
	}

}

class cscenesharedcompanion : csceneobject, csceneactor, cscenecompanion
{

	/*
		Name: constructor
		Namespace: cscenesharedcompanion
		Checksum: 0x74F13D5F
		Offset: 0x59F8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8, 16
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cscenesharedcompanion
		Checksum: 0x1C73AB3A
		Offset: 0x5A18
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: _cleanup
		Namespace: cscenesharedcompanion
		Checksum: 0x84AC5EFF
		Offset: 0x5930
		Size: 0xBC
		Parameters: 0
		Flags: Linked
	*/
	function _cleanup()
	{
		if(!isdefined(level.heroes))
		{
			level.heroes = [];
		}
		foreach(ent in level.heroes)
		{
			ent setvisibletoall();
		}
		cscenecompanion::_cleanup();
	}

	/*
		Name: _prepare
		Namespace: cscenesharedcompanion
		Checksum: 0xB17EBEB3
		Offset: 0x5868
		Size: 0xC0
		Parameters: 0
		Flags: Linked
	*/
	function _prepare()
	{
		if(!isdefined(level.heroes))
		{
			level.heroes = [];
		}
		foreach(ent in level.heroes)
		{
			ent setinvisibletoall();
			ent setvisibletoall();
		}
	}

}

#namespace scene_actor_shared;

/*
	Name: function_dab08149
	Namespace: scene_actor_shared
	Checksum: 0x5DBB87E3
	Offset: 0x198
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dab08149()
{
	level notify(1525352896);
}

