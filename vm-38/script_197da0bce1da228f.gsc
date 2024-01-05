#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using script_618d6f5ff5d18933;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace namespace_4aff7b6b;

/*
	Name: function_4b49d1cd
	Namespace: namespace_4aff7b6b
	Checksum: 0x865C1D54
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4b49d1cd()
{
	level notify(-1329810676);
}

/*
	Name: __init__system__
	Namespace: namespace_4aff7b6b
	Checksum: 0x5410738C
	Offset: 0x130
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_11b091d0ce567b82", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_4aff7b6b
	Checksum: 0xBF671C46
	Offset: 0x188
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isarchetypeloaded(#"mimic"))
	{
		return;
	}
	clientfield::register("scriptmover", "mimic_prop_rob", 6000, 3, "int", &function_62708cfa, 0, 0);
	clientfield::register("scriptmover", "mimic_prop_rattle_cf", 6000, 1, "int", &function_f0e03255, 0, 0);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_4aff7b6b
	Checksum: 0x80F724D1
	Offset: 0x248
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: function_62708cfa
	Namespace: namespace_4aff7b6b
	Checksum: 0x88885A38
	Offset: 0x258
	Size: 0x22C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_62708cfa(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	switch(bwastimejump)
	{
		case 1:
		{
			rob = #"hash_c7c1fdf822a1a26";
			break;
		}
		case 2:
		{
			rob = #"hash_6d27d975efe79b4";
			break;
		}
		case 3:
		{
			rob = #"hash_348ef4791d409901";
			break;
		}
		case 4:
		{
			rob = #"hash_286a43b21719f503";
			break;
		}
		case 5:
		{
			rob = #"hash_27be64a191e50e23";
			break;
		}
		case 6:
		{
			rob = #"hash_19412ffb8206f9cb";
			break;
		}
		case 7:
		{
			rob = #"hash_b7a62ed4703e9e4";
			break;
		}
		default:
		{
			break;
		}
	}
	self.var_fc558e74 = "mimic_prop_spawn";
	itemid = self getitemindex();
	self.item = function_b1702735(itemid);
	if(isdefined(rob))
	{
		self playrenderoverridebundle(rob);
		self thread function_81c73263(fieldname, rob);
	}
}

/*
	Name: function_81c73263
	Namespace: namespace_4aff7b6b
	Checksum: 0xC741E409
	Offset: 0x490
	Size: 0x100
	Parameters: 2
	Flags: Linked
*/
function function_81c73263(localclientnum, rob)
{
	self notify("6590b2fb4be2945c");
	self endon("6590b2fb4be2945c");
	self endon(#"death");
	var_6369afab = item_world::function_963d3f6e();
	maxdist = getdvarfloat(#"hash_2cd1a08f81049564", var_6369afab);
	while(true)
	{
		wait(0.1);
		if(!self function_d2503806(rob) && getplayers(localclientnum, undefined, self.origin, maxdist).size)
		{
			self playrenderoverridebundle(rob);
		}
	}
}

/*
	Name: function_f0e03255
	Namespace: namespace_4aff7b6b
	Checksum: 0x2CA6EBEE
	Offset: 0x598
	Size: 0xFC
	Parameters: 7
	Flags: Linked
*/
function function_f0e03255(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	trace_result = physicstrace(self.origin + vectorscale((0, 0, 1), 64), self.origin + (vectorscale((0, 0, -1), 64)), (0, 0, 0), (0, 0, 0), self);
	fx_point = trace_result[#"position"];
	playfx(bwastimejump, "zm_ai/fx9_mimic_prop_shake", fx_point);
	playsound(bwastimejump, #"hash_76bf07d326e705c0", fx_point + vectorscale((0, 0, 1), 20));
}

