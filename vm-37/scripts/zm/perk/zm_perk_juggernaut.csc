#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_perk_juggernaut;

/*
	Name: __init__system__
	Namespace: zm_perk_juggernaut
	Checksum: 0xA703351C
	Offset: 0xD8
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
	Checksum: 0xE54647B3
	Offset: 0x120
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
	Checksum: 0xFDBA2DDE
	Offset: 0x1E0
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
	Offset: 0x228
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
	Offset: 0x238
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function juggernaut_code_callback_func()
{
}

