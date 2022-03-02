#using script_3d35e2ff167b3a82;
#using script_3d5887fc414a86fb;
#using script_618d6f5ff5d18933;
#using script_680dddbda86931fa;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace item_drop;

/*
	Name: function_62c2acdb
	Namespace: item_drop
	Checksum: 0x4532A6CD
	Offset: 0x148
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_62c2acdb()
{
	level notify(808437354);
}

/*
	Name: function_89f2df9
	Namespace: item_drop
	Checksum: 0x4E17D99B
	Offset: 0x168
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"item_drop", &function_70a657d8, undefined, undefined, #"item_world");
}

/*
	Name: function_70a657d8
	Namespace: item_drop
	Checksum: 0xE3A61927
	Offset: 0x1B8
	Size: 0x50
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_ad5a0cd6::use_item_spawns())
	{
		return;
	}
	register_client_fields();
	level.var_a4a4012e = [];
	level.var_624588d5 = [];
	level.var_2b5a36e1 = [];
}

/*
	Name: register_client_fields
	Namespace: item_drop
	Checksum: 0xA107011
	Offset: 0x210
	Size: 0x2B4
	Parameters: 0
	Flags: Linked, Private
*/
function private register_client_fields()
{
	clientfield::register("missile", "dynamic_item_drop_falling", 1, 1, "int", undefined, 0, 0);
	clientfield::register("missile", "dynamic_item_drop_count", 1, 10, "int", &function_fd47982d, 0, 0);
	clientfield::register("missile", "dynamic_item_drop", 1, 4, "int", &function_a517a859, 0, 0);
	clientfield::register("missile", "dynamic_item_timing_out", 1, 1, "int", &function_45f94325, 0, 0);
	clientfield::register("scriptmover", "dynamic_item_drop_falling", 1, 1, "int", undefined, 0, 0);
	clientfield::register("scriptmover", "dynamic_item_drop_count", 1, 10, "int", &function_fd47982d, 0, 0);
	clientfield::register("scriptmover", "dynamic_item_drop", 1, 4, "int", &function_a517a859, 0, 0);
	clientfield::register("scriptmover", "dynamic_stash", 1, 2, "int", &function_e7bb925a, 0, 0);
	clientfield::register("scriptmover", "dynamic_stash_type", 1, 2, "int", &function_63226f88, 0, 0);
	clientfield::register("scriptmover", "dynamic_item_timing_out", 1, 1, "int", &function_45f94325, 0, 0);
}

