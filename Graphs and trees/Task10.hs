main :: IO()
main = do

    print $ closestTo (ThreeD 2 5 10) [(ThreeD 4 5 6), (ThreeD 5 2 (-10)), (ThreeD (-2) 1 45), (ThreeD 12 0 2), (ThreeD 6 5 4)] -- [ThreeD 4.0 5.0 6.0]
    return()

data Point a = TwoD a a | ThreeD a a a
   deriving(Show)

closestTo :: (Floating a, Ord a) => Point a -> [Point a] -> [Point a]
closestTo point listOfPoints = filter (\x -> distance x point == minPoint) listOfPoints
   where
       minPoint = minimum $ map (distance point) listOfPoints

distance :: (Floating a) => Point a -> Point a -> a
distance (TwoD x1 y1) (TwoD x2 y2) = sqrt ((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
distance (ThreeD x1 y1 z1) (ThreeD x2 y2 z2) = sqrt ((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1))
distance _ _ = error "Points must have equal dimensions!"   