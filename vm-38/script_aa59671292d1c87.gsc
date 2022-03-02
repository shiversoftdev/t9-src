#using script_18bc13f07baf161a;
#using script_24879e3929b5b5e9;
#using script_31b23f5316d1b26d;
#using script_36f25afcb9441942;
#using script_38635d174016f682;
#using script_64e5d3ad71ce8140;
#using script_67049b48b589d81;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_1dc364c0;

/*
	Name: function_9b48ed7e
	Namespace: namespace_1dc364c0
	Checksum: 0x41D78ED7
	Offset: 0x170
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9b48ed7e()
{
	level notify(129152749);
}

/*
	Name: init
	Namespace: namespace_1dc364c0
	Checksum: 0xBDA09FCE
	Offset: 0x190
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "dungeon_set_roomID", 1, 8, "int", &dungeon_set_roomid, 0, 0);
	clientfield::register("scriptmover", "dungeon_set_explore_state", 1, 2, "int", &function_45d79d27, 0, 0);
	namespace_c004634e::init();
	level.var_40450ea6 = &function_e71841a;
}

/*
	Name: function_45d79d27
	Namespace: namespace_1dc364c0
	Checksum: 0xC8E5634
	Offset: 0x258
	Size: 0x18C
	Parameters: 7
	Flags: Linked
*/
function function_45d79d27(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	color = undefined;
	if(isdefined(self.var_eaa645fe))
	{
		var_eaa645fe = "rg_room_" + self.var_eaa645fe;
		room = level.var_c97eeeb4[var_eaa645fe];
	}
	switch(bwastimejump)
	{
		case 0:
		{
			color = #"none";
			break;
		}
		case 1:
		{
			if(isdefined(room) && isdefined(room.var_cd42b9c0))
			{
				iconname = namespace_c004634e::function_4e886036(room) + "_reveal";
				room.var_cd42b9c0 setcompassicon(iconname);
			}
			break;
		}
		case 2:
		{
			break;
		}
	}
	if(isdefined(color) && isdefined(room) && isdefined(room.var_cd42b9c0))
	{
		room.var_cd42b9c0 function_a5edb367(color);
	}
}

/*
	Name: dungeon_set_roomid
	Namespace: namespace_1dc364c0
	Checksum: 0xDEF7D30D
	Offset: 0x3F0
	Size: 0x4E
	Parameters: 7
	Flags: Linked
*/
function dungeon_set_roomid(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_eaa645fe = bwastimejump - 1;
}

/*
	Name: function_e71841a
	Namespace: namespace_1dc364c0
	Checksum: 0x5E99B939
	Offset: 0x448
	Size: 0x384
	Parameters: 0
	Flags: Linked
*/
function function_e71841a()
{
	self.var_d8d445c4 = &function_cb06f399;
	self.walldecor = [];
	self.floordecor = [];
	self.wallbuy = [];
	var_f445d580 = self namespace_f27a9d0d::function_5165998("type", "room_center");
	if(isdefined(var_f445d580.script_parameters))
	{
		if(issubstr(var_f445d580.script_parameters, "tweakCam"))
		{
			self.tweakcam = 1;
		}
	}
	self.var_cd42b9c0 = util::spawn_model(0, "tag_origin", var_f445d580.origin, var_f445d580.angles);
	if(isdefined(self.var_cd42b9c0))
	{
		iconname = namespace_c004634e::function_4e886036(self);
		if(isdefined(iconname))
		{
			self.var_cd42b9c0 setcompassicon(iconname);
			self.var_cd42b9c0 function_811196d1(0);
			self.var_cd42b9c0 function_5e00861(1024, 1);
		}
	}
	var_c9bdb63f = self namespace_f27a9d0d::function_cee62dac("type", "wallbuy");
	foreach(var_f6198c5b in var_c9bdb63f)
	{
	}
	var_c9bdb63f = self namespace_f27a9d0d::function_cee62dac("type", "floordecor");
	foreach(var_f6198c5b in var_c9bdb63f)
	{
		self.floordecor[self.floordecor.size] = namespace_c004634e::function_6a09928b(var_f6198c5b, #"floor");
	}
	var_c9bdb63f = self namespace_f27a9d0d::function_cee62dac("type", "walldecor");
	foreach(var_f6198c5b in var_c9bdb63f)
	{
		self.walldecor[self.walldecor.size] = namespace_c004634e::function_6a09928b(var_f6198c5b, #"wall");
	}
}

/*
	Name: function_cb06f399
	Namespace: namespace_1dc364c0
	Checksum: 0xE3A4CDB3
	Offset: 0x7D8
	Size: 0x23E
	Parameters: 0
	Flags: Linked
*/
function function_cb06f399()
{
	if(isdefined(self.var_cd42b9c0))
	{
		self.var_cd42b9c0 delete();
	}
	if(isdefined(self.walldecor))
	{
		foreach(item in self.walldecor)
		{
			if(isdefined(item.fx))
			{
				deletefx(0, item.fx);
			}
			item delete();
		}
		self.walldecor = [];
	}
	if(isdefined(self.floordecor))
	{
		foreach(item in self.floordecor)
		{
			if(isdefined(item.fx))
			{
				deletefx(0, item.fx);
			}
			item delete();
		}
		self.floordecor = [];
	}
	if(isdefined(self.loot))
	{
		foreach(item in self.loot)
		{
			item.pickup = undefined;
		}
		self.loot = [];
	}
}

