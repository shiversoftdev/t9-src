#using script_61828ad9e71c6616;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_bf7415ae;

/*
	Name: function_890b3889
	Namespace: namespace_bf7415ae
	Checksum: 0x4B40704
	Offset: 0xF0
	Size: 0x74
	Parameters: 5
	Flags: Linked
*/
function function_890b3889(killstreakweapon, maxrange, var_f6825ff2, var_c7502f87, var_7551540f)
{
	self thread function_b66d4fac(maxrange, var_f6825ff2);
	self thread function_f3305d7f(var_c7502f87, var_7551540f);
	self thread function_a2eec6c2(killstreakweapon);
}

/*
	Name: function_a2eec6c2
	Namespace: namespace_bf7415ae
	Checksum: 0x9CC0C60B
	Offset: 0x170
	Size: 0x216
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a2eec6c2(killstreakweapon)
{
	self endon(#"disconnect");
	waitresult = undefined;
	waitresult = self waittill(#"weapon_fired", #"weapon_change");
	if(!self killstreakrules::function_34884f54() && waitresult._notify === "weapon_fired")
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
	Checksum: 0x71E64011
	Offset: 0x390
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function function_be6de952()
{
	self endon(#"disconnect");
	waitresult = undefined;
	waitresult = self waittill(#"lockin_selection", #"cancel_selection");
	if(waitresult._notify === "lockin_selection")
	{
		s_location = spawnstruct();
		s_location.origin = self.mdl_target.origin;
		return s_location;
	}
	return undefined;
}

/*
	Name: function_f3305d7f
	Namespace: namespace_bf7415ae
	Checksum: 0xD02C904C
	Offset: 0x438
	Size: 0xBC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f3305d7f(var_c7502f87, var_7551540f)
{
	self notify("646391a9da8669de");
	self endon("646391a9da8669de");
	waitresult = undefined;
	waitresult = self waittill(#"disconnect", #"cancel_selection", #"lockin_selection");
	if(waitresult._notify === "lockin_selection")
	{
		self waittill(#"disconnect", var_7551540f);
	}
	self thread function_ecb58f93(var_c7502f87);
}

/*
	Name: function_ecb58f93
	Namespace: namespace_bf7415ae
	Checksum: 0x62DF662E
	Offset: 0x500
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ecb58f93(var_c7502f87)
{
	if(isdefined(self.mdl_target))
	{
		mdl_target = self.mdl_target;
		mdl_target [[var_c7502f87]]();
		util::wait_network_frame();
		mdl_target delete();
	}
}

/*
	Name: function_b66d4fac
	Namespace: namespace_bf7415ae
	Checksum: 0xA9F6CAE0
	Offset: 0x570
	Size: 0x1C0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b66d4fac(maxrange, var_f6825ff2)
{
	self notify("5c8ea68310e79d34");
	self endon("5c8ea68310e79d34");
	self endon(#"disconnect", #"cancel_selection", #"lockin_selection");
	var_4ad3bc13 = vectorscale((0, 0, 1), 8);
	if(!isdefined(self.mdl_target))
	{
		self.mdl_target = util::spawn_model("tag_origin", self.origin, vectorscale((1, 0, 0), 270));
	}
	util::wait_network_frame();
	self.mdl_target [[var_f6825ff2]]();
	while(true)
	{
		v_start = self geteye();
		v_forward = self getweaponforwarddir();
		v_end = v_start + (v_forward * maxrange);
		a_trace = bullettrace(v_start, v_end, 0, self.mdl_target, 1, 0);
		self.var_5acfe25f = a_trace[#"position"];
		self.mdl_target moveto(self.var_5acfe25f + var_4ad3bc13, 0.05);
		wait(0.1);
	}
}

