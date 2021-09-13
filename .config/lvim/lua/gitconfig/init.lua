lvim.builtin.which_key.mappings["gd"] = {
    name = "Gitdiff",
    v = {"<cmd>DiffviewOpen<cr>", "Toogle diff view"},
    m = {"<cmd>Gdiffsplit!<cr>", "Merge diff"},
    h = {"<cmd>diffget //2<cr>", "Left Merge diff"},
    l = {"<cmd>diffget //3<cr>", "Right Merge diff"}
}

lvim.builtin.which_key.mappings["gst"] = {"<cmd>Git<cr>", "Git status"}

