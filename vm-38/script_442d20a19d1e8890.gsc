#using scripts\core_common\lui_shared.csc;

class class_7c3faeda : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_7c3faeda
		Checksum: 0x71617B1E
		Offset: 0x3A0
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
		Checksum: 0xE1C3639E
		Offset: 0x890
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
		Checksum: 0x444082BB
		Offset: 0x4D0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: namespace_7c3faeda
		Checksum: 0x8E16E15A
		Offset: 0x440
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("Incursion_InfiltrationTitleCards");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_7c3faeda
		Checksum: 0xBED1E8DE
		Offset: 0x3C0
		Size: 0x74
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_f1385203)
	{
		cluielem::setup_clientfields("Incursion_InfiltrationTitleCards");
		cluielem::add_clientfield("_state", 1, 4, "int");
		cluielem::add_clientfield("SelectedInfiltration", 1, 3, "int", var_f1385203);
	}

	/*
		Name: set_state
		Namespace: namespace_7c3faeda
		Checksum: 0x3DBB2774
		Offset: 0x500
		Size: 0x34C
		Parameters: 2
		Flags: None
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->set_data(localclientnum, "_state", 0);
		}
		else
		{
			if(#"hash_1c7fa28cf1485078" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				if(#"hash_41af72ac3698f06f" == state_name)
				{
					[[ self ]]->set_data(localclientnum, "_state", 2);
				}
				else
				{
					if(#"hash_5b1f56f3d27d25f0" == state_name)
					{
						[[ self ]]->set_data(localclientnum, "_state", 3);
					}
					else
					{
						if(#"hash_249ee0339eddec66" == state_name)
						{
							[[ self ]]->set_data(localclientnum, "_state", 4);
						}
						else
						{
							if(#"hash_55a524ad199904e9" == state_name)
							{
								[[ self ]]->set_data(localclientnum, "_state", 5);
							}
							else
							{
								if(#"hash_37b2af92df0bfd42" == state_name)
								{
									[[ self ]]->set_data(localclientnum, "_state", 6);
								}
								else
								{
									if(#"hash_30029804cf01e828" == state_name)
									{
										[[ self ]]->set_data(localclientnum, "_state", 7);
									}
									else
									{
										if(#"hash_386af01523f194e5" == state_name)
										{
											[[ self ]]->set_data(localclientnum, "_state", 8);
										}
										else
										{
											if(#"hash_c5a40437efffe76" == state_name)
											{
												[[ self ]]->set_data(localclientnum, "_state", 9);
											}
											else
											{
												if(#"hash_88bd3835c23cdbc" == state_name)
												{
													[[ self ]]->set_data(localclientnum, "_state", 10);
												}
												else
												{
													if(#"hash_55e75da288d110d4" == state_name)
													{
														[[ self ]]->set_data(localclientnum, "_state", 11);
													}
													else
													{
														if(#"hash_3eb38ea38a92fe35" == state_name)
														{
															[[ self ]]->set_data(localclientnum, "_state", 12);
														}
														else
														{
															if(#"hash_79efd6a9d00cac13" == state_name)
															{
																[[ self ]]->set_data(localclientnum, "_state", 13);
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
		Checksum: 0x1AFCBB04
		Offset: 0x858
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_selectedinfiltration(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "SelectedInfiltration", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_7c3faeda
		Checksum: 0xE3958547
		Offset: 0x468
		Size: 0x60
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->set_data(localclientnum, "SelectedInfiltration", 0);
	}

}

#namespace incursion_infiltrationtitlecards;

/*
	Name: function_824c8807
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0x2D94CFCE
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_824c8807()
{
	level notify(811443196);
}

/*
	Name: register
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0xCCFCE999
	Offset: 0x108
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_f1385203)
{
	elem = new class_7c3faeda();
	[[ elem ]]->setup_clientfields(var_f1385203);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"incursion_infiltrationtitlecards"]))
	{
		level.var_ae746e8f[#"incursion_infiltrationtitlecards"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"incursion_infiltrationtitlecards"]))
	{
		level.var_ae746e8f[#"incursion_infiltrationtitlecards"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"incursion_infiltrationtitlecards"]))
	{
		level.var_ae746e8f[#"incursion_infiltrationtitlecards"] = array(level.var_ae746e8f[#"incursion_infiltrationtitlecards"]);
	}
	level.var_ae746e8f[#"incursion_infiltrationtitlecards"][level.var_ae746e8f[#"incursion_infiltrationtitlecards"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0x944F6941
	Offset: 0x288
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_7c3faeda();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0x4DA297E1
	Offset: 0x2C8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0xC510C8A8
	Offset: 0x2F0
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
	Checksum: 0xE65CAC88
	Offset: 0x318
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_state
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0x4CD5A38B
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_selectedinfiltration
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0x13785C9F
	Offset: 0x370
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_selectedinfiltration(localclientnum, value)
{
	[[ self ]]->set_selectedinfiltration(localclientnum, value);
}

