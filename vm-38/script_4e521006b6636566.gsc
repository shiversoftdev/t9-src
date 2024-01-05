#using scripts\zm_common\zm_stats.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_c46118a7;

/*
	Name: function_b0c93098
	Namespace: namespace_c46118a7
	Checksum: 0x49640000
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b0c93098()
{
	level notify(570208010);
}

/*
	Name: __init__system__
	Namespace: namespace_c46118a7
	Checksum: 0x3D2CA517
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_125fc0c0065c7dea", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_c46118a7
	Checksum: 0x80F724D1
	Offset: 0xF0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_9e216600
	Namespace: namespace_c46118a7
	Checksum: 0x49D43B6C
	Offset: 0x100
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_9e216600()
{
	if(getdvarint(#"hash_3ec3a7252086be23", 0))
	{
		foreach(player in getplayers())
		{
			player zm_stats::increment_challenge_stat(#"hash_7aecddb420d2f602");
		}
	}
}

