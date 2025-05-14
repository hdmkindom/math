-- 积类型Product Type : 一组值合一起
-- 允许选择的类型称为和类型（Sum Type）
-- 可以包含自身实例的类型称为递归类型（Recursive Datatype）
-- 递归和类型称为归纳类型（Inductive Datatype）

-- Nat.succ 后继类型
def isZero (n : Nat) : Bool :=
    -- 模式匹配
    match n with
    /- Nat 下 只有 zero 与 succ
    任何一个非0的自然数n,均为一个k : Nat的succ
    3 = Nat.succ(Nat.succ(Nat.succ Nat.zero))
    3 为 0 的三阶后继
    -/
    | Nat.zero => true
    | Nat.succ k => false

-- 返回前驱
def pred (n : Nat) : Nat :=
    match n with
    | Nat.zero => Nat.zero
    | Nat.succ k => k

#eval pred 4

structure Point3D where
    x : Float
    y : Float
    z : Float
deriving Repr

def p3 (x y z : Float) : Point3D := {
    x := x
    y := y
    z := z
}


def depth (p : Point3D) : Float :=
    match p with
    | { x := h, y := w, z := d} => d

#eval depth (p3 3 4 5)

-- 递归
-- 递归默认算完,算不完的报错
def even (n : Nat) : Bool :=
    match n with
    | Nat.zero => true
    | Nat.succ k => not (even k)

#eval even 4

-- 对比这个无限递归
/-
def evenLoops (n : Nat) : Bool :=
    match n with
    | Nat.zero => true
    | Nat.succ k => not (evenLoops n)
-/

-- 双参数递归
def plus (n : Nat) (k : Nat) : Nat :=
    match k with
    | Nat.zero => n
    | Nat.succ k' => Nat.succ (plus n k')

#eval plus 3 4

def times (n : Nat) (k : Nat) : Nat :=
    match k with
    | Nat.zero => Nat.zero
    | Nat.succ k' => plus n (times n k')

def minus (n : Nat) (k : Nat) : Nat :=
    match k with
    | Nat.zero => n
    | Nat.succ k' => pred (minus n k')

-- 加法理解为迭代的 Nat.succ，将乘法理解为迭代的加法，将减法理解为迭代的前驱，这表明除法可以实现为迭代的减法
