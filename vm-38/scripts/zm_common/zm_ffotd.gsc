#using script_3f9e0dc8454d98e1;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_ffotd;

/*
	Name: function_8e970a77
	Namespace: zm_ffotd
	Checksum: 0xADBC81AF
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8e970a77()
{
	level notify(1650629155);
}

/*
	Name: main_start
	Namespace: zm_ffotd
	Checksum: 0x80F724D1
	Offset: 0xA0
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
	Offset: 0xB0
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
	Checksum: 0xAED2E785
	Offset: 0xC0
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

