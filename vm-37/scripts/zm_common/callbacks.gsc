#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\gametypes\hostmigration.gsc;
#using scripts\zm_common\gametypes\globallogic_scriptmover.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\gametypes\globallogic_actor.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\globallogic\globallogic_vehicle.gsc;
#using scripts\weapons\deployable.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using script_522aeb6ae906391e;
#using scripts\core_common\struct.gsc;

#namespace callback;

/*
	Name: __init__system__
	Namespace: callback
	Checksum: 0x43C39159
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
	Checksum: 0x76EDC14C
	Offset: 0x118
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level thread setup_callbacks();
}

/*
	Name: setup_callbacks
	Namespace: callback
	Checksum: 0xA4E9F2C5
	Offset: 0x140
	Size: 0xF0
	Parameters: 0
	Flags: Linked
*/
function setup_callbacks()
{
	setdefaultcallbacks();
	level.idflags_noflag = 0;
	level.idflags_radius = 1;
	level.idflags_no_armor = 2;
	level.idflags_no_knockback = 4;
	level.idflags_penetration = 8;
	level.idflags_destructible_entity = 16;
	level.idflags_shield_explosive_impact = 32;
	level.idflags_shield_explosive_impact_huge = 64;
	level.idflags_shield_explosive_splash = 128;
	level.idflags_hurt_trigger_allow_laststand = 256;
	level.idflags_disable_ragdoll_skip = 512;
	level.idflags_no_team_protection = 8192;
	level.var_598c4d23 = 16384;
	level.var_681a9181 = 32768;
}

/*
	Name: setdefaultcallbacks
	Namespace: callback
	Checksum: 0xEE485D1
	Offset: 0x238
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function setdefaultcallbacks()
{
	level.callbackstartgametype = &globallogic::callback_startgametype;
	level.callbackplayerconnect = &globallogic_player::callback_playerconnect;
	level.callbackplayerdisconnect = &globallogic_player::callback_playerdisconnect;
	level.callbackplayermelee = &globallogic_player::callback_playermelee;
	level.callbackactorspawned = &globallogic_actor::callback_actorspawned;
	level.callbackactorcloned = &globallogic_actor::callback_actorcloned;
	level.var_6788bf11 = &globallogic_scriptmover::function_8c7ec52f;
	level.callbackvehiclespawned = &globallogic_vehicle::callback_vehiclespawned;
	level.callbackplayermigrated = &globallogic_player::callback_playermigrated;
	level.callbackhostmigration = &hostmigration::callback_hostmigration;
	level.callbackhostmigrationsave = &hostmigration::callback_hostmigrationsave;
	level.callbackprehostmigrationsave = &hostmigration::callback_prehostmigrationsave;
	level.var_69959686 = &deployable::function_209fda28;
	level.var_3a9881cb = &zm_player::function_74b6d714;
	level._gametype_default = "zclassic";
}

/*
	Name: function_6e6149a6
	Namespace: callback
	Checksum: 0xAC0044AC
	Offset: 0x3A8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_6e6149a6(func, obj)
{
	add_callback(#"hash_1eda827ff5e6895b", func, obj);
}

/*
	Name: function_823e7181
	Namespace: callback
	Checksum: 0x70A25D1A
	Offset: 0x3F0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_823e7181(func, obj)
{
	remove_callback(#"hash_34edc1c4f45e5572", func, obj);
}

/*
	Name: function_4b58e5ab
	Namespace: callback
	Checksum: 0xA7ED0436
	Offset: 0x438
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_4b58e5ab(func, obj)
{
	add_callback(#"hash_210adcf09e99fba1", func, obj);
}

/*
	Name: function_66d5d485
	Namespace: callback
	Checksum: 0x144284E8
	Offset: 0x480
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_66d5d485(func, obj)
{
	remove_callback(#"hash_1863ba8e81df2a64", func, obj);
}

/*
	Name: function_dfd4b1a0
	Namespace: callback
	Checksum: 0x21310EB5
	Offset: 0x4C8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_dfd4b1a0(func, obj)
{
	add_callback(#"hash_7cdd5b06f3e281c6", func, obj);
}

/*
	Name: function_34700b93
	Namespace: callback
	Checksum: 0xF6FFFA2
	Offset: 0x510
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_34700b93(func, obj)
{
	remove_callback(#"hash_4e737d409e1399c9", func, obj);
}

/*
	Name: function_74872db6
	Namespace: callback
	Checksum: 0x1EE1A193
	Offset: 0x558
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_74872db6(func, obj)
{
	add_callback(#"hash_6df5348c2fb9a509", func, obj);
}

/*
	Name: function_50fdac80
	Namespace: callback
	Checksum: 0x98982D79
	Offset: 0x5A0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_50fdac80(func, obj)
{
	remove_callback(#"hash_6df5348c2fb9a509", func, obj);
}

/*
	Name: on_round_end
	Namespace: callback
	Checksum: 0x1BE1793E
	Offset: 0x5E8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function on_round_end(func, obj)
{
	add_callback(#"on_round_end", func, obj);
}

/*
	Name: remove_on_round_end
	Namespace: callback
	Checksum: 0x335699D5
	Offset: 0x630
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function remove_on_round_end(func, obj)
{
	remove_callback(#"on_round_end", func, obj);
}

/*
	Name: function_b3c9adb7
	Namespace: callback
	Checksum: 0xA8B4319B
	Offset: 0x678
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_b3c9adb7(func, obj)
{
	add_callback(#"hash_7d40e25056b9275c", func, obj);
}

/*
	Name: function_342b2f6
	Namespace: callback
	Checksum: 0xF32CA8B2
	Offset: 0x6C0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_342b2f6(func, obj)
{
	remove_callback(#"hash_7d40e25056b9275c", func, obj);
}

/*
	Name: function_aebeafc0
	Namespace: callback
	Checksum: 0xC9EE835C
	Offset: 0x708
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_aebeafc0(func, obj)
{
	add_callback(#"hash_790b67aca1bf8fc0", func, obj);
}

/*
	Name: function_3e2ed898
	Namespace: callback
	Checksum: 0x77382B81
	Offset: 0x750
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_3e2ed898(func, obj)
{
	remove_callback(#"hash_790b67aca1bf8fc0", func, obj);
}

