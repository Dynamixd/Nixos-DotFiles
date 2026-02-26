{
  lib,
  pkgs,
  config,
  nputs,
  ...
}: {
  config = {
    extraPlugins = with pkgs.vimPlugins; [
      lualine-nvim
    ];

    extraConfigLuaPre = ''
      vim.fn.sign_define("diagnosticsignerror", { text = " ", texthl = "diagnosticerror", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignwarn", { text = " ", texthl = "diagnosticwarn", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignhint", { text = "󰌵", texthl = "diagnostichint", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsigninfo", { text = " ", texthl = "diagnosticinfo", linehl = "", numhl = "" })
    '';

    enable = true;

    clipboard.providers.wl-copy.enable = true;
    lualoader.enable = true;

    globals = {
      loaded_ruby_provider = 0;
      loaded_perl_provider = 0;
      loaded_python_provider = 0;
    };

    opts = {
      #performance and timing

      updatetime = 100;
      lazyredraw = false;
      synmaxcol = 240;
      timeoutlen = 500;

      #ui and appearance

      number = true;
      relativenumber = true;
      cursorline = true;
      cursorcolumn = false;
      signcolumn = "yes";
      laststatus = 3;
      showmode = false;
      showmatch = true;
      matchtime = 1;
      termguicolors = true;
      winborder = "rounded";

      #			colorschemes.catppuccin.enable = true;

      splitbelow = true;
      splitright = true;

      incsearch = true;
      ignorecase = true;
      smartcase = true;
      hlsearch = true;

      swapfile = false;
      undofile = true;
      autoread = true;
      writebackup = false;
      fileencoding = "utf-8";
      modeline = true;
      modelines = 100;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      breakindent = true;
      copyindent = true;
      preserveindent = true;
      linebreak = true;
      wrap = true;

      pumheight = 10;
      infercase = true;

      cmdheight = 0;
      history = 100;
      report = 9001;

      virtualedit = "block";
      startofline = true;
      title = true;

      backup = false;

      grepprg = "rg --vimgrep";
      grepformat = "%f:%1:%c:%m";

      scrolloff = 8;
      mouse = "a";

      encoding = "utf-8";
    };
  };
}
