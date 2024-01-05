#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_6b71c9befed901f2;
#using script_75c3996cce8959f7;
#using script_71603a58e2da0698;
#using script_30c7fb449869910;
#using script_771f5bff431d8d57;
#using script_42cbbdcd1e160063;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using script_18910f59cc847b42;
#using scripts\core_common\struct.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_9fc66ac;

/*
	Name: init
	Namespace: namespace_9fc66ac
	Checksum: 0x5E23968C
	Offset: 0x1F8
	Size: 0x1F44
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "doa_announce", 1, 11, "int", &function_b9918ac7, 0, 0);
	level thread function_d32819b7();
	level.doa.var_f5ac1256 = array({#roll:100, #lastplayed:0, #cooldown:0, #audio:undefined, #id:0}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_5e6e1452ec83a970", #id:1}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_2eb0dc04b23c744d", #id:2}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_7e54ced7572851c2", #id:3}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_651f3b290bc84446", #id:4}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_1fc99b8da3b17545", #id:5}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_28b747b591669a5d", #id:6}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_7c7a787a24f593b9", #id:7}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_2e05ff4b6268eb8f", #id:8}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_6e6f540341ffa63e", #id:9}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_43afff6856f17323", #id:10}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_1b1aedb93f9470ac", #id:11}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_2ee1c63f7404a4d", #id:12}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_2c81ef7c33bb5cf8", #id:13}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_3dc9e95c1bb57e9b", #id:14}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_7d54a35ebdfd55bd", #id:15}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_3a54bd27d22124f0", #id:16}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_5b52ce536f868c5e", #id:17}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_1f86f42144bb9e8f", #id:18}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_1241db745382fb45", #id:19}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_160facb2f210d511", #id:20}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_6ced3e7dc041cd89", #id:21}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_77520fd1edf0a38a", #id:22}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_1bf394b62878774b", #id:23}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_5067551b940e90b5", #id:24}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_3d81295463455fe", #id:25}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_19ff2f6b0c853b6", #id:26}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_622c69a771466aae", #id:27}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_46f6b3325650d2db", #id:28}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_38c6db33d9b9bb6b", #id:29}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_6c635274e16696bd", #id:30}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_4d2fd562754a4f01", #id:31}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_670e9e1a3893d870", #id:32}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_2b25bf7cb60724a1", #id:33}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_91466a80e98968f", #id:34}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_72a785fee3fe1546", #id:35}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_5dcdc3449e3d853c", #id:36}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_70176ca9d7eadea2", #id:37}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_17c7fe1f6f3a34f0", #id:38}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_4dc16a7fdcca84cc", #id:39}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_5db798a7f60563d7", #id:40}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_459e9ed04815fe9c", #id:41}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_9274c6731fb7feb", #id:42}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_5bf27744a0b10d1e", #id:43}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_1958839e85f66720", #id:44}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_1997e34d69a45b73", #id:45}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_113008b2061dab6b", #id:46}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_2427c3aea88f9fd1", #id:47}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_6175054f39a3e1dd", #id:48}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_37d228f1a7b7933d", #id:49}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_3058c912ba06ce02", #id:50}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_6f7330fa470cb5e8", #id:51}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_5f4f49fa863187fd", #id:52}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_5be1c74545ae242a", #id:53}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_18d7c7d333aa151e", #id:54}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_7742a96850eaf496", #id:55}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_7522904a63119317", #id:56}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_43c91102fff01c96", #id:57}, {#roll:5, #lastplayed:0, #cooldown:120000, #audio:#"hash_4a892234ff034660", #id:58}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_7286e11306aa412f", #id:59}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_31e0e727b7ea0fcb", #id:60}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_680b8403f9f66646", #id:61}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_15428efb31882884", #id:62}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_7fb87667c443733d", #id:63}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_2ff2890b37cb4b5d", #id:64}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_175054f8f6fc7dde", #id:65}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_4eb136f9afa3e768", #id:66}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_7708cf29dde5f73a", #id:67}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_1aaf39243ecd3c87", #id:68}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_5bf427da9381b39f", #id:69}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_6838acfd05bcf2ab", #id:70}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_340c9ca061a5fde2", #id:71}, {#roll:100, #lastplayed:0, #cooldown:0, #audio:#"hash_6020f714caec40ab", #id:72});
	function_32d5e898();
}

/*
	Name: function_5521aa1c
	Namespace: namespace_9fc66ac
	Checksum: 0x83515746
	Offset: 0x2148
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function function_5521aa1c(localclientnum)
{
	if(localclientnum != 0)
	{
		return;
	}
	self notify("11fa0ea36c3aeb7c");
	self endon("11fa0ea36c3aeb7c");
	if(isdefined(level.doa.var_57e2aa98))
	{
		stopsound(level.doa.var_57e2aa98);
		level.doa.var_57e2aa98 = undefined;
	}
	level.doa.voqueue = [];
	while(true)
	{
		if(!isdefined(level.doa.var_57e2aa98))
		{
			if(level.doa.voqueue.size)
			{
				var_3046d90a = level.doa.voqueue[0];
				arrayremoveindex(level.doa.voqueue, 0);
				if(var_3046d90a.localclientnum != localclientnum)
				{
					continue;
				}
				if(isdefined(var_3046d90a.entity))
				{
					level.doa.var_57e2aa98 = var_3046d90a.entity playsound(var_3046d90a.localclientnum, var_3046d90a.line);
				}
				else
				{
					level.doa.var_57e2aa98 = playsound(var_3046d90a.localclientnum, var_3046d90a.line);
				}
			}
			wait(0.1);
		}
		else
		{
			while(soundplaying(level.doa.var_57e2aa98))
			{
				wait(0.2);
			}
			level.doa.var_57e2aa98 = undefined;
			wait(1.2);
		}
	}
}

/*
	Name: function_9a237f2f
	Namespace: namespace_9fc66ac
	Checksum: 0x9AC4B979
	Offset: 0x2358
	Size: 0x12C
	Parameters: 3
	Flags: Linked
*/
function function_9a237f2f(localclientnum, var_e8cccaf8, entity)
{
	if(isdefined(var_e8cccaf8))
	{
		var_3046d90a = {#entity:entity, #time:gettime(), #localclientnum:localclientnum, #line:var_e8cccaf8};
		if(!isdefined(level.doa.voqueue))
		{
			level.doa.voqueue = [];
		}
		else if(!isarray(level.doa.voqueue))
		{
			level.doa.voqueue = array(level.doa.voqueue);
		}
		level.doa.voqueue[level.doa.voqueue.size] = var_3046d90a;
	}
}

/*
	Name: announce
	Namespace: namespace_9fc66ac
	Checksum: 0x580AECAB
	Offset: 0x2490
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function announce(localclientnum, var_fa5e0d11)
{
	line = level.doa.var_f5ac1256[var_fa5e0d11];
	line.lastplayed = gettime() + line.cooldown;
	function_9a237f2f(localclientnum, line.audio);
}

/*
	Name: function_b9918ac7
	Namespace: namespace_9fc66ac
	Checksum: 0x86472E14
	Offset: 0x2508
	Size: 0x200
	Parameters: 7
	Flags: Linked
*/
function function_b9918ac7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		return;
	}
	if(fieldname != 0)
	{
		return;
	}
	var_971e1071 = bwastimejump & 15;
	var_fa5e0d11 = bwastimejump >> 4;
	line = level.doa.var_f5ac1256[var_fa5e0d11];
	if(line.lastplayed > gettime())
	{
		return;
	}
	roll = randomint(100);
	if(roll >= line.roll)
	{
		return;
	}
	if(var_971e1071 == 15)
	{
		announce(fieldname, var_fa5e0d11);
	}
	else
	{
		players = getlocalplayers();
		foreach(player in players)
		{
			if(!isdefined(player.entnum))
			{
				continue;
			}
			var_a10d0ff1 = 1 << player.entnum;
			if(var_a10d0ff1 & var_971e1071 == 0)
			{
				continue;
			}
			announce(fieldname, var_fa5e0d11);
		}
	}
}

