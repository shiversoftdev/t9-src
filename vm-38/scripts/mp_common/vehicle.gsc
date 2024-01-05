#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace vehicle;

/*
	Name: function_bde915d8
	Namespace: vehicle
	Checksum: 0x585C3D9D
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bde915d8()
{
	level notify(-1446458646);
}

/*
	Name: __init__system__
	Namespace: vehicle
	Checksum: 0x604DB5A5
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"vehicle", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: vehicle
	Checksum: 0x80F724D1
	Offset: 0x128
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: player_is_occupant_invulnerable
	Namespace: vehicle
	Checksum: 0x4704396E
	Offset: 0x138
	Size: 0xEC
	Parameters: 2
	Flags: Linked
*/
function player_is_occupant_invulnerable(attacker, smeansofdeath)
{
	if(self isremotecontrolling())
	{
		return 0;
	}
	if(self.var_ca876b0f === 1 && self player_is_driver())
	{
		if(self.var_e7e2e3e5 === 1 && (isplayer(smeansofdeath) && smeansofdeath == self))
		{
			return 1;
		}
		return 0;
	}
	if(!isdefined(level.vehicle_drivers_are_invulnerable))
	{
		level.vehicle_drivers_are_invulnerable = 0;
	}
	invulnerable = level.vehicle_drivers_are_invulnerable && self player_is_driver();
	return invulnerable;
}

/*
	Name: player_is_driver
	Namespace: vehicle
	Checksum: 0xD9241490
	Offset: 0x230
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function player_is_driver()
{
	if(!isalive(self))
	{
		return false;
	}
	vehicle = self getvehicleoccupied();
	if(isdefined(vehicle))
	{
		seat = vehicle getoccupantseat(self);
		if(isdefined(seat) && seat == 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: initvehiclemap
	Namespace: vehicle
	Checksum: 0xBC8036F0
	Offset: 0x2C0
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function initvehiclemap()
{
	/#
		root = "";
		adddebugcommand(root + "");
		adddebugcommand(root + "");
		adddebugcommand(root + "");
	#/
	thread vehiclemainthread();
}

/*
	Name: vehiclemainthread
	Namespace: vehicle
	Checksum: 0xF530A450
	Offset: 0x358
	Size: 0xDA
	Parameters: 0
	Flags: Linked
*/
function vehiclemainthread()
{
	spawn_nodes = struct::get_array("veh_spawn_point", "targetname");
	for(i = 0; i < spawn_nodes.size; i++)
	{
		spawn_node = spawn_nodes[i];
		veh_name = spawn_node.script_noteworthy;
		time_interval = int(spawn_node.script_parameters);
		if(!isdefined(veh_name))
		{
			continue;
		}
		thread vehiclespawnthread(veh_name, spawn_node.origin, spawn_node.angles, time_interval);
		waitframe(1);
	}
}

/*
	Name: vehiclespawnthread
	Namespace: vehicle
	Checksum: 0x1A84BA5E
	Offset: 0x440
	Size: 0x1EE
	Parameters: 4
	Flags: Linked
*/
function vehiclespawnthread(veh_name, origin, angles, time_interval)
{
	level endon(#"game_ended");
	veh_spawner = getent(veh_name + "_spawner", "targetname");
	while(true)
	{
		vehicle = veh_spawner spawnfromspawner(veh_name, 1, 1, 1);
		if(!isdefined(vehicle))
		{
			wait(randomfloatrange(1, 2));
			continue;
		}
		vehicle asmrequestsubstate(#"locomotion@movement");
		waitframe(1);
		vehicle makevehicleusable();
		if(target_istarget(vehicle))
		{
			target_remove(vehicle);
		}
		vehicle.origin = origin;
		vehicle.angles = angles;
		vehicle.nojumping = 1;
		vehicle.forcedamagefeedback = 1;
		vehicle.vehkilloccupantsondeath = 1;
		vehicle disableaimassist();
		vehicle thread vehicleteamthread();
		vehicle waittill(#"death");
		vehicle vehicle_death::deletewhensafe(0.25);
		if(isdefined(time_interval))
		{
			wait(time_interval);
		}
	}
}

/*
	Name: vehicleteamthread
	Namespace: vehicle
	Checksum: 0x53B3B699
	Offset: 0x638
	Size: 0x1B8
	Parameters: 0
	Flags: Linked
*/
function vehicleteamthread()
{
	vehicle = self;
	vehicle endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = vehicle waittill(#"enter_vehicle");
		player = waitresult.player;
		vehicle setteam(player.team);
		vehicle clientfield::set("toggle_lights", 1);
		if(!target_istarget(vehicle))
		{
			if(isdefined(vehicle.targetoffset))
			{
				target_set(vehicle, vehicle.targetoffset);
			}
			else
			{
				target_set(vehicle, (0, 0, 0));
			}
		}
		vehicle thread watchplayerexitrequestthread(player);
		vehicle waittill(#"exit_vehicle");
		vehicle setteam(#"neutral");
		vehicle clientfield::set("toggle_lights", 0);
		if(target_istarget(vehicle))
		{
			target_remove(vehicle);
		}
	}
}

/*
	Name: watchplayerexitrequestthread
	Namespace: vehicle
	Checksum: 0xB30E3F43
	Offset: 0x7F8
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function watchplayerexitrequestthread(player)
{
	level endon(#"game_ended");
	player endon(#"death", #"disconnect");
	vehicle = self;
	vehicle endon(#"death");
	wait(1.5);
	while(true)
	{
		timeused = 0;
		while(player usebuttonpressed())
		{
			timeused = timeused + 0.05;
			if(timeused > 0.25)
			{
				player unlink();
				return;
			}
			waitframe(1);
		}
		waitframe(1);
	}
}

