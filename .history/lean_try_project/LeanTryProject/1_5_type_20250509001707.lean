-- 积类型Product Type : 一组值合一起
-- 允许选择的类型称为和类型（Sum Type）
-- 可以包含自身实例的类型称为递归类型（Recursive Datatype）
-- 递归和类型称为归纳类型（Inductive Datatype）

-- Nat.succ 后继类型
def isZero (n : Nat) : Bool :=
  match n with
  | Nat.zero => true
  | Nat.succ k => false

def pred (n : Nat) : Nat :=
    match n with
    | Nat.zero => Nat.zero
    | Nat.succ k => k - 2
