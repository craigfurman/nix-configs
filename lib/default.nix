lib: {
  neovim =
    let
      autoCmd =
        event: fileExtensions: command:
        let
          globs = fileExtensions |> map (fileExtension: "*.${fileExtension}");
          targets = lib.strings.concatStringsSep "," globs;
        in
        "autocmd ${event} ${targets} ${command}";
    in
    {
      inherit autoCmd;
      fileOpenCommand = autoCmd "BufEnter";
      preSaveCommand = autoCmd "BufWritePre";
    };
}
