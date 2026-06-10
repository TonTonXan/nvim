require("neotest").setup({
	adapters = {
		-- pytest for Python
		require("neotest-python")({ runner = "pytest" }),
		-- cargo test for Rust
		require("neotest-rust"),
		-- GoogleTest for C++; requires the test binary to be built before running.
		require("neotest-gtest"),
	},
})
