note
	description: "Summary description for {KING}."
	author: "Umar Abdulselam"
	date: "$Date$"
	revision: "$Revision$"

class
	KING

inherit
	PIECE
	  redefine
		make,
		get_moves
		  -- KING does not redefine feature
		  -- `is_blocked` since it cannot be
		  -- blocked from making any move.
	  end

create

	make

feature -- Initialization

	make
			-- Initialize a KING object: "K"
		do
			Precursor
			create type.make_from_string ("K")
		end

feature -- Queries

	get_moves(row: INTEGER; col: INTEGER): ARRAY2[STRING]
			-- Return a 2D-Array of possible moves
			-- for `KING` chess piece.
		local
			possible_moves: ARRAY2[STRING]
		do
			create possible_moves.make_filled (".", 4, 4)

			across 1 |..| 4 is i loop
			 across 1 |..| 4  is j loop
			 	if (i-row).abs <= 1 and
		 		   (j-col).abs <= 1
		 		then
		 		   possible_moves[i, j] := "+"
		 		end
			 end
			end
			possible_moves[row, col] := Current.get_type
			Result := possible_moves
		end

end
