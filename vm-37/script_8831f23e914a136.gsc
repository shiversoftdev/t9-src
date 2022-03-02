#using scripts\core_common\system_shared.csc;

#namespace namespace_131517b7;

/*
	Name: function_89f2df9
	Namespace: namespace_131517b7
	Checksum: 0x25AB954C
	Offset: 0x98
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_26735a31c43bda52", undefined, undefined, &function_5b164bbc, undefined);
}

/*
	Name: function_5b164bbc
	Namespace: namespace_131517b7
	Checksum: 0x1B81162B
	Offset: 0xD8
	Size: 0x126
	Parameters: 0
	Flags: Linked
*/
function function_5b164bbc()
{
	foreach(dynent in function_dc7f007())
	{
		dynent.ondestroyed = &function_61fb9b33;
		bundle = function_489009c1(dynent);
		if(isdefined(bundle) && isdefined(bundle.var_e32432cf))
		{
			switch(bundle.var_e32432cf)
			{
				case "hash_3c27aafc8cd27c4":
				{
					dynent.start_origin = dynent.origin;
					dynent.start_angles = dynent.angles;
					dynent thread function_733e5314();
					break;
				}
			}
		}
	}
}

/*
	Name: function_61fb9b33
	Namespace: namespace_131517b7
	Checksum: 0x1914F574
	Offset: 0x208
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_61fb9b33(eventstruct)
{
	function_27b5ddff(eventstruct.ent);
	launchdynent(eventstruct.ent, eventstruct.dir * 5, eventstruct.position);
	eventstruct.ent notify(#"hash_4874aa76b9c9cda5");
	bundle = function_489009c1(eventstruct.ent);
	if(isdefined(bundle) && isdefined(bundle.var_c14aa186))
	{
		stateindex = (isdefined(bundle.destroyed) ? bundle.destroyed : 0);
		if(isdefined(bundle.var_c14aa186[stateindex]))
		{
			function_e2a06860(0, eventstruct.ent, stateindex);
		}
	}
}

/*
	Name: function_2ec27175
	Namespace: namespace_131517b7
	Checksum: 0x2E0B7213
	Offset: 0x318
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_2ec27175(var_391ae5)
{
	if(isdefined(var_391ae5.var_ee13df27))
	{
		loc_0000035C:
		var_c01b1f44 = {#hash_bffcadab:(isdefined(var_391ae5.var_f4fffb24) ? var_391ae5.var_f4fffb24 : 1), #hash_9b95a335:(isdefined(var_391ae5.var_6dae19be) ? var_391ae5.var_6dae19be : 1), #sound_name:var_391ae5.var_ee13df27};
	}
	return var_c01b1f44;
}

/*
	Name: function_be87aa71
	Namespace: namespace_131517b7
	Checksum: 0x1CE4DBB2
	Offset: 0x3C8
	Size: 0x27A
	Parameters: 1
	Flags: Linked
*/
function function_be87aa71(var_c01b1f44)
{
	self notify("1851f5a51d00bb86");
	self endon("1851f5a51d00bb86");
	self endon(#"hash_4874aa76b9c9cda5", #"state_changed");
	if(!isdefined(var_c01b1f44))
	{
		return;
	}
	while(true)
	{
		if(self.var_ade25cfe === var_c01b1f44.sound_name && isdefined(self.var_6039cf61) && self.var_6039cf61 > getservertime(0))
		{
			wait((float(self.var_6039cf61 - getservertime(0))) / 1000);
		}
		local_client = function_5c10bd79(0);
		if(isplayer(local_client) && distancesquared(local_client.origin, self.origin) < sqr(1000))
		{
			playsound(0, var_c01b1f44.sound_name, self.origin);
			/#
				if(getdvarint(#"hash_5bbf0a73200999f9", 0))
				{
					debugstar(self.origin, int(62.5), (1, 0, 1));
				}
			#/
		}
		wait_time = (var_c01b1f44.var_9b95a335 != var_c01b1f44.var_bffcadab ? randomfloatrange(var_c01b1f44.var_9b95a335, var_c01b1f44.var_bffcadab) : var_c01b1f44.var_9b95a335);
		self.var_6039cf61 = getservertime(0) + (int(wait_time * 1000));
		self.var_ade25cfe = var_c01b1f44.sound_name;
		wait(wait_time);
		self.var_6039cf61 = undefined;
	}
}

/*
	Name: function_733e5314
	Namespace: namespace_131517b7
	Checksum: 0xBA3E2F93
	Offset: 0x650
	Size: 0x760
	Parameters: 0
	Flags: Linked
*/
function function_733e5314()
{
	self endon(#"state_changed");
	var_25dac1e7 = randomfloatrange(30, 90);
	bundle = function_489009c1(self);
	var_2828eabf = (isdefined(bundle.destroyed) ? bundle.destroyed : 0);
	idle_state = (isdefined(bundle.idlestate) ? bundle.idlestate : 0);
	var_60138ede = (isdefined(bundle.var_7320b70a) ? bundle.var_7320b70a : 0);
	var_5f94b69b = (isdefined(bundle.var_49caaddf) ? bundle.var_49caaddf : 0);
	var_de89d793 = bundle.var_c14aa186[var_60138ede];
	if(!isdefined(var_de89d793) || !isdefined(var_de89d793.var_879eb2ff))
	{
		return;
	}
	var_381de367 = var_de89d793.var_879eb2ff;
	var_931fd54a = is_true(var_de89d793.var_3f644836);
	var_efcac2fa = bundle.var_c14aa186[idle_state];
	idle_anim = var_efcac2fa.var_879eb2ff;
	var_881752fb = function_2ec27175(var_de89d793);
	var_fe69fc89 = function_2ec27175(var_efcac2fa);
	bundle = undefined;
	self.var_621ee87d = 1;
	state = 0;
	waitresult = undefined;
	while(self.health > 0)
	{
		angles = undefined;
		turn_rate = var_25dac1e7;
		if(!isdefined(waitresult) || waitresult._notify !== "wall_detected")
		{
			timeout = getrealtime();
		}
		if(self.origin[2] < -10000 || (getrealtime() - timeout) > 3000)
		{
			function_e2a06860(0, self, var_5f94b69b);
			self notify(#"hash_4874aa76b9c9cda5");
			wait(1);
			self.origin = self.start_origin;
			self.angles = self.start_angles;
			wait(5);
			function_e2a06860(0, self, idle_state);
			self thread function_733e5314();
			return;
		}
		if(!isdefined(waitresult) || waitresult._notify === "timeout")
		{
			if(state === 2 || state === 1)
			{
				var_116c2a14 = function_76904e7f();
				angles = vectortoangles(var_116c2a14);
				if(state === 1)
				{
					function_27b5ddff(self);
				}
				state = 0;
				anim_rate = 1;
			}
			else
			{
				function_1e23c01f(self, idle_anim);
				self.var_b18f1e7a = idle_anim;
				function_d380c9a3(self);
				state = 2;
				self thread function_be87aa71(var_fe69fc89);
			}
		}
		else
		{
			if(isdefined(waitresult) && waitresult._notify === "wall_detected")
			{
				if(lengthsquared(waitresult.normal) == 0)
				{
					self notify(#"hash_4874aa76b9c9cda5");
					function_e2a06860(0, self, var_5f94b69b);
					wait(1);
					self.origin = self.start_origin;
					self.angles = self.start_angles;
					wait(5);
					function_e2a06860(0, self, idle_state);
					self thread function_733e5314();
					return;
				}
				right = vectorcross(waitresult.normal, (0, 0, 1));
				angles = vectortoangles(right);
				if(absangleclamp360(angles[1] - self.angles[1]) < 0.001)
				{
					angles = (angles[0], angles[1] * -1, angles[2]);
				}
				turn_rate = 90;
			}
			else
			{
				var_21a930c2 = self.origin - waitresult.var_6be223c2;
				angles = vectortoangles(var_21a930c2);
				if(state === 0)
				{
					function_27b5ddff(self);
				}
				state = 1;
				anim_rate = 1;
				turn_rate = 240;
			}
		}
		if(isdefined(angles))
		{
			if(self.var_b18f1e7a !== var_381de367 || self.var_51b1adce !== anim_rate)
			{
				function_1ef41caa(self, var_381de367, undefined, anim_rate, var_931fd54a);
				if(isdefined(var_881752fb))
				{
					self thread function_be87aa71(var_881752fb);
				}
				self.var_b18f1e7a = var_381de367;
				self.var_51b1adce = anim_rate;
			}
			function_64303428(self, angles[1], turn_rate);
		}
		if(waitresult._notify === "wall_detected")
		{
			wait(1);
		}
		waitresult = undefined;
		waitresult = self waittilltimeout(randomfloatrange(3, 5), #"hash_2b397aad1337c105", #"wall_detected");
	}
}

/*
	Name: function_76904e7f
	Namespace: namespace_131517b7
	Checksum: 0x456144C1
	Offset: 0xDB8
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_76904e7f()
{
	theta = randomfloatrange(0, 360);
	x = sin(theta);
	y = cos(theta);
	return (x, y, 0);
}

