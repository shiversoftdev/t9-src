#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace zombie_eye_glow;

/*
	Name: function_89f2df9
	Namespace: zombie_eye_glow
	Checksum: 0xF58B6C4A
	Offset: 0x198
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zombie_eye_glow", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zombie_eye_glow
	Checksum: 0x16980E29
	Offset: 0x1F0
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "zombie_eye_glow", 1, 3, "int", &zombie_eye_glow, 0, 0);
}

/*
	Name: function_8ac3bea9
	Namespace: zombie_eye_glow
	Checksum: 0x80F724D1
	Offset: 0x248
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: zombie_eye_glow
	Namespace: zombie_eye_glow
	Checksum: 0xB7C0FE78
	Offset: 0x258
	Size: 0x244
	Parameters: 7
	Flags: Linked
*/
function zombie_eye_glow(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self good_barricade_damaged(fieldname);
	if(bwastimejump > 0)
	{
		if(isdefined(self.var_a63f638a))
		{
			self.var_12b59dee = self.var_a63f638a;
		}
		else
		{
			switch(bwastimejump)
			{
				case 2:
				{
					self.var_12b59dee = "rob_zm_eyes_blue";
					break;
				}
				case 3:
				{
					self.var_12b59dee = "rob_zm_eyes_green";
					break;
				}
				case 4:
				{
					self.var_12b59dee = "rob_zm_eyes_orange";
					break;
				}
				case 5:
				{
					self.var_12b59dee = "rob_zm_eyes_red";
					break;
				}
				default:
				{
					self.var_12b59dee = "rob_zm_eyes_orange";
					break;
				}
			}
		}
		if(isdefined(self.var_d5fd20ef))
		{
			var_d40cd873 = self.var_d5fd20ef;
		}
		else
		{
			switch(bwastimejump)
			{
				case 2:
				{
					var_d40cd873 = "wz/fx8_zombie_eye_glow_blue_wz";
					break;
				}
				case 3:
				{
					var_d40cd873 = "wz/fx8_zombie_eye_glow_green_wz";
					break;
				}
				case 4:
				{
					var_d40cd873 = "zm_ai/fx8_zombie_eye_glow_orange";
					break;
				}
				case 5:
				{
					var_d40cd873 = "zm_ai/fx8_zombie_eye_glow_red";
					break;
				}
				default:
				{
					var_d40cd873 = "zm_ai/fx8_zombie_eye_glow_orange";
					break;
				}
			}
		}
		self function_fe127aaf(fieldname, self.var_12b59dee, var_d40cd873);
	}
}

/*
	Name: good_barricade_damaged
	Namespace: zombie_eye_glow
	Checksum: 0x6755A59
	Offset: 0x4A8
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function good_barricade_damaged(localclientnum)
{
	if(isdefined(self.var_12b59dee))
	{
		self function_5d482e78(self.var_12b59dee, "j_head");
		self.var_12b59dee = undefined;
	}
	if(isdefined(self.var_3231a850))
	{
		stopfx(localclientnum, self.var_3231a850);
		self.var_3231a850 = undefined;
	}
}

/*
	Name: function_fe127aaf
	Namespace: zombie_eye_glow
	Checksum: 0x32D82F17
	Offset: 0x530
	Size: 0xBA
	Parameters: 3
	Flags: Linked, Private
*/
function private function_fe127aaf(localclientnum, var_ee6bcd51, str_fx)
{
	if(isdefined(var_ee6bcd51))
	{
		self function_bf9d3071(var_ee6bcd51, "j_head");
		self.var_12b59dee = var_ee6bcd51;
	}
	if(isdefined(str_fx))
	{
		if(isdefined(self.var_f87f8fa0))
		{
			self.var_3231a850 = util::playfxontag(localclientnum, str_fx, self, self.var_f87f8fa0);
		}
		else
		{
			self.var_3231a850 = util::playfxontag(localclientnum, str_fx, self, "j_eyeball_le");
		}
	}
}

/*
	Name: function_3a020b0f
	Namespace: zombie_eye_glow
	Checksum: 0xCBFF5C2F
	Offset: 0x5F8
	Size: 0x74
	Parameters: 3
	Flags: Linked
*/
function function_3a020b0f(localclientnum, var_ee6bcd51, str_fx)
{
	if(!isdefined(var_ee6bcd51))
	{
		var_ee6bcd51 = "rob_zm_eyes_orange";
	}
	if(!isdefined(str_fx))
	{
		str_fx = "zm_ai/fx8_zombie_eye_glow_orange";
	}
	self good_barricade_damaged(localclientnum);
	self function_fe127aaf(localclientnum, var_ee6bcd51, str_fx);
}

