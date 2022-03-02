#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace vehicle;

/*
	Name: function_e599db04
	Namespace: vehicle
	Checksum: 0x9C7CB3C
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e599db04()
{
	level notify(66008352);
}

#namespace namespace_964fbfb5;

/*
	Name: function_89f2df9
	Namespace: namespace_964fbfb5
	Checksum: 0x30E67605
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_efc308ec898ff43", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_964fbfb5
	Checksum: 0x2B70A770
	Offset: 0x140
	Size: 0xA4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level._effect[#"plane_ambient"] = #"hash_3cb3a6fc9eb00337";
	level._effect[#"plane_ambient_high_alt"] = #"hash_3919b64dc762cab2";
	vehicle::function_2f97bc52("vehicle_t9_plane_flyable_prototype", &function_58e95b55);
	vehicle::function_cd2ede5("vehicle_t9_plane_flyable_prototype", &function_84f28fd9);
}

/*
	Name: function_58e95b55
	Namespace: namespace_964fbfb5
	Checksum: 0x6C19AB7E
	Offset: 0x1F0
	Size: 0x66
	Parameters: 2
	Flags: None
*/
function function_58e95b55(localclientnum, vehicle)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	vehicle thread function_c6d5a97d(localclientnum);
	if(!isdefined(vehicle.var_3a2e004d))
	{
		vehicle.var_3a2e004d = [];
	}
}

/*
	Name: function_84f28fd9
	Namespace: namespace_964fbfb5
	Checksum: 0x9630D11A
	Offset: 0x260
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_84f28fd9(localclientnum, vehicle)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	vehicle thread function_c0119d33(localclientnum);
}

/*
	Name: function_7a5dc47e
	Namespace: namespace_964fbfb5
	Checksum: 0x44E13D3F
	Offset: 0x2B8
	Size: 0x98
	Parameters: 3
	Flags: None
*/
function function_7a5dc47e(localclientnum, height, fx)
{
	self endon(#"death", #"hash_2a08d043fde0f8b1");
	while(true)
	{
		if(self.origin[2] < height)
		{
			self function_bc80c148(localclientnum, fx);
			self thread function_b57d31e4(localclientnum, height, fx);
			return;
		}
		wait(1);
	}
}

/*
	Name: function_b57d31e4
	Namespace: namespace_964fbfb5
	Checksum: 0x396CC6F8
	Offset: 0x358
	Size: 0xD8
	Parameters: 3
	Flags: None
*/
function function_b57d31e4(localclientnum, height, fx)
{
	self endon(#"death", #"hash_2a08d043fde0f8b1");
	while(true)
	{
		if(isdefined(self.var_3a2e004d[fx]))
		{
			return;
		}
		if(self.origin[2] > height + 100)
		{
			self.var_3a2e004d[fx] = util::playfxontag(localclientnum, level._effect[fx], self, "tag_origin");
			self thread function_7a5dc47e(localclientnum, 3000, fx);
			return;
		}
		wait(1);
	}
}

/*
	Name: function_c6d5a97d
	Namespace: namespace_964fbfb5
	Checksum: 0xF3492B9B
	Offset: 0x438
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_c6d5a97d(localclientnum)
{
	function_b57d31e4(localclientnum, 3000, "plane_ambient");
	function_b57d31e4(localclientnum, 20000, "plane_ambient_high_alt");
}

/*
	Name: function_bc80c148
	Namespace: namespace_964fbfb5
	Checksum: 0x44F350A3
	Offset: 0x490
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function function_bc80c148(localclientnum, fx)
{
	if(isdefined(self.var_3a2e004d[fx]))
	{
		stopfx(localclientnum, self.var_3a2e004d[fx]);
		self.var_3a2e004d[fx] = undefined;
	}
}

/*
	Name: function_c0119d33
	Namespace: namespace_964fbfb5
	Checksum: 0x28C58A9D
	Offset: 0x4F8
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_c0119d33(localclientnum)
{
	self notify(#"hash_2a08d043fde0f8b1");
	function_bc80c148(localclientnum, "plane_ambient");
	function_bc80c148(localclientnum, "plane_ambient_high_alt");
}

