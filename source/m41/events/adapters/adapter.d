module m41.events.adapters.adapter;

enum KeyboardButtons: uint
{
    Backspace        , /// Backspace key
    Clear            ,
    Tab              , /// Tab key
    Return           , /// Enter key
    Pause            , /// Pause key
    CapsLock         , /// Capital/Caps Lock key
    Escape           , /// Escape key
    Space            , /// Space bar
    PageUp           , /// Page Up/Prior key
    PageDown         , /// Page Down/Next key
    End              , /// End key
    Home             , /// Home key
    Left             , /// Left arrow key
    Up               , /// Up arrow key
    Right            , /// Right arrow key
    Down             , /// Down arrow key
    Select           , /// Select key
    Print            , /// Print key
    Execute          , /// Execute key
    PrintScreen      , /// Print Screen/Snapshot key
    Insert           , /// Insert key
    Delete           , /// Delete key
    Help             , /// Help key
    Keyboard0        , /// 0 key
    Keyboard1        , /// 1 key
    Keyboard2        , /// 2 key
    Keyboard3        , /// 3 key
    Keyboard4        , /// 4 key
    Keyboard5        , /// 5 key
    Keyboard6        , /// 6 key
    Keyboard7        , /// 7 key
    Keyboard8        , /// 8 key
    Keyboard9        , /// 9 key
    A                , /// A key
    B                , /// B key
    C                , /// C key
    D                , /// D key
    E                , /// E key
    F                , /// F key
    G                , /// G key
    H                , /// H key
    I                , /// I key
    J                , /// J key
    K                , /// K key
    L                , /// L key
    M                , /// M key
    N                , /// N key
    O                , /// O key
    P                , /// P key
    Q                , /// Q key
    R                , /// R key
    S                , /// S key
    T                , /// T key
    U                , /// U key
    V                , /// V key
    W                , /// W key
    X                , /// X key
    Y                , /// Y key
    Z                , /// Z key
    SuperLeft        , /// Left windows key
    SuperRight       , /// Right windows key
    Numpad0          , /// 0 key
    Numpad1          , /// 1 key
    Numpad2          , /// 2 key
    Numpad3          , /// 3 key
    Numpad4          , /// 4 key
    Numpad5          , /// 5 key
    Numpad6          , /// 6 key
    Numpad7          , /// 7 key
    Numpad8          , /// 8 key
    Numpad9          , /// 9 key
    NumpadMultiply   , /// Multiply key
    NumpadAdd        , /// Addition key
    NumpadEnter      , /// Seperator key
    NumpadSubtract   , /// Subtraction key
    NumpadDecimal    , /// Decimal key
    NumpadDivide     , /// Division key
    F1               , /// Function 1 key
    F2               , /// Function 2 key
    F3               , /// Function 3 key
    F4               , /// Function 4 key
    F5               , /// Function 5 key
    F6               , /// Function 6 key
    F7               , /// Function 7 key
    F8               , /// Function 8 key
    F9               , /// Function 9 key
    F10              , /// Function 10 key
    F11              , /// Function 11 key
    F12              , /// Function 12 key
    F13              , /// Function 13 key
    F14              , /// Function 14 key
    F15              , /// Function 15 key
    F16              , /// Function 16 key
    F17              , /// Function 17 key
    F18              , /// Function 18 key
    F19              , /// Function 19 key
    F20              , /// Function 20 key
    F21              , /// Function 21 key
    F22              , /// Function 22 key
    F23              , /// Function 23 key
    F24              , /// Function 24 key
    NumLock          , /// Num Lock key
    ScrollLock       , /// Scroll Lock key
    ShiftLeft        , /// Left shift key
    ShiftRight       , /// Right shift key
    ControlLeft      , /// Left control key
    ControlRight     , /// Right control key
    AltLeft          , /// Left Alt key
    AltRight         , /// Right Alt key
    END
}

//enum KeyboardModifiers : uint {
//    ShiftLeft = 0, /// Left shift key
//    ShiftRight , /// Right shift key
//    ControlLeft, /// Left control key
//    ControlRight, /// Right control key
//    AltLeft    , /// Left Alt key
//    AltRight   , /// Right Alt key
//    MetaLeft, /// Left windows key
//    MetaRight, /// Right windows key
//    END       
//}

/**
* Base class for core rendering logic
*/
abstract class EventAdapter
{

bool[KeyboardButtons.END] key_state;

public:
    /// GL DeviceContext
    //mixin( Property!_deviceContext );

    /**
    * Initializes the Adapter, called in loading
    */
    abstract void initialize();

    abstract void update();

    /**
    * Shuts down the Adapter
    */
    abstract void shutdown();

    final void listenOnKeyPress() {

    }

    final void listenOnKeyRelease() {

    }

    final void listenOnMouseMove() {

    }

    final void listenOnQuit() {

    }

    final void isKeyPressed(KeyboardButtons key) {

    }

protected:
    void keyPressed(KeyboardButtons key) {
        key_state[key] = true;
    }

    void quitRequested() {

    }

    void mouseMoved(x_pos, y_pos, dx, dy) {

    }

    void keyReleased(KeyboardButtons key) {
        key_state[key] = false;
    }
}