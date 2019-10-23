module Settings
  ( DependencyMode(..)
  , Settings(..)
  , NodeFormat(..)
  , defaultSettings
  ) where

import           Data.GraphViz.Attributes.Complete (RankDir (FromTop))
import           Data.Text                         (Text)

data Settings = Settings
   { _allowMultiEdges         :: Bool
   , _dependencyMode          :: DependencyMode
   , _includeExternalPackages :: Bool
   , _nodeFormat              :: NodeFormat
   , _rankDir                 :: RankDir
   -- TODO , _transitiveReduction :: Bool
   }


defaultSettings :: Settings
defaultSettings = Settings
   { _allowMultiEdges = True
   , _dependencyMode = Reverse
   , _includeExternalPackages = False
   , _nodeFormat = WithoutPackage
   , _rankDir = FromTop
   }


data NodeFormat
  = Full
  | FunctionName
  | FunctionNameIfInModule Text
  | WithoutPackage


data DependencyMode
  = Forward
  | Reverse
  deriving Show