#using script_8988fdbc78d6c53;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace hatchet;

/*
	Name: function_89f2df9
	Namespace: hatchet
	Checksum: 0x6A632C29
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hatchet", &init_shared, undefined, undefined, undefined);
}

/*
	Name: init_shared
	Namespace: hatchet
	Checksum: 0x62A7327F
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	weaponobjects::function_e6400478(#"hatchet", &function_1679806a, 1);
}

/*
	Name: function_1679806a
	Namespace: hatchet
	Checksum: 0x10B95244
	Offset: 0x140
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_1679806a(s_watcher)
{
	s_watcher.onspawn = &function_16a186f;
	s_watcher.ondamage = &util::void;
	s_watcher.onspawnretrievetriggers = &weaponobjects::function_23b0aea9;
	s_watcher.pickup = &weaponobjects::function_d9219ce2;
	s_watcher.ontimeout = &function_27ae0902;
	s_watcher.onfizzleout = &function_27ae0902;
	if(isdefined(level.createhatchetwatcher))
	{
		self [[level.createhatchetwatcher]](s_watcher);
	}
}

/*
	Name: function_27ae0902
	Namespace: hatchet
	Checksum: 0x735ABE37
	Offset: 0x208
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_27ae0902()
{
	e_fx = spawn("script_model", self.origin);
	e_fx setmodel(#"tag_origin");
	e_fx.angles = self.angles;
	playfxontag(#"hash_522eb6eca07bfe70", e_fx, "tag_origin");
	self delete();
}

/*
	Name: function_16a186f
	Namespace: hatchet
	Checksum: 0x8E3C6B39
	Offset: 0x2B0
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_16a186f(s_watcher, player)
{
	self notify("6ccb7151796e717a");
	self endon("6ccb7151796e717a");
	self thread function_e95b2776();
	if(isdefined(level.playthrowhatchet))
	{
		player [[level.playthrowhatchet]](self);
	}
}

/*
	Name: function_e95b2776
	Namespace: hatchet
	Checksum: 0x7608AF4C
	Offset: 0x328
	Size: 0x55A
	Parameters: 0
	Flags: Linked
*/
function function_e95b2776()
{
	self endon(#"delete", #"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"stationary");
		if(!isdefined(waitresult.target))
		{
			self.angles = angleclamp180(self.angles);
			v_right = anglestoright(self.angles);
			var_6731520b = vectorcross(waitresult.normal, v_right);
			if(lengthsquared(var_6731520b) < 0.1)
			{
				/#
					println("");
				#/
				break;
			}
			var_6731520b = vectornormalize(var_6731520b);
			n_angle = acos(var_6731520b[2]) - 90;
			var_168e4d9b = [1:n_angle + 160, 0:n_angle + 50];
			var_19e2c116 = [1:var_168e4d9b[1] - self.angles[0], 0:self.angles[0] - var_168e4d9b[0]];
			/#
				if(getdvarint(#"hash_4bdc3028494aedcb", 0))
				{
					line(waitresult.position, waitresult.position + (waitresult.normal * 10), (1, 0, 0), 1, 0, 100);
					line(waitresult.position, waitresult.position + (var_6731520b * 10), (0, 1, 0), 1, 0, 100);
					var_a9f6fc6a = waitresult.position + (anglestoforward(self.angles) * 10);
					line(waitresult.position, var_a9f6fc6a, (1, 0.5, 0), 1, 0, 100);
					print3d(var_a9f6fc6a, self.angles[0], (1, 0.5, 0), 1, 0.05, 100, 1);
					line(waitresult.position, waitresult.position + (v_right * 10), (0, 0, 1), 1, 0, 100);
					var_d3d43ca3 = self.angles;
					var_d3d43ca3 = (var_168e4d9b[0], var_d3d43ca3[1], var_d3d43ca3[2]);
					var_a9f6fc6a = waitresult.position + (anglestoforward(var_d3d43ca3) * 10);
					line(waitresult.position, var_a9f6fc6a, (1, 1, 0), 1, 0, 100);
					print3d(var_a9f6fc6a, var_168e4d9b[0], (1, 1, 0), 1, 0.05, 100, 1);
					var_d3d43ca3 = (var_168e4d9b[1], var_d3d43ca3[1], var_d3d43ca3[2]);
					var_a9f6fc6a = waitresult.position + (anglestoforward(var_d3d43ca3) * 10);
					line(waitresult.position, var_a9f6fc6a, (1, 1, 0), 1, 0, 100);
					print3d(var_a9f6fc6a, var_168e4d9b[1], (1, 1, 0), 1, 0.05, 100, 1);
				}
			#/
			if(var_19e2c116[0] * var_19e2c116[1] < 0)
			{
				n_pitch = (absangleclamp180(var_19e2c116[0]) < absangleclamp180(var_19e2c116[1]) ? var_168e4d9b[0] : var_168e4d9b[1]);
				self.angles = (n_pitch, self.angles[1], self.angles[2]);
			}
			break;
		}
	}
}

