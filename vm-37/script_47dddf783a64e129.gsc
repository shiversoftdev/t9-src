#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace flashlight;

/*
	Name: function_89f2df9
	Namespace: flashlight
	Checksum: 0xD0DFA63D
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"flashlight", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: fx_set
	Namespace: flashlight
	Checksum: 0xB2F4C7D7
	Offset: 0x158
	Size: 0x1DC
	Parameters: 3
	Flags: Linked
*/
function fx_set(localclientnum, flashlightfx, flashlightfxtag)
{
	if(!isdefined(flashlightfx))
	{
		flashlightfx = "light/fx9_light_cp_flashlight";
	}
	if(!isdefined(flashlightfxtag))
	{
		flashlightfxtag = "tag_light";
	}
	if(!isdefined(self.flashlight))
	{
		self.flashlight = {};
	}
	var_5a528883 = self.flashlight.fx !== flashlightfx;
	var_f49dadc4 = self.flashlight.fxtag !== flashlightfxtag;
	var_5a9e0eeb = (flashlightfx !== ("light/fx9_light_cp_flashlight") ? flashlightfx : undefined);
	var_9acb6f5e = (flashlightfxtag !== "tag_light" ? flashlightfxtag : undefined);
	if(!isdefined(self.flashlight) && (isdefined(var_5a9e0eeb) || isdefined(var_9acb6f5e)))
	{
		self.flashlight = {};
	}
	self.flashlight.fx = var_5a9e0eeb;
	self.flashlight.fxtag = var_9acb6f5e;
	if(self == level)
	{
		level notify(#"hash_3832e59879eaf7fd");
		return;
	}
	flashlight_on = isdefined(self.flashlight.fxid);
	if(flashlight_on && (var_5a528883 || var_f49dadc4))
	{
		self fx_stop(localclientnum);
		self fx_play(localclientnum);
	}
}

/*
	Name: function_663e512c
	Namespace: flashlight
	Checksum: 0xEA245D40
	Offset: 0x340
	Size: 0x1E
	Parameters: 1
	Flags: None
*/
function function_663e512c(fxtag)
{
	self.flashlight.var_787d46f2 = fxtag;
}

/*
	Name: function_70a657d8
	Namespace: flashlight
	Checksum: 0xD38560CF
	Offset: 0x368
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	register_clientfields();
}

/*
	Name: register_clientfields
	Namespace: flashlight
	Checksum: 0x537F172
	Offset: 0x388
	Size: 0xDC
	Parameters: 0
	Flags: Linked, Private
*/
function private register_clientfields()
{
	clientfield::register("actor", "flashlightfx", 1, 1, "int", &function_7e507d3c, 0, 0);
	clientfield::register("scriptmover", "flashlightfx", 1, 2, "int", &function_8cd382e7, 0, 0);
	clientfield::register("actor", "gunflashlightfx", 1, 1, "int", &function_db7bbe6c, 0, 0);
}

/*
	Name: function_db7bbe6c
	Namespace: flashlight
	Checksum: 0x982B431B
	Offset: 0x470
	Size: 0x114
	Parameters: 7
	Flags: Linked, Private
*/
function private function_db7bbe6c(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	flashlight_on = self clientfield::get("gunflashlightfx");
	var_787d46f2 = "tag_muzzle";
	if(isdefined(self.flashlight.var_787d46f2))
	{
		var_787d46f2 = self.flashlight.var_787d46f2;
	}
	if(flashlight_on)
	{
		fx_set(wasdemojump, "light/fx9_light_cp_flashlight", var_787d46f2);
	}
	function_2573297e(wasdemojump, flashlight_on);
	if(!flashlight_on)
	{
		fx_set(wasdemojump, "light/fx9_light_cp_flashlight", "tag_light");
	}
}

/*
	Name: function_7e507d3c
	Namespace: flashlight
	Checksum: 0xBE03BB09
	Offset: 0x590
	Size: 0x7C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_7e507d3c(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	flashlight_on = self clientfield::get("flashlightfx");
	function_2573297e(wasdemojump, flashlight_on);
}

/*
	Name: function_2573297e
	Namespace: flashlight
	Checksum: 0x75E24525
	Offset: 0x618
	Size: 0xF4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_2573297e(localclientnum, flashlight_on)
{
	if(flashlight_on == 1)
	{
		var_17716e4f = isdefined(self.flashlight.fxid);
		if(var_17716e4f && !isfxplaying(localclientnum, self.flashlight.fxid))
		{
			self fx_stop(localclientnum);
		}
		if(!isdefined(self.flashlight.fxid))
		{
			self fx_play(localclientnum);
		}
	}
	else if(flashlight_on == 0 && isdefined(self.flashlight.fxid))
	{
		self fx_stop(localclientnum);
	}
}

/*
	Name: function_8cd382e7
	Namespace: flashlight
	Checksum: 0x3EF66127
	Offset: 0x718
	Size: 0xE4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_8cd382e7(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump == 1)
	{
		self notify(#"hash_6f398d21a29fce31");
		self function_a530c545(fieldname, 1);
	}
	else
	{
		if(wasdemojump == 0)
		{
			self notify(#"hash_6f398d21a29fce31");
			self function_a530c545(fieldname, 0);
		}
		else if(wasdemojump == 2)
		{
			self thread function_2b580006(fieldname);
		}
	}
}

/*
	Name: function_a530c545
	Namespace: flashlight
	Checksum: 0xF3816C8
	Offset: 0x808
	Size: 0xDE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a530c545(localclientnum, on)
{
	if(is_true(on))
	{
		if(!isdefined(self.var_103f6c4c))
		{
			fx = (isdefined(level.flashlight.fx) ? level.flashlight.fx : "light/fx9_light_cp_flashlight");
			self.var_103f6c4c = util::playfxontag(localclientnum, fx, self, "tag_light");
		}
	}
	else if(isdefined(self.var_103f6c4c))
	{
		killfx(localclientnum, self.var_103f6c4c);
		self.var_103f6c4c = undefined;
	}
}

/*
	Name: function_2b580006
	Namespace: flashlight
	Checksum: 0xA2470C74
	Offset: 0x8F0
	Size: 0x14C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2b580006(localclientnum)
{
	self notify(#"hash_6f398d21a29fce31");
	self endon(#"hash_6f398d21a29fce31", #"death");
	self function_a530c545(localclientnum, 0);
	wait(randomfloatrange(0.2, 0.3));
	self function_a530c545(localclientnum, 1);
	wait(randomfloatrange(0.2, 0.4));
	self function_a530c545(localclientnum, 0);
	wait(randomfloatrange(0.2, 0.3));
	self function_a530c545(localclientnum, 1);
	wait(randomfloatrange(0.2, 0.3));
	self function_a530c545(localclientnum, 0);
}

/*
	Name: fx_play
	Namespace: flashlight
	Checksum: 0x8941B11A
	Offset: 0xA48
	Size: 0x144
	Parameters: 1
	Flags: Linked, Private
*/
function private fx_play(localclientnum)
{
	if(!isdefined(self.flashlight))
	{
		self.flashlight = {};
	}
	if(isdefined(self.flashlight.fx))
	{
		flashlightfx = self.flashlight.fx;
	}
	else
	{
		if(isdefined(level.flashlight.fx))
		{
			flashlightfx = level.flashlight.fx;
		}
		else
		{
			flashlightfx = "light/fx9_light_cp_flashlight";
		}
	}
	if(isdefined(self.flashlight.fxtag))
	{
		flashlightfxtag = self.flashlight.fxtag;
	}
	else
	{
		if(isdefined(level.flashlight.fxtag))
		{
			flashlightfxtag = level.flashlight.fxtag;
		}
		else
		{
			flashlightfxtag = "tag_light";
		}
	}
	self.flashlight.fxid = util::playfxontag(localclientnum, flashlightfx, self, flashlightfxtag);
	self thread function_54557944(localclientnum);
}

/*
	Name: fx_stop
	Namespace: flashlight
	Checksum: 0xFF96932E
	Offset: 0xB98
	Size: 0x8E
	Parameters: 1
	Flags: Linked, Private
*/
function private fx_stop(localclientnum)
{
	if(isdefined(self.flashlight.fxid))
	{
		killfx(localclientnum, self.flashlight.fxid);
		self.flashlight.fxid = undefined;
		if(!isdefined(self.flashlight.fx) && !isdefined(self.flashlight.fxtag))
		{
			self.flashlight = undefined;
		}
	}
}

/*
	Name: function_54557944
	Namespace: flashlight
	Checksum: 0x4BC0E00B
	Offset: 0xC30
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_54557944(localclientnum)
{
	self notify("261acc760efea5e1");
	self endon("261acc760efea5e1");
	self endon(#"death");
	level waittill(#"hash_3832e59879eaf7fd");
	self fx_stop(localclientnum);
	self fx_play(localclientnum);
}

