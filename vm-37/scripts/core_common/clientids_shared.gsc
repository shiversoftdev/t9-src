#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace clientids;

/*
	Name: __init__system__
	Namespace: clientids
	Checksum: 0x2AA7E9D8
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"clientids", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: clientids
	Checksum: 0x348E01F8
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	callback::on_connect(&on_player_connect);
}

/*
	Name: init
	Namespace: clientids
	Checksum: 0x45B3168C
	Offset: 0x108
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function init()
{
	level.clientid = 0;
}

/*
	Name: on_player_connect
	Namespace: clientids
	Checksum: 0x68BB7F26
	Offset: 0x120
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	self.clientid = matchrecordnewplayer(self);
	if(!isdefined(self.clientid) || self.clientid == -1)
	{
		self.clientid = level.clientid;
		level.clientid++;
	}
	/#
		println((("" + self.name) + "") + self.clientid);
	#/
}

