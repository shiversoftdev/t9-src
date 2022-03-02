#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_perk_sleight_of_hand;

/*
	Name: function_92464397
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x32DCFA76
	Offset: 0x1C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_92464397()
{
	level notify(2071547223);
}

/*
	Name: function_89f2df9
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x6CDF6727
	Offset: 0x1E0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_perk_sleight_of_hand", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xBFC60A05
	Offset: 0x228
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	enable_sleight_of_hand_perk_for_level();
}

/*
	Name: enable_sleight_of_hand_perk_for_level
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x9481818B
	Offset: 0x248
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function enable_sleight_of_hand_perk_for_level()
{
	zm_perks::register_perk_basic_info(#"hash_5930cf0eb070e35a", #"perk_sleight_of_hand", 3000, #"hash_1fe685096c4f7bd2", getweapon("zombie_perk_bottle_sleight"), undefined, #"hash_8edd17a31990450");
	zm_perks::register_perk_precache_func(#"hash_5930cf0eb070e35a", &sleight_of_hand_precache);
	zm_perks::register_perk_clientfields(#"hash_5930cf0eb070e35a", &sleight_of_hand_register_clientfield, &sleight_of_hand_set_clientfield);
	zm_perks::register_perk_machine(#"hash_5930cf0eb070e35a", &sleight_of_hand_perk_machine_setup, undefined, "p9_fxanim_zm_gp_speed_cola_bundle");
	zm_perks::register_perk_host_migration_params(#"hash_5930cf0eb070e35a", "vending_sleight", "sleight_light");
}

/*
	Name: sleight_of_hand_precache
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x1B60CB3
	Offset: 0x398
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function sleight_of_hand_precache()
{
	if(isdefined(level.sleight_of_hand_precache_override_func))
	{
		[[level.sleight_of_hand_precache_override_func]]();
		return;
	}
	level._effect[#"sleight_light"] = "zombie/fx_perk_speedcola_ndu";
	level.machine_assets[#"hash_5930cf0eb070e35a"] = spawnstruct();
	level.machine_assets[#"hash_5930cf0eb070e35a"].weapon = getweapon("zombie_perk_bottle_sleight");
	level.machine_assets[#"hash_5930cf0eb070e35a"].off_model = "p9_sur_machine_speed_cola_off";
	level.machine_assets[#"hash_5930cf0eb070e35a"].on_model = "p9_sur_machine_speed_cola";
}

/*
	Name: sleight_of_hand_register_clientfield
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x80F724D1
	Offset: 0x498
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function sleight_of_hand_register_clientfield()
{
}

/*
	Name: sleight_of_hand_set_clientfield
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x66D4A086
	Offset: 0x4A8
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function sleight_of_hand_set_clientfield(state)
{
}

/*
	Name: sleight_of_hand_perk_machine_setup
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xC2E62CA0
	Offset: 0x4C0
	Size: 0x9A
	Parameters: 4
	Flags: Linked
*/
function sleight_of_hand_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	perk_machine.script_sound = "mus_perks_speed_jingle";
	perk_machine.script_string = "speedcola_perk";
	perk_machine.script_label = "mus_perks_speed_sting";
	perk_machine.target = "vending_sleight";
	bump_trigger.script_string = "speedcola_perk";
	bump_trigger.targetname = "vending_sleight";
	if(isdefined(collision))
	{
		collision.script_string = "speedcola_perk";
	}
}

