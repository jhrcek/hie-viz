{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}

module HieViz
    ( main
    )
where

import Data.DepGraph (DepGraph (DepGraph, graph))
import Data.DepGraph qualified as DG
import Data.Graph.Inductive.Graph qualified as G
import Data.GraphViz.Commands qualified as GvCmd
import HieViz.Server (runServer)
import Turtle (d, printf, (%))
import Prelude hiding (FilePath)


main :: IO ()
main = do
    GvCmd.quitWithoutGraphviz "It seems that graphviz is not installed. Please install it and try again."
    edges <- DG.loadEdgesOrDie
    let depGraph = DG.buildDepGraph edges
    reportSize depGraph
    args <- parseArgs
    runServer (httpPort args) depGraph


-- TODO proper args parsing
parseArgs :: IO Args
parseArgs = do
    pure $ Args{httpPort = 3003}


newtype Args = Args {httpPort :: Int}


reportSize :: DepGraph -> IO ()
reportSize DepGraph{graph} =
    printf ("Loaded function dependency graph with " % d % " nodes and " % d % " edges.\n") (G.noNodes graph) (G.size graph)
