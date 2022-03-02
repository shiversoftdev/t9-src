#using scripts\core_common\util_shared.csc;

#namespace activities;

/*
	Name: level_end
	Namespace: activities
	Checksum: 0x867DA1B9
	Offset: 0x98
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
	Checksum: 0x931646DE
	Offset: 0x170
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
	Offset: 0x248
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
	Checksum: 0xF446691B
	Offset: 0x258
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
	Checksum: 0xA0E509A8
	Offset: 0x320
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
	Checksum: 0xD08E171C
	Offset: 0x3D0
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
	Checksum: 0xC4FF4705
	Offset: 0x430
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
				levelname = util::function_53bbf9d2();
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

