type ('a, 'b) t = ('a, 'b) result

let is_ok = function
  | Ok _ -> true
  | Error _ -> false

let is_error r = not (is_ok r)

let map res fn =
  match res with
  | Ok v -> Ok (fn v)
  | Error e -> Error e

let return v = Ok v

let (>>=) res fn =
  match res with
  | Ok v -> fn v
  | Error e -> Error e

module Syntax = struct

  let (let+) = map
  let (let*) = (>>=)
end
