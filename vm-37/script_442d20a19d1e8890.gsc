#using scripts\core_common\lui_shared.csc;

class class_7c3faeda : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_7c3faeda
		Checksum: 0x76181CEA
		Offset: 0x380
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
		Checksum: 0x1C9DAA8
		Offset: 0x870
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
		Checksum: 0xF11E998F
		Offset: 0x4B0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_7c3faeda
		Checksum: 0x740BAEAC
		Offset: 0x420
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("Incursion_InfiltrationTitleCards");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_7c3faeda
		Checksum: 0x5C87082B
		Offset: 0x3A0
		Size: 0x74
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_f1385203)
	{
		namespace_6aaccc24::setup_clientfields("Incursion_InfiltrationTitleCards");
		namespace_6aaccc24::function_da693cbe("_state", 1, 4, "int");
		namespace_6aaccc24::function_da693cbe("SelectedInfiltration", 1, 3, "int", var_f1385203);
	}

	/*
		Name: set_state
		Namespace: namespace_7c3faeda
		Checksum: 0x242D7181
		Offset: 0x4E0
		Size: 0x34C
		Parameters: 2
		Flags: None
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->function_d7d2fcce(localclientnum, "_state", 0);
		}
		else
		{
			if(#"hash_1c7fa28cf1485078" == state_name)
			{
				[[ self ]]->function_d7d2fcce(localclientnum, "_state", 1);
			}
			else
			{
				if(#"hash_41af72ac3698f06f" == state_name)
				{
					[[ self ]]->function_d7d2fcce(localclientnum, "_state", 2);
				}
				else
				{
					if(#"hash_5b1f56f3d27d25f0" == state_name)
					{
						[[ self ]]->function_d7d2fcce(localclientnum, "_state", 3);
					}
					else
					{
						if(#"hash_249ee0339eddec66" == state_name)
						{
							[[ self ]]->function_d7d2fcce(localclientnum, "_state", 4);
						}
						else
						{
							if(#"hash_55a524ad199904e9" == state_name)
							{
								[[ self ]]->function_d7d2fcce(localclientnum, "_state", 5);
							}
							else
							{
								if(#"hash_37b2af92df0bfd42" == state_name)
								{
									[[ self ]]->function_d7d2fcce(localclientnum, "_state", 6);
								}
								else
								{
									if(#"hash_30029804cf01e828" == state_name)
									{
										[[ self ]]->function_d7d2fcce(localclientnum, "_state", 7);
									}
									else
									{
										if(#"hash_386af01523f194e5" == state_name)
										{
											[[ self ]]->function_d7d2fcce(localclientnum, "_state", 8);
										}
										else
										{
											if(#"hash_c5a40437efffe76" == state_name)
											{
												[[ self ]]->function_d7d2fcce(localclientnum, "_state", 9);
											}
											else
											{
												if(#"hash_88bd3835c23cdbc" == state_name)
												{
													[[ self ]]->function_d7d2fcce(localclientnum, "_state", 10);
												}
												else
												{
													if(#"hash_55e75da288d110d4" == state_name)
													{
														[[ self ]]->function_d7d2fcce(localclientnum, "_state", 11);
													}
													else
													{
														if(#"hash_3eb38ea38a92fe35" == state_name)
														{
															[[ self ]]->function_d7d2fcce(localclientnum, "_state", 12);
														}
														else
														{
															if(#"hash_79efd6a9d00cac13" == state_name)
															{
																[[ self ]]->function_d7d2fcce(localclientnum, "_state", 13);
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
		Checksum: 0xF7CC94A8
		Offset: 0x838
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_ee0c7ef6(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "SelectedInfiltration", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_7c3faeda
		Checksum: 0xB9C7AB9A
		Offset: 0x448
		Size: 0x60
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->function_d7d2fcce(localclientnum, "SelectedInfiltration", 0);
	}

}

#namespace incursion_infiltrationtitlecards;

/*
	Name: register
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0xBAE57830
	Offset: 0xE8
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
	Name: function_5c1bb138
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0x87F72BB3
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_7c3faeda();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0xC359A14B
	Offset: 0x2A8
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
	Checksum: 0x7498D461
	Offset: 0x2D0
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
	Checksum: 0x2E4503AC
	Offset: 0x2F8
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
	Checksum: 0x739748B1
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: function_ee0c7ef6
	Namespace: incursion_infiltrationtitlecards
	Checksum: 0x6CB8B387
	Offset: 0x350
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ee0c7ef6(localclientnum, value)
{
	[[ self ]]->function_ee0c7ef6(localclientnum, value);
}

