#using script_256b8879317373de;
#using script_3751b21462a54a7d;
#using script_3f9e0dc8454d98e1;
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

#namespace zm_perk_juggernaut;

/*
	Name: function_eb7198dd
	Namespace: zm_perk_juggernaut
	Checksum: 0xCE090AF9
	Offset: 0x1C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eb7198dd()
{
	level notify(1603795106);
}

/*
	Name: function_89f2df9
	Namespace: zm_perk_juggernaut
	Checksum: 0x99C0604D
	Offset: 0x1E0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_perk_juggernaut", &function_70a657d8, undefined, undefined, #"hash_2d064899850813e2");
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_juggernaut
	Checksum: 0x640127E9
	Offset: 0x230
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	enable_juggernaut_perk_for_level();
	level.var_8cc294a7 = &function_7486dbf4;
	level.var_bb0b2298 = &function_297a5142;
}

/*
	Name: function_297a5142
	Namespace: zm_perk_juggernaut
	Checksum: 0x523B33BE
	Offset: 0x280
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_297a5142()
{
	if(!isplayer(self))
	{
		return 1;
	}
	if(self namespace_e86ffa8::function_71680faf(4))
	{
		return 0.75;
	}
	return 1;
}

/*
	Name: function_7486dbf4
	Namespace: zm_perk_juggernaut
	Checksum: 0xCEB79601
	Offset: 0x2D8
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
	Checksum: 0x32E04BBE
	Offset: 0x308
	Size: 0x11E
	Parameters: 10
	Flags: Linked
*/
function function_366a682a(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(self namespace_e86ffa8::function_71680faf(5))
	{
		var_b66f2623 = self.health - shitloc;
		if(psoffsettime === "MOD_FALLING" && self namespace_e86ffa8::function_3623f9d1(2))
		{
			return shitloc;
		}
		if(var_b66f2623 <= 0 && self.armor > 0)
		{
			self playsoundtoplayer(#"hash_7bc0e76bd7c09fd0", self);
			self.armor = 0;
			shitloc = shitloc - (1 - var_b66f2623);
		}
	}
	return shitloc;
}

/*
	Name: enable_juggernaut_perk_for_level
	Namespace: zm_perk_juggernaut
	Checksum: 0xF4989ECB
	Offset: 0x430
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function enable_juggernaut_perk_for_level()
{
	zm_perks::register_perk_basic_info(#"hash_47d7a8105237c88", #"perk_juggernog", 2500, #"hash_27b60f868a13cc91", getweapon("zombie_perk_bottle_jugg"), undefined, #"hash_7520ccdc8dcaee8d");
	zm_perks::register_perk_precache_func(#"hash_47d7a8105237c88", &juggernaut_precache);
	zm_perks::register_perk_clientfields(#"hash_47d7a8105237c88", &juggernaut_register_clientfield, &juggernaut_set_clientfield);
	zm_perks::register_perk_machine(#"hash_47d7a8105237c88", &juggernaut_perk_machine_setup, &init_juggernaut);
	zm_perks::register_perk_threads(#"hash_47d7a8105237c88", &give_juggernaut_perk, &take_juggernaut_perk);
	zm_perks::register_perk_host_migration_params(#"hash_47d7a8105237c88", "vending_jugg", "jugger_light");
	zm_perks::register_perk_damage_override_func(&function_366a682a);
}

/*
	Name: init_juggernaut
	Namespace: zm_perk_juggernaut
	Checksum: 0x80F724D1
	Offset: 0x5E8
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
	Checksum: 0x81D5CF6C
	Offset: 0x5F8
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
	Offset: 0x6F8
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
	Checksum: 0x934B7A19
	Offset: 0x708
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
	Checksum: 0x61D638D1
	Offset: 0x720
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
	Offset: 0x7D0
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
	Checksum: 0x38E0C9A1
	Offset: 0x7E0
	Size: 0x24
	Parameters: 4
	Flags: Linked
*/
function take_juggernaut_perk(b_pause, str_perk, str_result, n_slot)
{
}

