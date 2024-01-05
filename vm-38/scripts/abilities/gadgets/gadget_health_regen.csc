#using script_6e0a2f806b25fee3;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace gadget_health_regen;

/*
	Name: function_27cd3378
	Namespace: gadget_health_regen
	Checksum: 0xC67CCCD1
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_27cd3378()
{
	level notify(-1166575855);
}

/*
	Name: __init__system__
	Namespace: gadget_health_regen
	Checksum: 0xD6E44BBE
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"gadget_health_regen", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: gadget_health_regen
	Checksum: 0x284FC557
	Offset: 0x150
	Size: 0xEC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "healthregen", 1, 1, "int", &function_31f57700, 0, 1);
	clientfield::register_clientuimodel("hudItems.healingActive", #"hud_items", #"hash_42940f86f5b624d7", 1, 1, "int", undefined, 0, 1);
	clientfield::register_clientuimodel("hudItems.numHealthPickups", #"hud_items", #"hash_6b3d8a8cbb8de782", 1, 2, "int", undefined, 0, 1);
}

/*
	Name: function_31f57700
	Namespace: gadget_health_regen
	Checksum: 0x6466B4E0
	Offset: 0x248
	Size: 0xD6
	Parameters: 7
	Flags: Linked
*/
function function_31f57700(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame() || sessionmodeiscampaigngame())
	{
		if(bwastimejump)
		{
			if(!is_true(self.var_b072e263))
			{
				self.var_b072e263 = 1;
			}
		}
		else if(is_true(self.var_b072e263))
		{
			self.var_b072e263 = undefined;
		}
	}
}

