/**
 * Container for the graphics adapter needed for the appropriate platform
 */
module m41.graphics.graphics;
import m41.graphics.adapters, m41.graphics.shaders;

/**
 * Abstract class to store the appropriate Adapter
 */
final abstract class Graphics
{
public static:
    /// The active Adapter
    GraphicsAdapter adapter;
    /// Aliases adapter to Graphics
    alias adapter this;

    /**
     * Initialize the controllers.
     */
    final void initialize()
    {
        adapter = new SDLGLAdapter;
        adapter.initialize();
        //adapter.initializeDeferredRendering();
        Shaders.initialize();
    }

    /**
     * Shutdown the adapter and shaders.
     */
    final void shutdown()
    {
        Shaders.shutdown();
        adapter.shutdown();
    }

private:
    this() { }
}
