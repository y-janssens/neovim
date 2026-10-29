return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      for _, formatters in pairs(opts.formatters_by_ft) do
        for i = #formatters, 1, -1 do
          if formatters[i] == "oxfmt" or formatters[i] == "biome-check" then
            table.remove(formatters, i)
          end
        end
      end
    end,
  },
}
