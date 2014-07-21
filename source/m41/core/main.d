module m41.core.main;

import derelict.sdl2.sdl;
import m41.utility, m41.graphics;

class MainCore {

public static:
	void init() {
		DerelictSDL2.load();
		SDL_Init(0);
		logDebug( "Initializing..." );
        bench!( { Graphics.initialize(); } )( "Graphics init" );
        bench!( { Logger.initialize(); } )( "Log Init" );
        bench!( { Input.initialize(); })("Input Init");
	}	

	void run() {

	}

	void cleanup() {
        SDL_Quit();
        DerelictSDL2.unload();		
	}
}