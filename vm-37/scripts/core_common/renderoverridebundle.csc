#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using script_13da4e6b98ca81a1;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace renderoverridebundle;

/*
	Name: __init__system__
	Namespace: renderoverridebundle
	Checksum: 0xF994CA4D
	Offset: 0x108
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register("renderoverridebundle", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: renderoverridebundle
	Checksum: 0xB7C1A6B2
	Offset: 0x148
	Size: 0x134
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.renderoverridebundle = {#hash_383fe4d6:[], #local_clients:[]};
	callback::on_localclient_connect(&function_d7ae6bbb);
	function_f72f089c(#"hash_ebb37dab2ee0ae3", (sessionmodeiscampaigngame() ? #"rob_sonar_set_friendlyequip_cp" : #"rob_sonar_set_friendlyequip_mp"), &function_6803f977);
	function_f72f089c(#"hash_2476e7ae62469f70", #"hash_39109749d54991e4", &function_9216f2c3);
	function_f72f089c(#"hash_2476eaae6246a489", #"hash_39109a49d54996fd", &function_9216f2c3);
}

/*
	Name: function_d7ae6bbb
	Namespace: renderoverridebundle
	Checksum: 0x344159BD
	Offset: 0x288
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_d7ae6bbb(clientnum)
{
	if(!isdefined(level.renderoverridebundle.local_clients[clientnum]))
	{
		level.renderoverridebundle.local_clients[clientnum] = {#hash_e04728e4:[]};
	}
	thread function_e04728e4(clientnum);
}

/*
	Name: function_25996839
	Namespace: renderoverridebundle
	Checksum: 0xD268A
	Offset: 0x300
	Size: 0xA4
	Parameters: 4
	Flags: Private
*/
function private function_25996839(var_166900a8, bundle, validity_func, var_35a2c593)
{
	/#
		var_3a009b84 = level.renderoverridebundle.var_383fe4d6[var_166900a8];
		if(!isdefined(var_3a009b84))
		{
			return false;
		}
		if(var_3a009b84.bundle != bundle)
		{
			return true;
		}
		if(var_3a009b84.validity_func != validity_func)
		{
			return true;
		}
		if(var_3a009b84.var_35a2c593 != var_35a2c593)
		{
			return true;
		}
		return false;
	#/
}

