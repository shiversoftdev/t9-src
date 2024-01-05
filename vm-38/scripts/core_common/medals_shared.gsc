#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace medals_shared;

/*
	Name: function_5e3ee93d
	Namespace: medals_shared
	Checksum: 0xCA9D5D2B
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5e3ee93d()
{
	level notify(1930642943);
}

#namespace medals;

/*
	Name: __init__system__
	Namespace: medals
	Checksum: 0x3F8D15E0
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"medals", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: medals
	Checksum: 0x11C7C33D
	Offset: 0xD8
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
}

/*
	Name: init
	Namespace: medals
	Checksum: 0x4C9718F7
	Offset: 0x108
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.medalinfo = [];
	level.medalcallbacks = [];
	level.numkills = 0;
	level.prevlastkilltime = 0;
	level.lastkilltime = 0;
	callback::on_connect(&on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: medals
	Checksum: 0xC20EC2A
	Offset: 0x178
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self.lastkilledby = undefined;
}

/*
	Name: setlastkilledby
	Namespace: medals
	Checksum: 0x74F117AD
	Offset: 0x190
	Size: 0x2E
	Parameters: 2
	Flags: None
*/
function setlastkilledby(attacker, inflictor)
{
	self.lastkilledby = attacker;
	self.var_e78602fc = inflictor;
}

/*
	Name: offenseglobalcount
	Namespace: medals
	Checksum: 0xBE9AA497
	Offset: 0x1C8
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function offenseglobalcount()
{
	level.globalteammedals++;
}

/*
	Name: defenseglobalcount
	Namespace: medals
	Checksum: 0x48F31E7F
	Offset: 0x1E0
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function defenseglobalcount()
{
	level.globalteammedals++;
}

/*
	Name: codecallback_medal
	Namespace: medals
	Checksum: 0x4E2C69B9
	Offset: 0x1F8
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event codecallback_medal(eventstruct)
{
	self luinotifyevent(#"medal_received", 1, eventstruct.medal_index);
	self function_8ba40d2f(#"medal_received", 1, eventstruct.medal_index);
}

