#using script_1ff59bb2b15dfb4d;
#using scripts\core_common\class_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_214c1803;

/*
	Name: scalevolume
	Namespace: namespace_214c1803
	Checksum: 0xC897F9B3
	Offset: 0xD0
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace namespace_6c0cd084;

/*
	Name: __init__system__
	Namespace: namespace_6c0cd084
	Checksum: 0x6AD2E031
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_299575137124db03", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_6c0cd084
	Checksum: 0xD7E9AB69
	Offset: 0x138
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	register_clientfields();
	level.var_6c0cd084 = new class_d0a0a887();
	[[ level.var_6c0cd084 ]]->init(8);
	/#
		function_5ac4dc99("", 0);
	#/
}

/*
	Name: register_clientfields
	Namespace: namespace_6c0cd084
	Checksum: 0x7E4817E5
	Offset: 0x1A8
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private register_clientfields()
{
	clientfield::register("actor", "threat_sight", 1, 6, "int", &function_5010aab6, 0, 0);
	clientfield::register("actor", "threat_state", 1, 2, "int", &function_5010aab6, 0, 0);
}

/*
	Name: function_ac3d4bc
	Namespace: namespace_6c0cd084
	Checksum: 0xFAB93BC7
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ac3d4bc()
{
	return float(self.var_214c1803.var_97c4563c) + self.var_214c1803.sight;
}

/*
	Name: function_8991ddb4
	Namespace: namespace_6c0cd084
	Checksum: 0x9C2418E3
	Offset: 0x288
	Size: 0x3DA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8991ddb4(localclientnum)
{
	/#
		assert(!isdefined(self.var_214c1803.elem));
	#/
	self.var_214c1803.var_1911547e = [[ level.var_6c0cd084 ]]->function_65cdd2df(self);
	if(!isdefined(self.var_214c1803.var_1911547e))
	{
		var_afda3384 = self function_ac3d4bc();
		lowest = undefined;
		var_5b9574e0 = undefined;
		foreach(guy in [[ level.var_6c0cd084 ]]->function_85a5add5())
		{
			/#
				assert(isdefined(guy.var_214c1803));
			#/
			score = guy function_ac3d4bc();
			if(!isdefined(lowest) || score < lowest)
			{
				/#
					assert(guy !== self);
				#/
				lowest = score;
				var_5b9574e0 = guy;
			}
		}
		if(isdefined(lowest) && lowest < var_afda3384)
		{
			var_5b9574e0 function_a2d377b5(localclientnum);
			self.var_214c1803.var_1911547e = [[ level.var_6c0cd084 ]]->function_65cdd2df(self);
		}
	}
	if(isdefined(self.var_214c1803.var_1911547e))
	{
		self.var_214c1803.elem = stealth_meter_display::register_clientside();
		if(!self.var_214c1803.elem stealth_meter_display::is_open(localclientnum))
		{
			self.var_214c1803.elem stealth_meter_display::open(localclientnum);
		}
		if(!isdefined(self.var_214c1803.var_b4185011) && self hasdobj(localclientnum) && self haspart(localclientnum, "j_head"))
		{
			self.var_214c1803.var_b4185011 = spawn(localclientnum, self gettagorigin("j_head"), "script_origin");
			self.var_214c1803.var_b4185011 linkto(self, "j_head");
		}
		entnum = self getentitynumber();
		if(isdefined(self.var_214c1803.var_b4185011))
		{
			entnum = self.var_214c1803.var_b4185011 getentitynumber();
		}
		self.var_214c1803.elem stealth_meter_display::set_entnum(localclientnum, entnum);
	}
	return self.var_214c1803.elem;
}

/*
	Name: function_5010aab6
	Namespace: namespace_6c0cd084
	Checksum: 0x10E3C04D
	Offset: 0x670
	Size: 0x4BC
	Parameters: 7
	Flags: Linked, Private
*/
function private function_5010aab6(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	sight = float(self clientfield::get("threat_sight")) / (float((1 << 6) - 1));
	if(!isdefined(self.var_214c1803))
	{
		self.var_214c1803 = spawnstruct();
	}
	now = self getclienttime();
	if((isdefined(self.var_214c1803.time) ? self.var_214c1803.time : -1) == now)
	{
		return;
	}
	self.var_214c1803.time = now;
	self.var_214c1803.sight = sight;
	self.var_214c1803.var_97c4563c = self clientfield::get("threat_state");
	if(!isdefined(self.var_214c1803.elem))
	{
		if(!getdvarint(#"hash_7bf40e4b6a830d11", 1))
		{
			return;
		}
		self.var_214c1803.elem = self function_8991ddb4(wasdemojump);
		if(isdefined(self.var_214c1803.elem))
		{
			self thread function_d4ae86f5(wasdemojump);
		}
	}
	if(isdefined(self.var_214c1803.elem))
	{
		/#
			var_fdd79624 = "";
			if(!getdvarint(#"hash_7bf40e4b6a830d11", 1))
			{
				var_fdd79624 = "";
			}
			self thread function_ccfdbd44(wasdemojump, (((((("" + self.var_214c1803.var_1911547e) + "") + self.var_214c1803.var_97c4563c) + "") + self.var_214c1803.sight) + "") + var_fdd79624);
		#/
		if(!self.var_214c1803.elem stealth_meter_display::is_open(wasdemojump))
		{
			self.var_214c1803.elem stealth_meter_display::open(wasdemojump);
			entnum = self getentitynumber();
			if(isdefined(self.var_214c1803.var_b4185011))
			{
				entnum = self.var_214c1803.var_b4185011 getentitynumber();
			}
			self.var_214c1803.elem stealth_meter_display::set_entnum(wasdemojump, entnum);
		}
		if(getdvarint(#"hash_7bf40e4b6a830d11", 1))
		{
			self.var_214c1803.elem stealth_meter_display::set_awarenessstate(wasdemojump, self.var_214c1803.var_97c4563c);
			self.var_214c1803.elem stealth_meter_display::set_awarenessprogress(wasdemojump, self.var_214c1803.sight);
			self.var_214c1803.elem stealth_meter_display::set_clamped(wasdemojump, 1);
		}
		else
		{
			self.var_214c1803.elem stealth_meter_display::set_awarenessstate(wasdemojump, 0);
			self.var_214c1803.elem stealth_meter_display::set_awarenessprogress(wasdemojump, 0);
			self.var_214c1803.elem stealth_meter_display::set_clamped(wasdemojump, 0);
		}
	}
}

/*
	Name: function_ccfdbd44
	Namespace: namespace_6c0cd084
	Checksum: 0x595BF28B
	Offset: 0xB38
	Size: 0xCE
	Parameters: 2
	Flags: Private
*/
function private function_ccfdbd44(localclientnum, msg)
{
	/#
		self notify("");
		self endon("");
		self endon(#"death");
		while(getdvarint(#"hash_40034352c4930dca") && isdefined(self.var_214c1803))
		{
			print3d(self.origin + vectorscale((0, 0, 1), 40), msg, (1, 1, 1), 1, 0.75, 1, 0);
			waitframe(1);
		}
	#/
}

/*
	Name: function_d4ae86f5
	Namespace: namespace_6c0cd084
	Checksum: 0x3C22C37F
	Offset: 0xC10
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d4ae86f5(localclientnum)
{
	self notify(#"hash_433e3a44df358be9");
	self endon(#"hash_433e3a44df358be9");
	self waittill(#"death", #"entitydeleted");
	self thread function_a2d377b5(localclientnum);
}

/*
	Name: function_a2d377b5
	Namespace: namespace_6c0cd084
	Checksum: 0x7D6AF5C7
	Offset: 0xC88
	Size: 0xDE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a2d377b5(localclientnum)
{
	if(isdefined(self.var_214c1803.var_1911547e))
	{
		[[ level.var_6c0cd084 ]]->function_271aec18(self.var_214c1803.var_1911547e);
		if(self.var_214c1803.elem stealth_meter_display::is_open(localclientnum))
		{
			self.var_214c1803.elem stealth_meter_display::close(localclientnum);
		}
		if(isdefined(self.var_214c1803.var_b4185011))
		{
			self.var_214c1803.var_b4185011 delete();
		}
		self.var_214c1803 = undefined;
	}
	self notify(#"hash_433e3a44df358be9");
}

