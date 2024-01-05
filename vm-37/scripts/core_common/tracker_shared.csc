#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace tracker;

/*
	Name: init_shared
	Namespace: tracker
	Checksum: 0xB9612A6C
	Offset: 0xC0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	registerclientfields();
	function_fa884ccf();
}

/*
	Name: registerclientfields
	Namespace: tracker
	Checksum: 0xCF0594DA
	Offset: 0xF0
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private registerclientfields()
{
	clientfield::register_clientuimodel("huditems.isExposedOnMinimap", #"hud_items", #"hash_1fe5d2b9e7136055", 1, 1, "int", undefined, 0, 0);
}

/*
	Name: function_fa884ccf
	Namespace: tracker
	Checksum: 0xC476604E
	Offset: 0x150
	Size: 0x110
	Parameters: 0
	Flags: None
*/
function function_fa884ccf()
{
	callback::on_localplayer_spawned(&on_player_spawned);
	var_5951c51b = getdvarint(#"hash_451ecc8708eb258d");
	level.var_5951c51b = (var_5951c51b > 0 ? var_5951c51b : 3);
	var_f2e5ae7 = getdvarint(#"hash_5b0b64262b06c91d");
	level.var_f2e5ae7 = (var_f2e5ae7 > 0 ? var_f2e5ae7 : 7500);
	var_5b162bc3 = getdvarint(#"hash_7ae43b6918bd9bac");
	level.var_5b162bc3 = (var_5b162bc3 > 0 ? var_5b162bc3 : 1000);
}

/*
	Name: on_player_spawned
	Namespace: tracker
	Checksum: 0x882AE7CD
	Offset: 0x268
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function on_player_spawned(localclientnum)
{
	if(!isbot(self))
	{
		self thread function_8c47bbe5(localclientnum);
	}
}

/*
	Name: function_dbd63244
	Namespace: tracker
	Checksum: 0x2F7C138F
	Offset: 0x2B0
	Size: 0x132
	Parameters: 0
	Flags: Private
*/
function private function_dbd63244()
{
	/#
		assert(isplayer(self));
	#/
	if(self function_da43934d())
	{
		return self geteye();
	}
	stance = self getstance();
	switch(stance)
	{
		case "prone":
		{
			return self.origin + vectorscale((0, 0, 1), 11);
		}
		case "crouch":
		{
			return self.origin + vectorscale((0, 0, 1), 40);
		}
		case "stand":
		{
			return self.origin + vectorscale((0, 0, 1), 60);
		}
		default:
		{
			return self.origin + vectorscale((0, 0, 1), 60);
		}
	}
}

/*
	Name: function_94f8b125
	Namespace: tracker
	Checksum: 0xAC30C91B
	Offset: 0x3F0
	Size: 0x6A
	Parameters: 0
	Flags: Private
*/
function private function_94f8b125()
{
	var_f2e5ae7 = level.var_f2e5ae7;
	currentweapon = self function_d2c2b168();
	if(isdefined(currentweapon.var_f2e5ae7) && currentweapon.var_f2e5ae7 > 0)
	{
		var_f2e5ae7 = currentweapon.var_f2e5ae7;
	}
	return var_f2e5ae7;
}

/*
	Name: function_ffea3e6b
	Namespace: tracker
	Checksum: 0xEAD74EA1
	Offset: 0x468
	Size: 0x122
	Parameters: 4
	Flags: Private
*/
function private function_ffea3e6b(localclientnum, var_18dd204e, spotter, target)
{
	if(!isdefined(spotter) || !isdefined(target))
	{
		return false;
	}
	if(!isplayer(spotter) || !isplayer(target))
	{
		return false;
	}
	if(!spotter hasperk(localclientnum, #"specialty_tracker"))
	{
		return false;
	}
	if(target hasperk(localclientnum, #"specialty_immunetrackerspotting"))
	{
		return false;
	}
	if(!isdefined(target.team) || var_18dd204e == target.team)
	{
		return false;
	}
	if(!isalive(spotter) || !isalive(target))
	{
		return false;
	}
	return true;
}

/*
	Name: function_c8ffa38a
	Namespace: tracker
	Checksum: 0x4683ED48
	Offset: 0x598
	Size: 0x280
	Parameters: 3
	Flags: Private
*/
function private function_c8ffa38a(spotter, target, var_5a527fb7)
{
	if(!isdefined(spotter) || !isdefined(target))
	{
		return false;
	}
	if(!isplayer(spotter) || !isplayer(target))
	{
		return false;
	}
	if(!is_true(spotter isplayerads()))
	{
		return false;
	}
	var_d2a509dc = spotter function_dbd63244();
	targeteye = target function_dbd63244();
	var_eb5ac886 = targeteye - var_d2a509dc;
	var_c384842d = lengthsquared(var_eb5ac886);
	if(var_c384842d > sqr(var_5a527fb7))
	{
		return false;
	}
	if(var_c384842d < 1)
	{
		return false;
	}
	var_fb9b3e7b = cos(level.var_5951c51b);
	var_4c94543b = spotter getplayerangles();
	var_fde76ebb = anglestoforward(var_4c94543b);
	var_56c587f1 = vectornormalize(var_eb5ac886);
	if(vectordot(var_fde76ebb, var_56c587f1) < var_fb9b3e7b)
	{
		return false;
	}
	trace = bullettrace(var_d2a509dc, targeteye, 1, spotter);
	if(trace[#"fraction"] === 1)
	{
		return true;
	}
	hitentity = trace[#"entity"];
	if(isdefined(hitentity) && hitentity == target)
	{
		target function_a4f246fb(level.var_5b162bc3);
	}
	return true;
}

/*
	Name: function_8c47bbe5
	Namespace: tracker
	Checksum: 0xCA46ECD
	Offset: 0x820
	Size: 0x23C
	Parameters: 1
	Flags: Private
*/
function private function_8c47bbe5(localclientnum)
{
	level endon(#"game_ended");
	self endon(#"disconnect", #"shutdown", #"death");
	self notify("2289f0e9cf025b40");
	self endon("2289f0e9cf025b40");
	while(true)
	{
		team = self.team;
		friendlies = getfriendlyplayers(localclientnum, team);
		foreach(spotter in friendlies)
		{
			if(!isdefined(spotter))
			{
				continue;
			}
			var_5a527fb7 = spotter function_94f8b125();
			targets = getenemyplayers(localclientnum, team, spotter.origin, var_5a527fb7);
			foreach(target in targets)
			{
				var_bc24f393 = 0;
				if(function_ffea3e6b(localclientnum, team, spotter, target))
				{
					if(function_c8ffa38a(spotter, target, var_5a527fb7))
					{
						var_bc24f393 = 1;
					}
					wait(0.05);
				}
			}
		}
		wait(0.25);
	}
}

