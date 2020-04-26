type 'a t = 'a option

val is_some: 'a t -> bool

val is_none: 'a t -> bool

val map: 'a t -> ('a -> 'b) -> 'b t

val return: 'a -> 'a t

val (>>=): 'a t -> ('a -> 'b t) -> 'b t

val get_else: 'a t -> 'a -> 'a

module Syntax: sig

  val (let+): 'a t -> ('a -> 'b) -> 'b t

  val (let*): 'a t -> ('a -> 'b t) -> 'b t
end
