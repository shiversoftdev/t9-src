#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_9b972177;

/*
	Name: function_a91b029a
	Namespace: namespace_9b972177
	Checksum: 0xF0C657B
	Offset: 0x140
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a91b029a()
{
	level notify(626361484);
}

/*
	Name: function_89f2df9
	Namespace: namespace_9b972177
	Checksum: 0x7D3419E1
	Offset: 0x160
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_946f5279d6cd83c", undefined, &function_2a159d3e, undefined, undefined);
}

/*
	Name: function_2a159d3e
	Namespace: namespace_9b972177
	Checksum: 0x994F2EC5
	Offset: 0x1A8
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2a159d3e()
{
	if(!is_true(level.is_survival))
	{
		return;
	}
	level.var_d1b0ffd = undefined;
	callback::on_spawned(&on_player_spawned);
	callback::on_connect(&on_player_connect);
	callback::add_callback(#"objective_started", &function_83b6d24a);
	callback::add_callback(#"hash_69090774fec4a17b", &function_2b1da4a6);
}

/*
	Name: on_end_game
	Namespace: namespace_9b972177
	Checksum: 0x24C3E1F2
	Offset: 0x280
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_end_game()
{
	function_5a47adab("gameover_survival");
}

/*
	Name: on_player_spawned
	Namespace: namespace_9b972177
	Checksum: 0xC01141D6
	Offset: 0x2A8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self thread underscore();
}

/*
	Name: on_player_connect
	Namespace: namespace_9b972177
	Checksum: 0x714D911C
	Offset: 0x2D0
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(flag::get(#"intro_scene_done"))
	{
		if(isdefined(level.var_d1b0ffd) && level.var_d1b0ffd != "")
		{
			self set_to_player(level.var_d1b0ffd);
		}
		else
		{
			self set_to_player("");
		}
	}
}

/*
	Name: function_83b6d24a
	Namespace: namespace_9b972177
	Checksum: 0x30664CB6
	Offset: 0x368
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_83b6d24a(params)
{
	if(!isdefined(params))
	{
		return;
	}
	if(!isdefined(params.instance))
	{
		return;
	}
	str_objective_name = undefined;
	s_instance = params.instance;
	if(isdefined(s_instance.content_script_name))
	{
		str_objective_name = s_instance.content_script_name;
	}
	function_df47d1da(str_objective_name);
}

/*
	Name: function_2b1da4a6
	Namespace: namespace_9b972177
	Checksum: 0x9A88A84B
	Offset: 0x3F0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_2b1da4a6(params)
{
	str_objective_name = undefined;
	s_instance = params.instance;
	if(isdefined(s_instance.content_script_name))
	{
		str_objective_name = s_instance.content_script_name;
	}
	function_a9cc2e9f(params.completed, str_objective_name);
}

/*
	Name: function_df47d1da
	Namespace: namespace_9b972177
	Checksum: 0xCCCBD046
	Offset: 0x460
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_df47d1da(str_objective_name)
{
	level notify(#"hash_1034af1a853c873d");
	function_5d985962(0);
	var_71ce1ff1 = function_86df3ee8(str_objective_name);
	if(isdefined(var_71ce1ff1))
	{
		var_9c1ed9ea = var_71ce1ff1;
	}
	else
	{
		var_9c1ed9ea = "survival_objective_" + randomintrange(0, 3);
	}
	function_5a47adab(var_9c1ed9ea);
}

/*
	Name: function_a9cc2e9f
	Namespace: namespace_9b972177
	Checksum: 0x874DBBCA
	Offset: 0x518
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_a9cc2e9f(b_completed, str_objective_name)
{
	if(!isdefined(str_objective_name))
	{
		str_objective_name = 1;
	}
	level notify(#"hash_27abcd3efcaaf572");
	if(str_objective_name)
	{
		function_5a47adab("");
		function_5d985962(1);
	}
}

/*
	Name: function_5d985962
	Namespace: namespace_9b972177
	Checksum: 0xAE250C63
	Offset: 0x598
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_5d985962(var_b375589a)
{
	level.var_b375589a = var_b375589a;
	if(!var_b375589a)
	{
		foreach(player in level.players)
		{
			player.var_edc6d524 = "";
			player.var_187e3f7e = "";
		}
	}
}

/*
	Name: underscore
	Namespace: namespace_9b972177
	Checksum: 0xC0A4863B
	Offset: 0x658
	Size: 0x136
	Parameters: 0
	Flags: Linked
*/
function underscore()
{
	self endon(#"death");
	self endon(#"disconnect");
	if(!isdefined(level.var_b375589a))
	{
		level.var_b375589a = 0;
	}
	if(!isdefined(self.var_edc6d524))
	{
		self.var_edc6d524 = "";
	}
	if(!isdefined(self.var_187e3f7e))
	{
		self.var_187e3f7e = "";
	}
	self thread function_28f119be();
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"hash_766bf24383b8f582");
		if(is_true(level.var_b375589a))
		{
			if(isdefined(waitresult.var_9c1ed9ea))
			{
				self.var_187e3f7e = waitresult.var_9c1ed9ea;
			}
			if(self.var_edc6d524 !== self.var_187e3f7e)
			{
				set_to_player(self.var_187e3f7e);
				self.var_edc6d524 = self.var_187e3f7e;
			}
		}
	}
}

