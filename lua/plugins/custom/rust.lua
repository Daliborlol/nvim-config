return {
  "rust-lang/rust.vim",
  ft = { "rust" },
  init = function()
    -- Enable rustfmt on save
    vim.g.rustfmt_autosave = 1

    -- (Optional) Configure the command to copy the play.rust-lang.org URL
    -- This is for the :RustPlay command.
    -- For macOS:
    -- vim.g.rust_clip_command = 'pbcopy'
    -- For Linux with xclip:
    -- vim.g.rust_clip_command = 'xclip -selection clipboard'
  end,
}
