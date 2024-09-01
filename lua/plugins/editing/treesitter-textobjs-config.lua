-- Source: https://www.josean.com/posts/nvim-treesitter-and-textobjects
return {
	select = {
		enable = true,
		lookahead = true,
		keymaps = {
			["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
			["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
			["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
			["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

			["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
			["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

			["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
			["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

			["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
			["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

			["am"] = { query = "@call.outer", desc = "Select outer part of a function call" },
			["im"] = { query = "@call.inner", desc = "Select inner part of a function call" },

			["af"] = {
				query = "@function.outer",
				desc = "Select outer part of a method/function definition",
			},
			["if"] = {
				query = "@function.inner",
				desc = "Select inner part of a method/function definition",
			},

			["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
			["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
			["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			["a/"] = { query = "@comment.outer", desc = "Select comment" },
		},
	},
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = {
			["]m"] = { query = "@call.outer", desc = "Next function call start" },
			["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
			["]c"] = { query = "@class.outer", desc = "Next class start" },
			["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
			["]l"] = { query = "@loop.outer", desc = "Next loop start" },

			-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
			-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
			["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
			["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
		},
		goto_next_end = {
			["]M"] = { query = "@call.outer", desc = "Next function call end" },
			["]F"] = { query = "@function.outer", desc = "Next method/function def end" },
			["]C"] = { query = "@class.outer", desc = "Next class end" },
			["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
			["]L"] = { query = "@loop.outer", desc = "Next loop end" },
		},
		goto_previous_start = {
			["[m"] = { query = "@call.outer", desc = "Prev function call start" },
			["[f"] = { query = "@function.outer", desc = "Prev method/function def start" },
			["[c"] = { query = "@class.outer", desc = "Prev class start" },
			["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
			["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
		},
		goto_previous_end = {
			["[M"] = { query = "@call.outer", desc = "Prev function call end" },
			["[F"] = { query = "@function.outer", desc = "Prev method/function def end" },
			["[C"] = { query = "@class.outer", desc = "Prev class end" },
			["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
			["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
		},
	},
	swap = {
		enable = true,
		swap_next = {
			["<leader>a"] = "@parameter.inner",
		},
		swap_previous = {
			["<leader>A"] = "@parameter.inner",
		},
	},
}
