structure Point where
  point ::
  x : Float
  y : Float
deriving Repr

structure RectangularPrism where
  x : Float
  y : Float
  z : Float
deriving Repr

structure Segment where
  p1 : Point
  p2 : Point
deriving Repr

def Rectangular1 (x y z : Float) : RectangularPrism := {
  x := x
  y := y
  z := z
}

def point1 (x y : Float) : Point := {
  x := x
  y := y
}

def volume (v : RectangularPrism) : Float :=
  v.x * v.y * v.z

#check volume
-- #eval volume Rectangular1
#eval volume (Rectangular1 5 6 7)

def length (l : Segment) : Float :=
  Float.sqrt ((l.p1.x - l.p2.x) ^ 2 + (l.p1.y - l.p2.y) ^ 2)

def seg (p1 p2 : Point) : Segment :=
  { p1 := p1, p2 := p2 }

#check length
#eval length (seg (point1 3 4) (point1 5 6))
