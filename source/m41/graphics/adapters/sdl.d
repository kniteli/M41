module m41.graphics.adapters.sdl;

import m41.graphics.adapters.adapter;
import m41.graphics.graphics;
import m41.utility;
public import derelict.sdl2.sdl;
import derelict.opengl3.gl3;

alias SDL_Window* GLRenderContext;
alias SDL_GLContext GLDeviceContext;

/**
* TODO
*/
final class SDLGLAdapter : GraphicsAdapter
{

private:
	GLDeviceContext sdlGLContext;
	GLRenderContext sdlWindow;

public:
    static @property SDLGLAdapter get() { return cast(SDLGLAdapter)Graphics.adapter; }

    override void initialize() { 
		assert(DerelictSDL2.isLoaded(), "DerelictSDL2 must be loaded before initializing the SDLGLAdapter");
    	DerelictGL3.load();
    		    // set the opengl context version
	    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
	    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 2);

		SDL_InitSubSystem(SDL_INIT_VIDEO);

	    // turn on double buffering set the depth buffer to 24 bits
	    // you may need to change this to 16 or 32 for your system
	    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
	    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);

	    openWindow();
		glViewport(0, 0, cast(GLsizei)1024, cast(GLsizei)768);
	   	glClearColor( 0.0, 0.0, 0.0, 0.0 );
	    // create the opengl3 context
	    this.sdlGLContext = SDL_GL_CreateContext(this.sdlWindow);
	   	SDL_GL_SetSwapInterval(0);

		DerelictGL3.reload();

    	if( DerelictGL3.loadedVersion < GLVersion.GL32 )
        {
            logFatal( "Your version of OpenGL is unsupported. Required: GL40 Yours: ", DerelictGL3.loadedVersion );
            //throw new Exception( "Unsupported version of OpenGL." );
            return;
        }
	   	this.renderContext = this.sdlWindow;
	   	this.deviceContext = this.sdlGLContext;
    }

    override void shutdown() { 
		// delete opengl3 context, destroy sdl2 window, and shut down sdl subsystems
	    SDL_GL_DeleteContext(this.deviceContext);
	    closeWindow();
	    SDL_QuitSubSystem(SDL_INIT_VIDEO);
    }

    override void resize() { }
    override void refresh() { }
    
    override void swapBuffers() {
        SDL_GL_SwapWindow(sdlWindow);
    }

    override void openWindow() { 
	    // create the sdl2 window
	    this.sdlWindow = SDL_CreateWindow("Test Window", SDL_WINDOWPOS_CENTERED,
	            SDL_WINDOWPOS_CENTERED, 1024, 768,
	            SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN);

        assert( this.sdlWindow );
    }

    override void closeWindow() {
    	SDL_DestroyWindow(this.sdlWindow);
    }

    override void messageLoop() { }
}