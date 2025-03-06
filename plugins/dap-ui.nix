_: {
  extra = {
    packages = [];
    config = ''
      local dap, dapui = require("dap"),require("dapui")
      dap.listeners.after.event_initialized["dapui_config"]=function()
      	dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"]=function()
      	dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
      	dapui.close()
      end
    '';
  };
  rootOpts = {
    keymaps = [
      {
        action.__raw =
          # lua
          ''
            function()
              local render = require("dapui.config").render
              render.max_type_length = (render.max_type_length == nil) and 0 or nil
              require("dapui").update_render(render)
            end
          '';
        key = "<leader>dut";
        options = {
          desc = " toggle types";
        };
        mode = [
          "n"
        ];
      }
      {
        action.__raw =
          # lua
          ''
            function()
              require('dapui').eval(nil, { enter = true })
            end
          '';
        key = "<leader>?";
        options = {
          desc = "Evaluate value under cursor";
        };
        mode = [
          "n"
        ];
      }
      {
        action.__raw =
          # lua
          ''
            function()
              require('dapui').toggle()
            end
          '';
        key = "<leader>du";
        options = {
          desc = "Toggle UI";
        };
        mode = [
          "n"
        ];
      }
      {
        action.__raw =
          # lua
          ''
            function()
              require('dapui').eval()
            end
          '';
        key = "<leader>de";
        options = {
          desc = "Eval";
        };
        mode = [
          "n"
        ];
      }
    ];
  };
  opts = {
    enable = true;
    settings = {
      expand_lines = false;
      layouts = [
        {
          elements = [
            {
              id = "breakpoints";
              size = 0.25;
            }
            {
              id = "stacks";
              size = 0.25;
            }
            {
              id = "watches";
              size = 0.25;
            }
          ];
          position = "bottom";
          size = 15;
        }
        {
          elements = [
            {
              id = "scopes";
              size = 1;
            }
          ];
          position = "right";
          size = 30;
        }
        {
          elements = [
            {
              id = "repl";
              size = 1;
            }
          ];
          position = "top";
          size = 10;
        }
      ];
    };
  };
}
