#using script_35857c2f8d30b2a4;

#namespace flowgraph_shared;

/*
	Name: function_d17c85e6
	Namespace: flowgraph_shared
	Checksum: 0xA7E10441
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d17c85e6()
{
	level notify(996754271);
}

#namespace flowgraph_logic;

/*
	Name: iffunc
	Namespace: flowgraph_logic
	Checksum: 0x409378DC
	Offset: 0x88
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function iffunc(x, b)
{
	return array(b, !b);
}

/*
	Name: orfunc
	Namespace: flowgraph_logic
	Checksum: 0x3101CD8
	Offset: 0xC0
	Size: 0x4A
	Parameters: 3
	Flags: None
*/
function orfunc(x, b_a, b_b)
{
	return array(b_a || b_b, !(b_a || b_b));
}

/*
	Name: andfunc
	Namespace: flowgraph_logic
	Checksum: 0x6C9DC261
	Offset: 0x118
	Size: 0x4A
	Parameters: 3
	Flags: None
*/
function andfunc(x, b_a, b_b)
{
	return array(b_a && b_b, !(b_a && b_b));
}

/*
	Name: notfunc
	Namespace: flowgraph_logic
	Checksum: 0x6246E32F
	Offset: 0x170
	Size: 0x12
	Parameters: 1
	Flags: None
*/
function notfunc(b_value)
{
	return !b_value;
}

/*
	Name: lessthan
	Namespace: flowgraph_logic
	Checksum: 0xE1955B8C
	Offset: 0x190
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function lessthan(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 < var_d2073c9f;
}

/*
	Name: function_b457969e
	Namespace: flowgraph_logic
	Checksum: 0xBF9E648A
	Offset: 0x1B8
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function function_b457969e(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 <= var_d2073c9f;
}

/*
	Name: greaterthan
	Namespace: flowgraph_logic
	Checksum: 0x42F182B4
	Offset: 0x1E0
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function greaterthan(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 > var_d2073c9f;
}

/*
	Name: function_3743e19e
	Namespace: flowgraph_logic
	Checksum: 0x7E78A608
	Offset: 0x208
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function function_3743e19e(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 >= var_d2073c9f;
}

/*
	Name: equal
	Namespace: flowgraph_logic
	Checksum: 0xB1C7B131
	Offset: 0x230
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function equal(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 == var_d2073c9f;
}

/*
	Name: function_5cb6d7c8
	Namespace: flowgraph_logic
	Checksum: 0xA52C05CE
	Offset: 0x258
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function function_5cb6d7c8(x, var_ff3acc90, var_d545f8ef)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0), 1);
	}
	else if(is_true(var_d545f8ef))
	{
		self flowgraph::kick(array(undefined, 0, 1), 1);
	}
}

/*
	Name: function_4902305f
	Namespace: flowgraph_logic
	Checksum: 0xD187AC63
	Offset: 0x310
	Size: 0x114
	Parameters: 4
	Flags: None
*/
function function_4902305f(x, var_ff3acc90, var_d545f8ef, var_e7049c6c)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0), 1);
		}
		else if(is_true(var_e7049c6c))
		{
			self flowgraph::kick(array(undefined, 0, 0, 1), 1);
		}
	}
}

/*
	Name: function_3b225c4
	Namespace: flowgraph_logic
	Checksum: 0x1824A6B2
	Offset: 0x430
	Size: 0x16C
	Parameters: 5
	Flags: None
*/
function function_3b225c4(x, var_ff3acc90, var_d545f8ef, var_e7049c6c, var_f4aeb7c0)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0), 1);
		}
		else
		{
			if(is_true(var_e7049c6c))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0), 1);
			}
			else if(is_true(var_f4aeb7c0))
			{
				self flowgraph::kick(array(undefined, 0, 0, 0, 1), 1);
			}
		}
	}
}

/*
	Name: function_f82f0ebe
	Namespace: flowgraph_logic
	Checksum: 0x1262D3D6
	Offset: 0x5A8
	Size: 0x1C4
	Parameters: 6
	Flags: None
*/
function function_f82f0ebe(x, var_ff3acc90, var_d545f8ef, var_e7049c6c, var_f4aeb7c0, var_fe28cab4)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(var_e7049c6c))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0), 1);
			}
			else
			{
				if(is_true(var_f4aeb7c0))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0), 1);
				}
				else if(is_true(var_fe28cab4))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1), 1);
				}
			}
		}
	}
}

