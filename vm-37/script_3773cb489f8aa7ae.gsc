#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_e2ddd1d6;

/*
	Name: function_89f2df9
	Namespace: namespace_e2ddd1d6
	Checksum: 0xD38498D9
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_44c7c252cf328038", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e2ddd1d6
	Checksum: 0x58412130
	Offset: 0x138
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_cee10b49 = [];
	callback::on_localclient_connect(&on_localclient_connect);
}

/*
	Name: on_localclient_connect
	Namespace: namespace_e2ddd1d6
	Checksum: 0x5680C3A7
	Offset: 0x178
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private on_localclient_connect(localclientnum)
{
	if(is_true(getgametypesetting(#"hash_78bfea2b72e79da3")))
	{
		level thread function_53d906fd(localclientnum);
	}
}

/*
	Name: function_53d906fd
	Namespace: namespace_e2ddd1d6
	Checksum: 0xCB80242C
	Offset: 0x1D8
	Size: 0x2C4
	Parameters: 1
	Flags: Private
*/
function private function_53d906fd(localclientnum)
{
	while(true)
	{
		player = function_5c10bd79(localclientnum);
		playfx = 0;
		if(isdefined(player) && isalive(player))
		{
			vehicle = getplayervehicle(player);
			playfx = isdefined(vehicle) && vehicle.scriptvehicletype === "player_muscle";
		}
		foreach(stash in level.var_5862f2ce)
		{
			if(function_8a8a409b(stash))
			{
				if(stash.var_aa9f8f87 === #"hash_4bfbb656e63b17ae" || stash.var_aa9f8f87 === #"hash_1edbe1c283127e19")
				{
					stash function_e2d53ad5(localclientnum, playfx, function_ffdbe8c2(stash));
				}
			}
		}
		foreach(drop in level.var_624588d5)
		{
			if(isdefined(drop) && is_true(drop.var_3a55f5cf))
			{
				state = 0;
				if(drop getanimtime("p9_fxanim_mp_care_package_open_anim") > 0)
				{
					state = 2;
				}
				else if(drop getanimtime("p8_fxanim_wz_supply_stash_04_open_anim") > 0)
				{
					state = 1;
				}
				drop function_e2d53ad5(localclientnum, playfx, state);
			}
		}
		wait(0.2);
	}
}

/*
	Name: function_e2d53ad5
	Namespace: namespace_e2ddd1d6
	Checksum: 0x11A676B4
	Offset: 0x4A8
	Size: 0xAE
	Parameters: 3
	Flags: None
*/
function function_e2d53ad5(localclientnum, playfx, state)
{
	if(playfx && state == 0)
	{
		if(!isdefined(self.var_d3d42148))
		{
			self.var_d3d42148 = playfx(localclientnum, #"hash_6bcc939010112ea", self.origin);
		}
	}
	else if(isdefined(self.var_d3d42148))
	{
		stopfx(localclientnum, self.var_d3d42148);
		self.var_d3d42148 = undefined;
	}
}

