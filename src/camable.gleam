import argv
import core/page
import gleam/dict
import gleam/io
import gleam/result
import simplifile
import tom

type CLIError {
  ConfigNotFound
  InvalidConfig
}

pub fn main() {
  case argv.load().arguments {
    ["render", page_name] ->
      case load_config() {
        Ok(_) -> {
          io.print("Config successfully loaded. Rendering " <> page_name)
          render_page(page_name)
        }
        Error(_) -> io.print("Quitting due to a fatal error.")
        // TODO: Add advanced error messages - maybe more in-depth stuff for specific parsing errors
      }
    _ -> {
      let config =
        "
          [[page]]
          name
        "
      let assert Ok(parsed) = tom.parse(config)
      let assert Ok(toml) = tom.get(parsed, ["person"])
      echo toml
      Nil
    }
  }
}

fn print_help() -> Nil {
  io.println("you dont get help too bad lol")
}

fn load_config() -> Result(Nil, CLIError) {
  case simplifile.read(from: argv.load().program <> "/camable.toml") {
    Ok(config) ->
      case tom.parse(config) {
        Ok(parsed) -> Ok(build_userdata(parsed))
        Error(_) -> {
          io.print("Toml file was not able to be parsed.")
          Error(InvalidConfig)
        }
      }
    Error(_) -> {
      io.print("Could not load config file.")
      Error(ConfigNotFound)
    }
  }
}

fn build_userdata(parsed: dict.Dict(String, tom.Toml)) -> Nil {
  // TODO: Make this function not dangerous in the future (make a backup file)

  let _ = case simplifile.delete("./userdata.gleam") {
    Ok(Nil) -> Nil
    _ -> panic
    //TODO change this to an error in the future
  }
  // import each page described in the config

  // build a list of Pages
}

fn render_page(page: String) -> Nil {
  todo
}
