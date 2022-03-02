#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace namespace_f0a1fe5c;

/*
	Name: function_d75f70a8
	Namespace: namespace_f0a1fe5c
	Checksum: 0xD9F7518B
	Offset: 0x188
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d75f70a8()
{
	level notify(90065527);
}

/*
	Name: function_89f2df9
	Namespace: namespace_f0a1fe5c
	Checksum: 0x3D771F33
	Offset: 0x1A8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_520d565ef38560b8", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_f0a1fe5c
	Checksum: 0xEB99893F
	Offset: 0x1F0
	Size: 0xF4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(is_true(getgametypesetting(#"hash_7e8e34cc69a77e0b")) || getdvarint(#"hash_40bd34b35079cf2e", 0) > 0)
	{
		zm_powerups::include_zombie_powerup("naughty_or_nice");
		if(zm_powerups::function_cc33adc8())
		{
			clientfield::register("scriptmover", "powerup_pickup_sequence", 1, 4, "int", &function_feb491ef, 0, 0);
			zm_powerups::add_zombie_powerup("naughty_or_nice", "powerup_naughty_or_nice");
		}
	}
}

/*
	Name: function_feb491ef
	Namespace: namespace_f0a1fe5c
	Checksum: 0xD731D261
	Offset: 0x2F0
	Size: 0x1C2
	Parameters: 7
	Flags: Linked
*/
function function_feb491ef(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_4cf2e329))
	{
		stopfx(fieldname, self.var_4cf2e329);
	}
	if(isdefined(bwastimejump))
	{
		switch(bwastimejump)
		{
			case 1:
			{
				self.var_4cf2e329 = playfx(fieldname, "maps/ltm/fx9_winter_powerup_nice", self.origin);
				break;
			}
			case 2:
			{
				self.var_4cf2e329 = playfx(fieldname, "maps/ltm/fx9_winter_powerup_naughty", self.origin);
				break;
			}
			case 3:
			{
				self.var_4cf2e329 = playfx(fieldname, "maps/ltm/fx9_winter_powerup_nice_final", self.origin);
				break;
			}
			case 4:
			{
				self.var_4cf2e329 = playfx(fieldname, "maps/ltm/fx9_winter_powerup_naughty_final", self.origin);
				break;
			}
			default:
			{
				if(isdefined(self.var_4cf2e329))
				{
					stopfx(fieldname, self.var_4cf2e329);
				}
				break;
			}
		}
	}
}

