#using script_61828ad9e71c6616;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace airsupport;

/*
	Name: function_768c5e
	Namespace: airsupport
	Checksum: 0x43E3A77
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_768c5e()
{
	level notify(-2131790561);
}

#namespace namespace_bf7415ae;

/*
	Name: function_890b3889
	Namespace: namespace_bf7415ae
	Checksum: 0x1E8D06F1
	Offset: 0x110
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_890b3889(killstreaktype, killstreakweapon, maxrange, var_f6825ff2, var_c7502f87, var_7551540f, var_d89073fc)
{
	if(!isdefined(self.mdl_target))
	{
		self.mdl_target = [];
	}
	self thread function_b66d4fac(killstreaktype, maxrange, var_f6825ff2, var_c7502f87, var_d89073fc);
	self thread function_f3305d7f(killstreaktype, var_c7502f87, var_7551540f);
	self thread function_a2eec6c2(killstreakweapon);
}

/*
	Name: function_a2eec6c2
	Namespace: namespace_bf7415ae
	Checksum: 0xD19C8F5B
	Offset: 0x1C0
	Size: 0x216
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a2eec6c2(killstreakweapon)
{
	self endon(#"disconnect");
	waitresult = undefined;
	waitresult = self waittill(#"weapon_fired", #"weapon_change");
	if(!self killstreakrules::function_71e94a3b() && waitresult._notify === "weapon_fired")
	{
		self notify(#"cancel_selection");
	}
	else
	{
		if(waitresult._notify === "weapon_fired" && waitresult.weapon === killstreakweapon)
		{
			self notify(#"lockin_selection");
		}
		else
		{
			if(waitresult._notify === "weapon_change" && waitresult.last_weapon === killstreakweapon)
			{
				self notify(#"cancel_selection");
			}
			else
			{
				/#
					str_notify = function_9e72a96(waitresult._notify);
					str_weapon = function_9e72a96(waitresult.weapon.name);
					var_d8d53d01 = (isdefined(waitresult.last_weapon) ? function_9e72a96(waitresult.last_weapon.name) : "");
					assertmsg((((("" + str_notify) + "") + str_weapon) + "") + var_d8d53d01);
				#/
				/#
				#/
				self notify(#"cancel_selection");
			}
		}
	}
}

/*
	Name: function_be6de952
	Namespace: namespace_bf7415ae
	Checksum: 0x69FE1526
	Offset: 0x3E0
	Size: 0xEC
	Parameters: 2
	Flags: Linked
*/
function function_be6de952(killstreaktype, var_94fe38b6)
{
	self endon(#"disconnect");
	waitresult = undefined;
	waitresult = self waittill(#"lockin_selection", #"cancel_selection");
	if(waitresult._notify === "lockin_selection")
	{
		wait(0.1);
		e_target = self.mdl_target[killstreaktype];
		if(isdefined(e_target))
		{
			s_location = spawnstruct();
			s_location.origin = e_target.origin;
			s_location.angles = e_target.angles;
			e_target [[var_94fe38b6]]();
			return s_location;
		}
	}
	return undefined;
}

/*
	Name: function_f3305d7f
	Namespace: namespace_bf7415ae
	Checksum: 0x4DFC4243
	Offset: 0x4D8
	Size: 0xD4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_f3305d7f(killstreaktype, var_c7502f87, var_7551540f)
{
	var_17b7891d = "3547bb97b71d3654" + killstreaktype;
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	waitresult = undefined;
	waitresult = self waittill(#"disconnect", #"cancel_selection", #"lockin_selection");
	if(waitresult._notify === "lockin_selection")
	{
		self waittill(#"disconnect", var_7551540f);
	}
	self thread function_ecb58f93(killstreaktype, var_c7502f87);
}

/*
	Name: function_ecb58f93
	Namespace: namespace_bf7415ae
	Checksum: 0x8F86B808
	Offset: 0x5B8
	Size: 0x74
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ecb58f93(killstreaktype, var_c7502f87)
{
	mdl_target = self.mdl_target[killstreaktype];
	if(isdefined(mdl_target))
	{
		mdl_target [[var_c7502f87]]();
		util::wait_network_frame();
		if(isdefined(mdl_target))
		{
			mdl_target deletedelay();
		}
	}
}

/*
	Name: function_b66d4fac
	Namespace: namespace_bf7415ae
	Checksum: 0x88FB7EA1
	Offset: 0x638
	Size: 0x320
	Parameters: 5
	Flags: Linked, Private
*/
function private function_b66d4fac(killstreaktype, maxrange, var_f6825ff2, var_c7502f87, var_d89073fc)
{
	var_17b7891d = "3f46ff8752b5c843" + killstreaktype;
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	self endon(#"disconnect", #"cancel_selection", #"lockin_selection");
	var_4ad3bc13 = vectorscale((0, 0, 1), 8);
	if(!isdefined(self.mdl_target[killstreaktype]))
	{
		self.mdl_target[killstreaktype] = util::spawn_model("tag_origin", self.origin, vectorscale((1, 0, 0), 270));
		self.mdl_target[killstreaktype].var_806c145b = var_c7502f87;
	}
	else
	{
		self function_ecb58f93(killstreaktype, self.mdl_target[killstreaktype].var_806c145b);
		waitframe(1);
		if(isplayer(self))
		{
			self.mdl_target[killstreaktype] = util::spawn_model("tag_origin", self.origin, vectorscale((1, 0, 0), 270));
			self.mdl_target[killstreaktype].var_806c145b = var_c7502f87;
		}
	}
	util::wait_network_frame();
	self.mdl_target[killstreaktype] [[var_f6825ff2]]();
	while(true)
	{
		v_start = self geteye();
		v_forward = self getweaponforwarddir();
		v_end = v_start + (v_forward * maxrange);
		a_trace = bullettrace(v_start, v_end, 0, self.mdl_target[killstreaktype], 1, 0);
		self.var_5acfe25f = a_trace[#"position"];
		self.mdl_target[killstreaktype] moveto(self.var_5acfe25f + var_4ad3bc13, 0.05);
		if(var_d89073fc)
		{
			var_94c47885 = self.mdl_target[killstreaktype].angles;
			var_94c47885 = (var_94c47885[0], self.angles[1], var_94c47885[2]);
			self.mdl_target[killstreaktype] rotateto(var_94c47885, 0.05);
		}
		wait(0.1);
	}
}

