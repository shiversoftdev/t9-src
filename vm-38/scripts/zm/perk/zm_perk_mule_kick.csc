#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace zm_perk_mule_kick;

/*
	Name: function_88a2b828
	Namespace: zm_perk_mule_kick
	Checksum: 0x21A9155C
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_88a2b828()
{
	level notify(-1246660791);
}

/*
	Name: __init__system__
	Namespace: zm_perk_mule_kick
	Checksum: 0x1523A054
	Offset: 0x170
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_mule_kick", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_mule_kick
	Checksum: 0xB957F19
	Offset: 0x1B8
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(getgametypesetting(#"hash_616a22c5c1ebe5b8")))
	{
		return;
	}
	function_27473e44();
}

/*
	Name: function_27473e44
	Namespace: zm_perk_mule_kick
	Checksum: 0x1086DA1B
	Offset: 0x210
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_27473e44()
{
	zm_perks::register_perk_clientfields(#"hash_17e4ae593eaf4a47", &client_field_func, &callback_func);
	zm_perks::register_perk_effects(#"hash_17e4ae593eaf4a47", "mulekick_light");
	zm_perks::register_perk_init_thread(#"hash_17e4ae593eaf4a47", &init_staminup);
	zm_perks::function_f3c80d73("zombie_perk_bottle_mulekick");
}

/*
	Name: init_staminup
	Namespace: zm_perk_mule_kick
	Checksum: 0x7DCF6A08
	Offset: 0x2D0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init_staminup()
{
	if(is_true(level.enable_magic))
	{
		level._effect[#"mulekick_light"] = "zombie/fx9_perk_mulekick";
	}
}

/*
	Name: client_field_func
	Namespace: zm_perk_mule_kick
	Checksum: 0xA0B7147B
	Offset: 0x318
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function client_field_func()
{
	if(zm_utility::is_classic())
	{
		clientfield::register("scriptmover", "mule_kick_machine_rob", 13000, 1, "int", &function_b93aff53, 0, 0);
		clientfield::register("scriptmover", "mule_kick_machine_rob_buy", 13000, 1, "counter", &function_36817bc4, 0, 0);
	}
}

/*
	Name: callback_func
	Namespace: zm_perk_mule_kick
	Checksum: 0x80F724D1
	Offset: 0x3C8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function callback_func()
{
}

/*
	Name: function_b93aff53
	Namespace: zm_perk_mule_kick
	Checksum: 0x76AC7ED0
	Offset: 0x3D8
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function function_b93aff53(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(bwastimejump)
	{
		self playrenderoverridebundle(#"hash_7cb1e2c4664b70f9");
		wait(1);
		self function_f6e99a8d(#"hash_7cb1e2c4664b70f9");
		self playrenderoverridebundle(#"hash_58b55b59b9a623b0");
	}
	else
	{
		self function_f6e99a8d(#"hash_7cb1e2c4664b70f9");
		self function_f6e99a8d(#"hash_58b55b59b9a623b0");
	}
}

/*
	Name: function_36817bc4
	Namespace: zm_perk_mule_kick
	Checksum: 0x8AF74E6B
	Offset: 0x4F0
	Size: 0x54
	Parameters: 7
	Flags: Linked
*/
function function_36817bc4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self thread function_194b61fc();
}

/*
	Name: function_194b61fc
	Namespace: zm_perk_mule_kick
	Checksum: 0x72FF799D
	Offset: 0x550
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_194b61fc()
{
	self endon(#"death");
	self notify("5cfea970a8a3234a");
	self endon("5cfea970a8a3234a");
	self function_f6e99a8d(#"hash_58b55b59b9a623b0");
	self playrenderoverridebundle(#"hash_3dd4beb993077560");
	wait(9);
	self function_f6e99a8d(#"hash_3dd4beb993077560");
	self playrenderoverridebundle(#"hash_58b55b59b9a623b0");
}