/*
	Name: function_32d5e898
	Namespace: namespace_9fc66ac
	Checksum: 0x11F29311
	Offset: 0x2710
	Size: 0xEE
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
	if(!isdefined(localclientnum))
	{
		localclientnum = 0;
	}
	level thread function_5521aa1c(localclientnum);
	util::delay(2, "game_over", &function_5beeba99);
	for(i = 0; i < level.doa.var_f5ac1256.size; i++)
	{
		/#
			/#
				assert(i == level.doa.var_f5ac1256[i].id, "");
			#/
		#/
		level.doa.var_f5ac1256[i].lastplayed = 0;
	}
}

/*
	Name: function_a77649db
	Namespace: namespace_9fc66ac
	Checksum: 0xF9F56AB5
	Offset: 0x2808
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_a77649db(onoff, str_name)
{
	if(is_true(onoff))
	{
		level.var_1d1399b = level.var_5d4c7696;
		function_30f7911(2, str_name);
	}
	else
	{
		function_f2198fe(level.var_1d1399b);
	}
}

/*
	Name: function_5beeba99
	Namespace: namespace_9fc66ac
	Checksum: 0xA31EB445
	Offset: 0x2890
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_5beeba99()
{
	if(isdefined(level.doa.current_arena))
	{
		name = level.doa.current_arena.script_noteworthy;
		var_8576a4b1 = level.doa.roundnumber;
		function_30f7911(0, name);
	}
}

/*
	Name: function_2fc07d61
	Namespace: namespace_9fc66ac
	Checksum: 0x80F724D1
	Offset: 0x2910
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_2fc07d61()
{
}

/*
	Name: function_65fcd877
	Namespace: namespace_9fc66ac
	Checksum: 0xF68B95E1
	Offset: 0x2920
	Size: 0xDA
	Parameters: 0
	Flags: Linked
*/
function function_65fcd877()
{
	switch(level.doa.world_state)
	{
		case 0:
		{
			peak = 1;
			break;
		}
		case 4:
		{
			function_30f7911(4);
			function_319e479e();
			break;
		}
		case 5:
		{
			function_30f7911(5);
			break;
		}
		case 1:
		{
			function_30f7911(1);
			break;
		}
	}
}

