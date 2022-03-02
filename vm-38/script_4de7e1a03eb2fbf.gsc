#using script_24c32478acf44108;
#using script_57f7003580bb15e0;
#using script_6c8abe14025b47c4;
#using script_746c9396ccd2c32d;
#using script_7bafaa95bb1b427e;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_player.gsc;

#namespace sparrow;

/*
	Name: function_5a034f43
	Namespace: sparrow
	Checksum: 0xD0370049
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5a034f43()
{
	level notify(1990747808);
}

#namespace namespace_b6556af;

/*
	Name: function_89f2df9
	Namespace: namespace_b6556af
	Checksum: 0xB87C291F
	Offset: 0x100
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3a796bfe275f52a3", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: namespace_b6556af
	Checksum: 0xE15611C2
	Offset: 0x150
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
	Checksum: 0xAF69294A
	Offset: 0x1A0
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
	statuseffect = function_4d1e7b48("dot_sig_bow_flame");
	self status_effect::status_effect_apply(statuseffect, weapon, params.eattacker, 0, undefined, undefined, params.vpoint);
	self ammomod_napalmburst::function_74816787();
	duration = float(statuseffect.var_77449e9) / 1000;
	self thread function_77b06e9c(duration);
}

/*
	Name: function_77b06e9c
	Namespace: namespace_b6556af
	Checksum: 0xA0986491
	Offset: 0x2C0
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
	Checksum: 0x2D3588FF
	Offset: 0x308
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
	Checksum: 0xDE17E836
	Offset: 0x330
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

