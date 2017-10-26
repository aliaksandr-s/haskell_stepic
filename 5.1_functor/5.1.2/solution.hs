data Point3D a = Point3D a a a deriving Show

instance Functor Point3D where
  fmap f (Point3D a b c) = Point3D (f a) (f b) (f c)

data GeomPrimitive a = Point (Point3D a) | LineSegment (Point3D a) (Point3D a) deriving Show

instance Functor GeomPrimitive where
  fmap f (Point pnt3d) = Point (fmap f pnt3d)
  fmap f (LineSegment pnt3d1 pnt3d2) = LineSegment (fmap f pnt3d1) (fmap f pnt3d2)