/*
	Name: function_3f431ce5
	Namespace: flowgraph_logic
	Checksum: 0x92B8CC0D
	Offset: 0x778
	Size: 0x21C
	Parameters: 7
	Flags: None
*/
function function_3f431ce5(x, var_ff3acc90, var_d545f8ef, var_e7049c6c, var_f4aeb7c0, var_fe28cab4, var_fdb6e19)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(var_e7049c6c))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0), 1);
			}
			else
			{
				if(is_true(var_f4aeb7c0))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0), 1);
				}
				else
				{
					if(is_true(var_fe28cab4))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0), 1);
					}
					else if(is_true(var_fdb6e19))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1), 1);
					}
				}
			}
		}
	}
}

/*
	Name: function_2d817962
	Namespace: flowgraph_logic
	Checksum: 0xD31ABD72
	Offset: 0x9A0
	Size: 0x2AC
	Parameters: 8
	Flags: None
*/
function function_2d817962(x, var_ff3acc90, var_d545f8ef, var_e7049c6c, var_f4aeb7c0, var_fe28cab4, var_fdb6e19, var_198e8183)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(var_e7049c6c))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0, 0), 1);
			}
			else
			{
				if(is_true(var_f4aeb7c0))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0, 0), 1);
				}
				else
				{
					if(is_true(var_fe28cab4))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0, 0), 1);
					}
					else
					{
						if(is_true(var_fdb6e19))
						{
							self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1, 0), 1);
						}
						else if(is_true(var_198e8183))
						{
							self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 1), 1);
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_c8fcb052
	Namespace: flowgraph_logic
	Checksum: 0x27942847
	Offset: 0xC58
	Size: 0x30C
	Parameters: 9
	Flags: None
*/
function function_c8fcb052(x, var_ff3acc90, var_d545f8ef, var_e7049c6c, var_f4aeb7c0, var_fe28cab4, var_fdb6e19, var_198e8183, var_2b5c251e)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(var_e7049c6c))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0, 0, 0), 1);
			}
			else
			{
				if(is_true(var_f4aeb7c0))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0, 0, 0), 1);
				}
				else
				{
					if(is_true(var_fe28cab4))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0, 0, 0), 1);
					}
					else
					{
						if(is_true(var_fdb6e19))
						{
							self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1, 0, 0), 1);
						}
						else
						{
							if(is_true(var_198e8183))
							{
								self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 1, 0), 1);
							}
							else if(is_true(var_2b5c251e))
							{
								self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 0, 1), 1);
							}
						}
					}
				}
			}
		}
	}
}

#namespace flowgraph_loops;

/*
	Name: forloop
	Namespace: flowgraph_loops
	Checksum: 0x228D9896
	Offset: 0xF70
	Size: 0x92
	Parameters: 3
	Flags: None
*/
function forloop(x, i_begin, i_end)
{
	i_step = 1;
	if(i_end < i_begin)
	{
		i_step = -1;
	}
	i = i_begin;
	while(i != i_end)
	{
		self flowgraph::kick(array(1, i), 1);
		i = i + i_step;
	}
}

/*
	Name: foreachloop
	Namespace: flowgraph_loops
	Checksum: 0x3BCCA18A
	Offset: 0x1010
	Size: 0xB0
	Parameters: 2
	Flags: None
*/
function foreachloop(x, a_items)
{
	foreach(item in a_items)
	{
		self flowgraph::kick(array(1, item), 1);
	}
}

/*
	Name: whileloop
	Namespace: flowgraph_loops
	Checksum: 0x3E58FE0
	Offset: 0x10C8
	Size: 0x6E
	Parameters: 2
	Flags: None
*/
function whileloop(x, b_condition)
{
	while(b_condition)
	{
		self flowgraph::kick(1, 1);
		inputs = self flowgraph::collect_inputs();
		b_condition = inputs[1];
	}
}

#namespace flowgraph_sequence;

