#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect_dot;

/*
	Name: __init__system__
	Namespace: status_effect_dot
	Checksum: 0x41797D4D
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_dot", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_dot
	Checksum: 0x947B45FE
	Offset: 0x130
	Size: 0xEC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::register_status_effect_callback_apply(7, &dot_apply);
	status_effect::function_5bae5120(7, &dot_end);
	status_effect::function_6f4eaf88(getstatuseffect("dot"));
	clientfield::register("toplayer", "dot_splatter", 1, 1, "counter");
	clientfield::register("toplayer", "dot_no_splatter", 1, 1, "counter");
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: status_effect_dot
	Checksum: 0x80F724D1
	Offset: 0x228
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
}

/*
	Name: dot_apply
	Namespace: status_effect_dot
	Checksum: 0xA7AEB58A
	Offset: 0x238
	Size: 0x1BC
	Parameters: 3
	Flags: Linked
*/
function dot_apply(var_756fda07, weapon, applicant)
{
	self.var_7b465aaa = var_756fda07.var_7b465aaa;
	self.var_234d0133 = var_756fda07.var_234d0133;
	self.var_48b3f3eb = var_756fda07.var_48b3f3eb;
	self.var_dc45cd85 = var_756fda07.var_5cf129b8;
	self.var_cd9ab93d = var_756fda07.var_cd9ab93d;
	self.var_73c55eee = var_756fda07.dotdamage;
	self.var_4c4e9eb3 = var_756fda07.var_44ff1a4;
	self.var_5cf129b8 = self.var_dc45cd85;
	self.var_adb1692a = self.var_73c55eee;
	self.var_848a19e0 = var_756fda07.var_848a19e0;
	self.var_200f6b2b = 1 / (self.var_5cf129b8 / 1000);
	self.weapon = weapon;
	self.var_8df76e2f = var_756fda07.var_8df76e2f;
	self.var_423e3c32 = var_756fda07.var_423e3c32;
	self.var_ddf59c36 = var_756fda07.var_ddf59c36;
	self.dotrumble = var_756fda07.dotrumble;
	if(!isdefined(self.var_45c9768))
	{
		self.owner.var_213b4a61 = 1;
		self.var_45c9768 = gettime();
		self.var_82e80202 = 0;
		if(self.var_8df76e2f > 0)
		{
			self dot_report(applicant);
		}
		self thread function_5236325e(applicant, var_756fda07.killcament);
		self thread dot_rumble_loop();
	}
}

