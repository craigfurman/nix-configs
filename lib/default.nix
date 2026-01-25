lib: {
  neovim =
    let
      formatAutocmd =
        event: fileExtensions: command:
        let
          globs = fileExtensions |> map (fileExtension: "*.${fileExtension}");
          targets = lib.strings.concatStringsSep "," globs;
        in
        "autocmd ${event} ${targets} ${command}";
    in
    {
      fileOpenCommand = formatAutocmd "BufEnter";
      preSaveCommand = formatAutocmd "BufWritePre";
    };
}
