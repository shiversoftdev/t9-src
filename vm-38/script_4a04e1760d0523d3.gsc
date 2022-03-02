#using script_3d0f36632dad12df;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\throttle_shared.csc;

#namespace namespace_b77e8eb1;

/*
	Name: function_b82d80c9
	Namespace: namespace_b77e8eb1
	Checksum: 0x3B42C1D0
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b82d80c9()
{
	level notify(1253841027);
}

/*
	Name: init
	Namespace: namespace_b77e8eb1
	Checksum: 0x45E9A3B9
	Offset: 0x188
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
	Checksum: 0x3C8EDE35
	Offset: 0x368
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
	Checksum: 0xB82B99B6
	Offset: 0x5F0
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
	Checksum: 0x4BE6080C
	Offset: 0x670
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
	Checksum: 0xE82E6EE8
	Offset: 0x748
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
	Checksum: 0x1D053455
	Offset: 0x7D0
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
		var_70aac56d = (level.circleradius * self.scale) * 3;
		self function_5e00861(var_70aac56d, 1);
		[[ level.var_99266dd4 ]]->waitinqueue(self);
	}
}

/*
	Name: function_88008fc3
	Namespace: namespace_b77e8eb1
	Checksum: 0xB014F6F8
	Offset: 0x920
	Size: 0x90
	Parameters: 0
	Flags: Private
*/
function private function_88008fc3()
{
	self endon(#"death", #"hash_41a7922ed68f0877");
	while(isdefined(self.scale))
	{
		var_70aac56d = (level.var_cd139dc0 * self.scale) * 3;
		self function_5e00861(var_70aac56d, 1);
		[[ level.var_99266dd4 ]]->waitinqueue(self);
	}
}

/*
	Name: function_81784679
	Namespace: namespace_b77e8eb1
	Checksum: 0x9551350F
	Offset: 0x9B8
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

