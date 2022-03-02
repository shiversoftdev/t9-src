#using scripts\core_common\clientfield_shared.csc;

#namespace hud;

/*
	Name: function_c2797a36
	Namespace: hud
	Checksum: 0xE00F0634
	Offset: 0x378
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c2797a36()
{
	level notify(309320966);
}

/*
	Name: function_9b9cecdf
	Namespace: hud
	Checksum: 0xFD25CE6E
	Offset: 0x398
	Size: 0x77C
	Parameters: 0
	Flags: None
*/
function function_9b9cecdf()
{
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionPassengerCount", #"hash_593f03dd48d5bc1f", #"hash_4686fa61f7f123ba", 1, 7, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.alivePlayerCount", #"hud_items", #"hash_660e10919fc3cb96", 1, 7, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.alivePlayerCountEnemy", #"hud_items", #"hash_3200ae248348b38a", 1, 7, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.aliveTeammateCount", #"hud_items", #"hash_23a0fd1ff456959", 1, 7, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.spectatorsCount", #"hud_items", #"hash_2821db97459aaa4a", 1, 7, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.playerKills", #"hud_items", #"playerkills", 1, 7, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.playerCleanUps", #"hud_items", #"hash_cb62c942965b99d", 1, 7, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("presence.modeparam", #"hash_3645501c8ba141af", #"hash_7347f20e8c2800c3", 1, 7, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.hasBackpack", #"hud_items", #"hash_3d621af88b5e463d", 1, 1, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.armorType", #"hud_items", #"hash_789d8c10ac21687c", 1, 2, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.streamerLoadFraction", #"hud_items", #"hash_7e7b0475689b500c", 1, 5, "float", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.wzLoadFinished", #"hud_items", #"hash_75d3a2a658cd9396", 1, 1, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.showReinsertionPassengerCount", #"hud_items", #"hash_5f5475b776cfc0cd", 1, 1, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.playerLivesRemaining", #"hud_items", #"hash_6dddb9a20d49665d", 7000, 4, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.playerCanRedeploy", #"hud_items", #"hash_116a728dee230334", 7000, 1, "int", undefined, 0, 0);
	clientfield::register("toplayer", "realtime_multiplay", 1, 1, "int", &function_a1b40aa4, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.collapse", #"hash_593f03dd48d5bc1f", #"collapse", 7000, 21, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.waveRespawnTimer", #"hash_593f03dd48d5bc1f", #"hash_14384be8ccdfdba9", 7000, 21, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.collapseIndex", #"hash_593f03dd48d5bc1f", #"hash_7ac8dd213b1f8d42", 1, 3, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.collapseCount", #"hash_593f03dd48d5bc1f", #"hash_28b490c7698f159d", 1, 3, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.reinsertionIndex", #"hash_593f03dd48d5bc1f", #"hash_61754d24cc2fb6c3", 1, 3, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.skydiveAltimeterVisible", #"hud_items", #"hash_4546996cf93b1697", 1, 1, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.skydiveAltimeterHeight", #"hash_410fe12a68d6e801", #"hash_34e492b27fa3f3dc", 1, 16, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.skydiveAltimeterSeaHeight", #"hash_410fe12a68d6e801", #"hash_7f022c556fec0bf9", 1, 16, "int", undefined, 0, 0);
}

/*
	Name: function_a1b40aa4
	Namespace: hud
	Checksum: 0x19966973
	Offset: 0xB20
	Size: 0xFC
	Parameters: 7
	Flags: None
*/
function function_a1b40aa4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	player = function_27673a7(binitialsnap);
	if(player != self)
	{
		return;
	}
	if(bwastimejump)
	{
		return;
	}
	if(!isplayer(player) || !isalive(player))
	{
		function_3f258626(binitialsnap);
		return;
	}
	if(fieldname == 1)
	{
		function_9e9a0604(binitialsnap);
	}
	else
	{
		function_3f258626(binitialsnap);
	}
}

