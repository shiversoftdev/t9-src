#using scripts\core_common\util_shared.csc;

#namespace namespace_1ef8852a;

/*
	Name: function_af410ce9
	Namespace: namespace_1ef8852a
	Checksum: 0xF201B985
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_af410ce9()
{
	level notify(1935336790);
}

#namespace activities;

/*
	Name: level_end
	Namespace: activities
	Checksum: 0xB79B19A2
	Offset: 0xB8
	Size: 0xCA
	Parameters: 1
	Flags: Linked, Private
*/
function private level_end(outcome)
{
	if(!isdefined(outcome))
	{
		outcome = "failed";
	}
	foreach(player in getlocalplayers())
	{
		player function_4877c948(level.activities.mapname, outcome);
	}
	level.activities = undefined;
}

/*
	Name: level_start
	Namespace: activities
	Checksum: 0x1CFEC173
	Offset: 0x190
	Size: 0xD0
	Parameters: 0
	Flags: Linked, Private
*/
function private level_start()
{
	foreach(player in getlocalplayers())
	{
		player function_bbe3235(level.activities.mapname, level.activities.gametype, player getchrname(), level.activities.difficulty);
	}
}

/*
	Name: function_be258f26
	Namespace: activities
	Checksum: 0x80F724D1
	Offset: 0x268
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_be258f26()
{
}

/*
	Name: function_1c01a227
	Namespace: activities
	Checksum: 0xAE84CA54
	Offset: 0x278
	Size: 0xC0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1c01a227(task)
{
	level.activities.var_31ac96bc = task;
	foreach(player in getlocalplayers())
	{
		player function_cb812d61(task, level.activities.difficulty);
	}
}

/*
	Name: function_2c46b6f9
	Namespace: activities
	Checksum: 0xE8A8670E
	Offset: 0x340
	Size: 0xA8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2c46b6f9(outcome)
{
	foreach(player in getlocalplayers())
	{
		player function_7a093b3b(level.activities.var_31ac96bc, outcome);
	}
}

/*
	Name: function_83a031fd
	Namespace: activities
	Checksum: 0xAB92BE91
	Offset: 0x3F0
	Size: 0x54
	Parameters: 1
	Flags: Private, Event
*/
event private function_83a031fd(eventstruct)
{
	if(isdefined(level.activities))
	{
		function_2c46b6f9("failed");
		function_1c01a227(level.activities.var_31ac96bc);
	}
}

/*
	Name: function_406f0371
	Namespace: activities
	Checksum: 0x70689C4F
	Offset: 0x450
	Size: 0x2CC
	Parameters: 1
	Flags: Private, Event
*/
event private function_406f0371(eventstruct)
{
	if(eventstruct.system == "a:obj")
	{
		s = strtok(eventstruct.state, ",");
		switch(s[0])
		{
			case "0":
			{
				levelname = s[4];
			}
			task = s[1];
			world.gameskill = int(s[2]);
			var_6dfed201 = int(s[3]);
			break;
			default:
			{
				return;
			}
		}
		if(!isdefined(level.activities))
		{
			if(!isdefined(levelname))
			{
				levelname = util::get_map_name();
			}
			level.activities = {#gametype:getdvar(#"g_gametype"), #mapname:levelname};
		}
		if(!isdefined(level.activities.difficulty))
		{
			level.activities.difficulty = world.gameskill;
		}
		else if(world.gameskill != level.activities.difficulty)
		{
			level.activities.difficulty = world.gameskill;
			function_2c46b6f9("failed");
			function_1c01a227(level.activities.var_31ac96bc);
		}
		if(isdefined(level.activities.var_31ac96bc))
		{
			function_2c46b6f9("completed");
		}
		else
		{
			if(var_6dfed201)
			{
				function_be258f26();
			}
			else
			{
				level_start();
			}
		}
		if(task == "_exit")
		{
			level_end("completed");
		}
		else
		{
			function_1c01a227(task);
		}
	}
}

