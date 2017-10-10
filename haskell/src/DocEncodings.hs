module DocEncodings where

import ExplanationTree


-- * Codes

-- | Aspects of an explanation text, determined by grounded theory analysis.
data Aspect
   = Advantage
   | Algorithm
   | Application
   | Class
   | Complexity
   | Constituent
   | DataStructure
   | Design
   | Disadvantage
   | Goal
   | History
   | Implementation
   | Motivation
   | Operation
   | Problem
   | Property
   | Solution
   | State
  deriving Show

-- | Moves of an explanation text, determined by grounded theory analysis.
data Move
   = Abstraction
   | Assumption
   | Cases
   | Comment
   | Conclusion
   | Contrast
   | Definition
   | Derivation
   | Description
   | Example
   | Implication
   | InVivo
   | Legend
   | Observation
   | Outline
   | Proof
   | Proposal
   | Solicitation
   | Summary
  deriving Show

-- | Decorators for explanation codes can describe the notation used or
--   clarify the role of some text that do not directly advance the
--   aspect of the explanation under consideration.
data Decorator
   = Note Notation
   | Role Role
  deriving Show

-- | Notations used in explanations, determined by grounded theory analysis.
data Notation
   = Cartoon
   | Code
   | Mathematics
   | PseudoCode
   | Sequence
   | Table
  deriving Show

-- | Secondary roles of text in explanations, determined by grounded theory
--   analysis.
data Role
   = Aside
   | Caveat
   | Meta
   | Pedagogical
   | Related
   | Review
  deriving Show

-- | Convenience function
run :: [Code Aspect Move Decorator] -> IO ()
run = prettyTree . toTree

djk09 :: [Code Aspect Move Decorator]
djk09 = [
  aspect Algorithm
  , aspect Property
    , move Definition @@ [Note Mathematics]
    , pop
  , aspect Problem
    , move Definition @@ [Note Mathematics]
    , pop
  , aspect Operation
    , move Proposal @@ [Note Cartoon]
    , move Description
    , move Legend
    , move Cases
    , move Proof
    , move Cases
    , move Description @@ [Note Mathematics]
    , move Proposal
    , move Description
    , move Cases
    , move Description @@ [Note Mathematics]
    , move Conclusion
    , move Description @@ [Note Cartoon]
    , move Proposal
    , move Description
    , move Proof
    , pop
  , aspect Complexity
    , move Description
    , aspect Implementation
      , pop
    , aspect Implementation
      , move Description
  ]

-- TODO: When translating this one to the new coding scheme, there were many
--       ambiguities that I didn't know how to resolve. So, check it closely.
avt01 :: [Code Aspect Move Decorator]
avt01 = [
  aspect DataStructure
  , aspect Problem
    , move Description
    , move Example
    , move Proposal
    , aspect Solution
      , move InVivo
      , aspect Property
        , move Description
        , pop
      , aspect Class @@ [Role Meta]
        , pop
      , pop
    , pop
  , aspect History
    , move Description
    , pop
  , aspect Property @@ [Role Review]
    , move Definition @@ [Note Mathematics]
    , pop
  , move Definition
  , move InVivo @@ [Note Mathematics]
  , move InVivo
  , aspect Property
    , move Definition
    , move Example @@ [Note Cartoon]
    , aspect Operation
      , move Example @@ [Note Cartoon]
      , pop
    , aspect State
      , move Description
      , move Observation @@ [Note Cartoon]
      , pop
    , aspect Operation
      , move Example
      , move Observation
      , pop
    , aspect State
      , move Observation
      , move Conclusion
      , move Example
      , move Proposal @@ [Note Cartoon]
      , pop
    , aspect Problem
      , move InVivo
      , pop
    , aspect Operation
      , move Example @@ [Note Cartoon]
      , move Legend
      , move Description @@ [Note Cartoon]
      , aspect State
        , move Observation
        , pop
      , move Example @@ [Role Review, Note Code]
      , move Definition @@ [Role Review, Note Code]
      , move Comment @@ [Role Review, Note Code, Note Cartoon]
      , move Example @@ [Note Code]
      , move Example
      , pop
    , aspect Operation
      , move Description @@ [Role Related, Role Review]
      , pop
    , aspect Operation
      , move Description
      , aspect Advantage
        , pop
      , move Description
      , aspect State
        , move Example
        , move Observation @@ [Note Cartoon]
        , aspect Operation
          , move Example
          , move InVivo @@ [Note Cartoon]
          , pop
        , pop
      , pop
    , pop
  , aspect Operation
  , move Description @@ [Role Related]
  , aspect Design
    , move Description @@ [Note Code]
    , move Comment @@ [Note Code]
    , move Description
    , pop
  , move Description @@ [Note Code]
  , move Definition @@ [Note Code]
  , move Definition
  , aspect Operation
    , move Example
    , pop
  , move Comment @@ [Note Code]
  , move Definition
  , aspect Operation @@ [Role Related]
    , move Description @@ [Note Code]
    , move Description @@ [Note Code]
    , move Description
    , pop
  , aspect DataStructure @@ [Role Related]
    , pop
  , aspect Application
    , move Description
    , aspect Problem
      , aspect Solution
        , aspect Application
        , move Description
  ]

ms03 = [
  aspect Algorithm
  , aspect Operation
    , move Description
    , move InVivo
    , pop
  , move Definition @@ [Note Sequence, Note Cartoon]
  , aspect Motivation
    , move Description @@ [Note Mathematics]
    , pop
  , aspect Disadvantage
    , move Description @@ [Note Mathematics]
    , pop
  , aspect Operation
  ]
    
