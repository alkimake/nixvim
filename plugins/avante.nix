{ pkgs, ... }: {
  opts = {
    enable = false;
    settings = {
      claude = {
        endpoint = "https://api.anthropic.com";
        max_tokens = 4096;
        model = "claude-3-5-sonnet-20241022";
        temperature = 0;
      };
      vendors = {
        ollama = {
          __inherited_from = "openai";
          api_key_name = "";
          endpoint = "http://127.0.0.1:11434/v1";
          model = "codegemma";
        };
      };
      diff = {
        autojump = true;
        debug = false;
        list_opener = "copen";
      };
      highlights = {
        diff = {
          current = "DiffText";
          incoming = "DiffAdd";
        };
      };
      hints = {
        enabled = true;
      };
      mappings = {
        diff = {
          both = "cb";
          next = "]x";
          none = "c0";
          ours = "co";
          prev = "[x";
          theirs = "ct";
        };
      };
      provider = "ollama";
      windows = {
        sidebar_header = {
          align = "center";
          rounded = true;
        };
        width = 30;
        wrap = true;
      };
    };
  };
  extra.packages = [ pkgs.vimPlugins.neotest-plenary];
}
