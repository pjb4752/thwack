module String = struct
  include String

let sub_from s i =
  String.sub s i @@ String.length s - i

let to_chars s =
  let rec to_chars' i chars =
    if i < 0 then chars
    else to_chars' (i - 1) (s.[i] :: chars) in
  to_chars' (String.length s - 1) []

let append_char str chr = str ^ String.make 1 chr

let from_chars chars =
  List.fold_left append_char "" chars
end

module List = struct
  include List

  let is_empty = function
    | [] -> true
    | _ -> false

  let hd_else l e =
    match l with
    | [] -> e
    | hd :: _ -> hd

  let rec as_pairs = function
    | [] -> []
    | f :: n :: tl -> (f, n) :: as_pairs tl
    | _ -> assert false

  let zip left right =
    List.fold_left2 (fun acc l r -> (l, r) :: acc) [] left right |> List.rev
end

module Map = struct
  module type S = sig
    include Map.S

    val find_else: key -> 'a -> 'a t -> 'a
  end

  module Make = functor (Ord: Map.OrderedType) -> struct
    module Map = Map.Make(Ord)
    include Map

    let find_else k v map =
      match Map.find_opt k map with
      | None -> v
      | Some v -> v
  end
end
