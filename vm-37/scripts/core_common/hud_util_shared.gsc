#namespace hud;

/*
	Name: setparent
	Namespace: hud
	Checksum: 0x7E06B0C2
	Offset: 0x60
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function setparent(element)
{
	/#
		if(isdefined(self.parent) && self.parent == element)
		{
			return;
		}
		if(isdefined(self.parent))
		{
			self.parent removechild(self);
		}
		self.parent = element;
		self.parent addchild(self);
		if(isdefined(self.point))
		{
			self setpoint(self.point, self.relativepoint, self.xoffset, self.yoffset);
		}
		else
		{
			self setpoint("");
		}
	#/
}

/*
	Name: getparent
	Namespace: hud
	Checksum: 0x455A711D
	Offset: 0x148
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function getparent()
{
	/#
		return self.parent;
	#/
}

/*
	Name: addchild
	Namespace: hud
	Checksum: 0x19BF353F
	Offset: 0x160
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function addchild(element)
{
	/#
		element.index = self.children.size;
		self.children[self.children.size] = element;
	#/
}

/*
	Name: removechild
	Namespace: hud
	Checksum: 0xAD3BBAAC
	Offset: 0x1A8
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function removechild(element)
{
	/#
		element.parent = undefined;
		if((self.children[self.children.size - 1]) != element)
		{
			self.children[element.index] = self.children[self.children.size - 1];
			self.children[element.index].index = element.index;
		}
		self.children[self.children.size - 1] = undefined;
		element.index = undefined;
	#/
}

/*
	Name: setpoint
	Namespace: hud
	Checksum: 0x3E270EA3
	Offset: 0x268
	Size: 0x8AC
	Parameters: 5
	Flags: None
*/
function setpoint(point, relativepoint, xoffset, yoffset, movetime)
{
	/#
		if(!isdefined(movetime))
		{
			movetime = 0;
		}
		element = self getparent();
		if(movetime)
		{
			self moveovertime(movetime);
		}
		if(!isdefined(xoffset))
		{
			xoffset = 0;
		}
		self.xoffset = xoffset;
		if(!isdefined(yoffset))
		{
			yoffset = 0;
		}
		self.yoffset = yoffset;
		self.point = point;
		self.alignx = "";
		self.aligny = "";
		switch(point)
		{
			case "center":
			{
				break;
			}
			case "top":
			{
				self.aligny = "";
				break;
			}
			case "bottom":
			{
				self.aligny = "";
				break;
			}
			case "left":
			{
				self.alignx = "";
				break;
			}
			case "right":
			{
				self.alignx = "";
				break;
			}
			case "topright":
			case "top_right":
			{
				self.aligny = "";
				self.alignx = "";
				break;
			}
			case "topleft":
			case "top_left":
			{
				self.aligny = "";
				self.alignx = "";
				break;
			}
			case "topcenter":
			{
				self.aligny = "";
				self.alignx = "";
				break;
			}
			case "bottom_right":
			case "bottom right":
			{
				self.aligny = "";
				self.alignx = "";
				break;
			}
			case "bottom left":
			case "bottom_left":
			{
				self.aligny = "";
				self.alignx = "";
				break;
			}
			default:
			{
				println("" + point);
				break;
			}
		}
		if(!isdefined(relativepoint))
		{
			relativepoint = point;
		}
		self.relativepoint = relativepoint;
		relativex = "";
		relativey = "";
		switch(relativepoint)
		{
			case "center":
			{
				break;
			}
			case "top":
			{
				relativey = "";
				break;
			}
			case "bottom":
			{
				relativey = "";
				break;
			}
			case "left":
			{
				relativex = "";
				break;
			}
			case "right":
			{
				relativex = "";
				break;
			}
			case "topright":
			case "top_right":
			{
				relativey = "";
				relativex = "";
				break;
			}
			case "topleft":
			case "top_left":
			{
				relativey = "";
				relativex = "";
				break;
			}
			case "topcenter":
			{
				relativey = "";
				relativex = "";
				break;
			}
			case "bottom_right":
			case "bottom right":
			{
				relativey = "";
				relativex = "";
				break;
			}
			case "bottom left":
			case "bottom_left":
			{
				relativey = "";
				relativex = "";
				break;
			}
			default:
			{
				println("" + relativepoint);
				break;
			}
		}
		if(element == level.uiparent)
		{
			self.horzalign = relativex;
			self.vertalign = relativey;
		}
		else
		{
			self.horzalign = element.horzalign;
			self.vertalign = element.vertalign;
		}
		if(relativex == element.alignx)
		{
			offsetx = 0;
			xfactor = 0;
		}
		else
		{
			if(relativex == "" || element.alignx == "")
			{
				offsetx = int(element.width / 2);
				if(relativex == "" || element.alignx == "")
				{
					xfactor = -1;
				}
				else
				{
					xfactor = 1;
				}
			}
			else
			{
				offsetx = element.width;
				if(relativex == "")
				{
					xfactor = -1;
				}
				else
				{
					xfactor = 1;
				}
			}
		}
		self.x = element.x + (offsetx * xfactor);
		if(relativey == element.aligny)
		{
			offsety = 0;
			yfactor = 0;
		}
		else
		{
			if(relativey == "" || element.aligny == "")
			{
				offsety = int(element.height / 2);
				if(relativey == "" || element.aligny == "")
				{
					yfactor = -1;
				}
				else
				{
					yfactor = 1;
				}
			}
			else
			{
				offsety = element.height;
				if(relativey == "")
				{
					yfactor = -1;
				}
				else
				{
					yfactor = 1;
				}
			}
		}
		self.y = element.y + (offsety * yfactor);
		self.x = self.x + self.xoffset;
		self.y = self.y + self.yoffset;
		switch(self.elemtype)
		{
			case "bar":
			{
				setpointbar(point, relativepoint, xoffset, yoffset);
				self.barframe setparent(self getparent());
				self.barframe setpoint(point, relativepoint, xoffset, yoffset);
				break;
			}
		}
		self updatechildren();
	#/
}

