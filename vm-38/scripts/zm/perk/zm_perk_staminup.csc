#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_perk_staminup;

/*
	Name: function_3adfbbff
	Namespace: zm_perk_staminup
	Checksum: 0xDCB13795
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3adfbbff()
{
	level notify(-1364099570);
}

/*
	Name: __init__system__
	Namespace: zm_perk_staminup
	Checksum: 0xB23EFCE0
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_staminup", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_staminup
	Checksum: 0xC569B62D
	Offset: 0x140
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
	Checksum: 0x5013CE18
	Offset: 0x160
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function enable_staminup_perk_for_level()
{
	zm_perks::register_perk_clientfields(#"hash_602a1b6107105f07", &staminup_client_field_func, &staminup_callback_func);
	zm_perks::register_perk_effects(#"hash_602a1b6107105f07", "marathon_light");
	zm_perks::register_perk_init_thread(#"hash_602a1b6107105f07", &init_staminup);
	zm_perks::function_f3c80d73("zombie_perk_bottle_marathon");
}

/*
	Name: init_staminup
	Namespace: zm_perk_staminup
	Checksum: 0xAD825AA5
	Offset: 0x220
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init_staminup()
{
	if(is_true(level.enable_magic))
	{
		level._effect[#"marathon_light"] = "zombie/fx_perk_staminup_ndu";
	}
}

/*
	Name: staminup_client_field_func
	Namespace: zm_perk_staminup
	Checksum: 0x80F724D1
	Offset: 0x268
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function staminup_client_field_func()
{
}

/*
	Name: staminup_callback_func
	Namespace: zm_perk_staminup
	Checksum: 0x80F724D1
	Offset: 0x278
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function staminup_callback_func()
{
}

