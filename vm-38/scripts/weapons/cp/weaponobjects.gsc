#using script_6b221588ece2c4aa;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace weaponobjects;

/*
	Name: function_588d8a1a
	Namespace: weaponobjects
	Checksum: 0xF193A3AB
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_588d8a1a()
{
	level notify(271290572);
}

/*
	Name: __init__system__
	Namespace: weaponobjects
	Checksum: 0x92C5FDC7
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"weaponobjects", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weaponobjects
	Checksum: 0xBC700707
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	callback::on_start_gametype(&start_gametype);
}

/*
	Name: start_gametype
	Namespace: weaponobjects
	Checksum: 0x8FA70BE9
	Offset: 0x140
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function start_gametype()
{
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	function_e6400478(#"hash_493ab450d6d8d4fa", &function_50d4198b, 1);
}

/*
	Name: on_player_spawned
	Namespace: weaponobjects
	Checksum: 0xB987AADA
	Offset: 0x1C8
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	for(watcher = 0; watcher < self.weaponobjectwatcherarray.size; watcher++)
	{
		if(self.weaponobjectwatcherarray[watcher].name == #"spike_charge")
		{
			arrayremoveindex(self.weaponobjectwatcherarray, watcher);
		}
	}
	self createwatcher("spike_launcher", &createspikelauncherwatcher, 1);
}

