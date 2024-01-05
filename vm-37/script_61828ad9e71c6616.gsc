#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_1cc417743d7c262d;
#using scripts\killstreaks\killstreakrules_shared.gsc;

#namespace killstreakrules;

/*
	Name: init
	Namespace: killstreakrules
	Checksum: 0x66E576C7
	Offset: 0x518
	Size: 0xFDC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	init_shared();
	level.var_956bde25 = &function_65739e7b;
	if(isdefined(level.var_7ed465e4))
	{
		[[level.var_7ed465e4]]();
		return;
	}
	function_7256bae2();
	addkillstreaktorule("tank_robot", "tank_robot", 1, 1);
	addkillstreaktorule("ac130", "ac130", 1, 1);
	addkillstreaktorule("airstrike", "airsupport", 1, 1);
	addkillstreaktorule("airstrike", "vehicle", 1, 1);
	addkillstreaktorule("ammo_station", "turret", 1, 1);
	addkillstreaktorule("armor_station", "turret", 1, 1);
	addkillstreaktorule("artillery", "firesupport", 1, 1);
	addkillstreaktorule("artillery_barrage", "artillery_barrage", 1, 1);
	addkillstreaktorule("auto_tow", "turret", 1, 1);
	addkillstreaktorule("autoturret", "turret", 1, 1);
	addkillstreaktorule("chopper_gunner", "chopper_gunner", 1, 1);
	addkillstreaktorule("combat_robot", "combatrobot", 1, 1);
	addkillstreaktorule("counteruav", "counteruav", 1, 1);
	addkillstreaktorule("counteruav", "targetableent", 1, 1);
	addkillstreaktorule("dart", "dart", 1, 1);
	addkillstreaktorule("ability_dog", "ability_dog", 1, 1);
	addkillstreaktorule("drone_squadron", "drone_squadron", 1, 1);
	addkillstreaktorule("drone_strike", "drone_strike", 1, 1);
	addkillstreaktorule("helicopter", "chopper", 1, 1);
	addkillstreaktorule("helicopter", "chopperInTheAir", 1, 0);
	addkillstreaktorule("helicopter", "playercontrolledchopper", 0, 1);
	addkillstreaktorule("helicopter", "targetableent", 1, 1);
	addkillstreaktorule("helicopter", "vehicle", 1, 1);
	addkillstreaktorule("helicopter_comlink", "chopper", 1, 1);
	addkillstreaktorule("helicopter_comlink", "chopperInTheAir", 1, 0);
	addkillstreaktorule("helicopter_comlink", "targetableent", 1, 1);
	addkillstreaktorule("helicopter_comlink", "vehicle", 1, 1);
	addkillstreaktorule("helicopter_comlink", "helicopter_comlink", 1, 1);
	addkillstreaktorule("overwatch_helicopter", "chopper", 1, 1);
	addkillstreaktorule("overwatch_helicopter", "chopperInTheAir", 1, 0);
	addkillstreaktorule("overwatch_helicopter", "targetableent", 1, 1);
	addkillstreaktorule("overwatch_helicopter", "vehicle", 1, 1);
	addkillstreaktorule("helicopter_guard", "chopper", 1, 1);
	addkillstreaktorule("helicopter_guard", "chopperInTheAir", 1, 0);
	addkillstreaktorule("helicopter_guard", "targetableent", 1, 1);
	addkillstreaktorule("helicopter_guard", "vehicle", 1, 1);
	addkillstreaktorule("helicopter_guard", "helicopter_guard", 1, 1);
	addkillstreaktorule("attack_helicopter", "chopperInTheAir", 1, 0);
	addkillstreaktorule("attack_helicopter", "playercontrolledchopper", 1, 1);
	addkillstreaktorule("attack_helicopter", "targetableent", 1, 1);
	addkillstreaktorule("attack_helicopter", "vehicle", 1, 1);
	addkillstreaktorule("helicopter_player_firstperson", "vehicle", 1, 1);
	addkillstreaktorule("helicopter_player_firstperson", "chopperInTheAir", 1, 1);
	addkillstreaktorule("helicopter_player_firstperson", "playercontrolledchopper", 1, 1);
	addkillstreaktorule("helicopter_player_firstperson", "targetableent", 1, 1);
	addkillstreaktorule("helicopter_x2", "chopper", 1, 1);
	addkillstreaktorule("helicopter_x2", "chopperInTheAir", 1, 0);
	addkillstreaktorule("helicopter_x2", "playercontrolledchopper", 0, 1);
	addkillstreaktorule("helicopter_x2", "targetableent", 1, 1);
	addkillstreaktorule("helicopter_x2", "vehicle", 1, 1);
	addkillstreaktorule("m202_flash", "weapon", 1, 1);
	addkillstreaktorule("m220_tow", "weapon", 1, 1);
	addkillstreaktorule("m220_tow_drop", "supplydrop", 1, 1);
	addkillstreaktorule("m220_tow_drop", "vehicle", 1, 1);
	addkillstreaktorule("m220_tow_killstreak", "weapon", 1, 1);
	addkillstreaktorule("m32", "weapon", 1, 1);
	addkillstreaktorule("m32_drop", "weapon", 1, 1);
	addkillstreaktorule("microwave_turret", "turret", 1, 1);
	addkillstreaktorule("minigun", "weapon", 1, 1);
	addkillstreaktorule("minigun_drop", "weapon", 1, 1);
	addkillstreaktorule("mini_turret", "turret", 1, 1);
	addkillstreaktorule("missile_drone", "missiledrone", 1, 1);
	addkillstreaktorule("missile_swarm", "missileswarm", 1, 1);
	addkillstreaktorule("mortar", "firesupport", 1, 1);
	addkillstreaktorule("mp40_drop", "weapon", 1, 1);
	addkillstreaktorule("napalm_strike", "airsupport", 1, 1);
	addkillstreaktorule("napalm_strike", "vehicle", 1, 1);
	addkillstreaktorule("planemortar", "planemortar", 1, 1);
	addkillstreaktorule("qrdrone", "qrdrone", 1, 1);
	addkillstreaktorule("qrdrone", "vehicle", 1, 1);
	addkillstreaktorule("uav", "uav", 1, 1);
	addkillstreaktorule("uav", "targetableent", 1, 1);
	addkillstreaktorule("ultimate_turret", "turret", 1, 1);
	addkillstreaktorule("ultimate_turret", "ultimate_turret", 1, 1);
	addkillstreaktorule("satellite", "satellite", 1, 1);
	addkillstreaktorule("raps", "raps", 1, 1);
	addkillstreaktorule("rcbomb", "rcxd", 1, 1);
	addkillstreaktorule("recon_car", "recon_car", 1, 1);
	addkillstreaktorule("recon_plane", "recon_plane", 1, 1);
	addkillstreaktorule("remote_missile", "targetableent", 1, 1);
	addkillstreaktorule("remote_missile", "remote_missile", 1, 1);
	addkillstreaktorule("remote_mortar", "remotemortar", 1, 1);
	addkillstreaktorule("remote_mortar", "targetableent", 1, 1);
	addkillstreaktorule("sentinel", "sentinel", 1, 1);
	addkillstreaktorule("spawnbeacon", "spawnbeacon", 1, 1);
	addkillstreaktorule("straferun", "straferun", 1, 1);
	addkillstreaktorule("jetfighter", "jetfighter", 1, 1);
	addkillstreaktorule("hoverjet", "hoverjet", 1, 1);
	addkillstreaktorule("supply_drop", "supplydrop", 1, 1);
	addkillstreaktorule("supply_drop", "targetableent", 1, 1);
	addkillstreaktorule("supply_drop", "vehicle", 1, 1);
	addkillstreaktorule("supply_station", "supplydrop", 1, 1);
	addkillstreaktorule("supply_station", "targetableent", 1, 1);
	addkillstreaktorule("supply_station", "vehicle", 1, 1);
	addkillstreaktorule("swat_team", "swat_team", 1, 1);
	addkillstreaktorule("tow_turret_drop", "supplydrop", 1, 1);
	addkillstreaktorule("tow_turret_drop", "vehicle", 1, 1);
	addkillstreaktorule("turret_drop", "supplydrop", 1, 1);
	addkillstreaktorule("turret_drop", "vehicle", 1, 1);
}

/*
	Name: function_7256bae2
	Namespace: killstreakrules
	Checksum: 0x44C64313
	Offset: 0x1500
	Size: 0x564
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7256bae2()
{
	createrule("tank_robot", 2, 1);
	createrule("ac130", 1, 1);
	createrule("airsupport", 1, 1);
	createrule("ammo_station", 8, 4);
	createrule("armor_station", 8, 4);
	createrule("artillery_barrage", 1, 1);
	createrule("combatrobot", 4, 2);
	createrule("chopper", 2, 1);
	createrule("chopper_gunner", 1, 1);
	createrule("chopperInTheAir", 2, 1);
	createrule("counteruav", 6, 3);
	createrule("dart", 4, 2);
	createrule("ability_dog", 1, 1);
	createrule("drone_squadron", 4, 2);
	createrule("drone_strike", 1, 1);
	createrule("firesupport", 1, 1);
	createrule("helicopter_comlink", 2, 1);
	createrule("helicopter_guard", 2, 1);
	createrule("missiledrone", 3, 3);
	createrule("missileswarm", 1, 1);
	createrule("planemortar", 1, 1);
	createrule("playercontrolledchopper", 1, 1);
	createrule("qrdrone", 3, 2);
	createrule("uav", 50, 25);
	createrule("raps", 2, 1);
	createrule("rcxd", 4, 2);
	createrule("recon_car", 4, 2);
	createrule("recon_plane", 2, 1);
	createrule("remote_missile", 2, 1);
	createrule("remotemortar", 1, 1);
	createrule("satellite", 2, 1);
	createrule("sentinel", 4, 2);
	createrule("spawnbeacon", 1, 2);
	createrule("straferun", 1, 1);
	createrule("jetfighter", 2, 1);
	createrule("hoverjet", 1, 1);
	createrule("supplydrop", 4, 4);
	createrule("swat_team", 4, 2);
	createrule("targetableent", 32, 32);
	createrule("turret", 8, 4);
	createrule("ultimate_turret", 8, 4);
	createrule("vehicle", 7, 7);
	createrule("weapon", 12, 6);
}

/*
	Name: function_65739e7b
	Namespace: killstreakrules
	Checksum: 0x7CE4DA64
	Offset: 0x1A70
	Size: 0x170
	Parameters: 3
	Flags: Linked
*/
function function_65739e7b(hardpointtype, team, isemped)
{
	if(isdefined(level.killstreaks[team]) && isdefined(level.killstreaks[team].notavailabletext))
	{
		self iprintlnbold(level.killstreaks[team].notavailabletext);
		if(!isdefined(self.currentkillstreakdialog))
		{
			return;
		}
		if(!isdefined(level.killstreaks[team].script_bundle))
		{
			return;
		}
		if(level.killstreaks[team].script_bundle.var_a9b0c301 === 1)
		{
			self globallogic_audio::play_taacom_dialog("groundspaceFull");
		}
		if(level.killstreaks[team].script_bundle.var_65d707d0 === 1 && isemped === 0)
		{
			self globallogic_audio::play_taacom_dialog("airspaceFull");
		}
	}
}

/*
	Name: function_2912fa8
	Namespace: killstreakrules
	Checksum: 0x72C33882
	Offset: 0x1BE8
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function function_2912fa8(var_d3413870)
{
	var_1be6aa23 = level flag::get("in_dark_side");
	if(is_true(self.var_16735873) || is_true(level.var_fe6ca5e8) || var_1be6aa23)
	{
		return 1;
	}
	if(isdefined(level.var_1f616ecc[var_d3413870]))
	{
		return self [[level.var_1f616ecc[var_d3413870]]]();
	}
	return 0;
}

/*
	Name: function_34884f54
	Namespace: killstreakrules
	Checksum: 0x663E741B
	Offset: 0x1CA0
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function function_34884f54()
{
	if(self function_2912fa8())
	{
		return false;
	}
	return true;
}

