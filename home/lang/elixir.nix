{
  flake,
  pkgs,
  ...
}:
let
  beamPackages = pkgs.beamPackages.overrideScope (
    final: prev: {
      elixir = final.elixir_1_20;
    }
  );
in
{
  home.packages = [
    beamPackages.elixir
  ];

  home.sessionVariables = {
    ERL_AFLAGS = "-kernel shell_history enabled -kernel shell_history_file_bytes 1048576"; # 1MB
  };

  programs.neovim = {
    craigf.treesitterParsers = [
      "elixir"
      "heex"
    ];

    extraConfig =
      let
        extensions = [
          "ex"
          "exs"
          "heex"
        ];
      in
      ''
        ${flake.lib.neovim.preSaveCommand extensions "lua vim.lsp.buf.format({timeout_ms=1000})"}
      '';

    initLua = ''
      vim.lsp.config('elixirls', {
        cmd = { "${"${beamPackages.elixir-ls}/scripts/language_server.sh"}" },
      })
      vim.lsp.enable('elixirls')
    '';
  };
}
