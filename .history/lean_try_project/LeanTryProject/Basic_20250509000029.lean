def hello := "world"

def add1 (n : Nat) :=
  n + 1

-- deriving Repr
structure Point where
  x : Float
  y : Float

structure Point_Repr where
  x : Float
  y : Float
deriving Repr

def liguangshuo : Point :=
  { x := 3.0, y := 4.0}

def liguangshuo_Repr : Point_Repr :=
  { x := 6.0, y := 8.0}

#eval liguangshuo
#eval liguangshuo_Repr

#check liguangshuo
#check liguangshuo_Repr

def add_tw0 ( x : Float) ( y : Float) : Float :=
  x + y

def distance_two ( p1 : Point) ( p2 : Point) : Float :=
  Float.sqrt ((p1.x - p2.x) ^ 2 + (p1.y - p2.y) ^ 2)

def distance_two_Repo ( p1 : Point_Repr) ( p2 : Point_Repr) : Float :=
  Float.sqrt ((p1.x - p2.x) ^ 2 + (p1.y - p2.y) ^ 2)

#check distance_two
#check distance_two_Repo

#eval distance_two liguangshuo liguangshuo
#eval distance_two_Repo liguangshuo_Repr liguangshuo_Repr

#check Point.mk 1.5 2.8

#eval add1 11111111111111111111111111111111111111111111111111
