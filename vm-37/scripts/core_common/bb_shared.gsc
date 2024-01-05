#using scripts\core_common\callbacks_shared.gsc;

#namespace bb;

/*
	Name: init_shared
	Namespace: bb
	Checksum: 0xD12EF41E
	Offset: 0x68
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
	Offset: 0xF8
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
	Checksum: 0x8AA11EBC
	Offset: 0x108
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
	Checksum: 0x1A5982CE
	Offset: 0x198
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
	Checksum: 0x7E5D47D9
	Offset: 0x1C0
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
	Checksum: 0xEABE3709
	Offset: 0x1E8
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
		else if(sessionmodeiswarzonegame())
		{
			blackboxeventname = #"wzweapons";
			eventname = #"hash_63ec5305e1ef1335";
		}
	}
	event_data = {#hits:self._bbdata[#"hits"], #shots:self._bbdata[#"shots"], #duration:time1 - time0, #name:currentweapon.name, #spawnid:spawnid};
	function_92d1707f(eventname, blackboxeventname, event_data);
	self._bbdata[#"shots"] = 0;
	self._bbdata[#"hits"] = 0;
}

/*
	Name: add_to_stat
	Namespace: bb
	Checksum: 0x3FEFEC87
	Offset: 0x428
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
	Checksum: 0xCA490751
	Offset: 0x4A0
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
	Checksum: 0x10942DDC
	Offset: 0x4F0
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
	Checksum: 0x46E4555F
	Offset: 0x590
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
	Checksum: 0xEE6F0A4C
	Offset: 0x630
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

