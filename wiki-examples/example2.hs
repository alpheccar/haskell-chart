import System.Environment(getArgs)
import Data.Colour.Names
import Data.Colour
import Control.Lens
import Data.Default.Class
import Data.Time.LocalTime
import Graphics.Rendering.Chart
import Graphics.Rendering.Chart.Backend.Cairo

import Prices(prices,mkDate,filterPrices)

prices' :: [(LocalTime,Double,Double)]
prices' = filterPrices prices (mkDate 1 1 2005) (mkDate 31 12 2006)

chart = toRenderable layout 
  where

    price1 = plot_lines_style . line_color .~ opaque blue
           $ plot_lines_values .~ [[ (d,v) | (d,v,_) <- prices']]
           $ plot_lines_title .~ "price 1"
           $ def

    price2 = plot_lines_style . line_color .~ opaque green
           $ plot_lines_values .~ [[ (d,v) | (d,_,v) <- prices']]
           $ plot_lines_title .~ "price 2"
           $ def

    layout = layout1_title .~"Price History"
           $ layout1_left_axis . laxis_override .~ axisGridHide
           $ layout1_right_axis . laxis_override .~ axisGridHide
           $ layout1_bottom_axis . laxis_override .~ axisGridHide
           $ layout1_plots .~ [Left (toPlot price1),
                               Right (toPlot price2)]
           $ layout1_grid_last .~ False
           $ def

main1 ["small"]  = renderableToPNGFile chart 320 240 "example2_small.png"
main1 ["big"]    = renderableToPNGFile chart 800 600 "example2_big.png"

main = getArgs >>= main1
