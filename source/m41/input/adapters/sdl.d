module m41.input.adapters.sdl;

import derelict.sdl2.sdl;
import m41.input.adapters.adapter;

immutable KeyboardButtons[Sint32] sdl_keymap; 

static this() {
    sdl_keymap = [
        SDLK_BACKSPACE : KeyboardButtons.Backspace, /// Backspace key
        SDLK_TAB : KeyboardButtons.Tab, /// Tab key
        SDLK_CLEAR : KeyboardButtons.Clear, /// Clear key
        SDLK_RETURN : KeyboardButtons.Return, /// Enter key
        SDLK_PAUSE  : KeyboardButtons.Pause, /// Pause key
        SDLK_CAPSLOCK  : KeyboardButtons.CapsLock, /// Capital/Caps Lock key
        SDLK_ESCAPE  : KeyboardButtons.Escape, /// Escape key
        SDLK_SPACE  : KeyboardButtons.Space, /// Space bar
        SDLK_PAGEUP  : KeyboardButtons.PageUp, /// Page Up/Prior key
        SDLK_PAGEDOWN  : KeyboardButtons.PageDown, /// Page Down/Next key
        SDLK_END  : KeyboardButtons.End, /// End key
        SDLK_HOME  : KeyboardButtons.Home, /// Home key
        SDLK_LEFT  : KeyboardButtons.Left, /// Left arrow key
        SDLK_UP  : KeyboardButtons.Up, /// Up arrow key
        SDLK_RIGHT  : KeyboardButtons.Right, /// Right arrow key
        SDLK_DOWN  : KeyboardButtons.Down, /// Down arrow key
        SDLK_PRINTSCREEN : KeyboardButtons.PrintScreen, /// Print Screen/Snapshot key
        SDLK_INSERT  : KeyboardButtons.Insert, /// Insert key
        SDLK_DELETE  : KeyboardButtons.Delete, /// Delete key
        SDLK_0  : KeyboardButtons.Keyboard0, /// 0 key
        SDLK_1  : KeyboardButtons.Keyboard1, /// 1 key
        SDLK_2  : KeyboardButtons.Keyboard2, /// 2 key
        SDLK_3  : KeyboardButtons.Keyboard3, /// 3 key
        SDLK_4  : KeyboardButtons.Keyboard4, /// 4 key
        SDLK_5  : KeyboardButtons.Keyboard5, /// 5 key
        SDLK_6  : KeyboardButtons.Keyboard6, /// 6 key
        SDLK_7  : KeyboardButtons.Keyboard7, /// 7 key
        SDLK_8  : KeyboardButtons.Keyboard8, /// 8 key
        SDLK_9  : KeyboardButtons.Keyboard9, /// 9 key
        SDLK_a  : KeyboardButtons.A, /// A key
        SDLK_b  : KeyboardButtons.B, /// B key
        SDLK_c  : KeyboardButtons.C, /// C key
        SDLK_d  : KeyboardButtons.D, /// D key
        SDLK_e  : KeyboardButtons.E, /// E key
        SDLK_f  : KeyboardButtons.F, /// F key
        SDLK_g  : KeyboardButtons.G, /// G key
        SDLK_h  : KeyboardButtons.H, /// H key
        SDLK_i  : KeyboardButtons.I, /// I key
        SDLK_j  : KeyboardButtons.J, /// J key
        SDLK_k  : KeyboardButtons.K, /// K key
        SDLK_l  : KeyboardButtons.L, /// L key
        SDLK_m  : KeyboardButtons.M, /// M key
        SDLK_n  : KeyboardButtons.N, /// N key
        SDLK_o  : KeyboardButtons.O, /// O key
        SDLK_p  : KeyboardButtons.P, /// P key
        SDLK_q  : KeyboardButtons.Q, /// Q key
        SDLK_r  : KeyboardButtons.R, /// R key
        SDLK_s  : KeyboardButtons.S, /// S key
        SDLK_t  : KeyboardButtons.T, /// T key
        SDLK_u  : KeyboardButtons.U, /// U key
        SDLK_v  : KeyboardButtons.V, /// V key
        SDLK_w  : KeyboardButtons.W, /// W key
        SDLK_x  : KeyboardButtons.X, /// X key
        SDLK_y  : KeyboardButtons.Y, /// Y key
        SDLK_z  : KeyboardButtons.Z, /// Z key
        SDLK_LGUI : KeyboardButtons.SuperLeft,/// Left windows key
        SDLK_RGUI : KeyboardButtons.SuperRight, /// Right windows key
        SDLK_KP_0  : KeyboardButtons.Numpad0, /// 0 key
        SDLK_KP_1  : KeyboardButtons.Numpad1, /// 1 key
        SDLK_KP_2  : KeyboardButtons.Numpad2, /// 2 key
        SDLK_KP_3  : KeyboardButtons.Numpad3, /// 3 key
        SDLK_KP_4  : KeyboardButtons.Numpad4, /// 4 key
        SDLK_KP_5  : KeyboardButtons.Numpad5, /// 5 key
        SDLK_KP_6  : KeyboardButtons.Numpad6, /// 6 key
        SDLK_KP_7  : KeyboardButtons.Numpad7, /// 7 key
        SDLK_KP_8  : KeyboardButtons.Numpad8, /// 8 key
        SDLK_KP_9  : KeyboardButtons.Numpad9, /// 9 key
        SDLK_KP_MULTIPLY  : KeyboardButtons.NumpadMultiply, /// Multiply key
        SDLK_KP_PLUS       : KeyboardButtons.NumpadAdd, /// Addition key
        SDLK_KP_ENTER : KeyboardButtons.NumpadEnter, /// Seperator key
        SDLK_KP_MINUS  : KeyboardButtons.NumpadSubtract, /// Subtraction key
        SDLK_KP_DECIMAL   : KeyboardButtons.NumpadDecimal, /// Decimal key
        SDLK_KP_DIVIDE    : KeyboardButtons.NumpadDivide, /// Division key
        SDLK_F1   : KeyboardButtons.F1, /// Function 1 key
        SDLK_F2   : KeyboardButtons.F2, /// Function 2 key
        SDLK_F3   : KeyboardButtons.F3, /// Function 3 key
        SDLK_F4   : KeyboardButtons.F4, /// Function 4 key
        SDLK_F5   : KeyboardButtons.F5, /// Function 5 key
        SDLK_F6   : KeyboardButtons.F6, /// Function 6 key
        SDLK_F7   : KeyboardButtons.F7, /// Function 7 key
        SDLK_F8   : KeyboardButtons.F8, /// Function 8 key
        SDLK_F9   : KeyboardButtons.F9, /// Function 9 key
        SDLK_F10  : KeyboardButtons.F10, /// Function 10 key
        SDLK_F11  : KeyboardButtons.F11, /// Function 11 key
        SDLK_F12  : KeyboardButtons.F12, /// Function 12 key
        SDLK_F13  : KeyboardButtons.F13, /// Function 13 key
        SDLK_F14  : KeyboardButtons.F14, /// Function 14 key
        SDLK_F15  : KeyboardButtons.F15, /// Function 15 key
        SDLK_F16  : KeyboardButtons.F16, /// Function 16 key
        SDLK_F17  : KeyboardButtons.F17, /// Function 17 key
        SDLK_F18  : KeyboardButtons.F18, /// Function 18 key
        SDLK_F19  : KeyboardButtons.F19, /// Function 19 key
        SDLK_F20  : KeyboardButtons.F20, /// Function 20 key
        SDLK_F21  : KeyboardButtons.F21, /// Function 21 key
        SDLK_F22  : KeyboardButtons.F22, /// Function 22 key
        SDLK_F23  : KeyboardButtons.F23, /// Function 23 key
        SDLK_F24  : KeyboardButtons.F24, /// Function 24 key
        SDLK_NUMLOCKCLEAR  : KeyboardButtons.NumLock, /// Num Lock key
        SDLK_SCROLLLOCK  : KeyboardButtons.ScrollLock, /// Scroll Lock key
        SDLK_LSHIFT : KeyboardButtons.ShiftLeft, /// Left shift key
        SDLK_RSHIFT : KeyboardButtons.ShiftRight, /// Right shift key
        SDLK_LCTRL : KeyboardButtons.ControlLeft, /// Left control key
        SDLK_RCTRL : KeyboardButtons.ControlRight, /// Right control key
        SDLK_LALT : KeyboardButtons.AltLeft, /// Left Alt key
        SDLK_RALT : KeyboardButtons.AltRight, /// Right Alt key
    ];
}

