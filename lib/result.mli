type ('a, 'b) t = ('a, 'b) result

val is_ok: ('a, 'b) t -> bool

val is_error: ('a, 'b) t -> bool

val map: ('a, 'b) t -> ('a -> 'c) -> ('c, 'b) t

val return: 'a -> ('a, _) t

val (>>=): ('a, 'b) t -> ('a -> ('c, 'b) t) -> ('c, 'b) t

module Syntax: sig

  val (let+): ('a, 'b) t -> ('a -> 'c) -> ('c, 'b) t

  val (let*): ('a, 'b) t -> ('a -> ('c, 'b) t) -> ('c, 'b) t
end
