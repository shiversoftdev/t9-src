#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_983e5028;

/*
	Name: __init__system__
	Namespace: namespace_983e5028
	Checksum: 0x684F9CE9
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_1633972af838a447", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_983e5028
	Checksum: 0x5309BD2A
	Offset: 0xE8
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_2fc73bc20035fe8", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_983e5028
	Checksum: 0x58B6A529
	Offset: 0x150
	Size: 0xD8
	Parameters: 1
	Flags: Private
*/
function private on_begin(var_d34d02af)
{
	level.var_d34d02af = zm_trial::function_5769f26a(var_d34d02af);
	callback::on_weapon_fired(&on_weapon_fired);
	foreach(player in getplayers())
	{
		player thread function_a5a431f6();
	}
}

/*
	Name: on_end
	Namespace: namespace_983e5028
	Checksum: 0x7FED28C8
	Offset: 0x230
	Size: 0x36
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	callback::remove_on_weapon_fired(&on_weapon_fired);
	level.var_d34d02af = undefined;
}

/*
	Name: on_weapon_fired
	Namespace: namespace_983e5028
	Checksum: 0xD622FABD
	Offset: 0x270
	Size: 0x7C
	Parameters: 1
	Flags: Private
*/
function private on_weapon_fired(params)
{
	if(zm_weapons::is_explosive_weapon(params.weapon))
	{
		self zm_score::player_reduce_points("take_specified", level.var_d34d02af * 2);
	}
	else
	{
		self zm_score::player_reduce_points("take_specified", level.var_d34d02af);
	}
}

/*
	Name: function_a5a431f6
	Namespace: namespace_983e5028
	Checksum: 0x9DED69E
	Offset: 0x2F8
	Size: 0x90
	Parameters: 0
	Flags: Private
*/
function private function_a5a431f6()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		s_waitresult = undefined;
		s_waitresult = self waittill(#"ammo_reduction", #"lightning_ball_created");
		self zm_score::player_reduce_points("take_specified", level.var_d34d02af);
	}
}