//immutable int[uint] sdl_modmap = [
//    KeyboardModifiers.None : KMOD_NONE
//    KeyboardModifiers.ShiftLeft : KMOD_LSHIFT, /// Left shift key
//    KeyboardModifiers.ShiftRight : KMOD_RSHIFT, /// Right shift key
//    KeyboardModifiers.ControlLeft : KMOD_LCTRL, /// Left control key
//    KeyboardModifiers.ControlRight : KMOD_RCTRL, /// Right control key
//    KeyboardModifiers.AltLeft    : KMOD_LALT, /// Left Alt key
//    KeyboardModifiers.AltRight   : KMOD_RALT, /// Right Alt key
//    KeyboardModifiers.SuperLeft : KMOD_LGUI, /// Left windows key
//    KeyboardModifiers.SuperRight : KMOD_RGUI, /// Right windows key
//    KeyboardModifiers.Numlock : KMOD_NUM,
//    KeyboardModifiers.Capslock : KMOD_CAPS,
//    KeyboardModifiers.Control : KMOD_CTRL,
//    KeyboardModifiers.Shift : KMOD_SHIFT,
//    KeyboardModifiers.Alt : KMOD_ALT,
//];
/**
* TODO
*/
final class SDLInputAdapter : InputAdapter {

    /**
    * Initializes the Adapter, called in loading
    */
    override void initialize() {
    	SDL_InitSubSystem(SDL_INIT_EVENTS);
    }

    override void update() {
        SDL_Event event;
        while(SDL_PollEvent(&event)) {
            switch(event.type) {
                case SDL_KEYDOWN:
                    if(auto key = event.key.keysym.sym in sdl_keymap) {
                        this.keyPressed(*key);
                    }
                    break;
                case SDL_KEYUP:

                    if(auto key = event.key.keysym.sym in sdl_keymap) {
                        this.keyReleased(*key);
                    }                   
                    break;
                case SDL_MOUSEMOTION:
                    this.mouseMoved(event.motion.x, event.motion.y, event.motion.xrel, event.motion.yrel);
                    break;
                case SDL_QUIT:
                    this.quitRequested();
                    break;
                default:
                    break;
            }
        }
    }

    /**
    * Shuts down the Adapter
    */
    override void shutdown() {
        SDL_QuitSubSystem(SDL_INIT_EVENTS);
    }

}