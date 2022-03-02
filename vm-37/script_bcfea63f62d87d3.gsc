#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_77b8863;

/*
	Name: main
	Namespace: namespace_77b8863
	Checksum: 0x155EE271
	Offset: 0x170
	Size: 0x5C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	clientfield::register("scriptmover", "towers_boss_dust_ball_fx", 1, getminbitcountfornum(4), "int", &function_72955447, 0, 0);
}

/*
	Name: function_72955447
	Namespace: namespace_77b8863
	Checksum: 0x778ED994
	Offset: 0x1D8
	Size: 0x19C
	Parameters: 7
	Flags: Linked
*/
function function_72955447(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.fx = util::playfxontag(fieldname, "maps/zm_towers/fx8_boss_attack_slam_trail_lg", self, "tag_origin");
	}
	else
	{
		if(bwastimejump == 2)
		{
			if(isdefined(self.fx))
			{
				stopfx(fieldname, self.fx);
			}
			self.fx = util::playfxontag(fieldname, "maps/zm_towers/fx8_boss_attack_slam_trail", self, "tag_origin");
		}
		else
		{
			if(bwastimejump == 3)
			{
				if(isdefined(self.fx))
				{
					stopfx(fieldname, self.fx);
				}
				self.fx = util::playfxontag(fieldname, "maps/zm_towers/fx8_boss_death_soul_trail", self, "tag_origin");
			}
			else if(isdefined(self.fx))
			{
				self.fx = util::playfxontag(fieldname, "maps/zm_towers/fx8_boss_attack_slam_trail_end", self, "tag_origin");
				stopfx(fieldname, self.fx);
			}
		}
	}
}

