#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace hackable;

/*
	Name: function_89f2df9
	Namespace: hackable
	Checksum: 0x12929549
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hackable", &init, undefined, undefined, undefined);
}

/*
	Name: init
	Namespace: hackable
	Checksum: 0x3FCB9FD5
	Offset: 0xB8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function init()
{
	callback::on_localclient_connect(&on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: hackable
	Checksum: 0x7DB9C689
	Offset: 0xE8
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function on_player_connect(localclientnum)
{
}

/*
	Name: set_hacked_ent
	Namespace: hackable
	Checksum: 0xF129EFF6
	Offset: 0x100
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function set_hacked_ent(local_client_num, ent)
{
	if(ent !== self.hacked_ent)
	{
		self.hacked_ent = ent;
	}
}

