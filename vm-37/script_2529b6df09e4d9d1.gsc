#using scripts\cp_common\bb.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_7cc5fb39b97494c4;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\doors_shared.gsc;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_d28acd06 : class_9e71c1a2
{
	var var_b5a03b21;
	var var_63e8057;
	var m_s_bundle;
	var var_1d21e4f3;
	var var_9e3fdeff;
	var var_6dfc35a;

	/*
		Name: constructor
		Namespace: namespace_d28acd06
		Checksum: 0x9E77691
		Offset: 0x3D8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_d28acd06
		Checksum: 0xABB817CA
		Offset: 0x3F8
		Size: 0x14
		Parameters: 0
		Flags: 16
	*/
	destructor()
	{
	}

	/*
		Name: function_27940f1f
		Namespace: namespace_d28acd06
		Checksum: 0x607E1763
		Offset: 0x798
		Size: 0xC4
		Parameters: 1
		Flags: None
	*/
	function function_27940f1f(str_team)
	{
		if(isdefined(var_b5a03b21.last_player))
		{
			var_b5a03b21.last_player flag::clear("lockpicking");
			var_b5a03b21.last_player val::reset_all(#"lockpicking");
			var_b5a03b21.last_player function_e0c7d69(1);
			var_b5a03b21.last_player notify(#"hash_226f6717c97d10d6");
		}
	}

	/*
		Name: _init
		Namespace: namespace_d28acd06
		Checksum: 0x6E3A0F4C
		Offset: 0x418
		Size: 0x344
		Parameters: 0
		Flags: None
	*/
	function _init()
	{
		self.var_1c4a269e = 1;
		self.var_7529951f = 1;
		self.var_b4563cfa = #"hash_74dc1865536890ee";
		if(sessionmodeiscampaigngame() && isdefined(level.var_6a7fb742))
		{
			foreach(var_e992b321 in var_63e8057)
			{
				if(isdefined(var_e992b321.c_door) && isdefined(var_e992b321.c_door.m_e_door))
				{
					bundle = getscriptbundle(m_s_bundle.gameobject);
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
					local_offset = rotatepoint(var_b5a03b21.origin - var_e992b321.c_door.m_e_door.origin, (0, 0, 0) - var_e992b321.c_door.m_e_door.angles);
					var_de6f0004 = (isdefined(bundle.n_trigger_use_time) ? bundle.n_trigger_use_time : 0);
					var_e992b321.c_door.m_e_door.var_645eee83 = self;
					var_e992b321.c_door.m_e_door.var_e992b321 = var_e992b321;
					var_e992b321.c_door.m_e_door thread [[level.var_6a7fb742]](#"use", {#complete_callback:&minigame::function_76974d96, #hash_531201f1:&minigame::function_cc2939a2, #hash_be77841a:0, #hash_de6f0004:var_de6f0004, #hash_87c991f3:40, #hash_754bedbb:0, #offset:local_offset, #hash_71b9f0c0:200, #image:image, #hash_4d98c3ce:var_4d98c3ce});
				}
			}
		}
	}

	/*
		Name: function_309c16b5
		Namespace: namespace_d28acd06
		Checksum: 0x68CFE98A
		Offset: 0xB98
		Size: 0x38
		Parameters: 2
		Flags: None
	*/
	function function_309c16b5(e_player, n_new_val)
	{
		[[ self ]]->complete(e_player, n_new_val == 2, e_player.team);
	}

	/*
		Name: _fail
		Namespace: namespace_d28acd06
		Checksum: 0xD584E715
		Offset: 0xB38
		Size: 0x34
		Parameters: 1
		Flags: None
	*/
	function _fail(e_player)
	{
		bb::logplayermapnotification("lockpick_fail", e_player);
		[[ self ]]->function_27940f1f();
	}

	/*
		Name: _update
		Namespace: namespace_d28acd06
		Checksum: 0x1BD61105
		Offset: 0x9C8
		Size: 0xC
		Parameters: 1
		Flags: None
	*/
	function _update(e_player)
	{
	}

	/*
		Name: _start
		Namespace: namespace_d28acd06
		Checksum: 0xF6F2298D
		Offset: 0x768
		Size: 0x28
		Parameters: 1
		Flags: None
	*/
	function _start(e_player)
	{
		e_player.var_ff7ce13b[m_s_bundle.type] = 0;
	}

	/*
		Name: _stop
		Namespace: namespace_d28acd06
		Checksum: 0xADF36F6
		Offset: 0x9E0
		Size: 0x34
		Parameters: 1
		Flags: None
	*/
	function _stop(e_player)
	{
		if(isdefined(e_player))
		{
			e_player clientfield::set_to_player("lockpick_state", 0);
		}
	}

	/*
		Name: function_91ef58fb
		Namespace: namespace_d28acd06
		Checksum: 0xB3F7007B
		Offset: 0xB78
		Size: 0x18
		Parameters: 1
		Flags: None
	*/
	function function_91ef58fb(var_f8d01c02)
	{
		return var_1d21e4f3[var_f8d01c02];
	}

	/*
		Name: function_a466ed26
		Namespace: namespace_d28acd06
		Checksum: 0x4926E62A
		Offset: 0x868
		Size: 0x154
		Parameters: 1
		Flags: None
	*/
	function function_a466ed26(e_player)
	{
		/#
			assert(var_9e3fdeff > 0);
		#/
		/#
			assert(var_6dfc35a >= 0);
		#/
		if(isdefined(e_player))
		{
			e_player val::set(#"lockpicking", "disable_weapons", 1);
			e_player val::set(#"lockpicking", "show_weapon_hud", 0);
			e_player flag::set("lockpicking");
			e_player function_e0c7d69(0);
			e_player clientfield::set_to_player("lockpick_num_pins", var_9e3fdeff);
			e_player clientfield::set_to_player("lockpick_lock_index", var_6dfc35a);
			e_player clientfield::set_to_player("lockpick_state", 1);
		}
	}

	/*
		Name: _success
		Namespace: namespace_d28acd06
		Checksum: 0x39E8376E
		Offset: 0xA20
		Size: 0x110
		Parameters: 1
		Flags: None
	*/
	function _success(e_player)
	{
		if(isdefined(var_b5a03b21.target))
		{
			if(!isdefined(var_b5a03b21.var_42c5101))
			{
				var_b5a03b21.var_42c5101 = 1;
			}
			if(isdefined(var_b5a03b21.var_ac5b22fa))
			{
				var_b5a03b21.var_ac5b22fa doors::unlock(undefined, undefined, var_b5a03b21.var_42c5101, e_player);
			}
			else
			{
				doors::unlock(var_b5a03b21.target, "targetname", var_b5a03b21.var_42c5101, e_player);
			}
		}
		bb::logplayermapnotification("lockpick_success", e_player);
		e_player notify(#"minigame_tutorial_complete");
		[[ self ]]->function_27940f1f();
	}

}

#namespace lockpick;

/*
	Name: __init__system__
	Namespace: lockpick
	Checksum: 0x7E55CC5A
	Offset: 0x1A0
	Size: 0x5C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	level.class_factory["minigame_" + "lockpick"] = &function_8d584152;
	system::register("lockpick", &function_70a657d8);
}

/*
	Name: function_70a657d8
	Namespace: lockpick
	Checksum: 0x9D6F1721
	Offset: 0x208
	Size: 0xCC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "lockpick_state", 1, 1, "int");
	clientfield::register("toplayer", "lockpick_num_pins", 1, 3, "int");
	clientfield::register("toplayer", "lockpick_lock_index", 1, 1, "int");
	serverfield::register("lockpick_state", 1, 2, "int", &function_74ad25ad);
}

/*
	Name: function_8d584152
	Namespace: lockpick
	Checksum: 0xBC9D9FED
	Offset: 0x2E0
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_8d584152()
{
	return new class_d28acd06();
}

/*
	Name: cancel
	Namespace: lockpick
	Checksum: 0xCE2C356D
	Offset: 0x300
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function cancel()
{
	/#
		assert(isplayer(self), "");
	#/
	if(self.var_97c1c267.last_player === self)
	{
		self.var_97c1c267 minigame::function_c09ff52(undefined, undefined, self);
	}
}

/*
	Name: function_74ad25ad
	Namespace: lockpick
	Checksum: 0x27544905
	Offset: 0x378
	Size: 0x58
	Parameters: 2
	Flags: Private
*/
function private function_74ad25ad(oldval, newval)
{
	if(newval > 0 && self.var_97c1c267.last_player === self)
	{
		[[ self.var_97c1c267.var_ff3c99c5 ]]->function_309c16b5(self, newval);
	}
}

