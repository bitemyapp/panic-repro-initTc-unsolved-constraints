module Lib where

-- import           LibAeson

import           Data.Aeson
import           Data.Aeson.TH
import qualified Data.Char                  as C
import           Data.Int
import           Data.Text                  (Text)
import           Data.Time.Calendar
import           Data.Time.Clock
import           Data.Map.Strict            (Map)
import qualified Data.Map.Strict            as Map
import           GHC.Generics
import           Database.Persist.MySQL
import           Servant

data AccountInfo = AccountInfo deriving (Eq, Show)
data App a = App a deriving (Eq, Show)
data Carrier = Carrier deriving (Eq, Show)
data FulfillmentChannel = FulfillmentChannel deriving (Eq, Show)
data OrderStatus = OrderStatus deriving (Eq, Show)

type Endpoint = OrderItemsIndex

type OrderItemsIndex =
       "orderItems"
    :> QueryParam "limit" Int
    :> QueryParam "modifiedSince" UTCTime
    :> QueryParam "status" OrderStatus
    :> QueryParam "createdAfter" UTCTime
    :> QueryParam "delivered" Text
    :> Get '[JSON] [OrderItem]

getOrderItemsIndex :: AccountInfo
                   -> Maybe Int64
                   -> Maybe UTCTime
                   -> Maybe OrderStatus
                   -> Maybe UTCTime
                   -> Text
                   -> App [OrderItem]
getOrderItemsIndex = undefined

data OrderItem = OrderItem

jsonOptions :: [Char] -> Options
jsonOptions typ = defaultOptions
    { fieldLabelModifier =
        filter (/= '_') . over (ix 0) C.toLower . drop (length typ)
    }

deriveJSON (jsonOptions "orderItem") ''OrderItem

handler :: AccountInfo -> ServerT Endpoint App
handler acctInfo = getOrderItemsByOrderId acctInfo
