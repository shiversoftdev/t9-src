#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_c3c0ef6f;

/*
	Name: function_bb11b5be
	Namespace: namespace_c3c0ef6f
	Checksum: 0x4ABAF1BB
	Offset: 0x178
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bb11b5be()
{
	level notify(-395894905);
}

/*
	Name: init
	Namespace: namespace_c3c0ef6f
	Checksum: 0xE17A62FA
	Offset: 0x198
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	callback::on_spawned(&function_95b24959);
	callback::on_ai_killed(&function_df8c20ce);
	level.var_d8104f84 = 100;
	level.var_2a5adcff = 14;
	level.var_4b8d723f = getent("zone_kill_achievement", "script_noteworthy");
	callback::add_callback(#"hash_34d402e0ae123ca6", &function_a6f7e3da);
}

/*
	Name: function_a6f7e3da
	Namespace: namespace_c3c0ef6f
	Checksum: 0x63F8491B
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_a6f7e3da()
{
	if(self.var_1a69e47f.size >= 14)
	{
		zm_utility::give_achievement(#"hash_47d5fff4205db171");
	}
}

/*
	Name: function_df8c20ce
	Namespace: namespace_c3c0ef6f
	Checksum: 0xFEB95F17
	Offset: 0x2A0
	Size: 0x28C
	Parameters: 1
	Flags: Linked
*/
function function_df8c20ce(s_params)
{
	e_player = s_params.eattacker;
	weapon = s_params.weapon;
	ai_type = self.aitype;
	if(isplayer(e_player))
	{
		if(!isdefined(e_player.var_f96ce53f))
		{
			e_player.var_f96ce53f = 0;
		}
		if(isdefined(weapon) && weapon.inventorytype != #"offhand" && !is_true(e_player.var_df6978da))
		{
			if(!is_true(e_player.var_f96ce53f))
			{
				if(ai_type === "spawner_zm_steiner_split_radiation_bomb" || ai_type === "spawner_zm_steiner_split_radiation_blast")
				{
					switch(ai_type)
					{
						case "spawner_zm_steiner_split_radiation_bomb":
						{
							e_player.var_287dbab8 = "spawner_zm_steiner_split_radiation_blast";
							break;
						}
						case "spawner_zm_steiner_split_radiation_blast":
						{
							e_player.var_287dbab8 = "spawner_zm_steiner_split_radiation_bomb";
							break;
						}
					}
					e_player.var_f96ce53f = 1;
					e_player thread function_735fa731();
				}
			}
			else if(e_player.var_287dbab8 === ai_type)
			{
				e_player.var_df6978da = 1;
				e_player zm_utility::give_achievement(#"hash_309368ef8f9b86a3");
			}
		}
		if(!isdefined(e_player.kill_count))
		{
			e_player.kill_count = 0;
		}
		if(!is_true(e_player.var_12445983))
		{
			if(e_player.kill_count < level.var_d8104f84 && e_player istouching(level.var_4b8d723f))
			{
				e_player.kill_count++;
			}
			if(e_player.kill_count >= level.var_d8104f84)
			{
				e_player.var_12445983 = 1;
				e_player zm_utility::give_achievement(#"hash_69455e37009492aa");
			}
		}
	}
}

/*
	Name: function_95b24959
	Namespace: namespace_c3c0ef6f
	Checksum: 0x51D9E3DA
	Offset: 0x538
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_95b24959()
{
	self.var_df6978da = 0;
	self.var_12445983 = 0;
	self.var_d7073519 = 0;
	if(!isdefined(self.var_6616d107))
	{
		self.var_6616d107 = 0;
	}
	self thread function_e361ce1b();
	self thread function_ceba8321();
	self thread function_9a4f865b();
	self thread function_f5b265ac();
}

/*
	Name: function_e361ce1b
	Namespace: namespace_c3c0ef6f
	Checksum: 0x93DAEE31
	Offset: 0x5E0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_e361ce1b()
{
	self endon(#"disconnect");
	level endon(#"end_game");
	level flag::wait_till("pap_quest_completed");
	self zm_utility::give_achievement(#"hash_c33cd90f4b67bfe");
}

/*
	Name: function_9a4f865b
	Namespace: namespace_c3c0ef6f
	Checksum: 0xB0323E90
	Offset: 0x650
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_9a4f865b()
{
	self endon(#"disconnect");
	level endon(#"end_game");
	level waittill(#"main_quest_completed");
	self zm_utility::give_achievement(#"hash_5fb48c8391ec697a");
}

/*
	Name: function_ceba8321
	Namespace: namespace_c3c0ef6f
	Checksum: 0x19A534DB
	Offset: 0x6C0
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_ceba8321()
{
	self endon(#"disconnect");
	level endon(#"end_game");
	level flag::wait_till("ww_quest_completed");
	/#
		self iprintlnbold("");
	#/
	self zm_utility::give_achievement(#"hash_5faa668391e3d463");
}

/*
	Name: function_735fa731
	Namespace: namespace_c3c0ef6f
	Checksum: 0xDB9E2E98
	Offset: 0x750
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function function_735fa731()
{
	self notify("67ede2be5a74b6a3");
	self endon("67ede2be5a74b6a3");
	self endon(#"end_game", #"disconnect", #"death");
	waitframe(10);
	self.var_f96ce53f = 0;
}

/*
	Name: function_f5b265ac
	Namespace: namespace_c3c0ef6f
	Checksum: 0x91A0595F
	Offset: 0x7C0
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function function_f5b265ac()
{
	self endon(#"disconnect");
	level endon(#"end_game");
	var_c9d4ff68 = level.round_number;
	var_84d02e05 = var_c9d4ff68 + 15;
	wait(5);
	while(true)
	{
		var_a26574af = zm_zonemgr::get_player_zone();
		if(isdefined(var_a26574af))
		{
			if(var_a26574af == "zone_proto_start" || var_a26574af == "zone_proto_start2")
			{
				if(level.round_number >= var_84d02e05)
				{
					self zm_utility::give_achievement(#"hash_6567a09c3046170f");
					break;
				}
			}
			else
			{
				break;
			}
		}
		wait(1);
	}
}

