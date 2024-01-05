#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\mp_common\laststand.csc;

#namespace vip;

/*
	Name: main
	Namespace: vip
	Checksum: 0x12285418
	Offset: 0x100
	Size: 0x10C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::function_5b7d846d("hudItems.war.attackingTeam", #"hash_11ea1e04b846f98e", #"attackingteam", 1, 2, "int", undefined, 0, 1);
	clientfield::register("allplayers", "vip_keyline", 1, 1, "int", &vip_keyline, 0, 1);
	clientfield::register("toplayer", "vip_ascend_postfx", 1, 1, "int", &vip_ascend_postfx, 0, 0);
	callback::on_localclient_connect(&on_localclient_connect);
}

/*
	Name: on_localclient_connect
	Namespace: vip
	Checksum: 0x2FDFA840
	Offset: 0x218
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function on_localclient_connect(localclientnum)
{
	setuimodelvalue(createuimodel(function_5f72e972(#"hash_410fe12a68d6e801"), "vipClientNum"), -1);
}

/*
	Name: vip_keyline
	Namespace: vip
	Checksum: 0x6A77180E
	Offset: 0x280
	Size: 0x1D4
	Parameters: 7
	Flags: None
*/
function vip_keyline(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death", #"disconnect");
	self util::waittill_dobj(fieldname);
	var_5f682f83 = function_9b3f0ed1(fieldname);
	localplayer = function_5c10bd79(fieldname);
	if(bwastimejump)
	{
		var_c4c5aa27 = getuimodel(function_5f72e972(#"hash_410fe12a68d6e801"), "vipClientNum");
		setuimodelvalue(var_c4c5aa27, self getentitynumber());
		if(self.team == var_5f682f83 && self != localplayer && !self function_d2503806(#"hash_aa2ba3bf66e25d2"))
		{
			self playrenderoverridebundle(#"hash_aa2ba3bf66e25d2");
		}
	}
	else if(self function_d2503806(#"hash_aa2ba3bf66e25d2"))
	{
		self stoprenderoverridebundle(#"hash_aa2ba3bf66e25d2");
	}
}

/*
	Name: vip_ascend_postfx
	Namespace: vip
	Checksum: 0xA9D0504F
	Offset: 0x460
	Size: 0xB4
	Parameters: 7
	Flags: None
*/
function vip_ascend_postfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death", #"disconnect");
	if(bwastimejump)
	{
		self postfx::playpostfxbundle(#"hash_19450de64ead5f8e");
	}
	else
	{
		self postfx::stoppostfxbundle(#"hash_19450de64ead5f8e");
	}
}

