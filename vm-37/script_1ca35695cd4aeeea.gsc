#using script_2c8f0cd222d353a3;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace weapons;

/*
	Name: init_shared
	Namespace: weapons
	Checksum: 0x64E2FE31
	Offset: 0xC0
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	level.weaponnone = getweapon(#"none");
	clientfield::function_a8bbc967("hudItems.pickupHintWeaponIndex", #"hud_items", #"hash_5f5aa9f7242b45a8", 1, 10, "int", &function_160c9d99, 0, 0);
	namespace_daf1661f::init();
	callback::on_localclient_connect(&on_localclient_connect);
}

/*
	Name: on_localclient_connect
	Namespace: weapons
	Checksum: 0x568BFA48
	Offset: 0x188
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private on_localclient_connect(localclientnum)
{
	if(!isdefined(level.var_d46a9367))
	{
		level.var_d46a9367 = [];
	}
	objid = util::getnextobjid(localclientnum);
	objective_add(localclientnum, objid, "invisible", #"weapon_pickup");
	objective_setprogress(localclientnum, objid, 0);
	objective_setstate(localclientnum, objid, "invisible");
	level.var_d46a9367[localclientnum] = objid;
}

/*
	Name: function_160c9d99
	Namespace: weapons
	Checksum: 0xABFEE668
	Offset: 0x248
	Size: 0x124
	Parameters: 7
	Flags: Linked
*/
function function_160c9d99(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.var_d46a9367))
	{
		level.var_d46a9367 = [];
	}
	objid = level.var_d46a9367[fieldname];
	if(!isdefined(objid))
	{
		return;
	}
	if(bwastimejump)
	{
		var_9b882d22 = function_ee839fac(fieldname);
		if(isdefined(var_9b882d22))
		{
			objective_setposition(fieldname, objid, var_9b882d22.origin);
		}
		objective_setstate(fieldname, objid, "active");
		objective_setgamemodeflags(fieldname, objid, 0);
	}
	else
	{
		objective_setstate(fieldname, objid, "invisible");
	}
}

