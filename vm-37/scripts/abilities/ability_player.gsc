#using scripts\abilities\ability_util.gsc;
#using scripts\abilities\ability_power.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace ability_player;

/*
	Name: __init__system__
	Namespace: ability_player
	Checksum: 0x8073DAE1
	Offset: 0x190
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"ability_player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: ability_player
	Checksum: 0xA9EA03F5
	Offset: 0x1D8
	Size: 0xEC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level callback::add_callback(#"on_end_game", &on_end_game);
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	callback::on_disconnect(&on_player_disconnect);
	callback::on_player_killed(&function_32e782df);
	if(!isdefined(level._gadgets_level))
	{
		level._gadgets_level = [];
	}
	/#
		level thread abilities_devgui_init();
	#/
}

/*
	Name: on_player_connect
	Namespace: ability_player
	Checksum: 0x9966AE67
	Offset: 0x2D0
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(!isdefined(self._gadgets_player))
	{
		self._gadgets_player = [];
	}
	if(!isdefined(self.var_aec4af05))
	{
		self.var_aec4af05 = [];
	}
	if(!isdefined(self.pers[#"herogadgetnotified"]))
	{
		self.pers[#"herogadgetnotified"] = [];
	}
	for(slot = 0; slot < 3; slot++)
	{
		self.pers[#"herogadgetnotified"][slot] = 0;
	}
	/#
		if(self getentnum() < 10)
		{
			self thread abilities_devgui_player_connect();
		}
	#/
}

/*
	Name: on_player_spawned
	Namespace: ability_player
	Checksum: 0x9551678F
	Offset: 0x3B8
	Size: 0x2C6
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	var_aa960fc9 = self getweaponslist();
	foreach(weapon in var_aa960fc9)
	{
		if((isdefined(weapon.gadget_power_reset_on_spawn) ? weapon.gadget_power_reset_on_spawn : 0))
		{
			slot = self gadgetgetslot(weapon);
			isfirstspawn = (isdefined(self.firstspawn) ? self.firstspawn : 1);
			self gadgetpowerreset(slot, isfirstspawn);
		}
	}
	if((isdefined(self.var_36546d49) ? self.var_36546d49 : 1) && game.state == #"playing")
	{
		self.var_36546d49 = 0;
		for(slot = 0; slot < 3; slot++)
		{
			if(isdefined(self._gadgets_player) && isdefined(self._gadgets_player[slot]))
			{
				gadgetweapon = self._gadgets_player[slot];
				if((isdefined(gadgetweapon.var_ddaa57f2) ? gadgetweapon.var_ddaa57f2 : 0))
				{
					self gadgetpowerset(slot, (isdefined(gadgetweapon.var_6a864cad) ? gadgetweapon.var_6a864cad : 100));
				}
			}
		}
	}
	else if(game.state != #"playing")
	{
		self.var_36546d49 = 0;
	}
	if(!is_true(self.pers[#"changed_class"]))
	{
		self.pers[#"held_gadgets_power"] = [];
		self.pers[#"hash_7a954c017d693f69"] = [];
		self.pers[#"hash_68cdf8807cfaabff"] = [];
	}
	self.heroabilityactivatetime = undefined;
	self.heroabilitydectivatetime = undefined;
	self.heroabilityactive = undefined;
}

/*
	Name: on_player_disconnect
	Namespace: ability_player
	Checksum: 0x7001288A
	Offset: 0x688
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_disconnect()
{
	/#
		self thread abilities_devgui_player_disconnect();
	#/
}

/*
	Name: is_using_any_gadget
	Namespace: ability_player
	Checksum: 0x4A7FFD55
	Offset: 0x6B0
	Size: 0x66
	Parameters: 0
	Flags: None
*/
function is_using_any_gadget()
{
	if(!isplayer(self))
	{
		return false;
	}
	for(i = 0; i < 3; i++)
	{
		if(self util::gadget_is_in_use(i))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: gadgets_save_power
	Namespace: ability_player
	Checksum: 0x38F1120A
	Offset: 0x720
	Size: 0x19E
	Parameters: 1
	Flags: Linked
*/
function gadgets_save_power(game_ended)
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	for(slot = 0; slot < 3; slot++)
	{
		if(!isdefined(self._gadgets_player[slot]))
		{
			continue;
		}
		gadgetweapon = self._gadgets_player[slot];
		powerleft = self gadgetpowerchange(slot, 0);
		var_51ec1787 = self function_adc6203f(slot);
		deployed = self function_36dfc05f(slot);
		if(game_ended && (deployed || util::gadget_is_in_use(slot)))
		{
			if(gadgetweapon.gadget_power_round_end_active_penalty > 0)
			{
				powerleft = powerleft - gadgetweapon.gadget_power_round_end_active_penalty;
				powerleft = max(0, powerleft);
			}
		}
		self.pers[#"held_gadgets_power"][gadgetweapon] = powerleft;
		self.pers[#"hash_7a954c017d693f69"][gadgetweapon] = var_51ec1787;
		self.pers[#"hash_68cdf8807cfaabff"][gadgetweapon] = deployed;
	}
}

/*
	Name: function_c9b950e3
	Namespace: ability_player
	Checksum: 0xAACACDC4
	Offset: 0x8C8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_c9b950e3()
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	for(slot = 0; slot < 3; slot++)
	{
		if(!isdefined(self._gadgets_player[slot]))
		{
			continue;
		}
		self function_19ed70ca(slot, 0);
	}
}

/*
	Name: function_116ec442
	Namespace: ability_player
	Checksum: 0xDED2E10
	Offset: 0x938
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_116ec442()
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	for(slot = 0; slot < 3; slot++)
	{
		if(!isdefined(self._gadgets_player[slot]))
		{
			continue;
		}
		if(self._gadgets_player[slot].statname == #"gadget_health_regen")
		{
			continue;
		}
		self function_19ed70ca(slot, 1);
	}
}

/*
	Name: function_c22f319e
	Namespace: ability_player
	Checksum: 0x9FB0B66A
	Offset: 0x9D8
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_c22f319e(weapon, var_4dd90b81)
{
	if(!isdefined(var_4dd90b81))
	{
		var_4dd90b81 = 0;
	}
	slot = self gadgetgetslot(weapon);
	self gadgetdeactivate(slot, weapon, var_4dd90b81);
	self function_ac25fc1f(slot, weapon);
}

/*
	Name: function_f2250880
	Namespace: ability_player
	Checksum: 0x8383F75E
	Offset: 0xA60
	Size: 0x1B4
	Parameters: 2
	Flags: Linked
*/
function function_f2250880(weapon, var_4dd90b81)
{
	if(!isdefined(var_4dd90b81))
	{
		var_4dd90b81 = 0;
	}
	if(!isdefined(self) || !isdefined(weapon))
	{
		return;
	}
	if(isalive(self))
	{
		slot = self gadgetgetslot(weapon);
		self function_95218c27(slot, var_4dd90b81);
	}
	else
	{
		if(!isdefined(self.var_8912d8d9))
		{
			self.var_8912d8d9 = [];
			self.var_41ea5be4 = [];
		}
		if(!isdefined(self.var_8912d8d9))
		{
			self.var_8912d8d9 = [];
		}
		else if(!isarray(self.var_8912d8d9))
		{
			self.var_8912d8d9 = array(self.var_8912d8d9);
		}
		self.var_8912d8d9[self.var_8912d8d9.size] = weapon;
		if(!isdefined(self.var_41ea5be4))
		{
			self.var_41ea5be4 = [];
		}
		else if(!isarray(self.var_41ea5be4))
		{
			self.var_41ea5be4 = array(self.var_41ea5be4);
		}
		self.var_41ea5be4[self.var_41ea5be4.size] = var_4dd90b81;
		callback::function_d8abfc3d(#"on_player_spawned", &function_9c46835d);
	}
}

/*
	Name: function_9c46835d
	Namespace: ability_player
	Checksum: 0x25457E5D
	Offset: 0xC20
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_9c46835d(params)
{
	if(isdefined(self.var_8912d8d9))
	{
		for(i = 0; i < self.var_8912d8d9.size; i++)
		{
			slot = self gadgetgetslot(self.var_8912d8d9[i]);
			self function_95218c27(slot, self.var_41ea5be4[i]);
		}
	}
	self.var_8912d8d9 = undefined;
	self.var_41ea5be4 = undefined;
	callback::function_52ac9652(#"on_player_spawned", &function_9c46835d);
}

/*
	Name: function_95218c27
	Namespace: ability_player
	Checksum: 0x885EA03E
	Offset: 0xCF8
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function function_95218c27(slot, var_4dd90b81)
{
	if(!isdefined(var_4dd90b81))
	{
		var_4dd90b81 = 0;
	}
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	if(!isdefined(self._gadgets_player[slot]))
	{
		return;
	}
	self.pers[#"hash_68cdf8807cfaabff"][self._gadgets_player[slot]] = 0;
	self function_48e08b4(slot, self._gadgets_player[slot], var_4dd90b81);
}

/*
	Name: function_c2d9d3e1
	Namespace: ability_player
	Checksum: 0xA3E357C5
	Offset: 0xD98
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_c2d9d3e1()
{
	for(slot = 0; slot < 3; slot++)
	{
		self function_95218c27(slot);
	}
}

/*
	Name: function_32e782df
	Namespace: ability_player
	Checksum: 0x713840EF
	Offset: 0xDE0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_32e782df(params)
{
	if(game.state != #"playing")
	{
		return;
	}
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	self gadgets_save_power(0);
}

/*
	Name: on_end_game
	Namespace: ability_player
	Checksum: 0xB513A992
	Offset: 0xE40
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function on_end_game()
{
	players = getplayers();
	foreach(player in players)
	{
		if(!isalive(player))
		{
			continue;
		}
		if(!isdefined(player._gadgets_player))
		{
			continue;
		}
		player gadgets_save_power(1);
	}
}

/*
	Name: script_set_cclass
	Namespace: ability_player
	Checksum: 0xB16B269F
	Offset: 0xF18
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function script_set_cclass(cclass, save)
{
}

/*
	Name: register_gadget
	Namespace: ability_player
	Checksum: 0x51BD8D8D
	Offset: 0xF38
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function register_gadget(type)
{
	if(!isdefined(level._gadgets_level))
	{
		level._gadgets_level = [];
	}
	if(!isdefined(level._gadgets_level[type]))
	{
		level._gadgets_level[type] = spawnstruct();
		level._gadgets_level[type].should_notify = 1;
	}
}

/*
	Name: register_gadget_should_notify
	Namespace: ability_player
	Checksum: 0x4ED32A23
	Offset: 0xFC0
	Size: 0x4E
	Parameters: 2
	Flags: None
*/
function register_gadget_should_notify(type, should_notify)
{
	register_gadget(type);
	if(isdefined(should_notify))
	{
		level._gadgets_level[type].should_notify = should_notify;
	}
}

/*
	Name: register_gadget_possession_callbacks
	Namespace: ability_player
	Checksum: 0x8CF5DBC8
	Offset: 0x1018
	Size: 0x24C
	Parameters: 3
	Flags: Linked
*/
function register_gadget_possession_callbacks(type, on_give, on_take)
{
	register_gadget(type);
	if(!isdefined(level._gadgets_level[type].on_give))
	{
		level._gadgets_level[type].on_give = [];
	}
	if(!isdefined(level._gadgets_level[type].on_take))
	{
		level._gadgets_level[type].on_take = [];
	}
	if(isdefined(on_give))
	{
		if(!isdefined(level._gadgets_level[type].on_give))
		{
			level._gadgets_level[type].on_give = [];
		}
		else if(!isarray(level._gadgets_level[type].on_give))
		{
			level._gadgets_level[type].on_give = array(level._gadgets_level[type].on_give);
		}
		level._gadgets_level[type].on_give[level._gadgets_level[type].on_give.size] = on_give;
	}
	if(isdefined(on_take))
	{
		if(!isdefined(level._gadgets_level[type].on_take))
		{
			level._gadgets_level[type].on_take = [];
		}
		else if(!isarray(level._gadgets_level[type].on_take))
		{
			level._gadgets_level[type].on_take = array(level._gadgets_level[type].on_take);
		}
		level._gadgets_level[type].on_take[level._gadgets_level[type].on_take.size] = on_take;
	}
}

/*
	Name: register_gadget_activation_callbacks
	Namespace: ability_player
	Checksum: 0x5A004AE1
	Offset: 0x1270
	Size: 0x24C
	Parameters: 3
	Flags: Linked
*/
function register_gadget_activation_callbacks(type, turn_on, turn_off)
{
	register_gadget(type);
	if(!isdefined(level._gadgets_level[type].turn_on))
	{
		level._gadgets_level[type].turn_on = [];
	}
	if(!isdefined(level._gadgets_level[type].turn_off))
	{
		level._gadgets_level[type].turn_off = [];
	}
	if(isdefined(turn_on))
	{
		if(!isdefined(level._gadgets_level[type].turn_on))
		{
			level._gadgets_level[type].turn_on = [];
		}
		else if(!isarray(level._gadgets_level[type].turn_on))
		{
			level._gadgets_level[type].turn_on = array(level._gadgets_level[type].turn_on);
		}
		level._gadgets_level[type].turn_on[level._gadgets_level[type].turn_on.size] = turn_on;
	}
	if(isdefined(turn_off))
	{
		if(!isdefined(level._gadgets_level[type].turn_off))
		{
			level._gadgets_level[type].turn_off = [];
		}
		else if(!isarray(level._gadgets_level[type].turn_off))
		{
			level._gadgets_level[type].turn_off = array(level._gadgets_level[type].turn_off);
		}
		level._gadgets_level[type].turn_off[level._gadgets_level[type].turn_off.size] = turn_off;
	}
}

/*
	Name: function_92292af6
	Namespace: ability_player
	Checksum: 0xDF1B1D4E
	Offset: 0x14C8
	Size: 0x24C
	Parameters: 3
	Flags: None
*/
function function_92292af6(type, deployed_on, deployed_off)
{
	register_gadget(type);
	if(!isdefined(level._gadgets_level[type].deployed_on))
	{
		level._gadgets_level[type].deployed_on = [];
	}
	if(!isdefined(level._gadgets_level[type].deployed_off))
	{
		level._gadgets_level[type].deployed_off = [];
	}
	if(isdefined(deployed_on))
	{
		if(!isdefined(level._gadgets_level[type].deployed_on))
		{
			level._gadgets_level[type].deployed_on = [];
		}
		else if(!isarray(level._gadgets_level[type].deployed_on))
		{
			level._gadgets_level[type].deployed_on = array(level._gadgets_level[type].deployed_on);
		}
		level._gadgets_level[type].deployed_on[level._gadgets_level[type].deployed_on.size] = deployed_on;
	}
	if(isdefined(deployed_off))
	{
		if(!isdefined(level._gadgets_level[type].deployed_off))
		{
			level._gadgets_level[type].deployed_off = [];
		}
		else if(!isarray(level._gadgets_level[type].deployed_off))
		{
			level._gadgets_level[type].deployed_off = array(level._gadgets_level[type].deployed_off);
		}
		level._gadgets_level[type].deployed_off[level._gadgets_level[type].deployed_off.size] = deployed_off;
	}
}

/*
	Name: register_gadget_flicker_callbacks
	Namespace: ability_player
	Checksum: 0xCE14D88C
	Offset: 0x1720
	Size: 0x134
	Parameters: 2
	Flags: None
*/
function register_gadget_flicker_callbacks(type, on_flicker)
{
	register_gadget(type);
	if(!isdefined(level._gadgets_level[type].on_flicker))
	{
		level._gadgets_level[type].on_flicker = [];
	}
	if(isdefined(on_flicker))
	{
		if(!isdefined(level._gadgets_level[type].on_flicker))
		{
			level._gadgets_level[type].on_flicker = [];
		}
		else if(!isarray(level._gadgets_level[type].on_flicker))
		{
			level._gadgets_level[type].on_flicker = array(level._gadgets_level[type].on_flicker);
		}
		level._gadgets_level[type].on_flicker[level._gadgets_level[type].on_flicker.size] = on_flicker;
	}
}

/*
	Name: register_gadget_ready_callbacks
	Namespace: ability_player
	Checksum: 0x30F7FABB
	Offset: 0x1860
	Size: 0x134
	Parameters: 2
	Flags: None
*/
function register_gadget_ready_callbacks(type, ready_func)
{
	register_gadget(type);
	if(!isdefined(level._gadgets_level[type].on_ready))
	{
		level._gadgets_level[type].on_ready = [];
	}
	if(isdefined(ready_func))
	{
		if(!isdefined(level._gadgets_level[type].on_ready))
		{
			level._gadgets_level[type].on_ready = [];
		}
		else if(!isarray(level._gadgets_level[type].on_ready))
		{
			level._gadgets_level[type].on_ready = array(level._gadgets_level[type].on_ready);
		}
		level._gadgets_level[type].on_ready[level._gadgets_level[type].on_ready.size] = ready_func;
	}
}

/*
	Name: register_gadget_primed_callbacks
	Namespace: ability_player
	Checksum: 0xBC5EE81D
	Offset: 0x19A0
	Size: 0x134
	Parameters: 2
	Flags: Linked
*/
function register_gadget_primed_callbacks(type, primed_func)
{
	register_gadget(type);
	if(!isdefined(level._gadgets_level[type].on_primed))
	{
		level._gadgets_level[type].on_primed = [];
	}
	if(isdefined(primed_func))
	{
		if(!isdefined(level._gadgets_level[type].on_primed))
		{
			level._gadgets_level[type].on_primed = [];
		}
		else if(!isarray(level._gadgets_level[type].on_primed))
		{
			level._gadgets_level[type].on_primed = array(level._gadgets_level[type].on_primed);
		}
		level._gadgets_level[type].on_primed[level._gadgets_level[type].on_primed.size] = primed_func;
	}
}

/*
	Name: register_gadget_is_inuse_callbacks
	Namespace: ability_player
	Checksum: 0x3EA7982E
	Offset: 0x1AE0
	Size: 0x4E
	Parameters: 2
	Flags: Linked
*/
function register_gadget_is_inuse_callbacks(type, inuse_func)
{
	register_gadget(type);
	if(isdefined(inuse_func))
	{
		level._gadgets_level[type].isinuse = inuse_func;
	}
}

/*
	Name: register_gadget_is_flickering_callbacks
	Namespace: ability_player
	Checksum: 0xA49187F3
	Offset: 0x1B38
	Size: 0x4E
	Parameters: 2
	Flags: Linked
*/
function register_gadget_is_flickering_callbacks(type, flickering_func)
{
	register_gadget(type);
	if(isdefined(flickering_func))
	{
		level._gadgets_level[type].isflickering = flickering_func;
	}
}

/*
	Name: register_gadget_failed_activate_callback
	Namespace: ability_player
	Checksum: 0x803125CF
	Offset: 0x1B90
	Size: 0x134
	Parameters: 2
	Flags: None
*/
function register_gadget_failed_activate_callback(type, failed_activate)
{
	register_gadget(type);
	if(!isdefined(level._gadgets_level[type].failed_activate))
	{
		level._gadgets_level[type].failed_activate = [];
	}
	if(isdefined(failed_activate))
	{
		if(!isdefined(level._gadgets_level[type].failed_activate))
		{
			level._gadgets_level[type].failed_activate = [];
		}
		else if(!isarray(level._gadgets_level[type].failed_activate))
		{
			level._gadgets_level[type].failed_activate = array(level._gadgets_level[type].failed_activate);
		}
		level._gadgets_level[type].failed_activate[level._gadgets_level[type].failed_activate.size] = failed_activate;
	}
}

/*
	Name: gadget_is_flickering
	Namespace: ability_player
	Checksum: 0x67395BBD
	Offset: 0x1CD0
	Size: 0x8E
	Parameters: 1
	Flags: None
*/
function gadget_is_flickering(slot)
{
	if(!isdefined(self._gadgets_player))
	{
		return 0;
	}
	if(!isdefined(self._gadgets_player[slot]))
	{
		return 0;
	}
	if(!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].isflickering))
	{
		return 0;
	}
	return self [[level._gadgets_level[self._gadgets_player[slot].gadget_type].isflickering]](slot);
}

/*
	Name: give_gadget
	Namespace: ability_player
	Checksum: 0x7DCB5EED
	Offset: 0x1D68
	Size: 0x28A
	Parameters: 2
	Flags: Linked
*/
function give_gadget(slot, weapon)
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	if(isdefined(self._gadgets_player[slot]))
	{
		if(self._gadgets_player[slot] != weapon)
		{
			self.pers[#"hash_68cdf8807cfaabff"][self._gadgets_player[slot]] = 0;
		}
		self take_gadget(slot, self._gadgets_player[slot]);
	}
	for(eslot = 0; eslot < 3; eslot++)
	{
		existinggadget = self._gadgets_player[eslot];
		if(isdefined(existinggadget) && existinggadget == weapon)
		{
			self take_gadget(eslot, existinggadget);
		}
	}
	self._gadgets_player[slot] = weapon;
	if(!isdefined(self.var_aec4af05[slot]))
	{
		self.var_aec4af05[slot] = 0;
	}
	if(!isdefined(self._gadgets_player[slot]))
	{
		return;
	}
	if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type]))
	{
		if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].on_give))
		{
			foreach(on_give in level._gadgets_level[self._gadgets_player[slot].gadget_type].on_give)
			{
				self thread [[on_give]](slot, weapon);
			}
		}
	}
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		self.heroabilityname = (isdefined(weapon) ? weapon.name : undefined);
	}
}

