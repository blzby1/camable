import core/component.{type Component}

pub type Page(message) {
  Page(
    filepath: String,
    components: List(Component(message)),
  )

  
}
