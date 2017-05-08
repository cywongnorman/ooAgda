module src.heap.libraryFin where
open import Data.Nat
open import Data.Fin hiding (lift)
open import Data.Bool.Base
open import src.heap.libraryNat using (_≦ℕb_)
open import Relation.Binary.PropositionalEquality hiding (sym)

createFinn : {n : ℕ} → (notzero : T (1 ≦ℕb n)) → Fin n
createFinn {zero} ()
createFinn {suc n} notzero = zero
