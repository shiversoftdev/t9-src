#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_f2203a88;

/*
	Name: function_40dea75b
	Namespace: namespace_f2203a88
	Checksum: 0xA0F67E7C
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_40dea75b()
{
	level notify(705307971);
}

/*
	Name: function_89f2df9
	Namespace: namespace_f2203a88
	Checksum: 0x218B77A5
	Offset: 0xA8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2d53e3136f122763", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_f2203a88
	Checksum: 0xDE3DEF72
	Offset: 0xF8
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_uaz", &function_bc02ac38);
}

/*
	Name: function_bc02ac38
	Namespace: namespace_f2203a88
	Checksum: 0x7560C554
	Offset: 0x130
	Size: 0x92
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bc02ac38()
{
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_5433bc44);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_b6eaa74f);
	self.var_84fed14b = 40;
	self.var_d6691161 = 175;
	self.var_5d662124 = 2;
}

/*
	Name: function_5433bc44
	Namespace: namespace_f2203a88
	Checksum: 0x94DBC6ED
	Offset: 0x1D0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_5433bc44(params)
{
	player = params.player;
	if(!isdefined(player))
	{
		return;
	}
}

/*
	Name: function_b6eaa74f
	Namespace: namespace_f2203a88
	Checksum: 0xA1126C95
	Offset: 0x208
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function function_b6eaa74f(params)
{
	player = params.player;
	if(!isdefined(player))
	{
		return;
	}
	if(!isalive(self))
	{
		return;
	}
}

