#using script_7cc5fb39b97494c4;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\doors_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\bb.gsc;

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
		Checksum: 0x53613915
		Offset: 0x408
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_d28acd06
		Checksum: 0x6F097A2B
		Offset: 0x428
		Size: 0x14
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_27940f1f
		Namespace: namespace_d28acd06
		Checksum: 0x42A5BA89
		Offset: 0x878
		Size: 0xC4
		Parameters: 1
		Flags: Linked
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
		Checksum: 0x383CFA4D
		Offset: 0x448
		Size: 0x374
		Parameters: 0
		Flags: Linked
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
					var_e992b321.c_door.m_e_door thread [[level.var_6a7fb742]](#"use", {#hash_67eb3347:&minigame::function_eb28f36, #hash_c9643122:1, #complete_callback:&minigame::function_76974d96, #hash_531201f1:&minigame::function_cc2939a2, #hash_be77841a:0, #hash_de6f0004:var_de6f0004, #hash_87c991f3:40, #hash_754bedbb:0, #offset:local_offset, #hash_71b9f0c0:200, #image:image, #hash_4d98c3ce:var_4d98c3ce});
				}
			}
		}
	}

	/*
		Name: function_309c16b5
		Namespace: namespace_d28acd06
		Checksum: 0x76DD936A
		Offset: 0xCB0
		Size: 0x38
		Parameters: 2
		Flags: Linked
	*/
	function function_309c16b5(e_player, var_ee0af263)
	{
		[[ self ]]->complete(e_player, var_ee0af263 == 2, e_player.team);
	}

	/*
		Name: _fail
		Namespace: namespace_d28acd06
		Checksum: 0x38FF24CC
		Offset: 0xC50
		Size: 0x34
		Parameters: 1
		Flags: Linked
	*/
	function _fail(e_player)
	{
		bb::logplayermapnotification("lockpick_fail", e_player);
		[[ self ]]->function_27940f1f();
	}

	/*
		Name: _update
		Namespace: namespace_d28acd06
		Checksum: 0x8B3645C0
		Offset: 0xAC8
		Size: 0xC
		Parameters: 1
		Flags: Linked
	*/
	function _update(e_player)
	{
	}

	/*
		Name: _start
		Namespace: namespace_d28acd06
		Checksum: 0xAEE52E
		Offset: 0x848
		Size: 0x28
		Parameters: 1
		Flags: Linked
	*/
	function _start(e_player)
	{
		e_player.var_ff7ce13b[m_s_bundle.type] = 0;
	}

	/*
		Name: _stop
		Namespace: namespace_d28acd06
		Checksum: 0x21F48A40
		Offset: 0xAE0
		Size: 0x34
		Parameters: 1
		Flags: Linked
	*/
	function _stop(e_player)
	{
		if(isdefined(e_player))
		{
			e_player clientfield::set_to_player("lockpick_state", 0);
		}
	}

	/*
		Name: function_89999e9c
		Namespace: namespace_d28acd06
		Checksum: 0x99C35AD6
		Offset: 0x7C8
		Size: 0x74
		Parameters: 2
		Flags: Linked
	*/
	function function_89999e9c(player, stream)
	{
		if(sessionmodeiscampaigngame())
		{
			setuimodelvalue(getuimodel(function_90d058e8(#"lockpick"), "stream"), stream);
		}
	}

	/*
		Name: function_91ef58fb
		Namespace: namespace_d28acd06
		Checksum: 0xDA40691C
		Offset: 0xC90
		Size: 0x18
		Parameters: 1
		Flags: Linked
	*/
	function function_91ef58fb(var_f8d01c02)
	{
		return var_1d21e4f3[var_f8d01c02];
	}

	/*
		Name: function_a466ed26
		Namespace: namespace_d28acd06
		Checksum: 0x1F1A58D2
		Offset: 0x948
		Size: 0x178
		Parameters: 1
		Flags: Linked
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
			if(isdefined(level.var_9f2ab8b3))
			{
				e_player thread [[level.var_9f2ab8b3]]();
			}
		}
	}

	/*
		Name: _success
		Namespace: namespace_d28acd06
		Checksum: 0x675C8BC6
		Offset: 0xB20
		Size: 0x124
		Parameters: 1
		Flags: Linked
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
		[[ self ]]->function_89999e9c(e_player, 0);
		[[ self ]]->function_27940f1f();
	}

}

#namespace lockpick;

/*
	Name: function_124b49ac
	Namespace: lockpick
	Checksum: 0x15D76445
	Offset: 0x1B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_124b49ac()
{
	level notify(1735451933);
}

/*
	Name: function_89f2df9
	Namespace: lockpick
	Checksum: 0x812A9B0E
	Offset: 0x1D0
	Size: 0x5C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	level.class_factory["minigame_" + "lockpick"] = &function_8d584152;
	system::register("lockpick", &function_70a657d8);
}

/*
	Name: function_70a657d8
	Namespace: lockpick
	Checksum: 0x45E87069
	Offset: 0x238
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
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
	Checksum: 0xF9B86E96
	Offset: 0x310
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_8d584152()
{
	return new class_d28acd06();
}

/*
	Name: cancel
	Namespace: lockpick
	Checksum: 0x8BB6CDC9
	Offset: 0x330
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
	Checksum: 0xC873210C
	Offset: 0x3A8
	Size: 0x58
	Parameters: 2
	Flags: Linked, Private
*/
function private function_74ad25ad(oldval, newval)
{
	if(newval > 0 && self.var_97c1c267.last_player === self)
	{
		[[ self.var_97c1c267.var_ff3c99c5 ]]->function_309c16b5(self, newval);
	}
}

