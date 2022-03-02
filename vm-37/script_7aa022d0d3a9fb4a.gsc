#using script_3751b21462a54a7d;
#using script_5f261a5d57de5f7c;
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

#namespace zm_perk_staminup;

/*
	Name: function_89f2df9
	Namespace: zm_perk_staminup
	Checksum: 0xC7E6BD99
	Offset: 0x1B8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_perk_staminup", &function_70a657d8, undefined, undefined, #"hash_2d064899850813e2");
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_staminup
	Checksum: 0x131EAFC4
	Offset: 0x208
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	enable_staminup_perk_for_level();
}

/*
	Name: enable_staminup_perk_for_level
	Namespace: zm_perk_staminup
	Checksum: 0x3B48C4AB
	Offset: 0x228
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function enable_staminup_perk_for_level()
{
	zm_perks::register_perk_basic_info(#"hash_602a1b6107105f07", #"perk_staminup", 2000, #"hash_7ef29d7842460907", getweapon("zombie_perk_bottle_marathon"), undefined, #"hash_3a15ddcc25d689f6");
	zm_perks::register_perk_precache_func(#"hash_602a1b6107105f07", &staminup_precache);
	zm_perks::register_perk_clientfields(#"hash_602a1b6107105f07", &staminup_register_clientfield, &staminup_set_clientfield);
	zm_perks::register_perk_machine(#"hash_602a1b6107105f07", &staminup_perk_machine_setup);
	zm_perks::register_perk_host_migration_params(#"hash_602a1b6107105f07", "vending_marathon", "marathon_light");
	zm_perks::register_perk_damage_override_func(&function_dae4e0ad);
}

/*
	Name: staminup_precache
	Namespace: zm_perk_staminup
	Checksum: 0x5B1E33A6
	Offset: 0x390
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function staminup_precache()
{
	if(isdefined(level.staminup_precache_override_func))
	{
		[[level.staminup_precache_override_func]]();
		return;
	}
	level._effect[#"marathon_light"] = "zombie/fx_perk_staminup_ndu";
	level.machine_assets[#"hash_602a1b6107105f07"] = spawnstruct();
	level.machine_assets[#"hash_602a1b6107105f07"].weapon = getweapon("zombie_perk_bottle_marathon");
	level.machine_assets[#"hash_602a1b6107105f07"].off_model = "p9_sur_machine_staminup_off";
	level.machine_assets[#"hash_602a1b6107105f07"].on_model = "p9_sur_machine_staminup";
}

/*
	Name: staminup_register_clientfield
	Namespace: zm_perk_staminup
	Checksum: 0x80F724D1
	Offset: 0x490
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function staminup_register_clientfield()
{
}

/*
	Name: staminup_set_clientfield
	Namespace: zm_perk_staminup
	Checksum: 0xEBBD8488
	Offset: 0x4A0
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function staminup_set_clientfield(state)
{
}

/*
	Name: staminup_perk_machine_setup
	Namespace: zm_perk_staminup
	Checksum: 0x92D7E780
	Offset: 0x4B8
	Size: 0x9A
	Parameters: 4
	Flags: Linked
*/
function staminup_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	perk_machine.script_sound = "mus_perks_stamin_jingle";
	perk_machine.script_string = "marathon_perk";
	perk_machine.script_label = "mus_perks_stamin_sting";
	perk_machine.target = "vending_marathon";
	bump_trigger.script_string = "marathon_perk";
	bump_trigger.targetname = "vending_marathon";
	if(isdefined(collision))
	{
		collision.script_string = "marathon_perk";
	}
}

/*
	Name: function_dae4e0ad
	Namespace: zm_perk_staminup
	Checksum: 0x95414D70
	Offset: 0x560
	Size: 0x84
	Parameters: 10
	Flags: Linked
*/
function function_dae4e0ad(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(psoffsettime == "MOD_FALLING")
	{
		if(namespace_e86ffa8::function_3623f9d1(2))
		{
			return 0;
		}
	}
	return undefined;
}

