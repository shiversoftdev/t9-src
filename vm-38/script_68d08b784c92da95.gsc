#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace flashlight;

/*
	Name: function_f2cef335
	Namespace: flashlight
	Checksum: 0xC5CB765F
	Offset: 0x1D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f2cef335()
{
	level notify(2010106045);
}

/*
	Name: function_89f2df9
	Namespace: flashlight
	Checksum: 0x88DF4042
	Offset: 0x1F8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"flashlight", &function_f64316de, undefined, undefined, undefined);
}

/*
	Name: function_9b7441d1
	Namespace: flashlight
	Checksum: 0xD623CF4C
	Offset: 0x240
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_9b7441d1(flashlight_out)
{
	if(!isdefined(flashlight_out))
	{
		flashlight_out = 0;
	}
	if(!isdefined(self.flashlight))
	{
		self.flashlight = {};
	}
	var_5e61cb7e = self getblackboardattribute("_flashlight");
	if(is_true(flashlight_out) && var_5e61cb7e !== "flashlight_out" || (!is_true(flashlight_out) && var_5e61cb7e !== "flashlight_stow"))
	{
		self.flashlight.transition = 1;
		self thread function_1ad12840();
	}
	else if(is_true(self.flashlight.transition))
	{
		self.flashlight.transition = undefined;
	}
	self.flashlight.out = flashlight_out;
	function_ac53d0fb();
}

/*
	Name: function_8d59ee47
	Namespace: flashlight
	Checksum: 0x440E9066
	Offset: 0x380
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function function_8d59ee47(flashlight_out)
{
	if(!isdefined(flashlight_out))
	{
		flashlight_out = 0;
	}
	if(flashlight_out)
	{
		if(function_b8090745())
		{
			self thread function_1ad12840("detach", &function_229440d2);
		}
		else
		{
			function_229440d2();
		}
	}
	else
	{
		function_ac53d0fb();
	}
	self.flashlight.out = flashlight_out;
}

/*
	Name: function_b8090745
	Namespace: flashlight
	Checksum: 0xD6EE72CC
	Offset: 0x428
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function function_b8090745()
{
	if(self getblackboardattribute("_flashlight") === "flashlight_out")
	{
		return true;
	}
	return false;
}

/*
	Name: function_7b72a4ab
	Namespace: flashlight
	Checksum: 0x566F4832
	Offset: 0x468
	Size: 0x62
	Parameters: 2
	Flags: None
*/
function function_7b72a4ab(flashlightmodel, var_f8962b6d)
{
	if(!isdefined(self.flashlight))
	{
		self.flashlight = {};
	}
	self.flashlight.var_52620179 = flashlightmodel;
	self.flashlight.var_69749c1 = (isdefined(var_f8962b6d) ? var_f8962b6d : flashlightmodel);
}

