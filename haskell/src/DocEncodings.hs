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

-- | AVL Tree Document Encodings
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
        , aspect History
          , move Description
          , pop
        , aspect Property @@ [Role Review]
          , move Comment
          , pop
        , aspect DataStructure @@ [Role Related]
          , move Definition @@ [Note Mathematics]
          , pop
        , move Definition @@ [Note Mathematics]
        , move InVivo @@ [Note Mathematics]
        , pop
      , move InVivo
      , aspect Property
        , move Definition
        , move Example @@ [Note Cartoon]
        , aspect Operation
          , move Example @@ [Note Cartoon]
          , pop
        , aspect State
          , move Observation
          , move Observation @@ [Note Cartoon]
          , pop
        , aspect Operation
          , move Example
          , move Observation
          , pop
        , aspect State
          , move Observation
          , move Conclusion
          , move Example @@ [Note Cartoon]
          , move Proposal @@ [Note Cartoon]
          , pop
        , aspect Problem
          , move Comment
          , pop
        , move InVivo
        , pop
      , aspect Operation
        , move Example @@ [Note Cartoon]
        , move Legend
        , move Description @@ [Note Cartoon]
        , aspect State
          , move Observation
          , pop
        , aspect State
          , move Observation
          , pop
        , aspect Application
          , move Description
          , pop
      , move Example @@ [Role Review]
      , move Definition @@ [Note Code]
      , move Comment @@ [Role Review]
      , move Comment @@ [Role Review, Note Code]
      , move Example @@ [Note Code]
      , move Example @@ [Note Cartoon]
      , pop
    , aspect Operation @@ [Role Related, Role Review]
      , move Description
      , pop
    , aspect Operation
      , move Description
      , aspect Advantage
        , move Comment
        , pop
      , move Description
      , aspect State
        , move Example @@ [Note Cartoon]
        , move Observation @@ [Note Cartoon]
        , aspect Solution
          , aspect Operation
            , move Example @@ [Note Cartoon]
            , move InVivo @@ [Note Cartoon]
            , pop
          , pop
        , pop
      , pop
    , pop
  , aspect Operation @@ [Role Related]
    , move Description
    , aspect Design
      , move Description
      , move Comment @@ [Note Code]
      , move Description @@ [Note Code]
      , pop
    , move Description
    , move Definition @@ [Note Code]
    , move Definition @@ [Note Code]
    , aspect Operation
      , move Example
      , aspect Application
        , move Description
        , pop
      , move Definition @@ [Note Code]
      , pop
    , pop
  , aspect Operation @@ [Role Related]
    , move Description
    , move Description @@ [Note Code]
    , move Description @@ [Note Code]
    , aspect Problem
      , move Comment
  ]

avt02 :: [Code Aspect Move Decorator]
avt02 = [
  aspect DataStructure
  , aspect Problem
    , aspect Solution
      , move Description
      , pop
    , pop
  , aspect Property
    , move Definition
    , pop
  , aspect Constituent
    , move Description
    , pop
  , move Description
  , aspect Operation
    , move InVivo
    , move Description
    , move Comment @@ [Role Aside]
    , aspect Solution
      , move Derivation @@ [Note Mathematics]
      , pop
    , aspect Property
      , move Proposal
      , aspect Problem
        , move Description
        , move Cases @@ [Note Mathematics]
        , move Description @@ [Note Mathematics]
        , pop
      , pop
    , pop
  , aspect Operation
    , move Example @@ [Note Cartoon]
    , pop
  , move Description @@ [Note Code]
  , move Example @@ [Note Cartoon]
    ]