/*
	Name: function_30f7911
	Namespace: namespace_9fc66ac
	Checksum: 0xD732FDA0
	Offset: 0x2A08
	Size: 0x16C
	Parameters: 2
	Flags: Linked
*/
function function_30f7911(type, str_name)
{
	if(!isdefined(str_name))
	{
		str_name = undefined;
	}
	if(!isdefined(level.var_5d4c7696))
	{
		level.var_5d4c7696 = "";
	}
	if(!isdefined(level.var_1d1399b))
	{
		level.var_1d1399b = "";
	}
	var_fc7248c7 = undefined;
	switch(type)
	{
		case 0:
		{
			if(isdefined(str_name))
			{
				var_fc7248c7 = "zm_doa_arena_" + str_name;
			}
			else
			{
				var_fc7248c7 = "zm_doa_arena_default";
			}
			break;
		}
		case 2:
		{
			if(isdefined(str_name))
			{
				var_fc7248c7 = "zm_doa_bonusroom_" + str_name;
			}
			else
			{
				var_fc7248c7 = "zm_doa_bonusroom_default";
			}
			break;
		}
		case 4:
		{
			var_fc7248c7 = "zm_doa_overworld";
			break;
		}
		case 5:
		{
			var_fc7248c7 = "zm_doa_dungeon";
			break;
		}
		case 1:
		{
			var_fc7248c7 = "zm_doa_gameover";
			break;
		}
	}
	function_f2198fe(var_fc7248c7);
}

/*
	Name: function_f2198fe
	Namespace: namespace_9fc66ac
	Checksum: 0x24BA6CA0
	Offset: 0x2B80
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_f2198fe(var_fc7248c7)
{
	if(level.var_5d4c7696 !== var_fc7248c7)
	{
		level.var_5d4c7696 = var_fc7248c7;
		forceambientroom(var_fc7248c7);
	}
}

/*
	Name: function_d32819b7
	Namespace: namespace_9fc66ac
	Checksum: 0xDB314AB8
	Offset: 0x2BD0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_d32819b7()
{
	for(i = 1; i < 20; i++)
	{
		var_ad059c41 = #"hash_3e8aee7efd30e549" + i;
		function_2cca7b47(0, var_ad059c41);
	}
}

/*
	Name: function_319e479e
	Namespace: namespace_9fc66ac
	Checksum: 0xE5B28DBD
	Offset: 0x2C38
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_319e479e()
{
	audio::playloopat(#"hash_144636b68669b310", (1073, 7378, 1229));
	audio::playloopat(#"hash_557b8a7ebb353029", (319, 7216, 1229));
}

