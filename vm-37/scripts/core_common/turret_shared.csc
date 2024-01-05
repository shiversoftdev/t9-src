#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace turret;

/*
	Name: __init__system__
	Namespace: turret
	Checksum: 0xF551AE58
	Offset: 0xA8
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
	Checksum: 0x8D219408
	Offset: 0xF0
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
	Checksum: 0x64F8558F
	Offset: 0x148
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

