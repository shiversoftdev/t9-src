#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_901adecc;

/*
	Name: __init__system__
	Namespace: namespace_901adecc
	Checksum: 0xA031CF0
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_5e733914ebbc17f7", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_901adecc
	Checksum: 0x2E39705
	Offset: 0xC8
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
	zm_trial::register_challenge(#"hash_293a2fd65ffe0222", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_901adecc
	Checksum: 0x940EBA9F
	Offset: 0x130
	Size: 0x98
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	foreach(player in getplayers())
	{
		player callback::on_player_damage(&on_player_damage);
	}
}

/*
	Name: on_end
	Namespace: namespace_901adecc
	Checksum: 0xC78C9171
	Offset: 0x1D0
	Size: 0xA0
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	foreach(player in getplayers())
	{
		player callback::remove_on_player_damage(&on_player_damage);
	}
}

/*
	Name: on_player_damage
	Namespace: namespace_901adecc
	Checksum: 0x11C39010
	Offset: 0x278
	Size: 0xC4
	Parameters: 1
	Flags: Private
*/
function private on_player_damage(params)
{
	if(isai(params.eattacker) || isai(params.einflictor) && (params.idamage > 0 || (isdefined(self.armor) && self.armor > 0)))
	{
		var_57807cdc = [];
		array::add(var_57807cdc, self, 0);
		zm_trial::fail(#"hash_41122a695bc6065d", var_57807cdc);
	}
}

