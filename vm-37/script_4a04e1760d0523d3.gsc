#using scripts\core_common\struct.csc;
#using script_2b1dbe0f618068f7;
#using scripts\core_common\throttle_shared.csc;
#using script_3d0f36632dad12df;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_b77e8eb1;

/*
	Name: init
	Namespace: namespace_b77e8eb1
	Checksum: 0xD66AF852
	Offset: 0x170
	Size: 0x1D4
	Parameters: 0
	Flags: None
*/
function init()
{
	level.var_cd139dc0 = max((isdefined(getgametypesetting(#"hash_7f837b709840950")) ? getgametypesetting(#"hash_7f837b709840950") : 1), 1) * 100;
	level.var_60693fca = (isdefined(getgametypesetting(#"hash_37aefeabeef0ec6c")) ? getgametypesetting(#"hash_37aefeabeef0ec6c") : 0) * 100;
	clientfield::register("scriptmover", "ftdb_zoneCircle", 1, 3, "int", &function_f4d234f9, 0, 0);
	clientfield::register("scriptmover", "zoneNearOOB", 1, 1, "int", &function_b315a5d2, 0, 0);
	if(!isdefined(level.var_cfdf3928))
	{
		level.var_99266dd4 = new class_c6c0e94();
		[[ level.var_99266dd4 ]]->initialize("radiation_compass", 1, 0.016);
	}
	level.circleradius = 800;
	level.var_53b9c763 = [];
}

/*
	Name: function_f4d234f9
	Namespace: namespace_b77e8eb1
	Checksum: 0xD9C881B2
	Offset: 0x350
	Size: 0x27C
	Parameters: 7
	Flags: Private
*/
function private function_f4d234f9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify(#"hash_41a7922ed68f0877");
	if(bwastimejump == 3)
	{
		compassicon = "ui_icon_minimap_radiation_intensity_3";
		self setcompassicon(compassicon);
		self function_811196d1(0);
		self function_60212003(0);
		self function_a5edb367(#"neutral");
		self function_5e00861(level.var_60693fca * 2, 1);
		level thread function_81784679(self, fieldname);
	}
	else
	{
		if(bwastimejump == 4)
		{
			self function_1cfa2520(fieldname);
		}
		else
		{
			if(bwastimejump > 0)
			{
				self function_6856257d(fieldname);
				compassicon = "ui_icon_minimap_radiation_cloud";
				self setcompassicon(compassicon);
				self function_811196d1(0);
				self function_95bc465d(1);
				self function_60212003(0);
				self function_ce541a6(1);
				if(bwastimejump == 1)
				{
					self thread function_1ef0dbb2();
				}
				else if(bwastimejump == 2)
				{
					self function_bc95cd57(1);
					self thread function_88008fc3();
				}
				level thread function_81784679(self, fieldname);
			}
			else
			{
				self function_811196d1(1);
			}
		}
	}
}

/*
	Name: function_b315a5d2
	Namespace: namespace_b77e8eb1
	Checksum: 0xC1201C48
	Offset: 0x5D8
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function function_b315a5d2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_9d2cc70(1);
	}
	else
	{
		self function_9d2cc70(0);
	}
}

/*
	Name: function_6856257d
	Namespace: namespace_b77e8eb1
	Checksum: 0xE9D4A1B8
	Offset: 0x658
	Size: 0xCC
	Parameters: 1
	Flags: Private
*/
function private function_6856257d(localclientnum)
{
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.zonefx))
	{
		return;
	}
	if(!squad_spawn::function_21b773d5(localclientnum))
	{
		self.zonefx = playfx(localclientnum, "wz/fx9_dirtybomb_radiation_zone", self.origin + vectorscale((0, 0, 1), 80));
	}
	else
	{
		self.zonefx = playfx(localclientnum, "wz/fx9_dirtybomb_radiation_zone_spawn", self.origin + vectorscale((0, 0, 1), 80));
	}
	level.var_53b9c763[self.zonefx] = self;
}

/*
	Name: function_1cfa2520
	Namespace: namespace_b77e8eb1
	Checksum: 0xAB8B9FE0
	Offset: 0x730
	Size: 0x7E
	Parameters: 1
	Flags: Private
*/
function private function_1cfa2520(localclientnum)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.zonefx))
	{
		return;
	}
	level.var_53b9c763[self.zonefx] = undefined;
	arrayremovevalue(level.var_53b9c763, undefined);
	stopfx(localclientnum, self.zonefx);
	self.zonefx = undefined;
}

/*
	Name: function_1ef0dbb2
	Namespace: namespace_b77e8eb1
	Checksum: 0xC021362D
	Offset: 0x7B8
	Size: 0x148
	Parameters: 0
	Flags: Private
*/
function private function_1ef0dbb2()
{
	self endon(#"death", #"hash_41a7922ed68f0877");
	while(isdefined(self) && isdefined(self.scale))
	{
		if(!isdefined(level.circleradius) || (!(isint(level.circleradius) || isfloat(level.circleradius))))
		{
			waitframe(1);
			continue;
		}
		if(!isdefined(self.scale) || (!(isint(self.scale) || isfloat(self.scale))))
		{
			waitframe(1);
			continue;
		}
		compassscale = (level.circleradius * self.scale) * 3;
		self function_5e00861(compassscale, 1);
		[[ level.var_99266dd4 ]]->waitinqueue(self);
	}
}

/*
	Name: function_88008fc3
	Namespace: namespace_b77e8eb1
	Checksum: 0x642EEDBA
	Offset: 0x908
	Size: 0x90
	Parameters: 0
	Flags: Private
*/
function private function_88008fc3()
{
	self endon(#"death", #"hash_41a7922ed68f0877");
	while(isdefined(self.scale))
	{
		compassscale = (level.var_cd139dc0 * self.scale) * 3;
		self function_5e00861(compassscale, 1);
		[[ level.var_99266dd4 ]]->waitinqueue(self);
	}
}

/*
	Name: function_81784679
	Namespace: namespace_b77e8eb1
	Checksum: 0x5310C890
	Offset: 0x9A0
	Size: 0x5C
	Parameters: 2
	Flags: Private
*/
function private function_81784679(ent, localclientnum)
{
	ent waittill(#"death");
	ent function_811196d1(1);
	ent function_1cfa2520(localclientnum);
}