/*
	Name: setpointbar
	Namespace: hud
	Checksum: 0x9C40BE51
	Offset: 0xB20
	Size: 0x1BC
	Parameters: 4
	Flags: None
*/
function setpointbar(point, relativepoint, xoffset, yoffset)
{
	/#
		self.bar.horzalign = self.horzalign;
		self.bar.vertalign = self.vertalign;
		self.bar.alignx = "";
		self.bar.aligny = self.aligny;
		self.bar.y = self.y;
		if(self.alignx == "")
		{
			self.bar.x = self.x;
		}
		else
		{
			if(self.alignx == "")
			{
				self.bar.x = self.x - self.width;
			}
			else
			{
				self.bar.x = self.x - (int(self.width / 2));
			}
		}
		if(self.aligny == "")
		{
			self.bar.y = self.y;
		}
		else if(self.aligny == "")
		{
			self.bar.y = self.y;
		}
		self updatebar(self.bar.frac);
	#/
}

/*
	Name: updatebar
	Namespace: hud
	Checksum: 0x1BA59D24
	Offset: 0xCE8
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function updatebar(barfrac, rateofchange)
{
	/#
		if(self.elemtype == "")
		{
			updatebarscale(barfrac, rateofchange);
		}
	#/
}

/*
	Name: updatebarscale
	Namespace: hud
	Checksum: 0xD5D4EE5B
	Offset: 0xD38
	Size: 0x23E
	Parameters: 2
	Flags: None
*/
function updatebarscale(barfrac, rateofchange)
{
	/#
		barwidth = int((self.width * barfrac) + 0.5);
		if(!barwidth)
		{
			barwidth = 1;
		}
		self.bar.frac = barfrac;
		self.bar setshader(self.bar.shader, barwidth, self.height);
		/#
			assert(barwidth <= self.width, (((("" + barwidth) + "") + self.width) + "") + barfrac);
		#/
		if(isdefined(rateofchange) && barwidth < self.width)
		{
			if(rateofchange > 0)
			{
				/#
					assert(((1 - barfrac) / rateofchange) > 0, (("" + barfrac) + "") + rateofchange);
				#/
				self.bar scaleovertime((1 - barfrac) / rateofchange, self.width, self.height);
			}
			else if(rateofchange < 0)
			{
				/#
					assert((barfrac / -1 * rateofchange) > 0, (("" + barfrac) + "") + rateofchange);
				#/
				self.bar scaleovertime(barfrac / -1 * rateofchange, 1, self.height);
			}
		}
		self.bar.rateofchange = rateofchange;
		self.bar.lastupdatetime = gettime();
	#/
}

