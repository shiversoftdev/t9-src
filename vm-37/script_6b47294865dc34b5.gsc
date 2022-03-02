#using script_263b7f2982258785;
#using script_2d443451ce681a;
#using script_31e9b35aaacbbd93;
#using script_3dc93ca9902a9cda;
#using script_70b6424f429d140;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\vehicleriders_shared.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\objectives.gsc;
#using scripts\cp_common\skipto.gsc;

#namespace namespace_cb0d537d;

/*
	Name: starting
	Namespace: namespace_cb0d537d
	Checksum: 0x722B7485
	Offset: 0x378
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function starting(str_skipto)
{
	level.var_aece851d = [];
	flag::set("heli_door_opening");
}

/*
	Name: main
	Namespace: namespace_cb0d537d
	Checksum: 0xA85DB672
	Offset: 0x3B8
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function main(str_skipto, b_starting)
{
	level.var_33621ea7 = 0;
	thread function_a7dc18f3();
	thread namespace_a052577e::function_e04b45ab();
	level flag::wait_till("heli_convoy_aslt_complete");
	if(isdefined(b_starting))
	{
		skipto::objective_completed(b_starting);
	}
}

/*
	Name: cleanup
	Namespace: namespace_cb0d537d
	Checksum: 0x714C936A
	Offset: 0x448
	Size: 0x24
	Parameters: 4
	Flags: None
*/
function cleanup(name, starting, direct, player)
{
}

/*
	Name: init_flags
	Namespace: namespace_cb0d537d
	Checksum: 0xCD94A1FC
	Offset: 0x478
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
	level flag::init("heli_convoy_aslt_complete");
	level flag::init("intro_takeout_driver");
	level flag::init("intro_takeout_target");
	level flag::init("intro_takeout_never");
}

/*
	Name: init_clientfields
	Namespace: namespace_cb0d537d
	Checksum: 0x80F724D1
	Offset: 0x508
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
}

/*
	Name: init_scenes
	Namespace: namespace_cb0d537d
	Checksum: 0x80F724D1
	Offset: 0x518
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_scenes()
{
}

/*
	Name: function_46693791
	Namespace: namespace_cb0d537d
	Checksum: 0xD1CF1CD8
	Offset: 0x528
	Size: 0x4A2
	Parameters: 0
	Flags: Linked
*/
function function_46693791()
{
	driver = getent("intro_driver_assassinate", "targetname", 1);
	if(!isdefined(level.var_664fd741))
	{
		level.var_664fd741 = getent("woods_chopper_from_scene", "script_noteworthy", 1);
		if(!isdefined(level.var_664fd741))
		{
			spawners = getspawnerarray("intro_assault_ally_hudson", "targetename");
			if(!isdefined(spawners) || spawners.size == 0)
			{
				spawners = getspawnerarray("intro_assault_ally_hudson", "script_noteworthy");
			}
			level.var_664fd741 = spawners[0] spawner::spawn(1);
		}
		else
		{
			level flag::wait_till("heli_intro_path_ally");
			level.var_664fd741 thread spawner::go_to_node();
		}
		level.var_664fd741.ignoreall = 1;
		level.var_664fd741.ignoreme = 1;
		level.var_aece851d[level.var_aece851d.size] = level.var_664fd741;
		level thread util::magic_bullet_shield(level.var_664fd741);
	}
	flag::set("woods_gogo");
	if(isdefined(driver))
	{
		driver ai::bloody_death(0.2);
	}
	wait(1.2);
	level.var_664fd741.ignoreall = 0;
	wait(1);
	objectives::follow("woods_hit1", level.var_664fd741);
	level.var_95a74232 = 1;
	aiarray = ai::array_spawn("intro_assault_extra_guys");
	aiarray = arraycombine(aiarray, getentarray("intro_enemy_truck_guys", "script_noteworthy"), 1, 0);
	foreach(guy in aiarray)
	{
		guy.ignoreall = 1;
		guy.ignoreme = 1;
		if(!isdefined(driver))
		{
			if(isdefined(guy.script_parameters) && guy.script_parameters == "intro_driver_assassinate")
			{
				driver = guy;
			}
		}
	}
	wait(0.2);
	foreach(guy in aiarray)
	{
		if(isdefined(guy))
		{
			guy.ignoreme = 0;
		}
	}
	level.var_664fd741.ignoreall = 0;
	level.var_664fd741.ignoreme = 0;
	foreach(guy in aiarray)
	{
		if(isdefined(guy))
		{
			if(!(isdefined(guy.script_parameters) && guy.script_parameters == "squirter"))
			{
				guy.ignoreall = 0;
			}
		}
	}
}