avt03 :: [Code Aspect Move Decorator]
avt03 = [
        aspect DataStructure
        , move Outline
        , aspect DataStructure @@ [Role Review]
          , move Comment
        , aspect Constituent
          , move Definition
          , move Example @@ [Note Cartoon]
          , pop
        , aspect Property
          , move Definition
          , aspect Complexity
            , move Description
            , move Description @@ [Note Cartoon]
            , move Conclusion
            , move Definition
            , move InVivo
            , move Definition
            , pop
          , pop
        , aspect Constituent
          , move Description
          , move Comment @@ [Note Cartoon]
          , pop
        , aspect Property
          , move Derivation
          , move Derivation @@ [Role Pedagogical]
          , pop
        , aspect Operation
          , move Description
          , move Description
          , move Description @@ [Note Cartoon]
          , move Description @@ [Note Cartoon]
          , move Description
          , move Example @@ [Note Cartoon]
          , move Comment @@ [Role Caveat]
          , move Comment @@ [Role Caveat]
          , pop
        , aspect Application
          , aspect Complexity
            , move Description
            , pop
          , pop
        , aspect Class
          , move Description
          , move Definition
          , move InVivo
          , move Definition
          , move InVivo
        , aspect Design
          , aspect Complexity
            , move Description
            , move Description
        ]

avt04 :: [Code Aspect Move Decorator]
avt04 = [
        aspect DataStructure
        , aspect Problem
          , move Description
          , pop
        , aspect History
          , move Description
          , pop
        , aspect DataStructure
          , move Definition @@ [Role Related]
          , pop
        , aspect Property
          , move Definition
          , pop
        , aspect Property
          , move Description
          , move Description @@ [Note Mathematics]
          , move Observation
          , move Definition @@ [Note Mathematics]
          , move Proof
          , move Solicitation
          , move Proof
          , aspect Problem
            , move Description
            , aspect Solution
              , move Description
              , pop
            , aspect State
              , move Description
              , move Definition
              , move Observation
              , move Comment @@ [Note Cartoon]
              , move Legend
              , move Observation
              , pop
            , aspect Operation
              , move InVivo
              , move Cases
              , move Description
              , move Observation
              , move Description
              , move Legend
              , move Description
              , move Description @@ [Note Cartoon]
              , pop
            , pop
          , pop
        , aspect Operation
          , move Description
          , aspect Operation
            , move Observation
            , move Observation
            , pop
          , pop
        , aspect Operation
          , move Comment @@ [Role Aside]
          , move Observation
          , move Conclusion
          , move Description
          , move Comment @@ [Role Caveat]
          , move Observation
          , move Observation
          , move Conclusion
          , move Example
          , pop
        , aspect Operation
          , aspect State
            , move Description
            , move Observation
            , pop
          , move Description
          , move Conclusion
          , move Conclusion @@ [Note Cartoon]
          , move Example
          , move Comment @@ [Note Cartoon]
          , aspect State
            , move Description
            , move Observation
            , move Conclusion @@ [Note Cartoon]
            , move Legend
            , pop
          , move Example
          , aspect State
            , move Comment @@ [Note Cartoon]
            , move Observation
            , move Conclusion @@ [Note Cartoon]
            , move Observation
            , move Implication
            , move Description
            , move Conclusion @@ [Note Cartoon]
            , pop
          , move Example
          , move Description
          , move Observation
          , move Conclusion @@ [Note Cartoon]
        ]

