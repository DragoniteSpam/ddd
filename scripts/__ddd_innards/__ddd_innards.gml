// Boolean value that indicates whether matrix operations are normative for the current platform.
// Baseline for this macro is the Windows export target and not running in a browser (i.e. DirectX).
#macro DDD_NORMATIVE  ((os_type == os_xboxone) || (os_type == os_xboxseriesxs) || (os_type == os_ps5) || ((os_type == os_windows) && (os_browser == browser_not_a_browser)))

// I doubt many people would actually use these but it's tradition to include macros for this stuff
#macro DDD_X  0
#macro DDD_Y  1
#macro DDD_Z  2
#macro DDD_W  3