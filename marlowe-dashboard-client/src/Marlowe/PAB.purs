module Marlowe.PAB
  ( PlutusAppId(..)
  , contractCreationFee
  , createFee
  , applyInputsFee
  ) where

import Prologue

import Data.Argonaut
  ( class DecodeJson
  , class EncodeJson
  , decodeJson
  , encodeJson
  , (.:)
  )
import Data.BigInt.Argonaut (BigInt, fromInt)
import Data.Generic.Rep (class Generic)
import Data.Newtype (class Newtype, unwrap)
import Data.UUID.Argonaut (UUID)
import Data.UUID.Argonaut as UUID
import Servant.PureScript (class ToPathSegment)

-- Accurate to within 0.05 ADA
createFee :: BigInt
createFee = fromInt 200000

-- Accurate to within 0.1 ADA
applyInputsFee :: BigInt
applyInputsFee = fromInt 1_300_000

contractCreationFee :: BigInt
contractCreationFee = createFee

{-
A `PlutusAppId` is used to identify an instance of a Plutus "contract" in the PAB. In the PAB code it is
called `ContractInstanceId` - as above, we don't refer to "contracts" here so as to avoid confusion with
*Marlowe* contracts. This is converted to a `ContractInstanceId` that the PAB understands by the `Bridge`
module.
-}
newtype PlutusAppId = PlutusAppId UUID

derive instance Newtype PlutusAppId _

derive newtype instance Show PlutusAppId

derive instance Eq PlutusAppId

derive instance Ord PlutusAppId

derive instance Generic PlutusAppId _

instance EncodeJson PlutusAppId
  where
  encodeJson (PlutusAppId unContractInstanceId) = encodeJson
    { unContractInstanceId }

instance DecodeJson PlutusAppId where
  decodeJson json = do
    obj <- decodeJson json
    s <- obj .: "unContractInstanceId"
    pure $ PlutusAppId s

instance ToPathSegment PlutusAppId where
  toPathSegment = UUID.toString <<< unwrap
