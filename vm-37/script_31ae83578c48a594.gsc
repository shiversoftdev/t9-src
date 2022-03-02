#using script_3c362258ff800237;
#using script_4c875fef517e2061;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm.csc;

#namespace namespace_5507dc3;

/*
	Name: function_89f2df9
	Namespace: namespace_5507dc3
	Checksum: 0xE2E63F4D
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6eed28033e443596", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5507dc3
	Checksum: 0x9E96F7F8
	Offset: 0xC8
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_5d3b4424c6d47835", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_5507dc3
	Checksum: 0x3DC4F60D
	Offset: 0x130
	Size: 0x2C
	Parameters: 2
	Flags: Private
*/
function private function_d1de6a85(local_client_num, params)
{
	level thread function_40349f7c();
}

/*
	Name: function_40349f7c
	Namespace: namespace_5507dc3
	Checksum: 0xAC163EE0
	Offset: 0x168
	Size: 0x1B0
	Parameters: 1
	Flags: None
*/
function function_40349f7c(localclientnum)
{
	level endon(#"hash_38932f8deb28b470", #"end_game");
	wait(12);
	level.var_dc60105c = 1;
	maxclients = getmaxlocalclients();
	for(localclientnum = 0; localclientnum < maxclients; localclientnum++)
	{
		if(isdefined(function_5c10bd79(localclientnum)))
		{
			foreach(player in getplayers(localclientnum))
			{
				player zm::function_92f0c63(localclientnum);
			}
			foreach(player in getplayers(localclientnum))
			{
				player namespace_e1e7cabf::function_25410869(localclientnum);
			}
		}
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_5507dc3
	Checksum: 0xACA89213
	Offset: 0x320
	Size: 0x198
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(local_client_num)
{
	level notify(#"hash_38932f8deb28b470");
	level.var_dc60105c = undefined;
	maxclients = getmaxlocalclients();
	for(localclientnum = 0; localclientnum < maxclients; localclientnum++)
	{
		if(isdefined(function_5c10bd79(localclientnum)))
		{
			foreach(player in getplayers(localclientnum))
			{
				player zm::function_92f0c63(localclientnum);
			}
			foreach(player in getplayers(localclientnum))
			{
				player namespace_e1e7cabf::function_25410869(localclientnum);
			}
		}
	}
}

