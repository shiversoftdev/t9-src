#using script_36f4be19da8eb6d0;
#using script_47495939f228e438;
#using script_556e19065f09f8a2;
#using script_57f7003580bb15e0;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_ce8a59be;

/*
	Name: function_4f574095
	Namespace: namespace_ce8a59be
	Checksum: 0x8B1D064
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4f574095()
{
	level notify(1495307139);
}

/*
	Name: init
	Namespace: namespace_ce8a59be
	Checksum: 0x5846596F
	Offset: 0x148
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function init()
{
	if(is_true(level.var_9377a535))
	{
		return;
	}
	level.var_9377a535 = 1;
	if(!isdefined(level.var_95198344))
	{
		level.var_95198344 = [];
	}
	callback::on_spawned(&on_player_spawned);
	/#
		level thread function_b5cd0ae5();
	#/
}

/*
	Name: function_6b39d9c5
	Namespace: namespace_ce8a59be
	Checksum: 0x4B64F9AB
	Offset: 0x1D8
	Size: 0x4A0
	Parameters: 1
	Flags: None
*/
function function_6b39d9c5(count)
{
	spawnpoints = struct::get_array("radiation_hazard", "targetname");
	spawnpoints = array::randomize(spawnpoints);
	var_baa683fe = arraycopy(level.var_95198344);
	var_3d3c8738 = [];
	foreach(point in spawnpoints)
	{
		if(!isinarray(var_baa683fe, point) && zm_utility::check_point_in_enabled_zone(point.origin) && zm_utility::check_point_in_playable_area(point.origin))
		{
			a_e_players = function_a1ef346b(undefined, point.origin, 275);
			b_player_near = 0;
			foreach(e_player in a_e_players)
			{
				if(!e_player laststand::player_is_in_laststand())
				{
					b_player_near = 1;
					break;
				}
			}
			if(b_player_near)
			{
				continue;
			}
			if(var_baa683fe.size > 0)
			{
				foreach(var_10e462a8 in var_baa683fe)
				{
					if(distancesquared(point.origin, var_10e462a8.origin) >= 250000)
					{
						if(!isdefined(var_3d3c8738))
						{
							var_3d3c8738 = [];
						}
						else if(!isarray(var_3d3c8738))
						{
							var_3d3c8738 = array(var_3d3c8738);
						}
						var_3d3c8738[var_3d3c8738.size] = point;
						if(!isdefined(var_baa683fe))
						{
							var_baa683fe = [];
						}
						else if(!isarray(var_baa683fe))
						{
							var_baa683fe = array(var_baa683fe);
						}
						var_baa683fe[var_baa683fe.size] = point;
						break;
					}
				}
			}
			else
			{
				if(!isdefined(var_3d3c8738))
				{
					var_3d3c8738 = [];
				}
				else if(!isarray(var_3d3c8738))
				{
					var_3d3c8738 = array(var_3d3c8738);
				}
				var_3d3c8738[var_3d3c8738.size] = point;
				if(!isdefined(var_baa683fe))
				{
					var_baa683fe = [];
				}
				else if(!isarray(var_baa683fe))
				{
					var_baa683fe = array(var_baa683fe);
				}
				var_baa683fe[var_baa683fe.size] = point;
			}
			if(var_3d3c8738.size >= count)
			{
				break;
			}
		}
	}
	foreach(point in var_3d3c8738)
	{
		level thread function_47187ffc(point);
	}
}

/*
	Name: function_47187ffc
	Namespace: namespace_ce8a59be
	Checksum: 0x2E2C8845
	Offset: 0x680
	Size: 0xD0
	Parameters: 1
	Flags: None
*/
function function_47187ffc(point)
{
	zm_aoe::function_371b4147(1, "zm_aoe_radiation_hazard", point.origin, point, &function_b8a8955, &function_252d8295);
	if(!isdefined(level.var_95198344))
	{
		level.var_95198344 = [];
	}
	else if(!isarray(level.var_95198344))
	{
		level.var_95198344 = array(level.var_95198344);
	}
	level.var_95198344[level.var_95198344.size] = point;
}

