open OUnit2

open Thwack.Extensions

module StrMap = Map.Make(String)

let suite =
  "Extensions suite">::: [
    "String.sub_from from first position">::
      (fun _ ->
        assert_equal (String.sub_from "hello" 0) "hello"
      );

    "String.sub_from from non-first position">::
      (fun _ ->
        assert_equal (String.sub_from "whatisthis" 5) "sthis"
      );

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

    "List.zip">::
      (fun _ ->
        assert_equal (List.zip [1; 2; 3] [4; 5; 6]) [(1, 4); (2, 5); (3, 6)]
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
