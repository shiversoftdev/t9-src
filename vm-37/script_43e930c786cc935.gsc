#using script_75e0a2c8a5c12652;
#using script_41540e991952b0c1;
#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_60a2f38d6d37fd6a;
#using script_6b71c9befed901f2;
#using script_7bf1bd99605135bf;
#using script_75c3996cce8959f7;
#using script_71603a58e2da0698;
#using script_30c7fb449869910;
#using script_4adf64e112e9afec;
#using script_771f5bff431d8d57;
#using script_42cbbdcd1e160063;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using script_18910f59cc847b42;
#using script_30efbc1e0156ebae;
#using script_245f38df21b701ca;
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

#namespace namespace_268747c0;

/*
	Name: init
	Namespace: namespace_268747c0
	Checksum: 0x89EC0D4F
	Offset: 0x2D0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "dragonTrapState", 1, 2, "int", &dragontrapstate, 0, 0);
	function_32d5e898();
}

/*
	Name: function_32d5e898
	Namespace: namespace_268747c0
	Checksum: 0x2158F7F2
	Offset: 0x338
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
}

/*
	Name: function_79445831
	Namespace: namespace_268747c0
	Checksum: 0x531C63E0
	Offset: 0x350
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_79445831()
{
	self notify("18d073f66f509708");
	self endon("18d073f66f509708");
	fakemodel = self.fakemodel;
	self waittill(#"death");
	if(isdefined(fakemodel))
	{
		fakemodel delete();
	}
}

/*
	Name: function_6f3ad355
	Namespace: namespace_268747c0
	Checksum: 0xDC14E4E0
	Offset: 0x3C0
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_6f3ad355(localclientnum)
{
	if(isdefined(self.fakemodel))
	{
		self.fakemodel delete();
	}
	namespace_1e25ad94::debugmsg((("Initializing dragonhead trap (" + self getentitynumber()) + ") at origin:") + self.origin);
	self.fakemodel = spawn(localclientnum, self.origin, "script_model");
	self.fakemodel setmodel("zombietron_dragonhead_trap");
	self.fakemodel.angles = self.angles;
	self thread function_79445831();
}

/*
	Name: dragontrapstate
	Namespace: namespace_268747c0
	Checksum: 0xB08E05F2
	Offset: 0x4B8
	Size: 0x362
	Parameters: 7
	Flags: Linked
*/
function dragontrapstate(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 0:
		{
			if(isdefined(self.fakemodel))
			{
				self.fakemodel delete();
			}
			namespace_1e25ad94::debugmsg((("Destroying dragonhead trap (" + self getentitynumber()) + ") at origin:") + self.origin);
			break;
		}
		case 1:
		{
			self function_6f3ad355(fieldname);
			break;
		}
		case 2:
		{
			if(!isdefined(self.fakemodel))
			{
				self function_6f3ad355(fieldname);
			}
			/#
				assert(isdefined(self.fakemodel));
			#/
			self.fakemodel setmodel("zombietron_dragonhead_trap");
			stopforcestreamingxmodel(#"zombietron_dragonhead_trap");
			forcestreamxmodel(#"zombietron_dragonhead_trap_active");
			namespace_1e25ad94::debugmsg(((("Setting dragonhead trap (" + self getentitynumber()) + ") at origin:") + self.origin) + " to model zombietron_dragonhead_trap");
			self.fakemodel thread namespace_83eb6304::function_f58618d7(fieldname, "dragonTrap", 1, "tag_mouth_fx_anim");
			break;
		}
		case 3:
		{
			if(!isdefined(self.fakemodel))
			{
				self function_6f3ad355(fieldname);
			}
			/#
				assert(isdefined(self.fakemodel));
			#/
			self.fakemodel setmodel("zombietron_dragonhead_trap_active");
			stopforcestreamingxmodel(#"zombietron_dragonhead_trap_active");
			forcestreamxmodel(#"zombietron_dragonhead_trap");
			namespace_1e25ad94::debugmsg(((("Setting dragonhead trap (" + self getentitynumber()) + ") at origin:") + self.origin) + " to model zombietron_dragonhead_trap_active");
			wait(1);
			if(isdefined(self.fakemodel))
			{
				self.fakemodel thread namespace_83eb6304::function_f58618d7(fieldname, "dragonTrap", 0, "tag_mouth_fx_anim");
			}
			break;
		}
	}
}