/*
	Name: function_149bd557
	Namespace: namespace_cb0d537d
	Checksum: 0x10988867
	Offset: 0x9D8
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function function_149bd557()
{
	if(!isdefined(level.var_abaa6487))
	{
		return;
	}
	wait(0.1);
	foreach(truck in level.var_abaa6487)
	{
		thread function_d8f00fe0(truck);
	}
}

/*
	Name: function_c42508f4
	Namespace: namespace_cb0d537d
	Checksum: 0x8AB1464A
	Offset: 0xA88
	Size: 0x116
	Parameters: 0
	Flags: None
*/
function function_c42508f4()
{
	self endon(#"death");
	self endon(#"exited_vehicle");
	start = gettime();
	while(true)
	{
		/#
			print3d(self.origin + vectorscale((0, 0, 1), 72), "", (1, 0, 0), 1, 0.5, 1, 1);
			self.unload_time = (int((gettime() - start) / 10)) / 100;
			print3d(self.origin + vectorscale((0, 0, 1), 60), "" + self.unload_time, (1, 0, 0), 1, 0.5, 1);
		#/
		waitframe(1);
	}
}

/*
	Name: function_77937c90
	Namespace: namespace_cb0d537d
	Checksum: 0xF43B418D
	Offset: 0xBA8
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_77937c90()
{
	self.ignoreme = 0;
	if(!isdefined(self.target))
	{
		return;
	}
	self endon(#"death");
	self waittill(#"exited_vehicle");
	waitframe(2);
	to = getnode(self.target, "targetname");
	if(!isdefined(to))
	{
		to = getent(self.target, "targetname");
	}
	if(isdefined(to))
	{
		self setgoal(to, 1);
	}
}

/*
	Name: function_d8f00fe0
	Namespace: namespace_cb0d537d
	Checksum: 0xC7EA49F2
	Offset: 0xC78
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function function_d8f00fe0(truck)
{
	if(truck.script_parameters == "truck_bustout_unload")
	{
		foreach(rider in truck.var_761c973.riders)
		{
			if(isdefined(rider))
			{
				rider.ignoreme = 1;
			}
		}
	}
	level flag::wait_till(truck.script_parameters);
	if(isalive(truck))
	{
		arrayremovevalue(truck.var_761c973.riders, undefined, 1);
		array::thread_all(truck.var_761c973.riders, &function_77937c90);
		truck thread vehicle::unload("crew");
		truck thread vehicle::unload("passenger1");
		truck thread vehicle::unload("driver");
	}
}

/*
	Name: function_a7dc18f3
	Namespace: namespace_cb0d537d
	Checksum: 0xBC0C640
	Offset: 0xE28
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_a7dc18f3()
{
	aiarray = array();
	if(!isdefined(level.var_40b02b72))
	{
		player = getplayers()[0];
		player val::set("takedown_hit1_intro", "show_weapon_hud", 0);
		thread namespace_e66dabaf::function_c6662dbb("intro_enemy_trucks", 1);
		waitframe(4);
		level flag::set("intro_heli_lights_on");
		thread namespace_e66dabaf::function_3d66ebcc("intro_heli_player", 1, 1);
		wait(2.5);
	}
	aiarray = getentarray("intro_enemy_truck_guys", "script_noteworthy", 1);
	thread function_46693791();
	array::wait_till(aiarray, "death");
	level.var_664fd741.ignoreall = 1;
	level.var_664fd741.ignoreme = 1;
	thread function_83cd8600();
	level flag::wait_till("intro_takeout_target");
	dialogue::radio("vox_cp_tdwn_01300_chp1_notsureithought_5a");
	level flag::set("truck_bustout_unload");
	wait(2);
	level flag::set("heli_convoy_aslt_complete");
}

/*
	Name: function_83cd8600
	Namespace: namespace_cb0d537d
	Checksum: 0xFB44137
	Offset: 0x1028
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_83cd8600()
{
	flag::wait_till("intro_moving_to_bustout");
	wait(1);
	level.var_664fd741.ignoreall = 0;
	level.var_664fd741.ignoreme = 0;
}

