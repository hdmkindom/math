-- 多态（Polymorphism）将类型作为参数

-- Point 多肽形式
structure PPoint (α : Type) where
  x : α
  y : α
deriving Repr

def pp_f : PPoint Float := {
  x := 1.0
  y := 2.0
}

def pp_n : PPoint Nat := {
  x := 1
  y := 2
}
