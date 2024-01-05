#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_e7b06f1b;

/*
	Name: __init__system__
	Namespace: namespace_e7b06f1b
	Checksum: 0xA02D71DE
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_6119ea2d427fdf8a", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e7b06f1b
	Checksum: 0x80F724D1
	Offset: 0x110
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_f1d9de41
	Namespace: namespace_e7b06f1b
	Checksum: 0x51EA9A96
	Offset: 0x120
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_f1d9de41(player)
{
	level thread function_386c20ef(player);
}

/*
	Name: function_386c20ef
	Namespace: namespace_e7b06f1b
	Checksum: 0x79F55AA1
	Offset: 0x150
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_386c20ef(player)
{
	if(isdefined(player.lives) && player.lives < 5)
	{
		player.lives++;
	}
	else if(player zm_laststand::function_618fd37e() < 5)
	{
		player zm_laststand::function_3a00302e();
	}
}

