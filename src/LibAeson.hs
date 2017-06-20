module LibAeson where

import           Control.Lens
import           Data.Aeson
import           Data.Aeson.TH
import qualified Data.Char                  as C

jsonOptions :: [Char] -> Options
jsonOptions typ = defaultOptions
    { fieldLabelModifier =
        filter (/= '_') . over (ix 0) C.toLower . drop (length typ)
    }
