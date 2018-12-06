open OUnit2

open Thwack.Extensions

let suite =
  "Extensions suite">::: [
    "String.to_chars">::
      (fun context ->
        assert_equal (String.to_chars "abc") ['a'; 'b'; 'c']
      );

    "String.from_chars">::
      (fun context ->
        assert_equal (String.from_chars ['a'; 'b'; 'c']) "abc"
      );

    "List.as_pairs">::
      (fun context ->
        assert_equal (List.as_pairs [1; 2; 3; 4]) [(1, 2); (3, 4)]
      );
  ]
