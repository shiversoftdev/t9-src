#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_6b71c9befed901f2;
#using script_75c3996cce8959f7;
#using script_71603a58e2da0698;
#using script_37bec8bde3259abd;
#using script_30c7fb449869910;
#using script_d3ced43465e5aec;
#using script_771f5bff431d8d57;
#using script_42cbbdcd1e160063;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using script_18910f59cc847b42;
#using scripts\core_common\struct.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace doa_pickups;

/*
	Name: function_80c0b71a
	Namespace: doa_pickups
	Checksum: 0xFF75A610
	Offset: 0x1C8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_80c0b71a()
{
	level notify(-1278831063);
}

/*
	Name: init
	Namespace: doa_pickups
	Checksum: 0xD6D897D8
	Offset: 0x1E8
	Size: 0x1B4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "pickuprotate", 1, 1, "int", &pickuprotate, 0, 0);
	clientfield::register("scriptmover", "pickupsettype", 1, 6 + 3, "int", &pickupsettype, 0, 0);
	clientfield::register("scriptmover", "pickupvisibility", 1, 1, "int", &function_d04f663, 0, 0);
	clientfield::register("scriptmover", "pickuptimeout", 1, 1, "int", &function_727ce85b, 0, 0);
	clientfield::register("scriptmover", "pickupmoveto", 1, 4, "int", &function_3577c445, 0, 0);
	level.doa.pickups = [];
	namespace_c501aa2e::init();
	namespace_5d515bd5::init();
	function_32d5e898();
}

/*
	Name: function_32d5e898
	Namespace: doa_pickups
	Checksum: 0xA4AB0074
	Offset: 0x3A8
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
}

/*
	Name: function_c9502d74
	Namespace: doa_pickups
	Checksum: 0x26CAB489
	Offset: 0x3C0
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function function_c9502d74(type, variant)
{
	foreach(pickup in level.doa.pickups)
	{
		if(pickup.type == type)
		{
			if(variant == pickup.variant)
			{
				return pickup;
			}
		}
	}
}

/*
	Name: function_c1018360
	Namespace: doa_pickups
	Checksum: 0x2BF16791
	Offset: 0x480
	Size: 0xB8
	Parameters: 8
	Flags: Linked
*/
function function_c1018360(modelname, type, variant, rarity, modelscale, angles, data, unused)
{
	pickup = spawnstruct();
	pickup.modelname = modelscale;
	pickup.scale = unused;
	pickup.type = angles;
	pickup.variant = data;
	level.doa.pickups[level.doa.pickups.size] = pickup;
}

