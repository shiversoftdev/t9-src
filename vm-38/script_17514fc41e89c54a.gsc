#using script_1029986e2bc8ca8e;
#using script_193d6fcd3b319d05;
#using script_1c65dbfc2f1c8d8f;
#using script_340a2e805e35f7a2;
#using script_34e9dd62fc371077;
#using script_5bb072c3abf4652c;
#using script_6196bd4e1ff26cc0;
#using script_7bacb32f8222fa3e;
#using script_f11fc6f7a3ad5b9;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_9be1ab53;

/*
	Name: function_a7ebca77
	Namespace: namespace_9be1ab53
	Checksum: 0x9B047E9B
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a7ebca77()
{
	level notify(275078832);
}

/*
	Name: function_89f2df9
	Namespace: namespace_9be1ab53
	Checksum: 0x3F51E8AA
	Offset: 0x128
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5aa4949e75ab9d9c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9be1ab53
	Checksum: 0x80F724D1
	Offset: 0x170
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_4e9f972a
	Namespace: namespace_9be1ab53
	Checksum: 0x641D72D9
	Offset: 0x180
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_4e9f972a()
{
	wait(4);
	level flag::clear(#"hash_2c0ce601824acdf5");
}

/*
	Name: function_504e44da
	Namespace: namespace_9be1ab53
	Checksum: 0x7F024C65
	Offset: 0x1B8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_504e44da()
{
	level flag::set(#"hash_2c0ce601824acdf5");
}

/*
	Name: function_9e216600
	Namespace: namespace_9be1ab53
	Checksum: 0x2A5F911E
	Offset: 0x1E8
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_9e216600()
{
	if(getdvarint(#"hash_6d9eda83aac99122", 0))
	{
		foreach(player in getplayers())
		{
			player zm_stats::increment_challenge_stat(#"hash_5a234b7c00ae1ae4");
		}
	}
}