avt05 :: [Code Aspect Move Decorator]
avt05 = [
  aspect DataStructure
  , aspect Disadvantage
    , move Description
    , move Example @@ [Note Cartoon]
    , move Description @@ [Note Sequence]
    , move Description @@ [Note Sequence]
    , move Implication @@ [Note Sequence]
    , aspect DataStructure
      , move Comment
      , pop
    , pop
  , move Description @@ [Note Sequence]
    , aspect History
      , move Description
      , pop
    , move Description
    , aspect Property
      , move Description
      , move Definition @@ [Note Mathematics]
      , pop
    , aspect Property
      , move Definition
      , aspect Property
        , move Definition
        , move Implication
        , pop
      , move Example @@ [Note Cartoon]
      , move Description @@ [Note Sequence]
      , move Example @@ [Note Cartoon]
      , aspect Operation
        , move Description
        , move Comment @@ [Note Sequence]
        , move Example @@ [Note Cartoon]
        , aspect State
          , move Observation
          , pop
        , move Description
        , aspect State
          , move Observation
          , pop
        , move Description
        , aspect State
          , move Observation
          , pop
        , move Description
        , aspect State
          , move Observation
          , pop
        , move Description
        , aspect State
          , move Observation
          , pop
        , move Description
        , move Example @@ [Note Cartoon]
        , move Comment @@ [Note Cartoon]
        , move Description
        , aspect State
          , move Observation @@ [Note Cartoon]
          , move Proposal @@ [Note Cartoon]
          , move Description @@ [Note Cartoon]
          , move Description @@ [Note Cartoon]
          , move Description @@ [Note Cartoon]
          , move Description @@ [Note Cartoon]
          , move Conclusion
          , pop
        , move Example @@ [Note Cartoon]
        , move Example @@ [Note Cartoon]
        , aspect State
          , move Observation
          , pop
        , aspect State
          , move Observation
          , move Proposal
          , move Description @@ [Note Cartoon]
          , move Description @@ [Note Cartoon]
          , move Description @@ [Note Cartoon]
          , move Description @@ [Note Cartoon]
          , move Description @@ [Note Cartoon]
          , move Conclusion
          , pop
        , pop
      , pop
    , pop
  , aspect Operation
    , move Description
    , move Example @@ [Note Cartoon]
    , pop
  , aspect Operation
    , move Description
    , move Description @@ [Note Cartoon, Note Sequence]
    , pop
  , aspect Operation
    , move Description @@ [Note Sequence]
  ]

-- | Dijkstra's Algorithm Document Encodings
djk01 :: [Code Aspect Move Decorator]
djk01 =
  [
    aspect Algorithm
    , aspect History
      , move Description
      , pop
    , aspect Problem
      , move Description
      , aspect Class
        , move Description
        , move Comment @@ [Role Aside]
        , pop
      , aspect Problem @@ [Role Related]
        , move Description
        , pop
      , aspect DataStructure
        , move Definition @@ [Note Mathematics]
        , pop
      , pop
    , aspect Constituent
      , move Definition
      , pop
    , move Description
    , aspect Operation
      , move Description @@ [Note Mathematics]
      , move InVivo @@ [Note Mathematics]
      , move Definition @@ [Note Code]
      , move Description
      , move Description
      , move Definition @@ [Note Code]
      , pop
    , move Definition
    , move Definition @@ [Note Mathematics, Role Aside]
    ]

djk02 :: [Code Aspect Move Decorator]
djk02 =
  [
    aspect Algorithm
    , move Description
    , aspect Motivation
      , move Description
      , pop
    , aspect Application
      , move Description
      , pop
    , aspect DataStructure
      , move InVivo
      , move Description
      , move Definition @@ [Note Code]
      , aspect Operation @@ [Role Caveat]
        , move Description
        , aspect Complexity @@ [Role Caveat]
          , move Assumption
          , move Definition @@ [Note Code]
          , move Definition @@ [Note Mathematics]
          , move InVivo @@ [Note Mathematics]
          , move Definition
          , move InVivo
          , aspect Problem @@ [Role Related]
            , move Abstraction
            , move Definition @@ [Note Mathematics]
            , move InVivo @@ [Role Caveat]
            , aspect Class
              , move Description
              , pop
            , pop
          , pop
        , pop
      , pop
    , aspect Problem @@ [Role Related]
      , move Description
      , aspect Solution
        , aspect Algorithm
          , aspect Complexity
            , move Description
            , pop
          , aspect Design @@ [Role Review]
            , move Comment @@ [Note Code]
            , move Description
            , move InVivo
            , move Description
            , aspect Operation
              , move Description
              , pop
          , move Description
          , move Comment @@ [Note Code]
          , pop
        , pop
      , pop
    , aspect Problem
      , move Abstraction
      , aspect Solution
        , move Proposal
        , aspect Operation
          , move Description
          , move Proposal @@ [Note Code]
          , move Example @@ [Note Cartoon, Role Related]
            , aspect Problem
              , move Description
              , move Example
              , aspect Solution
                , move Proposal
                , move Description
                , aspect Design
                  , move Description
                  , move InVivo
                  , pop
                , aspect Operation
                  , move Description
                  , move Conclusion
                  , pop
                , pop
              , pop
            , pop
          , pop
        , pop
      , pop
    , aspect Operation
      , move Description
      , pop
    , move Description
    , move InVivo
    , aspect Property
      , move Definition
      , move Description
      , move InVivo
      , move Description
      , move Description
      , move Description
      , move Observation
      , pop
    , aspect Complexity
      , move Description
      , aspect Operation
        , move Description @@ [Note Mathematics]
        , aspect Design @@ [Role Aside]
          , move Comment
    ]

