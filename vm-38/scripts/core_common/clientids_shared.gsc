#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace clientids_shared;

/*
	Name: function_5a0df8e
	Namespace: clientids_shared
	Checksum: 0x84CDB867
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5a0df8e()
{
	level notify(23919657);
}

#namespace clientids;

/*
	Name: __init__system__
	Namespace: clientids
	Checksum: 0x85884EAC
	Offset: 0x90
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
	Checksum: 0xDB903754
	Offset: 0xD8
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
	Checksum: 0xA57C26C7
	Offset: 0x128
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
	Checksum: 0xE7E6F056
	Offset: 0x140
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

