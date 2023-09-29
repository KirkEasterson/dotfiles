return {
	"jay-babu/mason-null-ls.nvim",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	event = "VeryLazy",
	cmd = {
		"NullLsInstall",
		"NullLsUninstall",
	},
	opts = {
		automatic_installation = true,
		automatic_setup = true,
		ensure_installed = {
			"autopep8",
			-- "black",
			"buf",
			"commitlint",
			"editorconfig-checker",
			"eslint_d",
			"flake8",
			"gofumpt",
			"goimports",
			"hadolint",
			"markdownlint",
			-- "ocamlformat",
			"prettier",
			"proselint",
			"protoc_gen_lint",
			"pylint",
			"stylelint",
			"stylua",
			"terraform_validate",
			"tfsec",
		},
	},
}
