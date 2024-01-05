#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace archetype_nosferatu;

/*
	Name: function_38259ea5
	Namespace: archetype_nosferatu
	Checksum: 0x831D62CB
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_38259ea5()
{
	level notify(1180668325);
}

/*
	Name: __init__system__
	Namespace: archetype_nosferatu
	Checksum: 0x3F43C7AF
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"nosferatu", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: precache
	Namespace: archetype_nosferatu
	Checksum: 0x80F724D1
	Offset: 0x128
	Size: 0x4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec precache()
{
}

/*
	Name: function_70a657d8
	Namespace: archetype_nosferatu
	Checksum: 0x814A8CD3
	Offset: 0x138
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "nfrtu_leap_melee_rumb", 8000, 1, "counter", &function_5b1f1713, 0, 0);
}

/*
	Name: function_5b1f1713
	Namespace: archetype_nosferatu
	Checksum: 0x3799E38A
	Offset: 0x190
	Size: 0x15C
	Parameters: 7
	Flags: Linked
*/
function function_5b1f1713(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	e_player = function_5c10bd79(bwasdemojump);
	n_dist = distancesquared(self.origin, e_player.origin);
	var_56cb57e3 = sqr(200);
	n_scale = (var_56cb57e3 - n_dist) / var_56cb57e3;
	n_scale = n_scale * 0.75;
	if(n_scale > 0.01)
	{
		earthquake(bwasdemojump, n_scale, 0.1, self.origin, n_dist);
		if(n_scale >= 0.5)
		{
			function_36e4ebd4(bwasdemojump, "damage_heavy");
		}
		else
		{
			function_36e4ebd4(bwasdemojump, "damage_light");
		}
	}
}

