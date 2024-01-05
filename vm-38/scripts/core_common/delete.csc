#namespace delete;

/*
	Name: function_e0fb0569
	Namespace: delete
	Checksum: 0x3C7C4638
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e0fb0569()
{
	level notify(-2109908084);
}

/*
	Name: _delete
	Namespace: delete
	Checksum: 0xFD2F2AC5
	Offset: 0x80
	Size: 0x104
	Parameters: 1
	Flags: Private, Event
*/
event private _delete(eventstruct)
{
	/#
		assert(isdefined(self));
	#/
	if(isdefined(self))
	{
		/#
			if(isdefined(self.classname))
			{
				if(self.classname == "" || self.classname == "" || self.classname == "")
				{
					println("");
					println((("" + self getentitynumber()) + "") + self.origin);
					println("");
				}
			}
		#/
		self delete();
	}
}

/*
	Name: function_f447a48e
	Namespace: delete
	Checksum: 0x2A5A0DBD
	Offset: 0x190
	Size: 0x10C
	Parameters: 1
	Flags: Private, Event
*/
event private function_f447a48e(eventstruct)
{
	/#
		assert(isdefined(self));
	#/
	waitframe(1);
	if(isdefined(self))
	{
		/#
			if(isdefined(self.classname))
			{
				if(self.classname == "" || self.classname == "" || self.classname == "")
				{
					println("");
					println((("" + self getentitynumber()) + "") + self.origin);
					println("");
				}
			}
		#/
		self delete();
	}
}