/*
	Name: take_gadget
	Namespace: ability_player
	Checksum: 0x31FDDBE5
	Offset: 0x2000
	Size: 0x138
	Parameters: 2
	Flags: Linked
*/
function take_gadget(slot, weapon)
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	if(!isdefined(self._gadgets_player[slot]))
	{
		return;
	}
	if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type]))
	{
		if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].on_take))
		{
			foreach(on_take in level._gadgets_level[self._gadgets_player[slot].gadget_type].on_take)
			{
				if(isdefined(on_take))
				{
					self thread [[on_take]](slot, weapon);
				}
			}
		}
	}
	self._gadgets_player[slot] = undefined;
}

/*
	Name: turn_gadget_on
	Namespace: ability_player
	Checksum: 0xB45DB8B
	Offset: 0x2140
	Size: 0x5CC
	Parameters: 2
	Flags: Linked
*/
function turn_gadget_on(slot, weapon)
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	if(!isdefined(self._gadgets_player[slot]))
	{
		return;
	}
	if(weapon != self._gadgets_player[slot])
	{
		return;
	}
	self.var_aec4af05[slot] = 0;
	self gadgetsetactivatetime(slot, gettime());
	self.playedgadgetsuccess = 0;
	if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type]))
	{
		if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].turn_on))
		{
			self function_2c464c28(weapon);
			var_ef2d7dfd = self function_880f27a7();
			players = function_a1ef346b(self.team);
			clientnum = self getentitynumber();
			foreach(player in players)
			{
				player luinotifyevent(#"ability_callout", 2, var_ef2d7dfd, clientnum);
			}
			foreach(turn_on in level._gadgets_level[self._gadgets_player[slot].gadget_type].turn_on)
			{
				self thread [[turn_on]](slot, weapon);
			}
		}
	}
	if(sessionmodeismultiplayergame())
	{
		if(weapon.name == #"gadget_health_regen")
		{
			var_f8e6b703 = self match_record::get_player_stat(#"hash_ec4aea1a8bbd82");
			if(isdefined(var_f8e6b703))
			{
				self match_record::inc_stat(#"lives", var_f8e6b703, #"hash_2380fc76594e930d", 1);
			}
		}
		else
		{
			self function_33644ff2(game.timepassed, weapon.name);
		}
	}
	else
	{
		self function_33644ff2(game.timepassed, weapon.name);
	}
	level notify(#"hero_gadget_activated", {#weapon:weapon, #player:self});
	self notify(#"hero_gadget_activated", {#weapon:weapon});
	if(isdefined(level.cybercom) && isdefined(level.cybercom._ability_turn_on))
	{
		self thread [[level.cybercom._ability_turn_on]](slot, weapon);
	}
	self.pers[#"herogadgetnotified"][slot] = 0;
	xuid = int(self getxuid(1));
	if(sessionmodeismultiplayergame())
	{
		mpheropowerevents = {#xuid:xuid, #playername:self.name, #powerstate:"activated", #name:self._gadgets_player[slot].name, #gametime:function_f8d53445(), #spawnid:getplayerspawnid(self)};
		function_92d1707f(#"hash_2d561b2f8bbe1aac", mpheropowerevents);
	}
	battlechatter::function_26dd1669(weapon);
	if(weapon.gadget_type != 11)
	{
		self.heroabilityactivatetime = gettime();
		self.heroabilityactive = 1;
		self.heroability = weapon;
	}
	self thread ability_power::power_consume_timer_think(slot, weapon);
}

/*
	Name: turn_gadget_off
	Namespace: ability_player
	Checksum: 0xE9231EF7
	Offset: 0x2718
	Size: 0x43C
	Parameters: 2
	Flags: Linked
*/
function turn_gadget_off(slot, weapon)
{
	if(!isdefined(self) || !isdefined(self._gadgets_player) || !isdefined(self._gadgets_player[slot]))
	{
		return;
	}
	self.var_aec4af05[slot] = 0;
	if(!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type]))
	{
		return;
	}
	if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].turn_off))
	{
		self function_3e8bb406(0);
		foreach(turn_off in level._gadgets_level[self._gadgets_player[slot].gadget_type].turn_off)
		{
			self thread [[turn_off]](slot, weapon);
			self globallogic_score::function_61254438(weapon);
		}
	}
	if(isdefined(level.cybercom) && isdefined(level.cybercom._ability_turn_off))
	{
		self thread [[level.cybercom._ability_turn_off]](slot, weapon);
	}
	if(weapon.gadget_type != 11)
	{
		self.heroabilitydectivatetime = gettime();
		self.heroabilityactive = undefined;
		self.heroability = weapon;
	}
	dead = self.health <= 0;
	if(sessionmodeismultiplayergame())
	{
		if(weapon.name != #"gadget_health_regen")
		{
			self function_79cd8cd6(game.timepassed, weapon.name, dead, self.heavyweaponshots, self.heavyweaponhits);
		}
	}
	else
	{
		self function_79cd8cd6(game.timepassed, weapon.name, dead, self.heavyweaponshots, self.heavyweaponhits);
	}
	self notify(#"heroability_off", {#weapon:weapon});
	xuid = int(self getxuid(1));
	if(sessionmodeismultiplayergame())
	{
		mpheropowerevents = {#xuid:xuid, #playername:self.name, #powerstate:"expired", #name:self._gadgets_player[slot].name, #gametime:function_f8d53445(), #spawnid:getplayerspawnid(self)};
		function_92d1707f(#"hash_2d561b2f8bbe1aac", mpheropowerevents);
	}
	if(is_true(level.oldschool))
	{
		self takeweapon(weapon);
	}
}

/*
	Name: function_50557027
	Namespace: ability_player
	Checksum: 0xCA99E899
	Offset: 0x2B60
	Size: 0x162
	Parameters: 2
	Flags: Linked
*/
function function_50557027(slot, weapon)
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	if(!isdefined(self._gadgets_player[slot]))
	{
		return;
	}
	self.var_aec4af05[slot] = 0;
	self gadgetsetactivatetime(slot, gettime());
	if(!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type]))
	{
		return;
	}
	if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].deployed_on))
	{
		self function_3e8bb406(0);
		foreach(deployed_on in level._gadgets_level[self._gadgets_player[slot].gadget_type].deployed_on)
		{
			self thread [[deployed_on]](slot, weapon);
		}
	}
}

