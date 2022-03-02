#using script_35ae72be7b4fec10;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_aa1fe617;

/*
	Name: function_6f053ab5
	Namespace: namespace_aa1fe617
	Checksum: 0xA91381D7
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6f053ab5()
{
	level notify(478982883);
}

/*
	Name: create
	Namespace: namespace_aa1fe617
	Checksum: 0x9A957734
	Offset: 0x90
	Size: 0x224
	Parameters: 4
	Flags: Linked
*/
function create(message, var_400e244b, pulse, endons)
{
	if(namespace_61e6d095::exists(#"hash_71bae6f32cec8a8e"))
	{
		/#
			assertmsg("");
		#/
		return;
	}
	if(isdefined(endons))
	{
		self endoncallback(&remove, endons);
	}
	namespace_61e6d095::create(#"hash_71bae6f32cec8a8e", #"hash_6e2caf9e3aa6b810");
	namespace_61e6d095::function_d5ea17f0(#"hash_71bae6f32cec8a8e", message);
	namespace_61e6d095::set_state(#"hash_71bae6f32cec8a8e", #"defaultstate");
	if(is_true(pulse))
	{
		util::delay(float(function_60d95f53()) / 1000, endons, &function_b4af2e7, 1);
	}
	if(isint(var_400e244b) || isfloat(var_400e244b))
	{
		wait(var_400e244b);
	}
	else
	{
		if(isstring(var_400e244b) || function_7a600918(var_400e244b) || isarray(var_400e244b))
		{
			self waittill(var_400e244b);
		}
		else
		{
			return;
		}
	}
	remove();
}

/*
	Name: function_cd1b9801
	Namespace: namespace_aa1fe617
	Checksum: 0x91309EDF
	Offset: 0x2C0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_cd1b9801(message)
{
	if(namespace_61e6d095::exists(#"hash_71bae6f32cec8a8e"))
	{
		namespace_61e6d095::function_d5ea17f0(#"hash_71bae6f32cec8a8e", message);
	}
}

/*
	Name: function_b4af2e7
	Namespace: namespace_aa1fe617
	Checksum: 0xC3B075E6
	Offset: 0x320
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_b4af2e7(pulse)
{
	if(namespace_61e6d095::exists(#"hash_71bae6f32cec8a8e"))
	{
		if(is_true(pulse))
		{
			namespace_61e6d095::set_state(#"hash_71bae6f32cec8a8e", #"pulse");
		}
		else
		{
			namespace_61e6d095::set_state(#"hash_71bae6f32cec8a8e", #"defaultstate");
		}
	}
}

/*
	Name: remove
	Namespace: namespace_aa1fe617
	Checksum: 0xA89A8ADA
	Offset: 0x3D8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function remove(params)
{
	if(namespace_61e6d095::exists(#"hash_71bae6f32cec8a8e"))
	{
		namespace_61e6d095::remove(#"hash_71bae6f32cec8a8e");
	}
}

