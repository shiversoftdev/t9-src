#using script_3751b21462a54a7d;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_perk_juggernaut;

/*
	Name: __init__system__
	Namespace: zm_perk_juggernaut
	Checksum: 0xEBF89386
	Offset: 0x208
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_juggernaut", &function_70a657d8, undefined, undefined, #"hash_2d064899850813e2");
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_juggernaut
	Checksum: 0x37E6D9D4
	Offset: 0x258
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	enable_juggernaut_perk_for_level();
	zm_perks::register_perk_damage_override_func(&function_366a682a);
	level.var_8cc294a7 = &function_7486dbf4;
}

/*
	Name: function_7486dbf4
	Namespace: zm_perk_juggernaut
	Checksum: 0x9BBF0FF9
	Offset: 0x2B0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_7486dbf4(var_2cacdde7)
{
	var_2cacdde7 = var_2cacdde7 + (var_2cacdde7 * 0.25);
	return var_2cacdde7;
}

/*
	Name: function_366a682a
	Namespace: zm_perk_juggernaut
	Checksum: 0x11206ADB
	Offset: 0x2E0
	Size: 0x186
	Parameters: 10
	Flags: Linked
*/
function function_366a682a(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(self namespace_791d0451::function_56cedda7(#"hash_afdc67f440fb7d3") || self namespace_791d0451::function_56cedda7(#"hash_afdc57f440fb620"))
	{
		if(psoffsettime == "MOD_EXPLOSIVE" || psoffsettime == "MOD_GRENADE" || psoffsettime == "MOD_GRENADE_SPLASH" || psoffsettime == "MOD_PROJECTILE" || psoffsettime == "MOD_PROJECTILE_SPLASH" && vdir == self)
		{
			shitloc = 0;
		}
	}
	if(self namespace_791d0451::function_56cedda7(#"hash_afdc57f440fb620"))
	{
		var_b66f2623 = self.health - shitloc;
		if(var_b66f2623 <= 0 && self.armor > 0)
		{
			self.armor = 0;
			shitloc = shitloc - (1 - var_b66f2623);
		}
	}
	return shitloc;
}

/*
	Name: enable_juggernaut_perk_for_level
	Namespace: zm_perk_juggernaut
	Checksum: 0xAFC52999
	Offset: 0x470
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function enable_juggernaut_perk_for_level()
{
	zm_perks::register_perk_basic_info(#"hash_47d7a8105237c88", #"perk_juggernog", 2500, #"hash_27b60f868a13cc91", getweapon("zombie_perk_bottle_jugg"), undefined, #"zmperksjuggernaut");
	zm_perks::register_perk_precache_func(#"hash_47d7a8105237c88", &juggernaut_precache);
	zm_perks::register_perk_clientfields(#"hash_47d7a8105237c88", &juggernaut_register_clientfield, &juggernaut_set_clientfield);
	zm_perks::register_perk_machine(#"hash_47d7a8105237c88", &juggernaut_perk_machine_setup, &init_juggernaut);
	zm_perks::register_perk_threads(#"hash_47d7a8105237c88", &give_juggernaut_perk, &take_juggernaut_perk);
	zm_perks::register_perk_host_migration_params(#"hash_47d7a8105237c88", "vending_jugg", "jugger_light");
}

/*
	Name: init_juggernaut
	Namespace: zm_perk_juggernaut
	Checksum: 0x80F724D1
	Offset: 0x608
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_juggernaut()
{
}

/*
	Name: juggernaut_precache
	Namespace: zm_perk_juggernaut
	Checksum: 0xED41A2CE
	Offset: 0x618
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function juggernaut_precache()
{
	if(isdefined(level.juggernaut_precache_override_func))
	{
		[[level.juggernaut_precache_override_func]]();
		return;
	}
	level._effect[#"jugger_light"] = "zombie/fx_perk_juggernaut_ndu";
	level.machine_assets[#"hash_47d7a8105237c88"] = spawnstruct();
	level.machine_assets[#"hash_47d7a8105237c88"].weapon = getweapon("zombie_perk_bottle_jugg");
	level.machine_assets[#"hash_47d7a8105237c88"].off_model = "p9_sur_machine_juggernog_off";
	level.machine_assets[#"hash_47d7a8105237c88"].on_model = "p9_sur_machine_juggernog";
}

/*
	Name: juggernaut_register_clientfield
	Namespace: zm_perk_juggernaut
	Checksum: 0x80F724D1
	Offset: 0x718
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function juggernaut_register_clientfield()
{
}

/*
	Name: juggernaut_set_clientfield
	Namespace: zm_perk_juggernaut
	Checksum: 0x1B38C606
	Offset: 0x728
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function juggernaut_set_clientfield(state)
{
}

/*
	Name: juggernaut_perk_machine_setup
	Namespace: zm_perk_juggernaut
	Checksum: 0x985436F6
	Offset: 0x740
	Size: 0xA6
	Parameters: 4
	Flags: Linked
*/
function juggernaut_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	perk_machine.script_sound = "mus_perks_jugganog_jingle";
	perk_machine.script_string = "jugg_perk";
	perk_machine.script_label = "mus_perks_jugganog_sting";
	perk_machine.longjinglewait = 1;
	perk_machine.target = "vending_jugg";
	bump_trigger.script_string = "jugg_perk";
	bump_trigger.targetname = "vending_jugg";
	if(isdefined(collision))
	{
		collision.script_string = "jugg_perk";
	}
}

/*
	Name: give_juggernaut_perk
	Namespace: zm_perk_juggernaut
	Checksum: 0x80F724D1
	Offset: 0x7F0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function give_juggernaut_perk()
{
}

/*
	Name: take_juggernaut_perk
	Namespace: zm_perk_juggernaut
	Checksum: 0x6B47D249
	Offset: 0x800
	Size: 0x24
	Parameters: 4
	Flags: Linked
*/
function take_juggernaut_perk(b_pause, str_perk, str_result, n_slot)
{
}

