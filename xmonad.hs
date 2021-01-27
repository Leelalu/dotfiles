-- Xmonad conf

-- Imports
import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Grid
import XMonad.Actions.CycleWS
import XMonad.StackSet
import Data.Monoid
import Data.Map
import System.Exit

-- Main func applying values to Xconf record
main = do xmonad $ def{
 -- Mouse settings
 focusFollowsMouse = True,
 clickJustFocuses =True,
 -- Window borders
 normalBorderColor = "#663399",
 focusedBorderColor = "#BF55EC",
 borderWidth = 3,
 -- Layouts
 layoutHook = spacing 10 (smartBorders Grid) ||| noBorders Full,
 -- Workspaces
 XMonad.workspaces = ["Main", "Spare"],
 -- Manage Hooks
 manageHook = composeAll [
  className =? "android-studio" --> doFloat],
 -- Apply keys
 XMonad.keys = \conf -> Data.Map.fromList $ [
  -- Launch term
    ((mod4Mask, xK_t), spawn "alacritty")
  -- Dmenu
  , ((mod4Mask, xK_x), spawn "dmenu_run -nb '#1e1e1e' -sf '#ffffff' -sb '#663399' -nf '#ffffff' -p 'run:'")
  -- Dmenu status
  , ((mod4Mask, xK_d), spawn "~/bin/dmenustatus")
  -- Cmus pause toggle
  , ((mod4Mask, xK_p), spawn "cmus-remote -u")
  -- Close window
  , ((mod4Mask, xK_0), kill)
  -- Switch between layouts
  , ((mod4Mask, xK_space ), sendMessage NextLayout)
  -- Send floating window to tiling
  , ((mod4Mask .|. shiftMask, xK_space), withFocused $ windows . XMonad.StackSet.sink)
  -- Move focus to   next window/workspace
  , ((mod4Mask, xK_o), windows XMonad.StackSet.focusDown)
  , ((mod4Mask, xK_b), nextWS)
  -- Swap  focused window with next window/to next workspace
  , ((mod4Mask .|. shiftMask, xK_o), windows XMonad.StackSet.swapDown)
  , ((mod4Mask .|. shiftMask, xK_b), shiftToNext >> nextWS)
  -- Vecrat/Xdotool for keyboard mouse interface
  , ((mod4Mask, xK_y), spawn "vecrat 111 111")
  , ((mod4Mask, xK_i), spawn "vecrat 999 999")
  , ((mod4Mask, xK_h), spawn "vecrat -7 0")
  , ((mod4Mask, xK_j), spawn "vecrat 0 7")
  , ((mod4Mask, xK_k), spawn "vecrat 0 -7")
  , ((mod4Mask, xK_l), spawn "vecrat 7 0")
  , ((mod4Mask .|. shiftMask, xK_h), spawn "vecrat -20 0")
  , ((mod4Mask .|. shiftMask, xK_j), spawn "vecrat 0 20")
  , ((mod4Mask .|. shiftMask, xK_k), spawn "vecrat 0 -20")
  , ((mod4Mask .|. shiftMask, xK_l), spawn "vecrat 20 0")
  , ((mod4Mask .|. controlMask .|. shiftMask, xK_h), spawn "vecrat -3 0")
  , ((mod4Mask .|. controlMask .|. shiftMask, xK_j), spawn "vecrat 0 3")
  , ((mod4Mask .|. controlMask .|. shiftMask, xK_k), spawn "vecrat 0 -3")
  , ((mod4Mask .|. controlMask .|. shiftMask, xK_l), spawn "vecrat 3 0")
  , ((mod4Mask, xK_m), spawn "xdotool click 1")
  , ((mod4Mask .|. shiftMask, xK_m), spawn "xdotool click 3")
  , ((mod4Mask .|. controlMask .|. shiftMask, xK_m), spawn "xdotool click 2")
  , ((mod4Mask, xK_u), spawn "killall unclutter; unclutter -idle 1")
  , ((mod4Mask .|. shiftMask, xK_u), spawn "killall unclutter")
  -- I3Lock
  , ((mod4Mask , xK_z), spawn "i3lock --blur=1 --color=111111 --insidevercolor=D8BFD8 --insidewrongcolor=8B7B8B --insidecolor=BF55EC --ringvercolor=E066FF --ringwrongcolor=816687 --ringcolor=663399 --keyhlcolor=8B3A62")
  , ((mod4Mask  .|. shiftMask, xK_z), spawn "xset s 1; i3lock --blur=1 --color=111111 --insidevercolor=D8BFD8 --insidewrongcolor=8B7B8B --insidecolor=BF55EC --ringvercolor=E066FF --ringwrongcolor=816687 --ringcolor=663399 --keyhlcolor=8B3A62; xset s 1000")
  -- Quit/Restart xmonad
  , ((mod4Mask, xK_s) , spawn "xmonad --recompile; xmonad --restart")
  , ((mod4Mask .|. shiftMask, xK_q) , io (exitWith ExitSuccess))]}
