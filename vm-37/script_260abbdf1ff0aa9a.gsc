#using script_31816d064a53f516;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace zm_transform;

/*
	Name: function_70a657d8
	Namespace: zm_transform
	Checksum: 0x912AFC36
	Offset: 0xD0
	Size: 0x94
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "transformation_spawn", 1, 1, "int", &function_201c2cb7, 0, 0);
	clientfield::register("actor", "transformation_stream_split", 1, 1, "int", &function_341e5a97, 0, 0);
}

/*
	Name: function_201c2cb7
	Namespace: zm_transform
	Checksum: 0x1730C701
	Offset: 0x170
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_201c2cb7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_bf9d3071((isdefined(self.var_fab3cf78) ? self.var_fab3cf78 : #"hash_435832b390f73dff"));
}

/*
	Name: function_341e5a97
	Namespace: zm_transform
	Checksum: 0xBA4366C9
	Offset: 0x1F0
	Size: 0x15E
	Parameters: 7
	Flags: Linked
*/
function function_341e5a97(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		var_51d5c26f = self ai::function_9139c839();
		if(isdefined(var_51d5c26f) && isdefined(var_51d5c26f.var_d354164e))
		{
			foreach(var_127d3a7a in var_51d5c26f.var_d354164e)
			{
				if(self.model === var_127d3a7a.var_a3c9023c)
				{
					util::lock_model(var_127d3a7a.var_cdf1f53d);
					self thread function_8a817bd6(var_127d3a7a.var_cdf1f53d);
					break;
				}
			}
		}
	}
	else
	{
		self notify(#"unlock_model");
	}
}

/*
	Name: function_8a817bd6
	Namespace: zm_transform
	Checksum: 0xB2C80FCC
	Offset: 0x358
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_8a817bd6(model)
{
	self waittilltimeout(60, #"death", #"unlock_model");
	util::unlock_model(model);
}

