#using scripts\core_common\callbacks_shared.gsc;

#namespace globallogic_scriptmover;

/*
	Name: function_efdf32c4
	Namespace: globallogic_scriptmover
	Checksum: 0xDB5DB7AB
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_efdf32c4()
{
	level notify(1554867454);
}

/*
	Name: function_8c7ec52f
	Namespace: globallogic_scriptmover
	Checksum: 0x65C1A878
	Offset: 0x88
	Size: 0x24C
	Parameters: 17
	Flags: Linked
*/
function function_8c7ec52f(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, iboneindex, imodelindex, var_934bdd11, var_740ad64b, vsurfacenormal)
{
	if(isdefined(self.var_86a21346))
	{
		idamage = self [[self.var_86a21346]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex);
	}
	else if(isdefined(level.var_86a21346))
	{
		idamage = self [[level.var_86a21346]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex);
	}
	params = spawnstruct();
	params.einflictor = einflictor;
	params.eattacker = eattacker;
	params.idamage = idamage;
	params.idflags = idflags;
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	params.var_fd90b0bb = var_fd90b0bb;
	params.vpoint = vpoint;
	params.vdir = vdir;
	params.shitloc = shitloc;
	params.vdamageorigin = vdamageorigin;
	params.psoffsettime = psoffsettime;
	params.iboneindex = iboneindex;
	params.imodelindex = imodelindex;
	params.var_934bdd11 = var_934bdd11;
	params.var_740ad64b = var_740ad64b;
	params.vsurfacenormal = vsurfacenormal;
	self callback::callback(#"hash_2e68909d4e4ed889", params);
	self function_f7f9c3eb(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, iboneindex, imodelindex, var_934bdd11, var_740ad64b, vsurfacenormal);
}