/*
	Name: function_67189b6b
	Namespace: item_drop
	Checksum: 0x8D7A87CB
	Offset: 0x4D0
	Size: 0x50C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_67189b6b(localclientnum, newval)
{
	if(self.id === 32767 && (!(newval == 2 || newval == 3)))
	{
		return;
	}
	var_be90d3da = (newval & 4) != 0;
	newval = newval & -5;
	self.falling = self clientfield::get("dynamic_item_drop_falling");
	if(newval == 0)
	{
		if(isdefined(self) && isdefined(self.var_bd027dd9) && isdefined(level.var_a4a4012e[self.var_bd027dd9]))
		{
			arrayremoveindex(level.var_a4a4012e, self.var_bd027dd9, 1);
			arrayremoveindex(level.var_2b5a36e1, self.var_bd027dd9, 1);
		}
	}
	else
	{
		if(newval == 1)
		{
			/#
				assert(self.id < 2048);
			#/
			if(self.id >= 2048)
			{
				return;
			}
			self.var_bd027dd9 = namespace_ad5a0cd6::function_1f0def85(self);
			self.var_8e092725 = 0;
			if(var_be90d3da)
			{
				self.var_8e092725 = -1;
			}
			if(self.id != 32767 && self.id < function_8322cf16())
			{
				self.var_a6762160 = function_b1702735(self.id).var_a6762160;
				self function_1fe1281(localclientnum, clientfield::get("dynamic_item_drop_count"));
			}
			arrayremovevalue(level.var_a4a4012e, undefined, 1);
			level.var_a4a4012e[self.var_bd027dd9] = self;
			item_world::function_b78a9820(localclientnum);
			player = function_5c10bd79(localclientnum);
			player item_world::show_item(localclientnum, self.var_bd027dd9, !var_be90d3da);
			if(isplayer(player) && distance2dsquared(self.origin, player.origin) <= sqr(1350))
			{
				player.var_506495f9 = 1;
				var_8040e225 = item_world::function_a7e98a1a(localclientnum);
				model = self item_world::function_7731d23c(var_8040e225);
				if(isdefined(model))
				{
					model show();
					item_world::function_84964a9e(localclientnum, self.var_a6762160, model, self.var_bd027dd9);
				}
			}
			namespace_b376ff3f::function_b1136fc8(localclientnum, self);
		}
		else if(newval == 2 || newval == 3)
		{
			self.var_8e092725 = gettime();
			self.var_bd027dd9 = namespace_ad5a0cd6::function_1f0def85(self);
			if(newval == 2)
			{
				item_world::function_3de69770(localclientnum, self);
				namespace_b376ff3f::function_31868137(localclientnum, self);
			}
			else
			{
				namespace_b376ff3f::function_d1da833d(localclientnum, self);
			}
			item_world::function_b78a9820(localclientnum);
			item_world::function_2990e5f(localclientnum, self);
			if(isdefined(self.var_bd027dd9) && getdvarint(#"hash_99bb0233e482c77", 0))
			{
				level.var_a4a4012e[self.var_bd027dd9] = undefined;
			}
			player = function_5c10bd79(localclientnum);
			player item_world::function_222205a3(localclientnum, self.var_bd027dd9);
		}
	}
}

/*
	Name: function_1a45bc2a
	Namespace: item_drop
	Checksum: 0xCDE735FA
	Offset: 0x9E8
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1a45bc2a(item)
{
	if(!isdefined(item))
	{
		return false;
	}
	if(!isdefined(item.type) || (item.type != #"scriptmover" && item.type != #"missile"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_fd47982d
	Namespace: item_drop
	Checksum: 0x6F3B7CF5
	Offset: 0xA68
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function function_fd47982d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.id) || !isdefined(self.var_a6762160))
	{
		return;
	}
	self function_1fe1281(fieldname, bwastimejump);
}

/*
	Name: function_1fe1281
	Namespace: item_drop
	Checksum: 0x949B39B8
	Offset: 0xAF0
	Size: 0x1A4
	Parameters: 2
	Flags: Linked
*/
function function_1fe1281(localclientnum, newval)
{
	if(!isdefined(self))
	{
		return;
	}
	/#
		assert(isdefined(self.id));
	#/
	/#
		assert(isdefined(self.var_a6762160));
	#/
	if(!isdefined(self.id) || !isdefined(self.var_a6762160))
	{
		return;
	}
	if(self.var_a6762160.itemtype === #"ammo" || self.var_a6762160.itemtype === #"armor" || self.var_a6762160.itemtype === #"weapon")
	{
		if(isdefined(self.amount) && newval !== self.amount)
		{
			namespace_b376ff3f::function_31868137(localclientnum, self);
		}
		self.amount = newval;
		self.count = 1;
	}
	else
	{
		if(isdefined(self.count) && newval !== self.count)
		{
			namespace_b376ff3f::function_31868137(localclientnum, self);
		}
		self.amount = 0;
		self.count = newval;
	}
	item_world::function_b78a9820(localclientnum);
}

/*
	Name: function_a517a859
	Namespace: item_drop
	Checksum: 0x48BFC6F5
	Offset: 0xCA0
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function function_a517a859(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self.id = self getitemindex();
	item_world::function_1b11e73c();
	if(!function_1a45bc2a(self))
	{
		return;
	}
	self function_67189b6b(fieldname, bwastimejump);
}

/*
	Name: function_e7bb925a
	Namespace: item_drop
	Checksum: 0xBB9EBF51
	Offset: 0xD60
	Size: 0x14C
	Parameters: 7
	Flags: Linked
*/
function function_e7bb925a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	item_world::function_1b11e73c();
	if(bwastimejump == 1)
	{
		self.var_bad13452 = 0;
	}
	else if(bwastimejump == 2)
	{
		self.var_bad13452 = 2;
	}
	level.var_624588d5[level.var_624588d5.size] = self;
	player = function_5c10bd79(fieldname);
	if(isplayer(player) && distance2dsquared(self.origin, player.origin) <= sqr(1350))
	{
		item_world::function_a4886b1e(fieldname, undefined, self);
	}
}

/*
	Name: function_63226f88
	Namespace: item_drop
	Checksum: 0x18AE5F9D
	Offset: 0xEB8
	Size: 0xBA
	Parameters: 7
	Flags: Linked
*/
function function_63226f88(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	item_world::function_1b11e73c();
	if(bwastimejump == 0)
	{
		self.var_ed175c5 = 0;
	}
	else
	{
		if(bwastimejump == 1)
		{
			self.var_ed175c5 = 1;
		}
		else if(bwastimejump == 2)
		{
			self.var_ed175c5 = 2;
		}
	}
}

/*
	Name: function_45f94325
	Namespace: item_drop
	Checksum: 0x3E768515
	Offset: 0xF80
	Size: 0xD6
	Parameters: 7
	Flags: Linked
*/
function function_45f94325(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	item_world::function_1b11e73c();
	if(!isdefined(self.var_bd027dd9))
	{
		self.var_bd027dd9 = namespace_ad5a0cd6::function_1f0def85(self);
	}
	level.var_2b5a36e1[self.var_bd027dd9] = self;
	self.var_f4522f8c = getservertime(bwastimejump) + randomintrange(0, 500);
}