/*
	Name: function_3c872f01
	Namespace: doa_pickups
	Checksum: 0x734DB23A
	Offset: 0x540
	Size: 0xE6
	Parameters: 0
	Flags: Linked
*/
function function_3c872f01()
{
	self notify("18efc16b8ff7b50c");
	self endon("18efc16b8ff7b50c");
	self endon(#"hash_326008b133edf46a", #"death", #"entityshutdown");
	dir = 180;
	if(randomint(100) > 50)
	{
		dir = -180;
	}
	time = randomfloatrange(3, 7);
	while(isdefined(self))
	{
		self rotateto(self.angles + (0, dir, 0), time);
		wait(time);
	}
}

/*
	Name: pickupsettype
	Namespace: doa_pickups
	Checksum: 0xCD3F7067
	Offset: 0x630
	Size: 0x204
	Parameters: 7
	Flags: Linked
*/
function pickupsettype(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_7266499a = bwastimejump & ((1 << 6) - 1);
	self.variant = bwastimejump >> 6;
	def = function_c9502d74(self.var_7266499a, self.variant);
	/#
		assert(isdefined(def), "");
	#/
	if(!isdefined(def) || !isdefined(def.modelname))
	{
		return;
	}
	var_33d561cb = getnumfreeentities(fieldname);
	if(var_33d561cb > 0)
	{
		self.fakemodel = spawn(fieldname, self.origin, "script_model");
	}
	if(isdefined(self.fakemodel))
	{
		self.fakemodel setmodel(def.modelname);
		self.fakemodel notsolid();
		self.fakemodel setscale((isdefined(self.scale) ? self.scale : 1));
		self.fakemodel linkto(self);
		self.fakemodel.angles = self.angles;
		self.fakemodel.pickup = self;
		self.fakemodel thread namespace_ec06fe4a::function_d55f042c(self, "death");
	}
}

/*
	Name: pickuprotate
	Namespace: doa_pickups
	Checksum: 0xE5C0FB59
	Offset: 0x840
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function pickuprotate(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.fakemodel))
	{
		return;
	}
	self.fakemodel.angles = self.angles;
	if(bwastimejump)
	{
		self.fakemodel thread function_3c872f01();
	}
	else
	{
		self.fakemodel notify(#"hash_326008b133edf46a");
	}
}

/*
	Name: function_d04f663
	Namespace: doa_pickups
	Checksum: 0xFC8D77FE
	Offset: 0x8F0
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function function_d04f663(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.fakemodel))
	{
		return;
	}
	if(bwastimejump == 0)
	{
		self.fakemodel show();
	}
	else if(bwastimejump == 1)
	{
		self.fakemodel hide();
	}
}

/*
	Name: function_727ce85b
	Namespace: doa_pickups
	Checksum: 0x29452712
	Offset: 0x990
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_727ce85b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.fakemodel))
	{
		return;
	}
	if(bwastimejump)
	{
		self.fakemodel thread pickuptimeout(10);
	}
	else
	{
		self.fakemodel notify(#"hash_2a866f50cc161ca8");
	}
}

/*
	Name: pickuptimeout
	Namespace: doa_pickups
	Checksum: 0x5F6E4C85
	Offset: 0xA28
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function pickuptimeout(timetowait)
{
	if(timetowait <= 0)
	{
		return;
	}
	self endon(#"death", #"hash_2a866f50cc161ca8");
	wait(timetowait);
	for(i = 0; i < 40; i++)
	{
		if(!isdefined(self))
		{
			break;
		}
		if(i % 2)
		{
			self hide();
		}
		else
		{
			self show();
		}
		if(i < 15)
		{
			wait(0.5);
			continue;
		}
		if(i < 25)
		{
			wait(0.25);
			continue;
		}
		wait(0.1);
	}
}

/*
	Name: function_3577c445
	Namespace: doa_pickups
	Checksum: 0xE80A7834
	Offset: 0xB18
	Size: 0x274
	Parameters: 7
	Flags: Linked
*/
function function_3577c445(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.fakemodel))
	{
		return;
	}
	player = undefined;
	bwastimejump = bwastimejump - 1;
	if(bwastimejump > 0)
	{
		if(bwastimejump == 15)
		{
			player = undefined;
		}
		else
		{
			entnum = (bwastimejump >> 1) - 1;
			players = getplayers(fieldname);
			foreach(guy in players)
			{
				if(guy getentitynumber() == entnum)
				{
					player = guy;
					break;
				}
			}
		}
	}
	self.fakemodel unlink();
	self.fakemodel notify(#"hash_2a866f50cc161ca8");
	flipped = 0;
	foreach(localplayer in getlocalplayers())
	{
		if(localplayer getlocalclientnumber() === fieldname)
		{
			flipped = level.doa.var_f65cb6ee[localplayer.entnum];
			break;
		}
	}
	self.fakemodel thread function_4ecd84a8(player, flipped);
}

/*
	Name: function_4ecd84a8
	Namespace: doa_pickups
	Checksum: 0xB5D86B68
	Offset: 0xD98
	Size: 0x18C
	Parameters: 2
	Flags: Linked
*/
function function_4ecd84a8(player, flipped)
{
	if(!isdefined(flipped))
	{
		flipped = 0;
	}
	self endon(#"death");
	self show();
	if(isdefined(player))
	{
		x = 2000;
		y = 3000;
		z = 1000;
		if(flipped)
		{
			x = 0 - x;
			y = 0 - y;
		}
		end_pt = player.origin;
		entnum = player getentitynumber();
		if(entnum == 1)
		{
			y = 0 - y;
		}
		else
		{
			if(entnum == 2)
			{
				x = 0 - x;
			}
			else if(entnum == 3)
			{
				y = 0 - y;
				x = 0 - x;
			}
		}
		end_pt = end_pt + (x, y, z);
	}
	else
	{
		end_pt = self.origin + vectorscale((0, 0, 1), 3000);
	}
	waitframe(1);
	self moveto(end_pt, 2, 0, 0);
}

