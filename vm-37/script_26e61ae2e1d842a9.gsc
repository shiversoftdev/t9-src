#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\map.csc;

#namespace namespace_1a4edaec;

/*
	Name: main
	Namespace: namespace_1a4edaec
	Checksum: 0x2F989E61
	Offset: 0x78
	Size: 0x4C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	bundle = function_9ea44286();
	if(isdefined(bundle))
	{
		callback::on_localplayer_spawned(&on_localplayer_spawned);
	}
}

/*
	Name: on_localplayer_spawned
	Namespace: namespace_1a4edaec
	Checksum: 0xD25A6B1
	Offset: 0xD0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_localplayer_spawned(localclientnum)
{
	self thread function_fe8cf253(localclientnum);
}

/*
	Name: function_9ea44286
	Namespace: namespace_1a4edaec
	Checksum: 0x595BF368
	Offset: 0x100
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function function_9ea44286()
{
	var_65792f8b = map::get_script_bundle();
	if(!isdefined(var_65792f8b))
	{
		return undefined;
	}
	if(!isdefined(var_65792f8b.var_e13ec3f3))
	{
		return undefined;
	}
	return getscriptbundle(var_65792f8b.var_e13ec3f3);
}

/*
	Name: function_fe8cf253
	Namespace: namespace_1a4edaec
	Checksum: 0xCBAA5CEB
	Offset: 0x160
	Size: 0x1E8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fe8cf253(localclientnum)
{
	self endon(#"death");
	util::waittill_dobj(localclientnum);
	bundle = function_9ea44286();
	if(isdefined(self.var_87259100))
	{
		stopfx(localclientnum, self.var_87259100);
	}
	if(isdefined(bundle.var_492662d7))
	{
		self.var_87259100 = playfxoncamera(localclientnum, bundle.var_492662d7);
	}
	if(isdefined(bundle.var_39b6fcfb))
	{
		minwait = (isdefined(bundle.var_472be987) ? bundle.var_472be987 : 0.25);
		maxwait = (isdefined(bundle.var_bce2eec7) ? bundle.var_bce2eec7 : 0.25);
		while(true)
		{
			playfxoncamera(localclientnum, bundle.var_39b6fcfb);
			/#
				minwait = (isdefined(bundle.var_472be987) ? bundle.var_472be987 : 0.25);
				maxwait = (isdefined(bundle.var_bce2eec7) ? bundle.var_bce2eec7 : 0.25);
			#/
			if(minwait <= maxwait)
			{
				wait(randomfloatrange(minwait, maxwait));
			}
			else
			{
				wait(min(minwait, maxwait));
			}
		}
	}
}

