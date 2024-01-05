#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_6b71c9befed901f2;
#using script_75c3996cce8959f7;
#using script_71603a58e2da0698;
#using script_30c7fb449869910;
#using script_771f5bff431d8d57;
#using script_42cbbdcd1e160063;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using script_18910f59cc847b42;
#using scripts\core_common\struct.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_ec06fe4a;

/*
	Name: function_b25d0052
	Namespace: namespace_ec06fe4a
	Checksum: 0x8A4A8B3E
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b25d0052()
{
	level notify(2021670285);
}

/*
	Name: function_73d79e7d
	Namespace: namespace_ec06fe4a
	Checksum: 0x4650E45
	Offset: 0x158
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_73d79e7d(parent, offset)
{
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	self endon(#"entityshutdown", #"death");
	while(isdefined(parent))
	{
		self.origin = parent.origin + offset;
		waitframe(1);
	}
	self delete();
}

/*
	Name: function_d55f042c
	Namespace: namespace_ec06fe4a
	Checksum: 0xA1DB2625
	Offset: 0x1F0
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_d55f042c(other, note)
{
	if(!isdefined(other))
	{
		return;
	}
	self endon(#"entityshutdown", #"death");
	if(isplayer(other))
	{
		if(note == "disconnect")
		{
			other waittill(note);
		}
		else
		{
			other waittill(note, #"disconnect");
		}
	}
	else
	{
		other waittill(note);
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_e22ae9b3
	Namespace: namespace_ec06fe4a
	Checksum: 0xCC746F9A
	Offset: 0x2B0
	Size: 0xA2
	Parameters: 5
	Flags: Linked
*/
function function_e22ae9b3(localclientnum, origin, modelname, angles, targetname)
{
	if(!isdefined(modelname))
	{
		modelname = "tag_origin";
	}
	if(!function_3238d10d(origin))
	{
		return;
	}
	mdl = util::spawn_model(localclientnum, modelname, origin, angles);
	if(isdefined(mdl) && isdefined(targetname))
	{
		mdl.targetname = targetname;
	}
	return mdl;
}

