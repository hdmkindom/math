-- 多态（Polymorphism）将类型作为参数的数据类型和定义
structure PPoint (α : Type) where
  x : α
  y : α
deriving Repr
