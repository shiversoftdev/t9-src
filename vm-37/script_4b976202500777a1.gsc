#using script_15022fca9ab99080;
#using script_1d1a97b78f64bfd;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using script_bc6a9a35c229565;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace recon_car;

/*
	Name: function_89f2df9
	Namespace: recon_car
	Checksum: 0x18CEB42D
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register("recon_car", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: recon_car
	Checksum: 0x45049D05
	Offset: 0x150
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	killstreak_detect::init_shared();
	remote_weapons::init_shared();
	killstreaks::function_b5b6ef3e(&function_155de655);
}

/*
	Name: function_155de655
	Namespace: recon_car
	Checksum: 0x5EB95705
	Offset: 0x1A0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_155de655()
{
	if(function_f99d2668())
	{
		bundle = getscriptbundle("killstreak_recon_car_wz");
	}
	else
	{
		bundle = getscriptbundle("killstreak_recon_car");
	}
	namespace_231aa29a::function_155de655(bundle);
	vehicle::add_main_callback("vehicle_t9_rcxd_racing", &function_d1661ada);
}

/*
	Name: function_d1661ada
	Namespace: recon_car
	Checksum: 0xC9F7A024
	Offset: 0x240
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function function_d1661ada()
{
	self namespace_231aa29a::init_vehicle(&function_d4789bf5);
	self util::function_c596f193();
	self.var_7d4f75e = 1;
	self.ignore_death_jolt = 1;
	self.var_92043a49 = 1;
	self.var_20c65a3e = 0;
	self disabledriverfiring(1);
	self.var_a6ab9a09 = 1;
	self.var_5ab0177c = 1;
	bundle = killstreaks::get_script_bundle("recon_car");
	if(is_true(bundle.var_dad2e3a2))
	{
		self.predictedcollisiontime = 0.1;
		self thread function_819fff9d();
	}
	if(isdefined(bundle.var_1c30ba81))
	{
		self.var_a0f50ca8 = &function_2087b17f;
	}
	self.var_62b033f0 = &function_76817ccc;
	self thread function_f3170551();
}

/*
	Name: function_d4789bf5
	Namespace: recon_car
	Checksum: 0xDAFBA9B1
	Offset: 0x3A0
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function function_d4789bf5()
{
	self.var_99c7a1bc = self.weapon;
}

/*
	Name: function_819fff9d
	Namespace: recon_car
	Checksum: 0xFECBF627
	Offset: 0x3C0
	Size: 0x108
	Parameters: 0
	Flags: Linked
*/
function function_819fff9d()
{
	self endon(#"death");
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"veh_predictedcollision");
		if(isplayer(waitresult.target) && util::function_fbce7263(self.team, waitresult.target.team))
		{
			if(isdefined(self.owner) && isdefined(self.var_22a05c26.var_d3413870))
			{
				self.owner killstreaks::function_e9873ef7(self.var_22a05c26.var_d3413870, self.killstreak_id, #"hash_20e53d0989f408e6");
			}
			self namespace_231aa29a::function_1f46c433();
		}
	}
}

/*
	Name: function_f3170551
	Namespace: recon_car
	Checksum: 0xCECF1CA5
	Offset: 0x4D0
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function function_f3170551()
{
	self endon(#"death");
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"veh_landed");
		bundle = killstreaks::get_script_bundle("recon_car");
		if(isdefined(bundle.var_b771831a))
		{
			a_trace = groundtrace(self.origin + vectorscale((0, 0, 1), 70), self.origin + (vectorscale((0, 0, -1), 100)), 0, self);
			str_fx = self getfxfromsurfacetable(bundle.var_b771831a, a_trace[#"surfacetype"]);
			playfx(str_fx, a_trace[#"position"], (0, 0, 1));
		}
	}
}

/*
	Name: function_2087b17f
	Namespace: recon_car
	Checksum: 0x9FE071B9
	Offset: 0x600
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_2087b17f()
{
	bundle = killstreaks::get_script_bundle("recon_car");
	trace = groundtrace(self.origin + vectorscale((0, 0, 1), 70), self.origin + (vectorscale((0, 0, -1), 100)), 0, self);
	explosionfx = self getfxfromsurfacetable(bundle.var_1c30ba81, trace[#"surfacetype"]);
	if(isdefined(explosionfx))
	{
		fxorigin = self gettagorigin("tag_body");
		if(!isdefined(fxorigin))
		{
			fxorigin = self.origin;
		}
		playfx(explosionfx, fxorigin, (0, 0, 1));
	}
	playsoundatposition(#"hash_2d5cdc03d392d5ec", self.origin);
}

/*
	Name: function_76817ccc
	Namespace: recon_car
	Checksum: 0x3C86552B
	Offset: 0x740
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_76817ccc()
{
	if(isdefined(self.owner) && isdefined(self.var_22a05c26.var_d3413870))
	{
		self.owner killstreaks::function_e9873ef7(self.var_22a05c26.var_d3413870, self.killstreak_id, #"hash_b7109f8dd0ceb9");
	}
}

