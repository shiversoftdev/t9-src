#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_7c3faeda : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_7c3faeda
		Checksum: 0x768751FE
		Offset: 0x220
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
		Checksum: 0xE693214B
		Offset: 0x7B8
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
		Checksum: 0xA75DA1FC
		Offset: 0x2B8
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_7c3faeda
		Checksum: 0x7DB018E6
		Offset: 0x300
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_7c3faeda
		Checksum: 0x241D7C2B
		Offset: 0x240
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("Incursion_InfiltrationTitleCards");
		cluielem::add_clientfield("_state", 1, 4, "int");
		cluielem::add_clientfield("SelectedInfiltration", 1, 3, "int");
	}

	/*
		Name: set_state
		Namespace: namespace_7c3faeda
		Checksum: 0x28688F86
		Offset: 0x330
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
		Name: set_selectedinfiltration
		Namespace: namespace_7c3faeda
		Checksum: 0x3D5FAB1D
		Offset: 0x768
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_selectedinfiltration(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "SelectedInfiltration", value);
	}

}

#namespace incursion_infiltrationtitlecards;

/*
	Name: register
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0xC902D9A3
	Offset: 0xF0
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
	Checksum: 0x9E0FBA10
	Offset: 0x130
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
	Checksum: 0x43870681
	Offset: 0x170
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
	Checksum: 0xB2A10D20
	Offset: 0x198
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
	Checksum: 0x55ED6403
	Offset: 0x1C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: set_selectedinfiltration
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0xA5CF0AAB
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_selectedinfiltration(player, value)
{
	[[ self ]]->set_selectedinfiltration(player, value);
}

