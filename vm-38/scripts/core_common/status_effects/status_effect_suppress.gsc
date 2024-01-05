#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect_suppress;

/*
	Name: function_3c512d0e
	Namespace: status_effect_suppress
	Checksum: 0x5EC0F7BD
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3c512d0e()
{
	level notify(-1534126129);
}

/*
	Name: __init__system__
	Namespace: status_effect_suppress
	Checksum: 0x7C0783BC
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_suppress", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_suppress
	Checksum: 0x6D1BF79C
	Offset: 0x120
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::register_status_effect_callback_apply(4, &suppress_apply);
	status_effect::function_5bae5120(4, &registersamanthas_bundle);
	status_effect::function_6f4eaf88(getstatuseffect("suppress"));
	serverfield::register("status_effect_suppress_field", 1, 5, "int", &function_aa232314);
	callback::on_spawned(&onplayerspawned);
}

/*
	Name: suppress_apply
	Namespace: status_effect_suppress
	Checksum: 0x66F0FC7F
	Offset: 0x1F0
	Size: 0x1C
	Parameters: 3
	Flags: Linked
*/
function suppress_apply(var_756fda07, weapon, applicant)
{
}

/*
	Name: registersamanthas_bundle
	Namespace: status_effect_suppress
	Checksum: 0x80F724D1
	Offset: 0x218
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function registersamanthas_bundle()
{
}

/*
	Name: function_aa232314
	Namespace: status_effect_suppress
	Checksum: 0x7F1E84C7
	Offset: 0x228
	Size: 0x2C6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_aa232314(oldval, newval)
{
	if(!isarray(level.players))
	{
		return;
	}
	if(oldval != newval)
	{
		if(newval)
		{
			self.var_dc148218 = 1;
			if(newval > 1)
			{
				var_4d81e7b4 = newval - 2;
				foreach(player in level.players)
				{
					if(!isdefined(player))
					{
						continue;
					}
					if(player getentitynumber() == var_4d81e7b4)
					{
						self.var_ead9cdbf = player;
						break;
					}
				}
			}
			var_2deafbea = function_1115bceb(#"suppress");
			self.var_14407070 = {};
			if(isdefined(var_2deafbea.var_b86e9a5e))
			{
				self playlocalsound(var_2deafbea.var_b86e9a5e);
			}
			if(isdefined(var_2deafbea.var_801118b0))
			{
				self playloopsound(var_2deafbea.var_801118b0);
				self.var_14407070.var_801118b0 = var_2deafbea.var_801118b0;
			}
			if(isdefined(var_2deafbea.var_36c77790))
			{
				self.var_14407070.var_36c77790 = var_2deafbea.var_36c77790;
			}
		}
		else
		{
			self.var_dc148218 = 0;
			self.var_ead9cdbf = undefined;
			if(isdefined(self.var_14407070) && isdefined(self.var_14407070.var_36c77790))
			{
				if(isplayer(self))
				{
					self playlocalsound(self.var_14407070.var_36c77790);
				}
			}
			if(isdefined(self.var_14407070) && isdefined(self.var_14407070.var_801118b0))
			{
				if(isplayer(self))
				{
					self stoploopsound(0.5);
				}
			}
			self.var_14407070 = undefined;
		}
	}
}

/*
	Name: onplayerspawned
	Namespace: status_effect_suppress
	Checksum: 0x848A9DD4
	Offset: 0x4F8
	Size: 0xE
	Parameters: 0
	Flags: Linked, Private
*/
function private onplayerspawned()
{
	self.var_dc148218 = 0;
}