/*
	Name: sequence2
	Namespace: flowgraph_sequence
	Checksum: 0x4513B686
	Offset: 0x1140
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function sequence2(x)
{
	self flowgraph::kick(array(1, 0), 1);
	self flowgraph::kick(array(0, 1), 1);
}

/*
	Name: sequence3
	Namespace: flowgraph_sequence
	Checksum: 0xAF7FBEFB
	Offset: 0x11B8
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function sequence3(x)
{
	self flowgraph::kick(array(1, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 1), 1);
}

/*
	Name: sequence4
	Namespace: flowgraph_sequence
	Checksum: 0x6767493
	Offset: 0x1260
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function sequence4(x)
{
	self flowgraph::kick(array(1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1), 1);
}

/*
	Name: sequence5
	Namespace: flowgraph_sequence
	Checksum: 0xF1A9CFF3
	Offset: 0x1338
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function sequence5(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1), 1);
}

/*
	Name: sequence6
	Namespace: flowgraph_sequence
	Checksum: 0x61C040AF
	Offset: 0x1468
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function sequence6(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 1), 1);
}

/*
	Name: sequence7
	Namespace: flowgraph_sequence
	Checksum: 0x655D4555
	Offset: 0x15D0
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function sequence7(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 1), 1);
}

/*
	Name: sequence8
	Namespace: flowgraph_sequence
	Checksum: 0xB15FEAA3
	Offset: 0x1770
	Size: 0x1CC
	Parameters: 1
	Flags: None
*/
function sequence8(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 0, 1), 1);
}

#namespace flowgraph_util;

/*
	Name: onflowgraphrun
	Namespace: flowgraph_util
	Checksum: 0xF7EA7234
	Offset: 0x1948
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onflowgraphrun()
{
	self.owner waittill(#"flowgraph_run");
	return true;
}

/*
	Name: waitfunc
	Namespace: flowgraph_util
	Checksum: 0x60EB9D67
	Offset: 0x1978
	Size: 0x1E
	Parameters: 2
	Flags: None
*/
function waitfunc(x, f_seconds)
{
	wait(f_seconds);
	return true;
}

/*
	Name: createthread
	Namespace: flowgraph_util
	Checksum: 0xD866B3D2
	Offset: 0x19A0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function createthread(x)
{
	return true;
}

#namespace flowgraph_random;

/*
	Name: randomfloatinrangefunc
	Namespace: flowgraph_random
	Checksum: 0x2DA3CABA
	Offset: 0x19B8
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function randomfloatinrangefunc(f_min, f_max)
{
	return randomfloatrange(f_min, f_max);
}

/*
	Name: randomunitvector
	Namespace: flowgraph_random
	Checksum: 0xDEE6D46A
	Offset: 0x19F0
	Size: 0x5A
	Parameters: 0
	Flags: None
*/
function randomunitvector()
{
	return vectornormalize((randomfloat(1), randomfloat(1), randomfloat(1)));
}

#namespace flowgraph_math;

/*
	Name: multiply
	Namespace: flowgraph_math
	Checksum: 0x42499414
	Offset: 0x1A58
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function multiply(var_d895ca40, var_3029f96f)
{
	return var_3029f96f * var_3029f96f;
}

/*
	Name: divide
	Namespace: flowgraph_math
	Checksum: 0x817DB9EF
	Offset: 0x1A80
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function divide(var_d895ca40, var_3029f96f)
{
	return var_d895ca40 / var_3029f96f;
}

/*
	Name: add
	Namespace: flowgraph_math
	Checksum: 0x62519D34
	Offset: 0x1AA8
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function add(var_d895ca40, var_3029f96f)
{
	return var_d895ca40 + var_3029f96f;
}

/*
	Name: subtract
	Namespace: flowgraph_math
	Checksum: 0x6ED8AEBD
	Offset: 0x1AD0
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function subtract(var_d895ca40, var_3029f96f)
{
	return var_d895ca40 - var_3029f96f;
}

/*
	Name: negate
	Namespace: flowgraph_math
	Checksum: 0x23345F7
	Offset: 0x1AF8
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function negate(v)
{
	return v * -1;
}

/*
	Name: vectordotfunc
	Namespace: flowgraph_math
	Checksum: 0x236796DB
	Offset: 0x1B18
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function vectordotfunc(v_1, v_2)
{
	return vectordot(v_1, v_2);
}

#namespace flowgraph_lighting;

/*
	Name: getlightingstatefunc
	Namespace: flowgraph_lighting
	Checksum: 0x26DF5795
	Offset: 0x1B50
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function getlightingstatefunc()
{
	return getlightingstate();
}

#namespace namespace_f851c3be;

/*
	Name: function_35dc468d
	Namespace: namespace_f851c3be
	Checksum: 0xCFB56E45
	Offset: 0x1B70
	Size: 0x18
	Parameters: 1
	Flags: None
*/
function function_35dc468d(str_field)
{
	return level.(str_field);
}

/*
	Name: function_f9d5c4b0
	Namespace: namespace_f851c3be
	Checksum: 0xF3CA9727
	Offset: 0x1B90
	Size: 0x32
	Parameters: 3
	Flags: None
*/
function function_f9d5c4b0(x, str_field, var_b8003601)
{
	level.(str_field) = var_b8003601;
	return true;
}

