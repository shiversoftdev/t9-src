#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace demo_shared;

/*
	Name: function_97093ff6
	Namespace: demo_shared
	Checksum: 0x27C50D7F
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_97093ff6()
{
	level notify(894307784);
}

#namespace demo;

/*
	Name: function_89f2df9
	Namespace: demo
	Checksum: 0x59B4E56
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"demo", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: demo
	Checksum: 0x61796EFC
	Offset: 0xE0
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	game.var_e9714926 = #"demo";
	callback::on_start_gametype(&init);
	level thread watch_actor_bookmarks();
}

/*
	Name: init
	Namespace: demo
	Checksum: 0x495D6EE7
	Offset: 0x140
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private init()
{
	potm::function_d71338e4();
}

/*
	Name: function_4ba58938
	Namespace: demo
	Checksum: 0x250E7FD6
	Offset: 0x160
	Size: 0x8C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4ba58938(bookmark, overrideentitycamera)
{
	if(!isdefined(bookmark))
	{
		return;
	}
	if(!isdefined(overrideentitycamera))
	{
		overrideentitycamera = 0;
	}
	adddemobookmark(bookmark.var_900768bc.id, bookmark.time, bookmark.mainclientnum, bookmark.otherclientnum, bookmark.scoreeventpriority, bookmark.inflictorentnum, bookmark.inflictorenttype, bookmark.var_5f0256c4, overrideentitycamera);
}

/*
	Name: function_ae3420ca
	Namespace: demo
	Checksum: 0xA28AA7F4
	Offset: 0x1F8
	Size: 0x84
	Parameters: 5
	Flags: Linked
*/
function function_ae3420ca(var_81538b15, var_f28fb772, einflictor, var_50d1e41a, overrideentitycamera)
{
	bookmark = potm::function_5b1e9ed4(game.var_e9714926, #"kill", gettime(), var_81538b15, var_f28fb772, 0, einflictor, var_50d1e41a, overrideentitycamera);
	function_4ba58938(bookmark, overrideentitycamera);
}

/*
	Name: function_651a5f4
	Namespace: demo
	Checksum: 0x376C577A
	Offset: 0x288
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_651a5f4(var_81538b15, einflictor)
{
	bookmark = potm::function_5b1e9ed4(game.var_e9714926, #"hash_23fbe94cfb952f6f", gettime(), var_81538b15, undefined, 0, einflictor);
	function_4ba58938(bookmark);
}

/*
	Name: function_dfecaa9
	Namespace: demo
	Checksum: 0xE4736878
	Offset: 0x300
	Size: 0x7C
	Parameters: 5
	Flags: None
*/
function function_dfecaa9(var_65e76577, time, var_81538b15, scoreeventpriority, eventdata)
{
	bookmark = potm::function_5b1e9ed4(game.var_e9714926, var_65e76577, time, var_81538b15, undefined, scoreeventpriority, undefined, undefined, 0, eventdata);
	function_4ba58938(bookmark);
}

/*
	Name: bookmark
	Namespace: demo
	Checksum: 0x54F41DED
	Offset: 0x388
	Size: 0x74
	Parameters: 5
	Flags: Linked
*/
function bookmark(var_65e76577, time, var_81538b15, var_f28fb772, scoreeventpriority)
{
	bookmark = potm::function_5b1e9ed4(game.var_e9714926, var_65e76577, time, var_81538b15, var_f28fb772, scoreeventpriority);
	function_4ba58938(bookmark);
}

/*
	Name: function_c6ae5fd6
	Namespace: demo
	Checksum: 0x712ABE2D
	Offset: 0x408
	Size: 0xC4
	Parameters: 3
	Flags: None
*/
function function_c6ae5fd6(var_65e76577, winningteamindex, losingteamindex)
{
	bookmark = potm::function_5b1e9ed4(game.var_e9714926, var_65e76577, gettime(), undefined, undefined, 0);
	if(!isdefined(bookmark))
	{
		/#
			println(("" + var_65e76577) + "");
		#/
		return;
	}
	if(isdefined(winningteamindex))
	{
		bookmark.mainclientnum = winningteamindex;
	}
	if(isdefined(losingteamindex))
	{
		bookmark.otherclientnum = losingteamindex;
	}
	function_4ba58938(bookmark);
}

/*
	Name: initactorbookmarkparams
	Namespace: demo
	Checksum: 0xE0551BE1
	Offset: 0x4D8
	Size: 0x5C
	Parameters: 3
	Flags: Linked
*/
function initactorbookmarkparams(killtimescount, killtimemsec, killtimedelay)
{
	level.actor_bookmark_kill_times_count = killtimescount;
	level.actor_bookmark_kill_times_msec = killtimemsec;
	level.actor_bookmark_kill_times_delay = killtimedelay;
	level.actorbookmarkparamsinitialized = 1;
}

/*
	Name: reset_actor_bookmark_kill_times
	Namespace: demo
	Checksum: 0x23A86C9D
	Offset: 0x540
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function reset_actor_bookmark_kill_times()
{
	if(!isdefined(level.actorbookmarkparamsinitialized))
	{
		return;
	}
	if(!isdefined(self.actor_bookmark_kill_times))
	{
		self.actor_bookmark_kill_times = [];
		self.ignore_actor_kill_times = 0;
	}
	for(i = 0; i < level.actor_bookmark_kill_times_count; i++)
	{
		self.actor_bookmark_kill_times[i] = 0;
	}
}

/*
	Name: add_actor_bookmark_kill_time
	Namespace: demo
	Checksum: 0xE874369E
	Offset: 0x5C0
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function add_actor_bookmark_kill_time()
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(level.actorbookmarkparamsinitialized))
	{
		return;
	}
	if(!isdefined(self.ignore_actor_kill_times))
	{
		self reset_actor_bookmark_kill_times();
	}
	now = gettime();
	if(now <= self.ignore_actor_kill_times)
	{
		return;
	}
	oldest_index = 0;
	oldest_time = now + 1;
	for(i = 0; i < level.actor_bookmark_kill_times_count; i++)
	{
		if(!self.actor_bookmark_kill_times[i])
		{
			oldest_index = i;
			break;
			continue;
		}
		if(oldest_time > self.actor_bookmark_kill_times[i])
		{
			oldest_index = i;
			oldest_time = self.actor_bookmark_kill_times[i];
		}
	}
	self.actor_bookmark_kill_times[oldest_index] = now;
}

/*
	Name: watch_actor_bookmarks
	Namespace: demo
	Checksum: 0x231C60EA
	Offset: 0x6D8
	Size: 0x1E2
	Parameters: 0
	Flags: Linked
*/
function watch_actor_bookmarks()
{
	while(true)
	{
		if(!isdefined(level.actorbookmarkparamsinitialized))
		{
			wait(0.5);
			continue;
		}
		waitframe(1);
		waittillframeend();
		now = gettime();
		oldest_allowed = now - level.actor_bookmark_kill_times_msec;
		players = getplayers();
		for(player_index = 0; player_index < players.size; player_index++)
		{
			player = players[player_index];
			/#
				if(isbot(player))
				{
					continue;
				}
			#/
			for(time_index = 0; time_index < level.actor_bookmark_kill_times_count; time_index++)
			{
				if(!isdefined(player.actor_bookmark_kill_times) || !player.actor_bookmark_kill_times[time_index])
				{
					break;
					continue;
				}
				if(oldest_allowed > player.actor_bookmark_kill_times[time_index])
				{
					player.actor_bookmark_kill_times[time_index] = 0;
					break;
				}
			}
			if(time_index >= level.actor_bookmark_kill_times_count)
			{
				bookmark(#"actor_kill", gettime(), player);
				potm::bookmark(#"actor_kill", gettime(), player);
				player reset_actor_bookmark_kill_times();
				player.ignore_actor_kill_times = now + level.actor_bookmark_kill_times_delay;
			}
		}
	}
}

