module m41.graphics.adapters.sdl;

import m41.graphics.graphics;
import m41.graphics.adapters.adapter;
public import derelict.sdl2.sdl;
import derelict.opengl3.gl3;

public alias SDL_Window* GLRenderContext;
public alias SDL_GLContext GLDeviceContext;

/**
* TODO
*/
final class SDLAdapter : Adapter
{
public:
    static @property SDLAdapter get() { return cast(SDLAdapter)Graphics.adapter; }

    override void initialize() { }
    override void shutdown() { }
    override void resize() { }
    override void refresh() { }
    override void swapBuffers() { }

    override void openWindow() { }
    override void closeWindow() { }

    override void messageLoop() { }
}