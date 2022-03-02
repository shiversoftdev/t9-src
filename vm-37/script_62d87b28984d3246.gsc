#using script_35ae72be7b4fec10;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_aa1fe617;

/*
	Name: create
	Namespace: namespace_aa1fe617
	Checksum: 0x7F5E6A36
	Offset: 0x70
	Size: 0x224
	Parameters: 4
	Flags: None
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
	Checksum: 0x835C9657
	Offset: 0x2A0
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
	Checksum: 0x7E5FE8AF
	Offset: 0x300
	Size: 0xAC
	Parameters: 1
	Flags: None
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
	Checksum: 0xCE6FC278
	Offset: 0x3B8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function remove(params)
{
	if(namespace_61e6d095::exists(#"hash_71bae6f32cec8a8e"))
	{
		namespace_61e6d095::remove(#"hash_71bae6f32cec8a8e");
	}
}

