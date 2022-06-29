-- File auto generated by servant-purescript! --
module Marlowe where

import Prelude

import Actus.Domain.ContractTerms (ContractTerms)
import Actus.Domain.Schedule (CashFlow)
import Affjax.RequestHeader (RequestHeader(..))
import Auth (AuthStatus)
import Data.Argonaut (Json, JsonDecodeError)
import Data.Argonaut.Decode.Aeson ((</$\>), (</*\>), (</\>))
import Data.Argonaut.Decode.Aeson as D
import Data.Argonaut.Encode.Aeson ((>$<), (>/\<))
import Data.Argonaut.Encode.Aeson as E
import Data.Array (catMaybes)
import Data.Either (Either(..))
import Data.Foldable (fold)
import Data.HTTP.Method (Method(..))
import Data.Maybe (Maybe(..))
import Data.RawJson (RawJson)
import Data.Tuple (Tuple)
import Gist (Gist, NewGist)
import Gists.Extra (GistId)
import Language.Haskell.Interpreter (InterpreterError, InterpreterResult)
import Marlowe.Symbolic.Types.Request (Request)
import Marlowe.Symbolic.Types.Response (Response)
import Servant.PureScript
  ( class MonadAjax
  , AjaxError
  , flagQueryPairs
  , paramListQueryPairs
  , paramQueryPairs
  , request
  , toHeader
  , toPathSegment
  )
import URI (RelativePart(..), RelativeRef(..))
import Webghc.Server (CompileRequest)

data Api = Api

getApiOracleByExchangeByPair
  :: forall m
   . MonadAjax Api m
  => String
  -> String
  -> m (Either (AjaxError JsonDecodeError Json) RawJson)
getApiOracleByExchangeByPair exchange pair =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left GET
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Nothing
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.null
  decoder = D.value
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "oracle"
    , toPathSegment exchange
    , toPathSegment pair
    ]
  query = Nothing

postApiActusGenerate
  :: forall m
   . MonadAjax Api m
  => ContractTerms Number
  -> m (Either (AjaxError JsonDecodeError Json) String)
postApiActusGenerate reqBody =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left POST
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Just reqBody
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.value
  decoder = D.value
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "actus"
    , "generate"
    ]
  query = Nothing

postApiActusCashflows
  :: forall m
   . MonadAjax Api m
  => ContractTerms Number
  -> m (Either (AjaxError JsonDecodeError Json) (Array (CashFlow Number)))
postApiActusCashflows reqBody =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left POST
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Just reqBody
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.value
  decoder = D.value
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "actus"
    , "cashflows"
    ]
  query = Nothing

postApiCompile
  :: forall m
   . MonadAjax Api m
  => CompileRequest
  -> m
       ( Either (AjaxError JsonDecodeError Json)
           (Either InterpreterError (InterpreterResult String))
       )
postApiCompile reqBody =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left POST
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Just reqBody
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.value
  decoder = (D.either D.value D.value)
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "compile"
    ]
  query = Nothing

getApiLogout
  :: forall m
   . MonadAjax Api m
  => m (Either (AjaxError JsonDecodeError Json) RawJson)
getApiLogout =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left GET
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Nothing
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.null
  decoder = D.value
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "logout"
    ]
  query = Nothing

getApiOauthStatus
  :: forall m
   . MonadAjax Api m
  => m (Either (AjaxError JsonDecodeError Json) AuthStatus)
getApiOauthStatus =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left GET
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Nothing
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.null
  decoder = D.value
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "oauth"
    , "status"
    ]
  query = Nothing

getApiOauthGithub
  :: forall m
   . MonadAjax Api m
  => m (Either (AjaxError JsonDecodeError Json) Unit)
getApiOauthGithub =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left GET
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Nothing
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.null
  decoder = D.unit
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "oauth"
    , "github"
    ]
  query = Nothing

getApiGists
  :: forall m
   . MonadAjax Api m
  => m (Either (AjaxError JsonDecodeError Json) (Array Gist))
getApiGists =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left GET
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Nothing
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.null
  decoder = D.value
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "gists"
    ]
  query = Nothing

postApiGists
  :: forall m
   . MonadAjax Api m
  => NewGist
  -> m (Either (AjaxError JsonDecodeError Json) Gist)
postApiGists reqBody =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left POST
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Just reqBody
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.value
  decoder = D.value
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "gists"
    ]
  query = Nothing

getApiGistsByGistId
  :: forall m
   . MonadAjax Api m
  => GistId
  -> m (Either (AjaxError JsonDecodeError Json) Gist)
getApiGistsByGistId gistId =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left GET
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Nothing
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.null
  decoder = D.value
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "gists"
    , toPathSegment gistId
    ]
  query = Nothing

postApiGistsByGistId
  :: forall m
   . MonadAjax Api m
  => NewGist
  -> GistId
  -> m (Either (AjaxError JsonDecodeError Json) Gist)
postApiGistsByGistId reqBody gistId =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left POST
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Just reqBody
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.value
  decoder = D.value
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "gists"
    , toPathSegment gistId
    ]
  query = Nothing

postApiMarloweanalysis
  :: forall m
   . MonadAjax Api m
  => Request
  -> m (Either (AjaxError JsonDecodeError Json) Response)
postApiMarloweanalysis reqBody =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left POST
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Just reqBody
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.value
  decoder = D.value
  relativePart = RelativePartNoAuth $ Just
    [ "api"
    , "marlowe-analysis"
    ]
  query = Nothing

postRunghc
  :: forall m
   . MonadAjax Api m
  => CompileRequest
  -> m
       ( Either (AjaxError JsonDecodeError Json)
           (Either InterpreterError (InterpreterResult String))
       )
postRunghc reqBody =
  request Api req
  where
  req = { method, uri, headers, content, encode, decode }
  method = Left POST
  uri = RelativeRef relativePart query Nothing
  headers = catMaybes
    [
    ]
  content = Just reqBody
  encode = E.encode encoder
  decode = D.decode decoder
  encoder = E.value
  decoder = (D.either D.value D.value)
  relativePart = RelativePartNoAuth $ Just
    [ "runghc"
    ]
  query = Nothing
