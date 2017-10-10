module StackTree where

import Data.List (foldl', reverse)
import Data.Tree


-- * Stack-Built Trees

-- | Stack commands for building a tree.
data Cmd a
   = Push a  -- ^ create a new child
   | Pop     -- ^ move up the explanation tree
 deriving (Eq,Show)

-- | Add a child to the given location in the tree.
addChild :: Tree a -> Tree a -> Tree a
addChild c (Node a cs) = Node a (c:cs)

-- | Reverse the order of children so they appear in the order they were added.
reverseTree :: Tree a -> Tree a 
reverseTree (Node a cs) = Node a (reverse (map reverseTree cs))

-- | Execute a command in the given context.
cmd :: Cmd a -> [Tree a] -> [Tree a]
cmd (Push a) ts  = Node a [] : ts
cmd Pop (c:p:ts) = addChild c p : ts
cmd Pop ts       = ts

-- | Exit a context to yield the corresponding tree.
exit :: [Tree a] -> Tree a
exit [t] = reverseTree t
exit ts  = exit (cmd Pop ts)

-- | Build a tree from a list of commands.
cmds :: [Cmd a] -> Tree a
cmds = exit . foldl' (flip cmd) []
