#using scripts\core_common\struct.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace battlechatter;

/*
	Name: function_b59a25c5
	Namespace: battlechatter
	Checksum: 0x33C043EE
	Offset: 0xF0
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function function_b59a25c5(player)
{
	if(!is_true(level.var_e444d44))
	{
		return undefined;
	}
	playerbundle = function_58c93260(player);
	if(!isdefined(playerbundle))
	{
		return undefined;
	}
	return playerbundle.voiceprefix;
}

/*
	Name: function_cdd81094
	Namespace: battlechatter
	Checksum: 0xE92CAFE5
	Offset: 0x158
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_cdd81094(weapon)
{
	if(!is_true(level.var_e444d44))
	{
		return undefined;
	}
	/#
		assert(isdefined(weapon));
	#/
	if(!isdefined(weapon.var_5c238c21))
	{
		return undefined;
	}
	return getscriptbundle(weapon.var_5c238c21);
}

/*
	Name: function_b79dc4e7
	Namespace: battlechatter
	Checksum: 0x8F09F2BF
	Offset: 0x1D8
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function function_b79dc4e7(player)
{
	teammask = getteammask(player.team);
	teamindex = 0;
	while(teammask > 1)
	{
		teammask = teammask >> 1;
		teamindex++;
	}
	if(teamindex % 2)
	{
		return "blops_taacom";
	}
	return "cdp_taacom";
}

/*
	Name: mpdialog_value
	Namespace: battlechatter
	Checksum: 0x59613FD3
	Offset: 0x260
	Size: 0x9E
	Parameters: 2
	Flags: Linked
*/
function mpdialog_value(mpdialogkey, defaultvalue)
{
	if(!isdefined(mpdialogkey))
	{
		return defaultvalue;
	}
	if(!is_true(level.var_e444d44))
	{
		return defaultvalue;
	}
	mpdialog = getscriptbundle("mpdialog_default");
	if(!isdefined(mpdialog))
	{
		return defaultvalue;
	}
	structvalue = mpdialog.(mpdialogkey);
	if(!isdefined(structvalue))
	{
		return defaultvalue;
	}
	return structvalue;
}

/*
	Name: function_d804d2f0
	Namespace: battlechatter
	Checksum: 0x6DDEB08F
	Offset: 0x308
	Size: 0x16E
	Parameters: 4
	Flags: Linked
*/
function function_d804d2f0(localclientnum, speakingplayer, player, allyradiussq)
{
	if(!is_true(level.var_e444d44))
	{
		return false;
	}
	if(!isdefined(player))
	{
		return false;
	}
	if(!isdefined(player.origin))
	{
		return false;
	}
	if(!isalive(player))
	{
		return false;
	}
	if(player underwater())
	{
		return false;
	}
	if(player isdriving(localclientnum))
	{
		return false;
	}
	if(function_e75c64a4(localclientnum))
	{
		return false;
	}
	if(!isdefined(speakingplayer))
	{
		return false;
	}
	if(!isdefined(speakingplayer.origin))
	{
		return false;
	}
	if(player == speakingplayer || player.team != speakingplayer.team)
	{
		return false;
	}
	if(player hasperk(localclientnum, "specialty_quieter"))
	{
		return false;
	}
	distsq = distancesquared(speakingplayer.origin, player.origin);
	if(distsq > allyradiussq)
	{
		return false;
	}
	return true;
}

/*
	Name: function_db89c38f
	Namespace: battlechatter
	Checksum: 0x9C321325
	Offset: 0x480
	Size: 0x13A
	Parameters: 3
	Flags: Linked
*/
function function_db89c38f(localclientnum, speakingplayer, allyradiussq)
{
	if(!is_true(level.var_e444d44))
	{
		return undefined;
	}
	allies = [];
	foreach(player in getplayers(localclientnum))
	{
		if(!function_d804d2f0(localclientnum, speakingplayer, player, allyradiussq))
		{
			continue;
		}
		allies[allies.size] = player;
	}
	allies = arraysort(allies, speakingplayer.origin);
	if(!isdefined(allies) || allies.size == 0)
	{
		return undefined;
	}
	return allies[0];
}

/*
	Name: function_5d7ad9a9
	Namespace: battlechatter
	Checksum: 0x22614D3B
	Offset: 0x5C8
	Size: 0xBA
	Parameters: 2
	Flags: Linked
*/
function function_5d7ad9a9(hacker, originalowner)
{
	if(!is_true(level.var_e444d44))
	{
		return false;
	}
	if(!isdefined(originalowner) || !isplayer(originalowner) || !originalowner function_21c0fa55())
	{
		return false;
	}
	if(!isdefined(hacker) || !isplayer(hacker) || !isalive(hacker))
	{
		return false;
	}
	return true;
}

/*
	Name: function_84eb6127
	Namespace: battlechatter
	Checksum: 0x5F2C9183
	Offset: 0x690
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_84eb6127(player)
{
	if(!is_true(level.var_e444d44))
	{
		return undefined;
	}
	return getscriptbundle(function_b79dc4e7(player));
}

/*
	Name: get_player_dialog_alias
	Namespace: battlechatter
	Checksum: 0x346BB63
	Offset: 0x6F0
	Size: 0x142
	Parameters: 2
	Flags: Linked
*/
function get_player_dialog_alias(dialogkey, meansofdeath)
{
	if(!isdefined(meansofdeath))
	{
		meansofdeath = undefined;
	}
	if(!is_true(level.var_e444d44))
	{
		return undefined;
	}
	if(!isdefined(self))
	{
		return undefined;
	}
	if(is_true(self.var_f16a71ae))
	{
		return undefined;
	}
	bundlename = self getmpdialogname();
	if(isdefined(meansofdeath) && meansofdeath == "MOD_META" && (isdefined(self.pers[#"changed_specialist"]) ? self.pers[#"changed_specialist"] : 0))
	{
		bundlename = self.var_89c4a60f;
	}
	if(!isdefined(bundlename))
	{
		return undefined;
	}
	playerbundle = getscriptbundle(bundlename);
	if(!isdefined(playerbundle))
	{
		return undefined;
	}
	return get_dialog_bundle_alias(playerbundle, dialogkey);
}

/*
	Name: get_dialog_bundle_alias
	Namespace: battlechatter
	Checksum: 0xDCEA9A23
	Offset: 0x840
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function get_dialog_bundle_alias(dialogbundle, dialogkey)
{
	if(!is_true(level.var_e444d44))
	{
		return undefined;
	}
	if(!isdefined(dialogbundle) || !isdefined(dialogkey))
	{
		return undefined;
	}
	dialogalias = dialogbundle.(dialogkey);
	if(!isdefined(dialogalias))
	{
		return;
	}
	voiceprefix = dialogbundle.("voiceprefix");
	if(isdefined(voiceprefix))
	{
		dialogalias = voiceprefix + dialogalias;
	}
	return dialogalias;
}

/*
	Name: delete_after
	Namespace: battlechatter
	Checksum: 0x559F2C60
	Offset: 0x8E8
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function delete_after(waittime)
{
	wait(waittime);
	self delete();
}

/*
	Name: function_58c93260
	Namespace: battlechatter
	Checksum: 0xEAE32386
	Offset: 0x918
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function function_58c93260(player)
{
	if(!is_true(level.var_e444d44))
	{
		return undefined;
	}
	if(!isplayer(player))
	{
		return undefined;
	}
	bundlename = player getmpdialogname();
	if(!isdefined(bundlename))
	{
		return undefined;
	}
	return getscriptbundle(bundlename);
}

