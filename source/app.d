import std.stdio;

import m41.core;

void main()
{
	auto core = new MainCore();
	core.init();
	core.run();
	core.cleanup();
}