/*
	Name: function_28f119be
	Namespace: namespace_9b972177
	Checksum: 0xAFBA39B7
	Offset: 0x798
	Size: 0x2F0
	Parameters: 0
	Flags: Linked
*/
function function_28f119be()
{
	self endon(#"death");
	self endon(#"disconnect");
	while(true)
	{
		if(!is_true(level.var_b375589a))
		{
			wait(0.1);
			continue;
		}
		n_counter = 0;
		a_enemies = getaiarray();
		foreach(enemy in a_enemies)
		{
			if(isdefined(enemy.favoriteenemy))
			{
				if(enemy.favoriteenemy == self)
				{
					n_counter++;
				}
			}
			if(n_counter >= 4)
			{
				break;
			}
		}
		if(n_counter >= 4 && self.var_edc6d524 != "survival_underscore_active")
		{
			self notify(#"hash_766bf24383b8f582", {#hash_9c1ed9ea:"survival_underscore_active"});
		}
		else
		{
			if(n_counter > 0 && self.var_edc6d524 === "")
			{
				self notify(#"hash_766bf24383b8f582", {#hash_9c1ed9ea:"survival_underscore"});
			}
			else
			{
				if(n_counter <= 0 && self.var_edc6d524 != "survival_underscore")
				{
					if(function_2d36215b(self, a_enemies))
					{
						self notify(#"hash_766bf24383b8f582", {#hash_9c1ed9ea:"survival_underscore"});
					}
					else
					{
						self notify(#"hash_766bf24383b8f582", {#hash_9c1ed9ea:""});
					}
				}
				else if(n_counter <= 0 && self.var_edc6d524 != "")
				{
					if(!function_2d36215b(self, a_enemies))
					{
						self notify(#"hash_766bf24383b8f582", {#hash_9c1ed9ea:""});
					}
				}
			}
		}
		wait(5);
	}
}

/*
	Name: function_2d36215b
	Namespace: namespace_9b972177
	Checksum: 0x3F3CA8F6
	Offset: 0xA90
	Size: 0x5E
	Parameters: 2
	Flags: Linked
*/
function function_2d36215b(e_player, a_enemies)
{
	ai_closest = array::get_all_closest(e_player.origin, a_enemies, undefined, undefined, 2500);
	if(ai_closest.size >= 4)
	{
		return true;
	}
	return false;
}

/*
	Name: function_5a47adab
	Namespace: namespace_9b972177
	Checksum: 0x98E0E166
	Offset: 0xAF8
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_5a47adab(var_9c1ed9ea)
{
	level.var_d1b0ffd = var_9c1ed9ea;
	foreach(player in level.players)
	{
		player set_to_player(var_9c1ed9ea);
	}
}

/*
	Name: set_to_player
	Namespace: namespace_9b972177
	Checksum: 0x3E80D007
	Offset: 0xBA8
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function set_to_player(var_9c1ed9ea)
{
	music::setmusicstate(var_9c1ed9ea, self);
}

/*
	Name: function_86df3ee8
	Namespace: namespace_9b972177
	Checksum: 0xD79AFC4C
	Offset: 0xBD8
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_86df3ee8(str_objective_name)
{
	str_override = undefined;
	switch(str_objective_name)
	{
		case "hash_3406c2bf6d710fc":
		{
			str_override = "survival_objective_hold_0";
			break;
		}
		default:
		{
			str_override = undefined;
			break;
		}
	}
	return str_override;
}

/*
	Name: function_57292af3
	Namespace: namespace_9b972177
	Checksum: 0xC974517E
	Offset: 0xC50
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_57292af3()
{
	function_5a47adab("survival_intro");
}

/*
	Name: insertion
	Namespace: namespace_9b972177
	Checksum: 0x63DB4245
	Offset: 0xC78
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function insertion(var_df887556)
{
	level endon(#"hash_1034af1a853c873d");
	wait(5);
	function_5d985962(1);
}

