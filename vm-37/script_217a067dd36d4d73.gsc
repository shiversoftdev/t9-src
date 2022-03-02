#using script_2a30ac7aa0ee8988;
#using script_54f593f5beb1464a;

#namespace namespace_1bfb9327;

/*
	Name: __init__
	Namespace: namespace_1bfb9327
	Checksum: 0x5C903FD
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	function_a38f195f();
}

/*
	Name: function_a38f195f
	Namespace: namespace_1bfb9327
	Checksum: 0x11DB9D23
	Offset: 0x90
	Size: 0x5DC
	Parameters: 0
	Flags: None
*/
function function_a38f195f()
{
	var_87d0eef8 = &namespace_b0722f43::function_63bfe27;
	var_74257310 = &namespace_b0722f43::function_6da5e673;
	var_f8a4c541 = &namespace_b0722f43::function_6991057;
	if(is_true(getgametypesetting(#"hash_2e25d475b271a700")))
	{
		namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_745d80b3e4f28da1", #"hash_56e573d15c6402bc");
	}
	if(is_true(getgametypesetting(#"hash_189c8ca60451e9e9")))
	{
		maxteamplayers = (isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1);
		if(maxteamplayers == 1)
		{
			namespace_b0722f43::function_2749fcc3(#"hash_47a63bc4a605b45f", #"hash_253b37ca99acac09", #"hash_4fcc3b0eb71962f5", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_779cba7072600ad1", #"hash_253b37ca99acac09", #"hash_4fcc3b0eb71962f5", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_75cc919e81dc8b19", #"hash_253b37ca99acac09", #"hash_4fcc3b0eb71962f5", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_6056a687e77f7229", #"hash_253b37ca99acac09", #"hash_4fcc3b0eb71962f5", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_550872d1d1938f94", #"hash_253b37ca99acac09", #"hash_4fcc3b0eb71962f5", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_308758c2f91807aa", #"hash_253b37ca99acac09", #"hash_4fcc3b0eb71962f5", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_a211476d10546c", #"hash_253b37ca99acac09", #"hash_4fcc3b0eb71962f5", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_7d028af90dad72ae", #"hash_253b37ca99acac09", #"hash_4fcc3b0eb71962f5", 2147483647);
		}
		else if(maxteamplayers == 2)
		{
			namespace_b0722f43::function_2749fcc3(#"hash_47a63bc4a605b45f", #"hash_253b37ca99acac09", #"hash_6da9aef11a9507fe", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_779cba7072600ad1", #"hash_253b37ca99acac09", #"hash_6da9aef11a9507fe", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_75cc919e81dc8b19", #"hash_253b37ca99acac09", #"hash_6da9aef11a9507fe", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_6056a687e77f7229", #"hash_253b37ca99acac09", #"hash_6da9aef11a9507fe", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_550872d1d1938f94", #"hash_253b37ca99acac09", #"hash_6da9aef11a9507fe", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_308758c2f91807aa", #"hash_253b37ca99acac09", #"hash_6da9aef11a9507fe", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_a211476d10546c", #"hash_253b37ca99acac09", #"hash_6da9aef11a9507fe", 2147483647);
			namespace_b0722f43::function_2749fcc3(#"hash_7d028af90dad72ae", #"hash_253b37ca99acac09", #"hash_6da9aef11a9507fe", 2147483647);
		}
	}
}

