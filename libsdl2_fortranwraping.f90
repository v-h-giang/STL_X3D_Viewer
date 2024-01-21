!!! libsdl2_fortranwraping.f90
!!! A fortran library inteface all-in-one for SDL2 
!!! Original Work : 
!!!   Author:  Philipp Engel
!!!   GitHub:  https://github.com/interkosmos/fortran-sdl2/
!!!   Licence: ISC

! Modified Work by: Vu Hoang Giang
!     Date : Some day in 2021
!     Mail   :: hgiang.fukui@gmail.com
!     Website : https://www.cae1.ddns.net
!     Github: https://github.com/v-h-giang/

!!! compile with this link option (MSYS2)
!!! -lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_mixer 
MODULE sdl2
      USE, intrinsic :: iso_c_binding

      implicit none
      INTEGER(kind=c_int), PARAMETER :: SDL_FIRSTEVENT               = 0
      INTEGER(kind=c_int), PARAMETER :: SDL_QUITEVENT                = int(z'100')
      INTEGER(kind=c_int), PARAMETER :: SDL_APP_TERMINATING          = int(z'101')
      INTEGER(kind=c_int), PARAMETER :: SDL_APP_LOWMEMORY            = int(z'102')
      INTEGER(kind=c_int), PARAMETER :: SDL_APP_WILLENTERBACKGROUND  = int(z'103')
      INTEGER(kind=c_int), PARAMETER :: SDL_APP_DIDENTERBACKGROUND   = int(z'104')
      INTEGER(kind=c_int), PARAMETER :: SDL_APP_WILLENTERFOREGROUND  = int(z'105')
      INTEGER(kind=c_int), PARAMETER :: SDL_APP_DIDENTERFOREGROUND   = int(z'106')
      INTEGER(kind=c_int), PARAMETER :: SDL_WINDOWEVENT              = int(z'200')
      INTEGER(kind=c_int), PARAMETER :: SDL_SYSWMEVENT               = int(z'201')
      INTEGER(kind=c_int), PARAMETER :: SDL_KEYDOWN                  = int(z'300')
      INTEGER(kind=c_int), PARAMETER :: SDL_KEYUP                    = int(z'301')
      INTEGER(kind=c_int), PARAMETER :: SDL_TEXTEDITING              = int(z'302')
      INTEGER(kind=c_int), PARAMETER :: SDL_TEXTINPUT                = int(z'303')
      INTEGER(kind=c_int), PARAMETER :: SDL_KEYMAPCHANGED            = int(z'304')
      INTEGER(kind=c_int), PARAMETER :: SDL_MOUSEMOTION              = int(z'400')
      INTEGER(kind=c_int), PARAMETER :: SDL_MOUSEBUTTONDOWN          = int(z'401')
      INTEGER(kind=c_int), PARAMETER :: SDL_MOUSEBUTTONUP            = int(z'402')
      INTEGER(kind=c_int), PARAMETER :: SDL_MOUSEWHEEL               = int(z'403')
      INTEGER(kind=c_int), PARAMETER :: SDL_JOYAXISMOTION            = int(z'600')
      INTEGER(kind=c_int), PARAMETER :: SDL_JOYBALLMOTION            = int(z'601')
      INTEGER(kind=c_int), PARAMETER :: SDL_JOYHATMOTION             = int(z'602')
      INTEGER(kind=c_int), PARAMETER :: SDL_JOYBUTTONDOWN            = int(z'603')
      INTEGER(kind=c_int), PARAMETER :: SDL_JOYBUTTONUP              = int(z'604')
      INTEGER(kind=c_int), PARAMETER :: SDL_JOYDEVICEADDED           = int(z'605')
      INTEGER(kind=c_int), PARAMETER :: SDL_JOYDEVICEREMOVED         = int(z'606')
      INTEGER(kind=c_int), PARAMETER :: SDL_CONTROLLERAXISMOTION     = int(z'650')
      INTEGER(kind=c_int), PARAMETER :: SDL_CONTROLLERBUTTONDOWN     = int(z'651')
      INTEGER(kind=c_int), PARAMETER :: SDL_CONTROLLERBUTTONUP       = int(z'652')
      INTEGER(kind=c_int), PARAMETER :: SDL_CONTROLLERDEVICEADDED    = int(z'653')
      INTEGER(kind=c_int), PARAMETER :: SDL_CONTROLLERDEVICEREMOVED  = int(z'654')
      INTEGER(kind=c_int), PARAMETER :: SDL_CONTROLLERDEVICEREMAPPED = int(z'655')
      INTEGER(kind=c_int), PARAMETER :: SDL_FINGERDOWN               = int(z'700')
      INTEGER(kind=c_int), PARAMETER :: SDL_FINGERUP                 = int(z'701')
      INTEGER(kind=c_int), PARAMETER :: SDL_FINGERMOTION             = int(z'702')
      INTEGER(kind=c_int), PARAMETER :: SDL_DOLLARGESTURE            = int(z'800')
      INTEGER(kind=c_int), PARAMETER :: SDL_DOLLARRECORD             = int(z'801')
      INTEGER(kind=c_int), PARAMETER :: SDL_MULTIGESTURE             = int(z'802')
      INTEGER(kind=c_int), PARAMETER :: SDL_CLIPBOARDUPDATE          = int(z'900')
      INTEGER(kind=c_int), PARAMETER :: SDL_DROPFILE                 = int(z'1000')
      INTEGER(kind=c_int), PARAMETER :: SDL_DROPTEXT                 = int(z'1001')
      INTEGER(kind=c_int), PARAMETER :: SDL_DROPBEGIN                = int(z'1002')
      INTEGER(kind=c_int), PARAMETER :: SDL_DROPCOMPLETE             = int(z'1003')
      INTEGER(kind=c_int), PARAMETER :: SDL_AUDIODEVICEADDED         = int(z'1100')
      INTEGER(kind=c_int), PARAMETER :: SDL_AUDIODEVICEREMOVED       = int(z'1101')
      INTEGER(kind=c_int), PARAMETER :: SDL_RENDERTARGETSRESET       = int(z'2000')
      INTEGER(kind=c_int), PARAMETER :: SDL_RENDERDEVICERESET        = int(z'2001')
      INTEGER(kind=c_int), PARAMETER :: SDL_USEREVENT                = int(z'8000')
      INTEGER(kind=c_int), PARAMETER :: SDL_LASTEVEMT                = int(z'FFFF')

      !!!! SDL_HINTS
      character(kind=c_char, len=*), parameter :: SDL_HINT_FRAMEBUFFER_ACCELERATION       = 'SDL_FRAMEBUFFER_ACCELERATION'
      character(kind=c_char, len=*), parameter :: SDL_HINT_RENDER_DRIVER                  = 'SDL_RENDER_DRIVER'
      character(kind=c_char, len=*), parameter :: SDL_HINT_RENDER_OPENGL_SHADERS          = 'SDL_RENDER_OPENGL_SHADERS'
      character(kind=c_char, len=*), parameter :: SDL_HINT_RENDER_DIRECT3D_THREADSAFE     = 'SDL_RENDER_DIRECT3D_THREADSAFE'
      character(kind=c_char, len=*), parameter :: SDL_HINT_RENDER_DIRECT3D11_DEBUG        = 'SDL_RENDER_DIRECT3D11_DEBUG'
      character(kind=c_char, len=*), parameter :: SDL_HINT_RENDER_LOGICAL_SIZE_MODE       = 'SDL_RENDER_LOGICAL_SIZE_MODE'
      character(kind=c_char, len=*), parameter :: SDL_HINT_RENDER_SCALE_QUALITY           = 'SDL_RENDER_SCALE_QUALITY'
      character(kind=c_char, len=*), parameter :: SDL_HINT_RENDER_VSYNC                   = 'SDL_RENDER_VSYNC'
      character(kind=c_char, len=*), parameter :: SDL_HINT_VIDEO_ALLOW_SCREENSAVER        = 'SDL_VIDEO_ALLOW_SCREENSAVER'
      character(kind=c_char, len=*), parameter :: SDL_HINT_VIDEO_X11_XVIDMODE             = 'SDL_VIDEO_X11_XVIDMODE'
      character(kind=c_char, len=*), parameter :: SDL_HINT_VIDEO_X11_XINERAMA             = 'SDL_VIDEO_X11_XINERAMA'
      character(kind=c_char, len=*), parameter :: SDL_HINT_VIDEO_X11_XRANDR               = 'SDL_VIDEO_X11_XRANDR'
      character(kind=c_char, len=*), parameter :: SDL_HINT_VIDEO_X11_NET_WM_PING          = 'SDL_VIDEO_X11_NET_WM_PING'
      character(kind=c_char, len=*), parameter :: SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN = &
                                                      'SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN'
      character(kind=c_char, len=*), parameter :: SDL_HINT_WINDOWS_INTRESOURCE_ICON       = 'SDL_WINDOWS_INTRESOURCE_ICON'
      character(kind=c_char, len=*), parameter :: SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL = 'SDL_WINDOWS_INTRESOURCE_ICON_SMALL'
      character(kind=c_char, len=*), parameter :: SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP     = 'SDL_WINDOWS_ENABLE_MESSAGELOOP'
      character(kind=c_char, len=*), parameter :: SDL_HINT_GRAB_KEYBOARD                  = 'SDL_GRAB_KEYBOARD'
      character(kind=c_char, len=*), parameter :: SDL_HINT_MOUSE_NORMAL_SPEED_SCALE       = 'SDL_MOUSE_NORMAL_SPEED_SCALE'
      character(kind=c_char, len=*), parameter :: SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE     = 'SDL_MOUSE_RELATIVE_SPEED_SCALE'
      character(kind=c_char, len=*), parameter :: SDL_HINT_MOUSE_RELATIVE_MODE_WARP       = 'SDL_MOUSE_RELATIVE_MODE_WARP'
      character(kind=c_char, len=*), parameter :: SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH       = 'SDL_MOUSE_FOCUS_CLICKTHROUGH'
      character(kind=c_char, len=*), parameter :: SDL_HINT_TOUCH_MOUSE_EVENTS             = 'SDL_TOUCH_MOUSE_EVENTS'
      character(kind=c_char, len=*), parameter :: SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS   = 'SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS'
      character(kind=c_char, len=*), parameter :: SDL_HINT_IDLE_TIMER_DISABLED            = 'SDL_IOS_IDLE_TIMER_DISABLED'
      character(kind=c_char, len=*), parameter :: SDL_HINT_ORIENTATIONS                   = 'SDL_IOS_ORIENTATIONS'
      character(kind=c_char, len=*), parameter :: SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS  = 'SDL_APPLE_TV_CONTROLLER_UI_EVENTS'
      character(kind=c_char, len=*), parameter :: SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION = 'SDL_APPLE_TV_REMOTE_ALLOW_ROTATION'
      character(kind=c_char, len=*), parameter :: SDL_HINT_ACCELEROMETER_AS_JOYSTICK      = 'SDL_ACCELEROMETER_AS_JOYSTICK'
      character(kind=c_char, len=*), parameter :: SDL_HINT_XINPUT_ENABLED                 = 'SDL_XINPUT_ENABLED'
      character(kind=c_char, len=*), parameter :: SDL_HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING = &
                                                      'SDL_XINPUT_USE_OLD_JOYSTICK_MAPPING'
      character(kind=c_char, len=*), parameter :: SDL_HINT_GAMECONTROLLERCONFIG           = 'SDL_GAMECONTROLLERCONFIG'
      character(kind=c_char, len=*), parameter :: SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES  = 'SDL_GAMECONTROLLER_IGNORE_DEVICES'
      character(kind=c_char, len=*), parameter :: SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT = &
                                                      'SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT'
      character(kind=c_char, len=*), parameter :: SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS = &
                                                      'SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS'
      character(kind=c_char, len=*), parameter :: SDL_HINT_ALLOW_TOPMOST                  = 'SDL_ALLOW_TOPMOST'
      character(kind=c_char, len=*), parameter :: SDL_HINT_TIMER_RESOLUTION               = 'SDL_TIMER_RESOLUTION'
      character(kind=c_char, len=*), parameter :: SDL_HINT_QTWAYLAND_CONTENT_ORIENTATION  = 'SDL_QTWAYLAND_CONTENT_ORIENTATION'
      character(kind=c_char, len=*), parameter :: SDL_HINT_QTWAYLAND_WINDOW_FLAGS         = 'SDL_QTWAYLAND_WINDOW_FLAGS'
      character(kind=c_char, len=*), parameter :: SDL_HINT_THREAD_STACK_SIZE              = 'SDL_THREAD_STACK_SIZE'
      character(kind=c_char, len=*), parameter :: SDL_HINT_VIDEO_HIGHDPI_DISABLED         = 'SDL_VIDEO_HIGHDPI_DISABLED'
      character(kind=c_char, len=*), parameter :: SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK = &
                                                      'SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK'
      character(kind=c_char, len=*), parameter :: SDL_HINT_VIDEO_WIN_D3DCOMPILER          = 'SDL_VIDEO_WIN_D3DCOMPILER'
      character(kind=c_char, len=*), parameter :: SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT = &
                                                      'SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT'
      character(kind=c_char, len=*), parameter :: SDL_HINT_WINRT_PRIVACY_POLICY_URL       = 'SDL_WINRT_PRIVACY_POLICY_URL'
      character(kind=c_char, len=*), parameter :: SDL_HINT_WINRT_PRIVACY_POLICY_LABEL     = 'SDL_WINRT_PRIVACY_POLICY_LABEL'
      character(kind=c_char, len=*), parameter :: SDL_HINT_WINRT_HANDLE_BACK_BUTTON       = 'SDL_WINRT_HANDLE_BACK_BUTTON'
      character(kind=c_char, len=*), parameter :: SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES    = 'SDL_VIDEO_MAC_FULLSCREEN_SPACES'
      character(kind=c_char, len=*), parameter :: SDL_HINT_MAC_BACKGROUND_APP             = 'SDL_MAC_BACKGROUND_APP'
      character(kind=c_char, len=*), parameter :: SDL_HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION = &
                                                      'SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION'
      character(kind=c_char, len=*), parameter :: SDL_HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION = &
                                                      'SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION'
      character(kind=c_char, len=*), parameter :: SDL_HINT_IME_INTERNAL_EDITING           = 'SDL_IME_INTERNAL_EDITING'
      character(kind=c_char, len=*), parameter :: SDL_HINT_ANDROID_SEPARATE_MOUSE_AND_TOUCH = &
                                                      'SDL_ANDROID_SEPARATE_MOUSE_AND_TOUCH'
      character(kind=c_char, len=*), parameter :: SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT    = 'SDL_EMSCRIPTEN_KEYBOARD_ELEMENT'
      character(kind=c_char, len=*), parameter :: SDL_HINT_NO_SIGNAL_HANDLERS             = 'SDL_NO_SIGNAL_HANDLERS'
      character(kind=c_char, len=*), parameter :: SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4     = 'SDL_WINDOWS_NO_CLOSE_ON_ALT_F4'
      character(kind=c_char, len=*), parameter :: SDL_HINT_BMP_SAVE_LEGACY_FORMAT         = 'SDL_BMP_SAVE_LEGACY_FORMAT'
      character(kind=c_char, len=*), parameter :: SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING  = 'SDL_WINDOWS_DISABLE_THREAD_NAMING'
      character(kind=c_char, len=*), parameter :: SDL_HINT_RPI_VIDEO_LAYER                = 'SDL_RPI_VIDEO_LAYER'
      character(kind=c_char, len=*), parameter :: SDL_HINT_OPENGL_ES_DRIVER               = 'SDL_OPENGL_ES_DRIVER'
      character(kind=c_char, len=*), parameter :: SDL_HINT_AUDIO_RESAMPLING_MODE          = 'SDL_AUDIO_RESAMPLING_MODE'
      character(kind=c_char, len=*), parameter :: SDL_HINT_AUDIO_CATEGORY                 = 'SDL_AUDIO_CATEGORY'
      CHARACTER(kind=c_char, len=*), PARAMETER :: SDL_HINT_IME_SHOW_UI                    = "SDL_IME_SHOW_UI"
      CHARACTER(kind=c_char, len=*), PARAMETER :: SDL_HINT_IME_SUPPORT_EXTENDED_TEXT      = "SDL_IME_SUPPORT_EXTENDED_TEXT"

      !!!!! IMG
      integer(kind=c_int), parameter, public :: IMG_INIT_JPG  = int(z'00000001')
      integer(kind=c_int), parameter, public :: IMG_INIT_PNG  = int(z'00000002')
      integer(kind=c_int), parameter, public :: IMG_INIT_TIF  = int(z'00000004')
      integer(kind=c_int), parameter, public :: IMG_INIT_WEBP = int(z'00000008')



      INTEGER, PARAMETER :: c_uint8_t            = c_int8_t
      INTEGER, PARAMETER :: c_uint16_t           = c_int16_t
      INTEGER, PARAMETER :: c_uint32_t           = c_int32_t
      INTEGER, PARAMETER :: c_uint64_t           = c_int64_t
      INTEGER, PARAMETER :: c_unsigned           = c_int
      INTEGER, PARAMETER :: c_unsigned_char      = c_signed_char
      INTEGER, PARAMETER :: c_unsigned_long      = c_long
      INTEGER, PARAMETER :: c_unsigned_long_long = c_long_long
      INTEGER, PARAMETER :: c_unsigned_short     = c_short



      integer, parameter :: sdl_bool = c_int

      integer(kind=c_int), parameter :: SDL_BUTTON_LEFT   = 1
      integer(kind=c_int), parameter :: SDL_BUTTON_MIDDLE = 2
      integer(kind=c_int), parameter :: SDL_BUTTON_RIGHT  = 3
      integer(kind=c_int), parameter :: SDL_BUTTON_X1     = 4
      integer(kind=c_int), parameter :: SDL_BUTTON_X2     = 5
      integer(kind=c_int), parameter :: SDL_BUTTON_LMASK  = ishft(1, SDL_BUTTON_LEFT - 1)
      integer(kind=c_int), parameter :: SDL_BUTTON_MMASK  = ishft(1, SDL_BUTTON_MIDDLE - 1)
      integer(kind=c_int), parameter :: SDL_BUTTON_RMASK  = ishft(1, SDL_BUTTON_RIGHT - 1)
      integer(kind=c_int), parameter :: SDL_BUTTON_X1MASK = ishft(1, SDL_BUTTON_X1 - 1)
      integer(kind=c_int), parameter :: SDL_BUTTON_X2MASK = ishft(1, SDL_BUTTON_X2 - 1)
  



      integer(kind=c_int), parameter :: SDL_WINDOWPOS_UNDEFINED_MASK = int(z'1FFF0000')
      integer(kind=c_int), parameter :: SDL_WINDOWPOS_UNDEFINED      = ior(SDL_WINDOWPOS_UNDEFINED_MASK, 0)
  
      integer(kind=c_int), parameter :: SDL_INIT_TIMER          = int(z'00000001')
      integer(kind=c_int), parameter :: SDL_INIT_AUDIO          = int(z'00000010')
      integer(kind=c_int), parameter :: SDL_INIT_VIDEO          = int(z'00000020')
      integer(kind=c_int), parameter :: SDL_INIT_JOYSTICK       = int(z'00000200')
      integer(kind=c_int), parameter :: SDL_INIT_HAPTIC         = int(z'00001000')
      integer(kind=c_int), parameter :: SDL_INIT_GAMECONTROLLER = int(z'00002000')
      integer(kind=c_int), parameter :: SDL_INIT_EVENTS         = int(z'00004000')
      integer(kind=c_int), parameter :: SDL_INIT_NOPARACHUTE    = int(z'00010000')
      integer(kind=c_int), parameter :: SDL_INIT_EVERYTHING     = ior(SDL_INIT_TIMER, &
                                                                      ior(SDL_INIT_VIDEO, &
                                                                      ior(SDL_INIT_VIDEO, &
                                                                      ior(SDL_INIT_JOYSTICK, &
                                                                      ior(SDL_INIT_HAPTIC, &
                                                                      ior(SDL_INIT_GAMECONTROLLER, &
                                                                      ior(SDL_INIT_EVENTS, SDL_INIT_NOPARACHUTE)))))))
  
      integer(kind=c_int), parameter :: SDL_WINDOW_FULLSCREEN         = int(z'00000001')
      integer(kind=c_int), parameter :: SDL_WINDOW_OPENGL             = int(z'00000002')
      integer(kind=c_int), parameter :: SDL_WINDOW_SHOWN              = int(z'00000004')
      integer(kind=c_int), parameter :: SDL_WINDOW_HIDDEN             = int(z'00000008')
      integer(kind=c_int), parameter :: SDL_WINDOW_BORDERLESS         = int(z'00000010')
      integer(kind=c_int), parameter :: SDL_WINDOW_RESIZABLE          = int(z'00000020')
      integer(kind=c_int), parameter :: SDL_WINDOW_MINIMIZED          = int(z'00000040')
      integer(kind=c_int), parameter :: SDL_WINDOW_MAXIMIZED          = int(z'00000080')
      integer(kind=c_int), parameter :: SDL_WINDOW_INPUT_GRABBED      = int(z'00000100')
      integer(kind=c_int), parameter :: SDL_WINDOW_INPUT_FOCUS        = int(z'00000200')
      integer(kind=c_int), parameter :: SDL_WINDOW_MOUSE_FOCUS        = int(z'00000400')
      integer(kind=c_int), parameter :: SDL_WINDOW_FULLSCREEN_DESKTOP = ior(SDL_WINDOW_FULLSCREEN, &
                                                                            int(z'00001000'))
      integer(kind=c_int), parameter :: SDL_WINDOW_FOREIGN            = int(z'00000800')
      integer(kind=c_int), parameter :: SDL_WINDOW_ALLOW_HIGHDPI      = int(z'00002000')
      integer(kind=c_int), parameter :: SDL_WINDOW_MOUSE_CAPTURE      = int(z'00004000')
      integer(kind=c_int), parameter :: SDL_WINDOW_ALWAYS_ON_TOP      = int(z'00008000')
      integer(kind=c_int), parameter :: SDL_WINDOW_SKIP_TASKBAR       = int(z'00010000')
      integer(kind=c_int), parameter :: SDL_WINDOW_UTILITY            = int(z'00020000')
      integer(kind=c_int), parameter :: SDL_WINDOW_TOOLTIP            = int(z'00040000')
      integer(kind=c_int), parameter :: SDL_WINDOW_POPUP_MENU         = int(z'00080000')
      integer(kind=c_int), parameter :: SDL_WINDOW_VULKAN             = int(z'10000000')


      !!!! ttf style 
      INTEGER            , PARAMETER :: TTF_STYLE_NORMAL  =  0  
      INTEGER            , PARAMETER :: TTF_STYLE_BOLD  =  1  
      INTEGER            , PARAMETER :: TTF_STYLE_ITALIC  =  2  
      INTEGER            , PARAMETER :: TTF_STYLE_UNDERLINE  =  3 
      INTEGER            , PARAMETER :: TTF_STYLE_STRIKETHROUGH  =  4


      !!!! SDL pixel
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_UNKNOWN     = int(z'0')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_INDEX1LSB   = int(z'11100100')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_INDEX1MSB   = int(z'11200100')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_INDEX4LSB   = int(z'12100400')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_INDEX4MSB   = int(z'12200400')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_INDEX8      = int(z'13000801')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_RGB332      = int(z'14110801')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_RGB444      = int(z'15120c02')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_RGB555      = int(z'15130f02')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_BGR555      = int(z'15530f02')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_ARGB4444    = int(z'15321002')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_RGBA4444    = int(z'15421002')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_ABGR4444    = int(z'15721002')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_BGRA4444    = int(z'15821002')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_ARGB1555    = int(z'15331002')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_RGBA5551    = int(z'15441002')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_ABGR1555    = int(z'15731002')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_BGRA5551    = int(z'15841002')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_RGB565      = int(z'15151002')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_BGR565      = int(z'15551002')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_RGB24       = int(z'17101803')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_BGR24       = int(z'17401803')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_RGB888      = int(z'16161804')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_RGBX8888    = int(z'16261804')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_BGR888      = int(z'16561804')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_BGRX8888    = int(z'16661804')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_ARGB8888    = int(z'16362004')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_RGBA8888    = int(z'16462004')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_ABGR8888    = int(z'16762004')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_BGRA8888    = int(z'16862004')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_ARGB2101010 = int(z'16372004')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_YV12        = int(z'32315659')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_IYUV        = int(z'56555949')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_YUY2        = int(z'32595559')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_UYVY        = int(z'59565955')
      integer(kind=c_int), parameter :: SDL_PIXELFORMAT_YVYU        = int(z'55595659')
  
      integer(kind=c_int), parameter :: SDL_ALPHA_OPAQUE      = 255
      integer(kind=c_int), parameter :: SDL_ALPHA_TRANSPARENT = 0



      integer(kind=c_int), parameter :: SDL_RENDERER_SOFTWARE      = int(z'00000001')
      integer(kind=c_int), parameter :: SDL_RENDERER_ACCELERATED   = int(z'00000002')
      integer(kind=c_int), parameter :: SDL_RENDERER_PRESENTVSYNC  = int(z'00000004')
      integer(kind=c_int), parameter :: SDL_RENDERER_TARGETTEXTURE = int(z'00000008')
  
      ! SDL_RendererFlip
      integer(kind=c_int), parameter :: SDL_FLIP_NONE       = int(z'00000000')
      integer(kind=c_int), parameter :: SDL_FLIP_HORIZONTAL = int(z'00000001')
      integer(kind=c_int), parameter :: SDL_FLIP_VERTICAL   = int(z'00000002')



      integer(kind=c_int), parameter :: SDL_BLENDMODE_NONE    = int(z'00000000')
      integer(kind=c_int), parameter :: SDL_BLENDMODE_BLEND   = int(z'00000001')
      integer(kind=c_int), parameter :: SDL_BLENDMODE_ADD     = int(z'00000002')
      integer(kind=c_int), parameter :: SDL_BLENDMODE_MOD     = int(z'00000004')
      integer(kind=c_int), parameter :: SDL_BLENDMODE_INVALID = int(z'7FFFFFFF')


      !!! scancode
      integer(kind=c_int), parameter :: SDL_SCANCODE_UNKNOWN            = 0
      integer(kind=c_int), parameter :: SDL_SCANCODE_A                  = 4
      integer(kind=c_int), parameter :: SDL_SCANCODE_B                  = 5
      integer(kind=c_int), parameter :: SDL_SCANCODE_C                  = 6
      integer(kind=c_int), parameter :: SDL_SCANCODE_D                  = 7
      integer(kind=c_int), parameter :: SDL_SCANCODE_E                  = 8
      integer(kind=c_int), parameter :: SDL_SCANCODE_F                  = 9
      integer(kind=c_int), parameter :: SDL_SCANCODE_G                  = 10
      integer(kind=c_int), parameter :: SDL_SCANCODE_H                  = 11
      integer(kind=c_int), parameter :: SDL_SCANCODE_I                  = 12
      integer(kind=c_int), parameter :: SDL_SCANCODE_J                  = 13
      integer(kind=c_int), parameter :: SDL_SCANCODE_K                  = 14
      integer(kind=c_int), parameter :: SDL_SCANCODE_L                  = 15
      integer(kind=c_int), parameter :: SDL_SCANCODE_M                  = 16
      integer(kind=c_int), parameter :: SDL_SCANCODE_N                  = 17
      integer(kind=c_int), parameter :: SDL_SCANCODE_O                  = 18
      integer(kind=c_int), parameter :: SDL_SCANCODE_P                  = 19
      integer(kind=c_int), parameter :: SDL_SCANCODE_Q                  = 20
      integer(kind=c_int), parameter :: SDL_SCANCODE_R                  = 21
      integer(kind=c_int), parameter :: SDL_SCANCODE_S                  = 22
      integer(kind=c_int), parameter :: SDL_SCANCODE_T                  = 23
      integer(kind=c_int), parameter :: SDL_SCANCODE_U                  = 24
      integer(kind=c_int), parameter :: SDL_SCANCODE_V                  = 25
      integer(kind=c_int), parameter :: SDL_SCANCODE_W                  = 26
      integer(kind=c_int), parameter :: SDL_SCANCODE_X                  = 27
      integer(kind=c_int), parameter :: SDL_SCANCODE_Y                  = 28
      integer(kind=c_int), parameter :: SDL_SCANCODE_Z                  = 29
      integer(kind=c_int), parameter :: SDL_SCANCODE_1                  = 30
      integer(kind=c_int), parameter :: SDL_SCANCODE_2                  = 31
      integer(kind=c_int), parameter :: SDL_SCANCODE_3                  = 32
      integer(kind=c_int), parameter :: SDL_SCANCODE_4                  = 33
      integer(kind=c_int), parameter :: SDL_SCANCODE_5                  = 34
      integer(kind=c_int), parameter :: SDL_SCANCODE_6                  = 35
      integer(kind=c_int), parameter :: SDL_SCANCODE_7                  = 36
      integer(kind=c_int), parameter :: SDL_SCANCODE_8                  = 37
      integer(kind=c_int), parameter :: SDL_SCANCODE_9                  = 38
      integer(kind=c_int), parameter :: SDL_SCANCODE_0                  = 39
      integer(kind=c_int), parameter :: SDL_SCANCODE_RETURN             = 40
      integer(kind=c_int), parameter :: SDL_SCANCODE_ESCAPE             = 41
      integer(kind=c_int), parameter :: SDL_SCANCODE_BACKSPACE          = 42
      integer(kind=c_int), parameter :: SDL_SCANCODE_TAB                = 43
      integer(kind=c_int), parameter :: SDL_SCANCODE_SPACE              = 44
      integer(kind=c_int), parameter :: SDL_SCANCODE_MINUS              = 45
      integer(kind=c_int), parameter :: SDL_SCANCODE_EQUALS             = 46
      integer(kind=c_int), parameter :: SDL_SCANCODE_LEFTBRACKET        = 47
      integer(kind=c_int), parameter :: SDL_SCANCODE_RIGHTBRACKET       = 48
      integer(kind=c_int), parameter :: SDL_SCANCODE_BACKSLASH          = 49
      integer(kind=c_int), parameter :: SDL_SCANCODE_NONUSHASH          = 50
      integer(kind=c_int), parameter :: SDL_SCANCODE_SEMICOLON          = 51
      integer(kind=c_int), parameter :: SDL_SCANCODE_APOSTROPHE         = 52
      integer(kind=c_int), parameter :: SDL_SCANCODE_GRAVE              = 53
      integer(kind=c_int), parameter :: SDL_SCANCODE_COMMA              = 54
      integer(kind=c_int), parameter :: SDL_SCANCODE_PERIOD             = 55
      integer(kind=c_int), parameter :: SDL_SCANCODE_SLASH              = 56
      integer(kind=c_int), parameter :: SDL_SCANCODE_CAPSLOCK           = 57
      integer(kind=c_int), parameter :: SDL_SCANCODE_F1                 = 58
      integer(kind=c_int), parameter :: SDL_SCANCODE_F2                 = 59
      integer(kind=c_int), parameter :: SDL_SCANCODE_F3                 = 60
      integer(kind=c_int), parameter :: SDL_SCANCODE_F4                 = 61
      integer(kind=c_int), parameter :: SDL_SCANCODE_F5                 = 62
      integer(kind=c_int), parameter :: SDL_SCANCODE_F6                 = 63
      integer(kind=c_int), parameter :: SDL_SCANCODE_F7                 = 64
      integer(kind=c_int), parameter :: SDL_SCANCODE_F8                 = 65
      integer(kind=c_int), parameter :: SDL_SCANCODE_F9                 = 66
      integer(kind=c_int), parameter :: SDL_SCANCODE_F10                = 67
      integer(kind=c_int), parameter :: SDL_SCANCODE_F11                = 68
      integer(kind=c_int), parameter :: SDL_SCANCODE_F12                = 69
      integer(kind=c_int), parameter :: SDL_SCANCODE_PRINTSCREEN        = 70
      integer(kind=c_int), parameter :: SDL_SCANCODE_SCROLLLOCK         = 71
      integer(kind=c_int), parameter :: SDL_SCANCODE_PAUSE              = 72
      integer(kind=c_int), parameter :: SDL_SCANCODE_INSERT             = 73
      integer(kind=c_int), parameter :: SDL_SCANCODE_HOME               = 74
      integer(kind=c_int), parameter :: SDL_SCANCODE_PAGEUP             = 75
      integer(kind=c_int), parameter :: SDL_SCANCODE_DELETE             = 76
      integer(kind=c_int), parameter :: SDL_SCANCODE_END                = 77
      integer(kind=c_int), parameter :: SDL_SCANCODE_PAGEDOWN           = 78
      integer(kind=c_int), parameter :: SDL_SCANCODE_RIGHT              = 79
      integer(kind=c_int), parameter :: SDL_SCANCODE_LEFT               = 80
      integer(kind=c_int), parameter :: SDL_SCANCODE_DOWN               = 81
      integer(kind=c_int), parameter :: SDL_SCANCODE_UP                 = 82
      integer(kind=c_int), parameter :: SDL_SCANCODE_NUMLOCKCLEAR       = 83
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_DIVIDE          = 84
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MULTIPLY        = 85
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MINUS           = 86
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_PLUS            = 87
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_ENTER           = 88
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_1               = 89
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_2               = 90
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_3               = 91
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_4               = 92
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_5               = 93
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_6               = 94
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_7               = 95
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_8               = 96
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_9               = 97
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_0               = 98
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_PERIOD          = 99
      integer(kind=c_int), parameter :: SDL_SCANCODE_NONUSBACKSLASH     = 100
      integer(kind=c_int), parameter :: SDL_SCANCODE_APPLICATION        = 101
      integer(kind=c_int), parameter :: SDL_SCANCODE_POWER              = 102
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_EQUALS          = 103
      integer(kind=c_int), parameter :: SDL_SCANCODE_F13                = 104
      integer(kind=c_int), parameter :: SDL_SCANCODE_F14                = 105
      integer(kind=c_int), parameter :: SDL_SCANCODE_F15                = 106
      integer(kind=c_int), parameter :: SDL_SCANCODE_F16                = 107
      integer(kind=c_int), parameter :: SDL_SCANCODE_F17                = 108
      integer(kind=c_int), parameter :: SDL_SCANCODE_F18                = 109
      integer(kind=c_int), parameter :: SDL_SCANCODE_F19                = 110
      integer(kind=c_int), parameter :: SDL_SCANCODE_F20                = 111
      integer(kind=c_int), parameter :: SDL_SCANCODE_F21                = 112
      integer(kind=c_int), parameter :: SDL_SCANCODE_F22                = 113
      integer(kind=c_int), parameter :: SDL_SCANCODE_F23                = 114
      integer(kind=c_int), parameter :: SDL_SCANCODE_F24                = 115
      integer(kind=c_int), parameter :: SDL_SCANCODE_EXECUTE            = 116
      integer(kind=c_int), parameter :: SDL_SCANCODE_HELP               = 117
      integer(kind=c_int), parameter :: SDL_SCANCODE_MENU               = 118
      integer(kind=c_int), parameter :: SDL_SCANCODE_SELECT             = 119
      integer(kind=c_int), parameter :: SDL_SCANCODE_STOP               = 120
      integer(kind=c_int), parameter :: SDL_SCANCODE_AGAIN              = 121
      integer(kind=c_int), parameter :: SDL_SCANCODE_UNDO               = 122
      integer(kind=c_int), parameter :: SDL_SCANCODE_CUT                = 123
      integer(kind=c_int), parameter :: SDL_SCANCODE_COPY               = 124
      integer(kind=c_int), parameter :: SDL_SCANCODE_PASTE              = 125
      integer(kind=c_int), parameter :: SDL_SCANCODE_FIND               = 126
      integer(kind=c_int), parameter :: SDL_SCANCODE_MUTE               = 127
      integer(kind=c_int), parameter :: SDL_SCANCODE_VOLUMEUP           = 128
      integer(kind=c_int), parameter :: SDL_SCANCODE_VOLUMEDOWN         = 129
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_COMMA           = 133
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_EQUALSAS400     = 134
      integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL1     = 135
      integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL2     = 136
      integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL3     = 137
      integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL4     = 138
      integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL5     = 139
      integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL6     = 140
      integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL7     = 141
      integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL8     = 142
      integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL9     = 143
      integer(kind=c_int), parameter :: SDL_SCANCODE_LANG1              = 144
      integer(kind=c_int), parameter :: SDL_SCANCODE_LANG2              = 145
      integer(kind=c_int), parameter :: SDL_SCANCODE_LANG3              = 146
      integer(kind=c_int), parameter :: SDL_SCANCODE_LANG4              = 147
      integer(kind=c_int), parameter :: SDL_SCANCODE_LANG5              = 148
      integer(kind=c_int), parameter :: SDL_SCANCODE_LANG6              = 149
      integer(kind=c_int), parameter :: SDL_SCANCODE_LANG7              = 150
      integer(kind=c_int), parameter :: SDL_SCANCODE_LANG8              = 151
      integer(kind=c_int), parameter :: SDL_SCANCODE_LANG9              = 152
      integer(kind=c_int), parameter :: SDL_SCANCODE_ALTERASE           = 153
      integer(kind=c_int), parameter :: SDL_SCANCODE_SYSREQ             = 154
      integer(kind=c_int), parameter :: SDL_SCANCODE_CANCEL             = 155
      integer(kind=c_int), parameter :: SDL_SCANCODE_CLEAR              = 156
      integer(kind=c_int), parameter :: SDL_SCANCODE_PRIOR              = 157
      integer(kind=c_int), parameter :: SDL_SCANCODE_RETURN2            = 158
      integer(kind=c_int), parameter :: SDL_SCANCODE_SEPARATOR          = 159
      integer(kind=c_int), parameter :: SDL_SCANCODE_OUT                = 160
      integer(kind=c_int), parameter :: SDL_SCANCODE_OPER               = 161
      integer(kind=c_int), parameter :: SDL_SCANCODE_CLEARAGAIN         = 162
      integer(kind=c_int), parameter :: SDL_SCANCODE_CRSEL              = 163
      integer(kind=c_int), parameter :: SDL_SCANCODE_EXSEL              = 164
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_00              = 176
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_000             = 177
      integer(kind=c_int), parameter :: SDL_SCANCODE_THOUSANDSSEPARATOR = 178
      integer(kind=c_int), parameter :: SDL_SCANCODE_DECIMALSEPARATOR   = 179
      integer(kind=c_int), parameter :: SDL_SCANCODE_CURRENCYUNIT       = 180
      integer(kind=c_int), parameter :: SDL_SCANCODE_CURRENCYSUBUNIT    = 181
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_LEFTPAREN       = 182
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_RIGHTPAREN      = 183
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_LEFTBRACE       = 184
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_RIGHTBRACE      = 185
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_TAB             = 186
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_BACKSPACE       = 187
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_A               = 188
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_B               = 189
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_C               = 190
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_D               = 191
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_E               = 192
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_F               = 193
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_XOR             = 194
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_POWER           = 195
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_PERCENT         = 196
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_LESS            = 197
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_GREATER         = 198
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_AMPERSAND       = 199
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_DBLAMPERSAND    = 200
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_VERTICALBAR     = 201
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_DBLVERTICALBAR  = 202
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_COLON           = 203
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_HASH            = 204
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_SPACE           = 205
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_AT              = 206
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_EXCLAM          = 207
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMSTORE        = 208
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMRECALL       = 209
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMCLEAR        = 210
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMADD          = 211
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMSUBTRACT     = 212
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMMULTIPLY     = 213
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMDIVIDE       = 214
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_PLUSMINUS       = 215
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_CLEAR           = 216
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_CLEARENTRY      = 217
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_BINARY          = 218
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_OCTAL           = 219
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_DECIMAL         = 220
      integer(kind=c_int), parameter :: SDL_SCANCODE_KP_HEXADECIMAL     = 221
      integer(kind=c_int), parameter :: SDL_SCANCODE_LCTRL              = 224
      integer(kind=c_int), parameter :: SDL_SCANCODE_LSHIFT             = 225
      integer(kind=c_int), parameter :: SDL_SCANCODE_LALT               = 226
      integer(kind=c_int), parameter :: SDL_SCANCODE_LGUI               = 227
      integer(kind=c_int), parameter :: SDL_SCANCODE_RCTRL              = 228
      integer(kind=c_int), parameter :: SDL_SCANCODE_RSHIFT             = 229
      integer(kind=c_int), parameter :: SDL_SCANCODE_RALT               = 230
      integer(kind=c_int), parameter :: SDL_SCANCODE_RGUI               = 231
      integer(kind=c_int), parameter :: SDL_SCANCODE_MODE               = 257
      integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIONEXT          = 258
      integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOPREV          = 259
      integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOSTOP          = 260
      integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOPLAY          = 261
      integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOMUTE          = 262
      integer(kind=c_int), parameter :: SDL_SCANCODE_MEDIASELECT        = 263
      integer(kind=c_int), parameter :: SDL_SCANCODE_WWW                = 264
      integer(kind=c_int), parameter :: SDL_SCANCODE_MAIL               = 265
      integer(kind=c_int), parameter :: SDL_SCANCODE_CALCULATOR         = 266
      integer(kind=c_int), parameter :: SDL_SCANCODE_COMPUTER           = 267
      integer(kind=c_int), parameter :: SDL_SCANCODE_AC_SEARCH          = 268
      integer(kind=c_int), parameter :: SDL_SCANCODE_AC_HOME            = 269
      integer(kind=c_int), parameter :: SDL_SCANCODE_AC_BACK            = 270
      integer(kind=c_int), parameter :: SDL_SCANCODE_AC_FORWARD         = 271
      integer(kind=c_int), parameter :: SDL_SCANCODE_AC_STOP            = 272
      integer(kind=c_int), parameter :: SDL_SCANCODE_AC_REFRESH         = 273
      integer(kind=c_int), parameter :: SDL_SCANCODE_AC_BOOKMARKS       = 274
      integer(kind=c_int), parameter :: SDL_SCANCODE_BRIGHTNESSDOWN     = 275
      integer(kind=c_int), parameter :: SDL_SCANCODE_BRIGHTNESSUP       = 276
      integer(kind=c_int), parameter :: SDL_SCANCODE_DISPLAYSWITCH      = 277
      integer(kind=c_int), parameter :: SDL_SCANCODE_KBDILLUMTOGGLE     = 278
      integer(kind=c_int), parameter :: SDL_SCANCODE_KBDILLUMDOWN       = 279
      integer(kind=c_int), parameter :: SDL_SCANCODE_KBDILLUMUP         = 280
      integer(kind=c_int), parameter :: SDL_SCANCODE_EJECT              = 281
      integer(kind=c_int), parameter :: SDL_SCANCODE_SLEEP              = 282
      integer(kind=c_int), parameter :: SDL_SCANCODE_APP1               = 283
      integer(kind=c_int), parameter :: SDL_SCANCODE_APP2               = 284
      integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOREWIND        = 285
      integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOFASTFORWARD   = 286
      integer(kind=c_int), parameter :: SDL_NUM_SCANCODES               = 512




      !!!!! keycode

      integer(kind=c_int), parameter :: SDLK_SCANCODE_MASK = ishft(1, 30)
      integer(kind=c_int), parameter :: SDLK_UNKNOWN       = 0
  
      integer(kind=c_int), parameter :: SDLK_RETURN     = 13
      integer(kind=c_int), parameter :: SDLK_ESCAPE     = 27
      integer(kind=c_int), parameter :: SDLK_BACKSPACE  = 8
      integer(kind=c_int), parameter :: SDLK_TAB        = 9
      integer(kind=c_int), parameter :: SDLK_SPACE      = ichar(' ')
      integer(kind=c_int), parameter :: SDLK_EXCLAIM    = ichar('!')
      integer(kind=c_int), parameter :: SDLK_QUOTEDBL   = ichar('"')
      integer(kind=c_int), parameter :: SDLK_HASH       = ichar('#')
      integer(kind=c_int), parameter :: SDLK_PERCENT    = ichar('%')
      integer(kind=c_int), parameter :: SDLK_DOLLAR     = ichar('$')
      integer(kind=c_int), parameter :: SDLK_AMPERSAND  = ichar('&')
      integer(kind=c_int), parameter :: SDLK_QUOTE      = ichar("'")
      integer(kind=c_int), parameter :: SDLK_LEFTPAREN  = ichar('(')
      integer(kind=c_int), parameter :: SDLK_RIGHTPAREN = ichar(')')
      integer(kind=c_int), parameter :: SDLK_ASTERISK   = ichar('*')
      integer(kind=c_int), parameter :: SDLK_PLUS       = ichar('+')
      integer(kind=c_int), parameter :: SDLK_COMMA      = ichar(',')
      integer(kind=c_int), parameter :: SDLK_MINUS      = ichar('-')
      integer(kind=c_int), parameter :: SDLK_PERIOD     = ichar('.')
      integer(kind=c_int), parameter :: SDLK_SLASH      = ichar('/')
      integer(kind=c_int), parameter :: SDLK_0          = ichar('0')
      integer(kind=c_int), parameter :: SDLK_1          = ichar('1')
      integer(kind=c_int), parameter :: SDLK_2          = ichar('2')
      integer(kind=c_int), parameter :: SDLK_3          = ichar('3')
      integer(kind=c_int), parameter :: SDLK_4          = ichar('4')
      integer(kind=c_int), parameter :: SDLK_5          = ichar('5')
      integer(kind=c_int), parameter :: SDLK_6          = ichar('6')
      integer(kind=c_int), parameter :: SDLK_7          = ichar('7')
      integer(kind=c_int), parameter :: SDLK_8          = ichar('8')
      integer(kind=c_int), parameter :: SDLK_9          = ichar('9')
      integer(kind=c_int), parameter :: SDLK_COLON      = ichar(':')
      integer(kind=c_int), parameter :: SDLK_SEMICOLON  = ichar(';')
      integer(kind=c_int), parameter :: SDLK_LESS       = ichar('<')
      integer(kind=c_int), parameter :: SDLK_EQUALS     = ichar('=')
      integer(kind=c_int), parameter :: SDLK_GREATER    = ichar('>')
      integer(kind=c_int), parameter :: SDLK_QUESTION   = ichar('?')
      integer(kind=c_int), parameter :: SDLK_AT         = ichar('@')
  
      integer(kind=c_int), parameter :: SDLK_LEFTBRACKET  = ichar('[')
      integer(kind=c_int), parameter :: SDLK_BACKSLASH    = ichar('\')
      integer(kind=c_int), parameter :: SDLK_RIGHTBRACKET = ichar(']')
      integer(kind=c_int), parameter :: SDLK_CARET        = ichar('^')
      integer(kind=c_int), parameter :: SDLK_UNDERSCORE   = ichar('_')
      integer(kind=c_int), parameter :: SDLK_BACKQUOTE    = ichar('`')
  
      integer(kind=c_int), parameter :: SDLK_a = ichar('a')
      integer(kind=c_int), parameter :: SDLK_b = ichar('b')
      integer(kind=c_int), parameter :: SDLK_c = ichar('c')
      integer(kind=c_int), parameter :: SDLK_d = ichar('d')
      integer(kind=c_int), parameter :: SDLK_e = ichar('e')
      integer(kind=c_int), parameter :: SDLK_f = ichar('f')
      integer(kind=c_int), parameter :: SDLK_g = ichar('g')
      integer(kind=c_int), parameter :: SDLK_h = ichar('h')
      integer(kind=c_int), parameter :: SDLK_i = ichar('i')
      integer(kind=c_int), parameter :: SDLK_j = ichar('j')
      integer(kind=c_int), parameter :: SDLK_k = ichar('k')
      integer(kind=c_int), parameter :: SDLK_l = ichar('l')
      integer(kind=c_int), parameter :: SDLK_m = ichar('m')
      integer(kind=c_int), parameter :: SDLK_n = ichar('n')
      integer(kind=c_int), parameter :: SDLK_o = ichar('o')
      integer(kind=c_int), parameter :: SDLK_p = ichar('p')
      integer(kind=c_int), parameter :: SDLK_q = ichar('q')
      integer(kind=c_int), parameter :: SDLK_r = ichar('r')
      integer(kind=c_int), parameter :: SDLK_s = ichar('s')
      integer(kind=c_int), parameter :: SDLK_t = ichar('t')
      integer(kind=c_int), parameter :: SDLK_u = ichar('u')
      integer(kind=c_int), parameter :: SDLK_v = ichar('v')
      integer(kind=c_int), parameter :: SDLK_w = ichar('w')
      integer(kind=c_int), parameter :: SDLK_x = ichar('x')
      integer(kind=c_int), parameter :: SDLK_y = ichar('y')
      integer(kind=c_int), parameter :: SDLK_z = ichar('z')
  
      integer(kind=c_int), parameter :: SDLK_CAPSLOCK = ior(SDL_SCANCODE_CAPSLOCK, SDLK_SCANCODE_MASK)
  
      integer(kind=c_int), parameter :: SDLK_F1  = ior(SDL_SCANCODE_F1, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F2  = ior(SDL_SCANCODE_F2, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F3  = ior(SDL_SCANCODE_F3, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F4  = ior(SDL_SCANCODE_F4, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F5  = ior(SDL_SCANCODE_F5, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F6  = ior(SDL_SCANCODE_F6, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F7  = ior(SDL_SCANCODE_F7, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F8  = ior(SDL_SCANCODE_F8, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F9  = ior(SDL_SCANCODE_F9, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F10 = ior(SDL_SCANCODE_F10, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F11 = ior(SDL_SCANCODE_F11, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F12 = ior(SDL_SCANCODE_F12, SDLK_SCANCODE_MASK)
  
      integer(kind=c_int), parameter :: SDLK_PRINTSCREEN = ior(SDL_SCANCODE_PRINTSCREEN, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_SCROLLLOCK  = ior(SDL_SCANCODE_SCROLLLOCK, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_PAUSE       = ior(SDL_SCANCODE_PAUSE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_INSERT      = ior(SDL_SCANCODE_INSERT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_HOME        = ior(SDL_SCANCODE_HOME, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_PAGEUP      = ior(SDL_SCANCODE_PAGEUP, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_DELETE      = 127
      integer(kind=c_int), parameter :: SDLK_END         = ior(SDL_SCANCODE_END, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_PAGEDOWN    = ior(SDL_SCANCODE_PAGEDOWN, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_RIGHT       = ior(SDL_SCANCODE_RIGHT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_LEFT        = ior(SDL_SCANCODE_LEFT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_DOWN        = ior(SDL_SCANCODE_DOWN, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_UP          = ior(SDL_SCANCODE_UP, SDLK_SCANCODE_MASK)
  
      integer(kind=c_int), parameter :: SDLK_NUMLOCKCLEAR = ior(SDL_SCANCODE_NUMLOCKCLEAR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_DIVIDE    = ior(SDL_SCANCODE_KP_DIVIDE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_MULTIPLY  = ior(SDL_SCANCODE_KP_MULTIPLY, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_MINUS     = ior(SDL_SCANCODE_KP_MINUS, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_PLUS      = ior(SDL_SCANCODE_KP_PLUS, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_ENTER     = ior(SDL_SCANCODE_KP_ENTER, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_1         = ior(SDL_SCANCODE_KP_1, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_2         = ior(SDL_SCANCODE_KP_2, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_3         = ior(SDL_SCANCODE_KP_3, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_4         = ior(SDL_SCANCODE_KP_4, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_5         = ior(SDL_SCANCODE_KP_5, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_6         = ior(SDL_SCANCODE_KP_6, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_7         = ior(SDL_SCANCODE_KP_7, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_8         = ior(SDL_SCANCODE_KP_8, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_9         = ior(SDL_SCANCODE_KP_9, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_0         = ior(SDL_SCANCODE_KP_0, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_PERIOD    = ior(SDL_SCANCODE_KP_PERIOD, SDLK_SCANCODE_MASK)
  
      integer(kind=c_int), parameter :: SDLK_APPLICATION    = ior(SDL_SCANCODE_APPLICATION, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_POWER          = ior(SDL_SCANCODE_POWER, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_EQUALS      = ior(SDL_SCANCODE_KP_EQUALS, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F13            = ior(SDL_SCANCODE_F13, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F14            = ior(SDL_SCANCODE_F14, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F15            = ior(SDL_SCANCODE_F15, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F16            = ior(SDL_SCANCODE_F16, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F17            = ior(SDL_SCANCODE_F17, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F18            = ior(SDL_SCANCODE_F18, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F19            = ior(SDL_SCANCODE_F19, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F20            = ior(SDL_SCANCODE_F20, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F21            = ior(SDL_SCANCODE_F21, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F22            = ior(SDL_SCANCODE_F22, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F23            = ior(SDL_SCANCODE_F23, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_F24            = ior(SDL_SCANCODE_F24, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_EXECUTE        = ior(SDL_SCANCODE_EXECUTE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_HELP           = ior(SDL_SCANCODE_HELP, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_MENU           = ior(SDL_SCANCODE_MENU, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_SELECT         = ior(SDL_SCANCODE_SELECT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_STOP           = ior(SDL_SCANCODE_STOP, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AGAIN          = ior(SDL_SCANCODE_AGAIN, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_UNDO           = ior(SDL_SCANCODE_UNDO, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_CUT            = ior(SDL_SCANCODE_CUT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_COPY           = ior(SDL_SCANCODE_COPY, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_PASTE          = ior(SDL_SCANCODE_PASTE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_FIND           = ior(SDL_SCANCODE_FIND, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_MUTE           = ior(SDL_SCANCODE_MUTE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_VOLUMEUP       = ior(SDL_SCANCODE_VOLUMEUP, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_VOLUMEDOWN     = ior(SDL_SCANCODE_VOLUMEDOWN, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_COMMA       = ior(SDL_SCANCODE_KP_COMMA, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_EQUALSAS400 = ior(SDL_SCANCODE_KP_EQUALSAS400, SDLK_SCANCODE_MASK)
  
      integer(kind=c_int), parameter :: SDLK_ALTERASE   = ior(SDL_SCANCODE_ALTERASE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_SYSREQ     = ior(SDL_SCANCODE_SYSREQ, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_CANCEL     = ior(SDL_SCANCODE_CANCEL, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_CLEAR      = ior(SDL_SCANCODE_CLEAR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_PRIOR      = ior(SDL_SCANCODE_PRIOR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_RETURN2    = ior(SDL_SCANCODE_RETURN2, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_SEPARATOR  = ior(SDL_SCANCODE_SEPARATOR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_OUT        = ior(SDL_SCANCODE_OUT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_OPER       = ior(SDL_SCANCODE_OPER, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_CLEARAGAIN = ior(SDL_SCANCODE_CLEARAGAIN, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_CRSEL      = ior(SDL_SCANCODE_CRSEL, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_EXSEL      = ior(SDL_SCANCODE_EXSEL, SDLK_SCANCODE_MASK)
  
      integer(kind=c_int), parameter :: SDLK_KP_00              = ior(SDL_SCANCODE_KP_00, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_000             = ior(SDL_SCANCODE_KP_000, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_THOUSANDSSEPARATOR = ior(SDL_SCANCODE_THOUSANDSSEPARATOR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_DECIMALSEPARATOR   = ior(SDL_SCANCODE_DECIMALSEPARATOR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_CURRENCYUNIT       = ior(SDL_SCANCODE_CURRENCYUNIT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_CURRENCYSUBUNIT    = ior(SDL_SCANCODE_CURRENCYSUBUNIT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_LEFTPAREN       = ior(SDL_SCANCODE_KP_LEFTPAREN, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_RIGHTPAREN      = ior(SDL_SCANCODE_KP_RIGHTPAREN, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_LEFTBRACE       = ior(SDL_SCANCODE_KP_LEFTBRACE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_RIGHTBRACE      = ior(SDL_SCANCODE_KP_RIGHTBRACE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_TAB             = ior(SDL_SCANCODE_KP_TAB, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_BACKSPACE       = ior(SDL_SCANCODE_KP_BACKSPACE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_A               = ior(SDL_SCANCODE_KP_A, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_B               = ior(SDL_SCANCODE_KP_B, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_C               = ior(SDL_SCANCODE_KP_C, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_D               = ior(SDL_SCANCODE_KP_D, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_E               = ior(SDL_SCANCODE_KP_E, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_F               = ior(SDL_SCANCODE_KP_F, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_XOR             = ior(SDL_SCANCODE_KP_XOR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_POWER           = ior(SDL_SCANCODE_KP_POWER, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_PERCENT         = ior(SDL_SCANCODE_KP_PERCENT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_LESS            = ior(SDL_SCANCODE_KP_LESS, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_GREATER         = ior(SDL_SCANCODE_KP_GREATER, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_AMPERSAND       = ior(SDL_SCANCODE_KP_AMPERSAND, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_DBLAMPERSAND    = ior(SDL_SCANCODE_KP_DBLAMPERSAND, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_VERTICALBAR     = ior(SDL_SCANCODE_KP_VERTICALBAR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_DBLVERTICALBAR  = ior(SDL_SCANCODE_KP_DBLVERTICALBAR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_COLON           = ior(SDL_SCANCODE_KP_COLON, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_HASH            = ior(SDL_SCANCODE_KP_HASH, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_SPACE           = ior(SDL_SCANCODE_KP_SPACE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_AT              = ior(SDL_SCANCODE_KP_AT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_EXCLAM          = ior(SDL_SCANCODE_KP_EXCLAM, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_MEMSTORE        = ior(SDL_SCANCODE_KP_MEMSTORE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_MEMRECALL       = ior(SDL_SCANCODE_KP_MEMRECALL, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_MEMCLEAR        = ior(SDL_SCANCODE_KP_MEMCLEAR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_MEMADD          = ior(SDL_SCANCODE_KP_MEMADD, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_MEMSUBTRACT     = ior(SDL_SCANCODE_KP_MEMSUBTRACT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_MEMMULTIPLY     = ior(SDL_SCANCODE_KP_MEMMULTIPLY, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_MEMDIVIDE       = ior(SDL_SCANCODE_KP_MEMDIVIDE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_PLUSMINUS       = ior(SDL_SCANCODE_KP_PLUSMINUS, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_CLEAR           = ior(SDL_SCANCODE_KP_CLEAR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_CLEARENTRY      = ior(SDL_SCANCODE_KP_CLEARENTRY, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_BINARY          = ior(SDL_SCANCODE_KP_BINARY, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_OCTAL           = ior(SDL_SCANCODE_KP_OCTAL, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_DECIMAL         = ior(SDL_SCANCODE_KP_DECIMAL, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KP_HEXADECIMAL     = ior(SDL_SCANCODE_KP_HEXADECIMAL, SDLK_SCANCODE_MASK)
  
      integer(kind=c_int), parameter :: SDLK_LCTRL  = ior(SDL_SCANCODE_LCTRL, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_LSHIFT = ior(SDL_SCANCODE_LSHIFT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_LALT   = ior(SDL_SCANCODE_LALT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_LGUI   = ior(SDL_SCANCODE_LGUI, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_RCTRL  = ior(SDL_SCANCODE_RCTRL, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_RSHIFT = ior(SDL_SCANCODE_RSHIFT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_RALT   = ior(SDL_SCANCODE_RALT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_RGUI   = ior(SDL_SCANCODE_RGUI, SDLK_SCANCODE_MASK)
  
      integer(kind=c_int), parameter :: SDLK_MODE = ior(SDL_SCANCODE_MODE, SDLK_SCANCODE_MASK)
  
      integer(kind=c_int), parameter :: SDLK_AUDIONEXT    = ior(SDL_SCANCODE_AUDIONEXT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AUDIOPREV    = ior(SDL_SCANCODE_AUDIOPREV, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AUDIOSTOP    = ior(SDL_SCANCODE_AUDIOSTOP, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AUDIOPLAY    = ior(SDL_SCANCODE_AUDIOPLAY, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AUDIOMUTE    = ior(SDL_SCANCODE_AUDIOMUTE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_MEDIASELECT  = ior(SDL_SCANCODE_MEDIASELECT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_WWW          = ior(SDL_SCANCODE_WWW, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_MAIL         = ior(SDL_SCANCODE_MAIL, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_CALCULATOR   = ior(SDL_SCANCODE_CALCULATOR, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_COMPUTER     = ior(SDL_SCANCODE_COMPUTER, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AC_SEARCH    = ior(SDL_SCANCODE_AC_SEARCH, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AC_HOME      = ior(SDL_SCANCODE_AC_HOME, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AC_BACK      = ior(SDL_SCANCODE_AC_BACK, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AC_FORWARD   = ior(SDL_SCANCODE_AC_FORWARD, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AC_STOP      = ior(SDL_SCANCODE_AC_STOP, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AC_REFRESH   = ior(SDL_SCANCODE_AC_REFRESH, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AC_BOOKMARKS = ior(SDL_SCANCODE_AC_BOOKMARKS, SDLK_SCANCODE_MASK)
  
      integer(kind=c_int), parameter :: SDLK_BRIGHTNESSDOWN = ior(SDL_SCANCODE_BRIGHTNESSDOWN, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_BRIGHTNESSUP   = ior(SDL_SCANCODE_BRIGHTNESSUP, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_DISPLAYSWITCH  = ior(SDL_SCANCODE_DISPLAYSWITCH, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KBDILLUMTOGGLE = ior(SDL_SCANCODE_KBDILLUMTOGGLE, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KBDILLUMDOWN   = ior(SDL_SCANCODE_KBDILLUMDOWN, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_KBDILLUMUP     = ior(SDL_SCANCODE_KBDILLUMUP, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_EJECT          = ior(SDL_SCANCODE_EJECT, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_SLEEP          = ior(SDL_SCANCODE_SLEEP, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_APP1           = ior(SDL_SCANCODE_APP1, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_APP2           = ior(SDL_SCANCODE_APP2, SDLK_SCANCODE_MASK)
  
      integer(kind=c_int), parameter :: SDLK_AUDIOREWIND      = ior(SDL_SCANCODE_AUDIOREWIND, SDLK_SCANCODE_MASK)
      integer(kind=c_int), parameter :: SDLK_AUDIOFASTFORWARD = ior(SDL_SCANCODE_AUDIOFASTFORWARD, SDLK_SCANCODE_MASK)



      !!!!!!!!!! mixer parameter 


      integer(kind=c_int), parameter :: AUDIO_U8     = int(z'0008')
      integer(kind=c_int), parameter :: AUDIO_S8     = int(z'8008')
      integer(kind=c_int), parameter :: AUDIO_U16LSB = int(z'0010')
      integer(kind=c_int), parameter :: AUDIO_S16LSB = int(z'8010')
      integer(kind=c_int), parameter :: AUDIO_U16MSB = int(z'1010')
      integer(kind=c_int), parameter :: AUDIO_S16MSB = int(z'9010')
      integer(kind=c_int), parameter :: AUDIO_U16    = AUDIO_U16LSB
      integer(kind=c_int), parameter :: AUDIO_S16    = AUDIO_S16LSB
  
      integer(kind=c_int), parameter :: AUDIO_S32LSB = int(z'8020')
      integer(kind=c_int), parameter :: AUDIO_S32MSB = int(z'9020')
      integer(kind=c_int), parameter :: AUDIO_S32    = AUDIO_S32LSB
  
      integer(kind=c_int), parameter :: AUDIO_F32LSB = int(z'8120')
      integer(kind=c_int), parameter :: AUDIO_F32MSB = int(z'9120')
      integer(kind=c_int), parameter :: AUDIO_F32    = AUDIO_F32LSB
  
      integer(kind=c_int), parameter :: SDL_AUDIO_ALLOW_FREQUENCY_CHANGE = int(z'00000001')
      integer(kind=c_int), parameter :: SDL_AUDIO_ALLOW_FORMAT_CHANGE    = int(z'00000002')
      integer(kind=c_int), parameter :: SDL_AUDIO_ALLOW_CHANNELS_CHANGE  = int(z'00000002')
      integer(kind=c_int), parameter :: SDL_AUDIO_ALLOW_ANY_CHANGE       = ior(SDL_AUDIO_ALLOW_FREQUENCY_CHANGE, &
                                                                               ior(SDL_AUDIO_ALLOW_FORMAT_CHANGE, &
                                                                                   SDL_AUDIO_ALLOW_CHANNELS_CHANGE))
  
      integer(kind=c_int), parameter :: MIX_CHANNELS          = 8
      integer(kind=c_int), parameter :: MIX_DEFAULT_FREQUENCY = 22050
      integer(kind=c_int), parameter :: MIX_DEFAULT_CHANNELS  = 2
      integer(kind=c_int), parameter :: MIX_MAX_VOLUME        = 128




      !!!! message box   
      integer(kind=c_int), parameter :: SDL_MESSAGEBOX_ERROR       = int(z'00000010')
      integer(kind=c_int), parameter :: SDL_MESSAGEBOX_WARNING     = int(z'00000020')
      integer(kind=c_int), parameter :: SDL_MESSAGEBOX_INFORMATION = int(z'00000040')

      integer(kind=c_int), parameter :: SDL_TRUE = 1
      integer(kind=c_int), parameter :: SDL_FALSE = 0



      !!!!!!!! SDL_opengl

      integer, parameter, public :: GLenum     = c_int
      integer, parameter, public :: GLboolean  = c_signed_char
      integer, parameter, public :: GLbitfield = c_int
      integer, parameter, public :: GLbyte     = c_signed_char
      integer, parameter, public :: GLshort    = c_short
      integer, parameter, public :: GLint      = c_int
      integer, parameter, public :: GLubyte    = c_signed_char
      integer, parameter, public :: GLushort   = c_short
      integer, parameter, public :: GLuint     = c_int
      integer, parameter, public :: GLsizei    = c_int
      integer, parameter, public :: GLfloat    = c_float
      integer, parameter, public :: GLclampf   = c_float
      integer, parameter, public :: GLdouble   = c_double
      integer, parameter, public :: GLclampd   = c_double
  
      ! Boolean values
      integer(kind=GLboolean), parameter :: GL_FALSE = 0
      integer(kind=GLboolean), parameter :: GL_TRUE  = 1
  
      ! Data types
      integer(kind=c_int), parameter :: GL_BYTE           = int(z'1400')
      integer(kind=c_int), parameter :: GL_UNSIGNED_BYTE  = int(z'1401')
      integer(kind=c_int), parameter :: GL_SHORT          = int(z'1402')
      integer(kind=c_int), parameter :: GL_UNSIGNED_SHORT = int(z'1403')
      integer(kind=c_int), parameter :: GL_INT            = int(z'1404')
      integer(kind=c_int), parameter :: GL_UNSIGNED_INT   = int(z'1405')
      integer(kind=c_int), parameter :: GL_FLOAT          = int(z'1406')
      integer(kind=c_int), parameter :: GL_2_BYTES        = int(z'1407')
      integer(kind=c_int), parameter :: GL_3_BYTES        = int(z'1408')
      integer(kind=c_int), parameter :: GL_4_BYTES        = int(z'1409')
      integer(kind=c_int), parameter :: GL_DOUBLE         = int(z'140A')
  
      ! Primitives
      integer(kind=c_int), parameter :: GL_POINTS         = int(z'0000')
      integer(kind=c_int), parameter :: GL_LINES          = int(z'0001')
      integer(kind=c_int), parameter :: GL_LINE_LOOP      = int(z'0002')
      integer(kind=c_int), parameter :: GL_LINE_STRIP     = int(z'0003')
      integer(kind=c_int), parameter :: GL_TRIANGLES      = int(z'0004')
      integer(kind=c_int), parameter :: GL_TRIANGLE_STRIP = int(z'0005')
      integer(kind=c_int), parameter :: GL_TRIANGLE_FAN   = int(z'0006')
      integer(kind=c_int), parameter :: GL_QUADS          = int(z'0007')
      integer(kind=c_int), parameter :: GL_QUAD_STRIP     = int(z'0008')
      integer(kind=c_int), parameter :: GL_POLYGON        = int(z'0009')
  
      ! Vertex Arrays
      integer(kind=c_int), parameter :: GL_VERTEX_ARRAY                = int(z'8074')
      integer(kind=c_int), parameter :: GL_NORMAL_ARRAY                = int(z'8075')
      integer(kind=c_int), parameter :: GL_COLOR_ARRAY                 = int(z'8076')
      integer(kind=c_int), parameter :: GL_INDEX_ARRAY                 = int(z'8077')
      integer(kind=c_int), parameter :: GL_TEXTURE_COORD_ARRAY         = int(z'8078')
      integer(kind=c_int), parameter :: GL_EDGE_FLAG_ARRAY             = int(z'8079')
      integer(kind=c_int), parameter :: GL_VERTEX_ARRAY_SIZE           = int(z'807A')
      integer(kind=c_int), parameter :: GL_VERTEX_ARRAY_TYPE           = int(z'807B')
      integer(kind=c_int), parameter :: GL_VERTEX_ARRAY_STRIDE         = int(z'807C')
      integer(kind=c_int), parameter :: GL_NORMAL_ARRAY_TYPE           = int(z'807E')
      integer(kind=c_int), parameter :: GL_NORMAL_ARRAY_STRIDE         = int(z'807F')
      integer(kind=c_int), parameter :: GL_COLOR_ARRAY_SIZE            = int(z'8081')
      integer(kind=c_int), parameter :: GL_COLOR_ARRAY_TYPE            = int(z'8082')
      integer(kind=c_int), parameter :: GL_COLOR_ARRAY_STRIDE          = int(z'8083')
      integer(kind=c_int), parameter :: GL_INDEX_ARRAY_TYPE            = int(z'8085')
      integer(kind=c_int), parameter :: GL_INDEX_ARRAY_STRIDE          = int(z'8086')
      integer(kind=c_int), parameter :: GL_TEXTURE_COORD_ARRAY_SIZE    = int(z'8088')
      integer(kind=c_int), parameter :: GL_TEXTURE_COORD_ARRAY_TYPE    = int(z'8089')
      integer(kind=c_int), parameter :: GL_TEXTURE_COORD_ARRAY_STRIDE  = int(z'808A')
      integer(kind=c_int), parameter :: GL_EDGE_FLAG_ARRAY_STRIDE      = int(z'808C')
      integer(kind=c_int), parameter :: GL_VERTEX_ARRAY_POINTER        = int(z'808E')
      integer(kind=c_int), parameter :: GL_NORMAL_ARRAY_POINTER        = int(z'808F')
      integer(kind=c_int), parameter :: GL_COLOR_ARRAY_POINTER         = int(z'8090')
      integer(kind=c_int), parameter :: GL_INDEX_ARRAY_POINTER         = int(z'8091')
      integer(kind=c_int), parameter :: GL_TEXTURE_COORD_ARRAY_POINTER = int(z'8092')
      integer(kind=c_int), parameter :: GL_EDGE_FLAG_ARRAY_POINTER     = int(z'8093')
      integer(kind=c_int), parameter :: GL_V2F                         = int(z'2A20')
      integer(kind=c_int), parameter :: GL_V3F                         = int(z'2A21')
      integer(kind=c_int), parameter :: GL_C4UB_V2F                    = int(z'2A22')
      integer(kind=c_int), parameter :: GL_C4UB_V3F                    = int(z'2A23')
      integer(kind=c_int), parameter :: GL_C3F_V3F                     = int(z'2A24')
      integer(kind=c_int), parameter :: GL_N3F_V3F                     = int(z'2A25')
      integer(kind=c_int), parameter :: GL_C4F_N3F_V3F                 = int(z'2A26')
      integer(kind=c_int), parameter :: GL_T2F_V3F                     = int(z'2A27')
      integer(kind=c_int), parameter :: GL_T4F_V4F                     = int(z'2A28')
      integer(kind=c_int), parameter :: GL_T2F_C4UB_V3F                = int(z'2A29')
      integer(kind=c_int), parameter :: GL_T2F_C3F_V3F                 = int(z'2A2A')
      integer(kind=c_int), parameter :: GL_T2F_N3F_V3F                 = int(z'2A2B')
      integer(kind=c_int), parameter :: GL_T2F_C4F_N3F_V3F             = int(z'2A2C')
      integer(kind=c_int), parameter :: GL_T4F_C4F_N3F_V4F             = int(z'2A2D')
  
      ! Matrix Mode
      integer(kind=c_int), parameter :: GL_MATRIX_MODE = int(z'0BA0')
      integer(kind=c_int), parameter :: GL_MODELVIEW   = int(z'1700')
      integer(kind=c_int), parameter :: GL_PROJECTION  = int(z'1701')
      integer(kind=c_int), parameter :: GL_TEXTURE     = int(z'1702')
  
      ! Points
      integer(kind=c_int), parameter :: GL_POINT_SMOOTH           = int(z'0B10')
      integer(kind=c_int), parameter :: GL_POINT_SIZE             = int(z'0B11')
      integer(kind=c_int), parameter :: GL_POINT_SIZE_GRANULARITY = int(z'0B13')
      integer(kind=c_int), parameter :: GL_POINT_SIZE_RANGE       = int(z'0B12')
  
      ! Lines
      integer(kind=c_int), parameter :: GL_LINE_SMOOTH            = int(z'0B20')
      integer(kind=c_int), parameter :: GL_LINE_STIPPLE           = int(z'0B24')
      integer(kind=c_int), parameter :: GL_LINE_STIPPLE_PATTERN   = int(z'0B25')
      integer(kind=c_int), parameter :: GL_LINE_STIPPLE_REPEAT    = int(z'0B26')
      integer(kind=c_int), parameter :: GL_LINE_WIDTH             = int(z'0B21')
      integer(kind=c_int), parameter :: GL_LINE_WIDTH_GRANULARITY = int(z'0B23')
      integer(kind=c_int), parameter :: GL_LINE_WIDTH_RANGE       = int(z'0B22')
  
      ! Polygons
      integer(kind=c_int), parameter :: GL_POINT                 = int(z'1B00')
      integer(kind=c_int), parameter :: GL_LINE                  = int(z'1B01')
      integer(kind=c_int), parameter :: GL_FILL                  = int(z'1B02')
      integer(kind=c_int), parameter :: GL_CW                    = int(z'0900')
      integer(kind=c_int), parameter :: GL_CCW                   = int(z'0901')
      integer(kind=c_int), parameter :: GL_FRONT                 = int(z'0404')
      integer(kind=c_int), parameter :: GL_BACK                  = int(z'0405')
      integer(kind=c_int), parameter :: GL_POLYGON_MODE          = int(z'0B40')
      integer(kind=c_int), parameter :: GL_POLYGON_SMOOTH        = int(z'0B41')
      integer(kind=c_int), parameter :: GL_POLYGON_STIPPLE       = int(z'0B42')
      integer(kind=c_int), parameter :: GL_EDGE_FLAG             = int(z'0B43')
      integer(kind=c_int), parameter :: GL_CULL_FACE             = int(z'0B44')
      integer(kind=c_int), parameter :: GL_CULL_FACE_MODE        = int(z'0B45')
      integer(kind=c_int), parameter :: GL_FRONT_FACE            = int(z'0B46')
      integer(kind=c_int), parameter :: GL_POLYGON_OFFSET_FACTOR = int(z'8038')
      integer(kind=c_int), parameter :: GL_POLYGON_OFFSET_UNITS  = int(z'2A00')
      integer(kind=c_int), parameter :: GL_POLYGON_OFFSET_POINT  = int(z'2A01')
      integer(kind=c_int), parameter :: GL_POLYGON_OFFSET_LINE   = int(z'2A02')
      integer(kind=c_int), parameter :: GL_POLYGON_OFFSET_FILL   = int(z'8037')
  
      ! Display Lists
      integer(kind=c_int), parameter :: GL_COMPILE             = int(z'1300')
      integer(kind=c_int), parameter :: GL_COMPILE_AND_EXECUTE = int(z'1301')
      integer(kind=c_int), parameter :: GL_LIST_BASE           = int(z'0B32')
      integer(kind=c_int), parameter :: GL_LIST_INDEX          = int(z'0B33')
      integer(kind=c_int), parameter :: GL_LIST_MODE           = int(z'0B30')
  
      ! Depth buffer
      integer(kind=c_int), parameter :: GL_NEVER             = int(z'0200')
      integer(kind=c_int), parameter :: GL_LESS              = int(z'0201')
      integer(kind=c_int), parameter :: GL_EQUAL             = int(z'0202')
      integer(kind=c_int), parameter :: GL_LEQUAL            = int(z'0203')
      integer(kind=c_int), parameter :: GL_GREATER           = int(z'0204')
      integer(kind=c_int), parameter :: GL_NOTEQUAL          = int(z'0205')
      integer(kind=c_int), parameter :: GL_GEQUAL            = int(z'0206')
      integer(kind=c_int), parameter :: GL_ALWAYS            = int(z'0207')
      integer(kind=c_int), parameter :: GL_DEPTH_TEST        = int(z'0B71')
      integer(kind=c_int), parameter :: GL_DEPTH_BITS        = int(z'0D56')
      integer(kind=c_int), parameter :: GL_DEPTH_CLEAR_VALUE = int(z'0B73')
      integer(kind=c_int), parameter :: GL_DEPTH_FUNC        = int(z'0B74')
      integer(kind=c_int), parameter :: GL_DEPTH_RANGE       = int(z'0B70')
      integer(kind=c_int), parameter :: GL_DEPTH_WRITEMASK   = int(z'0B72')
      integer(kind=c_int), parameter :: GL_DEPTH_COMPONENT   = int(z'1902')
  
      ! Lighting
      integer(kind=c_int), parameter :: GL_LIGHTING                 = int(z'0B50')
      integer(kind=c_int), parameter :: GL_LIGHT0                   = int(z'4000')
      integer(kind=c_int), parameter :: GL_LIGHT1                   = int(z'4001')
      integer(kind=c_int), parameter :: GL_LIGHT2                   = int(z'4002')
      integer(kind=c_int), parameter :: GL_LIGHT3                   = int(z'4003')
      integer(kind=c_int), parameter :: GL_LIGHT4                   = int(z'4004')
      integer(kind=c_int), parameter :: GL_LIGHT5                   = int(z'4005')
      integer(kind=c_int), parameter :: GL_LIGHT6                   = int(z'4006')
      integer(kind=c_int), parameter :: GL_LIGHT7                   = int(z'4007')
      integer(kind=c_int), parameter :: GL_SPOT_EXPONENT            = int(z'1205')
      integer(kind=c_int), parameter :: GL_SPOT_CUTOFF              = int(z'1206')
      integer(kind=c_int), parameter :: GL_CONSTANT_ATTENUATION     = int(z'1207')
      integer(kind=c_int), parameter :: GL_LINEAR_ATTENUATION       = int(z'1208')
      integer(kind=c_int), parameter :: GL_QUADRATIC_ATTENUATION    = int(z'1209')
      integer(kind=c_int), parameter :: GL_AMBIENT                  = int(z'1200')
      integer(kind=c_int), parameter :: GL_DIFFUSE                  = int(z'1201')
      integer(kind=c_int), parameter :: GL_SPECULAR                 = int(z'1202')
      integer(kind=c_int), parameter :: GL_SHININESS                = int(z'1601')
      integer(kind=c_int), parameter :: GL_EMISSION                 = int(z'1600')
      integer(kind=c_int), parameter :: GL_POSITION                 = int(z'1203')
      integer(kind=c_int), parameter :: GL_SPOT_DIRECTION           = int(z'1204')
      integer(kind=c_int), parameter :: GL_AMBIENT_AND_DIFFUSE      = int(z'1602')
      integer(kind=c_int), parameter :: GL_COLOR_INDEXES            = int(z'1603')
      integer(kind=c_int), parameter :: GL_LIGHT_MODEL_TWO_SIDE     = int(z'0B52')
      integer(kind=c_int), parameter :: GL_LIGHT_MODEL_LOCAL_VIEWER = int(z'0B51')
      integer(kind=c_int), parameter :: GL_LIGHT_MODEL_AMBIENT      = int(z'0B53')
      integer(kind=c_int), parameter :: GL_FRONT_AND_BACK           = int(z'0408')
      integer(kind=c_int), parameter :: GL_SHADE_MODEL              = int(z'0B54')
      integer(kind=c_int), parameter :: GL_FLAT                     = int(z'1D00')
      integer(kind=c_int), parameter :: GL_SMOOTH                   = int(z'1D01')
      integer(kind=c_int), parameter :: GL_COLOR_MATERIAL           = int(z'0B57')
      integer(kind=c_int), parameter :: GL_COLOR_MATERIAL_FACE      = int(z'0B55')
      integer(kind=c_int), parameter :: GL_COLOR_MATERIAL_PARAMETER = int(z'0B56')
      integer(kind=c_int), parameter :: GL_NORMALIZE                = int(z'0BA1')
  
      ! User clipping planes
      integer(kind=c_int), parameter :: GL_CLIP_PLANE0 = int(z'3000')
      integer(kind=c_int), parameter :: GL_CLIP_PLANE1 = int(z'3001')
      integer(kind=c_int), parameter :: GL_CLIP_PLANE2 = int(z'3002')
      integer(kind=c_int), parameter :: GL_CLIP_PLANE3 = int(z'3003')
      integer(kind=c_int), parameter :: GL_CLIP_PLANE4 = int(z'3004')
      integer(kind=c_int), parameter :: GL_CLIP_PLANE5 = int(z'3005')
  
      ! Accumulation buffer
      integer(kind=c_int), parameter :: GL_ACCUM_RED_BITS    = int(z'0D58')
      integer(kind=c_int), parameter :: GL_ACCUM_GREEN_BITS  = int(z'0D59')
      integer(kind=c_int), parameter :: GL_ACCUM_BLUE_BITS   = int(z'0D5A')
      integer(kind=c_int), parameter :: GL_ACCUM_ALPHA_BITS  = int(z'0D5B')
      integer(kind=c_int), parameter :: GL_ACCUM_CLEAR_VALUE = int(z'0B80')
      integer(kind=c_int), parameter :: GL_ACCUM             = int(z'0100')
      integer(kind=c_int), parameter :: GL_ADD               = int(z'0104')
      integer(kind=c_int), parameter :: GL_LOAD              = int(z'0101')
      integer(kind=c_int), parameter :: GL_MULT              = int(z'0103')
      integer(kind=c_int), parameter :: GL_RETURN            = int(z'0102')
  
      ! Alpha testing
      integer(kind=c_int), parameter :: GL_ALPHA_TEST      = int(z'0BC0')
      integer(kind=c_int), parameter :: GL_ALPHA_TEST_REF  = int(z'0BC2')
      integer(kind=c_int), parameter :: GL_ALPHA_TEST_FUNC = int(z'0BC1')
  
      ! Blending
      integer(kind=c_int), parameter :: GL_BLEND               = int(z'0BE2')
      integer(kind=c_int), parameter :: GL_BLEND_SRC           = int(z'0BE1')
      integer(kind=c_int), parameter :: GL_BLEND_DST           = int(z'0BE0')
      integer(kind=c_int), parameter :: GL_ZERO                = 0
      integer(kind=c_int), parameter :: GL_ONE                 = 1
      integer(kind=c_int), parameter :: GL_SRC_COLOR           = int(z'0300')
      integer(kind=c_int), parameter :: GL_ONE_MINUS_SRC_COLOR = int(z'0301')
      integer(kind=c_int), parameter :: GL_SRC_ALPHA           = int(z'0302')
      integer(kind=c_int), parameter :: GL_ONE_MINUS_SRC_ALPHA = int(z'0303')
      integer(kind=c_int), parameter :: GL_DST_ALPHA           = int(z'0304')
      integer(kind=c_int), parameter :: GL_ONE_MINUS_DST_ALPHA = int(z'0305')
      integer(kind=c_int), parameter :: GL_DST_COLOR           = int(z'0306')
      integer(kind=c_int), parameter :: GL_ONE_MINUS_DST_COLOR = int(z'0307')
      integer(kind=c_int), parameter :: GL_SRC_ALPHA_SATURATE  = int(z'0308')
  
      ! Render Mode
      integer(kind=c_int), parameter :: GL_FEEDBACK = int(z'1C01')
      integer(kind=c_int), parameter :: GL_RENDER   = int(z'1C00')
      integer(kind=c_int), parameter :: GL_SELECT   = int(z'1C02')
  
      ! Feedback
      integer(kind=c_int), parameter :: GL_2D                      = int(z'0600')
      integer(kind=c_int), parameter :: GL_3D                      = int(z'0601')
      integer(kind=c_int), parameter :: GL_3D_COLOR                = int(z'0602')
      integer(kind=c_int), parameter :: GL_3D_COLOR_TEXTURE        = int(z'0603')
      integer(kind=c_int), parameter :: GL_4D_COLOR_TEXTURE        = int(z'0604')
      integer(kind=c_int), parameter :: GL_POINT_TOKEN             = int(z'0701')
      integer(kind=c_int), parameter :: GL_LINE_TOKEN              = int(z'0702')
      integer(kind=c_int), parameter :: GL_LINE_RESET_TOKEN        = int(z'0707')
      integer(kind=c_int), parameter :: GL_POLYGON_TOKEN           = int(z'0703')
      integer(kind=c_int), parameter :: GL_BITMAP_TOKEN            = int(z'0704')
      integer(kind=c_int), parameter :: GL_DRAW_PIXEL_TOKEN        = int(z'0705')
      integer(kind=c_int), parameter :: GL_COPY_PIXEL_TOKEN        = int(z'0706')
      integer(kind=c_int), parameter :: GL_PASS_THROUGH_TOKEN      = int(z'0700')
      integer(kind=c_int), parameter :: GL_FEEDBACK_BUFFER_POINTER = int(z'0DF0')
      integer(kind=c_int), parameter :: GL_FEEDBACK_BUFFER_SIZE    = int(z'0DF1')
      integer(kind=c_int), parameter :: GL_FEEDBACK_BUFFER_TYPE    = int(z'0DF2')
  
      ! Selection
      integer(kind=c_int), parameter :: GL_SELECTION_BUFFER_POINTER = int(z'0DF3')
      integer(kind=c_int), parameter :: GL_SELECTION_BUFFER_SIZE    = int(z'0DF4')
  
      ! Fog
      integer(kind=c_int), parameter :: GL_FOG         = int(z'0B60')
      integer(kind=c_int), parameter :: GL_FOG_MODE    = int(z'0B65')
      integer(kind=c_int), parameter :: GL_FOG_DENSITY = int(z'0B62')
      integer(kind=c_int), parameter :: GL_FOG_COLOR   = int(z'0B66')
      integer(kind=c_int), parameter :: GL_FOG_INDEX   = int(z'0B61')
      integer(kind=c_int), parameter :: GL_FOG_START   = int(z'0B63')
      integer(kind=c_int), parameter :: GL_FOG_END     = int(z'0B64')
      integer(kind=c_int), parameter :: GL_LINEAR      = int(z'2601')
      integer(kind=c_int), parameter :: GL_EXP         = int(z'0800')
      integer(kind=c_int), parameter :: GL_EXP2        = int(z'0801')
  
      ! Logic Ops
      integer(kind=c_int), parameter :: GL_LOGIC_OP       = int(z'0BF1')
      integer(kind=c_int), parameter :: GL_INDEX_LOGIC_OP = int(z'0BF1')
      integer(kind=c_int), parameter :: GL_COLOR_LOGIC_OP = int(z'0BF2')
      integer(kind=c_int), parameter :: GL_LOGIC_OP_MODE  = int(z'0BF0')
      integer(kind=c_int), parameter :: GL_CLEAR          = int(z'1500')
      integer(kind=c_int), parameter :: GL_SET            = int(z'150F')
      integer(kind=c_int), parameter :: GL_COPY           = int(z'1503')
      integer(kind=c_int), parameter :: GL_COPY_INVERTED  = int(z'150C')
      integer(kind=c_int), parameter :: GL_NOOP           = int(z'1505')
      integer(kind=c_int), parameter :: GL_INVERT         = int(z'150A')
      integer(kind=c_int), parameter :: GL_AND            = int(z'1501')
      integer(kind=c_int), parameter :: GL_NAND           = int(z'150E')
      integer(kind=c_int), parameter :: GL_OR             = int(z'1507')
      integer(kind=c_int), parameter :: GL_NOR            = int(z'1508')
      integer(kind=c_int), parameter :: GL_XOR            = int(z'1506')
      integer(kind=c_int), parameter :: GL_EQUIV          = int(z'1509')
      integer(kind=c_int), parameter :: GL_AND_REVERSE    = int(z'1502')
      integer(kind=c_int), parameter :: GL_AND_INVERTED   = int(z'1504')
      integer(kind=c_int), parameter :: GL_OR_REVERSE     = int(z'150B')
      integer(kind=c_int), parameter :: GL_OR_INVERTED    = int(z'150D')
  
      ! Stencil
      integer(kind=c_int), parameter :: GL_STENCIL_BITS            = int(z'0D57')
      integer(kind=c_int), parameter :: GL_STENCIL_TEST            = int(z'0B90')
      integer(kind=c_int), parameter :: GL_STENCIL_CLEAR_VALUE     = int(z'0B91')
      integer(kind=c_int), parameter :: GL_STENCIL_FUNC            = int(z'0B92')
      integer(kind=c_int), parameter :: GL_STENCIL_VALUE_MASK      = int(z'0B93')
      integer(kind=c_int), parameter :: GL_STENCIL_FAIL            = int(z'0B94')
      integer(kind=c_int), parameter :: GL_STENCIL_PASS_DEPTH_FAIL = int(z'0B95')
      integer(kind=c_int), parameter :: GL_STENCIL_PASS_DEPTH_PASS = int(z'0B96')
      integer(kind=c_int), parameter :: GL_STENCIL_REF             = int(z'0B97')
      integer(kind=c_int), parameter :: GL_STENCIL_WRITEMASK       = int(z'0B98')
      integer(kind=c_int), parameter :: GL_STENCIL_INDEX           = int(z'1901')
      integer(kind=c_int), parameter :: GL_KEEP                    = int(z'1E00')
      integer(kind=c_int), parameter :: GL_REPLACE                 = int(z'1E01')
      integer(kind=c_int), parameter :: GL_INCR                    = int(z'1E02')
      integer(kind=c_int), parameter :: GL_DECR                    = int(z'1E03')
  
      ! Buffers, Pixel Drawing/Reading
      integer(kind=c_int), parameter :: GL_NONE            = 0
      integer(kind=c_int), parameter :: GL_LEFT            = int(z'0406')
      integer(kind=c_int), parameter :: GL_RIGHT           = int(z'0407')
      integer(kind=c_int), parameter :: GL_FRONT_LEFT      = int(z'0400')
      integer(kind=c_int), parameter :: GL_FRONT_RIGHT     = int(z'0401')
      integer(kind=c_int), parameter :: GL_BACK_LEFT       = int(z'0402')
      integer(kind=c_int), parameter :: GL_BACK_RIGHT      = int(z'0403')
      integer(kind=c_int), parameter :: GL_AUX0            = int(z'0409')
      integer(kind=c_int), parameter :: GL_AUX1            = int(z'040A')
      integer(kind=c_int), parameter :: GL_AUX2            = int(z'040B')
      integer(kind=c_int), parameter :: GL_AUX3            = int(z'040C')
      integer(kind=c_int), parameter :: GL_COLOR_INDEX     = int(z'1900')
      integer(kind=c_int), parameter :: GL_RED             = int(z'1903')
      integer(kind=c_int), parameter :: GL_GREEN           = int(z'1904')
      integer(kind=c_int), parameter :: GL_BLUE            = int(z'1905')
      integer(kind=c_int), parameter :: GL_ALPHA           = int(z'1906')
      integer(kind=c_int), parameter :: GL_LUMINANCE       = int(z'1909')
      integer(kind=c_int), parameter :: GL_LUMINANCE_ALPHA = int(z'190A')
      integer(kind=c_int), parameter :: GL_ALPHA_BITS      = int(z'0D55')
      integer(kind=c_int), parameter :: GL_RED_BITS        = int(z'0D52')
      integer(kind=c_int), parameter :: GL_GREEN_BITS      = int(z'0D53')
      integer(kind=c_int), parameter :: GL_BLUE_BITS       = int(z'0D54')
      integer(kind=c_int), parameter :: GL_INDEX_BITS      = int(z'0D51')
      integer(kind=c_int), parameter :: GL_SUBPIXEL_BITS   = int(z'0D50')
      integer(kind=c_int), parameter :: GL_AUX_BUFFERS     = int(z'0C00')
      integer(kind=c_int), parameter :: GL_READ_BUFFER     = int(z'0C02')
      integer(kind=c_int), parameter :: GL_DRAW_BUFFER     = int(z'0C01')
      integer(kind=c_int), parameter :: GL_DOUBLEBUFFER    = int(z'0C32')
      integer(kind=c_int), parameter :: GL_STEREO          = int(z'0C33')
      integer(kind=c_int), parameter :: GL_BITMAP          = int(z'1A00')
      integer(kind=c_int), parameter :: GL_COLOR           = int(z'1800')
      integer(kind=c_int), parameter :: GL_DEPTH           = int(z'1801')
      integer(kind=c_int), parameter :: GL_STENCIL         = int(z'1802')
      integer(kind=c_int), parameter :: GL_DITHER          = int(z'0BD0')
      integer(kind=c_int), parameter :: GL_RGB             = int(z'1907')
      integer(kind=c_int), parameter :: GL_RGBA            = int(z'1908')
  
      ! Implementation limits
      integer(kind=c_int), parameter :: GL_MAX_LIST_NESTING              = int(z'0B31')
      integer(kind=c_int), parameter :: GL_MAX_EVAL_ORDER                = int(z'0D30')
      integer(kind=c_int), parameter :: GL_MAX_LIGHTS                    = int(z'0D31')
      integer(kind=c_int), parameter :: GL_MAX_CLIP_PLANES               = int(z'0D32')
      integer(kind=c_int), parameter :: GL_MAX_TEXTURE_SIZE              = int(z'0D33')
      integer(kind=c_int), parameter :: GL_MAX_PIXEL_MAP_TABLE           = int(z'0D34')
      integer(kind=c_int), parameter :: GL_MAX_ATTRIB_STACK_DEPTH        = int(z'0D35')
      integer(kind=c_int), parameter :: GL_MAX_MODELVIEW_STACK_DEPTH     = int(z'0D36')
      integer(kind=c_int), parameter :: GL_MAX_NAME_STACK_DEPTH          = int(z'0D37')
      integer(kind=c_int), parameter :: GL_MAX_PROJECTION_STACK_DEPTH    = int(z'0D38')
      integer(kind=c_int), parameter :: GL_MAX_TEXTURE_STACK_DEPTH       = int(z'0D39')
      integer(kind=c_int), parameter :: GL_MAX_VIEWPORT_DIMS             = int(z'0D3A')
      integer(kind=c_int), parameter :: GL_MAX_CLIENT_ATTRIB_STACK_DEPTH = int(z'0D3B')
  
      ! Gets
      integer(kind=c_int), parameter :: GL_ATTRIB_STACK_DEPTH            = int(z'0BB0')
      integer(kind=c_int), parameter :: GL_CLIENT_ATTRIB_STACK_DEPTH     = int(z'0BB1')
      integer(kind=c_int), parameter :: GL_COLOR_CLEAR_VALUE             = int(z'0C22')
      integer(kind=c_int), parameter :: GL_COLOR_WRITEMASK               = int(z'0C23')
      integer(kind=c_int), parameter :: GL_CURRENT_INDEX                 = int(z'0B01')
      integer(kind=c_int), parameter :: GL_CURRENT_COLOR                 = int(z'0B00')
      integer(kind=c_int), parameter :: GL_CURRENT_NORMAL                = int(z'0B02')
      integer(kind=c_int), parameter :: GL_CURRENT_RASTER_COLOR          = int(z'0B04')
      integer(kind=c_int), parameter :: GL_CURRENT_RASTER_DISTANCE       = int(z'0B09')
      integer(kind=c_int), parameter :: GL_CURRENT_RASTER_INDEX          = int(z'0B05')
      integer(kind=c_int), parameter :: GL_CURRENT_RASTER_POSITION       = int(z'0B07')
      integer(kind=c_int), parameter :: GL_CURRENT_RASTER_TEXTURE_COORDS = int(z'0B06')
      integer(kind=c_int), parameter :: GL_CURRENT_RASTER_POSITION_VALID = int(z'0B08')
      integer(kind=c_int), parameter :: GL_CURRENT_TEXTURE_COORDS        = int(z'0B03')
      integer(kind=c_int), parameter :: GL_INDEX_CLEAR_VALUE             = int(z'0C20')
      integer(kind=c_int), parameter :: GL_INDEX_MODE                    = int(z'0C30')
      integer(kind=c_int), parameter :: GL_INDEX_WRITEMASK               = int(z'0C21')
      integer(kind=c_int), parameter :: GL_MODELVIEW_MATRIX              = int(z'0BA6')
      integer(kind=c_int), parameter :: GL_MODELVIEW_STACK_DEPTH         = int(z'0BA3')
      integer(kind=c_int), parameter :: GL_NAME_STACK_DEPTH              = int(z'0D70')
      integer(kind=c_int), parameter :: GL_PROJECTION_MATRIX             = int(z'0BA7')
      integer(kind=c_int), parameter :: GL_PROJECTION_STACK_DEPTH        = int(z'0BA4')
      integer(kind=c_int), parameter :: GL_RENDER_MODE                   = int(z'0C40')
      integer(kind=c_int), parameter :: GL_RGBA_MODE                     = int(z'0C31')
      integer(kind=c_int), parameter :: GL_TEXTURE_MATRIX                = int(z'0BA8')
      integer(kind=c_int), parameter :: GL_TEXTURE_STACK_DEPTH           = int(z'0BA5')
      integer(kind=c_int), parameter :: GL_VIEWPORT                      = int(z'0BA2')
  
      ! Evaluators
      integer(kind=c_int), parameter :: GL_AUTO_NORMAL          = int(z'0D80')
      integer(kind=c_int), parameter :: GL_MAP1_COLOR_4         = int(z'0D90')
      integer(kind=c_int), parameter :: GL_MAP1_INDEX           = int(z'0D91')
      integer(kind=c_int), parameter :: GL_MAP1_NORMAL          = int(z'0D92')
      integer(kind=c_int), parameter :: GL_MAP1_TEXTURE_COORD_1 = int(z'0D93')
      integer(kind=c_int), parameter :: GL_MAP1_TEXTURE_COORD_2 = int(z'0D94')
      integer(kind=c_int), parameter :: GL_MAP1_TEXTURE_COORD_3 = int(z'0D95')
      integer(kind=c_int), parameter :: GL_MAP1_TEXTURE_COORD_4 = int(z'0D96')
      integer(kind=c_int), parameter :: GL_MAP1_VERTEX_3        = int(z'0D97')
      integer(kind=c_int), parameter :: GL_MAP1_VERTEX_4        = int(z'0D98')
      integer(kind=c_int), parameter :: GL_MAP2_COLOR_4         = int(z'0DB0')
      integer(kind=c_int), parameter :: GL_MAP2_INDEX           = int(z'0DB1')
      integer(kind=c_int), parameter :: GL_MAP2_NORMAL          = int(z'0DB2')
      integer(kind=c_int), parameter :: GL_MAP2_TEXTURE_COORD_1 = int(z'0DB3')
      integer(kind=c_int), parameter :: GL_MAP2_TEXTURE_COORD_2 = int(z'0DB4')
      integer(kind=c_int), parameter :: GL_MAP2_TEXTURE_COORD_3 = int(z'0DB5')
      integer(kind=c_int), parameter :: GL_MAP2_TEXTURE_COORD_4 = int(z'0DB6')
      integer(kind=c_int), parameter :: GL_MAP2_VERTEX_3        = int(z'0DB7')
      integer(kind=c_int), parameter :: GL_MAP2_VERTEX_4        = int(z'0DB8')
      integer(kind=c_int), parameter :: GL_MAP1_GRID_DOMAIN     = int(z'0DD0')
      integer(kind=c_int), parameter :: GL_MAP1_GRID_SEGMENTS   = int(z'0DD1')
      integer(kind=c_int), parameter :: GL_MAP2_GRID_DOMAIN     = int(z'0DD2')
      integer(kind=c_int), parameter :: GL_MAP2_GRID_SEGMENTS   = int(z'0DD3')
      integer(kind=c_int), parameter :: GL_COEFF                = int(z'0A00')
      integer(kind=c_int), parameter :: GL_ORDER                = int(z'0A01')
      integer(kind=c_int), parameter :: GL_DOMAIN               = int(z'0A02')
  
      ! Hints
      integer(kind=c_int), parameter :: GL_PERSPECTIVE_CORRECTION_HINT = int(z'0C50')
      integer(kind=c_int), parameter :: GL_POINT_SMOOTH_HINT           = int(z'0C51')
      integer(kind=c_int), parameter :: GL_LINE_SMOOTH_HINT            = int(z'0C52')
      integer(kind=c_int), parameter :: GL_POLYGON_SMOOTH_HINT         = int(z'0C53')
      integer(kind=c_int), parameter :: GL_FOG_HINT                    = int(z'0C54')
      integer(kind=c_int), parameter :: GL_DONT_CARE                   = int(z'1100')
      integer(kind=c_int), parameter :: GL_FASTEST                     = int(z'1101')
      integer(kind=c_int), parameter :: GL_NICEST                      = int(z'1102')
  
      ! Scissor box
      integer(kind=c_int), parameter :: GL_SCISSOR_BOX  = int(z'0C10')
      integer(kind=c_int), parameter :: GL_SCISSOR_TEST = int(z'0C11')
  
      ! Pixel Mode / Transfer
      integer(kind=c_int), parameter :: GL_MAP_COLOR             = int(z'0D10')
      integer(kind=c_int), parameter :: GL_MAP_STENCIL           = int(z'0D11')
      integer(kind=c_int), parameter :: GL_INDEX_SHIFT           = int(z'0D12')
      integer(kind=c_int), parameter :: GL_INDEX_OFFSET          = int(z'0D13')
      integer(kind=c_int), parameter :: GL_RED_SCALE             = int(z'0D14')
      integer(kind=c_int), parameter :: GL_RED_BIAS              = int(z'0D15')
      integer(kind=c_int), parameter :: GL_GREEN_SCALE           = int(z'0D18')
      integer(kind=c_int), parameter :: GL_GREEN_BIAS            = int(z'0D19')
      integer(kind=c_int), parameter :: GL_BLUE_SCALE            = int(z'0D1A')
      integer(kind=c_int), parameter :: GL_BLUE_BIAS             = int(z'0D1B')
      integer(kind=c_int), parameter :: GL_ALPHA_SCALE           = int(z'0D1C')
      integer(kind=c_int), parameter :: GL_ALPHA_BIAS            = int(z'0D1D')
      integer(kind=c_int), parameter :: GL_DEPTH_SCALE           = int(z'0D1E')
      integer(kind=c_int), parameter :: GL_DEPTH_BIAS            = int(z'0D1F')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_S_TO_S_SIZE = int(z'0CB1')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_I_TO_I_SIZE = int(z'0CB0')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_I_TO_R_SIZE = int(z'0CB2')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_I_TO_G_SIZE = int(z'0CB3')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_I_TO_B_SIZE = int(z'0CB4')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_I_TO_A_SIZE = int(z'0CB5')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_R_TO_R_SIZE = int(z'0CB6')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_G_TO_G_SIZE = int(z'0CB7')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_B_TO_B_SIZE = int(z'0CB8')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_A_TO_A_SIZE = int(z'0CB9')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_S_TO_S      = int(z'0C71')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_I_TO_I      = int(z'0C70')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_I_TO_R      = int(z'0C72')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_I_TO_G      = int(z'0C73')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_I_TO_B      = int(z'0C74')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_I_TO_A      = int(z'0C75')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_R_TO_R      = int(z'0C76')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_G_TO_G      = int(z'0C77')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_B_TO_B      = int(z'0C78')
      integer(kind=c_int), parameter :: GL_PIXEL_MAP_A_TO_A      = int(z'0C79')
      integer(kind=c_int), parameter :: GL_PACK_ALIGNMENT        = int(z'0D05')
      integer(kind=c_int), parameter :: GL_PACK_LSB_FIRST        = int(z'0D01')
      integer(kind=c_int), parameter :: GL_PACK_ROW_LENGTH       = int(z'0D02')
      integer(kind=c_int), parameter :: GL_PACK_SKIP_PIXELS      = int(z'0D04')
      integer(kind=c_int), parameter :: GL_PACK_SKIP_ROWS        = int(z'0D03')
      integer(kind=c_int), parameter :: GL_PACK_SWAP_BYTES       = int(z'0D00')
      integer(kind=c_int), parameter :: GL_UNPACK_ALIGNMENT      = int(z'0CF5')
      integer(kind=c_int), parameter :: GL_UNPACK_LSB_FIRST      = int(z'0CF1')
      integer(kind=c_int), parameter :: GL_UNPACK_ROW_LENGTH     = int(z'0CF2')
      integer(kind=c_int), parameter :: GL_UNPACK_SKIP_PIXELS    = int(z'0CF4')
      integer(kind=c_int), parameter :: GL_UNPACK_SKIP_ROWS      = int(z'0CF3')
      integer(kind=c_int), parameter :: GL_UNPACK_SWAP_BYTES     = int(z'0CF0')
      integer(kind=c_int), parameter :: GL_ZOOM_X                = int(z'0D16')
      integer(kind=c_int), parameter :: GL_ZOOM_Y                = int(z'0D17')
  
      ! Texture mapping
      integer(kind=c_int), parameter :: GL_TEXTURE_ENV            = int(z'2300')
      integer(kind=c_int), parameter :: GL_TEXTURE_ENV_MODE       = int(z'2200')
      integer(kind=c_int), parameter :: GL_TEXTURE_1D             = int(z'0DE0')
      integer(kind=c_int), parameter :: GL_TEXTURE_2D             = int(z'0DE1')
      integer(kind=c_int), parameter :: GL_TEXTURE_WRAP_S         = int(z'2802')
      integer(kind=c_int), parameter :: GL_TEXTURE_WRAP_T         = int(z'2803')
      integer(kind=c_int), parameter :: GL_TEXTURE_MAG_FILTER     = int(z'2800')
      integer(kind=c_int), parameter :: GL_TEXTURE_MIN_FILTER     = int(z'2801')
      integer(kind=c_int), parameter :: GL_TEXTURE_ENV_COLOR      = int(z'2201')
      integer(kind=c_int), parameter :: GL_TEXTURE_GEN_S          = int(z'0C60')
      integer(kind=c_int), parameter :: GL_TEXTURE_GEN_T          = int(z'0C61')
      integer(kind=c_int), parameter :: GL_TEXTURE_GEN_R          = int(z'0C62')
      integer(kind=c_int), parameter :: GL_TEXTURE_GEN_Q          = int(z'0C63')
      integer(kind=c_int), parameter :: GL_TEXTURE_GEN_MODE       = int(z'2500')
      integer(kind=c_int), parameter :: GL_TEXTURE_BORDER_COLOR   = int(z'1004')
      integer(kind=c_int), parameter :: GL_TEXTURE_WIDTH          = int(z'1000')
      integer(kind=c_int), parameter :: GL_TEXTURE_HEIGHT         = int(z'1001')
      integer(kind=c_int), parameter :: GL_TEXTURE_BORDER         = int(z'1005')
      integer(kind=c_int), parameter :: GL_TEXTURE_COMPONENTS     = int(z'1003')
      integer(kind=c_int), parameter :: GL_TEXTURE_RED_SIZE       = int(z'805C')
      integer(kind=c_int), parameter :: GL_TEXTURE_GREEN_SIZE     = int(z'805D')
      integer(kind=c_int), parameter :: GL_TEXTURE_BLUE_SIZE      = int(z'805E')
      integer(kind=c_int), parameter :: GL_TEXTURE_ALPHA_SIZE     = int(z'805F')
      integer(kind=c_int), parameter :: GL_TEXTURE_LUMINANCE_SIZE = int(z'8060')
      integer(kind=c_int), parameter :: GL_TEXTURE_INTENSITY_SIZE = int(z'8061')
      integer(kind=c_int), parameter :: GL_NEAREST_MIPMAP_NEAREST = int(z'2700')
      integer(kind=c_int), parameter :: GL_NEAREST_MIPMAP_LINEAR  = int(z'2702')
      integer(kind=c_int), parameter :: GL_LINEAR_MIPMAP_NEAREST  = int(z'2701')
      integer(kind=c_int), parameter :: GL_LINEAR_MIPMAP_LINEAR   = int(z'2703')
      integer(kind=c_int), parameter :: GL_OBJECT_LINEAR          = int(z'2401')
      integer(kind=c_int), parameter :: GL_OBJECT_PLANE           = int(z'2501')
      integer(kind=c_int), parameter :: GL_EYE_LINEAR             = int(z'2400')
      integer(kind=c_int), parameter :: GL_EYE_PLANE              = int(z'2502')
      integer(kind=c_int), parameter :: GL_SPHERE_MAP             = int(z'2402')
      integer(kind=c_int), parameter :: GL_DECAL                  = int(z'2101')
      integer(kind=c_int), parameter :: GL_MODULATE               = int(z'2100')
      integer(kind=c_int), parameter :: GL_NEAREST                = int(z'2600')
      integer(kind=c_int), parameter :: GL_REPEAT                 = int(z'2901')
      integer(kind=c_int), parameter :: GL_CLAMP                  = int(z'2900')
      integer(kind=c_int), parameter :: GL_S                      = int(z'2000')
      integer(kind=c_int), parameter :: GL_T                      = int(z'2001')
      integer(kind=c_int), parameter :: GL_R                      = int(z'2002')
      integer(kind=c_int), parameter :: GL_Q                      = int(z'2003')
  
      ! Utility
      integer(kind=c_int), parameter :: GL_VENDOR     = int(z'1F00')
      integer(kind=c_int), parameter :: GL_RENDERER   = int(z'1F01')
      integer(kind=c_int), parameter :: GL_VERSION    = int(z'1F02')
      integer(kind=c_int), parameter :: GL_EXTENSIONS = int(z'1F03')
  
      ! Errors
      integer(kind=c_int), parameter :: GL_NO_ERROR          = 0
      integer(kind=c_int), parameter :: GL_INVALID_ENUM      = int(z'0500')
      integer(kind=c_int), parameter :: GL_INVALID_VALUE     = int(z'0501')
      integer(kind=c_int), parameter :: GL_INVALID_OPERATION = int(z'0502')
      integer(kind=c_int), parameter :: GL_STACK_OVERFLOW    = int(z'0503')
      integer(kind=c_int), parameter :: GL_STACK_UNDERFLOW   = int(z'0504')
      integer(kind=c_int), parameter :: GL_OUT_OF_MEMORY     = int(z'0505')
  
      ! glPush/PopAttrib bits
      integer(kind=c_int), parameter :: GL_CURRENT_BIT         = int(z'00000001')
      integer(kind=c_int), parameter :: GL_POINT_BIT           = int(z'00000002')
      integer(kind=c_int), parameter :: GL_LINE_BIT            = int(z'00000004')
      integer(kind=c_int), parameter :: GL_POLYGON_BIT         = int(z'00000008')
      integer(kind=c_int), parameter :: GL_POLYGON_STIPPLE_BIT = int(z'00000010')
      integer(kind=c_int), parameter :: GL_PIXEL_MODE_BIT      = int(z'00000020')
      integer(kind=c_int), parameter :: GL_LIGHTING_BIT        = int(z'00000040')
      integer(kind=c_int), parameter :: GL_FOG_BIT             = int(z'00000080')
      integer(kind=c_int), parameter :: GL_DEPTH_BUFFER_BIT    = int(z'00000100')
      integer(kind=c_int), parameter :: GL_ACCUM_BUFFER_BIT    = int(z'00000200')
      integer(kind=c_int), parameter :: GL_STENCIL_BUFFER_BIT  = int(z'00000400')
      integer(kind=c_int), parameter :: GL_VIEWPORT_BIT        = int(z'00000800')
      integer(kind=c_int), parameter :: GL_TRANSFORM_BIT       = int(z'00001000')
      integer(kind=c_int), parameter :: GL_ENABLE_BIT          = int(z'00002000')
      integer(kind=c_int), parameter :: GL_COLOR_BUFFER_BIT    = int(z'00004000')
      integer(kind=c_int), parameter :: GL_HINT_BIT            = int(z'00008000')
      integer(kind=c_int), parameter :: GL_EVAL_BIT            = int(z'00010000')
      integer(kind=c_int), parameter :: GL_LIST_BIT            = int(z'00020000')
      integer(kind=c_int), parameter :: GL_TEXTURE_BIT         = int(z'00040000')
      integer(kind=c_int), parameter :: GL_SCISSOR_BIT         = int(z'00080000')
      integer(kind=c_int), parameter :: GL_ALL_ATTRIB_BITS     = int(z'000FFFFF')
  
      ! OpenGL 1.1
      integer(kind=c_int), parameter :: GL_PROXY_TEXTURE_1D        = int(z'8063')
      integer(kind=c_int), parameter :: GL_PROXY_TEXTURE_2D        = int(z'8064')
      integer(kind=c_int), parameter :: GL_TEXTURE_PRIORITY        = int(z'8066')
      integer(kind=c_int), parameter :: GL_TEXTURE_RESIDENT        = int(z'8067')
      integer(kind=c_int), parameter :: GL_TEXTURE_BINDING_1D      = int(z'8068')
      integer(kind=c_int), parameter :: GL_TEXTURE_BINDING_2D      = int(z'8069')
      integer(kind=c_int), parameter :: GL_TEXTURE_INTERNAL_FORMAT = int(z'1003')
      integer(kind=c_int), parameter :: GL_ALPHA4                  = int(z'803B')
      integer(kind=c_int), parameter :: GL_ALPHA8                  = int(z'803C')
      integer(kind=c_int), parameter :: GL_ALPHA12                 = int(z'803D')
      integer(kind=c_int), parameter :: GL_ALPHA16                 = int(z'803E')
      integer(kind=c_int), parameter :: GL_LUMINANCE4              = int(z'803F')
      integer(kind=c_int), parameter :: GL_LUMINANCE8              = int(z'8040')
      integer(kind=c_int), parameter :: GL_LUMINANCE12             = int(z'8041')
      integer(kind=c_int), parameter :: GL_LUMINANCE16             = int(z'8042')
      integer(kind=c_int), parameter :: GL_LUMINANCE4_ALPHA4       = int(z'8043')
      integer(kind=c_int), parameter :: GL_LUMINANCE6_ALPHA2       = int(z'8044')
      integer(kind=c_int), parameter :: GL_LUMINANCE8_ALPHA8       = int(z'8045')
      integer(kind=c_int), parameter :: GL_LUMINANCE12_ALPHA4      = int(z'8046')
      integer(kind=c_int), parameter :: GL_LUMINANCE12_ALPHA12     = int(z'8047')
      integer(kind=c_int), parameter :: GL_LUMINANCE16_ALPHA16     = int(z'8048')
      integer(kind=c_int), parameter :: GL_INTENSITY               = int(z'8049')
      integer(kind=c_int), parameter :: GL_INTENSITY4              = int(z'804A')
      integer(kind=c_int), parameter :: GL_INTENSITY8              = int(z'804B')
      integer(kind=c_int), parameter :: GL_INTENSITY12             = int(z'804C')
      integer(kind=c_int), parameter :: GL_INTENSITY16             = int(z'804D')
      integer(kind=c_int), parameter :: GL_R3_G3_B2                = int(z'2A10')
      integer(kind=c_int), parameter :: GL_RGB4                    = int(z'804F')
      integer(kind=c_int), parameter :: GL_RGB5                    = int(z'8050')
      integer(kind=c_int), parameter :: GL_RGB8                    = int(z'8051')
      integer(kind=c_int), parameter :: GL_RGB10                   = int(z'8052')
      integer(kind=c_int), parameter :: GL_RGB12                   = int(z'8053')
      integer(kind=c_int), parameter :: GL_RGB16                   = int(z'8054')
      integer(kind=c_int), parameter :: GL_RGBA2                   = int(z'8055')
      integer(kind=c_int), parameter :: GL_RGBA4                   = int(z'8056')
      integer(kind=c_int), parameter :: GL_RGB5_A1                 = int(z'8057')
      integer(kind=c_int), parameter :: GL_RGBA8                   = int(z'8058')
      integer(kind=c_int), parameter :: GL_RGB10_A2                = int(z'8059')
      integer(kind=c_int), parameter :: GL_RGBA12                  = int(z'805A')
      integer(kind=c_int), parameter :: GL_RGBA16                  = int(z'805B')
  
      integer(kind=c_long), parameter :: GL_CLIENT_PIXEL_STORE_BIT  = int(z'00000001', kind=c_long)
      integer(kind=c_long), parameter :: GL_CLIENT_VERTEX_ARRAY_BIT = int(z'00000002', kind=c_long)
      integer(kind=c_long), parameter :: GL_ALL_CLIENT_ATTRIB_BITS  = int(z'FFFFFFFF', kind=c_long)
      integer(kind=c_long), parameter :: GL_CLIENT_ALL_ATTRIB_BITS  = int(z'FFFFFFFF', kind=c_long)
  
      ! OpenGL 1.3
      ! multitexture
      integer(kind=c_int), parameter :: GL_TEXTURE0              = int(z'84C0')
      integer(kind=c_int), parameter :: GL_TEXTURE1              = int(z'84C1')
      integer(kind=c_int), parameter :: GL_TEXTURE2              = int(z'84C2')
      integer(kind=c_int), parameter :: GL_TEXTURE3              = int(z'84C3')
      integer(kind=c_int), parameter :: GL_TEXTURE4              = int(z'84C4')
      integer(kind=c_int), parameter :: GL_TEXTURE5              = int(z'84C5')
      integer(kind=c_int), parameter :: GL_TEXTURE6              = int(z'84C6')
      integer(kind=c_int), parameter :: GL_TEXTURE7              = int(z'84C7')
      integer(kind=c_int), parameter :: GL_TEXTURE8              = int(z'84C8')
      integer(kind=c_int), parameter :: GL_TEXTURE9              = int(z'84C9')
      integer(kind=c_int), parameter :: GL_TEXTURE10             = int(z'84CA')
      integer(kind=c_int), parameter :: GL_TEXTURE11             = int(z'84CB')
      integer(kind=c_int), parameter :: GL_TEXTURE12             = int(z'84CC')
      integer(kind=c_int), parameter :: GL_TEXTURE13             = int(z'84CD')
      integer(kind=c_int), parameter :: GL_TEXTURE14             = int(z'84CE')
      integer(kind=c_int), parameter :: GL_TEXTURE15             = int(z'84CF')
      integer(kind=c_int), parameter :: GL_TEXTURE16             = int(z'84D0')
      integer(kind=c_int), parameter :: GL_TEXTURE17             = int(z'84D1')
      integer(kind=c_int), parameter :: GL_TEXTURE18             = int(z'84D2')
      integer(kind=c_int), parameter :: GL_TEXTURE19             = int(z'84D3')
      integer(kind=c_int), parameter :: GL_TEXTURE20             = int(z'84D4')
      integer(kind=c_int), parameter :: GL_TEXTURE21             = int(z'84D5')
      integer(kind=c_int), parameter :: GL_TEXTURE22             = int(z'84D6')
      integer(kind=c_int), parameter :: GL_TEXTURE23             = int(z'84D7')
      integer(kind=c_int), parameter :: GL_TEXTURE24             = int(z'84D8')
      integer(kind=c_int), parameter :: GL_TEXTURE25             = int(z'84D9')
      integer(kind=c_int), parameter :: GL_TEXTURE26             = int(z'84DA')
      integer(kind=c_int), parameter :: GL_TEXTURE27             = int(z'84DB')
      integer(kind=c_int), parameter :: GL_TEXTURE28             = int(z'84DC')
      integer(kind=c_int), parameter :: GL_TEXTURE29             = int(z'84DD')
      integer(kind=c_int), parameter :: GL_TEXTURE30             = int(z'84DE')
      integer(kind=c_int), parameter :: GL_TEXTURE31             = int(z'84DF')
      integer(kind=c_int), parameter :: GL_ACTIVE_TEXTURE        = int(z'84E0')
      integer(kind=c_int), parameter :: GL_CLIENT_ACTIVE_TEXTURE = int(z'84E1')
      integer(kind=c_int), parameter :: GL_MAX_TEXTURE_UNITS     = int(z'84E2')
  
      ! texture_cube_map
      integer(kind=c_int), parameter :: GL_NORMAL_MAP                  = int(z'8511')
      integer(kind=c_int), parameter :: GL_REFLECTION_MAP              = int(z'8512')
      integer(kind=c_int), parameter :: GL_TEXTURE_CUBE_MAP            = int(z'8513')
      integer(kind=c_int), parameter :: GL_TEXTURE_BINDING_CUBE_MAP    = int(z'8514')
      integer(kind=c_int), parameter :: GL_TEXTURE_CUBE_MAP_POSITIVE_X = int(z'8515')
      integer(kind=c_int), parameter :: GL_TEXTURE_CUBE_MAP_NEGATIVE_X = int(z'8516')
      integer(kind=c_int), parameter :: GL_TEXTURE_CUBE_MAP_POSITIVE_Y = int(z'8517')
      integer(kind=c_int), parameter :: GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = int(z'8518')
      integer(kind=c_int), parameter :: GL_TEXTURE_CUBE_MAP_POSITIVE_Z = int(z'8519')
      integer(kind=c_int), parameter :: GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = int(z'851A')
      integer(kind=c_int), parameter :: GL_PROXY_TEXTURE_CUBE_MAP      = int(z'851B')
      integer(kind=c_int), parameter :: GL_MAX_CUBE_MAP_TEXTURE_SIZE   = int(z'851C')
  
      ! texture_compression
      integer(kind=c_int), parameter :: GL_COMPRESSED_ALPHA               = int(z'84E9')
      integer(kind=c_int), parameter :: GL_COMPRESSED_LUMINANCE           = int(z'84EA')
      integer(kind=c_int), parameter :: GL_COMPRESSED_LUMINANCE_ALPHA     = int(z'84EB')
      integer(kind=c_int), parameter :: GL_COMPRESSED_INTENSITY           = int(z'84EC')
      integer(kind=c_int), parameter :: GL_COMPRESSED_RGB                 = int(z'84ED')
      integer(kind=c_int), parameter :: GL_COMPRESSED_RGBA                = int(z'84EE')
      integer(kind=c_int), parameter :: GL_TEXTURE_COMPRESSION_HINT       = int(z'84EF')
      integer(kind=c_int), parameter :: GL_TEXTURE_COMPRESSED_IMAGE_SIZE  = int(z'86A0')
      integer(kind=c_int), parameter :: GL_TEXTURE_COMPRESSED             = int(z'86A1')
      integer(kind=c_int), parameter :: GL_NUM_COMPRESSED_TEXTURE_FORMATS = int(z'86A2')
      integer(kind=c_int), parameter :: GL_COMPRESSED_TEXTURE_FORMATS     = int(z'86A3')
  
      ! multisample
      integer(kind=c_int), parameter :: GL_MULTISAMPLE              = int(z'809D')
      integer(kind=c_int), parameter :: GL_SAMPLE_ALPHA_TO_COVERAGE = int(z'809E')
      integer(kind=c_int), parameter :: GL_SAMPLE_ALPHA_TO_ONE      = int(z'809F')
      integer(kind=c_int), parameter :: GL_SAMPLE_COVERAGE          = int(z'80A0')
      integer(kind=c_int), parameter :: GL_SAMPLE_BUFFERS           = int(z'80A8')
      integer(kind=c_int), parameter :: GL_SAMPLES                  = int(z'80A9')
      integer(kind=c_int), parameter :: GL_SAMPLE_COVERAGE_VALUE    = int(z'80AA')
      integer(kind=c_int), parameter :: GL_SAMPLE_COVERAGE_INVERT   = int(z'80AB')
      integer(kind=c_int), parameter :: GL_MULTISAMPLE_BIT          = int(z'20000000')
  
      ! transpose_matrix
      integer(kind=c_int), parameter :: GL_TRANSPOSE_MODELVIEW_MATRIX  = int(z'84E3')
      integer(kind=c_int), parameter :: GL_TRANSPOSE_PROJECTION_MATRIX = int(z'84E4')
      integer(kind=c_int), parameter :: GL_TRANSPOSE_TEXTURE_MATRIX    = int(z'84E5')
      integer(kind=c_int), parameter :: GL_TRANSPOSE_COLOR_MATRIX      = int(z'84E6')
  
      ! texture_env_combine
      integer(kind=c_int), parameter :: GL_COMBINE        = int(z'8570')
      integer(kind=c_int), parameter :: GL_COMBINE_RGB    = int(z'8571')
      integer(kind=c_int), parameter :: GL_COMBINE_ALPHA  = int(z'8572')
      integer(kind=c_int), parameter :: GL_SOURCE0_RGB    = int(z'8580')
      integer(kind=c_int), parameter :: GL_SOURCE1_RGB    = int(z'8581')
      integer(kind=c_int), parameter :: GL_SOURCE2_RGB    = int(z'8582')
      integer(kind=c_int), parameter :: GL_SOURCE0_ALPHA  = int(z'8588')
      integer(kind=c_int), parameter :: GL_SOURCE1_ALPHA  = int(z'8589')
      integer(kind=c_int), parameter :: GL_SOURCE2_ALPHA  = int(z'858A')
      integer(kind=c_int), parameter :: GL_OPERAND0_RGB   = int(z'8590')
      integer(kind=c_int), parameter :: GL_OPERAND1_RGB   = int(z'8591')
      integer(kind=c_int), parameter :: GL_OPERAND2_RGB   = int(z'8592')
      integer(kind=c_int), parameter :: GL_OPERAND0_ALPHA = int(z'8598')
      integer(kind=c_int), parameter :: GL_OPERAND1_ALPHA = int(z'8599')
      integer(kind=c_int), parameter :: GL_OPERAND2_ALPHA = int(z'859A')
      integer(kind=c_int), parameter :: GL_RGB_SCALE      = int(z'8573')
      integer(kind=c_int), parameter :: GL_ADD_SIGNED     = int(z'8574')
      integer(kind=c_int), parameter :: GL_INTERPOLATE    = int(z'8575')
      integer(kind=c_int), parameter :: GL_SUBTRACT       = int(z'84E7')
      integer(kind=c_int), parameter :: GL_CONSTANT       = int(z'8576')
      integer(kind=c_int), parameter :: GL_PRIMARY_COLOR  = int(z'8577')
      integer(kind=c_int), parameter :: GL_PREVIOUS       = int(z'8578')
  
      ! texture_env_dot3
      integer(kind=c_int), parameter :: GL_DOT3_RGB  = int(z'86AE')
      integer(kind=c_int), parameter :: GL_DOT3_RGBA = int(z'86AF')
  
      ! texture_border_clamp
      integer(kind=c_int), parameter :: GL_CLAMP_TO_BORDER = int(z'812D')

      integer(kind=c_int), parameter :: GLU_FALSE = 0
      integer(kind=c_int), parameter :: GLU_TRUE  = 1

  
      ! SDL_TextureAccess
      enum, bind(c)
          enumerator :: SDL_TEXTUREACCESS_STATIC
          enumerator :: SDL_TEXTUREACCESS_STREAMING
          enumerator :: SDL_TEXTUREACCESS_TARGET
      end enum
  
      ! SDL_WindowEventID
      enum, bind(c)
          enumerator :: SDL_WINDOWEVENT_NONE
          enumerator :: SDL_WINDOWEVENT_SHOWN
          enumerator :: SDL_WINDOWEVENT_HIDDEN
          enumerator :: SDL_WINDOWEVENT_EXPOSED
          enumerator :: SDL_WINDOWEVENT_MOVED
          enumerator :: SDL_WINDOWEVENT_RESIZED
          enumerator :: SDL_WINDOWEVENT_SIZE_CHANGED
          enumerator :: SDL_WINDOWEVENT_MINIMIZED
          enumerator :: SDL_WINDOWEVENT_MAXIMIZED
          enumerator :: SDL_WINDOWEVENT_RESTORED
          enumerator :: SDL_WINDOWEVENT_ENTER
          enumerator :: SDL_WINDOWEVENT_LEAVE
          enumerator :: SDL_WINDOWEVENT_FOCUS_GAINED
          enumerator :: SDL_WINDOWEVENT_FOCUS_LOST
          enumerator :: SDL_WINDOWEVENT_CLOSE
          enumerator :: SDL_WINDOWEVENT_TAKE_FOCUS
          enumerator :: SDL_WINDOWEVENT_HIT_TEST
      end enum
  
      ! SDL_GLattr
      enum, bind(c)
          enumerator :: SDL_GL_RED_SIZE
          enumerator :: SDL_GL_GREEN_SIZE
          enumerator :: SDL_GL_BLUE_SIZE
          enumerator :: SDL_GL_ALPHA_SIZE
          enumerator :: SDL_GL_BUFFER_SIZE
          enumerator :: SDL_GL_DOUBLEBUFFER
          enumerator :: SDL_GL_DEPTH_SIZE
          enumerator :: SDL_GL_STENCIL_SIZE
          enumerator :: SDL_GL_ACCUM_RED_SIZE
          enumerator :: SDL_GL_ACCUM_GREEN_SIZE
          enumerator :: SDL_GL_ACCUM_BLUE_SIZE
          enumerator :: SDL_GL_ACCUM_ALPHA_SIZE
          enumerator :: SDL_GL_STEREO
          enumerator :: SDL_GL_MULTISAMPLEBUFFERS
          enumerator :: SDL_GL_MULTISAMPLESAMPLES
          enumerator :: SDL_GL_ACCELERATED_VISUAL
          enumerator :: SDL_GL_RETAINED_BACKING
          enumerator :: SDL_GL_CONTEXT_MAJOR_VERSION
          enumerator :: SDL_GL_CONTEXT_MINOR_VERSION
          enumerator :: SDL_GL_CONTEXT_EGL
          enumerator :: SDL_GL_CONTEXT_FLAGS
          enumerator :: SDL_GL_CONTEXT_PROFILE_MASK
          enumerator :: SDL_GL_SHARE_WITH_CURRENT_CONTEXT
          enumerator :: SDL_GL_FRAMEBUFFER_SRGB_CAPABLE
          enumerator :: SDL_GL_CONTEXT_RELEASE_BEHAVIOR
          enumerator :: SDL_GL_CONTEXT_RESET_NOTIFICATION
          enumerator :: SDL_GL_CONTEXT_NO_ERROR
      end enum




      enum, bind(c)
          enumerator :: SDL_SYSTEM_CURSOR_ARROW     ! Arrow.
          enumerator :: SDL_SYSTEM_CURSOR_IBEAM     ! I-beam.
          enumerator :: SDL_SYSTEM_CURSOR_WAIT      ! Wait.
          enumerator :: SDL_SYSTEM_CURSOR_CROSSHAIR ! Crosshair.
          enumerator :: SDL_SYSTEM_CURSOR_WAITARROW ! Small wait cursor (or Wait if not available).
          enumerator :: SDL_SYSTEM_CURSOR_SIZENWSE  ! Double arrow pointing northwest and southeast.
          enumerator :: SDL_SYSTEM_CURSOR_SIZENESW  ! Double arrow pointing northeast and southwest.
          enumerator :: SDL_SYSTEM_CURSOR_SIZEWE    ! Double arrow pointing west and east.
          enumerator :: SDL_SYSTEM_CURSOR_SIZENS    ! Double arrow pointing north and south.
          enumerator :: SDL_SYSTEM_CURSOR_SIZEALL   ! Four pointed arrow pointing north, south, east, and west.
          enumerator :: SDL_SYSTEM_CURSOR_NO        ! Slashed circle or crossbones.
          enumerator :: SDL_SYSTEM_CURSOR_HAND      ! Hand.
          enumerator :: SDL_NUM_SYSTEM_CURSORS
      end enum

      TYPE, BIND(c) :: sdl_rect
            INTEGER(kind=c_int) :: x
            INTEGER(kind=c_int) :: y
            INTEGER(kind=c_int) :: w
            INTEGER(kind=c_int) :: h
      END TYPE sdl_rect

      TYPE, BIND(c) :: sdl_fpoint
            real(kind=c_float) :: x
            real(kind=c_float) :: y
      END TYPE sdl_fpoint

      TYPE, BIND(c) :: sdl_point
            INTEGER(kind=c_int) :: x
            INTEGER(kind=c_int) :: y
      END TYPE sdl_point

  
      TYPE, BIND(c) :: sdl_common_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
      END type sdl_common_event
  
      TYPE, BIND(c) :: sdl_window_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_uint32_t) :: window_id
          INTEGER(kind=c_uint8_t)  :: event
          INTEGER(kind=c_uint8_t)  :: padding1
          INTEGER(kind=c_uint8_t)  :: padding2
          INTEGER(kind=c_uint8_t)  :: padding3
          INTEGER(kind=c_int32_t)  :: data1
          INTEGER(kind=c_int32_t)  :: data2
      END type sdl_window_event
  
      TYPE, BIND(c) :: sdl_key_sym
          INTEGER(kind=c_int)      :: scan_code
          INTEGER(kind=c_int32_t)  :: sym
          INTEGER(kind=c_uint16_t) :: mod
          INTEGER(kind=c_uint32_t) :: unused
      END type sdl_key_sym
  
      TYPE, BIND(c) :: sdl_keyboard_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_uint32_t) :: window_id
          INTEGER(kind=c_uint8_t)  :: state
          INTEGER(kind=c_uint8_t)  :: repeat
          INTEGER(kind=c_uint8_t)  :: padding2
          INTEGER(kind=c_uint8_t)  :: padding3
          type(sdl_key_sym)        :: key_sym
      END type sdl_keyboard_event
  
      TYPE, BIND(c) :: sdl_text_editing_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_uint32_t) :: window_id
          CHARACTER(kind=c_char)   :: text(32)
          INTEGER(kind=c_int32_t)  :: start
          INTEGER(kind=c_int32_t)  :: length
      END type sdl_text_editing_event
  
      TYPE, BIND(c) :: sdl_text_input_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_uint32_t) :: window_id
          CHARACTER(kind=c_char)   :: text(32)
      END type sdl_text_input_event
  
      TYPE, BIND(c) :: sdl_mouse_motion_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_uint32_t) :: window_id
          INTEGER(kind=c_uint32_t) :: which
          INTEGER(kind=c_uint32_t) :: state
          INTEGER(kind=c_int32_t)  :: x
          INTEGER(kind=c_int32_t)  :: y
          INTEGER(kind=c_int32_t)  :: x_rel
          INTEGER(kind=c_int32_t)  :: y_rel
      END type sdl_mouse_motion_event
  
      TYPE, BIND(c) :: sdl_mouse_button_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_uint32_t) :: window_id
          INTEGER(kind=c_uint32_t) :: which
          INTEGER(kind=c_uint8_t)  :: button
          INTEGER(kind=c_uint8_t)  :: state
          INTEGER(kind=c_uint8_t)  :: clicks
          INTEGER(kind=c_uint8_t)  :: padding1
          INTEGER(kind=c_int32_t)  :: x
          INTEGER(kind=c_int32_t)  :: y
      END type sdl_mouse_button_event
  
      TYPE, BIND(c) :: sdl_mouse_wheel_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_uint32_t) :: window_id
          INTEGER(kind=c_uint32_t) :: which
          INTEGER(kind=c_int32_t)  :: x
          INTEGER(kind=c_int32_t)  :: y
          INTEGER(kind=c_uint32_t) :: direction
      END type sdl_mouse_wheel_event
  
      TYPE, BIND(c) :: sdl_joy_axis_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int32_t)  :: which
          INTEGER(kind=c_uint8_t)  :: axis
          INTEGER(kind=c_uint8_t)  :: padding1
          INTEGER(kind=c_uint8_t)  :: padding2
          INTEGER(kind=c_uint8_t)  :: padding3
          INTEGER(kind=c_int16_t)  :: value
          INTEGER(kind=c_uint16_t) :: padding4
      END type sdl_joy_axis_event
  
      TYPE, BIND(c) :: sdl_joy_ball_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int32_t)  :: which
          INTEGER(kind=c_uint8_t)  :: ball
          INTEGER(kind=c_uint8_t)  :: padding1
          INTEGER(kind=c_uint8_t)  :: padding2
          INTEGER(kind=c_uint8_t)  :: padding3
          INTEGER(kind=c_int16_t)  :: x_rel
          INTEGER(kind=c_int16_t)  :: y_rel
      END type sdl_joy_ball_event
  
      TYPE, BIND(c) :: sdl_joy_hat_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int32_t)  :: which
          INTEGER(kind=c_uint8_t)  :: hat
          INTEGER(kind=c_uint8_t)  :: value
          INTEGER(kind=c_uint8_t)  :: padding1
          INTEGER(kind=c_uint8_t)  :: padding2
      END type sdl_joy_hat_event
  
      TYPE, BIND(c) :: sdl_joy_button_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int32_t)  :: which
          INTEGER(kind=c_uint8_t)  :: button
          INTEGER(kind=c_uint8_t)  :: state
          INTEGER(kind=c_uint8_t)  :: padding1
          INTEGER(kind=c_uint8_t)  :: padding2
      END type sdl_joy_button_event
  
      TYPE, BIND(c) :: sdl_joy_device_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int32_t)  :: which
      END type sdl_joy_device_event
  
      TYPE, BIND(c) :: sdl_controller_axis_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int32_t)  :: which
          INTEGER(kind=c_uint8_t)  :: axis
          INTEGER(kind=c_uint8_t)  :: padding1
          INTEGER(kind=c_uint8_t)  :: padding2
          INTEGER(kind=c_uint8_t)  :: padding3
          INTEGER(kind=c_int16_t)  :: value
          INTEGER(kind=c_uint16_t) :: padding4
      END type sdl_controller_axis_event
  
      TYPE, BIND(c) :: sdl_controller_button_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int32_t)  :: which
          INTEGER(kind=c_uint8_t)  :: button
          INTEGER(kind=c_uint8_t)  :: state
          INTEGER(kind=c_uint8_t)  :: padding1
          INTEGER(kind=c_uint8_t)  :: padding2
      END type sdl_controller_button_event
  
      TYPE, BIND(c) :: sdl_controller_device_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int32_t)  :: which
      END type sdl_controller_device_event
  
      TYPE, BIND(c) :: sdl_audio_device_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int32_t)  :: which
          INTEGER(kind=c_uint8_t)  :: is_capture
          INTEGER(kind=c_uint8_t)  :: padding1
          INTEGER(kind=c_uint8_t)  :: padding2
          INTEGER(kind=c_uint8_t)  :: padding3
      END type sdl_audio_device_event
  
      TYPE, BIND(c) :: sdl_touch_finger_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int64_t)  :: touch_id
          INTEGER(kind=c_int64_t)  :: finger_id
          real(kind=c_float)       :: x
          real(kind=c_float)       :: y
          real(kind=c_float)       :: dx
          real(kind=c_float)       :: dy
          real(kind=c_float)       :: pressure
      END type sdl_touch_finger_event
  
      TYPE, BIND(c) :: sdl_multi_gesture_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int64_t)  :: touch_id
          real(kind=c_float)       :: d_theta
          real(kind=c_float)       :: d_dist
          real(kind=c_float)       :: x
          real(kind=c_float)       :: y
          INTEGER(kind=c_uint16_t) :: num_fingers
          INTEGER(kind=c_uint16_t) :: padding
      END type sdl_multi_gesture_event
  
      TYPE, BIND(c) :: sdl_dollar_gesture_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_int64_t)  :: touch_id
          INTEGER(kind=c_int64_t)  :: gesture_id
          INTEGER(kind=c_uint32_t) :: num_fingers
          real(kind=c_float)       :: error
          real(kind=c_float)       :: x
          real(kind=c_float)       :: y
      END type sdl_dollar_gesture_event
  
      TYPE, BIND(c) :: sdl_drop_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          type(c_ptr)              :: file
          INTEGER(kind=c_uint32_t) :: window_id
      END type sdl_drop_event
  
      TYPE, BIND(c) :: sdl_quit_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
      END type sdl_quit_event
  
      TYPE, BIND(c) :: sdl_os_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
      END type sdl_os_event
  
      TYPE, BIND(c) :: sdl_user_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          INTEGER(kind=c_uint32_t) :: window_id
          INTEGER(kind=c_int32_t)  :: code
          TYPE(c_ptr)              :: data1
          TYPE(c_ptr)              :: data2
      END TYPE sdl_user_event
  
      TYPE, BIND(c) :: sdl_sys_wm_event
          INTEGER(kind=c_uint32_t) :: type
          INTEGER(kind=c_uint32_t) :: timestamp
          TYPE(c_ptr)              :: msg
      END TYPE sdl_sys_wm_event
  
      TYPE, BIND(c) :: sdl_event
          INTEGER(kind=c_uint32_t)          :: type
          TYPE(sdl_common_event)            :: common
          TYPE(sdl_window_event)            :: window
          TYPE(sdl_keyboard_event)          :: key
          TYPE(sdl_text_editing_event)      :: edit
          TYPE(sdl_text_input_event)        :: text
          TYPE(sdl_mouse_motion_event)      :: motion
          TYPE(sdl_mouse_button_event)      :: button
          TYPE(sdl_mouse_wheel_event)       :: wheel
          TYPE(sdl_joy_axis_event)          :: j_axis
          TYPE(sdl_joy_ball_event)          :: j_ball
          TYPE(sdl_joy_hat_event)           :: j_hat
          TYPE(sdl_joy_button_event)        :: j_button
          TYPE(sdl_joy_device_event)        :: j_device
          TYPE(sdl_controller_axis_event)   :: c_axis
          TYPE(sdl_controller_button_event) :: c_button
          TYPE(sdl_controller_device_event) :: c_device
          TYPE(sdl_audio_device_event)      :: a_device
          TYPE(sdl_quit_event)              :: quit
          TYPE(sdl_user_event)              :: user
          TYPE(sdl_sys_wm_event)            :: sys_wm
          TYPE(sdl_touch_finger_event)      :: t_finger
          TYPE(sdl_multi_gesture_event)     :: m_gesture
          TYPE(sdl_dollar_gesture_event)    :: d_gesture
          TYPE(sdl_drop_event)              :: drop
          INTEGER(kind=c_uint8_t)           :: padding(56)
      END TYPE sdl_event

      TYPE, BIND(c) :: sdl_surface
            INTEGER(kind=c_uint32_t) :: flags
            TYPE(c_ptr)              :: format
            INTEGER(kind=c_int)      :: w
            INTEGER(kind=c_int)      :: h
            INTEGER(kind=c_int)      :: pitch
            TYPE(c_ptr)              :: pixels
            TYPE(c_ptr)              :: user_data
            INTEGER(kind=c_int)      :: locked
            TYPE(c_ptr)              :: lock_data
            TYPE(sdl_rect)           :: clip_rect
            TYPE(c_ptr)              :: map
            INTEGER(kind=c_int)      :: ref_count
      END TYPE sdl_surface

      TYPE, BIND(c) :: sdl_pixel_format
            INTEGER(kind=c_uint32_t) :: format
            TYPE(c_ptr)              :: palette
            INTEGER(kind=c_uint8_t)  :: bits_per_pixel
            INTEGER(kind=c_uint8_t)  :: bytes_per_pixel
            INTEGER(kind=c_uint8_t)  :: padding(2)
            INTEGER(kind=c_uint32_t) :: r_mask
            INTEGER(kind=c_uint32_t) :: g_mask
            INTEGER(kind=c_uint32_t) :: b_mask
            INTEGER(kind=c_uint32_t) :: a_mask
            INTEGER(kind=c_uint8_t)  :: r_loss
            INTEGER(kind=c_uint8_t)  :: g_loss
            INTEGER(kind=c_uint8_t)  :: b_loss
            INTEGER(kind=c_uint8_t)  :: a_loss
            INTEGER(kind=c_uint8_t)  :: r_shift
            INTEGER(kind=c_uint8_t)  :: g_shift
            INTEGER(kind=c_uint8_t)  :: b_shift
            INTEGER(kind=c_uint8_t)  :: a_shift
            INTEGER(kind=c_int)      :: ref_count
            type(c_ptr)              :: next
      END TYPE sdl_pixel_format

      type, bind(c) :: SDL_RendererInfo
            type(c_ptr)             :: name
            integer(kind=c_int32_t) :: flags
            integer(kind=c_int32_t) :: num_texture_formats
            integer(kind=c_int32_t) :: texture_formats(16)
            integer(kind=c_int)     :: max_texture_width
            integer(kind=c_int)     :: max_texture_height
      end type SDL_RendererInfo

      type, bind(c) :: sdl_color
            integer(kind=c_uint8_t) :: r
            integer(kind=c_uint8_t) :: g
            integer(kind=c_uint8_t) :: b
            integer(kind=c_uint8_t) :: a
      end type sdl_color

      type :: vector_type
            real(kind=8) :: x, y, z
      end type vector_type

      type :: camera_type
            type(vector_type) :: pos
            type(vector_type) :: eye
            real(kind=8)      :: dir
      end type camera_type


      interface uint8
            procedure :: uint8_i2
            procedure :: uint8_i4
      end interface uint8

      INTERFACE
            ! int SDL_Init(Uint32 flags)
            FUNCTION sdl_init(flags) BIND(c, name='SDL_Init')
                  IMPORT :: c_int, c_uint32_t
                  INTEGER(kind=c_uint32_t), intent(in), value :: flags
                  INTEGER(kind=c_int)                         :: sdl_init
            END FUNCTION sdl_init

            ! int SDL_InitSubSystem(Uint32 flags)
            FUNCTION sdl_init_sub_system(flags) BIND(c, name='SDL_InitSubSystem')
                  IMPORT :: c_int, c_uint32_t
                  INTEGER(kind=c_uint32_t), intent(in), value :: flags
                  INTEGER(kind=c_int)                         :: sdl_init_sub_system
            END FUNCTION sdl_init_sub_system

            ! void SDL_Quit(void)
            SUBROUTINE sdl_quit() BIND(c, name='SDL_Quit')
            END SUBROUTINE sdl_quit

            ! int SDL_PollEvent(SDL_Event *event)
            FUNCTION sdl_poll_event_(event) BIND(c, name='SDL_PollEvent')
                  IMPORT :: c_int, sdl_event
                  TYPE(sdl_event), intent(inout) :: event
                  INTEGER(kind=c_int)            :: sdl_poll_event_
            END FUNCTION sdl_poll_event_

            ! int SDL_WaitEvent(SDL_Event *event)
            FUNCTION sdl_wait_event_(event) BIND(c, name='SDL_WaitEvent')
                  IMPORT :: c_int, sdl_event
                  TYPE(sdl_event), intent(inout) :: event
                  INTEGER(kind=c_int)            :: sdl_wait_event_
            END FUNCTION sdl_wait_event_

            ! void SDL_PumpEvents(void)
            SUBROUTINE sdl_pump_events() BIND(c, name='SDL_PumpEvents')
            END SUBROUTINE sdl_pump_events

            FUNCTION sdl_get_keyboard_state_(numkeys) BIND(c, name='SDL_GetKeyboardState')
                  IMPORT :: c_ptr
                  TYPE(c_ptr), intent(in), VALUE :: numkeys
                  TYPE(c_ptr)                    :: sdl_get_keyboard_state_
            END FUNCTION sdl_get_keyboard_state_

            FUNCTION sdl_get_window_surface_(window) BIND(c, name='SDL_GetWindowSurface')
                  IMPORT :: c_ptr
                  type(c_ptr), intent(in), value :: window
                  type(c_ptr)                    :: sdl_get_window_surface_
            END FUNCTION sdl_get_window_surface_

            FUNCTION sdl_convert_surface_(src, fmt, flags) BIND(c, name='SDL_ConvertSurface')
                  import :: c_ptr, c_uint32_t, sdl_pixel_format, sdl_surface
                  type(sdl_surface),        intent(in)        :: src
                  type(sdl_pixel_format),   intent(in)        :: fmt
                  INTEGER(kind=c_uint32_t), intent(in), value :: flags
                  type(c_ptr)                                 :: sdl_convert_surface_
            END FUNCTION sdl_convert_surface_

            FUNCTION ttf_render_text_solid_(font, text, fg) bind(c, name='TTF_RenderText_Solid')
                  import :: c_char, c_ptr ,sdl_color
                  type(c_ptr),            intent(in), value :: font
                  character(kind=c_char), intent(in)        :: text
                  type(sdl_color),        intent(in), value :: fg
                  type(c_ptr)                               :: ttf_render_text_solid_
            END FUNCTION ttf_render_text_solid_


            ! ! int SDL_SaveBMP(SDL_Surface* surface,const char*  file)
            function IMG_Save_PNG(surface, file) bind(c, name='IMG_SavePNG')
                  import :: c_int, sdl_surface,c_char
                  type(sdl_surface), intent(in)          :: surface
                  character(kind=c_char), intent(in)     :: file
                  INTEGER(c_int)                         :: IMG_Save_PNG
            end function IMG_Save_PNG

            function sdl_load_bmp_rw(src, free_src) bind(c, name='SDL_LoadBMP_RW')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: src
                  integer(kind=c_int), intent(in), value :: free_src
                  type(c_ptr)                            :: sdl_load_bmp_rw
            end function sdl_load_bmp_rw

            function img_load_(file_name) bind(c, name='IMG_Load')
                  import :: c_char, c_ptr
                  character(kind=c_char), intent(in) :: file_name
                  type(c_ptr)                        :: img_load_
            end function img_load_

            function sdl_get_hint_(name) bind(c, name='SDL_GetHint')
                  import :: c_char, c_ptr
                  character(kind=c_char), intent(in) :: name
                  type(c_ptr)                        :: sdl_get_hint_
            end function sdl_get_hint_

            function sdl_set_render_target(renderer, texture) bind(c, name='SDL_SetRenderTarget')
                  import :: c_int, c_ptr
                  type(c_ptr),             intent(in), value :: renderer
                  type(c_ptr),             intent(in), value :: texture
                  integer(kind=c_int)                        :: sdl_set_render_target
            end function sdl_set_render_target

            ! int SDL_GetRendererInfo(SDL_Renderer * renderer,SDL_RendererInfo * info);
            function SDL_GetRendererInfo(renderer, info) bind(c, name='SDL_GetRendererInfo')
                  import :: c_ptr, SDL_RendererInfo, c_int
                  type(c_ptr),             value             :: renderer
                  type(SDL_RendererInfo)                     :: info
                  integer(kind=c_int)                        :: SDL_GetRendererInfo
            end function SDL_GetRendererInfo

            function sdl_set_render_draw_color(renderer, r, g, b, a) bind(c, name='SDL_SetRenderDrawColor')
                  import :: c_int, c_ptr, c_uint8_t
                  type(c_ptr),             intent(in), value :: renderer
                  integer(kind=c_uint8_t), intent(in), value :: r
                  integer(kind=c_uint8_t), intent(in), value :: g
                  integer(kind=c_uint8_t), intent(in), value :: b
                  integer(kind=c_uint8_t), intent(in), value :: a
                  integer(kind=c_int)                         :: sdl_set_render_draw_color
            end function sdl_set_render_draw_color
      
            function sdl_set_hint_(name, value) bind(c, name='SDL_SetHint')
                  import :: c_char, sdl_bool
                  character(kind=c_char), intent(in) :: name
                  character(kind=c_char), intent(in) :: value
                  integer(kind=sdl_bool)             :: sdl_set_hint_
            end function sdl_set_hint_

            function sdl_create_texture(renderer, format, access, w, h) bind(c, name='SDL_CreateTexture')
                  import :: c_int, c_ptr, c_uint32_t
                  type(c_ptr),              intent(in), value :: renderer
                  integer(kind=c_uint32_t), intent(in), value :: format
                  integer(kind=c_int),      intent(in), value :: access
                  integer(kind=c_int),      intent(in), value :: w
                  integer(kind=c_int),      intent(in), value :: h
                  type(c_ptr)                                 :: sdl_create_texture
            end function sdl_create_texture
      
            ! SDL_Texture *SDL_CreateTextureFromSurface(SDL_Renderer *renderer, SDL_Surface *surface)
            function sdl_create_texture_from_surface(renderer, surface) bind(c, name='SDL_CreateTextureFromSurface')
                  import :: c_ptr, sdl_surface
                  type(c_ptr),       intent(in), value :: renderer
                  type(sdl_surface), intent(in)        :: surface
                  type(c_ptr)                          :: sdl_create_texture_from_surface
            end function sdl_create_texture_from_surface

                    ! int SDL_RenderDrawRect(SDL_Renderer *renderer, const SDL_Rect *rect)
            function sdl_render_draw_rect(renderer, rect) bind(c, name='SDL_RenderDrawRect')
                  import :: c_int, c_ptr, sdl_rect
                  type(c_ptr),    intent(in), value :: renderer
                  type(sdl_rect), intent(in)        :: rect
                  integer(kind=c_int)               :: sdl_render_draw_rect
            end function sdl_render_draw_rect

            ! int SDL_RenderDrawRects(SDL_Renderer *renderer, const SDL_Rect *rects, int count)
            function sdl_render_draw_rects(renderer, rects, count) bind(c, name='SDL_RenderDrawRects')
                  import :: c_int, c_ptr, sdl_rect
                  type(c_ptr),         intent(in), value :: renderer
                  type(sdl_rect),      intent(in)        :: rects(*)
                  integer(kind=c_int), intent(in), value :: count
                  integer(kind=c_int)                    :: sdl_render_draw_rects
            end function sdl_render_draw_rects

            ! int SDL_RenderFillRect(SDL_Renderer *renderer, const SDL_Rect *rect)
            function sdl_render_fill_rect(renderer, rect) bind(c, name='SDL_RenderFillRect')
                  import :: c_int, c_ptr, sdl_rect
                  type(c_ptr),    intent(in), value :: renderer
                  type(sdl_rect), intent(in)        :: rect
                  integer(kind=c_int)               :: sdl_render_fill_rect
            end function sdl_render_fill_rect

            ! int SDL_RenderFillRects(SDL_Renderer *renderer, const SDL_Rect *rects, int count)
            function sdl_render_fill_rects(renderer, rects, count) bind(c, name='SDL_RenderFillRects')
                  import :: c_int, c_ptr, sdl_rect
                  type(c_ptr),         intent(in), value :: renderer
                  type(sdl_rect),      intent(in)        :: rects(*)
                  integer(kind=c_int), intent(in), value :: count
                  integer(kind=c_int)                    :: sdl_render_fill_rects
            end function sdl_render_fill_rects

            function ttf_open_font(file, ptsize) bind(c, name='TTF_OpenFont')
                  import :: c_char, c_int, c_ptr
                  character(kind=c_char), intent(in)        :: file
                  integer(kind=c_int),    intent(in), value :: ptsize
                  type(c_ptr)                               :: ttf_open_font
            end function ttf_open_font




            function ttf_init() bind(c, name='TTF_Init')
                  import :: c_int
                  integer(kind=c_int) :: ttf_init
            end function ttf_init


            function sdl_rw_from_file(file, mode) bind(c, name='SDL_RWFromFile')
                  import :: c_char, c_ptr
                  character(kind=c_char), intent(in) :: file
                  character(kind=c_char), intent(in) :: mode
                  type(c_ptr)                        :: sdl_rw_from_file
            end function sdl_rw_from_file

            function sdl_get_window_id(window) bind(c, name='SDL_GetWindowID')
                  import :: c_ptr, c_uint32_t
                  type(c_ptr), intent(in), value :: window
                  integer(kind=c_uint32_t)       :: sdl_get_window_id
            end function sdl_get_window_id

            function sdl_get_mouse_state(x, y) bind(c, name='SDL_GetMouseState')
                  import :: c_int, c_uint32_t
                  integer(kind=c_int), intent(in) :: x
                  integer(kind=c_int), intent(in) :: y
                  integer(kind=c_uint32_t)        :: sdl_get_mouse_state
            end function sdl_get_mouse_state

            function sdl_create_system_cursor(id) bind(c, name='SDL_CreateSystemCursor')
                  import :: c_ptr, c_int
                  integer(kind=c_int), intent(in), value :: id
                  type(c_ptr)                            :: sdl_create_system_cursor
            end function sdl_create_system_cursor

            function img_init(flags) bind(c, name='IMG_Init')
                  import :: c_int
                  integer(kind=c_int), intent(in), value :: flags
                  integer(kind=c_int)                    :: img_init
            end function img_init

            function sdl_set_color_key(surface, flag, key) bind(c, name='SDL_SetColorKey')
                  import :: c_int, c_uint32_t, sdl_surface
                  type(sdl_surface),        intent(in)        :: surface
                  integer(kind=c_int),      intent(in), value :: flag
                  integer(kind=c_uint32_t), intent(in), value :: key
                  integer(kind=c_int)                         :: sdl_set_color_key
            end function sdl_set_color_key

            function sdl_render_copy(renderer, texture, src_rect, dst_rect) bind(c, name='SDL_RenderCopy')
                  import :: c_int, c_ptr, sdl_rect
                  type(c_ptr),    intent(in), value :: renderer
                  type(c_ptr),    intent(in), value :: texture
                  type(sdl_rect), intent(in)        :: src_rect
                  type(sdl_rect), intent(in)        :: dst_rect
                  integer(kind=c_int)               :: sdl_render_copy
            end function sdl_render_copy

            function sdl_query_texture(texture, format, access, w, h) bind(c, name='SDL_QueryTexture')
                  import :: c_int, c_ptr, c_uint32_t
                  type(c_ptr),              intent(in), value :: texture
                  integer(kind=c_uint32_t), intent(inout)     :: format
                  integer(kind=c_int),      intent(inout)     :: access
                  integer(kind=c_int),      intent(inout)     :: w
                  integer(kind=c_int),      intent(inout)     :: h
                  integer(kind=c_int)                         :: sdl_query_texture
            end function sdl_query_texture

            function c_strlen(str) bind(c, name='strlen')
                  import :: c_ptr, c_size_t
                  type(c_ptr), intent(in), value :: str
                  integer(c_size_t)              :: c_strlen
            end function c_strlen

            ! int SDL_RenderClear(SDL_Renderer *renderer)
            function sdl_render_clear(renderer) bind(c, name='SDL_RenderClear')
                  import :: c_int, c_ptr
                  type(c_ptr), intent(in), value :: renderer
                  integer(kind=c_int)            :: sdl_render_clear
            end function sdl_render_clear

            function sdl_create_window(title, x, y, w, h, flags) bind(c, name='SDL_CreateWindow')
                  import :: c_char, c_int, c_uint32_t, c_ptr
                  character(kind=c_char),   intent(in)        :: title
                  integer(kind=c_int),      intent(in), value :: x
                  integer(kind=c_int),      intent(in), value :: y
                  integer(kind=c_int),      intent(in), value :: w
                  integer(kind=c_int),      intent(in), value :: h
                  integer(kind=c_uint32_t), intent(in), value :: flags
                  type(c_ptr)                                 :: sdl_create_window
            end function sdl_create_window


            subroutine sdl_destroy_window(window) bind(c, name='SDL_DestroyWindow')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: window
            end subroutine sdl_destroy_window

            function sdl_create_renderer(window, index, flags) bind(c, name='SDL_CreateRenderer')
                  import :: c_int, c_ptr, c_uint32_t
                  type(c_ptr),              intent(in), value :: window
                  integer(kind=c_int),      intent(in), value :: index
                  integer(kind=c_uint32_t), intent(in), value :: flags
                  type(c_ptr)                                 :: sdl_create_renderer
            end function sdl_create_renderer

            ! int SDL_SetRenderDrawBlendMode(SDL_Renderer *renderer, SDL_BlendMode blendMode)
            function sdl_set_render_draw_blend_mode(renderer, blend_mode) bind(c, name='SDL_SetRenderDrawBlendMode')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: renderer
                  integer(kind=c_int), intent(in), value :: blend_mode
                  integer(kind=c_int)                    :: sdl_set_render_draw_blend_mode
            end function sdl_set_render_draw_blend_mode

            ! int SDL_ShowSimpleMessageBox(Uint32 flags, const char *title, const char *message, SDL_Window *window)
            function sdl_show_simple_message_box(flags, title, message, window) bind(c, name='SDL_ShowSimpleMessageBox')
                  import :: c_char, c_int, c_ptr, c_uint32_t
                  integer(kind=c_uint32_t), intent(in), value :: flags
                  character(kind=c_char),   intent(in)        :: title
                  character(kind=c_char),   intent(in)        :: message
                  type(c_ptr),              intent(in), value :: window
                  integer(kind=c_int)                         :: sdl_show_simple_message_box
            end function sdl_show_simple_message_box

            subroutine sdl_free_surface(surface) bind(c, name='SDL_FreeSurface')
                  import :: sdl_surface
                  type(sdl_surface), intent(in) :: surface
            end subroutine sdl_free_surface

            subroutine sdl_delay(ms) bind(c, name='SDL_Delay')
                  import :: c_uint32_t
                  integer(kind=c_uint32_t), intent(in), value :: ms
            end subroutine sdl_delay

            subroutine sdl_destroy_renderer(renderer) bind(c, name='SDL_DestroyRenderer')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: renderer
            end subroutine sdl_destroy_renderer
      
              ! void SDL_DestroyTexture(SDL_Texture *texture)
            subroutine sdl_destroy_texture(texture) bind(c, name='SDL_DestroyTexture')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: texture
            end subroutine sdl_destroy_texture

            subroutine sdl_raise_window(window) bind(c, name='SDL_RaiseWindow')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: window
            end subroutine sdl_raise_window

            subroutine sdl_render_present(renderer) bind(c, name='SDL_RenderPresent')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: renderer
            end subroutine sdl_render_present

                    ! void TTF_CloseFont(TTF_Font *font)
            subroutine ttf_close_font(font) bind(c, name='TTF_CloseFont')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: font
            end subroutine ttf_close_font

            ! void TTF_Quit(void)
            subroutine ttf_quit() bind(c, name='TTF_Quit')
            end subroutine ttf_quit

            ! void SDL_SetWindowPosition(SDL_Window *window, int x, int y)
            subroutine sdl_set_window_position(window, x, y) bind(c, name='SDL_SetWindowPosition')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: window
                  integer(kind=c_int), intent(in), value :: x
                  integer(kind=c_int), intent(in), value :: y
            end subroutine sdl_set_window_position

                    ! void IMG_Quit(void)
            subroutine img_quit() bind(c, name='IMG_Quit')
            end subroutine img_quit

                    ! void SDL_SetWindowIcon(SDL_Window *window, SDL_Surface *icon)
            subroutine sdl_set_window_icon(window, icon) bind(c, name='SDL_SetWindowIcon')
                  import :: c_ptr, sdl_surface
                  type(c_ptr),       intent(in), value :: window
                  type(sdl_surface), intent(in)        :: icon
            end subroutine sdl_set_window_icon
            

                    ! void SDL_GetWindowPosition(SDL_Window *window, int *x, int *y)
            subroutine sdl_get_window_position(window, x, y) bind(c, name='SDL_GetWindowPosition')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: window
                  integer(kind=c_int), intent(inout)     :: x
                  integer(kind=c_int), intent(inout)     :: y
            end subroutine sdl_get_window_position

            function sdl_show_cursor(toggle) bind(c, name='SDL_ShowCursor')
                  import :: c_int
                  integer(kind=c_int), intent(in), value :: toggle
                  integer(kind=c_int)                    :: sdl_show_cursor
            end function sdl_show_cursor

            ! void SDL_FreeCursor(SDL_Cursor *cursor)
            subroutine sdl_free_cursor(cursor) bind(c, name='SDL_FreeCursor')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: cursor
            end subroutine sdl_free_cursor

            ! void SDL_SetCursor(SDL_Cursor *cursor)
            subroutine sdl_set_cursor(cursor) bind(c, name='SDL_SetCursor')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: cursor
            end subroutine sdl_set_cursor

            subroutine sdl_set_window_title(window, title) bind(c, name='SDL_SetWindowTitle')
                  import :: c_char, c_ptr
                  type(c_ptr),            intent(in), value :: window
                  character(kind=c_char), intent(in)        :: title
            end subroutine sdl_set_window_title

            ! Mix_Music *Mix_LoadMUS(const char *file)
            function mix_load_mus(file) bind(c, name='Mix_LoadMUS')
                  import :: c_char, c_ptr
                  character(kind=c_char), intent(in) :: file
                  type(c_ptr)                        :: mix_load_mus
            end function mix_load_mus
           ! Mix_Chunk *Mix_LoadWAV_RW(SDL_RWops *src, int freesrc)
            function mix_load_wav_rw(src, free_src) bind(c, name='Mix_LoadWAV_RW')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: src
                  integer(kind=c_int), intent(in), value :: free_src
                  type(c_ptr)                            :: mix_load_wav_rw
              end function mix_load_wav_rw

                      ! int Mix_PlayMusic(Mix_Music *music, int loops)
            function mix_play_music(music, loops) bind(c, name='Mix_PlayMusic')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: music
                  integer(kind=c_int), intent(in), value :: loops
                  integer(kind=c_int)                    :: mix_play_music
            end function mix_play_music

            ! SDL_Surface *SDL_CreateRGBSurface(Uint32 flags, int width, int height, int depth, Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask)
            function sdl_create_rgb_surface_(flags, width, height, depth, r_mask, g_mask, b_mask, a_mask) &
                        bind(c, name='SDL_CreateRGBSurface')
                  import :: c_int, c_int64_t, c_ptr, c_uint32_t
                  integer(kind=c_uint32_t), intent(in), value :: flags
                  integer(kind=c_int),      intent(in), value :: width
                  integer(kind=c_int),      intent(in), value :: height
                  integer(kind=c_int),      intent(in), value :: depth
                  integer(kind=c_int64_t),  intent(in), value :: r_mask
                  integer(kind=c_int64_t),  intent(in), value :: g_mask
                  integer(kind=c_int64_t),  intent(in), value :: b_mask
                  integer(kind=c_int64_t),  intent(in), value :: a_mask
                  type(c_ptr)                                 :: sdl_create_rgb_surface_
            end function sdl_create_rgb_surface_

                    ! const char *SDL_GetError(void)
            function sdl_get_error_() bind(c, name='SDL_GetError')
                  import :: c_ptr
                  type(c_ptr) :: sdl_get_error_
            end function sdl_get_error_

                    ! int SDL_RenderReadPixels(SDL_Renderer *renderer, const SDL_Rect *rect, Uint32 format, void *pixels, int pitch)
            function sdl_render_read_pixels(renderer, rect, format, pixels, pitch) bind(c, name='SDL_RenderReadPixels')
                  import :: c_int, c_ptr, c_uint32_t, sdl_rect
                  type(c_ptr),              intent(in), value :: renderer
                  type(sdl_rect),           intent(in)        :: rect
                  integer(kind=c_uint32_t), intent(in), value :: format
                  type(c_ptr),              intent(in), value :: pixels
                  integer(kind=c_int),      intent(in), value :: pitch
                  integer(kind=c_int)                         :: sdl_render_read_pixels
            end function sdl_render_read_pixels


            ! Uint32 SDL_GetWindowPixelFormat(SDL_Window * window)
            function SDL_GetWindowPixelFormat(window) bind(c, name='SDL_GetWindowPixelFormat')
                  import :: c_int, c_ptr, c_uint32_t, sdl_rect
                  type(c_ptr),              intent(in), value :: window
                  integer(kind=c_uint32_t)                    :: SDL_GetWindowPixelFormat
            end function SDL_GetWindowPixelFormat

            ! SDL_PixelFormat * SDL_AllocFormat(Uint32 pixel_format);
            function SDL_AllocFormat_(pixel_format) bind(c, name='SDL_AllocFormat')
                  import :: c_int, c_ptr, c_uint32_t, sdl_rect
                  integer(kind=c_uint32_t)                    :: pixel_format
                  type(c_ptr)                                 :: SDL_AllocFormat_
            end function SDL_AllocFormat_

            function sdl_render_set_scale(renderer, scale_x, scale_y) bind(c, name='SDL_RenderSetScale')
                  import :: c_float, c_int, c_ptr
                  type(c_ptr),        intent(in), value :: renderer
                  real(kind=c_float), intent(in), value :: scale_x
                  real(kind=c_float), intent(in), value :: scale_y
                  integer(kind=c_int)                   :: sdl_render_set_scale
            end function sdl_render_set_scale

            ! SDL_Texture *IMG_LoadTexture(SDL_Renderer *renderer, const char *file)
            function img_load_texture(renderer, file_name) bind(c, name='IMG_LoadTexture')
                  import :: c_char, c_ptr
                  type(c_ptr),            intent(in), value :: renderer
                  character(kind=c_char), intent(in)        :: file_name
                  type(c_ptr)                               :: img_load_texture
            end function img_load_texture

            ! int SDL_RenderCopyEx(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect *srcrect, 
            ! const SDL_Rect *dstrect, const double angle, const SDL_Point *center, const SDL_RendererFlip flip)
            function sdl_render_copy_ex(renderer, texture, src_rect, dst_rect, angle, center, flip) bind(c, name='SDL_RenderCopyEx')
                  import :: c_double, c_int, c_ptr, sdl_point, sdl_rect
                  type(c_ptr),         intent(in), value :: renderer
                  type(c_ptr),         intent(in), value :: texture
                  type(sdl_rect),      intent(in)        :: src_rect
                  type(sdl_rect),      intent(in)        :: dst_rect
                  real(kind=c_double), intent(in), value :: angle
                  type(sdl_point),     intent(in)        :: center
                  integer(kind=c_int), intent(in), value :: flip
                  integer(kind=c_int)                    :: sdl_render_copy_ex
            end function sdl_render_copy_ex


                    ! int Mix_OpenAudio(int frequency, Uint16 format, int channels, int chunksize)
            function mix_open_audio(frequency, format, channels, chunk_size) bind(c, name='Mix_OpenAudio')
                  import :: c_int, c_uint32_t
                  integer(kind=c_int),      intent(in), value :: frequency
                  integer(kind=c_uint32_t), intent(in), value :: format
                  integer(kind=c_int),      intent(in), value :: channels
                  integer(kind=c_int),      intent(in), value :: chunk_size
                  integer(kind=c_int)                         :: mix_open_audio
            end function mix_open_audio



            ! int SDL_LockTexture(SDL_Texture *texture, const SDL_Rect *rect, void **pixels, int *pitch)
            function sdl_lock_texture(texture, rect, pixels, pitch) bind(c, name='SDL_LockTexture')
                  import :: c_int, c_ptr, sdl_rect
                  type(c_ptr),         intent(in), value :: texture
                  type(sdl_rect),      intent(in)        :: rect
                  type(c_ptr),         intent(in)        :: pixels
                  integer(kind=c_int), intent(inout)     :: pitch
                  integer(kind=c_int)                    :: sdl_lock_texture
            end function sdl_lock_texture


                    ! int Mix_PlayChannelTimed(int channel, Mix_Chunk *chunk, int loops, int ticks)
            function mix_play_channel_timed(channel, chunk, loops, ticks) bind(c, name='Mix_PlayChannelTimed')
                  import :: c_int, c_ptr
                  integer(kind=c_int), intent(in), value :: channel
                  type(c_ptr),         intent(in), value :: chunk
                  integer(kind=c_int), intent(in), value :: loops
                  integer(kind=c_int), intent(in), value :: ticks
                  integer(kind=c_int)                    :: mix_play_channel_timed
            end function mix_play_channel_timed

                    ! void SDL_GetWindowMaximumSize(SDL_Window *window, int *w, int *h)
            subroutine sdl_get_window_maximum_size(window, w, h) bind(c, name='SDL_GetWindowMaximumSize')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: window
                  integer(kind=c_int), intent(inout)     :: w
                  integer(kind=c_int), intent(inout)     :: h
            end subroutine sdl_get_window_maximum_size

            !void SDL_GetWindowSize(SDL_Window * window, int *w,int *h);
            subroutine SDL_Get_Window_Size(window, w, h) bind(c, name='SDL_GetWindowSize')
                  import :: c_int, c_ptr
                  type(c_ptr),value                      :: window
                  integer(kind=c_int)                    :: w
                  integer(kind=c_int)                    :: h
            end subroutine SDL_Get_Window_Size

                    ! void Mix_Quit()
            subroutine mix_quit() bind(c, name='Mix_Quit')
            end subroutine mix_quit

                    ! void Mix_CloseAudio(void)
            subroutine mix_close_audio() bind(c, name='Mix_CloseAudio')
            end subroutine mix_close_audio

                    ! void Mix_FreeChunk(Mix_Chunk *chunk)
            subroutine mix_free_chunk(chunk) bind(c, name='Mix_FreeChunk')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: chunk
            end subroutine mix_free_chunk

            ! void SDL_UnlockTexture(SDL_Texture *texture)
            subroutine sdl_unlock_texture(texture) bind(c, name='SDL_UnlockTexture')
                  import :: c_int, c_ptr
                  type(c_ptr), intent(in), value :: texture
            end subroutine sdl_unlock_texture

                    ! void Mix_FreeMusic(Mix_Chunk *chunk)
            subroutine mix_free_music(music) bind(c, name='Mix_FreeMusic')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: music
            end subroutine mix_free_music

                    ! void SDL_SetWindowSize(SDL_Window *window, int w, int h)
            subroutine sdl_set_window_size(window, x, y) bind(c, name='SDL_SetWindowSize')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: window
                  integer(kind=c_int), intent(in), value :: x
                  integer(kind=c_int), intent(in), value :: y
            end subroutine sdl_set_window_size

                    ! Uint32 SDL_GetTicks(void)
            function sdl_get_ticks() bind(c, name=' SDL_GetTicks64')
                  import :: c_uint64_t
                  integer(kind=c_uint64_t) :: sdl_get_ticks
            end function sdl_get_ticks


            ! int SDL_RenderDrawLine(SDL_Renderer *renderer, int x1, int y1, int x2, int y2)	
            function sdl_render_draw_line(renderer, x1, y1, x2, y2) bind(c, name='SDL_RenderDrawLine')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: renderer
                  integer(kind=c_int), intent(in), value :: x1
                  integer(kind=c_int), intent(in), value :: y1
                  integer(kind=c_int), intent(in), value :: x2
                  integer(kind=c_int), intent(in), value :: y2
                  integer(kind=c_int)                    :: sdl_render_draw_line
            end function sdl_render_draw_line
            ! int SDL_RenderDrawLines(SDL_Renderer *renderer, const SDL_Point *points, int count)
            function sdl_render_draw_lines(renderer, points, count) bind(c, name='SDL_RenderDrawLines')
                  import :: c_int, c_ptr, sdl_point
                  type(c_ptr),         intent(in), value :: renderer
                  type(sdl_point),     intent(in)        :: points(*)
                  integer(kind=c_int), intent(in), value :: count
                  integer(kind=c_int)                    :: sdl_render_draw_lines
            end function sdl_render_draw_lines
            ! void SDL_SetWindowResizable(SDL_Window *window, SDL_bool resizable)
            subroutine sdl_set_window_resizable(window, resizable) bind(c, name='SDL_SetWindowResizable')
                  import :: c_ptr, sdl_bool
                  type(c_ptr),            intent(in), value :: window
                  integer(kind=sdl_bool), intent(in), value :: resizable
            end subroutine sdl_set_window_resizable

            ! int SDL_SetTextureColorMod(SDL_Texture *texture, Uint8 r, Uint8 g, Uint8 b)
            function sdl_set_texture_color_mod(texture, r, g, b) bind(c, name='SDL_SetTextureColorMod')
                  import :: c_int, c_ptr, c_uint8_t
                  type(c_ptr),             intent(in), value :: texture
                  integer(kind=c_uint8_t), intent(in), value :: r
                  integer(kind=c_uint8_t), intent(in), value :: g
                  integer(kind=c_uint8_t), intent(in), value :: b
                  integer(kind=c_int)                        :: sdl_set_texture_color_mod
            end function sdl_set_texture_color_mod
            

                    ! int SDL_RenderDrawPoint(SDL_Renderer *renderer, int x, int y)
            function sdl_render_draw_point(renderer, x, y) bind(c, name='SDL_RenderDrawPoint')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: renderer
                  integer(kind=c_int), intent(in), value :: x
                  integer(kind=c_int), intent(in), value :: y
                  integer(kind=c_int)                    :: sdl_render_draw_point
            end function sdl_render_draw_point

            ! int SDL_RenderDrawPoints(SDL_Renderer *renderer, const SDL_Point *points, int count)
            function sdl_render_draw_points(renderer, points, count) bind(c, name='SDL_RenderDrawPoints')
                  import :: c_int, c_ptr, sdl_point
                  type(c_ptr),         intent(in), value :: renderer
                  type(sdl_point),     intent(in)        :: points(*)
                  integer(kind=c_int), intent(in), value :: count
                  integer(kind=c_int)                    :: sdl_render_draw_points
            end function sdl_render_draw_points

                       ! void SDL_GetRGB(Uint32 pixel,const SDL_PixelFormat * format,Uint8 * r, Uint8 * g, Uint8 * b);
            SUBROUTINE  SDL_Get_RGB(pixel,format, r,g ,b) BIND(c,name = "SDL_GetRGB")
                  IMPORT ::   c_uint32_t,sdl_pixel_format,c_uint8_t
                  INTEGER(c_uint32_t) ,VALUE                      :: pixel
                  TYPE(sdl_pixel_format)                          :: format 
                  INTEGER(c_uint8_t)                              :: r
                  INTEGER(c_uint8_t)                              :: g
                  INTEGER(c_uint8_t)                              :: b 
            END SUBROUTINE SDL_Get_RGB

            ! Uint32 SDL_MapRGB(const SDL_PixelFormat * format, Uint8 r, Uint8 g, Uint8 b);
            FUNCTION SDL_Map_RGB(format, r, g, b) BIND(c,name = "SDL_MapRGB")
                  IMPORT ::   c_uint32_t,sdl_pixel_format,c_uint8_t
                  INTEGER(c_uint32_t)                             :: SDL_Map_RGB
                  TYPE(sdl_pixel_format)                          :: format 
                  INTEGER(c_uint8_t)                              :: r
                  INTEGER(c_uint8_t)                              :: g
                  INTEGER(c_uint8_t)                              :: b 
            END FUNCTION SDL_Map_RGB

            function SDL_PixelFormatEnumToMasks(format,bpp,rmask,gmask,bmask,amask) bind(c,name='SDL_PixelFormatEnumToMasks')
                  import :: c_uint32_t,SDL_bool,c_int
                  INTEGER(c_uint32_t),VALUE                    :: format
                  INTEGER(c_int)                               :: bpp
                  INTEGER(c_uint32_t)                          :: rmask
                  INTEGER(c_uint32_t)                          :: gmask
                  INTEGER(c_uint32_t)                          :: bmask
                  INTEGER(c_uint32_t)                          :: amask
                  INTEGER(SDL_bool)                            :: SDL_PixelFormatEnumToMasks
            end function SDL_PixelFormatEnumToMasks

                        ! Uint32 SDL_GetWindowFlags(SDL_Window * window);
            FUNCTION SDL_GetWindowFlags(window_) bind(c, name='SDL_GetWindowFlags')
                  import:: c_ptr ,c_uint32_t
                  TYPE(c_ptr)                         :: window_
                  INTEGER(c_uint32_t)                 :: SDL_GetWindowFlags
            END FUNCTION SDL_GetWindowFlags

                     !SDL_Surface *TTF_RenderUTF8_Solid(TTF_Font *font, const char *text, SDL_Color fg)
            function ttf_render_utf8_solid_(fontt, text, fg) bind(c, name='TTF_RenderUTF8_Solid')
                  import :: c_char, c_ptr, c_uint32_t,sdl_color
                  type(c_ptr),            intent(in),value       :: fontt
                  character(kind=c_char), intent(in)             :: text
                  type(sdl_color),        intent(in),value       :: fg
                  type(c_ptr)                                    :: ttf_render_utf8_solid_
            end function ttf_render_utf8_solid_

            !SDL_Surface * TTF_RenderUTF8_Blended(TTF_Font *font, const char *text, SDL_Color fg);
            function ttf_render_UTF8_Blended_(fontt, text, fg) bind(c, name='TTF_RenderUTF8_Blended')
                  import :: c_char, c_ptr, c_uint32_t ,sdl_color,sdl_surface
                  type(c_ptr),            intent(in),value       :: fontt
                  character(kind=c_char), intent(in)             :: text(*)
                  type(sdl_color),        intent(in),value       :: fg
                  type(c_ptr)                                    :: ttf_render_UTF8_Blended_
            end function ttf_render_UTF8_Blended_

            !SDL_Surface *TTF_RenderUTF8_Solid(TTF_Font *font, const char *text, SDL_Color fg)

            function ttf_render_UTF8_Shaded_(fontt, text, fg,bg) bind(c, name='TTF_RenderUTF8_Shaded')
                  import :: c_char, c_ptr, c_uint32_t,sdl_color
                  type(c_ptr),            intent(in),value       :: fontt
                  character(kind=c_char), intent(in)             :: text(*)
                  type(sdl_color),        intent(in),value       :: fg
                  type(sdl_color),        intent(in),value       :: bg
                  type(c_ptr)                                    :: ttf_render_UTF8_Shaded_
            end function ttf_render_UTF8_Shaded_
            !int SDL_LockSurface(SDL_Surface * surface);

            function SDL_Lock_Surface(surface_) bind(c, name ="SDL_LockSurface")
                  import ::c_int,sdl_surface
                  type(sdl_surface)                     :: surface_
                  INTEGER(kind = c_int)                 :: SDL_Lock_Surface
            end function SDL_Lock_Surface

            !void SDL_UnlockSurface(SDL_Surface * surface);
            subroutine SDL_Unlock_Surface (surface_) bind(c, name ="SDL_UnlockSurface ")
                  import ::sdl_surface
                  type(sdl_surface)                     :: surface_
            end subroutine SDL_Unlock_Surface 
            
            function SDL_get_Mouse_Focus() bind(c, name ="SDL_GetMouseFocus")
                  import ::c_ptr
                  type(c_ptr)                          :: SDL_get_Mouse_Focus
            end function SDL_get_Mouse_Focus
            
            !void SDL_StartTextInput(void)
            subroutine sdl_start_text_input() bind(c, name='SDL_StartTextInput')
                  import :: c_ptr
            end subroutine sdl_start_text_input

            subroutine sdl_stop_text_input() bind(c, name='SDL_StopTextInput')
                  import :: c_ptr
            end subroutine sdl_stop_text_input
            
            !!void SDL_SetTextInputRect(SDL_Rect *rect)
            subroutine SDL_set_text_input_rect(rect)  bind(c, name = 'SDL_SetTextInputRect')
                  import :: sdl_rect
                  type(sdl_rect) , intent(in)                 :: rect                  
            end subroutine SDL_set_text_input_rect

            ! char * SDL_GetClipboardText(void)
            type(c_ptr)  function sdl_get_clipboard_text_() bind(c, name='SDL_GetClipboardText')
            import :: c_ptr
            end function sdl_get_clipboard_text_
            
            function sdl_set_clipboard_text_(text) bind(c, name='SDL_SetClipboardText')
                  import :: c_char,c_int
                  CHARACTER(kind = c_char)                            :: text(*)
                  INTEGER(kind = c_int)                               :: sdl_set_clipboard_text_
            end function sdl_set_clipboard_text_

            function SDL_Capture_Mouse(enabled_) bind(c,name='SDL_CaptureMouse')
                  import :: c_int,SDL_bool
                  INTEGER(SDL_bool),VALUE                      :: enabled_
                  INTEGER(c_int)                               :: SDL_Capture_Mouse
            end function

            ! co ve khong hoat dong
            function SDL_Push_Event(event_) bind(c,name = 'SDL_PushEvent')
                  import :: c_int , sdl_event
                  type(sdl_event)                     :: event_
                  INTEGER(kind = c_int)               :: SDL_Push_Event
            end function SDL_Push_Event

            function SDL_Set_Texture_BlendMode(texture,blendmode) bind(c, name='SDL_SetTextureBlendMode')
                  import :: c_uint8_t ,c_ptr ,c_int
                  type(c_ptr) ,VALUE                    :: texture
                  integer(kind=c_int),value             :: blendmode
                  INTEGER(kind = c_int)                 :: SDL_Set_Texture_BlendMode
            end function SDL_Set_Texture_BlendMode     
            
            !int SDL_SetTextureAlphaMod(SDL_Texture * texture, Uint8 alpha);
            function SDL_Set_Texture_AlphaMod(texture,alpha) bind(c, name='SDL_SetTextureAlphaMod')
                  import :: c_uint8_t ,c_ptr ,c_int 
                  type(c_ptr),VALUE                    :: texture
                  INTEGER(kind = c_uint8_t),value      :: alpha
                  INTEGER(kind = c_int)                :: SDL_Set_Texture_AlphaMod
            end function SDL_Set_Texture_AlphaMod

            !int SDL_SetSurfaceAlphaMod(SDL_Surface * surface, Uint8 alpha);
            function SDL_Set_Surface_AlphaMod(surface_,alpha) bind(c, name='SDL_SetSurfaceAlphaMod')
                  import :: c_uint8_t ,c_ptr ,c_int, sdl_surface
                  type(sdl_surface)                     :: surface_
                  INTEGER(kind = c_uint8_t),value       :: alpha
                  INTEGER(kind = c_int)                 :: SDL_Set_Surface_AlphaMod
            end function SDL_Set_Surface_AlphaMod

            Subroutine c_free(ptr) BIND(C,name="free")
                  IMPORT :: C_PTR
                  Implicit NONE
                  Type(C_PTR), VALUE :: ptr
            End Subroutine c_free

                        ! int SDL_SetSurfaceBlendMode(SDL_Surface * surface,SDL_BlendMode blendMode)
            function SDL_Set_Surface_BlendMode(surface_,blendmode) bind(c, name='SDL_SetSurfaceBlendMode')
                  import :: c_uint8_t ,c_ptr ,c_int, sdl_surface
                  type(sdl_surface)                     :: surface_
                  integer(kind=c_int),value             :: blendmode
                  INTEGER(kind = c_int)                 :: SDL_Set_Surface_BlendMode
            end function SDL_Set_Surface_BlendMode

            ! int SDLCALL SDL_SetWindowOpacity(SDL_Window * window, float opacity)
            function SDL_set_window_opacity(window, opacity) bind(c,name = "SDL_SetWindowOpacity")
                  import :: c_ptr ,c_int,c_float
                  type(c_ptr),value             :: window
                  REAL(c_float),value           :: opacity 
                  INTEGER(c_int)                :: SDL_set_window_opacity
            end function SDL_set_window_opacity

            !SDL_bool SDLCALL SDL_IsTextInputShown(void)  

            function SDL_IsTextInputShown() bind(c,name = "SDL_IsTextInputShown")   
                  import :: SDL_bool
                  Implicit NONE
                  INTEGER(SDL_bool)                       ::      SDL_IsTextInputShown            
            end function SDL_IsTextInputShown

            ! SDL_Window * SDL_CreateWindowFrom(const void *data);

            !!!!! HANDLE = C_INTPTR_T in libwinapi64
            function SDL_CreateWindowFrom(data) bind(c,name = "SDL_CreateWindowFrom")   
                  import :: C_INTPTR_T, c_ptr
                  Implicit NONE
                  INTEGER(C_INTPTR_T)                      ::      data
                  TYPE(c_ptr)                          ::      SDL_CreateWindowFrom            
            end function SDL_CreateWindowFrom

            ! int SDLCALL SDL_SetWindowInputFocus(SDL_Window * window)
            ! not work in windows, only for x11 in 2.0.5 version
            function SDL_SetWindowInputFocus(window) bind(c,name = "SDL_SetWindowOpacity")
                  import :: c_ptr ,c_int,c_float
                  implicit none
                  type(c_ptr),value             :: window
                  INTEGER(c_int)                :: SDL_SetWindowInputFocus
            end function SDL_SetWindowInputFocus
            ! int SDL_RenderSetScale(SDL_Renderer * renderer,float scaleX, float scaleY)
            function SDL_RenderSetScale(Ptrrenderer,scaleX,scaleY) bind(c,name = "SDL_RenderSetScale")
                  import :: c_ptr, c_float,c_int
                  implicit none
                  
                  type(c_ptr),VALUE       :: Ptrrenderer
                  REAL(c_float),VALUE     :: scaleX, scaleY
                  INTEGER(c_int)          :: SDL_RenderSetScale
            end function SDL_RenderSetScale

            ! int SDLCALL SDL_RenderSetLogicalSize(SDL_Renderer * renderer, int w, int h)
            function SDL_RenderSetLogicalSize(Ptrrenderer,w,h) bind(c,name = "SDL_RenderSetLogicalSize")
                  import :: c_ptr,c_int
                  implicit none
                  
                  type(c_ptr),VALUE       :: Ptrrenderer
                  INTEGER(c_int),VALUE    :: w, h
                  INTEGER(c_int)          :: SDL_RenderSetLogicalSize
            end function SDL_RenderSetLogicalSize

            ! int SDLCALL TTF_SizeText(TTF_Font *font, const char *text, int *w, int *h)
            FUNCTION TTF_SizeText_(fontt, text, w, h) bind(c, name = "TTF_SizeText") 
                  import :: c_ptr, c_char, c_int
                  implicit none
                  type(c_ptr),           value              :: fontt
                  character(kind=c_char)                    :: text(*)                                  
                  INTEGER(c_int)                            :: w
                  INTEGER(c_int)                            :: h
                  INTEGER(c_int)                            :: TTF_SizeText_
            END FUNCTION TTF_SizeText_
            
            !!!!!  WCHAR = C_INT16_T   in libwinapi64
            FUNCTION TTF_SizeUNICODE_(fontt, text, w, h) bind(c, name = "TTF_SizeUNICODE") 
                  import :: c_ptr, c_char, c_int,C_INT16_T
                  implicit none
                  type(c_ptr),           value              :: fontt
                  INTEGER(C_INT16_T), DIMENSION(*)          :: text
                  INTEGER(c_int)                            :: w
                  INTEGER(c_int)                            :: h
                  INTEGER(c_int)                            :: TTF_SizeUNICODE_
            END FUNCTION TTF_SizeUNICODE_

            ! int SDL_GetRendererOutputSize(SDL_Renderer * renderer,int *w, int *h)
            subroutine SDL_Get_Renderer_Output_Size(render_rer, w, h) bind(c, name='SDL_GetRendererOutputSize')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: render_rer
                  integer(kind=c_int), intent(inout)     :: w
                  integer(kind=c_int), intent(inout)     :: h
            end subroutine SDL_Get_Renderer_Output_Size
                        
            ! TTF_SetFontStyle(TTF_Font *font, int style);
            SUBROUTINE TTF_SetFontStyle(fontt, style )  bind(c, name = "TTF_SetFontStyle") 
                  import :: c_ptr , c_int
                  implicit none
                  type(c_ptr),    VALUE              :: fontt
                  INTEGER(c_int), VALUE              :: style
            END SUBROUTINE

            function sdl_render_copy_(renderer_, texture, src_rect, dst_rect) bind(c, name='SDL_RenderCopy')
                  import :: c_int, c_ptr, sdl_rect
                  type(c_ptr),    intent(in), value :: renderer_
                  type(c_ptr),    intent(in), value :: texture
                  type(sdl_rect), OPTIONAL          :: src_rect
                  type(sdl_rect), intent(in)        :: dst_rect
                  integer(kind=c_int)               :: sdl_render_copy_
            end function sdl_render_copy_


       ! const char *SDL_GetCurrentVideoDriver(void)
            function sdl_get_current_video_driver_() bind(c, name='SDL_GetCurrentVideoDriver')
                  import :: c_ptr
                  type(c_ptr) :: sdl_get_current_video_driver_
              end function sdl_get_current_video_driver_
      
              ! SDL_GLContext SDL_GL_CreateContext(SDL_Window* window)
              function sdl_gl_create_context(window) bind(c, name='SDL_GL_CreateContext')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: window
                  type(c_ptr)                    :: sdl_gl_create_context
              end function sdl_gl_create_context
      
              ! int SDL_GL_SetAttribute(SDL_GLattr attr, int value)
              function sdl_gl_set_attribute(attr, value) bind(c, name='SDL_GL_SetAttribute')
                  import :: c_int
                  integer(kind=c_int), intent(in), value :: attr
                  integer(kind=c_int), intent(in), value :: value
                  integer(kind=c_int)                    :: sdl_gl_set_attribute
              end function sdl_gl_set_attribute
      
              ! int SDL_GL_SetSwapInterval(int interval)
              function sdl_gl_set_swap_interval(interval) bind(c, name='SDL_GL_SetSwapInterval')
                  import :: c_int
                  integer(kind=c_int), intent(in), value :: interval
                  integer(kind=c_int)                    :: sdl_gl_set_swap_interval
              end function sdl_gl_set_swap_interval
      
              ! const char *SDL_GetVideoDriver(int index)
              function sdl_get_video_driver_(index) bind(c, name='SDL_GetVideoDriver')
                  import :: c_int, c_ptr
                  integer(kind=c_int), intent(in) :: index
                  type(c_ptr)                     :: sdl_get_video_driver_
              end function sdl_get_video_driver_
      
              ! Uint32 SDL_GetWindowPixelFormat(SDL_Window* window)
              function sdl_get_window_pixel_format(window) bind(c, name='SDL_GetWindowPixelFormat')
                  import :: c_ptr, c_uint32_t
                  type(c_ptr), intent(in), value :: window
                  integer(kind=c_uint32_t)       :: sdl_get_window_pixel_format
              end function sdl_get_window_pixel_format
          
              ! const char *SDL_GetWindowTitle(SDL_Window *window)
              function sdl_get_window_title_(window) bind(c, name='SDL_GetWindowTitle')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: window
                  type(c_ptr)                    :: sdl_get_window_title_
              end function sdl_get_window_title_
      
              ! int SDL_SetWindowFullscreen(SDL_Window *window, Uint32 flags)
              function sdl_set_window_fullscreen(window, flags) bind(c, name='SDL_SetWindowFullscreen')
                  import :: c_int, c_ptr, c_uint32_t
                  type(c_ptr),              intent(in), value :: window
                  integer(kind=c_uint32_t), intent(in), value :: flags
                  integer(kind=c_int)                         :: sdl_set_window_fullscreen
              end function sdl_set_window_fullscreen
      
              ! int SDL_UpdateWindowSurface(SDL_Window *window)
              function sdl_update_window_surface(window) bind(c, name='SDL_UpdateWindowSurface')
                  import :: c_int, c_ptr
                  type(c_ptr), intent(in), value :: window
                  integer(kind=c_int)            :: sdl_update_window_surface
              end function sdl_update_window_surface
      
              ! void SDL_GetWindowMinimumSize(SDL_Window *window, int *w, int *h)
              subroutine sdl_get_window_minimum_size(window, w, h) bind(c, name='SDL_GetWindowMinimumSize')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: window
                  integer(kind=c_int), intent(inout)     :: w
                  integer(kind=c_int), intent(inout)     :: h
              end subroutine sdl_get_window_minimum_size
      
              ! void SDL_GL_DeleteContext(SDL_GLContext context)
              subroutine sdl_gl_delete_context(context) bind(c, name='SDL_GL_DeleteContext')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: context
              end subroutine sdl_gl_delete_context
      
              ! void SDL_GL_SwapWindow(SDL_Window *window)
              subroutine sdl_gl_swap_window(window) bind(c, name='SDL_GL_SwapWindow')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: window
              end subroutine sdl_gl_swap_window
      
              ! void SDL_HideWindow(SDL_Window *window)
              subroutine sdl_hide_window(window) bind(c, name='SDL_HideWindow')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: window
              end subroutine sdl_hide_window
      
              ! void SDL_MaximizeWindow(SDL_Window *window)
              subroutine sdl_maximize_window(window) bind(c, name='SDL_MaximizeWindow')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: window
              end subroutine sdl_maximize_window
      
              ! void SDL_MinimizeWindow(SDL_Window *window)
              subroutine sdl_minimize_window(window) bind(c, name='SDL_MinimizeWindow')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: window
              end subroutine sdl_minimize_window
      
              ! void SDL_RestoreWindow(SDL_Window *window)
              subroutine sdl_restore_window(window) bind(c, name='SDL_RestoreWindow')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: window
              end subroutine sdl_restore_window
      
              ! void SDL_SetWindowBordered(SDL_Window *window, SDL_bool bordered)
              subroutine sdl_set_window_bordered(window, bordered) bind(c, name='SDL_SetWindowBordered')
                  import :: c_ptr, sdl_bool
                  type(c_ptr),            intent(in), value :: window
                  integer(kind=sdl_bool), intent(in), value :: bordered
              end subroutine sdl_set_window_bordered
      
              ! void SDL_SetWindowMaximumSize(SDL_Window *window, int max_w, int max_h)
              subroutine sdl_set_window_maximum_size(window, max_w, max_h) bind(c, name='SDL_SetWindowMaximumSize')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: window
                  integer(kind=c_int), intent(in), value :: max_w
                  integer(kind=c_int), intent(in), value :: max_h
              end subroutine sdl_set_window_maximum_size
      
              ! void SDL_SetWindowMinimumSize(SDL_Window *window, int min_w, int min_h)
              subroutine sdl_set_window_minimum_size(window, min_w, min_h) bind(c, name='SDL_SetWindowMinimumSize')
                  import :: c_int, c_ptr
                  type(c_ptr),         intent(in), value :: window
                  integer(kind=c_int), intent(in), value :: min_w
                  integer(kind=c_int), intent(in), value :: min_h
              end subroutine sdl_set_window_minimum_size
      
      
              ! void SDL_ShowWindow(SDL_Window *window)
              subroutine sdl_show_window(window) bind(c, name='SDL_ShowWindow')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: window
              end subroutine sdl_show_window













                        ! GLboolean glIsEnabled(GLenum cap)
            function glisenabled(cap) bind(c, name='glIsEnabled')
                  import :: GLboolean, GLenum
                  integer(kind=GLenum), intent(in), value :: cap
                  integer(kind=GLboolean)                 :: glisenabled
            end function glisenabled

            ! GLboolean glIsList(GLuint list)
            function glislist(list) bind(c, name='glIsList')
                  import :: GLboolean, GLuint
                  integer(kind=GLuint), intent(in), value :: list
                  integer(kind=GLboolean)                 :: glislist
            end function glislist

            ! GLboolean glAreTexturesResident(GLsizei n, const GLuint *textures, GLboolean *residences)
            function glaretexturesresident(n, textures, residences) bind(c, name='glAreTexturesResident')
                  import :: GLboolean, GLsizei, GLuint
                  integer(kind=GLsizei),   intent(in), value :: n
                  integer(kind=GLuint),    intent(in)        :: textures(*)
                  integer(kind=GLboolean), intent(in)        :: residences
                  integer(kind=GLboolean)                    :: glaretexturesresident
            end function glaretexturesresident

            ! GLboolean glIsTexture(GLuint texture)
            function glistexture(texture) bind(c, name='glIsTexture')
                  import :: GLboolean, GLuint
                  integer(kind=GLuint), intent(in), value :: texture
                  integer(kind=GLboolean)                 :: glistexture
            end function glistexture

            ! GLenum glGetError(void)
            function glgeterror() bind(c, name='glGetError')
                  import :: GLenum
                  integer(kind=GLenum) :: glgeterror
            end function glgeterror

            ! GLint glRenderMode(GLenum mode)
            function glrendermode(mode) bind(c, name='glRenderMode')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: mode
                  integer(kind=GLint)                     :: glrendermode
            end function glrendermode

            ! const GLubyte *glGetString(GLenum name)
            function glgetstring(name) bind(c, name='glGetString')
                  import :: GLenum, GLubyte, c_ptr
                  integer(kind=GLenum), intent(in), value :: name
                  type(c_ptr)                             :: glgetstring
            end function glgetstring

            ! GLuint glGenLists(GLsizei range)
            function glgenlists(range) bind(c, name='glGenLists')
                  import :: GLsizei, GLuint
                  integer(kind=GLsizei), intent(in), value :: range
                  integer(kind=GLuint)                     :: glgenlists
            end function glgenlists

            ! void glClearIndex(GLfloat c)
            subroutine glclearindex(c) bind(c, name='glClearIndex')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: c
            end subroutine glclearindex

            ! void glClearColor(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha)
            subroutine glclearcolor(red, green, blue, alpha) bind(c, name='glClearColor')
                  import :: GLclampf
                  real(kind=GLclampf), intent(in), value :: red
                  real(kind=GLclampf), intent(in), value :: green
                  real(kind=GLclampf), intent(in), value :: blue
                  real(kind=GLclampf), intent(in), value :: alpha
            end subroutine glclearcolor

            ! void glClear(GLbitfield mask)
            subroutine glclear(mask) bind(c, name='glClear')
                  import :: GLbitfield
                  integer(kind=GLbitfield), intent(in), value :: mask
            end subroutine glclear

            ! void glIndexMask(GLuint mask)
            subroutine glindexmask(mask) bind(c, name='glIndexMask')
                  import :: GLuint
                  integer(kind=GLuint), intent(in), value :: mask
            end subroutine glindexmask

            ! void glColorMask(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha)
            subroutine glcolormask(red, green, blue, alpha) bind(c, name='glColorMask')
                  import :: GLboolean
                  integer(kind=GLboolean), intent(in), value :: red
                  integer(kind=GLboolean), intent(in), value :: green
                  integer(kind=GLboolean), intent(in), value :: blue
                  integer(kind=GLboolean), intent(in), value :: alpha
            end subroutine glcolormask

            ! void glAlphaFunc(GLenum func, GLclampf ref)
            subroutine glalphafunc(func, ref) bind(c, name='glAlphaFunc')
                  import :: GLclampf, GLenum
                  integer(kind=GLenum), intent(in), value :: func
                  real(kind=GLclampf),  intent(in), value :: ref
            end subroutine glalphafunc

            ! void glBlendFunc(GLenum sfactor, GLenum dfactor)
            subroutine glblendfunc(sfactor, dfactor) bind(c, name='glBlendFunc')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: sfactor
                  integer(kind=GLenum), intent(in), value :: dfactor
            end subroutine glblendfunc

            ! void glLogicOp(GLenum opcode)
            subroutine gllogicop(opcode) bind(c, name='glLogicOp')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: opcode
            end subroutine gllogicop

            ! void glCullFace(GLenum mode)
            subroutine glcullface(mode) bind(c, name='glCullFace')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: mode
            end subroutine glcullface

            ! void glFrontFace(GLenum mode)
            subroutine glfrontface(mode) bind(c, name='glFrontFace')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: mode
            end subroutine glfrontface

            ! void glPointSize(GLfloat size)
            subroutine glpointsize(size) bind(c, name='glPointSize')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: size
            end subroutine glpointsize

            ! void glLineWidth(GLfloat width)
            subroutine gllinewidth(width) bind(c, name='glLineWidth')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: width
            end subroutine gllinewidth

            ! void glLineStipple(GLint factor, GLushort pattern)
            subroutine gllinestipple(factor, pattern) bind(c, name='glLineStipple')
                  import :: GLint, GLushort
                  integer(kind=GLint),    intent(in), value :: factor
                  integer(kind=GLushort), intent(in), value :: pattern
            end subroutine gllinestipple

            ! void glPolygonMode(GLenum face, GLenum mode)
            subroutine glpolygonmode(face, mode) bind(c, name='glPolygonMode')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: face
                  integer(kind=GLenum), intent(in), value :: mode
            end subroutine glpolygonmode

            ! void glPolygonOffset(GLfloat factor, GLfloat units)
            subroutine glpolygonoffset(factor, units) bind(c, name='glPolygonOffset')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: factor
                  real(kind=GLfloat), intent(in), value :: units
            end subroutine glpolygonoffset

            ! void glPolygonStipple(const GLubyte *mask)
            subroutine glpolygonstipple(mask) bind(c, name='glPolygonStipple')
                  import :: GLubyte
                  integer(kind=GLubyte), intent(in) :: mask
            end subroutine glpolygonstipple

            ! void glGetPolygonStipple(GLubyte *mask)
            subroutine glgetpolygonstipple(mask) bind(c, name='glGetPolygonStipple')
                  import :: GLubyte
                  integer(kind=GLubyte), intent(in) :: mask
            end subroutine glgetpolygonstipple

            ! void glEdgeFlag(GLboolean flag)
            subroutine gledgeflag(flag) bind(c, name='glEdgeFlag')
                  import :: GLboolean
                  integer(kind=GLboolean), intent(in), value :: flag
            end subroutine gledgeflag

            ! void glEdgeFlagv(const GLboolean *flag)
            subroutine gledgeflagv(flag) bind(c, name='glEdgeFlagv')
                  import :: GLboolean
                  integer(kind=GLboolean), intent(in) :: flag
            end subroutine gledgeflagv

            ! void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
            subroutine glscissor(x, y, width, height) bind(c, name='glScissor')
                  import :: GLint, GLsizei
                  integer(kind=GLint),   intent(in), value :: x
                  integer(kind=GLint),   intent(in), value :: y
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
            end subroutine glscissor

            ! void glClipPlane(GLenum plane, const GLdouble *equation)
            subroutine glclipplane(plane, equation) bind(c, name='glClipPlane')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: plane
                  real(kind=GLdouble), intent(in) :: equation
            end subroutine glclipplane

            ! void glGetClipPlane(GLenum plane, GLdouble *equation)
            subroutine glgetclipplane(plane, equation) bind(c, name='glGetClipPlane')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: plane
                  real(kind=GLdouble), intent(in) :: equation
            end subroutine glgetclipplane

            ! void glDrawBuffer(GLenum mode)
            subroutine gldrawbuffer(mode) bind(c, name='glDrawBuffer')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: mode
            end subroutine gldrawbuffer

            ! void glReadBuffer(GLenum mode)
            subroutine glreadbuffer(mode) bind(c, name='glReadBuffer')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: mode
            end subroutine glreadbuffer

            ! void glEnable(GLenum cap)
            subroutine glenable(cap) bind(c, name='glEnable')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: cap
            end subroutine glenable

            ! void glDisable(GLenum cap)
            subroutine gldisable(cap) bind(c, name='glDisable')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: cap
            end subroutine gldisable

            ! void glEnableClientState(GLenum cap)
            subroutine glenableclientstate(cap) bind(c, name='glEnableClientState')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: cap
            end subroutine glenableclientstate

            ! void glDisableClientState(GLenum cap)
            subroutine gldisableclientstate(cap) bind(c, name='glDisableClientState')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: cap
            end subroutine gldisableclientstate

            ! void glGetBooleanv(GLenum pname, GLboolean *params)
            subroutine glgetbooleanv(pname, params) bind(c, name='glGetBooleanv')
                  import :: GLboolean, GLenum
                  integer(kind=GLenum),    intent(in), value :: pname
                  integer(kind=GLboolean), intent(in)        :: params(*)
            end subroutine glgetbooleanv

            ! void glGetDoublev(GLenum pname, GLdouble *params)
            subroutine glgetdoublev(pname, params) bind(c, name='glGetDoublev')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLdouble),  intent(in)        :: params(*)
            end subroutine glgetdoublev

            ! void glGetFloatv(GLenum pname, GLfloat *params)
            subroutine glgetfloatv(pname, params) bind(c, name='glGetFloatv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine glgetfloatv

            ! void glGetIntegerv(GLenum pname, GLint *params)
            subroutine glgetintegerv(pname, params) bind(c, name='glGetIntegerv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine glgetintegerv

            ! void glPushAttrib(GLbitfield mask)
            subroutine glpushattrib(mask) bind(c, name='glPushAttrib')
                  import :: GLbitfield
                  integer(kind=GLbitfield), intent(in), value :: mask
            end subroutine glpushattrib

            ! void glPopAttrib(void)
            subroutine glpopattrib() bind(c, name='glPopAttrib')
            end subroutine glpopattrib

            ! void glPushClientAttrib(GLbitfield mask)
            subroutine glpushclientattrib(mask) bind(c, name='glPushClientAttrib')
                  import :: GLbitfield
                  integer(kind=GLbitfield), intent(in), value :: mask
            end subroutine glpushclientattrib

            ! void glPopClientAttrib(void)
            subroutine glpopclientattrib() bind(c, name='glPopClientAttrib')
            end subroutine glpopclientattrib

            ! void glFinish(void)
            subroutine glfinish() bind(c, name='glFinish')
            end subroutine glfinish

            ! void glFlush(void)
            subroutine glflush() bind(c, name='glFlush')
            end subroutine glflush

            ! void glHint(GLenum target, GLenum mode)
            subroutine glhint(target, mode) bind(c, name='glHint')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: mode
            end subroutine glhint

            ! void glClearDepth(GLclampd depth)
            subroutine glcleardepth(depth) bind(c, name='glClearDepth')
                  import :: GLclampd
                  real(kind=GLclampd), intent(in), value :: depth
            end subroutine glcleardepth

            ! void glDepthFunc(GLenum func)
            subroutine gldepthfunc(func) bind(c, name='glDepthFunc')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: func
            end subroutine gldepthfunc

            ! void glDepthMask(GLboolean flag)
            subroutine gldepthmask(flag) bind(c, name='glDepthMask')
                  import :: GLboolean
                  integer(kind=GLboolean), intent(in), value :: flag
            end subroutine gldepthmask

            ! void glDepthRange(GLclampd near_val, GLclampd far_val)
            subroutine gldepthrange(near_val, far_val) bind(c, name='glDepthRange')
                  import :: GLclampd
                  real(kind=GLclampd), intent(in), value :: near_val
                  real(kind=GLclampd), intent(in), value :: far_val
            end subroutine gldepthrange

            ! void glClearAccum(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
            subroutine glclearaccum(red, green, blue, alpha) bind(c, name='glClearAccum')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: red
                  real(kind=GLfloat), intent(in), value :: green
                  real(kind=GLfloat), intent(in), value :: blue
                  real(kind=GLfloat), intent(in), value :: alpha
            end subroutine glclearaccum

            ! void glAccum(GLenum op, GLfloat value)
            subroutine glaccum(op, value) bind(c, name='glAccum')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: op
                  real(kind=GLfloat),   intent(in), value :: value
            end subroutine glaccum

            ! void glMatrixMode(GLenum mode)
            subroutine glmatrixmode(mode) bind(c, name='glMatrixMode')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: mode
            end subroutine glmatrixmode

            ! void glOrtho(GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble near_val, GLdouble far_val)
            subroutine glortho(left, right, bottom, top, near_val, far_val) bind(c, name='glOrtho')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: left
                  real(kind=GLdouble), intent(in), value :: right
                  real(kind=GLdouble), intent(in), value :: bottom
                  real(kind=GLdouble), intent(in), value :: top
                  real(kind=GLdouble), intent(in), value :: near_val
                  real(kind=GLdouble), intent(in), value :: far_val
            end subroutine glortho

            ! void glFrustum(GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble near_val, GLdouble far_val)
            subroutine glfrustum(left, right, bottom, top, near_val, far_val) bind(c, name='glFrustum')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: left
                  real(kind=GLdouble), intent(in), value :: right
                  real(kind=GLdouble), intent(in), value :: bottom
                  real(kind=GLdouble), intent(in), value :: top
                  real(kind=GLdouble), intent(in), value :: near_val
                  real(kind=GLdouble), intent(in), value :: far_val
            end subroutine glfrustum

            ! void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
            subroutine glviewport(x, y, width, height) bind(c, name='glViewport')
                  import :: GLint, GLsizei
                  integer(kind=GLint),   intent(in), value :: x
                  integer(kind=GLint),   intent(in), value :: y
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
            end subroutine glviewport

            ! void glPushMatrix(void)
            subroutine glpushmatrix() bind(c, name='glPushMatrix')
            end subroutine glpushmatrix

            ! void glPopMatrix(void)
            subroutine glpopmatrix() bind(c, name='glPopMatrix')
            end subroutine glpopmatrix

            ! void glLoadIdentity(void)
            subroutine glloadidentity() bind(c, name='glLoadIdentity')
            end subroutine glloadidentity

            ! void glLoadMatrixd(const GLdouble *m)
            subroutine glloadmatrixd(m) bind(c, name='glLoadMatrixd')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: m
            end subroutine glloadmatrixd

            ! void glLoadMatrixf(const GLfloat *m)
            subroutine glloadmatrixf(m) bind(c, name='glLoadMatrixf')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: m
            end subroutine glloadmatrixf

            ! void glMultMatrixd(const GLdouble *m)
            subroutine glmultmatrixd(m) bind(c, name='glMultMatrixd')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: m
            end subroutine glmultmatrixd

            ! void glMultMatrixf(const GLfloat *m)
            subroutine glmultmatrixf(m) bind(c, name='glMultMatrixf')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: m
            end subroutine glmultmatrixf

            ! void glRotated(GLdouble angle, GLdouble x, GLdouble y, GLdouble z)
            subroutine glrotated(angle, x, y, z) bind(c, name='glRotated')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: angle
                  real(kind=GLdouble), intent(in), value :: x
                  real(kind=GLdouble), intent(in), value :: y
                  real(kind=GLdouble), intent(in), value :: z
            end subroutine glrotated

            ! void glRotatef(GLfloat angle, GLfloat x, GLfloat y, GLfloat z)
            subroutine glrotatef(angle, x, y, z) bind(c, name='glRotatef')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: angle
                  real(kind=GLfloat), intent(in), value :: x
                  real(kind=GLfloat), intent(in), value :: y
                  real(kind=GLfloat), intent(in), value :: z
            end subroutine glrotatef

            ! void glScaled(GLdouble x, GLdouble y, GLdouble z)
            subroutine glscaled(x, y, z) bind(c, name='glScaled')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: x
                  real(kind=GLdouble), intent(in), value :: y
                  real(kind=GLdouble), intent(in), value :: z
            end subroutine glscaled

            ! void glScalef(GLfloat x, GLfloat y, GLfloat z)
            subroutine glscalef(x, y, z) bind(c, name='glScalef')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: x
                  real(kind=GLfloat), intent(in), value :: y
                  real(kind=GLfloat), intent(in), value :: z
            end subroutine glscalef

            ! void glTranslated(GLdouble x, GLdouble y, GLdouble z)
            subroutine gltranslated(x, y, z) bind(c, name='glTranslated')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: x
                  real(kind=GLdouble), intent(in), value :: y
                  real(kind=GLdouble), intent(in), value :: z
            end subroutine gltranslated

            ! void glTranslatef(GLfloat x, GLfloat y, GLfloat z)
            subroutine gltranslatef(x, y, z) bind(c, name='glTranslatef')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: x
                  real(kind=GLfloat), intent(in), value :: y
                  real(kind=GLfloat), intent(in), value :: z
            end subroutine gltranslatef

            ! void glDeleteLists(GLuint list, GLsizei range)
            subroutine gldeletelists(list, range) bind(c, name='glDeleteLists')
                  import :: GLsizei, GLuint
                  integer(kind=GLuint),  intent(in), value :: list
                  integer(kind=GLsizei), intent(in), value :: range
            end subroutine gldeletelists

            ! void glNewList(GLuint list, GLenum mode)
            subroutine glnewlist(list, mode) bind(c, name='glNewList')
                  import :: GLenum, GLuint
                  integer(kind=GLuint), intent(in), value :: list
                  integer(kind=GLenum), intent(in), value :: mode
            end subroutine glnewlist

            ! void glEndList(void)
            subroutine glendlist() bind(c, name='glEndList')
            end subroutine glendlist

            ! void glCallList(GLuint list)
            subroutine glcalllist(list) bind(c, name='glCallList')
                  import :: GLuint
                  integer(kind=GLuint), intent(in), value :: list
            end subroutine glcalllist

            ! void glCallLists(GLsizei n, GLenum type, const GLvoid *lists)
            subroutine glcalllists(n, type, lists) bind(c, name='glCallLists')
                  import :: GLenum, GLsizei, c_ptr
                  integer(kind=GLsizei), intent(in), value :: n
                  integer(kind=GLenum),  intent(in), value :: type
                  type(c_ptr),           intent(in), value :: lists
            end subroutine glcalllists

            ! void glListBase(GLuint base)
            subroutine gllistbase(base) bind(c, name='glListBase')
                  import :: GLuint
                  integer(kind=GLuint), intent(in), value :: base
            end subroutine gllistbase

            ! void glBegin(GLenum mode)
            subroutine glbegin(mode) bind(c, name='glBegin')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: mode
            end subroutine glbegin

            ! void glEnd(void)
            subroutine glend() bind(c, name='glEnd')
            end subroutine glend

            ! void glVertex2d(GLdouble x, GLdouble y)
            subroutine glvertex2d(x, y) bind(c, name='glVertex2d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: x
                  real(kind=GLdouble), intent(in), value :: y
            end subroutine glvertex2d

            ! void glVertex2f(GLfloat x, GLfloat y)
            subroutine glvertex2f(x, y) bind(c, name='glVertex2f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: x
                  real(kind=GLfloat), intent(in), value :: y
            end subroutine glvertex2f

            ! void glVertex2i(GLint x, GLint y)
            subroutine glvertex2i(x, y) bind(c, name='glVertex2i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: x
                  integer(kind=GLint), intent(in), value :: y
            end subroutine glvertex2i

            ! void glVertex2s(GLshort x, GLshort y)
            subroutine glvertex2s(x, y) bind(c, name='glVertex2s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: x
                  integer(kind=GLshort), intent(in), value :: y
            end subroutine glvertex2s

            ! void glVertex3d(GLdouble x, GLdouble y, GLdouble z)
            subroutine glvertex3d(x, y, z) bind(c, name='glVertex3d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: x
                  real(kind=GLdouble), intent(in), value :: y
                  real(kind=GLdouble), intent(in), value :: z
            end subroutine glvertex3d

            ! void glVertex3f(GLfloat x, GLfloat y, GLfloat z)
            subroutine glvertex3f(x, y, z) bind(c, name='glVertex3f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: x
                  real(kind=GLfloat), intent(in), value :: y
                  real(kind=GLfloat), intent(in), value :: z
            end subroutine glvertex3f

            ! void glVertex3i(GLint x, GLint y, GLint z)
            subroutine glvertex3i(x, y, z) bind(c, name='glVertex3i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: x
                  integer(kind=GLint), intent(in), value :: y
                  integer(kind=GLint), intent(in), value :: z
            end subroutine glvertex3i

            ! void glVertex3s(GLshort x, GLshort y, GLshort z)
            subroutine glvertex3s(x, y, z) bind(c, name='glVertex3s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: x
                  integer(kind=GLshort), intent(in), value :: y
                  integer(kind=GLshort), intent(in), value :: z
            end subroutine glvertex3s

            ! void glVertex4d(GLdouble x, GLdouble y, GLdouble z, GLdouble w)
            subroutine glvertex4d(x, y, z, w) bind(c, name='glVertex4d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: x
                  real(kind=GLdouble), intent(in), value :: y
                  real(kind=GLdouble), intent(in), value :: z
                  real(kind=GLdouble), intent(in), value :: w
            end subroutine glvertex4d

            ! void glVertex4f(GLfloat x, GLfloat y, GLfloat z, GLfloat w)
            subroutine glvertex4f(x, y, z, w) bind(c, name='glVertex4f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: x
                  real(kind=GLfloat), intent(in), value :: y
                  real(kind=GLfloat), intent(in), value :: z
                  real(kind=GLfloat), intent(in), value :: w
            end subroutine glvertex4f

            ! void glVertex4i(GLint x, GLint y, GLint z, GLint w)
            subroutine glvertex4i(x, y, z, w) bind(c, name='glVertex4i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: x
                  integer(kind=GLint), intent(in), value :: y
                  integer(kind=GLint), intent(in), value :: z
                  integer(kind=GLint), intent(in), value :: w
            end subroutine glvertex4i

            ! void glVertex4s(GLshort x, GLshort y, GLshort z, GLshort w)
            subroutine glvertex4s(x, y, z, w) bind(c, name='glVertex4s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: x
                  integer(kind=GLshort), intent(in), value :: y
                  integer(kind=GLshort), intent(in), value :: z
                  integer(kind=GLshort), intent(in), value :: w
            end subroutine glvertex4s

            ! void glVertex2dv(const GLdouble *v)
            subroutine glvertex2dv(v) bind(c, name='glVertex2dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glvertex2dv

            ! void glVertex2fv(const GLfloat *v)
            subroutine glvertex2fv(v) bind(c, name='glVertex2fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glvertex2fv

            ! void glVertex2iv(const GLint *v)
            subroutine glvertex2iv(v) bind(c, name='glVertex2iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine glvertex2iv

            ! void glVertex2sv(const GLshort *v)
            subroutine glvertex2sv(v) bind(c, name='glVertex2sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glvertex2sv

            ! void glVertex3dv(const GLdouble *v)
            subroutine glvertex3dv(v) bind(c, name='glVertex3dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glvertex3dv

            ! void glVertex3fv(const GLfloat *v)
            subroutine glvertex3fv(v) bind(c, name='glVertex3fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glvertex3fv

            ! void glVertex3iv(const GLint *v)
            subroutine glvertex3iv(v) bind(c, name='glVertex3iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine glvertex3iv

            ! void glVertex3sv(const GLshort *v)
            subroutine glvertex3sv(v) bind(c, name='glVertex3sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glvertex3sv

            ! void glVertex4dv(const GLdouble *v)
            subroutine glvertex4dv(v) bind(c, name='glVertex4dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glvertex4dv

            ! void glVertex4fv(const GLfloat *v)
            subroutine glvertex4fv(v) bind(c, name='glVertex4fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glvertex4fv

            ! void glVertex4iv(const GLint *v)
            subroutine glvertex4iv(v) bind(c, name='glVertex4iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine glvertex4iv

            ! void glVertex4sv(const GLshort *v)
            subroutine glvertex4sv(v) bind(c, name='glVertex4sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glvertex4sv

            ! void glNormal3b(GLbyte nx, GLbyte ny, GLbyte nz)
            subroutine glnormal3b(nx, ny, nz) bind(c, name='glNormal3b')
                  import :: GLbyte
                  integer(kind=GLbyte), intent(in), value :: nx
                  integer(kind=GLbyte), intent(in), value :: ny
                  integer(kind=GLbyte), intent(in), value :: nz
            end subroutine glnormal3b

            ! void glNormal3d(GLdouble nx, GLdouble ny, GLdouble nz)
            subroutine glnormal3d(nx, ny, nz) bind(c, name='glNormal3d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: nx
                  real(kind=GLdouble), intent(in), value :: ny
                  real(kind=GLdouble), intent(in), value :: nz
            end subroutine glnormal3d

            ! void glNormal3f(GLfloat nx, GLfloat ny, GLfloat nz)
            subroutine glnormal3f(nx, ny, nz) bind(c, name='glNormal3f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: nx
                  real(kind=GLfloat), intent(in), value :: ny
                  real(kind=GLfloat), intent(in), value :: nz
            end subroutine glnormal3f

            ! void glNormal3i(GLint nx, GLint ny, GLint nz)
            subroutine glnormal3i(nx, ny, nz) bind(c, name='glNormal3i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: nx
                  integer(kind=GLint), intent(in), value :: ny
                  integer(kind=GLint), intent(in), value :: nz
            end subroutine glnormal3i

            ! void glNormal3s(GLshort nx, GLshort ny, GLshort nz)
            subroutine glnormal3s(nx, ny, nz) bind(c, name='glNormal3s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: nx
                  integer(kind=GLshort), intent(in), value :: ny
                  integer(kind=GLshort), intent(in), value :: nz
            end subroutine glnormal3s

            ! void glNormal3bv(const GLbyte *v)
            subroutine glnormal3bv(v) bind(c, name='glNormal3bv')
                  import :: GLbyte
                  integer(kind=GLbyte), intent(in) :: v
            end subroutine glnormal3bv

            ! void glNormal3dv(const GLdouble *v)
            subroutine glnormal3dv(v) bind(c, name='glNormal3dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glnormal3dv

            ! void glNormal3fv(const GLfloat *v)
            subroutine glnormal3fv(v) bind(c, name='glNormal3fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glnormal3fv

            ! void glNormal3iv(const GLint *v)
            subroutine glnormal3iv(v) bind(c, name='glNormal3iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine glnormal3iv

            ! void glNormal3sv(const GLshort *v)
            subroutine glnormal3sv(v) bind(c, name='glNormal3sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glnormal3sv

            ! void glIndexd(GLdouble c)
            subroutine glindexd(c) bind(c, name='glIndexd')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: c
            end subroutine glindexd

            ! void glIndexf(GLfloat c)
            subroutine glindexf(c) bind(c, name='glIndexf')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: c
            end subroutine glindexf

            ! void glIndexi(GLint c)
            subroutine glindexi(c) bind(c, name='glIndexi')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: c
            end subroutine glindexi

            ! void glIndexs(GLshort c)
            subroutine glindexs(c) bind(c, name='glIndexs')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: c
            end subroutine glindexs

            ! void glIndexub(GLubyte c)
            subroutine glindexub(c) bind(c, name='glIndexub')
                  import :: GLubyte
                  integer(kind=GLubyte), intent(in), value :: c
            end subroutine glindexub

            ! void glIndexdv(const GLdouble *c)
            subroutine glindexdv(c) bind(c, name='glIndexdv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: c
            end subroutine glindexdv

            ! void glIndexfv(const GLfloat *c)
            subroutine glindexfv(c) bind(c, name='glIndexfv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: c
            end subroutine glindexfv

            ! void glIndexiv(const GLint *c)
            subroutine glindexiv(c) bind(c, name='glIndexiv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: c
            end subroutine glindexiv

            ! void glIndexsv(const GLshort *c)
            subroutine glindexsv(c) bind(c, name='glIndexsv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: c
            end subroutine glindexsv

            ! void glIndexubv(const GLubyte *c)
            subroutine glindexubv(c) bind(c, name='glIndexubv')
                  import :: GLubyte
                  integer(kind=GLubyte), intent(in) :: c
            end subroutine glindexubv

            ! void glColor3b(GLbyte red, GLbyte green, GLbyte blue)
            subroutine glcolor3b(red, green, blue) bind(c, name='glColor3b')
                  import :: GLbyte
                  integer(kind=GLbyte), intent(in), value :: red
                  integer(kind=GLbyte), intent(in), value :: green
                  integer(kind=GLbyte), intent(in), value :: blue
            end subroutine glcolor3b

            ! void glColor3d(GLdouble red, GLdouble green, GLdouble blue)
            subroutine glcolor3d(red, green, blue) bind(c, name='glColor3d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: red
                  real(kind=GLdouble), intent(in), value :: green
                  real(kind=GLdouble), intent(in), value :: blue
            end subroutine glcolor3d

            ! void glColor3f(GLfloat red, GLfloat green, GLfloat blue)
            subroutine glcolor3f(red, green, blue) bind(c, name='glColor3f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: red
                  real(kind=GLfloat), intent(in), value :: green
                  real(kind=GLfloat), intent(in), value :: blue
            end subroutine glcolor3f

            ! void glColor3i(GLint red, GLint green, GLint blue)
            subroutine glcolor3i(red, green, blue) bind(c, name='glColor3i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: red
                  integer(kind=GLint), intent(in), value :: green
                  integer(kind=GLint), intent(in), value :: blue
            end subroutine glcolor3i

            ! void glColor3s(GLshort red, GLshort green, GLshort blue)
            subroutine glcolor3s(red, green, blue) bind(c, name='glColor3s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: red
                  integer(kind=GLshort), intent(in), value :: green
                  integer(kind=GLshort), intent(in), value :: blue
            end subroutine glcolor3s

            ! void glColor3ub(GLubyte red, GLubyte green, GLubyte blue)
            subroutine glcolor3ub(red, green, blue) bind(c, name='glColor3ub')
                  import :: GLubyte
                  integer(kind=GLubyte), intent(in), value :: red
                  integer(kind=GLubyte), intent(in), value :: green
                  integer(kind=GLubyte), intent(in), value :: blue
            end subroutine glcolor3ub

            ! void glColor3ui(GLuint red, GLuint green, GLuint blue)
            subroutine glcolor3ui(red, green, blue) bind(c, name='glColor3ui')
                  import :: GLuint
                  integer(kind=GLuint), intent(in), value :: red
                  integer(kind=GLuint), intent(in), value :: green
                  integer(kind=GLuint), intent(in), value :: blue
            end subroutine glcolor3ui

            ! void glColor3us(GLushort red, GLushort green, GLushort blue)
            subroutine glcolor3us(red, green, blue) bind(c, name='glColor3us')
                  import :: GLushort
                  integer(kind=GLushort), intent(in), value :: red
                  integer(kind=GLushort), intent(in), value :: green
                  integer(kind=GLushort), intent(in), value :: blue
            end subroutine glcolor3us

            ! void glColor4b(GLbyte red, GLbyte green, GLbyte blue, GLbyte alpha)
            subroutine glcolor4b(red, green, blue, alpha) bind(c, name='glColor4b')
                  import :: GLbyte
                  integer(kind=GLbyte), intent(in), value :: red
                  integer(kind=GLbyte), intent(in), value :: green
                  integer(kind=GLbyte), intent(in), value :: blue
                  integer(kind=GLbyte), intent(in), value :: alpha
            end subroutine glcolor4b

            ! void glColor4d(GLdouble red, GLdouble green, GLdouble blue, GLdouble alpha)
            subroutine glcolor4d(red, green, blue, alpha) bind(c, name='glColor4d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: red
                  real(kind=GLdouble), intent(in), value :: green
                  real(kind=GLdouble), intent(in), value :: blue
                  real(kind=GLdouble), intent(in), value :: alpha
            end subroutine glcolor4d

            ! void glColor4f(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
            subroutine glcolor4f(red, green, blue, alpha) bind(c, name='glColor4f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: red
                  real(kind=GLfloat), intent(in), value :: green
                  real(kind=GLfloat), intent(in), value :: blue
                  real(kind=GLfloat), intent(in), value :: alpha
            end subroutine glcolor4f

            ! void glColor4i(GLint red, GLint green, GLint blue, GLint alpha)
            subroutine glcolor4i(red, green, blue, alpha) bind(c, name='glColor4i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: red
                  integer(kind=GLint), intent(in), value :: green
                  integer(kind=GLint), intent(in), value :: blue
                  integer(kind=GLint), intent(in), value :: alpha
            end subroutine glcolor4i

            ! void glColor4s(GLshort red, GLshort green, GLshort blue, GLshort alpha)
            subroutine glcolor4s(red, green, blue, alpha) bind(c, name='glColor4s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: red
                  integer(kind=GLshort), intent(in), value :: green
                  integer(kind=GLshort), intent(in), value :: blue
                  integer(kind=GLshort), intent(in), value :: alpha
            end subroutine glcolor4s

            ! void glColor4ub(GLubyte red, GLubyte green, GLubyte blue, GLubyte alpha)
            subroutine glcolor4ub(red, green, blue, alpha) bind(c, name='glColor4ub')
                  import :: GLubyte
                  integer(kind=GLubyte), intent(in), value :: red
                  integer(kind=GLubyte), intent(in), value :: green
                  integer(kind=GLubyte), intent(in), value :: blue
                  integer(kind=GLubyte), intent(in), value :: alpha
            end subroutine glcolor4ub

            ! void glColor4ui(GLuint red, GLuint green, GLuint blue, GLuint alpha)
            subroutine glcolor4ui(red, green, blue, alpha) bind(c, name='glColor4ui')
                  import :: GLuint
                  integer(kind=GLuint), intent(in), value :: red
                  integer(kind=GLuint), intent(in), value :: green
                  integer(kind=GLuint), intent(in), value :: blue
                  integer(kind=GLuint), intent(in), value :: alpha
            end subroutine glcolor4ui

            ! void glColor4us(GLushort red, GLushort green, GLushort blue, GLushort alpha)
            subroutine glcolor4us(red, green, blue, alpha) bind(c, name='glColor4us')
                  import :: GLushort
                  integer(kind=GLushort), intent(in), value :: red
                  integer(kind=GLushort), intent(in), value :: green
                  integer(kind=GLushort), intent(in), value :: blue
                  integer(kind=GLushort), intent(in), value :: alpha
            end subroutine glcolor4us

            ! void glColor3bv(const GLbyte *v)
            subroutine glcolor3bv(v) bind(c, name='glColor3bv')
                  import :: GLbyte
                  integer(kind=GLbyte), intent(in) :: v
            end subroutine glcolor3bv

            ! void glColor3dv(const GLdouble *v)
            subroutine glcolor3dv(v) bind(c, name='glColor3dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glcolor3dv

            ! void glColor3fv(const GLfloat *v)
            subroutine glcolor3fv(v) bind(c, name='glColor3fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glcolor3fv

            ! void glColor3iv(const GLint *v)
            subroutine glcolor3iv(v) bind(c, name='glColor3iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine glcolor3iv

            ! void glColor3sv(const GLshort *v)
            subroutine glcolor3sv(v) bind(c, name='glColor3sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glcolor3sv

            ! void glColor3ubv(const GLubyte *v)
            subroutine glcolor3ubv(v) bind(c, name='glColor3ubv')
                  import :: GLubyte
                  integer(kind=GLubyte), intent(in) :: v
            end subroutine glcolor3ubv

            ! void glColor3uiv(const GLuint *v)
            subroutine glcolor3uiv(v) bind(c, name='glColor3uiv')
                  import :: GLuint
                  integer(kind=GLuint), intent(in) :: v
            end subroutine glcolor3uiv

            ! void glColor3usv(const GLushort *v)
            subroutine glcolor3usv(v) bind(c, name='glColor3usv')
                  import :: GLushort
                  integer(kind=GLushort), intent(in) :: v
            end subroutine glcolor3usv

            ! void glColor4bv(const GLbyte *v)
            subroutine glcolor4bv(v) bind(c, name='glColor4bv')
                  import :: GLbyte
                  integer(kind=GLbyte), intent(in) :: v
            end subroutine glcolor4bv

            ! void glColor4dv(const GLdouble *v)
            subroutine glcolor4dv(v) bind(c, name='glColor4dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glcolor4dv

            ! void glColor4fv(const GLfloat *v)
            subroutine glcolor4fv(v) bind(c, name='glColor4fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glcolor4fv

            ! void glColor4iv(const GLint *v)
            subroutine glcolor4iv(v) bind(c, name='glColor4iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine glcolor4iv

            ! void glColor4sv(const GLshort *v)
            subroutine glcolor4sv(v) bind(c, name='glColor4sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glcolor4sv

            ! void glColor4ubv(const GLubyte *v)
            subroutine glcolor4ubv(v) bind(c, name='glColor4ubv')
                  import :: GLubyte
                  integer(kind=GLubyte), intent(in) :: v
            end subroutine glcolor4ubv

            ! void glColor4uiv(const GLuint *v)
            subroutine glcolor4uiv(v) bind(c, name='glColor4uiv')
                  import :: GLuint
                  integer(kind=GLuint), intent(in) :: v
            end subroutine glcolor4uiv

            ! void glColor4usv(const GLushort *v)
            subroutine glcolor4usv(v) bind(c, name='glColor4usv')
                  import :: GLushort
                  integer(kind=GLushort), intent(in) :: v
            end subroutine glcolor4usv

            ! void glTexCoord1d(GLdouble s)
            subroutine gltexcoord1d(s) bind(c, name='glTexCoord1d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: s
            end subroutine gltexcoord1d

            ! void glTexCoord1f(GLfloat s)
            subroutine gltexcoord1f(s) bind(c, name='glTexCoord1f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: s
            end subroutine gltexcoord1f

            ! void glTexCoord1i(GLint s)
            subroutine gltexcoord1i(s) bind(c, name='glTexCoord1i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: s
            end subroutine gltexcoord1i

            ! void glTexCoord1s(GLshort s)
            subroutine gltexcoord1s(s) bind(c, name='glTexCoord1s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: s
            end subroutine gltexcoord1s

            ! void glTexCoord2d(GLdouble s, GLdouble t)
            subroutine gltexcoord2d(s, t) bind(c, name='glTexCoord2d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: s
                  real(kind=GLdouble), intent(in), value :: t
            end subroutine gltexcoord2d

            ! void glTexCoord2f(GLfloat s, GLfloat t)
            subroutine gltexcoord2f(s, t) bind(c, name='glTexCoord2f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: s
                  real(kind=GLfloat), intent(in), value :: t
            end subroutine gltexcoord2f

            ! void glTexCoord2i(GLint s, GLint t)
            subroutine gltexcoord2i(s, t) bind(c, name='glTexCoord2i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: s
                  integer(kind=GLint), intent(in), value :: t
            end subroutine gltexcoord2i

            ! void glTexCoord2s(GLshort s, GLshort t)
            subroutine gltexcoord2s(s, t) bind(c, name='glTexCoord2s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: s
                  integer(kind=GLshort), intent(in), value :: t
            end subroutine gltexcoord2s

            ! void glTexCoord3d(GLdouble s, GLdouble t, GLdouble r)
            subroutine gltexcoord3d(s, t, r) bind(c, name='glTexCoord3d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: s
                  real(kind=GLdouble), intent(in), value :: t
                  real(kind=GLdouble), intent(in), value :: r
            end subroutine gltexcoord3d

            ! void glTexCoord3f(GLfloat s, GLfloat t, GLfloat r)
            subroutine gltexcoord3f(s, t, r) bind(c, name='glTexCoord3f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: s
                  real(kind=GLfloat), intent(in), value :: t
                  real(kind=GLfloat), intent(in), value :: r
            end subroutine gltexcoord3f

            ! void glTexCoord3i(GLint s, GLint t, GLint r)
            subroutine gltexcoord3i(s, t, r) bind(c, name='glTexCoord3i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: s
                  integer(kind=GLint), intent(in), value :: t
                  integer(kind=GLint), intent(in), value :: r
            end subroutine gltexcoord3i

            ! void glTexCoord3s(GLshort s, GLshort t, GLshort r)
            subroutine gltexcoord3s(s, t, r) bind(c, name='glTexCoord3s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: s
                  integer(kind=GLshort), intent(in), value :: t
                  integer(kind=GLshort), intent(in), value :: r
            end subroutine gltexcoord3s

            ! void glTexCoord4d(GLdouble s, GLdouble t, GLdouble r, GLdouble q)
            subroutine gltexcoord4d(s, t, r, q) bind(c, name='glTexCoord4d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: s
                  real(kind=GLdouble), intent(in), value :: t
                  real(kind=GLdouble), intent(in), value :: r
                  real(kind=GLdouble), intent(in), value :: q
            end subroutine gltexcoord4d

            ! void glTexCoord4f(GLfloat s, GLfloat t, GLfloat r, GLfloat q)
            subroutine gltexcoord4f(s, t, r, q) bind(c, name='glTexCoord4f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: s
                  real(kind=GLfloat), intent(in), value :: t
                  real(kind=GLfloat), intent(in), value :: r
                  real(kind=GLfloat), intent(in), value :: q
            end subroutine gltexcoord4f

            ! void glTexCoord4i(GLint s, GLint t, GLint r, GLint q)
            subroutine gltexcoord4i(s, t, r, q) bind(c, name='glTexCoord4i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: s
                  integer(kind=GLint), intent(in), value :: t
                  integer(kind=GLint), intent(in), value :: r
                  integer(kind=GLint), intent(in), value :: q
            end subroutine gltexcoord4i

            ! void glTexCoord4s(GLshort s, GLshort t, GLshort r, GLshort q)
            subroutine gltexcoord4s(s, t, r, q) bind(c, name='glTexCoord4s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: s
                  integer(kind=GLshort), intent(in), value :: t
                  integer(kind=GLshort), intent(in), value :: r
                  integer(kind=GLshort), intent(in), value :: q
            end subroutine gltexcoord4s

            ! void glTexCoord1dv(const GLdouble *v)
            subroutine gltexcoord1dv(v) bind(c, name='glTexCoord1dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine gltexcoord1dv

            ! void glTexCoord1fv(const GLfloat *v)
            subroutine gltexcoord1fv(v) bind(c, name='glTexCoord1fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine gltexcoord1fv

            ! void glTexCoord1iv(const GLint *v)
            subroutine gltexcoord1iv(v) bind(c, name='glTexCoord1iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine gltexcoord1iv

            ! void glTexCoord1sv(const GLshort *v)
            subroutine gltexcoord1sv(v) bind(c, name='glTexCoord1sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine gltexcoord1sv

            ! void glTexCoord2dv(const GLdouble *v)
            subroutine gltexcoord2dv(v) bind(c, name='glTexCoord2dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine gltexcoord2dv

            ! void glTexCoord2fv(const GLfloat *v)
            subroutine gltexcoord2fv(v) bind(c, name='glTexCoord2fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine gltexcoord2fv

            ! void glTexCoord2iv(const GLint *v)
            subroutine gltexcoord2iv(v) bind(c, name='glTexCoord2iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine gltexcoord2iv

            ! void glTexCoord2sv(const GLshort *v)
            subroutine gltexcoord2sv(v) bind(c, name='glTexCoord2sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine gltexcoord2sv

            ! void glTexCoord3dv(const GLdouble *v)
            subroutine gltexcoord3dv(v) bind(c, name='glTexCoord3dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine gltexcoord3dv

            ! void glTexCoord3fv(const GLfloat *v)
            subroutine gltexcoord3fv(v) bind(c, name='glTexCoord3fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine gltexcoord3fv

            ! void glTexCoord3iv(const GLint *v)
            subroutine gltexcoord3iv(v) bind(c, name='glTexCoord3iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine gltexcoord3iv

            ! void glTexCoord3sv(const GLshort *v)
            subroutine gltexcoord3sv(v) bind(c, name='glTexCoord3sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine gltexcoord3sv

            ! void glTexCoord4dv(const GLdouble *v)
            subroutine gltexcoord4dv(v) bind(c, name='glTexCoord4dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine gltexcoord4dv

            ! void glTexCoord4fv(const GLfloat *v)
            subroutine gltexcoord4fv(v) bind(c, name='glTexCoord4fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine gltexcoord4fv

            ! void glTexCoord4iv(const GLint *v)
            subroutine gltexcoord4iv(v) bind(c, name='glTexCoord4iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine gltexcoord4iv

            ! void glTexCoord4sv(const GLshort *v)
            subroutine gltexcoord4sv(v) bind(c, name='glTexCoord4sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine gltexcoord4sv

            ! void glRasterPos2d(GLdouble x, GLdouble y)
            subroutine glrasterpos2d(x, y) bind(c, name='glRasterPos2d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: x
                  real(kind=GLdouble), intent(in), value :: y
            end subroutine glrasterpos2d

            ! void glRasterPos2f(GLfloat x, GLfloat y)
            subroutine glrasterpos2f(x, y) bind(c, name='glRasterPos2f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: x
                  real(kind=GLfloat), intent(in), value :: y
            end subroutine glrasterpos2f

            ! void glRasterPos2i(GLint x, GLint y)
            subroutine glrasterpos2i(x, y) bind(c, name='glRasterPos2i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: x
                  integer(kind=GLint), intent(in), value :: y
            end subroutine glrasterpos2i

            ! void glRasterPos2s(GLshort x, GLshort y)
            subroutine glrasterpos2s(x, y) bind(c, name='glRasterPos2s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: x
                  integer(kind=GLshort), intent(in), value :: y
            end subroutine glrasterpos2s

            ! void glRasterPos3d(GLdouble x, GLdouble y, GLdouble z)
            subroutine glrasterpos3d(x, y, z) bind(c, name='glRasterPos3d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: x
                  real(kind=GLdouble), intent(in), value :: y
                  real(kind=GLdouble), intent(in), value :: z
            end subroutine glrasterpos3d

            ! void glRasterPos3f(GLfloat x, GLfloat y, GLfloat z)
            subroutine glrasterpos3f(x, y, z) bind(c, name='glRasterPos3f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: x
                  real(kind=GLfloat), intent(in), value :: y
                  real(kind=GLfloat), intent(in), value :: z
            end subroutine glrasterpos3f

            ! void glRasterPos3i(GLint x, GLint y, GLint z)
            subroutine glrasterpos3i(x, y, z) bind(c, name='glRasterPos3i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: x
                  integer(kind=GLint), intent(in), value :: y
                  integer(kind=GLint), intent(in), value :: z
            end subroutine glrasterpos3i

            ! void glRasterPos3s(GLshort x, GLshort y, GLshort z)
            subroutine glrasterpos3s(x, y, z) bind(c, name='glRasterPos3s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: x
                  integer(kind=GLshort), intent(in), value :: y
                  integer(kind=GLshort), intent(in), value :: z
            end subroutine glrasterpos3s

            ! void glRasterPos4d(GLdouble x, GLdouble y, GLdouble z, GLdouble w)
            subroutine glrasterpos4d(x, y, z, w) bind(c, name='glRasterPos4d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: x
                  real(kind=GLdouble), intent(in), value :: y
                  real(kind=GLdouble), intent(in), value :: z
                  real(kind=GLdouble), intent(in), value :: w
            end subroutine glrasterpos4d

            ! void glRasterPos4f(GLfloat x, GLfloat y, GLfloat z, GLfloat w)
            subroutine glrasterpos4f(x, y, z, w) bind(c, name='glRasterPos4f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: x
                  real(kind=GLfloat), intent(in), value :: y
                  real(kind=GLfloat), intent(in), value :: z
                  real(kind=GLfloat), intent(in), value :: w
            end subroutine glrasterpos4f

            ! void glRasterPos4i(GLint x, GLint y, GLint z, GLint w)
            subroutine glrasterpos4i(x, y, z, w) bind(c, name='glRasterPos4i')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: x
                  integer(kind=GLint), intent(in), value :: y
                  integer(kind=GLint), intent(in), value :: z
                  integer(kind=GLint), intent(in), value :: w
            end subroutine glrasterpos4i

            ! void glRasterPos4s(GLshort x, GLshort y, GLshort z, GLshort w)
            subroutine glrasterpos4s(x, y, z, w) bind(c, name='glRasterPos4s')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: x
                  integer(kind=GLshort), intent(in), value :: y
                  integer(kind=GLshort), intent(in), value :: z
                  integer(kind=GLshort), intent(in), value :: w
            end subroutine glrasterpos4s

            ! void glRasterPos2dv(const GLdouble *v)
            subroutine glrasterpos2dv(v) bind(c, name='glRasterPos2dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glrasterpos2dv

            ! void glRasterPos2fv(const GLfloat *v)
            subroutine glrasterpos2fv(v) bind(c, name='glRasterPos2fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glrasterpos2fv

            ! void glRasterPos2iv(const GLint *v)
            subroutine glrasterpos2iv(v) bind(c, name='glRasterPos2iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine glrasterpos2iv

            ! void glRasterPos2sv(const GLshort *v)
            subroutine glrasterpos2sv(v) bind(c, name='glRasterPos2sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glrasterpos2sv

            ! void glRasterPos3dv(const GLdouble *v)
            subroutine glrasterpos3dv(v) bind(c, name='glRasterPos3dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glrasterpos3dv

            ! void glRasterPos3fv(const GLfloat *v)
            subroutine glrasterpos3fv(v) bind(c, name='glRasterPos3fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glrasterpos3fv

            ! void glRasterPos3iv(const GLint *v)
            subroutine glrasterpos3iv(v) bind(c, name='glRasterPos3iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine glrasterpos3iv

            ! void glRasterPos3sv(const GLshort *v)
            subroutine glrasterpos3sv(v) bind(c, name='glRasterPos3sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glrasterpos3sv

            ! void glRasterPos4dv(const GLdouble *v)
            subroutine glrasterpos4dv(v) bind(c, name='glRasterPos4dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glrasterpos4dv

            ! void glRasterPos4fv(const GLfloat *v)
            subroutine glrasterpos4fv(v) bind(c, name='glRasterPos4fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glrasterpos4fv

            ! void glRasterPos4iv(const GLint *v)
            subroutine glrasterpos4iv(v) bind(c, name='glRasterPos4iv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v
            end subroutine glrasterpos4iv

            ! void glRasterPos4sv(const GLshort *v)
            subroutine glrasterpos4sv(v) bind(c, name='glRasterPos4sv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glrasterpos4sv

            ! void glRectd(GLdouble x1, GLdouble y1, GLdouble x2, GLdouble y2)
            subroutine glrectd(x1, y1, x2, y2) bind(c, name='glRectd')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: x1
                  real(kind=GLdouble), intent(in), value :: y1
                  real(kind=GLdouble), intent(in), value :: x2
                  real(kind=GLdouble), intent(in), value :: y2
            end subroutine glrectd

            ! void glRectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2)
            subroutine glrectf(x1, y1, x2, y2) bind(c, name='glRectf')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: x1
                  real(kind=GLfloat), intent(in), value :: y1
                  real(kind=GLfloat), intent(in), value :: x2
                  real(kind=GLfloat), intent(in), value :: y2
            end subroutine glrectf

            ! void glRecti(GLint x1, GLint y1, GLint x2, GLint y2)
            subroutine glrecti(x1, y1, x2, y2) bind(c, name='glRecti')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: x1
                  integer(kind=GLint), intent(in), value :: y1
                  integer(kind=GLint), intent(in), value :: x2
                  integer(kind=GLint), intent(in), value :: y2
            end subroutine glrecti

            ! void glRects(GLshort x1, GLshort y1, GLshort x2, GLshort y2)
            subroutine glrects(x1, y1, x2, y2) bind(c, name='glRects')
                  import :: GLshort
                  integer(kind=GLshort), intent(in), value :: x1
                  integer(kind=GLshort), intent(in), value :: y1
                  integer(kind=GLshort), intent(in), value :: x2
                  integer(kind=GLshort), intent(in), value :: y2
            end subroutine glrects

            ! void glRectdv(const GLdouble *v1, const GLdouble *v2)
            subroutine glrectdv(v1, v2) bind(c, name='glRectdv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: v1
                  real(kind=GLdouble), intent(in) :: v2
            end subroutine glrectdv

            ! void glRectfv(const GLfloat *v1, const GLfloat *v2)
            subroutine glrectfv(v1, v2) bind(c, name='glRectfv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: v1
                  real(kind=GLfloat), intent(in) :: v2
            end subroutine glrectfv

            ! void glRectiv(const GLint *v1, const GLint *v2)
            subroutine glrectiv(v1, v2) bind(c, name='glRectiv')
                  import :: GLint
                  integer(kind=GLint), intent(in) :: v1
                  integer(kind=GLint), intent(in) :: v2
            end subroutine glrectiv

            ! void glRectsv(const GLshort *v1, const GLshort *v2)
            subroutine glrectsv(v1, v2) bind(c, name='glRectsv')
                  import :: GLshort
                  integer(kind=GLshort), intent(in) :: v1
                  integer(kind=GLshort), intent(in) :: v2
            end subroutine glrectsv

            ! void glVertexPointer(GLint size, GLenum type, GLsizei stride, const GLvoid *ptr)
            subroutine glvertexpointer(size, type, stride, ptr) bind(c, name='glVertexPointer')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLint),   intent(in), value :: size
                  integer(kind=GLenum),  intent(in), value :: type
                  integer(kind=GLsizei), intent(in), value :: stride
                  type(c_ptr),           intent(in), value :: ptr
            end subroutine glvertexpointer

            ! void glNormalPointer(GLenum type, GLsizei stride, const GLvoid *ptr)
            subroutine glnormalpointer(type, stride, ptr) bind(c, name='glNormalPointer')
                  import :: GLenum, GLsizei, c_ptr
                  integer(kind=GLenum),  intent(in), value :: type
                  integer(kind=GLsizei), intent(in), value :: stride
                  type(c_ptr),           intent(in), value :: ptr
            end subroutine glnormalpointer

            ! void glColorPointer(GLint size, GLenum type, GLsizei stride, const GLvoid *ptr)
            subroutine glcolorpointer(size, type, stride, ptr) bind(c, name='glColorPointer')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLint),   intent(in), value :: size
                  integer(kind=GLenum),  intent(in), value :: type
                  integer(kind=GLsizei), intent(in), value :: stride
                  type(c_ptr),           intent(in), value :: ptr
            end subroutine glcolorpointer

            ! void glIndexPointer(GLenum type, GLsizei stride, const GLvoid *ptr)
            subroutine glindexpointer(type, stride, ptr) bind(c, name='glIndexPointer')
                  import :: GLenum, GLsizei, c_ptr
                  integer(kind=GLenum),  intent(in), value :: type
                  integer(kind=GLsizei), intent(in), value :: stride
                  type(c_ptr),           intent(in), value :: ptr
            end subroutine glindexpointer

            ! void glTexCoordPointer(GLint size, GLenum type, GLsizei stride, const GLvoid *ptr)
            subroutine gltexcoordpointer(size, type, stride, ptr) bind(c, name='glTexCoordPointer')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLint),   intent(in), value :: size
                  integer(kind=GLenum),  intent(in), value :: type
                  integer(kind=GLsizei), intent(in), value :: stride
                  type(c_ptr),           intent(in), value :: ptr
            end subroutine gltexcoordpointer

            ! void glEdgeFlagPointer(GLsizei stride, const GLvoid *ptr)
            subroutine gledgeflagpointer(stride, ptr) bind(c, name='glEdgeFlagPointer')
                  import :: GLsizei, c_ptr
                  integer(kind=GLsizei), intent(in), value :: stride
                  type(c_ptr),           intent(in), value :: ptr
            end subroutine gledgeflagpointer

            ! void glGetPointerv(GLenum pname, GLvoid **params)
            subroutine glgetpointerv(pname, params) bind(c, name='glGetPointerv')
                  import :: GLenum, c_ptr
                  integer(kind=GLenum), intent(in), value :: pname
                  type(c_ptr),          intent(in)        :: params
            end subroutine glgetpointerv

            ! void glArrayElement(GLint i)
            subroutine glarrayelement(i) bind(c, name='glArrayElement')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: i
            end subroutine glarrayelement

            ! void glDrawArrays(GLenum mode, GLint first, GLsizei count)
            subroutine gldrawarrays(mode, first, count) bind(c, name='glDrawArrays')
                  import :: GLenum, GLint, GLsizei
                  integer(kind=GLenum),  intent(in), value :: mode
                  integer(kind=GLint),   intent(in), value :: first
                  integer(kind=GLsizei), intent(in), value :: count
            end subroutine gldrawarrays

            ! void glDrawElements(GLenum mode, GLsizei count, GLenum type, const GLvoid *indices)
            subroutine gldrawelements(mode, count, type, indices) bind(c, name='glDrawElements')
                  import :: GLenum, GLsizei, c_ptr
                  integer(kind=GLenum),  intent(in), value :: mode
                  integer(kind=GLsizei), intent(in), value :: count
                  integer(kind=GLenum),  intent(in), value :: type
                  type(c_ptr),           intent(in), value :: indices
            end subroutine gldrawelements

            ! void glInterleavedArrays(GLenum format, GLsizei stride, const GLvoid *pointer)
            subroutine glinterleavedarrays(format, stride, pointer) bind(c, name='glInterleavedArrays')
                  import :: GLenum, GLsizei, c_ptr
                  integer(kind=GLenum),  intent(in), value :: format
                  integer(kind=GLsizei), intent(in), value :: stride
                  type(c_ptr),           intent(in), value :: pointer
            end subroutine glinterleavedarrays

            ! void glShadeModel(GLenum mode)
            subroutine glshademodel(mode) bind(c, name='glShadeModel')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: mode
            end subroutine glshademodel

            ! void glLightf(GLenum light, GLenum pname, GLfloat param)
            subroutine gllightf(light, pname, param) bind(c, name='glLightf')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: light
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in), value :: param
            end subroutine gllightf

            ! void glLighti(GLenum light, GLenum pname, GLint param)
            subroutine gllighti(light, pname, param) bind(c, name='glLighti')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: light
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in), value :: param
            end subroutine gllighti

            ! void glLightfv(GLenum light, GLenum pname, const GLfloat *params)
            subroutine gllightfv(light, pname, params) bind(c, name='glLightfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: light
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine gllightfv

            ! void glLightiv(GLenum light, GLenum pname, const GLint *params)
            subroutine gllightiv(light, pname, params) bind(c, name='glLightiv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: light
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine gllightiv

            ! void glGetLightfv(GLenum light, GLenum pname, GLfloat *params)
            subroutine glgetlightfv(light, pname, params) bind(c, name='glGetLightfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: light
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine glgetlightfv

            ! void glGetLightiv(GLenum light, GLenum pname, GLint *params)
            subroutine glgetlightiv(light, pname, params) bind(c, name='glGetLightiv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: light
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine glgetlightiv

            ! void glLightModelf(GLenum pname, GLfloat param)
            subroutine gllightmodelf(pname, param) bind(c, name='glLightModelf')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in), value :: param
            end subroutine gllightmodelf

            ! void glLightModeli(GLenum pname, GLint param)
            subroutine gllightmodeli(pname, param) bind(c, name='glLightModeli')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in), value :: param
            end subroutine gllightmodeli

            ! void glLightModelfv(GLenum pname, const GLfloat *params)
            subroutine gllightmodelfv(pname, params) bind(c, name='glLightModelfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine gllightmodelfv

            ! void glLightModeliv(GLenum pname, const GLint *params)
            subroutine gllightmodeliv(pname, params) bind(c, name='glLightModeliv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine gllightmodeliv

            ! void glMaterialf(GLenum face, GLenum pname, GLfloat param)
            subroutine glmaterialf(face, pname, param) bind(c, name='glMaterialf')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: face
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in), value :: param
            end subroutine glmaterialf

            ! void glMateriali(GLenum face, GLenum pname, GLint param)
            subroutine glmateriali(face, pname, param) bind(c, name='glMateriali')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: face
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in), value :: param
            end subroutine glmateriali

            ! void glMaterialfv(GLenum face, GLenum pname, const GLfloat *params)
            subroutine glmaterialfv(face, pname, params) bind(c, name='glMaterialfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: face
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine glmaterialfv

            ! void glMaterialiv(GLenum face, GLenum pname, const GLint *params)
            subroutine glmaterialiv(face, pname, params) bind(c, name='glMaterialiv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: face
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine glmaterialiv

            ! void glGetMaterialfv(GLenum face, GLenum pname, GLfloat *params)
            subroutine glgetmaterialfv(face, pname, params) bind(c, name='glGetMaterialfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: face
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine glgetmaterialfv

            ! void glGetMaterialiv(GLenum face, GLenum pname, GLint *params)
            subroutine glgetmaterialiv(face, pname, params) bind(c, name='glGetMaterialiv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: face
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine glgetmaterialiv

            ! void glColorMaterial(GLenum face, GLenum mode)
            subroutine glcolormaterial(face, mode) bind(c, name='glColorMaterial')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: face
                  integer(kind=GLenum), intent(in), value :: mode
            end subroutine glcolormaterial

            ! void glPixelZoom(GLfloat xfactor, GLfloat yfactor)
            subroutine glpixelzoom(xfactor, yfactor) bind(c, name='glPixelZoom')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: xfactor
                  real(kind=GLfloat), intent(in), value :: yfactor
            end subroutine glpixelzoom

            ! void glPixelStoref(GLenum pname, GLfloat param)
            subroutine glpixelstoref(pname, param) bind(c, name='glPixelStoref')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in), value :: param
            end subroutine glpixelstoref

            ! void glPixelStorei(GLenum pname, GLint param)
            subroutine glpixelstorei(pname, param) bind(c, name='glPixelStorei')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in), value :: param
            end subroutine glpixelstorei

            ! void glPixelTransferf(GLenum pname, GLfloat param)
            subroutine glpixeltransferf(pname, param) bind(c, name='glPixelTransferf')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in), value :: param
            end subroutine glpixeltransferf

            ! void glPixelTransferi(GLenum pname, GLint param)
            subroutine glpixeltransferi(pname, param) bind(c, name='glPixelTransferi')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in), value :: param
            end subroutine glpixeltransferi

            ! void glPixelMapfv(GLenum map, GLsizei mapsize, const GLfloat *values)
            subroutine glpixelmapfv(map, mapsize, values) bind(c, name='glPixelMapfv')
                  import :: GLenum, GLfloat, GLsizei
                  integer(kind=GLenum),  intent(in), value :: map
                  integer(kind=GLsizei), intent(in), value :: mapsize
                  real(kind=GLfloat),    intent(in)        :: values
            end subroutine glpixelmapfv

            ! void glPixelMapuiv(GLenum map, GLsizei mapsize, const GLuint *values)
            subroutine glpixelmapuiv(map, mapsize, values) bind(c, name='glPixelMapuiv')
                  import :: GLenum, GLsizei, GLuint
                  integer(kind=GLenum),  intent(in), value :: map
                  integer(kind=GLsizei), intent(in), value :: mapsize
                  integer(kind=GLuint),  intent(in)        :: values
            end subroutine glpixelmapuiv

            ! void glPixelMapusv(GLenum map, GLsizei mapsize, const GLushort *values)
            subroutine glpixelmapusv(map, mapsize, values) bind(c, name='glPixelMapusv')
                  import :: GLenum, GLsizei, GLushort
                  integer(kind=GLenum),   intent(in), value :: map
                  integer(kind=GLsizei),  intent(in), value :: mapsize
                  integer(kind=GLushort), intent(in)        :: values
            end subroutine glpixelmapusv

            ! void glGetPixelMapfv(GLenum map, GLfloat *values)
            subroutine glgetpixelmapfv(map, values) bind(c, name='glGetPixelMapfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: map
                  real(kind=GLfloat),   intent(in)        :: values
            end subroutine glgetpixelmapfv

            ! void glGetPixelMapuiv(GLenum map, GLuint *values)
            subroutine glgetpixelmapuiv(map, values) bind(c, name='glGetPixelMapuiv')
                  import :: GLenum, GLuint
                  integer(kind=GLenum), intent(in), value :: map
                  integer(kind=GLuint), intent(in)        :: values
            end subroutine glgetpixelmapuiv

            ! void glGetPixelMapusv(GLenum map, GLushort *values)
            subroutine glgetpixelmapusv(map, values) bind(c, name='glGetPixelMapusv')
                  import :: GLenum, GLushort
                  integer(kind=GLenum),   intent(in), value :: map
                  integer(kind=GLushort), intent(in)        :: values
            end subroutine glgetpixelmapusv

            ! void glBitmap(GLsizei width, GLsizei height, GLfloat xorig, GLfloat yorig, GLfloat xmove, GLfloat ymove, const GLubyte *bitmap)
            subroutine glbitmap(width, height, xorig, yorig, xmove, ymove, bitmap) bind(c, name='glBitmap')
                  import :: GLfloat, GLsizei, GLubyte
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
                  real(kind=GLfloat),    intent(in), value :: xorig
                  real(kind=GLfloat),    intent(in), value :: yorig
                  real(kind=GLfloat),    intent(in), value :: xmove
                  real(kind=GLfloat),    intent(in), value :: ymove
                  integer(kind=GLubyte), intent(in)        :: bitmap
            end subroutine glbitmap

            ! void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
            subroutine glreadpixels(x, y, width, height, format, type, pixels) bind(c, name='glReadPixels')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLint),   intent(in), value :: x
                  integer(kind=GLint),   intent(in), value :: y
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
                  integer(kind=GLenum),  intent(in), value :: format
                  integer(kind=GLenum),  intent(in), value :: type
                  type(c_ptr),           intent(in), value :: pixels
            end subroutine glreadpixels

            ! void glDrawPixels(GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels)
            subroutine gldrawpixels(width, height, format, type, pixels) bind(c, name='glDrawPixels')
                  import :: GLenum, GLsizei, c_ptr
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
                  integer(kind=GLenum),  intent(in), value :: format
                  integer(kind=GLenum),  intent(in), value :: type
                  type(c_ptr),           intent(in), value :: pixels
            end subroutine gldrawpixels

            ! void glCopyPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum type)
            subroutine glcopypixels(x, y, width, height, type) bind(c, name='glCopyPixels')
                  import :: GLenum, GLint, GLsizei
                  integer(kind=GLint),   intent(in), value :: x
                  integer(kind=GLint),   intent(in), value :: y
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
                  integer(kind=GLenum),  intent(in), value :: type
            end subroutine glcopypixels

            ! void glStencilFunc(GLenum func, GLint ref, GLuint mask)
            subroutine glstencilfunc(func, ref, mask) bind(c, name='glStencilFunc')
                  import :: GLenum, GLint, GLuint
                  integer(kind=GLenum), intent(in), value :: func
                  integer(kind=GLint),  intent(in), value :: ref
                  integer(kind=GLuint), intent(in), value :: mask
            end subroutine glstencilfunc

            ! void glStencilMask(GLuint mask)
            subroutine glstencilmask(mask) bind(c, name='glStencilMask')
                  import :: GLuint
                  integer(kind=GLuint), intent(in), value :: mask
            end subroutine glstencilmask

            ! void glStencilOp(GLenum fail, GLenum zfail, GLenum zpass)
            subroutine glstencilop(fail, zfail, zpass) bind(c, name='glStencilOp')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: fail
                  integer(kind=GLenum), intent(in), value :: zfail
                  integer(kind=GLenum), intent(in), value :: zpass
            end subroutine glstencilop

            ! void glClearStencil(GLint s)
            subroutine glclearstencil(s) bind(c, name='glClearStencil')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: s
            end subroutine glclearstencil

            ! void glTexGend(GLenum coord, GLenum pname, GLdouble param)
            subroutine gltexgend(coord, pname, param) bind(c, name='glTexGend')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: coord
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLdouble),  intent(in), value :: param
            end subroutine gltexgend

            ! void glTexGenf(GLenum coord, GLenum pname, GLfloat param)
            subroutine gltexgenf(coord, pname, param) bind(c, name='glTexGenf')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: coord
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in), value :: param
            end subroutine gltexgenf

            ! void glTexGeni(GLenum coord, GLenum pname, GLint param)
            subroutine gltexgeni(coord, pname, param) bind(c, name='glTexGeni')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: coord
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in), value :: param
            end subroutine gltexgeni

            ! void glTexGendv(GLenum coord, GLenum pname, const GLdouble *params)
            subroutine gltexgendv(coord, pname, params) bind(c, name='glTexGendv')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: coord
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLdouble),  intent(in)        :: params(*)
            end subroutine gltexgendv

            ! void glTexGenfv(GLenum coord, GLenum pname, const GLfloat *params)
            subroutine gltexgenfv(coord, pname, params) bind(c, name='glTexGenfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: coord
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine gltexgenfv

            ! void glTexGeniv(GLenum coord, GLenum pname, const GLint *params)
            subroutine gltexgeniv(coord, pname, params) bind(c, name='glTexGeniv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: coord
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine gltexgeniv

            ! void glGetTexGendv(GLenum coord, GLenum pname, GLdouble *params)
            subroutine glgettexgendv(coord, pname, params) bind(c, name='glGetTexGendv')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: coord
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLdouble),  intent(in)        :: params(*)
            end subroutine glgettexgendv

            ! void glGetTexGenfv(GLenum coord, GLenum pname, GLfloat *params)
            subroutine glgettexgenfv(coord, pname, params) bind(c, name='glGetTexGenfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: coord
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine glgettexgenfv

            ! void glGetTexGeniv(GLenum coord, GLenum pname, GLint *params)
            subroutine glgettexgeniv(coord, pname, params) bind(c, name='glGetTexGeniv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: coord
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine glgettexgeniv

            ! void glTexEnvf(GLenum target, GLenum pname, GLfloat param)
            subroutine gltexenvf(target, pname, param) bind(c, name='glTexEnvf')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in), value :: param
            end subroutine gltexenvf

            ! void glTexEnvi(GLenum target, GLenum pname, GLint param)
            subroutine gltexenvi(target, pname, param) bind(c, name='glTexEnvi')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in), value :: param
            end subroutine gltexenvi

            ! void glTexEnvfv(GLenum target, GLenum pname, const GLfloat *params)
            subroutine gltexenvfv(target, pname, params) bind(c, name='glTexEnvfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine gltexenvfv

            ! void glTexEnviv(GLenum target, GLenum pname, const GLint *params)
            subroutine gltexenviv(target, pname, params) bind(c, name='glTexEnviv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine gltexenviv

            ! void glGetTexEnvfv(GLenum target, GLenum pname, GLfloat *params)
            subroutine glgettexenvfv(target, pname, params) bind(c, name='glGetTexEnvfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine glgettexenvfv

            ! void glGetTexEnviv(GLenum target, GLenum pname, GLint *params)
            subroutine glgettexenviv(target, pname, params) bind(c, name='glGetTexEnviv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine glgettexenviv

            ! void glTexParameterf(GLenum target, GLenum pname, GLfloat param)
            subroutine gltexparameterf(target, pname, param) bind(c, name='glTexParameterf')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in), value :: param
            end subroutine gltexparameterf

            ! void glTexParameteri(GLenum target, GLenum pname, GLint param)
            subroutine gltexparameteri(target, pname, param) bind(c, name='glTexParameteri')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in), value :: param
            end subroutine gltexparameteri

            ! void glTexParameterfv(GLenum target, GLenum pname, const GLfloat *params)
            subroutine gltexparameterfv(target, pname, params) bind(c, name='glTexParameterfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine gltexparameterfv

            ! void glTexParameteriv(GLenum target, GLenum pname, const GLint *params)
            subroutine gltexparameteriv(target, pname, params) bind(c, name='glTexParameteriv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine gltexparameteriv

            ! void glGetTexParameterfv(GLenum target, GLenum pname, GLfloat *params)
            subroutine glgettexparameterfv(target, pname, params) bind(c, name='glGetTexParameterfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine glgettexparameterfv

            ! void glGetTexParameteriv(GLenum target, GLenum pname, GLint *params)
            subroutine glgettexparameteriv(target, pname, params) bind(c, name='glGetTexParameteriv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine glgettexparameteriv

            ! void glGetTexLevelParameterfv(GLenum target, GLint level, GLenum pname, GLfloat *params)
            subroutine glgettexlevelparameterfv(target, level, pname, params) bind(c, name='glGetTexLevelParameterfv')
                  import :: GLenum, GLfloat, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint),  intent(in), value :: level
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine glgettexlevelparameterfv

            ! void glGetTexLevelParameteriv(GLenum target, GLint level, GLenum pname, GLint *params)
            subroutine glgettexlevelparameteriv(target, level, pname, params) bind(c, name='glGetTexLevelParameteriv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint),  intent(in), value :: level
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine glgettexlevelparameteriv

            ! void glTexImage1D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
            subroutine glteximage1d(target, level, internalformat, width, border, format, type, pixels) bind(c, name='glTexImage1D')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLenum),  intent(in), value :: target
                  integer(kind=GLint),   intent(in), value :: level
                  integer(kind=GLint),   intent(in), value :: internalformat
                  integer(kind=glsizei), intent(in), value :: width
                  integer(kind=GLint),   intent(in), value :: border
                  integer(kind=GLenum),  intent(in), value :: format
                  integer(kind=GLenum),  intent(in), value :: type
                  type(c_ptr),           intent(in), value :: pixels
            end subroutine glteximage1d

            ! void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
            subroutine glteximage2d(target, level, internalformat, width, height, border, format, type, pixels) &
                  bind(c, name='glTexImage2D')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLenum),  intent(in), value :: target
                  integer(kind=glint),   intent(in), value :: level
                  integer(kind=glint),   intent(in), value :: internalformat
                  integer(kind=glsizei), intent(in), value :: width
                  integer(kind=glsizei), intent(in), value :: height
                  integer(kind=glint),   intent(in), value :: border
                  integer(kind=glenum),  intent(in), value :: format
                  integer(kind=glenum),  intent(in), value :: type
                  type(c_ptr),           intent(in), value :: pixels
            end subroutine glteximage2d

            ! void glGetTexImage(GLenum target, GLint level, GLenum format, GLenum type, GLvoid *pixels)
            subroutine glgetteximage(target, level, format, type, pixels) bind(c, name='glGetTexImage')
                  import :: GLenum, GLint, c_ptr
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint),  intent(in), value :: level
                  integer(kind=GLenum), intent(in), value :: format
                  integer(kind=GLenum), intent(in), value :: type
                  type(c_ptr),          intent(in), value :: pixels
            end subroutine glgetteximage

            ! void glGenTextures(GLsizei n, GLuint *textures)
            subroutine glgentextures(n, textures) bind(c, name='glGenTextures')
                  import :: GLsizei, GLuint
                  integer(kind=GLsizei), intent(in), value :: n
                  integer(kind=GLuint),  intent(in)        :: textures(*)
            end subroutine glgentextures

            ! void glDeleteTextures(GLsizei n, const GLuint *textures)
            subroutine gldeletetextures(n, textures) bind(c, name='glDeleteTextures')
                  import :: GLsizei, GLuint
                  integer(kind=GLsizei), intent(in), value :: n
                  integer(kind=GLuint),  intent(in)        :: textures(*)
            end subroutine gldeletetextures

            ! void glBindTexture(GLenum target, GLuint texture)
            subroutine glbindtexture(target, texture) bind(c, name='glBindTexture')
                  import :: GLenum, GLuint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLuint), intent(in), value :: texture
            end subroutine glbindtexture

            ! void glPrioritizeTextures(GLsizei n, const GLuint *textures, const GLclampf *priorities)
            subroutine glprioritizetextures(n, textures, priorities) bind(c, name='glPrioritizeTextures')
                  import :: GLclampf, GLsizei, GLuint
                  integer(kind=GLsizei), intent(in), value :: n
                  integer(kind=GLuint),  intent(in)        :: textures(*)
                  real(kind=GLclampf),   intent(in)        :: priorities
            end subroutine glprioritizetextures

            ! void glTexSubImage1D(GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const GLvoid *pixels)
            subroutine gltexsubimage1d(target, level, xoffset, width, format, type, pixels) bind(c, name='glTexSubImage1D')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLenum),  intent(in), value :: target
                  integer(kind=GLint),   intent(in), value :: level
                  integer(kind=GLint),   intent(in), value :: xoffset
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLenum) , intent(in), value :: format
                  integer(kind=GLenum),  intent(in), value :: type
                  type(c_ptr),           intent(in), value :: pixels
            end subroutine gltexsubimage1d

            ! void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels)
            subroutine gltexsubimage2d(target, level, xoffset, yoffset, width, height, format, type, pixels) &
                  bind(c, name='glTexSubImage2D')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLenum),  intent(in), value :: target
                  integer(kind=GLint),   intent(in), value :: level
                  integer(kind=GLint),   intent(in), value :: xoffset
                  integer(kind=GLint),   intent(in), value :: yoffset
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
                  integer(kind=GLenum),  intent(in), value :: format
                  integer(kind=GLenum),  intent(in), value :: type
                  type(c_ptr),           intent(in), value :: pixels
            end subroutine gltexsubimage2d

            ! void glCopyTexImage1D(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border)
            subroutine glcopyteximage1d(target, level, internalformat, x, y, width, border) bind(c, name='glCopyTexImage1D')
                  import :: GLenum, GLint, GLsizei
                  integer(kind=GLenum),  intent(in), value :: target
                  integer(kind=GLint),   intent(in), value :: level
                  integer(kind=GLenum),  intent(in), value :: internalformat
                  integer(kind=GLint),   intent(in), value :: x
                  integer(kind=GLint),   intent(in), value :: y
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLint),   intent(in), value :: border
            end subroutine glcopyteximage1d

            ! void glCopyTexImage2D(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border)
            subroutine glcopyteximage2d(target, level, internalformat, x, y, width, height, border) bind(c, name='glCopyTexImage2D')
                  import :: GLenum, GLint, GLsizei
                  integer(kind=GLenum),  intent(in), value :: target
                  integer(kind=GLint),   intent(in), value :: level
                  integer(kind=GLenum),  intent(in), value :: internalformat
                  integer(kind=GLint),   intent(in), value :: x
                  integer(kind=GLint),   intent(in), value :: y
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
                  integer(kind=GLint),   intent(in), value :: border
            end subroutine glcopyteximage2d

            ! void glCopyTexSubImage1D(GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width)
            subroutine glcopytexsubimage1d(target, level, xoffset, x, y, width) bind(c, name='glCopyTexSubImage1D')
                  import :: GLenum, GLint, GLsizei
                  integer(kind=GLenum),  intent(in), value :: target
                  integer(kind=GLint),   intent(in), value :: level
                  integer(kind=GLint),   intent(in), value :: xoffset
                  integer(kind=GLint),   intent(in), value :: x
                  integer(kind=GLint),   intent(in), value :: y
                  integer(kind=GLsizei), intent(in), value :: width
            end subroutine glcopytexsubimage1d

            ! void glCopyTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height)
            subroutine glcopytexsubimage2d(target, level, xoffset, yoffset, x, y, width, height) bind(c, name='glCopyTexSubImage2D')
                  import :: GLenum, GLint, GLsizei
                  integer(kind=GLenum),  intent(in), value :: target
                  integer(kind=GLint),   intent(in), value :: level
                  integer(kind=GLint),   intent(in), value :: xoffset
                  integer(kind=GLint),   intent(in), value :: yoffset
                  integer(kind=GLint),   intent(in), value :: x
                  integer(kind=GLint),   intent(in), value :: y
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
            end subroutine glcopytexsubimage2d

            ! void glMap1d(GLenum target, GLdouble u1, GLdouble u2, GLint stride, GLint order, const GLdouble *points)
            subroutine glmap1d(target, u1, u2, stride, order, points) bind(c, name='glMap1d')
                  import :: GLdouble, GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLdouble),  intent(in), value :: u1
                  real(kind=GLdouble),  intent(in), value :: u2
                  integer(kind=GLint),  intent(in), value :: stride
                  integer(kind=GLint),  intent(in), value :: order
                  real(kind=GLdouble),  intent(in)        :: points
            end subroutine glmap1d

            ! void glMap1f(GLenum target, GLfloat u1, GLfloat u2, GLint stride, GLint order, const GLfloat *points)
            subroutine glmap1f(target, u1, u2, stride, order, points) bind(c, name='glMap1f')
                  import :: GLenum, GLfloat, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLfloat),   intent(in), value :: u1
                  real(kind=GLfloat),   intent(in), value :: u2
                  integer(kind=GLint),  intent(in), value :: stride
                  integer(kind=GLint),  intent(in), value :: order
                  real(kind=GLfloat),   intent(in)        :: points
            end subroutine glmap1f

            ! void glMap2d(GLenum target, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, const GLdouble *points)
            subroutine glmap2d(target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points) bind(c, name='glMap2d')
                  import :: GLdouble, GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLdouble),  intent(in), value :: u1
                  real(kind=GLdouble),  intent(in), value :: u2
                  integer(kind=GLint),  intent(in), value :: ustride
                  integer(kind=GLint),  intent(in), value :: uorder
                  real(kind=GLdouble),  intent(in), value :: v1
                  real(kind=GLdouble),  intent(in), value :: v2
                  integer(kind=GLint),  intent(in), value :: vstride
                  integer(kind=GLint),  intent(in), value :: vorder
                  real(kind=GLdouble),  intent(in)        :: points
            end subroutine glmap2d

            ! void glMap2f(GLenum target, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, const GLfloat *points)
            subroutine glmap2f(target, u1, u2, ustride, uorder, v1, v2, vstride, vorder, points) bind(c, name='glMap2f')
                  import :: GLenum, GLfloat, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLfloat),   intent(in), value :: u1
                  real(kind=GLfloat),   intent(in), value :: u2
                  integer(kind=GLint),  intent(in), value :: ustride
                  integer(kind=GLint),  intent(in), value :: uorder
                  real(kind=GLfloat),   intent(in), value :: v1
                  real(kind=GLfloat),   intent(in), value :: v2
                  integer(kind=GLint),  intent(in), value :: vstride
                  integer(kind=GLint),  intent(in), value :: vorder
                  real(kind=GLfloat),   intent(in)        :: points
            end subroutine glmap2f

            ! void glGetMapdv(GLenum target, GLenum query, GLdouble *v)
            subroutine glgetmapdv(target, query, v) bind(c, name='glGetMapdv')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: query
                  real(kind=GLdouble),  intent(in)        :: v
            end subroutine glgetmapdv

            ! void glGetMapfv(GLenum target, GLenum query, GLfloat *v)
            subroutine glgetmapfv(target, query, v) bind(c, name='glGetMapfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: query
                  real(kind=GLfloat),   intent(in)        :: v
            end subroutine glgetmapfv

            ! void glGetMapiv(GLenum target, GLenum query, GLint *v)
            subroutine glgetmapiv(target, query, v) bind(c, name='glGetMapiv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLenum), intent(in), value :: query
                  integer(kind=GLint),  intent(in)        :: v
            end subroutine glgetmapiv

            ! void glEvalCoord1d(GLdouble u)
            subroutine glevalcoord1d(u) bind(c, name='glEvalCoord1d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: u
            end subroutine glevalcoord1d

            ! void glEvalCoord1f(GLfloat u)
            subroutine glevalcoord1f(u) bind(c, name='glEvalCoord1f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: u
            end subroutine glevalcoord1f

            ! void glEvalCoord1dv(const GLdouble *u)
            subroutine glevalcoord1dv(u) bind(c, name='glEvalCoord1dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: u
            end subroutine glevalcoord1dv

            ! void glEvalCoord1fv(const GLfloat *u)
            subroutine glevalcoord1fv(u) bind(c, name='glEvalCoord1fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: u
            end subroutine glevalcoord1fv

            ! void glEvalCoord2d(GLdouble u, GLdouble v)
            subroutine glevalcoord2d(u, v) bind(c, name='glEvalCoord2d')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: u
                  real(kind=GLdouble), intent(in), value :: v
            end subroutine glevalcoord2d

            ! void glEvalCoord2f(GLfloat u, GLfloat v)
            subroutine glevalcoord2f(u, v) bind(c, name='glEvalCoord2f')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: u
                  real(kind=GLfloat), intent(in), value :: v
            end subroutine glevalcoord2f

            ! void glEvalCoord2dv(const GLdouble *u)
            subroutine glevalcoord2dv(u) bind(c, name='glEvalCoord2dv')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in) :: u
            end subroutine glevalcoord2dv

            ! void glEvalCoord2fv(const GLfloat *u)
            subroutine glevalcoord2fv(u) bind(c, name='glEvalCoord2fv')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in) :: u
            end subroutine glevalcoord2fv

            ! void glMapGrid1d(GLint un, GLdouble u1, GLdouble u2)
            subroutine glmapgrid1d(un, u1, u2) bind(c, name='glMapGrid1d')
                  import :: GLdouble, GLint
                  integer(kind=GLint), intent(in), value :: un
                  real(kind=GLdouble), intent(in), value :: u1
                  real(kind=GLdouble), intent(in), value :: u2
            end subroutine glmapgrid1d

            ! void glMapGrid1f(GLint un, GLfloat u1, GLfloat u2)
            subroutine glmapgrid1f(un, u1, u2) bind(c, name='glMapGrid1f')
                  import :: GLfloat, GLint
                  integer(kind=GLint), intent(in), value :: un
                  real(kind=GLfloat),  intent(in), value :: u1
                  real(kind=GLfloat),  intent(in), value :: u2
            end subroutine glmapgrid1f

            ! void glMapGrid2d(GLint un, GLdouble u1, GLdouble u2, GLint vn, GLdouble v1, GLdouble v2)
            subroutine glmapgrid2d(un, u1, u2, vn, v1, v2) bind(c, name='glMapGrid2d')
                  import :: GLdouble, GLint
                  integer(kind=GLint), intent(in), value :: un
                  real(kind=GLdouble), intent(in), value :: u1
                  real(kind=GLdouble), intent(in), value :: u2
                  integer(kind=GLint), intent(in), value :: vn
                  real(kind=GLdouble), intent(in), value :: v1
                  real(kind=GLdouble), intent(in), value :: v2
            end subroutine glmapgrid2d

            ! void glMapGrid2f(GLint un, GLfloat u1, GLfloat u2, GLint vn, GLfloat v1, GLfloat v2)
            subroutine glmapgrid2f(un, u1, u2, vn, v1, v2) bind(c, name='glMapGrid2f')
                  import :: GLfloat, GLint
                  integer(kind=GLint), intent(in), value :: un
                  real(kind=GLfloat),  intent(in), value :: u1
                  real(kind=GLfloat),  intent(in), value :: u2
                  integer(kind=GLint), intent(in), value :: vn
                  real(kind=GLfloat),  intent(in), value :: v1
                  real(kind=GLfloat),  intent(in), value :: v2
            end subroutine glmapgrid2f

            ! void glEvalPoint1(GLint i)
            subroutine glevalpoint1(i) bind(c, name='glEvalPoint1')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: i
            end subroutine glevalpoint1

            ! void glEvalPoint2(GLint i, GLint j)
            subroutine glevalpoint2(i, j) bind(c, name='glEvalPoint2')
                  import :: GLint
                  integer(kind=GLint), intent(in), value :: i
                  integer(kind=GLint), intent(in), value :: j
            end subroutine glevalpoint2

            ! void glEvalMesh1(GLenum mode, GLint i1, GLint i2)
            subroutine glevalmesh1(mode, i1, i2) bind(c, name='glEvalMesh1')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: mode
                  integer(kind=GLint),  intent(in), value :: i1
                  integer(kind=GLint),  intent(in), value :: i2
            end subroutine glevalmesh1

            ! void glEvalMesh2(GLenum mode, GLint i1, GLint i2, GLint j1, GLint j2)
            subroutine glevalmesh2(mode, i1, i2, j1, j2) bind(c, name='glEvalMesh2')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: mode
                  integer(kind=GLint),  intent(in), value :: i1
                  integer(kind=GLint),  intent(in), value :: i2
                  integer(kind=GLint),  intent(in), value :: j1
                  integer(kind=GLint),  intent(in), value :: j2
            end subroutine glevalmesh2

            ! void glFogf(GLenum pname, GLfloat param)
            subroutine glfogf(pname, param) bind(c, name='glFogf')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat), intent(in), value :: param
            end subroutine glfogf

            ! void glFogi(GLenum pname, GLint param)
            subroutine glfogi(pname, param) bind(c, name='glFogi')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in), value :: param
            end subroutine glfogi

            ! void glFogfv(GLenum pname, const GLfloat *params)
            subroutine glfogfv(pname, params) bind(c, name='glFogfv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: pname
                  real(kind=GLfloat),   intent(in)        :: params(*)
            end subroutine glfogfv

            ! void glFogiv(GLenum pname, const GLint *params)
            subroutine glfogiv(pname, params) bind(c, name='glFogiv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: pname
                  integer(kind=GLint),  intent(in)        :: params(*)
            end subroutine glfogiv

            ! void glFeedbackBuffer(GLsizei size, GLenum type, GLfloat *buffer)
            subroutine glfeedbackbuffer(size, type, buffer) bind(c, name='glFeedbackBuffer')
                  import :: GLenum, GLfloat, GLsizei
                  integer(kind=GLsizei), intent(in), value :: size
                  integer(kind=GLenum),  intent(in), value :: type
                  real(kind=GLfloat),    intent(in)        :: buffer
            end subroutine glfeedbackbuffer

            ! void glPassThrough(GLfloat token)
            subroutine glpassthrough(token) bind(c, name='glPassThrough')
                  import :: GLfloat
                  real(kind=GLfloat), intent(in), value :: token
            end subroutine glpassthrough

            ! void glSelectBuffer(GLsizei size, GLuint *buffer)
            subroutine glselectbuffer(size, buffer) bind(c, name='glSelectBuffer')
                  import :: GLsizei, GLuint
                  integer(kind=GLsizei), intent(in), value :: size
                  integer(kind=GLuint),  intent(in)        :: buffer
            end subroutine glselectbuffer

            ! void glInitNames(void)
            subroutine glinitnames() bind(c, name='glInitNames')
            end subroutine glinitnames

            ! void glLoadName(GLuint name)
            subroutine glloadname(name) bind(c, name='glLoadName')
                  import :: GLuint
                  integer(kind=GLuint), intent(in), value :: name
            end subroutine glloadname

            ! void glPushName(GLuint name)
            subroutine glpushname(name) bind(c, name='glPushName')
                  import :: GLuint
                  integer(kind=GLuint), intent(in), value :: name
            end subroutine glpushname

            ! void glPopName(void)
            subroutine glpopname() bind(c, name='glPopName')
            end subroutine glpopname

            !***************************************************************
            !
            ! OpenGL 1.3
            !
            !***************************************************************
            ! void glActiveTexture(GLenum texture)
            subroutine glactivetexture(texture) bind(c, name='glActiveTexture')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: texture
            end subroutine glactivetexture

            ! void glClientActiveTexture(GLenum texture)
            subroutine glclientactivetexture(texture) bind(c, name='glClientActiveTexture')
                  import :: GLenum
                  integer(kind=GLenum), intent(in), value :: texture
            end subroutine glclientactivetexture

            ! void glCompressedTexImage1D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imagesize, const GLvoid *data)
            subroutine glcompressedteximage1d(target, level, internalformat, width, border, imagesize, data) &
                  bind(c, name='glCompressedTexImage1D')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in), value :: level
                  integer(kind=GLenum), intent(in), value :: internalformat
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLint), intent(in), value :: border
                  integer(kind=GLsizei), intent(in), value :: imagesize
                  type(c_ptr), intent(in), value :: data
            end subroutine glcompressedteximage1d

            ! void glCompressedTexImage2D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imagesize, const GLvoid *data)
            subroutine glcompressedteximage2d(target, level, internalformat, width, height, border, imagesize, data) &
                  bind(c, name='glCompressedTexImage2D')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in), value :: level
                  integer(kind=GLenum), intent(in), value :: internalformat
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
                  integer(kind=GLint), intent(in), value :: border
                  integer(kind=GLsizei), intent(in), value :: imagesize
                  type(c_ptr), intent(in), value :: data
            end subroutine glcompressedteximage2d

            ! void glCompressedTexImage3D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imagesize, const GLvoid *data)
            subroutine glcompressedteximage3d(target, level, internalformat, width, height, depth, border, imagesize, data) &
                  bind(c, name='glCompressedTexImage3D')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in), value :: level
                  integer(kind=GLenum), intent(in), value :: internalformat
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
                  integer(kind=GLsizei), intent(in), value :: depth
                  integer(kind=GLint), intent(in), value :: border
                  integer(kind=GLsizei), intent(in), value :: imagesize
                  type(c_ptr), intent(in), value :: data
            end subroutine glcompressedteximage3d

            ! void glCompressedTexSubImage1D(GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imagesize, const GLvoid *data)
            subroutine glcompressedtexsubimage1d(target, level, xoffset, width, format, imagesize, data) &
                  bind(c, name='glCompressedTexSubImage1D')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in), value :: level
                  integer(kind=GLint), intent(in), value :: xoffset
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLenum), intent(in), value :: format
                  integer(kind=GLsizei), intent(in), value :: imagesize
                  type(c_ptr), intent(in), value :: data
            end subroutine glcompressedtexsubimage1d

            ! void glCompressedTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imagesize, const GLvoid *data)
            subroutine glcompressedtexsubimage2d(target, level, xoffset, yoffset, width, height, format, imagesize, data) &
                  bind(c, name='glCompressedTexSubImage2D')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in), value :: level
                  integer(kind=GLint), intent(in), value :: xoffset
                  integer(kind=GLint), intent(in), value :: yoffset
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
                  integer(kind=GLenum), intent(in), value :: format
                  integer(kind=GLsizei), intent(in), value :: imagesize
                  type(c_ptr), intent(in), value :: data
            end subroutine glcompressedtexsubimage2d

            ! void glCompressedTexSubImage3D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imagesize, const GLvoid *data)
            subroutine glcompressedtexsubimage3d(target, level, xoffset, yoffset, zoffset, width, height, depth, format, &
                  imagesize, data) bind(c, name='glCompressedTexSubImage3D')
                  import :: GLenum, GLint, GLsizei, c_ptr
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in), value :: level
                  integer(kind=GLint), intent(in), value :: xoffset
                  integer(kind=GLint), intent(in), value :: yoffset
                  integer(kind=GLint), intent(in), value :: zoffset
                  integer(kind=GLsizei), intent(in), value :: width
                  integer(kind=GLsizei), intent(in), value :: height
                  integer(kind=GLsizei), intent(in), value :: depth
                  integer(kind=GLenum), intent(in), value :: format
                  integer(kind=GLsizei), intent(in), value :: imagesize
                  type(c_ptr), intent(in), value :: data
            end subroutine glcompressedtexsubimage3d

            ! void glGetCompressedTexImage(GLenum target, GLint lod, GLvoid *img)
            subroutine glgetcompressedteximage(target, lod, img) bind(c, name='glGetCompressedTexImage')
                  import :: GLenum, GLint, c_ptr
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in), value :: lod
                  type(c_ptr), intent(in), value :: img
            end subroutine glgetcompressedteximage

            ! void glMultiTexCoord1d(GLenum target, GLdouble s)
            subroutine glmultitexcoord1d(target, s) bind(c, name='glMultiTexCoord1d')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLdouble), intent(in), value :: s
            end subroutine glmultitexcoord1d

            ! void glMultiTexCoord1dv(GLenum target, const GLdouble *v)
            subroutine glmultitexcoord1dv(target, v) bind(c, name='glMultiTexCoord1dv')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glmultitexcoord1dv

            ! void glMultiTexCoord1f(GLenum target, GLfloat s)
            subroutine glmultitexcoord1f(target, s) bind(c, name='glMultiTexCoord1f')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLfloat), intent(in), value :: s
            end subroutine glmultitexcoord1f

            ! void glMultiTexCoord1fv(GLenum target, const GLfloat *v)
            subroutine glmultitexcoord1fv(target, v) bind(c, name='glMultiTexCoord1fv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glmultitexcoord1fv

            ! void glMultiTexCoord1i(GLenum target, GLint s)
            subroutine glmultitexcoord1i(target, s) bind(c, name='glMultiTexCoord1i')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in), value :: s
            end subroutine glmultitexcoord1i

            ! void glMultiTexCoord1iv(GLenum target, const GLint *v)
            subroutine glmultitexcoord1iv(target, v) bind(c, name='glMultiTexCoord1iv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in) :: v
            end subroutine glmultitexcoord1iv

            ! void glMultiTexCoord1s(GLenum target, GLshort s)
            subroutine glmultitexcoord1s(target, s) bind(c, name='glMultiTexCoord1s')
                  import :: GLenum, GLshort
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLshort), intent(in), value :: s
            end subroutine glmultitexcoord1s

            ! void glMultiTexCoord1sv(GLenum target, const GLshort *v)
            subroutine glmultitexcoord1sv(target, v) bind(c, name='glMultiTexCoord1sv')
                  import :: GLenum, GLshort
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glmultitexcoord1sv

            ! void glMultiTexCoord2d(GLenum target, GLdouble s, GLdouble t)
            subroutine glmultitexcoord2d(target, s, t) bind(c, name='glMultiTexCoord2d')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLdouble), intent(in), value :: s
                  real(kind=GLdouble), intent(in), value :: t
            end subroutine glmultitexcoord2d

            ! void glMultiTexCoord2dv(GLenum target, const GLdouble *v)
            subroutine glmultitexcoord2dv(target, v) bind(c, name='glMultiTexCoord2dv')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glmultitexcoord2dv

            ! void glMultiTexCoord2f(GLenum target, GLfloat s, GLfloat t)
            subroutine glmultitexcoord2f(target, s, t) bind(c, name='glMultiTexCoord2f')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLfloat), intent(in), value :: s
                  real(kind=GLfloat), intent(in), value :: t
            end subroutine glmultitexcoord2f

            ! void glMultiTexCoord2fv(GLenum target, const GLfloat *v)
            subroutine glmultitexcoord2fv(target, v) bind(c, name='glMultiTexCoord2fv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glmultitexcoord2fv

            ! void glMultiTexCoord2i(GLenum target, GLint s, GLint t)
            subroutine glmultitexcoord2i(target, s, t) bind(c, name='glMultiTexCoord2i')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in), value :: s
                  integer(kind=GLint), intent(in), value :: t
            end subroutine glmultitexcoord2i

            ! void glMultiTexCoord2iv(GLenum target, const GLint *v)
            subroutine glmultitexcoord2iv(target, v) bind(c, name='glMultiTexCoord2iv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in) :: v
            end subroutine glmultitexcoord2iv

            ! void glMultiTexCoord2s(GLenum target, GLshort s, GLshort t)
            subroutine glmultitexcoord2s(target, s, t) bind(c, name='glMultiTexCoord2s')
                  import :: GLenum, GLshort
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLshort), intent(in), value :: s
                  integer(kind=GLshort), intent(in), value :: t
            end subroutine glmultitexcoord2s

            ! void glMultiTexCoord2sv(GLenum target, const GLshort *v)
            subroutine glmultitexcoord2sv(target, v) bind(c, name='glMultiTexCoord2sv')
                  import :: GLenum, GLshort
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glmultitexcoord2sv

            ! void glMultiTexCoord3d(GLenum target, GLdouble s, GLdouble t, GLdouble r)
            subroutine glmultitexcoord3d(target, s, t, r) bind(c, name='glMultiTexCoord3d')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLdouble), intent(in), value :: s
                  real(kind=GLdouble), intent(in), value :: t
                  real(kind=GLdouble), intent(in), value :: r
            end subroutine glmultitexcoord3d

            ! void glMultiTexCoord3dv(GLenum target, const GLdouble *v)
            subroutine glmultitexcoord3dv(target, v) bind(c, name='glMultiTexCoord3dv')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glmultitexcoord3dv

            ! void glMultiTexCoord3f(GLenum target, GLfloat s, GLfloat t, GLfloat r)
            subroutine glmultitexcoord3f(target, s, t, r) bind(c, name='glMultiTexCoord3f')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLfloat), intent(in), value :: s
                  real(kind=GLfloat), intent(in), value :: t
                  real(kind=GLfloat), intent(in), value :: r
            end subroutine glmultitexcoord3f

            ! void glMultiTexCoord3fv(GLenum target, const GLfloat *v)
            subroutine glmultitexcoord3fv(target, v) bind(c, name='glMultiTexCoord3fv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glmultitexcoord3fv

            ! void glMultiTexCoord3i(GLenum target, GLint s, GLint t, GLint r)
            subroutine glmultitexcoord3i(target, s, t, r) bind(c, name='glMultiTexCoord3i')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in), value :: s
                  integer(kind=GLint), intent(in), value :: t
                  integer(kind=GLint), intent(in), value :: r
            end subroutine glmultitexcoord3i

            ! void glMultiTexCoord3iv(GLenum target, const GLint *v)
            subroutine glmultitexcoord3iv(target, v) bind(c, name='glMultiTexCoord3iv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in) :: v
            end subroutine glmultitexcoord3iv

            ! void glMultiTexCoord3s(GLenum target, GLshort s, GLshort t, GLshort r)
            subroutine glmultitexcoord3s(target, s, t, r) bind(c, name='glMultiTexCoord3s')
                  import :: GLenum, GLshort
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLshort), intent(in), value :: s
                  integer(kind=GLshort), intent(in), value :: t
                  integer(kind=GLshort), intent(in), value :: r
            end subroutine glmultitexcoord3s

            ! void glMultiTexCoord3sv(GLenum target, const GLshort *v)
            subroutine glmultitexcoord3sv(target, v) bind(c, name='glMultiTexCoord3sv')
                  import :: GLenum, GLshort
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glmultitexcoord3sv

            ! void glMultiTexCoord4d(GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q)
            subroutine glmultitexcoord4d(target, s, t, r, q) bind(c, name='glMultiTexCoord4d')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLdouble), intent(in), value :: s
                  real(kind=GLdouble), intent(in), value :: t
                  real(kind=GLdouble), intent(in), value :: r
                  real(kind=GLdouble), intent(in), value :: q
            end subroutine glmultitexcoord4d

            ! void glMultiTexCoord4dv(GLenum target, const GLdouble *v)
            subroutine glmultitexcoord4dv(target, v) bind(c, name='glMultiTexCoord4dv')
                  import :: GLdouble, GLenum
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLdouble), intent(in) :: v
            end subroutine glmultitexcoord4dv

            ! void glMultiTexCoord4f(GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q)
            subroutine glmultitexcoord4f(target, s, t, r, q) bind(c, name='glMultiTexCoord4f')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLfloat), intent(in), value :: s
                  real(kind=GLfloat), intent(in), value :: t
                  real(kind=GLfloat), intent(in), value :: r
                  real(kind=GLfloat), intent(in), value :: q
            end subroutine glmultitexcoord4f

            ! void glMultiTexCoord4fv(GLenum target, const GLfloat *v)
            subroutine glmultitexcoord4fv(target, v) bind(c, name='glMultiTexCoord4fv')
                  import :: GLenum, GLfloat
                  integer(kind=GLenum), intent(in), value :: target
                  real(kind=GLfloat), intent(in) :: v
            end subroutine glmultitexcoord4fv

            ! void glMultiTexCoord4i(GLenum target, GLint s, GLint t, GLint r, GLint q)
            subroutine glmultitexcoord4i(target, s, t, r, q) bind(c, name='glMultiTexCoord4i')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in), value :: s
                  integer(kind=GLint), intent(in), value :: t
                  integer(kind=GLint), intent(in), value :: r
                  integer(kind=GLint), intent(in), value :: q
            end subroutine glmultitexcoord4i

            ! void glMultiTexCoord4iv(GLenum target, const GLint *v)
            subroutine glmultitexcoord4iv(target, v) bind(c, name='glMultiTexCoord4iv')
                  import :: GLenum, GLint
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLint), intent(in) :: v
            end subroutine glmultitexcoord4iv

            ! void glMultiTexCoord4s(GLenum target, GLshort s, GLshort t, GLshort r, GLshort q)
            subroutine glmultitexcoord4s(target, s, t, r, q) bind(c, name='glMultiTexCoord4s')
                  import :: GLenum, GLshort
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLshort), intent(in), value :: s
                  integer(kind=GLshort), intent(in), value :: t
                  integer(kind=GLshort), intent(in), value :: r
                  integer(kind=GLshort), intent(in), value :: q
            end subroutine glmultitexcoord4s

            ! void glMultiTexCoord4sv(GLenum target, const GLshort *v)
            subroutine glmultitexcoord4sv(target, v) bind(c, name='glMultiTexCoord4sv')
                  import :: GLenum, GLshort
                  integer(kind=GLenum), intent(in), value :: target
                  integer(kind=GLshort), intent(in) :: v
            end subroutine glmultitexcoord4sv

            ! GLUquadric* gluNewQuadric(void)
            function glunewquadric() bind(c, name='gluNewQuadric')
                  import :: c_ptr
                  type(c_ptr) :: glunewquadric
            end function glunewquadric

            ! GLint gluProject(GLdouble objX, GLdouble objY, GLdouble objZ, const GLdouble *model, const GLdouble *proj, const GLint *view, GLdouble* winX, GLdouble* winY, GLdouble* winZ)
            function gluproject(objx, objy, objz, model, proj, view, winx, winy, winz) bind(c, name='gluProject')
                  import :: GLdouble, GLint
                  real(kind=gldouble), intent(in), value :: objx
                  real(kind=gldouble), intent(in), value :: objy
                  real(kind=gldouble), intent(in), value :: objz
                  real(kind=gldouble), intent(in)        :: model
                  real(kind=gldouble), intent(in)        :: proj
                  integer(kind=glint), intent(in)        :: view
                  real(kind=gldouble), intent(in)        :: winx
                  real(kind=gldouble), intent(in)        :: winy
                  real(kind=gldouble), intent(in)        :: winz
                  integer(kind=glint)                    :: gluproject
            end function gluproject

            ! void gluDeleteQuadric(GLUquadric* quad)
            subroutine gludeletequadric(quad) bind(c, name='gluDeleteQuadric')
                  import :: c_ptr
                  type(c_ptr), intent(in), value :: quad
            end subroutine gludeletequadric

            ! void gluLookAt(GLdouble eyeX, GLdouble eyeY, GLdouble eyeZ, GLdouble centerX, GLdouble centerY, GLdouble centerZ, GLdouble upX, GLdouble upY, GLdouble upZ)
            subroutine glulookat(eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz) bind(c, name='gluLookAt')
                  import :: GLdouble
                  real(kind=gldouble), intent(in), value :: eyex
                  real(kind=gldouble), intent(in), value :: eyey
                  real(kind=gldouble), intent(in), value :: eyez
                  real(kind=gldouble), intent(in), value :: centerx
                  real(kind=gldouble), intent(in), value :: centery
                  real(kind=gldouble), intent(in), value :: centerz
                  real(kind=gldouble), intent(in), value :: upx
                  real(kind=gldouble), intent(in), value :: upy
                  real(kind=gldouble), intent(in), value :: upz
            end subroutine glulookat

            ! void gluOrtho2D(GLdouble left, GLdouble right, GLdouble bottom, GLdouble top)
            subroutine gluortho2d(left, right, bottom, top) bind(c, name='gluOrtho2D')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: left
                  real(kind=GLdouble), intent(in), value :: right
                  real(kind=GLdouble), intent(in), value :: bottom
                  real(kind=GLdouble), intent(in), value :: top
            end subroutine gluortho2d

            ! void gluPerspective(GLdouble fovy, GLdouble aspect, GLdouble zNear, GLdouble zFar)
            subroutine gluperspective(fovy, aspect, znear, zfar) bind(c, name='gluPerspective')
                  import :: GLdouble
                  real(kind=GLdouble), intent(in), value :: fovy
                  real(kind=gldouble), intent(in), value :: aspect
                  real(kind=gldouble), intent(in), value :: znear
                  real(kind=gldouble), intent(in), value :: zfar
            end subroutine gluperspective

            ! void gluSphere(GLUquadric* quad, GLdouble radius, GLint slices, GLint stacks)
            subroutine glusphere(quad, radius, slices, stacks) bind(c, name='gluSphere')
                  import :: c_ptr, GLdouble, GLint
                  type(c_ptr),         intent(in), value :: quad
                  real(kind=GLdouble), intent(in), value :: radius
                  integer(kind=GLint), intent(in), value :: slices
                  integer(kind=GLint), intent(in), value :: stacks
            end subroutine glusphere

      END INTERFACE

      CONTAINS     
      function sdl_create_rgb_surface(flags, width, height, depth, r_mask, g_mask, b_mask, a_mask)
            implicit none
            
            !! Calls `sdl_create_rgb_surface_()` and converts the returned
            !! C pointer to derived type `sdl_surface`.
            integer(kind=c_uint32_t), intent(in) :: flags
            integer(kind=c_int),      intent(in) :: width
            integer(kind=c_int),      intent(in) :: height
            integer(kind=c_int),      intent(in) :: depth
            integer(kind=c_int64_t),  intent(in) :: r_mask
            integer(kind=c_int64_t),  intent(in) :: g_mask
            integer(kind=c_int64_t),  intent(in) :: b_mask
            integer(kind=c_int64_t),  intent(in) :: a_mask
            type(sdl_surface), pointer           :: sdl_create_rgb_surface
            type(c_ptr)                          :: ptr

            ptr = sdl_create_rgb_surface_(flags, width, height, depth, r_mask, g_mask, b_mask, a_mask)
            call c_f_pointer(ptr, sdl_create_rgb_surface)
      end function sdl_create_rgb_surface



      SUBROUTINE sdl_transfer_event(event)
            type(sdl_event), intent(inout) :: event
            SELECT CASE (event%type)
                  CASE (SDL_WINDOWEVENT)
                    event%window = transfer(event, event%window)
                  CASE (SDL_KEYDOWN : SDL_KEYUP)
                    event%key = transfer(event, event%key)
                  CASE (SDL_TEXTEDITING)
                    event%edit = transfer(event, event%edit)
                  CASE (SDL_TEXTINPUT)
                    event%text = transfer(event, event%text)
                  CASE (SDL_MOUSEMOTION)
                    event%motion = transfer(event, event%motion)
                  CASE (SDL_MOUSEBUTTONDOWN : SDL_MOUSEBUTTONUP)
                    event%button = transfer(event, event%button)
                  CASE (SDL_MOUSEWHEEL)
                    event%wheel = transfer(event, event%wheel)
                  CASE (SDL_JOYAXISMOTION)
                    event%j_axis = transfer(event, event%j_axis)
                  CASE (SDL_JOYBALLMOTION)
                    event%j_ball = transfer(event, event%j_ball)
                  CASE (SDL_JOYHATMOTION)
                    event%j_hat = transfer(event, event%j_hat)
                  CASE (SDL_JOYBUTTONDOWN : SDL_JOYBUTTONUP)
                    event%j_button = transfer(event, event%j_button)
                  CASE (SDL_JOYDEVICEADDED : SDL_JOYDEVICEREMOVED)
                    event%j_device = transfer(event, event%j_device)
                  CASE (SDL_CONTROLLERAXISMOTION)
                    event%c_axis = transfer(event, event%c_axis)
                  CASE (SDL_CONTROLLERBUTTONDOWN : SDL_CONTROLLERBUTTONUP)
                    event%c_button = transfer(event, event%c_button)
                  CASE (SDL_CONTROLLERDEVICEADDED : SDL_CONTROLLERDEVICEREMAPPED)
                    event%c_device = transfer(event, event%c_device)
                  CASE (SDL_AUDIODEVICEADDED : SDL_AUDIODEVICEREMOVED)
                    event%a_device = transfer(event, event%a_device)
                  CASE (SDL_QUITEVENT)
                    event%quit = transfer(event, event%quit)
                  CASE (SDL_USEREVENT)
                    event%user = transfer(event, event%user)
                  CASE (SDL_SYSWMEVENT)
                    event%sys_wm = transfer(event, event%sys_wm)
                  CASE (SDL_FINGERDOWN : SDL_FINGERMOTION)
                    event%t_finger = transfer(event, event%t_finger)
                  CASE (SDL_MULTIGESTURE)
                    event%m_gesture = transfer(event, event%m_gesture)
                  CASE (SDL_DOLLARGESTURE : SDL_DOLLARRECORD)
                    event%d_gesture = transfer(event, event%d_gesture)
                  CASE (SDL_DROPFILE : SDL_DROPCOMPLETE)
                    event%drop = transfer(event, event%drop)
            END SELECT 
      END SUBROUTINE sdl_transfer_event


      FUNCTION sdl_poll_event(event)
            type(sdl_event), intent(inout) :: event
            INTEGER                        :: sdl_poll_event
            sdl_poll_event = sdl_poll_event_(event)
            call sdl_transfer_event(event)
      END FUNCTION sdl_poll_event

      FUNCTION sdl_get_keyboard_state()
            INTEGER(kind=c_uint8_t), pointer :: sdl_get_keyboard_state(:)
            type(c_ptr)                      :: ptr
            sdl_get_keyboard_state => null()
            ptr = sdl_get_keyboard_state_(c_null_ptr)
            if (.not. c_associated(ptr)) return
            call c_f_pointer(ptr, sdl_get_keyboard_state, shape=[244])
      END FUNCTION sdl_get_keyboard_state

      subroutine c_f_str_chars(c_str, f_str)
            CHARACTER(len=1, kind=c_char), intent(in)  :: c_str(*)
            CHARACTER(len=*),              intent(out) :: f_str
            INTEGER                                    :: i
    
            i = 1
    
            do while (c_str(i) /= c_null_char .and. i <= len(f_str))
                f_str(i:i) = c_str(i)
                i = i + 1
            end do
    
            if (i < len(f_str)) f_str(i:) = ' '
      end subroutine c_f_str_chars

      pure FUNCTION uint8_i4(i)
            INTEGER(kind=4), intent(in) :: i
            INTEGER(kind=c_int8_t)      :: uint8_i4

            uint8_i4 = transfer([i, 1_4], 1_c_int8_t)
      END FUNCTION uint8_i4

      pure function uint8_i2(i)
            integer(kind=2), intent(in) :: i
            integer(kind=c_int8_t)      :: uint8_i2

            uint8_i2 = transfer([i, 1_2], 1_c_int8_t)
      end function uint8_i2

      FUNCTION sdl_get_window_surface(window)
            !! Calls `sdl_get_window_surface_()` and converts the returned
            !! C pointer to derived type `sdl_surface`.
            type(c_ptr),       intent(in) :: window
            type(sdl_surface), pointer    :: sdl_get_window_surface
            type(c_ptr)                   :: ptr
    
            sdl_get_window_surface => null()
            ptr = sdl_get_window_surface_(window)
            if (.not. c_associated(ptr)) return
            call c_f_pointer(ptr, sdl_get_window_surface)
      END FUNCTION sdl_get_window_surface

      FUNCTION sdl_get_pixel_format(surface)
            type(sdl_surface),      intent(in) :: surface
            type(sdl_pixel_format), pointer    :: sdl_get_pixel_format
    
            call c_f_pointer(surface%format, sdl_get_pixel_format)
      END FUNCTION sdl_get_pixel_format

      FUNCTION sdl_convert_surface(src, fmt, flags)
            type(sdl_surface),        intent(in) :: src
            type(sdl_pixel_format),   intent(in) :: fmt
            INTEGER,                  intent(in) :: flags
            type(sdl_surface),        pointer    :: sdl_convert_surface
            type(c_ptr)                          :: ptr
    
            sdl_convert_surface => null()
            ptr = sdl_convert_surface_(src, fmt, flags)
            if (.NOT. c_associated(ptr)) return
            call c_f_pointer(ptr, sdl_convert_surface)
      END FUNCTION sdl_convert_surface

      function ttf_render_text_solid(font, text, fg)
            type(c_ptr),            intent(in) :: font
            character(kind=c_char), intent(in) :: text
            type(sdl_color),        intent(in) :: fg
            type(sdl_surface),      pointer    :: ttf_render_text_solid
            type(c_ptr)                        :: ptr
    
            ptr = ttf_render_text_solid_(font, text, fg)
            call c_f_pointer(ptr, ttf_render_text_solid)
      end function ttf_render_text_solid

      function sdl_load_bmp(file)
            character(kind=c_char), intent(in) :: file
            type(sdl_surface),      pointer    :: sdl_load_bmp
            type(c_ptr)                        :: ptr

            sdl_load_bmp => null()
            ptr = sdl_load_bmp_rw(sdl_rw_from_file(file, 'rb' // c_null_char), 1)
            if (.not. c_associated(ptr)) return
            call c_f_pointer(ptr, sdl_load_bmp)
      end function sdl_load_bmp


      function img_load(file_name)
            character(len=*), intent(in) :: file_name
            type(sdl_surface), pointer   :: img_load
            type(c_ptr)                  :: ptr
    
            img_load => null()
            ptr = img_load_(file_name)
            if (.not. c_associated(ptr)) return
            call c_f_pointer(ptr, img_load)
      end function img_load

      function sdl_set_hint(name, value)
            character(len=*), intent(in) :: name
            character(len=*), intent(in) :: value
            integer                      :: sdl_set_hint
    
            sdl_set_hint = sdl_set_hint_(name // c_null_char, value // c_null_char)
      end function sdl_set_hint

      function mix_load_wav(file)
            implicit none
            
            character(kind=c_char), intent(in) :: file
            type(c_ptr)                        :: mix_load_wav
    
            mix_load_wav = mix_load_wav_rw(sdl_rw_from_file(file, 'rb' // c_null_char), 1)
      end function mix_load_wav
    ! const char *SDL_GetError(void)
      function sdl_get_error()
            implicit none
            
            !! Calls `sdl_get_error_()` and converts the returned
            !! C char pointer to Fortran character.
            character(len=:), allocatable :: sdl_get_error
            type(c_ptr)                   :: ptr
            integer(kind=8)               :: size
    
            ptr = sdl_get_error_()
            if (.not. c_associated(ptr)) return
            size = c_strlen(ptr)
            allocate (character(len=size) :: sdl_get_error)
            call c_f_str_ptr(ptr, sdl_get_error)
        end function sdl_get_error


      function mix_play_channel(channel, chunk, loops)
            implicit none
            
            integer(kind=c_int), intent(in), value :: channel
            type(c_ptr),         intent(in), value :: chunk
            integer(kind=c_int), intent(in), value :: loops
            integer(kind=c_int)                    :: mix_play_channel

            mix_play_channel = mix_play_channel_timed(channel, chunk, loops, -1)
      end function mix_play_channel

      subroutine c_f_str_ptr(c_str, f_str)
            implicit none
            !! Copies a C string, passed as a C pointer, to a Fortran string.
            type(c_ptr),      intent(in)    :: c_str
            character(len=*), intent(out)   :: f_str
            character(kind=c_char), pointer :: char_ptrs(:)
            integer                         :: i
    
            if (c_associated(c_str)) then
                call c_f_pointer(c_str, char_ptrs, [ huge(0) ])
    
                i = 1
    
                do while (char_ptrs(i) /= c_null_char .and. i <= len(f_str))
                    f_str(i:i) = char_ptrs(i)
                    i = i + 1
                end do
    
                if (i < len(f_str)) f_str(i:) = ' '
            else
                f_str = ' '
            end if
        end subroutine c_f_str_ptr

        function SDL_AllocFormat(pixel_format) 
            implicit none
            integer(kind=c_uint32_t)                    :: pixel_format
            type(c_ptr)                                 :: cptr 
            type(sdl_pixel_format),POINTER              :: SDL_AllocFormat

            cptr = SDL_AllocFormat_(pixel_format)
            CALL c_f_pointer(cptr,SDL_AllocFormat )
        end function SDL_AllocFormat


            subroutine camera_update(camera, angle)
                  real(kind=8), parameter          :: PI = acos(-1.0_8)
                  type(camera_type), intent(inout) :: camera
                  real,              intent(in)    :: angle
      
                  camera%dir   = angle * PI / 180
                  camera%eye%x = cos(camera%dir)
                  camera%eye%z = sin(camera%dir)
            end subroutine camera_update

END MODULE sdl2 