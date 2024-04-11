return {
  "nvim-neotest/neotest",
  dependencies = {
    "adrigzr/neotest-mocha",
    "nvim-neotest/neotest-jest",
  },
  opts = {
    adapters = {
      "neotest-mocha",
      "neotest-jest",
    },
  },
}
