#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\scene_objects_shared.gsc;

class cscenevehicle : csceneobject
{
	var _o_scene;
	var _e;
	var _s;

	/*
		Name: constructor
		Namespace: cscenevehicle
		Checksum: 0xCD9FFC61
		Offset: 0x5E0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8, 128
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cscenevehicle
		Checksum: 0x8C2FEA2
		Offset: 0x600
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_d09b043
		Namespace: cscenevehicle
		Checksum: 0xC8EFBAD8
		Offset: 0x4B8
		Size: 0x11C
		Parameters: 0
		Flags: Linked
	*/
	function function_d09b043()
	{
		self notify(#"hash_3451c0bca5c1ca69");
		self endon(#"hash_3451c0bca5c1ca69");
		_o_scene endon(#"scene_done", #"scene_stop", #"scene_skip_completed", #"hash_3168dab591a18b9b");
		s_waitresult = undefined;
		s_waitresult = _e waittill(#"death");
		self.var_1f97724a = 1;
		_e notify(#"hash_6e7fd8207fd988c6", {#str_scene:_o_scene._str_name});
		if(!is_true(_e.skipscenedeath))
		{
			csceneobject::function_1e19d813();
		}
	}

	/*
		Name: _spawn_ent
		Namespace: cscenevehicle
		Checksum: 0x47239D54
		Offset: 0x180
		Size: 0xDC
		Parameters: 0
		Flags: Linked
	*/
	function _spawn_ent()
	{
		if(isdefined(_s.model))
		{
			if(isassetloaded("vehicle", _s.model))
			{
				self._e = spawnvehicle(_s.model, csceneobject::function_d2039b28(), csceneobject::function_f9936b53(), undefined, 0, undefined, _s.var_6b8decce, _s.var_4f56e47a, _s.var_3b48be8d);
				scene::prepare_generic_model_anim(_e);
			}
		}
	}

	/*
		Name: _cleanup
		Namespace: cscenevehicle
		Checksum: 0x637EFDB3
		Offset: 0x448
		Size: 0x64
		Parameters: 0
		Flags: Linked
	*/
	function _cleanup()
	{
		if(isdefined(_e) && _e vehicle_ai::has_state("scripted"))
		{
			_e vehicle_ai::stop_scripted(_e.var_24bb7024);
		}
	}

	/*
		Name: _set_values
		Namespace: cscenevehicle
		Checksum: 0x373122FD
		Offset: 0x268
		Size: 0x13C
		Parameters: 1
		Flags: Linked
	*/
	function _set_values(ent)
	{
		if(!isdefined(ent))
		{
			ent = _e;
		}
		if(!(csceneobject::error(!isvehicle(ent) && ent.classname !== "script_model", "entity is not actually a Vehicle or script_model, but set to Vehicle in scene. Check the GDT to make sure the proper object type is set")))
		{
			scene::prepare_generic_model_anim(ent);
		}
		csceneobject::set_ent_val("takedamage", is_true(_s.takedamage), ent);
		csceneobject::set_ent_val("ignoreme", !is_true(_s.attackme), ent);
		csceneobject::set_ent_val("allowdeath", is_true(_s.allowdeath), ent);
	}

	/*
		Name: _prepare
		Namespace: cscenevehicle
		Checksum: 0x1A6BD746
		Offset: 0x3B0
		Size: 0x8C
		Parameters: 0
		Flags: Linked
	*/
	function _prepare()
	{
		csceneobject::set_objective();
		if(isdefined(_e) && _e vehicle_ai::has_state("scripted"))
		{
			_e.var_24bb7024 = _e vehicle_ai::get_current_state();
			_e vehicle_ai::start_scripted();
		}
	}

}

