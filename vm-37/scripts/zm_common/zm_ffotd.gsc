#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_ffotd;

/*
	Name: main_start
	Namespace: zm_ffotd
	Checksum: 0x80F724D1
	Offset: 0x80
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function main_start()
{
}

/*
	Name: main_end
	Namespace: zm_ffotd
	Checksum: 0x80F724D1
	Offset: 0x90
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function main_end()
{
}

/*
	Name: optimize_for_splitscreen
	Namespace: zm_ffotd
	Checksum: 0x85FD3C49
	Offset: 0xA0
	Size: 0x68
	Parameters: 0
	Flags: None
*/
function optimize_for_splitscreen()
{
	if(!isdefined(level.var_58def399))
	{
		level.var_58def399 = 3;
	}
	if(level.var_58def399)
	{
		if(getdvarint(#"splitscreen_playercount", 0) >= level.var_58def399)
		{
			return true;
		}
	}
	return false;
}

