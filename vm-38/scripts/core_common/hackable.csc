#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace hackable;

/*
	Name: function_a6a7efdf
	Namespace: hackable
	Checksum: 0xC89F8A6D
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a6a7efdf()
{
	level notify(986423980);
}

/*
	Name: function_89f2df9
	Namespace: hackable
	Checksum: 0xBDBD323D
	Offset: 0x90
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
	Checksum: 0x22F6DBE2
	Offset: 0xD8
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
	Checksum: 0x548A329
	Offset: 0x108
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
	Checksum: 0x8F671843
	Offset: 0x120
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

