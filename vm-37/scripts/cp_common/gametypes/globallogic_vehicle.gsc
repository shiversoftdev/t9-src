#using scripts\cp_common\util.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace vehicles;

/*
	Name: __init__system__
	Namespace: vehicles
	Checksum: 0x223F3BFA
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"globallogic_vehicle", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: vehicles
	Checksum: 0xE5DEAE43
	Offset: 0x158
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(world.var_f6fb45f7))
	{
		world.var_f6fb45f7 = [];
	}
	callback::on_connect(&function_80238885);
	callback::on_connect(&watch_exit_vehicle);
}

/*
	Name: function_80238885
	Namespace: vehicles
	Checksum: 0x98DA483E
	Offset: 0x1C8
	Size: 0x188
	Parameters: 0
	Flags: Private
*/
function private function_80238885()
{
	level endon(#"hash_3d8aca70026bca9e");
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"enter_vehicle");
		var_80730518 = waitresult.vehicle;
		self.var_80730518 = var_80730518;
		self.canbemeleed = 0;
		if(isbot(self))
		{
			self.seat_index = waitresult.seat_index;
			w_weapon = var_80730518 turret::get_weapon(self.seat_index);
			if(w_weapon != level.weaponnone)
			{
				var_80730518 turret::enable(self.seat_index);
			}
		}
		var_80730518 val::reset(#"player_vehicle", "ignoreme");
		self val::set(#"player_vehicle", "ignoreme");
		if(is_true(var_80730518.var_932a203f))
		{
			var_80730518 makevehicleunusable();
		}
	}
}

/*
	Name: watch_exit_vehicle
	Namespace: vehicles
	Checksum: 0x11FE52A4
	Offset: 0x358
	Size: 0x1F0
	Parameters: 0
	Flags: Private
*/
function private watch_exit_vehicle()
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"exit_vehicle");
		var_80730518 = waitresult.vehicle;
		self.canbemeleed = 1;
		if(isalive(self))
		{
			self.var_80730518 = undefined;
			if(var_80730518.scriptvehicletype === "player_hunter" && isalive(var_80730518))
			{
				var_80730518 makevehicleusable();
			}
			if(isbot(self))
			{
				if(isdefined(self.seat_index) && self.seat_index >= 0)
				{
					w_weapon = var_80730518 turret::get_weapon(self.seat_index);
					if(w_weapon != level.weaponnone)
					{
						var_80730518 turret::disable(self.seat_index);
					}
					self.seat_index = -1;
				}
			}
		}
		else
		{
		}
		if(isalive(var_80730518))
		{
			var_80730518 val::set(#"player_vehicle", "ignoreme");
		}
		self val::reset(#"player_vehicle", "ignoreme");
	}
}

/*
	Name: function_5310fa38
	Namespace: vehicles
	Checksum: 0xF576EFA8
	Offset: 0x550
	Size: 0xFC
	Parameters: 2
	Flags: None
*/
function function_5310fa38(vh_target, n_seat)
{
	if(isbot(self) && (is_true(vh_target.var_3a60b519) || self isplayinganimscripted()))
	{
		return false;
	}
	if(isdefined(vh_target) && isalive(self) && is_true(vh_target function_dcef0ba1(n_seat)) && !vh_target isvehicleseatoccupied(n_seat) && !isdefined(self._scene_object))
	{
		return true;
	}
	return false;
}

