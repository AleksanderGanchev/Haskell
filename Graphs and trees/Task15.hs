main :: IO()
main = do

   print $ setLevels numberBTree -- Node (0,5) (Node (1,12) (Node (2,1) (Node (3,96) Nil Nil) Nil) (Node (2,0) Nil Nil)) (Node (1,4) (Node (2,2) Nil Nil) (Node (2,5) Nil (Node (3,21) Nil Nil)))
   print $ setLevels charBTree -- Node (0,'k') (Node (1,'a') (Node (2,'h') Null Null) (Node (2,'s') Null Null)) (Node (1,'l') (Node (2,'e') Null Null) (Node (2,'l') Null Null))
   return()

data BTree a = Nil | Node a (BTree a) (BTree a)
   deriving(Show)

charBTree :: BTree Char
charBTree =  Node 'k' (Node 'a' (Node 'h' Nil Nil) (Node 's' Nil Nil)) (Node 'l' (Node 'e' Nil Nil) (Node 'l' Nil Nil))

numberBTree :: (Num a) => BTree a
numberBTree = Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil)))      

setLevels :: BTree a -> BTree (Int, a)
setLevels Nil = Nil
setLevels tree = helper tree 0
   where 
       helper :: BTree a -> Int -> BTree (Int, a)
       helper Nil _ = Nil
       helper (Node value left rigth) br = Node (br, value) (helper left (br + 1)) (helper rigth (br + 1))