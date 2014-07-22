module m41.core.main;

import derelict.sdl2.sdl;
import m41.utility, m41.graphics, m41.input, m41.core.events;

class MainCore {

private:

	bool running = false;
    EventsComponent events;
    alias events this;

public:
	void init() {
		DerelictSDL2.load();
		SDL_Init(0);
		logDebug( "Initializing..." );
		events = new EventsComponent();
		this.addTrigger!(ActionTrigger)(Events.Quit, {this.running = false;});
        bench!( { Graphics.initialize(); } )( "Graphics init" );
        bench!( { Logger.initialize(); } )( "Log Init" );
        bench!( { Input.initialize(); })("Input Init");
	}	

	void run() {
        this.running = true;
		while(running) {
			Graphics.update();
			Input.update();
		}
	}

	void cleanup() {
        SDL_Quit();
        DerelictSDL2.unload();		
	}
}