{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    claude.enable = lib.mkEnableOption "Enables claude";
  };

  config = lib.mkIf config.claude.enable {
    programs.claude-code = {
      enable = true;
      package = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.claude-code;

      settings = {
        includeCoAuthoredBy = false;
      };

      mcpServers = {
        nixos = {
          type = "stdio";
          command = "${pkgs.mcp-nixos}/bin/mcp-nixos";
        };
      };
    };

    # ~/.claude.json holds dynamic state that Claude Code updates at runtime
    # (session data, telemetry, etc.), so it can't be a read-only nix store
    # symlink. We patch it via activation script instead.
    home.activation.claudeConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
      CLAUDE_CONFIG="$HOME/.claude.json"
      if [ -f "$CLAUDE_CONFIG" ]; then
        ${pkgs.jq}/bin/jq '.installMethod = "nix" | .autoUpdates = false' "$CLAUDE_CONFIG" > "$CLAUDE_CONFIG.tmp" \
          && mv "$CLAUDE_CONFIG.tmp" "$CLAUDE_CONFIG"
      else
        echo '{"installMethod": "nix", "autoUpdates": false}' > "$CLAUDE_CONFIG"
      fi
    '';
  };
}
