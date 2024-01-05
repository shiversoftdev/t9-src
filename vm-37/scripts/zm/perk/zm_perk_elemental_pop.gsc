#using script_5f261a5d57de5f7c;
#using scripts\zm_common\aats\zm_aat.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace zm_perk_elemental_pop;

/*
	Name: __init__system__
	Namespace: zm_perk_elemental_pop
	Checksum: 0x38494775
	Offset: 0x228
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_elemental_pop", &function_70a657d8, undefined, undefined, #"hash_2d064899850813e2");
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_elemental_pop
	Checksum: 0x21194820
	Offset: 0x278
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	function_27473e44();
}

/*
	Name: function_27473e44
	Namespace: zm_perk_elemental_pop
	Checksum: 0x1FF95DB5
	Offset: 0x298
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function function_27473e44()
{
	zm_perks::register_perk_basic_info(#"hash_51b6cc6dbafb7f31", #"perk_elemental_pop", 2000, #"hash_3aca6fccecde9e86", getweapon("zombie_perk_bottle_elemental_pop"), undefined, #"hash_363622d67a410b29");
	zm_perks::register_perk_precache_func(#"hash_51b6cc6dbafb7f31", &precache);
	zm_perks::register_perk_clientfields(#"hash_51b6cc6dbafb7f31", &register_clientfield, &set_clientfield);
	zm_perks::register_perk_machine(#"hash_51b6cc6dbafb7f31", &perk_machine_setup);
	zm_perks::register_perk_host_migration_params(#"hash_51b6cc6dbafb7f31", "vending_elemental_pop", "elemental_pop_light");
	zm_perks::register_actor_damage_override(#"hash_51b6cc6dbafb7f31", &function_abddd809);
}

/*
	Name: precache
	Namespace: zm_perk_elemental_pop
	Checksum: 0xABE5E27A
	Offset: 0x410
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function precache()
{
	if(isdefined(level.staminup_precache_override_func))
	{
		[[level.staminup_precache_override_func]]();
		return;
	}
	level._effect[#"elemental_pop_light"] = "zombie/fx_perk_element_pop_ndu";
	level.machine_assets[#"hash_51b6cc6dbafb7f31"] = spawnstruct();
	level.machine_assets[#"hash_51b6cc6dbafb7f31"].weapon = getweapon("zombie_perk_bottle_elemental_pop");
	level.machine_assets[#"hash_51b6cc6dbafb7f31"].off_model = "p9_sur_elemental_pop_off";
	level.machine_assets[#"hash_51b6cc6dbafb7f31"].on_model = "p9_sur_elemental_pop";
}

/*
	Name: register_clientfield
	Namespace: zm_perk_elemental_pop
	Checksum: 0xF64CA891
	Offset: 0x510
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function register_clientfield()
{
	clientfield::register("scriptmover", "" + #"hash_2bc83061af453e44", 1, 1, "counter");
	clientfield::register("toplayer", "" + #"hash_12c6e46c315cd43b", 1, 1, "counter");
}

/*
	Name: set_clientfield
	Namespace: zm_perk_elemental_pop
	Checksum: 0x32751AA8
	Offset: 0x5A0
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function set_clientfield(state)
{
}

/*
	Name: perk_machine_setup
	Namespace: zm_perk_elemental_pop
	Checksum: 0x4EF07843
	Offset: 0x5B8
	Size: 0xB2
	Parameters: 4
	Flags: Linked
*/
function perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	perk_machine.script_sound = "mus_perks_elementalpop_jingle";
	perk_machine.script_string = "elemental_perk";
	perk_machine.script_label = "mus_perks_elementalpop_sting";
	perk_machine.target = "vending_elemental_pop";
	bump_trigger.script_string = "elemental_perk";
	bump_trigger.targetname = "vending_elemental_pop";
	if(isdefined(collision))
	{
		collision.script_string = "elemental_perk";
	}
	bump_trigger.use_func = &on_use;
}

/*
	Name: function_abddd809
	Namespace: zm_perk_elemental_pop
	Checksum: 0x2E680C23
	Offset: 0x678
	Size: 0x3CA
	Parameters: 13
	Flags: Linked
*/
function function_abddd809(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(weapon === "MOD_AAT")
	{
		return flags;
	}
	if(isplayer(damage) && !self.var_6f84b820 === #"elite" && !self.var_6f84b820 === #"boss")
	{
		if(damage namespace_e86ffa8::function_cd6787b())
		{
			if(!isdefined(damage.var_4caed594))
			{
				damage.var_4caed594 = 0;
			}
			if(math::cointoss(5) && flags > 1 && damage is_valid_weapon(var_fd90b0bb) && (damage.var_4caed594 + (int(15 * 1000))) < gettime())
			{
				var_43cad97a = flags > self.health;
				str_name = damage.aat[aat::function_702fb333(var_fd90b0bb)];
				var_3d46284b = getarraykeys(level.var_e44e90d6);
				arrayremovevalue(var_3d46284b, "ammomod_electriccherry");
				var_1bfeafad = array::random(var_3d46284b);
				damage.var_2defbefd = 1;
				var_1799ae59 = getweapon(#"pistol_semiauto_t9");
				var_bebe15e1 = 0;
				weapon = "MOD_PISTOL_BULLET";
				if(damage namespace_e86ffa8::function_cd6787b(3))
				{
					n_tier = damage zm_aat::function_14ccd92a(var_1bfeafad);
					var_1bfeafad = (n_tier > 0 ? (var_1bfeafad + "_") + n_tier : var_1bfeafad);
				}
				damage.aat[var_1799ae59] = var_1bfeafad;
				if(self.var_6f84b820 === #"normal" || (self.var_6f84b820 === #"special" && isdefined(n_tier) && n_tier > 3))
				{
					damage clientfield::increment_to_player("" + #"hash_12c6e46c315cd43b", 1);
					aat::aat_response(var_43cad97a, attacker, damage, flags, meansofdeath, weapon, var_1799ae59, var_bebe15e1, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
					damage.var_4caed594 = gettime();
				}
				damage.aat[var_1799ae59] = undefined;
				damage.var_13a70bc8 = undefined;
			}
		}
	}
	return flags;
}

/*
	Name: is_valid_weapon
	Namespace: zm_perk_elemental_pop
	Checksum: 0xE0595B8D
	Offset: 0xA50
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function is_valid_weapon(weapon)
{
	if(weapon === level.weaponnone || weapon === level.weaponbasemeleeheld)
	{
		return false;
	}
	if(isdefined(weapon.dualwieldweapon) && is_true(weapon.var_bf0eb41))
	{
		weapon = weapon.dualwieldweapon;
	}
	if(is_true(weapon.isprimary))
	{
		return true;
	}
	if(self namespace_e86ffa8::function_cd6787b(1))
	{
		if(weapon.inventorytype === "offhand")
		{
			return true;
		}
	}
	return false;
}

/*
	Name: on_use
	Namespace: zm_perk_elemental_pop
	Checksum: 0xC36A69B3
	Offset: 0xB30
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_use()
{
	self clientfield::increment("" + #"hash_2bc83061af453e44");
}

