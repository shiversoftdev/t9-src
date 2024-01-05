#using scripts\weapons\deployable.gsc;
#using script_4266a5d281c65453;
#using scripts\cp_common\gametypes\globallogic_player.gsc;
#using scripts\cp_common\gametypes\globallogic_actor.gsc;
#using scripts\cp_common\gametypes\globallogic.gsc;
#using scripts\cp_common\challenges.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\globallogic\globallogic_vehicle.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace callbacks;

/*
	Name: function_d6f6ac23
	Namespace: callbacks
	Checksum: 0x469924EA
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d6f6ac23()
{
	level notify(499382727);
}

#namespace callback;

/*
	Name: __init__system__
	Namespace: callback
	Checksum: 0x2F5016A8
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"callback", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: callback
	Checksum: 0xF6C31DED
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	set_default_callbacks();
}

/*
	Name: function_8a0395cd
	Namespace: callback
	Checksum: 0xC5BDB3F1
	Offset: 0x138
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_8a0395cd(func, obj)
{
	function_d8abfc3d(#"hash_31c83c1c404a846b", func, obj);
}

/*
	Name: function_b9e4759f
	Namespace: callback
	Checksum: 0x3EDF1371
	Offset: 0x180
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_b9e4759f(func, obj)
{
	function_52ac9652(#"hash_31c83c1c404a846b", func, obj);
}

/*
	Name: function_980de2d1
	Namespace: callback
	Checksum: 0x8223909E
	Offset: 0x1C8
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event function_980de2d1(eventstruct)
{
	self callback(#"hash_31c83c1c404a846b", eventstruct);
}

/*
	Name: set_default_callbacks
	Namespace: callback
	Checksum: 0x614EFB7D
	Offset: 0x200
	Size: 0x20C
	Parameters: 0
	Flags: Linked
*/
function set_default_callbacks()
{
	level.callbackstartgametype = &globallogic::callback_startgametype;
	level.callbackplayerconnect = &globallogic_player::callback_playerconnect;
	level.callbackplayerdisconnect = &globallogic_player::callback_playerdisconnect;
	level.callbackplayerdamage = &globallogic_player::callback_playerdamage;
	level.callbackplayerkilled = &globallogic_player::callback_playerkilled;
	level.callbackplayershielddamageblocked = &globallogic_player::callback_playershielddamageblocked;
	level.var_3a9881cb = &globallogic_player::function_74b6d714;
	level.callbackplayermelee = &globallogic_player::callback_playermelee;
	level.callbackactorspawned = &globallogic_actor::callback_actorspawned;
	level.callbackactordamage = &globallogic_actor::callback_actordamage;
	level.callbackactorkilled = &globallogic_actor::callback_actorkilled;
	level.callbackactorcloned = &globallogic_actor::callback_actorcloned;
	level.var_6788bf11 = &globallogic_scriptmover::function_8c7ec52f;
	level.callbackvehiclespawned = &globallogic_vehicle::callback_vehiclespawned;
	level.callbackvehicledamage = &globallogic_vehicle::callback_vehicledamage;
	level.callbackvehiclekilled = &globallogic_vehicle::callback_vehiclekilled;
	level.callbackvehicleradiusdamage = &globallogic_vehicle::callback_vehicleradiusdamage;
	level.callbackplayermigrated = &globallogic_player::callback_playermigrated;
	level.callbackdecorationawarded = &challenges::function_f901cb3c;
	level.var_69959686 = &deployable::function_209fda28;
	level._custom_weapon_damage_func = &callback_weapon_damage;
	level._gametype_default = "coop";
}

