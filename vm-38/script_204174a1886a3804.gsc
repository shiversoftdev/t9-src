#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_7c3faeda : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_7c3faeda
		Checksum: 0x9F56F53C
		Offset: 0x240
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_7c3faeda
		Checksum: 0xFF75F959
		Offset: 0x7D8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_7c3faeda
		Checksum: 0x3121B8DE
		Offset: 0x2D8
		Size: 0x3C
		Parameters: 2
		Flags: None
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_7c3faeda
		Checksum: 0xAFAD6A02
		Offset: 0x320
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_7c3faeda
		Checksum: 0x39553705
		Offset: 0x260
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("Incursion_InfiltrationTitleCards");
		namespace_6aaccc24::function_da693cbe("_state", 1, 4, "int");
		namespace_6aaccc24::function_da693cbe("SelectedInfiltration", 1, 3, "int");
	}

	/*
		Name: set_state
		Namespace: namespace_7c3faeda
		Checksum: 0x566DF63D
		Offset: 0x350
		Size: 0x42C
		Parameters: 2
		Flags: None
	*/
	function set_state(player, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 0);
		}
		else
		{
			if(#"hash_1c7fa28cf1485078" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				if(#"hash_41af72ac3698f06f" == state_name)
				{
					player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 2);
				}
				else
				{
					if(#"hash_5b1f56f3d27d25f0" == state_name)
					{
						player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 3);
					}
					else
					{
						if(#"hash_249ee0339eddec66" == state_name)
						{
							player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 4);
						}
						else
						{
							if(#"hash_55a524ad199904e9" == state_name)
							{
								player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 5);
							}
							else
							{
								if(#"hash_37b2af92df0bfd42" == state_name)
								{
									player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 6);
								}
								else
								{
									if(#"hash_30029804cf01e828" == state_name)
									{
										player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 7);
									}
									else
									{
										if(#"hash_386af01523f194e5" == state_name)
										{
											player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 8);
										}
										else
										{
											if(#"hash_c5a40437efffe76" == state_name)
											{
												player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 9);
											}
											else
											{
												if(#"hash_88bd3835c23cdbc" == state_name)
												{
													player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 10);
												}
												else
												{
													if(#"hash_55e75da288d110d4" == state_name)
													{
														player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 11);
													}
													else
													{
														if(#"hash_3eb38ea38a92fe35" == state_name)
														{
															player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 12);
														}
														else
														{
															if(#"hash_79efd6a9d00cac13" == state_name)
															{
																player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 13);
															}
															else
															{
																/#
																	assertmsg("");
																#/
																/#
																#/
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	/*
		Name: function_ee0c7ef6
		Namespace: namespace_7c3faeda
		Checksum: 0x6BC84A3A
		Offset: 0x788
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_ee0c7ef6(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "SelectedInfiltration", value);
	}

}

#namespace incursion_infiltrationtitlecards;

/*
	Name: function_d3a6e728
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0x74DF4B8F
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d3a6e728()
{
	level notify(1626874287);
}

/*
	Name: register
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0xF05E4DD6
	Offset: 0x110
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_7c3faeda();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0xA4DF70D2
	Offset: 0x150
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0x2FDF789
	Offset: 0x190
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0xE6010A6A
	Offset: 0x1B8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_state
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0x77FA0285
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: function_ee0c7ef6
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0x87BB05AB
	Offset: 0x210
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ee0c7ef6(player, value)
{
	[[ self ]]->function_ee0c7ef6(player, value);
}

