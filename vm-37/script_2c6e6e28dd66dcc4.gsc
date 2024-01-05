#using script_17a9d06bf819b2d3;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_9d3ef6c5;

/*
	Name: __init__system__
	Namespace: namespace_9d3ef6c5
	Checksum: 0x99BED347
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3c412421c33b7764", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9d3ef6c5
	Checksum: 0xFCD920E7
	Offset: 0x120
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	init_clientfields();
	namespace_5b1144e::function_5ae4a10c(undefined, "aether_tunnel", #"hash_4a0616e4966dcff5", undefined, #"hash_7d007703c89ea64a");
}

/*
	Name: init_clientfields
	Namespace: namespace_9d3ef6c5
	Checksum: 0x236F83F1
	Offset: 0x178
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("scriptmover", "" + #"hash_56ce10c39906bf70", 1, 2, "int", &function_1fad5dd0, 0, 0);
}

/*
	Name: function_1fad5dd0
	Namespace: namespace_9d3ef6c5
	Checksum: 0x40AAEA12
	Offset: 0x1E0
	Size: 0x1EC
	Parameters: 7
	Flags: Linked
*/
function function_1fad5dd0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.fx = util::playfxontag(fieldname, #"hash_76a47d3490330bb6", self, "tag_origin");
		self.sfx = self playloopsound("zmb_darkaether_portal_lp", undefined, vectorscale((1, 0, 0), 25));
		self function_bc183609(fieldname);
	}
	else
	{
		if(bwastimejump == 2)
		{
			self.fx = util::playfxontag(fieldname, #"hash_11996c3130b523ff", self, "tag_origin");
			self.sfx = self playloopsound("zmb_darkaether_portal_lp", undefined, vectorscale((1, 0, 0), 25));
			self function_bc183609(fieldname);
		}
		else if(bwastimejump == 0)
		{
			if(isdefined(self.fx))
			{
				stopfx(fieldname, self.fx);
				self.fx = undefined;
			}
			if(isdefined(self.sfx))
			{
				self stoploopsound(self.sfx);
				self.sfx = undefined;
			}
			if(isdefined(self.var_520069d0))
			{
				self.var_520069d0 delete();
			}
		}
	}
}

/*
	Name: function_bc183609
	Namespace: namespace_9d3ef6c5
	Checksum: 0xC4E963AB
	Offset: 0x3D8
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bc183609(localclientnum)
{
	if(isdefined(self.var_520069d0))
	{
		return;
	}
	self.var_520069d0 = util::spawn_model(localclientnum, #"hash_753879ed23d447bb", self.origin);
	self.var_520069d0.var_fc558e74 = "aether_tunnel";
	self.var_520069d0 function_619a5c20();
}

