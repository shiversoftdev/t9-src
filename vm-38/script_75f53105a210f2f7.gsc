#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_901adecc;

/*
	Name: function_ccb539e5
	Namespace: namespace_901adecc
	Checksum: 0x5C016B13
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ccb539e5()
{
	level notify(443088504);
}

/*
	Name: function_89f2df9
	Namespace: namespace_901adecc
	Checksum: 0xA52CBB84
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5e733914ebbc17f7", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_901adecc
	Checksum: 0xDF29F960
	Offset: 0xE8
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_293a2fd65ffe0222", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_901adecc
	Checksum: 0x35A59A22
	Offset: 0x150
	Size: 0x98
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	foreach(player in getplayers())
	{
		player callback::on_player_damage(&on_player_damage);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_901adecc
	Checksum: 0xAEFA5855
	Offset: 0x1F0
	Size: 0xA0
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	foreach(player in getplayers())
	{
		player callback::remove_on_player_damage(&on_player_damage);
	}
}

/*
	Name: on_player_damage
	Namespace: namespace_901adecc
	Checksum: 0xFD4B565B
	Offset: 0x298
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

