module m41.input.input;

import m41.input.adapters;
import std.container;
import m41.utility;
import m41.core.events;


alias cbfunc = void delegate();

/**
 * Abstract class to store the appropriate Adapter
 */
final abstract class Input
{
private:
    static Array!(cbfunc)[string] registration;

public static:
    /// The active Adapter
    InputAdapter adapter;
    alias adapter this;

    /**
     * Initialize the controllers.
     */
    final void initialize()
    {
        adapter = new SDLInputAdapter;
        adapter.initialize();

        //set event handlers
        adapter.onKeyPress(&Input.handleKeyPress);
        adapter.onKeyRelease(&Input.handleKeyRelease);
        adapter.onMouseMove(&Input.handleMouseMove);
        adapter.onQuit({Hub.postEvent(Events.Quit);});
    }

    final void handleKeyPress(KeyboardButtons key) {
        switch(key) {
            case KeyboardButtons.Escape:
                Hub.postEvent(Events.Quit);
            break;
            default:
            break;
        }
    }

    final void handleKeyRelease(KeyboardButtons key) {
        switch(key) {
            default:
            break;
        }
    }

    final void handleMouseMove(int x_pos, int y_pos, int dx, int dy) {

    }

    /**
     * Shutdown the adapter and shaders.
     */
    final void shutdown()
    {
        adapter.shutdown();
    }

private:
    this() { }
}