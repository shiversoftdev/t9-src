#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace zm_demo;

/*
	Name: function_39309695
	Namespace: zm_demo
	Checksum: 0xAFDB0A54
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_39309695()
{
	level notify(720480464);
}

/*
	Name: function_89f2df9
	Namespace: zm_demo
	Checksum: 0x1587160E
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_demo", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_demo
	Checksum: 0xF12C2DE1
	Offset: 0x130
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(isdemoplaying())
	{
		if(!isdefined(level.demolocalclients))
		{
			level.demolocalclients = [];
		}
		callback::on_localclient_connect(&player_on_connect);
	}
}

/*
	Name: player_on_connect
	Namespace: zm_demo
	Checksum: 0x35966292
	Offset: 0x190
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function player_on_connect(localclientnum)
{
	level thread watch_predicted_player_changes(localclientnum);
}

/*
	Name: watch_predicted_player_changes
	Namespace: zm_demo
	Checksum: 0xDCC83561
	Offset: 0x1C0
	Size: 0x278
	Parameters: 1
	Flags: Linked
*/
function watch_predicted_player_changes(localclientnum)
{
	level.demolocalclients[localclientnum] = spawnstruct();
	level.demolocalclients[localclientnum].nonpredicted_local_player = function_27673a7(localclientnum);
	level.demolocalclients[localclientnum].predicted_local_player = function_5c10bd79(localclientnum);
	while(true)
	{
		nonpredicted_local_player = function_27673a7(localclientnum);
		predicted_local_player = function_5c10bd79(localclientnum);
		if(nonpredicted_local_player !== level.demolocalclients[localclientnum].nonpredicted_local_player)
		{
			level notify(#"demo_nplplayer_change", localclientnum, {#new_player:nonpredicted_local_player, #hash_fb9ab71:level.demolocalclients[localclientnum].nonpredicted_local_player});
			level notify("demo_nplplayer_change" + localclientnum, {#new_player:nonpredicted_local_player, #hash_fb9ab71:level.demolocalclients[localclientnum].nonpredicted_local_player});
			level.demolocalclients[localclientnum].nonpredicted_local_player = nonpredicted_local_player;
		}
		if(predicted_local_player !== level.demolocalclients[localclientnum].predicted_local_player)
		{
			level notify(#"demo_plplayer_change", {#new_player:predicted_local_player, #hash_fb9ab71:level.demolocalclients[localclientnum].predicted_local_player, #localclientnum:localclientnum});
			level notify("demo_plplayer_change" + localclientnum, {#new_player:predicted_local_player, #hash_fb9ab71:level.demolocalclients[localclientnum].predicted_local_player});
			level.demolocalclients[localclientnum].predicted_local_player = predicted_local_player;
		}
		waitframe(1);
	}
}