#namespace namespace_22752a75;

/*
	Name: function_8892c7a6
	Namespace: namespace_22752a75
	Checksum: 0x1046DE28
	Offset: 0x1BD0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_8892c7a6(i_value)
{
	return i_value;
}

/*
	Name: function_28c4ae67
	Namespace: namespace_22752a75
	Checksum: 0xB03E8B83
	Offset: 0x1BE8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_28c4ae67(var_2eb63fd3)
{
	return var_2eb63fd3;
}

/*
	Name: function_36bf9c6c
	Namespace: namespace_22752a75
	Checksum: 0xFBA43CF1
	Offset: 0x1C00
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_36bf9c6c(b_value)
{
	return b_value;
}

/*
	Name: function_fe4cf085
	Namespace: namespace_22752a75
	Checksum: 0x852853D4
	Offset: 0x1C18
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_fe4cf085(str_value)
{
	return str_value;
}

/*
	Name: function_3ece9d7e
	Namespace: namespace_22752a75
	Checksum: 0xB0B63CE9
	Offset: 0x1C30
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_3ece9d7e(var_4cb0cd3c)
{
	return var_4cb0cd3c;
}

/*
	Name: function_68a5d644
	Namespace: namespace_22752a75
	Checksum: 0xFAD5A247
	Offset: 0x1C48
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_68a5d644(var_30e9e231)
{
	return var_30e9e231;
}

/*
	Name: function_4e718879
	Namespace: namespace_22752a75
	Checksum: 0x4F4C8B58
	Offset: 0x1C60
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_4e718879(v_value)
{
	return v_value;
}

/*
	Name: function_a7a4e2b8
	Namespace: namespace_22752a75
	Checksum: 0x6AFBEE6
	Offset: 0x1C78
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_a7a4e2b8(var_f4af12cc)
{
	return var_f4af12cc;
}

/*
	Name: function_9ef80b8b
	Namespace: namespace_22752a75
	Checksum: 0xD30216BD
	Offset: 0x1C90
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_9ef80b8b(var_f74b77ea)
{
	return var_f74b77ea;
}

/*
	Name: introduction_minigun
	Namespace: namespace_22752a75
	Checksum: 0xF3D3B7DF
	Offset: 0x1CA8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function introduction_minigun(var_e08c6927)
{
	return var_e08c6927;
}

/*
	Name: function_513da14e
	Namespace: namespace_22752a75
	Checksum: 0x899D9444
	Offset: 0x1CC0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_513da14e(var_162b6305)
{
	return var_162b6305;
}

/*
	Name: function_7cbb60c3
	Namespace: namespace_22752a75
	Checksum: 0x113E7B2B
	Offset: 0x1CD8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_7cbb60c3(var_e7355b57)
{
	return var_e7355b57;
}

/*
	Name: function_f2357a4d
	Namespace: namespace_22752a75
	Checksum: 0x1BA998EF
	Offset: 0x1CF0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_f2357a4d(var_52d6c2bd)
{
	return var_52d6c2bd;
}

/*
	Name: function_79f7d941
	Namespace: namespace_22752a75
	Checksum: 0x7868F669
	Offset: 0x1D08
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_79f7d941(var_b8003601)
{
	return var_b8003601;
}

/*
	Name: function_fdafe394
	Namespace: namespace_22752a75
	Checksum: 0xB427D063
	Offset: 0x1D20
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_fdafe394(var_e477c3b)
{
	return var_e477c3b;
}

/*
	Name: function_28848a6a
	Namespace: namespace_22752a75
	Checksum: 0x3E5C35D
	Offset: 0x1D38
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_28848a6a(var_6b11d5a)
{
	return var_6b11d5a;
}

/*
	Name: function_8f5a9b3e
	Namespace: namespace_22752a75
	Checksum: 0x2B79EA5E
	Offset: 0x1D50
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_8f5a9b3e(fx_value)
{
	return fx_value;
}

/*
	Name: function_a5f771ce
	Namespace: namespace_22752a75
	Checksum: 0x4F1F66E9
	Offset: 0x1D68
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_a5f771ce(var_e0bddaf5)
{
	return var_e0bddaf5;
}

/*
	Name: function_527fa489
	Namespace: namespace_22752a75
	Checksum: 0x1D252F63
	Offset: 0x1D80
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_527fa489(var_5ab747e5)
{
	return var_5ab747e5;
}

