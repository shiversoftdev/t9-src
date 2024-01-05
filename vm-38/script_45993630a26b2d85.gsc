#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_983e5028;

/*
	Name: function_90ed90aa
	Namespace: namespace_983e5028
	Checksum: 0xB589EFDE
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_90ed90aa()
{
	level notify(689096358);
}

/*
	Name: __init__system__
	Namespace: namespace_983e5028
	Checksum: 0xE14E7959
	Offset: 0xC0
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
	Checksum: 0x7CD68EC0
	Offset: 0x108
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
	Checksum: 0x7982A27
	Offset: 0x170
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
	Checksum: 0x32F5EFA4
	Offset: 0x250
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
	Checksum: 0xF975A15C
	Offset: 0x290
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
	Checksum: 0xC400492B
	Offset: 0x318
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

