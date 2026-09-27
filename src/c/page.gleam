import c/component.{type Component}

pub type Page(message) {
  Page(
    filepath: String,
    allowed_components: List(Component(message)),
    children: List(Component(message)),
  )
}
