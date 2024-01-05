#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using script_396f7d71538c9677;
#using scripts\core_common\battlechatter.gsc;

#namespace status_effect_blind;

/*
	Name: __init__system__
	Namespace: status_effect_blind
	Checksum: 0xDF1114E9
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_blind", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_blind
	Checksum: 0x98441D46
	Offset: 0x100
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::register_status_effect_callback_apply(1, &blind_apply);
	status_effect::function_5bae5120(1, &function_8a261309);
	status_effect::function_6f4eaf88(getstatuseffect("blind"));
}

/*
	Name: blind_apply
	Namespace: status_effect_blind
	Checksum: 0xA5C730AF
	Offset: 0x178
	Size: 0x260
	Parameters: 3
	Flags: Linked
*/
function blind_apply(var_756fda07, weapon, applicant)
{
	self.owner.flashendtime = gettime() + int(var_756fda07.var_77449e9);
	self.owner.lastflashedby = applicant;
	self.owner.var_ba6bbd30 = weapon;
	if(self.owner == applicant)
	{
		return;
	}
	var_c94d654b = applicant getentitynumber();
	if(!isdefined(self.owner.var_b68518ab))
	{
		self.owner.var_b68518ab = [];
	}
	blindarray = self.owner.var_b68518ab;
	if(!isdefined(blindarray[var_c94d654b]))
	{
		blindarray[var_c94d654b] = 0;
	}
	if(isdefined(blindarray[var_c94d654b]) && (blindarray[var_c94d654b] + 3000) < gettime())
	{
		if(isdefined(weapon) && weapon == getweapon(#"hash_3f62a872201cd1ce"))
		{
			self.owner.var_ef9b6f0b = 1;
			level notify(#"hash_ac034f4f7553641");
			applicant.var_a467e27f = (isdefined(applicant.var_a467e27f) ? applicant.var_a467e27f : 0) + 1;
			var_9194a036 = battlechatter::mpdialog_value("swatGrenadeSuccessLineCount", 0);
			if(applicant.var_a467e27f == (isdefined(var_9194a036) ? var_9194a036 : 0))
			{
				applicant thread battlechatter::play_gadget_success(getweapon(#"hash_3f62a872201cd1ce"), undefined, self.owner, undefined);
			}
		}
		applicant contracts::increment_contract(#"hash_5cee5b018e1ab50e");
		blindarray[var_c94d654b] = gettime();
	}
}

/*
	Name: function_8a261309
	Namespace: status_effect_blind
	Checksum: 0xE0A176F3
	Offset: 0x3E0
	Size: 0x7E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8a261309()
{
	if(isdefined(self.owner) && isdefined(self.owner.lastflashedby) && isdefined(self.owner.lastflashedby.var_a467e27f))
	{
		self.owner.lastflashedby.var_a467e27f = 0;
	}
	if(isdefined(self.owner))
	{
		self.owner.var_ef9b6f0b = 0;
	}
}

