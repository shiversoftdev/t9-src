#using scripts\weapons\weaponobjects.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace satchel_charge;

/*
	Name: init_shared
	Namespace: satchel_charge
	Checksum: 0x850AE6DD
	Offset: 0xC8
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
	Checksum: 0xB28126EA
	Offset: 0x158
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
	if(isdefined(self.weapon.customsettings))
	{
		var_966a1350 = getscriptbundle(self.weapon.customsettings);
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
	Checksum: 0x8EEDFE00
	Offset: 0x280
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
	Checksum: 0x6C4CD669
	Offset: 0x2E8
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

