#using scripts\core_common\system_shared.csc;
#using scripts\core_common\animation_shared.csc;

#namespace namespace_80c07c34;

/*
	Name: __init__system__
	Namespace: namespace_80c07c34
	Checksum: 0x3AF9A28E
	Offset: 0xF8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_75bfc88140adb680", &function_c7f33cce, &function_fa076c68, undefined, undefined);
}

/*
	Name: function_c7f33cce
	Namespace: namespace_80c07c34
	Checksum: 0x59512928
	Offset: 0x150
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c7f33cce()
{
	function_ad272ef4();
	function_90ceecf8();
	function_7c9b0132();
	function_bc948200();
}

/*
	Name: function_fa076c68
	Namespace: namespace_80c07c34
	Checksum: 0x80F724D1
	Offset: 0x1A0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fa076c68()
{
}

/*
	Name: function_ad272ef4
	Namespace: namespace_80c07c34
	Checksum: 0x4C6824BF
	Offset: 0x1B0
	Size: 0x20
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ad272ef4()
{
	if(!isdefined(level._fx))
	{
		level._fx = {};
	}
}

/*
	Name: function_90ceecf8
	Namespace: namespace_80c07c34
	Checksum: 0x8559295F
	Offset: 0x1D8
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_90ceecf8()
{
	animation::add_notetrack_func("vfx_cp_util::fire_weapon", &fire_weapon);
	animation::add_notetrack_func("vfx_cp_util::start_firing_weapon", &function_7b038ec3);
	animation::add_notetrack_func("vfx_cp_util::stop_firing_weapon", &function_e6084ba1);
}

/*
	Name: function_7c9b0132
	Namespace: namespace_80c07c34
	Checksum: 0x80F724D1
	Offset: 0x260
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7c9b0132()
{
}

/*
	Name: function_bc948200
	Namespace: namespace_80c07c34
	Checksum: 0x80F724D1
	Offset: 0x270
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bc948200()
{
}

/*
	Name: function_5da462f3
	Namespace: namespace_80c07c34
	Checksum: 0x29FB0D31
	Offset: 0x280
	Size: 0x12C
	Parameters: 2
	Flags: Private
*/
function private function_5da462f3(startpos, angles)
{
	/#
		forward = anglestoforward(angles);
		right = anglestoright(angles);
		up = anglestoup(angles);
		endpos = startpos + vectorscale(forward, 1000);
		line(startpos, endpos, (1, 0, 0), 1, 1, 10);
		endpos = startpos + vectorscale(right, 250);
		line(startpos, endpos, (0, 1, 0), 1, 1, 10);
		endpos = startpos + vectorscale(up, 250);
		line(startpos, endpos, (0, 0, 1), 1, 1, 10);
	#/
}

/*
	Name: fire_weapon
	Namespace: namespace_80c07c34
	Checksum: 0x2B241EA3
	Offset: 0x3B8
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function fire_weapon(parms)
{
	self endon(#"death");
	if(!isdefined(self.localclientnum) || !isdefined(self.weapon))
	{
		/#
			println("");
		#/
		return;
	}
	startpos = self gettagorigin("tag_flash");
	angles = self gettagangles("tag_flash");
	if(isdefined(self.weapon.name) && (isdefined(startpos) && isdefined(angles)) && self.weapon.name != #"none")
	{
		self magicbullet(self.weapon, startpos, angles);
	}
}

/*
	Name: function_7b038ec3
	Namespace: namespace_80c07c34
	Checksum: 0x5CF4A6DE
	Offset: 0x4E0
	Size: 0xEE
	Parameters: 1
	Flags: Linked
*/
function function_7b038ec3(parms)
{
	self notify("cc0866372ca2bf9");
	self endon("cc0866372ca2bf9");
	self endon(#"death", #"hash_53fdcb0020b4588c");
	if(!isdefined(self.localclientnum) || !isdefined(self.weapon))
	{
		/#
			println("");
		#/
		return;
	}
	delay = (isdefined(self.weapon.firetime) ? self.weapon.firetime : 0.09);
	while(true)
	{
		self fire_weapon(parms);
		wait(delay);
	}
}

/*
	Name: function_e6084ba1
	Namespace: namespace_80c07c34
	Checksum: 0x75831A60
	Offset: 0x5D8
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_e6084ba1(parms)
{
	self notify(#"hash_53fdcb0020b4588c");
}

