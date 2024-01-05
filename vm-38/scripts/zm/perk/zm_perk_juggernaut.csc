#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_perk_juggernaut;

/*
	Name: function_9a168a69
	Namespace: zm_perk_juggernaut
	Checksum: 0x77988414
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9a168a69()
{
	level notify(-1860478193);
}

/*
	Name: __init__system__
	Namespace: zm_perk_juggernaut
	Checksum: 0xF6DE867
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_juggernaut", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_juggernaut
	Checksum: 0xD35E14DE
	Offset: 0x140
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_perks::register_perk_clientfields(#"hash_47d7a8105237c88", &juggernaut_client_field_func, &juggernaut_code_callback_func);
	zm_perks::register_perk_effects(#"hash_47d7a8105237c88", "jugger_light");
	zm_perks::register_perk_init_thread(#"hash_47d7a8105237c88", &init_juggernaut);
	zm_perks::function_f3c80d73("zombie_perk_bottle_jugg");
}

/*
	Name: init_juggernaut
	Namespace: zm_perk_juggernaut
	Checksum: 0x5EDFF159
	Offset: 0x200
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init_juggernaut()
{
	if(is_true(level.enable_magic))
	{
		level._effect[#"jugger_light"] = "zombie/fx_perk_juggernaut_ndu";
	}
}

/*
	Name: juggernaut_client_field_func
	Namespace: zm_perk_juggernaut
	Checksum: 0x80F724D1
	Offset: 0x248
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function juggernaut_client_field_func()
{
}

/*
	Name: juggernaut_code_callback_func
	Namespace: zm_perk_juggernaut
	Checksum: 0x80F724D1
	Offset: 0x258
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function juggernaut_code_callback_func()
{
}

