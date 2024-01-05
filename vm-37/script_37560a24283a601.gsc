#using scripts\zm_common\zm_utility.csc;
#using script_d67878983e3d7c;
#using script_4e53735256f112ac;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_797fe2e7;

/*
	Name: __init__system__
	Namespace: namespace_797fe2e7
	Checksum: 0x4B02B1E1
	Offset: 0xA8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_607f0336b64df630", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_797fe2e7
	Checksum: 0x40ED2DE4
	Offset: 0xF8
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("missile", "" + #"hash_36112e7cad541b66", 1, 2, "int", &function_9cb928dc, 1, 0);
	clientfield::register("missile", "" + #"hash_2d55ead1309349bc", 1, 3, "int", &function_6bd975fa, 1, 0);
}

/*
	Name: function_9cb928dc
	Namespace: namespace_797fe2e7
	Checksum: 0x419C953B
	Offset: 0x1B8
	Size: 0x1D6
	Parameters: 7
	Flags: Linked
*/
function function_9cb928dc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 1:
		case 2:
		{
			var_8cce6a5c = #"hash_302e7c518042ef82";
			break;
		}
		case 3:
		{
			var_8cce6a5c = #"hash_57ddfc09a8a5cfee";
			break;
		}
	}
	if(isdefined(var_8cce6a5c))
	{
		self.var_214a11f9 = playfx(fieldname, var_8cce6a5c, self.origin, (1, 0, 0), (0, 0, 1));
		if(!isdefined(self.var_d912eb65))
		{
			playsound(fieldname, #"hash_3f0bee7329c6d063", self.origin + vectorscale((0, 0, 1), 25));
			self.var_d912eb65 = self playloopsound(#"hash_d9ada961eacdf0", undefined, vectorscale((0, 0, 1), 25));
		}
	}
	else
	{
		if(isdefined(self.var_214a11f9))
		{
			stopfx(fieldname, self.var_214a11f9);
			self.var_214a11f9 = undefined;
		}
		if(isdefined(self.var_d912eb65))
		{
			self stoploopsound(self.var_d912eb65);
			self.var_d912eb65 = undefined;
		}
	}
}

/*
	Name: function_6bd975fa
	Namespace: namespace_797fe2e7
	Checksum: 0xF3CE2A3A
	Offset: 0x398
	Size: 0x186
	Parameters: 7
	Flags: Linked
*/
function function_6bd975fa(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 1:
		{
			var_90048701 = #"hash_1afd3356d5225a80";
			break;
		}
		case 2:
		{
			var_90048701 = #"hash_7a5d71decf1bdefb";
			break;
		}
		case 3:
		{
			var_90048701 = #"hash_29fd19d52a45b19e";
			break;
		}
		case 4:
		{
			var_90048701 = #"hash_d33a825314c9dac";
			break;
		}
	}
	if(isdefined(var_90048701))
	{
		self.var_90048701 = playfx(fieldname, var_90048701, self.origin, (1, 0, 0), (0, 0, 1));
		self playsound(fieldname, #"hash_6803d4ae1d74d42d");
	}
	else if(isdefined(self.var_90048701))
	{
		stopfx(fieldname, self.var_90048701);
		self.var_90048701 = undefined;
	}
}

