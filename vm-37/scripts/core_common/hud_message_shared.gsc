#using script_6167e26342be354b;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace hud_message;

/*
	Name: __init__system__
	Namespace: hud_message
	Checksum: 0x7305E48A
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hud_message", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: hud_message
	Checksum: 0x8DA060DE
	Offset: 0xD8
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
}

/*
	Name: init
	Namespace: hud_message
	Checksum: 0x80F724D1
	Offset: 0x108
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: playnotifyloop
	Namespace: hud_message
	Checksum: 0xA3989269
	Offset: 0x118
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function playnotifyloop(duration)
{
	playnotifyloop = spawn("script_origin", (0, 0, 0));
	playnotifyloop playloopsound(#"uin_notify_data_loop");
	duration = duration - 4;
	if(duration < 1)
	{
		duration = 1;
	}
	wait(duration);
	playnotifyloop delete();
}

/*
	Name: setlowermessage
	Namespace: hud_message
	Checksum: 0x1960ADC8
	Offset: 0x1B8
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function setlowermessage(text, time)
{
	self notify(#"hash_6ceeeb477ece797b");
	if(isdefined(time) && time > 0)
	{
		self luinotifyevent(#"hash_424b9c54c8bf7a82", 2, text, int(time));
	}
	else
	{
		self luinotifyevent(#"hash_424b9c54c8bf7a82", 1, text);
	}
}

/*
	Name: clearlowermessage
	Namespace: hud_message
	Checksum: 0x544F7C1B
	Offset: 0x268
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function clearlowermessage()
{
	self endon(#"hash_6ceeeb477ece797b");
	if(!isplayer(self))
	{
		return;
	}
	self luinotifyevent(#"hash_6b9a1c6794314120");
}

/*
	Name: isintop
	Namespace: hud_message
	Checksum: 0x7745976B
	Offset: 0x2C8
	Size: 0x56
	Parameters: 2
	Flags: None
*/
function isintop(players, topn)
{
	for(i = 0; i < topn; i++)
	{
		if(isdefined(players[i]) && self == players[i])
		{
			return true;
		}
	}
	return false;
}

