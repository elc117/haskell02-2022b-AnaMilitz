import Text.Printf

-- String inicial do SVG
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

svgCircle :: Int -> Int -> Int -> String -> String -> Int -> String
svgCircle x y r style =
  printf "<circle cx='%d' cy='%d' r='%d' fill='%s' stroke='%s' stroke-width='%d' />\n" x y r style

svgRect:: Int -> Int -> String -> String
svgRect x y style =
  printf "<rect width='%d' height='%d' fill='%s' />\n" x y style


svgAll :: String
svgAll =
  svgBegin 500 500 ++
  (svgRect 500 500 "rgba(24,25,34,255)") ++ -- background
  (svgCircle 20 40 120 "rgba(211,28,22,255)" "rgba(235,133,49,255)" 11) ++ --sun
  (svgCircle 140 140 15 "rgb(204,167,104,255)" "rgba(251,241,231,255)" 4) ++ --mercury
  (svgCircle 170 170 20 "rgb(249,211,117,255)" "rgba(251,241,231,255)" 4) ++ --venus
  (svgCircle 210 210 25 "rgb(49,131,135,255)" "rgba(251,241,231,255)" 4) ++ --earth
  (svgCircle 240 240 12 "rgb(209,66,40,255)" "rgba(251,241,231,255)" 4) ++ --mars
  (svgCircle 280 280 40 "rgb(244,127,47,255)" "rgba(251,241,231,255)" 4) ++ --jupiter
  (svgCircle 340 340 40 "rgba(250,214,101,255)" "rgba(251,241,231,255)" 4) ++ --saturn
  (svgCircle 390 390 25 "rgb(145,227,248,255)" "rgba(251,241,231,255)" 4) ++ --uranus
  (svgCircle 430 430 25 "rgb(63,144,201,255)" "rgba(251,241,231,255)" 4) ++ --neptune

  svgEnd

main :: IO ()
main = do
  writeFile "circles.svg" svgAll