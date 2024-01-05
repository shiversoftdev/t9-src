#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_2d986308;

/*
	Name: main
	Namespace: namespace_2d986308
	Checksum: 0x9F29BECF
	Offset: 0xC8
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	callback::on_gameplay_started(&on_gameplay_started);
	util::waitforclient(0);
}

/*
	Name: on_gameplay_started
	Namespace: namespace_2d986308
	Checksum: 0x1C1D584E
	Offset: 0x118
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_gameplay_started(localclientnum)
{
	level thread nuked_population_sign_think(localclientnum);
}

/*
	Name: nuked_population_sign_think
	Namespace: namespace_2d986308
	Checksum: 0xDDF0041D
	Offset: 0x148
	Size: 0x45C
	Parameters: 1
	Flags: Linked
*/
function nuked_population_sign_think(localclientnum)
{
	if(getdvarint(#"hash_9e6fbcc64352e9e", 0))
	{
		return;
	}
	tens_model = getent(localclientnum, "counter_tens", "targetname");
	ones_model = getent(localclientnum, "counter_ones", "targetname");
	time = set_dvar_float_if_unset("scr_dial_rotate_time", "0.5");
	/#
		level thread function_102a701c(tens_model, ones_model);
	#/
	step = 36;
	ones = 1;
	tens = 1;
	if(!isdefined(tens_model) || !isdefined(ones_model))
	{
		return;
	}
	tens_model rotateroll(step, 0.05);
	ones_model rotateroll(step, 0.05);
	for(;;)
	{
		wait(1);
		var_c510abcc = 0;
		players = getlocalplayers();
		foreach(localplayer in players)
		{
			if(!isdefined(localplayer))
			{
				continue;
			}
			if(1)
			{
				var_c510abcc = 1;
				break;
			}
		}
		if(!var_c510abcc)
		{
			continue;
		}
		players = [];
		foreach(player in getplayers(localclientnum))
		{
			if(isdefined(player))
			{
				if(!isdefined(players))
				{
					players = [];
				}
				else if(!isarray(players))
				{
					players = array(players);
				}
				players[players.size] = player;
			}
		}
		dial = ones + (tens * 10);
		while(players.size < dial)
		{
			ones--;
			if(ones < 0)
			{
				ones = 9;
				if(isdefined(tens_model))
				{
					tens_model rotateroll(0 - step, time);
				}
				tens--;
			}
			if(isdefined(ones_model))
			{
				ones_model rotateroll(0 - step, time);
				ones_model waittill(#"rotatedone");
			}
			dial = ones + (tens * 10);
		}
		while(players.size > dial)
		{
			ones++;
			if(ones > 9)
			{
				ones = 0;
				if(isdefined(tens_model))
				{
					tens_model rotateroll(step, time);
				}
				tens++;
			}
			if(isdefined(ones_model))
			{
				ones_model rotateroll(step, time);
				ones_model waittill(#"rotatedone");
			}
			dial = ones + (tens * 10);
		}
	}
}

/*
	Name: set_dvar_float_if_unset
	Namespace: namespace_2d986308
	Checksum: 0x66C3F885
	Offset: 0x5B0
	Size: 0x6A
	Parameters: 2
	Flags: Linked
*/
function set_dvar_float_if_unset(dvar, value)
{
	if(getdvarstring(dvar) == "")
	{
		setdvar(dvar, value);
	}
	return getdvarfloat(dvar, 0);
}

/*
	Name: function_102a701c
	Namespace: namespace_2d986308
	Checksum: 0xF8FCBBDB
	Offset: 0x628
	Size: 0x4E
	Parameters: 2
	Flags: None
*/
function function_102a701c(tens, ones)
{
	/#
		while(!isdefined(tens) || !isdefined(ones))
		{
			iprintlnbold("");
			wait(2);
		}
	#/
}

