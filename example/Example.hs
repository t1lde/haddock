{-# LANGUAGE DataKinds #-}
-- | Type Operators
module TypeOperators (Example(..), (:=)) where

import Data.Proxy (Proxy(..))

-- | Field binding.
data a := b = a := b

-- | An Example.
data Example =
  Example
    { getExample :: Proxy '[ "hello" ':= Int
                           ,  "this" ':= Float
                           , "is" ':= Double
                           , "a" ':= [String]
                           , "really" ':= Maybe Integer
                           , "long" ':= Map Text Int
                           , "type" ':= String
                           ]
    }
