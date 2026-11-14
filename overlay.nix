final: prev: {
  # https://github.com/NixOS/nixpkgs/issues/587731
  # https://gitlab.gnome.org/GNOME/mutter/-/work_items/5204
  mutter = prev.mutter.overrideAttrs (prevAttrs: {
    patches =
      let
        patch = final.fetchpatch2 {
          url = "https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/5470.patch";
          hash = "sha256-owZpXpWlK5pQ1vAfcFgq7I0xyxw3249ZjRdeH9MM5mE=";
        };
      in
      (prevAttrs.patches or [ ]) ++ [ patch ];
  });
}