/*
	Name: function_3ed8613f
	Namespace: flashlight
	Checksum: 0x324DCDBC
	Offset: 0x4D8
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function function_3ed8613f()
{
	modelname = "com_flashlight_on_xforward_no_tag_weapon";
	if(isdefined(self.flashlight.var_52620179))
	{
		modelname = self.flashlight.var_52620179;
	}
	else if(isdefined(level.flashlight.var_52620179))
	{
		modelname = level.flashlight.var_52620179;
	}
	return modelname;
}

/*
	Name: function_54c2c072
	Namespace: flashlight
	Checksum: 0xC93FA636
	Offset: 0x558
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function function_54c2c072()
{
	modelname = "com_flashlight_on_xforward_no_tag_weapon_off";
	if(isdefined(self.flashlight.var_69749c1))
	{
		modelname = self.flashlight.var_69749c1;
	}
	else if(isdefined(level.flashlight.var_69749c1))
	{
		modelname = level.flashlight.var_69749c1;
	}
	return modelname;
}

/*
	Name: function_32fb7a97
	Namespace: flashlight
	Checksum: 0xE067AD1E
	Offset: 0x5D8
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_32fb7a97(var_704fb596)
{
	if(!isdefined(var_704fb596))
	{
		var_704fb596 = "tag_accessory_left";
	}
	if(!isdefined(self.flashlight))
	{
		self.flashlight = {};
	}
	self.flashlight.var_7a9de72 = var_704fb596;
}

/*
	Name: function_e77dc163
	Namespace: flashlight
	Checksum: 0x3E319F91
	Offset: 0x630
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function function_e77dc163()
{
	tag = "tag_accessory_left";
	if(isdefined(self.flashlight.var_7a9de72))
	{
		tag = self.flashlight.var_7a9de72;
	}
	else if(isdefined(level.flashlight.var_7a9de72))
	{
		tag = level.flashlight.var_7a9de72;
	}
	return tag;
}

/*
	Name: function_65e5c8c8
	Namespace: flashlight
	Checksum: 0x17302D11
	Offset: 0x6B0
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_65e5c8c8(var_45c9e542)
{
	if(!isdefined(self.flashlight))
	{
		self.flashlight = {};
	}
	if(isdefined(self.flashlight.model))
	{
		return;
	}
	modelname = self function_3ed8613f();
	tag = self function_e77dc163();
	self attach(modelname, tag, 1);
	self.flashlight.model = modelname;
	self.flashlight.tag = tag;
	if(is_true(var_45c9e542) && isdefined(self.fnstealthflashlighton))
	{
		self [[self.fnstealthflashlighton]]();
	}
	self thread function_4e897ec7();
}

/*
	Name: function_bfffb3fe
	Namespace: flashlight
	Checksum: 0x5CE724DD
	Offset: 0x7C0
	Size: 0xC6
	Parameters: 0
	Flags: Linked
*/
function function_bfffb3fe()
{
	if(!isdefined(self.flashlight.model))
	{
		return;
	}
	if(isdefined(self.fnstealthflashlightoff))
	{
		self [[self.fnstealthflashlightoff]]();
	}
	if(isdefined(self.flashlight.model) && isdefined(self.flashlight.tag))
	{
		self detach(self.flashlight.model, self.flashlight.tag);
	}
	self.flashlight.model = undefined;
	self.flashlight.tag = undefined;
	self notify(#"hash_41c8d256b3d76cf");
}

/*
	Name: function_7db73593
	Namespace: flashlight
	Checksum: 0xCBA2C9CD
	Offset: 0x890
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function function_7db73593()
{
	model = function_54c2c072();
	tag = self.flashlight.tag;
	self function_bfffb3fe();
	if(isdefined(model) && isdefined(tag))
	{
		origin = self gettagorigin(tag);
		angles = self gettagangles(tag);
		if(isdefined(origin) && isdefined(angles))
		{
			ent = spawn("script_model", origin);
			if(isdefined(ent))
			{
				ent endon(#"death");
				ent setmodel(model);
				ent.angles = angles;
				ent physicslaunch();
				ent clientfield::set("flashlightfx", 1);
				if(is_true(self.in_melee_death))
				{
					wait(randomfloatrange(3, 4));
				}
				wait(randomfloatrange(0.1, 0.3));
				ent clientfield::set("flashlightfx", 2);
			}
		}
	}
}

/*
	Name: light_on
	Namespace: flashlight
	Checksum: 0x1AB9416B
	Offset: 0xA60
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function light_on()
{
	if(!isdefined(self.flashlight.model))
	{
		self function_65e5c8c8(1);
	}
	if(!isdefined(self.flashlight.model))
	{
		return;
	}
	if(is_true(self.flashlight.on))
	{
		return;
	}
	self.flashlight.on = 1;
	self setblackboardattribute("_flashlight", "flashlight_out");
	self clientfield::set("flashlightfx", 1);
}

/*
	Name: function_229440d2
	Namespace: flashlight
	Checksum: 0x7FFB4B41
	Offset: 0xB30
	Size: 0x114
	Parameters: 2
	Flags: Linked
*/
function function_229440d2(forced, fxtag)
{
	if(!isdefined(forced))
	{
		forced = 0;
	}
	if(!isdefined(self.flashlight))
	{
		self.flashlight = {};
	}
	if(!forced)
	{
		if(isdefined(self.flashlight.model))
		{
			return;
		}
		if(!is_true(self.flashlight.out))
		{
			return;
		}
		if(is_true(self.flashlight.on))
		{
			return;
		}
	}
	self.flashlight.on = 1;
	self.flashlight.var_229440d2 = 1;
	self.flashlight.tag = (isdefined(fxtag) ? fxtag : "tag_muzzle");
	self clientfield::set("gunflashlightfx", 1);
}

/*
	Name: function_47df32b8
	Namespace: flashlight
	Checksum: 0xD727CA0E
	Offset: 0xC50
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_47df32b8()
{
	return is_true(self.flashlight.on);
}

/*
	Name: function_ac53d0fb
	Namespace: flashlight
	Checksum: 0x46F6A4F
	Offset: 0xC80
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_ac53d0fb()
{
	if(!isdefined(self.flashlight))
	{
		self.flashlight = {};
	}
	if(isdefined(self.flashlight.model))
	{
		return;
	}
	if(!is_true(self.flashlight.on))
	{
		return;
	}
	self.flashlight.on = undefined;
	self.flashlight.tag = undefined;
	self.flashlight.var_229440d2 = undefined;
	self clientfield::set("gunflashlightfx", 0);
	self setblackboardattribute("_flashlight", "flashlight_stow");
}

/*
	Name: function_3aec1b7
	Namespace: flashlight
	Checksum: 0xA43AB1D3
	Offset: 0xD58
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_3aec1b7()
{
	return is_true(self.flashlight.var_229440d2);
}

/*
	Name: light_off
	Namespace: flashlight
	Checksum: 0x79D7189D
	Offset: 0xD88
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function light_off()
{
	if(!isdefined(self.flashlight.model))
	{
		return;
	}
	if(!is_true(self.flashlight.on))
	{
		return;
	}
	self.flashlight.on = undefined;
	self clientfield::set("flashlightfx", 0);
}

/*
	Name: function_51dea76e
	Namespace: flashlight
	Checksum: 0x5BE15F7C
	Offset: 0xE00
	Size: 0x1AE
	Parameters: 1
	Flags: None
*/
function function_51dea76e(var_4efdd43)
{
	entnum = self getentitynumber();
	range_sq = sqr((isdefined(self.var_1c936867) ? self.var_1c936867 : 850));
	cosfov = 0.866;
	if(is_true(self.flashlight.on))
	{
		var_78601034 = var_4efdd43 geteye();
		flash_origin = self gettagorigin(self.flashlight.tag);
		var_72902a5c = self gettagangles(self.flashlight.tag);
		if(isdefined(flash_origin) && isdefined(var_72902a5c) && distancesquared(flash_origin, var_78601034) < range_sq)
		{
			if(self util::function_aae7d83d(flash_origin, var_72902a5c, var_78601034, cosfov))
			{
				if(sighttracepassed(flash_origin + (anglestoforward(var_72902a5c) * 20), var_78601034, 0, var_4efdd43))
				{
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: function_f64316de
	Namespace: flashlight
	Checksum: 0x619FBCA8
	Offset: 0xFB8
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f64316de()
{
	function_bc948200();
	level.var_ab828d57 = &function_7db73593;
	callback::on_ai_spawned(&function_fb6fb7ad);
}

/*
	Name: function_bc948200
	Namespace: flashlight
	Checksum: 0x83C179EE
	Offset: 0x1010
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bc948200()
{
	clientfield::register("actor", "flashlightfx", 1, 1, "int");
	clientfield::register("scriptmover", "flashlightfx", 1, 2, "int");
	clientfield::register("actor", "gunflashlightfx", 1, 1, "int");
}

/*
	Name: function_fb6fb7ad
	Namespace: flashlight
	Checksum: 0xABBC8D5A
	Offset: 0x10B0
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fb6fb7ad()
{
	if(self.species !== "human")
	{
		return;
	}
	self.var_710f0e6e = &function_65e5c8c8;
	self.fnstealthflashlightdetach = &function_bfffb3fe;
	self.fnstealthflashlighton = &light_on;
	self.fnstealthflashlightoff = &light_off;
	self setblackboardattribute("_flashlight", "flashlight_stow");
}

/*
	Name: function_4e897ec7
	Namespace: flashlight
	Checksum: 0x6AE3D8E4
	Offset: 0x1158
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4e897ec7()
{
	self notify("18d939c31eb079a4");
	self endon("18d939c31eb079a4");
	self endon(#"hash_41c8d256b3d76cf", #"entitydeleted");
	self waittill(#"death");
	waittillframeend();
	if(isdefined(self))
	{
		self thread function_7db73593();
	}
}

/*
	Name: function_1ad12840
	Namespace: flashlight
	Checksum: 0x415577C4
	Offset: 0x11D8
	Size: 0x11E
	Parameters: 2
	Flags: Linked
*/
function function_1ad12840(var_baa290f1, var_affc8431)
{
	self notify("a4eb5bb1979f8c");
	self endon("a4eb5bb1979f8c");
	self endon(#"death", #"entitydeleted", #"hash_335827d811ed5f67");
	result = undefined;
	result = self waittilltimeout(5, #"attach", #"detach");
	if(result._notify === "attach")
	{
		self function_65e5c8c8(1);
	}
	else if(result._notify === "detach")
	{
		self function_bfffb3fe();
	}
	if(result._notify === var_baa290f1)
	{
		self [[var_affc8431]]();
	}
}

