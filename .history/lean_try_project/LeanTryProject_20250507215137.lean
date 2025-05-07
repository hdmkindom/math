-- This module serves as the root of the `LeanTryProject` library.
-- Import modules here that should be built as part of the library.
import LeanTryProject.Basic


#check 1 + 1 = 2

def seq_limit (u : ℕ → ℝ) (l : ℝ) : Prop :=
∀ ε > 0, ∃ N, ∀ n ≥ N, |u n - l| ≤ ε