/*
	Name: function_665f547d
	Namespace: hud
	Checksum: 0x2527B06F
	Offset: 0xF80
	Size: 0xFA
	Parameters: 2
	Flags: None
*/
function function_665f547d(font, fontscale)
{
	/#
		fontelem = newdebughudelem(self);
		fontelem.elemtype = "";
		fontelem.font = font;
		fontelem.fontscale = fontscale;
		fontelem.x = 0;
		fontelem.y = 0;
		fontelem.width = 0;
		fontelem.height = int(level.fontheight * fontscale);
		fontelem.xoffset = 0;
		fontelem.yoffset = 0;
		fontelem.children = [];
		fontelem setparent(level.uiparent);
		fontelem.hidden = 0;
		return fontelem;
	#/
}

/*
	Name: function_f5a689d
	Namespace: hud
	Checksum: 0x180E7980
	Offset: 0x1088
	Size: 0xFA
	Parameters: 2
	Flags: None
*/
function function_f5a689d(font, fontscale)
{
	/#
		fontelem = newdebughudelem();
		fontelem.elemtype = "";
		fontelem.font = font;
		fontelem.fontscale = fontscale;
		fontelem.x = 0;
		fontelem.y = 0;
		fontelem.width = 0;
		fontelem.height = int(level.fontheight * fontscale);
		fontelem.xoffset = 0;
		fontelem.yoffset = 0;
		fontelem.children = [];
		fontelem setparent(level.uiparent);
		fontelem.hidden = 0;
		return fontelem;
	#/
}

