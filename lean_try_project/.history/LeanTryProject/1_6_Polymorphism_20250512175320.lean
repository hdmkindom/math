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

-- replaceX 用新值替换PPoint 的 x 字段
def replaceX (α : Type) (point : PPoint α) (newX : α) : PPoint α :=
  { point with x := newX }

#check replaceX
#check replaceX Nat

#check replaceX Nat pp_n 45
#eval replaceX Nat pp_n 45

-- 命名的类型参数 枚举类型
inductive Sign where
  | pos
  | neg

def posOrNegThree (s : Sign) :
  match s with
  | Sign.pos => Nat
  | Sign.neg => Int :=
    match s with
    | Sign.pos => (3 : Nat)
    | Sign.neg => (-3 : Int)

#check posOrNegThree
#eval posOrNegThree Sign.neg

-- 链表
def primesUnder10 : List Nat := [2, 3, 5, 7]

-- 构造子 nil 表示空列表，构造子 cons 用于非空列表
def explicitPrimesUnder10 : List Nat :=
  List.cons 2 (List.cons 3 (List.cons 5 (List.cons 7 List.nil)))

def length (α : Type) (xs : List α) : Nat :=
  match xs with
  | List.nil => Nat.zero
  | List.cons y ys => Nat.succ (length α ys)

#check length
#eval length Nat primesUnder10
