open OUnit2

open Thwack.Extensions

module StrMap = Map.Make(String)

let suite =
  "Extensions suite">::: [
    "String.to_chars">::
      (fun _ ->
        assert_equal (String.to_chars "abc") ['a'; 'b'; 'c']
      );

    "String.from_chars">::
      (fun _ ->
        assert_equal (String.from_chars ['a'; 'b'; 'c']) "abc"
      );

    "List.as_pairs">::
      (fun _ ->
        assert_equal (List.as_pairs [1; 2; 3; 4]) [(1, 2); (3, 4)]
      );

    "Map.find_else when key exists">::
      (fun _ ->
        let map = StrMap.add "key" "value" StrMap.empty in
        assert_equal (StrMap.find_else "key" "else" map) "value"
      );

    "Map.find_else on else condition">::
      (fun _ ->
        assert_equal (StrMap.find_else "key" "else" StrMap.empty) "else"
      );
  ]
