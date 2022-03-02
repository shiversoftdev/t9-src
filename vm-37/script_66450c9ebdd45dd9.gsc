#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_12d19e59;

/*
	Name: function_d8f1209f
	Namespace: namespace_12d19e59
	Checksum: 0xF0E162AA
	Offset: 0x80
	Size: 0x194
	Parameters: 1
	Flags: Event
*/
event function_d8f1209f(eventstruct)
{
	if(eventstruct.eventid != 1)
	{
		return;
	}
	if(is_true(level.var_1536cd6d))
	{
		return;
	}
	level.var_1536cd6d = 1;
	player1 = eventstruct.var_40209f44;
	player2 = eventstruct.var_3d136cd9;
	if(!isdefined(player1) || !isdefined(player2))
	{
		return;
	}
	if(!player1 function_ca024039() || !player2 function_ca024039())
	{
		return;
	}
	var_1518f1fb = function_86492662(player1, player2);
	if(var_1518f1fb.size <= 0)
	{
		return;
	}
	index = eventstruct.var_7e98b410 % var_1518f1fb.size;
	banter = var_1518f1fb[index];
	var_bfc07183 = player1 function_7b99157b();
	var_d6c29f87 = player2 function_7b99157b();
	level thread play_banter(var_bfc07183, var_d6c29f87, banter[2], banter[3]);
}

/*
	Name: function_86492662
	Namespace: namespace_12d19e59
	Checksum: 0x6C3A6BC0
	Offset: 0x220
	Size: 0x11A
	Parameters: 2
	Flags: None
*/
function function_86492662(player1, player2)
{
	var_1518f1fb = [];
	player1name = player1 getmpdialogname();
	player2name = player2 getmpdialogname();
	if(isdefined(player1name) && isdefined(player2name))
	{
		var_f0b4da50 = tablelookuprowcount(#"hash_5ec1825aeab754a2");
		for(i = 0; i < var_f0b4da50; i++)
		{
			row = tablelookuprow(#"hash_5ec1825aeab754a2", i);
			if(row[0] == player1name && row[1] == player2name)
			{
				var_1518f1fb[var_1518f1fb.size] = row;
			}
		}
	}
	return var_1518f1fb;
}

/*
	Name: play_banter
	Namespace: namespace_12d19e59
	Checksum: 0xEEDA35C7
	Offset: 0x348
	Size: 0xC4
	Parameters: 4
	Flags: None
*/
function play_banter(player1, player2, alias1, alias2)
{
	player1 endon(#"death");
	player2 endon(#"death");
	var_1909680b = player1 playsound(-1, alias1);
	if(var_1909680b >= 0)
	{
		while(soundplaying(var_1909680b))
		{
			waitframe(1);
		}
	}
	wait(0.2);
	player2 playsound(-1, alias2);
}

/*
	Name: function_7b99157b
	Namespace: namespace_12d19e59
	Checksum: 0x66FD6324
	Offset: 0x418
	Size: 0xBA
	Parameters: 0
	Flags: None
*/
function function_7b99157b()
{
	if(isdefined(self getlocalclientnumber()))
	{
		foreach(player in getlocalplayers())
		{
			if(player issplitscreenhost())
			{
				return player;
			}
		}
	}
	return self;
}

