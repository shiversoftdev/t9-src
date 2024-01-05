#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_774302f762d76254;
#using script_1b0b07ff57d1dde3;
#using script_6b6510e124bad778;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_1dde4e70;

/*
	Name: function_b866087f
	Namespace: namespace_1dde4e70
	Checksum: 0xABDCE09A
	Offset: 0x218
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b866087f()
{
	level notify(1256213624);
}

#namespace namespace_a4bedd45;

/*
	Name: function_49f419a1
	Namespace: namespace_a4bedd45
	Checksum: 0x8E6881FF
	Offset: 0x238
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function function_49f419a1(time)
{
	if(!isdefined(time))
	{
		time = 1;
	}
	self endon(#"disconnect");
	old = self.doa.var_4f3aee7b;
	self.doa.var_4f3aee7b = 1;
	wait(time);
	self.doa.var_4f3aee7b = old;
}

/*
	Name: function_17c3e29f
	Namespace: namespace_a4bedd45
	Checksum: 0xC6DF0D45
	Offset: 0x2B8
	Size: 0xA6
	Parameters: 0
	Flags: Linked
*/
function function_17c3e29f()
{
	self notify("4213ebfc1999ad2b");
	self endon("4213ebfc1999ad2b");
	self endon(#"disconnect");
	self endon(#"hash_7893364bd228d63e");
	level waittill(#"doa_exit_taken", #"teleporter_taken", #"enter_the_wild", #"hash_7893364bd228d63e", #"host_migration_begin");
	self notify(#"hash_7893364bd228d63e");
}

/*
	Name: function_c724b8f9
	Namespace: namespace_a4bedd45
	Checksum: 0xCF45AC2B
	Offset: 0x368
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_c724b8f9()
{
	if(is_true(level.doa.var_318aa67a))
	{
		return;
	}
	self notify("1c3527d4af214864");
	self endon("1c3527d4af214864");
	self endon(#"disconnect", #"hash_7893364bd228d63e");
	if(!is_true(self.doa.var_1b452923))
	{
		self namespace_83eb6304::function_3ecfde67("firstPersonMarker");
	}
}

/*
	Name: function_1735c657
	Namespace: namespace_a4bedd45
	Checksum: 0x837D638D
	Offset: 0x420
	Size: 0x5D4
	Parameters: 1
	Flags: Linked
*/
function function_1735c657(forced)
{
	self notify("72446a348015a25a");
	self endon("72446a348015a25a");
	self endon(#"disconnect");
	if(!is_true(forced) && !is_true(level.doa.var_318aa67a))
	{
		self namespace_6e90e490::showhint(4, 0);
	}
	self thread function_c724b8f9();
	self thread function_17c3e29f();
	timeout = self doa_fate::function_4808b985(90);
	result = undefined;
	result = self waittilltimeout(timeout, #"hash_444e9c51ba5bd99", #"hash_7893364bd228d63e");
	if(forced)
	{
		if(!is_true(result.var_cff8d1e) || is_true(level.doa.var_318aa67a))
		{
			self thread function_1735c657(forced);
		}
	}
	angles = absangleclamp360(self.angles);
	angles = (0, angles[1], 0);
	faceangles = (isdefined(result.faceangles) ? result.faceangles : angles);
	self notify(#"hash_7893364bd228d63e");
	self namespace_ec06fe4a::function_a4b3f184(1);
	if(is_true(self.doa.var_f583234e))
	{
		self clientfield::set_to_player("toggleflashlight", 0);
	}
	self thread namespace_7f5aeb59::turnplayershieldon();
	self.topdowncamera = 1;
	self setclientthirdperson(0);
	if(isalive(self) && !is_true(self.doa.respawning))
	{
		self.health = self.maxhealth;
	}
	if(!isdefined(self.vehicle))
	{
		self namespace_83eb6304::function_3ecfde67("player_trail_" + self.doa.color);
	}
	self clientfield::increment_to_player("exitFPS");
	self.doa.var_21eab413 = gettime() + 2500;
	/#
		namespace_1e25ad94::debugmsg((("" + self.name) + "") + gettime());
	#/
	self.doa.var_3e81d24c = undefined;
	self namespace_7f5aeb59::function_fae39d88();
	wait(0.25);
	self clientfield::increment_to_player("setCompassVis");
	self notify(#"critical_health_end");
	org = undefined;
	if(isdefined(faceangles))
	{
		org = namespace_ec06fe4a::function_e22ae9b3(self.origin, "tag_origin");
		if(isdefined(org))
		{
			org thread namespace_ec06fe4a::function_ae010bb4(self);
			org.angles = self.angles;
			self linkto(org);
			org rotateto(faceangles, 0.25);
			wait(0.25);
		}
	}
	if(isdefined(org))
	{
		self unlink();
		org delete();
	}
	wait(0.2);
	self namespace_ec06fe4a::function_a4b3f184(0);
	self.doa.var_4f3aee7b = 0;
	self namespace_83eb6304::turnofffx("firstPersonMarker");
	if(is_true(self.doa.var_f583234e))
	{
		self clientfield::set_to_player("toggleflashlight", 1);
	}
	self clientfield::increment_to_player("controlBinding");
	self clientfield::increment_to_player("setCompassVis");
	level clientfield::set("doafps", 0);
	self setorigin(self.origin + vectorscale((0, 0, 1), 20));
}

/*
	Name: function_1f704cee
	Namespace: namespace_a4bedd45
	Checksum: 0x12A6237E
	Offset: 0xA00
	Size: 0x4D4
	Parameters: 2
	Flags: Linked
*/
function function_1f704cee(force, faceangles)
{
	if(!isdefined(force))
	{
		force = 0;
	}
	if(!isdefined(faceangles))
	{
		faceangles = 1;
	}
	self notify("234632d41f9f7b29");
	self endon("234632d41f9f7b29");
	if(is_true(level.doa.var_318aa67a))
	{
		force = 1;
	}
	if(self.birthtime === gettime())
	{
		waitframe(1);
	}
	self endon(#"disconnect");
	if(is_true(self.doa.var_3e81d24c))
	{
		self thread function_1735c657(force);
		return;
	}
	/#
		namespace_1e25ad94::debugmsg((("" + self.name) + "") + gettime());
	#/
	self.doa.var_3e81d24c = 1;
	self.doa.var_4f3aee7b = force;
	self.doa.var_9f8bc3f9 = 0;
	self thread namespace_7f5aeb59::turnplayershieldon(0);
	self thread function_49f419a1();
	self namespace_83eb6304::turnofffx("player_trail_" + self.doa.color);
	angles = vectortoangles(anglestoforward(self.angles));
	angles = (0, angles[1], 0);
	if(is_true(self.doa.var_f583234e))
	{
		self clientfield::set_to_player("toggleflashlight", 0);
	}
	self namespace_ec06fe4a::function_a4b3f184(1);
	self clientfield::increment_to_player("goFPS");
	level clientfield::set("doafps", 1);
	util::wait_network_frame(2);
	self namespace_ec06fe4a::function_a4b3f184(0);
	self clientfield::increment_to_player("setCompassVis");
	self.topdowncamera = 0;
	self setclientthirdperson(0);
	if(is_true(self.doa.var_f583234e))
	{
		self clientfield::set_to_player("toggleflashlight", 1);
	}
	if(is_true(faceangles))
	{
		if(isdefined(self.doa.var_5d4bd96f))
		{
			self.doa.var_5d4bd96f delete();
		}
		self.doa.var_5d4bd96f = namespace_ec06fe4a::function_e22ae9b3(self.origin, "tag_origin");
		if(isdefined(self.doa.var_5d4bd96f))
		{
			self.doa.var_5d4bd96f thread namespace_ec06fe4a::function_ae010bb4(self);
			self.doa.var_5d4bd96f.angles = self.angles;
			self linkto(self.doa.var_5d4bd96f);
			self.doa.var_5d4bd96f rotateto(angles, 0.25);
			wait(0.25);
			self unlink();
			self.doa.var_5d4bd96f delete();
		}
	}
	self namespace_7f5aeb59::function_fae39d88();
	self thread function_1735c657(force);
}

