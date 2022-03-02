#using script_1029986e2bc8ca8e;
#using script_193d6fcd3b319d05;
#using script_1c65dbfc2f1c8d8f;
#using script_340a2e805e35f7a2;
#using script_34e9dd62fc371077;
#using script_5bb072c3abf4652c;
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

#namespace namespace_89fd9b3e;

/*
	Name: function_e82924f4
	Namespace: namespace_89fd9b3e
	Checksum: 0x8FEF2FFE
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e82924f4()
{
	level notify(245768755);
}

/*
	Name: function_89f2df9
	Namespace: namespace_89fd9b3e
	Checksum: 0xB96A6957
	Offset: 0x120
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_75aa82b3ae89f54e", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_89fd9b3e
	Checksum: 0x80F724D1
	Offset: 0x168
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_2d9abf0f
	Namespace: namespace_89fd9b3e
	Checksum: 0x4974B990
	Offset: 0x178
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_2d9abf0f()
{
	if(getdvarint(#"hash_505f9e51193386d9", 0))
	{
		foreach(player in getplayers())
		{
			player zm_stats::increment_challenge_stat(#"hash_3551fbb8f9272df6");
		}
	}
}

