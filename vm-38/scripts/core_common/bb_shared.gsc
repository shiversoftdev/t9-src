#using scripts\core_common\callbacks_shared.gsc;

#namespace bb_shared;

/*
	Name: function_20fd4c49
	Namespace: bb_shared
	Checksum: 0x71A32BE0
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_20fd4c49()
{
	level notify(1700503178);
}

#namespace bb;

/*
	Name: init_shared
	Namespace: bb
	Checksum: 0x20D21263
	Offset: 0x88
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	callback::on_start_gametype(&init);
	callback::on_joined_team(&player_joined_team);
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: init
	Namespace: bb
	Checksum: 0x80F724D1
	Offset: 0x118
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: function_ff257265
	Namespace: bb
	Checksum: 0x6041C282
	Offset: 0x128
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_ff257265()
{
	self._bbdata = [];
	self._bbdata[#"score"] = 0;
	self._bbdata[#"momentum"] = 0;
	self._bbdata[#"spawntime"] = gettime();
	self._bbdata[#"shots"] = 0;
	self._bbdata[#"hits"] = 0;
}

/*
	Name: on_player_connect
	Namespace: bb
	Checksum: 0xAF2B94F2
	Offset: 0x1B8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self function_ff257265();
}

/*
	Name: on_player_spawned
	Namespace: bb
	Checksum: 0xB5B80C57
	Offset: 0x1E0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self function_ff257265();
}

/*
	Name: commit_weapon_data
	Namespace: bb
	Checksum: 0x33196C00
	Offset: 0x208
	Size: 0x234
	Parameters: 3
	Flags: Linked
*/
function commit_weapon_data(spawnid, currentweapon, time0)
{
	if(isbot(self))
	{
		return;
	}
	/#
		/#
			assert(isdefined(self._bbdata));
		#/
	#/
	if(!isdefined(self._bbdata))
	{
		return;
	}
	time1 = gettime();
	blackboxeventname = #"mpweapons";
	eventname = #"hash_41cc1afc10e99541";
	if(sessionmodeiscampaigngame())
	{
		blackboxeventname = #"cpweapons";
		eventname = #"hash_474292d3118817ab";
	}
	else
	{
		if(sessionmodeiszombiesgame())
		{
			blackboxeventname = #"zmweapons";
			eventname = #"hash_67140d84a7660909";
		}
		else if(function_f99d2668())
		{
			blackboxeventname = #"hash_205db9f882d276a1";
			eventname = #"hash_63ec5305e1ef1335";
		}
	}
	var_aba8a4d5 = {#hits:self._bbdata[#"hits"], #shots:self._bbdata[#"shots"], #duration:time1 - time0, #name:currentweapon.name, #spawnid:spawnid};
	function_92d1707f(eventname, blackboxeventname, var_aba8a4d5);
	self._bbdata[#"shots"] = 0;
	self._bbdata[#"hits"] = 0;
}

/*
	Name: add_to_stat
	Namespace: bb
	Checksum: 0x7A92D35E
	Offset: 0x448
	Size: 0x70
	Parameters: 2
	Flags: Linked
*/
function add_to_stat(statname, delta)
{
	if(isbot(self))
	{
		return;
	}
	if(isdefined(self._bbdata) && isdefined(self._bbdata[statname]))
	{
		self._bbdata[statname] = self._bbdata[statname] + delta;
	}
}

/*
	Name: function_a7ba460f
	Namespace: bb
	Checksum: 0x43FD3B6E
	Offset: 0x4C0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_a7ba460f(reason)
{
	function_92d1707f(#"hash_28b295eb3b8e189", {#reason:reason});
}

/*
	Name: function_afcc007d
	Namespace: bb
	Checksum: 0x9EE7A36C
	Offset: 0x510
	Size: 0x94
	Parameters: 3
	Flags: Linked
*/
function function_afcc007d(name, clientnum, xuid)
{
	var_bd8c7087 = int(xuid);
	function_92d1707f(#"hash_3e5070f3289e386c", {#xuid:var_bd8c7087, #clientnum:clientnum, #name:name});
}

/*
	Name: function_e0dfa262
	Namespace: bb
	Checksum: 0x6DB3C012
	Offset: 0x5B0
	Size: 0x94
	Parameters: 3
	Flags: Linked
*/
function function_e0dfa262(name, clientnum, xuid)
{
	var_bd8c7087 = int(xuid);
	function_92d1707f(#"hash_557aae9aaddeac22", {#xuid:var_bd8c7087, #clientnum:clientnum, #name:name});
}

/*
	Name: player_joined_team
	Namespace: bb
	Checksum: 0xF4533F5E
	Offset: 0x650
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function player_joined_team(params)
{
	if(!isdefined(self.team) || isdefined(self.startingteam))
	{
		return;
	}
	self.startingteam = self.team;
}

