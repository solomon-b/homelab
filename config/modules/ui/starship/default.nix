{ ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      character.symbol = "➜";
      line_break.disabled = true;
    };
  };
}
