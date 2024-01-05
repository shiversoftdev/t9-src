#using script_7e3221b6c80d8cc4;
#using script_1883fa4e60abbf9f;
#using script_6c5ee33879e077f8;
#using script_3ad66e3076c279ab;
#using scripts\core_common\flag_shared.gsc;

#namespace friendly;

/*
	Name: function_82f2f286
	Namespace: friendly
	Checksum: 0xF6862BE7
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_82f2f286()
{
	level notify(-757850486);
}

#namespace namespace_32a4062b;

/*
	Name: main
	Namespace: namespace_32a4062b
	Checksum: 0x14297EC1
	Offset: 0x128
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function main()
{
	if(!isdefined(level.stealth))
	{
		namespace_393f6012::function_f9682fd();
	}
	self init_settings();
	self thread spotted_thread();
	self thread visibility_thread();
	/#
		self thread stealth_debug::function_b4d10409();
	#/
}

/*
	Name: init_settings
	Namespace: namespace_32a4062b
	Checksum: 0xEB0F0497
	Offset: 0x1B8
	Size: 0x12E
	Parameters: 0
	Flags: Linked
*/
function init_settings()
{
	/#
		assert(!isdefined(self.stealth), "");
	#/
	self.stealth = spawnstruct();
	self.stealth.spotted_list = [];
	self.stealth.funcs = [];
	self flag::init("stealth_enabled");
	self flag::init("stealth_override_goal");
	self flag::set("stealth_enabled");
	self namespace_979752dc::assign_unique_id();
	self namespace_979752dc::group_add();
	self.stealth.var_103386e8 = self namespace_979752dc::group_flag_init("stealth_spotted");
	self.stealth.bsmstate = -1;
}

/*
	Name: spotted_thread
	Namespace: namespace_32a4062b
	Checksum: 0x3AC835D0
	Offset: 0x2F0
	Size: 0x178
	Parameters: 0
	Flags: Linked
*/
function spotted_thread()
{
	self endon(#"death");
	self notify(#"spotted_thread");
	self endon(#"spotted_thread");
	while(true)
	{
		self flag::wait_till("stealth_enabled");
		self namespace_979752dc::group_flag_waitopen("stealth_spotted");
		if(!self flag::get("stealth_enabled"))
		{
			self flag::wait_till("stealth_enabled");
		}
		self thread state_hidden();
		self flag::wait_till("stealth_enabled");
		self namespace_979752dc::group_flag_wait("stealth_spotted");
		if(!self flag::get("stealth_enabled"))
		{
			self flag::wait_till("stealth_enabled");
		}
		self thread state_spotted();
	}
}

/*
	Name: state_hidden
	Namespace: namespace_32a4062b
	Checksum: 0x71709CAD
	Offset: 0x470
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function state_hidden()
{
	self thread namespace_979752dc::setbattlechatter(0);
	self.stealth.oldgrenadeammo = self.grenadeammo;
	self.grenadeammo = 0;
	self.forcesidearm = 0;
	self.dontevershoot = 1;
	self.dontattackme = 1;
	if(isdefined(self.stealth.funcs[#"hidden"]))
	{
		self namespace_b2b86d39::stealth_call_thread("hidden");
	}
}

/*
	Name: state_spotted
	Namespace: namespace_32a4062b
	Checksum: 0x27B2365E
	Offset: 0x520
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function state_spotted()
{
	/#
		assert(!isplayer(self));
	#/
	self thread namespace_979752dc::setbattlechatter(1);
	if(isdefined(self.stealth.oldgrenadeammo))
	{
		self.grenadeammo = self.stealth.oldgrenadeammo;
	}
	else
	{
		self.grenadeammo = 3;
	}
	self.dontevershoot = 0;
	self.dontattackme = 0;
	self pushplayer(0);
	if(isdefined(self.stealth.funcs[#"spotted"]))
	{
		self namespace_b2b86d39::stealth_call_thread("spotted");
	}
}

/*
	Name: getup_from_prone
	Namespace: namespace_32a4062b
	Checksum: 0x48EC4B29
	Offset: 0x618
	Size: 0x18
	Parameters: 0
	Flags: None
*/
function getup_from_prone()
{
	self endon(#"death");
}

/*
	Name: visibility_thread
	Namespace: namespace_32a4062b
	Checksum: 0x232705B2
	Offset: 0x638
	Size: 0x88
	Parameters: 0
	Flags: Linked
*/
function visibility_thread()
{
	self endon(#"death");
	self endon(#"long_death");
	while(true)
	{
		self flag::wait_till("stealth_enabled");
		if(!isdefined(self.stealth.ignore_visibility))
		{
			self.maxvisibledist = self get_detect_range();
		}
		wait(0.05);
	}
}

/*
	Name: get_detect_range
	Namespace: namespace_32a4062b
	Checksum: 0x737E5948
	Offset: 0x6C8
	Size: 0x112
	Parameters: 0
	Flags: Linked
*/
function get_detect_range()
{
	stance = self.currentpose;
	if(stance === "back")
	{
		stance = "prone";
	}
	if(self namespace_979752dc::group_spotted_flag())
	{
		detection = "spotted";
	}
	else
	{
		detection = "hidden";
	}
	range = level.stealth.detect.range[detection][stance];
	if(self flag::get("stealth_in_shadow"))
	{
		range = max(level.stealth.detect.range[#"hidden"][#"prone"], range * 0.5);
	}
	return range;
}

