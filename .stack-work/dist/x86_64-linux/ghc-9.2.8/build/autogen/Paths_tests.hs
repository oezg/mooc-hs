{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_tests (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,1] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/oezg/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux/d8c0c0900cd3c7afad1247db915a0e271a6be8a3030a1c41ec557d9e614f1b88/9.2.8/bin"
libdir     = "/home/oezg/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux/d8c0c0900cd3c7afad1247db915a0e271a6be8a3030a1c41ec557d9e614f1b88/9.2.8/lib/x86_64-linux-ghc-9.2.8/tests-0.0.1-409rslOM85jJdNvoEvwqzu"
dynlibdir  = "/home/oezg/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux/d8c0c0900cd3c7afad1247db915a0e271a6be8a3030a1c41ec557d9e614f1b88/9.2.8/lib/x86_64-linux-ghc-9.2.8"
datadir    = "/home/oezg/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux/d8c0c0900cd3c7afad1247db915a0e271a6be8a3030a1c41ec557d9e614f1b88/9.2.8/share/x86_64-linux-ghc-9.2.8/tests-0.0.1"
libexecdir = "/home/oezg/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux/d8c0c0900cd3c7afad1247db915a0e271a6be8a3030a1c41ec557d9e614f1b88/9.2.8/libexec/x86_64-linux-ghc-9.2.8/tests-0.0.1"
sysconfdir = "/home/oezg/Desktop/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux/d8c0c0900cd3c7afad1247db915a0e271a6be8a3030a1c41ec557d9e614f1b88/9.2.8/etc"

getBinDir     = catchIO (getEnv "tests_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "tests_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "tests_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "tests_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tests_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tests_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
