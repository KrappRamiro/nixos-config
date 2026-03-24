{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    claude.enable = lib.mkEnableOption "Enables claude";
  };

  config = lib.mkIf config.claude.enable {
    home.packages = with pkgs; [
      claude-code
    ];

    # Configure claude.json for NixOS compatibility
    # Uses activation script since claude.json contains dynamic state that Claude Code updates
    #
    # home.activation.<name> defines a script that runs during activation
    # (either `home-manager switch` standalone, or `nixos-rebuild switch` when HM is a NixOS module)
    # lib.hm.dag.entryAfter ["writeBoundary"] ensures this script runs AFTER Home Manager
    # has finished writing all its managed files (symlinks, configs, etc.)
    # "writeBoundary" is a checkpoint in Home Manager's DAG (Directed Acyclic Graph) that
    # separates file-writing operations from post-write scripts
    home.activation.claudeConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
      CLAUDE_CONFIG="$HOME/.claude.json"
      if [ -f "$CLAUDE_CONFIG" ]; then
        # Update existing config
        ${pkgs.jq}/bin/jq '.installMethod = "nix" | .autoUpdates = false' "$CLAUDE_CONFIG" > "$CLAUDE_CONFIG.tmp" \
          && mv "$CLAUDE_CONFIG.tmp" "$CLAUDE_CONFIG"
      else
        # Create minimal config
        echo '{"installMethod": "nix", "autoUpdates": false}' > "$CLAUDE_CONFIG"
      fi
    '';
  };
}
