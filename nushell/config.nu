# --- PATH setup ---
$env.path ++= [
    "/opt/homebrew/bin",
    "/opt/homebrew/sbin",
    "/usr/local/bin",
    "/usr/local/sbin",
    "/usr/bin",
    "/bin",
    "/usr/sbin",
    "/sbin",
    "/usr/local/share/dotnet",
    "/Users/hisham/.cargo/bin",
    "/Users/hisham/.dotnet/tools/",
   "/Users/hisham/.jbang/bin"
]

# --- Editor ---
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"

# --- common configuration ---
$env.config.show_banner =  false


$env.DOTNET_CLI_UI_LANGUAGE = 'en'

$env.config.keybindings ++= [
  {
    name: skim_file_picker,
    modifier: control,
    keycode: char_z,
    mode: [emacs, vi_insert, vi_normal],
    event: {
      send: executehostcommand
      cmd: "commandline edit --insert ((fd --type f | lines | sk) | str join ' ')"
    }
  }
]

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

alias vi = nvim
alias v = nvim
alias vim = nvim