djk03 :: [Code Aspect Move Decorator]
djk03 =
  [
  aspect Algorithm
  , aspect History
    , move Description
    , pop
  , move InVivo
  , move Definition
  , aspect Class
    , move Description
    , pop
  , move Outline @@ [Role Meta]
  , aspect Motivation
    , move InVivo
    , aspect Problem
      , aspect Class
      , move Comment
      , pop
    , aspect Motivation
    , move Comment
    , pop
  , aspect Application
    , move Example
    , move Example
    , pop
  , aspect History
    , move Description
    , pop
  , move Definition
  , move Comment @@ [Role Caveat]
  , aspect Goal
    , move Definition
    , move Description
    , move Abstraction
    , move Conclusion
    , move Assumption
    , pop
  , move Abstraction
  , move InVivo
  , move Cases
  , move Legend @@ [Note Cartoon]
  , move Description @@ [Note Cartoon]
  , move Legend @@ [Note Cartoon]
  , move InVivo
  , move Observation
  , aspect Property @@ [Role Meta]
    , move Comment
    , pop
  , aspect Constituent
    , move Definition @@ [Note Mathematics]
    , move Example
    , pop
  , aspect Constituent
    , move Definition @@ [Note Mathematics]
    , move Example
    , pop
  , aspect Implementation
    , move Description
    , move Description @@ [Note Cartoon]
    , move Example @@ [Note Cartoon]
    , move Conclusion
    , pop
  , aspect Class
    , move InVivo
    , pop
  , aspect Problem @@ [Role Related]
    , move Abstraction
    , move Definition @@ [Note Mathematics]
    , aspect Goal
      , move Description @@ [Note Mathematics]
      , pop
    , aspect Property
      , move Definition
      , move InVivo
      , move Conclusion
      , pop
    , aspect Property
      , move Definition
      , move Comment [Role Caveat]
      , move Conclusion
      , pop
    , aspect Property
      , move Definition @@ [Note Mathematics]
      , move InVivo
      , move Description @@ [Note Caveat]
      , pop
    , pop
  , move Description @@ [Role Aside, Role Pedagogical]
  , move Description
    , aspect Operation
      , move Definition @@ [Note Mathematics]
      , move Description
      , pop
    , aspect Operation
      , move Description
      , move Definition @@ [Note Mathematics]
      , move Description
      , move Comment @@ [Role Caveat]
      , move Definition @@ [Note Mathematics]
      , move Description @@ [Role Aside]
      , move Implication @@ [Role Aside]
      , pop
    , move Description
    , move InVivo
    , pop
  , aspect Goal @@ [Role Pedagogical]
    , move Example @@ [Note Cartoon]
    , aspect State
      , move Observation
      , move Example
      , move Legend
      , move Description @@ [Note Cartoon]
      , move Example @@ [Note Cartoon]
      , move Cases
      , move Example
      , move Description
      , move Example
      , move Observation
  ]

