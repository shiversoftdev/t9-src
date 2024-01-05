#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect_deaf;

/*
	Name: function_c52b7128
	Namespace: status_effect_deaf
	Checksum: 0x90804E9C
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c52b7128()
{
	level notify(315229053);
}

/*
	Name: __init__system__
	Namespace: status_effect_deaf
	Checksum: 0x6F9E419F
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_deaf", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_deaf
	Checksum: 0xA7016FF0
	Offset: 0xE8
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::register_status_effect_callback_apply(0, &deaf_apply);
	status_effect::function_5bae5120(0, &function_c5189bd);
	status_effect::function_6f4eaf88(getstatuseffect("deaf"));
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: status_effect_deaf
	Checksum: 0x80F724D1
	Offset: 0x180
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
}

/*
	Name: deaf_apply
	Namespace: status_effect_deaf
	Checksum: 0x1FACCBFA
	Offset: 0x190
	Size: 0x1C
	Parameters: 3
	Flags: Linked
*/
function deaf_apply(var_756fda07, weapon, applicant)
{
}

/*
	Name: function_c5189bd
	Namespace: status_effect_deaf
	Checksum: 0x80F724D1
	Offset: 0x1B8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_c5189bd()
{
}

