#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace medals;

/*
	Name: __init__system__
	Namespace: medals
	Checksum: 0x90A2B294
	Offset: 0x70
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
	Checksum: 0xCFA870A
	Offset: 0xB8
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
	Checksum: 0x49DB817D
	Offset: 0xE8
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
	Checksum: 0xCEB80D6B
	Offset: 0x158
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
	Checksum: 0x43417530
	Offset: 0x170
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
	Checksum: 0xEFFB5549
	Offset: 0x1A8
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
	Checksum: 0xC157AC77
	Offset: 0x1C0
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
	Checksum: 0xF75524A5
	Offset: 0x1D8
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event codecallback_medal(eventstruct)
{
	self luinotifyevent(#"medal_received", 1, eventstruct.medal_index);
	self function_8ba40d2f(#"medal_received", 1, eventstruct.medal_index);
}

