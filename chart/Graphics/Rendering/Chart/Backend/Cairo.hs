
-- | The backend to render charts with cairo.
module Graphics.Rendering.Chart.Backend.Cairo
  ( convertLineCap, convertLineJoin
  ) where


import qualified Graphics.Rendering.Cairo as C

import qualified Graphics.Rendering.Chart.Drawing as G

-- | Convert a charts line join to a cairo line join.
convertLineJoin :: G.LineJoin -> C.LineJoin
convertLineJoin lj = case lj of
  G.LineJoinMiter -> C.LineJoinMiter
  G.LineJoinRound -> C.LineJoinRound
  G.LineJoinBevel -> C.LineJoinBevel

-- | Convert a charts line cap to a cairo line cap.
convertLineCap :: G.LineCap -> C.LineCap
convertLineCap lc = case lc of
  G.LineCapRound  -> C.LineCapRound
  G.LineCapButt   -> C.LineCapButt
  G.LineCapSquare -> C.LineCapSquare
