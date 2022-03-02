#using script_140d5347de8af85c;
#using script_65fbfb5ecb1f899e;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_594b67e;

/*
	Name: function_41f076ea
	Namespace: namespace_594b67e
	Checksum: 0xF164722A
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_41f076ea()
{
	level notify(923373214);
}

/*
	Name: function_89f2df9
	Namespace: namespace_594b67e
	Checksum: 0xCDBB6C0F
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_208cc96e397aed88", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_594b67e
	Checksum: 0xFD85A0EA
	Offset: 0x148
	Size: 0xDC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "link_to_camera", 1, 2, "int", &link_to_camera, 0, 0);
	clientfield::register("actor", "link_to_camera", 1, 2, "int", &link_to_camera, 0, 0);
	clientfield::register("toplayer", "fake_ads", 1, 1, "int", &fake_ads, 0, 0);
}

/*
	Name: link_to_camera
	Namespace: namespace_594b67e
	Checksum: 0xE710E11D
	Offset: 0x230
	Size: 0xB4
	Parameters: 7
	Flags: Linked, Private
*/
function private link_to_camera(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	player = function_5c10bd79(binitialsnap);
	if(bwastimejump)
	{
		self thread function_bd9c7275(fieldname, bwastimejump);
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
	Checksum: 0x4E47E452
	Offset: 0x2F0
	Size: 0x14C
	Parameters: 7
	Flags: Linked, Private
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
	Checksum: 0x223FB46B
	Offset: 0x448
	Size: 0x124
	Parameters: 2
	Flags: Linked, Private
*/
function private function_bd9c7275(var_192ca300, newtype)
{
	self notify(#"hash_97425a408a077df");
	self endon(#"hash_97425a408a077df");
	if(is_true(var_192ca300) && is_true(newtype) && var_192ca300 != newtype)
	{
		self unlinkfromcamera();
	}
	if((isdefined(newtype) ? newtype : 1) == 2)
	{
		self linktocamera(4, (0, 0, 0));
	}
	else
	{
		self linktocamera(4, vectorscale((0, 0, -1), 60));
	}
	self waittill(#"death", #"entitydeleted");
	self unlinkfromcamera();
}

