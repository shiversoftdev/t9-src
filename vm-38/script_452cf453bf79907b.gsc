#namespace tracking;

/*
	Name: function_5bb2d593
	Namespace: tracking
	Checksum: 0x99C47096
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5bb2d593()
{
	level notify(1502898162);
}

/*
	Name: function_605bb988
	Namespace: tracking
	Checksum: 0xF7DB9DD
	Offset: 0x80
	Size: 0x26
	Parameters: 0
	Flags: Private
*/
function private function_605bb988()
{
	if(!isalive(self))
	{
		return false;
	}
	return true;
}

/*
	Name: function_8240e8b4
	Namespace: tracking
	Checksum: 0x56866218
	Offset: 0xB0
	Size: 0xDC
	Parameters: 0
	Flags: Private
*/
function private function_8240e8b4()
{
	if(function_605bb988())
	{
		if(level.time >= (self.tracking.breadcrumbs[self.tracking.current_crumb].time + self.tracking.time_step))
		{
			return;
		}
		self.tracking.current_crumb = (self.tracking.current_crumb + 1) % 20;
		self.tracking.breadcrumbs[self.tracking.current_crumb] = {#time:level.time, #point:self.origin};
	}
}

/*
	Name: function_b8d4946e
	Namespace: tracking
	Checksum: 0x906DA067
	Offset: 0x198
	Size: 0x190
	Parameters: 1
	Flags: None
*/
function function_b8d4946e(window)
{
	self.tracking = {#time_step:(int(window * 1000)) / 20, #window:window, #speed:0, #velocity:(0, 0, 0), #hash_712fc53e:0, #current_crumb:0, #breadcrumbs:[]};
	crumb = {#time:level.time, #point:self.origin};
	if(!isdefined(self.tracking.breadcrumbs))
	{
		self.tracking.breadcrumbs = [];
	}
	else if(!isarray(self.tracking.breadcrumbs))
	{
		self.tracking.breadcrumbs = array(self.tracking.breadcrumbs);
	}
	self.tracking.breadcrumbs[self.tracking.breadcrumbs.size] = crumb;
}

/*
	Name: function_c9f765ff
	Namespace: tracking
	Checksum: 0x3D506718
	Offset: 0x330
	Size: 0x3E
	Parameters: 0
	Flags: Private
*/
function private function_c9f765ff()
{
	self endon(#"disconnect");
	while(true)
	{
		self function_8240e8b4();
		waitframe(1);
	}
}

/*
	Name: track
	Namespace: tracking
	Checksum: 0xB418FDCE
	Offset: 0x378
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function track(window)
{
	if(isdefined(self.tracking))
	{
		return;
	}
	self function_b8d4946e(window);
	self thread function_c9f765ff();
}

/*
	Name: get_velocity
	Namespace: tracking
	Checksum: 0x76D066E5
	Offset: 0x3D0
	Size: 0x21E
	Parameters: 0
	Flags: None
*/
function get_velocity()
{
	if(level.time == self.tracking.var_712fc53e)
	{
		return self.tracking.velocity;
	}
	crumb_index = self.tracking.current_crumb % 20;
	crumb = self.tracking.breadcrumbs[crumb_index];
	last_point = crumb.point;
	last_time = crumb.time;
	travel = (0, 0, 0);
	total_time = 0;
	breadcrumb_count = self.tracking.breadcrumbs.size;
	for(index = breadcrumb_count - 2; index >= 0; index--)
	{
		crumb_index--;
		if(crumb_index < 0)
		{
			crumb_index = crumb_index + breadcrumb_count;
		}
		crumb = self.tracking.breadcrumbs[crumb_index];
		travel = travel + (last_point - crumb.point);
		total_time = total_time + (last_time - crumb.time);
		last_point = crumb.point;
		last_time = crumb.time;
	}
	if(total_time > 0)
	{
		self.tracking.velocity = travel / (float(total_time) / 1000);
		self.tracking.speed = length(travel) / (float(total_time) / 1000);
	}
	self.tracking.var_712fc53e = level.time;
	return self.tracking.velocity;
}

/*
	Name: function_ef4b25ba
	Namespace: tracking
	Checksum: 0x6342CB4B
	Offset: 0x5F8
	Size: 0x8E
	Parameters: 0
	Flags: None
*/
function function_ef4b25ba()
{
	/#
		self endon(#"disconnect");
		while(true)
		{
			if(function_605bb988())
			{
				velocity = self get_velocity();
				sphere(self.origin + velocity, 10, (1, 0, 0), 1, 0);
			}
			waitframe(1);
		}
	#/
}

