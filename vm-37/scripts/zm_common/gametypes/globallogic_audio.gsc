#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\struct.gsc;

#namespace globallogic_audio;

/*
	Name: __init__system__
	Namespace: globallogic_audio
	Checksum: 0x76E68146
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_40da084132aa904b", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_audio
	Checksum: 0x3C47BC06
	Offset: 0x150
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(zm_utility::is_survival())
	{
		level.var_bc01f047 = "srtaacom";
		level.var_7ee6af9f = "srcommander";
	}
	else
	{
		level.var_bc01f047 = "zmtaacom";
		level.var_7ee6af9f = "zmcommander";
	}
	callback::on_connect(&on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: globallogic_audio
	Checksum: 0xD7739729
	Offset: 0x1D8
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(isdefined(level.var_462ca9bb))
	{
		self.pers[level.var_bc01f047] = level.var_462ca9bb;
	}
	else
	{
		self.pers[level.var_bc01f047] = (level.var_bc01f047 === "srtaacom" ? #"blops_taacom" : "zm_taacom");
	}
	if(isdefined(level.var_e2f95698))
	{
		self.pers[level.var_7ee6af9f] = level.var_e2f95698;
	}
	else
	{
		self.pers[level.var_7ee6af9f] = (level.var_7ee6af9f === "srcommander" ? "sr_commander" : "zm_commander");
	}
}

