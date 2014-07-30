/**
* Contains all core code for the Graphics adapters, which is similar across all platforms
*/
module m41.graphics.adapters.adapter;
import m41.graphics.adapters.sdl;
import m41.graphics.geometry;
import m41.graphics.shaders;
import m41.utility;

import gl3n.linalg, gl3n.frustum, gl3n.math;
import derelict.opengl3.gl3;

import std.algorithm, std.array;

/**
* Base class for core rendering logic
*/
abstract class GraphicsAdapter
{
private:
    GLDeviceContext _deviceContext;
    GLRenderContext _renderContext;

    uint _width, _screenWidth;
    uint _height, _screenHeight;
    bool _fullscreen, _backfaceCulling, _vsync;

    GLuint vao;
    GLuint vbo;
    //uint _diffuseRenderTexture; //Alpha channel stores Specular map average
    //uint _normalRenderTexture; //Alpha channel stores nothing important
    //uint _depthRenderTexture;
    // Do not add properties for:
    //UserInterface[] uis;

public:
    /// GL DeviceContext
    mixin( Property!_deviceContext );
    /// GL RenderContext
    mixin( Property!_renderContext );

    /// Pixel width of the rendering area
    mixin( Property!_width );
    /// Pixel width of the actual window
    mixin( Property!_screenWidth );
    /// Pixel height of the rendering area
    mixin( Property!_height );
    /// Pixel height of the actual window
    mixin( Property!_screenHeight );
    /// If the screen properties match the rendering dimensions
    mixin( Property!_fullscreen );
    /// Hiding backsides of triangles
    mixin( Property!_backfaceCulling );
    /// Vertical Syncing
    mixin( Property!_vsync );
    ///// FBO for deferred render textures
    //mixin( Property!_deferredFrameBuffer );
    ///// Texture storing the Diffuse colors and Specular Intensity
    //mixin( Property!_diffuseRenderTexture );
    ///// Texture storing the Sphermapped Normal XY and the Object ID in Z
    //mixin( Property!_normalRenderTexture );
    ///// Texture storing the depth
    //mixin( Property!_depthRenderTexture );

    /**
    * Initializes the Adapter, called in loading
    */
    abstract void initialize();
    /**
    * Shuts down the Adapter
    */
    abstract void shutdown();
    /**
    * Resizes the window and updates FBOs
    */
    abstract void resize();
    /**
    * Reloads the Adapter without closing
    */
    abstract void refresh();
    /**
    * Swaps the back buffer to the screen
    */
    abstract void swapBuffers();

    /**
    * Opens the window
    */
    abstract void openWindow();
    /**
    * Closes the window
    */
    abstract void closeWindow();

    /**
    * TODO
    */
    abstract void messageLoop();

    final void initializeRendering() {
        glGenVertexArrays(1, &vao);
        glGenBuffers(1, &vbo);
        glBindVertexArray(vao);
        glBindBuffer(GL_ARRAY_BUFFER, vbo);
        auto perspective_matrix = mat4.perspective(1024, 768, 60f, 1f, 10000f);
        auto shader = Shaders["standard"];
        glUseProgram(shader.programID);
            shader.bindUniformMatrix4fv( shader.WorldViewProjection, perspective_matrix );
        glUseProgram(0);
    }

    final void update(float[] mesh) {
        glUseProgram(Shaders["standard"].programID);
        glBufferData(GL_ARRAY_BUFFER, mesh.length*float.sizeof, mesh.ptr, GL_STATIC_DRAW);
        glEnableVertexAttribArray(0);
        glVertexAttribPointer(0, 4, GL_FLOAT, GL_FALSE, 0, null);
        glDrawArrays(GL_TRIANGLES, 0, cast(int)mesh.length/4);
        this.swapBuffers();
    }
}
