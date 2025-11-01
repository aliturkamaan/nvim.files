return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			overrides = {
				-- General TSX/JSX (tags, attributes, punctuation)
				["@tag.tsx"] = { link = "GruvBoxGreen" }, -- Built-in tags like <div>
				["@tag.attribute.tsx"] = { link = "GruvboxYellow" }, -- Attributes like className=
				["@tag.delimiter.tsx"] = { link = "GruvboxAqua" }, -- < > / in tags
				["@punctuation.bracket.tsx"] = { link = "GruvboxOrange" }, -- { } in JSX expressions {props.value}
				["@string.tsx"] = { link = "GruvboxGreen" }, -- Strings in attributes or content
				["@operator.tsx"] = { link = "GruvboxOrange" }, -- Operators in expressions

				-- Hooks (React built-ins like useState – treat as special functions)
				["@function.builtin.tsx"] = { link = "GruvboxGreenBold" }, -- Built-in hooks
				["@function.call.tsx"] = { link = "GruvboxGreen" }, -- Hook calls like useState()

				["@type.typescriptreact"] = { link = "GruvboxYellow" }, -- General types
				["@type.builtin.typescriptreact"] = { link = "GruvboxYellow" }, -- Built-ins like string, number
				["@type.definition.typescriptreact"] = { link = "GruvboxYellowBold" }, -- interface or type defs
				["@lsp.type.interface.typescriptreact"] = { link = "GruvboxYellow" }, -- LSP-detected interfaces
				["@lsp.type.type.typescriptreact"] = { link = "GruvboxYellow" }, -- LSP types
				["@lsp.type.typeParameter.typescriptreact"] = { link = "GruvboxYellow" }, -- Generics like <T>
				-- Optional: Add these if you see them in :Inspect (common fallbacks)
				["@type.typescript"] = { link = "GruvboxYellow" }, -- If TSX inherits from plain TS
				["@type.builtin.typescript"] = { link = "GruvboxYellow" },

				-- Functions (custom funcs, arrows, component defs)
				["@function.tsx"] = { link = "GruvboxGreenBold" }, -- Function definitions
				["@function.method.tsx"] = { link = "Function" }, -- Methods in classes/objects
				["@function.method.call.tsx"] = { link = "GruvboxGreen" }, -- Method calls
				["@parameter.tsx"] = { link = "GruvboxBlue" }, -- Function params (e.g., props in components)

				-- Components/Props (additional React-specific)
				["@variable.member.tsx"] = { link = "GruvboxBlue" }, -- Props access like props.name
				["@property.tsx"] = { link = "GruvboxBlue" }, -- Object properties
				["@lsp.type.property.tsx"] = { link = "GruvboxBlue" }, -- LSP-detected props

				-- Fallbacks for mixed TS/JS in TSX
				["@lsp.type.variable.typescriptreact"] = { link = "GruvboxFg1" }, -- Vars in React TS
				["@lsp.typemod.variable.declaration.typescriptreact"] = { link = "GruvboxFg1" }, -- Var declarations

				-- Legacy JSX (if not fully Treesitter)
				jsxTagName = { link = "GruvboxBlue" },
				jsxComponentName = { link = "GruvboxYellowBold" },
				jsxAttrib = { link = "GruvboxOrange" },
				jsxBraces = { link = "GruvboxOrange" },
			},
		})
	end,
}
