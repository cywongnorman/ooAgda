module SizedPolyIO.Console where

open import Level using () renaming (zero to lzero)
open import Size

open import NativePolyIO
open import SizedPolyIO.Base

data ConsoleCommand : Set where
  putStrLn : String → ConsoleCommand
  getLine  : ConsoleCommand

ConsoleResponse : ConsoleCommand → Set
ConsoleResponse (putStrLn s) = Unit
ConsoleResponse  getLine     = String

consoleI : IOInterface lzero lzero
Command  consoleI  = ConsoleCommand
Response consoleI  = ConsoleResponse 

IOConsole : Size → Set → Set
IOConsole i = IO consoleI i

IOConsole+ : Size → Set → Set
IOConsole+ i = IO+ consoleI i

translateIOConsoleLocal : (c : ConsoleCommand) → NativeIO (ConsoleResponse c)
translateIOConsoleLocal (putStrLn s) = nativePutStrLn s
translateIOConsoleLocal getLine      = nativeGetLine

translateIOConsole : {A : Set} → IOConsole ∞ A → NativeIO A
translateIOConsole = translateIO translateIOConsoleLocal

main : NativeIO (Unit {lzero})
main = nativePutStrLn "Console"