/*
	Name: function_d5260ebe
	Namespace: ability_player
	Checksum: 0x58B6F88C
	Offset: 0x2CD0
	Size: 0x14A
	Parameters: 2
	Flags: Linked
*/
function function_d5260ebe(slot, weapon)
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	if(!isdefined(self._gadgets_player[slot]))
	{
		return;
	}
	self.var_aec4af05[slot] = 0;
	if(!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type]))
	{
		return;
	}
	if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].deployed_off))
	{
		self function_3e8bb406(0);
		foreach(deployed_off in level._gadgets_level[self._gadgets_player[slot].gadget_type].deployed_off)
		{
			self thread [[deployed_off]](slot, weapon);
		}
	}
}

/*
	Name: gadget_checkheroabilitykill
	Namespace: ability_player
	Checksum: 0x883C896
	Offset: 0x2E28
	Size: 0x266
	Parameters: 1
	Flags: None
*/
function gadget_checkheroabilitykill(attacker)
{
	heroabilitystat = 0;
	if(isdefined(attacker.heroability))
	{
		switch(attacker.heroability.name)
		{
			case "gadget_clone":
			case "gadget_heat_wave":
			case "gadget_armor":
			case "gadget_speed_burst":
			{
				if(isdefined(attacker.heroabilityactive) || (isdefined(attacker.heroabilitydectivatetime) && attacker.heroabilitydectivatetime > (gettime() - 100)))
				{
					heroabilitystat = 1;
				}
				break;
			}
			case "gadget_resurrect":
			case "gadget_camo":
			{
				if(isdefined(attacker.heroabilityactive) || (isdefined(attacker.heroabilitydectivatetime) && attacker.heroabilitydectivatetime > (gettime() - 6000)))
				{
					heroabilitystat = 1;
				}
				break;
			}
			case "gadget_vision_pulse":
			{
				if(isdefined(attacker.visionpulsespottedenemytime))
				{
					timecutoff = gettime();
					if(attacker.visionpulsespottedenemytime + 10000 > timecutoff)
					{
						for(i = 0; i < attacker.visionpulsespottedenemy.size; i++)
						{
							spottedenemy = attacker.visionpulsespottedenemy[i];
							if(spottedenemy == self)
							{
								if(self.lastspawntime < attacker.visionpulsespottedenemytime)
								{
									heroabilitystat = 1;
									break;
								}
							}
						}
					}
				}
			}
			case "gadget_combat_efficiency":
			{
				if(isdefined(attacker._gadget_combat_efficiency) && attacker._gadget_combat_efficiency == 1)
				{
					heroabilitystat = 1;
					break;
				}
				else if(isdefined(attacker.combatefficiencylastontime) && attacker.combatefficiencylastontime > (gettime() - 100))
				{
					heroabilitystat = 1;
					break;
				}
			}
		}
	}
	return heroabilitystat;
}

