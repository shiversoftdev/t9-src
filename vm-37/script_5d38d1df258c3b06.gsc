#using script_240ef62ff60b2694;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_7c1d0bac;

/*
	Name: function_89f2df9
	Namespace: namespace_7c1d0bac
	Checksum: 0x6661674A
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5fe7a854b630ef02", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_7c1d0bac
	Checksum: 0x1CF3A397
	Offset: 0x128
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "player_hit_freezing_snowball", 9000, 1, "int", undefined, 0, 0);
	clientfield::register("toplayer", "player_hit_snowball_direction", 9000, 4, "int", undefined, 0, 0);
	callback::on_localclient_connect(&on_localclient_connect);
}

/*
	Name: on_localclient_connect
	Namespace: namespace_7c1d0bac
	Checksum: 0xC2C2AE0D
	Offset: 0x1C8
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function on_localclient_connect(localclientnum)
{
	if((isdefined(getgametypesetting(#"hash_7e8e34cc69a77e0b")) ? getgametypesetting(#"hash_7e8e34cc69a77e0b") : 0))
	{
		level thread function_b6992be(localclientnum);
	}
}

/*
	Name: function_b6992be
	Namespace: namespace_7c1d0bac
	Checksum: 0xCDF2A077
	Offset: 0x248
	Size: 0x5DC
	Parameters: 1
	Flags: Linked
*/
function function_b6992be(localclientnum)
{
	var_d5823792 = 0;
	while(true)
	{
		local_player = function_5c10bd79(localclientnum);
		if(isdefined(local_player))
		{
			var_965f0bef = local_player clientfield::get_to_player("player_hit_freezing_snowball");
			if(var_965f0bef === 1 && !var_d5823792)
			{
				var_d5823792 = 1;
				local_player thread postfx::playpostfxbundle(#"pstfx_wz_snowball_hit");
				waitframe(1);
				if(!isdefined(local_player))
				{
					return;
				}
				var_494e2f9b = local_player clientfield::get_to_player("player_hit_snowball_direction");
				switch(var_494e2f9b)
				{
					case 1:
					{
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed832b7781cf8", 0);
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed932b7781eab", 0);
						break;
					}
					case 2:
					{
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed832b7781cf8", -1);
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed932b7781eab", 0);
						break;
					}
					case 3:
					{
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed832b7781cf8", 1);
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed932b7781eab", 0);
						break;
					}
					case 4:
					{
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed832b7781cf8", 0);
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed932b7781eab", -1);
						break;
					}
					case 5:
					{
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed832b7781cf8", 0);
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed932b7781eab", 1);
						break;
					}
					case 6:
					{
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed832b7781cf8", -1);
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed932b7781eab", -1);
						break;
					}
					case 8:
					{
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed832b7781cf8", 1);
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed932b7781eab", -1);
						break;
					}
					case 9:
					{
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed832b7781cf8", -1);
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed932b7781eab", 1);
						break;
					}
					case 10:
					{
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed832b7781cf8", 1);
						local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"hash_638ed932b7781eab", 1);
						break;
					}
				}
			}
			else if(var_965f0bef === 0 && var_d5823792)
			{
				var_d5823792 = 0;
				if(local_player postfx::function_556665f2(#"pstfx_wz_snowball_hit"))
				{
					local_player thread postfx::exitpostfxbundle(#"pstfx_wz_snowball_hit");
				}
			}
		}
		else
		{
			return;
		}
		waitframe(1);
	}
}