djk04 :: [Code Aspect Move Decorator]
djk04 =
  [
  aspect Algorithm
  , move Assumption
  , move Definition @@ [Note Code]
  , aspect Property
    , move Definition @@ [Note Mathematics]
    , pop
  , aspect Problem
    , move Definition @@ [Note Mathematics]
    , pop
  , aspect Operation
    , move Proposal
    , move Comment @@ [Note Cartoon]
    , move Description
    , move Legend
    , move Cases
    , move Proof
    , move Cases @@ [Note Mathematics]
    , move Description @@ [Note Mathematics]
    , move Proposal
    , move Description
    , move Cases @@ [Note Mathematics]
    , move Description @@ [Note Mathematics]
    , move Conclusion
    , move Description
    , move Proposal
    , move Description
    , move Proof
    , pop
  , aspect Complexity
    , move Description
    , aspect Implementation
      , move Comment
      , pop
    , aspect Implementation
      , move Description
  ]

djk05 :: [Code Aspect Move Decorator]
djk05 =
  [
  aspect Algorithm
  , move Description
  , aspect Property
    , move Description @@ [Note Mathematics]
    , move Proof
    , move Implication
    , move Description
    , pop
  , aspect Constituent
    , move Description
    , pop
  , aspect Algorithm @@ [Role Related]
    , aspect Operation
      , move Description
      , move Contrast
      , move Description
      , pop
    , move Definition @@ [Note Code]
    , move Description
    , aspect Design
      , move Description
      , aspect Complexity
        , move Comment @@ [Note Table]
        , move Description
        , move Comment @@ [Note Cartoon]
  ]

-- | Mergesort Algorithm Document Encodings
ms01 :: [Code Aspect Move Decorator]
ms01 =
  [
  aspect Algorithm
  , aspect Class
    , move Description
    , move InVivo
    , move Description
    , move Summary
    , aspect Motivation
      , move Description
      , pop
    , aspect Complexity
      , move InVivo
      , move Comment @@ [Role Meta]
      , pop
    , pop
  , move Description
  , move Description @@ [Note Mathematics]
  , aspect Goal
    , move Description
    , pop
  , aspect Operation
    , move Description
    , move InVivo
    , pop
  , aspect Operation
    , move Description
    , move InVivo
    , pop
  , aspect Operation
    , move Description
    , move InVivo
    , pop
  , move Description
  , move Example @@ [Note Cartoon]
  , move Description @@ [Note Cartoon]
  , move Legend @@ [Note Cartoon]
  , move Description
  , move Assumption
  , move Description
  , move Description @@ [Note Mathematics]
  , move Definition @@ [Note Code]
  , aspect Operation
    , move Description
    , move Description
    , move Comment @@ [Role Caveat]
    , move Description @@ [Note Mathematics]
    , move Comment @@ [Role Caveat]
    , move Definition @@ [Note Code]
    , move Solicitation @@ [Role Pedagogical]
    , move Solicitation
    , pop
  , aspect Implementation
    , move Description
    , move Description
    , aspect Disadvantage @@ [Role Caveat]
      , move Description
      , pop
    , pop
  , move Description
  , move InVivo
  , aspect Property
    , move Comment
    , pop
  , aspect Complexity
    , aspect Operation
      , move Description @@ [Note Mathematics]
      , pop
    , move Description
    , move InVivo
    , move Definition @@ [Note Mathematics]
  ]

ms02 :: [Code Aspect Move Decorator]
ms02 =
  [
  aspect Algorithm
  , aspect Class
    , move InVivo
    , aspect Complexity
      , move Description
      , pop
    , aspect Design
      , move Comment @@ [Role Meta]
      , pop
    , aspect Algorithm
      , aspect Complexity
        , move Comment
        , pop
      , pop
    , aspect Complexity
      , move Comment
      , pop
    , aspect Algorithm
      , aspect Complexity
      , move Comment
      , pop
    , aspect Algorithm
      , aspect Complexity
      , move Description
      , pop
    , move Description
    , move Example @@ [Note Cartoon]
    , aspect Problem @@ [Role Pedagogical]
      , move Solicitation
        , aspect Solution
          , move Description @@ [Note Sequence]
          , move Cases
          , move Description
          , move Comment @@ [Role Caveat]
          , move Description
          , move Example @@ [Note Code]
          , move Comment @@ [Role Meta, Role Pedagogical]
          , pop
        , aspect Class
          , move InVivo
          , move Example @@ [Note Cartoon]
          , move Description
          , pop
        , aspect Complexity
          , move Description @@ [Note Cartoon]
          , aspect State
            , move Observation
            , move Description
            , move Comment @@ [Role Meta, Role Pedagogical]
  ]

