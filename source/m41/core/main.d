module m41.core.main;

import derelict.sdl2.sdl;
import m41.utility, m41.graphics, m41.input, m41.core;
import m41.game.generation.galaxy;
import gl3n.linalg;

class MainCore {

protected:

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
        bench!( { Logger.initialize(); } )( "Log Init" );
        bench!( { Graphics.initialize(); } )( "Graphics init" );
        bench!( { Input.initialize(); })("Input Init");
	}	

	final void run() {
        this.running = true;
        GalaxyGenerator.init();
        auto mesh = Scene.generateGalaxyMesh(GalaxyGenerator.generate());
        //float[] mesh = vec4(0.0, 0.0, 0.0, 1.0).vector;
        //mesh ~= vec4(1.0, 0.0, 0.0, 1.0).vector;
        //mesh ~= vec4(0.0, 1.0, 0.0, 1.0).vector;
		while(running) {
			Graphics.update(mesh);
			Input.update();
		}
	}

	void cleanup() {
        SDL_Quit();
        DerelictSDL2.unload();		
	}
}