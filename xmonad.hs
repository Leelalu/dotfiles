-- Xmonad conf

-- Imports
import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Actions.CycleWS
import XMonad.StackSet
import Data.Monoid
import Data.Map
import System.Exit

-- Main application applying values to Xconf record
main = do xmonad $ def{
 -- Mouse settings
 focusFollowsMouse = True,
 clickJustFocuses =True,
 -- Window borders
 normalBorderColor = "#663399",
 focusedBorderColor = "#BF55EC",
 borderWidth = 3,
 -- Layouts
 layoutHook = noBorders Full ||| spacing 10 (Tall 1 (3/100) (1/2)),
 -- Workspaces
 XMonad.workspaces = ["Main", "Rand"],
 -- Apply keys
 XMonad.keys = \conf -> Data.Map.fromList $ [
  -- launch term
  ((mod4Mask, xK_t) , spawn "alacritty")
  -- dmenu
  , ((mod4Mask,xK_x) , spawn "dmenu_run -nb '#1e1e1e' -sf '#ffffff' -sb '#663399' -nf '#ffffff' -p 'run:'")
  -- i3lock
  , ((mod4Mask , xK_z) , spawn "i3lock --blur=1 --color=111111 --insidevercolor=D8BFD8 --insidewrongcolor=8B7B8B    --insidecolor=BF55EC --ringvercolor=E066FF --ringwrongcolor=816687 --ringcolor=663399 --keyhlcolor=8B3A62")
  -- close window
  , ((mod4Mask, xK_0) , kill)
  -- rotate through layouts
  , ((mod4Mask, xK_space )  , sendMessage NextLayout)
  -- Move focus to  next window/workspace
  , ((mod4Mask, xK_o) , windows XMonad.StackSet.focusDown)
  , ((mod4Mask, xK_b) , nextWS)
  -- Swap  focused window with next window/to next workspace
  , ((mod4Mask .|. shiftMask, xK_o) , windows XMonad.StackSet.swapDown)
  , ((mod4Mask .|. shiftMask, xK_b), shiftToNext >> nextWS)
  -- Expand/Shrink master area
  , ((mod4Mask, xK_m) , sendMessage Expand)
  , ((mod4Mask .|. shiftMask,xK_m) , sendMessage Shrink)
  -- Increase/Deincrement windows master area
  , ((mod4Mask    , xK_n ) , sendMessage (IncMasterN 1))
  , ((mod4Mask .|. shiftMask   , xK_n) , sendMessage (IncMasterN (-1)))
  -- Quit/Restart xmonad
  , ((mod4Mask    , xK_s) , spawn "xmonad --recompile; xmonad --restart")
  , ((mod4Mask .|. shiftMask, xK_q) , io (exitWith ExitSuccess))]}
