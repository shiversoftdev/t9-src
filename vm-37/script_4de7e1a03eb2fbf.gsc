#using scripts\zm_common\zm_player.gsc;
#using script_746c9396ccd2c32d;
#using script_24c32478acf44108;
#using scripts\weapons\weapons.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_b6556af;

/*
	Name: __init__system__
	Namespace: namespace_b6556af
	Checksum: 0x93ED0EE3
	Offset: 0xE0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3a796bfe275f52a3", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: namespace_b6556af
	Checksum: 0x2F0F085
	Offset: 0x130
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	callback::on_actor_damage(&onactordamage);
	zm_player::register_player_friendly_fire_callback(&function_61f584a7);
}

/*
	Name: onactordamage
	Namespace: namespace_b6556af
	Checksum: 0xF525BFBE
	Offset: 0x180
	Size: 0x114
	Parameters: 1
	Flags: Linked, Private
*/
function private onactordamage(params)
{
	weapon = params.weapon;
	if(!isdefined(weapon))
	{
		return;
	}
	if(!function_119a2a90(weapon))
	{
		return;
	}
	if(params.smeansofdeath == "MOD_DOT")
	{
		return;
	}
	statuseffect = getstatuseffect("dot_sig_bow_flame");
	self status_effect::status_effect_apply(statuseffect, weapon, params.eattacker, 0, undefined, undefined, params.vpoint);
	self ammomod_napalmburst::function_74816787();
	duration = float(statuseffect.var_77449e9) / 1000;
	self thread function_77b06e9c(duration);
}

/*
	Name: function_77b06e9c
	Namespace: namespace_b6556af
	Checksum: 0x4AE256F
	Offset: 0x2A0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_77b06e9c(duration)
{
	self endon(#"death");
	wait(duration);
	self ammomod_napalmburst::function_68364c40();
}

/*
	Name: function_119a2a90
	Namespace: namespace_b6556af
	Checksum: 0x9E6635CD
	Offset: 0x2E8
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private function_119a2a90(weapon)
{
	return weapon.statname === "sig_bow_flame";
}

/*
	Name: function_61f584a7
	Namespace: namespace_b6556af
	Checksum: 0x59ADCB51
	Offset: 0x310
	Size: 0xB2
	Parameters: 11
	Flags: Linked, Private
*/
function private function_61f584a7(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	if(shitloc !== self)
	{
		return psoffsettime;
	}
	if(!isdefined(boneindex) || !function_119a2a90(boneindex))
	{
		return psoffsettime;
	}
	return int(psoffsettime / 3);
}

