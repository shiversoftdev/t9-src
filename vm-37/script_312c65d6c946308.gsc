#using scripts\core_common\struct.csc;

#namespace namespace_e86ffa8;

/*
	Name: function_e75318e9
	Namespace: namespace_e86ffa8
	Checksum: 0xC8198E62
	Offset: 0x68
	Size: 0x2FA
	Parameters: 1
	Flags: None
*/
function function_e75318e9(var_c1c9cf07)
{
	switch(var_c1c9cf07)
	{
		case "hash_47d7a8105237c88":
		case "hash_210097a75bb6c49a":
		case "hash_4110e6372aa77f7e":
		case "hash_51b6cc6dbafb7f31":
		case "hash_5930cf0eb070e35a":
		case "hash_602a1b6107105f07":
		case "hash_7f98b3dd3cce95aa":
		{
			return 0;
			break;
		}
		case "hash_afdc97f440fbcec":
		case "hash_17ccbaee64daa05b":
		case "hash_1f95b48e4a49df4a":
		case "hash_4110e6372aa77f7e":
		case "hash_504b41f717f8931a":
		case "hash_520b5db0216b778a":
		case "hash_79774556f321d921":
		{
			return 1;
			break;
		}
		case "hash_afdcc7f440fc205":
		case "hash_17ccbbee64daa20e":
		case "hash_1f95b38e4a49dd97":
		case "hash_4110e6372aa77f7e":
		case "hash_504b40f717f89167":
		case "hash_520b5cb0216b75d7":
		case "hash_79774256f321d408":
		{
			return 2;
			break;
		}
		case "hash_afdcb7f440fc052":
		case "hash_17ccbcee64daa3c1":
		case "hash_1f95b28e4a49dbe4":
		case "hash_4110e6372aa77f7e":
		case "hash_504b3ff717f88fb4":
		case "hash_520b5bb0216b7424":
		case "hash_79774356f321d5bb":
		{
			return 3;
			break;
		}
		case "hash_afdc67f440fb7d3":
		case "hash_17ccbdee64daa574":
		case "hash_1f95b18e4a49da31":
		case "hash_4110e6372aa77f7e":
		case "hash_504b3ef717f88e01":
		case "hash_520b5ab0216b7271":
		case "hash_79774856f321de3a":
		{
			return 4;
			break;
		}
		case "hash_afdc57f440fb620":
		case "hash_17ccbeee64daa727":
		case "hash_1f95b08e4a49d87e":
		case "hash_4110e6372aa77f7e":
		case "hash_504b3df717f88c4e":
		case "hash_520b59b0216b70be":
		case "hash_79774956f321dfed":
		{
			return 5;
			break;
		}
	}
}

/*
	Name: function_cde018a9
	Namespace: namespace_e86ffa8
	Checksum: 0x50069575
	Offset: 0x370
	Size: 0x2C2
	Parameters: 1
	Flags: None
*/
function function_cde018a9(var_c1c9cf07)
{
	switch(var_c1c9cf07)
	{
		case "hash_47d7a8105237c88":
		case "hash_afdc57f440fb620":
		case "hash_afdc67f440fb7d3":
		case "hash_afdc97f440fbcec":
		case "hash_afdcb7f440fc052":
		case "hash_afdcc7f440fc205":
		{
			return #"hash_47d7a8105237c88";
			break;
		}
		case "hash_504b3df717f88c4e":
		case "hash_504b3ef717f88e01":
		case "hash_504b3ff717f88fb4":
		case "hash_504b40f717f89167":
		case "hash_504b41f717f8931a":
		case "hash_7f98b3dd3cce95aa":
		{
			return #"hash_7f98b3dd3cce95aa";
			break;
		}
		case "hash_520b59b0216b70be":
		case "hash_520b5ab0216b7271":
		case "hash_520b5bb0216b7424":
		case "hash_520b5cb0216b75d7":
		case "hash_520b5db0216b778a":
		case "hash_5930cf0eb070e35a":
		{
			return #"hash_5930cf0eb070e35a";
			break;
		}
		case "hash_1f95b08e4a49d87e":
		case "hash_1f95b18e4a49da31":
		case "hash_1f95b28e4a49dbe4":
		case "hash_1f95b38e4a49dd97":
		case "hash_1f95b48e4a49df4a":
		case "hash_210097a75bb6c49a":
		{
			return #"hash_210097a75bb6c49a";
			break;
		}
		case "hash_17ccbaee64daa05b":
		case "hash_17ccbbee64daa20e":
		case "hash_17ccbcee64daa3c1":
		case "hash_17ccbdee64daa574":
		case "hash_17ccbeee64daa727":
		case "hash_602a1b6107105f07":
		{
			return #"hash_602a1b6107105f07";
			break;
		}
		case "hash_51b6cc6dbafb7f31":
		case "hash_79774256f321d408":
		case "hash_79774356f321d5bb":
		case "hash_79774556f321d921":
		case "hash_79774856f321de3a":
		case "hash_79774956f321dfed":
		{
			return #"hash_51b6cc6dbafb7f31";
			break;
		}
	}
}

/*
	Name: function_efb6dedf
	Namespace: namespace_e86ffa8
	Checksum: 0x5985A5CC
	Offset: 0x640
	Size: 0x1BC
	Parameters: 2
	Flags: None
*/
function function_efb6dedf(localclientnum, n_level)
{
	if(!isdefined(n_level))
	{
		n_level = 0;
	}
	if(self function_6c32d092(localclientnum, #"hash_520b59b0216b70be"))
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_520b5ab0216b7271") && n_level <= 4)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_520b5bb0216b7424") && n_level <= 3)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_520b5cb0216b75d7") && n_level <= 2)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_520b5db0216b778a") && n_level <= 1)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_5930cf0eb070e35a") && n_level == 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_3623f9d1
	Namespace: namespace_e86ffa8
	Checksum: 0xEF3D3E89
	Offset: 0x808
	Size: 0x1BC
	Parameters: 2
	Flags: None
*/
function function_3623f9d1(localclientnum, n_level)
{
	if(!isdefined(n_level))
	{
		n_level = 0;
	}
	if(self function_6c32d092(localclientnum, #"hash_17ccbeee64daa727"))
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_17ccbdee64daa574") && n_level <= 4)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_17ccbcee64daa3c1") && n_level <= 3)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_17ccbbee64daa20e") && n_level <= 2)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_17ccbaee64daa05b") && n_level <= 1)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_602a1b6107105f07") && n_level == 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_cd6787b
	Namespace: namespace_e86ffa8
	Checksum: 0xDCD96EB3
	Offset: 0x9D0
	Size: 0x1BC
	Parameters: 2
	Flags: Linked
*/
function function_cd6787b(localclientnum, n_level)
{
	if(!isdefined(n_level))
	{
		n_level = 0;
	}
	if(self function_6c32d092(localclientnum, #"hash_79774956f321dfed"))
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_79774856f321de3a") && n_level <= 4)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_79774356f321d5bb") && n_level <= 3)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_79774256f321d408") && n_level <= 2)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_79774556f321d921") && n_level <= 1)
	{
		return true;
	}
	if(self function_6c32d092(localclientnum, #"hash_51b6cc6dbafb7f31") && n_level == 0)
	{
		return true;
	}
	return false;
}

