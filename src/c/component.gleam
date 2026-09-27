import lustre/element.{type Element}

pub type Component(message) {
  Component(name: String, style: String, children: List(Element(message)))
  LiveComponent(name: String, style: String, children: List(Element(message)))
}
