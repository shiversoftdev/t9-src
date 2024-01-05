#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_perk_sleight_of_hand;

/*
	Name: __init__system__
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x938CBBDF
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_sleight_of_hand", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x6EC8FEC3
	Offset: 0x120
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
	Checksum: 0x5A7F3D72
	Offset: 0x140
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function enable_sleight_of_hand_perk_for_level()
{
	zm_perks::register_perk_clientfields(#"hash_5930cf0eb070e35a", &sleight_of_hand_client_field_func, &sleight_of_hand_code_callback_func);
	zm_perks::register_perk_effects(#"hash_5930cf0eb070e35a", "sleight_light");
	zm_perks::register_perk_init_thread(#"hash_5930cf0eb070e35a", &init_sleight_of_hand);
	zm_perks::function_f3c80d73("zombie_perk_bottle_sleight");
}

/*
	Name: init_sleight_of_hand
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0xB2E6A177
	Offset: 0x200
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init_sleight_of_hand()
{
	if(is_true(level.enable_magic))
	{
		level._effect[#"sleight_light"] = "zombie/fx_perk_speedcola_ndu";
	}
}

/*
	Name: sleight_of_hand_client_field_func
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x80F724D1
	Offset: 0x248
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function sleight_of_hand_client_field_func()
{
}

/*
	Name: sleight_of_hand_code_callback_func
	Namespace: zm_perk_sleight_of_hand
	Checksum: 0x80F724D1
	Offset: 0x258
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function sleight_of_hand_code_callback_func()
{
}

