#using scripts\killstreaks\killstreak_detect.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using script_4daa124bc391e7ed;

#namespace killstreak_bundles;

/*
	Name: spawned
	Namespace: killstreak_bundles
	Checksum: 0xB0B3969F
	Offset: 0x78
	Size: 0xF4
	Parameters: 2
	Flags: Linked
*/
function spawned(local_client_num, bundle)
{
	self.var_22a05c26 = bundle;
	if(isdefined(bundle.var_7249d50f) && bundle.var_7249d50f > 0)
	{
		self enablevisioncircle(local_client_num, bundle.var_7249d50f);
	}
	if(bundle.var_101cf227 === 1)
	{
		self enableonradar();
	}
	if(bundle.var_101cf227 === 1)
	{
		self enableonradar();
	}
	if(bundle.var_bea37bdc === 1)
	{
		self namespace_9bcd7d72::function_bdda909b();
	}
	killstreak_detect::function_8ac48939(bundle);
}

/*
	Name: function_48e9536e
	Namespace: killstreak_bundles
	Checksum: 0xA93681D3
	Offset: 0x178
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function function_48e9536e()
{
	return self.var_22a05c26;
}

