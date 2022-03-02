#using script_64ac23dbb2d7d587;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace satchel_charge;

/*
	Name: function_ddb49059
	Namespace: satchel_charge
	Checksum: 0x12FC67A0
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ddb49059()
{
	level notify(231808013);
}

/*
	Name: init_shared
	Namespace: satchel_charge
	Checksum: 0xF3B6ED5F
	Offset: 0xE8
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function init_shared(localclientnum)
{
	callback::add_weapon_type(#"satchel_charge", &satchel_spawned);
	clientfield::register("missile", "satchelChargeWarning", 1, 1, "int", &function_e402bf2c, 0, 0);
}

/*
	Name: satchel_spawned
	Namespace: satchel_charge
	Checksum: 0xD72351D0
	Offset: 0x178
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function satchel_spawned(localclientnum)
{
	self endon(#"death");
	if(self isgrenadedud())
	{
		return;
	}
	self util::waittill_dobj(localclientnum);
	if(isdefined(self.weapon.var_4dd46f8a))
	{
		var_966a1350 = getscriptbundle(self.weapon.var_4dd46f8a);
		self.var_966a1350 = var_966a1350;
		if(isdefined(var_966a1350.var_b941081f) && isdefined(var_966a1350.var_40772cbe))
		{
			self.light_fx = util::playfxontag(localclientnum, var_966a1350.var_b941081f, self, var_966a1350.var_40772cbe);
		}
	}
	if(self.owner == function_5c10bd79(localclientnum))
	{
		self thread function_fab88840(localclientnum);
	}
}

/*
	Name: function_fab88840
	Namespace: satchel_charge
	Checksum: 0xF9217981
	Offset: 0x2A0
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fab88840(localclientnum)
{
	function_c6ab0456(localclientnum, 1, 1);
	self waittill(#"death");
	function_c6ab0456(localclientnum, 1, 0);
}

/*
	Name: function_e402bf2c
	Namespace: satchel_charge
	Checksum: 0x864F2D30
	Offset: 0x308
	Size: 0x14E
	Parameters: 7
	Flags: Linked
*/
function function_e402bf2c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify("5ec15ced9ad90575");
	self endon("5ec15ced9ad90575");
	self endon(#"death");
	if(bwastimejump == 1)
	{
		self util::waittill_dobj(fieldname);
		if(isdefined(self.var_966a1350.var_b941081f) && isdefined(self.var_966a1350.var_40772cbe))
		{
			while(isdefined(self))
			{
				if(isdefined(self.light_fx))
				{
					stopfx(fieldname, self.light_fx);
				}
				level waittilltimeout(0.1, #"player_switch");
				self.light_fx = util::playfxontag(fieldname, self.var_966a1350.var_b941081f, self, self.var_966a1350.var_40772cbe);
			}
		}
	}
}

