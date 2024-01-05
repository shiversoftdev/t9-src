#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\callings\zm_callings.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_callings_devgui;

/*
	Name: function_b6d4e01c
	Namespace: zm_callings_devgui
	Checksum: 0xD9BF21F1
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b6d4e01c()
{
	level notify(643304756);
}

/*
	Name: function_9f47471
	Namespace: zm_callings_devgui
	Checksum: 0x2E9D8EC6
	Offset: 0x98
	Size: 0x1C4
	Parameters: 0
	Flags: None
*/
function function_9f47471()
{
	/#
		level flag::wait_till("");
		zm_devgui::add_custom_devgui_callback(&function_6cbc14bb);
		if(!isdefined(level.var_314051a1))
		{
			return;
		}
		var_94237d8 = array(#"hash_20deab97abbf7b12", #"hash_764a5fc3ba8820d2", #"hash_647ebc7d24425fee", #"tcmgoal");
		i = 0;
		foreach(var_acbd7392 in var_94237d8)
		{
			var_31e48984 = "" + function_9e72a96(var_acbd7392);
			adddebugcommand(((((("" + function_9e72a96(var_acbd7392)) + "") + i) + "") + var_31e48984) + "");
			i = i + 1;
		}
		adddebugcommand("");
	#/
}

/*
	Name: function_1d4f22e4
	Namespace: zm_callings_devgui
	Checksum: 0x6FAEAF64
	Offset: 0x268
	Size: 0x57C
	Parameters: 1
	Flags: None
*/
function function_1d4f22e4(cmd)
{
	/#
		if(strstartswith(cmd, ""))
		{
			str = strreplace(cmd, "", "");
			arr = strtok(str, "");
			taskid = arr[0];
			taskid = int(taskid);
			setdvar(#"zm_active_daily_calling", taskid);
			setdvar(#"zm_active_event_calling", 0);
			setdvar(#"hash_acdd08b365cb62f", 1);
		}
		else
		{
			if(strstartswith(cmd, ""))
			{
				str = strreplace(cmd, "", "");
				var_762ca590 = hash(str);
				if(!getdvarint(#"hash_11da02ca40639de5", 0))
				{
					iprintln("" + self.name);
				}
				else
				{
					if(!getdvarint(#"hash_66c8247d6d84d328", 0) || !getdvarint(#"hash_5341de25cb0d6f66", 0) || !getdvarint(#"hash_47067c5d4fe9075e", 0))
					{
						iprintln("");
					}
					else
					{
						if(!isdefined(self.var_96d6f6d1))
						{
							iprintln(self.name + "");
						}
						else
						{
							var_fe8112e6 = 0;
							foreach(var_d1017f27 in self.var_96d6f6d1)
							{
								if(var_d1017f27.var_30c47a21 == var_762ca590)
								{
									self zm_callings::function_4368582a(var_d1017f27, var_d1017f27.var_e226ec4f);
									var_fe8112e6 = 1;
								}
							}
							if(!is_true(var_fe8112e6))
							{
								iprintln((self.name + "") + function_9e72a96(var_762ca590) + "");
							}
						}
					}
				}
			}
			else if(strstartswith(cmd, ""))
			{
				str = strreplace(cmd, "", "");
				arr = strtok(str, "");
				interval = arr[0];
				interval = int(interval);
				if(!getdvarint(#"hash_11da02ca40639de5", 0))
				{
					iprintln("" + self.name);
				}
				else
				{
					if(!getdvarint(#"hash_66c8247d6d84d328", 0) || !getdvarint(#"hash_5341de25cb0d6f66", 0) || !getdvarint(#"hash_47067c5d4fe9075e", 0))
					{
						iprintln("");
					}
					else
					{
						if(!isdefined(self.var_96d6f6d1))
						{
							iprintln(self.name + "");
						}
						else
						{
							self thread function_8a37e046(interval);
						}
					}
				}
			}
		}
	#/
}

/*
	Name: function_8a37e046
	Namespace: zm_callings_devgui
	Checksum: 0xD80A3E5
	Offset: 0x7F0
	Size: 0x11E
	Parameters: 1
	Flags: None
*/
function function_8a37e046(n_interval)
{
	/#
		foreach(var_d1017f27 in self.var_96d6f6d1)
		{
			progress = self zm_callings::function_4368582a(var_d1017f27, 0);
			if(isdefined(progress))
			{
				target = var_d1017f27.var_e226ec4f;
				iprintln(((((self.name + "") + function_9e72a96(var_d1017f27.var_ad971622) + "") + progress) + "") + target);
			}
			wait(n_interval);
		}
	#/
}

/*
	Name: function_6cbc14bb
	Namespace: zm_callings_devgui
	Checksum: 0xBC866258
	Offset: 0x918
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function function_6cbc14bb(cmd)
{
	/#
		foreach(p in level.players)
		{
			if(!isdefined(p))
			{
				continue;
			}
			if(isbot(p))
			{
				continue;
			}
			p function_1d4f22e4(cmd);
		}
	#/
}

