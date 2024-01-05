#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace turret_shared;

/*
	Name: function_85cd7cf1
	Namespace: turret_shared
	Checksum: 0x7F447A95
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_85cd7cf1()
{
	level notify(1552040614);
}

#namespace turret;

/*
	Name: __init__system__
	Namespace: turret
	Checksum: 0x8D63A055
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"turret", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: turret
	Checksum: 0xE97704BA
	Offset: 0x110
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "toggle_lensflare", 1, 1, "int", &field_toggle_lensflare, 0, 0);
}

/*
	Name: field_toggle_lensflare
	Namespace: turret
	Checksum: 0x2F26132D
	Offset: 0x168
	Size: 0x10E
	Parameters: 7
	Flags: Linked
*/
function field_toggle_lensflare(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.scriptbundlesettings))
	{
		return;
	}
	settings = getscriptbundle(self.scriptbundlesettings);
	if(!isdefined(settings))
	{
		return;
	}
	if(isdefined(self.turret_lensflare_id))
	{
		deletefx(fieldname, self.turret_lensflare_id);
		self.turret_lensflare_id = undefined;
	}
	if(bwastimejump)
	{
		if(isdefined(settings.lensflare_fx) && isdefined(settings.lensflare_tag))
		{
			self.turret_lensflare_id = util::playfxontag(fieldname, settings.lensflare_fx, self, settings.lensflare_tag);
		}
	}
}