/*
	Name: function_7a0dd8a9
	Namespace: hud
	Checksum: 0xF681C8D4
	Offset: 0x1190
	Size: 0x30A
	Parameters: 3
	Flags: None
*/
function function_7a0dd8a9(color, width, height)
{
	/#
		barelem = newdebughudelem(self);
		barelem.x = 0;
		barelem.y = 0;
		barelem.frac = 0;
		barelem.color = color;
		barelem.sort = -2;
		barelem.shader = "";
		barelem setshader(#"progress_bar_fill", width, height);
		barelem.hidden = 0;
		barelemframe = newdebughudelem(self);
		barelemframe.elemtype = "";
		barelemframe.x = 0;
		barelemframe.y = 0;
		barelemframe.width = width;
		barelemframe.height = height;
		barelemframe.xoffset = 0;
		barelemframe.yoffset = 0;
		barelemframe.bar = barelem;
		barelemframe.barframe = barelemframe;
		barelemframe.children = [];
		barelemframe.sort = -1;
		barelemframe.color = (1, 1, 1);
		barelemframe setparent(level.uiparent);
		barelemframe.hidden = 0;
		barelembg = newdebughudelem(self);
		barelembg.elemtype = "";
		if(!level.splitscreen)
		{
			barelembg.x = -2;
			barelembg.y = -2;
		}
		barelembg.width = width;
		barelembg.height = height;
		barelembg.xoffset = 0;
		barelembg.yoffset = 0;
		barelembg.bar = barelem;
		barelembg.barframe = barelemframe;
		barelembg.children = [];
		barelembg.sort = -3;
		barelembg.color = (0, 0, 0);
		barelembg.alpha = 0.5;
		barelembg setparent(level.uiparent);
		if(!level.splitscreen)
		{
			barelembg setshader(#"progress_bar_bg", width + 4, height + 4);
		}
		else
		{
			barelembg setshader(#"progress_bar_bg", width + 0, height + 0);
		}
		barelembg.hidden = 0;
		return barelembg;
	#/
}

/*
	Name: function_5037fb7f
	Namespace: hud
	Checksum: 0x9F9A4AA1
	Offset: 0x14A8
	Size: 0xA8
	Parameters: 0
	Flags: None
*/
function function_5037fb7f()
{
	/#
		bar = function_7a0dd8a9((1, 1, 1), level.primaryprogressbarwidth, level.primaryprogressbarheight);
		if(level.splitscreen)
		{
			bar setpoint("", undefined, level.primaryprogressbarx, level.primaryprogressbary);
		}
		else
		{
			bar setpoint("", undefined, level.primaryprogressbarx, level.primaryprogressbary);
		}
		return bar;
	#/
}

/*
	Name: function_48badcf4
	Namespace: hud
	Checksum: 0x63AEE13
	Offset: 0x1560
	Size: 0xB6
	Parameters: 0
	Flags: None
*/
function function_48badcf4()
{
	/#
		text = function_665f547d("", level.primaryprogressbarfontsize);
		if(level.splitscreen)
		{
			text setpoint("", undefined, level.primaryprogressbartextx, level.primaryprogressbartexty);
		}
		else
		{
			text setpoint("", undefined, level.primaryprogressbartextx, level.primaryprogressbartexty);
		}
		text.sort = -1;
		return text;
	#/
}

/*
	Name: hideelem
	Namespace: hud
	Checksum: 0xE1E95874
	Offset: 0x1620
	Size: 0xE2
	Parameters: 0
	Flags: None
*/
function hideelem()
{
	/#
		if(self.hidden)
		{
			return;
		}
		self.hidden = 1;
		if(self.alpha != 0)
		{
			self.alpha = 0;
		}
		if(self.elemtype == "" || self.elemtype == "")
		{
			self.bar.hidden = 1;
			if(self.bar.alpha != 0)
			{
				self.bar.alpha = 0;
			}
			self.barframe.hidden = 1;
			if(self.barframe.alpha != 0)
			{
				self.barframe.alpha = 0;
			}
		}
	#/
}

/*
	Name: showelem
	Namespace: hud
	Checksum: 0xF38B3835
	Offset: 0x1710
	Size: 0x10A
	Parameters: 0
	Flags: None
*/
function showelem()
{
	/#
		if(!self.hidden)
		{
			return;
		}
		self.hidden = 0;
		if(self.elemtype == "" || self.elemtype == "")
		{
			if(self.alpha != 0.5)
			{
				self.alpha = 0.5;
			}
			self.bar.hidden = 0;
			if(self.bar.alpha != 1)
			{
				self.bar.alpha = 1;
			}
			self.barframe.hidden = 0;
			if(self.barframe.alpha != 1)
			{
				self.barframe.alpha = 1;
			}
		}
		else if(self.alpha != 1)
		{
			self.alpha = 1;
		}
	#/
}

/*
	Name: destroyelem
	Namespace: hud
	Checksum: 0x5D9DBCA9
	Offset: 0x1828
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function destroyelem()
{
	/#
		tempchildren = [];
		for(index = 0; index < self.children.size; index++)
		{
			if(isdefined(self.children[index]))
			{
				tempchildren[tempchildren.size] = self.children[index];
			}
		}
		for(index = 0; index < tempchildren.size; index++)
		{
			tempchildren[index] setparent(self getparent());
		}
		if(self.elemtype == "" || self.elemtype == "")
		{
			self.bar destroy();
			self.barframe destroy();
		}
		self destroy();
	#/
}

/*
	Name: updatechildren
	Namespace: hud
	Checksum: 0x8EC95563
	Offset: 0x1950
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function updatechildren()
{
	/#
		for(index = 0; index < self.children.size; index++)
		{
			child = self.children[index];
			child setpoint(child.point, child.relativepoint, child.xoffset, child.yoffset);
		}
	#/
}

