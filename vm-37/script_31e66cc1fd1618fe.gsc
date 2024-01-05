#using script_140d5347de8af85c;
#using script_65fbfb5ecb1f899e;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_594b67e;

/*
	Name: __init__system__
	Namespace: namespace_594b67e
	Checksum: 0xF4D67B17
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_208cc96e397aed88", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_594b67e
	Checksum: 0x34B4936A
	Offset: 0x128
	Size: 0xDC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "link_to_camera", 1, 1, "int", &link_to_camera, 0, 0);
	clientfield::register("actor", "link_to_camera", 1, 1, "int", &link_to_camera, 0, 0);
	clientfield::register("toplayer", "fake_ads", 1, 1, "int", &fake_ads, 0, 0);
}

/*
	Name: link_to_camera
	Namespace: namespace_594b67e
	Checksum: 0x57923B01
	Offset: 0x210
	Size: 0xAC
	Parameters: 7
	Flags: Private
*/
function private link_to_camera(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	player = function_5c10bd79(fieldname);
	if(bwastimejump)
	{
		self thread function_bd9c7275();
	}
	else
	{
		self notify(#"hash_97425a408a077df");
		self unlinkfromcamera();
	}
}

/*
	Name: fake_ads
	Namespace: namespace_594b67e
	Checksum: 0xCA2262BF
	Offset: 0x2C8
	Size: 0x14C
	Parameters: 7
	Flags: Private
*/
function private fake_ads(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify("2e682ee9f9b29c84");
	self endon("2e682ee9f9b29c84");
	if(bwastimejump && bwastimejump != fieldname)
	{
		self easing::function_f95cb457(undefined, 20.64, 0.2, #"sine");
	}
	else if(!bwastimejump && bwastimejump != fieldname)
	{
		self easing::function_f95cb457(undefined, 14.64, 0.2, #"sine");
		while(true)
		{
			result = undefined;
			result = self waittill(#"hash_133229f708f5d10");
			if(result.target_value === 14.64)
			{
				self function_9298adaf(binitialsnap);
				break;
			}
		}
	}
}

/*
	Name: function_bd9c7275
	Namespace: namespace_594b67e
	Checksum: 0xCC511EF3
	Offset: 0x420
	Size: 0x84
	Parameters: 0
	Flags: Private
*/
function private function_bd9c7275()
{
	self notify(#"hash_97425a408a077df");
	self endon(#"hash_97425a408a077df");
	self linktocamera(4, vectorscale((0, 0, -1), 60));
	self waittill(#"death", #"entitydeleted");
	self unlinkfromcamera();
}