ms03 :: [Code Aspect Move Decorator]
ms03 = [
  aspect Algorithm
  , aspect Operation
    , move Description
    , move InVivo
    , pop
  , move Definition @@ [Note Sequence]
  , aspect Motivation
    , move Description @@ [Note Mathematics]
    , pop
  , aspect Disadvantage
    , move Description @@ [Note Mathematics]
    , pop
  , aspect Operation
    , move Description
    , move Comment @@ [Role Aside, Role Related]
    , pop
  , move Description @@ [Note Cartoon]
  , move Description
  , move InVivo
  , move Description @@ [Note Cartoon]
  , aspect Implementation
    , aspect Complexity
      , move Proposal
      , aspect Design
        , move Description
        , pop
      , move Comment @@ [Note Cartoon]
      , pop
    , pop
  , aspect Algorithm @@ [Role Related]
    , move Description
    , move Description @@ [Note Cartoon]
    , aspect Complexity
      , move Proposal
      , move Description
      , move Proposal
      , move Comment @@ [Note Cartoon]
  ]

ms04 :: [Code Aspect Move Decorator]
ms04 =
  [
  aspect Algorithm
  , move Outline
  , aspect Motivation
    , move Description
    , move Description @@ [Role Caveat]
    , move Description @@ [Role Aside]
    , pop
  , aspect Operation
    , move Description
    , move Definition @@ [Note Code]
    , move Description
      , aspect Complexity
        , aspect Constituent
          , move Description
          , move Description
          , pop
        , aspect Constituent
          , move Description
          , pop
        , move Observation
        , move Observation
        , pop
      , pop
    , move Definition @@ [Note Code]
    , move Example @@ [Note Code]
    , move Observation
    , move Definition @@ [Note Code]
    , move Example @@ [Note Code]
   , aspect Complexity
     , move Conclusion
       , aspect Operation
         , move Description
         , pop
       , pop
     , pop
   , pop
  , aspect Problem
    , move Description
    , aspect Solution
      , move Description
      , aspect Operation
        , move Description
        , pop
      , pop
    , pop
  , move Definition @@ [Note Code]
  , move Description
  , move Description @@ [Role Meta, Role Aside]
  , aspect Complexity
    , move Description
    , move Example @@ [Note Cartoon]
    , move Legend @@ [Note Cartoon]
    , move Definition @@ [Note Mathematics]
    , move Observation @@ [Note Cartoon]
    , aspect Operation
      , move Description
      , pop
    , move Conclusion
    , move Legend @@ [Note Cartoon]
    , move Observation @@ [Note Cartoon]
    , move Conclusion
    , pop
  , aspect Advantage
    , move Comment
    , pop
  , aspect Disadvantage
    , move Description
    , aspect Operation
      , aspect Advantage
        , move Description
          , aspect Application
          , move Example
          , move InVivo
  ]

ms05 :: [Code Aspect Move Decorator]
ms05 =
  [
  aspect Algorithm
  , aspect Algorithm
    , move Description @@ [Role Review]
    , aspect Complexity
      , move Description
      , move Conclusion
      , move Example
      , move Solicitation
      , move Description
      , pop
    , pop
  , move Example @@ [Note Cartoon]
  , move Comment @@ [Note PseudoCode]
  , aspect Operation
    , move Description
    , move Definition @@ [Note PseudoCode]
    , pop
  , aspect Design
    , move Observation
    , move Solicitation
    , move Comment @@ [Role Meta, Role Pedagogical]
    , move Description
    , pop
  , aspect Complexity
    , move Description
    , move Description
    , move InVivo
    , move Example @@ [Note Table]
    , move Description
    , pop
  , move Comment @@ [Role Meta, Role Pedagogical]
  , move Solicitation @@ [Role Meta, Role Pedagogical]
  ]
