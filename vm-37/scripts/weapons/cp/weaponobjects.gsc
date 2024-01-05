#using script_6b221588ece2c4aa;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace weaponobjects;

/*
	Name: __init__system__
	Namespace: weaponobjects
	Checksum: 0x1BC41877
	Offset: 0x98
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
	Checksum: 0x83AB83EB
	Offset: 0xE0
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
	callback::on_start_gametype(&start_gametype);
}

/*
	Name: start_gametype
	Namespace: weaponobjects
	Checksum: 0xD79F919D
	Offset: 0x120
	Size: 0x7C
	Parameters: 0
	Flags: None
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
	Checksum: 0x4C39DDEE
	Offset: 0x1A8
	Size: 0x9C
	Parameters: 0
	Flags: None
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

