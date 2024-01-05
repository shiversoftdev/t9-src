#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

class class_6e09f777 
{
	var var_5ee36218;

	/*
		Name: constructor
		Namespace: namespace_6e09f777
		Checksum: 0x80F724D1
		Offset: 0x1E8
		Size: 0x4
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_6e09f777
		Checksum: 0x80F724D1
		Offset: 0x1F8
		Size: 0x4
		Parameters: 0
		Flags: 16
	*/
	destructor()
	{
	}

	/*
		Name: function_860ebd20
		Namespace: namespace_6e09f777
		Checksum: 0xCC2BB389
		Offset: 0x208
		Size: 0x3C
		Parameters: 1
		Flags: None
	*/
	function function_860ebd20(var_8f7a5c75)
	{
		self.var_5ee36218 = var_8f7a5c75;
		var_5ee36218 flag::wait_till("vehicle_spawn_setup_complete");
	}

}

#namespace namespace_e85e312c;

/*
	Name: __init__system__
	Namespace: namespace_e85e312c
	Checksum: 0x4EC7B0BF
	Offset: 0x100
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_4bbb330ecd0b67a8", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e85e312c
	Checksum: 0xAB2E8AF9
	Offset: 0x158
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	vehicle::add_spawn_function_group("turret_dead_system", "script_turret_type", &dead_system_init);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_e85e312c
	Checksum: 0x80F724D1
	Offset: 0x198
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: dead_system_init
	Namespace: namespace_e85e312c
	Checksum: 0xF34FAE5D
	Offset: 0x1A8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function dead_system_init()
{
	var_e85e312c = new class_6e09f777();
	[[ var_e85e312c ]]->function_860ebd20(self);
}

