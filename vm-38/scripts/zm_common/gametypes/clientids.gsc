#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace clientids;

/*
	Name: function_c9667ef8
	Namespace: clientids
	Checksum: 0x34A217A
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c9667ef8()
{
	level notify(523329682);
}

/*
	Name: function_89f2df9
	Namespace: clientids
	Checksum: 0x85884EAC
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"clientids", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: clientids
	Checksum: 0xDB903754
	Offset: 0xE0
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
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
	Offset: 0x130
	Size: 0x10
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.clientid = 0;
}

/*
	Name: on_player_connect
	Namespace: clientids
	Checksum: 0xE7E6F056
	Offset: 0x148
	Size: 0x9C
	Parameters: 0
	Flags: Linked
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