/*
	Name: on_player_spawned
	Namespace: namespace_ce8a59be
	Checksum: 0x96338591
	Offset: 0x758
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self thread function_1c2829b5();
}

/*
	Name: function_1c2829b5
	Namespace: namespace_ce8a59be
	Checksum: 0x931E1518
	Offset: 0x780
	Size: 0x98
	Parameters: 0
	Flags: Private
*/
function private function_1c2829b5()
{
	self endon(#"death");
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"hash_30e5a6bd41a5917c");
		if(var_be17187b.var_159100b7 == "zm_aoe_radiation_hazard")
		{
			self status_effect::status_effect_apply(function_4d1e7b48(#"hash_48bb9c4c96e64c3d"), undefined, self);
		}
	}
}

/*
	Name: function_6fa1e587
	Namespace: namespace_ce8a59be
	Checksum: 0x15DE9975
	Offset: 0x820
	Size: 0x1E2
	Parameters: 0
	Flags: Private
*/
function private function_6fa1e587()
{
	self endon(#"hash_3913004963ca6fe4");
	self.trigger_damage = spawn("trigger_damage", self.position + vectorscale((0, 0, 1), 30), 4194304, 75, 175);
	self.trigger_damage.owner = self;
	self.trigger_damage.health = 99999;
	self.trigger_damage.var_22cea3da = &function_4685c5f8;
	self.trigger_damage endon(#"death");
	while(true)
	{
		s_result = undefined;
		s_result = self.trigger_damage waittill(#"damage");
		if(isplayer(s_result.attacker))
		{
			if(isdefined(s_result.weapon) && namespace_b376a999::function_5fef4201(s_result.weapon))
			{
				level notify(#"hash_4a62d4959b0dbb0e", {#e_player:s_result.attacker});
				if(namespace_b376a999::function_7c292369(s_result.weapon))
				{
					zm_aoe::function_389bf7bf(self, 1);
					/#
						println("");
					#/
					s_result.attacker notify(#"hash_7f30d2acb25cc4d9");
					return;
				}
			}
		}
	}
}

/*
	Name: function_4685c5f8
	Namespace: namespace_ce8a59be
	Checksum: 0x2A24BBDB
	Offset: 0xA10
	Size: 0x80
	Parameters: 2
	Flags: None
*/
function function_4685c5f8(attacker, time)
{
	if(time >= 4000)
	{
		if(isdefined(self.owner))
		{
			zm_aoe::function_389bf7bf(self.owner, 1);
			/#
				println("");
			#/
			attacker notify(#"hash_7f30d2acb25cc4d9");
		}
	}
}

/*
	Name: function_b8a8955
	Namespace: namespace_ce8a59be
	Checksum: 0xB95F26A6
	Offset: 0xA98
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_b8a8955(aoe)
{
	aoe thread function_6fa1e587();
}

/*
	Name: function_252d8295
	Namespace: namespace_ce8a59be
	Checksum: 0xA5E3F27C
	Offset: 0xAC8
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_252d8295(aoe)
{
	if(isdefined(aoe.userdata))
	{
		arrayremovevalue(level.var_95198344, aoe.userdata);
	}
	if(isdefined(aoe.trigger_damage))
	{
		aoe.trigger_damage delete();
	}
}

/*
	Name: function_9e3de60
	Namespace: namespace_ce8a59be
	Checksum: 0x70EAFCE3
	Offset: 0xB38
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_9e3de60()
{
	level.var_95198344 = [];
	zm_aoe::function_3690781e();
}

/*
	Name: function_b5cd0ae5
	Namespace: namespace_ce8a59be
	Checksum: 0x28AFC4C1
	Offset: 0xB68
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_b5cd0ae5()
{
	/#
		adddebugcommand("");
		adddebugcommand("");
		level flag::wait_till("");
		zm_devgui::add_custom_devgui_callback(&function_2499fe1b);
	#/
}

/*
	Name: function_eccc5dbd
	Namespace: namespace_ce8a59be
	Checksum: 0x6C985B44
	Offset: 0xBF0
	Size: 0x1AC
	Parameters: 0
	Flags: None
*/
function function_eccc5dbd()
{
	/#
		player = getplayers()[0];
		v_direction = player getplayerangles();
		v_direction = anglestoforward(v_direction) * 500;
		eye = player geteye();
		trace = bullettrace(eye, eye + v_direction, 0, undefined);
		query_result = positionquery_source_navigation(trace[#"position"], 64, 256, 512, 20);
		spot = spawn("", player.origin);
		spot setmodel("");
		if(isdefined(query_result) && query_result.data.size > 0)
		{
			spot.origin = query_result.data[0].origin;
		}
		println("" + spot.origin);
		level thread function_47187ffc(spot);
	#/
}

/*
	Name: function_2499fe1b
	Namespace: namespace_ce8a59be
	Checksum: 0x327340E1
	Offset: 0xDA8
	Size: 0x9A
	Parameters: 1
	Flags: None
*/
function function_2499fe1b(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_1a5bda29acd157fd":
			{
				function_eccc5dbd();
				break;
			}
			case "hash_55c4e53689e598c3":
			{
				function_9e3de60();
				level notify(#"hash_7e539f4178c9c27c");
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