/*
	Name: function_f72f089c
	Namespace: renderoverridebundle
	Checksum: 0x7DCE770E
	Offset: 0x3B0
	Size: 0x134
	Parameters: 6
	Flags: Linked
*/
function function_f72f089c(var_166900a8, bundle, validity_func, var_35a2c593, default_bundle, force_kill)
{
	/#
		assert(isdefined(level.renderoverridebundle));
	#/
	if(!isdefined(level.renderoverridebundle.var_383fe4d6))
	{
		level.renderoverridebundle.var_383fe4d6 = [];
	}
	/#
		/#
			assert(!function_25996839(var_166900a8, bundle, validity_func, var_35a2c593));
		#/
	#/
	level.renderoverridebundle.var_383fe4d6[var_166900a8] = {#force_kill:force_kill, #default_bundle:default_bundle, #hash_1a5b7293:0, #hash_35a2c593:var_35a2c593, #validity_func:validity_func, #bundle:bundle};
}

/*
	Name: function_2dbeddb5
	Namespace: renderoverridebundle
	Checksum: 0x898F2D14
	Offset: 0x4F0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_2dbeddb5(local_client_num, var_166900a8)
{
	return level.renderoverridebundle.var_383fe4d6[var_166900a8];
}

/*
	Name: function_e04728e4
	Namespace: renderoverridebundle
	Checksum: 0xF42F1E39
	Offset: 0x528
	Size: 0x3BE
	Parameters: 1
	Flags: Linked
*/
function function_e04728e4(local_client_num)
{
	while(true)
	{
		result = undefined;
		result = level waittill(#"demo_jump", #"killcam_begin", #"killcam_end", #"player_switch", #"joined_team", #"localplayer_spawned", #"hash_7f642789ed08aae0", #"thermal_toggle", #"hacked");
		if(result._notify == "killcam_end")
		{
			function_9129cbe3(local_client_num);
		}
		var_e04728e4 = level.renderoverridebundle.local_clients[local_client_num].var_e04728e4;
		if(!isarray(var_e04728e4))
		{
			waitframe(1);
			continue;
		}
		var_b8fe9b52 = codcaster::function_b8fe9b52(local_client_num);
		foreach(entity_array in var_e04728e4)
		{
			entity = getentbynum(local_client_num, entity_num);
			if(!isdefined(entity))
			{
				continue;
			}
			if(!isarray(entity_array))
			{
				continue;
			}
			should_update = 1;
			if(function_397ed5ed(entity))
			{
				should_update = isalive(entity);
			}
			if(should_update)
			{
				if(var_b8fe9b52)
				{
					foreach(var_166900a8 in entity_array)
					{
						if(var_166900a8 == #"hash_48a9d99bb016fbd3" || var_166900a8 == #"hash_2fff175ca0ba28b2" || var_166900a8 == #"hash_2476e7ae62469f70" || var_166900a8 == #"hash_2476eaae6246a489")
						{
							continue;
						}
						entity thread function_c8d97b8e(local_client_num, flag, var_166900a8);
					}
					continue;
				}
				foreach(var_166900a8 in entity_array)
				{
					entity thread function_c8d97b8e(local_client_num, flag, var_166900a8);
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: on_entity_shutdown
	Namespace: renderoverridebundle
	Checksum: 0xFAE6DB9F
	Offset: 0x8F0
	Size: 0x188
	Parameters: 1
	Flags: Linked, Private
*/
function private on_entity_shutdown(local_client_num)
{
	var_2c81de05 = self getentitynumber();
	var_e04728e4 = level.renderoverridebundle.local_clients[local_client_num].var_e04728e4;
	if(!isarray(var_e04728e4))
	{
		return;
	}
	foreach(var_78b9c1b4 in var_e04728e4)
	{
		if(entity_num == var_2c81de05)
		{
			if(isarray(var_78b9c1b4))
			{
				foreach(var_3a009b84 in var_78b9c1b4)
				{
					self flag::clear(flag);
				}
			}
			var_e04728e4[var_2c81de05] = undefined;
			return;
		}
	}
}

/*
	Name: function_9129cbe3
	Namespace: renderoverridebundle
	Checksum: 0xA91F5B6C
	Offset: 0xA80
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function function_9129cbe3(local_client_num)
{
	var_e04728e4 = level.renderoverridebundle.local_clients[local_client_num].var_e04728e4;
	if(!isarray(var_e04728e4))
	{
		return;
	}
	foreach(entity_array in var_e04728e4)
	{
		entity = getentbynum(local_client_num, entity_num);
		if(!isdefined(entity))
		{
			continue;
		}
		if(!isarray(entity_array))
		{
			continue;
		}
		foreach(var_3a009b84 in entity_array)
		{
			if(entity flag::exists(flag))
			{
				entity flag::clear(flag);
			}
		}
	}
}

/*
	Name: start_bundle
	Namespace: renderoverridebundle
	Checksum: 0xFFC20AEC
	Offset: 0xC30
	Size: 0x96
	Parameters: 2
	Flags: Linked
*/
function start_bundle(flag, bundle)
{
	is_set = flag::get(flag);
	if(!flag::get(flag))
	{
		self flag::toggle(flag);
		self playrenderoverridebundle(bundle);
		self notify(("kill" + flag) + bundle);
	}
}

/*
	Name: stop_bundle
	Namespace: renderoverridebundle
	Checksum: 0x6B83F63
	Offset: 0xCD0
	Size: 0xA4
	Parameters: 3
	Flags: Linked
*/
function stop_bundle(flag, bundle, force_kill)
{
	self notify(("kill" + flag) + bundle);
	if(flag::get(flag))
	{
		self flag::toggle(flag);
		if(force_kill === 1)
		{
			self function_f6e99a8d(bundle);
		}
		else
		{
			self stoprenderoverridebundle(bundle);
		}
	}
}

/*
	Name: fade_bundle
	Namespace: renderoverridebundle
	Checksum: 0x7EF20811
	Offset: 0xD80
	Size: 0xAC
	Parameters: 4
	Flags: None
*/
function fade_bundle(localclientnum, flag, bundle, fadeduration)
{
	self endon(#"death");
	if(flag::get(flag))
	{
		util::lerp_generic(localclientnum, fadeduration, &function_9e7290f5, 1, 0, bundle);
	}
	wait(float(fadeduration) / 1000);
	stop_bundle(flag, bundle, 0);
}

/*
	Name: function_9e7290f5
	Namespace: renderoverridebundle
	Checksum: 0xDDD41B15
	Offset: 0xE38
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_9e7290f5(currenttime, elapsedtime, localclientnum, fadeduration, from, to, bundle)
{
	percent = localclientnum / fadeduration;
	amount = (to * percent) + (from * (1 - percent));
	self function_78233d29(bundle, "", #"alpha", amount);
}

/*
	Name: function_318de8bd
	Namespace: renderoverridebundle
	Checksum: 0x1542B289
	Offset: 0xEE8
	Size: 0x9E
	Parameters: 2
	Flags: Linked
*/
function function_318de8bd(local_client_num, var_80292ef8)
{
	if(!isdefined(var_80292ef8.validity_func) && isdefined(var_80292ef8.var_35a2c593))
	{
		return 1;
	}
	if(isdefined(var_80292ef8.var_35a2c593))
	{
		if(!isdefined(var_80292ef8.validity_func))
		{
			return var_80292ef8.var_35a2c593;
		}
		return [[var_80292ef8.validity_func]](local_client_num, var_80292ef8.bundle, var_80292ef8.var_35a2c593);
	}
	return [[var_80292ef8.validity_func]](local_client_num, var_80292ef8);
}

/*
	Name: function_c8d97b8e
	Namespace: renderoverridebundle
	Checksum: 0xF7259A64
	Offset: 0xF90
	Size: 0x37A
	Parameters: 3
	Flags: Linked
*/
function function_c8d97b8e(local_client_num, flag, var_166900a8)
{
	if(!self flag::exists(flag))
	{
		self flag::init(flag);
	}
	if(sessionmodeiswarzonegame())
	{
		if(self.type === "actor_corpse" || self.type === "player_corpse")
		{
			return;
		}
	}
	else if(self.type === "actor_corpse" || self.type === "vehicle_corpse" || self.type === "player_corpse")
	{
		return;
	}
	var_80292ef8 = function_2dbeddb5(local_client_num, var_166900a8);
	if(!isdefined(var_80292ef8))
	{
		return;
	}
	if(function_318de8bd(local_client_num, var_80292ef8))
	{
		if(isdefined(var_80292ef8.default_bundle))
		{
			self stop_bundle(flag + "_default", var_80292ef8.default_bundle, 1);
		}
		self start_bundle(flag, var_80292ef8.bundle);
	}
	else
	{
		if(var_80292ef8.var_1a5b7293 && isdefined(var_80292ef8.default_bundle))
		{
			self stop_bundle(flag, var_80292ef8.bundle, 1);
			self start_bundle(flag + "_default", var_80292ef8.default_bundle);
			var_80292ef8.var_1a5b7293 = 0;
		}
		else
		{
			self stop_bundle(flag, var_80292ef8.bundle, var_80292ef8.force_kill);
			if(isdefined(var_80292ef8.default_bundle))
			{
				self stop_bundle(flag + "_default", var_80292ef8.default_bundle, var_80292ef8.force_kill);
			}
		}
	}
	if(!isplayer(self))
	{
		self callback::on_shutdown(&on_entity_shutdown);
	}
	entity_num = self getentitynumber();
	if(!isdefined(level.renderoverridebundle.local_clients[local_client_num]))
	{
		level.renderoverridebundle.local_clients[local_client_num] = {#hash_e04728e4:[]};
	}
	if(!isdefined(level.renderoverridebundle.local_clients[local_client_num].var_e04728e4[entity_num]))
	{
		level.renderoverridebundle.local_clients[local_client_num].var_e04728e4[entity_num] = [];
	}
	level.renderoverridebundle.local_clients[local_client_num].var_e04728e4[entity_num][flag] = var_166900a8;
}

/*
	Name: function_6803f977
	Namespace: renderoverridebundle
	Checksum: 0x361ADF17
	Offset: 0x1318
	Size: 0xCE
	Parameters: 2
	Flags: Linked
*/
function function_6803f977(local_client_num, bundle)
{
	if(!self function_ca024039())
	{
		return false;
	}
	if(isigcactive(local_client_num))
	{
		return false;
	}
	if(isdefined(level.vision_pulse) && is_true(level.vision_pulse[local_client_num]))
	{
		return false;
	}
	player = function_5c10bd79(local_client_num);
	if(player.var_33b61b6f === 1)
	{
		bundle.force_kill = 1;
		return false;
	}
	return true;
}

/*
	Name: function_ce7fd1b9
	Namespace: renderoverridebundle
	Checksum: 0x2B55DB08
	Offset: 0x13F0
	Size: 0x8E
	Parameters: 2
	Flags: None
*/
function function_ce7fd1b9(local_client_num, bundle)
{
	if(self function_21c0fa55())
	{
		return false;
	}
	if(self function_ca024039())
	{
		return false;
	}
	player = function_5c10bd79(local_client_num);
	if(player.var_33b61b6f === 1)
	{
		bundle.force_kill = 1;
		return false;
	}
	return true;
}

/*
	Name: function_9216f2c3
	Namespace: renderoverridebundle
	Checksum: 0x8C828BE3
	Offset: 0x1488
	Size: 0x6E
	Parameters: 2
	Flags: Linked
*/
function function_9216f2c3(local_client_num, bundle)
{
	if(is_true(level.gameended))
	{
		return false;
	}
	if(!codcaster::function_b8fe9b52(bundle))
	{
		return false;
	}
	if(is_true(level.isigcactive))
	{
		return false;
	}
	return true;
}

/*
	Name: function_ee77bff9
	Namespace: renderoverridebundle
	Checksum: 0xD0FF0B1D
	Offset: 0x1500
	Size: 0x94
	Parameters: 4
	Flags: Linked
*/
function function_ee77bff9(local_client_num, field_name, bundle, var_d9c61b9c)
{
	local_player = function_5c10bd79(local_client_num);
	should_play = (isdefined(local_player) ? local_player clientfield::get_to_player(field_name) : 0);
	self function_f4eab437(local_client_num, should_play, bundle, var_d9c61b9c);
}

/*
	Name: function_f4eab437
	Namespace: renderoverridebundle
	Checksum: 0x5F082B0E
	Offset: 0x15A0
	Size: 0xAC
	Parameters: 4
	Flags: Linked
*/
function function_f4eab437(local_client_num, should_play, bundle, var_d9c61b9c)
{
	if(isdefined(var_d9c61b9c))
	{
		should_play = self [[var_d9c61b9c]](local_client_num, should_play);
	}
	is_playing = self function_d2503806(bundle);
	if(should_play)
	{
		if(!is_playing)
		{
			self playrenderoverridebundle(bundle);
		}
	}
	else if(is_playing)
	{
		self stoprenderoverridebundle(bundle);
	}
}

