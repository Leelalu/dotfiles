-- Xmonad conf

-- Imports
import XMonad
import XMonad.Layout.NoBorders (noBorders, smartBorders)
import XMonad.Layout.Spacing
import XMonad.Actions.CycleWS
import Data.Monoid
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map   as M

-- Set keybinds
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 [ ((mod4Mask, xK_t) , spawn "alacritty")
 -- launch dmenu
 , ((mod4Mask,xK_x) , spawn "dmenu_run -nb '#1e1e1e' -sf '#ffffff' -sb '#663399' -nf '#ffffff' -p 'run:'")
 -- close window
 , ((mod4Mask, xK_0) , kill)
 -- rotate through layouts
 , ((mod4Mask,xK_space )  , sendMessage NextLayout)
 -- Move focus to  next window/workspace
 , ((mod4Mask,xK_o) , windows W.focusDown)
 , ((mod4Mask, xK_b) , nextWS)
 -- Swap  focused window with next window/workspace
 , ((mod4Mask .|. shiftMask, xK_o) , windows W.swapDown)
 , ((mod4Mask .|. shiftMask, xK_b), shiftToNext >> nextWS)
 -- Expand/Shrink master area
 , ((mod4Mask,xK_m) , sendMessage Expand)
 , ((mod4Mask .|. shiftMask,xK_m) , sendMessage Shrink)
 -- Increase/Deincrement windows master area
 , ((mod4Mask    , xK_n ) , sendMessage (IncMasterN 1))
 , ((mod4Mask .|. shiftMask   , xK_n) , sendMessage (IncMasterN (-1)))
 -- i3lock
 , ((mod4Mask    , xK_z) , spawn "i3lock --blur=1 --color=111111 --insidevercolor=D8BFD8 --insidewrongcolor=8B7B8B    --insidecolor=BF55EC --ringvercolor=E066FF --ringwrongcolor=816687 --ringcolor=663399 --keyhlcolor=8B3A62")
  -- Restart xmonad
 , ((mod4Mask    , xK_s) , spawn "xmonad --recompile; xmonad --restart")
 -- Quit xmonad
 , ((mod4Mask .|. shiftMask, xK_q) , io (exitWith ExitSuccess))]

main = do
 xmonad $ def
  {
   -- basic settings
   focusFollowsMouse  = True,
   clickJustFocuses   = True,
   borderWidth   = 3,
   workspaces    = ["Main", "Rand"],
   normalBorderColor  = "#663399",
   focusedBorderColor = "#BF55EC",
   -- apply keys
   keys = myKeys,
   -- set layouts
   layoutHook    = noBorders Full ||| spacing 10 (Tall 1 (3/100) (1/2)),
   -- apply hooks
   handleEventHook    = mempty,
   logHook  = return (),
   startupHook   = return ()
  }