/*
	Name: gadget_flicker
	Namespace: ability_player
	Checksum: 0x9E9410C
	Offset: 0x3098
	Size: 0x122
	Parameters: 2
	Flags: Linked
*/
function gadget_flicker(slot, weapon)
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	if(!isdefined(self._gadgets_player[slot]))
	{
		return;
	}
	if(!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type]))
	{
		return;
	}
	if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].on_flicker))
	{
		foreach(on_flicker in level._gadgets_level[self._gadgets_player[slot].gadget_type].on_flicker)
		{
			self thread [[on_flicker]](slot, weapon);
		}
	}
}

/*
	Name: gadget_ready
	Namespace: ability_player
	Checksum: 0xEA9D4BE2
	Offset: 0x31C8
	Size: 0x4FA
	Parameters: 2
	Flags: Linked
*/
function gadget_ready(slot, weapon)
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	if(!isdefined(self._gadgets_player[slot]))
	{
		return;
	}
	type = self._gadgets_player[slot].gadget_type;
	if(isdefined(type) && isdefined(level._gadgets_level[type]) && is_true(level._gadgets_level[type].should_notify))
	{
		gadget_index = getitemindexfromref(self._gadgets_player[slot].name);
		if(gadget_index > 0)
		{
			iteminfo = getunlockableiteminfofromindex(gadget_index, 1);
			if(iteminfo.itemgroupname === "killstreak")
			{
				return;
			}
			if(isdefined(iteminfo))
			{
				loadoutslotname = iteminfo.loadoutslotname;
				if(isdefined(loadoutslotname) && loadoutslotname == "herogadget")
				{
					self luinotifyevent(#"hero_weapon_received", 1, gadget_index);
					self function_8ba40d2f(#"hero_weapon_received", 1, gadget_index);
				}
			}
		}
	}
	if(!isdefined(level.gameended) || !level.gameended)
	{
		if(!self.pers[#"herogadgetnotified"][slot])
		{
			self.pers[#"herogadgetnotified"][slot] = 1;
			self thread battlechatter::playgadgetready(weapon);
		}
	}
	if(sessionmodeismultiplayergame())
	{
		if(weapon.name == #"gadget_health_regen")
		{
			var_f8e6b703 = self match_record::get_player_stat(#"hash_ec4aea1a8bbd82");
			if(isdefined(var_f8e6b703))
			{
				self match_record::inc_stat(#"lives", var_f8e6b703, #"hash_656f3981134db095", 1);
			}
		}
		else
		{
			self function_ac24127(game.timepassed, weapon.name);
		}
	}
	else
	{
		self function_ac24127(game.timepassed, weapon.name);
	}
	xuid = int(self getxuid(1));
	if(sessionmodeismultiplayergame())
	{
		mpheropowerevents = {#xuid:xuid, #playername:self.name, #powerstate:"ready", #name:self._gadgets_player[slot].name, #gametime:function_f8d53445(), #spawnid:getplayerspawnid(self)};
		function_92d1707f(#"hash_2d561b2f8bbe1aac", mpheropowerevents);
	}
	if(isdefined(type) && isdefined(level._gadgets_level[type]) && isdefined(level._gadgets_level[type].on_ready))
	{
		foreach(on_ready in level._gadgets_level[type].on_ready)
		{
			self thread [[on_ready]](slot, weapon);
		}
	}
}

/*
	Name: gadget_primed
	Namespace: ability_player
	Checksum: 0xEB921C21
	Offset: 0x36D0
	Size: 0x122
	Parameters: 2
	Flags: Linked
*/
function gadget_primed(slot, weapon)
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	if(!isdefined(self._gadgets_player[slot]))
	{
		return;
	}
	if(!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type]))
	{
		return;
	}
	if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].on_primed))
	{
		foreach(on_primed in level._gadgets_level[self._gadgets_player[slot].gadget_type].on_primed)
		{
			self thread [[on_primed]](slot, weapon);
		}
	}
}

/*
	Name: tutorial_timer
	Namespace: ability_player
	Checksum: 0x19E143A
	Offset: 0x3800
	Size: 0xFE
	Parameters: 3
	Flags: Linked
*/
function tutorial_timer(weapon, var_8be5aa55, var_de825ec6)
{
	/#
		assert(isdefined(var_8be5aa55) && isstring(var_8be5aa55));
	#/
	if(isdefined(var_de825ec6))
	{
		tutorial_init(weapon);
		self.pers[#"ability_tutorial"][weapon].(var_8be5aa55) = gettime() + (var_de825ec6 * 1000);
	}
	return isdefined(self.pers[#"ability_tutorial"][weapon].(var_8be5aa55)) && self.pers[#"ability_tutorial"][weapon].(var_8be5aa55) > gettime();
}

/*
	Name: tutorial_init
	Namespace: ability_player
	Checksum: 0xE7645CE1
	Offset: 0x3908
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function tutorial_init(weapon)
{
	if(!isdefined(self.pers[#"ability_tutorial"]))
	{
		self.pers[#"ability_tutorial"] = [];
	}
	if(!isdefined(self.pers[#"ability_tutorial"][weapon]))
	{
		self.pers[#"ability_tutorial"][weapon] = spawnstruct();
	}
}

/*
	Name: tutorial_hints
	Namespace: ability_player
	Checksum: 0xB9D6191A
	Offset: 0x39A0
	Size: 0x368
	Parameters: 6
	Flags: None
*/
function tutorial_hints(slot, weapon, var_8430d11b, var_6c65cb8d, var_eadf8864, var_be7c29a3)
{
	self notify("equip_tutorial_text_" + weapon.name);
	self endon(#"disconnect", #"death", "equip_tutorial_text_" + weapon.name);
	self tutorial_init(weapon);
	while(true)
	{
		if(!self hasweapon(weapon))
		{
			break;
		}
		currentslot = self gadgetgetslot(weapon);
		if(currentslot != slot)
		{
			break;
		}
		if(!self gadgetisready(slot))
		{
			break;
		}
		if(self gadgetisprimed(slot))
		{
			break;
		}
		if(self util::gadget_is_in_use(slot))
		{
			break;
		}
		if(self isinvehicle() || self function_8bc54983() || self scene::is_igc_active() || self isplayinganimscripted())
		{
			wait(5);
			continue;
		}
		if(self tutorial_timer(weapon, "recentlyUsed"))
		{
			wait(5);
			continue;
		}
		if(self tutorial_timer(weapon, "recentlyEquip"))
		{
			wait(5);
			continue;
		}
		if(self tutorial_timer(weapon, "recentlyReady"))
		{
			wait(5);
			continue;
		}
		if(!self tutorial_timer(weapon, "recentlyEquipText") && isdefined(var_6c65cb8d) && isdefined(var_be7c29a3) && self [[var_be7c29a3]](slot, weapon))
		{
			self tutorial_timer(weapon, "recentlyEquipText", 60);
			self thread [[var_6c65cb8d]](var_8430d11b, 0, "hide_gadget_equip_hint", 7);
			/#
				self function_374c4352(var_8430d11b);
			#/
		}
		if(!self tutorial_timer(weapon, "recentlyReadyVoice") && isdefined(var_eadf8864))
		{
			self tutorial_timer(weapon, "recentlyReadyVoice", 60);
			/#
				self function_374c4352(var_eadf8864);
			#/
		}
		wait(5);
	}
}

/*
	Name: function_fc4dc54
	Namespace: ability_player
	Checksum: 0x8CC02BFC
	Offset: 0x3D10
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_fc4dc54(var_6fcde3b6)
{
	if(!isdefined(self._gadgets_player))
	{
		return;
	}
	for(slot = 0; slot < 3; slot++)
	{
		if(!isdefined(self._gadgets_player[slot]))
		{
			continue;
		}
		gadgetweapon = self._gadgets_player[slot];
		if(ability_util::is_hero_weapon(gadgetweapon))
		{
			continue;
		}
		self gadgetdeactivate(slot, gadgetweapon);
	}
	self forceoffhandend();
}

/*
	Name: function_374c4352
	Namespace: ability_player
	Checksum: 0xF22A785B
	Offset: 0x3DD8
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_374c4352(str)
{
	/#
		if(ishash(str))
		{
			str = function_9e72a96(str);
		}
		toprint = "" + str;
		println(toprint);
	#/
}

/*
	Name: abilities_print
	Namespace: ability_player
	Checksum: 0xE922BF5F
	Offset: 0x3E50
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function abilities_print(str)
{
	/#
		toprint = "" + str;
		println(toprint);
	#/
}

/*
	Name: abilities_devgui_init
	Namespace: ability_player
	Checksum: 0x7549BE85
	Offset: 0x3E98
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function abilities_devgui_init()
{
	/#
		setdvar(#"scr_abilities_devgui_cmd", "");
		setdvar(#"scr_abilities_devgui_arg", "");
		setdvar(#"scr_abilities_devgui_player", 0);
		if(isdedicated())
		{
			return;
		}
		level.abilities_devgui_base = "";
		level.abilities_devgui_player_connect = &abilities_devgui_player_connect;
		level.abilities_devgui_player_disconnect = &abilities_devgui_player_disconnect;
		level thread abilities_devgui_think();
	#/
}

/*
	Name: abilities_devgui_player_connect
	Namespace: ability_player
	Checksum: 0x3984D5F9
	Offset: 0x3F88
	Size: 0x9E
	Parameters: 0
	Flags: None
*/
function abilities_devgui_player_connect()
{
	/#
		if(!isdefined(level.abilities_devgui_base))
		{
			return;
		}
		wait(2);
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] != self)
			{
				continue;
			}
			thread abilities_devgui_add_player_commands(level.abilities_devgui_base, players[i].playername, i + 1);
			return;
		}
	#/
}

/*
	Name: abilities_devgui_add_player_commands
	Namespace: ability_player
	Checksum: 0xB7DB8502
	Offset: 0x4030
	Size: 0x12E
	Parameters: 3
	Flags: None
*/
function abilities_devgui_add_player_commands(root, pname, index)
{
	/#
		add_cmd_with_root = (("" + root) + pname) + "";
		pid = "" + index;
		menu_index = 1;
		if(isdefined(level.abilities_devgui_add_gadgets_custom))
		{
			menu_index = self [[level.abilities_devgui_add_gadgets_custom]](root, pname, pid, menu_index);
		}
		else
		{
			util::waittill_can_add_debug_command();
			menu_index = abilities_devgui_add_gadgets(add_cmd_with_root, pid, menu_index);
			util::waittill_can_add_debug_command();
			menu_index = abilities_devgui_add_power(add_cmd_with_root, pid, menu_index);
			util::waittill_can_add_debug_command();
			menu_index = function_2e0162e9(add_cmd_with_root, pid, menu_index);
		}
	#/
}

/*
	Name: abilities_devgui_add_player_command
	Namespace: ability_player
	Checksum: 0xA6EF45
	Offset: 0x4168
	Size: 0x104
	Parameters: 6
	Flags: None
*/
function abilities_devgui_add_player_command(root, pid, cmdname, menu_index, cmddvar, argdvar)
{
	/#
		if(!isdefined(argdvar))
		{
			argdvar = "";
		}
		var_eece3d04 = (("" + "") + "") + cmdname;
		var_9b1fa683 = (("" + "") + "") + cmddvar;
		var_dc0fa12c = ((("" + "") + "") + argdvar) + "";
		util::add_queued_debug_command((((pid + menu_index) + var_eece3d04) + var_9b1fa683) + var_dc0fa12c);
	#/
}

/*
	Name: abilities_devgui_add_power
	Namespace: ability_player
	Checksum: 0x748D49B8
	Offset: 0x4278
	Size: 0x168
	Parameters: 3
	Flags: None
*/
function abilities_devgui_add_power(add_cmd_with_root, pid, menu_index)
{
	/#
		root = ((add_cmd_with_root + "") + menu_index) + "";
		abilities_devgui_add_player_command(root, pid, "", 1, "", "");
		abilities_devgui_add_player_command(root, pid, "", 2, "", "");
		power = 0;
		while(power <= 1)
		{
			abilities_devgui_add_player_command(root, pid, "" + power, 2, "", "" + power);
			abilities_devgui_add_player_command(root, pid, "" + power, 2, "", "" + power);
			power = power + 0.25;
		}
		menu_index++;
		return menu_index;
	#/
}

/*
	Name: function_2e0162e9
	Namespace: ability_player
	Checksum: 0x144726BE
	Offset: 0x43F0
	Size: 0x27C
	Parameters: 3
	Flags: None
*/
function function_2e0162e9(add_cmd_with_root, pid, menu_index)
{
	/#
		if(sessionmodeiszombiesgame() || sessionmodeiswarzonegame())
		{
			return;
		}
		root = ((add_cmd_with_root + "") + menu_index) + "";
		session_mode = currentsessionmode();
		var_a2865de6 = getplayerroletemplatecount(session_mode);
		for(i = 1; i < var_a2865de6; i++)
		{
			var_854a6ba2 = getplayerrolecategory(i, session_mode);
			if(!isdefined(var_854a6ba2))
			{
				continue;
			}
			if(!player_role::is_valid(i))
			{
				continue;
			}
			var_d59b8ebf = getplayerrolecategoryinfo(var_854a6ba2);
			var_1a27a47a = makelocalizedstring(getcharacterdisplayname(i, session_mode));
			var_1a27a47a = strreplace(var_1a27a47a, "", "");
			if(var_1a27a47a == "")
			{
				var_1a27a47a = "";
			}
			var_eb49090f = function_9e72a96(function_b14806c6(i, session_mode));
			var_4f6b7b98 = (var_1a27a47a + "") + (isdefined(var_eb49090f) ? var_eb49090f : "") + "";
			if(!isdefined(var_d59b8ebf.enabled) || var_d59b8ebf.enabled == 0)
			{
				var_4f6b7b98 = var_4f6b7b98 + "";
			}
			abilities_devgui_add_player_command(root, pid, var_4f6b7b98, i, "", i);
		}
		menu_index++;
		return menu_index;
	#/
}

/*
	Name: function_2ced294
	Namespace: ability_player
	Checksum: 0xE3A4DD8
	Offset: 0x4678
	Size: 0xE4
	Parameters: 3
	Flags: None
*/
function function_2ced294(&a_weapons, &a_array, weaponname)
{
	/#
		weapon = getweapon(weaponname);
		if(!isdefined(weapon))
		{
			return;
		}
		if(!isinarray(a_weapons, weapon))
		{
			return;
		}
		if(!isdefined(a_array))
		{
			a_array = [];
		}
		else if(!isarray(a_array))
		{
			a_array = array(a_array);
		}
		if(!isinarray(a_array, weapon))
		{
			a_array[a_array.size] = weapon;
		}
		arrayremovevalue(a_weapons, weapon);
	#/
}

/*
	Name: function_60b82b68
	Namespace: ability_player
	Checksum: 0x7D056951
	Offset: 0x4768
	Size: 0x154
	Parameters: 4
	Flags: None
*/
function function_60b82b68(&a_weapons, &a_equipment, &var_c5b1a23e, &a_ultimates)
{
	/#
		if(sessionmodeiszombiesgame())
		{
			return;
		}
		session_mode = currentsessionmode();
		var_a2865de6 = getplayerroletemplatecount(session_mode);
		for(i = 1; i < var_a2865de6; i++)
		{
			fields = function_934db9a0(i, session_mode);
			if(!isdefined(fields))
			{
				continue;
			}
			if(isdefined(fields.var_a7e7cb46))
			{
				function_2ced294(a_weapons, a_equipment, fields.var_a7e7cb46);
			}
			if(isdefined(fields.var_c21d61e9))
			{
				function_2ced294(a_weapons, var_c5b1a23e, fields.var_c21d61e9);
			}
			if(isdefined(fields.ultimateweapon))
			{
				function_2ced294(a_weapons, a_ultimates, fields.ultimateweapon);
			}
		}
	#/
}

/*
	Name: function_1c3e8791
	Namespace: ability_player
	Checksum: 0x4D196060
	Offset: 0x48C8
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function function_1c3e8791(&a_weapons, &var_dd06e779)
{
	/#
		for(i = 0; i < 1024; i++)
		{
			iteminfo = getunlockableiteminfofromindex(i, 0);
			if(isdefined(iteminfo))
			{
				reference_s = iteminfo.namehash;
				loadoutslotname = iteminfo.loadoutslotname;
				if(loadoutslotname == "")
				{
					function_2ced294(a_weapons, var_dd06e779, reference_s);
				}
			}
		}
	#/
}

/*
	Name: abilities_devgui_add_gadgets
	Namespace: ability_player
	Checksum: 0x85695595
	Offset: 0x4990
	Size: 0x584
	Parameters: 3
	Flags: None
*/
function abilities_devgui_add_gadgets(add_cmd_with_root, pid, menu_index)
{
	/#
		a_weapons = enumerateweapons("");
		a_gadgetweapons = [];
		for(i = 0; i < a_weapons.size; i++)
		{
			if(isdefined(a_weapons[i]) && a_weapons[i].isgadget)
			{
				if(!isdefined(a_gadgetweapons))
				{
					a_gadgetweapons = [];
				}
				else if(!isarray(a_gadgetweapons))
				{
					a_gadgetweapons = array(a_gadgetweapons);
				}
				if(!isinarray(a_gadgetweapons, a_weapons[i]))
				{
					a_gadgetweapons[a_gadgetweapons.size] = a_weapons[i];
				}
			}
		}
		a_equipment = [];
		var_c5b1a23e = [];
		a_ultimates = [];
		function_60b82b68(a_gadgetweapons, a_equipment, var_c5b1a23e, a_ultimates);
		var_dd06e779 = [];
		function_1c3e8791(a_gadgetweapons, var_dd06e779);
		var_ef060ee3 = [];
		var_cdbfed45 = [];
		var_7e367d09 = [];
		var_4557f227 = [];
		a_heal = [];
		for(i = 0; i < a_gadgetweapons.size; i++)
		{
			if(a_gadgetweapons[i].gadget_type == 11 && a_gadgetweapons[i].issignatureweapon)
			{
				if(!isdefined(var_ef060ee3))
				{
					var_ef060ee3 = [];
				}
				else if(!isarray(var_ef060ee3))
				{
					var_ef060ee3 = array(var_ef060ee3);
				}
				if(!isinarray(var_ef060ee3, a_gadgetweapons[i]))
				{
					var_ef060ee3[var_ef060ee3.size] = a_gadgetweapons[i];
				}
				continue;
			}
			if(a_gadgetweapons[i].gadget_type == 11)
			{
				if(!isdefined(var_cdbfed45))
				{
					var_cdbfed45 = [];
				}
				else if(!isarray(var_cdbfed45))
				{
					var_cdbfed45 = array(var_cdbfed45);
				}
				if(!isinarray(var_cdbfed45, a_gadgetweapons[i]))
				{
					var_cdbfed45[var_cdbfed45.size] = a_gadgetweapons[i];
				}
				continue;
			}
			if(a_gadgetweapons[i].isheavyweapon)
			{
				if(!isdefined(var_7e367d09))
				{
					var_7e367d09 = [];
				}
				else if(!isarray(var_7e367d09))
				{
					var_7e367d09 = array(var_7e367d09);
				}
				if(!isinarray(var_7e367d09, a_gadgetweapons[i]))
				{
					var_7e367d09[var_7e367d09.size] = a_gadgetweapons[i];
				}
				continue;
			}
			if(a_gadgetweapons[i].gadget_type == 23)
			{
				if(!isdefined(a_heal))
				{
					a_heal = [];
				}
				else if(!isarray(a_heal))
				{
					a_heal = array(a_heal);
				}
				if(!isinarray(a_heal, a_gadgetweapons[i]))
				{
					a_heal[a_heal.size] = a_gadgetweapons[i];
				}
				continue;
			}
			if(!isdefined(var_4557f227))
			{
				var_4557f227 = [];
			}
			else if(!isarray(var_4557f227))
			{
				var_4557f227 = array(var_4557f227);
			}
			if(!isinarray(var_4557f227, a_gadgetweapons[i]))
			{
				var_4557f227[var_4557f227.size] = a_gadgetweapons[i];
			}
		}
		function_174037fe(add_cmd_with_root, pid, a_equipment, "", menu_index);
		menu_index++;
		function_76032a31(add_cmd_with_root, pid, a_heal, "", menu_index);
		menu_index++;
		function_a40d04ca(add_cmd_with_root, pid, var_c5b1a23e, "", menu_index);
		menu_index++;
		function_174037fe(add_cmd_with_root, pid, var_dd06e779, "", menu_index);
		menu_index++;
		function_174037fe(add_cmd_with_root, pid, var_4557f227, "", menu_index);
		menu_index++;
		function_a40d04ca(add_cmd_with_root, pid, var_ef060ee3, "", menu_index);
		menu_index++;
		return menu_index;
	#/
}

/*
	Name: function_174037fe
	Namespace: ability_player
	Checksum: 0xF05C1B10
	Offset: 0x4F20
	Size: 0xA4
	Parameters: 5
	Flags: None
*/
function function_174037fe(root, pid, a_weapons, weapon_type, menu_index)
{
	/#
		if(isdefined(weapon_type))
		{
			player_devgui_root = (pid + menu_index) + "";
			for(i = 0; i < weapon_type.size; i++)
			{
				function_b04fbf27(player_devgui_root, a_weapons, function_a16a090d(weapon_type[i]), i + 1);
			}
		}
	#/
}

/*
	Name: function_76032a31
	Namespace: ability_player
	Checksum: 0xC94AB0F0
	Offset: 0x4FD0
	Size: 0xA4
	Parameters: 5
	Flags: None
*/
function function_76032a31(root, pid, a_weapons, weapon_type, menu_index)
{
	/#
		if(isdefined(weapon_type))
		{
			player_devgui_root = (pid + menu_index) + "";
			for(i = 0; i < weapon_type.size; i++)
			{
				function_50543efb(player_devgui_root, a_weapons, function_a16a090d(weapon_type[i]), i + 1);
			}
		}
	#/
}

/*
	Name: function_a40d04ca
	Namespace: ability_player
	Checksum: 0xAFF56CF7
	Offset: 0x5080
	Size: 0xA4
	Parameters: 5
	Flags: None
*/
function function_a40d04ca(root, pid, a_weapons, weapon_type, menu_index)
{
	/#
		if(isdefined(weapon_type))
		{
			player_devgui_root = (pid + menu_index) + "";
			for(i = 0; i < weapon_type.size; i++)
			{
				function_90502d72(player_devgui_root, a_weapons, function_a16a090d(weapon_type[i]), i + 1);
			}
		}
	#/
}

/*
	Name: function_b04fbf27
	Namespace: ability_player
	Checksum: 0xE10CCAD
	Offset: 0x5130
	Size: 0xAC
	Parameters: 4
	Flags: None
*/
function function_b04fbf27(root, pid, weap_name, cmdindex)
{
	/#
		util::add_queued_debug_command((((((((((((((pid + cmdindex) + "") + "") + "") + weap_name) + "") + "") + "") + "") + "") + "") + "") + cmdindex) + "");
	#/
}

/*
	Name: function_50543efb
	Namespace: ability_player
	Checksum: 0xD74944E
	Offset: 0x51E8
	Size: 0xAC
	Parameters: 4
	Flags: None
*/
function function_50543efb(root, pid, weap_name, cmdindex)
{
	/#
		util::add_queued_debug_command((((((((((((((pid + cmdindex) + "") + "") + "") + weap_name) + "") + "") + "") + "") + "") + "") + "") + cmdindex) + "");
	#/
}

/*
	Name: function_90502d72
	Namespace: ability_player
	Checksum: 0xEC71E006
	Offset: 0x52A0
	Size: 0xAC
	Parameters: 4
	Flags: None
*/
function function_90502d72(root, pid, weap_name, cmdindex)
{
	/#
		util::add_queued_debug_command((((((((((((((pid + cmdindex) + "") + "") + "") + weap_name) + "") + "") + "") + "") + "") + "") + "") + cmdindex) + "");
	#/
}

/*
	Name: abilities_devgui_player_disconnect
	Namespace: ability_player
	Checksum: 0xEDA0E14D
	Offset: 0x5358
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function abilities_devgui_player_disconnect()
{
	/#
		if(!isdefined(level.abilities_devgui_base))
		{
			return;
		}
		remove_cmd_with_root = (("" + level.abilities_devgui_base) + self.playername) + "";
		util::add_queued_debug_command(remove_cmd_with_root);
	#/
}

/*
	Name: abilities_devgui_think
	Namespace: ability_player
	Checksum: 0x1907BAB1
	Offset: 0x53C0
	Size: 0x368
	Parameters: 0
	Flags: None
*/
function abilities_devgui_think()
{
	/#
		setdvar(#"hash_67d528f29bfc7c97", "");
		for(;;)
		{
			cmd = "";
			arg = getdvarstring(#"hash_67d528f29bfc7c97", "");
			if(arg == "")
			{
				cmd = getdvarstring(#"scr_abilities_devgui_cmd");
				arg = getdvarstring(#"scr_abilities_devgui_arg");
			}
			if(cmd == "")
			{
				waitframe(1);
				continue;
			}
			switch(cmd)
			{
				case "power_f":
				{
					abilities_devgui_handle_player_command(cmd, &abilities_devgui_power_fill);
					break;
				}
				case "power_t_af":
				{
					abilities_devgui_handle_player_command(cmd, &abilities_devgui_power_toggle_auto_fill);
					break;
				}
				case "ability_power_f":
				{
					abilities_devgui_handle_player_command(cmd, &function_3db3dc4f, arg);
					break;
				}
				case "hash_5b8a32e219f9ae64":
				{
					abilities_devgui_handle_player_command(cmd, &function_626f2cd1, arg);
					break;
				}
				case "hash_2d2f6f2bb98a38b3":
				{
					abilities_devgui_handle_player_command(cmd, &function_9a0f80b1, arg);
					break;
				}
				case "hash_5ddbad8870b98e93":
				{
					abilities_devgui_handle_player_command(cmd, &function_ce4e80a7, arg);
					break;
				}
				case "hash_5515835378aa90c8":
				{
					abilities_devgui_handle_player_command(cmd, &function_4f50aea3, arg);
					break;
				}
				case "hash_67d528f29bfc7c97":
				{
					abilities_devgui_handle_player_command(cmd, &function_b4f43681, arg);
					break;
				}
				case 0:
				{
					break;
				}
				default:
				{
					break;
				}
			}
			setdvar(#"hash_67d528f29bfc7c97", "");
			setdvar(#"scr_abilities_devgui_cmd", "");
			setdvar(#"scr_abilities_devgui_player", "");
			wait(0.5);
		}
	#/
}

/*
	Name: function_c94ba490
	Namespace: ability_player
	Checksum: 0x6FD8F43
	Offset: 0x5730
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_c94ba490(weapon)
{
	/#
		self notify(#"gadget_devgui_give");
		self giveweapon(weapon);
		waitframe(1);
		slot = self gadgetgetslot(weapon);
		self gadgetpowerreset(slot, 1);
		self gadgetpowerset(slot, 100);
		self gadgetcharging(slot, 0);
		self iprintlnbold(function_a16a090d(weapon));
	#/
}

/*
	Name: abilities_devgui_give
	Namespace: ability_player
	Checksum: 0xBF1D721F
	Offset: 0x5820
	Size: 0xE6
	Parameters: 3
	Flags: None
*/
function abilities_devgui_give(weapon_name, slot, var_1d6918cf)
{
	/#
		level.devgui_giving_abilities = 1;
		if(isdefined(self._gadgets_player[var_1d6918cf]) && self hasweapon(self._gadgets_player[var_1d6918cf]))
		{
			self gadgetpowerreset(var_1d6918cf, 1);
			self takeweapon(self._gadgets_player[var_1d6918cf]);
		}
		weapon = getweapon(slot);
		self thread function_c94ba490(weapon);
		level.devgui_giving_abilities = undefined;
	#/
}

/*
	Name: function_4f50aea3
	Namespace: ability_player
	Checksum: 0xD64C2B1F
	Offset: 0x5910
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_4f50aea3(weapon_name)
{
	/#
		if(isdefined(level.var_124446e) && isarray(level.var_124446e) && isdefined(level.var_124446e[weapon_name]))
		{
			self [[level.var_124446e[weapon_name]]](self, 2);
		}
		else
		{
			if(isdefined(level.var_124446e))
			{
				self [[level.var_124446e]](weapon_name, 2);
			}
			else
			{
				self abilities_devgui_give(weapon_name, 2);
			}
		}
	#/
}

/*
	Name: function_ce4e80a7
	Namespace: ability_player
	Checksum: 0x93E3A849
	Offset: 0x59E0
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_ce4e80a7(weapon_name)
{
	/#
		if(isdefined(level.var_c49b362f) && isdefined(level.var_c49b362f[weapon_name]))
		{
			self [[level.var_c49b362f[weapon_name]]](self, 1);
		}
		else
		{
			self abilities_devgui_give(weapon_name, 1);
		}
	#/
}

/*
	Name: function_9a0f80b1
	Namespace: ability_player
	Checksum: 0xE63D3A93
	Offset: 0x5A60
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_9a0f80b1(weapon_name)
{
	/#
		if(isdefined(level.var_fdfc376e) && isdefined(level.var_fdfc376e[weapon_name]))
		{
			self [[level.var_fdfc376e[weapon_name]]](self, 0);
		}
		else
		{
			self abilities_devgui_give(weapon_name, 0);
		}
	#/
}

/*
	Name: function_f3fa2789
	Namespace: ability_player
	Checksum: 0x17B93E5D
	Offset: 0x5AE0
	Size: 0x124
	Parameters: 2
	Flags: None
*/
function function_f3fa2789(offhandslot, ability_list)
{
	/#
		if(!isdefined(ability_list))
		{
			ability_list = level.var_29d4fb5b;
		}
		if(!isdefined(ability_list))
		{
			return;
		}
		weapon = undefined;
		if(isdefined(self._gadgets_player[offhandslot]))
		{
			weapon = self._gadgets_player[offhandslot];
		}
		weapon_name = undefined;
		if(isdefined(weapon))
		{
			var_29bc3853 = 0;
			for(i = 0; i < ability_list.size; i++)
			{
				ability_name = ability_list[i];
				if(weapon.name == ability_name)
				{
					var_29bc3853 = i;
					break;
				}
			}
			var_29bc3853 = (var_29bc3853 + 1) % ability_list.size;
			weapon_name = ability_list[var_29bc3853];
		}
		if(2 == offhandslot)
		{
			self function_4f50aea3(weapon_name);
		}
	#/
}

/*
	Name: abilities_devgui_handle_player_command
	Namespace: ability_player
	Checksum: 0xA612B279
	Offset: 0x5C10
	Size: 0xDC
	Parameters: 3
	Flags: None
*/
function abilities_devgui_handle_player_command(cmd, playercallback, pcb_param)
{
	/#
		pid = getdvarint(#"scr_abilities_devgui_player", 0);
		if(pid > 0)
		{
			player = getplayers()[pid - 1];
			if(isdefined(player))
			{
				if(isdefined(pcb_param))
				{
					player thread [[playercallback]](pcb_param);
				}
				else
				{
					player thread [[playercallback]]();
				}
			}
		}
		else
		{
			array::thread_all(getplayers(), playercallback, pcb_param);
		}
	#/
}

/*
	Name: abilities_devgui_power_fill
	Namespace: ability_player
	Checksum: 0xB6F7D759
	Offset: 0x5CF8
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function abilities_devgui_power_fill()
{
	/#
		if(!isdefined(self) || !isdefined(self._gadgets_player))
		{
			return;
		}
		for(i = 0; i < 3; i++)
		{
			if(isdefined(self._gadgets_player[i]) && self hasweapon(self._gadgets_player[i]))
			{
				self gadgetpowerset(i, self._gadgets_player[i].gadget_powermax);
			}
		}
	#/
}

/*
	Name: function_626f2cd1
	Namespace: ability_player
	Checksum: 0x89ECEEB
	Offset: 0x5DB0
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_626f2cd1(var_44b235)
{
	/#
		if(!isdefined(self) || !isdefined(self._gadgets_player))
		{
			return;
		}
		if(isdefined(self._gadgets_player[0]) && self hasweapon(self._gadgets_player[0]))
		{
			self gadgetpowerset(0, self._gadgets_player[0].gadget_powermax * float(var_44b235));
		}
	#/
}

/*
	Name: function_3db3dc4f
	Namespace: ability_player
	Checksum: 0xC5FF2EDF
	Offset: 0x5E58
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_3db3dc4f(var_44b235)
{
	/#
		if(!isdefined(self) || !isdefined(self._gadgets_player))
		{
			return;
		}
		if(isdefined(self._gadgets_player[2]) && self hasweapon(self._gadgets_player[2]))
		{
			self gadgetpowerset(2, self._gadgets_player[2].gadget_powermax * float(var_44b235));
		}
	#/
}

/*
	Name: abilities_devgui_power_toggle_auto_fill
	Namespace: ability_player
	Checksum: 0xC0F3F01C
	Offset: 0x5F10
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function abilities_devgui_power_toggle_auto_fill()
{
	/#
		if(!isdefined(self) || !isdefined(self._gadgets_player))
		{
			return;
		}
		self.abilities_devgui_power_toggle_auto_fill = !is_true(self.abilities_devgui_power_toggle_auto_fill);
		self thread abilities_devgui_power_toggle_auto_fill_think();
	#/
}

/*
	Name: abilities_devgui_power_toggle_auto_fill_think
	Namespace: ability_player
	Checksum: 0xF16EF665
	Offset: 0x5F78
	Size: 0x176
	Parameters: 0
	Flags: None
*/
function abilities_devgui_power_toggle_auto_fill_think()
{
	/#
		self endon(#"disconnect");
		self notify(#"auto_fill_think");
		self endon(#"auto_fill_think");
		for(;;)
		{
			if(!isdefined(self) || !isdefined(self._gadgets_player))
			{
				return;
			}
			if(!is_true(self.abilities_devgui_power_toggle_auto_fill))
			{
				return;
			}
			for(i = 0; i < 3; i++)
			{
				if(isdefined(self._gadgets_player[i]) && self hasweapon(self._gadgets_player[i]))
				{
					n_power = self gadgetpowerget(i);
					if(!self util::gadget_is_in_use(i) && !self function_36dfc05f(i) && n_power < self._gadgets_player[i].gadget_powermax)
					{
						self gadgetpowerset(i, self._gadgets_player[i].gadget_powermax);
					}
				}
			}
			wait(1);
		}
	#/
}

/*
	Name: function_b4f43681
	Namespace: ability_player
	Checksum: 0x2C4D5EA7
	Offset: 0x60F8
	Size: 0x380
	Parameters: 1
	Flags: None
*/
function function_b4f43681(var_a5c8eb94)
{
	/#
		if(sessionmodeiszombiesgame())
		{
			return;
		}
		if(self isinmovemode(""))
		{
			adddebugcommand("");
			wait(0.5);
		}
		if(self isinmovemode(""))
		{
			adddebugcommand("");
			wait(0.5);
		}
		if(var_a5c8eb94 == "")
		{
			startindex = self player_role::get();
			index = startindex;
			do
			{
				index = index + 1;
				if(index == startindex)
				{
					return;
				}
				if(index >= getplayerroletemplatecount(currentsessionmode()))
				{
					index = 0;
				}
			}
			while(!self player_role::is_valid(index));
		}
		else
		{
			if(var_a5c8eb94 == "")
			{
				startindex = self player_role::get();
				index = startindex;
				do
				{
					index = index - 1;
					if(index == startindex)
					{
						return;
					}
					if(index == 0)
					{
						index = getplayerroletemplatecount(currentsessionmode());
					}
				}
				while(!self player_role::is_valid(index));
			}
			else
			{
				index = int(var_a5c8eb94);
			}
		}
		self function_c9b950e3();
		self function_c2d9d3e1();
		self player_role::set(index);
		if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
		{
			spawnselect = level.spawnselectenabled;
			level.spawnselectenabled = 0;
			if(level.numlives)
			{
				self.pers[#"lives"]++;
			}
			self suicide("");
			waitframe(1);
			if(isdefined(self))
			{
				self luinotifyevent(#"hash_2dddf8559f5b304d", 1, 1);
			}
			level.spawnselectenabled = spawnselect;
		}
		else if(sessionmodeiscampaigngame())
		{
			if(isdefined(level.var_86734d48))
			{
				self thread [[level.var_86734d48]](self.team, self.curclass);
			}
		}
	#/
}