/*
	Name: dot_rumble_loop
	Namespace: status_effect_dot
	Checksum: 0x99A649BA
	Offset: 0x400
	Size: 0xD8
	Parameters: 0
	Flags: Linked, Private
*/
function private dot_rumble_loop()
{
	self notify(#"dot_rumble_loop");
	self endon(#"dot_rumble_loop", #"endstatuseffect");
	waitframe(1);
	if(!isplayer(self.owner))
	{
		return;
	}
	self.owner endon(#"spawned");
	rumble = (isdefined(self.dotrumble) ? self.dotrumble : "status_effect_dot");
	while(isdefined(self) && isdefined(self.owner))
	{
		self.owner playrumbleonentity(rumble);
		wait(0.1);
	}
}

/*
	Name: dot_end
	Namespace: status_effect_dot
	Checksum: 0xC3DE8F3B
	Offset: 0x4E0
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function dot_end()
{
	self.owner.var_213b4a61 = undefined;
	self.owner stoprumble("status_effect_dot");
	self.owner.var_4dcf932b = undefined;
	self.owner.var_e8bb749a = undefined;
	self.var_45c9768 = undefined;
}

/*
	Name: function_3b694684
	Namespace: status_effect_dot
	Checksum: 0x2A9A5BE3
	Offset: 0x548
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3b694684(count)
{
	if(!isplayer(self.owner))
	{
		return;
	}
	if(!self.var_ddf59c36 === 1)
	{
		self.owner clientfield::increment_to_player("dot_no_splatter");
	}
	if(!isdefined(self.var_423e3c32))
	{
		return;
	}
	if(count % self.var_423e3c32)
	{
		self.owner clientfield::increment_to_player("dot_no_splatter");
		return;
	}
	self.owner clientfield::increment_to_player("dot_splatter");
}

/*
	Name: function_5236325e
	Namespace: status_effect_dot
	Checksum: 0x43FE9F08
	Offset: 0x610
	Size: 0x280
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5236325e(applicant, killcament)
{
	self endon(#"endstatuseffect");
	var_6307def9 = 0;
	var_f3fdc692 = 0;
	while(true)
	{
		self function_1d5bd9af();
		var_85ef8797 = 5;
		mod = "MOD_DOT";
		function_3b694684(var_f3fdc692);
		var_f3fdc692++;
		if(isdefined(self.owner))
		{
			resistance = 0;
			if(isplayer(self.owner) && self.weapon.doesfiredamage !== 0)
			{
				resistance = self.owner status_effect::function_3c54ae98(7);
			}
			var_d6bae87d = (1 - resistance) * self.var_adb1692a;
			if(isdefined(self.var_4b22e697) && self.owner === self.var_4b22e697)
			{
				var_d6bae87d = var_d6bae87d * self.owner status_effect::function_37683813();
			}
			var_6307def9 = var_6307def9 + var_d6bae87d;
			if(var_6307def9 >= 1)
			{
				var_4ba055ed = int(floor(var_6307def9));
				location = (isdefined(self.location) ? self.location : self.owner.origin);
				if(isdefined(applicant) && isdefined(applicant.var_d44d1214))
				{
					location = applicant.var_d44d1214.origin;
				}
				self.owner dodamage(var_4ba055ed, location, applicant, killcament, undefined, mod, var_85ef8797, self.weapon);
				var_6307def9 = var_6307def9 - var_4ba055ed;
			}
		}
		wait(self.var_5cf129b8 / 1000);
		self function_ae0405e2(applicant);
	}
}

/*
	Name: function_ae0405e2
	Namespace: status_effect_dot
	Checksum: 0xD309EFA4
	Offset: 0x898
	Size: 0xE2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ae0405e2(applicant)
{
	if(self.var_82e80202 == self.var_8df76e2f)
	{
		self.var_82e80202 = 0;
		self dot_report(applicant);
	}
	else
	{
		self.var_82e80202++;
		if(isdefined(self.owner))
		{
			self.owner.var_dbffaa32 = undefined;
		}
		if(isdefined(applicant) && (!isdefined(self.owner) || self.owner != applicant))
		{
			applicant.var_dbffaa32 = undefined;
			if(isdefined(applicant.owner) && isplayer(applicant.owner))
			{
				applicant.owner.var_dbffaa32 = undefined;
			}
		}
	}
}

/*
	Name: dot_report
	Namespace: status_effect_dot
	Checksum: 0x30D56DB4
	Offset: 0x988
	Size: 0x174
	Parameters: 1
	Flags: Linked, Private
*/
function private dot_report(applicant)
{
	if(!isdefined(self.owner))
	{
		return;
	}
	if(!isdefined(applicant))
	{
		return;
	}
	self.owner.var_dbffaa32 = 1;
	if(isplayer(applicant))
	{
		applicant.var_dbffaa32 = 1;
	}
	else if(isdefined(applicant.owner) && isplayer(applicant.owner))
	{
		applicant.owner.var_dbffaa32 = 1;
	}
	location = (isdefined(self.location) ? self.location : self.owner.origin);
	if(isdefined(applicant.var_d44d1214))
	{
		location = applicant.var_d44d1214.origin;
	}
	dir = self.owner.origin - location;
	if(isplayer(self.owner) && !self.owner getinvulnerability())
	{
		self.owner addtodamageindicator(self.var_adb1692a, dir);
	}
}

/*
	Name: function_1d5bd9af
	Namespace: status_effect_dot
	Checksum: 0xC79B5CB5
	Offset: 0xB08
	Size: 0xDA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1d5bd9af()
{
	if(!self.var_7b465aaa)
	{
		return;
	}
	var_9002d607 = gettime() - (isdefined(self.var_45c9768) ? self.var_45c9768 : 0) + (isdefined(self.var_48b3f3eb) ? self.var_48b3f3eb : 0);
	if(var_9002d607 < 0)
	{
		return;
	}
	lerpval = var_9002d607 / self.var_234d0133;
	self.var_5cf129b8 = lerpfloat(self.var_dc45cd85, self.var_cd9ab93d, lerpval);
	self.var_adb1692a = int(lerpfloat(self.var_73c55eee, self.var_4c4e9eb3, lerpval));
}

