#using script_20ac552ee498eb9d;
#using script_35b5ff21c2a0960f;
#using script_522aeb6ae906391e;
#using script_79a7e1c31a3e8cc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\gametypes\globallogic_actor.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\gametypes\hostmigration.gsc;
#using scripts\zm_common\zm_player.gsc;

#namespace callbacks;

/*
	Name: function_cd40ebb8
	Namespace: callbacks
	Checksum: 0x64995AB
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cd40ebb8()
{
	level notify(334528717);
}

#namespace callback;

/*
	Name: function_89f2df9
	Namespace: callback
	Checksum: 0xEBAD4C22
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"callback", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: callback
	Checksum: 0xA82A32E6
	Offset: 0x138
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
	Checksum: 0xCEDEA19F
	Offset: 0x160
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
	Checksum: 0xCDE53FA5
	Offset: 0x258
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
	level.var_6788bf11 = &namespace_e42b3e24::function_8c7ec52f;
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
	Checksum: 0xA4911060
	Offset: 0x3C8
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
	Checksum: 0x60FC8E27
	Offset: 0x410
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
	Checksum: 0x91F9C064
	Offset: 0x458
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
	Checksum: 0xE97352FF
	Offset: 0x4A0
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
	Checksum: 0xE441E840
	Offset: 0x4E8
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
	Checksum: 0xE2812B74
	Offset: 0x530
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
	Checksum: 0x8B673555
	Offset: 0x578
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
	Checksum: 0xF1FCED30
	Offset: 0x5C0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_50fdac80(func, obj)
{
	remove_callback(#"hash_6df5348c2fb9a509", func, obj);
}

/*
	Name: function_189f87c1
	Namespace: callback
	Checksum: 0x47ADDD4D
	Offset: 0x608
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_189f87c1(func, obj)
{
	add_callback(#"hash_193ded5c8932fe29", func, obj);
}

/*
	Name: function_ec6dfc37
	Namespace: callback
	Checksum: 0x17CAEC7C
	Offset: 0x650
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_ec6dfc37(func, obj)
{
	remove_callback(#"hash_193ded5c8932fe29", func, obj);
}

/*
	Name: function_b3c9adb7
	Namespace: callback
	Checksum: 0x10226A8A
	Offset: 0x698
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
	Checksum: 0x77F73FD8
	Offset: 0x6E0
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
	Checksum: 0x16CECCED
	Offset: 0x728
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
	Checksum: 0xEF335942
	Offset: 0x770
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_3e2ed898(func, obj)
{
	remove_callback(#"hash_790b67aca1bf8fc0", func, obj);
}

