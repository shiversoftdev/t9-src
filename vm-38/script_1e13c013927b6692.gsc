#using script_3cebb48c37fc271;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_67dab37c;

/*
	Name: function_ce7ae09
	Namespace: namespace_67dab37c
	Checksum: 0xDC09F3DD
	Offset: 0x148
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ce7ae09()
{
	level notify(443767106);
}

#namespace namespace_fa39a5c3;

/*
	Name: function_89f2df9
	Namespace: namespace_fa39a5c3
	Checksum: 0xCC3A549E
	Offset: 0x168
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5a3be2f74ac4fe03", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_fa39a5c3
	Checksum: 0x380DD6AF
	Offset: 0x1B0
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	clientfield::register("toplayer", "" + #"hash_69dc133e22a2769f", 16000, 1, "int");
	level.var_5bfd847e = #"hash_3b7ec2c707912dd9";
	level.var_e9737821 = &function_c52e8ba;
	level.var_352c9e03 = &function_af65fe93;
	level.var_91171ae5 = &function_54a36ee5;
	level flag::set(#"hash_7735f4e5fdb1382b");
	callback::on_spawned(&on_player_spawned);
	level thread function_d467cf16();
}

/*
	Name: on_player_spawned
	Namespace: namespace_fa39a5c3
	Checksum: 0xE87DBFE8
	Offset: 0x2B8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(is_true(self.is_hotjoining) || self util::is_spectating())
	{
		return;
	}
	self thread function_bce9fcbe();
}

/*
	Name: function_d467cf16
	Namespace: namespace_fa39a5c3
	Checksum: 0x6BD7D320
	Offset: 0x310
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_d467cf16()
{
	level waittill(#"all_players_spawned");
	level flag::set(#"hash_3b7ec2c707912dd9");
}

/*
	Name: function_c52e8ba
	Namespace: namespace_fa39a5c3
	Checksum: 0x598556C8
	Offset: 0x358
	Size: 0x4E6
	Parameters: 2
	Flags: Linked
*/
function function_c52e8ba(player, var_8d5d092c)
{
	b_result = 0;
	if(!isdefined(self.hint_string))
	{
		self.hint_string = [];
	}
	n_player_index = player getentitynumber();
	if(!self zm_fasttravel::function_d06e636b(player) || player isswitchingweapons() || level flag::get(#"hash_49e515cdcf4bb8db"))
	{
		self.hint_string[n_player_index] = #"";
	}
	else
	{
		if(isdefined(self.stub.var_a92d1b24) && !level flag::get_all(self.stub.var_a92d1b24))
		{
			switch(self.stub.script_string)
			{
				case "village":
				case "hash_3f4ed3f61d98dd24":
				{
					self.hint_string[n_player_index] = #"hash_222289639943b061";
					break;
				}
				default:
				{
					break;
				}
			}
			b_result = 1;
		}
		else
		{
			if(is_true(player.var_9c7b96ed[var_8d5d092c]))
			{
				switch(self.stub.script_string)
				{
					case "village":
					{
						self.hint_string[n_player_index] = #"hash_1b9857d1769d3430";
						b_result = 1;
						break;
					}
					case "hash_3f4ed3f61d98dd24":
					{
						self.hint_string[n_player_index] = #"hash_6357eb67494da1b";
						b_result = 1;
						break;
					}
				}
			}
			else
			{
				if(isdefined(self.stub.delay) && !self.stub flag::get("delayed"))
				{
					switch(self.stub.script_string)
					{
						case "village":
						{
							self.hint_string[n_player_index] = #"hash_1b9857d1769d3430";
							b_result = 1;
							break;
						}
						case "hash_3f4ed3f61d98dd24":
						{
							self.hint_string[n_player_index] = #"hash_6357eb67494da1b";
							b_result = 1;
							break;
						}
					}
				}
				else
				{
					switch(self.stub.script_string)
					{
						case "village":
						{
							if(level flag::get(#"hash_7752d012501cd222") || level flag::get(#"hash_7735f4e5fdb1382b"))
							{
								self.hint_string[n_player_index] = #"hash_1155071b36db5cc4";
							}
							else
							{
								self.hint_string[n_player_index] = #"hash_661484e87df6401d";
								if(!player zm_score::can_player_purchase(self.stub.zombie_cost))
								{
									player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
								}
							}
							break;
						}
						case "hash_3f4ed3f61d98dd24":
						{
							if(level flag::get(#"hash_7752d012501cd222") || level flag::get(#"hash_7735f4e5fdb1382b"))
							{
								self.hint_string[n_player_index] = #"hash_6da21d98bf10aee5";
							}
							else
							{
								self.hint_string[n_player_index] = #"hash_3bd7d7def4239ab6";
								if(!player zm_score::can_player_purchase(self.stub.zombie_cost))
								{
									player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
								}
							}
							break;
						}
					}
					b_result = 1;
				}
			}
		}
	}
	return b_result;
}

/*
	Name: function_af65fe93
	Namespace: namespace_fa39a5c3
	Checksum: 0x90499BA
	Offset: 0x848
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_af65fe93(var_79bf62e6)
{
	if(!isplayer(self) || !isdefined(var_79bf62e6))
	{
		return;
	}
	str_loc = var_79bf62e6.stub.script_string;
	s_loc = struct::get((str_loc + "_end_") + zm_fasttravel::get_player_index(self));
	self util::create_streamer_hint(s_loc.origin, s_loc.angles, 1);
	self util::delay("fasttravel_over", "disconnect", &util::clear_streamer_hint);
}

/*
	Name: function_54a36ee5
	Namespace: namespace_fa39a5c3
	Checksum: 0x151255C7
	Offset: 0x940
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function function_54a36ee5(var_3ff283ce)
{
	if(level flag::get(#"hash_7752d012501cd222") || level flag::get(#"hash_7735f4e5fdb1382b"))
	{
		n_cost = 0;
	}
	else
	{
		if(isdefined(var_3ff283ce.stub))
		{
			n_cost = var_3ff283ce.stub.zombie_cost;
		}
		else
		{
			n_cost = var_3ff283ce.zombie_cost;
		}
	}
	return n_cost;
}

/*
	Name: function_bce9fcbe
	Namespace: namespace_fa39a5c3
	Checksum: 0x73F2AE5D
	Offset: 0x9E8
	Size: 0xDE
	Parameters: 0
	Flags: Linked
*/
function function_bce9fcbe()
{
	level endon(#"end_game");
	self endon(#"disconnect", #"death");
	while(true)
	{
		var_e8178f0 = self zm_zonemgr::is_player_in_zone([2:"zone_firebase3", 1:"zone_firebase2", 0:"zone_portal_transfer"]);
		self clientfield::set_to_player("" + #"hash_69dc133e22a2769f", var_e8178f0);
		self waittill(#"hash_2d4daa9e80b86b60");
	}
}

