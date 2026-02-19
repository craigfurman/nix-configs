final: prev: {
  vimPlugins = prev.vimPlugins // {
    telescope-nvim = prev.vimPlugins.telescope-nvim.overrideAttrs (prevAttrs: {
      dependencies = (prevAttrs.dependencies or [ ]) ++ [ final.vimPlugins.plenary-nvim ];
    });
  };
}
