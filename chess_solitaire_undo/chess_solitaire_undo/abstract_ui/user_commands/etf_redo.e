note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_REDO
inherit
	ETF_REDO_INTERFACE
create
	make
feature -- command
	redo
    	do
			-- perform some update on the model state

			if not game.get_helper.redo_available then
				game.get_error_handler.set_error_nothing_to_redo
			else
				game.redo
			end

			etf_cmd_container.on_change.notify ([Current])
    	end

end
