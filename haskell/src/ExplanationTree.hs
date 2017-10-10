module ExplanationTree where

import Data.Tree
import StackTree


-- * Explanation Trees

-- | An explanation tree is a rose tree where internal nodes represent
--   different aspects or concerns of the explanation to be addressed and
--   leaves represent pedagogical moves taken to progress the explanation.
--
--   The type parameters represent:
--     * a -- "aspect" labels for internal nodes
--     * m -- "move" labels for leaf nodes
--     * d -- "decorators", that can attach to either internal or leaf nodes
--
type ExplTree a m d = Tree (ExplNode a m d)

-- | Node labels in an explanation tree.
type ExplNode a m d = ([d], Either a m)

-- | Pretty print an explanation tree.
prettyTree :: (Show a, Show m, Show d) => ExplTree a m d -> IO ()
prettyTree = putStrLn . condense . drawTree . stringify
  where
    stringify (Node l cs) = Node (label l) (map stringify cs)
    label (ds, e) = node e ++ decorators ds
    node (Left a)  = "Aspect " ++ show a
    node (Right m) = "Move " ++ show m
    decorators [] = ""
    decorators ds = " @ " ++ show ds
    condense = unlines . filter empty . lines
    empty = not . all (\c -> c == ' ' || c == '|')


-- * Explanation codes

-- | A code is a stack command for building an explanation tree.
type Code a m d = Cmd (ExplNode a m d)

-- | Code to create a new aspect.
aspect :: a -> Code a m d
aspect a = Push ([], Left a)

-- | Code to create a new move.
move :: m -> Code a m d
move m = Push ([], Right m)

-- | Code to move up one aspect.
pop :: Code a m d
pop = Pop

-- | Add decorators to a move or aspect code.
(@@) :: Code a m d -> [d] -> Code a m d
(@@) (Push (_,n)) ds = Push (ds,n)
(@@) Pop          _  = error "Cannot decorate a pop code!"


-- * Semantics

-- | Preprocess a sequence of codes into a sequence of stack commands. Note
--   that the type of input and output are synonyms, but reflect the fact that
--   a non-preprocessed sequence of codes will not build the expected
--   explanation tree.
preprocess :: [Code a m d] -> [Cmd (ExplNode a m d)]
preprocess = concatMap cmd
  where
    cmd Pop                   = [Pop]
    cmd c@(Push (_, Left _))  = [c]
    cmd c@(Push (_, Right _)) = [c, Pop]

-- | Convert a sequence of codes to an explanation tree.
toTree :: [Code a m d] -> ExplTree a m d
toTree = cmds . preprocess


-- * Example

-- | An example tree. Run the following to test:
--
--   ghci> prettyTree (toTree c1)
--
c1 :: [Code Char String Int]
c1 = [ aspect 'R'
       , aspect 'A' @@ [1]
         , move "A1"
         , aspect 'B' @@ [2,3]
           , move "B1"
           , move "B2" @@ [4]
           , pop
         , aspect 'C' @@ [5,6,7]
           , move "C1"
           , move "C2" @@ [8]
           , move "C3"
           , pop
         , pop
       , aspect 'D'
     ]
